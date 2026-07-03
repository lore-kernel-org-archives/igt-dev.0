Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D02C44500
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594B110E60D;
	Fri,  3 Jul 2026 14:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hItTAg7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D864E10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088986; x=1814624986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Pd4CGNNhzPAKVNRrVDYCvPS4BlmBJT9B7PzorjFkbOE=;
 b=hItTAg7ufQh/sA9BJeTQFPVmRXX9iy+Xv3Z9XG1z1bxoVxtb4/i/Gfbg
 FkKmvL/jV2c8Qb1H+Rd7yDYIjwQmBmf9s7b8x32YqeKIR6n7qlyFLBrKo
 n8JJHPRvPzb0Vo+znTi6G1W7WN1AEtqmULIBD7J8FHkuFopbgJzJamivw
 c+dHP3XBjXr3y6WPbiEwi5bhgwX7MvAC8Lcq1SBFOr/Px+SWiYFcUvDX8
 alSdd35cZ/o/TJoxBVf/zXXHPVDASA8mzkTf9np/6+Ty2jEDpB7x+1gcV
 HfMr9KhlAMmGcSRVntCvby2oRDI7xFmCg8XKRe80r8U+Oa+ocsU8tnQ3H Q==;
X-CSE-ConnectionGUID: K6PZ20lpSG2zjfnKQRLqag==
X-CSE-MsgGUID: DhyGMdijT9OmJUBa4Zu3+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877949"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:46 -0700
X-CSE-ConnectionGUID: ylabaFj2SryiVxjrdQxaLQ==
X-CSE-MsgGUID: 51CmNgAmSwCeGmFfUgQO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019631"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:45 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJtVNzjObOzYHnWWv+IsIjHgjB0jrWLc10rxrCNLgatoLRKAObObw3vNZirXSbIfRajAwdwXsHZ8WNPUMQU/8n3eZdCA3pLhgJQxIeq0OFCAE+VmdRCeC82U6COi1pnITwyS8HqsM2Kuk4pLQBheaGZU7bE/nNEc75wxpAojxAgVPUhK23y66EEpgBRhR2JQrsTFXgSKfnmjtlFBFZRjQ0y2gGMfA612Dkeqyx83puvGIVpsK3Da2CHyy3jBtpQB58Rn5sr9KmMyNeuQbUOJw0OvJxbLwqHh88TUOqRwOvNvGNtQl79XxBhysuIfJGMLtcMAAH7qMUZJiluSfyG2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTNyelR+yaNQ4E9qS0d2GLtUCxnwDjupY0L6quB0tk4=;
 b=wqCOVjygmsbuG+4CQXkePZqp37qGH6GGvYWGH+zAdfFuh++/IkIJu41SL7m1Tiys0NDaaiEM7YsvaoYAeG8r5E4hoCX/LMNdwpmPoNx5RO0Mtxb8J6PaLhejp5OL6svUO5jQUC3jU7SV3cn8QTOctFm0Y1ypTH6HmANzqRn4dazLuQ3z51O+49YPT3++Yqlifgij4erI6vKdtEL7bha6J4FlDR0arsDwYq8EK9QZAUVek+Dm/H7Uz8Dg13s2NHB3eKHZjUpJSREvgugrqA2IgewXoceA84Mm3mIqEWC+GuvIsVn+er5mEHVpbahKHm3jNrJtv53Ph1k1YWH+z8MhKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:29:41 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:40 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 31/31] tools/lsgpu: link with minimal sub-libraries
