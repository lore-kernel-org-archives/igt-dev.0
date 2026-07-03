Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92142C43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F7510F82B;
	Fri,  3 Jul 2026 14:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODC3i74y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807E310F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088954; x=1814624954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZTX1Fr4Qc7t6QmMKPg+2VbUFUHRf5yVorxPJlT4qi2c=;
 b=ODC3i74y6MD3rwo4wrL2tjD0vIGv/lDH/UZbpRV76Rmgn3OIfIH49PIs
 c+u00PM1TEzeKulh04JiGf6+RKaFPzWh2fBNXSsWCHqg0uTjb7B5B2t2c
 AdZvw34KUzoECWY2DzLkototh+vFTMU/fDLrdCdcKriCedgdO9/V0//cK
 pKZ0YJuHEOq24W7VyIX/4YWtcqbLRsiHk6fcSGQSRFy9Xw7XKoH6E4Y6c
 o1ikq29U+sG6EiEgGo4+4gRDGVRMZIwZGHOt3fn03wMhTl+MNsGLIko8V
 ziG0ISywmAIniOu1RZ9zVRvsg4hKS5jHdZqLY+h9NYeVP2aDsFGeYsdZr g==;
X-CSE-ConnectionGUID: +eoSYPveQqe+699zE5ISYg==
X-CSE-MsgGUID: SpNfb5XFToSd1MD5BYu3YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87756525"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87756525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:14 -0700
X-CSE-ConnectionGUID: a/sX6WykQHOwjZdp6ZZj2Q==
X-CSE-MsgGUID: Pmf990rzQjSSjr+5sPLN6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="276341101"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:29:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:29:13 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:29:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXVZlPYurHjULhO69sNROp++Tn9hypEMDaj/CI7tq7qxegM93mPRFRLdbVf347ab691GV+65ooMr73B7EhKUI16rAZ3K0QjZpnX7OIsUPh64CzDhcN0+KndGHvS8OfP9pvA10aXO83NWRVFXUpDyAItgZDA+vCjJj7ziUAjCqjUa336broO6HQiFhS+3aYn4BTKtCeuXOd7d3rT5QgApbSbePG4qiWtxBDghG6AM/vsx7WME5sCYupiBZrZAzsmn1KV9iXsusn0naZdcHjwhHUEw38c/hHtQ61wOhCSqkG2hLZlKRLGAYd9ZtE0D4qt5ueHwh3heCDMSkoQjRnpOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wqpQoOwhZoN9NGqAgMX7ADcR+F3pMOYY3TXLid76qU=;
 b=wHOHUY1RB480WLoPfok7jsmGvfAWb8vDbCobyipufAjU+dXrwae7U3FrToYRFdrbGLq58ZipNnqatW684F6od/NlgE6GIQlPDfuBzxJzTNhsZRz5PPLWOLsBnMScut7AEh2LtyzQ/e1maxGDZWCnPFVAhxAD0Y4RkTZ+cBPp/uSoh/rvtbB2iqVKI2oZkmnyLaQHrFW9MEwRtUIItw3pHl7Sy9A9nuRhYkMmladK4xv52NjL1/n7A1+XewltZjhvbhDLokepRR6HeKu04xuQyHaMm+ndKewbXqX6FXGZH1nLaJqBUoSmU8QbgRy1nOegaGUl+lWAjsDdXiOrAiyS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:29:11 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:29:11 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 17/31] tools/intel_error_decode: link with minimal
 sub-libraries
