Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8FDC79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F6010F0A5;
	Wed,  9 Sep 2026 10:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXxqyX70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD5A10F0A5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788949797; x=1820485797;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gc///NipuCfBZdi2R8UAK2nGAOe3iWWnK+lMm9WCxFA=;
 b=CXxqyX70y5OjLIkJMVV9V2poOrhDVOOqJB/IZxfd6mwoK2kGCkrDRzVw
 HNHPu1ykZm/RjeysHpZYCep3BN9gt6X1De+kRVXTThMBnjsIQXF+e0V3J
 Q3BfkxAT1xqljTrtceinLMAk9Us+tpi1ui8N68ihtFKVQ8H451W4aiw5/
 GzofQShDPyConuJDRdCJLkIlaFPdgCxma3ayPO8vkp2EItI201TTjzUZO
 wNtphf1DdtxsOsagv+TXKuwO33puR51UVo6XUSlPfe5QtU/JOwJ1hqxHU
 teP/a54/2++J+f6ytMvi9bQ7ib+S76wqGx7TTViY0G0MSzxYUKaKigwdF g==;
X-CSE-ConnectionGUID: kjiHP1FhTAasDaFhS3CxAg==
X-CSE-MsgGUID: +YXwzke4SNKJ+OQV+gy7Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106740782"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="106740782"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:29:56 -0700
X-CSE-ConnectionGUID: pHP1ifziT32f2NkAGtPJqA==
X-CSE-MsgGUID: xW1Xp+90TJCPabSJBvwDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275418969"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:29:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:29:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:29:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skmXWKZCzaOtx2nD2lNTTYRLOC91DC51atuXXDPecPtxdOEV2tzjAsS7s2fGeI7iC2Abt8TUon0zhST5Vp1OqJ+ox4pHjtcv5J1pfrivz/+xMCZ9XC/Y8xPyXw6eYykvRj1afAuNmvfeaddwqqNp4YLL5jDwRfSXzBMcAi8dkXrPT3xKlBtbHW6SyCspR3mHeu6WbFOD2173GSfq0J5XdSVdwtPv4EwDC4uZRnOjv0VmUQEgyUEqlwIlmIT05LLLHziWN2PGC/GqdjhKPQi6L2U7nD0GnyUptFodSAhfrP83U5k12Djl6zi+hfMcBL1e5qj16h8tkRhx7mu0ZuJ8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJOiI6w8TO67Z8zi92wh6EV2vBBughAr7yzPye+kkR0=;
 b=O+f2IJUXS5DBn/TeblNl6kggJk6bGZnbaogGErFskAQ4hmdzsNmS5z3WEe1YXTOi8iMJAqIWoN9uuBGq9vUIN1B4PwOa38rMwwnJGzOsMyvUpdAkjfzjTM0Gf079kXVBtSZ5c6ebTUE9UDFPPMq9sQetDLy7mjNb0GFXgEAxOSPnxfHmLCTKkXCSKSDQNQP4UziBpnaSuyAAghrW9iDXT2pSXzP7M6CJGWGHpJXI2Psfyc0HBrweN2iOj4Qoqdw47Jo3t+VDbqhtQTgIPGqJT7AqLeAwbsdmlgGh0IzCeIM20uK0B30hvibnjEN8i8vzV2i5oRHtyVgWvfUH1MTXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB9828.namprd11.prod.outlook.com (2603:10b6:806:4d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:29:51 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:29:51 +0000
Message-ID: <1d32aa1a-83f0-4d77-9fa3-f55bd7142265@intel.com>
Date: Wed, 9 Sep 2026 15:59:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 6/7] tests/kms_chamelium_color_pipeline: Add
 FIXED_MATRIX colorop tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
 <20260831192935.463134-7-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260831192935.463134-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: 167e6efd-ae05-45d5-d47d-08df0e5d47b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|6133799003|11063799006|56012099006|3023799007|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4dshOUaNonzdkf6U3JWksHNt6Gz7B/M0kJ59EPqXwSYnbbk0Fly4auypLT+8A7ip1qgD/Zxtiovi9vrlx+Te0BVCo0YX7yIC5rctOQ0m40EKEpBTreRcs4eGs+YTjNwnNKceXdooV/osNoeQMboLbPGlee7F2xShCdyscgeNge/KGU1U3pehsuX171FBuXUSQEeUm9P2d/0XTSld6LlahwAmsD3HPHcr8P+GDI0aCBjQJ8vUS5O4/xFW4KGzhoD09M2k3Si9iSnhtWWq6kFBrfmK7eWgNPT+y3l5faG3bBOLMzKhCJe6ldshtlzVF9zGCxoLrSm5NM1FmdjDqAqg3ulINyM9T30wT/IFD4+nlCsQNEgmaE5UaxetemUZl3i8p8gZqmoMnbkUeeSCSgC9NM63OMfKypLyD/HIrOPhQx10t0o6Dhb2gA63Nf5RDFiTlH00Tp+QRpvY6KeSTBTFCJNxpk6c43A0gP34jg/fvqArWn2ddPIb5O/c5oxNur5qAaB0sZsEfz8FmCAn0eo7sefExgz4MX2Kl+V+obgZv01xyxzK+0O/C4aTLlViQkxW3WuCi5gzqBjYnNzurNU7DHq9eXPWNT9UcXoXpfap76Z+AAcCHx5eOwLN6gJid5R4DvlRMpXDV12yA3LT6OEjAYHyLvTbtGaNetvb72XQGns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajhsazBmaHJDVnNnMmxMZGNGK3haaC85VEI1dG5wWGluVmVSNlpJWmFnRStT?=
 =?utf-8?B?WDhJNThuRi95ZWFTQ1ZiZHhMTW1jMy92am5PTEdqKy90NXdCWkF2VEpRTERt?=
 =?utf-8?B?d0g4VjFWbGlmZldRenR3NVE0RERpYlMrZVlDWFZLa01SNDBaQ29wY002bGtV?=
 =?utf-8?B?WWhsdlIzeUI3dHo5UHd1V0ZMR0c4TjRIV0I0Zk5aZVFTY25jWVk5QW5DNlhP?=
 =?utf-8?B?bEo3bU9kSzN5U0pTbUx3M1VEUEQvSUVneWlmWEFuQ0tXOEZwTjN3dTZMaVN2?=
 =?utf-8?B?akhudUdod2s2MFpEaVBISEwvaWU3YkFqVEFLcHZESmd1R2k0QXRVZzk3d09Z?=
 =?utf-8?B?dlNTRnBFOG10czN3MEhOUVFvbXdsQmhEMWFhaWh5alM3amZyL3grUFpzL3Rn?=
 =?utf-8?B?RGUxNktJV1V0eE1mSmNFVHBuRDkvNGZRQ0lJMlpyL09iR2RDVDdnZHRFT2hN?=
 =?utf-8?B?L3pEWUxyYWZoVGZaa2NKbmF3MEhaYkNlc2VkNVhLZ1JxNWkxSzh1bmkrYXpI?=
 =?utf-8?B?Q05pTVNoRlVRSnRNQitDMXFHR0VYbkQrMzhGc2RldE9lcU5PN25BcElTSk9O?=
 =?utf-8?B?WjE5T3l6TlUzTjBTNkx1OUozOG1naWJxSFNaKzRuQk8yT1F0Q0VBbEdpT1dk?=
 =?utf-8?B?eGZXaU9RU29rWFpjTWdpZnNjRW5xajBhNGZtODRlOGxtbGVWWEZIQTRBb3ZY?=
 =?utf-8?B?aFVyT3pqd2JTdXc1OGMvbk45dEtRZFQ3aTBwbVJaaHYxbmM5Y1Y4MTgycVVO?=
 =?utf-8?B?aVhZVGNMRHBzelExSVpXOStQeGNXeE92cG1TY0JwK3NjOXFvemhZeUpDRFhT?=
 =?utf-8?B?bDRTMzlRWlJleDhEWEZRaytxcWpNdVJkNHRzS0N1ZVhySTFzM3V5L0FXQklK?=
 =?utf-8?B?dnNPOU55NzMzeGtxaHFxdUJZMTd5NktuVmJHNlhmWFlsT2M2eFp5dnpMdWt0?=
 =?utf-8?B?b3FEdjhrWVg3azlwcVBZR0NUSHFPaDRhQk9lcmxpNUw0SjZEQklRdXNyblBz?=
 =?utf-8?B?YXhHeFBjSkV2dWhqMmVLbUVrRmd1WGRrNlhnUmdaYno1M2ozUGZnbFBOQTNm?=
 =?utf-8?B?bC95MWpndi9DcnpDRjdpUExuSnJreU0ydU5JSDA2WDcyTEo5SzIrTmVsU1NY?=
 =?utf-8?B?MUlzRit1VjNmdzFvaS8wbWR4MWM2SGVoNzFHR1lzSmZCVFNpRkV5RTNvangv?=
 =?utf-8?B?QTFJK25Hb0dVaDFNb0ZXTzB3MklicnB4RWlLdUNPWld4R2RsbzRRUXBMN3Mr?=
 =?utf-8?B?KzM3NmN0N3lQcWxXeVZFYXREcUh1cGYxakNScXR6T3pEOVlNM2dNZUZYbWVm?=
 =?utf-8?B?SkY4SDQvOTdtcndTYmd6cUpTR0E4RWJYbUtYRUFqS2M1YVNHbEdCN2lWWW1G?=
 =?utf-8?B?ZGZ6K0NsQ1N1d0FEQ0xxZnJIWWFQdTB1TVhuelBwQUdhZVlpcjQyNmxyN0R3?=
 =?utf-8?B?SU8yb2RVbisxcmlnUVJhVCs4czRCZ0lRM2oyUUxlY0lQeDR2MUVScTFKK3JB?=
 =?utf-8?B?L1h5RlFCd09pNy9BUktmdEFwVkdGMGM4WjdWVnlSZEtWRlJsRlduY0g0aEZh?=
 =?utf-8?B?VGczNjFDVFpBZmFjTU96UEhmdUt5SHUvRTNZSWRKNGo5VlFMS1U5VkMzMjN1?=
 =?utf-8?B?d2pNVWxIanpJRFhtaE1uK2VjNjJpVFp3eUVJZVh6aFpvbjk4ODJXMHdTdGtE?=
 =?utf-8?B?Y0RGT0VTMTFGbVkzUmplVW44TG1DNlQ1azdsejdlNHU3R29LOE5vWGFPcGN0?=
 =?utf-8?B?K0RoekVjaXFFMkVaYnpTMTVaVlZCSzRRQy9KL1dkTTNSOXQyODN2SnVyY1Jp?=
 =?utf-8?B?dFBoam5FVVVxUXo0RlhJN00zTHBaNEJLZnNPRkU0U2tGWithb09NblRMbk5p?=
 =?utf-8?B?SEwyUmpvdlpLOVRNNkFhbVVxOTQyVmV2dXQ2US9hSEZTVGpxSWFBbm5wTFdR?=
 =?utf-8?B?V1Y4cnRvNlJLcmxwTUNzamN2SUJZOWF1SjU0a3gxeDM0VHNSRU5PdWtyMHQy?=
 =?utf-8?B?M3lNZHZQSTVpRmIxK01zVWwwWDl2V2FwbWNSdW5LUHVzdHNmVmtZV2d4enpP?=
 =?utf-8?B?dXNKNGF3WEs5T2MzQ2hwb01oUitEcU5pOHFCcCtnaEt5T3hybUxMZ2pBVGlY?=
 =?utf-8?B?bjhWMDNpTytIUzBDNW0yZTFRUTIvM2VGOTlxR0QvK3poSFFDbmI3c0UvUGhn?=
 =?utf-8?B?OHpiZUFQTmc5aUlxaTQxdXgrTW91ampCYzZYeWlURFhWN3BGdjdMZU9hVExp?=
 =?utf-8?B?bm5GcCtOQUZlTEJ4S0ZIaFQ4cUVvRVNQUFdycWlVUG5nb0N4NEI2TnJoNXIw?=
 =?utf-8?B?Ym5haWgxNDlaTVRTWkJuTzRmem1IdjQvSUZyZW1zdkd3aVpkQTNMeHNtRVhv?=
 =?utf-8?Q?B3SyArRW4JSDAOUs=3D?=
