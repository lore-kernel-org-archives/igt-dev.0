Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8483DC83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E6D10E44F;
	Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0I6AowS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065A510E222
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751290660; x=1782826660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HS+Tilt92kvUdw3mSp+YF8wNAXm6n/cqD0QW8qEvwfE=;
 b=I0I6AowSERrTDrpufBOd42tLi1VByNkwsHmOCXFwZjgOKce7TZpqHMYf
 wrETt2hHQ3U48Dzzoma+P7Lifq6mE/+Sr77tedRPv1ITqEYtFPS9SnZW9
 CcUeq0xMFeKdQpt+E70BbCPFGS0vLA9s3hzcs/js9DxjLxrWNzDPEPsOC
 TsXsUB5Cv2bUA28VwG8ZBULEeQsTu5pC/HsTlyuB7bMpNMhmNViGFV0+K
 29wQFBW5QyoVUnRBadqcfCecW4YWE/Vk6W84cK5K1h7TURHHafZtU2y0h
 mqRysDB8RPPMOIvB/HeXAslghPHhTrH2aJI9ckPtAXdyobRmIuAP/lTqH A==;
X-CSE-ConnectionGUID: bJ/CTlaFQTSi+Pye0Hr1RQ==
X-CSE-MsgGUID: iiNnfzDETyKBAHIk8SYeTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57322566"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57322566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:37:39 -0700
X-CSE-ConnectionGUID: U99iB1u1Sv2ZDPN2qWzN5g==
X-CSE-MsgGUID: TwbPdRqrS1eEhlWeYWbLMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159188323"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.227.88.71])
 by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 06:37:38 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
Date: Mon, 30 Jun 2025 19:11:42 +0530
Message-Id: <20250630134145.836-5-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630134145.836-1-mohammed.thasleem@intel.com>
References: <20250630134145.836-1-mohammed.thasleem@intel.com>
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

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
v3: Updated logic at igt_skip_on_f. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index a5707c5b1..51b4d446f 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -381,8 +381,9 @@ igt_main
 					data.mode = igt_output_get_mode(data.output);
 
 					/* FBC disabled: Wa_16023588340 */
-					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
-						       "FBC isn't supported on BMG\n");
+					igt_skip_on_f(data.feature == FEATURE_FBC &&
+						      intel_is_fbc_disabled_by_wa(data.drm_fd),
+						      "WA has disabled FBC on BMG\n");
 
 					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
 					if (data.feature == FEATURE_FBC &&
-- 
2.25.1

