Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A339CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 22:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55A410E0DE;
	Thu, 16 Oct 2025 22:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnRDOTWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9449710E0DE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 22:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760652835; x=1792188835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+s0jmmurTOsCoUt3zn+ri8Qy2Lyd3nUEqQ2So8OuIsw=;
 b=QnRDOTWHbhnKavp+GcJs4h0joJoQBr0zLtrV/7zuEubbvqCvhaAu5iY/
 +lFViq0JeEinal70aq3jL1tBd2G5hmEcwMybdDzJ1eKExkYPbcNoGSWnC
 ir6o88kNIUE7jnz8uQp4jCxVsYb3Hxn9F8Ay7c862lubyTseZsD290VYI
 oQ9MSPDuPPnZM2bDOfQPu5WqEqoTg0P37wTvf0W/BR2Zj8KI3p5T2za8M
 yuvURxcEBxmHslfjjQM+yU2xE407P/VPdNgMqPFDfSOEf2CqebtvoNTh2
 bC5sNV+tq9HkjC1st/u9DHdFCpDKfc4zYj8nIWpC3Nuy7hiymw4H1LLdA g==;
X-CSE-ConnectionGUID: LIA8u8vVSuixHFCDBQbFjQ==
X-CSE-MsgGUID: F+Lw132oS+i92s3PFHfM1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80494153"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80494153"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:13:45 -0700
X-CSE-ConnectionGUID: T+1k17L4Rz2yWQahI86uKg==
X-CSE-MsgGUID: ZLaS0aSWQQqdNTLDfKt3/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182559324"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:13:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:13:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 15:13:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:13:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjB33KOieiiyvQgdmyehQLsJoXFW5Tgd8ugx5u5jLW/d7xo69XAeMorZOs+kz3iitpP7H+FNZrXQ6QsA98b7TSXL2VBMb4aTmZyi5lwMRieAr1Gms9xIZj+wjSU0OQtAlmTKTaz7wyD/NzIfPDzQPK7DVB9ilk5WZPvcDWPwaLCjWAp/d2K+GIIfU0izIKYTRmjk0+3G3dgRPy8vIGG0Q5wc7Pyng3OeaHKRekFHe0MTaBSIHFL/GkTCU5Msyc8ZR6fq2r3+NtelCfFsdCuvOeZN3kDS8T/Qb4fKDzQ49rT00huAESiirNI+UitFVbuCUSqG5PbJsNsXtIb/hYoMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcclzgJvk5N5X6mc266rvVIuWfdBmzwx5dE8NnMQQ7s=;
 b=WOQHPTE70bq/7KRaQYghyoWG5FcDtrMYtzHZumZ25YDhG+J/htGHRQ3Cqnm+ZeiDonXX9hI+3p9ApW1hqAHJFm2Tqf9nKHEXxR/eWYUVFCz0wRKLrFmwMQzGMjPvmfCb6VebDSY+QHI9Ysk+aHBM4+p+EReHRTknfq0QcGZ35Wv3Sh/drcOLKzZv42FBBdyfx+i7OWbxGhEVT2DPLhyfBaSyPqUl2sGN15PDa3PMp8x9agc4atmj0TXM30y1BR/ThV0JkHI+6uGO/lLRO4KiZDqkjS75MOC3ag+qDYolvHJDvGifugdOiToza1OsVQ4kOhNeAiHyejo49I98OxkAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:13:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 22:13:40 +0000
