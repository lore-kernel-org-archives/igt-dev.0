Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA56C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7510F82B;
	Fri,  3 Jul 2026 14:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBYs3oo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A7110E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088943; x=1814624943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=s1sHOAtqDvEO9gbpPWPaJR9GhXO8YwdIfygXo9vPJuw=;
 b=MBYs3oo9Q/+hYHqlQwIhTfvLJYOUCd8T+cwvU11oALR4QxJ/yl3+t/wX
 N6dbyGJsVPCU9hB5gAlToWNIkziQQbgNKCjVTMIRQj1ARX0s5v3CFTeaQ
 EV+paaGQeD0/aOx9vP3vtA2jfYmpVNqbRSnAIWrYUBuzv9c+8WsXUtFJ8
 6vxMTWEzOp5lh661aA5P3o+16lB+xNrTtIHlmGNyxKgrUbn1ODp3RvodM
 nsE8SGGqgm93vUdwF+glhdqczKgI64adWpqP9xwnmDNdPvt3nrJojKI0f
 iRK8bvG27irSL75vDr36qg92qpIU3i9HPYhJ8l2pIGlbC0njw8rO5M8/4 A==;
X-CSE-ConnectionGUID: w+9ht4k7Rd6+Opzzkv+X8g==
X-CSE-MsgGUID: 9+ikjv1JRiqcTsSVC0R82A==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264058"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:02 -0700
X-CSE-ConnectionGUID: clc+h18eRtWXOLYlSOnMlA==
X-CSE-MsgGUID: utim/iT/Rpag164oOUfelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019475"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mt8CVVaqzE3MiYKoHCHby9iEUzVA49aqoo0jcgbQnXiPKGKrsGdigC9ijMv6xru5iAlK8Ef3KQGH0paAJuHSjshkX3Fx8HxThbkq5WV2qmZBKBq5vyQCen7VeO4YcxR7mMRvy1SjR6jZu0C35CTzg6RXe+hD2aMjZFAW/rzbdyobowBNeQjvx3aRijqPVWL6nk0LocoC1TMVlnJWp9OGBOgmqWxUetde8nC8wcxyC1suOSO2i58FxwxWH09R4BhzqOM1pWD5ZmQI4+EWdgetu3xTo6Q32GgKqxtTA7trtwMcWDoRL4hI9oGmDdHa+rKit99RhxF+JmymbeOupa1tRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCUmeY5qakwQOkGVLNWLNs3032gSGHgPTTX0nhvd53E=;
 b=by8qeONNoPMBaPz6jBRoTKaa61ft5vRDgklePsSMVGasQNM0y521aBfdGyEuas0CeGrBFzI1Ck/Z27+nMfCSonMjWLdAmSeybHtXk/hBSIE19Vvhd6FAifW0znp/UaX5FKXYeeQsVl/l/J/hwABqvUdiNo94TZzDTcFQwQul6B6XkAm/kTx9HX+oCUH+sNz7VmRVo9Jjeel7QGlUpDI8HAbdOvjmfMDgNKZ09GIX/fDdTHbu69JubsXCQJpRpOYOslqoFZZbwzdWt9Ph5gNN9fuzs9/R5CWGu8GeZU4STzSBwZ6vOqNuPWTvdDIYILrrTX9pq29gKcy0/x68R8B9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:28:59 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:59 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 11/31] lib/intel_mmio: introduce lib_igt_reg_tools
 static sub-library for tools
