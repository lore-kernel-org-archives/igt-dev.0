Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8436CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 18:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF97710E348;
	Wed, 10 Apr 2024 18:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyo735l9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D113F10E348
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712774591; x=1744310591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kEEF1AxL2rBmfCRxsWDi/tXiGZV1gosA0ZNDPe4auxg=;
 b=iyo735l9JszyP8kxLog+L7JXzLzLWiiRH7G7RPVNvil/JOjcF8kVNKZi
 ARxhNLkjUV8UgitFic7+lvhJwmZxcfHvr1RxlHgTSmGWFhYOvZp3L/69p
 DLtuwdzmvjY/FRFA70PrwX1plmdbJYmlOKVun0PUGJwQiIgedU03mqkqX
 EjKmfHebGKFH+EKagBjMpWlxQERq6jc9tfkZygUwDP0yAlmSTmjHQ2A2k
 pYYil9oA2uAn55/gaPH/IUhr5wrqP6ACeY9dd9f9LxhVkwAT4+vq+M8/k
 QHn/w1O+YUlRa05ttMHwuO7+GAKn4o4QZcsBkyB0qZE5kg5529gV2ktCh Q==;
X-CSE-ConnectionGUID: QbS+ItKtRq+sbeDOb8gDuQ==
X-CSE-MsgGUID: zRbaQgb+Q6epwT2JgS7WRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12010103"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="12010103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 11:43:10 -0700
X-CSE-ConnectionGUID: nC98ZfZORsGiMfk52UiAIw==
X-CSE-MsgGUID: qnbWLBQOTHyajY1yqDqkeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="58075032"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa001.jf.intel.com with ESMTP; 10 Apr 2024 11:43:07 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, himal.prasad.ghimiray@intel.com,
 priyanka.dandamudi@intel.com, kamil.konieczny@intel.com
Subject: [PATCH v2 i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Date: Thu, 11 Apr 2024 00:13:30 +0530
Message-Id: <20240410184330.3897514-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Change in igt_assert_f function parameters so that it also validate for
property value equals to 0.

v2: use uint64_t for property_value,use bool __igt_sysfs_get_u64 in
igt_assert_f(Kamil)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_sysfs_defaults.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 4a6b3ba6d..d38a75e55 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -28,7 +28,7 @@
 static void test_defaults(int xe, int engine, const char **property)
 {
 	struct dirent *de;
-	int property_value;
+	uint64_t property_value;
 	int defaults;
 	DIR *dir;
 
@@ -42,7 +42,7 @@ static void test_defaults(int xe, int engine, const char **property)
 
 		igt_debug("Checking attr '%s'\n", de->d_name);
 
-		igt_assert_f(property_value = igt_sysfs_get_u64(defaults, de->d_name),
+		igt_assert_f(__igt_sysfs_get_u64(defaults, de->d_name, &property_value),
 			     "Default value %s is not present!\n", de->d_name);
 
 		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
-- 
2.34.1

