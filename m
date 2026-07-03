Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1E9C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF6710E2E7;
	Fri,  3 Jul 2026 14:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTpI4JzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732B710E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088920; x=1814624920;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rh/aSJaP+yKdgc+HnzZqkg24dQw1fIrNAjWOkc8bVHA=;
 b=HTpI4JzCoti6SCemMBoLDLho1b0WfshF0VAIwM8NdiR7ZjE86rkwcWzn
 r3il8ZRonPEd0JeX/QLoEN39LcLzE1cAhujKNQJfuSe7P2sZ9y+3EJ1K+
 rxwg65e9Qy49aVsS10jOxku4GoLJngTRFqjTTNp8VqA4BmLdxacUUK7Aq
 WulBhyd5clXYmiayGSE26NFpbhI/oLAdGpZnAqgCcj9kSOWDpATzVj4BM
 PLGtGoQ/JQxaZTDZkjj39jxga1bEEEP6jiQUYPJ7WhJTSris/njcc7vfW
 fUsfVChMRiOSmC6ZhWRSFkqQAatGdzqgnhTpr41xCYhW+4H6Bl/3qW6iQ Q==;
X-CSE-ConnectionGUID: vLAS1U0PRg2FJM6/QrbE1g==
X-CSE-MsgGUID: r1RwginCQEyPAVXt0Qp6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756512"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:40 -0700
X-CSE-ConnectionGUID: gv9uXb+eTr6cx+LZq/erRw==
X-CSE-MsgGUID: OSMcIkvuTEiY01kOMpHfeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276340987"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:39 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGidXZR/TyoJVe1bFLPjjGtI9bjxYxWs+9QNnZTkiiuy9oc7/k9QLGPZaTyvoA2nkwvgtN/fbHJtl+p//Szwo4zu+i968kzVWEzroCwDOTYbU4dXRxA/Cn/bknAeUtc5EFx0xsM54rAEeI2sRiZQfULdA/Mt6EvIsBbln8ZT18Sqa9n35EUDmDjY0jmB/yg6q6OFIxIZg5ZOSzOs5pzQGfTCQpS1YzoalB+yYrjkuvXo7b999pbLENyTpvlQyiZfwh8Ir01/p2CO23d7ck6f/jiUpwW4a3QBqVAb0k4bfqIwZa7IHfbwHK9MkSvtMXGLO2snSuS90YAfgQIyd/PIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa8Ts8ABrIbZ8hajzVSzmIwEffNd4rIftWt4Eys7zoI=;
 b=QOI4FwoCDBeYiHyeBl666I88E1xtGBKob1KgRtZpnwaHoTQSDdYlLSWERUZODd7eH7i+m80cdmrLhy9DPFbvr32msGwqCl/QOD8S+1bhOhX4u20MvhiEzchW9FDgo7RWZFUwY04rI+N19tWwQAIJcgnqEpeRYdwVCuDsdR5gz2B4MM8M/dUreI5pfMQ/78MMMqqGGM/x2AurX8Zx1NaVHeNPEY3S3C9gkt1u4nt23H7jqWdolDEBplfe9bGEFLhwtfxqLSaIRRGj+sYgufHhnXSEyn7X3mb1QfNPSXMwFaJ99gPV1wpwiNrDf4jZFWwvoeV7RL9xr+fAwYw34cawRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:36 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:36 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 00/31] tools: remove unnecessary shared library
