Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB9C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055C410E64E;
	Wed, 29 Jul 2026 11:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ecot2+xW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C4510E4B4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323022; x=1816859022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0m0dHLEEcFtVK7ftR6LXF9gRBf54FeOS5dD0cGZCJ1I=;
 b=Ecot2+xWoRaKplWnVYY6TY1gvv3i+4W4csXnh+yEZGfG9Zsp02JRtzF5
 CwVdnl/7FPl6LAmT+nfp2iuiBXUjAdeVMZuMxa9vxNYDTToBeMM7oRVfo
 qa9A47K+OwCkFoM4liNEbcqzjEZyiAduvRXcMpNS13igzvEPUfRgbplGo
 /kKYeqiPj10u8n2UP6tSdyiwKlQ/y3h9tOyubnwMvqRYKCM2tlgEkAusf
 qLDv7ZunFd+AWEZQwR8QaMCDM+lo+irgQmya++QgI1X17b1vkZl+fqr0+
 /R1W5ZVLH8jiPYTzt/60PQb/0wtXz4X/OgSq6bpCbw6gUaslXXcS4sMsb Q==;
X-CSE-ConnectionGUID: tS8eMIXeTqmbYjlo1s/tSQ==
X-CSE-MsgGUID: YMS2HOIGQW6U9XBb9kKJ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85797631"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85797631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:41 -0700
X-CSE-ConnectionGUID: mJ4OelghQUWFIV03ulhdMA==
X-CSE-MsgGUID: jq/rMyhlQf+8F31/EPW1bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="264264147"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:28 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb4DZtQyz0mv0Fe2UgMyuDKhrrwMWXRDh2AGmQWjaW4jcRkMzdDpcsRayJ14HP15E8f0Uc6Zqz3oe33OCYM3cMp+ljpf2/7lPO8fZsD7Ejd+9sZnCJMrfp6lhThT7S8qioMdVMgZzVEazZtf70e750j8zFfQTXtQRcScsp7gbzUsABhWobFCwbLJ/7dPkkIcaw64tOTAqV+kUNwlhI/4AB7eoT/B0KeZ81dvYaUPz3ApQONa97hJWJLRZR3ZLnIozb7rTILZvjJ31BbFHB81OQUTFCBeC+oprBHlwMkffTG7dVtRO1Kh+ngrFfs7raOlTYMjraSKmwWyWDpUxhbPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJUh/Cw3TgTcMjLH04izQSv6wFNlRO3InWVxGGpoRsI=;
 b=q1mDju5QzGijgsaGfbovE5pTS6yLkEfE5C5qxgmGF8XlGyRSsSCaEI/u9Ef+CYmmpSlBokikVPGv7gE8ydy4lFIg66Spibz+vQMTUhkqSTsm02pepwmStwhA0HO+ljAfyzpJh29soN6A58OMLE2r3JkmhVVP8J3Mcc+E0STfuaVInp72QVimuCv9fImM25DPuoeEVg7rCVhuZ7+PDdt38IrCtJQSTMBtKlZlUFhk6nUiFb4LxEnRrg9ny2kx2587ZPCs2mdX0t2yIi8NHNKXEPu22xZS5/HCVjNqBkU0x5N2Y3sLOErlNF1fumw+q+UfqoKFezzGOrmreS63gYNWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:22 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:21 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 17/31] tools/intel_error_decode: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:34 +0200
