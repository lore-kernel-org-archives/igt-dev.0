Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72349C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0C10E60D;
	Fri,  3 Jul 2026 14:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDzfyVsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB01910F829
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088959; x=1814624959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vwIBwsaWNeIe8ktx/96yvTj3LyiIjkVF+Amwjm0hPeQ=;
 b=JDzfyVsWS4vqLvTuR1fYQ0gb7dTKlq0kIWS0QlXii6UaC1BB5goPSdjd
 9ag0F3oqiEf0C8xcDsPZx69suQzMLSnWrVNn/Ef0w8KOijuJgFclKJToV
 dp9+V0OxZhtLWTCSOsg8g+ei9a6wsXPW2/J91DtwoQgXfdaV3isFwuu2s
 ZHPu5gSWSI7ycOB/v7m/unVyRVKaN5eV+M8u/7KSTXj1aWmBinENmFiN/
 Drdc44Sldku/sGwukV8jE60ZesaAzitJtAWXqdFQEzn4YBiRrTqlJpHxE
 KDnD90sVhuwLvhiYAtfoJHEoYAtbm39COyZzGQMO7MHrzZ4zKRh48u2tp g==;
X-CSE-ConnectionGUID: 7r2Aueo+RKGhgv4ZiiURGA==
X-CSE-MsgGUID: PY2clv7mQ96DAXM6hlUA6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264079"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:18 -0700
X-CSE-ConnectionGUID: YCJtlgoXSdGI28JlaqdAEw==
X-CSE-MsgGUID: tjeChQNqQUKEFbpBqiU+0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019521"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpEDBMaBX3J8ES8d/KhZUfKI9nshC51yx0r3cfAUt54bx6IBrV0RoizvP6Jy7ISwyb0ynbs/mhtBZ3M0/E5Gy//3PecjEaUAnSZw4eL01kSfpE7V3Hx5ubiAFYl30eI4kb6VJZMMWewGa2QvRHTui2TgDKclu1YFGDEACJotP6S3AMU2F5JDlf4O3maaIAXtMvxITALtVJiP4tQxAuZkP/JROL4TKSNl4xgT1g8Z18rBVKFR/j8QlnIMGOkf1AYQ5uEbLovvz0ST88T4AFKIkQ44vRjgpfiDDe5vYOJzVNP3/QoPg060A3gyssN+4Ni91sxp+sekMFB3vEwpFzmq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pohZX5H1irzyC/eGGJuVJWFVDR+dEeKvYGb5ipbpCSE=;
 b=RcIjR7n/brxVRxr570+LpOHIO5WxTjVDxDHfmeU4M728OktGEeCd8v+KzjjKBMLNn5ttJPMmPnCGR9GD7qfLjGsZWvPi9UHX5d+4Es8lTJ/bNlJcm0Ptx1XLkGutFrIKub+6c4RO9mogKJ2Ry685stqaTrPCqSuk1aK4YMUriUtzyt0n/73EQ8H06pmnPwZ5dv/arau0KKpUAoShNUg7jftNBKY/wkWeLhs1L1f0rTvpzDYpc+1jZ84gZK2SduktK42lM4Pf78EGd63VxGBsSwiCXDiYEOHJX7pVo3lDFYew7ltKrfMKl6sF8mBeyVJx9hZDbEuXOgdu7z8HYEe7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:15 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:15 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 19/31] tools/intel_backlight: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:53 +0200
