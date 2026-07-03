Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11501C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A684D10F82B;
	Fri,  3 Jul 2026 14:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkSR9Ftr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E526610E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088937; x=1814624937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=coE6tExVrcu/Wwh+wEaXpzLRebzvoXi05bcbkwCPeBA=;
 b=BkSR9FtrAa0cdKEu8fascG8/dWIuc27XGM7JKQNH1y7czVgxBuOOvUMz
 HPBcTAWY3PijFDHP30KNJ2YrpqBb18j9xe24F3GLsoxDq20WZLr9FwZO8
 B/ON7XSTCM6FsmcNJmIWM3xtVmbSmcZC44S2ZEpZ5IlJlQ/D0GPDW/YuL
 zoll3HlNJxcW3U4Ve+KhsKp7XtCJAdBhj1L1EUotXkDLBEmOz54aL6QBi
 DF770Mbc3ZW6ffHSGEQvNmTwsyhIMDZj3qDkhwcmdfFE2keNpl+Kw9u7G
 V8w9OBWJJyJHeldr3SrvTfp9BeUvrCRsLPFCmw1AJBuUZ7k+9eNFS2C34 w==;
X-CSE-ConnectionGUID: riNuvzk/TEKZ/sj6j/EXZQ==
X-CSE-MsgGUID: mIZ3cXqtSTyJchwn6ceTEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877912"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:57 -0700
X-CSE-ConnectionGUID: 9NBcoHTiR1K3V1R+QV9DEA==
X-CSE-MsgGUID: nSeaLAM9QN+CDkqsDUT8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019330"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:55 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9MR+DaEFDhapXhylbw1ufZ8fODq2IBWx+yumTsckXsvMa+tqaSLY5LEuOpJySeAuXQ9ILCFIDL+ASv34b9UmTOZ4tAgAGkDmmcHV9GZUURrVIMcmyypoiGbVzIj5SeTj1omtYkFfQrw3O9VXdZFKNIK4flvKuFGLqt4eC4kjUixnI5yTHSwISntXOL4S2bwI6wJfoevlUApqEfVDHwkHfXfn7dtjQPrBHKWLajbu4BwX0ivYzNPYH0TeJKF+SLec66Z51mz8Ep9MQ5wFfE9AF5brvJxD3/qa+ww1a1DmGm4uZzcla7oXVp3vivAmOsUQYfJBI00/YXV3Eq5n228Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cZQ61/KKVJ8PxFvzEyq8mlgPNrRLKqkZ/v5dqTbbtc=;
 b=wIDebf3ewqRKXGAoNONoNbIJMLceb3fIryl/dIOR1FMp2HpIwwcESOBOwXXEhlVLYYsF1sz7AE/ZVg/AEKYU0z9OFwYpOZNBXTJXXz2e1dHDmI+xA9SIbFqgzKzwbfgvLHAEd4+WQt3yCqedlK3pEeBx9X3HuiZ6oI8jxfBngBntHMAjnp7v8gROrqtZTIMjH6SSbQ9XpnJNAYymNAyb9Ww14+FU6myZZ0PsYeRsok+fm8Qy382oYnlHilr2fmD60pDwq9IWmwHmFZyDTiFopvSXmEb58s4pYmmEZDqI5sh9HSzLAdnsr6QTJH+LgQ3NzYy3DzxGOwR4Yo0EYQdyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:28:53 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:53 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 08/31] tools/intel_gpu_top: add explicit
 drm/tools-stub deps
