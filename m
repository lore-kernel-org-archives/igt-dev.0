Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A92C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A896310E60D;
	Fri,  3 Jul 2026 14:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbBd5IBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8FB10F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088984; x=1814624984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=f0v5wlbCJZ8cCousIIx1TOB80rfNMbtsjYPwICLJ9Mk=;
 b=BbBd5IBg+pp1Ht9lSQCJ/Vgf6KWvq4WZ53prUKNCOkIoQHBv81wsRFRo
 s4O5exv+krlXdp13TILzlj6ID/2tcv1ZWRyrz0Nt+itD2+5jMvHyE65iS
 0F8DibkIC7j4vQBPDyyp4fDQA9nAIrUbBF/5n0qCViG5ehGTf7kGb4pDq
 +tQnRTOUEjXbVQ0vQWaEMwLjptPI5OHTlh4lUuhxqdYTN+42T7ktYnkU6
 qmNIS4EbMQb8xv63VhMbOvKCY84HN5gq5gSQ9cb0eQhhV3zEEVufY+zxs
 J+0abAQIy/2cOG4yFoSHBSIk3waUsUAHNb/VLFBO5c4SZ1fa3fgZ8pX7d g==;
X-CSE-ConnectionGUID: lfnXF0oHR5Oc2QkxEPElRQ==
X-CSE-MsgGUID: iwJRRLiKR2aiou1lXkXNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83877947"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83877947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:44 -0700
X-CSE-ConnectionGUID: bwk+N5OfQlCIqgiZjUOe2Q==
X-CSE-MsgGUID: i5z5W+NyQSeJJqLCGZfbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258019567"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hc0fhjsZIWEp1ITw/reKcibhGzqDud6wVLYlDnV4qu58WQZ6AYnRpPdnGKSp+EJFbfldtelgbP+RtaZgnH9jA6l0XuoFu+pk8qFPIpFwd6DtbH/Xp+cxhDOs8FeoOPGw9I/JmwuNFD587Uzkg1f559zJUoi0EDYb4vvsdPNel8lqskapbxt/azHMElG/Tj7r/1zAE293WWCAP391bq0JJyXzSa6iwyVae/vuJyxPSmY5QbIAegZTxGY4Q+df+AoI+2epqf+XW47bJxOEU6BquSFnwcrwmlQwcIYUAuhPikdaBPKNGlsQ+M43qJ2i6/F+3YClhOPKwE8v2CbrYargUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwmb/y7nBefjtT75Cxub28soHQuXGZtbYhoBh+dgYI0=;
 b=YAM8143YEuBgiV/VQ19aLF2UgbwksgGr3iLIsZQP97fVX4+qARsMuaPRas0nNKd92SglkPA/RjOE2juOeFLHbY/G7I4Z5uOf4FrjGmodEd3LNDc//8J1S2z9G9PPF7zKFXmhR9V/CpzePxkzGpW5qld8WPfC18skSTSclYfdsDpnwArOrcfLfSXOThZkwNBymFfMc8W6BfxBTkKnDLPayZrHFniGfl11rQixBpBQlxZhnzStL6OaWemrU6pjJ71NOhnJQkzVIsPBFjNTmG4v8rd7bGYMp/rEJJlz2Vk67O4llWWRulShfx8zuKl8qVD/HPfESW0V/zmAWWJdbX05GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 14:29:35 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:35 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 28/31] tools/intel_display_poller: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:29:02 +0200
