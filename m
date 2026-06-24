Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5041BCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 08:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41A710EE25;
	Wed, 24 Jun 2026 08:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAGcOtz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E484F10EE15
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782290897; x=1813826897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jaakqbaGXGMoAS2vfCX+zvyKTWaurmUn906z9Ih0EsQ=;
 b=gAGcOtz/pQxWWZcL/Iw3/Ls566L/V/8PGgGBSvqvKgzui59ljw5rodn+
 HtzbXxXOOUj85AKi0Qxho/6RaVbti8WyqKXYRiPQE/prRj5nG0reu/nTf
 B2I0qKVlm+IoWsNC2mmwdrU3zkvQ+EziPCTL9K1qbfM+RQetvQraFvpK5
 7N49s8K1/p3AoSHkTpTNxLXyZLq7M8tXfnc6rZ6ao47A+9QuENgfzdLyT
 TubhxhSN6rGNVHcw7qNgBW9kNU1XVkVRsdEN+881PJ5hOF2OxA66IpHx6
 SpwL5Ia6m8P2ImbNKPdDdSN5J1To0hmkcLhKvaT4UqPChvH6NQIZKcWgd A==;
X-CSE-ConnectionGUID: yn6PmPKxSOO6UqT55RMgYg==
X-CSE-MsgGUID: +SHPvzJqRqCIwIp+HyzZbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93405080"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93405080"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:17 -0700
X-CSE-ConnectionGUID: hPWRIHwETGqObxn4JIDD8w==
X-CSE-MsgGUID: MlymF81hQUiES9qr7NnFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="287900100"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:48:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 01:48:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 01:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf37cezXcxN7jpRcND21g1qPNSC8ORzFjW4gfbEP44LZF4F9cIagW8+GernMFO1Bc/PHkCc84r6DOx/2sRgAJtqQPOWcWpjgANHUWphap6HjWcUgIcSegZz2YqTbD7F4eKr/Z+x47Tx1Rfkg9K6wlG0TIPu9/891sG2rpa7/XzB/lR0URkYR1efnRchyOPFtfuQicAfrn8pd1MgTocG76pH8xtZ4sXlV7V87HJmyCKzbT7uaM+A5+zdO3d8ejox3BDzsK9djvJ6FR65T3aOnFG0i4iBbLhvsmZ2iFvCM81529KWRDezgGva2GwFhY9dhHqoeIA2tQIoN4ecx/5aHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9c30P58kQ3vMU7RWG7yA4AhpxzPbCk69DhlkUuZjFs=;
 b=t3Xyf1v2aV9ZGJCdhnFt3E8M9PQXZSWY8i9YP5Y+7VAYZiR0PgHKsFKFJA2t6KLAe4SXdGpmOy0aw8pV98S6QdgEELN+C2qu6G+U2DPs6qLp7wwKEiSxnAjGLQb5v+wVilxzigkSy9EcOwLWZv+uuVx3/rke3+Mkh+o8b0knhJsR2hNHCIINQqq3iJxp+jFY/7WLXX06sDcWCEBRf/OeGqp14muGcrpmmKRQqYJpRFn2WW2XGXi+3KgLZKyrPEXl0EUOH0oOJKwd1PFixEJpjXpeDpJMgev4uO5NkQNopnE0JfgVzfax4Q+khmM6+F+I8cGRPX5SHPGNAtwJ+FooJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 08:48:12 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 08:48:11 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 23/25] tools: intel_display_poller: drop libigt.so,
 link against minimal sub-libraries