Date: Thu, 16 Oct 2025 15:13:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Message-ID: <20251016221338.GO5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015060144.6410-1-x.wang@intel.com>
 <20251015060144.6410-2-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015060144.6410-2-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5adffa-33f2-4fa3-9c6a-08de0d0142dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bRmH9eSdolbAG5Sduyxi4K7Fj09H36xosAXpTqxa7tNHoy5J8J4KVCEqYCia?=
 =?us-ascii?Q?nhFL8M+EKYICvYTwZkmmi/Jb3KHmok4m4I8b45A5y6HLNfykGXeBINmrD2mZ?=
 =?us-ascii?Q?q51HHtJ6px/yQKyvSHqfinn15q7XYkJ7jf93n6czraw7NUofRSPUNULOHCYa?=
 =?us-ascii?Q?MDc4YKI5891DMd/hvuCecb/xA0CoN1ZFWbBrZTdrOv9UOs942RZsbPFvBMFy?=
 =?us-ascii?Q?oRjJUj2OEPCRpAJYUJyXY++PhZL9v2kfDk2zXSi9pOJGzk6bZpwvbo3jrqc+?=
 =?us-ascii?Q?WLnkl0UP2DMPewrl2T9vZNyugAH8Sxpe4NTEtZdcqSoN5ZkopY9J5hhXIHfr?=
 =?us-ascii?Q?4dgk7r3ZlTf7EO2/rAznwCJoPCNEYMEjjJnzVAktSSlzti6bmSn9UHKdWXIC?=
 =?us-ascii?Q?oMD/omsprCkID9mYwJMO5XRE/H58DkWEpik8B21j9Z3LgVb2tHUxY200SV/J?=
 =?us-ascii?Q?BcHOurqNW7hAKKCs0gU9Ny0XL+wvdLmV5AjIKfd6HhQqtufXOG+qMca22fEu?=
 =?us-ascii?Q?UGl8gfRJ8zZWNhw4EwpyQaFCu9k1JQQNHeGqn3fOp8Yo6N/Y+TVFx7I++6zE?=
 =?us-ascii?Q?FYcrgf7NXZyvmc+WAWwMaHQcBd0CJsdJ+psA6iHCM7gqmnj8ycZsnsFElCWK?=
 =?us-ascii?Q?IBStr/BO0iQTA6OV4krQcaYRX06cdOEwWcbXrwRS8k/oVMmv4PNBbCKjd+PG?=
 =?us-ascii?Q?H2rHcNak8c1GJhessBkcO1qmZBO2HDslleBudRksABFRBNaXm/xmVtbr7s7c?=
 =?us-ascii?Q?jvhYy4yswwW8Msd12vwSX8Vm2+5fluUEzQqZPmWxvRfQV67kJLNEDetCF+L/?=
 =?us-ascii?Q?oLhas4h1WfiSubgMPe0Vbh1tk9e45IcJy69vM4OU+WQG5IeArc+tlZFGSxvY?=
 =?us-ascii?Q?AMkNFviJSBmdA7PlM2OykpLgyRhTxQJrSjrY/xDpH1VDhibtNn0w7L5NgRxe?=
 =?us-ascii?Q?xlZJmmOoi6LA/AbYkPNfSyGspBAQBO8t3lhbXpX60EY0b0wyJRtDAQaCsUdL?=
 =?us-ascii?Q?ZQxy+kNFQJI0GGr1967GjQWiflpoPSBlSGHaRXPmUxtQi+XKEhkw2yglhznd?=
 =?us-ascii?Q?WIR37/mf382qrMo3c8+oJdZYxQh5nCvjIzHpSmzFrG1KEfqNGqQTZpbro1R0?=
 =?us-ascii?Q?KeSrkz0c3Op9/hNW8VCvTYCJuhhbwy+DCRaidZm66ALz1KTs24GTffksOWPL?=
 =?us-ascii?Q?8DcLMJf1WHmrqniuNhs8gJVuHsus9mFjcZ95GWbr4TLF2v2l/L6ff6COGI1p?=
 =?us-ascii?Q?hWe8ncZFZO9IzecebrQDrLhtZEEiAVVhXvI3T2kijkh1Y6TwdZTWpmLjrK+L?=
 =?us-ascii?Q?nddcC1m/Zcpai2l8RIqLuaLy6XqwbQQrL5mIqq9BlwDy1tYIIRi7BYAzr8rT?=
 =?us-ascii?Q?bRPD39laKY19iLrwTxcbH9HrjLepjUZEHEYvHJnSYanV+spV96nf3dlb72nd?=
 =?us-ascii?Q?ifXuMlEL6A+XQka0hmwsQka2toNUN+5p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mhrcRtM2BwGiRX7wHchqeGSwigodCVYiQGwG3mCBs1Gg0rEW9sK8ccNOzH0?=
 =?us-ascii?Q?mXPllla4qSgM+k5z9SG+kSlSUqzFfgTqC2IN7Nr0EZ0dQVsii2yJJUU+zKqx?=
 =?us-ascii?Q?yhRv1AgvfP65uNdJMnYuOEzao1d+MVstClnnE9bIf0F2ruHVTE07QpFLFN/u?=
 =?us-ascii?Q?PT4GIJlm4rTKtE9P1UiGyU1sTU7q9ZxEIWqHlsCxlrsQFiqgMvz3kuUmyHcR?=
 =?us-ascii?Q?Eyc0ukvp5hD0wY8tXStTv8z5hHKRV8lL71GWMNBcPLQXKucjpN8ytxmZtn/3?=
 =?us-ascii?Q?BdPEwUVC7SaZpsZtIzQhNQn2JBPOfatnEksUcs7U0s6Eh8P4Aj5p+5yR7nvE?=
 =?us-ascii?Q?ndp84rK9FJHDKMMeo5qZ/F5sAKwoRJE0IhXd9ZqZIjjomtW1MASJK6wv+Mrt?=
 =?us-ascii?Q?EY1vzV19OGxybv6V783aKu7ONPBw8sgMKkwu/V2mXf71Lp/4rFLOyBSmQzVt?=
 =?us-ascii?Q?i+uT+7dsCWUT2pz1sceUNYT+ogc9VJn/xZHJuH1Z6ZyW52gti2NlOg3VYb2y?=
 =?us-ascii?Q?0XxCBgUaErezZPYZHa+v110uHKUVZJPNNN1OWcUBXVEvp14MUBBupfWptHiz?=
 =?us-ascii?Q?VHQxp0jqBnD9H8vC2hsZCe9fGOPCvbiWBrD+9C310T5aT2VdbT9HWh5OYt1k?=
 =?us-ascii?Q?gLo20RkpneEQ/l5CBhqmPYDM9oEthtm/EmUaGu3/2WmpksUgPPJJ+OwY8K8g?=
 =?us-ascii?Q?mJ/HvcxWdJUu21uDIZZ/ThgNYakk5e4w98gmtqS/uLV8Wo2Ihkvpd3yNpxmg?=
 =?us-ascii?Q?EuenrTU0EV8A/jQR9PjYS5DEKWeK1VxqmnKmY246ro/Txdg9HI9aTiDAbI9U?=
 =?us-ascii?Q?6IAJnfkLK3E+bbQWA7PWb+/QAYvvJ3Od1B1QdNh+tY0k9lnDKm87ZjpdxvjL?=
 =?us-ascii?Q?b/jnUULwWLZOysweKqsOP20yQW3cCUvwCCXO2spxXYno13GttHhzYLYhv+rH?=
 =?us-ascii?Q?qfE7hZXSSJ+NV2h8WPCUhTXEN6kcf5z+WrTvHMcJWU+oLxLeA+l4n27lO1jN?=
 =?us-ascii?Q?N3h+icPnwbC0Cg78jULm3Yvrov1Vpv365ucYhgDNY7U1b+VCfg/5QrMikjm/?=
 =?us-ascii?Q?FDXLNSSj1u+XptfmEfD14ND3G1uBc87jQlz9hOI2wO2vzmiQliRBr8fgu2LN?=
 =?us-ascii?Q?JFqh5jwQwYBiZ/5z1zzPz6I3t5AoY9BQLxrt7g3wCDOcETv03CkFrWO9e9ny?=
 =?us-ascii?Q?1jNMEq5Ln6LG5yQoYIChWG3lq0eb4yBBgmVCuZCQYAHf+MkY4z7V/edZ4uKk?=
 =?us-ascii?Q?rB2kxH7SH1Csy+cFMhf8dp66ghGNS0PS062QErOGc5SJPMuyAsi/XBDUm5IL?=
 =?us-ascii?Q?tAcNwiwcH1A+Vy5NP/vdS+eQoQk+dNwokekAHctlVSYdBINM3SAtK6Fr809/?=
 =?us-ascii?Q?xjlSe7K027RpxKaRwdeYHO59yHo069yqcnlsYtUmdjS7/c4OUVUn31WmAYuT?=
 =?us-ascii?Q?bA9Y2tWXkn8etkesMuxu+ygrP99QR4VdX+WL9JC+UOnICTGx2EtyBJRH5Xap?=
 =?us-ascii?Q?RcidSvitVENHnp79SuDMaP+e+x3/9y+jZ/4YSm9crjxzLnQg2vGabZImOSHr?=
 =?us-ascii?Q?NSYHghHUhHYFjXz3Kkh5B2+bQaMmgGckuO67bQGA+G1OxCUInr3KuiGeMjp3?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5adffa-33f2-4fa3-9c6a-08de0d0142dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:13:40.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIkLPKKnU8kiuxaEnSskoZuh+pTGrIZOzzfcTnm1ixqGxYgVf25fLT35HJXybFyxkwy7aM/gIHaaxR8trNdg92g6Mujc/KDnqwpu9fGzi1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
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