Date: Fri, 3 Jul 2026 16:28:45 +0200
Message-ID: <7e226059260f0ebed3806fbedd78b30e56ded955.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 50bfdb89-eee9-45dd-b071-08ded90f6be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 20zlaVbGdEVT1Su3SZ1cLzpanxlZlZEvU4i7FA383+kCzkBBFK7DO7xqOeK5BwjPOV8QuE0s8G81F+l0YDaQD/b5HKu/l0+K6vDRKjGOcT3tlULUiwaCjG6Z81/oRjVkBshCvBLjpfzBHjp1ns6vqhcBIMr88ILjZaa+9bzMiUErSwYel7ZyEoPI38khYr1lM5n1vu81WSFQLWfWEJ0VQU5Q00u9NpaEnhO/FWBFaguMQkh/XP1tZzNG3rb8Oyv/h3+4BObmf+ceo4TCfmadKEI0I9c5HvGVW9Yr+CtTqaBDWQvOH1Zt7LrFLApkbSy7dSSoI8+7JYTPy4PLuSXiqIf3szLvB2VcmwC7VZJtGp6cUztM1txdhAEU+O0Mdy+PHkVurwYnKFTpJ7Ac/V0bTpGKWczjWB/+3vNrI4DIzFGNqG24QWhfw6RLFoS95y4t7gZXBx3Ok//lhFcqM+I4senqMcpS2JeMcmajvR0Fp9DZxmKH/BXetHKDqsQPyDLxmYLMiIMlwdTLN0JHOUeq2i1gopDdtNTuJll0o3uvERD3RxprOcGGjAjZz6ENv9qV2lutftSbfFYp2Std4a20LOZ0Ib3GUvN3INEWegMI6cekeUIOrq87Rod8X7s48BB6eKoxxrM0dqCLk9j3RKi3pWry1w6b/jr9ZTlI7Iv9LdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ImFpukuiGas/jBfIvSGHA6fMsfcV0KiM1AYfxp07OSTVG2/5d2R4uUBbvHMj?=
 =?us-ascii?Q?VWyv9P5mOsTHP6GYYY6iqR96kADnJsTH6pZihQU4oyuisTL4hxIktzi0YUhs?=
 =?us-ascii?Q?gfL2n7zXuH0InJQHJSMcNUMi3h4JtesKKADa5Z4/VZlsWuotyEItPJrHlRxh?=
 =?us-ascii?Q?+693F9gX2M4PyekVygKUygmwFPaphv9vUxBMojKPF7LonIEEvj7R0/JHBocq?=
 =?us-ascii?Q?lJRJNCKhjOHBqSI50eIIJS88I1S6ubB4JLrGPwCicQIje6rDGjkVtTWisqeF?=
 =?us-ascii?Q?LBdCunogL1Tx/0XV/UX1YW1KEl9bTqoiCbtLJ+w+4UiSE/VjAfgbzjuOteyt?=
 =?us-ascii?Q?fOd2NW54cKINCIb2Fd08ue4rS9CWgaGySaLLqoA/t5Lnqw5xYujuKtA8UcdS?=
 =?us-ascii?Q?OvZsrh2L0IcVmaMCw1fM6RJL4EraTucHbwsNzo1vhqXP9iU6Msx5uxg6tHS9?=
 =?us-ascii?Q?VRADiX/UrUMwolf2BuAqm17Zp/7Le72HJzKfzt3kQGZoJht4VGcKnsJ/9BYO?=
 =?us-ascii?Q?dR5a5is70FtSSeZoWQ4kHZopRGO/Nrusvr62YcW+iCJ6QfYAW9xLRiiINWKA?=
 =?us-ascii?Q?hq600uT3NX688Kevkb40Mr0ULW/yyPnuyZXm6TJeV9KYmSC7P5lbTXPzE6Yx?=
 =?us-ascii?Q?OWlGC7ZmQ4yegqIhXtqui7FAHJdPgSHdi1Wa5L5fX/I0sxkJgje9RSwVwg1P?=
 =?us-ascii?Q?PzuS/MgKttETLxahq799L3oYXXLcSX6by1kvrFUfbqmY++SQhDXMlepCjZ6G?=
 =?us-ascii?Q?A44PAmxI4FKucPQGyQAhw4hHuNWbIFs7miAmDwb14kvfw5csAlv1i6sYFUHQ?=
 =?us-ascii?Q?QS2ULIYs6CajiEks2xgIWp7s9xG//WGoAlKmqLzuBZQZ/lU0/mE/wpNpAGi4?=
 =?us-ascii?Q?C0psXoOQhWV4xinuYjJsOLH3CSCZh1QJRHGAvEpNkQ/TAcCs2Y2SxSpwsbGp?=
 =?us-ascii?Q?Ho/gjaLkB+N0sSavOI6F8lebmZ7YXxKOQNZ/unHc1HAI21XK3e2Ms1eURA+E?=
 =?us-ascii?Q?zBMLn6+V+yexVar55Ff/6KaxLkaZxHT2n0lT5ktIYe7MStoCfVz/gxtatnyE?=
 =?us-ascii?Q?sfDvvZ4Mw9gMUMsVjRizKDHbKiLNtCGDGx0kuNUQk+vM6FXYnbbbozZb5xbC?=
 =?us-ascii?Q?aOwTO3DwuW1rmAeHhizi36/jxKA/zPE6UiSPxub1KUkZHAJSEKteIMR6r+va?=
 =?us-ascii?Q?RgzRWCdUoHXnsDnNeJ0pM4CncRzjwmPMYnxJKPU2b+nqe5LKSKhKDVcZxqa2?=
 =?us-ascii?Q?uuknMhwF6wonnU3JBpQxFpVsgFnEppsvmIWrNXywIBODDNeaXHqc0jwfj59b?=
 =?us-ascii?Q?LXz2J3UmtQIy+bD06rfEP+lBss7sV/cfYsBjNvLbBRgkb2NW1ORz67y0ynYl?=
 =?us-ascii?Q?BHTlmhl98chb+Ctm0pxiHiHA2fRI7uvcG0viFXPkS1WmbkDwqP7KXB/hbPme?=
 =?us-ascii?Q?VQmf9Nc+FmWYSqC+29iFu1gg07PHKuElTFBoDfH9eIXdZnCUHvpWm7D0KLPA?=
 =?us-ascii?Q?DGw11HpLubtC0/wZmzY2gkS2hk+Dns7Dfkng7fMzaigyoY/655jZy9xkLwgJ?=
 =?us-ascii?Q?bPQMHBBiipG0VMVTeE/hSXeaASC7SImSA6HqOnI8rUPRrypmMmZQJUyQ1bFk?=
 =?us-ascii?Q?RFej9xelmzBYfWy+KD+E/Vh/oF6CHH0d1Yp2vGH0LJiM7cpsUMuEPrdo4rdi?=
 =?us-ascii?Q?wNPhNG6VECea4xp1aBOmNJxmBWZ1l1AQDCqIZC5eSRJ36Dp4F1W3t9h9iVlD?=
 =?us-ascii?Q?RHCoa+kk4pU+P1pmTB+nlyCwxCjynM4=3D?=