Message-ID: <ce853972180b1e5bc274937a8bd5e91ef09db789.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 99128e65-6df1-4955-e3ca-08deed61006b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2/arbVat8aq5+qwACu5vGoLCUjpR0otGhw5SjkvxPZhc0LmmUfqt0/sj3eCOZiVTyF7FtumlC52OlQeCzt+U2CAvrBNnGf4JmfwVw10OLJHZtXZJppEznNy6XXtJ9zDPYFASr/tqPfjl8HYoM49rV6M2KSEYtZlNazgn6PBLVQFlNAZBSREH93EDkLJVOHJFB5c6wRgnQYVbs8zZXjxMy4BVmD2aZ/f1Q5+p/oEJ/uA499RQh7v/N9zp4chP/kQPIiGFOC3JX69RCfG8Tre30HKEfYICAXyjp89XurraYIs9ILY64cOUExmo1ILVw4h/DW9HSrcZQYYO8kvS7G+9Gt57Ltj10LsUNBNHkW08NmO0kJbE+RSYyP1owRRQxtC8psY9YlumuwrTiIY5YM4xgkbRIzdW9HfsTNavklQzuljc12S0DDrr3YTQchYIZKmUDyNEKr1Z/o1fsXajjxuOxEMvbWACuhx1NVeU8ecXbK9zHZEUKHGFrhY9Np3F3X5TpEoz6W4PHVbRfK6sTNBcM6Dce9urUTwU8M2TeQxQbZSjAcyWa6QYLy0W4zI/jRVbsdWIq9KgO6C4CmlfsUEcRdPluh9aW3lZNsvZcdHnOAlxANXSbIHyRt2571qnJkuvMFXdntPimUy3rGJVOruFrqkkSfpR8rLqdWnRjMEEMvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lb+toA/13EgMEiAGkkWovL7RIiiVGF9W4aaUzU2B5T5hPGkK2BjVeujxhYzk?=
 =?us-ascii?Q?qq5VyG+rf+YJbMaCIVWkqjqb4nvqZGrlK/TV16x06s/1FqgISyuSAUMVBkLI?=
 =?us-ascii?Q?N1jv2wOQn5ZNUg+0e+jhHdFmjeZs0yZaQG+5LGtASODeYKyricl2P9yrX3gX?=
 =?us-ascii?Q?GOYi9qZonHmhBbB2wRRxYMPcxyFpepU6hrDJShe4gXWcsu/E5dBwexRLytDb?=
 =?us-ascii?Q?B9pw42VAD8bIP2VFC5qDlC5mJ7f7zgzZrx9hdMJmnbiUX2Bm+F9B7u5WTr4E?=
 =?us-ascii?Q?+TO1fITMz4Mk67omfQnkZm0N+Au5vsxRLmrhZu4Azu+faQK/nWzzbxsSAfBe?=
 =?us-ascii?Q?BEM8N9+o+TpQJP9kPsAuHRx+iVrNE24Hu0L6hE3eKbqIhOirTrg6DiCiTS/L?=
 =?us-ascii?Q?yakykBlBBN9xnDRh+z6SmuEOVOQPOSAFZ1KRuB3IrEwGcd2oxXoUADCKDNnY?=
 =?us-ascii?Q?Ihyjlnnr9CfZc6hxltgGEcIA2u1DpIyACUKkFmtAj64yBj8N6o/CnBcu0KqG?=
 =?us-ascii?Q?P9HF5P/M5DuKwUrGTuq63don6GRGL7vrndJloQAbKxYAFdYyUydWgOnDg3cY?=
 =?us-ascii?Q?ThG21HyXl4662DfDiUs1hOaOAeMmSe+z+A9AFIiVvvT0zWxyBv3TME3H4vG+?=
 =?us-ascii?Q?PCPLjA2tVaFiMfPvZmLa3Fin0YkkWYLo4Tv38eiFK+jbtOEGVhG0E0KrK3ST?=
 =?us-ascii?Q?XT27E1kWNn3Fw5Bgf9QtuDe3n5t8zLHYtCqiY2UANvZparW++XruIu6qcXqI?=
 =?us-ascii?Q?Wwyk/d9vfp6Gd5YYDeNhQK4YhLAsvVI2/IhO+fhveJWUhQ2Nxg/slA3tXg3k?=
 =?us-ascii?Q?fFCyeFZhRkwufzh5BGcxVJ3CfB5M1eRhpzs4Bys21xrPFuYfRIcGGKgavJfz?=
 =?us-ascii?Q?ED4MUy5JrCnLPWaGpRo4igXtYykMp1YfnoNIMsJAgU0YB1IL9ScuXAtasEGA?=
 =?us-ascii?Q?FjS9GDCdTKwDlpMuQZTjovrkU+sivxwFX9H25Obg0PCjAu5y16WsrI2cNiYL?=
 =?us-ascii?Q?6pnkqeTFYozW7d2S8ECwoU+/KJzPKA/2pIwYRkVTkg22YPSIWqjkSBgXwT/X?=
 =?us-ascii?Q?FKVECcKejaZ5RB3NSB3uUbUxa/ixpgfD8T5EHv34qIArLaXTVOCKKMF6hgE7?=
 =?us-ascii?Q?IVoey24tsCmbWFawdyLl1Js6TKQ8WQx2Pa4dfnrGodlE361jwaVNYYjDXtTA?=
 =?us-ascii?Q?/GUl1rZ4sQWDdKOYqONbxpPvzLyeNpKB7fHfaEbp7j/fLPTxDiEPdXLFxL8O?=
 =?us-ascii?Q?UtA4mSf2mT2uaZuEixJC1/cHR5TF7VozIZkJjFPvWy9pSsAqmtgaY5dbcwVd?=
 =?us-ascii?Q?qPbGx3OuaiUaLLx4JSI7x+bWi6FaQT64ucekZBr/DryCqvLubQsXIZHPIVPN?=
 =?us-ascii?Q?HvVs8Wn67lbcguXpWvz61xhB44SJ1B5OU3F/s57/CyUi+OeWQkKMr16g+PWN?=
 =?us-ascii?Q?EAwXj257yVqwXgEv3MLgUn0Ho1e8/kHoeZSXEDM/g0qew6LjoGrGYZi5D/w2?=
 =?us-ascii?Q?vZsxRcZkoylCekTXNR4q9z3G989Nl5N0pCFrvzzO/aobxK9DX8Oyyzrj9TH/?=
 =?us-ascii?Q?Ra8sAHgpXprtfjFHDk7xmLRWtiaOqRDpmc6c7J+3ZjZKFmMufneOhx0ayQ/+?=
 =?us-ascii?Q?6njCUwZBzhVp9AOAbJY7SWgj2k/AUMm62aTnfKGrSJJJd4kPLf3UF0yQEPtZ?=
 =?us-ascii?Q?IfFs0Rsyn7OTTwakbfzi3vtiaWc/oLDJNKU5SGsOkd+oPQSjl9nS/TaRv8my?=
 =?us-ascii?Q?bREe3S0ci+xJ/MCFyADMVhHdd0pR7Rs=3D?=
