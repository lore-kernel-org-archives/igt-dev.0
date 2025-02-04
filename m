Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121FC02194
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8989F10E37B;
	Tue,  4 Feb 2025 18:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaQ8rUNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4696510E37B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692726; x=1770228726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6v/a0PyNY2SQhBKXpr/CQmFq+tiQhVaMQU8JfOCTkbg=;
 b=UaQ8rUNfQyzVSafCtEj0eID8S5cXAt1r+f5Zdf7BtOuYm1FQ3IdeNl0d
 BKgnf2AQHSndmOnslrgTIdpRN7NU8EnCkpwK/W+Wg2K1rL8sb2kclwiNf
 MOLKnjncOsNQyq86DtDUtGjrNZlkgzspcvGFiNV/F2TrXr0pNrerqFooX
 GpHRPo3XDqRWdWkjCUkr4YEOG5f4f017c8B2uhS0lvMPBn9odAi7Vy0qp
 bm85jV8xyO7iHJB81lA3k3aXegRtAI/ZmAwgzSEWei7b+rv2m3KcTX1m9
 Eh9JWrWQJhwsNRHObv2sppttia5EOcC6rf//LS+3D8X8UBP5NOY07dmqS g==;
X-CSE-ConnectionGUID: +70LQD6NQ4a82ZphdOjWXw==
X-CSE-MsgGUID: lnfpHqdSQHS2F4hv2kAkPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50652601"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50652601"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:06 -0800
X-CSE-ConnectionGUID: kRTuiXMKSa65C8exNglpmQ==
X-CSE-MsgGUID: BIt8HudHSEK90gElHnxQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110509553"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:12:04 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_kms: Add lib changes to check joiner is
 enabled
Date: Tue,  4 Feb 2025 23:57:32 +0530
Message-Id: <20250204182734.793645-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204182734.793645-1-jeevan.b@intel.com>
References: <20250204182734.793645-1-jeevan.b@intel.com>
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

Added a library change where we if joiner is enabled or not.

v2: Update function name and logic to check joiner
    enabled for exact pipe. (Karthik)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 90f44b4d3..d4980d2ac 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6406,6 +6406,37 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * igt_is_joiner_enabled:
+ * @drmfd: A drm file descriptor
+ * @pipe: display pipe
+ *
+ * Returns: True if joiner is enabled, false otherwise.
+ */
+bool igt_is_joiner_enabled(int drmfd, enum pipe pipe)
+{
+	char buf[16384], master_str[64], slave_str[64];
+	int dir, res;
+	int initial_number = 0b11;
+
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert(dir >= 0);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info",
+					    buf, sizeof(buf));
+	close(dir);
+	igt_assert(res >= 0);
+	initial_number <<= pipe;
+
+	snprintf(master_str, sizeof(master_str),
+		 "Linked to 0x%X pipes as a master", initial_number);
+	snprintf(slave_str, sizeof(slave_str),
+		 "Linked to 0x%X pipes as a slave", initial_number);
+
+	return (strstr(buf, master_str) && strstr(buf, slave_str));
+}
+
 /**
  * igt_ultrajoiner_possible:
  * @mode: libdrm mode
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8810123fb..7df53ec9c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1245,6 +1245,7 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+bool igt_is_joiner_enabled(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-- 
2.25.1