Date: Wed, 24 Jun 2026 10:47:30 +0200
Message-ID: <831a57063e48e334f9fb5a0b27113fe60c6de2bf.1782288071.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 6508359b-38a9-492e-71dc-08ded1cd5260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AcaG2B4ovFi+Jv0VN8nVNXgIbsbJTM4rb8RetN+oSjZ1CJgu0bzSmha7VkP29h22Y953RlLsYMBR4XUVCOepoyYNC1TR+E3gi613Smb36mgFvWob5gN0PmJj9FiXGnDfmDJHoEpxGb24gnVA3ZPxQJOh/KTxGPSqP5+c7xIeW1p5+R7NEgnVR1UJzILF2BVCEBZCHJmDfGC8Qq0Iti7VNoy515lVVdVSJcGEnIGV6CEZ934iRkER53c+uGe1IR9eLhnVa/Ld3/+axeQQ6YpJjsC7aiXnLqVpwgA/OcqrYLAP6TYkZAuZ3Z8/e6jzwrsWBNDlZBOce/UhMVYWfDex5MOMKJtpddgUic22Ne63MzVkHViBslfzRIJIr+z1joxNsKj+WF5+F1Pcba11CVqwv0kuJJqbFMLhRyAMq+jWoIMcqmkk4IryvC+rAdxFV/kNq8VY8QZlyCmcPPBNJvdVr8JQEZ0ddl7DMqIHfavqO85Dc4f9FHR8wNdFlR33+mZIpkvJUJfG42u0/G1uEelMnsnW85oXrPAI2QUB24+2ZnTLg4xs3CGj+T5bic1SRu8VN8sNop/R2C8l+AtkO3oo2vnGid7/9K0BxOZgsLhs73/MKEooeU8lujdKY46PfueGC36Vljjcf3xkMStpHtJWqT47hRDiruqCukHGj4Q8Bcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?On7kjzg992hhF7tQTcGqV6vuGLCVxqJBqATnP2cc3VU2vb6CtrxP/WXYq9D/?=
 =?us-ascii?Q?E33uBNVF0IFNmFqoMqSUNxJ5xSJdygrnCMYgSIsUhnwCjTKYLsVknHn9OM/G?=
 =?us-ascii?Q?lJOQ/M3aCxc/IQESOiyStzfl/DKl2EmY3NdxByO7fuxTy6gtQRYF4blNs68k?=
 =?us-ascii?Q?AXvXvvZ1FKhwOXi4rz2pt5+WiOtjA1XC9SDETNNW3JjkHQd3jUuvjoHrpFk9?=
 =?us-ascii?Q?cUWO+odAB7xjo47no9LqnBYOF3KmvFfhRblO81EtnLfTD0o7+My6YOBaBEkj?=
 =?us-ascii?Q?oP1eLXodxZwBFiQcZ4bfZ3WrXmO2Wh1AT5w55lqTkQLW6o/jCaZADSQ1AwHC?=
 =?us-ascii?Q?JgjQCiOYizjW+gg5ND5M9ffO6KkAkZ+IunA/rgDaR5v+Y53WIBcASpD6Gnit?=
 =?us-ascii?Q?uGTr+MbvH+2MdCjXQL+uyMfj1igotHeJyugrzQX6vsP9H6FtYCq3P6Mg0aU1?=
 =?us-ascii?Q?3vDFrBW/qfQjjOmCPgCmSq0qUn6V9iS8piwyKKSAv36ICBfFAhFBq/0dfvgH?=
 =?us-ascii?Q?5PPUqBb9y8asBkzzH6KZvHdz3XwUJsGS02KcFtfhwezSuorzG4vHnJkT3yW9?=
 =?us-ascii?Q?/b6rEkPLDUhWmYFbyDRhLVhHWT05kKBIZwNuMOPza89reEXfg5rClsPDDLci?=
 =?us-ascii?Q?+0MxINX7Cg+2KhvyQEQxO5oGz3GLiTBNbiM4u+wJbP7VCADnAUqsOK+WVKIf?=
 =?us-ascii?Q?0nDm1kb4eBMTyfwlY30jvMlTzmYIaRPsFrWTbLDWFkzNzZcMgqLtjMVVZNNk?=
 =?us-ascii?Q?+/jsgu6zjDQjCDeWEZYXrOxZaQpImhWSGSssISAB2NvcciO4UubejFb7zUfq?=
 =?us-ascii?Q?0lk8iTgs9bioHb4thGCzYlhG9EIU49muef1EIlmVxuRPgQW8G0vTGjQRppww?=
 =?us-ascii?Q?j/5pFaY6uNPXqAjQNnte4rPIrRSqbwP5mzStuyeRPQOUzWYNzoRFEKaXvX2L?=
 =?us-ascii?Q?5OR9nQMmm8aSjch5mQcLzfO2bNcIIrKjS92oSFdw7NA/uuGZZD2DwIMFVyv3?=
 =?us-ascii?Q?UqYRQAQZqZrTuVys6fBMZnE78yCVuAEpPnkvIJ484D9anqUvNpBSnT//tLxI?=
 =?us-ascii?Q?rA/C+SNOKAUNEN5ZkSd9+1HafimtIUmjj94LZaGDdY/7etMkhbrTq4fDvV90?=
 =?us-ascii?Q?k/NezWOk0FyMZ6TfwShptlbDbCZv31N+veNaTJAY/etA77zVcWRzgmTmvmR3?=
 =?us-ascii?Q?TCbL0QAZARxCMjez9yczaVBTx7DazWzhe292zF4cOFeIey4vMNi43zUmYkoh?=
 =?us-ascii?Q?mk8BigLPRH79bU2muhxrqeW3mjEO2zCLQ3onFFLNbL6Pi2KSQzQaJED1lvlD?=
 =?us-ascii?Q?mIDqdS8dlAzG5d2aL/knnllacuCm3CK7ezQCQSjhoUXj2KcjsBgEHuauwxSb?=
 =?us-ascii?Q?zVoeF3AY1fdfYDc2ctzJUayRIaYMPFoRZI+6yzPryWvALenHcp6TUoMEsB5j?=
 =?us-ascii?Q?qyCdOHY9sE84IS+gBO/oVxWdniN053iD5ZBVoC9uSFltZB5pdjQ0GYXz1qHH?=
 =?us-ascii?Q?MkVaPItr7VwwoVUpYgd6V9dyCpP53bz7kgb4ZdQjcmGFRs1O9/O/010MROAr?=
 =?us-ascii?Q?3ks6OZtHCx0SUfNb8t0gzbIAkQgNWISi9C1IjwsRrLVDKBoRdK6VyHiXDvNB?=
 =?us-ascii?Q?vrR61Hi/5kszIVAz3j6KcsuLD/MQd2AlLWNlR1hlzqLHnRdpug+WMz600syd?=
 =?us-ascii?Q?hlIj1b/jImBVTq7SV5SPGiXZ39X/9IQfDsEwzW9vRUym9tiQAS9ftvXEjbxp?=
 =?us-ascii?Q?GRUnDa2RjB9cUFi+98iF4PyG8LZ7p88=3D?=