Message-ID: <79680c1b07900dc00b0244434196c5b5791262c0.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34a2166a-d68d-4509-c499-08ded90f75ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: jSh4xS9BUXBv0EX2/UzQQ7XKQZSxSs5rIaRNFd2bshJBQaf/BPnkAUDM9jUCNPyZnK97IIeQEbjKELWJILpZYl2I7CXCvlvg4Sc4ScPFl5QhRHSPrQLpMAUr1+GGMAH8SwhT9l+qDywX9MxH9peTEme5FTIZ/Nl58bW0bslmfB3ueuDt2OtDUW+hD+KxfM0shjEgBW8RAwViF4uA5DUZI7E6KrJTIr+4dnxc7fwRpr1kmm6IuB9laCmNW11SC2KIgbHiohWCVkbKzTfEDQHUMoMQCOLg99BoFQ6ET6lgOdk1yrAeVpAnJEnJOmY1b6ytqW2MQlBPJTXQIYt3knNPoS/If4lOSqSV4+4bF5IvL3poEqLg8A960meG7oPFFqhApVGZpUre9eqmUnGRWV+IHYlRhCvo/6CW2QLAgT43K4UGQeSr16rwgG4Am/spnZqm+sI5YtW0DKTVQWmBTAkrbxYDcAzA4k5GP9EhVhZL0LxXqdtWgfhl4K2lvgq1cZFacvM/PRiyZhzvOPXmu/1b7LMspxDDIxB0ZJntBrYuPcC0UMW9Ij556Py0GBNOlw3f1xh1UMP7sZMMHWvbVydVldxqqt5/S/BpG4DDD/dia67JFycXrYDxtjOJKijc4h2aYH75+aheWAhkg4MiM3RYcYoyX5FSSVNLKhiLZaZVAsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hPLrzUbg6LxEWMHNqePJO5TKTOeSfvilEJ/Za8/pxm1/2vNVezH5yiU4wMzr?=
 =?us-ascii?Q?tDfebR0pB2IRDH+7gxUbhQigoIiOpFJpt+SoAfFSuF3RjRg9aWgqbYJAgHoH?=
 =?us-ascii?Q?pWDBlHjHPvqt5bXi6OjJ0EdO+ufb8ypJIp0ROCAc4SBrsWrxEclV62EZe3gy?=
 =?us-ascii?Q?hi6zwIMf5I7FdLHx1t9xEkSOWlv4ZtVTbNtqTke2Dd9Pd9E33LpDT3wwZ04H?=
 =?us-ascii?Q?QCTrqXsHq1pd7RlGB5fTb6zVT7aDr1MqJE8WyHWqjkl2F2nl2fy3eV8DVAJS?=
 =?us-ascii?Q?AQd8yuZfRYRRiKa4KV5tc0yIvaL3nJm6Wr8MKq38Dw/ZxqidUerIrQ4HJCAv?=
 =?us-ascii?Q?TlCEg3ZweS7s33HW6raf7du1+pu43Llb+6JLFFwZfv0J68iRqbseWXesQ6n7?=
 =?us-ascii?Q?KiKQxL4SnU4lUWXsdaJUVst9empa4nfLOdF+B8pnLK9fLU0Ah9z1Bfb9Q+/P?=
 =?us-ascii?Q?zdVm/gCx4o8a3EhKcX+RlTkq6b5bE6OPnC6Vedb/uvCqRThRxSd0jWV1S6/N?=
 =?us-ascii?Q?j2vbRN10IKHqzGayyYxhtihPijHZBSqJ9mAR6OTqenGY36/Q/jaPAK54FQ++?=
 =?us-ascii?Q?9Epnt7/so5dLS9W5GFUUsjkYqTXjy1eSmPjxISwTLOfNCGSiNJfH4PSB3HT1?=
 =?us-ascii?Q?dNwHceLQZFqQq12R8kd3Ghccvx2hrAM9+BvLChbmAStsm8QqAK46hnjyHlnf?=
 =?us-ascii?Q?uMlFhzX+6op83SdQmflhiLrNGVE58xXPRL92KQcBN6czI8HXW+pjQc6ieFzb?=
 =?us-ascii?Q?LgZPXLmE4+qhxbXCxgV4bGwKW3KL/h9a+H4IxNYzQTt+p5yHO59VunT2G6Qy?=
 =?us-ascii?Q?91vDq4f89SRk7K79ATPrKUhffpI1zq9FisewTYSFuliaDWpzPRNlOf+g+V3y?=
 =?us-ascii?Q?2hrq9I3PCM/s5yvUFpYRq7XOFAck0L6wlWrEF488Np0RtQWHcnV0jSeM6ZsP?=
 =?us-ascii?Q?ynE9Wz+LEP6bQneeUjzFJ0lnPqOrvrd5rs7cUcKNiDsk4LvxThOSyEHf4Nuu?=
 =?us-ascii?Q?/cyXTSM07sbm0lksmkK8HnWHlYR941UvMAruqga7akFUN4c8r76xaACsFzW3?=
 =?us-ascii?Q?HicYFLCqp5CZPBt6B199aKaLPJrg4nSYaOGWCoTMueTECwOES3KbD1Nu6ACi?=
 =?us-ascii?Q?9p8Cr2fg0BbIsyc/kVNFenhSAqsob7BdTVITwA1kbWYMfkvU+qyI+/ZULNYx?=
 =?us-ascii?Q?kP2ZFluk4LxkA1aJdRF/semKOpKbPojlv0PijTH8V3uirrCm9cCxA5awe0T/?=
 =?us-ascii?Q?akVkMTdN0EV25y8mvnfccKhjQ+4HeXXNWYRsj64CTimuD1CiYJ+hR5x7B8V4?=
 =?us-ascii?Q?Ziu+SvZuTeUwVNNY2w3HGqmEyCWy+M+OsCQpoqjXpHjpYkaeEXCEJubffDT/?=
 =?us-ascii?Q?r/X0RwPXYTR4+hzbojlVCyINDo4dqCKjWobN4MMlProWvp+O9yr5oDOeI0Gj?=
 =?us-ascii?Q?FMu/g4FozOeGw7oSSjefUKlNQCwXBa1VkxRj0poXnDV91k/DIDKSz9bJmOcX?=
 =?us-ascii?Q?Ohs8tAT878bTbsRk3knKoK4MB6RXVqc+5DzjgwWOQUo4pq8FZ9td/7sRo2Bw?=
 =?us-ascii?Q?JfwKCkWtQZDScTVAA3+YpJvDEVFg0CjY/KDybxXjpkl/bwQLf+3UYRQN5qO8?=
 =?us-ascii?Q?hJx5rJIJjTiMMnoF2NyNm2M9O9NDpLu1xNbkPwUh/AmXYIKAx3GTAf6vC124?=
 =?us-ascii?Q?FTeBEJR1X2tmMvl3N7xl0oKFEWqoObWL/JbZ+56HaO3KAVMRi3tC4Hweh1Aq?=
 =?us-ascii?Q?vhxlGJUPJXCp1sLBy8nvWQa61x6aKS0=3D?=
