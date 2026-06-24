Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14844CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C298D10E070;
	Wed, 24 Jun 2026 08:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeeN4IjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3C10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290875; x=1813826875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P36CyJTreR2fjAimI79kVqkH8kCYNXdMf0SbyPM/Mgw=;
 b=QeeN4IjNVxcGZBWBDt9etPCcLht1UbbZ8qbiTB0mdJPyfckkwBbe9KIx
 9sUuIVgmV7MNPi+i6oobq8c/isdFiYUJ56F32IcyFUSDi6c91f4z15nDl
 3m9o1KEJ9TxaGwzYmOlTo1bAwY3LuRUYlCC6K5WULuSgpmFQFI7ha+ZMX
 ZSsn/zAxJMilQnGU7HvUSIQxkmCn2zALlyC1wqyaH6Jpj2uD2C2SZdjSM
 IoUzfoiHeM4aTF7l0nM1ooH8f8xHkkYxz9tEPKHWTuVL3uDMqOi9qZEGj
 Y0QdVymlKgACzBNm8TtrBsnbE+LrgnJX22tcpz05WinXCUVUiHyCwY2sC A==;
X-CSE-ConnectionGUID: Dtv6cpk8Q++NXoIk/1uvOg==
X-CSE-MsgGUID: rgpzoaRhS6OE7DGW3+1XbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105841235"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="105841235"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:55 -0700
X-CSE-ConnectionGUID: LQJAWwzFTCiFPZimvWJmyg==
X-CSE-MsgGUID: pPQnmmQxRtmEkJkiaem6bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="248880820"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:47:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:47:53 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHItVzOyZl+yyvlJvlG/tRgQJVV9PveCE5GKRmeU6eXdhQCuLtca/cwFgRXmgDDHVs4QxUF+xQ5c8YNEz5wPlAZoP820efR9JONN7blSmcbiulyLwQaG0kGobSy6LrXVLw2tAsW2ngMpLdmZ26jkwCP7uRJjEH9UgfN1gEQz1oiYt7q8sMn1Jgn2ZEuydpembJzhtqiuN89gRIO2o9Bh+3BM9SCk7jkYjdFJwCXW5C8wQGNBI1qfphs80AVUvKjvxMOOJJTz4Y8x5ld//g4WBGnKWNe14hVyVjcVo8NzRqiWKifRK0xUZWw3W7q8zTwswlfALrP6mjYMPyjRYmBStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mPPv9tYCfam9dmX/cSTS+r5PI0nn+JmbVAdSAdnJDM=;
 b=bk/bk7nlza9Hg6qHjTJIFgIWKSmc0OntohJejyBL3qgTlqKBpjeAxEhsq66yzE/vWLclHDnJi+FeXnrzEnVVN1JbIOJ5Kr+DtPpchfe7dA2l0qICRCz4uxNBhLwtrnEgpC1XKJ7itqdLcl9Ifw3hUERaEc89VxY4mmOH+UDdOj6e/NslilyXwcCn5YSL8mMRvFInmNSjm1jRpwHvVb8O8c5FmLIWuzRxLWWiPDxXoRzBR2vPYmLl7xDrKBzSZ3oi6EN2c8gavvW0fiBHT1vc4/pENWX5Rzv11gC+HP8Cjq38ttbvEpfWjGTuyE9rDm5vdZOS6S5GYX8X+n2u4NnGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 08:47:51 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:47:51 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 15/25] tools: intel_lid: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:22 +0200
