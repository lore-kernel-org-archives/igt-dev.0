Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AE8C5518F
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 10:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C02610E66A;
	Tue,  4 Aug 2026 10:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGqoGYGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB910E9AD
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785839322; x=1817375322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vJ3EcC6FqBkleEuu3f0DrkGiMI3wQclgr7NNPSESR5I=;
 b=TGqoGYGBBikT0d8ckaIGWStJ1mNbK0djoeDXnz/kINPBn9TvQuVr80gj
 EOgIVw0wlFpXa4LCo2yGhyYawlxQdVvPZ1eEOQiBzB1wnhH/k/A3fyFFj
 pqYf53JRD3WwbRx9eBkxQa5IqGfIxH7o5IfiMD4Tc8gFY4lCaqYK5iiTw
 SBCPh4f6FpY837/XPihFMSNdchGckidN+LRtVlbpnmhnVYLpZ88QIYD4C
 Ua7eMRFgmlk7yH58HPtj6XXmCy3kao5iv0w8LulkhrH61txTiTyzpUX/r
 +bEnZMk7KOn1OwEe5Jwxb4aNg5zBKFB87BGVnOw0KfHB6f9Ot4rvmHCL8 Q==;
X-CSE-ConnectionGUID: McjV2kXeSvaY64QRgy/vIw==
X-CSE-MsgGUID: 3CXlHVNUQd6sbfdcfAoGNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86156957"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86156957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:28:42 -0700
X-CSE-ConnectionGUID: tXwDUgXqScaVQu8go5cPDg==
X-CSE-MsgGUID: Ye+3XkCYT9aLt4iPZeoxMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260229546"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 03:28:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 03:28:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 03:28:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 03:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7TxvbOpMhmhYz+j2NJVW+d9g1a+SP/dMzQtNkMqh5epCquKkGASdsSfYBSgznMBSZHSgZ3VGsAhcqg+o4Yb1T6leYxOMyneMtpbE7GMzWpyLfDmzTSgRxwSFOePNxoNHEe0ND0wW0izPzfGQLTWkI3mSsFDeuW1kiBCvbop2ld62D6sh4ik4ko2QgqeqtsnpQRk6I/0YGdEFPnjky8tpGVSfBBFiU4R0pMhy4CVjEYBSd5pQvhtwK5R7tnaeN0uvYqMpaNHnM8FV9Lv9oQpx6oxLTDHXBnZ5pAWcXOys7SbWcUfQ6TZoHw5kKU3DgTqIyQzd/8da0aMTFVFYZq48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRItiPyG64nW/t/vuPTvC31czXOgqJivFijm70Gs/q4=;
 b=RbGmqbb9PB2zMpFzzoXlWdb0UzaPXOGRHs0rscEKT6GcMrSko+gZvBxJilU1X0BMHnhJj7JujP3g2cqijbsdEeXx55Bkxk3d6rLk5KT9MCd3JaR/ZgF0uHukL2wy3w153Dq1F1PIPrhylM1dmJTR/y7/MTdUz8ppPudEbdA9EQJfZFWxkZynZ+p7L0z4dTcDu4cDuJI6MMmyh5/voP/oc1z2uEhqj/J1MDfhjj7dnNAC+dJ6o2xHfByM0tg6G0Vm/ldhtEZh3g3oYhO4y1Kky8L6ca9fMiZ3n1JqHlla8b+tqYcZgfp5ISJp04lud7RUegXU9QNTVa5HBK6ZQ+WmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA4PR11MB9230.namprd11.prod.outlook.com (2603:10b6:208:567::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 10:28:39 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.015; Tue, 4 Aug 2026
 10:28:39 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v5 2/2] tools/lsgpu: link with minimal sub-libraries