Date: Fri, 3 Jul 2026 16:28:34 +0200
Message-ID: <cover.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aeafde3-d582-4656-96a2-08ded90f5e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: tSYhV6sTN3ix8vlRXnazv/OFv7ggGDa+CoCahlj9DoHEiMHBkoPNB2nKi3GZAacLsTRQdqLGLyvlqrKF2BzkjSgshELv8Qe900PdmMLrbGpRK3jwIlG3m1u/jjeN+4yaPv8nEE4xukOXIEyW3KqLXkM7nD6QuQReWTAp81nkMkDV589AI94v+vYDQl5FpDMZ2d4l30HVvf/huiZpCKyEZPeUVwrJnK1rj9MWHNJ0vj9GZrpXXFyi+9yVxz7YMTy2JHg0fiwSLUX2Gv+AvcxxAyk8S5bU2saJCRYd+ygEMeV31Csf4+5IECNzzLIQcvyB4UnYQ+nTMG9YDdMtYMurqXqgHcLWJYhF1QMx+qqSZgQHQv5TcXtYEfdI0ciW5+ZvOIeIWASZfR/7vd3p+pJQEZPoYIVDCW64vi0vxP+Ez+P3ZZBfCo0R5TxLI92SfaFAJV+9rbzI/sXIzefFKcNukRe9jwnoejtBegKm/lO7pOKEni4Sg9aSkGGijkWRhbz2KnHgyhYHpMVweN0sZ+stLRIvofMghi0zMpVbKr3WK3eTqHyhaEuy0fnLZQ17lPAKxIHW3EqB3dASR2ggrEheK89YLrwVUeh6sTxY3dTD/3eJF4s6DnXMQ5GVclPrG6zs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFA5Q1JPSGN3VzRERG5GQ1REakNWYUc1QzArb3NiRXFnRnJzd2I3dS9MTVZw?=
 =?utf-8?B?Uzl2RXZDclB0Q1pwMlcrUUxuRS9sTzZxbjRBMU1ld1VOcXcvWWd0dVFRbmRI?=
 =?utf-8?B?L0RNbU1GbDBGSXdjcU42YjNQbHRpWjQ2dUFoMHpHOWN6VThLSzBYbEFOR00y?=
 =?utf-8?B?TkdOY2d5UklJb1hVZ251eW9pSG9zRXBuelF4N1AzcGgzaGl3Tk4yTlkyQXpk?=
 =?utf-8?B?M2hVc3YwN1ZhT2RsaWFSNnhuZzdXQTYyVVM2bTM2bzlFRXRHNlo3QU9tckRE?=
 =?utf-8?B?ZlUvWVVFc1o3MUtCMEYvSTdiazd3VHNpeEV1NnhHU1k3TERsd1ZRcEFzOURG?=
 =?utf-8?B?N3FhOWo1Y2I1RmNOWlFMRDFxdTViOVh2Z3h6Z0lIZ1dlMmk1YzB4d2RIMngx?=
 =?utf-8?B?bkVqWGZjakRybkFtbTB5aGpvSDJxdWZuU2hNaWVGSTBIN3ZpblFQa0x3UVVq?=
 =?utf-8?B?TkZGNWNoR25kMFNLWGp4RXNOK2tVcStMbVZnMEVhVXBIMllQZGEybnRTU3Mr?=
 =?utf-8?B?MnJxTkN3aExmRXpnVi8zL05TOHFrTGhZWDV5RzVnZ2htVFFMZVhKTHQ3ZzlY?=
 =?utf-8?B?WGVXUjBCanJBZEdMNkU4TmhRc25uWHgrL1E2MTFtc3RRMWJRZTBmL21rRndr?=
 =?utf-8?B?SHB1RVpHbGZHTFZUcFpEemlJbUQzcE5xeW1udExMcHdMZVJBQk1nVjZZZjZj?=
 =?utf-8?B?QkJZd2dTUys5ZWEzakk2bnAxS0l3WDhQSEpKU29hcjh3N0tsV0EyYUZTaWtM?=
 =?utf-8?B?R25VYjA0Vk1zckhTWVhvZW5oSHVJUjlDcnZwU2ViV05Xa0hxdFE4UDRBZFY1?=
 =?utf-8?B?MWdGOUtpRWVhVFQxa3lCK2dwby8rUldCemRPVlY2OUVTU0laKzNlQTZjUkRO?=
 =?utf-8?B?OEczTjgxVm9EUnhocU14dmwvVTFObEgyVWtKc0VHbzFmZE9oQThQeW5YdXFm?=
 =?utf-8?B?QlJlZElFTklCaWdYU1NJRm4wMUNhVm5pQlZCQzlKRG5lcGxhMW5BVkh1UFZB?=
 =?utf-8?B?dVNEY0lRS1JESlBRU2M5ZE9QdkhkR0MyTlNwQ2NpTHlKV29vdHYwNFB1MlBB?=
 =?utf-8?B?V0ZqUjJPNzVNTlFQQ3V5dE9XUlBQMlA1cGNmdUJmR0xvZXJiNm1pR1JEaStu?=
 =?utf-8?B?RXZFWGQwcnRtaHA2NG1PdUU5UWRwb04renJUWTIrTUhWOTlTUDkrL09EZnpi?=
 =?utf-8?B?QWg4aFJpNUNDeGZidzFsOHpDazd0dHlXUkNKNmxHQXdjdTRCRThnNFNYcWJV?=
 =?utf-8?B?NXpRZVhmK3FZUGpUUnlHdDUyWTRtK2pCL1ZJWWt5OEppU3hiR3ExQkJXRWFq?=
 =?utf-8?B?djFLMlp2UkVVa3U5RUpvWDZFRXVUTWZPdU9maHF2ZXB4Q3BiT1pRY25SSWMx?=
 =?utf-8?B?Wjk3VnZlR0V5ME1Ld2tQYXZPRGQvRGl3UVdVN3N0UzRPQ2RsRllLV0lmV0M2?=
 =?utf-8?B?M245cUhMRjdwZVYwa2RvbnlFWUkrYmpiMUJBUEVBM0RxTVhTYkZxS1QrYndT?=
 =?utf-8?B?S2JRZEJTcW4ydG1DY0pGeTUwenFGa2ZXT2VnaWVCa2p3eXY0YnFDWjZXMUdj?=
 =?utf-8?B?Qm1EODhJOStkYStCc281ZEYrdmQ3MlZaM1BBS3UyemRKMnQrSGJlQVVEV0Fs?=
 =?utf-8?B?TjJMZnY5bkZIYlprSDZnMWJvdU54SVdJM1pMK2JhR29GUXkzUHJiTjV3SGlE?=
 =?utf-8?B?WkhlQ1Fsd0xaeHM5aDFyL0pGcGkvUHpLMjJjajh2cGxUZEEwR1RCVExsYWZo?=
 =?utf-8?B?YXdtKzdGSlRWbklZMGV1UlAyRjFXY0RkN0pCWllzWnk2TnBHazFUV0pRZ1RE?=
 =?utf-8?B?dWtqdXdWS2NsREs1aSs4QUZJdFV6ZTB3TW9RMEU2ZGxWSFEzNGFkWnJzSWdJ?=
 =?utf-8?B?WHIwaVdraCt2OUFFWUtLeWxWcmJhRmNtWXp6SVJQaGZ3L0dNd0pobzRpUTFh?=
 =?utf-8?B?MFFIMjdReklGWU5SQklSalZ4WUV4QVNCQ05wd0t3RHczT3VpekN4NXJPaDFu?=
 =?utf-8?B?YWErZWpWTEw5SVh0bHhZcWhyUjFQb0l2QUxwRWZkdHpwR2w1ZzQwRFpWYThL?=
 =?utf-8?B?SmZuVzN4UFhpSmhoMjJWWGFseGNzck9KV2xmUHpJeFJPN010Vk9KVzIxQ0hL?=
 =?utf-8?B?NTJKRDJvQm1DSnlDRS9FTmZLdFRnUmlkaDRLRFlPdXVGMkdHc25Dcm9ISkRO?=
 =?utf-8?B?OG5Sa2xPQm9adlF1UTh2cDFxYzZ6V0I3ejBKMXBEWGpqdWZkMFhRWFJCMHBo?=
 =?utf-8?B?WXZhekZkSEFkRFpwdU5RWE9IdTBPbDdNWGFCcmtMNUs5TEJHcldtL092bU1K?=
 =?utf-8?B?NFdaREh0WURobTJsQ0tUd1krTkVkVVNRTUpyQnZ1cldWeCtEVFBTajRrZmZ4?=
 =?utf-8?Q?CxJ2W0+x6m86Y7So=3D?=
