Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F5ECD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 13:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A065510E030;
	Mon,  2 Sep 2024 13:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVQTbGv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234BC10E030
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725284964; x=1756820964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kyGvqxBL/vgD5x3b7jdZEooh+GqU21DSZ3offQA5SLg=;
 b=KVQTbGv1kTkkFs83ttojwz1mwTWAAE0dcrsh5qaJWeZr7lS4VbEvpTW1
 ft8ZqZ0rYyq4ptyEabCn9jcEhxbVBtMpVd6gwvlT+qE3IPBW0wgEJ4VtA
 ZA+sfEqMbgV8v07lJNUd2E6DY85KwSOGtAhU+BMqxW0unipcy0/hfTn+y
 bgnShKYGkrHI4iqrw5b44T14taqIUL+dpZwdPYq2/MTSOosaZ1cjwxm86
 bqKPJItWVEKlU1Q/IYJJAXbQcMKRHhaadhbKDZHyPMI439eDG9wAxEB8A
 HThX1jOVjXfHcwqdrL1O+e8b9ZuE1HvvdGoFK+fxMUsMKZO5uPKJXkQh1 Q==;
X-CSE-ConnectionGUID: 7sx3Adl+Rxim3Bw2ZAncKA==
X-CSE-MsgGUID: IBkdf1USSA+cDA7A+qujow==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23382912"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23382912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:49:24 -0700
X-CSE-ConnectionGUID: 2dnmZlVgRkuV1AMt3Dg9jQ==
X-CSE-MsgGUID: 2Bxz1cKjTwaMnwzqAJwy9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="68997780"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:49:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe/oa: simplify device id array initialization
Date: Mon,  2 Sep 2024 16:49:06 +0300
Message-Id: <20240902134907.2186238-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Stop abusing INTEL_VGA_DEVICE when we can simply define our own macro
for initializing uint16_t arrays.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/xe/xe_oa.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 4764ed1fcfb8..1bc2eeb0a11a 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -112,16 +112,15 @@ unsupported_xe_oa_platform(struct intel_xe_perf *perf)
 	return NULL;
 }
 
+#define DEVID(_id) (_id)
+
 static bool
 is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
 {
-#undef INTEL_VGA_DEVICE
-#define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
-		XE_DG2_G11_IDS(INTEL_VGA_DEVICE, NULL),
-		XE_ATS_M75_IDS(INTEL_VGA_DEVICE, NULL),
+		XE_DG2_G11_IDS(DEVID),
+		XE_ATS_M75_IDS(DEVID),
 	};
-#undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
 			return true;
@@ -133,12 +132,9 @@ is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
 static bool
 is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
 {
-#undef INTEL_VGA_DEVICE
-#define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
-		XE_DG2_G12_IDS(INTEL_VGA_DEVICE, NULL),
+		XE_DG2_G12_IDS(DEVID),
 	};
-#undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
 			return true;
@@ -150,13 +146,10 @@ is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
 static bool
 is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
 {
-#undef INTEL_VGA_DEVICE
-#define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
-		XE_DG2_G10_IDS(INTEL_VGA_DEVICE, NULL),
-		XE_ATS_M150_IDS(INTEL_VGA_DEVICE, NULL),
+		XE_DG2_G10_IDS(DEVID),
+		XE_ATS_M150_IDS(DEVID),
 	};
-#undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
 			return true;
@@ -165,6 +158,8 @@ is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
 	return false;
 }
 
+#undef DEVID
+
 struct intel_xe_perf *
 intel_xe_perf_for_devinfo(uint32_t device_id,
 			  uint32_t revision,
-- 
2.39.2

