Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2483AC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F4A113767;
	Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INadfY2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE606113768
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMQCiZYc9yaM/HAjzdAajyDZEahZxNMGYWGpUXCu5xY=;
 b=INadfY2hobpfAf65m0Uxf1hv/+gKgmmdeeB0fjpjurCiJcKegZXDcldt
 Qt8ueyh8ai1QzMhgT9SlTg+IRtN2VxSiqYjqSRNlzOX6wLjhu9ANd+/nJ
 kGtNh/krD+kHbU/hThcfkrWQ/8d2qmP6u6F3lcryHLj7aG3F0za54XMxd
 31G30qmD9ittAsQaIBIF5qs/G2KKEuhJQk7bmmvtEalzhINYmtYvWBxvt
 psRBpkbzIsfLMpudBnpBS2QkATvagx74Ct5WUhk3lyrbOycc5y6GKHeZv
 SjHSds+HPy1VY5oau2C/DYNXNaoEkX85Bx99HbXB8++fFOnCDO19Le5Xf w==;
X-CSE-ConnectionGUID: dpy3tz00RD+2TZRBDZXCZQ==
X-CSE-MsgGUID: s3ajSUAOSoa3xuqbxKof5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362025"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:50 -0700
X-CSE-ConnectionGUID: NpTPYd+ySZKrJJ1KdAHBEA==
X-CSE-MsgGUID: g9Ewz86cQNmzJx4F/1mqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180962"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 21/21] lib/igt_drm_clients: lazy stat process
Date: Tue, 23 Apr 2024 16:44:31 -0700
Message-ID: <20240423234431.1959354-22-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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
 lib/igt_drm_clients.c | 50 +++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 8b1959ae1..49756beee 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -398,26 +398,33 @@ static size_t readat2buf(int at, const char *name, char *buf, const size_t sz)
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
@@ -511,13 +518,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
@@ -529,17 +534,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
@@ -572,6 +566,12 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
2.43.0