X-Exchange-RoutingPolicyChecked: EYBpC7Yo/fFyHjvt4bj559wZ8jcpO/k3MeDE60y6KDzd7bJJgsLg9SqJ5yhc5xng0+XwWx1q9stMFChWPEuzlWPU9lY/VOVtqhgxyIAbgMl4+oNwigWEWwzY6S6yZXcsPvOWpna9H31RyKzanqpeIL5fx/g8noO3ky0PO1e3SYoVECSNz80NWC5WnbyN2BU/9Opih2/VPapH0OgOQZHqOU9/2KZPEr6IlC5bt2y5JLXR33ayMyeMyACpeVXJyBlAEie+jANoutuUzdlXtAXHFTNVHzvZXyADmmOPRX+xS9o1gn2rABBZFzYJrf2678OUH1Z2OELPpcDaKdIp3l+Dhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aeafde3-d582-4656-96a2-08ded90f5e56
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:36.5291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzaalAizZCZEAGI+DashmrAEkgNlNt24C9cVz5UxEqi1CgH6Bmhq0vq2IqsSoBtARsexsIDs7N/B1LR2ZjWb8zJHg61QQgJ+MRT0xN6PIq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

This issue was raised by the community back in 2019: 
https://bugs.freedesktop.org/show_bug.cgi?id=110249

