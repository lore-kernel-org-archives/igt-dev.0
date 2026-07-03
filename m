Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01AEC43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556EA10F82D;
	Fri,  3 Jul 2026 14:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1nmQx0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9041D10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088975; x=1814624975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=irsz1focU+6u/AhtlmLgRdnKUPVGD3GZSi3bsW9zK5M=;
 b=a1nmQx0Cm5i/A6mJhceShW+3YAjM2l84vTY91BJCtiTeFRiP1YMwavL4
 gsv6SYsVyuew+idTfRinBV/W/tpvl4MrGwmGHtJn0Jvb32sqMzInmveWa
 /wRYiOLBIaib6MqdNjJrMsHgnfD6oIcux+jWRedFZgrIJl7WZjLzMVFSo
 aBE4/dlPhMtAsu0Sakhtg7WXEYsjGQvUiSlpRAh6/xRR/5igGppsvhlua
 +8kV2txVw+tKZCPy4nTB46qXG32nekFBBMXpO/SaWdInRRY3lwhQz6Z5P
 VNv/pFLm3UkoAJVkueXhiel2qHbPaaO0xAQc5rZDHJNCOaxmSpX36pyO7 g==;
X-CSE-ConnectionGUID: WJTertBPTae6c6byvbQd8A==
X-CSE-MsgGUID: yhZr0/OKTzOZkgioOg86yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523832"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523832"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:35 -0700
X-CSE-ConnectionGUID: fFw8pBBHT3qBCmZYFJeRJQ==
X-CSE-MsgGUID: N8dJ24gcQry2j1fqlTsfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476269"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:34 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIHWQRmlNwfjDJCsyi6Z0ORQ659q5X9+De03FN1Of+VaDXbaHUyteT4OmI5QIUwwyMY82WoQGbcDO/cETlXlHHcRiD6a7OAlhDPMo07TFaVo70VFiMVFxctZ529a5bBhCDfNjH4jkz8oIgs1UOdWEFRHyqlHNh07w8xr/6JX7o19WJdXdnfnSjUsbF+vG7u6e91jUIVWlQ7x7PEo8mgG4MQt/9F9iRRI0876V65WH3ctsBBJlsLY/eEyE1UngDI7LIXbOahes7Lc3IMdcGHO2leGJT+QGIQhlsjIV2iqAnplEBajSYOnkGxTmHIUPZXhcvQyO6kRHbch+TnextLPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q77eQOR0rAT635sRYkN3ImP2M4JeLNoMsbpPtcTcyU=;
 b=NBmafgTU2R/CIh/9dbncQU54uieAijepgYCvF5C5eBNQtIwb1Yz9aAbu+S/gbwRvDeaEQ2UMoE4AZpLGalcv7iD1cbWHWskouj4U0XfvoPsY4/nWKG6ER/wkZWl0vwcRiqYE0NFGdbS+GSvOCi5IDjFs5C9+LjHOeGLNoYk0dcZ3tNlCdRciumfkDGm9iDIZGs1brzxafiGx7cb9z2R2CZKurb5SjwjTFYKRwmlZ8ql29+tT9fiJCmlOHOfQFHbPeEtlsaPwNQJ/Rj4Hsq2NlrrtC6lJXGkgxCi8+ABZAGO4s0Wk/A5LJ/wpDAEhwbSV/zTmRXVnnOcg0ENaNJ/2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:32 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:32 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 27/31] tools/intel_watermark: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:29:01 +0200
