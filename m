Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0643C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594110E366;
	Fri,  3 Jul 2026 14:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mhm7SZyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF3A10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088985; x=1814624985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DRgfXif1mSd7wZoQxMqh5oSGuFKSH6G4s4lxEoaW23I=;
 b=Mhm7SZyP4jt8YXjqLdufMrIUVnz3iCo+RcA4udUeQLvGYoW1GyN4qdpS
 GGZ4+ktki8LS2r5JRC8ShYMeuGFB2naTQZGodVNcuQ6LAPTnwcPIDKsDm
 G1FNxjJ66l8ngWKUuKqZIaUeTqKVxuzmx8a3aISfJl0egveGK8HX6q9oq
 VvhHl5gCYgDT9pc1nYcdgiZdd6ex5CKCqFNHYhYHi1x7tOgxeBr6IhkZz
 lrSC6YwBdRRMrar3TSVmy8TYfnrIALb0DIs/4vh9G+PRn+DW7WyVxiexA
 97hsyGmGFDz+0e7wZ0fPsVYGidLLPZnlUIJsRTV/Vhl9KKdF+3Q//XgCG w==;
X-CSE-ConnectionGUID: 12A/I+OxQKa+4Brs58dTxA==
X-CSE-MsgGUID: 0dIeyOuIR/atC84ggKBcAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877948"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:44 -0700
X-CSE-ConnectionGUID: lXz7vue8QzC+pq4fzjVxBw==
X-CSE-MsgGUID: 0+RK2Pb9QS+t02xAwMSdDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIoDeiilEUO7bcBvbORTWLETA2YOIR0Mi9N87yWdyP0dbMIT6qQPO9S7P7szZl+pyrxy1imQDhdTvLtSR8VDBeZplVdOwARCVMJJ23ZqWo6lBBlboy4jhk91+pxpABjPAzsL8a8RYYxyi3MHNLJhqPuUcgqUjxgZkiBx7JaBrZHsIAo3Ux5z4zoaftu3sjcUM2qWPSxk2FVuugQsxypVRSaoEyQ0844Q4JgKJsaUeuMruxY9SYLrt8GfqDa3bNFmvDriOfs8L+qcbvpnBOMiZDhzU+PotUHzxcK0e+54Zw2g9v0Jjne6JFiEmvItazNYzIumzVJsfp/OHpYKZULOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIXaZgSza/JO3ReI+9yHo4Rzpzd2o02FfxGkIooX5UY=;
 b=CF0jX/56873wJFPbimTvgS+ElYcSngTQ8XphL7cv3aeQscukYTerJ4AIjn8CD+sVSYH07BbW1Nc+Cg2jGsOQMdlbZ1DMxBHo2nbRhlMqUT7Of++YQnXte2n9JqYUU45q0ctL1EOKRXL4k8F2bpO6B6Ljy2Bl491DZSa9Gz0EugicfJlG+g19tdI2EKHK+65vHCEzm7aA9Cs78V9qKT7aqzCTIL/Uk8mLu9AS38CWzDe6SqND7PlNOpxzBQwXl83lz1D7hHZW4LBQmkGpO8vdR/Qhc1lHTTqjpKS1kujZBiqJFaef368+JCFla+B3q1JFFfx58p+H+CcatnMU9YOYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:29:37 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:36 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 29/31] tools/intel_gvtg_test: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:29:03 +0200
