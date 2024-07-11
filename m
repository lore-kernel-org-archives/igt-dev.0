Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B50AC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E5210EA57;
	Thu, 11 Jul 2024 13:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RS5VvECS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7767710EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720704079; x=1752240079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HQE2irmvj+kJ1h/ctyzSjqu0bYVqplFTYP6HPvLf9U0=;
 b=RS5VvECSWdmfqZEdbU9vE2L77CcALWUbJZ32Y+F7ugspSsZGtAEMFmrZ
 /O2flufowI7ysNVpkZ3A5fCoIPZUYZV9FG1GEKNnUvCovcd1we6OUsFQ+
 a/A+eCrglK+dsKDdmTCjnHmT1Z6wI/Q3rpv6b9/0dSygNkZrAJavZjall
 IRjJkGoIihSelEfzv6SztmaGP/pInNO+pzxHOr/if6WFLrpyxT0hEcSJv
 hcn+WAhscJT71mteRt18DykkZoBtbscRg5u6ByL33gEfPXeI4VcBUyn6H
 xsqbb90QGZ6id9Wqo2T/rsmiSxOak2v+UyOtJsGnMnTMxNzYyatRKJmdF A==;
X-CSE-ConnectionGUID: K1Il5dxkQlO8OgzgEfa0EA==
X-CSE-MsgGUID: sweDiEcVTJGNpYqRSK934g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29235436"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29235436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:20:29 -0700
X-CSE-ConnectionGUID: G+0zPGlLQi6xYUN7MW5sfQ==
X-CSE-MsgGUID: FZHoymRHTHe2KlM3zwImYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48310069"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 06:20:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:20:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:20:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 06:20:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 06:20:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrCGaaeyHQb2HvgzsY9KqoKYB1W17TewKqXMkwR1nifLGOpntMYj0DxRNIyRUozvGtcSiZLYymu2ar1TRsP8HMybI22X9q3Th/rJl3GHyEVcAa/EisJiWh9v9uRI8EMA9SSzaPUfAFAYSlEfy8BjfIBUPe9LOUbd0tFI6m5StRjdidRzwef6untIlL/+qnUkBjJ/OIADyjK6BVYD8+/ENoLGrmkWIelOqznbcTP877ha/rdptFJsr2P26PJUMk4V+lJVso9HQB6E/iTi+v3Mxk3BCgEqPRcWqRwOcnScFI+BD0watVqn3Nx8quf8Q0RgfNVA4reW17RhRJ41zQUh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oK4bnDNdpQ3Sd5WhWerBkCXwxiUm6v16tLaU+70jmM=;
 b=kmZqI9ghz5eTmEFoYCPNu07FABguSTUvSiwNqS0Y04S0781H7A0+8chnLKv9p/dqogBVOpqOZLvoet7cTmjsnZT/75P8sdy5/scjwkEIx60e/xwRPwMeBXk3XmQONOAe0OvmQLWeCb2Uf6kO1DJyianzmqRIbS+aQAOvs9puqDR1z9xg6uahykbbK8MS8w1m6ye3CF4wyeBg3mLtspL/OKh4DTJmp/zaP+Ghkghfx4zvULAO8E6okJMDwNcHJ06Nbu/5MeYs0Wku59izeB3cN2F4IIaUsddP6nESlS/KGWGLrGFqhH0aPP+coQXAORr46ld2Vj/jiRMnXfn9nLl/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:225::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 13:20:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 13:20:19 +0000
Date: Thu, 11 Jul 2024 08:20:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Add single
 engine tests
