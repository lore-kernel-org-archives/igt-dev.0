Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC73C43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D0510F829;
	Fri,  3 Jul 2026 14:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fN2gNMn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9886E10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088967; x=1814624967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h+HLUy7R6cSbOjP/TGiN62/PCPP3vdGVnSNT0nItoA0=;
 b=fN2gNMn3BEC+mIs0VDskoCSL3g3df/KzyNe9/sEHe1n/4Hvfv54msDcu
 x2Z6mlYwD3T99tgHni9qbuq8hZWdkN6uDqo1YPJ6mqRGCQV9c9cBzeQbS
 fDHNbI0TmJb4iURBXDO0tBceRAtJZ0pJRYY28V0HzfyCzDFEkbaxoYWFT
 ARa0YM5WkAfc8MjK09EMrdU0qUXk4a3GSLciK6Mu3wiKrkxmAnmlkG40u
 xQGUf/69Su2KYefMJOKvacqZ5W5CKvVt4u4nm3qW/LHLxHMR5iZ9XaqGV
 sphuAghy8apYi5addBd0zy57lBRNS9n8dBgthx0hxHpNDl7YkHNP1dNeD w==;
X-CSE-ConnectionGUID: rYPxLF2USbWKfPZ2z5ghDQ==
X-CSE-MsgGUID: 4xgq6t11SCynAlmysjpViA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101264098"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101264098"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:27 -0700
X-CSE-ConnectionGUID: ma+Pd5kHS4+USALbtXk9kQ==
X-CSE-MsgGUID: lzyYa6xAT16vENTUhcpmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="257019591"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwmBX/6RRqEB4wV+672ghwocYowCRvn6f53k165Jqk+6vqljm4MOBScujR8BcJIE2Fea0hH10OfVp4D3yrXoIlBFbXxyfopCQ6JFgJnnd+49kizo9VJGMDLe36+2trUbu5Z0vaOc0mKIdhN+Th9biOSO417p3tK335WNB5k8nRd0Ph7+CRYLVgh02gNqqB9gtJb2uodt6Wj4wCxLFDKmol18HnUgrWGrvHw7ndDjM2taofRLqN56Qgc3Ok6pH8/K2+iO4klzeH54VHTdje5gk18KFRmZ7tEIbznH3hs63AAto+8B5RpWuMmSgiaiWtTrVtTEAHAyE6fqQndgNFPGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SErVYe2EJ13InyZSxhMntqw6x3SiDCZQLT8dgIrWlwU=;
 b=I9BBWBhRn5O+7GEQlReZLQCR/vRa4GMAejd3ie2rjw9JO5Yx3/JbJ2NFD4quV7p9gOL9Ze/KDQ5K2WPQQYLuCB8yJ58Dbc5ySvcv60IOi6kMVODJTiJw373IoO5pr/XY2BX2dwRSwOgzEgQBopm6x4yKtjuSLMqyRLfe5Sgpgg7WnGJAzecGeTA0IZBHCnBZRbuo5/IjvM1425jqZ5kKGO4gRaEhxw/GYPHA08AQKdQ8H7MYvgjmKoV8/HM98N7HLqcXOMZdoXuKyeiYyyKbilhu18hFO07YCdSZI4IQgt0gMirJD561MhXse/snhowY9xHIuhKO3hd8umr/IYuTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:24 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 23/31] tools/intel_forcewaked: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:57 +0200
