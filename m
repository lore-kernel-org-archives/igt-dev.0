Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE57CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 21:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD810E49A;
	Mon, 23 Sep 2024 21:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHVtWjEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CB110E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727125343; x=1758661343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JEVynKx28tNmn9EvODBBrUuszfh0OSVnZQ1TNp12nA4=;
 b=XHVtWjEyPcxqhSRdDsHmB6INFGAShbtdA0PYK1OOHZmm61NOBo5ay9Ap
 /l2VG5J/S9jp9/UO6/HilplIUIYby7Dc0/M1IZO9EJQuQmNHQbI9xBxVt
 8+PEISK1NsTQmBxIe4JiuoShA5nquhWFFFVJu8nncWp1rk1S2qp7pwH/B
 CCvO8kHVvgf0cpLKfkR+i1jzWEz9yyWW8DO+JAyeNK9tra3t3JOCTOCfl
 yPqCn8JcBuAluTByPKg3I7E7ABKoNNujFTupOG5zGLaKbFRxiNAYlSyyK
 0s2aXAaF4Bq3Ws3B/ytsqJttP6fLgzVw09ztkGgvIZ35GcxDM+mfbmQS9 A==;
X-CSE-ConnectionGUID: ldf6Mdu6Q6yxQz/1E/U1Xw==
X-CSE-MsgGUID: TW7STCSTRWSyBjq/ZZUYLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26285584"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="26285584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:02:22 -0700
X-CSE-ConnectionGUID: cnVEYfmyTZWjzf+O1m3SDw==
X-CSE-MsgGUID: PoSQAGSJTLWOHNGnr0AjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71631438"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 14:02:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:02:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 14:02:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 14:02:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 14:02:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfOTXidzO7+adQ8HJWXYBwmvhPt/OWmZchw+/RcTVGR15FGmeljgECpt51omUBVwMNSHEd+NXJuGGzzM7YjvVfXJ9/xkNKUy4YNGrWeYAqHmGsU7P10xunmphDIf/EH3J9/r2T8K8xNgsIVZNXTXbMyoYx62e/51Gl/a5G6ilG4Cabx6i/xOx2IJ9LlanzbK0kIgVAeqnKCyPP1ausO0NX6XZuHXR6wVs0EnVYD3s8Lpg7QgGTgiXwluhftRYKEexPfPZZ8a85hgjxs0hg4KwAZiuyK45Zk/fdFV/IfgjLAp5hulVyixc2oHF2jRGP9Vamp5MntftZsxXZiXvEPO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2b5tt1PhYrIJxwbdf+KReCoftQ4wac+6siw4yYaHfU=;
 b=F6Xnvq/nRzjZu1xeqCC9TYYY1TmyWHpHSf/wCTlINEh+Mjv+ltowvaMYMzE5Jz1mWIHf6n3h7B5gs0XpcoClXfW3tbdEmIBVW+OGn39K9W3TtNLPvJJ457VyP+6T/3wFt/r1RA02V5GYoUHUKEoC2z5wx7K1ZfanEL01QzeC8CSS8AQIdhcisn8plyPT+mX3Wtw9/c44ZOmbJxjgtv50Y8lHgLjm7XNOXeXzOEXWyK9lbMoQDBnMwHQDyrEfu/FB/pjHvsYGH9xjhg7le70Dk6FqFb0HLGwFbzY+CD6pYW6PuhFvIFpz55KxcNzE0+NFT4XFVfU5ySbZRickyPnvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 21:02:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 21:02:18 +0000
Date: Mon, 23 Sep 2024 16:02:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/6] tests/xe_ccs: Use logical && instead of
 bitwise &