X-Exchange-RoutingPolicyChecked: f3axI+YH5I6tx7l8s9oWAWVXHbEPLdsJli0zc6TKibO9kLsULpB18UI1yP1gzVMRRZ4dDtzj/69XeNVmKVpPUlcf6V8vqTEziCwrS5/V3UWIa4Clh0VijSr+FUH+/8uBprlot14Qq+awPPTi7t2sT4Y5CQOHaJW6PkOe11y0G/NY1GPAS8qJ152qN2jL8ztsZaNecQckTfXWCoJ5NutmqsWAvzQsR+siIClitPecxw8pXiW8Ch8QGPmuV+9pZej1kkKb/vlSvbFPPXem3H/vaQ9vJbxXfTdwgMhNHxmcl7swU/jOkB6gkgYIVzqtS7K4/fR3oq/t29/n5cK8bOFZUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99128e65-6df1-4955-e3ca-08deed61006b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:21.2576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9+fWsPq87wdFM7szMw3AQu0T4d6TDbyT9tfE9tC3NWKLW+WCXe4FJcUVTkKnuarl+NBA60H59PMRwgBqfG5aQ9RdDpRFx3CM2sdCN0cIbE=
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

intel_error_decode needs the batch decoder, chipset tables and zlib for
compressed error state handling, but not the full libigt.so stack.

Switch to linking against lib_i915_decode plus the minimal helper
libraries it relies on.

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
index 467b8eea1..b04754c5e 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -20,7 +20,6 @@ tools_progs = [
 	'intel_display_bandwidth',
 	'intel_display_crc',
 	'intel_display_poller',
-	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
 	'intel_gpu_time',
@@ -84,6 +83,11 @@ executable('intel_dump_decode', 'intel_dump_decode.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_error_decode', 'intel_error_decode.c',
+	   dependencies : [lib_i915_decode, pciaccess, zlib, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