Message-ID: <5aae7a25f6c0ea82c1f9cf6f8c760a901bd70901.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: f801ced1-9a19-4266-d3f6-08ded90f7ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: DR/RvyjhpYpczZVJ6c80X+0igsgmiqOYAp6YmWJA4G+pU0F+dXyMXo81ht19dljwoENCZyMHcpQXZoedUxNKe1eB1/OVGDNe/qR6JDiw3d4OoDSttynXjALbpoTLvL8WQFii9uK4vxCjLeaNHQXMtRgVIWAgAzyS8Xjd33q5dBLyWPgUHT3nObJBjGQd114MYhivuAl7YUeJV40lLP7zi5+Q2IGovcSDcu/yAeQHOQ6023frrp9eFOKTFAwD4Gx8eB6CJWW6oefxIyf0vlmJCNzMieRE7qNA3ksaRR3fmjJqJAMRo6hQHDNVWOrcnGDxdl4LDAb4KwsE6cIN/2H2aUR4SX/qhl43oS11zASRDqeNYq7/kbhhOTxV0sfxQA9dse4axPhpiiswkYkId7T+w8j7Q5hkyQbn57urNqLqzh0ITtWl2H63VhPQ9b9ezWwP9DCCzqR7rEEk5HDEFENZPgjzecGi7OlOCLS4ofT/fyvltL0yEp7+cbJl3qEXDCYQgg8KSblgBJjAZCEbb6Nnqhvu67dw3JkpFqSU4FFQuJioHF7X/D2oTfPwjNaQ0jxNB99xi3TiZbDRp78NXYT5kBB5U09HFnzpxPw9woNQ8yK6whV6+69SEPMolnAsQE8pcw3X/4Ouqo68ejFXyHKGO7V1Dl9SoYQ9ondVwi60kQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4lC7YkzAZ3+G6dvbtAKhUhJc1SmGZh6PhC5PEDNndB0P/GnTS0FMB870KFXF?=
 =?us-ascii?Q?U7Kady+h3qUH8qPNTeigOwV7VTsxKy5BgANcF9FrJSh0RJvEK413sl9qykvL?=
 =?us-ascii?Q?CESQMw2UbDVGYNp4JbP6kWk/SrKmkFZ+5eQuaZvJTezeDL3NA15mgl2vgRW9?=
 =?us-ascii?Q?fb7Tb/e1SzMtwcPWEImq74okc5gyjXg7jaAM+gMk/pql9g0AWd9SH8lEg9Yh?=
 =?us-ascii?Q?ejPFSbMI+nr+LKpIdsD9XNh/h9AbMwJoG67i7o8A+D7i6OTo7NpmOP8CUlUS?=
 =?us-ascii?Q?uRt8QNEDik0AijxfDUOaJRE3ZpE7ICoPHhcTjMtZWBKrKG2WGqVS11/Wv1L7?=
 =?us-ascii?Q?lPicyQW5uHRnnoCwyBUOgglov0qSrK/hnVTRZrKpskMp7Fs3Tb2Z7boI0wX4?=
 =?us-ascii?Q?+P6VYWXQS8yR85ly7R/KvBKARC59/aAjSushIsjRH9wcyZ8o0IsSZzZNPTw5?=
 =?us-ascii?Q?+hpXkj7xFkiULwvvx0FIOOO9OntKSu36vl/T/ZB/HGIJhpB2dRBJFCGONNFn?=
 =?us-ascii?Q?uQu2URz7hJikO67PyelA7iBrwvQXnScxFZBkESNXn4eX1+nr45MnKwfW9A7F?=
 =?us-ascii?Q?W6+KUHT22sMrxO3pJhUYX0gU27aczIdLD+dJWcbX9kYC2WVCP7evQo42Vg9d?=
 =?us-ascii?Q?Jf6YGYT70wQoctReIjucBzUn38nhTfFWv3kSddODM+N5aLixehAZc8/icOMv?=
 =?us-ascii?Q?TFFu6cqBHwkEYq9Ab5tfvr/F8FYo6EILf9B8Y7eQnjfT5/vYGBH/7ETfAkkf?=
 =?us-ascii?Q?IHo1Ai2y9AB/3w2oO/0MBZaWnanB7bSl6I5lDP6DUWkcz9TmHPdpiy2mOzgP?=
 =?us-ascii?Q?tdfk/24cUEaRexu2srzRqRwFdioENB2KOmqhWKLX/ZsKdCNVE9BJf+g1VGLr?=
 =?us-ascii?Q?vqGNTCpuB44G1zFso5H+tykbOI+FxZ0Eoaw0nIQ2KmlE1VetK4FkU9uifpv9?=
 =?us-ascii?Q?QGePqhs7kzMrNxqOS5G1x8fbjlX3ajauOvy2B7At+/98yx6wmYG6M7/FynoC?=
 =?us-ascii?Q?hfXCmcwCw+9HDSFEbPj5Tv5CGqZI0lfh/2f73Iue1KWXC3FwniB57riCcX2H?=
 =?us-ascii?Q?OdbbnUVBRR9ixt5WxAS4M6h+x2/uSbIHwAmK5ibbsTlG83Mj2BoJBOkZqJWd?=
 =?us-ascii?Q?5EIraf1b3hqjeLeI1IwrIlRVgzSc8EymvOeieOkPaNr8NFHANSJR4eCX6mKm?=
 =?us-ascii?Q?r9NxBlfWoxhGZVNcyyBuZNkuwZGB6obh0OcsaSv0Kova7mzq/o/HNHWVlswP?=
 =?us-ascii?Q?HUWSuOUZZ5sRy2tDafMkmWUtuK7VUMPCoe9rQQAOOMML63xEusMcZcYfSY5K?=
 =?us-ascii?Q?H+gfKA1MslKZs4CYG1GYlA3QLQ8egPgTb3Pt71uwk0Mktn0Mr3iIft29vf3E?=
 =?us-ascii?Q?W6xXZVpIEeABUfNfA88Z9L52Z1aR+1up91MHayxlTajm6xMoZlN6v/sfVaQn?=
 =?us-ascii?Q?Xwhw3mUvMZwxUzCyfRz3GMC6tg703PqoLADNfwycrXE8hyurIGb7hW7peaDq?=
 =?us-ascii?Q?mg5oHwzBU15CjSihtxBIL/2vxINhVTgy5a9j6eitcXn4+DGBLBDdEKyoA1vp?=
 =?us-ascii?Q?MBjKcFLRZiKh4ub/+qEmLzYymR/0z3wjmUvgqGtHzD6K3VA2Dfo3hiwTrPoB?=
 =?us-ascii?Q?/BigdNqRml70/dtn/QopInzN+D7Ojb+rkv8+XPyTlL4xaZzSmp709s6nU8P2?=
 =?us-ascii?Q?G3V8/aXsZqsDvOyDIlznxOAifrga0yKTcLh9EbArOZcQx3Y+T/7NKQfhfbzn?=
 =?us-ascii?Q?+NU3qlLfo5zsGfLdnA+rgZ+Slo44lro=3D?=
