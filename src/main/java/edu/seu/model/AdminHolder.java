package edu.seu.model;

import org.springframework.stereotype.Component;

@Component
public class AdminHolder {
    private static ThreadLocal<Admin> admins = new ThreadLocal<Admin>();

    public Admin getAdmin() {
        return admins.get();
    }

    public void setAdmin(Admin admin) {
        admins.set(admin);
    }

    public void clear() {
        admins.remove();
    }
}