X-Exchange-RoutingPolicyChecked: s0mD549rRuK/36hUag9rwMm98a7PKjBUhIoU23T9TnKSHP3qQSkLvCYy8gSrJxle9cw4cCNpcW+NbHEfUMktxYkkqfiS/mDUyN8YvvpCVl69KRoLAV+/cvVL9GsI9yFxAskZsTSjDrFK7z1nn5wrYTUhagxViL4nkflMhNhZthClmJrIwrDu4t/lxPr4rnBYblczNKiTNmxAsr6DLt1ZFWsFdnBUX+4swjnYbwlWaAzd2hQmPr56ruDckmpo1gxTXUXHyBt384uSs7xJWxIVtcPMIIJTECQHmHcsn7bOG2CNeibMcsthzzm5lfZk9VyXkoSXuXPmDAVGoYRL9wy64w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bfdb89-eee9-45dd-b071-08ded90f6be6
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:59.3669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJULrE+wXayCpBws5/v5Jf6dQvihGI7ppdidv2J7F6Ryo/go7NupCTfGx2sNXKKt3EtzoCdzEs2w1nBazN6xnzPlnsbjTpi1oJXD8lNJ3mM=
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

Add lib_igt_reg_tools built from intel_mmio.c, intel_reg_map.c and
intel_iosf.c.  Tools that need register access (e.g. intel_reg) can link
this library without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/meson.build | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index ba4ece3a2..43ae4ce66 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -435,6 +435,21 @@ lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
 				                     lib_igt_tools_stub],
 				     include_directories : inc)
 
+lib_igt_reg_tools_build = static_library('igt_reg_tools',
+	['intel_mmio.c',
+	 'intel_reg_map.c',
+	 'intel_iosf.c',
+	],
+	dependencies : [pciaccess, libdrm],
+	include_directories : inc)
+
+lib_igt_reg_tools = declare_dependency(link_with : lib_igt_reg_tools_build,
+				       dependencies : [lib_igt_chipset,
+				                       lib_igt_tools_stub,
+				                       lib_igt_drm_stub,
+				                       pciaccess, libdrm],
+				       include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