Date: Fri, 3 Jul 2026 16:28:51 +0200
Message-ID: <67108b63bf342a3a0d2ad2e78549265e3e82aa8a.1783088106.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: e7dc97aa-d94c-4d6d-4ee3-08ded90f733d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: nqvWSBdq6ErezzaRiQelMHSuITrhIZ/qnpzQRogZKe1T8AIf8JXQngTU6Jg9NJw1A9GraJxhHfVgQVmD8OTXztiGROO/fABdbUk8CybJaP0f/qqS1NhgVaBP4G4c/lIJ0RF2ZVrmMWU6Ic/foXsHB/RqElReguGCyu95wu3BBYjmJCLMadnBxAql2PuO7tHEmKdcyJXOAmeac2A3EAQdnTGThk4rozqO9RiKZG6invZd3YfIGKqOGM9wnJiv3yvmoPlRhD+iaFqTSd1WU4UnjYeXLpF8NY1d/LgopsHSE8WaLxZhbHAOOC5JWkrICCg2CFgo2H0N1o41+nHyqUPCqMBUDLYH0y63zFWVnoLVr/SB0XLkgi3tk0xBZw0dLeMnnL73ZGLaoJutQovsbMIBgbEmZ3vFAdVD+Cnwcw/Up0kBJC57rmT7OrWLmlCH49lfCS4cq58wc6DRkEUtUHn6kNpwxWhHWou0yMzOXBNFdrvGB7K794MCazpgJOCir8hkSgOt8H3c53ei9MTYp3FiRVpEzHOEkGGsJta1Fz8y4YzSTg45j12KHJsfoRADHZ+Lc22XoEaKXNaKGla/unVL/4OvpS+SpG9hWItZBtYcR+zf+1oPIbuf2ddkxN5pDcwlZHMHqxoMoVQ/t+0JCQe4OMpAVDsjAO5cOUl+/z3PZDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bf4L84Akz+JxA+f3Avk/9CBARBeU5rYTxX4UBIInu7AM7raE5lByguEoCcPY?=
 =?us-ascii?Q?xx7O7y96p+XOIV7x52kB/HugiiOcYbE1SL3WmMLZsz3xiIr5AsEzvgLgpkd8?=
 =?us-ascii?Q?wrpJFHpClrci6l8WX1aMTd1gIpTKtL02eGLVfxJvm2910sHPtHm7sA8v95Kd?=
 =?us-ascii?Q?UAyHPSbitAhF6DWXX4fEJdvwTRSdc705RrfC8/o6a6etEEyy8JzUbzaAkkN5?=
 =?us-ascii?Q?v8u45dFUAPjomVqYVw607HLxa2xO3Zwx5Kmfg7rLTK8S1ovKsXcbu+v1KvJs?=
 =?us-ascii?Q?RnQqdqwv5Y6Wkh2HiqGArWVPxX6QYBJ5kSV6bnPTDMpM6VMcuZo5+oTM0n3w?=
 =?us-ascii?Q?2K0aYyQ8phdiegGKmoYDqHHBN/s+w46JqzZ7CCSv8RnSE0kJv4UQyQJGWt1h?=
 =?us-ascii?Q?B8LMPCZBFqlkV2v7+qelcIDqnHhEHSG+aKu2UsWOo4Rge0c9uNG+0jn5kXsk?=
 =?us-ascii?Q?NVE6Mn0hJr4wlK+ikuzoIl+d9ABc5sp06Z53O842Fc7gnD+t5FANcZp0sNtg?=
 =?us-ascii?Q?G5LU00MvxCPD+hZFdQMLBqIzJ6rzbtzx1A1GTfQYrFabSwF+cn7CBbbSZfi4?=
 =?us-ascii?Q?ZLSDt72dh65FnWxJHzZSBkg8EnJxKd23pkTic2BnNWin8wEobb57+rYuprKL?=
 =?us-ascii?Q?0Er3B8GNhRuOKFV9fXgWWRYmIS/iMFH9dXHGCag7TXqaI+xntoFk+Zwb/jdI?=
 =?us-ascii?Q?vcZgqMGWlkn+8aXQuVO8zfUFFvZF6ZSXuxloBPCMU5PwEBaorgrqyWB6BE6N?=
 =?us-ascii?Q?3vSMSMWR9Lh5I4MrWcVn08avxlS9szpfMfw/js8Aq/NAOCXo8RkuPtW4xdVw?=
 =?us-ascii?Q?VyywUcnv0LevsTUDsIZgbE/LLmxmazvu4HTODjjpwTWJYmSpicN/NLSkNIxi?=
 =?us-ascii?Q?lL1z+OUC7U7CBaK/mcAy2Eg6Q8YCWA3aVfhr++ockCbAPU0dhqx4NWdFXaNn?=
 =?us-ascii?Q?9h8UQe3SJBzTmy0GmDoWdZaP7PUxWpXlcnwITMuqm/Bux8lyQtUTtrBcKzJF?=
 =?us-ascii?Q?3vADXNIfNUQJ2aOzZd9tTJEYLGd73Vg51L73rsvVVeFIlTgiz0DkLXKiuI9y?=
 =?us-ascii?Q?lf/lA8vpq13Ova+A0ZEQaKooiJqjUqaPSjtuz89PlZzQ1E+HMfJPjdN9P5il?=
 =?us-ascii?Q?FvE3kG/oT8uVw6ZSMqXLLJ/e8u4uNF9adUVbBWboLHFfPanhnfkf8cQTi3u5?=
 =?us-ascii?Q?fYqy1+EQcj0SyWtMV7iJzPQI4MFFpLroF4jjj5yoEcWgctZObCsDGT0Kk3Ig?=
 =?us-ascii?Q?0r5nTQoyLW53ztyoEVanFze3VpgmW2JrdEQZ7JNFadUCJZkw5DPVFPOWZrzf?=
 =?us-ascii?Q?/olsDrzKYvUGSvL+0ol030o3qYUiCTynEYl45OdfLesg3Ty735BsRy+aC4WO?=
 =?us-ascii?Q?YZ3wSMDrkhjV8U2i+GzFaEXk2bS6amJoq4U3T+GmX5YrInVXK7HkHY+D/iy7?=
 =?us-ascii?Q?dJNhI8+GFxjpnLGkCeFi5DRUHFW149WDlCfgDHlIDBMlfe5rOrQsOs+8H4el?=
 =?us-ascii?Q?4gCW8TrYknfQFoehLkl0xIjuHnD7Z+yleco0zoCv1l4gLsM0bST/SVYKp4Nt?=
 =?us-ascii?Q?Cw3DIvFRB5rVG3URYuWA9QcCsDxgd7xYgapgl3Gy6+qe7f/jZoY/fOzMz0U2?=
 =?us-ascii?Q?/HYMHt+OxVvdPWuW2aVx+qauWA85pjjE91HQM+PmtOCFasabDBf1eULY8bFw?=
 =?us-ascii?Q?X4ja0dvhoZ97uEKToqK2UVc/tN3+Dv1pHVzb9tvA88zbnUqnWr/F0UiQT5B3?=
 =?us-ascii?Q?JEjZxeQMAzAHN7/1NOyNXrmqBU/85sU=3D?=