Date: Fri, 3 Jul 2026 16:28:42 +0200
Message-ID: <c44efcd7dbdf8a33605a3240922f3c1ccea1c38c.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e58ceb0-364e-4f2f-8586-08ded90f681c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: nhmCPbwYSQ+OZJd/pLFvkOYl25V/fShiobzhP9QCGF1RcOfsd52TTBT0AeuILFNxQ0k1K2gzdwSSWNa952odeV9eTSFlZtaBgS1CoKokQ5iLCSLkEkMn04geJs+a5eXbED9jLp/D1oP8rbHYPxMoclbpcOWsTrWLAM1C8s3BX8WDNQ5fy7R1FFdTBT2lCHaVGFjNiG+cKRACcItW+ylMODg1FwJSePxjw3pN8VZanVHE1eg+qggd04EWLycUnXzth/U0Fw0RGoQaVNCERLMzgun+vMUuaVGMXvWpKPc6R3EMdAKZtJlPvqWbOJfpRmERJ9FGSRZy02IQzyU12RWMQM7Kj4b4+MhXjRwFItvgep4Qvzi5CRx0Vgz7PLBrSJUzdV4xTgw84lHrSBvPbmHw8kFJfQRyZB4AzCfStS6HgJRvjuTt3umRyKkBOe/6YtL6nr0tV8sgupHWpVBS5fW9tMMrEab+5DtXNd3ACmZRBEb5G3AGUSAPLDxBqouIhD4NTJY0yLXXxpher17NzEaD8KkhwyFWkXDFLhyMfoIMIJDlR/t//Ck6wrsNwI/LVNrD74JP21knUexIU0LyinI/waef4BKt3oi7zga6MYVnV9F0YaGuapJhAXsLLLp6cxX3r9Nr7Xd9Cl5sBKCxSp5KpYFhfaeo0Z0/XstwAHwPF0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QmwG79skImB8mXmtfbevMAeujDsm5kCuIUTcISstmQgD6BKqyGEVE+c50rUw?=
 =?us-ascii?Q?jFLR7bxiXKISC8KPDW+jUrLaZLrB/QioikGPvkp+13Jfabxb9Pilbtoc9Ka8?=
 =?us-ascii?Q?2xAfLxt3X61vBlAu7iFf8V3/fq76l5M5RF4JAlfLZI3prsjclFHslThMFUQf?=
 =?us-ascii?Q?QeavxHeWg1fcYkcpzYDnTYam+BSQnHFCiC/oN/bkpW9Vu/PKGQW17lUDYxtL?=
 =?us-ascii?Q?kNcQVADeULrBY0Dx5nt+TYGWmpf40sT/i2lC2aUQLPwnzp0kKDjLpiPhlCPa?=
 =?us-ascii?Q?IPKG9cBzWOeeZzAenrQxhHMvyZcJzoCK8TjqOLko+XNpoYnlbpjDlaFGN2Ab?=
 =?us-ascii?Q?0l28JvTdSz4UdxAlUdZzq/40nxnQOSsJfCKTp9mgTkuT/uS84UoSG5BkTjc5?=
 =?us-ascii?Q?/i9LfRwKf9u7stKwVA5+8Vv+lDyH7c7G7V+oec0Awiv3iMjOIzzXL/qlPeuQ?=
 =?us-ascii?Q?9ysqMjjv0eOocn5gEe6FMJdIAxUzbWj+hwhrDTo1EilSz9EnEkQlC0HD1RRM?=
 =?us-ascii?Q?Oaa6ZC0RjBIjzySi8m5eI44LHrggMlS1vEEQ47E1z6Yavztb68GO2LDRgF4D?=
 =?us-ascii?Q?12d/NxtyLpcyIVvs6+vgqKM4nWOFMR8M+/zVBZxNV0x05pWGjuRq+Gg7/cUl?=
 =?us-ascii?Q?264fPMDggbjVzKgZXSoR8OM4xJTIUn1+IysSap2sFvwVdtx+IS5qxKxlT7cq?=
 =?us-ascii?Q?77ocIa6VibLiIqcQFU2CCGUO/bb7Jr2PrC72V4XjTf4jrQnVNx1g/eHNqAiS?=
 =?us-ascii?Q?05pYqSpZ/ENtUp8Gpos82UJFIkgYUT8SYp2vETbwsRrHgCQ9G8pbBF+88kv4?=
 =?us-ascii?Q?SpWAmYVmqCWzkciOCCY6VBWCa/FHFd40IcPIoX40Uu5LQ74/Jj2PDzFRvMqj?=
 =?us-ascii?Q?7Cp5y5wsIuvDfe5nb9F7j1mZKhGgw063u0IrddGlweLkLgTOg4GaD1jS4s9r?=
 =?us-ascii?Q?UEOniZg74gGlJvev3/5p/B87WendCP9Cm2GsvHjJ8gvgIm9sQGetaJHJEwes?=
 =?us-ascii?Q?xKZGuTc28cF0dxR+AKdLbTxC1kE8uIFuaxZsiBx1+6aJTs4/ck/mHI/jfLUI?=
 =?us-ascii?Q?j8b5/VnQbG+sYBx6TON1PcYe7b2m6Yj+9MFe8OasmJVrHsjWxu0DLFNominr?=
 =?us-ascii?Q?cCct+lG+X79XtbgBsrBL6wVkvEpbQoYuMQhyc4d3mh2hvtySM9IuK2tPvxVs?=
 =?us-ascii?Q?b8x0fJlG/tYSks+nrlTJTXZF4Ue5bmQXfk7vMQE9cg1HDMWT/EisZlslRDD7?=
 =?us-ascii?Q?ra4qAGbbiBzQ/h4OVpNObINAlbO3IQQciB9IoM5yzYc3+hcZV9ZnWR8Nzbq0?=
 =?us-ascii?Q?1EaH+KhUtS3Gcj7KRBXgXaArKRk9CFZI4ls0WU3snMLD8g2f9JYlFpvg3ZkO?=
 =?us-ascii?Q?lqXJqID1UD0xB2zjNzArC9Oj34ejdokYIrx5rfWDORjdEVYBOzY7yiQ9SLJh?=
 =?us-ascii?Q?D26LVs8+KGOz15YTAVwi9Tm2biHk97bzP2nBadZYhe4kLBaQ8/txsuAug+24?=
 =?us-ascii?Q?7eiKw6f+0FHA/9iTmbylQt7CVR6Go0Z3baOpVz8oq+VUCvgy4+Kdc3+/z447?=
 =?us-ascii?Q?x6b9rMy3CtAQzI6e+nxhQwzr4v0cJyq1PFGBuoWJJc7NzJGHDZhh+DWIr7UB?=
 =?us-ascii?Q?s10e6IRqM70bXgoQo1bLgibGbx8xuf/kmYF1E4NwvDafqACF6N8tkSvtOYUR?=
 =?us-ascii?Q?qLj9PpyEuRgxsLN9H0cbM6NsVCpXJGwLxqOgh9JXXJpZUUmUjkhfb8zXKVtN?=
 =?us-ascii?Q?v4kP3cr0vnYuIHk7dZj7NR+ZaV66sh8=3D?=
