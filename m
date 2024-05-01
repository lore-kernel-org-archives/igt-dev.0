Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EC4C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 17:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AE21123CE;
	Wed,  1 May 2024 17:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdOV9MFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9600B1123D7
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714585329; x=1746121329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PiOF7zDGwMIORVLxR4Yd7C5MiTHR6JWvpPVD/FFxkI0=;
 b=LdOV9MFMoh5kOSVgWBR5umuOuDCf+m93K4TTkHDlbmWDn/ecwyMxfuV4
 Ol9nWbwdvgaqrXijJLNnMCDvPo025bOl0eOAd7ibx9hShNau8fQDRMwn/
 2I5ryBdqheu+rFSVV4D4hvuaWvCYYfEEtt0SveTSCVoO893lloYpMrfKP
 EGZHLanMqMheLZrUfHbKJy3sVq3xOPVWvVFwY/ZhZF/WjIYMRiiQQO0jk
 kbrNS2S3b3ukIxIzoeT2GhxpBDPkEaEeBNp387PUFfL0XsAPJXEKIGiFP
 txYIaCZrVgAXopKPkychCu6kxqntAtSn9tJItxMx0rKIAMHGTNbbbsqqZ g==;
X-CSE-ConnectionGUID: YlO3hXB+T9WLOfUxj7rRPQ==
X-CSE-MsgGUID: ODE09iJATOqYKrj/0w1DtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21476313"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="21476313"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:42:09 -0700
X-CSE-ConnectionGUID: WmjqBSdGSNCozefDStKe5A==
X-CSE-MsgGUID: sd/E5HgdSDCAQfcmhjMRzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26890923"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.115])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:42:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] lib/igt_drm_clients: lazy stat process
Date: Wed,  1 May 2024 12:38:50 -0500
Message-ID: <20240501174001.121324-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Only try to get task data like pid and name when that is required.
Typically most of the processes in a system don't have a drm fd open.
So only open and use /proc/<pid>/stat when it's needed.

For the data below, system is running with just a single drm client:

Before:
 Performance counter stats for './build/tools/gputop -d 0.1 -n 10':

            507.19 msec task-clock                       #    0.334 CPUs utilized
                29      context-switches                 #   57.178 /sec
                 4      cpu-migrations                   #    7.887 /sec
                75      page-faults                      #  147.874 /sec
       (...)
       1.518253637 seconds time elapsed
       0.007989000 seconds user
       0.503351000 seconds sys

After:
 Performance counter stats for './build/tools/gputop -d 0.1 -n 10':

            384.01 msec task-clock                       #    0.275 CPUs utilized
                17      context-switches                 #   44.270 /sec
                 1      cpu-migrations                   #    2.604 /sec
                74      page-faults                      #  192.705 /sec
       (...)
       1.397640800 seconds time elapsed
       0.008106000 seconds user
       0.385048000 seconds sys

Looking only at the execution time of igt_drm_clients_scan() over 10
runs.
Before: 47138890 nsec
After:  33978388 nsec

So in both methods it shows a ~25% speedup. It is expected that in a
system with more clients this won't be as high.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Extracted as is from https://patchwork.freedesktop.org/series/132059/ as
not really related.

 lib/igt_drm_clients.c | 50 +++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 40d494441..ab0c2cec2 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -368,26 +368,33 @@ static size_t readat2buf(int at, const char *name, char *buf, const size_t sz)
 	}
 }
 
-static bool get_task_name(const char *buffer, char *out, unsigned long sz)
+static void get_task_data(int pid_dir, unsigned int *pid, char *task, size_t tasksz)
 {
-	char *s = index(buffer, '(');
-	char *e = rindex(buffer, ')');
-	unsigned int len;
+	char buf[4096];
+	char *s, *e;
+	size_t len;
 
+	if (!readat2buf(pid_dir, "stat", buf, sizeof(buf)))
+		return;
+
+	s = strchr(buf, '(');
+	e = strchr(s, ')');
 	if (!s || !e)
-		return false;
-	assert(e >= s);
+		return;
 
 	len = e - ++s;
-	if(!len || (len + 1) >= sz)
-		return false;
+	if (!len)
+		return;
 
-	strncpy(out, s, len);
-	out[len] = 0;
+	if (len + 1 > tasksz)
+		len = tasksz - 1;
 
-	return true;
+	strncpy(task, s, len);
+	task[len] = 0;
+	*pid = atoi(buf);
 }
 
+
 static bool is_drm_fd(int fd_dir, const char *name, unsigned int *minor)
 {
 	struct stat stat;
@@ -481,13 +488,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 		return clients;
 
 	while ((proc_dent = readdir(proc_dir)) != NULL) {
-		unsigned int client_pid, minor = 0;
+		unsigned int client_pid = 0, minor = 0;
 		int pid_dir = -1, fd_dir = -1;
 		struct dirent *fdinfo_dent;
 		char client_name[64] = { };
 		DIR *fdinfo_dir = NULL;
-		char buf[4096];
-		size_t count;
 
 		if (proc_dent->d_type != DT_DIR)
 			continue;
@@ -499,17 +504,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 		if (pid_dir < 0)
 			continue;
 
-		count = readat2buf(pid_dir, "stat", buf, sizeof(buf));
-		if (!count)
-			goto next;
-
-		client_pid = atoi(buf);
-		if (!client_pid)
-			goto next;
-
-		if (!get_task_name(buf, client_name, sizeof(client_name)))
-			goto next;
-
 		fd_dir = openat(pid_dir, "fd", O_DIRECTORY | O_RDONLY);
 		if (fd_dir < 0)
 			goto next;
@@ -542,6 +536,12 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 						 minor, info.id))
 				continue; /* Skip duplicate fds. */
 
+			if (!client_pid) {
+				get_task_data(pid_dir, &client_pid, client_name,
+					      sizeof(client_name));
+				assert(client_pid > 0);
+			}
+
 			c = igt_drm_clients_find(clients, IGT_DRM_CLIENT_PROBE,
 						 minor, info.id);
 			if (!c)
-- 
2.45.0

