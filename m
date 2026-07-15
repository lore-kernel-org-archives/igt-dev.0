Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E3AC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688A410F024;
	Wed, 15 Jul 2026 12:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhmR5tfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD00210F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117701; x=1815653701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pResbyyhcAR7mTq0HEmS1JtcslieCPyKamHWxfZULXs=;
 b=OhmR5tfw1ySm1yWY64QFS/vXDt0pl0407f58HFL9dbf4HMNkOKOWrEod
 ZgWUwxpmjOQegp9joltTozX6xCWzVCZUnTo3G1MymCcXFHSOq1X1Kz3jC
 AwhVe58RLjfqRc8mYpT1dVA4SrvXnpxhaDxveOz1Ow6UwFvVjp6dGVAbs
 0DfUsJ3pSZ5qaqpz7zs0IozODuhlhT2LTuqQPYVU7w9ZOekoSmB9hzZGr
 6v2ZblH1qlmb+E1IQDl82BX+jgT+1G+J2hQMoG6HvQuY73j6H3Dfsgwpn
 Ir5O/xUVjnK5bAEt8EibV1lhxY+A7yNmTqLBFNT2n5n69zFNIFMqyokpC A==;
X-CSE-ConnectionGUID: RLCNx7RoQriUvZsN14bPWQ==
X-CSE-MsgGUID: uNdHIf7PQxe/8p319k0T4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83872577"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="83872577"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:00 -0700
X-CSE-ConnectionGUID: YxFcgXo5RreIshGtsq3gXg==
X-CSE-MsgGUID: mqoNp+u/QZ+FIcp+RSMWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255046013"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:14:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:14:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeW3MGwJ2nihwF/TtiVn1hyZKHLNh6cFkBv6vQ76CUQygKSDRxapTqT2nXXAMatba8cGfySOMCJLvs2Ptlo7CDruk16PpldO6Ro0Mg9ihPWYdyOxXlCAWGGbTcyQ/sUr15Li5SDHKWoavZihk9jn2f4fEPC/44pgLED7BvGBbQQ1IApRkFWu1vLuhIE17ueLGHfIiQ7UVOeM0XoyKBn3GMpRX7+3SapFkTmRnPoBaWB1SiipwL4/d0O8oMAW26CQ2y4NDYhNuRpROO/d6VyPLkt4oKMri8OlBgkCuusvewz6XrCpSWte66dnpm7PLYJXOsOe+MqsruImRP4E3isV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWvR0nTVxE+ccWs7PzaMkmAE/KSCgcmjevrsgEJsDoA=;
 b=MHFQI/hCsL4fgojaX5zAMslhAOfyXEGbZj4LTVLh1myY6QjwzBoUtKJlgRhj4Xnx7Z1gWK2I1EnJ/pPL48/kBL9mwADZXBaTm1R4hzMlTeiquk6p/pR91tV7YseNIeLTchsACObNYU3p40HhFxqun4z2DeEykVw/2CxKFzWwQeDEPqfhxZiidwiI4uIZQOVI9dHGsZ5USFQugzoQcrwjn0Pe4i60/PptVfCzLdop6jPYeuXpwYkayRE1rhBO/N+9sSDjaorSQ0K6Zt/5827+Edj90Yi/3BzuZGtU49WwlonFEMihLgbusCVxR7FKLFNXPTVa1pvTrgyaTmPow6j8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS3PR11MB9867.namprd11.prod.outlook.com (2603:10b6:8:366::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:14:57 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:14:57 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 02/31] lib/igt_stats: introduce static sub-library
 for tools