Message-ID: <39e8a0f1183e5c158dded3b37f7b24f0c44e8bb0.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9e5e8b-951d-4221-1545-08ded90f825a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 3Pm/2kLSygaVwBRBV5gwy4svVMMdMGwjlVYE73fWzjDnpmXgcgrxfWPUu6PJn8G7VNSlz46oPwfk+GHyDgjn60fg0G5QhGHQWQd5ghAkSViFjsbPsByBpU+VGOIxYplAS3ExqhpEVuO2HDWJ43tZN2LUcduqBMJzRVONQA2Su7ys5ZctaeSQlJ3tydpgobtZyyMryrg2w8DcTIQ2+yvttTAsCgnP4qBANQQtjX6bFKpy5ACFxuvnJ6UNn3FQE7BrWdD3poHTg80VHv3P+qvuJ2pADZHwTBKa5jM5+OSgiXHN4NZXBEb2vxsPYsNfrw6T421oa6y+OQS3f5M6v5JE2vJO3ea5XjVR1upWksddt6G4ANfl5r2CMygHda7gQ24sSjTj75vHdiNsVrlcCnZ9efmcLLMuX5wZRN9MPOGAAfbOQOHyGW6AKEHxJPM3pz8fizY+XmdA9YPLXx/GF1CcXVw6yM27uKtut0bbugmU1RkAEhRlXeTc5lWi8pbMcxwHwBjnHF0NqtP2AFdpgqzT6KMQCoJYr5a7dsbNRPJuTYojqYKkD3K6xhhvWRbQ/MMKdmlA2IhHeDPlhIyl/DEtcqmK23vx7qdmaZSNtu8dyrYkW1vAQaud9zpw1VeskAEnX+AcG9VJE6kz8O9pFU4AKECdxEaA104O168klwHmn90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nw3IYWfGHEPRuU+zeAY7geUzfDhioOrhkHZtbyh5smW8ALv9z3uE/KT1SmR2?=
 =?us-ascii?Q?6pIfP4LLSAigB8nOaRzaYz4okTTULajl0SZYRxkMFtirHO9TvKnbVjLw0VAP?=
 =?us-ascii?Q?EZjQxNf86YZPg65X8DFzp1TLzpqUi0DqDdxiguhdvZdE/JwA8mPWk6JIzMK2?=
 =?us-ascii?Q?PPnByWKU/u5aQjAOsbz3iQpH2Zhd33LTMCqy1iECtJkao3g87xdIHD4gtRxg?=
 =?us-ascii?Q?5YIZZt2+t0vF2tGjjEsWYaL6dsS4P3gyalGnQpsvyozl5veN9sMXBuMAHfXV?=
 =?us-ascii?Q?A/Fp8c5Y5JZyaLychk0v3exPBi4dQ0mhe8p/CbH5hVY1zafUQaAp2WYmhPj+?=
 =?us-ascii?Q?JK1vjJ79P/RMWfpfl68FAelV38mVBAH/rGhxZ7PPpvT0JzshmSYGZZxr/z3O?=
 =?us-ascii?Q?RpT88Zt1UMWUoPv9l57gw+drIUSdlpe/MxhF41eNcBRGpqsJuJmqZ3PVYFPE?=
 =?us-ascii?Q?ZYZdd26aFcHiQsdtYKI81f5MpCwlElNbbtyWYAHwxaS3fY0n6+Vv7HOPsLoC?=
 =?us-ascii?Q?Lqvgn3Fs+ew7qkmURmzlvXeyCr+U4GTIJwnbKHea1tGfguMiQuIQO6QEyj8n?=
 =?us-ascii?Q?KxX6V23fHJULUlVwwJkvvtZup4XXlSBtbnvwtmzjAx+u8142mNiv9M/gzk6Z?=
 =?us-ascii?Q?NbqPCHoBclqYjpCpxQnyKA6jszmgLHkqXYBRjWCDhWOOwYQO6f9yGpQSt5Lv?=
 =?us-ascii?Q?3e40v70vY6BrzqpgOreJLzDkAFKRUP4zvON5IR48HTDkpZSbXwHemVlQtlYo?=
 =?us-ascii?Q?/z2ewCLw7NWaB7SxQtyUk4RdJ1lvHPEQoT2r5jcAi/HROnVNjX4dHbuqeXti?=
 =?us-ascii?Q?DLPTtvUxB/oyRzuv83qBpQspcYQ1zp3CE4exn2ToGm16nfcntmquT85hM3Ez?=
 =?us-ascii?Q?MXRBhkE4buQjzvg1OG1sw+oKLD5VnfQZsfrXm+43L6oB8mLMLHgKurzkbcO0?=
 =?us-ascii?Q?DqJx8yOe4EQbLV83HVVZLt9TYiXCqXKeAWVPMn3AIMUJgj9dWBuLmYBcyArZ?=
 =?us-ascii?Q?Tvwurca5pRNsbfdA7Jq70vpeEAXwtXRI36z/aIlupUUbvJEKDXLupogcJJHr?=
 =?us-ascii?Q?NoMf18ewq8YCDOpgT4WwxUojMA/wM0kAuo4wB9VYCvFwYm3WC3fEEqy34rCM?=
 =?us-ascii?Q?EiFspHJBZMCa6xYibFNyEVKuGa7Xh9Lrxg3iBxKb0Wky/zcqZKCCeaQNo812?=
 =?us-ascii?Q?AaXFihe+t3h/+69j5aNJZ1mr2J9kr5zFX644NcvUaisrSOFg4g+MlOmuSeI1?=
 =?us-ascii?Q?88H1AlUr50Nfvi2zrVrwgxpj8+Xw9fLKGrvDFqZ103tSKfqD9orvTSO5aJiK?=
 =?us-ascii?Q?qKGEOS6c5/N0TfxYU1/PQGTFGwrAG/ZKBiBH3glFWfYne8uuTHst5Cq8CJDr?=
 =?us-ascii?Q?ESrk3uoheymbfKt1Lxw9XpCscDkjtSTP6ic88CNTjvvWdBMBVHKBahbq+QDC?=
 =?us-ascii?Q?7qf3A1GiUIEUK6GXwMY7dM0R9iA2zXCY8RW4AjI1ug+w1GPq4LOsA8h36Vjo?=
 =?us-ascii?Q?gATM1/0Wo0OMxtz3KTe9jSl81cc6TYmHh/pZAc7xMC4CF8wvlAsUg2R9t3As?=
 =?us-ascii?Q?oW+ySQd3dfJEXPmc1e0yB8C+Z4wPjdmcJ/Fu6mxKN3q6T/orKri9RVbIGF5A?=
 =?us-ascii?Q?z3SjUu0hIH1kqpiYhp59VVyB/Mdd88YfjoQC1CcThV7Pe+6/7eJzJfO6rch3?=
 =?us-ascii?Q?MhiF6B8XC/b0etMhym4lxHM4PoDtxZaSLpVqnVlhOsfrmVvUz/ATxBSoBO5N?=
 =?us-ascii?Q?3acqdHtO4DtcbQWSPpiC5cAV2ZnXfTM=3D?=
