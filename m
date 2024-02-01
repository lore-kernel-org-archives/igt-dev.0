Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746AC47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 12:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F4210F09F;
	Thu,  1 Feb 2024 12:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSqu4OrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE9010ED22
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706789152; x=1738325152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=up2V7aWsQIK/b1JeJKCZoFQVgt23It7MSHrZGrjNpxU=;
 b=lSqu4OrD2ah131gaIAMQx7qEBoFB76LT1T1P6LBhJki1eQI8l5JB79S4
 TfOHARDqQm5d/apDGgIOTj2qGVdlusLrieKk6KV7IXqVH4vgINEB8zWEX
 WX3Lzr4lO5cvxvgMFh0eLjVfUNApXtFmI67RtQ+huC5JDZ2etu6hr2bDp
 GhW3jM1G4DQtCX2OQcd3PhBZeJJT5UtptpawOfg0IJLyXklKz6QUhuppy
 hbBjQFZtP831g7dKAnriZzGSXHf5lVGPDTYSzEkF/ICasclpRVZvh3AC4
 GnQi+GYYg689TQVvbE7OET10c9ROje9ULbXeiWvRYWyvDRafUDRpvoE63 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11256344"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="11256344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4497431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 04:05:49 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 04:05:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 04:05:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 04:05:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 04:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxWZHw4VSeQchxDt57rL7eHS7u5ggaV4VitpDB0OaR7AfCYdALls1ns/Wir9SddPo0taDVpFr6JOQVOm3CLwFR1FdyNJLb7j+rG1ilbptPQ1uYA8WmypgXyTi6HfNkUwmGRNQqpjU7unaxuJechZKgQvEtEnwTIcvmPZWyhI1XFl/BcpciQcIS7QSPqdcJvergiZJFKiRAPpGwNZWgA9u3J5k8VS0mu4BGmMRVzG3s+EyqKXdxv7gafiVX3omaNh6GAi/Q7ia4t9saVMEGwfRm6LKIz9V9pxkWei4b9j/ajxUCq2/ZUuhBQfitPr/XOweql99YaJjrKqagkwJIOGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lyba0ptr95+g3bunx/TRUWyDCDMYSQz2g3TOt8uNKpg=;
 b=l0cIpnoXwWiCUJBqxebTbn0DiP3I0R5+X/NyHxVVDo9qMggH+1e/pelq+hZNqHnixnZmqjenXhi7qF4y/4Uj2drCy1TgdApHt8yhuLSC6cYwz0kUV/Pc0BJ4tf3aFccw6bBt2RWY35wYxDYFYOvv2yRO8otWXfZPNDTGa8LP9bR3SnSn1lBJ6WPVnzT0VPHccX2s3f6fPKbzZui5TBMEeZ3TZ3RGQ0ZeenYCm9zG0hs28BIR2CaAnGx6aDLag4tgfIVklvvFdgOAB2eRome+e3Npu1ic9SvQsr+tsEoFSCBJtSVpz37qdkw0WSGgN5DiYP0ST3RG6p7bpIgKDukJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 12:05:46 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 12:05:46 +0000
