Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B34C47DDF
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 09:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5345510F6A5;
	Wed, 24 Jan 2024 09:04:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086E410F69C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706087063; x=1737623063;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U071o/K9CuuUwF37GnywheBSfOrc4D6DxlahnXTaIBo=;
 b=cQw3L42vO61lq3dkDa5K0WjWQrg26PJoNNd867lj8aw6uX+3433mdJt7
 fVFSnpZN3ePhQ6PopW7/Iev4mGMhRGD8Y9n6d+mDrAFsQGFKa16T91AKf
 hmytUwPOhEnL95LgIzp1XMFqKi15nbDkL0gpefznwKx4eS5jgQOkifkc9
 YC5/wn9xMNtngylEZapYPKkdy/ui/VmrRVXm+78BeOX0W18PdYPIbHkeI
 sCooZ5tuksLiRQY1fO6KfBV9FSxLvUYuyOSSl6TaQVyYpS+w37JyY1B8u
 goKEDByv6ol+bKSR5hdHsyVz5SlJxeYCZ58XLeOHbviYg05SBRXBCO6C1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15309059"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15309059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1863597"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 01:04:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 01:04:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 01:04:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 01:04:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 01:04:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wvjat8mSiX7ykt/eaSrXmdGyW8LWJcEFxR295FPuX+RSVXsKxEgx+ncIEO0aXpIPlOEDliy8TAJXiYmRrClLZ0IHUPCXizvIqcdagGP7comxO5/1j9fsX4gB6jvWwNO9pU11nwSKndsliiafp/BWiuKFqmwAQwMGaX9WzzOP9qWl0hbCJ66Bh05vLS5mP2B/TrsFhKuTwIe+boEIjDXk1SmTM7foJaT9039Sd/WmCZN5Y0jOhKBy9maRvwRIwodWd3WIopqx9rCAwbl1VCUv/Ze8z5XCXHaNNdnOdr0jcuoRzo3CZ4YMdl1SMEJz76PrLkThT10Ul3XW6kXb3v8VAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6cLLXSx+1bD+DYpC+/L2uJlqbZ09qmy0XqI9MCvG7I=;
 b=l6lEux8ptaFzoDdwC/cBWOZbwBLRyWY4tKYZ7qTsJUlqnnmqY66UrSHAo6uHHuLA3WxzYM3y1uwWrTmBSjF0SiZUoiMPX6yObd0z11obAXZCZE+2rPLYnWg5B3RnBdmWSQ2icZphotYY4qk641iUpTly3g13YpOmgkfTxGi+R3GT2W4AmKHbFSlB8vD60Ud7eBfu6KvI6Q2Jc5+hl63bLpYj2pYD4MTBJDHJagVz9rwuh6rXQ7cl1PcD0RZaRtEzTUGvMDaXQ23k7C0ovOaBdrY02Pb1a4U7gjrcSJmQW2E0xGnSs883WiaVabE1YioRY8MWfgJhlvQ8trK5VFU2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 09:04:18 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 09:04:18 +0000
