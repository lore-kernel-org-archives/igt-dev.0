Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E23606A331
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azq7YLjq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7CE10E3C6;
	Sat, 21 Nov 2026 09:45:45 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C7810E3C6
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 09:42:48 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so2779699c88.0
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 01:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795254167; x=1795858967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ga1qh7x6v72QT0wmmZad5upuT3nvlXxUf4hcQ1GIwJg=;
 b=azq7YLjqFpQ0AdN39Vet2ei473lyepxPCxKibkTwQLcHeMJlUUuZtSvPIfd2YbDBwD
 3W5kIcksU5+UVOiXjHIxH720kjphhSPe6qw48es7rUmWcbVyZaFsHAO+b/mP9rSegn3q
 PxAZyRWhRittf0HXBttNvzRNKFSLbwCpmxEDpZvbSUmG0oAnaGM2ATJdncbW1LKrzzsk
 uv4H0mYrA2QVFlfPUoGmUj8Jj0FSY2FpTS+igFRLavR86T19zDZrhKM+LRveAFwC/2li
 yx1PDDLqp21DgY5v1hRyTv7zfrf8YSxOs5ifCY7gWEfaSZQBZvBX+RB6Si8pDCQ2DZO0
 AT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795254167; x=1795858967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ga1qh7x6v72QT0wmmZad5upuT3nvlXxUf4hcQ1GIwJg=;
 b=tkxDi9J+uosu0IPooEWLAda+fZvvNjwJn6485yDmy8YdNFq/CcN9b8VM/ivJiGuY5D
 osj/KWw1g0qTpPMHNfpcOiUupsEzbn0FxDDfo2FvQCB0mEdiWAPl1r6aWtZ2HCpnwKpc
 G7kGdPjLCVo2oIcAO4AdesR5TYFM5u7GbVoVFQpk8205PTkSoNWUZgDZemSOAE/3I8VE
 mZ2VGTW49tzNia107tN64NPLw/DLmI8dNh+LLF/25sQdY0zGknV7L4/FOfzjTqkYC/ag
 uz2YNCHTxw8nY10AeI21nRputsQDxsrPoe34EZqk/vlPa8QlGzmXCzI/zgJFztckOt28
 Dm2Q==
X-Gm-Message-State: APuU4Z/zrl+mdCeOOKrIomIOf29gi8RvbRN+tM76vLHfaG+JYoLeFTQc
 RoS8mWyoLC5t+FWtffOeMG3gJwuMmZ9BAi5rB1jmx7f7Oc+FKiU/v+dFNZdiGg==
X-Gm-Gg: AZFdTZfoDb8u18zVB0lXL4IBPWILvdE3tCauEEiIraTuomE7NC06h0ymureT7cfON90
 0EZOgJYG4WX5Z8q7GnJLW4IB9oljFtym7ZQokQL9pK2h5CyYsbCtkBIPvx6ZXuq9dX3QTseEZ/W
 k8WyWYLKttJXbj6eHySNvN1QB9tulRM6FqbgL5uEi3qUbB+wwzzjjaly01dSBOPNhIYZEisSbjb
 YZ28zn8WtXQFcMNJnIKhTXYDNuxp0NFHL8ZI2PmLftb5X9a+pi0kRXDdD7PsraH68dgvoR3jh5c
 ywzZ70iF391epHrgD4Yr4mAEwL4vQHtVUgTCuTuG2qdQLWgjOpINNjCm3FbH0MIZQ3qHMu7VfS5
 nYywqjVJoXDitJZVG2/Bxz1mLbWwEedTaOnwARUIG9tB2wTEqmKiRmeYxbkLaCnF15uo7A521xj
 ZO/3O4TjquDS4qG7I6YUQ2FhuHFr9ORjqdT+saPGq9t4ITgYQ9hOlLLa2Zbmc2Q8U5/1I/T3/pw
 KpFusTkTt+QfrijqqZDVTwTHKB16Du7rKKzu7PvO5WA5Qdn+GEgU/vvn9f5x2BAlmBIj8IXycfp
 D9nP5IERcBPERafpdT7hGlDrOjTaaBWO4rR32E8nnUEwrA==
X-Received: by 2002:a05:701a:cc95:20b0:144:fa57:c617 with SMTP id
 a92af1059eb24-1b5568f1200mr5154339c88.34.1795254167376; 
 Sat, 21 Nov 2026 01:42:47 -0800 (PST)