X-Exchange-RoutingPolicyChecked: HsBiEDUoPdrySgfu1Si7ax8aqg9SNkU9AU4s6RHi1lYEtyNQTs7bpv4XQfvYdYq/DP+bkrNWUSjBo68xO8r3t/Znuky5Kyl8GINcGtLtpbcOnvSDyiY+qUL4c0JXT/WnLr3eLh4ti2C/zIS3HcHGaPC9qoOnQr8p2MQNNmNJbNHFhzQThurCPHmgdQSYzZ7DNOKHkIlpyKuyqr1qZWisIgWqbZQXGq9F1hG48O6/mtYIyY+ky91nEfg0SYO1DDWBEObmzJQtgKtEOtM1UuNeVoU3GmJYXiSMgkX1+KXncbk/fLkidqDFbWEOmOj6U98FQ+sGgS1JjKJFt2rwa4VZAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f801ced1-9a19-4266-d3f6-08ded90f7ae8
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:24.5569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlPZC40vflBre7eLBYyQe0/lKdyRPVKm0il0R9z9vvuAevEMvGFWbk9KH124kW07Dl9LZn2T8gy0ukxwJf0NKopaVkXJMV2LwqU0PlMSRJA=
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

intel_forcewaked only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index f9bbb41a9..15bd40dec 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -18,7 +18,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_guc_logger',
 	'intel_hdcp',
@@ -108,6 +107,11 @@ executable('intel_audio_dump', 'intel_audio_dump.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_forcewaked', 'intel_forcewaked.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