Message-ID: <fjpk7jck3tv5vz63n2n4c4jayo4gt5folbfrnncrpdrblb6kgf@hg3exp46jfx6>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703002532.3156277-6-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 859a52e3-ddcc-4df2-8460-08dca1ac361e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WYQuXKPXWEcSuXyFqmX71G4dJZXsTjD8jZsYzWSMPxtOmPwnt6SShARCxmyT?=
 =?us-ascii?Q?2qhoYN6xpsdjZdLUaE9hxfnDotgB7uZZo3sjlWxC7oWFwRLf8A+ORQ6VzL5A?=
 =?us-ascii?Q?mLgWIXolO/CbN6rScJCf/Znb/TkBJfK+3vcOvr5F5+AiJEUfYfeYuJ/Yl+Ni?=
 =?us-ascii?Q?8Tce7dEBBhZf4XUmSFxZR1ZueVAbxiXlumoXrGETwAEdA/Q7xnIpTkgtGu1H?=
 =?us-ascii?Q?eKTIhHOr7WRGpgyzPg2XcW+O0RcHWAQxwQjWCajXn840M+KSdkOYnvQMVFbu?=
 =?us-ascii?Q?FjCU8gm1/u7z3k7J+1NyN0HCWgo1PnmNR9yjl+AFQCTnE+TDXA06PKvwW6uT?=
 =?us-ascii?Q?b9+6FmTvGv2XCPJcDEqnVL8cd2ef+b2QND6H8Qr6qnbFWd5GVuFnlukKDZAi?=
 =?us-ascii?Q?7EYXKZETfjEPtnXz0irYcd2HQUZW5gpS1kPQfxA8rg+sdhl4qF3DIcCalzQz?=
 =?us-ascii?Q?7k0FaBPtIsTpppvk2LHKQ5g/ogEGv41ZcnHoYQMS3vmCa/Tt114tYxxlak9j?=
 =?us-ascii?Q?GRZ1ZvjcPKxkYTQ1eX9pZSR0q2/HyigJZPW4XJw4X3L2GW0QjPsikmtACUID?=
 =?us-ascii?Q?xYQbFxGhjOtx8/JXVYpJz2j14cgya2KwDxillUvfnjqrVe3O0SHJpHzPQcCI?=
 =?us-ascii?Q?6gntziE93WsDhU9Prppx98rYjZV5PhphcN1dNm96g/dUiUPIdlHa8a1XvDFb?=
 =?us-ascii?Q?UOoIPezgBPuP8i07q4TrLIVx7bZkfQHt3aLou29KGcaAxJopalVPweZKOD+t?=
 =?us-ascii?Q?FfB6c4gl6yWDPPnclP5tFVQYM4/ph146vgWwxiA61H9QW8UjfVydjH03H0yF?=
 =?us-ascii?Q?MOJji9wDFvrd+cxpluRwnMCC5XjXfR+kGoiMuuue+SV0wmBIkZBbhrPbDx5H?=
 =?us-ascii?Q?tfaiX7gbXD+X5KAw3soB46Itg7lxYhVsnMCeio+hXwrwcn2ZZjmImQBU+9Bx?=
 =?us-ascii?Q?a50fHs2t+/+5R2yNEJ49uSvydbwJ/jYfBTgpk7Ssib519u1zQJrcJobaK1G7?=
 =?us-ascii?Q?aox72QfUPtcK2L9uUPVgNQz1yJ9SdpXCEkwcPbnr4FSpXS4g9LfBuQZtISkd?=
 =?us-ascii?Q?mqEOz+COja4Jmw2L6Iu2GILTr8/WcJ4my7wB28Uj/F17d0MbcBzDCpCrxzV+?=
 =?us-ascii?Q?NSyhTa35jqoGByI0QY2f0hY/hLahkE1IEUNwNHAyW4QPNdwrHaDciB6N3yNj?=
 =?us-ascii?Q?dQ4jBS9HevYbWJY5WBLh+UzwAzFKwMvNO9FMKUyPJOZHfh2HNxp5TtxIvMnU?=
 =?us-ascii?Q?OSuDEW0iBfoJbXZjSP9nedFmPDp2GLLVDVE4uuxvM7alT55w228zVIsU+zlt?=
 =?us-ascii?Q?mFIOzhVz8+zogrWESxrme/wArk8WvRjfqVAd8rCj3E/OKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?addSkq8eL/jaUwMpaBHdV3zTKzWAfe4StyALijkgwZ6hVyxbvJTzfMwJ2FWM?=
 =?us-ascii?Q?NI1mCw73sulgL6ql/LhJILRnuU6CEcoVxUAGLKQDGlQWxSKDEHjG0U9faJF0?=
 =?us-ascii?Q?arERdh8Qn7Bd3D5Fdu21bJTSEMsOs3WVQNpmfIYR1HUG+YHVONDz8Zjfr59s?=
 =?us-ascii?Q?ftnPiJMLJ7IBHGbXW/neD3gELl83P5fbeGAG0U+IMs/tlT5MsTAILYPn/VM6?=
 =?us-ascii?Q?zdynsgHh74yKDZy7R8YjyGoBX1FZQVKDJEcJhBsQ9a7WPnXEQL4TmSADWdZD?=
 =?us-ascii?Q?XPngh2YMR0HEBgbbnzBCNiXEfe5WFYsyOCmwNvS9HdFztZ8eT7RpBixdRe7e?=
 =?us-ascii?Q?IFrdUcN1FWZX4i73S3HX2Lb7TGe/ISKPzZ+5PBNAujwUpS0SEHlj5jqoTjiq?=
 =?us-ascii?Q?7pdS04v0XqBtOqJsTxtRCF5vabz5ydDcO/wFs8gAWfynpF0aZr3+9fuf1Svw?=
 =?us-ascii?Q?9BZMgRxqu2LsZX3hOE5Edhj/hPuKuu52CG9BF/+2wHqrpok5Rxu7OMjVMwIG?=
 =?us-ascii?Q?eGLAy81l88eBAbyRPc2GzLdgcG1hsCO6R5kkpv3KEIL128fejv7L0/oYye4A?=
 =?us-ascii?Q?D6GwkpQ2yZ/Ss74f8ta60wpcPNYlwysJFsWb/3gSI7yxAvwnHHXtJz7pL++e?=
 =?us-ascii?Q?9wHUNUzXacnSXLvpBVRAlFB2RpT7qGc5MVrEV/66e2wEo3kAoXrEP1gCQ2VV?=
 =?us-ascii?Q?VuawZSYi5HZnzw3Y50zJ1sibYoVvb1zVeXG31nf/r0ACulczP8jsPr3ymOSw?=
 =?us-ascii?Q?XXFt8H2TMIvB0/IAOptrjJrUm7uwVgWFn+XnMtfOPfbbd1yKT3ia+XXYAK+y?=
 =?us-ascii?Q?95kdEpS/BT+/1F2xOK+YhZho0FxkSxWBQxMpODOSYQeUu3Z9rgi6vEecWF+n?=
 =?us-ascii?Q?J1iZuMmrGAf0r9Jnw3YZKAZPxVTU+3YF63O4J6Q1EyhsAzISQy22RkRZ/AxV?=
 =?us-ascii?Q?VqteZTuzz5KWONAhOolJzPAU0+rwu/3anXTuo6kmMGmGhebz8DPC+BRvlWhW?=
 =?us-ascii?Q?A5APqz6r2HClYDPKul2mSNCGXzN3YMCN9qlZo1Z+bfq4Rq3J6tFAMJh0wvZo?=
 =?us-ascii?Q?ObhkhEUe5Fb7ZwWhsuufATnnuKx2hJXfw1dNmUgAMeQNr11z+LL/IvLjYHMq?=
 =?us-ascii?Q?zufFERutr5ZvyIkUSRVJTRnV1DqaZBtfeWYAg0KJsd1U+pspi8W2Xfwawpzx?=
 =?us-ascii?Q?EMe76IzXCIs3cbb1s6+1Hbfe4uuunUNmN61McOi5kyKMnJpIGWwhnIJJIkpd?=
 =?us-ascii?Q?7xR7+C/dZabPPepGSmyq1R6jx+B1cLnVs5PTOzTVZbwU/9V6wcL8IN5GuxTw?=
 =?us-ascii?Q?JCa3Zmc8PS5w4199kKZPkFSJ+y3Gqyov1EZKlA417OY5mTx0cqb04r+iP+Vg?=
 =?us-ascii?Q?vNcUWzUUWToIqzscQt6bsrEHeQL6L8gSpOIn0Qx3kWN8BnmQNBpCAZ4nkfKn?=
 =?us-ascii?Q?1uQWi94piyqGTIretOrH5UcNyElUd9LzBVx96NNSYkXKP7Sfpc/PpHYMusJv?=
 =?us-ascii?Q?wqfmsGaLDEUN+xKbKzlZ3IqiV/GbfaNhY5kpouqBG7ACv4SW56Z/vwd89Q1o?=
 =?us-ascii?Q?P2X7KF7DFb2meN0x1HpF+Rq9Qsj5bIZ4ojz8gZG8CtUfKxMk4eOQWZlq5d5m?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 859a52e3-ddcc-4df2-8460-08dca1ac361e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 13:20:19.5531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XI9ALMY4+8OX2WbRTVQnRCNcNhgMbcOEHDiySASaOSbvynYPgh33tuGvNp7TJEPzpPF4DpOglJSNZJugU07SRAJU47HGf1leiTSAvlOfQbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
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

