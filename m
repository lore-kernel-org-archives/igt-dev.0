Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44353CD1296
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38FE1120EB;
	Tue,  2 Apr 2024 22:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CU3o8rUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537B31120E9
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1IFGTBRzdJrPmHhJekWBcVAKLItYfNTZo8J65cU0VY=;
 b=CU3o8rUPxkKZ92KCWfbKHAxjzi2rrjUX0TgtoFLp/D1VZq7aRbXTAFZp
 54FAH696/Xn64s75sYCscWxQ88MEUhccGYBKrI5UDU2Pn+ADTDFVf1JUd
 db2yv9gZreTqMm4XQ8QlUGSxqm+YHI52OOhRJNNnSUIpIwK3vomNekQsw
 hBO2/OmYMLTRoSBOlrQpotyOXVZ1sfd17NpiUkLj+0qmupSVTUmAqSF5I
 mC2eF7Z4rQIPeTgvdAaInRMVvcJpovPNZ8LvqY5KKVXut57/+1Uos7n8a
 9ts7RQIlIXI3WMVgCGU3H2YAk3jdXZ7sGhEBFzX/t2JRXpIQY8bEf6HTj g==;
X-CSE-ConnectionGUID: sHKH7P9OTl6UcLfeMH0meg==
X-CSE-MsgGUID: WXj07D7iQKS1WvWY5AudUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424334"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:58 -0700
X-CSE-ConnectionGUID: ENRt+bzYTuGc8iR46U+k2A==
X-CSE-MsgGUID: QDvyAFihRueJH3aeyw2gmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035616"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 8/8] lib/igt_drm_clients: lazy stat process
Date: Tue,  2 Apr 2024 15:17:16 -0700
Message-ID: <20240402221716.1840148-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402221716.1840148-1-lucas.demarchi@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 50 +++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index c174c96ab..1e9781c68 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -367,26 +367,33 @@ static size_t readat2buf(int at, const char *name, char *buf, const size_t sz)
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
@@ -480,13 +487,11 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
@@ -498,17 +503,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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
@@ -541,6 +535,12 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
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