Standalone tools linked libigt.so as a side effect, pulling in cairo,
pixman and libX11 even without framebuffer use.

Following intel_gpu_top's approach, each tool now links only the static
sub-libraries it needs. Five new ones are introduced:

lib_igt_tools_stub, lib_igt_drm_stub, lib_igt_halffloat,
lib_i915_decode, lib_igt_reg_tools.

igt_load_igtrc() is moved to igt_device_scan.c so lsgpu can use
lib_igt_device_scan without pulling in libigt.so.

All 20 tools: 35 shared libs -> 3-8.

Behavioural differences vs original binaries (no-hardware runs):

intel_backlight, intel_lid, intel_gpu_time, intel_audio_dump,
intel_infoframes, intel_panel_fitter, intel_firmware_decode:
assertion failure format: IGT CRITICAL block -> single-line message;
exit code: 98 (IGT_EXIT_FAILURE) -> 1.

intel_gtt, intel_display_poller, intel_watermark:
same as above; additionally print an extra "Test requirement passed:
pci_dev" line on stderr (previously suppressed by IGT log layer).

intel_guc_logger:
same exit code change (98->1); --help drops IGT framework options
(--list-subtests, --run-subtest, --device, etc.) which had no effect
on guc_logger since it opens debugfs directly, not via IGT device
selection; --version, --debug, --hook also removed.
Unknown option exit code: 79 (IGT_EXIT_INVALID) -> 1.

intel_gvtg_test:
skip message: IGT skip block -> single-line; exit code unchanged (77).