X-Exchange-RoutingPolicyChecked: Q0FIDzX0skIqM1GIMe05oRHURWAtQNduE4SJY7sKdw28vzW+s1mIz5xUi851Q8kHnMm0lroF5q14FZzJWK9vbybDQ97Z5HR5VoECyUTqWbX9B3P99OwAGzDt7fnwh/UKTbXBbASKWPflwVksYkr+EApahGxLPtvXiRLpOSCZkoILG/VTjhXtxUxk9J1UyAbFfgJ05GGc7RZliKVrDRLfBumHa4bu52GVZGE24LEUcWigUBedNGXFGELdnLWbDyX9GTkN1N0t4kXkcoyGkOT441qKbXUcd8quB/IjYTtqmfA8iUmbmBGWSfZYqND23JBB6jqclbjrRYSNXmutaSoDOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e58ceb0-364e-4f2f-8586-08ded90f681c
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:53.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQEkLOhXzDMzr+O17YKlEG2M4UPMsJ4BruSNRotp9VqpHRODF+BXtpDb8WBcNoCrScXvQI8yqqLfRE1BVPnjN/h1K/sdDe7nG31s//M961A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

Meson does not automatically propagate static library dependencies
to executables via link_with.  lib_igt_device_scan internally links
lib_igt_drm_stub and lib_igt_tools_stub but does not reexport them
through its declare_dependency.  As a result intel_gpu_top must list
them explicitly, otherwise the linker cannot resolve symbols such as
is_i915_device and igt_log at final link time.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 4c67dde4f..53aa31056 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -105,7 +105,8 @@ install_subdir('registers', install_dir : datadir)
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
+	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
+	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.53.0

