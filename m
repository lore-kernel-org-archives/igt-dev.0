Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62850CF3962
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 17:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A8810E732;
	Thu, 19 Sep 2024 17:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBN4kMWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E5D10E732
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726765199; x=1758301199;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=CnLXxDW2I0on2ij8Z9518wor4CNlaizY0juXYHGKJB8=;
 b=mBN4kMWIpxnqMry/JVTnclh9uPhqRcVSyYAiz0j6LOM8oN4cGupyAqbd
 U8uDAsn8XIcqDlE9cZXkpIT5BNUW1NzRONfuoKwSxj1GdvDVhcZfYn/83
 i2MvdmD1R1GTZFdj5aahkT5YdBU3U08NJxA/bAj5fTj7YF0bj2SLgRzNy
 +yk29JhLVSVuMqnZ1hRwx2LuZ+zP/+80kXqv3xCGgiO3cvaAN24ei3Jgq
 H3m13V3k8kj/2qnXSisD8CkI6yUt1Mk8PeO9Ekp2SgxSyTSQF5TeLhFaX
 FK9la3CZSYMVNrVcwboVxGCkRZhJEfucQzZ+e952NnMo2Tcv2yZVHTuAk A==;
X-CSE-ConnectionGUID: 37uk6ySOTSeVRBHdhm4e0Q==
X-CSE-MsgGUID: msDPvi7FQgWyhLKN5rGcUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="48278143"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="48278143"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 09:59:58 -0700
X-CSE-ConnectionGUID: iDXwvgJ3Sjew8bhxDRTrRw==
X-CSE-MsgGUID: FKkhDZBJSkWYYXTV80n98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74535838"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 09:59:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 09:59:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 09:59:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 09:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqbZM1ertUb9wpSiHwK46lP1BMRsHJ4uVIiLXA4tcZi8x8Lo4rpVsA9ZVADXk6WZlLReKGraSot6DUzljw3N5QMuawFDx27srOEEvXmDKySL6oFqk4DzwSJJvXPC2nJ5TWGg2fdoWJa0B+MOFzBUg2I4cpLAzkhwrFR16uL7Q4K0Vy48o4wqi/1vDmNJyrtGQb+7JuFNJJhypDk9NC6MplqpvM4Ztq1B5TkZ049nhcu61NA3fZPwhk1cxLyNTqGXI0IcgRezZ2R41GQVXVkYywCC/AFWe37Fo8DObJZ5ToP8X0ddIZ3khP7BUfbP/wiXJrY3543nN+ba51cL5Ikyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRApWbGLs9/ix1ulmrGK/yYLhM8EIT4A+PEvT+gRcvA=;
 b=IV+efxvvrTwm/RWQN6lBg6fFWIO9q/9WN5AO+1MwD8zgiG2EpmP0vdXuqUQe9wrXiARdiwN6W1vpO0Nfp79esHcXLN0RFWLnLJXuBPAmFwQF9dHawiapjF0P6Y6JRwb8pSeQIHQtW6xVU8WeRsqbHzYPA+MtXtAsJV6S2nZzC3Mw01xhBk5Qz7Lc751AUlUmW4H9IQQDpqmRh+feAK0lqeGU1RDxglmrrC/IMYzGEqskuVK7YR5MgwdjgpRn62oVMqFqfO0lnpsB84zmEbxhuTx067ZDOJCPDMR+f21yw4nuGm02E7vfr72GzcVwJT4fIb+sKO4FcXnp3fXEEmkElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 16:59:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 16:59:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Bommithi Sakeena <bommithi.sakeena@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tests/xe_pm_residency: Fix while loop in toggle_gt_c6