Message-ID: <fdd69645be8f02e1005d18536440d9a35db0e58d.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8d91b1e2-5110-4bf1-58b6-08ded1cd465f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: BonCWGJ3uDVZRLjSdc5sxSXjczpnFMSYrtgpN63UncVvtjLDK60JtbGr+YiwMbS1hYLurIAr42DFsc8As1SNYNCavhcrfyevYzoIBOdDqheufISrglGO68zNE2SngooNMrJnKmIuOr/6NEV4Ck+2aBjiwt3KJ/auurc7LySUl7i+pA4J5xnHWjhTvH6dsey/59ZOIREqBRPtRen6Oal08SP4Ww9w32pLw8EdEXXRyEWZVK56Aq8oUjzZe9+/j1PZMI91E340Wp5JEOheW32DIs+ml0Oa0x8duY4GJmuhGJxDVYtdhHDHc2ziqAM5bZUFSqk/CwoWgpHERcRCTHOk6hhQNMLdy+tutN0CJ66plMcvy05q8iwD4I7wqXfkDIf5XcguW7faiJed4Ghc1l7lXR7s6RY+rEgbO7xhwXn4dnpzsrcNPfV2H/YRzGSVqV2gDpCUclGda3Ooy9avApwpP737yQa0yM1tdljX2FrptUaXAznbinXc2jbh1geB5gyTfQe5KYXy7JPwmhMJZIt/eMJoyjlP6lrv/up0sonGJVbsUSWOppTVi2sM+5xPmqYsxcGfm0cAKhp+O4GSjxbinVx3QXkWL0dzvUQzEYTO1o+9xg2zyZ3AEev4p5cbp51UU+SIdYWZ89399fh/5x4cUh2lpDFU+gJk2cU8F5ut7KM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PSzRmpgTeTn3HwSWhLLDz8of8/+XQL9JMaTxqIHYmWjSMC/Z70AFEgg2Z8Er?=
 =?us-ascii?Q?RBzTXpujOS3jfhACZvU87D0yLxSqvLMcg4DBNDJnwCyLD50DhDwYPt+ZoOSY?=
 =?us-ascii?Q?W8N+1GmyEo/ULlcT3fMoWROJ7CQUWuXZSqj2R0bFysQ227CiQwvLg9QbT3Ro?=
 =?us-ascii?Q?CT1sfp+RQvJLzVoRgqlgrPtQbUvh6If/qpFnnRGQRv5mxnNP6RybOR9Z3YT4?=
 =?us-ascii?Q?/DqfFXgMcwyCK6J6w3atWJuZAkOvdJ1M55GZgvD4WhHVAxUfkGRx8Hf/Ss86?=
 =?us-ascii?Q?vxR8YrpDW4u1nXmP1GjFi6XtwfLR3RHxDybyAfEqa0ZTFesMWVBLgDOj4B+C?=
 =?us-ascii?Q?y7YGUN/vJoraqtb2jZuT9eODUfPowQztmsNFcdGTQC5rIVhOxS1ib9Fh1lOk?=
 =?us-ascii?Q?QAmazYvtvB/Sar4g4rFJ4+f7GXXM8x0nvTKU/iPV3eN8fvp3Ti0uXRWJ0XnT?=
 =?us-ascii?Q?w+VwqDdLMwfhiYQnDsPx4PagHlBSnMHZP78i4ha1J2Q7Xp4HZt2Fbr4Gponv?=
 =?us-ascii?Q?fgoeAdT9coQzHXwfMXoT+SJUlIvK6x3K9LvGofgpWB+RLbADRmUMTcSVSCoq?=
 =?us-ascii?Q?g7xA4e/bFOZA5p4SvpC3WSRdl9iT8PZtQ1/TO6qGxhuSHLV+jaf2tsF8JnPm?=
 =?us-ascii?Q?3ZWA0cyy7fFdONpw7SznRtChaWCtFvTh6KNtedfFEvDbiTTTlOgNVA1yYvwG?=
 =?us-ascii?Q?1+OAdc0ohdZ3J/iBtntlTFI20Wqn8PxHrU1KY/N2NdLCGQ25MnRZWu7bEMMt?=
 =?us-ascii?Q?Gtj/m7ywelCMKhdJ7d283onyoVgc7bGLFuQCVYYc1xYHhHODZrGHFeC8ulEJ?=
 =?us-ascii?Q?E9vcgW9WZGJvutzpfxMR61LZygRxSsnaUmfRu0U0tQO11xSElz3oPoAK6CaI?=
 =?us-ascii?Q?TLF5zsQ9qsepoT4xjmUqFVGQZgZXrgbbJuGB7g8oCTpoM7yJhmpQ5NZXijQ7?=
 =?us-ascii?Q?Cl207PWgc91XUtjIFK+eQcIpp/YNPqejQDt1H6vWfSn6mNeQkbcgpot9IJmt?=
 =?us-ascii?Q?EmUZ/e0CvtgTWHZx2armtUq2GM+/oB96pmWjJ18ulmRWwCTzwt9DWtcZgBS+?=
 =?us-ascii?Q?nMQFBRCYJyWKahr+U6u+U5EzgWhIuft3WA17/GkXgqchffBAuG0uFq1R+CTU?=
 =?us-ascii?Q?6liKi59B2TPhd/2MRO/xdUtEVU+V0I+IDm3wVJHXNyA8xrijbmocIao9Y8CV?=
 =?us-ascii?Q?KCPBHxuMLNmxnxyiorhjDB4CpqnDrAVMjYTG5KtNtDjtz+V3U1B9kVsXoB2b?=
 =?us-ascii?Q?630Pdgbrm9n26kO8wa4iQA922f7at+NMxOxEc804zJyq+JVUywPDu1Dlt+eY?=
 =?us-ascii?Q?x+0SggxwqRdTUvpldv9hp7kvLDmYc1QJ0sNeZ5Oz51wqhWvjssHjsLgkmWmy?=
 =?us-ascii?Q?8OJFWmz+4NzeFqh0wB+aDgaKHVojXxtCOqHmlC8kAjajR/QgminGu5HRUNAM?=
 =?us-ascii?Q?OPcY00MRKGCgQg4twgoWO4aw78YMv76koai+Q+5JUkjjYwfSTAdWETyzX17a?=
 =?us-ascii?Q?EMo8zkn4ioWBnBy9T4RWQR0VIWIehchngclUvXXi44mxqTcwrisGwO9lr0V8?=
 =?us-ascii?Q?ANW+sWjI6WRcXk4MqjuQ33wSJ5W3cefrTJjgnych96fHRrwX/s40OhfBGUp7?=
 =?us-ascii?Q?mO3IlBSDkKEqn6BxlcSF8Q/qzsWVxiNbSSPWAvzXSEp+ytzstxaek7VlCb6h?=
 =?us-ascii?Q?pRyRdMCn3bGpRx56FPMYdMj9C3phWgWJ0scWbVhjxgVwx7+oyvJJAaJYIDVJ?=
 =?us-ascii?Q?xdyOLBTK/7e9amw07HpuRAS847OaP2k=3D?=
