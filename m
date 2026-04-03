Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA2ED3940A
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 01:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3111810F362;
	Fri,  3 Apr 2026 01:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYKocHNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADA610E3E8
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775180444; x=1806716444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tvs6Y4dFLbHwal44ADH7p5RrA3hn0EWLIhxAeh2fl3Q=;
 b=LYKocHNNyZrAxw8olXxNqPq2Sgq4zhPEgrKxGMPyYnO1EzNpBpKY6pfb
 VOM8wx7NpCPtYdVzcFjqCjf6fS2RkyChOypSkpjNNy8px4WsE/L0dfYO+
 P2M2qGs8dehVJC+F8Fn7SDIv8jP2hSpfrvHnRC0LzWGCk7xyaoIvjSBKe
 oKlEB3xL0AxFXTmFIKm5Bx7lv3qRupHZsmzaO0X2efsHnukpTVMRl+Tlv
 IfTdtjUFxFQ2oZ6sUOma4NzO4aa9t4kRB56LDVJmqq4RhaNPccQZhOh94
 dGRh4KJzGU7SmLqqcInMmPy47XK//Es1ilsT3+1ygayzrgddAA+7D1ZYf A==;
X-CSE-ConnectionGUID: iSYrIyuWSjqEWh2lCl4v0w==
X-CSE-MsgGUID: Q1BqbEMgRC+G6QRAhWPBEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="98861871"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="98861871"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:40:42 -0700
X-CSE-ConnectionGUID: kA7pmMA3S1uA4BL4WJuXuQ==
X-CSE-MsgGUID: d0y9ptOCSVOMr3sbxb8ZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="224291579"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2026 18:40:41 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH 2/5] lib/xe: add xe_engine_class_supports_multi_lrc()
Date: Thu,  2 Apr 2026 18:40:37 -0700
Message-ID: <20260403014040.310758-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403014040.310758-1-x.wang@intel.com>
References: <20260403014040.310758-1-x.wang@intel.com>
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

Add xe_engine_class_supports_multi_lrc() to query whether an engine
class supports multi-LRC submission.  When the kernel exposes the
information via the debugfs info node it is used directly; otherwise
fall back to a hardcoded default to keep compatibility with older KMD.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/xe/xe_query.c | 30 ++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 441e95794..e13d5e143 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -308,6 +308,36 @@ static struct xe_device *find_in_cache(int fd)
 	return xe_dev;
 }
 
+/**
+ * xe_engine_class_supports_multi_lrc:
+ * @fd: xe device fd
+ * @engine_class: engine class
+ *
+ * Returns true if multi LRC supported by engine class or false.
+ * Uses the kernel-reported bitmask from debugfs when available, otherwise
+ * falls back to the hardcoded per-class default.
+ */
+bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class)
+{
+	struct xe_device *xe_dev = find_in_cache(fd);
+
+	if (xe_dev && xe_dev->multi_lrc_mask != UINT16_MAX)
+		return !!(xe_dev->multi_lrc_mask & BIT(engine_class));
+
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_COPY:
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return false;
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return true;
+	default:
+		igt_warn("Engine class 0x%x unknown\n", engine_class);
+		return false;
+	}
+}
+
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f33562bda..5c26a3e88 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -162,6 +162,7 @@ uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
 bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
+bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
 const char *xe_engine_class_string(uint32_t engine_class);
 const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
-- 
2.43.0

