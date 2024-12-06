Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0566CE77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 23:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5610F1D8;
	Fri,  6 Dec 2024 23:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxwMj4Hx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE4610F1D8
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 23:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733528805; x=1765064805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YCsN7c8xlV4dbkn4yk0egbJXxET3MI1LyRnvJccFs20=;
 b=KxwMj4HxImt5ZD2AAebOUfFVCa2rk9iW4EsV5WWNxB6jmaB7aWlJJ+7e
 tT150Njv0e27LCunidhsRzRDsw6y2xE/vqqOgWgij4k3bj66ijQdcG4v7
 4PGf6+dgdAFPyOL3CZ2f7M3nTwoTl7HF0cv0FdXKfY17/MrVdJBwmbypP
 hpux6RSmsdOuJiEad3zlF6JM1f2BlwRX4YlhiezKVMpttBwV8iogFM28k
 sBTA04u2DBMAGTEkxxMErP5B+cZvavIdIxV+BLnXSbhfFLuEIshQB9KPc
 7sS36tutY+FAN5hvwxi2HbLvIKLwDEuWqev41DRSIn2jB2mnWNIw6P1Id g==;
X-CSE-ConnectionGUID: Hj1E5IhASrutDTSa0dxVQg==
X-CSE-MsgGUID: +aoAhjxdReKazqncCdMD6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33950677"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33950677"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 15:46:45 -0800
X-CSE-ConnectionGUID: sQLYP+o2QhKbQG/TkNoUhA==
X-CSE-MsgGUID: aedpdFUsTwuQhyMyjBZATg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="131942620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 15:46:45 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 15:46:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 15:46:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 15:46:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcnQf8OLzhjv7ptUYi6RHd89SFJrpv50kzsCJxMoR06CHKJomYOpVa1rQ+K7gaERd2lU+7yIeAW7dW8iQf+martBamxKitxTDS7NiUV7thivprZAkxZCCdM7ivTjZdfHixQgKLStBxJQeQXc0ashANqt/MKb5f7BV7rckzkANIHeJIoZwi/QAouzy+2ezBoFSD3bkOj9t9dadZpkWYXLH0a5bKjcGKuARaBYEtR75ODTtYWfcpDPJX4/dMoP/QTad8nA09/AijNwTJ9gHi/ijs+nVb/RGeQhbVZBJ3Q1N7OxtG9rlQA6kps+cjkuzG2mEcOgvd+RFZbLHKq+EBKzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHrJe3kyKfFCSc/n25kOKTH7osspezu4aQZ9/ym1Zx8=;
 b=G9RAXOQGmnA3JlswVHmU/Jk8ypG6WZFGNkqhNFacdefLrh5Wq3e/S1m62QYcRYPZeQW5qnCM6RcSlH8ji/Cle8YeGkDT/iAdtuTTnZKV006MQMM+WVBQz9wMfCMZ2zYMJgb9YtO6YOWWdw2cmAJGCl/dbZC+59M5/ROXeoLm+asuAoGRj0Rb7jNqKBCz+4as/NqFdamprxa2W3dgorouUFlRBRdG+vBhuG6q03R/WcyBvixBkS3d4/lsvt2oiLvEW8qjZi55iqjodfvUCi2gRHUBXY3jUyWWjHsQRx4tl5luQUyyztuxoJDZnSB39PSGcDOqTdbc2k+V6Fm81090Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Fri, 6 Dec
 2024 23:46:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 23:46:39 +0000
Date: Fri, 6 Dec 2024 15:46:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 4/8] XE3: tests/kms_addfb_basic: fix x-tiled
 tests for case when there is no x-tile
