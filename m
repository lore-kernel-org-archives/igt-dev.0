Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A970CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 10:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36E610E4E8;
	Tue, 26 Mar 2024 10:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knEEgixq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6910E507
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711447675; x=1742983675;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A0A5PkXVF9tCdPd6uYHIFCrbS4GrFl3oKLOFNPIo0xQ=;
 b=knEEgixqPgwb+/Tix0XFOn30YdelrsyVFp1MezVL6rzSW4oBcO3COmbe
 E4fcrZ8VcV3scCafoBhlLF25ss+N+pNcyJgFpoNkimCJ9yzkUb3EttiKC
 FeyZjO6QcNhivAwhtjHGLdcToeNeQkqovCHYn1vrHG00YqB4N9UAUbumA
 OWoPnnRcCOhFuYyguD68fYBNNsN2SHcjfU1lh5kIfvY3EaNYVrahcKAMQ
 LrXfZ5ZVaJJSr4Jq/nLo+VMqiLbYUUGLDKWqikwGrpchEHlPp29q5GzX6
 GNZSBf7fV7Vj+lvz8ifb9tHl8ZIOvYwo3fXFztiPT3fhdOJihOpdbls6U w==;
X-CSE-ConnectionGUID: ZJ/o6C20SOSeoEDt5hEtwg==
X-CSE-MsgGUID: 1PNDibxoS3qkG4RSK8rHsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10267627"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10267627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20571737"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 03:07:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:07:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 03:07:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 03:07:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 03:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0rWZobeP20Q7Tk4HtsEV23EzU1DY2b72K12pQok6wV/BmGfTpdC8EcQvb5l9S6Ovb9x+ey514/jHsIVFkEPfLn//0y8gVNyB3dJEeS2Vt2mTq8Z42TW5iO7NUY4WxP5Hh8p4lE6hkzpCwZXCBUXwadj6Ce6UpLfSkNeCuWdkLCVEUDcvafjn0iS4pEiRj91429yXY+3U0cndJbEv/wYOB4xxJpiZ10ROo5UeNtLrw1DhjWp7+pMmCYuRFY36Sth6275YmSLgPsTbpC8d7ayuAP06VESm9wygy2UOh1Au106pTvMK0BwGI/x/BxHUhgSBWoho8AnrzCoflpdwqncRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qtpD4lZ5CBkPVvIDPOKSZ5PE4+n+LiEfXu6jDZAdB4=;
 b=eDlSterJg4o0/0vGlEvGoqFvTfxWKH+Q5DG7OUSg0Jzcf/E0/BmqmrzxNqSPsoUGQbTn7781utc0R1deWIVV9KQs6LMzQeX14vVCX+9JLIDd5k/DrBBSQ5cjxnxfsHyjDb4RQyiSaXDNuS4ovix5WcoYEBoPWdgOlsSKru26PjSrasQswhPfK53h/AWu6jHfAwaNUTe5X4dT1tmMpMgjJa2JVX4CU+5uLdJH2Zs7Jg0Cq1+q2VBXYwWpiU+jacTUrlanp2gronb30xbHfDuwW9z33BcWNFNNZMILo+UOQ+8DEi9XUsULRKUSZJRt0WpXzc+iKu5H18ZQu1iDe8ogug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 10:07:50 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:07:50 +0000
