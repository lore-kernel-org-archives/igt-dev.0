Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC8C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9E410F034;
	Wed, 15 Jul 2026 12:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeUi9U/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F3210F026
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117726; x=1815653726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ru6mi0Mi5Q4kOeniZmehJv1DTauOLERT7Md6g71J0kE=;
 b=LeUi9U/twZziCd2/sY1xPBfVrz0Sy2IulmoKZ40B4iVwJCt41AZYoQbF
 xF52qm1UWhEKyzEpzCuzyUqTCvI4vukHOsGlEHqXjrBgLOZC13C9+tg2i
 8aNqI9cQHYnUK14gkdMEYzUcd5/Nvc8/1epz/diKS5pJQaFZY+Rz/+k1H
 niw7bUbqLJr7ZFp4Ik1Kt1IdY6c/nM62pF+i72N71imICVHUQ/6Ggjppm
 izcOArzfCVhoKK6I/Vok6bLPAw14YfuyL6rtJbCgT/PXqzbJ1QaJIyfzh
 2h310DHMq4hWfwpWNgL+ei6jrVgvHTNYMpcku8ur7dYKg8oP/wKxf0+UC w==;
X-CSE-ConnectionGUID: z6UMy8YvRHanogTGS9TJwA==
X-CSE-MsgGUID: 4om5Yp9hR6GBVZTJDFNObg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102175895"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102175895"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:25 -0700
X-CSE-ConnectionGUID: bSx52zHtTkagKbeVXYnWug==
X-CSE-MsgGUID: /X2b9EDrQieKTuiFw81/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="259985081"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UH9li0ukzVMPCGrl1hKJnf4Z8HZXDBICzT980JkgysIox6DkLgpkIq1II7yCLXW7eKV8S0cj4UYmH+jVJ7UZaSDTSTIyski22OdWTN1OqXz5Jut8X9ipv9lqSDXlFSDniPMJAowUR+5dQBUomWMp1fzxi8ma5bci9PYG9+jrnRtApnFskAnE/pGGN2Od1zLZBTEJuv6nhnw8IcQUuHd8CWsn5dtFq+gVbXTU9jeQx9epM8bdItgABMzTpqdZ9cr3023iw0kS/6Jw5fUjiCm6hiR6S5QkL/kWfhX79E4Z0tF7gcjfLvdS8qyuccmj3/BKBN9qsRoL6CiFjljBcarcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEqdkiTCLKW1lv8kDnf4OxtC88Z1SJ8xzpGe74mjulI=;
 b=bt7M4AmvGcgpkhD/qKL0g9JY9V7R/dkSCEx7lcqsk0Uj8G0V7CekPhxA78ytVN7LwpwfFexHiGzGlryh80D0GIuqm6hP+ECnzLMv9wanBRfr+uXHnF64Z8aFEGxl1SA/TccsRG/uyNHbZkRO89kbAudf5DbSKL3HTA8MzSkpbLA8sZpmi7cNiw9gQDXWZvimGa4fRYr1ra6rvD61AD/f9EybeIInKNeuEPZUKF34Jsr9D1UqiCReB/iR+OJL2ptmb8PIFbnce9zcq82SkXdLpJ48gslPa1OCm4YLXKvFhBZQIQSfWk/86/q5wLd7rWFyOgTb/AXhRA4qcRLPfB721Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:19 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:19 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 10/31] lib/i915/intel_decode: replace igt.h with
 minimal headers