Received: from gye-SER8.tail6a86d6.ts.net ([121.125.115.175])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55684c85fsm19092456c88.14.2026.11.21.01.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 01:42:47 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 1/3] lib/igt_drm_clients: Track clients by dev_t instead
 of DRM minor
Date: Sat, 21 Nov 2026 18:41:55 +0900
Message-ID: <20261121094225.628262-2-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121094225.628262-1-gye976@gmail.com>
References: <20261121094225.628262-1-gye976@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

So far only DRM nodes (major 226) have been scanned, so the minor alone
was enough to identify a client. Adding accel nodes (major 261) would
make minors collide, so extend the identifier from the minor to the
full dev_t.

gputop's get_sysfs_drm_path() guessed between card and renderD from the
minor range to build sysfs paths. With the dev_t, the node can be found
directly through /sys/dev/char/<major>:<minor>, so remove it.

No functional change: only DRM nodes are scanned and the header still
shows the minor.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 lib/igt_drm_clients.c | 25 ++++++++-------
 lib/igt_drm_clients.h |  3 +-
 tools/gputop.c        | 75 ++++++++++++++++++++-----------------------
 3 files changed, 49 insertions(+), 54 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 858cd3645..0b515c5aa 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -47,7 +47,7 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
 static struct igt_drm_client *
 igt_drm_clients_find(struct igt_drm_clients *clients,
 		     enum igt_drm_client_status status,
-		     unsigned int drm_minor, unsigned long id)
+		     dev_t rdev, unsigned long id)
 {
 	unsigned int start, num;
 	struct igt_drm_client *c;
@@ -60,7 +60,7 @@ igt_drm_clients_find(struct igt_drm_clients *clients,
 			continue;
 
 		if (status == IGT_DRM_CLIENT_FREE ||
-		    (drm_minor == c->drm_minor && c->id == id))
+		    (rdev == c->rdev && c->id == id))
 			return c;
 	}
 
@@ -160,13 +160,13 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
 static void
 igt_drm_client_add(struct igt_drm_clients *clients,
 		   const struct drm_client_fdinfo *info,
-		   unsigned int pid, char *name, unsigned int drm_minor)
+		   unsigned int pid, char *name, dev_t rdev)
 {
 	struct igt_drm_client *c;
 	unsigned int i;
 
 	assert(!igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
-				     drm_minor, info->id));
+				     rdev, info->id));
 
 	c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_FREE, 0, 0);
 	if (!c) {
@@ -187,7 +187,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	}
 
 	c->id = info->id;
-	c->drm_minor = drm_minor;
+	c->rdev = rdev;
 	c->clients = clients;
 
 	/* Engines */
@@ -422,7 +422,7 @@ static void get_task_data(int pid_dir, unsigned int *pid, char *task, size_t tas
 }
 
 
-static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
+static bool is_drm_fd(int fd_dir, const char *name, dev_t *rdev)
 {
 	struct stat stat;
 	int ret;
@@ -432,7 +432,7 @@ static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
 	if (ret == 0 &&
 	    (stat.st_mode & S_IFMT) == S_IFCHR &&
 	    major(stat.st_rdev) == 226) {
-		*minor = minor(stat.st_rdev);
+		*rdev = stat.st_rdev;
 		return true;
 	}
 
@@ -515,7 +515,8 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 		return clients;
 
 	while ((proc_dent = readdir(proc_dir)) != NULL) {
-		unsigned int client_pid = 0, minor = 0;
+		unsigned int client_pid = 0;
+		dev_t rdev = 0;
 		int pid_dir = -1, fd_dir = -1;
 		struct dirent *fdinfo_dent;
 		char client_name[64] = { };
@@ -547,7 +548,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			if (!isdigit(fdinfo_dent->d_name[0]))
 				continue;
 
-			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name, &minor))
+			if (!is_drm_fd(fd_dir, fdinfo_dent->d_name, &rdev))
 				continue;
 
 			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
@@ -560,7 +561,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 				continue;
 
 			if (igt_drm_clients_find(clients, IGT_DRM_CLIENT_ALIVE,
-						 minor, info.id))
+						 rdev, info.id))
 				continue; /* Skip duplicate fds. */
 
 			if (!client_pid) {
@@ -570,10 +571,10 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			}
 
 			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
-						 minor, info.id);
+						 rdev, info.id);
 			if (!c)
 				igt_drm_client_add(clients, &info, client_pid,
-						   client_name, minor);
+						   client_name, rdev);
 			else
 				igt_drm_client_update(c, client_pid,
 						      client_name, &info);
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 946d709de..288f58b89 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -7,6 +7,7 @@
 #define IGT_DRM_CLIENTS_H
 
 #include <stdint.h>