Date: Thu, 19 Sep 2024 12:59:50 -0400
Message-ID: <20240919165950.50879-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e4536e-6de0-4462-c1d9-08dcd8cc7c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BNDJ/E7xdZxjKx6oRXJRXHB7alo91qgRXBJ+tu/qWb3Pq65xquhudp8FRp/L?=
 =?us-ascii?Q?PXBJ+v4wpnHb+WcfYUkgaxXePcxzlXD7RWAQwIVKYpOa9K2MIIXIX0heAfEj?=
 =?us-ascii?Q?LNhn+4uO0L6FaPsg6ThO4bOJ8E0sbdWgFnLHXIBO+qf/JdFmLE8a8t4MCbEo?=
 =?us-ascii?Q?faJ6dJpyP8l2D52XrU/KoBa6fEr+O1kTCSkRIraVc9jjceY0Bq58jPClbsah?=
 =?us-ascii?Q?Ub9b1N8uu/4TvH9VtfnxMNbJxsDgf7F/aDG1bMb+Yz3BTDrtp3drEpBMKjdX?=
 =?us-ascii?Q?DcxV8Xwf28MgS2bWfoJBb/P0TIHKzPsnUCoMJn/Ves+B8r1nKcINGB2wpQcY?=
 =?us-ascii?Q?Y1jstmOHeuS9evjHMDUAxRNTt5pZfEnIcPnlainVSefLyhlAGF02RhcDT3eQ?=
 =?us-ascii?Q?WNMN/BhmAKjH3ZHKKZcupEKJNPDuPKahmKO77BphAizfzzabkAbYZdAWswi1?=
 =?us-ascii?Q?oTsMzRXHmxuncf4XDyMp3kEeFRFpkstjYxmIhqqaO1mVbswESo5ghKne1fFn?=
 =?us-ascii?Q?VLRH4oaZP/FHxsNHvjqojYMhs5+cdwODLcEz8eKIcYVcC67RTBVTfDRheBdf?=
 =?us-ascii?Q?MipHG7PGLMEDBZ+yNP8Qvr+BQXVIld4c7dt7s8E2pAd84Nvt3wi9QrwOxP5D?=
 =?us-ascii?Q?mZ7CaPPIKyRmWwFWxwRcpRcpglK4sV2JpSde4B+/I3aMmkw89x6/fMsZsFfh?=
 =?us-ascii?Q?6LhMxXGRqhahM85u2rFohcA+icT8E1F3r+NdK9EhFzmAQz5SYMsK5+yVEYgg?=
 =?us-ascii?Q?BuHe9FqE3h1TAQnRt1zYawrcIR5DHS5Ey4PqmIfFSRTvIlZDjedcBwApH8zv?=
 =?us-ascii?Q?v4PobiwV+TfmhfrngguSrpL4EQpsynNatLOvuYO2ZJLVz59x+4C3sD92KjYh?=
 =?us-ascii?Q?JDJgf58VmYlbbSbUhyFcQ7hVGSXeytEBrlJb0BZrsjlxhJXzCS8kem5ZivBK?=
 =?us-ascii?Q?JcDQpiW6L2cJci+Z+MX5ahhkynh4CiQnbqT6wUmg916YeKAodC1JpiyshUpx?=
 =?us-ascii?Q?je6IPoJ8AlvqSqXmCseZTM+uWY6KruZiJh07qlY+8kAhZp3kNR2I1/d9DJb4?=
 =?us-ascii?Q?iawm/75vMbCnpi+EWBSFXWEu/XLVRivxocUJEsJSsZI1CNOypbw4/6txq8rT?=
 =?us-ascii?Q?7IBEemZblz+SVPGJo3xGWvpeX6wbaKipqous663RdibriZH2lzJX3VHJ5hA8?=
 =?us-ascii?Q?dLp8cLAKD4gxqqx1FTb146aKzI07MI/X4f9C4j/D7asy1bEI2pI/IPV05+t0?=
 =?us-ascii?Q?olEvDL5L7OFNvn3z2wqRMKd6QSWDSEmLidLvdF8UCmYs3K6HRnQWZRuO3yyP?=
 =?us-ascii?Q?ENfvs8gxBz2OFZm8Mhdgeai0774naMDsoZURHhNd0nlE7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6GzPYONOGtMprPmM/OoZbhXIEl5ZcBaa6dmksjrp9E062JeJytBBQgKXzIn?=
 =?us-ascii?Q?R8XL9TMGJwwjQZF8/LQPvkOggj8lpus188S0I9XgEzsEstX5fRwVFwWi6Jgj?=
 =?us-ascii?Q?D50/WHLolTxyZSXtZIFOWZjQ8zyoa5/f43FrOLaE1/Wtt7RuKgS62G4939R3?=
 =?us-ascii?Q?/MhGF/LgWH0lDKzplGGWGYUCIGpuVcd+VOGWX/H0e7jdfONMfnL8eQpclxuJ?=
 =?us-ascii?Q?7o3QRO5H742cF+9FX7XBLEuJSLyndfN0hWBq9wy1qEmk/M/+I1ceEPzzHnBS?=
 =?us-ascii?Q?4XtHODyjYkmMPrrAiT6AVYDcXt+ryXuv+s4UNxe0dovScUo+HSZKJuF9Ayz0?=
 =?us-ascii?Q?XqgYArF4nYqFCmjc/H7v5SP+Ks3wSNURrqKvdUUBJeefDvjFGTHoEesPlMTn?=
 =?us-ascii?Q?/mJHJdzSJC7bl0beP2ihN1TJj9+4BzmgNEb1YLEWN65XRjtew9YNCJc4qAzY?=
 =?us-ascii?Q?aF2jGuxrRA7Zi0GM3Q1WHP5v7ZigEiFNrXxs3tnG0Oe78L+ulizK9Q2Hm9KJ?=
 =?us-ascii?Q?mpOOd/hcMFUv8U5ncNdAU1wg9jVT1cEJs9Tq3xjHiSl/wifAVoSJyfN7y42E?=
 =?us-ascii?Q?sCKrJiUZclv91d3iPRZwkh+8BA8hEqZhWLZSkAJLWCZtzgN2nKi8m/u+w1RG?=
 =?us-ascii?Q?btwY024P8++En/e8JbxG/HwbRSg2wTXehjdt6fGSg7pZoqBdZKQu6i70/wsm?=
 =?us-ascii?Q?6qrCzff47hr64PznmDTFF0Aq5bbBLU2fs/pcTjS7OF2+bDRTbIi7lPGr7Cz6?=
 =?us-ascii?Q?icRBGUucWDsC83HunyzCw9Lngk+umSOrvkHJDnNPR5S3l56eXm5WCtxqE67B?=
 =?us-ascii?Q?+AsRYhKoDGnusxMmJwQJwgmFMLy5chsJPbMVaHZZC6uqTvKPDjfX8DGb8RRb?=
 =?us-ascii?Q?5sZtE2q1dtMOhyPsH2DtGfLTD72qRqjJhCr3ESN13M6lnNhdPgEJ4GBXspvA?=
 =?us-ascii?Q?bvgmkn8jyRJlAXRbLKQF2f79yL5TvBp436znd3SndwJLZb/jEWIxM0rPgYSk?=
 =?us-ascii?Q?Xt4cklcvU3ZevMkYmYszfPxIc2KRCho8QDHnInTPz4t95bF29p5MXvPQX/uo?=
 =?us-ascii?Q?ojSpa6wF+dWKgSLBOJvlBcD2W5pPGbpTj61KGQApbJWqHB4PJUQgetXwLYiY?=
 =?us-ascii?Q?rSni4sNCPPxjE+VyPIVVF7Gl+wY8jAp314ddvRT29HvUDhjskMrHisctKNUh?=
 =?us-ascii?Q?lIOXFR8X5bPzlj9+CsTR47XIrw2FNXrooyf6JM4JCBUEZksbuOfsQuouHB/U?=
 =?us-ascii?Q?vKeo+RBdINaBlt8PyHTiNXNSiqoxF5tnuabOPuJGgkxM+XGAF/SmYVKDx2eV?=
 =?us-ascii?Q?uER/Hfm44Fcu7xRSngYmolXbDhfytyar5xsizuXtdlyD9q8l/x6HJGYuxOjI?=
 =?us-ascii?Q?OfeWN0CO88PbWwyqHhwRewtNRQGv3OCOSG2ZzCoWngElK82uoJm7w4q86xbK?=
 =?us-ascii?Q?hSs1j0kPv1gyA8zTm3sjNc7qg1ZKCQIDUTguZpjKbcRBlCLfC05UssE4T34T?=
 =?us-ascii?Q?PpXToRtMMKw7pQKZQRpS7snIvTF5FZf17k6Y4fMkBnCNWSjY+nKPpownjhYK?=
 =?us-ascii?Q?rR7rQaVlbeFjeNVLi+SXgwRYnnakxHuBq6x9/0VncaARtopMIVW1gvWce0lD?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e4536e-6de0-4462-c1d9-08dcd8cc7c34
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 16:59:55.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1i0i/j/ZeVcsNoLtMbsahNKajo3f3P+F7/QMT1q/+KvjTeD0xYkx2OlV4H912rpfPq8dG+rOlHmFN1mppomig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
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

From: Bommithi Sakeena <bommithi.sakeena@intel.com>

Function toggle_gt_c6 has while loop iterating for (NUM_REPS +1)
times. Correct it to iterate to NUM_REPS times.

Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm_residency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b..f4d05889c 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -297,7 +297,7 @@ static void toggle_gt_c6(int fd, int n)
 
 		if (n == NUM_REPS)
 			measure_power(&gpu, &gt_c6_power);
-	} while (n--);
+	} while (--n);
 
 	igt_power_close(&gpu);
 	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
-- 
2.46.0

