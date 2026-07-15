Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB448C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823F910F030;
	Wed, 15 Jul 2026 12:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3a7bkca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9F610F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117715; x=1815653715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X2NgBHJoImOQO+x65DNmtMldDjluPIO7UA+0V5aUjGU=;
 b=Z3a7bkcaQ0Cx1VYE9O7eU5XkjXt2F5X0kdPZo8NUaSEUhxcsFN1ZNuPP
 skvgFn578w9xER/Seg4Z2jbIzgd7cSFHMJO8MN0dA3QHVkBETvDbe14GV
 vqgIaWpxuXpoC1n6DhNSfELoECDMEZTPO2/StFjJUgLD9IWh7lMQjpwoC
 6x2/LGqCglgkx6NAeZm1/G9weJ6q7dYSLPci3KhBdXz3F4k+h5m1Ncdcc
 4ZvP+vMQIRvj3b+95VWyAavBOBSRI16Nb3O2X7N88OtJ1mil8uLdfgQcR
 HDif+m152V1FVhRFaKFb619YKDqkldcKkclKkRiwqpdfnceplmKICWYma g==;
X-CSE-ConnectionGUID: CRqZZlXpRui9Lb4df0nBPA==
X-CSE-MsgGUID: B4ufvBD5QsKPhXxVDOuE8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607005"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:15 -0700
X-CSE-ConnectionGUID: BAT3bXcFQZGXcf9rI40PWg==
X-CSE-MsgGUID: lVqSVl5jSX2GBmsKWZ0M+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659468"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6RcdMZUm8EUnY83omMqdeYAlo6xQJ1CKk77zaGGFLeZCYe8smhhjiTymUi5cTe1Ehl6f26hx0AgxfuxlMNVlLGOIHAOH4y8I1+ThnyXp2eUPQtLhN2/WZIO428MmUraiM3ORYLpuGXTTmdRtnn7jywFlCmKn8b9FlSoPFnOsJdeRMe+BXzMGj3l+6EOKh+EQKZ4/njd2rFSwNA/y0/EaQ64rFEEufhYEsEXlR3x7oy36Rt0NNh9BJchFNtPmzlCF1jnvwiOmbcI88U4+jePvI9NOlscI5wVVpVTSnExTcsRTXR4BXJ/oB5EJfpBAVHzQ20ofOsheQv1b9iVftcBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa0uAY4ZUh3/GymbRQtQyZsStPwGAKzi7y/oi3kkMDM=;
 b=Nj8kJWKTyp3YiLnUvM+TNYzG01Uvya4X7okok3CKDjcORG4Kfaq/j2wex6pHFVULp4ul+O8FWr5Jp1W6xY3jrxNJqUW8Ky51OkB6QviKPsQe2rAIu8Q2JYr+fw/0TkNIcyo0NQilEUvK0kEk3M1xsyeXtCDJEOWuJGbuCsfarRLxno3tVZ307X7ydaHoQLRMicNQQfN91Lnjy50wlYH6QsgJK4m8iKTYNQN43lMh+RWu0zoFYnY0Xsjsni47DnmNT/P22XrgXuVRgF05ORuHCDfeU5yqJ4rRDULmyBmOSDKTzcC7y6eTNSevDx7XCZla+WmUoeADTHwC9kL+PpcpqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:11 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:10 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 08/31] tools/intel_gpu_top: add explicit
 drm/tools-stub deps