X-Exchange-RoutingPolicyChecked: MTG+RHI+53+QTRqKwm1I/AtMH7fCyFpJKR4K+6BR0maFftFXRNqTAf791IuffBA3rFwGMxkynKPamOwPYcHG8HkTiT4513SrbbijEyvn/NbiJTz07lrusQBxAsP3jXzqGmwOH3Iyo+Rcb/fVLVXMMRODRC0q9+fRs3Y1MglB7BEfsGW8sLaLW8p7bWhckLkxqM+kCZMdJ/+tGMpBwDq2LNQoaRNgCZ4VG74gpdGAFRnU5CkonZ/gVDauASKsDxfkrRe2R2CUIq9pKw9Bc5IUrHLU07L7L2JIK+9zyCwxFM9Ow6YJp07hfUUfPs/4wl2mklxPG+zAp0yB9143n2aySA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9e5e8b-951d-4221-1545-08ded90f825a
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:36.9300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5q9l2FNk8wcmYJA8khNp2A6KwXwty9Gow7QkHD9HiAgPFNaD2ROVaFE0/wAHNdmYpoR3q9jeMJ5GBH5qdt8NZtmQP9kkVFimC1O8mFgZXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com
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

intel_gvtg_test only needs the core assert/log/skip helpers provided by
igt_core plus the lightweight tool stubs. Replace the monolithic include
with the minimal header set and stop linking against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   3  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/intel_gvtg_test.c | 2 +-
 tools/meson.build       | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index 408e703bf..fe8f7a599 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -30,7 +30,7 @@
  */
 #include "config.h"
 
-#include "igt.h"
+#include "igt_core.h"
 #include <errno.h>
 #include <getopt.h>
 #include <math.h>
diff --git a/tools/meson.build b/tools/meson.build
index 2a084a0c4..6e694164f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -26,7 +26,6 @@ tools_progs = [
 	'intel_residency',
 	'intel_tiling_detect',
 	'intel_gem_info',
-	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
 ]
@@ -132,6 +131,11 @@ executable('intel_display_poller', 'intel_display_poller.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gvtg_test', 'intel_gvtg_test.c',
+	   dependencies : [lib_igt_tools_stub, pciaccess, libdrm, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