Message-ID: <e24ocx6kfncoznz4ta2scu2ya2hzg4v63xuftyuk2q4ccu3uf3@gxjjzsjo7wea>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923204557.32123-5-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:303:8e::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: b30557f7-cc2f-4ed7-260f-08dcdc13024b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FjbNI+/G8UD8n0ZkIhPIyQswjISOGlURD5CTBFo4Z6pXwG6WgfJSoH25tV?=
 =?iso-8859-1?Q?d1He0ij1QTq1ONgoDOWglBjjN981HRrUoz1qhRBEftLYCRe+4ULza0qvdi?=
 =?iso-8859-1?Q?j5tYF4HHkxQcy6ZEAYDuzdjyI1Xik+4pRLvqXArgRMScoiwZCdihpNj0X2?=
 =?iso-8859-1?Q?slq19crCIO53NQ8KbacbugN0VJFo6oxvF0UbsqIrbUloHo+9rvp64PfuXk?=
 =?iso-8859-1?Q?CsW7x660OLtfq5J9TEZQwa+eCnT2qNayGAlAAeInIky63CfYfFkkG0a5IX?=
 =?iso-8859-1?Q?RvjWlG/Bl1qGOWGHe77bO38KBRuMfEY6NWAOF38ks+p6Z3mAb/tNl5ES6B?=
 =?iso-8859-1?Q?hsNGtu/vfssVms2PkCuL1Rvhip6+vVNB+3gLPSEt/OE6FaFQLarSqx0p6W?=
 =?iso-8859-1?Q?84Y66KS2yKhnRPGhLkE0S51vUraY7fZFvNbgYLyh221TeASUmiWbkLhCmN?=
 =?iso-8859-1?Q?zKoetIMD8ZPK8lhG/u7cx1eN+MfzUrPwUUv19i3rHDexOEgibbmnQq6uFZ?=
 =?iso-8859-1?Q?DAjpXz801a3cmRAqrKshiQbk4EolZUTgmcVEWJEeP75Wl49qrnt1gVBvP2?=
 =?iso-8859-1?Q?MIR+nLjtVs/NZ+oP8oU8OxGPB1GRUrlOaM9GscuMrYij0lSIZyL38OX1kE?=
 =?iso-8859-1?Q?e1ZoohnQ/re3Ok0ypBz3U4cun4KaqKMN+GrZWMjFlM6OVIMhUR/FcFGl2J?=
 =?iso-8859-1?Q?TPJC1/TwR/c64MK72SR6mPRuseDsgSw1k+y+bMN6tFbYgb12JjaMH5WYEN?=
 =?iso-8859-1?Q?bHhbEo3iHY5rzJKoqEjZFfjD/5wi49u58ggMVyn/YNbpXoJPpVF8TCf8DF?=
 =?iso-8859-1?Q?9Apj+VraZ4tGBEiw6jws+bYPNWr+DtnaAbHsiANMCbH7QOKWhuQpcpQccJ?=
 =?iso-8859-1?Q?IljPFqKhuhaUM1aknDl+u1/5ccYUdgwgzq2erjHgxAyVoKCotHeoV1KG/+?=
 =?iso-8859-1?Q?jXiCKc1qcFhf3XQRhjyc3yq26vY50MZYjsuHfvU+JEdFzK4Nks8D2XZ9yf?=
 =?iso-8859-1?Q?m4NQMYkxNP64QRQavtIFL0zUph9xF9Q+k9zGyregdQC0h1lk8nsSCOG4nr?=
 =?iso-8859-1?Q?ZTyrMvXyzdxMpfOOB1I31XjmmZtBn+oeg1jF1jydok1vE9wUAHXtDybC9J?=
 =?iso-8859-1?Q?KaU4ClSh2YwCFc8lgVQ0l65Xyrc73OAZT9BLvhxvMIY+QR+lnX1kUiduZe?=
 =?iso-8859-1?Q?fQ2Qm4P0tdM+x5oYUQNNDVue99jhgoItUyZIVrRbPBg857yp/YHxkZFLxR?=
 =?iso-8859-1?Q?N3ohClqA8Vkvr3I8KvKYFYLAohSg9EKgefJIJFtfoogywBfZ1l7eRgpRnb?=
 =?iso-8859-1?Q?C/ljS4ba8P/JaqiIX14fN7JPMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YNwecSOHQZB7FP6nrC5ZQ5Ca9/rpfSqIP9jQd3U4RWzTRtRYMlc6vPMSKW?=
 =?iso-8859-1?Q?HOeC1l9s703EyeG3PTF8nmS13qb5TldiLp/+Ip4iAl7XeycpiPUcdbSBa7?=
 =?iso-8859-1?Q?fTMT8Sj896ZtGpN5E0LpU1uAoRM6nd7l6Yd0Ld5qSgm9eVWA8X2jWEUV/c?=
 =?iso-8859-1?Q?8tTic1TaaVjsyPJeYG4xNMLOHfdmN8MC0s9cUTPlDngpmE/SgJt0JS+c4K?=
 =?iso-8859-1?Q?k7uOGjKRR9hNgbW6Du8D8s+Rc9JBcgtKvz6bh/uraz78mbSzIbFaGhTgW/?=
 =?iso-8859-1?Q?oFU49nfwr/IhxM5equREkILYmPoEA39GIUcjyr49w/JUeIStDgddu53xaN?=
 =?iso-8859-1?Q?+tk9BarPRX+szGy5UU18qHpbcNxNT3H6tnF96zQSF352uhjSkpT0n56nJ1?=
 =?iso-8859-1?Q?UOeXjWYTsEL0CiUHp+LipI1Q/rIrUDWlmcWaPv5HgQ7M5F7cHSnCW6lZMx?=
 =?iso-8859-1?Q?zRpcY0lP7evdKskA+s69hHV9vP0TYvkDyXQ/8okr8g4NmzuuiAWoobatDR?=
 =?iso-8859-1?Q?SUlcvIxQ+b2uwgPui5UZEC325jK16zKbLM8FHLApvO3Xl37m4qK4u43FBS?=
 =?iso-8859-1?Q?4Dtz4lsKTP0muTWT+C/SjyXNAM/qMICBz04Dk2TYN2oOw+GRqdwHtKgoU3?=
 =?iso-8859-1?Q?HU13JMvCQ+mTzLFfSavlzyAf3bWqPtlBAdd04hcA8Ynze4SBPPvrgfncO9?=
 =?iso-8859-1?Q?wTgd1End7QzB1yZ5sr3ZxGIuAaxF27iQaTVImGjx2c49Y0XtY4MopzC5Wr?=
 =?iso-8859-1?Q?LwrHKNg5H8fftwSLJ3xwuWPnCXbmEfulkMEodxkarhSWsbSGAkXMdgCQb/?=
 =?iso-8859-1?Q?koRb5vU6gUg3IMVeap7YvvVF67dsrtqGqBxgiXdfa2y3jbG2WLiZtkjLtp?=
 =?iso-8859-1?Q?zaKroVQccoP+rwx73UD/5JrCmyo4m1wTL2Ufq2bBma1ED328XZr4hi4lyw?=
 =?iso-8859-1?Q?g8LlehRyKcV0+sHAedGNF7a354o7Unhvq9kFx+YCENkEFtNgasXel4KMS9?=
 =?iso-8859-1?Q?YTuNJVaq0C73Bn2yMuISuDVbsEs6RDe511MySPzivIzZAtoP10BvfYL+NM?=
 =?iso-8859-1?Q?L/ZmKPM938QEjynGyt0+1HYHqS9tnaZMEhECELvCRXtIHzmAlRDPPS7uQT?=
 =?iso-8859-1?Q?9srDZamJ9/H5wczHQ/PHnzlMR6Ze+trS0twih/FDlgXQiB0SIMmcBKlyeU?=
 =?iso-8859-1?Q?i8EujfmYRpd6qHJ2+SnCaN3lF9aW4u9SMzFTnTrLmBFgqaw6DfhxZBDmG7?=
 =?iso-8859-1?Q?LJq7esW2DtwbE97r4s3elvpmxtbWJrPBfXWYj2Kzz9tqO7zSNz3Lg2be52?=
 =?iso-8859-1?Q?kSgUmDQolbgUoCIasSdrvwEkQ6ASV1q2Zu4fpKWRv7BwcIw3y+U8aafEdx?=
 =?iso-8859-1?Q?Ik+EVsLV9Sn7SMv7yUP5r9evkYO+My7fqDPRhiRmFJ+eN8emPQjHi1qa4L?=
 =?iso-8859-1?Q?JLm8rq/bk3dce8S+GRRNjPJhui9Q9tpbrAS6GUFDxx8sF0c+iTyeIC2EOd?=
 =?iso-8859-1?Q?vIRNV47LaoE0LRLoDg/xkG9Nho7J24Y7cgwCpYvfM8lvWjUlcGUYTMOlgy?=
 =?iso-8859-1?Q?Huvcomzgu+s5dq1RpAQO3SF/0uUOtSAHwGTB7YpbYq7nm13xrCB18bwGJM?=
 =?iso-8859-1?Q?tk8QCelEMm/9If4ZaT/PH5CzkLqbxbDSE9Rs9tuNs52TtgqbFZeuNmVA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b30557f7-cc2f-4ed7-260f-08dcdc13024b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 21:02:18.2085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNold86NON2a1LjHXT1EP9AH5YgBYJxKctpqAHzs5LOwZ4FGa56MWTG6DvfIxhwVP++rHYDqOf2ukI1RKkDnkoxutNpSWFit+A2wSYPDLw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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