Date: Fri, 3 Jul 2026 16:29:05 +0200
Message-ID: <7eb931dd2fbb99b980e94fd52fff258fb82075f0.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5cc89450-064b-49ef-9ac0-08ded90f84b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: +IjowLm+i419p7QG+e57WiVKBylzhJYJezHEjmYOndoygir4GMTIJTM3FyjhFfqZ1xZtxCxR6DlKQWFgwXtB+dFf7aEV4I1XqaGJLDjhUwkFp8HWMGpVIcrf2u7mJNXWHnYBErtwEWO9O2K4XnR6v615JqYGLLba02MlOION9j3P/NS4Eacscig+GASV0xd0d3eXC9o4GmyMFt1W8YwHPAREuKNRx2b7xEmDHuc3Az2vC0O+J/2UquUjQUWmreLhxenaZ7CD6OdjazijK4JT39l7WZqfyuqfxIFOWahke94emKckKUn3kONMeyzVdL4sGlsa6RCBt/dya15nbHfE85FQGRa9BDlBw8LzcpyoIPQBccK1/wekJguxXD8Y9oJd+58cbOayQOYlSVfow1yDFSm1BcY/8icPiIVlJ/oJsrFgXhhJEZuKPiOOQ0YraPA1lgcSKbclbMuCn8n0Hd9RItE0sJINcoUtjdjKpVOkSVk682LcMT8axG3i8Uio0pNZU0d1mgni/qUekKk8yZlbSJCUMElPE3EfZ0nAesEonqJkn4ldwHv1a5JDiFIWpyTvZE6+gnN39VYh8m1wX8GY11UBUYqCX12hJXWce5yd9rH54KIRPvx/O9GoKJXHiRhbrziLwqBuDHGk2kVcY4GiCDM9t/jtQi4946EYcAHUIR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8u+nkB0haEkn3mSgrflrj32RcXAPYrMHHlbhE8xb+7qRJtPQwxu8c4cWgmp?=
 =?us-ascii?Q?RhRsQpf/gcR1C96w6GLRT9MuYsLFihQy9Bqhv50ofQYWbOxFxVOfOQER17+M?=
 =?us-ascii?Q?+kkw9aQjFTNgwteZcm91iT3CM2QWeMhIr8s0u3ALvdLTolin4CLn/XewbADV?=
 =?us-ascii?Q?SnAVOoTzvmQL3mSoob7MEC74wYzzKW0ISt3NrLXO5zgSgb0N97ZwhJLTxNOW?=
 =?us-ascii?Q?89OSz3UJ/GrobZGCLR5Bm6rfAyQoLqbjigwwKpB8d98rhNSNaHel+9basWc3?=
 =?us-ascii?Q?RcuiIQ4+52Hek6812wAf3T/vQg1Y5jfhTIgJ0PjSUY90PPgBrhzg13Pkz7lx?=
 =?us-ascii?Q?VWtnEdQYSzC8qLxeeSw03sp4mdwmVGko29edWs1L/DTrK23/3L4htSQns6mY?=
 =?us-ascii?Q?PJdnIURntkXwNdXIxERlQWjNjIishiEX3s0l/yu7mXVKva1TEo0bAy3sT7rd?=
 =?us-ascii?Q?7Ile4/gWdx9n2lKaDgTC0xrGbqmbGKNqUX/tnSuCLx+Sy9JUbXhdqQ9N44d7?=
 =?us-ascii?Q?kJE8JBqkKmW8iyyyPumk25qKfYWXKsbGb7de/BY/qRqE4tkiZw9dF4pfWXiU?=
 =?us-ascii?Q?BSLqw9qV0K7cdri3GZCNnuB3OJtu4PI0K/qdwj/6DxVgDsY0a+Ob34P4FhMl?=
 =?us-ascii?Q?kHGrNMU9dX7Qq0rznuzP8nilrneVsJMVLHH5jsGq8KjMl3Tfujb8w9lFnYet?=
 =?us-ascii?Q?PthuL5QFKmNydeUS+vRssDP2Urg6o6iBcdwjrNbrsniIKDLO4u80wHi8ZM2a?=
 =?us-ascii?Q?jOhrD2Ne+aRJRT9qYvkL8Di195jBNTMJXEOUzncyay+6yWzL6KqXzcqdCvTA?=
 =?us-ascii?Q?20AHJbsuZok4BxNwTsaC6VAWYfMQRCF3ayBQ9bzKaqDWLagKmKi3m4t+zAaj?=
 =?us-ascii?Q?rSj02tPe7HASvE9tcnVvtj5j0X1FOpBdEUe3xX6qFY2Cy67LA9YzPtGeOx4C?=
 =?us-ascii?Q?VOgEhay6+80gOWJoxdRJgTgh4+R211XUiWKekXZR/3koK2snqmkaBca1kbm1?=
 =?us-ascii?Q?M2B60Q6IpF4hNGIo2S/aOWHF/R8Wp8q7PXcFjCIDUK7j82gZCHjN+K5s2c3o?=
 =?us-ascii?Q?Myul3o6bvH3Nfrb70ebXYX+3hNrhgiw0tfW094DFAA2sO3TbzVAVQITRWGq3?=
 =?us-ascii?Q?59Hsi+7Whu3zrUNCHn1Cvfr6Dc9IkPvUT9rXbyRnmDvHm7ke75CKq9wDAWXu?=
 =?us-ascii?Q?wH/5jgLMErD7KFB4liXssfDtiGSPVUnO8hfD1Vp771nil0wWaL/BpJ1ztE+p?=
 =?us-ascii?Q?AlT6m0VujZU9/uX6ej9gsP/t4EL96QfsRVOVWT+sjd2OQbu5tHnnlvjkOArv?=
 =?us-ascii?Q?3FJLHCX+UkRBCdGeU/lPBp0zd3fLw82FsysdAMHQ6SriSeTA9djWK7A4uARq?=
 =?us-ascii?Q?Dl8pSYFK9GJ70CvsAipMZQW2FU1QEWyDC+p+i17qRi+FLc+2cXl9ThAYdePf?=
 =?us-ascii?Q?3waXAAcd8+xtw5UH8Ns6TmzThS0YgDCvrv43sWOHYHgAQExS5O+sU4HIMGxF?=
 =?us-ascii?Q?1MaW8goKvNUsRpf95ZtZwfBCeOknBFx826vs5y2WcPL5eKubPW3zoOezrgSv?=
 =?us-ascii?Q?mqPV/vo/Jk6dKhY8giTYoCuOV7dLm3WzUPPv/sXY6xCyiU5vQXXt3t+4BFFd?=
 =?us-ascii?Q?pWe7aYEcMvxn/cVkB50QJE/bB0lB8pADVF+UjXTRcLgvIapI2iCHiEpbeUCv?=
 =?us-ascii?Q?KQxRHMkM847e6CrWlY8pMaVV4Iw3dy8tQlVoAdrmqwKW2m/w7VCeH4MPfKs0?=
 =?us-ascii?Q?V89+gCYpVGzykXz4sfQKgEz2A0mmhDM=3D?=