X-Exchange-RoutingPolicyChecked: QSiYJ/mn6vMTQ3M2aCLlFqGMpV9M+rNGgnRn/NYJTZnF1LTtrFvPBZOjoGMd7PxmgHbTBEcBp/XnCIScqtCQDuUygyMx6ETZV7Syam96d49/H5dWhWQbmPsBaL0O5uk/jwhu9OXrHoF07YFYrIgPoYJwzXVf4oLgou/VNFF0w4HAv2mAdknFP1Rrst69FzKLfYI3M9iPHBTC3JbsgTQydhzjR/rHTpKRqsDvEtOdMe1t/yvh9jEpXsSrd4Mp+BS2bDLkvkDBm93/SDLm/QV+ml8Q2wWNjQRq6PzrjD9p6ABz+YZmE2b5nMSnLmRuScnhYCubA8Leo/QoItAJ+09wMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 167e6efd-ae05-45d5-d47d-08df0e5d47b0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:29:51.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmB/yH632k0mkfYC636yreAM1WmWKBWr2vH52oB1JL+NDmS90Bu7GzA4yyE/z2wrxScHSARKGI4e5t3IpmRjqrz45rbVz898PxGs8T/6n0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9828
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



On 9/1/2026 12:59 AM, Swati Sharma wrote:
> Add Chamelium frame-capture equivalents of the FIXED_MATRIX colorop
> tests from kms_color_pipeline. Unlike the pipe-CRC variant, these
> validate the output using chamelium_frame_match_or_dump() with analog
> frame comparison, whose tolerance accommodates the small differences
> between the software color model and the hardware fixed-point matrix
> that a bit-exact pipe CRC cannot.
> 
> The SW reference framebuffer is computed by converting the YUV input
> through igt_fb_convert(), which internally applies igt_ycbcr_to_rgb_matrix(),
> matching the reference computation used in the pipe-CRC variant.
> 
> New subtests:
>   - plane-fixed-matrix-yuv-rgb-bt601
>   - plane-fixed-matrix-yuv-rgb-bt709
>   - plane-fixed-matrix-yuv-rgb-bt2020
>   - plane-fixed-matrix-yuv-rgb-bt601-lim
>   - plane-fixed-matrix-yuv-rgb-bt709-lim
>   - plane-fixed-matrix-yuv-rgb-bt2020-lim
>   - plane-fixed-matrix-yuv-rgb-bt601-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt709-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt2020-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d
> 
> v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
> v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
>       until we have non-IGT userspace that shows their use
>      -Rename subtests to yuv-rgb-btXXX with limited range variants
> v4: -Revert colorop_type_only() back to ctm_colorop_only()
>      -Reuse _test_plane_colorops() for FIXED_MATRIX instead of
>       separate _test_plane_fixed_matrix_colorops()
>      -Move cleanup before assert so failed plane doesn't affect
>       next plane
>      -Store encoding/range in colorop fixed_matrix_info
> v5: -use igt_crtc_name() instead of kmstest_pipe_name()
> 
> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../chamelium/kms_chamelium_color_pipeline.c  | 279 ++++++++++++++++--
>   1 file changed, 252 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> index db6107221..c69783450 100644
> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -34,6 +34,26 @@
>    * @lut3d-green-only:		3D LUT
>    */
>   
> +/**
> + * SUBTEST: plane-fixed-matrix-%s
> + * Description: Test FIXED_MATRIX colorop for color space conversion: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @yuv-rgb-bt601:		YUV BT.601 full range to RGB BT.601
> + * @yuv-rgb-bt709:		YUV BT.709 full range to RGB BT.709
> + * @yuv-rgb-bt2020:		YUV BT.2020 full range to RGB BT.2020
> + * @yuv-rgb-bt601-lim:		YUV BT.601 limited range to RGB BT.601
> + * @yuv-rgb-bt709-lim:		YUV BT.709 limited range to RGB BT.709
> + * @yuv-rgb-bt2020-lim:		YUV BT.2020 limited range to RGB BT.2020
> + * @yuv-rgb-bt601-lut1d:	YUV BT.601 full range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lut1d:	YUV BT.709 full range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lut1d:	YUV BT.2020 full range to RGB BT.2020, then 1D LUT
> + * @yuv-rgb-bt601-lim-lut1d:	YUV BT.601 limited range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lim-lut1d:	YUV BT.709 limited range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lim-lut1d:	YUV BT.2020 limited range to RGB BT.2020, then 1D LUT
> + */
> +
>   IGT_TEST_DESCRIPTION("Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC");
>   
>   static void test_cleanup(data_t *data)
> @@ -103,45 +123,63 @@ static void _test_plane_colorops(data_t *data,
>   				 const color_t *fb_colors,
>   				 const color_t *exp_colors,
>   				 kms_colorop_t *colorops[],
> -				 struct chamelium_port *port)
> +				 struct chamelium_port *port,
> +				 uint32_t input_format,
> +				 enum igt_color_encoding encoding,
> +				 enum igt_color_range range)

