Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037BDCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A280610EE16;
	Wed, 24 Jun 2026 08:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntkQHQwP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E401310EE15
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290844; x=1813826844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/Fe8UooPBNtWDmUowVVcRqAdeoWf87q2f9yc52QJX1w=;
 b=ntkQHQwPi2C7QNg0PB2U5rQrf+gqS4vyK/OKZ9xmmATtgq6Yv85fTVUF
 1K53mh9oKobKWwMU82J1bX9W1TldK1IwX6xSytYqUtlB5eVxP1bNcAANa
 dNpOTAKy+MnEsx0xgQNVJTGZDungkA6SQ/24uEPV1Q906c4rLCZGgJgeQ
 8e5AIwCqbgaae4xuDet1mLFTiXJkJiRQuJzzbAg2H/hrxX9Hrr5M6xQcy
 7sDGAawatdluVCKPk2PjeSm4jCjeyIyqW0ZNWxNCobAfSKrWKZCWPo81q
 je6rftalqRZT1zwqQGazxmNBu2TpTkR8McG00MYKc11Y4SL6NPQBlA+hu A==;
X-CSE-ConnectionGUID: Xm1NfTIzTQOuo8ewTCQb2Q==
X-CSE-MsgGUID: Wu4kPHrKS5m3KPCboe9/Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83142209"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83142209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:24 -0700
X-CSE-ConnectionGUID: 1p/FTpznQi++1lv4f7z0jQ==
X-CSE-MsgGUID: 9P+l3JGDTWCPkwkEDaICyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254865300"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro33outuDA3pHXS0TdJqGfdzgOyNtyjdhs+BbwNLNH3cBlxTg8jUbuaUqjlDaEXBjTNbCLPHXgXf0HzfeRnvz0iCIUzC+MlHxJlBV6rov6fY5FYXmaPUtGktk1q/El1OjnexJyOtlumfUk7oXLMCZk/o232/gU60DjE+zmJb6BynWHdIO+LTTCdjiEjDBhYnmG/fdxt3LayIru77qzh2HLX7agyzFprNb68LGw56OxzGnwqP+M+TBjVyEnbE7ooR4t7YI9pghAVLB/i/9PjmJQM5jy8FL9MkfI3DG8NOC6JUPwSOsoQ0bVrBdJpFqMCfaLUMot6NGPLomt2Pcjwicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocHQZMx5oNcgqxAANY9H+aTVRszSASkIyqhsxdq1rCs=;
 b=sTcymyBU1eKLOWldhZdNTxM3KDJFeOIeKWnIK9908EvjZocC61wxAHZhOQmXewvBtgOeIIplG/xIAN8mSb2HIIAvMa821/40mAHt8dfcpzvSntotRKypBGmeL5Lp6j3Sfyq7w2/+V3R4pZC4hCBg9prYBuW+n6aI3PjeBxluoTmyUcAhPh9IJWrQIr4d6r363F7Qv6+MjFhZohs6LonaO1YSu0I5CeWDfZva59BJEEVWooCz1IkK2yjrOs4uEhdP/9d5LhW1ypNimh8cqt2j/NEP+XxtmlijZmIJc5e4rsowf0eKXHcaT6AE0+Sffv7+WM7p5aCCIHJds5AZ/lcX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:17 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:17 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 01/25] tools: igt_stats: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:08 +0200
