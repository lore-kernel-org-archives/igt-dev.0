Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ED2CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 17:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5C310E21A;
	Thu, 14 Aug 2025 17:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fj2H+xyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433E610E21A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755193086; x=1786729086;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=NGt+Fp7gL2qxnwVsOKhmyT1RGtBbaBfnWJtSIcJU6Hc=;
 b=fj2H+xywreXpsfWMqLDDd8afxHiI0mSYeBHPGLIg6hiQqu3KJfNgTKMK
 N+Rc8ax1gSH6H7CVFOsRBOAkVPDRfRPtPlf2bTDJ1xkvUSkU+J8z0EYYQ
 bOTgL0SeCZIUgGAMDc/048WtCNkOxZL3xcsINAVGUvpgeSE9Za1y9wBFb
 rxLR7T6Nv8x/Kc4vk6fX17m8ZMJjzkWy03oxY49j/tjb7kvkGeRCUE/2N
 bUFshAaGng4qMNRWlnwufThvk9KxxAFDAOSEv3pCKVTJsvov+umFfahFj
 fWGQLJEZUSKD503v/BQUZYRDgkcLdvdzC57aKPYKpwxuqNbS1jfsAY1N+ A==;
X-CSE-ConnectionGUID: taXganuMQPuNxHtmmDNZ6A==
X-CSE-MsgGUID: 8172FpJGRVevoYLfrPsDhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57664066"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57664066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:38:05 -0700
X-CSE-ConnectionGUID: U8twcqOsRAS/uJ58TYGTgA==
X-CSE-MsgGUID: cWG6fU0fQKGyrsZaVQyF2Q==
X-ExtLoopCount2: 2 from 10.245.246.100
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166451502"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:38:05 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: igt-dev@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 14 Aug 2025 20:38:01 +0300
Resent-Message-ID: <d135c6396b9919fd5743495101ecb88f87afa2a3@intel.com>
Received: from PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21)
 by PH7PR11MB6428.namprd11.prod.outlook.com with HTTPS;
 Thu, 14 Aug 2025 12:49:29 +0000