On Wed, Oct 15, 2025 at 06:01:43AM +0000, Xin Wang wrote:
> Add intel_device_info support to xe_device to store accurate graphics versions
> retrieved from the GMD_ID ioctl. This allows IGT to query the exact IP version
> for xe platforms.
> 
> Key changes:
> - Add intel_device_info field to xe_device structure
> - set the graphics versions based on the GMD_ID
> - Cache device info in global map indexed by devid for efficient lookup
> - Implement xe_device_get_info() to retrieve cached info by devid
> - Clean up cached device info entry when xe_device is released
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/xe/xe_query.c | 33 ++++++++++++++++++++++++++++++++-
>  lib/xe/xe_query.h |  4 ++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a89e0b980..b7c9a2bec 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -335,6 +335,17 @@ static struct xe_device *find_in_cache(int fd)
>  	return xe_dev;
>  }
>  
> +struct intel_device_info *xe_device_get_info(uint32_t devid)
> +{
> +	struct intel_device_info *xe_dev_info;
> +
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	xe_dev_info = igt_map_search(cache.map, &devid);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +
> +	return xe_dev_info;

The function name here makes me think that this is going to always
return a device info for a device ID, possibly from a cache, or possibly
from other sources if the item isn't already cached.  But it looks like
this actually just returns NULL if this function gets called before any
xe_device_get() happens.  I'm not sure if that's what the caller(s) will
expect, so if the intent was solely to provide the contents of the cache
(and NULL is expected), then you might want to include "cache" somewhere
in the function name so that it's clear and this function doesn't get
misused by accident.

> +}
> +
>  static void xe_device_free(struct xe_device *xe_dev)
>  {
>  	free(xe_dev->config);
> @@ -379,6 +390,21 @@ struct xe_device *xe_device_get(int fd)
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
>  
> +	/*
> +	* Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
> +	* We should use the hardcoded value for the none GMD_ID platforms (ip_ver_major == 0)
> +	*/
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
> +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> +			xe_dev->info.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
> +			xe_dev->info.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
> +			break;
> +		}
> +
>  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
>  	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>  		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
> @@ -413,6 +439,7 @@ struct xe_device *xe_device_get(int fd)
>  	prev = find_in_cache_unlocked(fd);
>  	if (!prev) {
>  		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> +		igt_map_insert(cache.map, &xe_dev->dev_id, &xe_dev->info);

If we're using the same hash map with both fd's and devid's as keys,
isn't it technically possible to have a collision?  It would probably be
extremely rare (especially if 'ulimit -n' hasn't been adjusted upward
from its default of 1024), but it still might be best to just use a
separate map to eliminate any possibility.


Another possible issue --- don't we have allocation lifetime problems
here?  What happens with this sequence of events?

        xe_device_get(fd);

                - Nothing found in cache; alloc a new xe_dev
                - Insert    fd => &xe_dev       into hash map
                - Insert pciid => &xe_dev->info into hash map

        xe_device_put(fd);

                - Remove fd from hash map and free(xe_dev)

        xe_device_get_info(devid);

                - Return &xe_dev->info

During the device put, we only removed the fd key from the map so the
devid key is still in there and available for lookup.  But both were
pointers into the same malloc()'d allocation, so when we free()'d that
allocation on device put, the pointers we get back from subsequent
xe_device_get_info calls now point at unallocated space.


Matt

>  	} else {
>  		xe_device_free(xe_dev);
>  		xe_dev = prev;
> @@ -424,7 +451,11 @@ struct xe_device *xe_device_get(int fd)
>  
>  static void delete_in_cache(struct igt_map_entry *entry)
>  {
> -	xe_device_free((struct xe_device *)entry->data);
> +	struct xe_device *xe_dev = (struct xe_device *)entry->data;
> +	struct igt_map_entry *info_entry = igt_map_search(cache.map, &xe_dev->dev_id);
> +
> +	igt_map_remove_entry(cache.map, info_entry);
> +	xe_device_free(xe_dev);
>  }
>  
>  /**
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 715b64e2f..1a261866f 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -74,6 +74,9 @@ struct xe_device {
>  
>  	/** @dev_id: Device id of xe device */
>  	uint16_t dev_id;
> +
> +	/** @info: Device information for compatibility with i915 */
> +	struct intel_device_info info;
>  };
>  
>  #define xe_for_each_engine(__fd, __hwe) \
> @@ -140,6 +143,7 @@ int xe_query_pxp_status(int fd);
>  int xe_wait_for_pxp_init(int fd);
>  
>  struct xe_device *xe_device_get(int fd);
> +struct intel_device_info *xe_device_get_info(uint32_t devid);
>  void xe_device_put(int fd);
>  
>  #endif	/* XE_QUERY_H */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
