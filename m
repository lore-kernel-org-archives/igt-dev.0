Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD0CD3941D
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEC710EDEC;
	Thu,  2 Apr 2026 13:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfYs3kVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB16210E40B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775135260; x=1806671260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sl4bsrP1kPAZORc7wp2dqQJsjzqIlyqzQeLrET1cS3I=;
 b=dfYs3kVIo5u5GigpE0mXCFkc3yLpqY2ZuZNT24rqV4sKrEVLedVyBXPp
 YMfEs+sQ2NNFk8Nv6FvDYrZn/xRbcMHmYEdgrPCRBM9Rkp1wXYXZOm1gP
 yR9tCFj24HAvTyPqql/Yb8CZU/3kF7QHO5kSWdOopBRtfCXy2Afi5RW9E
 +/f/eGjVS08vko9VDNd46C2pBJpPCEg+3aTK7XcDmumvkligG6tSYbxsy
 AP8EsfqwZcD6Yj7uPT7NJxNER3WC6cz4XtLDKpV6Cg+LyK6n3uoceQ4/y
 KpMkK4eq6wrrarjn/+nrrXS4iOpiI9egcgywrTdEDDF/NuZEzwX+C56xz A==;
X-CSE-ConnectionGUID: Fq5ujn0YQdG+VpS30FevLQ==
X-CSE-MsgGUID: 7+l0v645TNWGQrAmkn2BjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93584983"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93584983"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:39 -0700
X-CSE-ConnectionGUID: A4A/yf3KSUeoOPjrHcuGHw==
X-CSE-MsgGUID: p9xWHXhITZqVQQXejEXjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222119724"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:37 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 1/3] lib/igt_drm_clients: Add helper to list and count
 the DRM client processes
Date: Thu,  2 Apr 2026 18:30:24 +0530
Message-Id: <20260402130026.2687520-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402130026.2687520-1-soham.purkait@intel.com>
References: <20260402130026.2687520-1-soham.purkait@intel.com>
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

Add a helper that scans all DRM clients for a card fd, optionally
populating a list of client processes as an array of
struct igt_drm_client_proc, and always returns the count of client
processes excluding the caller process.

This allows callers (like tests) to find other DRM clients which are
using the card.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_drm_clients.c | 93 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_clients.h | 10 +++++
 2 files changed, 103 insertions(+)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 858cd3645..2baea1b17 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -608,3 +608,96 @@ next:
 
 	return clients;
 }
+
+/**
+ * igt_drm_get_client_procs:
+ * @card_fd: DRM device fd to query
+ * @self_pid: Self PID to be excluded from the results
+ * @procs: Array of struct igt_drm_client_proc holding the list of client
+ *         processes, to be populated by the function
+ *
+ * Scan all processes for DRM clients using @card_fd and return the count
+ * of client processes, excluding @self_pid.
+ * If @procs is NULL, the function only returns the number of client
+ * processes.
+ * If @procs is not NULL, it points to a newly allocated array of %struct
+ * igt_drm_client_proc.
+ * On allocation failure, the function triggers an assert.
+ */
+int igt_drm_get_client_procs(int card_fd,
+			     pid_t self_pid,
+			     struct igt_drm_client_proc **procs)
+{
+	struct igt_drm_clients *clients;
+	struct igt_drm_client *c;
+	struct stat st;
+	pid_t *seen_pids = NULL;
+	unsigned int drm_minor;
+	unsigned int seen = 0;
+	int i, count = 0;
+
+	assert(fstat(card_fd, &st) == 0 &&
+	       S_ISCHR(st.st_mode) &&
+	       major(st.st_rdev) == 226);
+
+	drm_minor = minor(st.st_rdev);
+
+	clients = igt_drm_clients_init(NULL);
+	assert(clients);
+
+	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+	if (clients->num_clients) {
+		seen_pids = calloc(clients->num_clients, sizeof(*seen_pids));
+		assert(seen_pids);
+	}
+
+	if (procs)
+		*procs = NULL;
+
+	igt_for_each_drm_client(clients, c, i) {
+		unsigned int j;
+		bool duplicate = false;
+
+		if (c->status != IGT_DRM_CLIENT_ALIVE)
+			continue;
+
+		if (c->drm_minor != drm_minor)
+			continue;
+
+		for (j = 0; j < seen; j++) {
+			if (seen_pids[j] == (pid_t)c->pid) {
+				duplicate = true;
+				break;
+			}
+		}
+
+		if (duplicate)
+			continue;
+
+		if (seen_pids)
+			seen_pids[seen++] = c->pid;
+
+		if ((pid_t)c->pid == self_pid)
+			continue;
+
+		if (procs) {
+			struct igt_drm_client_proc *tmp;
+
+			tmp = realloc(*procs, (count + 1) * sizeof(struct igt_drm_client_proc));
+			assert(tmp);
+
+			tmp[count].pid = c->pid;
+			tmp[count].id = c->id;
+			strncpy(tmp[count].print_name, c->print_name,
+				sizeof(tmp[count].print_name) - 1);
+			tmp[count].print_name[sizeof(tmp[count].print_name) - 1] = '\0';
+			*procs = tmp;
+		}
+		count++;
+	}
+
+	free(seen_pids);
+	igt_drm_clients_free(clients);
+	return count;
+}
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 946d709de..4d47c06f9 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -54,6 +54,12 @@ struct igt_drm_client_regions {
 	char **names; /* Array of region names, either auto-detected or from the passed in region map. */
 };
 
+struct igt_drm_client_proc {
+	unsigned int pid;
+	unsigned long id;
+	char print_name[64];
+};
+
 struct igt_drm_clients;
 
 struct igt_drm_client {
@@ -119,4 +125,8 @@ struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
 		     int (*cmp)(const void *, const void *, void *));
 
+int igt_drm_get_client_procs(int card_fd,
+			     pid_t self_pid,
+			     struct igt_drm_client_proc **procs);
+
 #endif /* IGT_DRM_CLIENTS_H */
-- 
2.34.1

