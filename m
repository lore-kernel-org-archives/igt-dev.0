Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50CFCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FE710EE25;
	Wed, 24 Jun 2026 08:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="js4Txe5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B3810EE15
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290896; x=1813826896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aNxkbA8Y8v/F+kW7WckBQhfxaSHX8EnNFYaeHFg8ZWY=;
 b=js4Txe5czwTxD+H3gm86cIZ3cDPIkIXNDAS4kY4/8wxFnEotMfiDsqWO
 WuYwRhj/54rn/fnJz9Qn5zCnBc/d+LGxQKZxiBBsrY0C1Mw0xICcGxatQ
 bQOOKS7sNVA7KPU8ojEE+q0uav5/Jydk/1ERy0+tc8OcuOnvYA1s3BSBF
 V8ikNU5CPZLtwDRGO0U5ZVWT3i+D2aqGx/VZC64G+aqRQAwF07ByKCjX0
 UW2OqZwiQ1Ic2iZJXA1EXrfcqxIEK38rcjToHeF5u4bd4S/F/Yz9UHsIF
 /rNigxCsmF7AucI0QP12Gse+8fsbo+OmRl8JATYkehieBfhH6wHL54yfb g==;
X-CSE-ConnectionGUID: 9rmxj9n9SOW0FRJ0z4uhDQ==
X-CSE-MsgGUID: 9rrbXMBDQheUm2Mv6DLUfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93405077"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93405077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:16 -0700
X-CSE-ConnectionGUID: 8+kx7tNlT5udrsMkeAxilg==
X-CSE-MsgGUID: QlAGCnWsTmKw7Lag+auLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="287900091"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:15 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zn6jziarOHaF3cYvCFgAVNf1NAnMtcW62XoLj+SOwRwhX8pETWpEEwRIwmhFPbv21n4FkFluY2czym5GyqQJlt2Rr0iOx4UONc1hXBxKam0OiJO17d7WeP/AB6p8aOOZDkayfg3ATkuBYtFjzSX7/JdZHdWxSk/14detY3weR6YCHWvCTOUCAiBm7Vey2cXU5ChZkdETW8TjNNwRQJmE9DekobeVq2FO7XO6c7ZNezbf28fLR+FuLLQmZiHv1B3KZ3id+xtT0+DsSbWMjdMYkP4fiTo/rX1PIPb6x+00Ar/2MpLGrRtpvKnE1Geo73CsKMjKX2bYJvYh/usjgdNLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5+l1/Q6ZTXnXOXWs8SFglYPyCiA3fAio6ogG6S0b/0=;
 b=MDP7x+m5KEghCEGUvfYOe2ipJxIGxRY+GRJRSAlJbqNqrdzXLiXW8uR48srbLbYx+xJL7FqTa0h1V+lJPCUt2NefnILydYqpe8LvCuJAwueMyFWtET8BrinlKKFI1BHwpCooioC35hXQiJeAEqr1HqcYwh6/KqaqZsRczqwG+G31YxcMdZ6FD9WwnTnxLiMSTWLB+ioZEEHmH8hwT8J5AA1uzMyeUcU9uuJBrlpD/TeU4VfXYZQSNDJ8feOVwlH81clN0e0M5xpyF9pk0UvveScJ+rSGz8gtOBHGqGpEOhVEu8aVJnNXBOdlf7TZreq8ZFpMhOKFrBflxwPataG58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:09 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:09 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 22/25] tools: intel_watermark: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:29 +0200