Date: Wed, 15 Jul 2026 14:15:12 +0200
Message-ID: <09781f7505b66627efeb001534af8b749dbe944a.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS3PR11MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: c4116ef4-e52d-465a-3d40-08dee26aafaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OiGfUv4nWoDrIjKlWYYlxTYsefOFxxmtmzAmbg3jjtgkM9rSVdbvMZ8tkjojtpGgfXXt4QBOfNx6WtzeTXSAAwULVyh8sUXwEXwn/PE7QXiwH4KN05UrewBPrfMQlEPMNxKyvevLZzEhJwFRFXmbpk5R5yBxTezoOH0dfUHivDyiYuOTqhX2Eky0ypjqVc+3eF+M1Z66GIMlcKXow99cKaO8878YkMfcXCCnmSE3uD7LnGzbDpKE/DzFA3wl0ymGBX/Kd7FnBLipgf7YSWe8c65uqsbwPh5j5yrfdReF9E1LYSra07zDmJBToFVohsycAGejC+ozfcUyXmq07xEsCbO21yszVwp9VVY4lNpYDctmRYa6rEiay0Ue/7hE01uI5uHvBx8AvnJtny+oCsFJatYgwNHgiMeinBk89O6v0g7xFzm7CQwJ9ueamHs8Fr+37k5hxjVs+WlknxN/bIVVEC4JwkFZRlJZN3YOdTIWjYOC4y14XCLElevDcXCZnxqBuUIex7WkyyzOttUfTmxArzkU/P3JlTBPzBQXhoHpssoDZQzr9KhHc+eFndCl1pITeSKLVEMu1gHKswjRJAdEC8ZDy4tujiV23AkkFUcvwlfzcJDjbdCEKcwhyyoweBHep+q7yICignwcHYILvQL1D/oycS5XU7bV4exoKOKE4bQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/eTcLlAOAfvry8dH2cBDl7uAfRZX3awy8689wdA2w/Nid8gKP+wTRtUkf2V?=
 =?us-ascii?Q?bWsgwVYzPOoxp2TO6rO4i5jWNfG5zmvgDBzq2k9ARhASYATjQ9hFtpLuq6U5?=
 =?us-ascii?Q?7yEpCiB0W9D68JZE828mOpThHTs1c1ApALjX1AzTgY2kmb+rtu9alUwqrx8o?=
 =?us-ascii?Q?EYNNvGxDe94AHQLAxAh49psjJOVx6S8u51C7n9npzRlzkFPC+GvcviM0wkxx?=
 =?us-ascii?Q?xqWE4FWmyN/oQ38ymGDJbn6PrO79oX7aTApQ5AGcWJTOBSv3zDY+Rq+T07AB?=
 =?us-ascii?Q?PY5UdM6ym1xjp7hOJr4KZPuRQwKPGbS2YHvwZVUKiyKaYC+6Ijm1nMvMhR/2?=
 =?us-ascii?Q?AzUdaS+GxcxS8nfJxK88bekl7C/DP1BTCrjuVYjk+DYN2Y6BFv/2bVk38M4K?=
 =?us-ascii?Q?BXb85Gzuu1b6tV0NciKG+Woef/A06NxArWyZdPXod7FHmg6k7WnLHhWzkFFA?=
 =?us-ascii?Q?cQGz+6Dc0ao9/wozZ1ccU0lUD8FCHDxAcJSHPxy5+0LYnNh8CaE9Gowq3Y5E?=
 =?us-ascii?Q?1J8plBQ+J5DP2ufarJ3dGk5TwpQ0dzGg2lBQ0mf8xKJPR78/WL9XY93XTebh?=
 =?us-ascii?Q?SbacFPfI8C3zPI4XpfILtGKA5jGUmPJxlZzsChSE+1XFkyPIYu4n6jP5a+oe?=
 =?us-ascii?Q?kGkJGSNoG8B9MYvT76nbIBkCB74d6Nm8EFmYJgzGHY/kQ6hGs3Z/lZMuc/ba?=
 =?us-ascii?Q?5jBZs2l40FOE6mx7EnFbrQA4bbOa7w9pQL95Q17alNmlbZJZ88fKzj4/WEqj?=
 =?us-ascii?Q?/qDJk9qhe26X/geVWMN2p9XpwMvG6VYqYG2407Vlfk2VyV71Z0SEVicZxMYz?=
 =?us-ascii?Q?Ll2oPlb3r7UtydO/uHsuRHzmZeCqKoGyDs2MgDKgHsK5sAQaVdMjtNgjuJea?=
 =?us-ascii?Q?P5nXkd5Tc1EKnvLxT7yDJ4bL96erIWipmvE1kU6bVbZVO3Qfz5yrExj5mf6I?=
 =?us-ascii?Q?SyojaSnYZCqpvyWmRTtjOIUpjQU6jD2jKi3kfUfMqKbd1oAjVNdG4kib/LVq?=
 =?us-ascii?Q?y5+H7MhqIMwxwc775nhQah6tgjTE3TJPPi4oJKcO4I4IH6v0tOEN1karlLeH?=
 =?us-ascii?Q?qVqHdCUwIDlndFqxMLXSiy7hrE1QL0vAC5JUxGhR5ahO9OPmJDNWeswL14V4?=
 =?us-ascii?Q?37qfzTXlwRLl8ZwcbGdh7/n9lDtNPf9gVXE03V9dSNJN5oQerO+jC5lETLzB?=
 =?us-ascii?Q?ky3UTYh4Adny2aztd9ENkQfUtPdoBz7OUhN697YsLbLM3OvlZG9PU43XBngt?=
 =?us-ascii?Q?bRb00l30VwWBKebFh9YFVXiYT6yRov2DZXpNUZPjIWJLtR5m6NjDRTFUxngC?=
 =?us-ascii?Q?9riktzb/dJPM9NLSyq1L/uB1tsixdcwbhcQhZm/ohylXfd0H7VyNyHT6U9cU?=
 =?us-ascii?Q?wpgP8vc2fk7g84IZ06sq8opmXBzbRq375lkSBahchOxOrBpAAAZQ1U/r5ME4?=
 =?us-ascii?Q?/0nWm4E/ARWRM4in1OH7RspHJMxUUezrGZSxbjoGJezL2KoUx/DGdXZixhvO?=
 =?us-ascii?Q?/gXp1A4YLNiTeamQ88BDKdl03Z69dG9HTa1g5O4SWf1d/9IW7IqpahoyglR1?=
 =?us-ascii?Q?weRXZDiUTB8JS+wSuw2GeA1s5ZwNkAr67FzWt2b7yJdR4uFg7Uc2PsKDkx1/?=
 =?us-ascii?Q?o3MqaU2YfGFYW7lrBSB3H0rILG/Dfz5WYwW5Qzg7Og/Kqb2gRp3/LRyBo81w?=
 =?us-ascii?Q?CGQLLc4WhHFA82dOGyCJH9wjTJbWy8MctED86vdD+xdNhyFl1Q7gDiIkj3o3?=
 =?us-ascii?Q?zW7yq9a1DwcUmo984g8W7ZUzmd81B1o=3D?=