too many arguments, same as the non cham tests.

Other than that, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

>   {
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_colorop_t *color_pipeline;
>   	struct igt_fb fb, fbref;
>   	struct chamelium_frame_dump *frame;
> +	bool is_yuv = igt_format_is_yuv(input_format);
>   	bool ret;
>   
>   	color_pipeline = get_color_pipeline(display, plane, colorops);
>   	igt_skip_on(!color_pipeline);
>   
>   	/* Create HW framebuffer */
> -	igt_assert(igt_create_fb(data->drm_fd,
> -				 mode->hdisplay,
> -				 mode->vdisplay,
> -				 DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR,
> -				 &fb));
> +	if (is_yuv) {
> +		igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
> +						      mode->hdisplay,
> +						      mode->vdisplay,
> +						      input_format,
> +						      DRM_FORMAT_MOD_LINEAR,
> +						      encoding, range,
> +						      &fb, 0, 0));
> +	} else {
> +		igt_assert(igt_create_fb(data->drm_fd,
> +					 mode->hdisplay,
> +					 mode->vdisplay,
> +					 input_format,
> +					 DRM_FORMAT_MOD_LINEAR,
> +					 &fb));
> +	}
>   
> -	/* Create reference framebuffer */
> -	igt_assert(igt_create_fb(data->drm_fd,
> -				 mode->hdisplay,
> -				 mode->vdisplay,
> -				 DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR,
> -				 &fbref));
> +	/* Paint test fb */
> +	if (ctm_colorop_only(colorops) || is_yuv)
> +		paint_rectangles(data, mode, fb_colors, &fb);
> +	else
> +		paint_gradient_rectangles(data, mode, fb_colors, &fb);
>   
> -	/* ---- Software reference ---- */
> -	paint_rectangles(data, mode, exp_colors, &fbref);
> +	/* Create reference framebuffer */
> +	if (is_yuv) {
> +		igt_fb_convert(&fbref, &fb, DRM_FORMAT_XRGB8888,
> +			       DRM_FORMAT_MOD_LINEAR);
> +	} else {
> +		igt_assert(igt_create_fb(data->drm_fd,
> +					 mode->hdisplay,
> +					 mode->vdisplay,
> +					 DRM_FORMAT_XRGB8888,
> +					 DRM_FORMAT_MOD_LINEAR,
> +					 &fbref));
> +		paint_rectangles(data, mode, exp_colors, &fbref);
> +	}
>   
>   	/* ---- Hardware path ---- */
>   	set_color_pipeline(display, plane, colorops, color_pipeline);
>   
> -	if (ctm_colorop_only(colorops))
> -		paint_rectangles(data, mode, fb_colors, &fb);
> -	else
> -		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> -
>   	igt_plane_set_fb(plane, &fb);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
>   
> @@ -156,19 +194,17 @@ static void _test_plane_colorops(data_t *data,
>   					    &fbref,
>   					    CHAMELIUM_CHECK_ANALOG);
>   
> -	igt_assert(ret);
> -
>   	chamelium_destroy_frame_dump(frame);
>   
> -	/* Cleanup */
> +	/* Cleanup before assert so failed plane doesn't affect next plane */
>   	set_color_pipeline_bypass(plane);
>   	reset_colorops(colorops);
> -
>   	igt_plane_set_fb(plane, NULL);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
> -
>   	igt_remove_fb(data->drm_fd, &fb);
>   	igt_remove_fb(data->drm_fd, &fbref);
> +
> +	igt_assert(ret);
>   }
>   
>   static void
> @@ -191,7 +227,8 @@ test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>   		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
>   			_test_plane_colorops(data, plane, fb_colors,
>   					     exp_colors, colorops,
> -					     data->ports[port_idx]);
> +					     data->ports[port_idx],
> +					     DRM_FORMAT_XRGB8888, 0, 0);
>   	}
>   }
>   
> @@ -345,6 +382,191 @@ run_tests_for_plane(data_t *data)
>   	}
>   }
>   
> +static void
> +test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
> +				 const color_t *fb_colors,
> +				 kms_colorop_t *colorops[],
> +				 enum igt_color_encoding encoding,
> +				 enum igt_color_range range,
> +				 int port_idx)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
> +			_test_plane_colorops(data, plane, fb_colors,
> +					     NULL, colorops,
> +					     data->ports[port_idx],
> +					     DRM_FORMAT_YUYV,
> +					     encoding, range);
> +	}
> +}
> +
> +static void
> +run_tests_for_fixed_matrix(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +	int port_idx = 0;
> +	static const color_t colors_rgb[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "1D LUT (linear)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t fixed_matrix_yuv601_rgb601 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 to RGB601",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT601,
> +			.range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 to RGB709",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT709,
> +			.range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 to RGB2020",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT2020,
> +			.range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv601_rgb601_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 limited to RGB601",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT601,
> +			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 limited to RGB709",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT709,
> +			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 limited to RGB2020",
> +		.fixed_matrix_info = {
> +			.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
> +			.encoding = IGT_COLOR_YCBCR_BT2020,
> +			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +
> +	struct {
> +		const char *name;
> +		const color_t *fb_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +	} fixed_matrix_tests[] = {
> +		{ .name = "yuv-rgb-bt601",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt601-lim",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709-lim",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt601-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt601-lim-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt709-lim-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, &lut1d_linear, NULL },
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim-lut1d",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, &lut1d_linear, NULL },
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(fixed_matrix_tests); i++) {
> +		igt_describe_f("Test FIXED_MATRIX pipeline: plane-fixed-matrix-%s",
> +			       fixed_matrix_tests[i].name);
> +		igt_subtest_with_dynamic_f("plane-fixed-matrix-%s",
> +					   fixed_matrix_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!crtc_output_combo_valid(data, crtc))
> +					continue;
> +
> +				port_idx = test_setup(data, crtc);
> +				if (port_idx < 0) {
> +					test_cleanup(data);
> +					continue;
> +				}
> +
> +				test_plane_fixed_matrix_colorops(data, crtc,
> +								 fixed_matrix_tests[i].fb_colors,
> +								 fixed_matrix_tests[i].colorops,
> +								 fixed_matrix_tests[i].colorops[0]->fixed_matrix_info.encoding,
> +								 fixed_matrix_tests[i].colorops[0]->fixed_matrix_info.range,
> +								 port_idx);
> +
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
>   int igt_main()
>   {
>   	int i;
> @@ -404,6 +626,9 @@ int igt_main()
>   	igt_subtest_group()
>   		run_tests_for_plane(&data);
>   
> +	igt_subtest_group()
> +		run_tests_for_fixed_matrix(&data);
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