On Mon, Sep 23, 2024 at 11:45:55PM GMT, Ville Syrjälä wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>The code appears to want to use a logical AND instead
>of a bitwise AND. Make it so.
>
>Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

same comment as previous patch.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> tests/intel/xe_ccs.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>index a55ee5abd5b3..e656e5123841 100644
>--- a/tests/intel/xe_ccs.c
>+++ b/tests/intel/xe_ccs.c
>@@ -344,8 +344,8 @@ static void block_copy(int xe,
> 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
> 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
> 	uint32_t run_id = mid_tiling;
>-	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>-							!xe_has_vram(xe)) ? region1 : region2;
>+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
>+			       !xe_has_vram(xe)) ? region1 : region2;
> 	uint32_t bb;
> 	enum blt_compression mid_compression = config->compression;
> 	int mid_compression_format = param.compression_format;
>@@ -479,8 +479,8 @@ static void block_multicopy(int xe,
> 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
> 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
> 	uint32_t run_id = mid_tiling;
>-	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>-							!xe_has_vram(xe)) ? region1 : region2;
>+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
>+			       !xe_has_vram(xe)) ? region1 : region2;
> 	uint32_t bb;
> 	enum blt_compression mid_compression = config->compression;
> 	int mid_compression_format = param.compression_format;
>-- 
>2.44.2
>
