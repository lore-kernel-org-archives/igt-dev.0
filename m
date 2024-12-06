Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD18E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 23:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1BB10F1D8;
	Fri,  6 Dec 2024 23:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aarGBUCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9379D10F1D8
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 23:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733527821; x=1765063821;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+nkDsH8ehBkbDa2KufhmoZ71WjjYuxMeS8DMlbGHJM8=;
 b=aarGBUCxZ+cB2Ql8ZByfMEHaA7+3WA4CjsexKTditdo3wx2DM9McdVF7
 IfCnVCw/6y1XDwcBuPZDjgskeAU5QrWxZo/AA/DTELWbB2VY9Gg3QWxu5
 qzxLIIva4ygobjirmrKhe0ui4O+xrODOEXTCNI1ZezBGT0g+WWATLoofd
 8uZ5vDH5Sv9NdvaSq2H6Go+a7CzQUZ1F4ymQ9X3+yhj4OGyY6Q+ymptqc
 UWQcaqIYHAxD8mn8vZkar9mtKXEClz9XhwmqW1e0BmBf6kDqQE0PS2ylv
 xoCVj3FUCBKdg3CwU3eJFiFko2v5hnI7wUkmH/62aXC6ZDh7x+Zqy96LH w==;
X-CSE-ConnectionGUID: zggjoD9vSIO5jp0HwDFp/A==
X-CSE-MsgGUID: MmGyOoP+RM68ZHnUkXQ0JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33777010"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33777010"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 15:30:21 -0800
X-CSE-ConnectionGUID: 1hJggDZPR5eJu0ZtWB+TgQ==
X-CSE-MsgGUID: h5njaJl4TEyXz6P4SCtjsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="117788696"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 15:30:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 15:30:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 15:30:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 15:30:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mm93bjmAaOxsvnA/sw+vhM5LZ9qi12hlEZve8mYXFQodbqkqNu19NkxH1i6DPxy5B/NXybEt0pPmHAnx5woOwgLhq81BcznDg8aW44+Uosr9yF//sRDVVk71Ih8WHtvf6LJ/J3zDsDjsNCrtmAmCe9ByzsGo+xIgwSbTz7ZwAs564WtfhSfYOTl4jeXuoFvzbZrvqlT4dIkQeV4L2vONjArTSvKxAeSr+X3e2CSlAI+N8z4HGB+Cv1xn2ybn0fAFL1njedH/+M66akjtM6EdZWHmt6Q9rGX3GLVqS0M+wXdqcAnhImLSuMQarlbrB67hBWsXPFU8aPRnXnT7ZcAbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNugLEkIJWXZpZr2LsqR35zuDwlMCWmIH1BPQztA+7Y=;
 b=a/Sp/3QdPUrKcQZ7krk2qujuuxLuPvU1z6W4UiKnKNf556ZTak1z+jbL358ppjswr76m9Hcqb1zf5PRQRruafwBy9h6TfbahVcevh8PIVOig7HaxFocrP8QfWtdy/AvONCQMvmmvw7Ulb6uYFG155Jg1ZhJIwAwOKiCJM9LqmKNGye95ihLjk+rXjQY0PoaixY4dkyqwcA+yWgDK6/vWO6nyKvQgtVk48T9nOEXnc/yymTBDLqaz5MffEPy74EknRQuf+trI9zDLeY82cMb/mrd+QPTUsxlXuCQB7xmMbsWCVpXpGm2O30HnGfc7ytOd8iuqTVpVP4PNKIErS+b6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 23:30:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 23:30:17 +0000
Date: Fri, 6 Dec 2024 15:30:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 1/8] PTL: lib/intel_chipset: add pantherlake
 definition and support