Date: Wed, 15 Jul 2026 14:15:18 +0200
Message-ID: <1eb43ab3578ca29fa5383fd0125d15729f13c730.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 501bd716-cc6d-4c53-5d40-08dee26ab750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 3dv22onouu77e0CXfcZWZlfQoXrU2DiCUoHdp70iowRbD4INtK0TG3P+0J3AXOpKOZ7mjrHG/mcQP5Gwk4PgF9s7YT+2JPelXTONsPhsFcXfvp9z8dIcOr57H/X7ZDArfTPRjpBgTh8zi5E3LIyfgtNcRfCsDt3kAjv/E4tIMf2SR0UJGzJtBRBZi7WlCSwsCd4kkGWl8zu9x4fYdFFXK0xOe3yQOgw28PdMHLu5iTLTK8CDVqKUGOtNQcejUVjZnq7R0v3XIZeniSDPDWCLrENz2IKkQzIcDHLtKoTmEpCxYifSRDRqINPZteGzxvWsGAC+CZfk65tOTFXkELNk0ibfFipQfBcXB9Rx07u+P5xrsAmnB9IKRt81KcYt9IHdh9OSnelXSlswwucwPm7lf3Kunm25qykcIAYVmQncAg++aoCNgo8jpC9QTEm2TkyeBZmmU+GvgYDFKGq03dbltcbMZhSzc9aAlUWdTaTghRJ9/ine1IQo3dDNDoXwOjYoBYbkHFVwPnxmMK6FeB0HgeiP46XSmnWZmWB+aBIxPyMAYFq9xI+p7nUmecqEdGR+vB28JQxtl++tJG3poE/65sM9ukbP/TDPS3l7U0FrGprfVH9/PXS47t7mpIKBowWWxLkebx2le9S7FYt14fcdyQaCksXDEsqEgnXhyDHpCJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dz/5gn23xm6HuBW3xH6+yEkZc5ZNtWD0e+eYYhBV8UwC4rHz1LHgVtnsK9ZQ?=
 =?us-ascii?Q?ICaPRuW+H8qHN7TTX7Fqx0o5RByclsVm7BaFUDrRWYZaNXoL4AolyPDeYo3b?=
 =?us-ascii?Q?ELUNVSYkEPaW8ZOrLZJc6iHJTl8XB/V9GBk3Ql8pdXdNvHMSyOra0SDM8bYT?=
 =?us-ascii?Q?R3OAVWAHY9ue+O+zCCryraRUh1s37rXlk06AigLg2Wc1koeFedwXN1DUBSNa?=
 =?us-ascii?Q?RQDgTxYmcCUQuQz/yodbNFbTNefnFcYPtJ1cVM1U76l0n7hLM10v8CHAhM40?=
 =?us-ascii?Q?zJKRqJyczW2IayoaMqh5p5/sHXG/xDGLUwwJKF/87O7CntRMZxcGO1sUBPNX?=
 =?us-ascii?Q?R0uQpCjGMoICiK5XHDpbMad6FAu1tJzJwzn8t6ddNgi3irF1pCO/WBc0OWr2?=
 =?us-ascii?Q?yarKcYKFoTs7IezleQmAzp3qn50E8dKW28xxtMZ9TRxoxEJTFXrPiVi2xpCV?=
 =?us-ascii?Q?L+4wAopFjp3FYdQTqVnCzisUo7s76C6+putehwIfNZTofIYuivU0a/tat6C1?=
 =?us-ascii?Q?jsoC1xygRY54NcU0Hbed28OErpGN+qHbPCg3LXYuZV/xfPy2e3vhvCLCqSAm?=
 =?us-ascii?Q?/EmvzdG0enN4zkVkb1h+cSLIqUh+pEv3Bnk572MCKEKoa7qrdrScA296GenA?=
 =?us-ascii?Q?6uc9eCYczevMOHVimHdaOzowIjoguw/6WaOkEz6mL7uoR5cC75nKjWIs0jPY?=
 =?us-ascii?Q?578asg6cAwt2Y/HAXg0T+AfXkmdIz0BR0KFW0snY48LJv1sJ4S0/mooN1kU5?=
 =?us-ascii?Q?AyERg+LAZEvReATgcHUe3qJkNjBrB0xyTaf4g+bmZXogd0x6yVBvtMs5q4k6?=
 =?us-ascii?Q?uVetJtAToXC20fHV3He9FIOgVOUoahVMCWDPRiy7UMUkMEAHl3NdwSuNOXCa?=
 =?us-ascii?Q?Nhf63zrljn5jisao2qmLlO0MwE0iyarmxmn42CGRfnPtJuHd5qQZwERvhyMv?=
 =?us-ascii?Q?Moo/CfCjzb/RRkKIzKK/sxGrdfHsCdHmv+EXI2iF6dRZQc3HNF2Ti25yRXKB?=
 =?us-ascii?Q?ekWPbk5hOe+FOkiep+fHABDsYJn2kVwnMDyenV8WSKwkLG1dAKvr/LnB2tGl?=
 =?us-ascii?Q?nuN7fFPu1IzBc/vNh/z1fNDl2xGXjrlQ8s484ycp9ty7HUq4kM9yj/55YiDT?=
 =?us-ascii?Q?7lrPJ65KBl3KVzlvsQv1+cXp0LkvFrvaNh9M6DUJjUnEq6wOZJem4i98XKJN?=
 =?us-ascii?Q?71mGffi6vWtHNgHMVUndMRg4iELWeKMRytU3VCRa+HiRjLWt2ZCzykIkmc78?=
 =?us-ascii?Q?MTK6ip/rZEfhRKCKSVcnTTkEKA+uSIQcPa/3kXwqsdk/5bYcoIcCqISt3n9R?=
 =?us-ascii?Q?XwdiIK4q7ec/GDv7fsJqcljoMxLhixGbMRa8n1qbBAsStiPUigyxakJl82mT?=
 =?us-ascii?Q?gCKzBUvHftqSsfHmTc2dvQcwcG3uVyf4IdGkOO6zB9LEUY/dKE3j4LXh0532?=
 =?us-ascii?Q?Ip+HIj2pwDmrv5gZ+r/6mi5rZYf6si6I/Zv3aOLoXmQSD8SKpwgh5eCR/Y8O?=
 =?us-ascii?Q?AYY5/m6EubxrmBeAH99b6Px3SvdaPS5n5SfN9foKt5vQQRD98CCbcwGowCuP?=
 =?us-ascii?Q?MnIAhZmkvjgmls/u31TVMS2h4+ntpGIfsfw98M3Dtqiojg+TgdQ6Xmvcs9K5?=
 =?us-ascii?Q?wVVO4t5yXKuC9XE7xtr0rkDan++l/LAEusY/4tBGGdnkt5F5k7buI+lbIdom?=
 =?us-ascii?Q?rZWG/Xej69l+qRaW7MY2dwxWnoWTtakEeZkkDhd0T0NB2HWnxCNyNT+Zs++y?=
 =?us-ascii?Q?rmMiY9UgBi4V7vfzFpUBo6RQHDH1+3Q=3D?=