Message-ID: <52667b0eb09ef029258fc33124a4faf74af21f90.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: e92872ab-a5e6-4ea9-f8f3-08ded1cd320f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: lpDzkBvKWLgCqqyJS9a8iVjJ7MSpZIkVgS8QJcmcpYt2XjMKN67w2/fnpdOktgX1D5uO3Yoi78R7IDvr8w4iP5Hx6A7HCTP3G5SuT9Ed1O8Z9gANklA3UNqseGrq/enwV894d47vjg0FBfz2kvae44zXjs4/ihqTo2qc+jQiPtkBVzzBbkJpjkT2Fw8d0lInKKwi6OMbwCi/rSoJZeOrZfqsvdsABC94mcW+5TV2WZXzHOU31xvO540dYM7uTigd58pWx/8s4zobctkFTVZLUuIdiO2rYksNvuimF5WPk6OG+d5uu+ye6GH7ri/kXFFW7B6V8UYMjP7+Oa9EMTIHMbzBbccphSfklUteHUSvkzSSNpQsedMnl2KR3m/g9onS1Y38rr+zmih0+orHudBHRMFqzKTaoYE06d5Wt5EebX/9R6TkXhIM8zT83qqDXAJg+Az9GFY0Y/QOoqp56vY3b351WsGPJi6ZD1enQ7CnJBNWQyas0mEdwRYG0IwOYUDLM5NU3ua8oknnfcjqIlLjlN/P9VPzF9hcQnnbFqLJ8LF8zzB+1fG/sBg6NDTMlzLyCNpc/wuSqBbnBcbkxgvX7/3S+fjtZmgn8/dvfPbyQLpeNOnB/1OAxjK9r9MHnWl/l50ozyq8T/r1IYeUIAIYgLCeVFOIN8T4zm9EzjfxF08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4W3Um7JhEYYgcvU49eYNvfoj1dh5ZAXn/mW9a0yJDvkpHLOjvk/kmRjx2VD+?=
 =?us-ascii?Q?1P68vSelqxZuj+xI4sRdMHjLcAudnVluztSjlrAiOy0rc4ZKH53BsLvJL9u6?=
 =?us-ascii?Q?s+Q7kwI8tp7JXEYdkmc9yBQJ08tsfn7gGMgrK3rXuJGF2QBMwefIjbUfGK4X?=
 =?us-ascii?Q?vnO8ZilgZ7ZIK5v1KG5PJB8EXdoSc60dd01kjVMLnE3BXtkWzcbLEfVK5H+O?=
 =?us-ascii?Q?87GTRJ+yObOl2v5GYhw5NhWVXuBReSzfy/bsK0mCg6ojTUEM23DG++AK6ibs?=
 =?us-ascii?Q?vJvgyeMA9b5dRo7aZAu9io6B2OEtmz+J0xOcm0lTF8yQMfzr0EQMV+DqNoOH?=
 =?us-ascii?Q?9bCtNduriLMUozFZ0myrQfj+qbMVsYLby5gludi4m7yg8Lp18u9jFeogVtNR?=
 =?us-ascii?Q?xkXx6oeCV//xTBZM3+RpB//9srOnlapT52i7xQAP4TkSZCosXkrL/RSjiYpv?=
 =?us-ascii?Q?7xcAFWh6TA/+XfqiJsaVPAsFzNCYzcs3DGVB/k5jRwaGwqJgA7lgrN6FlThd?=
 =?us-ascii?Q?3KT6Z51+bOZZWwl/ZzwTrJm30L6fyiCP4OCnjfh/UTNPHvhAqf+yuh1SaSbF?=
 =?us-ascii?Q?0NWa12OpvD7TKQdP/4+4KUZU7VQAoMloQMG4o7falVbUvRvfJj6GpqqR/14r?=
 =?us-ascii?Q?BB1hNB4fS+VrY3IlvhUQI32qgkMY/4eBr34COd9x/8Cl9bXA+LbvHBG4qwzd?=
 =?us-ascii?Q?gEHeXfsea2+nYSxv/oiER9LiffwbcdrAZdBFFAHUaJSfF1wBvEVeFVW47a9w?=
 =?us-ascii?Q?rQG31KJoL5aXBmUaT2E+w4M0DBRKNuI7qmo7aDc3NPxY+vMKuT0ESiGumavv?=
 =?us-ascii?Q?n34toDY8Ptye4JPUYpPO8hIb7rhyyzxOjkcPRYrlGQuBEr2o3XnCHPnD4TV5?=
 =?us-ascii?Q?s/lTf9WsFnM5v1zIYSxz2BOGH+xofWL67Ps/SBLDABBQa3jvrdJW1sK8WVu3?=
 =?us-ascii?Q?UqcSLiP34bAroSa+hzuIBu9qeu82aJWDSPtJzfSsMd1xHMEhUtl+Wi8NNQvR?=
 =?us-ascii?Q?qkNU9Ls/lXTk+2/M2C6nW7QBvBnwR7smiHkVigckBbhIJPkro6nkdgw4/kHt?=
 =?us-ascii?Q?bIi23V9Uma9UorXmXKGKZDfBEc0r5KZ+5jxcKShMFiPLsiHIvw5fRioVEfpY?=
 =?us-ascii?Q?4E3yPT85r9m4V7hfylaEq9IlSgEILIqozNQOlSbzJUVIipokwu/GQf/6WICx?=
 =?us-ascii?Q?nTvujB/PuJRWW5GxCr9/qwKoGkCJ+MXJFVNgfY/LA/SI/VtCK1UY8ZOayftf?=
 =?us-ascii?Q?v5C1rNeRyTTF6Az0DSyCOJpfd+VzhOUbb3TOTpNBlIh6s+HCP+g5cPyi5CnO?=
 =?us-ascii?Q?6b/VZL+HGMm9N8UhMnpZMuT9gzuf99vob1mjCUNYPKPqJZSLCSHnKbcihv6q?=
 =?us-ascii?Q?k0nRsvAds/U3G493ZdvXX/St3jntmw6kAuh/2iacXnY8pnLO5B1MSARvsMxx?=
 =?us-ascii?Q?vRuucn3aiv1AtbegakrlWBHbN3OGnJ6DrH8DljQXjhtmikvxwapwyJWBuLuq?=
 =?us-ascii?Q?3s7cBSZpJedfmsq9YyJMtVoVZyvX0LlkMUvcW9/RP+M+pbYSUFiyBnRoG+M+?=
 =?us-ascii?Q?qeYitYXNVq7IlDgMwYiaCBPYY6sq/H45R3YNOP9fW0HmHD1X6m9+pNZOiIhF?=
 =?us-ascii?Q?JmiNI6klkOGzVoNVq/RpuyN0EgpGJrW6P3I28+/j1b0thz9lmmqtLsn+uYVg?=
 =?us-ascii?Q?mYj24iac1uhcYHSviv+4kGWSNlIT0EdujoY2Drtts1zRBuhMHl+13RpBIAsz?=
 =?us-ascii?Q?C6UkHh3Hwr7hyuaJVveCb2SPXppTD+0=3D?=