Message-ID: <20241206234636.GL3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
 <20241206212748.2101217-5-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-5-clinton.a.taylor@intel.com>
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: a9baf174-9b7d-4ebe-41c8-08dd16503a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZXzHctzbu9vAA+qY7L0qy4V3b4yD4ctp60iaLC71mfBwmegbcX0BmYm30upq?=
 =?us-ascii?Q?hQnHVWDmjPkqyVsVRyQBhXDOvir/QcFhV2m351HPpG6XU9o8eQKKXCUUNMy1?=
 =?us-ascii?Q?EXD5eCYL6mIRK8kA9jmyH2uDC3wYd5gbCkdxUdZ+UjuqgINoJnhBNagp9zrm?=
 =?us-ascii?Q?WpgBpVIDT3Vj23Nhu5gDpGK3pEmDjz6rbblLsQnfhQ6ixbvoEkXuv4Dfovqo?=
 =?us-ascii?Q?4nr0QuFfurSu0zKsiwyw+5lAKLKWSNIz5leznzNDbxPFliW6xQuqIrprCyZD?=
 =?us-ascii?Q?0P9eE7S49ta6Xr5o9bWZajgIsIPI2ZPYrOrRCu3x2kTz0gTLZSlV2SlyQZWa?=
 =?us-ascii?Q?TzPU2fg/ifVP/pd1uMPEeM8jD8QXULNw6ub30YXgQP+1xUb7Eeppk22mj6kh?=
 =?us-ascii?Q?fsQ3qEBhBplOfvSQYgGLolwpXPErR7O5caMfb7vWkOCIov855BD1YePpQ/4B?=
 =?us-ascii?Q?5hhjedxySfXQAZ+vpbbv+USK+xIUZnd21LTOSK7hGzmtABvPIDrbnYCpQWcx?=
 =?us-ascii?Q?mW6I6uQumhjScbfGfIrWu77MgXbexm3k4pkdfaggyqBSVEKyIkAINiKjNyzS?=
 =?us-ascii?Q?ckUOxZMo8UH9DsPvEER82G2Nrff2rO1b/DIzt79U2V4GEx/AEOZkcNG+TpXh?=
 =?us-ascii?Q?P+IAthdhr8UngZZM5LnQv0sUHAYXUqH6a2BMBqkJXm+oQrHKEwbhNFpGd7FU?=
 =?us-ascii?Q?uq99RKjOn3qeW/DowvZfxFg4+NaviRp+Y94CoZf6zguNaBSkZLcEWoEqonw6?=
 =?us-ascii?Q?Kth9/yXr1715bSYSL9zViGBptX9l27SwtkONmhMZ2Wv0ZOJKFBRa2KxJlVf2?=
 =?us-ascii?Q?Adt0yZhNFVQlafmFZwTUMlC5BASniEHCsv0m5l93JkjLRRpA9HV3vhWQNLls?=
 =?us-ascii?Q?W184oPoAxFb5BJ4juXFxgFhpkf3/kBdjgk8M72GV1RhYO+KdxhzNXiOemCUw?=
 =?us-ascii?Q?+rFrVnC4Z9rUxR+2GlLQMTBn0BcOd9g3Yy6qa/EY6wP+Lt3gD+WlT2xOM57q?=
 =?us-ascii?Q?f0CBajS3d09tJ04mO0smYUY35dSfL4Ks+sM9kH12bXSET8hNhCjoHL4GeJ2v?=
 =?us-ascii?Q?cD00vwmy2txrA3hvBxlpePSFp51Yri4DIFOaeqRDGtN2dKzwtXXgEW3cqyNC?=
 =?us-ascii?Q?cv0olQ4z7I5p/7AUCO5pK0B4U27tmQqGH3qIGSTG4UmRKpSXaMh2nt3C0IcE?=
 =?us-ascii?Q?TE0aIp1Bl+aLQ410Qx7cw+wFyqr+SCJlXnBP4zzxgpgaQh+nf96ZL+Wg801T?=
 =?us-ascii?Q?0gzEzToKn4wh6M4W3msygAkCAKpTo2vae8a1VFOLfH/zhrUwbz4jguQlfzhx?=
 =?us-ascii?Q?zGBYIJl8/fcpROUvNrYZ8szXGhEUsCYu7EHWVH6L2ZJBaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tN6jW5vaCYR7zuUO9f6x22WOsEn0Cq8aVSlfE9ZP5ZW0Z8YhZJYLFBKEP0Gu?=
 =?us-ascii?Q?qpzTpZ8hwtj9oq7glgxZu51avQHlbjxEM+T1RK6iHh2rATUElO1PRBBkLyp2?=
 =?us-ascii?Q?GP+VHhWdtIvbYDxQg1orujdNzSRkDMg6HbVLG+ePQV+MZwHKEVovYo3Ej6gb?=
 =?us-ascii?Q?0ruzcztl6xsJhlYOaNcrltO+SEaJuGT9OyNMgn2pzyzz7whmHcW/4kex5/ZE?=
 =?us-ascii?Q?ZbQ20OMDdxV7XFW6rSgcDL4X+YBjlop3aJTC62vBm8Arkhk0ZQTLnZZqpNOK?=
 =?us-ascii?Q?dDfG4AFjQslpHPeWP/hA6r8Y9KbLW1IkdPhLN3lcNlKC8E2C5vizGwF4pVh6?=
 =?us-ascii?Q?BLjw1qROd9ag3KumXZKbj4uZJvRSkuCNmYG0XwGOqz3NAEnjKNE2oCmigawK?=
 =?us-ascii?Q?5c7YTcd+WtU4kyRX+TqTCRFkF+xZcNa072fP/hh98b6qnT6/Saay+6YF5VDB?=
 =?us-ascii?Q?K6Mwb0NrMBl/yjIMw+svte6G4m5D47m9XIT0iUWq7c13b2t84rLKAzLMXzwi?=
 =?us-ascii?Q?GTQalJFpapGncJkqDiKKrqcLs8GqfboAB/e6hHv0suy1uO2s6Jut1lvBa5QA?=
 =?us-ascii?Q?adf9LVZ4IZQygC80SLQ2jIiOjQ3ombggKKGCjo0vwPSeUhpR4dTKP+qzxYbC?=
 =?us-ascii?Q?lqknAPnOa7v0E0RofJ3PaWJIfM6G74GuNod/A3qw0yEvh8a3Cq7A7mpY/RIo?=
 =?us-ascii?Q?dvjZZ9k2DrXaVPXUZ/2pA9nNo4dpBiB0b5WQJ+Pn94zJnhIwCnlNJiXE+PpD?=
 =?us-ascii?Q?ATpxmCYpHOYmvT2Y7xAy5bdOPnK4JspcCCYKootcQSftHgwOdrEbRtjM355s?=
 =?us-ascii?Q?CJDEcCd7J7Ik2mHNcYK450o/ND18D8x+2akEHkbEOm0oNyxtfeIf40qmAwXV?=
 =?us-ascii?Q?98YnH7vQyNp0J/fvyeNFinKlTGX9SQqiCDEn69vDCbS09ifZDnXLGSF2puJY?=
 =?us-ascii?Q?5Xsrsj4PAkig4SNVzipxgTFQhqQfod/3uE3K+e9aaXBDwXPI576AkCaWF0q8?=
 =?us-ascii?Q?aKKUCAxla8L5xU37gC3R4gPYqDC9NdQCrcEmGrvpDlt1eWNo/MQAXlIQ//Q2?=
 =?us-ascii?Q?bGTODd97vpfNNFPGXrhVt3RIGoOeJ2d20kfLqpJ7SZQJ0bBU+1kt8tAmLN9V?=
 =?us-ascii?Q?om3PwPv6mVBW7tslS8N//Yxvy5EZ46P2t5sk8p9H4QF0W5m7PQrgoDKQCJwJ?=
 =?us-ascii?Q?FrciNTgVad0PtW34QWtKxm99kAbhtIoT6nHDzzrRFOBOnC/4Rbwy1d7CoaOo?=
 =?us-ascii?Q?YQ76q0aopA021ntJBxHO9ShCy6/mDggWiK5az8iAp4sEzKwIPGWhg/605I0x?=
 =?us-ascii?Q?UglY7M0+bsUEx9EtufXf8Psu2ZZad4FQDcS0PugGKUXBLSxrai+7nwoOlAPc?=
 =?us-ascii?Q?q8oUVQ+TgaOv6gfxDONYZtoo0dY1fFHF1gs/vfJyG+YbYt2j9PiLdKcINexS?=
 =?us-ascii?Q?QQoo6SWAgwJxMe/9Nq01YVsA8+v0MNVZ0lnxOalMv7hNsjkxUYZKc4bnaeyx?=
 =?us-ascii?Q?hvyxSQ6BnVx1+F2AbW6/8TIFZzsnSN9vFSs5sjQ1YTD9dJjZVN6R36ZBUNDL?=
 =?us-ascii?Q?jPMhiGuN53Rxy1am0PHJ0OO/SQ0yrEnENhNjhg/8DV2GG8+IoihEEfNziQOF?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9baf174-9b7d-4ebe-41c8-08dd16503a75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 23:46:39.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRVP4xwhY2/zqhKSx833pF/g8l1n/Mgsu91rlrhBIJ74l/tRMaDiL4ZTy+EDK/vQdZAsOwqpFZf60HufqIVNAJ9gRScIk2rsaTewCEycC1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