Message-ID: <20241206233015.GK3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
 <20241206212748.2101217-2-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-2-clinton.a.taylor@intel.com>
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: f648d085-c605-436d-5f45-08dd164df173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1FlZrJppVIaGJsRpQ1s2cxjb1vto8yr6WRzalN98TjBsTmJxKJP3Pmw0BMfy?=
 =?us-ascii?Q?1YCod5u28Wu4UGrCRkGCpDZQFt43hGW1nl+BO2zZkX3ZB7HLtV2SZJNr30+N?=
 =?us-ascii?Q?7tx7XC2tCjI65fBOOH4tacXPklGjXT1H2Nuzd5b351+JFgiYurLEumWGtopA?=
 =?us-ascii?Q?yIPadIAbXimJLnFH6pf2su8T5vz+rVdFIdD/J/RzOWKU9LAtb2DcQ7JOiMMO?=
 =?us-ascii?Q?iLK74D0CrYJ0/WofXoGjxmVSZDQ9LsHXi+TVYLnaNQfohxMAyjzK2j8S0JFq?=
 =?us-ascii?Q?YL6l0Kmb5CBfYHExld/w96RNFtyEG8vYfs+WHPbyRmm+lLY+if+qvxwIWjP6?=
 =?us-ascii?Q?+CZjWJy1i/CvjhTmaa85WFmxaDJ0bNfT2oMG6QLpqnw2r1/DBG/NB8irfEC1?=
 =?us-ascii?Q?oQ248ypcufmdPqVoeBnnVFtD1oQxDCdqLKtKDQKxw6Y25+2e8URfWNOzN48v?=
 =?us-ascii?Q?5ZJsiBf8/GzmD5hsgzTp8Icy3PP6bzCDzPrPh4o88SQDQ3uBgM6OkxeiAexz?=
 =?us-ascii?Q?cLV1KjaxzUW0I0Q//3CNDTqZgDVmseh9e3aJ9nsRR2NvPbDNEYcn+PHdPzz0?=
 =?us-ascii?Q?QnmXnAEzMbv89Q+JDsiu7ImceYQDTxC7Lbe94YUW6hjommSISe7HoZOJSenc?=
 =?us-ascii?Q?aKWLFEGyS4uAyBChz3shd00CzZfTa52MXd794fmnEtmRHpB4nPsmj+nLJha+?=
 =?us-ascii?Q?FYgKh+XhRUzpDhoQNWmeNNqSxpreWx5al26cYvBH48GGoKV5IrBGPhaW7pmG?=
 =?us-ascii?Q?WPAvhNEBphjoL3pZJIzzu6xmL/EwgNR4IJZefY3UhdD/OT/T34n1JVCkKobO?=
 =?us-ascii?Q?gzLMGExraJs9Op5JCuLrECDsAxFsODrV95CmPqmuXUHKkiWNpbiSQEsOKf/G?=
 =?us-ascii?Q?CgGsueoUYRpVjs9mwYtFvjTHEJq0xp6o2tjsx9y5Z1qaSzROnBG6To1pje8C?=
 =?us-ascii?Q?ZAizZmHMLoUs0w8/G88Ei8iYMu4Kem0FSXRswKsj0IOQusy+LAxeOwpxzkeP?=
 =?us-ascii?Q?tDpZCgiRWbvJNThgF/cneiLt/C7JXTN9eGtUaStt2efvVcQYcPqPbCjb80Z6?=
 =?us-ascii?Q?jm4HOZmesR/ZNOJIA+EK3XhYUkADliqDurhgYo4W4X53iluv6aKnnR4YszV+?=
 =?us-ascii?Q?OTPUlom0QvBB2JHWjmEvUoV4YefPW5xQO6k5WfgPzl7cMsmwqTvjGs5E61q0?=
 =?us-ascii?Q?dSGWGRAlkf65TaFRmqrUFbRYIb4aTc1Bzb0MdBzCMY0VS9M5XECbbD22WqpM?=
 =?us-ascii?Q?1xPKyb4g+gFdqIPWk7nucOkzodaDZ3xZf6qraJ5nE9+jIuqk3liNnvxVB+hu?=
 =?us-ascii?Q?1F7UbaaI93VzVEMActI407hxfapHRZNxOD9wWHqFkmy6AQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kp0KUMIk9prEya3iUlKgdDqq4uvFzRVFrToJiXimRDD2oF0QlHzHtUQepoR7?=
 =?us-ascii?Q?DGFJs4voo669HSKdW9Nh9dYaJrdcBOLQvsgJffXuP06FwpeaSNgx3Fa/xmgU?=
 =?us-ascii?Q?3swdvbZzzV7fCY7xvxUEwamzuRL9VGoq06R9dl8g4S7fHInygerSuJlPNZ05?=
 =?us-ascii?Q?VN6A48qj6g9+hwgvPaNYFcrvnY/ZcWo2xVnQ6IXOvOTscrSs8lt03xbWLXEE?=
 =?us-ascii?Q?U8Pk0gaj8xFuoJUHw150JrnfkxnKGrvlJV/nC1JKteyq8xHcSWtGhnXGkH9K?=
 =?us-ascii?Q?vpFvQpbBEOmZndV5lBfT8tTww9uw4ZWMefRPIG5ciPBHN2HxOhttNoMDz1tl?=
 =?us-ascii?Q?Bt7Cto3L/sMRF+WWlQWiPBunk3bG/ZNKAIxv2IgIB6/HUMALdMt+tDHpTqMb?=
 =?us-ascii?Q?+XcKthYKB3ABKsUvy9T+aslejlvp98Al0PyyyV39eqG/L07BGXldJIWUfLkr?=
 =?us-ascii?Q?OSRfXZI/TmIACGf34jiYPaB9/8jkmbsGdAg1WqzXlu1BeMQynyUWGd50biw3?=
 =?us-ascii?Q?s/yM/6I/CYab1A+o7kzVqdEOsw4/I6dy1d5UBWMFbi5alwruk0f9MpCLPQIA?=
 =?us-ascii?Q?6kzxiQt9YUFK87HJtFLZT8yVbWOsJx/43UdWXd+qo8muSLLcypueBkj71dJF?=
 =?us-ascii?Q?lk2xqMnierLiX8dZ8OHat7eqMT5BcJEh4k7RV7gMfXKJ4OYv7gEwq1Muo5S9?=
 =?us-ascii?Q?cHpEwC3P9FIQw2t9BWeOfJRW5QiqEwj2b2CijVcMdI/vE0lNFuTvuH947ohx?=
 =?us-ascii?Q?iCdwCKMWw6XRseGzQnam9U5OEnYrkmXi+vt8JqSJ5TC9JjvS4f2pXpwLq36N?=
 =?us-ascii?Q?FrO/bc1f+kNegkPLHk7lOgqfRmzk5RuGQM09RLwEOV/Rg5fANqtgDVSFNZZW?=
 =?us-ascii?Q?L36ZUVnXW7mNRnuhDfvSraSkPJhFfneS64YpUxrzc3lsvAO5tGvR8UOygqKQ?=
 =?us-ascii?Q?eQsOPm3U0OwLxn7ZfbbNoYQZZPOSv7lpZYYYd/at9oAx2CsRCk1fD0K9x4Pr?=
 =?us-ascii?Q?Oxp6D0NISessxrJSoNHaw/dTUOIN6ycYIIdFCztKB4tMwXxngnvvnGG/Q4r2?=
 =?us-ascii?Q?sDXx6ZZ8qqqiymLWrSCHhOt3McOSU4iHIlR7dGpLhZiQYmOIqXE9KKgo9M6C?=
 =?us-ascii?Q?cQ8QEF9+Bg1/4jL6wpa4fDtRENh+Oew5PFrPg35+IXukETBcQVnFzOIUIqnr?=
 =?us-ascii?Q?57JBKtx02P8omxvNfK4VtoOcti2tCEIu9TgVuK5OHEbOYpn1S+5V3sCiLBzk?=
 =?us-ascii?Q?sa3ucHy3JOrYRQYI5ACg0h5owN/gHo4ySGljLMBGLU7vo6iU9twN6t8LB8Gy?=
 =?us-ascii?Q?Qy9wxTrrTKix8vwUDAmBa0Vvzw+1CZl0EA13J62cQIn8L+x29hF01PXzjLjv?=
 =?us-ascii?Q?BxeNNpIvlML3HQW7lJQIYE+i6UJZjU8wIImVZEpbeS5nT3vSHidTAJO6UnvW?=
 =?us-ascii?Q?HhPAtphaz/chw/VpPiB/CvN+KLUEBeDwQOcvgb9Gk93khL21hui8W8SvWht5?=
 =?us-ascii?Q?iPZ8hcDSjLY686nMciMQd+tWGlQ3GZLR4uLvZWUnLLZt7XSp1uBjm39pnxxz?=
 =?us-ascii?Q?vzUohLNNpmD/6QsenRXvZ0VOdAnDLBWxKotA36pivkn8x5gkNTsYicxDoMAo?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f648d085-c605-436d-5f45-08dd164df173
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 23:30:17.7193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCO6GDBW9C5crq6QjjRRrm6RrL2xqKMXE8ck7OCoQ/Z5Ji5OCxIcmmeZZCJJU/YKog0gLZVK241D193rYG3TNuYeAiiTrg2vVuxBh3bQiKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

