Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42910C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28E10E390;
	Wed, 29 Jul 2026 11:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAaGWkJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF8810E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785322991; x=1816858991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kdgM0Jnp6RIJCjKwgEXsGN6gEF7Lc0OR8PjDek5+9GQ=;
 b=NAaGWkJsSHnmeyysnaT2egfvvGkTqqWKkI2mm5sBMQvJRN2vjhdeY/l/
 JnAYagyQUghpWl3LQzvS6YKCbWD6PZNp5zl7KFzUfM5AEHe5BuejDvkEx
 XmU+hty/Azu0+fUJLm2ObsonJhM4WsMZf7j0Q8NC7ilsSOW/BmheTQJJU
 X7XclM03D0HoI9zPZtFekCBJvn+DC9W32032DX/StqF6i0n6R9AzkBsTt
 of5Fc6IRxQz0BoSBZ3NKdBJjhA9T0niI4KOH/adQM4L/2+CGpA6EWffRJ
 p3BTSUKfJK+XB9lCwU79qYDvNXcd7+YBsI2AsxhhkART9Boj3NMgO7Rop Q==;
X-CSE-ConnectionGUID: FeTtvx0MSBeRKBfCBLBUag==
X-CSE-MsgGUID: kFlFWr9xTX2Ps3UXNM+wbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108718995"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108718995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:11 -0700
X-CSE-ConnectionGUID: yIQgVfn9RRy6Hlw2Z0wxtA==
X-CSE-MsgGUID: DDjCv2YzRkavr/u6DpW3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258204777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9/t0vTSlJwhNn3wC3tDLu1hPwfATn7DJZa7r5JQOkj/oMt+XcyLflbOWkpUi5JmEtGnvFh9M560Opk9a2EG779A2MFgEIzhdAc+3wR4fdykXPaa2PjNKOKZazhbM3G2I15XLNYnN2p1nuza6pDYY5VT1Bo0NaC/tbbDgFf5ECIwsJux1qC8wgCA4k6mMBBALZTlyKsZ8L8jeoavneiwpc1EDLXSMSlTIg3o6jK3YH6DLrxRyE9yV3ucsH8XBEvrLem22nVXtcLUhFfmTa8GwzqkBPsdrSVKw/OqHfU0T9gJMSHW/HTX50R4flHTvepWSG8OhywX4S+D+X0fKwObng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkEMmtQo3eTa+PwYTOIrrlRU8QuswIgiYBx+JHpOleA=;
 b=NeYjIoLurRHYCqz+Mn+YYfRe8X6SmYwdm8F8G7Bnk7BuZDdlCqPbQQIFj5fyrxfmUU5/zdkfIVpy/lgZZeoG4V/aaCJXr17Z0s97nxuCy2FC5ZadUFwEqLf2/eg/aFrBU1vVLUcoxQF6DRtkfhVYiTyOTKC9PX/FbRjDA1UfBnxwrDlghe0CeAx8474cxeU1HioziQdjPJ3IeNd75dHc4UMHoNuMC9BI0hKZKQ00p6LOv7wgPCoeWQHHPpRg7g8XmYhyx8X3n22izDX8hU0+jkTDacRkGok2LFhxVU+lij3L9qEH/tg+jYgecN1i6m0VjRT8IRbEwfftY8dkK/me7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:08 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:08 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 11/31] lib/i915/intel_decode: introduce static
 sub-library for tools
