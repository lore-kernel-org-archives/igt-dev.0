Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98113C7EE2A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFF510E7F7;
	Wed, 25 Jun 2025 20:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eS55jo9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063F010E7F7
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882115; x=1782418115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++bh63vY9zo1B00Lj1w9gNEgsVjXDYzGsVhFzSD+u5c=;
 b=eS55jo9NBN1Fo8NJjoxIz/uK/2Q8u4Xsy0kX07dih7X4RtyiIa0EjHKJ
 CF2RiqAu7Spea+LUv8cNZc5oQ0/01LymxLb0/J3qK72n6dnKNXfm+Ud/l
 RrafvM+YVhN+D0uuGfi3Grx/SVBv0fKdYdtOVvGxnoL48wq03pd3Zln4a
 75PDIyaZRAeIGhsM60mzHPX20Xi7mJaxrYM/FvAY33M4754XYlUN58Yn9
 sSEYGYZMvlAyAwFnltDhb/3r10sOnKUYPKzc7UkbJDyS1aqW35Fbx29Sc
 AtVQTUrsc49pwhAgY6meoTJXaoNJm5/ZVTiBQiz3I/gru6QloC3o1S5ij g==;
X-CSE-ConnectionGUID: jQXgk+SuTaKFfLq8uB+aKA==
X-CSE-MsgGUID: 6KuuRooURpK31jSyb/OBOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766186"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63766186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:08:35 -0700
X-CSE-ConnectionGUID: AictS6EHRFq7CVucFleb3A==
X-CSE-MsgGUID: fcjVw8ViTsOS7BOapkzDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="153033379"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:34 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
Date: Thu, 26 Jun 2025 01:37:35 +0530
Message-Id: <20250625200738.34381-5-mohammed.thasleem@intel.com>
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
 tests/intel/kms_dirtyfb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index a5707c5b1..e587042b3 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -49,6 +49,7 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
 #endif
 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
 #endif
+#define WA_FBC_DISABLED "16023588340"
 
 typedef struct {
 	int drm_fd, devid;
@@ -381,8 +382,9 @@ igt_main
 					data.mode = igt_output_get_mode(data.output);
 
 					/* FBC disabled: Wa_16023588340 */
-					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
-						       "FBC isn't supported on BMG\n");
+					igt_skip_on_f(data.feature == FEATURE_FBC &&
+						      !intel_is_fbc_supported(data.drm_fd, WA_FBC_DISABLED),
+						      "WA has disabled FBC on BMG\n");
 
 					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
 					if (data.feature == FEATURE_FBC &&
-- 
2.34.1