Date: Wed, 15 Jul 2026 14:15:20 +0200
Message-ID: <40f39262ecc50f3dc94d69cd37490bb98df98962.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 3449af33-d673-4f0a-09a9-08dee26aba3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: GbJCgde2hlMDDFILkWzTwbtk41Yz0OlpQLwHH24kGLSBBKtga0RwcbjhWiETdqzQecas+e+srEG/tXzkuzFs5bXEIz2EsqBcig0Ls0nWMIsw2ZdLL28QY87+91PuNPmG9M/zyQSGxAimhi3L6ezPGudsl8VoU8VmXR86C4ZPUcMQonUl2lazo0tqWwaCzGN3Prjtsy6RA+ZdO8whVivozGA7uWB9u/LYL1iR4mmN6PHXiVPxMcIgo/B6JtvWLNoKBWjvYJS147ef4V97LYbfihUHIh4Ky0c2B6fk8s9438FtEyasbXYU7OLprPqzYtO0iTKLYzbfuNBVc3dKvSP6uML6o5qcPaVS0yyglqWlruM/87PBeDVH4FCI13Wrs2YMJ2Ay40vWYmu5VjOrOjRFxCEorb2LMInJBow4j+ecg/Ma3CyrVhyJAtGFK2vi98d6AfrPh6rqkC28HqiPudz315CfLWHhU8mzZrbyXLFd6GRnQ1maiMizeQ0zFK31ABJY5W7L92tMRLCdI92pbQ6a7WdXZLJbTfaEmhZplqgskzlapEtWBPZjjQNgJreVhQhLKSqK6K43vdJ8rZxTHu+FljHwZ46aVgU1EOJu5abXJv5kMJiGj6ZdvdCtx3MqoG384gwpLerqZyMe2YJR+111j56M091O/c2XIYX0ICUMmfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YXWFZFGFGIquMmZCCNxdM7cvxj4iBISL+I40sAXMiyBvgbiwaHay4yN6BadI?=
 =?us-ascii?Q?ShHPKNRR6raLetg1PwfBD8O8RkOtRax4FOFVxkVWLsn2ZdrSMJ4rDwVY5SpH?=
 =?us-ascii?Q?+Xz+YS5aPc1wn7iUClLdAEiWRz50g4SV2OYrDWDGJs39J3Hugeoiz+LDBTPU?=
 =?us-ascii?Q?Uz5vkO0Uker6qWFMnKVcrOJo3X/ijIGeLJlxePIlKe0DhwQRUS+dIWXxRBkX?=
 =?us-ascii?Q?wZb0hJit9xd+NIVdNULoUle364FAGQ13tq1X3lty6VV+g5a2pa3pX9IboSDh?=
 =?us-ascii?Q?nE3o9Pgf+cyrtw6lrtrKkYpltOcwsw5GltisH1B13izvRyNGuZcfXyDZR3tE?=
 =?us-ascii?Q?mCGGsxC6dcnHgEr7UTYnQ6uJJrJt4jNbLI/dYfhFA7r4Sat82E0e4P04aCp/?=
 =?us-ascii?Q?KtUXhMlhJry0CtsMbn5490a2Gvy7axWjvN45PVVpjntHyjgpduLkQvvLlkbn?=
 =?us-ascii?Q?Bhc2LPKjos87SoasNcCe0gl2ZfEmcq59YTTGZzMcoji/Jf6epnObEv3sPSF2?=
 =?us-ascii?Q?y59jeBHAoWxJdaCWVisXXhPPH3vOK8efFjeglb9/WnltHzweVlR6LoIQfBzm?=
 =?us-ascii?Q?0z2Xnz75yLH8D/AMIuztVsi0XOW2H3bZFVW1N39VhVOid9xZi6hUh9RhowQz?=
 =?us-ascii?Q?2WzYz2sASvUebpDl9RkbwZqqwP7s9YmHvhnw2kmyzzTfG5st4RRu0YJLtOqE?=
 =?us-ascii?Q?FgjDPtxjpkVLpDquPNLuQdhtdS+0ujlqp6mrDW0afIOfLPgW3mtU9P0a4AJy?=
 =?us-ascii?Q?1fWqfUoN4TLUI131lKte1WNnineXgw7UdBnabs0AFbtnLdlWnvCcpz2pEIju?=
 =?us-ascii?Q?eXKDiQQJhKIY4f1kRI998qP1AFI7rSicewXJ9sEyIqbULFkobJJwsdOjrfTO?=
 =?us-ascii?Q?RGuHa5h7WlWNjk2UxRKoKWrRY5BuxTrrYsoImW2MYkQse+eN6iMZ2uZVVwkQ?=
 =?us-ascii?Q?6ZH9SVwDNo24+am2Z0Ghl1fVSlrN83Ro4lVLl8cMRAkp2XVsPwsCZLdFGtuM?=
 =?us-ascii?Q?t0No6kME+J/cgnVSbUXFXf02PFe77NTcmTt8N7hwTfHOmJBD7/8Tep2ZoIkh?=
 =?us-ascii?Q?luQdkSk6FIMm/WarpmX3hCMWoOz5AHCT9CnOW9aiT7fV0+ddisVWKV3OUBUc?=
 =?us-ascii?Q?mQU7Ivvo1ir1Zw9TbVyt6ka055+PA2zQ3T9qHHkzae9eQXDXI3HdMRvIjjm4?=
 =?us-ascii?Q?PwftOp4L8oNFlDslRIMDapFxf5dUtKE1bkKbi+TIap3Fh/QYUyuY6LKzhPJk?=
 =?us-ascii?Q?tsX3oC4TyqRc/IjCIUw+oY37H2oqPDd6c8hoitx1BZAL+8Up7TaJFw4vTyte?=
 =?us-ascii?Q?wIG57nf7t8BYrQUQPYUOP1bDD8VqcgUKM4v4WIwcupLkxDpf7PLn2fCqDf3H?=
 =?us-ascii?Q?H0xRqYXLx+T1DtWzwULMc/el7BKqqIvE7n+kiIbwlBxJejFqJAB1xMd0nTsa?=
 =?us-ascii?Q?oAIh8UJN3bjBa8xmLlPB8/SsiH8mIeysG7OoAfew4PFYYxs9N3x7nCqvumLH?=
 =?us-ascii?Q?irAjY/bkzCqKJLPckd5xztq08Tvs9vCUsw01QnASdNwGSt2r/T7rx0gB4Cj0?=
 =?us-ascii?Q?cETH+keBLCmGjbBYf0zKu9Td1yAPs7YkgHRBWIo1RHROMNnk14lKmch+xCvs?=
 =?us-ascii?Q?xWBbaIXpb9nIZDXsP7D/EUYuZNTI69Z6doi0LEMxTL1z3jbxyZKilXKr6Gcp?=
 =?us-ascii?Q?1LQgFw07XAV/C3dtb+mi0IIZ1k8rw+soDJWBsk85Kk9dmhi76Fqdmu8b2EE+?=
 =?us-ascii?Q?cg3LoCyjBTrtRb0JQAr7LuS5SNp+0H8=3D?=
