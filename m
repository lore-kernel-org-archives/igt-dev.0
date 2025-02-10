Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A18FC0219E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A9110E5E5;
	Mon, 10 Feb 2025 18:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4KZdTpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9156710E5E5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739211638; x=1770747638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VZAnX2uohatohPdV9i2HklwQ2ZrAzFqLem1PeQ9lkv0=;
 b=R4KZdTpVTInQ37/6Lo0uqrMYIVntJsvI0/MkPw4fMoRyqmHJc+2TQCBD
 PdXq1MtuSUr+1AdTYnnsLtHcjKwKqnQ+mZ6Euq+EeMQ7ybliXRpt3AjvV
 syqaUN9acyXu7vLuSIX8G5bJm3PGzKnX3SBf3ZEnFV8CZO1q0ajaQuT4D
 /mnDqV/ELz26p6Vnyxw+Ovy7eV0GrJhwbRN3Dqg+T3YLYVMn2wjxjuAF1
 eRH2ZMleDC6RmEE+kYckpuHQZOdBStXLXeByOVI9bySowim85CUorUajN
 DR9xFHJFjYucp44ilB+VFB7Sn2upRMqAJigYFzAxXyjr+XE70G8poPJ6C Q==;
X-CSE-ConnectionGUID: Xiz3f1jGTrGoGTdoKuv1CA==
X-CSE-MsgGUID: isY99myLRoeY7+7nzjoanQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51236280"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51236280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:20:38 -0800
X-CSE-ConnectionGUID: zUg6Uht5QSmbgzcEQjFjfQ==
X-CSE-MsgGUID: 6XtOQgtIRPK6cvO/jBrDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117288651"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:20:37 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_kms: Add lib changes to check if joiner is
 enabled for a pipe
Date: Tue, 11 Feb 2025 00:06:09 +0530
Message-Id: <20250210183611.1326980-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210183611.1326980-1-jeevan.b@intel.com>
References: <20250210183611.1326980-1-jeevan.b@intel.com>
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

Added a library change to check if joiner is enabled or not for the
given pipe.

v2: Update function name and logic to check joiner enabled for
    exact pipe.
v3: Update commit message and rename function name and variable
    name.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 90f44b4d3..99d939fc5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6406,6 +6406,37 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * igt_is_joiner_enabled_for_pipe:
+ * @drmfd: A drm file descriptor
+ * @pipe: display pipe
+ *
+ * Returns: True if joiner is enabled, false otherwise.
+ */
+bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
+{
+	char buf[16384], master_str[64], slave_str[64];
+	int dir, res;
+	int pipe_mask = 0b11;
+
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert(dir >= 0);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info",
+					    buf, sizeof(buf));
+	close(dir);
+	igt_assert(res >= 0);
+	pipe_mask <<= pipe;
+
+	snprintf(master_str, sizeof(master_str),
+		 "Linked to 0x%X pipes as a master", pipe_mask);
+	snprintf(slave_str, sizeof(slave_str),
+		 "Linked to 0x%X pipes as a slave", pipe_mask);
+
+	return (strstr(buf, master_str) && strstr(buf, slave_str));
+}
+
 /**
  * igt_ultrajoiner_possible:
  * @mode: libdrm mode
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8810123fb..1cfacf87d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1245,6 +1245,7 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-- 
2.25.1