X-Exchange-RoutingPolicyChecked: JiVUqi0PUy+tOro4QlwLCpHnr2K/vrtUtsKg1DWoMYn8s+dAx6Iq6Ii7+koCOmpOMnWy4+5Zw7OmTbHiEcChGWwUkkMF3A34aFtKuWai872r4sBxFbVou0n9uCdpb4i2bufDSnNZU7J7E9yoPRmh8mB7+/ZmaVlvbywoC18i5DWVD4DFIDa38/hqQGiDNrx+bZNAJcgITtjUR73hczdp1znrRbSRZYufcOA3ptefA9gPXUP4cA5kVtgFUTuycA8DUTEOi5/U4LHez61qEppYAJhn3r74E2vLRteLLyqXXAASHby1VxILRcGK0Q4frUXVq0vshO4VMBlZ+45pkjp3Sw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dc97aa-d94c-4d6d-4ee3-08ded90f733d
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:29:11.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ic30l2375yKI3lBh57akwdPb7Zsw73R7/txmv6L+XXXXYfO+FCkwIpt2bs8kX6rUyd+ExyTqfoP0UAII98Q9yiyXHJnp47r0vd9SneCXjJ8=
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

intel_error_decode needs the batch decoder, chipset tables and zlib for
compressed error state handling, but not the full libigt.so stack.

Switch to linking against lib_i915_decode plus the minimal helper
libraries it relies on.

ldd before: 35  (ldd | wc -l)
ldd after:   4  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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

