Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F5C44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 09:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B751910E825;
	Mon, 20 Jul 2026 09:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgfOEnZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B1910E825
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538285; x=1816074285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jrk5UNiqCRXZzrS+JzGglJtmnRTXGAatCsKlV6uLewc=;
 b=HgfOEnZszZYWelfXJUGbQ0D4zHxBdrZpcLdaQVAkfRIdz3HSq2oM8rVp
 uI6KWiuK7Q9U+AVQHRpBTz0ruu5qD8fBYXdqhQ7XSZAPCFCUXfaUHzOTT
 QVE79tV0Bgi5J878PJgqz/8YW6XL1nbppSNmn941SjEbhIgPIq22dUCCj
 EnEY6rvlnVoKQzAdBrWhdiIKstfBeMOzxJTZHnnJsOw5su2zGhQnLLABt
 UoTy4U8Xs5DxEpLV/qIPZ9rJWMCX7eiz7yJgQmSiAzXMJY331yG/jbJVT
 pzhpk0QDIBx2FdAiotUHLFmQ9jDgmoMUAHLm2QsAQ6BUExkCyBxuUeafO A==;
X-CSE-ConnectionGUID: IZOEstVfQv6vkhUEr9QAYA==
X-CSE-MsgGUID: 6K9Hjp4BR5eV08FN2VETEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="89010836"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208,223";a="89010836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:04:39 -0700
X-CSE-ConnectionGUID: Oz/BsvdQTb6L494GqIxfBg==
X-CSE-MsgGUID: ikbPdxLRRXedPMcMKdxvdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
 d="scan'208,223";a="254788940"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:04:36 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t] lib/i915/fbc: xe3_lpd+ update the plane size checks for
 FBC support
Date: Mon, 20 Jul 2026 12:04:25 +0300
Message-ID: <20260720090425.28205-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

From xe3_lpd+ there is no restriction on the plane width to
enable FBC. The restriction on the number of lines still holds.
Update the plane size check function accordingly so that FBC
tests dont get skipped for valid plane sizes.

Bspec: 69560
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index b8c714d43..9444a2088 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -127,7 +127,15 @@ static void intel_fbc_max_plane_size(igt_display_t *display, uint32_t *width, ui
 	const struct intel_device_info *info = intel_get_device_info(dev_id);
 	int ver = info->graphics_ver;
 
-	if (ver >= 10) {
+	if (ver >= 20) {
+		/*
+		 * No restriction on horizontal size. Assume the callee will
+		 * limit the width within the maximum allowed resolution of
+		 * the platform being validated
+		 */
+		*width = UINT32_MAX;
+		*height = 4096;
+	} else if (ver >= 10) {
 		*width = 5120;
 		*height = 4096;
 	} else if (ver >= 8 || IS_HASWELL(fd)) {
-- 
2.43.0