Message-ID: <df8ea083-6c18-41cf-9912-7f0a80d648da@intel.com>
Date: Tue, 26 Mar 2024 15:37:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: fix intel modifiers for fb copying on
 xe driver
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240322120914.205342-1-juhapekka.heikkila@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240322120914.205342-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|MN0PR11MB6230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFIpjW+E4JvMguyNkzOdjTNt65Qs5a+EdS+6fH+IvZkyZlhfxUUhCUIP9oD9fd/AK/xG7t2sGWqjyVjTUGlIIBmPu6r4kowhNtHRBPUGcoXk6L6JVt4R2gbEctJD7pmWM6mcMsVuj9KBusONqBZyTFW5Q7hww0XmVYIlSnkvB7Srq8QwC6miW+NVIo7+sP8KL+SmBKgPW1rYmaFjQJyYpO7o646j78ddQHpj9P4zcvvt9ZIsDI6g4Xwogbe5+aZKVpHDqsnOQUXbtR8S+Pm7N+kKEJC1boif4YT+wrJUZfRj+TLLnq/XkQ4rpXgAGy/6wkDHR5/DTpLwcazKi0tnhyA5Y06+h3YZ113GlRCjS3bB52VdIS27ygjdDqCqhz3RTiijpnilcj7we0+YxDDC5ZXTEiPqqxPxAEvLJXt3hTD/hW2dTaFtXclPwK4vS7Nb+JHYt+9Y43qhM+b7dyBHCGaf36bmIefiTkWka3EBkWS1jtz2s1V5IUZJrqJOZWBoiwVu/X21U/aiW9Q7l7PBMhZMI52S66m+IVH5XNJNgXbF0hPn28iLp7rXQf8uzeHg1dFnye2hWUNwGSK8DBjnNCUbO8FxrvRmWg3oAa9Jge6xaS/y5l+D4r8ZOVQMk8L+oh4JQi64k6BoW6RmFL788BlRWxR9dksuhCA4qIwpp9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVRDUkxqZVFiUE50U1RjQkZVOVlOcDZBRzVGYzBzUmN1bXRwYlpjb3M5Yk96?=
 =?utf-8?B?eDBZeFN6QUZiam1pUWRwSFZvNFVTaFJ3d1FhRXR3bm5Ed0NCZTA3N2cxNFJs?=
 =?utf-8?B?V0xLOGxXNlZwQWtLQnc4dUUzK3pwVld2a3VaaCsxV1VmUkhoY0ExTldqU1Fw?=
 =?utf-8?B?NVQxUFdvNGcrbHdwMUVOVHBzS050OUQ1TjBlMzU5UTFmK29UcUpGZGFHcnA4?=
 =?utf-8?B?VElDYXdhSGUvOWF5WXE1RElYRUtTaitDZDRwSDYyNXJHcWlxak8zQ2xjM1la?=
 =?utf-8?B?ak02aEswTTlYTjZVREFXUDFwcEcyTEhrQjVMUS9PMm41QWFobUM2eHRnMkxr?=
 =?utf-8?B?eVcvclJyakhFYWVPTGt5aGtkeFZ5bUtBZkhJd3VYdEhaTnlqMTJBMlAxL3h2?=
 =?utf-8?B?bDhLWVJjQ3FOV3htOHJBYXpsa2wvTmNwc01ZTGtJRzVLWmVSank4d3BNZU5j?=
 =?utf-8?B?K0wweHZETGNUcy9rTUhDSGN3OFlKTkFraFBySEExYys2TWxVeC8yYTVERXI2?=
 =?utf-8?B?WHRmc1lucVBEN0hwNzliclJRa091MUlkOXdSTS9pakQwNVRCTlZLMGRRaFRa?=
 =?utf-8?B?VHlTZTF3YmRVM1hWUXNZSXN3UmNoK25tcXQ4cGptVG82ZVJvcEhBMHovVlNP?=
 =?utf-8?B?TWVVdnhTZFRSbk1mUkRFK0ppVktoU3NhaVd3QU5vV2NBY3pZZE9XRmNGaW1S?=
 =?utf-8?B?djZ0R3N1M2RlRDdvM1liUmlsMFpTTXR3N3hlV3djb21ENHd5WXVqaHVGcGh2?=
 =?utf-8?B?Z1gwdzNCT3ArVzVONmJkYVowOThaYkxBR05Gb05sL3pDQlpRTWE4dEZ6cS9C?=
 =?utf-8?B?NTF2SlRFNWdOU1d3QmYyNjJpNWNTMDRROTlPdnpwa1hWdElQdzhlaVdjTjlM?=
 =?utf-8?B?RmsvVEJKWXBUOXdZZ2RMMGIzaXVQZkxuSHY5ZjZwR1V2UmpXSEd1d2NvbWlr?=
 =?utf-8?B?SzhKbFozUmJ6azUrUDc2UytJejRjUDVsUUh0ZllrU2pOcGJOUWZLNU11QVRz?=
 =?utf-8?B?cm9GRnFrU05yaUlJSEU0TFkvTWtkcTVraUM5RUYwS25ETHl3SndQeWpnSUwx?=
 =?utf-8?B?WUFHSFRWd1dsSE5sWUtZbkRuZmh3SytmTmNFS3ZjSDJSSTBjTkYzMlFOYjNl?=
 =?utf-8?B?R0pxOC9LU1RoM3BUN2NCYWhNbXJBT3EwYkNVTXBYSXg0VmJ5d25ZR3NmWjZE?=
 =?utf-8?B?eEVqcnpsSHl1QkNVQTh3VU1KZU9KNG1yZTBXT0tzc1NjanV3eWtNaG1RWGI1?=
 =?utf-8?B?QVovOVdRNnBybjBiMjVTZTBnVlprZW5jMmp2L2V4NXgyeUFqZFQxZjhyK3dh?=
 =?utf-8?B?TUJkTnY5VnFWU0dxRUI2YVhEVWxWcnZxZjhDNzhlV0VHNERwR2xpbmdrRFBz?=
 =?utf-8?B?S09HeDNjeHc0c2dvbURWbmtEK21KT1JYNzRXaWJBQWZ1SmRhQ3JWTjVJSjlC?=
 =?utf-8?B?d0Y4Z3Y2TVM1VTNQR3R1U3hXcUs0dHR6b3lJbmtIQ3cyLzcrZmcwc25PampG?=
 =?utf-8?B?SlFCNDFqcjkrMXAvanpVeTZrLzMxR1FPL3Z4K205UGVNZW93UkpOZHRIRkVU?=
 =?utf-8?B?eiswYVlEUEFCWEJVQ2ZhSFFyOTRzblMyU09mQ2NtTGRlZ2lIVkV4d1IveGlo?=
 =?utf-8?B?UnF3Vmt1TzB2NW0yWUdWOGcvYkZRcGxLZ29oYmd3dVVTaDBrQUJTRXYzK25D?=
 =?utf-8?B?UkpUSzV3WVUyZEd6RVNxbFh2MnZ6NjlvU0ovNVQ2K09HaGFSazJPOVVheThM?=
 =?utf-8?B?RkU3ZlN2YVZ6ZWxlSDVvUVppKzFUaDdNc1dGT0Q0dVFpZXhkK3lyNVg2c3F1?=
 =?utf-8?B?c25iK3pGZ3dkOXFNb2RRekVabGdENFM0T3M1UVFIRHp0S25mS0FqemthZ1ow?=
 =?utf-8?B?ZUwycTF1Z3E3UXVmV05NcDQ5dmNaZ1kzeWs4QU9hRmRXTjMyOFNHWEh2NGQ1?=
 =?utf-8?B?TnNSampxN3hEZWRrR1BoNDNhTHA0enN4RWw3MmN6RW94VHg2R2VLQUhiSGJn?=
 =?utf-8?B?WXJ5MVNucmhWMlo5OW1mNlNuSjFpNEdYSlpyS2JmOWpacldoa0V6b3pWZDND?=
 =?utf-8?B?dXQyMCtsSHN5RGZNV3hBNndtRFBtanNvNXQyNGo2cEtZRUdyTW84c2xGYzF2?=
 =?utf-8?B?TTMxU3hHbzhIQlJqNkIzWTlEM3hKcjZ5Z2RDc3lORENMVWV0TUJhOHFsV1Aw?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb221223-f636-42a5-eae3-08dc4d7c9811
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:07:50.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdHs1vjFqu4DeWR6kCpBqNRQaQ3rhLIHTKWuoJ7V0h6pl5C8nrIkFDvv82mWKGGLNbkjNY0yMItWmynCNxH/9wJQWOgoI1vt9xgGR2z9gxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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