Date: Tue, 4 Aug 2026 12:29:49 +0200
Message-ID: <20260804102950.20892-3-sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
References: <20260804102950.20892-1-sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::35) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA4PR11MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: ab39d760-ebcf-44bb-1cd3-08def21325f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VeocUhZRGWcbCkJLMJAoQM2E5pK+rF0iyPkLre4iw4pK871AOCvGAzvVZeuG7tVeCMIv7o5Wq0VL0CrJ7JIVodxn/TJEFhiH4eOozZTZtJCOvH64AbFa2gICaa3rCQQrpVSpXu1p5wm08JJgXwO24kw6nghwgZ33Jx7NDMIM86CKFgObll3EMAPYOHR2+4P13w2R0cLgPM2X+mbgnIa6qN1Ppo/euicDSRuo9gwEOuewhBdg5m9D9NH1Tg+OUiyhXeljh5d1m50vEwIAVGE6Bs80y/sHb5jQ65XAOMho30vQBfnR2p+TLtiQyqwaRovj3Swp7++vtzGOrPZ2T15avOSR1iOnXo0OFEhGkLBnJpZY6lnLGygWRr7ZIpqGf6Kb8+F3Fmp8iGAZk+R/aeb6fM3aHCFSNHpt8wDWqGZFV+uCI3Lm+9BEpyvNhoMrUqb64vUux5RVdp1yKHw0HjLMfMaq78ReYcDCGrsunnKVUYjrbEQxQJVQtJnZTpaKzCIAOGbfwWZ7ygLQ6NbdTsAejkz8MDB2UYFwWfyNDKxH4KbnY4e01d6gd+MxwkmHIOGU2ml8hY3Vw5EQ8Dicy3C6fwYPDDKDYk8roXwSCfAFmfev+SW+7AuiMYHoNM92bognuopUq25l+oylkzSLmBG2aiUBOhmXGgEbCJqhZVYwysU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FzdQxBrrMQJsGOZMx2Y32lHMFy+U2fc7k9wgwhbl+s75GryxGaA4c0pj/prl?=
 =?us-ascii?Q?QoeP6ERkWJXzCtNfzfKdPTHpH416ig0Fqasfbo7N1DW9tdqgruBwXqxJ+u0b?=
 =?us-ascii?Q?c2uqE9XaYMchmAzP3KMgvuFFTKsHxW4nfaX88pFqXikmkQ7HfpyD0amlZLez?=
 =?us-ascii?Q?InoENrUo3dx9j3PLF6fFdTrLHVAssiqLSj0EcyBzexgVbQg6pwqzAD9z/UPk?=
 =?us-ascii?Q?TjtO26FmSVC273LgVs0181nPQOM1yV8FvMgD6httudD+nkDBA/36sojfsW7p?=
 =?us-ascii?Q?tq8uNLok98/t1PSoP/3qtlSiLAdc4WgWDXJePNmmcvSIpHwabhlC3Wd2yB5z?=
 =?us-ascii?Q?xn8KEz1p9wb0f4LSQTfaZIHbqkb9ekQJbZLwNNldJh6Oy+rFKgw/CRse1RQs?=
 =?us-ascii?Q?pojKkz0WFF5NZQHmcTWNn9Dd6Z64Isq7IxPgRFMGb+XXpbHOWrqa72opbH1/?=
 =?us-ascii?Q?wy4EltUm01B6lSwKExpmeZ2xgaMY6u1SduRmCRk1XgOKptQT8TVYh1e8zcOS?=
 =?us-ascii?Q?P1k9ELlj4MultmGEmf8PE167IxfKVHThjIwcW54tbvPxg4WjlE0h6BJvrMXP?=
 =?us-ascii?Q?25dFHpKVM5VQX33oL/niD2viHQ5hawXrE2x25sGeJ4dkEY6Wwt/Dx7UyP4AR?=
 =?us-ascii?Q?dVGzVfm12Ess2jY/S3Rj9/wQDa5//SDmtGQp86uCWbbPxa82CklN5n0chRNM?=
 =?us-ascii?Q?JspPn/lHLE05JpJEMSbptNnDR1DZXAs3mIbDv4LdQwa/tqoa5NT1sJxwINsd?=
 =?us-ascii?Q?M+AAUJ7C9YJRhu+CqqsgjXDp1vNfZREjgbcAOTQCYpslhvNngvEWkFs5kZil?=
 =?us-ascii?Q?4+CNVN/2KdsULWzI35Dv2erViZS9ilzVEWmKAsU4QATbOIElx5YVWjK2I4Vd?=
 =?us-ascii?Q?aXNVljpamsuuNI7NROpCQXto//qtIG9mFDi5kbeZr7C8QAWNQetrCxTdEI9z?=
 =?us-ascii?Q?IVfhblfyU7vSACRMs9PaEMkfGFBYKPLypyNteVpJMizjh3xdkCRbKC7MUakq?=
 =?us-ascii?Q?8pc3kQtqnkf1I1VRJSUx0vQZpWyyYT4MNC0JCNunMnKGe4cD0bPjqyJx8wmk?=
 =?us-ascii?Q?7fERb9l+mLx1PC/AktfgddmMqNbRhujMKUy/34fOovJV3BBuykKKBMoBwhSh?=
 =?us-ascii?Q?RW2RT6yyK2FTaH2lVzsYjCg30W3zwbKMu9UKy4KI6020BpdA/SURkTnNwYJZ?=
 =?us-ascii?Q?arFw5nxdzVstlFr1qP5SSOjy/cL/H+SazdKPse4eeaCTYec4trmBk+HxCL9Z?=
 =?us-ascii?Q?yYC5srJzkxvWPgp5HwHx6pRKVQqjzMP2ok/nfEmdG7puTAPSPWVcYeCzv1bN?=
 =?us-ascii?Q?UubHn64vQSlBs6X1oGxpBJBYY6HbGXtL7DBCoKovBmyKUMoPJ9qpefBFeT2t?=
 =?us-ascii?Q?TtJfubeP1b57Ov+f3bI+SNWR3YggEN1BNSBOQ08C+k5EF6BA7W/fnTFHzUPJ?=
 =?us-ascii?Q?LiFr9u/HMiijtmrpY7CIK1ACDZwBAF+LPVIDqPY2w4V1uy6YbgcLb/DQVq4Z?=
 =?us-ascii?Q?eSHCJTnKVtt52EdJLHmd2m56ztm36j+s4ChGfuCOYoU+0Woj+39pnSEXdOpt?=
 =?us-ascii?Q?iff61COVIQUwDyXx+/0D1/PFtp5HjOyrfW81B6aw4TzuhPY2SZFh6wAiAJ68?=
 =?us-ascii?Q?i9/JFtAOOU9epwd136x5SnzyeezPXin89jTyxLMIdd3MUr5tlXNzpxOYbbo+?=
 =?us-ascii?Q?DbitlXEXAw6xe4xmNTX6JfSfPcxMzpixy8onE5ODY+1XylXEjhNzf0aV8ijz?=
 =?us-ascii?Q?OPGQ9cq86aEWnPvK7VtKMN7Mw0hcJ7M=3D?=
