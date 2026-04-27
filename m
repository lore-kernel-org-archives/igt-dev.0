Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE1FF885E
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 10:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5B510E69E;
	Mon, 27 Apr 2026 10:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYYpBfeZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAE010E69D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777286796; x=1808822796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qAfdBDAQU1FImz13zYhFPmPgBccbdmw3iL/RgFt0Er4=;
 b=KYYpBfeZVd7hCjXM/TtkFDIgfM9axzHbVcbL1JthZlQ04/Y053Py9p8e
 oGIKO6WSPph7SvFGqqIuxe/E/h2AzHYhEjuuVjiueK01VVkRPrmRTyXwa
 JlovRFNYrSmeDYnoIBnqeikAdD9fyj2h8N2f649tuGww9tWfayQ1RjAUy
 ED8NmYEQSYF7LbVAwCbnYn5/H9JSO1dqzIsmcmic43M4OOTZnhqxVyxe5
 6sZmTbznx6afTli6Pmjg0VeXRL+kYJG0Ewo9MD7wz9kIUx/O7IYehgCsA
 UCED7DyAC+X3/Ct21DZP6rudUX9yLtWAYZh0yvW9iYXDTno2LtRLeKZ6+ A==;
X-CSE-ConnectionGUID: aImoUWBfQ6ytKPqkPTFDOg==
X-CSE-MsgGUID: j+v6VL8ETXWiMvIxpqTD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78154915"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78154915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:46:36 -0700
X-CSE-ConnectionGUID: G4+bEyKAThOP8YOVyW9SsQ==
X-CSE-MsgGUID: yS6iDmuUSpKBBZHLocNSbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="227073034"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 03:46:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Add Colorspace connector property
 support
Date: Mon, 27 Apr 2026 16:25:13 +0530
Message-Id: <20260427105514.2239876-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260427105514.2239876-1-swati2.sharma@intel.com>
References: <20260427105514.2239876-1-swati2.sharma@intel.com>
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

Add IGT_CONNECTOR_COLORSPACE enum and its property name mapping, so
that tests can get/set the Colorspace connector property via the
standard IGT property helpers.

Also reset Colorspace to "Default" in igt_output_reset(), preventing
state leaks between subtests when a test changes the colorspace.  The
reset is placed after HDR_OUTPUT_METADATA, consistent with the existing
property ordering.

Update the igt_display_reset() doc comment to list the new property.

Co-developed-by: Claude Opus 4.6 (Anthropic AI)
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 913116cd8..d92a10586 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -749,6 +749,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_WRITEBACK_FB_ID] = "WRITEBACK_FB_ID",
 	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] = "WRITEBACK_OUT_FENCE_PTR",
 	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
+	[IGT_CONNECTOR_COLORSPACE] = "Colorspace",
 };
 
 const char * const igt_rotation_names[] = {
@@ -2761,6 +2762,10 @@ static void igt_output_reset(igt_output_t *output)
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
 
+	if (igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE,
+					 "Default");
+
 	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
 		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
 	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR)) {
@@ -2784,6 +2789,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
+ * - %IGT_CONNECTOR_COLORSPACE (if applicable)
  * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
  * - igt_output_override_mode() to default.
  *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5f9bdda45..3eda6fdc4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -191,6 +191,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_WRITEBACK_FB_ID,
        IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
        IGT_CONNECTOR_DITHERING_MODE,
+       IGT_CONNECTOR_COLORSPACE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.25.1

