class Doctor
    attr_accessor :name

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        appointment = Appointment.all.select {|appointment| appointment.doctor == self}
        appointment.collect {|schedule| schedule.patient}
    end

end
