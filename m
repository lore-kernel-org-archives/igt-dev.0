Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F1FEB1069
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 15:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F2110E160;
	Tue, 10 Mar 2026 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFerJcy5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EBC10E160
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773155353; x=1804691353;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iB4S6Fogng0kvE6Q8eM2UHkd6Ze0w/muP/tJmavWmSM=;
 b=ZFerJcy5TxlIHepooRAgCOh/fQGhmmM8gj56+Gq8L268IFmn3BInnGIO
 s6Wl386bHb18+XbfkjvUa264MpYfkiHW2mtd1+Bgxh4bTdspPr4w6ACdf
 sHtX3blhBcYU8soamFCzMagrLlDalBeZ5rio2URFg1k5Xx5myIfRUs1cd
 CcYPfg7ob2D3CRoYJl5nVNQI9CQugSP23jkVhrOvGvKYGFpOJfFZdTY3b
 hKv8f0iRu43kyEPHTjg8Hy6U2NNXhTqPqJktKRBRIA2qTDfU9IhcUcq84
 jCqnSFsepdQ7DKMfeNkYydeNGGXq+na5JRG7K023p2TVTov85IpM2bDub Q==;
X-CSE-ConnectionGUID: ma8Hd8PSRnKad6/uFmTUBw==
X-CSE-MsgGUID: lOHPBlNbQwO1Q3EN5S8TOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85295019"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85295019"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:09:09 -0700
X-CSE-ConnectionGUID: /UJ8Nj/lRriADF+MYXZ/wQ==
X-CSE-MsgGUID: 9ndKeHf4SriVvk3M0YGAJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224325882"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:09:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 08:09:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 08:09:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 08:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeMo1/QXCVdN/f+z5EW+ZZR9POX19y1EqkxLVLQuubA9yGncuVu2X6MSh5pYHNfz7+DBSt3dsdjSxhzausZRfRqAfkAuwFuOKiEAU+OJLcXdiHZM3gURPby3GK+iCBWhC4dh6vKNU+XXQKR1wC8GEasOfC6Zp1CS2kOOq7OLeRJusxfmGhsCPpTc6lcn4lbP/hvL/80x6f4eEcWkiRken3pZ9fzTZ6Ifc9x6EQ1yXuex/d8I4TEP1xYdbrLYt5NjhUQv65RRVdexPiyUnZODfcMMUJpW7vWwGaLn7oY2/zAlQrpPxEsfdiDilsHMWlevfJLTw/oLH0oN17iSwKQBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZPtcAT7EAf9LM5lE9N9/iv/vgUF2q8ZlOR5ZcyWLiI=;
 b=dk5k+Bq675UXnEKPQ/aHU8/jZF8tCRNPP+d2QJuEtevlZbEfL6e4K4zWqld3792dwLdVKLK2w16bFlwSa/1QfHfVH7R5QA8RG99EQxY8MliYTlSUqOX2rzj5M3Tr8IlkGAQ7INybYpCgyAyg+8fI2tOzm/RG3Z7M2/hN09M1qigfSbGHJbFHwLN3soJfj043EJeUYYhRnj5/NT3j6pHl6Nq2+I4wy1MDyEg8fhRhH7vc7HO+5jHshCuESlhCVn07d6VGHNabVAd9/HfTV+3cd9m2kTkv2eja6ZrEL4H7Q8abvdHW91WsJqtdQ/VZqGk+akbHSlQFqnDnlTdJnNA25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 15:08:04 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 15:08:04 +0000
Message-ID: <2f87eb4b-8aa8-463f-9b45-36453b48d0df@intel.com>
Date: Tue, 10 Mar 2026 20:37:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Use lowest mode for crc
 subtest
