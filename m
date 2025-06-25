Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C41BC7EE32
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B259410E7FE;
	Wed, 25 Jun 2025 20:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WuxeGTGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0C110E7F8
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882117; x=1782418117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZmAr5ayRTr84CfKXPqq1/4rPupkJGhUzoXsGjKYgCM=;
 b=WuxeGTGTWJedDngQg2tP2+VLZkoU5MDdB2u2s8aCpePmsdN5VsJdKBHY
 ESzbEvS7lXG2lgN+kD9m1MNjN/EzCp0mVr3pDE/4WuPLROqYGwaoUWMft
 wV+X0Hsa1h/YaTFpsNjagaAO/o3907j7/Zeetm9QL8jmWN6zUwKDB6Lzz
 mUuA3WpT3KFLmop4uGkvTBRwoeWJImHFD3angmSNDb42prUOAU985k7Vz
 sAQayviG9ux+0QAR7T3ROsGShuvu3K9U/IVyqrqL40Oj0Chh+ZUsK4yUd
 3WOi5PJK7IfPrWCrcKvZjK8lYtYNiyavDmTQ8eHdsCGYy/PdHKOg8h4Wp A==;
X-CSE-ConnectionGUID: ZzoL83RoQqamci4xPlGSVg==
X-CSE-MsgGUID: DERFLKwJS+ywV6RZ0vcghA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766194"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63766194"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:08:37 -0700
X-CSE-ConnectionGUID: qVFc1mqrSTqPh5lUyoENtw==
X-CSE-MsgGUID: pQjy4qtqSiGgQWjghiQfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="153033394"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:36 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 6/7] tests/intel/kms_psr: Enable the tests support
 variations based on the WAs
Date: Thu, 26 Jun 2025 01:37:37 +0530
Message-Id: <20250625200738.34381-7-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625200738.34381-1-mohammed.thasleem@intel.com>
References: <20250625200738.34381-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index da947feb6..7167b4242 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -275,6 +275,8 @@
  * @plane-move:         Move plane position
  */
 
+#define WA_FBC_DISABLED "16023588340"
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -719,6 +721,12 @@ static void test_setup(data_t *data)
 
 	igt_require_f(data->output,
 		      "No available output found\n");
+
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_supported(data->drm_fd, WA_FBC_DISABLED),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
-- 
2.34.1