X-Exchange-RoutingPolicyChecked: oNS4djEWwj8PiA81Rfc3yMADffRFaG1OnTFUMnK/HT8JlO4PPVKOcXkSdDZVofSV33xD0cLOnSdIekpwYEQpV41Uz8KCQYVosbNl4oir/faF6nfDBnYywk+wfaizkLMG5jdWqBKXwkj+f0X69VWHCQgRyNm6kEKkZNycxCcIt6tv6FYRqwhz2sExLegPj8PmohdvMzjePBoNfStSpyvt6CBaFAJzIY1iaYz8e55pBPBFejUeKNo5jCCnacBPWZXVru/kAsY2USB0TZL9YXXzPBsLwM+uYjcH4OyepZkumJ32NhbNuL09DbumUYEs5S8fgeGizGG8KI9Vx6bQ9qSdQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6508359b-38a9-492e-71dc-08ded1cd5260
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 08:48:11.6098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oId6PXZLVZWiDijAqfNRQJTup4F8EqdprLMLMeFyNt4KRSNISC+KUWqvW1w1dnI4vi3R/b3a8kw0s+ZPEtR1jGb6byExw3MJ4kzQ7JM/nK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

intel_display_poller only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 71f241f8c..82d569f46 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -17,7 +17,6 @@ tools_progs = [
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
-	'intel_display_poller',
 	'intel_framebuffer_dump',
 	'intel_hdcp',
 	'intel_opregion_decode',
@@ -128,6 +127,11 @@ executable('intel_watermark', 'intel_watermark.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_display_poller', 'intel_display_poller.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

