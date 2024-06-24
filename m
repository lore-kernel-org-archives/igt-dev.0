Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C7C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 18:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879CC10E516;
	Mon, 24 Jun 2024 18:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAOM6LkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B87B10E51C
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719252410; x=1750788410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OSz41K2YAb627TvpWJIMzk6ouQCtgRUQ8uBSa2PPNcg=;
 b=PAOM6LkVfu467AfKJtFmtPm08GE5Lk7oi7PQkoc6Med+m8fa9xAPJrtg
 XsPB8h3lnRg8qZrGHGiWwnXjyazEBkNr3zoNBXZIJi3P+B0X+/I7ET/Ry
 OrjEHNr8cjj8DW1iglp9YaAMRGH4ss6jZfnEQ/LupE8bpOa2as5df74C+
 7ZLuqMtJYOLZ1wiFMdzBPlWUqjdcyy+m+UpkMkD2YGbHeF60aFkCjYLtl
 XDZz2Gb/x7f72hJuxyFaiiBxzm7km7fn/JYmhfGnF/4uZM+DUklo+7OYI
 jMnBlPVL5dqlz3WYqSxQMjm3zm5hA7SFZPljkyy7q+CxmGrN2uzxzkAuG w==;
X-CSE-ConnectionGUID: 6LXzAAnVR6iH2EEUT7cl3w==
X-CSE-MsgGUID: ESYE9Vs8RAWzxrEgUpCLOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15930180"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="15930180"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:06:49 -0700
X-CSE-ConnectionGUID: tZsUY6CRSJmPvyCysGGZ7Q==
X-CSE-MsgGUID: 8VJS961YQ2y173x2mIqhtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="80919431"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:06:48 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kamil.konieczny@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Date: Mon, 24 Jun 2024 23:45:32 +0530
Message-Id: <20240624181533.1600552-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624181533.1600552-1-jeevan.b@intel.com>
References: <20240624181533.1600552-1-jeevan.b@intel.com>
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

Added helper functions to check sink support for early transport and
check early transport active check.

v2: Add early trasport for PR and PSR2.
v3: Fix check strings.
v4: Add description to library function and correctstring logic.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.c | 19 +++++++++++++++++++
 lib/igt_psr.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6008b73a6..dc85042b2 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -53,6 +53,19 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
 	return strstr(buf, "PSR2 selective fetch: enabled");
 }
 
+/*
+ * Checks if Early Transport is enabled in PSR status by reading the debugfs.
+ */
+bool early_transport_check(int debugfs_fd)
+{
+	char buf[PSR_STATUS_MAX_LEN];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+				sizeof(buf));
+
+	return strstr(buf, "enabled (Early Transport)");
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
 	char debugfs_file[128] = {0};
@@ -247,10 +260,16 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       strstr(buf, "Sink support: yes [0x04]") ||
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
+	case PSR_MODE_2_ET:
+		return strstr(buf, "Sink support: yes [0x04]") ||
+		       (strstr(line, "PSR = yes") &&
+			 strstr(line, "[0x04]"));
 	case PR_MODE:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
 	case PR_MODE_SEL_FETCH:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
+	case PR_MODE_SEL_FETCH_ET:
+		return strstr(line, "Panel Replay Selective Update = yes (Early Transport)");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index e8595fd8c..a7ebd0739 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -35,8 +35,10 @@ enum psr_mode {
 	PSR_MODE_1,
 	PSR_MODE_2,
 	PSR_MODE_2_SEL_FETCH,
+	PSR_MODE_2_ET,
 	PR_MODE,
 	PR_MODE_SEL_FETCH,
+	PR_MODE_SEL_FETCH_ET,
 	PSR_DISABLED,
 };
 
@@ -47,6 +49,7 @@ enum fbc_mode {
 
 bool psr_disabled_check(int debugfs_fd);
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
+bool early_transport_check(int debugfs_fd);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
-- 
2.25.1