Tested on Intel Meteor Lake-P (device 0x7d45) with the series applied:
lsgpu                enumerates card0/renderD128
intel_gpu_frequency  reads cur/min/max/RP1 frequencies
intel_stepping       reports device 0x7d45 rev 0x04
intel_error_decode   parses empty error state
igt_stats            computes median from stdin
intel_backlight      reads current backlight value: 0%
intel_gtt            dumps GTT linear mappings
intel_gpu_time       user: 0.000322s, GPU: 0.0%
intel_infoframes     runs, reports hardware not yet supported
intel_panel_fitter   shows usage with -l/-p/-x/-y options
intel_audio_dump     dumps meteorlake audio registers
intel_watermark      dumps WM_LINETIME and plane watermarks
intel_display_poller shows usage (requires --test option)
intel_lid            polls lid state: open (loops by design)
intel_forcewaked     locks forcewake, restarts daemon on gpu reset
intel_gvtg_test      exits 77, no GVT-g hardware
intel_guc_logger     --help prints usage correctly
intel_vbt_decode     --help prints usage correctly
intel_firmware_decode runs, fails on missing CSR file as expected
intel_dump_decode    runs, rejects unknown options as expected
---
v1 -> v2:
 - Rename all patch subjects
 - Split  tools/intel_gtt  into two patches:  tools/intel_gtt  and  tools/intel_dump_decode 
 - Split  tools/lsgpu  into  lib/igt_core: move igt_load_igtrc to igt_device_scan  +  tools/lsgpu 
 - Shorten  tools/intel_gpu_top  subject (was over 72 chars)

Sebastian Brzezinka (31):
  lib/igt_tools_stub: introduce static sub-library for tools
  lib/igt_stats: introduce static sub-library for tools
  tools/igt_stats: link with minimal sub-libraries
  tools/intel_firmware_decode: link with minimal sub-libraries
  lib/igt_tools_stub: add stubs needed by tools
  lib/igt_drm_stub: introduce for tools needing driver detection
  lib/igt_device_scan: wire to use static sub-libraries
  tools/intel_gpu_top: add explicit drm/tools-stub deps
  lib/igt_halffloat: introduce static sub-library for tools
  lib/i915/intel_decode: introduce static sub-library for tools
  lib/intel_mmio: introduce lib_igt_reg_tools static sub-library for
    tools
  tools/intel_gpu_frequency: link with minimal sub-libraries
  lib/i915/intel_decode: replace igt.h with minimal headers
  tools/intel_stepping: link with minimal sub-libraries
  tools/intel_gtt: link with minimal sub-libraries
  tools/intel_dump_decode: link with minimal sub-libraries
  tools/intel_error_decode: link with minimal sub-libraries
  tools/intel_vbt_decode: link with minimal sub-libraries
  tools/intel_backlight: link with minimal sub-libraries
  tools/intel_lid: link with minimal sub-libraries
  tools/intel_gpu_time: link with minimal sub-libraries
  tools/intel_audio_dump: link with minimal sub-libraries
  tools/intel_forcewaked: link with minimal sub-libraries
  tools/intel_guc_logger: link with minimal sub-libraries
  tools/intel_infoframes: link with minimal sub-libraries
  tools/intel_panel_fitter: link with minimal sub-libraries
  tools/intel_watermark: link with minimal sub-libraries
  tools/intel_display_poller: link with minimal sub-libraries
  tools/intel_gvtg_test: link with minimal sub-libraries
  lib/igt_core: move igt_load_igtrc to igt_device_scan
  tools/lsgpu: link with minimal sub-libraries

 lib/i915/intel_decode.c  |   4 +-
 lib/igt_core.c           |  47 --------------
 lib/igt_core.h           |   2 -
 lib/igt_device_scan.c    |  48 ++++++++++++++
 lib/igt_device_scan.h    |   2 +
 lib/igt_drm_stub.c       | 132 +++++++++++++++++++++++++++++++++++++++
 lib/igt_tools_stub.c     |  77 ++++++++++++++++++++---
 lib/meson.build          |  66 +++++++++++++++++++-
 tools/intel_guc_logger.c |  21 ++++++-
 tools/intel_gvtg_test.c  |   2 +-
 tools/lsgpu.c            |   2 +-
 tools/meson.build        | 126 ++++++++++++++++++++++++++++++-------
 12 files changed, 443 insertions(+), 86 deletions(-)
 create mode 100644 lib/igt_drm_stub.c

-- 
2.53.0