X-Exchange-RoutingPolicyChecked: n2gHCkgj06NAkK3YznKGa1r8x0oT3bKeKGlPgj8WTxQ5UAhjoKxo3apfXpninquSMMGE5z6aTauBlOvCeUfHZGxVK10uQRoSoEva2ULMrLqMw+lfgVhkJfFG1ZWTy0WriW6qZvvqlqoGb/FOCJttBPgIEkkEky6uqLhaqmlC7ExXl6535q8KVCWAHKBZZblAGi9lKFKYPFxarwsJ9jdID2zI3Cal+s+PtEWGB0MDsv3r+VpJHOW32q4lSGJ8p8BwrKrCdOe7/J44RAvSH4x7PjlivEjLOJ4GNbn/RW/giDLaVtUab6PvV8UFYk1KxRTUX+6wWOzHFv+vdcVhWK83gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4116ef4-e52d-465a-3d40-08dee26aafaf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:14:57.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1R9DZdd3pj3zjlWQArMwNWTuipa6rEbMR3eeGyzYrwk2ISYMNyGXFeVu/2QdGKNCDg20FUtLbHXy/mIeOhKpH8z0SsOMmgjO+Y0QhFgs9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9867
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

Add lib_igt_stats built from igt_stats.c. Tools that need the
statistics helpers can link this without pulling in the full
libigt.so stack.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/meson.build | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index e95b29d49..a57c1eb8d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -397,6 +397,13 @@ lib_igt_profiling_build = static_library('igt_profiling',
 lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
 				        include_directories : inc)
 
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
-- 
2.53.0