X-Exchange-RoutingPolicyChecked: WJWwrqyMvlPZyzybciSs0sXlEWl6/niFbfcge6jFlCoTdum5HpWrp1upIjxWE3SOcv9DZwa/n1+IIbNF9fYsqE5kfUj2avzpGggInb5sOGVsPZD10zLVXQsNGtpjsXv8zeHb8pxb2EvEHqq9lRO8sQLZaXWGGxzjqj/x6hoE1GYybIRhirD2Ko7VGCr5AYDeuwwNh6UFaNS+s9ZWYo8ncqkfGLO8BeVN1HJtnht7CPdrKuaQYYvHenlnK1rjDDyjaQ3fvXgpgUdXOFJQQnx/R+vT4DgSchTkfLk98i8BiEkcljqdfAjI9OXPrCcCP/mgza/8m9ClMW4PIxRtNBDfyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3449af33-d673-4f0a-09a9-08dee26aba3c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:15.4674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRkT+UDmp6fQ92HfPK4wvGDAhPrj0fD0qo4rmWhpHEab7ldsNVfPc82NQC12Mn3lp40MPYqSFar4T1cqWopq/FU5BhrtZovoBj7ccwHet3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

intel_decode.c only uses two symbols from the IGT: intel_gen()
and intel_get_device_info(), both provided by intel_chipset.h.
The DRM_PRINTFLIKE macro used for the instr_out() format attribute is
provided by xf86drm.h.

This is a prerequisite for building intel_decode.c into a static
sub-library (lib_i915_decode) that tools can link without pulling in
the full libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/i915/intel_decode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index b78993c47..0b404ae53 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -28,8 +28,9 @@
 #include <stdbool.h>
 #include <stdarg.h>
 #include <string.h>
+#include <xf86drm.h>
 
-#include "igt.h"
+#include "intel_chipset.h"
 #include "intel_decode.h"
 
 /* Struct for tracking intel_decode state. */
-- 
2.53.0