+#include <sys/types.h>
 
 #include "lib/igt_drm_fdinfo.h"
 
@@ -63,7 +64,7 @@ struct igt_drm_client {
 	struct igt_drm_client_regions *regions; /* Memory regions present in this client, to map with memory usage. */
 	struct igt_drm_client_engines *engines; /* Engines used by this client, to map with busynees data. */
 	unsigned long id; /* DRM client id from fdinfo. */
-	unsigned int drm_minor; /* DRM minor of this client. */
+	dev_t rdev; /* Device number of the DRM node this client fd refers to. */
 	unsigned int pid; /* PID which has this DRM fd open. */
 	char pid_str[10]; /* Cached PID representation. */
 	char name[24]; /* Process name of the owning PID. */
diff --git a/tools/gputop.c b/tools/gputop.c
index 0ed5af456..e89a1e53e 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -83,14 +83,8 @@ static void print_percentage_bar(double percent, int max_len)
 	putchar('|');
 }
 
-/* Get the correct sysfs prefix based on DRM minor number */
-static const char *get_sysfs_drm_path(unsigned int drm_minor)
-{
-	return drm_minor >= 128 ? "/sys/class/drm/renderD" : "/sys/class/drm/card";
-}
-
 /* Detect if driver is bound to the device */
-static bool is_bound(unsigned int drm_minor, const char *driver_name)
+static bool is_bound(dev_t rdev, const char *driver_name)
 {
 	char path[256];
 	char link[256];
@@ -98,8 +92,8 @@ static bool is_bound(unsigned int drm_minor, const char *driver_name)
 	ssize_t len;
 
 	/* Read the driver symlink */
-	snprintf(path, sizeof(path), "%s%u/device/driver",
-		 get_sysfs_drm_path(drm_minor), drm_minor);
+	snprintf(path, sizeof(path), "/sys/dev/char/%u:%u/device/driver",
+		 major(rdev), minor(rdev));
 	len = readlink(path, link, sizeof(link) - 1);
 	if (len == -1)
 		return false;
@@ -117,24 +111,24 @@ static bool is_bound(unsigned int drm_minor, const char *driver_name)
 }
 
 /* Detect if this is an Intel device (i915 or Xe) */
-static bool is_intel_device(unsigned int drm_minor)
+static bool is_intel_device(dev_t rdev)
 {
-	return is_bound(drm_minor, "i915") || is_bound(drm_minor, "xe");
+	return is_bound(rdev, "i915") || is_bound(rdev, "xe");
 }
 
 /* Detect Intel driver variant */
-static enum intel_driver_type detect_intel_driver(unsigned int drm_minor)
+static enum intel_driver_type detect_intel_driver(dev_t rdev)
 {
-	if (is_bound(drm_minor, "xe"))
+	if (is_bound(rdev, "xe"))
 		return INTEL_DRIVER_XE;
-	else if (is_bound(drm_minor, "i915"))
+	else if (is_bound(rdev, "i915"))
 		return INTEL_DRIVER_I915;
 
 	return INTEL_DRIVER_UNKNOWN;
 }
 
 /* Count the number of GTs by checking which gt* directories exist */