On Fri, Dec 06, 2024 at 01:27:44PM -0800, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> 
> On Xe3 display no more support x-tile and will disable such framebuffers
> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>

I think you were going to fixup the name ordering here since JP gave an
okay for that on the last series, right?  "Last, First" causes problems
for git-send-email and such.


> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> ---
>  tests/kms_addfb_basic.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index b22818592..3ba87117b 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -217,6 +217,12 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
>  	return err;
>  }
>  
> +static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
> +{
> +	return igt_display_has_format_mod(disp, f->pixel_format,
> +					  f->modifier[0]) ? 0 : -1;
> +}
> +
>  static void invalid_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -735,8 +741,10 @@ static void addfb25_tests(int fd)
>  		igt_describe("Check if addfb2 call works for x-tiling");
>  		igt_subtest("addfb25-x-tiled-legacy") {
>  			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
> -			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> -			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
> +			igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> +				      addfb_expected_ret(&display, &f));
> +			if (!addfb_expected_ret(&display, &f))
> +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  			f.fb_id = 0;
>  		}
>  
> @@ -756,12 +764,6 @@ static void addfb25_tests(int fd)
>  		gem_close(fd, gem_bo);
>  }
>  
> -static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
> -{
> -	return igt_display_has_format_mod(disp, f->pixel_format,
> -					  f->modifier[0]) ? 0 : -1;
> -}
> -
>  static void addfb25_ytile(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -1012,8 +1014,6 @@ igt_main
>  
>  	master_tests(fd);
>  
> -	addfb25_tests(fd);
> -
>  	tiling_tests(fd);
>  
>  	igt_subtest_group {
> @@ -1025,6 +1025,8 @@ igt_main
>  		igt_fixture
>  			igt_require_intel(fd);
>  
> +		addfb25_tests(fd);
> +

Doesn't moving this here prevent this whole batch of tests from running
on non-Intel devices?  Some of the tests here shouldn't be
Intel-specific as far as I know.  Should we rather just be adding
igt_require_intel(fd) to the specific subtest you're modifying?


Matt

>  		addfb25_ytile(fd);
>  
>  		addfb25_4tile(fd);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