To: <igt-dev@lists.freedesktop.org>
References: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260309082450.1897617-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bca277e-6140-4a9d-7e46-08de7eb6d410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: eRu8pOx+JIqboXs3sDtrNfUVBU0K2PPbqOASdotNW76GbepkINeziBj21LJIQTPRBMOwlLBToKTGJmKUgqHZ2LX6xB5PrK8kdqP7bBFcOcadBsCdX9dM/GuR3yyZ7cs2XOkGkY9L///xmPkt6Ow7OHJWtFrSm3so1QjSDjjN2+CBLAsgjhsVWjD4slrIwdxPBnDa/X6NC0Nlp7e/Se11t6uNdiLGW/d4y4De8bHGi0tXn86AMYPVJOKnSmub+xHMMjLSj+FWlbsG8itX2mtTJaHUAGw/CJ0ZpQqtFray0BwHEuDaNRgYdaBwUvtWWjrY2HkSJyQXc+ICenTNwZztdND5uFm5r8dSrlxRDKmY06I6C015SNGv2I/0dtD78s0BRsfJSY85/pKptfNPhsa4BgH1KcpIhMzvJnlWmi+Ogwvbi+1hZJAR97JvBgv4G5HwQ+WcpGmeQrdc9Fvxpldl+43vOifF0dmsTuXFFnEyls8Vb90MbEtSDQ0AGVFo7JfpXnwOQ7jsHnv+Lhq8F6UOOkHIWA0lIm0gKpDqYoKBtSw8/yXepmakFO0se64Rhs9Q9cTqjXIm/wCtAFcsw1UFHbuzKfY9mZ4I9N1v/3ABgrb73dNh5ywVzSL9cPBkhnqs4Kfhyaii9POXbPdR7Ph/FiXefC5piWZQJdj8AA70o90zWbPN5Y9+i8jq8/mWi9RWfJDZIZpuZxhP4s8yLogVtZXx9/ip0qKZIfGvQqhrwKE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGFXaGZqOGNxcHN0S0pnSzZLRzkxWElOcFFyV250WXNxM1A2K0Vrb3ZYTE9W?=
 =?utf-8?B?ejlsWEZQbjFoSjY0VHU5ZnowdkhjaGpGNEplNjlsZFc3eUV1RnA4TGhGNnJr?=
 =?utf-8?B?czloZ1hVWlVibU5saDVHZERYNzdZbDdEajFoakN6dldLT1gzdUUyQzZvaWpn?=
 =?utf-8?B?LzJMWGIwUnNIMjNwa24wdnpGNklGMkVxMEx3eDcvUTZJdWRZUW1nNDg5YVh6?=
 =?utf-8?B?Z2JoQmhMU3dXOVE0aGlKVjQ0Y2lRNXNrbW5tSmtsbWNaNnpXYStVZllGZmNt?=
 =?utf-8?B?cUpDVW5MZDRHWmJWdFZRV0JxVDRhQUNkZWNKM3lvZDI0ZDZXMlNtTHBUb0ta?=
 =?utf-8?B?a0thT0k3Rkkrd2JWYXo1TitPWlF4NVZITXVGODJyU0t1LzR3ZDdwMnhPc1Ba?=
 =?utf-8?B?MnRYSnBZTlZkUWlqcUtkM1l1SjBwSEUrQ0RXYk5YMDc1UDJKL0QrVytTdjFD?=
 =?utf-8?B?NHVxQjJpZzBKcW1tZFJSOC9QMDZPQlhGY2Z4MmZZS3hTeXV4WnZvYVIxb1NN?=
 =?utf-8?B?Q0RJSC9lOFl6OTFBM1ZHNEp2RGhQVU9pczN0eGczNlA5aTBJUDVUdENqVmE2?=
 =?utf-8?B?UnVNNHZaZmZEdmlPa29hS3NnVmtDa3R5STE3cDZjZ0FTUE1abktPNnpTRFpw?=
 =?utf-8?B?cFB5TTFkV1M0ME9pcE9DN1RiSTMvaVF2VEIvQnMyUGZ6dThKTE5BUGFrUzF0?=
 =?utf-8?B?Mm82VjNnWUtYR1habktieEUvdHFZcG5nVHBnblVKczV6alNmSitkc0lhZFJN?=
 =?utf-8?B?UnRuNi9PZW9MZUZWcHlET2RrYVRIM1RpeVVzblBOenRuYk5jZzZtRUFneUNy?=
 =?utf-8?B?SzZKazRDR1ViRTltVDFRUmtIWVlFT0hZWDRvc3B2cWR3TjdZOFplR0d4bTVM?=
 =?utf-8?B?TkkraTBwSjZuTTRSSVZ6Y1dqMkQ0L2hXQXc3ZDhmeDNUOTYrUVNORXBHOFhS?=
 =?utf-8?B?UDZKSEg5TjBXRlJmUmZZVWwvMEV5UDcvUDlJRTlHOWtNNDVwWndVZWdqMFU0?=
 =?utf-8?B?SlB2ajdMV0xNQ3ZVNEcxWllmbkNwNzRIUVgyb1dwOUZDTGg0Zko4RGtpK1lY?=
 =?utf-8?B?ZTRPcjVXWjhRZGs2ejQrMXFUZWZMN1dDcktiaHZOT2dUb3hwY3ZVQnlZcno0?=
 =?utf-8?B?MktjWmptdFlodVl1REYzYzhiWXlXdUJXNEhtUXFsVkdqQ1dEcUJTRUJBQ1N3?=
 =?utf-8?B?WHEwNDhxRDUrV2RiMDZuNjNVdjdVVFRPWFZYNE03S1hYa1RoUXZNUGxtTGhw?=
 =?utf-8?B?L21nV3hNQjJON3VlQ3BkTWhVVHFiME90K0Y4dC9rL3hTV3gxTFJpYnQ5dFJ3?=
 =?utf-8?B?Y2FjL3dnWEtmOHVBM0lXSDhxOGlJRDZLbmY3TnpmcDdJcXEzNEtpbWwyeXF6?=
 =?utf-8?B?Wi96ZFN6eFByYjhVd0xEZTQzSnBFTDZFd3gvbEYybFRGR0ZVeUZuZ1NadEEr?=
 =?utf-8?B?UWxnK2tLRFBwWTl4UWlKZngvUXJMM1hBMWkxNE5VdmtMdnZJK2hORmNSeWNi?=
 =?utf-8?B?a1NiVnh1MXdYdU80KzZpUXJNRVF5V1RYeU1iNmZ2bWdTNXlKQ2ZnYk42TnNi?=
 =?utf-8?B?ODNBSXFjN3dhRGxZSXFHU2ZkVjl0emthdmdQVnZjMFRiMWNweVdXbWhxb1JS?=
 =?utf-8?B?UU1RT1B0TFZDUnBabU9jOGV0QWlTZ1pSYzJWME9oKzVXc1RsdGM3V3ZFUnhN?=
 =?utf-8?B?THlReDJCajhLd3MxaDFnLzZwbEZxbCt5dWxwNjRPR2lHTmdob1dzMTlkYXRZ?=
 =?utf-8?B?bUJZcTQyd1NSazdId2ZVRnhNQUwrdGRCbFlxSjdtK25LL3E3L0tBOUd1M3ZR?=
 =?utf-8?B?SFZMaGszWkE3UEVnSmw5bHNUb1ZmN1RNSW5YUkhhSXRCdWpBd0c2MXN4eEkr?=
 =?utf-8?B?NUJ1VmdUb2hGb2xNVG9SNzNmQkRNNXpNa3NlcCttMVJrUTVLcmtZR3NpRlhz?=
 =?utf-8?B?d1BjNU1pQ3JzbldZRTNUZkhLcGFKUlQ4TVdoc2YySDNVS0hDczhWOE5pNVZa?=
 =?utf-8?B?ZVFUOG9BVTVaUGZJcXdNMGd6aXFxMmwvYjNWRnB1QUJjdlNZM0UyTkpXOGQx?=
 =?utf-8?B?ZkZtQ2pIUEErc1V4WXRVcUNMWFVTTGtmc2M1QllCdjg3MzUxdHVVTWFwSWM0?=
 =?utf-8?B?M3BzcFRXUUVFMkl5VTV4QWJtRGtHY2RnK3ZZNXJlQ216YlVyU0F6c1ZvaXVZ?=
 =?utf-8?B?TEhXUXFoekdlQ090MU16bWR1SlB5KzhNNnh1VitsTXdmTVVZYnJGT0ducjdL?=
 =?utf-8?B?MzJsSmpYbFNLWGFpVjcvZS9uRVltQkJkMy8raDdSaUt6SithRXI2ekZLMEZV?=
 =?utf-8?B?Y2hPc3F3TkpEVnUyeEwyTnQ2ajBkaWJ4Wkg3TFpVY3N2YUl4RG55UStudVBu?=
 =?utf-8?Q?pYJgSPZVpMKotl2NvG3zLx9kqvp5BtucjH0mkdvXi0FwD?=