Message-ID: <9ad7e1f0a2bac78e571b88008b2c01e37added89.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CY5PR11MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 001e5582-0a28-4972-80f7-08ded90f8107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Q23k/uXmP0Xa5ZSiNWZQTrdjx6QYWUYSavNI4k9AICp4TtpKyIkRjGhT80D8nZRFIviN1onILPwCPvRb5pKw/VPwAK3wYbPgzNscWt9mA5CY6rfwUQkvwzktvg6ErSiQacn1zUxeUKfMmwbaQTBvJ7diEjIUxddn7VanjDzqvtdSwm3QjUpSe7erdO4GE3cJF7Ig7cvN68g0lZPb4LFaRdBSRisyfvtp6qA18dFy8FQbstlP3QCwSy5be3icZ6iXuBWIZDwicRk0amj5v/8Wg19wkGE9nlZBUfh3socW9/fwFhMCncg7N312FzfIum+MWXPLBFkR4pf6M1aMXEsZ34LvpN2nKNFam7+2jnyHzIBhh71IKprkIswgwrWyqrAo/O8d0aJUcOsnJveC9IPnQKGHrZqK34l3obYNXaTdAacc/t601bdtcwRKaLyo70kQlIfMeNAXO49jqkwIosywu0YKQHNGEZxRsFMid7cq/kaQI25Fn2mFGTuuK9wPx1+4I4vPhvEc0nOYf7AKcCvHVPuaRVLPYa5PQ+d0+I+Jtp4RwdigxJjEGJ6BekTffg9HkwjtZoS5w3w3UeU1rWjpDWB2h9/ynPL4gz3vV3mkTBL92uxICE0NRKo7h6MUKdNBA9wE9tZq63NgEcWRta9tHWNdkb6ElfrOgef1p/4LNsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D3FlfOFuqyHTDZ81dhdSmdpXdFumF1H3AWEaW5RG5xB70RI52OsiFRFdTwFC?=
 =?us-ascii?Q?LjG/3ZdnUaS5X8o6M96tNXuwAkVihRa8UCRPUBHcU6G9pe8igEeUCkIKWT21?=
 =?us-ascii?Q?aRfn23mvzTpssKyhEYbL1QjOqgaYLZZZjUf5X8XZgwPXG1WgZ4NrJX1RMx/+?=
 =?us-ascii?Q?5XWi6C8+JhN8JX+GUFnAWNf9grH3LtbLf0wUWdTqppaxTJ2FZKMoZKJ+zTZE?=
 =?us-ascii?Q?t12fh9MmWqX8dRWrqVd4Hx6R1wonDWpDsug9rUV6Zc3KZRmuSSZ9lzPMidGH?=
 =?us-ascii?Q?JoVLnjyy275f9xTs3TalT//TGEQBTOB/SvAvxmGfaoKHps+fLLWDfkbqPz31?=
 =?us-ascii?Q?Tfuv0xpfiDOQzTEJX05Ir4IF0sADcW0sgXlCQCNpXODd1DL8kC1S1bgfQfkq?=
 =?us-ascii?Q?zYm/3fVk2erW828GEJCi5nKbSQMKgu8ZJ1Qo+//my2SkfMZ8rKev+KvS+uSA?=
 =?us-ascii?Q?OV01/FuV498xScG3x7UPE+NP2Rx7rut3JvzCvQ6SM+quYi0n57frp8CODLk3?=
 =?us-ascii?Q?/8X0oB66z08JLLJ39oZQdROMycv6tg7dPfgZB5FUeBeZcpww9hfEsJZjb3PC?=
 =?us-ascii?Q?wGnZWZmYLggmAgOB5LqFb5Pbsy/BhWHWYnR7An6SRS+HaqXP1WBAgghvQDHa?=
 =?us-ascii?Q?GNtPjUllbBfk6I+tmyL+2hxXTQItl/ZoChZUwmrdEtUJknfOSKG5lY6KNazN?=
 =?us-ascii?Q?33KfrwrLdRuOeFp1Ok0+xssQKv7yUCQ1qZbL4TzIbamTIpu7ht38tVDJCRHt?=
 =?us-ascii?Q?ahPSmT/g3r7SItQWUeQWH4unk4jbcii7qu/YtsdvBrCyQ8UAD493HJJbNu5E?=
 =?us-ascii?Q?ss8vydzXAyHv+1cYOIoCArQUJwiv+EegUSVyguOUYduG41mZZI3y1UgEhn3F?=
 =?us-ascii?Q?5RwEdpgU8PaEWR90MAFci41ZZ1BKqcD8k23kqw9P3Id0TKioaixdxNV2LM6o?=
 =?us-ascii?Q?nzKZhc2oxI/5MFzps+CoNLRCjFzcc4btkwKY+bYCRauvMJFu3ly9fCovb4A5?=
 =?us-ascii?Q?jUJa/zY9TYzLr1EEfepo7tSiLJalqVlc5Uy+JWRqmaWY+ubcGGwOcovtR+Xf?=
 =?us-ascii?Q?YODTmJ3b8GBUwu5dRjkHqQrJnT8ihzRs8tc+tb2Xw3NMQ3AB/TmifXD1vhaT?=
 =?us-ascii?Q?6RBPWmYQjLfJpF6AbsRqyeBOUxVe38sEiFW8Ku+2/gloFFx0HUcdUEp1aesE?=
 =?us-ascii?Q?LdJ6k0J/tKzMVFPMBtVcbve7ZQmtJOui7bqjr6T0jTzHGxn3ufr81D2/JXQV?=
 =?us-ascii?Q?BDXqQ0Xez8Sn3n1ddT3YVMA5kYZmoTVc6KhYZv/J04PiVrML30vpZ1bFHECw?=
 =?us-ascii?Q?mYfU3qHl7N3tWfyed2in2csV+g2kXpLuQAavw1UHD1IluL5SrD80MiKeReIX?=
 =?us-ascii?Q?6ElGv/e/Q23BT/rjxi98Rs22WbBBXxBDmcchLxVlb+8Vl4/HXaWsn3vlbC95?=
 =?us-ascii?Q?KgkLqWCwF/a5IcFEbXHQagXMy4xLFU89u3mX9xNZ+ZzG1QH1rqLnTs1b7/5J?=
 =?us-ascii?Q?P+74JX53qYKkThudu4xYDVMowhTwBobLU5xUoyc7tEOoDJTGcfFHMOGCthN7?=
 =?us-ascii?Q?4h+60XmIwxtOH+ZbmXvgu6YhqmLnjhhTD/KZv2XeTwTaBlvOyVQQYzpfizV9?=
 =?us-ascii?Q?dxjKYLeQOoZVhKVQaxjXyOr1OEvvt+jBa9eIYXHEJmiY7RNhcAz4VaVRJS5i?=
 =?us-ascii?Q?HZ0NMSTgdy81bFdeEvVPHy9ECJK1SaFCRy6RQaQrQzPdyFpQfo1AO7FhqH3C?=
 =?us-ascii?Q?dHIPVH+WUBHSTxEvt+vEI5AiG986tvE=3D?=