Date: Wed, 29 Jul 2026 13:03:28 +0200
Message-ID: <fdc8c1daee1b35d7231e9967f6d9e2a265a025af.1785152675.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 81a86639-f38e-4a4d-0731-08deed60f8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EpJ+CVyBdgW7zD23HYtwpIyJW8oDzdrkHNG2GNEnDcKfDOSM9oHt56babzjg8E5IWB1gVXckigEv4XjOPvBnOW3H+ZBNXVw1ddWDg/bKAV4rh8JFXWF3M0sF3E1w22ZnP9367+hrNwgZd3m5cfh0htiFMo2XPjHVKzjPgPi2FBd2+0HiHNI67gu5sVJsk7unCxIJF6kaXY5qfWvS7Bsgqj+kPACa5IY2ytzyYUZ+ZLzLx90qTVfPjYVEAmkvT3uQA1I3/UHzsiYTj0+eA/RfnSY9+hmwXcpxhoQp24lfHZtG6b/5yION9TFKhZcvkngHPoXuM8D+8f+HoQ95HczfLLUDUEt+KyuAy/u7rwf9uoTILgqqu1gHHMxod+sMaak8gCUquyXlk5N5gkPEKyS6NGN7sKFgNHcLayR/EOdzhpx6vTP4eB0keT8Kn1+WFQJc58LGW0PwVED10eiTQ8G8UFHIMBEQtYrJZYYn3T/W6yejOUb8hfWywrQcde2uzxM0miDlMBfok3v9/guxp6GIaWQ/3h/I3B5EfGA8CUa5l/QQ7z+vrwILRaQ7NooLPAjzdaZw2JshG17CHkrXO4VSDGcfrysyH57jFGvlz290fgjSmHg9fvTD+g2FBsM4nPU8DCn+gwqzKsZiv4UrOHgzlsrpmeLgpI1B5Fn8sNolJ8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aCHYPUrrkB6pRx0Gz0zaDSJt4WXuk7JiM2r4ogCI7/xbjVK6f0Q9JmBrQ70l?=
 =?us-ascii?Q?Svzl+0cibmNYCIwYqpR8A85RFeCo4WSJrQeZ3ZFl2vsRPCG9w/7KDY1gphmD?=
 =?us-ascii?Q?0cEaWH0+4SxBKUvvk+Zr9ZBSUrG25wwNmNpwkoKcfBm0SdkQTXMNgb6kuK1E?=
 =?us-ascii?Q?jDU8g3Jv3Nilap7jxPjek/mAUuiViYyB3ETmVyp1Xc+QAgZqsrNtWyIyDIjB?=
 =?us-ascii?Q?ylFsDklD8XHvC+EFeUXMO8BqYptSiSwSbTSsuCghekJJkg4T71fpoYnOZr0r?=
 =?us-ascii?Q?sj9cJA2efhcrDcUEC+yNGOl/kBlRnbOjwOumUebthBn19eJ10Ej6EsxZqt9C?=
 =?us-ascii?Q?X+5qNUWO1t1BKzwcq7eP3JzU2uWwLbYaIl4hd6wo4YTZ0hgG3ekHhT3fk/Us?=
 =?us-ascii?Q?6uRzHkiVbs114wBV7OxT1pF0bQINjPAdZnkeUypIwHsyWlnUb+0vB+dQMFiC?=
 =?us-ascii?Q?3m21wqjpn0Krkw065aKs+DKGYbp2knnVQEc97dBlBRmtxhCTLtE5cXalcu2o?=
 =?us-ascii?Q?HfH26/qOTZFL/8+1vKXFGMjLEnhDnrOjn91Fzq9ZWWjb3khLfN5OMZ/7kORy?=
 =?us-ascii?Q?Npj7JyJ6/c1fiiZtVpF5Pw3IgVG/Hw1Nx9IqRBIxxWX5ZLG6KYUw0bxvKQgx?=
 =?us-ascii?Q?RNMwPdfTQPejFDupqJp923MK7OihougCl+hddToLeVAvBkgj5HtJfFnSwYu5?=
 =?us-ascii?Q?uVQoENUn0UoWKTMVy0LQPAgdlcl2Ehlaw+kANODcOWC1MVoBmRjb96RH9Nl9?=
 =?us-ascii?Q?mIBAG96T6e29AvFreDXsYJ3cMFZ2TBhZtNTT1YhcUoV0jTunnm11lyeZVPof?=
 =?us-ascii?Q?h2yRWMigMNIboHEp0KKsekljsGljfuTyxtatJf2FKuB1of0MElvSPLRiieXX?=
 =?us-ascii?Q?qbXV9tiE/ikMliHPhwIchLQ/SdZZKYw0enTDKfvatBlWShfjrG1h5MQoG/sa?=
 =?us-ascii?Q?a8plRm6ET+w38CsQTMKo9RsD54yECvw89ppVYR8SLTmVI9vMtuw7FktxsfWt?=
 =?us-ascii?Q?YY7JMn6AFRusVEZzZ5rN45o22YqL2fOgaCK2LLROKDQcCn+Cx1hyDdFgTrmM?=
 =?us-ascii?Q?lcKwgCzI+FjGe2BFq6f6a0fi8OEfc9uzXQQ5vKHGt4wn/dirq1miBVFA2WvS?=
 =?us-ascii?Q?TGWX2rCqmT7gFGzmPXAsm1kT1DFLaMLzd3nhBRsf/4Ik1Nc0jqcf9CEvCtW5?=
 =?us-ascii?Q?dWQZv5iEAuZ5SUfv1bOspfyq+DdPtPyAOrrStVUtTG/8Ek3iEoLCSrvm0B/8?=
 =?us-ascii?Q?ygXrz1m67D7w1ioHsyjSr536o5WK62glqW3cHD1T2sQ2YJTbEokoT+gaGd6A?=
 =?us-ascii?Q?aV7ErTfpBKSjLzf2z6MNRNdiIDJUD6lhI9UsGx2bGXmVg9d+e9puNlhUD1OC?=
 =?us-ascii?Q?OKgHRfwnpB2CK4mrFrProSMejqlroQ3Dq8paXwZhxJ4zqvhAQOKTaet7ntgz?=
 =?us-ascii?Q?FgNvfIwp6Ul+6QacqxRmnPZUxx4fS634V7yh8BmnEVeE9KnZak88zZk5MoN3?=
 =?us-ascii?Q?7ZBlWfsNQWCKa9LQDmZR0JkOWT8HoB4YN36S8v69Y1aaoLXf9L0+HEkVJ2Hl?=
 =?us-ascii?Q?g9snblX9i/jKJPfzlgwMk38hH1Ln6bmgkCuwjrtWLgoy1nyh8dvJFVp8R8BD?=
 =?us-ascii?Q?IAxlluu4LmZgPxpH2IE//R/Brom0rNr3pE36IYlXldaHvGYF+8myQK1UbVn1?=
 =?us-ascii?Q?YHq1WRhr2SCJbomx4PU7f1rciHjfWuCpB1z+GwRNG/siPUOiRYFuEdLK46Jt?=
 =?us-ascii?Q?LXVwR3dS+LYw4m4L8a7ywVNmgkJJkhE=3D?=