X-MS-Exchange-AntiSpam-MessageData-1: at8/URDMZOyJEcXWRv12+zP/d2CGbmHne0g=
X-Exchange-RoutingPolicyChecked: rmL09Dj5oFYetNR+doGmsY6HWyBgdWG9BblLCREuERRVb0uLN3XORiB0DthNAaue2VbgWLsibBCglxuMKGrtWNunrAkDCRQaiGQBRoQdbgeMWqcfJnpTpmtFfkmmq+jOQpil1ZFgG24/OG0a15P8w2P3mPevExVGh6jfUjoFM57ob6AMUIRZ1pMFWul/S0bH5bxt2VBjW1bBZSiIT4aM69sRt5tvUAA/DLuHv/x+38OAObRGAY+b3u99vPzyq84m2VixCrnLQUNxyaQYagmfXW8EXyGcnPE+eV6xk6mWYaJXw48ZAhZF4f+JK1G6SnjN4PvKtzsd6c8CbfXaO779lw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bca277e-6140-4a9d-7e46-08de7eb6d410
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 15:08:04.2852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kChaatr9SBW71Pd8KkjkycEtZG69KJjt5MBAS13SzYnIdEcg/g4XLHFSorJfBdf60qLYVZbxWEww3thJwAzC0WgKGL/at8A9gB81b+5Mw7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
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

Hi Santhosh,

On 3/9/2026 1:54 PM, Santhosh Reddy Guddati wrote:
> Currently The CRC subtest uses mode[0] which maps to preffered high
> refresh mode. On panels with multiple modes, pick the lower mode to
> speed up crc test.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index a42407363..8639e2299 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -825,6 +825,17 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
>   	}
>   }
>   
> +static drmModeModeInfoPtr get_lower_mode_for_crc(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +
> +	igt_assert(connector->count_modes > 0);
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_asc);
> +
> +	return &connector->modes[0];
> +}
> +
>   static void test_crc(data_t *data)
>   {
>   	unsigned int frame = 0;
> @@ -834,8 +845,8 @@ static void test_crc(data_t *data)
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> -	/* make things faster by using a smallish mode */
> -	mode = &data->output->config.connector->modes[0];
> +	/* make things faster by using a lower bandwidth mode */
> +	mode = get_lower_mode_for_crc(data->output);

This optimization is for simulation? if yes, Add a check for simulation 
then change to lower mode. On Hardware it won't take much time. Why  
this time optimization required on hardware?

is any issues seen?

>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
