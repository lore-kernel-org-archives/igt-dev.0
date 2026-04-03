Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C6D730AF
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 07:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B158D10E3D6;
	Fri,  3 Apr 2026 07:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIdHCjB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5A10E089
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775200406; x=1806736406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tvs6Y4dFLbHwal44ADH7p5RrA3hn0EWLIhxAeh2fl3Q=;
 b=jIdHCjB5ArVJqve8cVbA09hb/MaMtTPPQ6/WE4gtwbnEpHx6wL+eAk/L
 KW1cRSlGgm6IGqsq8D66DYp4hEdyV1Ua8j9os6SDOEILcuqyaJluuy8RR
 O+5iKIO9YY0SnTbxDgN0SAINaaAu8IEbtetmf8bkMEIRp9nL/S7jO6vjU
 iCezT//rXjc0ZAt8yL2j7dO2OYOiUuWng6xaDbKX32svOm4GwFAAyS0Sc
 n5xTFvfERlETn/xA6QeTa1gf4CguQafBHauKOQY5QgEIM1Gk66c3ZL5B/
 Urj+MHeCr0q1rfmLezuJLlRWKVDDl+GnnoQj3k1WfSpJqcZ0FUsKuv/BJ w==;
X-CSE-ConnectionGUID: VSwxjxB2T4qDQajqPIfKyA==
X-CSE-MsgGUID: EU+NNlwcQgWIqsc8683Y5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76151710"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76151710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 00:13:25 -0700
X-CSE-ConnectionGUID: 07x0qT5iRNaaXgpkL/EPFg==
X-CSE-MsgGUID: j+DowRWpQxa+R/50mrRXVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="228819965"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 00:13:25 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 2/4] lib/xe: add xe_engine_class_supports_multi_lrc()
Date: Fri,  3 Apr 2026 00:13:20 -0700
Message-ID: <20260403071322.366766-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403071322.366766-1-x.wang@intel.com>
References: <20260403071322.366766-1-x.wang@intel.com>
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