X-Exchange-RoutingPolicyChecked: ExM1yCJk4xACL7V4CUsmNGEjdjplJB0srEUAAxi1W6mVFlgKxOPZ5STc2dD1suIMVvV/1Jywd9/6lrb7UtqyaOOFQFLT86VN04g4udAllQRwbNHVQw6i/ou986tvGuQ0NaEBAX4MdKwiNDxF1uSjWvy8JDU9xiJFkL5zXmsVQWveJ9q5dapzjUOFQNqSAiX6KMhWpq2ry8vD8SIO4qBudP0W7XwyO20+GEPC/0d+m6lYuY5d563wF5fCqF0WtbQ9uITpLtR8x2OTBbESPh7qLoEqIOCfzgqKsspfgJI0SRG5CzUgz9On+mb+ID7UL/KpwiJnmQj3PgQn+Kmh5kXVHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab39d760-ebcf-44bb-1cd3-08def21325f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:28:39.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ycZNPSl73PKoGhzVyf8buDfEsPZx8sW71pikN5IV95Kes/e0LAf5JzC+rpVJw2tn14Q8WznYOTQaHecfms/VySrxE8Yl3isF8rkhHuHrao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9230
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

lsgpu only needs device enumeration and the lightweight tool stubs.
Replace #include "igt.h" with the minimal header set and stop linking
against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   8  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/lsgpu.c     | 2 +-
 tools/meson.build | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 3f8444187..b804cc582 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -34,7 +34,7 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_device_scan.h"
 #include "igt_rc.h"
 
diff --git a/tools/meson.build b/tools/meson.build
index 6e694164f..fbc6c0a00 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -27,7 +27,6 @@ tools_progs = [
 	'intel_tiling_detect',
 	'intel_gem_info',
 	'dpcd_reg',
-	'lsgpu',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
@@ -172,6 +171,12 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
 
 install_subdir('registers', install_dir : datadir)
 
+executable('lsgpu', 'lsgpu.c',
+	   dependencies : [lib_igt_device_scan, lib_igt_tools_stub,
+	                    lib_igt_drm_stub, glib, libudev, libpci],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-- 
2.53.0