-static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_type)
+static int get_num_gts(dev_t rdev, enum intel_driver_type driver_type)
 {
 	char path[256];
 	struct stat st;
@@ -144,11 +138,11 @@ static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_typ
 	for (int i = 0; i < 8; i++) {
 		if (driver_type == INTEL_DRIVER_XE)
 			/* For Xe, all GTs are under tile0 */
-			snprintf(path, sizeof(path), "%s%u/device/tile0/gt%d",
-				 get_sysfs_drm_path(drm_minor), drm_minor, i);
+			snprintf(path, sizeof(path), "/sys/dev/char/%u:%u/device/tile0/gt%d",
+				 major(rdev), minor(rdev), i);
 		else /* i915 */
-			snprintf(path, sizeof(path), "%s%u/gt/gt%d",
-				 get_sysfs_drm_path(drm_minor), drm_minor, i);
+			snprintf(path, sizeof(path), "/sys/dev/char/%u:%u/gt/gt%d",
+				 major(rdev), minor(rdev), i);
 
 		if (stat(path, &st) == 0 && S_ISDIR(st.st_mode))
 			gt_count++;
@@ -179,7 +173,7 @@ static bool read_freq_value(const char *path, unsigned int *freq)
 }
 
 /* Intel-specific frequency reading for i915/Xe drivers */
-static char *get_intel_frequencies(unsigned int drm_minor)
+static char *get_intel_frequencies(dev_t rdev)
 {
 	char freq_str[512] = "";
 	char gt_info[64];
@@ -189,12 +183,12 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 	bool first = true;
 
 	/* Detect Intel driver variant */
-	driver_type = detect_intel_driver(drm_minor);
+	driver_type = detect_intel_driver(rdev);
 	if (driver_type == INTEL_DRIVER_UNKNOWN)
 		return NULL;
 
 	/* Get GT count from sysfs */
-	num_gts = get_num_gts(drm_minor, driver_type);
+	num_gts = get_num_gts(rdev, driver_type);
 	if (num_gts == 0)
 		return NULL;
 
@@ -207,24 +201,24 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 		/* Read requested frequency */
 		if (driver_type == INTEL_DRIVER_XE)
 			snprintf(freq_path, sizeof(freq_path),
-				 "%s%u/device/tile0/gt%d/freq0/cur_freq",
-				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+				 "/sys/dev/char/%u:%u/device/tile0/gt%d/freq0/cur_freq",
+				 major(rdev), minor(rdev), gt);
 		else /* i915 */
 			snprintf(freq_path, sizeof(freq_path),
-				 "%s%u/gt/gt%d/rps_cur_freq_mhz",
-				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+				 "/sys/dev/char/%u:%u/gt/gt%d/rps_cur_freq_mhz",
+				 major(rdev), minor(rdev), gt);
 
 		has_cur = read_freq_value(freq_path, &cur_freq);
 
 		/* Read actual frequency */
 		if (driver_type == INTEL_DRIVER_XE)
 			snprintf(freq_path, sizeof(freq_path),
-				 "%s%u/device/tile0/gt%d/freq0/act_freq",
-				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+				 "/sys/dev/char/%u:%u/device/tile0/gt%d/freq0/act_freq",
+				 major(rdev), minor(rdev), gt);
 		else /* i915 */
 			snprintf(freq_path, sizeof(freq_path),
-				 "%s%u/gt/gt%d/rps_act_freq_mhz",
-				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
+				 "/sys/dev/char/%u:%u/gt/gt%d/rps_act_freq_mhz",
+				 major(rdev), minor(rdev), gt);
 
 		has_act = read_freq_value(freq_path, &act_freq);
 
@@ -249,11 +243,11 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 }
 
 /* Generic wrapper for frequency reading - dispatches to vendor-specific implementations */
-static char *get_frequencies(unsigned int drm_minor)
+static char *get_frequencies(dev_t rdev)
 {
 	/* Check for Intel devices (i915/Xe) */
-	if (is_intel_device(drm_minor))
-		return get_intel_frequencies(drm_minor);
+	if (is_intel_device(rdev))
+		return get_intel_frequencies(rdev);
 
 	return NULL;
 }
@@ -271,13 +265,14 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 	printf(ANSI_HEADER);
 
 	/* Get frequency information */
-	freq_info = get_frequencies(c->drm_minor);
+	freq_info = get_frequencies(c->rdev);
 
 	if (freq_info) {
-		ret = printf("DRM minor %u   Frequency(MHz) %s", c->drm_minor, freq_info);
+		ret = printf("DRM minor %u   Frequency(MHz) %s",
+			     minor(c->rdev), freq_info);
 		free(freq_info);
 	} else {
-		ret = printf("DRM minor %u", c->drm_minor);
+		ret = printf("DRM minor %u", minor(c->rdev));
 	}
 
 	n_spaces(con_w - ret);
@@ -346,7 +341,7 @@ engines_identical(const struct igt_drm_client *c,
 static bool
 newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
 {
-	return !pc || c->drm_minor != pc->drm_minor ||
+	return !pc || c->rdev != pc->rdev ||
 	       /*
 		* Below is a a hack for drivers like amdgpu which omit listing
 		* unused engines. Simply treat them as separate minors which
@@ -479,11 +474,9 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
 	long val_a, val_b;
 
 	/* DRM cards into consecutive buckets first. */
-	val_a = a->drm_minor;
-	val_b = b->drm_minor;
-	if (val_a > val_b)
+	if (a->rdev > b->rdev)
 		return 1;
-	else if (val_b > val_a)
+	else if (b->rdev > a->rdev)
 		return -1;
 
 	/*
-- 
2.43.0