On Fri, Dec 06, 2024 at 01:27:41PM -0800, Clint Taylor wrote:
> From: Matt Atwood <matthew.s.atwood@intel.com>
> 
> Add support for the pantherlake platform for xe.
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>

It's bad that we're still hardcoding the graphics version in the device
info structures for these platforms, but that misdesign needs to be
fixed separately.

The changes here seem accurate for the current design.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 0c04476bf..c93ad9f75 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -92,6 +92,8 @@ struct intel_device_info {
>  	bool is_pontevecchio : 1;
>  	bool is_lunarlake : 1;
>  	bool is_battlemage : 1;
> +	bool is_pantherlake : 1;
> +
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
>  };
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index d38dc415d..349cf1b48 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -526,6 +526,17 @@ static const struct intel_device_info intel_battlemage_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_pantherlake_info = {
> +	.graphics_ver = 30,
> +	.graphics_rel = 0,
> +	.display_ver = 30,
> +	.has_4tile = true,
> +	.has_flatccs = true,
> +	.is_pantherlake = true,
> +	.codename = "pantherlake",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  #define INTEL_PCI_ID_INIT(_id, _info) { \
>  	.vendor_id = 0x8086, .device_id = (_id), \
>  	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> @@ -642,6 +653,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
>  
> +	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
> +
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