On Tue, Jul 02, 2024 at 05:25:27PM GMT, Umesh Nerlige Ramappa wrote:
>Add simple tests that submit work to one engine and measure utilization
>per class.
>
>v2:
>- Drop measured_usleep since return value is not used
>- s/parallel engines/parallel submission/ in comment
>- Use NSEC_PER_SEC for batch_duration_ns
>- Percent should not be > 100

but as we chatted later in the review, it's actually possible to have it
greater than 100, so I think we need to leave some room

>- Check utilization for both clients for isolation case
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 97 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 97 insertions(+)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 037f25e53..410c885e7 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -28,6 +28,15 @@
>  * SUBTEST: basic-engine-utilization
>  * Description: Check if basic fdinfo content is present for engine utilization
>  *
>+ * SUBTEST: drm-idle
>+ * Description: Check that engines show no load when idle
>+ *
>+ * SUBTEST: drm-busy-idle
>+ * Description: Check that engines show load when idle after busy
>+ *
>+ * SUBTEST: drm-busy-idle-isolation
>+ * Description: Check that engine load does not spill over to other drm clients
>+ *
>  * SUBTEST: drm-total-resident
>  * Description: Create and compare total and resident memory consumption by client
>  *
>@@ -42,11 +51,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>
> #define BO_SIZE (65536)
>
>+/* flag masks */
>+#define TEST_BUSY		(1 << 0)
>+#define TEST_TRAILING_IDLE	(1 << 1)
>+#define TEST_ISOLATION		(1 << 2)
>+
> struct pceu_cycles {
> 	uint64_t cycles;
> 	uint64_t total_cycles;
> };
>
>+const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
>+
> static const char *engine_map[] = {
> 	"rcs",
> 	"bcs",
>@@ -464,8 +480,77 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
> 	free(ctx);
> }
>
>+static void
>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>+	      int class, int width, unsigned int flags)
>+{
>+	double percent;
>+
>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>+
>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>+
>+	/* for parallel submission scale the busyness with width */
>+	percent = percent / width;
>+
>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>+
>+	if (flags & TEST_BUSY)
>+		igt_assert(percent >= 95 && percent <= 100);

<= 105 like you had before seems good, otherwise we may have too much
noise in CI.  What are the typical numbers you're seeing?

>+	else
>+		igt_assert(!percent);
>+}
>+
>+static void
>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>+       unsigned int flags)
>+{
>+	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>+	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];

