Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF53F8D74B
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 14:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4A10E8CE;
	Thu, 16 Apr 2026 14:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsjoufnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191BA10E8CF
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 14:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776348819; x=1807884819;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sxVQJUKqmrBXPexWDfLmzYARq5R8KqHqggy3e5GdDF8=;
 b=jsjoufnT7XQ/Uetil4mQwuETvDBz7/zmgHhuyUF6zAshg0JxiZiOlEZ7
 +0lleK8aQekZC/lAI8Yq8rS2vIuwQdpmZDmJDWdKT2sjDBPnj7/D/0KAZ
 b57oQ4okd0OQes8I9wjFKUKZHISYa6d839sE6ePJofF47Cg8BNguV08oV
 bSuzBWirzussg0UBGSUMF+bGfAeBL5HdcQMBtaJWlTpU9up2qfackS/s5
 rb2MHgXNwRixl3zwyKdsSAGsXkfiE9iOdMocjEN8/bvfklbpui6XJBJaL
 UL+WJXAYBuwzT9Qx02ubfy/lF85V7nWo5H8hYIfe2bzZBUPZdiYI4t5dt A==;
X-CSE-ConnectionGUID: OYU231qDTZmnlKjqB4luyQ==
X-CSE-MsgGUID: QI5imRcGT6ibeBRx/YskCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88731131"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88731131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 07:13:38 -0700
X-CSE-ConnectionGUID: 9FVSRjb3QEa7H3yQQvPJQQ==
X-CSE-MsgGUID: Y4Dh9m+1QCyk8oKDkPJgFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="226410267"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 07:13:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/kms: Introduce for_each_plane_format()
Date: Thu, 16 Apr 2026 17:13:32 +0300
Message-ID: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A few places want to iterate just the formats supported by a plane,
ignoring the modifier aspect entirely. Add a new iterator for this
(for_each_plane_format()) to avoid everyone just open coding it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fcbb6a5ade3a..a58cb5cd3430 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -816,6 +816,18 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
 	     (mode) < &(output)->config.connector->modes[(output)->config.connector->count_modes]; \
 	     (mode)++)
 
+/**
+ * for_each_plane_format:
+ * @plane: a pointer to an #igt_plane_t structure
+ * @format: format iterator
+ *
+ * This for loop iterates over all formats supported by @plane.
+ */
+#define for_each_plane_format(plane, format) \
+	for (int __i = 0; __i < (plane)->drm_plane->count_formats; __i++) \
+		for_each_if (((format) = (plane)->drm_plane->formats[__i], \
+			      1))
+
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
 /**
-- 
2.52.0

