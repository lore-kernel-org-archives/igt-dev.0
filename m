Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377B1C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D193D10E390;
	Wed, 29 Jul 2026 11:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsQdQJge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820A10E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323011; x=1816859011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xg/SQtm1DiNFjY8yEuFOPVvPpHZg1n0tya1zAVlpm7Y=;
 b=TsQdQJgeDc7eyG7XoTPckPwUgc75UsCKz5yrQwBACdmZuptkDQjY91w+
 466SNyOojaFj/zZ+BGIEH0ffxyWKmH51YGlYmyRU0MUW777hewLbBwTfM
 8uxygtOSg8wBA7dM0eJUsvCFWTuDV4eCfusmaFcZlDfJSeVgZUrGX4BvC
 S4wzvQ1Eijp4LslHCacAodozWjgD992BJRQr70wh9VI922rOUEwl/7cCP
 rPhqIKykX9+42QXqhsf2Bc5fmmeTXA7LvrhXHCys0Mc5XAS4VW+xKGjkG
 3rZv9dQAYIG7JXfG8ufJAH1lk3APRRdKsmqqZk8+xJ91NbCJJ6u/2zL0J w==;
X-CSE-ConnectionGUID: q6CeE8HlSM65KY1n0rWDjw==
X-CSE-MsgGUID: tu4l4/41T0aEToaYA0Zcpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797618"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:31 -0700
X-CSE-ConnectionGUID: Cu4PK2yfQFmNVtTCCqYFXA==
X-CSE-MsgGUID: mIp9zMUWT6WuHkS0bVK6Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264114"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:27 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tavnRoRRkuQPewrNG6p4ZK0YL+VzLPxQikIHA7Aut9JUcizCAG6H+1qL/+yeghxaZTQ5M5yUUEImslwJeT8lX89n1SrgtO26zIwtvmzPCX2na0kbBJkh1xaLa+Agva0/cw6audtNfw97vOsv9SRteJspktsT50fH5Zykdn7BS69TRTv7lCu7nOpOJE1mtA/wn4OrMyfsITMgiDD29WXdEHmCUKTBb+aTkv5QLCMW/pk7NfpTmUE78b1g8SJoj1JEJvFkwI+cvagoQWRD9aYslPD8WbkkZGZ6Sb4VAkuQi72GCiduFK8RlpayUJLIMLXyu+JkpUV2VwnoBQ8I1nSuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZOD83zOD8gk2fppMm7SiyKX3OJa1J0ij9otWm9dqMQ=;
 b=rQoeXY8cTnZzes6muS7iE+3TZmqwjI1zDps/APpuOyJJGEd8CgQrQA6LpoMnzI++clA6IFV7iyryBowqCpYK/pAnAuIm+TbVfgQ+WUA5HQYQRco0fA5fsK8n2ykh5w8mfMtM7PQRB03jRquN8F8e4jqx86I0v1qskx7Gvj0nePY6itME95pa2tzlb1SOdoHSLFRJnG2Fv7taD3R3ot4cvTQpfevHt2fKrhTsQc/eTvtcda2RzSBWaAKzJ6zKfeKQ1jSa8vAft4VLxhs+pq8nRP5L1N+as+jhDiWZoYUhppJD8szEVINUYU2i11cG+hzZo9tIc/RONG1L7i59REgubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:19 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:19 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 16/31] tools/intel_dump_decode: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:33 +0200