X-Exchange-RoutingPolicyChecked: a9JmjI/1MygvEh9xCY808mpDS8FmSCGI1KUeaotegrbeWj0vN+EhePDin78lI31MMG5zBjtwuSl/OshhMvWty8C28hkmR69R9Sy+i+oIHvZ77xc6yBoD+fXUfb8RaZRuSCldx288PEZ2/ABbhV0MeQX5afXIfZ58PXV94mHA0YBfa6d4PkW1784zIsm15N7IXbI8hVnR3gaFRVPLvaoNW5tF6d67RPtsA9eh4hTnQ+Ryasq1WA/6fXKY1N4xwcQjGsi8H/+0DPE2Ae1DPKDocIbyUMlj9zPpkoS6lLW1WBNh3DNLm5ODWRThEFbaFr8XX2H2CF8HtcRyoc71KIcf/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d91b1e2-5110-4bf1-58b6-08ded1cd465f
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:47:51.4918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBam8y3QJyJsqvz9XzIF/TkCEMNkJ9+5Oj4ufaMHPpT/RmYlWSM7zBhmIJNzm8CRp/ak5RWHW4FzzMKSqq8rfVTLcXvLZXmT91kg1kv/H44=
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

intel_lid only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8899a5b49..0978f8f11 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -25,7 +25,6 @@ tools_progs = [
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
-	'intel_lid',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
 	'intel_perf_counters',
@@ -96,6 +95,11 @@ executable('intel_backlight', 'intel_backlight.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_lid', 'intel_lid.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