Message-ID: <bba9ee2f-4731-4908-8ab7-679c37785766@intel.com>
Date: Wed, 24 Jan 2024 14:33:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/6] lib: Add support for solid_fill and
 pixel_source plane properties
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-4-4ecd2cf767fe@quicinc.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240123-solid-fill-v2-4-4ecd2cf767fe@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::22) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 4230d107-f9a8-419a-f4ef-08dc1cbb7274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iw/2TFbxb547f6Cvzt64GOvXi14GO5iVnRVH0twICHQ5vZ9ZycHFTGQx7vFUh6xNwAndlTH10tJzjqcoy0qR153M51BZGUcyZOLfszTPrOtdI29CFfi6NNCyl1V4nx64aGlGN0aH6jbu1rf197WPjBX8tj09hIZVImbphrDajLLp3QCumi9cJTaHHsg/7u4wp66I2sC97KiQF9DandYEy8rC6jlTyHcLthF7ZUK4xqQoysqonsVCC3VYX0wSR7lbJ1etSrkx+TR/jvQDvi2e3G9TcLBkSs3fCSdWufYpYAzxUHck1irMJKQ2DQ0foDWu+FYuPn4m6nO1c0+0LHnlcfgUdjWlEB+vwZkw3+zR0tXZWIfdjGUneeo2+R8KisZpGPuaw+hsdbOddTiWmp1aim70y5uk7xEU7g5R311mflaMqcqHgoFb1b+VLKnoUz7j0JoabYTZcA2ZtdvDRgI4JzI/05VQceMC/iX+tZHWyJjhtBNP46ImYwC5S9sHRUKM21do4P45g2PPsKmvqYkSGYIWc8OuKJl3nUdkkfwWh1MhcFvz1TCYnplxfX2il6KNIDYmFN0sWwoDwvRhQ5I17bYetf4EOi+TdHf5+l8i1VitRYmHSnZTt0D+pYhwpvkn4oZAa+mbx9VR669BqK0TyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(38100700002)(478600001)(31696002)(86362001)(53546011)(6506007)(36756003)(41300700001)(6486002)(6666004)(4326008)(8936002)(8676002)(26005)(2616005)(110136005)(316002)(66946007)(66556008)(66476007)(54906003)(5660300002)(2906002)(83380400001)(6512007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdUbi9XbXBudk9SUUc2SitGZXFHNlpDd1AxRlZmN1VjU3pDS05VUGJ2cXNq?=
 =?utf-8?B?eTcwa05OY0V6ZHJscS9oQXRDaHBPWk1tOUdvc21nS0tSeDhWZmNrWklqSm1C?=
 =?utf-8?B?bXZpNUI2T0VKSVlpZWUvc0xTZ1EzMnlFTUFFQXFLdUJmY1JhRE1ZKytUZGVZ?=
 =?utf-8?B?VEpDbWR3NVZFSFlTbHUxRTFxU2x4MXE5VGI4MGxrSzdjZDhONmYrUk5sSnhI?=
 =?utf-8?B?NVFvQmdFUDdnOHV5WFJacE5lckpVOG5ub2RYOTYyS0IxcmhrOEwrcnJsNGly?=
 =?utf-8?B?S2lETkNDa09ZVTV4QTZsTnNYa3pqb2F3Q1lmaWp2bDh2anZpR1N1Zk5ibGNy?=
 =?utf-8?B?MmQzT2JaZVB2NkNyY3VZNk5vbzlRanN0THhlajJpQVF3L1BsYno5angwcFB0?=
 =?utf-8?B?Q2dVV0tNK0xveDZrSzNodGV5RGNtR0JoZ2JpVFlRQjJka1F4THpoMnpoTjlU?=
 =?utf-8?B?T2Q4VVpYd1VhWTdRM2NPcGhGNVlGTWxwc29SclZlaUhUOUFDb0w2SXB6MHY3?=
 =?utf-8?B?VzM3SEdpcFpJbngvbStGdFdxOXRpdng1Y0ZSZ3lVc2kreHFIbnpNT0tZN3BM?=
 =?utf-8?B?Zm55SEZCbmo4ZnhWNUw3RkRiaTlSNU5FbXpqYXlUZ1hoL1JJa0grUWo2UzhX?=
 =?utf-8?B?eFA5NnhPODBRZlhueHBjN3daY3c4aGJZbXhVR2o3Umw3R1BZRVNFY1VDSm1P?=
 =?utf-8?B?bFlhc2pLRnRTdDhpUGJLVnpYT3UyNlp3Undqc0RYZVgrMm5taWx5ajVGMHZ6?=
 =?utf-8?B?VVZjN3JrK1NXNkh5TFJSNWtqR2xWRnRHVGppV3c5WUlCVmVSNDRibUE2SWNW?=
 =?utf-8?B?Szl0ZEJIUjFPWm1PdmYvSXpDcDVyZjdkSTNZV1QxUWhkSFlyZ3d6UCs2a1hj?=
 =?utf-8?B?MGlGYTZhcUpIZk9BMi83dlVMNFFCNm5jbUlLS3BNQ2xwUzRyVHZMT28vM1Jj?=
 =?utf-8?B?VmNLWWlPWVozbGxjSU9yN1FNdXduVUt6NTRqdWRtRVVtTGltdlFrU1BTaVd1?=
 =?utf-8?B?YWtEa2E2UDU1cCtnT0ZYMEcvZXQvQXFyUmJjK1d5WE0xSndiNHVMZmFUM3BD?=
 =?utf-8?B?ZEFDaVVPeTNraUpUWjVybzV4K0QzTXhkbGJYaTZlWFh2K3dKZEtldTAvcmZL?=
 =?utf-8?B?ajY1bDVxbjNwOHA3WktIbFNpM2lnR0dpT3FVQnRMTUVlUWY0WkJNUzh2M29p?=
 =?utf-8?B?bHRERXFxNmEzbm55bnR5b3lUREZzdXV4cjBGbUF0L3RZOFZrVVIwNnQyMk9S?=
 =?utf-8?B?L3gwNDJJN2VKdVZOcWVhRmowUzhlanB2Smh5WW5sRnF0cG5xZG1jeUQ0UGwv?=
 =?utf-8?B?aHg5VUZQckhNVnNlVW1CM0RCdjNyNHNqcWY4Q2hrYTh5K3FWKzhwdGF2b1ZB?=
 =?utf-8?B?RlFHWStJUFVEaVVGUXdUSENQbEtOOFVkZFJPTU1KT0JLOGdpTDhmNWw5d0tQ?=
 =?utf-8?B?N00wd2ZtZUwyVkhHaDllSUJwZzlVaENjMFhuOHI1Q3lWc09MT3JpT3gwazVs?=
 =?utf-8?B?Z3hkUW8vQ2FBZFNtSTRxR2xPOEJ4YlV2UmZaS1h1LzNLQTFkZlBiSDlyOW5G?=
 =?utf-8?B?NVo2VFlTWDU2UTIyd0JlSG9NeUlpaG80cFhxWXBpSkRyNUJoMk5zVDl3cTVJ?=
 =?utf-8?B?M21kenI3ZTA2MktOM1lqTW1lWUg0UXAxRUZVLzBKTkQrV0FrdlBma2FEQWJJ?=
 =?utf-8?B?NjVva3R0WktvWEV3MXhTZnhIV01ESVB4UlZCYUhIQ253UXRhVmFVWlZPRGtL?=
 =?utf-8?B?REJpVXluSFBSc0JUUHJ6eHN1S1NKeC9idXpIWG1BVC9QSG95UkpvTG1HOGdG?=
 =?utf-8?B?UlQrZTJzZTZVVXNDOG1WQk1qMzU0VUZpdGJaMHRxU2FLSlpBanQ4QTRTRW9K?=
 =?utf-8?B?NVRSWExlNkNjUzV5MWFqTUVLaExWOWJOd1p6dGN1ZFhnZmUyNFIrTHF4SE9X?=
 =?utf-8?B?ckRQM0h2UTZHZ1lHZDVvZFdEcnJLMHlhSFc1N2tURDVndG5ydUJod2xGdVZX?=
 =?utf-8?B?WnR0eStFNW1ra2ovQmNWQmx0UWVCMERMZXlxZ0ZpaVFsVXNsaTQwWkszQno0?=
 =?utf-8?B?TzZ3TlpydXpQOTZVM0RwNHhGVUN2NTVibnlOSkJUa3M2WWRueWJ3QTcyclpR?=
 =?utf-8?B?a3dZNDlXTUtQWDd2NzZ4TFNMNnVYR0hFekxOYmRvaTIvV0lIQmM1dm5oS3NL?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4230d107-f9a8-419a-f4ef-08dc1cbb7274
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 09:04:18.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EWse1PptZaHed7MoGjAulS1rWpQpDj7c7wK7AdFydnd10olfPJ5GAUkrfH9F442XVmKeJny/rRutQ4wp931oKqCS4SmDaZ4p0PrKUmqjt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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
Cc: Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Simon Ser <contact@emersion.fr>,
 Rob Clark <robdclark@gmail.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 24-01-2024 04:58 am, Jessica Zhang wrote:
> Add corresponding IGT macros for solid_fill and pixel_source DRM
> properties, and change IGT commit behavior to allow for NULL FB commits.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
>   lib/igt_kms.h |  4 ++++
>   2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1b4d0d7612a2..238b0a834adf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -669,6 +669,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>   	[IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
>   	[IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
>   	[IGT_PLANE_FB_ID] = "FB_ID",
> +	[IGT_PLANE_SOLID_FILL] = "solid_fill",
> +	[IGT_PLANE_PIXEL_SOURCE] = "pixel_source",
>   	[IGT_PLANE_CRTC_ID] = "CRTC_ID",
>   	[IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
>   	[IGT_PLANE_TYPE] = "type",
> @@ -3417,6 +3419,11 @@ static igt_output_t *igt_pipe_get_output(igt_pipe_t *pipe)
>   	return NULL;
>   }
>   
> +static uint32_t igt_plane_get_solid_fill_id(igt_plane_t *plane)
> +{
> +	return plane->values[IGT_PLANE_SOLID_FILL];
> +}
> +
>   static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
>   {
>   	return plane->values[IGT_PLANE_FB_ID];
> @@ -3648,7 +3655,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
>   	struct igt_display *display = primary->pipe->display;
>   	igt_output_t *output = igt_pipe_get_output(pipe);
>   	drmModeModeInfo *mode;
> -	uint32_t fb_id, crtc_id;
> +	uint32_t fb_id, solid_fill_id, crtc_id;
>   	int ret;
>   
>   	/* Primary planes can't be windowed when using a legacy commit */
> @@ -3665,12 +3672,14 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
>   
>   	crtc_id = pipe->crtc_id;
>   	fb_id = output ? igt_plane_get_fb_id(primary) : 0;
> -	if (fb_id)
> +	solid_fill_id = output ? igt_plane_get_solid_fill_id(primary) : 0;
> +
> +	if (fb_id || solid_fill_id)
>   		mode = igt_output_get_mode(output);
>   	else
>   		mode = NULL;
>   
> -	if (fb_id) {
> +	if (fb_id || solid_fill_id) {
>   		uint32_t src_x = primary->values[IGT_PLANE_SRC_X] >> 16;
>   		uint32_t src_y = primary->values[IGT_PLANE_SRC_Y] >> 16;
>   
> @@ -4935,6 +4944,37 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
>   	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
>   }
>   
> +/**
> + * igt_plane_set_solid_fill:
> + * @plane: Plane
> + * @rect: Rect for size and position of @plane
> + * @solid_fill_id: Solid fill property blob ID
> + *
> + * Pairs the solid_fill blob (identified by @solid_fill_id) to a @plane
> + *
> + * The size and position of the solid fill plane will be specified by @rect
> + */
> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
> +		int solid_fill_id)
> +{
> +	igt_pipe_t *pipe = plane->pipe;
> +	igt_display_t *display = pipe->display;
> +	int width = rect->x2 - rect->x1;
> +	int height = rect->y2 - rect->y1;
> +
> +	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
> +			solid_fill_id ? pipe->crtc_id : 0);
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, solid_fill_id);

We should reset this property to default in igt_display_reset().

- Bhanu

> +
> +	plane->gem_handle = 0;
> +
> +	LOG(display, "%s.%d: plane_set_solid_fill(%d)\n", kmstest_pipe_name(pipe->pipe),
> +	    plane->index, solid_fill_id);
> +
> +	igt_plane_set_position(plane, rect->x1, rect->y1);
> +	igt_plane_set_size(plane, width, height);
> +}
> +
>   /**
>    * igt_plane_set_fb:
>    * @plane: Plane
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b42f..9c05272abe1e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -330,6 +330,8 @@ enum igt_atomic_plane_properties {
>   #define IGT_PLANE_COORD_CHANGED_MASK 0xff
>   
>          IGT_PLANE_FB_ID,
> +       IGT_PLANE_SOLID_FILL,
> +       IGT_PLANE_PIXEL_SOURCE,
>          IGT_PLANE_CRTC_ID,
>          IGT_PLANE_IN_FENCE_FD,
>          IGT_PLANE_TYPE,
> @@ -537,6 +539,8 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
>   
>   void igt_pipe_request_out_fence(igt_pipe_t *pipe);
>   
> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *rect,
> +		int solid_fill_id);
>   void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
>   void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
>   void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);
> 