Message-ID: <41eef54b0e28eedf69bfa54bf9a9e6898dbc5f64.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea7b2c1-966c-4e25-db51-08deed60ff1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OwT7GB3o6Fbu90fDfcaKhpOeLjDgc96HP277pz1bbRq5aUtt5x5bUFaHGrFyepMNhnvjg2vQDHxb5KLJSCxvlnhlWP6P9a8dKImhCAW1Rio4BGfK/azoCHvag3Tnnkan0/kOBR+aFlL3b/5tM1HJx1/6D9UHLbLa8zxA3Huil4uyQ0D1/y8LjoqJ2s8gQDDp9yM5JwMI4Y2v2HOmcLsnf0mCBNKgyobBhX3trKizogWPF+j/d9CEVo/83cGZZZkwTBWm2mfjjgPlJOX3/yPTKi43/tFC/gP56mWNXq5EQPAm2fE4DGEiBxN1xN9HhVx+Yn6hHQ6n4QaM4/Lsr5jV3Z3WAlY3mKRNVMS4+WkjnGCmAziRyb4Uu6FJTdnF4qrPZ9FyDRqZlerMwaZBexoPZZwHKDs1P98QGvKiSF5QMHXeZ/x6L+iSasE/c6i+PkTzUacrhcrpb2JwjXKsORV8jjORdpbUL42vO82xY52U8ZyB0MmO+V9I+uYC4F/SDqkX0BvvqO1iAmZ+BJe6ea+XDrk3Q3B+2L9HilZRyRGVlStvIDLVxhKJRtuOpw5Vxhi9m9MBlcYbunbi0XOSQ+pF8s2nekbcv5CeSKdU/e+lqoczqx0z2J4PBUnfl862gfLBNgxWNf5wzNbNYFG3VEXKOs2Wr3UqOo4UU7Qrb1ObY1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apwG8qp6SwihHdK6f77Dm9CmCuk8c1Iv0r6PM/ISW3/088fvPZ8ZiAqdWo1o?=
 =?us-ascii?Q?s1AVOgtB3Oc7M2KKgTlKOmFxDnesuLcxiXV1yCz2It/s43M+DLCldpE8erzp?=
 =?us-ascii?Q?QTFxbuJI/m4Ib36oVlyV73x2jBaJDDfLQd6q60rAGJd/EtqpJfim4ED+9Wnb?=
 =?us-ascii?Q?33PHiuubG67s3dfDdEjL04hK9gvtRSWjeBy2ust+Oy0LnBhrsKIgI9q5ADKR?=
 =?us-ascii?Q?14zGmOePCygokyA+/cj3Md9JJ+Wz3zm9eLFuqJkGT2flOL1Buo6KR3M8URQ7?=
 =?us-ascii?Q?OjQ/QIoPdpqlAMbmzpJx8/XpRroYmcrMjdtGFNp8j0aizuU7pJtEHCTa1Jw9?=
 =?us-ascii?Q?7b5TjnS2HInvmm5/l4u3kyJWTWpzKXhUXoPJCXDFRhBv5KcwfdOHBcr5t0wr?=
 =?us-ascii?Q?YFsd9eCSQDEE+DQJFhVjURnbe2NDOpQjTV977s3WbjKDK1evYtJut9zR5nX7?=
 =?us-ascii?Q?eBB1RgVhDJmyKnvUXx9EUhRoa4z7+7p02Cfx3Y850ruljB3iYXL8T0qonDnf?=
 =?us-ascii?Q?tYRSANFL4rp6U3whUC9Fytx7get/EIqTM0IFUDiAtydJzlNJwZr0LyY7s9hi?=
 =?us-ascii?Q?tVb3r2N38SAwTC9ym0NUpvQrdx6RRI8F8YgpnuqaQ+8aGHCZobpFGSrKdjl6?=
 =?us-ascii?Q?7cLdv2CImnziLeVlbUSVmdaJSmECyDC95s5eSzp+uj6bjv4z7mrErFMoAskG?=
 =?us-ascii?Q?gsECWGmzE0xpo85XVjF8dSr24H3DYZIMdLlgulJAgFYYtTG/IkksMmlvsN4M?=
 =?us-ascii?Q?976tyShWV09Jhbr5+nWdiBuLmXQ5wmDA3M/CpnFsqbC+en04Kbe/kmZvzTb4?=
 =?us-ascii?Q?pIYFlnbFpgTkjQxVcZowzzMxXYaiQgjSuEoGGLMWE+GpCA6XWe/U5meCqFvq?=
 =?us-ascii?Q?2oc9XrrxfxloA9SB0C092W+zmDKPhvjzTuqtLoOWdmV20Ah5PyDghvPJoh5J?=
 =?us-ascii?Q?I6dz2reFJiZ2ONywMkDhNXsvNx5z86j64VIEhKG1yMp1WhaXgHyIetid6o8A?=
 =?us-ascii?Q?BKsXAfzW2VEr+zFH6iHNfG8kUW7R5tUAoWeyB1nH9FRmBSXPmnACPtZG7Zbt?=
 =?us-ascii?Q?fa9j59X57vTUuPW4/lhZNSEvCT5UYA+jSoz5EO6H9+yFuKs3Jqdc2jxs/Vcj?=
 =?us-ascii?Q?KsocP+7OlvVy8ZGWISFXCgePJaHiyyWcCmg1vWHpP/JY15cAAUuqL/Sljy6c?=
 =?us-ascii?Q?NNc4sqa7cQ8ePA5xGoukzMjkoR1YBTwsWd9nxtu7hg+FOnjycHfidLtq2xYL?=
 =?us-ascii?Q?dtZX9Tii6vLaW4iDdcXzJ5jL4+qq6CYpwz+cEe2oEbxiHRiC7lW9+/sxEUKC?=
 =?us-ascii?Q?8VjN295xiq2JgGYQNiZ27i+zx3b1SEGqPxLQLBsJDwoA4czoIMxj4z/J5kRW?=
 =?us-ascii?Q?v/DFZTQkkuFDcAWo2UHby5/IGyjnS8aEe2hBwMsHq+bvIFwrC4a8GyHd9GZt?=
 =?us-ascii?Q?upgUiHmZvKXaWsip5Ic3gEaXDEr5Nz41tPVg1758PgppLTKGNgO0imDyk4z6?=
 =?us-ascii?Q?ou61QfjcsoSrsJZ3GqOldl+T1uCfKbW58VQvpAU+3q4yW1OH4dLLV61+bidW?=
 =?us-ascii?Q?Z5h29U3ExQcvxZXeYDzDYagf3aOGEQRUHSqDdYkEeI88b5uvmxUbwyssAsl6?=
 =?us-ascii?Q?rwJJySUK7SQuH0hm+NUUgpyCzLHXWFOg3FaGNgaszHjfKTm9XLc7BMXgSoNI?=
 =?us-ascii?Q?KJ0WWsJT6XBYH+i+ZNMWrH4egMJ67BoAQ0Jv1yqf3GsZC8VebX5tktFK81Vk?=
 =?us-ascii?Q?qxkZ0KzBGxOI8FY+H8EMTjhPyZgltSU=3D?=
