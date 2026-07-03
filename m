Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A67C44500
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9B810F82B;
	Fri,  3 Jul 2026 14:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOzhvamw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8EC10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088956; x=1814624956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V6riCmAcOWLJUiWE4yF9HCr01+rgpVxrx9ne78k8ioc=;
 b=AOzhvamw3dQVqGG9mhJXTWdjp7Dq+gP57OOpbQqFS/xrV3FMBTignS/J
 TPFV9F5cMVYKwNJzezlrHUxPpETd0TnvJaF1YS1SceP5OV/qCyHlcqVAq
 sduIao9HQFvRs5uc/rxBGJRRMlxV5DYyLGDbMJKfXkcOnr+f2UQJlTAjm
 Dfm0et2vpIoe9+K6sKrqK0cH/EBrJLXfAHDq5siOcdS6sNJx0wSXPUTSs
 Rs5aeGvQ3Hakmud6hd6Dnk4/F55l7QJV+iTF2X7wIIbRP/lNp1UD8CjN+
 Edg30MY17G5CrUmAL8yA8FUT92vgbjx01g6WITAGwKDYGZ1AYH/Wqo4ZC Q==;
X-CSE-ConnectionGUID: hG7L5WwWQ0KWIlKkHOiImQ==
X-CSE-MsgGUID: sxLdsiE0Qz6VaWMw66a3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756527"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:16 -0700
X-CSE-ConnectionGUID: 4zsY+Bb9QUONCjwvfvDa8Q==
X-CSE-MsgGUID: m0pec18aR7WhXIIHnb+4EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276341106"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tt11mX8FOMkljEhZEQo1Aam016YU29JEOw3FmvfFBgOG+6LR1lOBq/spJO3bHytucgoljBKXFMeD5fudNLH/Hzu8rCxRAb+zLkPbFVa4b6oWuck0seM34yFNLNBJOeCFNNPpgx7cLi6m9kM34ZJMZvBKO9K6Iixsj7KBdwuGVONL9N7AJa7W7l2RzTCUlUFOf63MKHz726wvwfMmFcOHhMIb7EoViSNahy4zfg/ca8eg8zZrv21lH/HGE+9sdC/SGyHsCIHrznkgncvi1XdVnabXbFa+6awZihbfgKclSrflX78tkhvXAiKD0ue1DOWkCr9szX173Uw90M5Ld779/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oFDo+1WiyFJpSIXzaNoKsTbDJyfI/YlEGfIrGYPw1o=;
 b=JkZsw0jHaExs8t9sJ7W1O8nAiW/VGdOVnjak1x0+rtkcwVkErDnTjdPtD3F03PCrn66xwXXScOR7rGY+JtzkG49KOXx3tsHyy2J/fH6Vfjjx5YL2w6ILh7p1eQM7pzIG21OK8/XAwgEioIZ7tMXcQn707OJCQ8qrx/1fmDKTQZpIUSvZXIQwHgScVcPh6+wrAY+VkHu+Q3JMbkE1uU/i6RuEh7B+v4MvT0RK0wKpjzMVNoZM3p1poexzIgr++yR4vpMrUYmmLNqjbwDh/JtB07sQhTv0fgPI/DNKbrCN5Qdrxyw9WxAl9xM9ve/6RwolY8fBsNjI0o1+svUVh3PRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:13 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:13 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 18/31] tools/intel_vbt_decode: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:52 +0200