On 22-03-2024 05:39 pm, Juha-Pekka Heikkila wrote:
> legacy blitter doesn't handle x-tile well so use rendercopy instead.
> mc ccs need to go to vebox copy, blitter doesn't do mc ccs hence
> on all platforms with ccs modifiers use engine copy for those.

Do we need to split this patch into two (1: x-tile, 2: mc ccs)?

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/igt_fb.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index cc70cb91c..9557492cf 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2508,11 +2508,13 @@ static bool blitter_ok(const struct igt_fb *fb)
>   	if (!is_intel_device(fb->fd))
>   		return false;
>   
> -	if ((is_ccs_modifier(fb->modifier) &&
> -	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
> -	     is_gen12_mc_ccs_modifier(fb->modifier))
> +	if (is_ccs_modifier(fb->modifier))
>   		return false;
>   
> +	if (!blt_uses_extended_block_copy(fb->fd) &&
> +	    fb->modifier == I915_FORMAT_MOD_X_TILED)
> +	    return false;
> +
>   	if (is_xe_device(fb->fd))
>   		return true;
>   
> @@ -2551,8 +2553,9 @@ static bool use_enginecopy(const struct igt_fb *fb)
>   		return false;
>   
>   	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> -	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
> -	       is_gen12_mc_ccs_modifier(fb->modifier);
> +	       is_ccs_modifier(fb->modifier) ||
> +	       (!blt_uses_extended_block_copy(fb->fd) &&
> +	       fb->modifier == I915_FORMAT_MOD_X_TILED);
>   }
>   
>   static bool use_blitter(const struct igt_fb *fb)
> @@ -3062,7 +3065,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
>   		igt_nouveau_delete_bo(&linear->fb);
>   	} else if (is_xe_device(fd)) {
>   		gem_munmap(linear->map, linear->fb.size);
> -		blitcopy(fb, &linear->fb);
> +
> +		if (blit->ibb)
> +			copy_with_engine(blit, fb, &linear->fb);
> +		else
> +			blitcopy(fb, &linear->fb);
> +
>   		gem_close(fd, linear->fb.gem_handle);
>   	} else {
>   		gem_munmap(linear->map, linear->fb.size);
> @@ -3142,7 +3150,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>   
>   		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
>   	} else if (is_xe_device(fd)) {
> -		blitcopy(&linear->fb, fb);
> +		if (blit->ibb)
> +			copy_with_engine(blit, &linear->fb, fb);
> +		else
> +			blitcopy(&linear->fb, fb);
>   
>   		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>   					     linear->fb.size, PROT_READ | PROT_WRITE);