Message-ID: <63d5efb4d9df4f13e3c49c5cb395c94a57a8407e.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: b8c91bae-af37-47e3-45e0-08ded90f7fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 9MSUyEp3P8gpcoyhFJml2+iGtNgqLA3/P7XCuf/a9pyW3A4jiOuwcKVkY5aOvu99W8sGja1bvQkJodvc634w2NqxCk9hXtpRIoCGEVYb0g7VuIw+l2MaCRbCUTXkkeFrzmNt+rxLVlOQ4reeYBlQtZL29uG2/8w24UQ7RHa3hVtHfMLqRdiWxtQg7cOos8oTmsjpERZCtqtRRH9q5PSkaYIWtKxv8S04y0Cn4eQrflm1Zc+Tb2+aknexZXfPRZh3TzPcO+t+N+HgZd3CeDW1jTa5MUKgo0aaLNYjbFs8zSUdECq+ozZUPxXb0UNi2NLBA8akB3VmrcM0mHkWb9dn/sZ5R4vHlftIKXKtApZRJl3Ecfg3i7LRC7sPKafQr3IaS1F4YmW78wVWl6Zry93cpufEbB43fpSVsD5JZ32KPhR6vReotsIjXDA3wxKJXLLh68NSkdqSXf/8EbbmbWnFXlD0I4WkSd4rsGXpOFIIhUP8oTFILo55ZCDS30YkwCTA1Pk0d7XiVxdtbKnH+z4O8/P8Wfks889iGHhmsDlLTX4Hw4OHzcz2uIZXLQB3iTKFKTMiHTut4cS0W8zhZVlwJPYyJFaAw8Tbmgxit+ix5M5a6QJOfutK0C7JWaZ+BYwOys0JBBytA95Nkll6X7OeYUp4wIWwb7egdgvNXiYD3S8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zzqTlLw0y1jwnDMkzmp9MmsCl6NtUFVCYge/fSO5D1yKLEZ516tOPT/Bg1yR?=
 =?us-ascii?Q?Je20Sb90dnkF3FNRb2/2hV6n3k9ALmTrs4AsAwhrh8WEiamhbA9o6W2qTNU6?=
 =?us-ascii?Q?svtD36umA5yLSH1WjoaLbBcm1tLxZ3z9ZrRDp+QJtJAckjiacW3613DbsLbM?=
 =?us-ascii?Q?8/jxX9S7yzMS4j2qfm56Mfwt7xn2VRdHMg+IvR/aWVIAMaTYr3nRtPS7kmli?=
 =?us-ascii?Q?+8ub/uqh/5rbwEfCWZ6Za7sTyANaCrPn34pcl0bSdCsa0/RuyShcvjg6WcRL?=
 =?us-ascii?Q?HdKuvzxnUT7U2106nl/S6TvF5NVjtE8kpWtfqkDJpPcbcMvCKQfjRmJckJ84?=
 =?us-ascii?Q?2ED76/6B3YfsoHsqa7He0XLnn69UzZ304AnSoEAdtNx7d5GPwyy8Ehv+fOgi?=
 =?us-ascii?Q?G5kp3oJp0OtceJP3DCvncuttDiz2xOZHcCF0FStm34axwKAyfr6cdzrVoTb9?=
 =?us-ascii?Q?kJvYfXUMS6xvj7khPbcgbS5Sp/SEgJu20TaCYwMXadTMBCFAWtWBfSxhGsct?=
 =?us-ascii?Q?5xoSQRdK4F1Jdx2C0SYsAz71jJdRZSUV20ocFC/RR3tUJmuHOxsQY1m/Pfz+?=
 =?us-ascii?Q?gh8T9vsei5aITCz+rkPtJcPC2zcUtPLb3692W/2Su7yI3iTHOA1+Q926nivC?=
 =?us-ascii?Q?zL+VQ0dM9JLkt53o9egtBfuK9RfGLCNmBRxUY4DY5qPcgZ8/pp2Dih+GSnev?=
 =?us-ascii?Q?KHFOObVHB9kbtVsA/SNMCdAUgOorq/ZNoDvroFErYOoP7z+MJeuHhBVBx7o/?=
 =?us-ascii?Q?PSaE9uDgWOqAwNdCix0nG+C0E1ipls//DrSw/JYsYzJDTa9KWKIRN4C/7co7?=
 =?us-ascii?Q?kVbOlsimuqTIFaZHCCEG3STWU4s05ndp9Az+gIlF5pUxCWuZKotlh+GGdhLH?=
 =?us-ascii?Q?RT1tXbe0+oH+3U7n/P2gELOyxS8xwtPeuXWeuoCY6In13zCFGmfgw6qQbnlI?=
 =?us-ascii?Q?cFRGKr1qJg9En4hQCpm9/lVvSXsSgpjMFIPMBs0Tuargaiyk8tI/aDi2TvPX?=
 =?us-ascii?Q?gml/rIE4Nx5C1i8kIl087+Mo92y4IRVyXMSioGkrBJWWdAqOjTOliUhJ6uWf?=
 =?us-ascii?Q?TRLC1/9zawo5M4Vn+n5csV54+VHnvk6mIcilaZLVfUts737rQzlnqWRqNwgg?=
 =?us-ascii?Q?u+EN2JCrmOTV7Jgc36ey3w/9vI6lY+obYG+zYuPoRFju9X2LYq44oaiDIvUW?=
 =?us-ascii?Q?nBHbSXukB8DBM0Zj8Tn/qHV1q++mpCuEJdZFz+Udakc0m2ppN7uHmt6iV3GF?=
 =?us-ascii?Q?ekUYrnVLW9WLtVNQTBhPYEwLCU2A3QGoNLjeG0diEHdUPbfWgkJ3WV0t8G+v?=
 =?us-ascii?Q?zaxXFq1AvWtwY9ikumqr1ODgVTyZtSe/L2SrJwNU8lwVs+XoejkE+KZj/XAI?=
 =?us-ascii?Q?V2++wx3sKRB9SbscOflOeK9mrYAxL0ylB+A8KhP0PTC1/sum1SaCUDHOJH7v?=
 =?us-ascii?Q?14K1qH5t8utFKI07A8ocSCq2kMsb0ce8O28rQ5CPd9o0pWtzFh7wwe0jBk0N?=
 =?us-ascii?Q?swmdK8QO6K0dzT/qro/kcRICN3P9StIXIER3v1//KCw4lFUGokUAtpPOzWwf?=
 =?us-ascii?Q?gYk+cC1UHPazeg5YnLL/RntM8JUMQ9kOLoj4U3hSs0AYSeEslnkzx23dWtbC?=
 =?us-ascii?Q?IGjWtKxW3ubloEjsZ1TOuFByzPzt2bdVOy9tFAnOtLY7Udjg4mmtVLnVhGKy?=
 =?us-ascii?Q?Mjq/6d1zudw+vdcykS1BhejeNhHvyNg8BV6BGjs8QKzg6rRgdXbnfLP1CaQE?=
 =?us-ascii?Q?ASogWpVlped14y0gGY1i5rYxOOH0UP8=3D?=
X-Exchange-RoutingPolicyChecked: WBYh0ztub2sUtauNjaFcsXa+pOdvbD8S/EWElU7o1OirFW98SR0LQsRA4helGfoaXG1TnzqsvKqUnOagaCrbpZ+X5efkQMBau269KjHY+f2uYEX3x+eMcoXOEaWmZs1b4mSRp7W/llpQvJhjdyLLw7X3ARVMylToJNb6s/yyM8Ykqty2I1Nx+2cUn0b5H/DSWDTe2fPUROGbSodLYHWZeTbX9dANOJiiO/tzFNH1N/Fqbr7teil1oq2/C2Q3yNUOnOgX53z94Rf3agqZJAahGrU+cX534GxuNKhfgXeLpI8ISVGw8IbQNayD1vt+Niv2dgPBn6eP+0BdN7fa1uVwbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c91bae-af37-47e3-45e0-08ded90f7fc5
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:32.7234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1yj+FQy+qbSWuoGyP3BGgDBSx8u3vkamk3WOp04kz7VelvzF3eFN5QELY0ge4NRtF/hBmYkb/vB8Q3PCVwSg2OoEuOEUOuGoY0C9gcM4QU=
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

intel_watermark only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 1a4e14ed3..0cc62b54d 100644
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