Message-ID: <2ac7bbd574bad034aab8e8ea0684741a9d1acb76.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5e36636e-85ee-40a7-c141-08ded90f7483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 646nq1pWov7pSXBjoTKqWd1Ugind8pEd3AnGuOeKkQSlfJ6lK/UHmJhFgt4benapXZ+0IFd1gQC8uypBURMw1y2Hz/zqNTb+5yDewVyb/1wIpWilHFTf7f6J/tgawgVpCr3OPDFk75tBC7Amj+Tqz8x5kvtBkHwpfekWDUxs+lGyvVKi3s3xSwGEAIyekKqvFX06RtRB/FoMreA43JrjrcVXLo37YFQdt9qpthxMp+H2nWZcbZm8BhXGALUf4NqcIChZTz/Hzh0mlcQaJoAF+erVc1OnfM8IQR6KcXI8uspP5YOhK9kfkHQz43EWaHmCIlEXt+pK7vn7ewHrJ/ePAaou1pARX0pPFwLuISLjtchmltSWZ7EgUEYvs3w5mJqLLr2wO6dYDPwXJBBxDwKHUoBV1Me7xM18PB+pXlYsf/sNf2XflTLRtXXNzf6dnANdfafi4M1dcVlyiLiG4MgkS/kt0K6ChpLaUXw2NvRZdITFZmMNsve1w8apQ4myqZdPLwGsPQZ0LhiPVdxNN0uAwJU2BvG4FRJVK5tIU/dXOrMY7oHMEvkLgrYgZVzyLzQxS5iemsTSBKkoEIsPrZfPKZsPlzaDL6aMf2MZdrt1zYXXbwGEXUEAqGyNpwwyCpOE3TF9sl7KiV/zRx5uFm3nAx1GJYy31ASwQwQWqS8ILF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1zohUkZpzyixUtlsFxRWsT4ZfkEtafRC9qjgQtjA3bZtEgn9vhNCM1TDpx4g?=
 =?us-ascii?Q?Qd2tzU6ENL0aRdtvQzQ8T5PwDbmbKYbA4affSxrG7OotYay6RVwBdmQFNR0M?=
 =?us-ascii?Q?v5SvjvQG+yWFwNCbV/k/3qoTFKD/RsNaeLpMc0Kx/5iKh3/8DLnR5EUsLAI4?=
 =?us-ascii?Q?DMUBfKlYVqU6N4wmOVAVKtvvWlajxDQveE0E5AahR9VP/BDIYQpOwid2PB1s?=
 =?us-ascii?Q?1kw03VQQfQVMqeZo8iOW1OA/zt3htLlihz/E8n2UZdlFsF+XKwDGlsqAi7x8?=
 =?us-ascii?Q?bFwxlftjIlWhrDsoBroY50iPPKrqFPbtI6S7c0XOr7aMdVjtRR0NkktVNLVE?=
 =?us-ascii?Q?Io4eDhQSIhRGERp6n5hkhH3KsBJIxsReTAT+yzw0cG2PSmC5gSMcZaXJ+baQ?=
 =?us-ascii?Q?5IyjKy/k7VQ6pPOBDdF0EeWJGoVg5lM//kCm84OO9s1MBqaK8kTP/MSPi/eg?=
 =?us-ascii?Q?otIgcjRAdMXfdxFdYP8zMxt+Lfpdt8f3y7I1GcFmJcCaDZmvMQJqZ1A02Qz9?=
 =?us-ascii?Q?nLaPV9C1LgZ1/5Fxa2A06RyaW/Yo+qjicRWIaXT/WlPp60BDx1DUrqv9BcNi?=
 =?us-ascii?Q?Ue3wisIr2aW80886+IjkgZVDkBpfPjLs7FzZr6Q44mXTM8sWlLlq6FR4Z6Jd?=
 =?us-ascii?Q?IwbuRYE2aLKmQC7pvM7OwSvt/NMh7exk9NUOVpvNHVeKqbnxqoMDrw6DiCMu?=
 =?us-ascii?Q?q1GmI5K0u92Vh0wkhnDsfPDZHg1N9QxyemSw9JdP9z2+fFNlEZDh8D7GKPi4?=
 =?us-ascii?Q?vpZBe7E28jgn4ccdw29pWmAwcfKDJGHEHJkfLxmP7+VeHSY2hWyKS/Fes26+?=
 =?us-ascii?Q?7sntJDxrBH6yn6ePUmjkTi7i44b/XdA9acby06NBrPZ9Gyqu0H5XBxNxvxXk?=
 =?us-ascii?Q?d/xjOS3D4EhGygxnVOZH1Rp5obZB7QGiRv888FKBUr/pRhRZ97KKuwm/OZnC?=
 =?us-ascii?Q?MmqnaVkmGdl7TUe6cx/pmuGOW0YYQBYxSvX+Ix60+PY/+fKg4XTLMkYtgMjA?=
 =?us-ascii?Q?IZqIOKgzAMe46n5nIocIrbIbQfX5AIbACNvPTJEvC6cDEUjjJFSuX696GPQc?=
 =?us-ascii?Q?3WzBXNgu4AkFNYqCIRzoTl2MWRVwmn5MDMLScCvNAGdJEYq+4q14N9BRjeV/?=
 =?us-ascii?Q?6ufOny1I+HBbdyOx/zVgum18AfXsVHRsrQTyVJLkJO+ebe+Adbmzlmi+IDG5?=
 =?us-ascii?Q?rmOh9rVeDi8Jos2H1IsS29vkO5b26PzgP5GSDUUcuO3/tjfAlwREFzGp81Dr?=
 =?us-ascii?Q?yjAGWgI3sXNaqTd3vbBm7SKFTWUp7zeMd5wRjXe4HPdY6ACxGSr/azaZRdvJ?=
 =?us-ascii?Q?xSUj5U3C0W6EZD6tjWfpgULfpAuSB0G+5YBWYdqcUiqCCMCawrY7lMFUSZfD?=
 =?us-ascii?Q?BuiznNR7nE1/Z7CYsJZS9u2BuNVCtJ/BG8Xe6bzezceTI8aChVWQI9pprgwL?=
 =?us-ascii?Q?iZ/NushbxTx7bikTDrhccKyt9z3dWBcZD8lrrYOocU3WZEakytGc8iftS0fS?=
 =?us-ascii?Q?nIlPIQyPKdTWX/9G5XXE08Oy3o7khyfOfXmH/5jV/G9GMky2ymvqE2vWAJa9?=
 =?us-ascii?Q?XDJF88maeoeFQ6QI4asYifMcVjsiW8N8GiT2DOlfRgTgzxeweQ1mY9ezNe2E?=
 =?us-ascii?Q?JT/bcLYKGc8GxGXLxKu6BIpZv0+jAj3iUyNdJK7nwE2w9w8eRh1nW0Mk/XmO?=
 =?us-ascii?Q?3NjLjPZYmF6xdXQlyBhwtmjnJfV83NHYlEXfvDKHeofKkpD/bS1+SwppXnUW?=
 =?us-ascii?Q?iHVc3Omv34O6pENLE0KQuqBqEE1hATs=3D?=