X-Exchange-RoutingPolicyChecked: JVSATkK2GwuIZzlbM/O8RCpu5AgkgJ6bFyexmOTF3U87meON9/DfkPAZSoV6cAXbQWDl7/vZXjd5JtR3CczkGBuhB90OqArTI1OZSvEcjXRJCsk05BUGt4JAGHF88SAsp6FjuMPvMZVBxwehTwejpugN4wbg921910X2/odba/h5HkBJIgc9e78fGVtyXEzWZaOg5WlyJU2k/9mkiPJ33IblPzKxRBwFB7gS15IQjCf9ePRPqX3Su9FpihUbk9Ckp2NypZR6JAN1hScU0ZVYFSabuTfAS/gjlSp4cVefuss53AJZh+NQf1vkZxhtlJhzZ/mKpntgVLp5ewAsPltBoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e92872ab-a5e6-4ea9-f8f3-08ded1cd320f
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:17.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Hpd2RoV5P0kbpfmkNyN7sNLBdG9EAZRN76iYIebzKIK8/po/cgYizuIzVeKrh5Pu38Do3s6MS5PfoTlaBQXm6nhrxr9qhjpYI9vmsQBok0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
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

igt_stats only needs the statistics helpers and a small assert stub.
Link it against lib_igt_stats and lib_igt_tools_stub instead of the
full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 lib/meson.build   | 14 ++++++++++++++
 tools/meson.build |  6 +++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index f25ecd8b2..96903d06f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -389,6 +389,20 @@ lib_igt_profiling_build = static_library('igt_profiling',
 lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
 				        include_directories : inc)
 
+lib_igt_tools_stub_build = static_library('igt_tools_stub',
+	['igt_tools_stub.c'],
+	include_directories : inc)
+
+lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
+					include_directories : inc)
+
+lib_igt_stats_build = static_library('igt_stats_tools',
+	['igt_stats.c'],
+	include_directories : inc)
+
+lib_igt_stats = declare_dependency(link_with : lib_igt_stats_build,
+				   include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..286a718c8 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'igt_stats',
 	'intel_audio_dump',
 	'intel_backlight',
 	'intel_bios_dumper',
@@ -58,6 +57,11 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+executable('igt_stats', 'igt_stats.c',
+	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