X-Exchange-RoutingPolicyChecked: GKeVYNK6bkTuQVlWbChTuflLU2XZn9wZdSPoVlz5xGExIdEGG0n9NmPgCY9maTZosllF9RdwWnPrhaM56r2iW72xGixsICU7lpDRb/NCMi0WwbYBc4ta5ozzSvlV0sa74VjxSdbDNG2k0JyCrNG+WmrU+GCPyrCK1+GP+nxrYTbGjVbFF27to3gYSF2coizfHo8C/XjPDekFSo2lEUKqnB0EoMH07tXEsyR7k+bzwGbzrRuN6ZSO691ScOf/rCwQ3vS+MJsEy/8etMb9NUED2c6Oq9hn5BrOQc5bG4ykJ7CS16BDk/bg2zIml6JP9nGUFU9TOPphCrW3vJeogTUtZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc89450-064b-49ef-9ac0-08ded90f84b4
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:40.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: depWfjMZBnKkV+j1QtRyTSfqxiyqS+UfX6FQgm/G7vSXyVf1V4N2eKaZsLgt2EAhTmdyX5vipany+7hM27HcrmfVjO+zgpONXbIdzzgzAjk=
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

lsgpu only needs device enumeration and the lightweight tool stubs.
Replace #include "igt.h" with the minimal header set and stop linking
against libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   8  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/lsgpu.c     | 2 +-
 tools/meson.build | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 935371dea..7d6b70b9b 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -34,7 +34,7 @@
 #include <signal.h>
 #include <sys/ioctl.h>
 
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_device_scan.h"
 
 /**
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