X-Exchange-RoutingPolicyChecked: d9b/ucOQ9fzup9AKqYlTlt0IvBRBYbv7PD9ul7MYPj3j+1P+2+AX3y/mbHq8B298vkJAU2UwEt6WAlvt6OqcoAC8Cws6Cs+muL/GJIS293R76BcLpdtB1b6XQUfoGstY+pLY82nBsGm72L1Co8gtjVSWObuN8jAp/RjjKYGKXYvaxBOhGktTrekabaMoyPfMLGc6xUxxh6y7nYauy7K75HbHaJtUgZEChOqjNWxAn8RnyWfa5F+iH/glGUkCDH8OwOH77TdBm/MtacSdZUME/EKWpPgPLLBg07phsuVNk1OzyPN+LaNTDgtphlURVJrg6pmh5q3Ulamn/k0uzhj7AA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 501bd716-cc6d-4c53-5d40-08dee26ab750
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:10.7193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brwaYi/1ePFRT+SvPZF8v8a2AFPV8MIHwlMu6SdI5t2qu7UnufduOwPriTxUmmYOBi/QRttPZi2tzCHrRp5ZMslKvEYNipFkq6sStrl/EX0=
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

Meson does not automatically propagate static library dependencies
to executables via link_with.  lib_igt_device_scan internally links
lib_igt_drm_stub and lib_igt_tools_stub but does not reexport them
through its declare_dependency.  As a result intel_gpu_top must list
them explicitly, otherwise the linker cannot resolve symbols such as
is_i915_device and igt_log at final link time.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
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