X-Exchange-RoutingPolicyChecked: J1gcER9C9aL6hM0MVFcQiOVA244hw/Odgk5wuIro2HtOtnGpm3CS39TM1UPjVHgDDjAykHadCyaLww/uxeXpC+6NubJc5ZjgBQWASH7u5Mm4rxvkwZHOjD8F9muYIBywHU1SYOrLa/LM8xbrJf4uoT+FSfGF7++kCTFNOedqadpZ2C6bVd3d4hYtzT8mWGOxNBHCJf4y45YMPbyf88TqqZoP8S12vD1Bo5ATS+/WpsZpEZ6OVtk9bor9OUOz66NAjLSKTmMUAl0Rvkwe6H5Qj/LMFHP31aiLULBE2YoSFUuWrMzP+Xl6qKnJtfKqtvpx0NnuMMLtC6Sm0Q/IVql3Xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea7b2c1-966c-4e25-db51-08deed60ff1c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:18.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXpm7zyA4y9PDCfdlnRi6JSwn91rdlDpv8tx3jQSHyiVkRgL03AR+xkeFAMrs88SpqmvPHxO1wcsnbp4IV/2OC5fbEHfRz9AA4S1OaECfLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

intel_dump_decode only needs the i915 decoder. Link it against
lib_i915_decode instead of the full libigt.so stack.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index a3fef87a9..467b8eea1 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_dump_decode',
 	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
@@ -80,6 +79,11 @@ executable('intel_gtt', 'intel_gtt.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_dump_decode', 'intel_dump_decode.c',
+	   dependencies : [lib_i915_decode],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