nit: either name it pceu_start/pceu_end:

pceu_start[0] is the pceu for client0 on start
pceu_start[1] is the pceu for client1 on start
pceu_end[0] is the pceu for client0 on end
pceu_end[1] is the pceu for client1 on end

or pceu_client0/pceu_client1 if grouping by client

pceu_client0[0] is the pceu for client0 on start
pceu_client0[1] is the pceu for client0 on end
pceu_client1[1] is the pceu for client1 on start
pceu_client1[2] is the pceu for client1 on end

... this makes it less prone to typos.

But see below as I think 2 samples are not sufficient.

>+	struct spin_ctx *ctx = NULL;
>+	uint32_t vm;
>+	int new_fd;
>+
>+	if (flags & TEST_ISOLATION)
>+		new_fd = drm_reopen_driver(fd);
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	if (flags & TEST_BUSY) {
>+		ctx = spin_ctx_init(fd, hwe, vm, width, count);
>+		spin_sync_start(fd, ctx);
>+	}
>+
>+	read_engine_cycles(fd, pceu1[0]);
>+	if (flags & TEST_ISOLATION)
>+		read_engine_cycles(new_fd, pceu1[1]);
>+
>+	usleep(batch_duration_ns / 1000);

NSEC_PER_USEC

>+	if (flags & TEST_TRAILING_IDLE)
>+		spin_sync_end(fd, ctx);
>+
>+	read_engine_cycles(fd, pceu2[0]);

... and here we have another source of noise.... when doing
TEST_TRAILING_IDLE, should we read the first sample after the spin
ended, sleep, and read the second sample?

but then how are we testing all at the same time here? I can't see any
igt_assert() for the trailing idle test and it will actually impact the
busy test since it will wait the spin to end.... Am I missing anything
here? I think we need to add a third sample when testing trailing idle
and ensure:

considering the indexing as sample[client][idx]

	sample[0][1] - sample[0][0] == 100% if BUSY else 0%
	sample[0][2] - sample[0][1] == 0%  -> idle on trailing test

and for isolation:

	sample[1][1] - sample[0][0] == 0%
	sample[1][2] - sample[1][1] == 0%

>+	if (flags & TEST_ISOLATION)
>+		read_engine_cycles(new_fd, pceu2[1]);
>+
>+	check_results(pceu1[0], pceu2[0], hwe->engine_class, width, flags);
>+
>+	if (flags & TEST_ISOLATION) {
>+		check_results(pceu1[1], pceu2[1], hwe->engine_class, width, 0);
>+		close(new_fd);
>+	}
>+
>+	spin_sync_end(fd, ctx);
>+	spin_ctx_destroy(fd, ctx);

if !BUSY you are not even calling spin_ctx_init()

Lucas De Marchi

>+	xe_vm_destroy(fd, vm);
>+}
>+
> igt_main
> {
>+	struct drm_xe_engine_class_instance *hwe;
> 	int xe;
>
> 	igt_fixture {
>@@ -484,6 +569,18 @@ igt_main
> 	igt_subtest("basic-engine-utilization")
> 		basic_engine_utilization(xe);
>
>+	igt_subtest("drm-idle")
>+		xe_for_each_engine(xe, hwe)
>+			single(xe, hwe, 1, 1, 0);
>+
>+	igt_subtest("drm-busy-idle")
>+		xe_for_each_engine(xe, hwe)
>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>+
>+	igt_subtest("drm-busy-idle-isolation")
>+		xe_for_each_engine(xe, hwe)
>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>+
> 	igt_describe("Create and compare total and resident memory consumption by client");
> 	igt_subtest("drm-total-resident")
> 		test_total_resident(xe);
>-- 
>2.38.1
>