Message-ID: <2b4fbc736e627a52bd4f9a823322cb4c9b88c03a.1782288071.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782288071.git.sebastian.brzezinka@intel.com>
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 53279c79-04c7-4304-50bb-08ded1cd50fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UyyP311D88/gnGtvW8uooL9hvKiP57VNNCZO6WYAAdjaE0r1DSS3IglBCNia7uf8K5GvYV4EUbc0sYau5Wok6ZZyOECncC/xw7j7fk0O5a68VlS2b6f1+a4D+UFB3RH1HRgNIDFI66JtVo3QX5ta2EulmYRwT+8OWlO6SNRZvOCAHHSNhCd3AiLoH1xmLLboj836gkahVljLbBQQDr2g2BMP/jnwbwIVqZqdGT6pG0aRZayZAsKsfE93hyQcHoQj5kUUj95BydWwlFa+kW8nveXwjp23Vu/UnH3l2l27ERkv/eZH3d76WrIM0n8/58VjRG8ilAsiO7sMCA6D7reGPf79quxBP4G98L9CAR0gxcvN+fJAZ8P4WyUnPN9ZKk9V2nUiGoe3abPiHJcQjYiltc6qsbM1ZUYZS++AeOPyCuxVAjqviILOqcLTIE2DvvMGo4YcOJicXAMgGrR95vtkS84gM6mg8C2slwd5MPbfznNEU2iB6w6MXXDYAtONXmhH7esMuB8ci1dp9yphiG8oFzvFKV0VoqnTR7+G7owUy0887a2wwtDiezGO8FxwsYbmsXeVcIrd5o23MEMn1RgGTts8DsI6myHklyjiyn0y3A3JG7a/iVeD4fy8/c+6rIhhQMHZzWLxonOJCE0voV9uQVZbmgJp4jAm+q2otQ4RoGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3wnd8D7irVE8+XZZEYLYdmeVucbUZN4TUyj/srugf6pdTE/V/jyk0iPHltla?=
 =?us-ascii?Q?4YPoAysh1KFDVvwi7+s37XWSMiMwrnlD6acS+/EJVPocLpshNbnGWttefVPY?=
 =?us-ascii?Q?bk66odFiqsBabSG8BGmAh3M1GUCRkuyotrJ7/0Cx81f0OL4X21xaCDmjRlQc?=
 =?us-ascii?Q?UDsdQ0Rs7sM0XF0JVExRjJymQfPDNmZ4M/gjghtzhi1i/cXEOcCeks7MZbMI?=
 =?us-ascii?Q?rvmfgRS7PdL0OoMlyWGACBSIt5ckkosfSipmngF6uQktudk8WlmIML0mPGw6?=
 =?us-ascii?Q?4lWuLTqm2hD24l+f+L9NgJU31VSrJKoJ9r9bX//TSX8WtvNLYSLJwIMZKtsh?=
 =?us-ascii?Q?St/BTx6Rs4Fdew49e36Uia8CBYtLlEN/hkD+AKZndETeGsBFhuIaI6jkZ2BJ?=
 =?us-ascii?Q?mV+QfuyrZq8nfeUly0i6tI0WnUVlRfDSShlW8uSIcz/eY8gd/eI1djkdSXpF?=
 =?us-ascii?Q?p6ZHlzOq/M2BWvEqwuolQ/hdekXhOBNSWXXEvmDD6SbO+inIIB9vFPYHOiyL?=
 =?us-ascii?Q?VLMT5SdB84AgEMCFEIGLWBL+sUim6H4Y2tQnlyBjgh6ejdFjaIuD85QpkFat?=
 =?us-ascii?Q?qQnYiLXyX7ARNg7yfWzbE18SSvEyAIh/EseB7bwVJ5SRLmQXYSCCAR4hR2U1?=
 =?us-ascii?Q?NkFIX9vd6Zm/YJILYubTEFN2+xD54SKyCcZcUJHEtv6wiU43BsR0Fs4Zm7Ui?=
 =?us-ascii?Q?DnkYkjuQCNx+liFfToOcpkupjwmCfZM8PfN3CsIcDiLQzBvdevtSg4QwJyCf?=
 =?us-ascii?Q?NnIONMmKff/8hHZLb+zAW5CC6fp2yg1iXvCMYD2R/vPX+3U2vA0THdAaM5kJ?=
 =?us-ascii?Q?UA1Rdvve78me7LcILwGnaCxNsOFmZeqt6olJQ156LGXfPrlLv8vwP1OHH3cu?=
 =?us-ascii?Q?nWZNM6oXfV3qxcWkW/hxOTDCtDYCILi/14dxrRs8QgU2MH/587GUBnEUv++L?=
 =?us-ascii?Q?T40QIKdWaGmJ5If70s3Rvz6h4gBtIbm4mCzve2leU9vIYNI/YMRNc3PqoWa4?=
 =?us-ascii?Q?PURJvcjbxHggwaXQdT97p4Lh1gbNJ/4/IsA+sZlOCUqSUR4mQcqbaAI7obA7?=
 =?us-ascii?Q?VsqmCpsg3quOQg2wNYxtPstCNec7Odxq2TFVEiS4QZDCLC438pYySITvZKx7?=
 =?us-ascii?Q?8iZaMWbSLYcv3FgluGQN7yrljYZT5POFwGaphjaVOvIKz3Rs0pvgSa7suoFQ?=
 =?us-ascii?Q?00lQq96Ni2URM2U3msFQ9iMA+WgKUVIGvdJFb2OEn3qTJPXmpMtMMstA/6OZ?=
 =?us-ascii?Q?vqKCW5cfxOo4USywuXJ1KnQ3lrPJyoatEYDabzj+FMNApUo5ap9FPx+l6EnI?=
 =?us-ascii?Q?xPrhZWIA+81nQ8HbOdGSyPWJki8YSuf2vg6Tc/2Ov3kD+0+YuoDnDO6B9qON?=
 =?us-ascii?Q?bIXD/NTpcM8//OJX5yPqtNdda0R+hrka4OJ0P5RppySvWizOoPvZUD2fBqdt?=
 =?us-ascii?Q?xqaxf3Fi5dv6BuiZE6ycCwVZ8y5kI2if+0ZxD4YDlQyxmeAYBwwAWLPOMP6D?=
 =?us-ascii?Q?17N6VwEeiAZddSoXu8pgFjllu9yCWDR3UwP0VEJi8Ec/3SLJOkcwgvliICht?=
 =?us-ascii?Q?qXZUpPoa3QjTl5/wNSmVJACnOmcYP8a2lZE34yM6IRQwC7RQsLhWFG6b9V2a?=
 =?us-ascii?Q?DJBk0MB33yD7cVr9pFGg3hGVaSg3jmSq4fGhR6AnLQKDep7lJipd8K74tdsq?=
 =?us-ascii?Q?/3OlnsA1QJXYooSS7irQu4gYTANK93Bqxwx0d/dVVD8LvuPUd5/AF0+OHHJ+?=
 =?us-ascii?Q?PF3Xv7m4KNpt15kwgBqctV/fGCogcLM=3D?=