Received: from SA1PR04CA0023.namprd04.prod.outlook.com (2603:10b6:806:2ce::27)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 12:49:27 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::e7) by SA1PR04CA0023.outlook.office365.com
 (2603:10b6:806:2ce::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Thu,
 14 Aug 2025 12:49:27 +0000
Authentication-Results: spf=fail (sender IP is 134.134.137.112)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
Received: from edgegateway.intel.com (134.134.137.112) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 12:49:26 +0000
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 edgegateway.intel.com (10.7.248.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 05:49:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 05:49:15 -0700
Received: from fmviesa007.fm.intel.com (10.60.135.147) by
 ORSMSX903.amr.corp.intel.com (10.22.229.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 05:49:15 -0700
X-CSE-ConnectionGUID: FgGB/h5KSjuT7pUZv1AXkA==
X-CSE-MsgGUID: Kt9guTqQRG2YvEAt/CHfqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166242872"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100]) by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 05:49:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
Subject: [PATCH i-g-t 2/5] tools/intel_vbt_decode: Remove intel_bios.h
Date: Thu, 14 Aug 2025 15:48:53 +0300
Message-ID: <7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1755175663.git.jani.nikula@intel.com>
References: <cover.1755175663.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-OrganizationHeadersPreserved: ORSMSX902.amr.corp.intel.com
X-MS-Exchange-Organization-ExpirationStartTime: 14 Aug 2025 12:49:27.0538 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 0406c577-4e16-4ea5-5ea2-08dddb3100d8
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-AuthSource: ORSMSX903.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-SCL: 1
X-CrossPremisesHeadersPromoted: SA2PEPF00003F68.namprd04.prod.outlook.com
X-CrossPremisesHeadersFiltered: SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|PH0PR11MB5032:EE_|PH7PR11MB6428:EE_
X-OriginatorOrg: intel.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 0406c577-4e16-4ea5-5ea2-08dddb3100d8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|82310400026|7053199007|41050700001; 
X-Forefront-Antispam-Report: CIP:134.134.137.112; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edgegateway.intel.com; PTR:edgegateway.intel.com;
 CAT:NONE; SFS:(13230040)(366016)(82310400026)(7053199007)(41050700001);
 DIR:INT; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:49:26.8992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0406c577-4e16-4ea5-5ea2-08dddb3100d8
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[134.134.137.112];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: ORSMSX903.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.3670414
X-MS-Exchange-Processed-By-BccFoldering: 15.20.9009.009
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003); 
X-Microsoft-Antispam-Message-Info: kpi/HwkHqvvxFvp+JBr2xVJ1j/f5pPrYmIWzXb0GAzqY/c+HF16b2rdu40yJD2eYqls0UTd+/277CNZoJf5LQYlUXVKVCdMOhS1+T349k29DshSO/pvCN1+SNnASua7HrIPRzn6I/X3Tye1mW7do43kU+jXU7pkKVhGtz7b4CFYS46MZbUcVLV50+kn/hSMjibh/gbVWoUAuxuQBh4Twecnv6ek/7LSzv+YbBnZPrWc2iOiKgNqhG90TzDPc3kKFRw37/K9yV5BIUfzVfuISJSaz2EjbuGtMpu2jVPwcxL3vEFHEg4HgMgxgqj+4FMIsQQeJYAppmhRQ6Q03MsMwnIsdchKZoIPhnUVnfVWHNGNG3i+2ql3txVxurXkcDr5ztCQreUHrdlPkzhEEZqDzSpiP/4yQqbodC6G3Wmmn8BBeAEEbKZ2/PavzvcSLEHA+MSiTYmNMHPgl/ZVkwCUGZDZiRfeir+xF8sGwfTf0q7Vpe/aTu5KFp2xcacKKxoJYgpKZFdXbCSOlqX4oqG+zxscPIuvsiyA3zLd8kbFlB0UTWPI+n1yiSgoQu37UYsIxh0jEO1JWgfLZcRUtCVObUN0xX92M0r8Av57hiYLFeLSQq/3FYwmA6/38h/Bfa2Zl7tQ33iL4dEPMIzaoiOZxGCrjpZ5CF8UkBzigoDaGn8rGgHngG88R6CMtIl062ifMx+sbR9zM+X88pFmushIEl4RwK11EaKvmH0AGh1QlfqUzOVsgOWzitIx29ZmTRPpb6++0WDuButzpA6oXOv7BihE28u1WHj1HVXMVM/WHoxcXrQST5nssO1lNX7L1GgWgojmPrC4SxKeytnvJpXhp/A==
MIME-Version: 1.0
X-TUID: SF/Ossp3tujT
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
Message-ID: <20250814124853.V2WgpygqX8mo-AsUH21SPhvZhvu8mWIU4I1-eloDPP8@z>

With the DSI VBT defs having been split to a separate file, intel_bios.h
has become rather small. Incorporate the remaining contents to
intel_vbt_decode.c. Use existing macros for LVDS config.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_bios.h       | 47 ----------------------------------------
 tools/intel_vbt_decode.c | 19 +++++++++++-----
 2 files changed, 14 insertions(+), 52 deletions(-)
 delete mode 100644 tools/intel_bios.h

diff --git a/tools/intel_bios.h b/tools/intel_bios.h
deleted file mode 100644
index 0bb4455d1f26..000000000000
--- a/tools/intel_bios.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- * Copyright � 2006 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- * Authors:
- *    Eric Anholt <eric@anholt.net>
- *
- */
-
-#ifndef _INTEL_BIOS_H_
-#define _INTEL_BIOS_H_
-
-#include <stdint.h>
-
-#define DEVICE_TYPE_DP_DVI		0x68d6
-#define DEVICE_TYPE_DVI			0x68d2
-#define DEVICE_TYPE_MIPI		0x7cc2
-
-struct bdb_legacy_child_devices {
-	uint8_t child_dev_size;
-	uint8_t devices[0]; /* presumably 7 * 33 */
-} __attribute__ ((packed));
-
-#define BDB_DRIVER_NO_LVDS	0
-#define BDB_DRIVER_INT_LVDS	1
-#define BDB_DRIVER_SDVO_LVDS	2
-#define BDB_DRIVER_EDP		3
-
-#endif /* _INTEL_BIOS_H_ */
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f7dee8646b4a..307c4da14843 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -40,7 +40,6 @@
 
 #include "igt_aux.h"
 #include "igt_halffloat.h"
-#include "intel_bios.h"
 #include "intel_chipset.h"
 #include "intel_io.h"
 #include "drmtest.h"
@@ -55,6 +54,16 @@ typedef uint64_t u64;
 #define _INTEL_BIOS_PRIVATE
 #include "intel_vbt_defs.h"
 
+/* additional macros for parsing */
+#define DEVICE_TYPE_DP_DVI		0x68d6
+#define DEVICE_TYPE_DVI			0x68d2
+#define DEVICE_TYPE_MIPI		0x7cc2
+
+struct bdb_legacy_child_devices {
+	uint8_t child_dev_size;
+	uint8_t devices[0]; /* presumably 7 * 33 */
+} __attribute__ ((packed));
+
 #define YESNO(val) ((val) ? "yes" : "no")
 
 /* This is not for mapping to memory layout. */
@@ -1816,10 +1825,10 @@ static void dump_lfp_data(struct context *context,
 }
 
 static const char * const lvds_config[] = {
-	[BDB_DRIVER_NO_LVDS] = "No LVDS",
-	[BDB_DRIVER_INT_LVDS] = "Integrated LVDS",
-	[BDB_DRIVER_SDVO_LVDS] = "SDVO LVDS",
-	[BDB_DRIVER_EDP] = "Embedded DisplayPort",
+	[BDB_DRIVER_FEATURE_NO_LVDS] = "No LVDS",
+	[BDB_DRIVER_FEATURE_INT_LVDS] = "Integrated LVDS",
+	[BDB_DRIVER_FEATURE_SDVO_LVDS] = "SDVO LVDS",
+	[BDB_DRIVER_FEATURE_INT_SDVO_LVDS] = "Embedded DisplayPort",
 };
 
 static const char *default_algorithm(bool algorithm)
-- 
2.47.2