X-Exchange-RoutingPolicyChecked: ZZITzaaNfA+OUMyCzT8dFSbNMSbZUtMsyONS+GwlTyE9qoXkOv+nuLH1zzJxYj80J95zAjmGRnnMOlecOTz65bgJDaQpAGGyWRuVZeI7HODcRvOyDs9QYzQj5ghxKnJisCId2FAq8u5k7AkE9GWASY8CkCmIZfTkdeLPLj0mJwjgs2VdNdwHdKPmouFje4plrbngiOM/oJKKBiZfGmnmLugnTuodVNgGKmLL9dOtgfpUTU29FjDlnqkY15scFI98ZKszU1aK1y93ecvhNMXa6seP4sc1kpyxlMWz0MRaMiEU7/HRmP56vOxO2Lz3wGcUdxVzDpFcqA5GGnrn9n2c1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 001e5582-0a28-4972-80f7-08ded90f8107
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:34.9284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02VfCCmuWqC6vhLHA+LwGodCsQsBNveI/HT8LthL34xnc13nIdffuvdUFjlQLA2wvtMBgThcNMBPSldmFeA6x93pwsrdG7knCL249iklLiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
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

intel_display_poller only needs the register/MMIO helper subset, not
the full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 0cc62b54d..2a084a0c4 100644
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