Message-ID: <6243f689-5697-434b-bfb7-b1f3689d6ab8@intel.com>
Date: Thu, 1 Feb 2024 13:05:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/5] lib/intel_blt: Add helpers for calculating
 stride and aligned height
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Drobnik <karolina.drobnik@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201100724.257845-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0054.eurprd03.prod.outlook.com
 (2603:10a6:803:50::25) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a822e4-33c0-4efa-2cac-08dc231e1f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9F1FZh8DdHMQpAlQRfXyPPWRaQczOLvow+QuxGxtQLwpzNuELuJ5+Y2gCV+tkq3ABwKaB5LxWKNVBlQVd2zS3ankR/lA1y2ytCCmuYFNxIRiDS1SY9LQClTGiEZxb1Pdvx5045L6eco5C9aBj17k8idcGJRyZMK9fninRrH5I8hIzibL3vYHEgx5d349WM+KvCKge2Yblgles4fgGacFvTGjFLOG/5EvVHuSc90OAXfmBleHRb666tanuv27cdO2DayganL61k6AA6Xaw971pQvJnWiYVt6YF46aNuyQ41cNGNn3TtXPecRZ7BZuZyvrTTMK8uu1KC7Wib2GhZRvrWZWzvaiSy/QEvmPddFR8GQK2Twbt+yl/wH3vg5sPyt0GUM6lfMvuHsLZpFS/z9oVi/ZPdvs0ktDiB2KAlFHbWSInf/Ke4JJZMC6KJoTIShCqwxlgrB4azu9/yFlK02BwWdFBH/gFLncg8L67aw5vJj01YXZ/TfH+2j8BYe5N4mPgpAa8s/1U4xZC1uBs5A37/ck89HJxtkAH9RXvvcuMTl87Gr9yIc72We9l9VfjulUHJ2fSngQFZa4aK+2RfBH+ohTNPDfMVkSzgLl18C9pEJEEUpTzOcIlKFJ+axg2Da6D3NuQK2fEpbxaq++fV9tlWRcBQ7rQ5/jwxxuIT8oQ+QimKhRCfbaG7ZPhwTIkkTg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(41300700001)(6512007)(66574015)(107886003)(6506007)(26005)(2616005)(38100700002)(8676002)(5660300002)(8936002)(66476007)(478600001)(4326008)(44832011)(36916002)(53546011)(2906002)(6486002)(6666004)(66946007)(66556008)(316002)(86362001)(36756003)(82960400001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdwM0lmazJTV2pxNkpPRTZZd1dRNC9ma2NRZ0lNVFJuSEhvZDI5WjI3TVQ4?=
 =?utf-8?B?WUt6SDRFYlhnUEFSUkFPWk9Jb25lcjhXUzJkRUpvV0NMcTRPSzFHUFpyd2Vu?=
 =?utf-8?B?dG5jQ1JUT240M0dsM1dXdm9PazBFdWpTMUZDYUF3Rmx3MmUyai81YUJQZkJS?=
 =?utf-8?B?cFRqRExGQlFUOCt3by9qVU5ES0VHOXBtRXluZGgrWUpFbldlcllKYTVHQmJw?=
 =?utf-8?B?Yk9vSmlDNWljWGlad1N6T1VZL3RoZVhVYml0L2YyZFlGOER6OU9zeTgrUk9w?=
 =?utf-8?B?cGx4MzZVQlFhRm9RTXlJVmZ1STJCUWxpdVM3NENJZnRHL3U2N2ljM0xpN3Zh?=
 =?utf-8?B?d2VRQ1M3WDVka296bUxQWURaUFd4eURQSVV1a0JpdklVazFseURhNHBjQ0Iw?=
 =?utf-8?B?NTIvbS9ZU0loTExZSDR0anczQWRFRHUzZE9ZQmpyNkRsekRoVU5RK083UVQ2?=
 =?utf-8?B?US9tazRKc2xQTXFtcWo3YnhOOVJVUXZRb3JEaEs5ZnRpblVCdll4amxzSWMw?=
 =?utf-8?B?dEVzaWZ5WnVUeG5LenBkU3NpWk9keU9BZmplUVVEWFNVbkRwaE5vMlJRcmpP?=
 =?utf-8?B?VmdHNmRnQnJFT25xak1XMkM4Uk92Tlg2L2kxSm5oR1VSbkY1RUo5eDBzQkR6?=
 =?utf-8?B?RUtPQ1gwSGQrSkFhbVgxb2w0VlZLNmVaUGxHdTlpVnpnWUU5aUlQbnJUTCsz?=
 =?utf-8?B?VVZZT0FldDduWWhZc0UrN1pOS0pSUE9nZEVtOVZvczlGQzI0VkkxM2Ivbkc4?=
 =?utf-8?B?S2xBeDA4ZGdCdFNnbXpncytSbTVEcmppU2huRjdkR0ZMNi9XOXdBTks0SDdQ?=
 =?utf-8?B?NllLdGFMUWVWRWlFSGgrbVQ0VW96QnZBbmhiT0w4STNMUXBqUHdPb0NkTG9m?=
 =?utf-8?B?blhRM2tuSkFYNmY5ZUp2Y1p4NGNBOENHRVRBTkZ2S2pyTXhXeDE5TCsxL1NH?=
 =?utf-8?B?amMrdG4xMTJkMnRCYkNIMDFxa0IvRFFYSlZsdEoyMjgxRUprY2tBbU5yNVpa?=
 =?utf-8?B?RS9xWjdLZzNteFJydU9SOXcrMVorTmd5T0xTY2Rjd2I3LzhxYUxzWmZLK0Na?=
 =?utf-8?B?TW91QlJTdnF6UGl4dlNzTWN3WWpjVWZBVmxKNGRRYndrMm5SaFVoWHA4VHk5?=
 =?utf-8?B?aDY3aTY3cGQxV3IyV29reEtjZU9CaVhBZkhhbndTKzBnNWgzUHJYalFFaW9t?=
 =?utf-8?B?NmplemFGT0tReFJnazhuVkdONmpsQTNsS0xZSHFtWWFwTC9UYnNMYnVGYTFK?=
 =?utf-8?B?L3k2S0tIdWZ2UzVQaUxKSmt6Nnk3Z2p0dXpzUFBLOHpORFoxcVRZTzhsMmgr?=
 =?utf-8?B?cWkvYkZPdjZDTzFJbzhXdDkyL1A1OEF5RFFsWkZid2phcjF0TzZoM25WNHdF?=
 =?utf-8?B?OVhwUXJJVVd5WUdSdUt5NlBPQmZVSGtGdld6aWcwWVdZOGx2dFYwVUhvZm9I?=
 =?utf-8?B?eC8vNWE0VjRIOS9INDdHZGFjc3huY2tMRklOMGh1Z2lQT05iMVpVWjhraWJL?=
 =?utf-8?B?aDdMVlhCUStlRExyd1RENkhLa3hBMDBab0pKTG1ubEtrZXFlSXVuN3VzTU5o?=
 =?utf-8?B?OGFpTVhUOGhJWXhlRWd2RkRiQS9RdGVUaGYyZ1VsNDR0VDR0M250K1Bxb0ov?=
 =?utf-8?B?LzhpWFk0RS9PMlJkY3F2cUl1TGNpaVdOY0o4aHFkZm9nRzRhejRVakdLL3Q1?=
 =?utf-8?B?elJZVXFibWdWb1lUVFFtTDRIS2NoY0FBSkdFTVJuUFkyYWphMjQzNDRKR0Vl?=
 =?utf-8?B?WllvN3lVbnJ0MEFPZHJ5TUFvWEMvOFJjR2tFbzVJTnN6NS85ZWQ1TXRKTmgy?=
 =?utf-8?B?RFV4RUUvWHR1ckZ1VE53Qk9qSjNGMENCcTdyM3QvVldEZWszNDVtSEV6V1Zt?=
 =?utf-8?B?K1NXSnk4UE9WL3RoUGZMcTJpTm5TSjcveERJM1NRK1ZDSjRBZjRHTkU4Mm85?=
 =?utf-8?B?ZXFNam9EaHVMaEluVlplUndsdFhLUjN0MHBkWEx2Q0k2Wk0xWWMzWmhuNjRm?=
 =?utf-8?B?bmxRa1hhL2MzYUxOdWFyS0tHTVQ1T1dTcHRwTTdWYndVbFJJTjVvNGZSMkt2?=
 =?utf-8?B?SFFOcTdsdTNaYW4vdXR2Zmh3SE9rYUpma0UrenVlbXpNRnRpREJFbHduS2Vy?=
 =?utf-8?B?WHpmeDBTLzB1ZTFkOUU3eWFiaTdHcEF5NjJ2WjNzWWp1NHdhK1p2WmxMYTFp?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a822e4-33c0-4efa-2cac-08dc231e1f23
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 12:05:45.9483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/PrsU61A+apEfdmXsPDVDTe2JUkgq1zJcLorhfojO0swOT9Ddr/I34Lc29b5NZfAa6Uvq55RCs+Dr4bDsbegxn3AAvrCO95bVzm2LK+ATE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
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

On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> Tiled surfaces have stride / aligned height constraints. Currently
> blt library has limitation and doesn't work properly when surface
> stride is not valid for specific tiling.
> 
> As an example lets say we want to copy from linear to xmajor
> 33 x 33 x 32bpp surface. Xmajor surface expects stride aligned to
> 512 bytes and height to 8 rows so this surface will occupy 512B x 40
> (128 x 40 x 32 bpp).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik <karolina.drobnik@intel.com>

Just a bunch of nits, nothing major.

> ---
> v2: Fix stride/aligned height calculation for Tile64
> v3: Fix stride calculation for xmajor
>      Make helpers public (fixes compilation warning due to lack
>      or static function users)
> ---
>   lib/intel_blt.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/intel_blt.h |  4 ++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 25d251c4f8..13b1dbba4f 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -521,6 +521,70 @@ static int __block_tiling(enum blt_tiling_type tiling)
>   	return 0;
>   }
>   
> +/**
> + * blt_get_min_stride
> + * @width: width in pixels
> + * @bpp: bits per pixel
> + * @tiling: tiling
> + *
> + * Function returns minimum posibble stride in bytes for width, bpp and tiling.

"return" is already described, we could say "calculates minimum possible
stride..."

> + *
> + * Returns:
> + * minimum possible stride in bytes.
> + */
> +uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
> +			    enum blt_tiling_type tiling)
> +{
> +	switch (tiling) {
> +	case T_LINEAR:
> +		return width * bpp / 8;
> +	case T_XMAJOR:
> +		return ALIGN(width * bpp / 8, 512);
> +	case T_TILE64:
> +		if (bpp == 8)
> +			return ALIGN(width, 256);
> +		else if (bpp == 16 || bpp == 32)
> +			return ALIGN(width * bpp / 8, 512);
> +		return ALIGN(width * bpp / 8, 1024);
> +
> +	default:
> +		return ALIGN(width * bpp / 8, 128);
> +	}
> +}
> +
> +/**
> + * blt_get_aligned_height
> + * @height: height in pixels
> + * @bpp: bits per pixel (used for Tile64 due to different tile organization
> + * in pixels)
> + * @tiling: tiling
> + *
> + * Function returns aligned height for specific tiling. Height returned is
> + * important from memory allocation perspective, because each tiling has
> + * specific memory constraints.

I'd move the comment on Tile64 to the description body and integrate it
with the last sentence. You could say that each tiling has constrains
dependent on bpp and mention a different pixel order for Tile64 as an
example.

Apart from that, it's looking good to me:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> + *
> + * Returns:
> + * height (rows) expected for specific tiling
> + */
> +uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
> +				enum blt_tiling_type tiling)
> +{
> +	switch (tiling) {
> +	case T_LINEAR:
> +		return height;
> +	case T_XMAJOR:
> +		return ALIGN(height, 8);
> +	case T_TILE64:
> +		if (bpp == 8)
> +			return ALIGN(height, 256);
> +		else if (bpp == 16 || bpp == 32)
> +			return ALIGN(height, 128);
> +		return ALIGN(height, 64);
> +	default:
> +		return ALIGN(height, 32);
> +	}
> +}
> +
>   static int __special_mode(const struct blt_copy_data *blt)
>   {
>   	if (blt->src.handle == blt->dst.handle &&
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index d9be22fdf4..e3084dc0cd 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -212,6 +212,10 @@ bool blt_block_copy_supports_compression(int fd);
>   bool blt_uses_extended_block_copy(int fd);
>   
>   const char *blt_tiling_name(enum blt_tiling_type tiling);
> +uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
> +			    enum blt_tiling_type tiling);
> +uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
> +				enum blt_tiling_type tiling);
>   
>   void blt_copy_init(int fd, struct blt_copy_data *blt);
>   