X-Exchange-RoutingPolicyChecked: MvYU/MHouHZMVua1B6pSM8SPcHm9m6+7oRA5vmX8EVurXM5ratOrPJxvKZm4g5dV802A8NEDMORJ3QUueBvCXMaCWCruxytHwtaClQwp59Om++TpYbtaQwJ/wPu3VESVH7fM73L0MLDmLhy6HiqIEnVO9Efn761kGPptk9245WbBJPCY5usZiH379R68EnQ82RZsAWy+0A4IyliEEcQIPUq0hkyOkTCHX34F7BIYPihuHgPOBNRhlOe1qS/TMkqYiznrx/aEVa34oUEInOhw+6MaekJzZkflD+Oa55p6P2Il0MISjQuZslrHS7bWkjcHWNeYLJs8yzOfL6sBahF6sQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e36636e-85ee-40a7-c141-08ded90f7483
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:13.8288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jotFdzyQHu9xtFwZi5aAaWyxCH2OGcO1nm/ucqHlAHxAxpWm2XuaG6cOZi4SKmIDDgzSxyrm3wV5B/l1AP5qneekkypXJlgvt6EjGA6OdxU=
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

intel_vbt_decode only needs the chipset tables, half-float conversion
helpers and the lightweight tool stubs used by those helpers.

Switch to linking against lib_igt_chipset, lib_igt_halffloat and
lib_igt_tools_stub instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index b04754c5e..46cf1a717 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -34,7 +34,6 @@ tools_progs = [
 	'intel_reg_checker',
 	'intel_residency',
 	'intel_tiling_detect',
-	'intel_vbt_decode',
 	'intel_watermark',
 	'intel_gem_info',
 	'intel_gvtg_test',
@@ -88,6 +87,11 @@ executable('intel_error_decode', 'intel_error_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_vbt_decode', 'intel_vbt_decode.c',
+	   dependencies : [lib_igt_chipset, lib_igt_halffloat, lib_igt_tools_stub, pciaccess, libdrm, math],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