X-Exchange-RoutingPolicyChecked: WFxE6qfIxzkVNB99WKmCZayK32GouS9gIUk3oRx7xMsWrIoyT1AAbBvVCidBaod5jOihe1tF7as8nlz/TSQ/R3MkI4jQNQqsuR9wY67bkZ92sltKol81gJzyTBTE4lVGUd19EwheIIK/COMgqCdPVjRO17KJVS3unZXmldyC8ID1RqzXvLU57WNoctc2Cf0OBvi3vywxwt7eckBAuEGU4ITbI/YQqHjG7eyYPEU+88xdUw8WFpT3yKV8vnvlybCCi8FzbiSJV5yaxrKmwvYE8Ud/NoF/Cd/N/yuyI9RT7ef7Xr/KoN18lUKkVxYfmMBGU+CdITvkDgau8u26LyGRSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53279c79-04c7-4304-50bb-08ded1cd50fc
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:09.2878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+7Eu+CxR2FYKvjUp79VFv9G4wfr3dA3Tthg1IEjlUcxeo923UNDJzOzLgwLt800fVMdlVjNd32a1zG2x69NL2P5SOsEvY+PO9IKjfReMig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

intel_watermark only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 19d0ef754..71f241f8c 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -26,7 +26,6 @@ tools_progs = [
 	'intel_reg_checker',
 	'intel_residency',
 	'intel_tiling_detect',
-	'intel_watermark',
 	'intel_gem_info',
 	'intel_gvtg_test',
 	'dpcd_reg',
@@ -124,6 +123,11 @@ executable('intel_panel_fitter', 'intel_panel_fitter.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_watermark', 'intel_watermark.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