X-Exchange-RoutingPolicyChecked: UBHTNAKUsejb8NiOZPsmFG2PKU/oMteEsU4GuNbiU+pyGNmGKsKOjU/M1vFfX858HZr840+opCW/2grcWhgwmy9ncTLu5Nli/jXvuOmSLv8a8zuZ+NAuNErHlJ/x4LyGX+0eooUdzqruYF5FHbt+VSAz4Hk12QkSVuSyi5mM9Plh+meUrb2IX0xOmUHrWyEhfPG7q1sgewhlhi1uw+G8gvrGtZNBikJKGsBjYB5W/qe94D3+SILmAbdsuUWvQyt74NTchZu1xIzNpvwSYbF/lN2ij3NdJ58bi9KUP5roe4Erujn+ypMUe7r5Ziio68FwX86HLQbn9VruUQefPS1OCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a2166a-d68d-4509-c499-08ded90f75ba
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:15.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjpj2Q4bJQe2yrFM5gInwN52ltm6pjexTArVYCgj2nSFatJfm5WxNLBweR1dQoEEzHuVv2znsQcDizKg57JqXjjuc3nj7qaNFAqsrec+yek=
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

intel_backlight only needs MMIO/register access helpers and the chipset
metadata they use. The full libigt.so stack is unnecessary.

Add lib_igt_reg_tools and link intel_backlight against it instead of
libigt.so.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 46cf1a717..8899a5b49 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -15,7 +15,6 @@ tools_progs = [
 	'igt_facts',
 	'igt_power',
 	'intel_audio_dump',
-	'intel_backlight',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -92,6 +91,11 @@ executable('intel_vbt_decode', 'intel_vbt_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_backlight', 'intel_backlight.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