X-Exchange-RoutingPolicyChecked: PorKF/HujZBufB7KNxWpoo0rTIhF2bIh6sA6dDNez9QnxpNYVYiwVYsoABS9cC9LyGX/Vz0xUbPIsReWf8pcIZYHdN/CgxVGbH6BCGmtFKLDm5wlJbS47MzEH5/hfsP2LiGLO24bMp7IqznlvO2hOIeFWbtoV8e3c97AgNSnAti7zqX0s8JJid5WK5z6QyuIFZv6/R5n6PmC0j6pYWs4CG17cylMufv5zmdj/nABRNvhvas4vN1VWQ15k1RLObTrMJz5n5TigfmvJn/F6rz0FZC5NOBlk/TZLXgxLuWglDryfO2Yh10b6jvS/cNooT1RAeMMr6EsbkieTPgAs+KEUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a86639-f38e-4a4d-0731-08deed60f8c9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:08.2454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QZlxY+XsQjO7xs6TR0X/pSTx87V43GJ/5Ff6cKHhak0sjgSTgAkc8Ts0wlzb24DmB8B/vtIoax7y6D8WaBBFZiLbagaCfImoaiVd3KABvA=
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

Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
This lets tools like intel_error_decode link only the decode logic
without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/meson.build | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 93db217f8..8addc8982 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -423,6 +423,20 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
 				       dependencies : [math],
 				       include_directories : inc)
 
+lib_i915_decode_build = static_library('i915_decode',
+	['i915/intel_decode.c',
+	 'instdone.c',
+	],
+	dependencies : [lib_igt_chipset],
+	include_directories : inc)
+
+lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
+				     dependencies : [lib_igt_chipset,
+				                     lib_igt_tools_stub,
+				                     lib_igt_drm_stub,
+				                     pciaccess],
+				     include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

