Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F31CA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84B10E22A;
	Mon,  5 Oct 2026 06:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="henZeB0a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFFF10E22A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791183162; x=1822719162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SQnBbsSyUX2ZyyE0YOY46QCmpYCTxPVTm3URbZqizxw=;
 b=henZeB0aOrnwXzSElQ3MbIyX96SVxbZFD0+OzHxUSG3/cl2cMVnaSJiF
 a/7BfNDL7P2Aa0EeaeCcmFeQuEHILb/VZJwqAmZPzeLVI/dBXbo7SkhoE
 7DdfxO0BPmIdc8tkpg1LE2HszEWBSEZb+UoUHEwTEmCA1LpsMpRk9e4Rx
 1jdzmEnpT9P3Dkp1scPKpwlZiz4mL+VQJO+I0sz3iY3li4NZu2NE70eqh
 QlVj5Jo7qyutqociWwfEnECeTw+K9bBB62txGBo+bZXHAZ6JMKAA7p7VV
 HVX7gL4mQ9L3ARxzGA96GwELfFXC2Y7NO6b9tca0jWnDknaXoGEajdd+e Q==;
X-CSE-ConnectionGUID: vDvYJA0SQKOwMvxsFSpgAw==
X-CSE-MsgGUID: 91TfYnuhQsKqVh+4a+3M8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="95657653"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="95657653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:52:41 -0700
X-CSE-ConnectionGUID: MHucpEA3RSixsKADwFweeQ==
X-CSE-MsgGUID: mqxM7RoqT46FGZ8KqFb/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="276294633"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:52:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:52:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:52:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIP0p8/KcY1F8y9nKkbGyPfnVHPZjQRjG/5mTn5PSlyCPMrB2VcfBPW3xcBHnZsOF8FsgU0joUYrMThzZVODp2kyU9n+NFcsqLBSQmHCoHay3pFBC+tobvM8nmsTmP0rvwrvdq2w2ZuURzKH1P0MFx4QNQxhJRGlIwEf2NdbI8UFs0r8rFWA5j4CjM6VmlF/78LktibUhNCXzMuxAUWaOE0BGY91lKl2Tt9J1howYM/uDam6SXLGNvUanjP0P4Q9PpElPQqtQpQw4PK4Axp+n9fa6O5US4PwLe089WmGrROujFgnxMvkcCgRndkJH8oIxZhqrXOZhGeZEYB5977qYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u4CuecZ8zLmgexPlvEg8ChohnN7btb80nCs6qH/A4A=;
 b=UFOw7T0Xp5OgOCa1/7w4nL24YkvpQXGJnjH2IZRfuLrdadp6quy7TT63cx/hjUAoddxHqn+yKkFB3r0LC24xKHqt5cmBOwyWp+mTKt1IXCXlsTKBSwzMHw0/UEsMVA1c2erRmJM4UWWPsB0bHB3VPqVcoQlCDVxJqCn7xKwk990QV3SJ6ys2JaH037nxW68Ae8lt0txyJLy08ytREhISNF3El2hwSLfSlOF2c4bsrVgMCKe0UZVe0e1c8751qGkFK/CWi+TUthOjjuSppcogeICX29TP7hVjRcK9HZQqTbILocwQyncLSzoP/AcTA+84/wiaV9fbm9kO42Qlfy/tdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 06:52:31 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 06:52:31 +0000
Message-ID: <c20b0a62-82a1-4efb-b76b-dd17f8fcdeb5@intel.com>
Date: Mon, 5 Oct 2026 12:22:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/i915_pm_rc6_residency: make residency ratio
 tolerance symmetric
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260929172810.2077612-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260929172810.2077612-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0240.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4e2ee7-d5fd-41dc-3556-08df22ad3a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YeZaTb06Nzc6X9TpBdftayfaT6NuOC1Zwg1Zo+gfiUq2hu9SCvwIfRdGpqFUqmnXlQkR4tsVGcpcyTkZS+rKwf5L4PmBVnpt0IHZn07EaplmmWhnv8DnDZzz3mNNWjriTofvMnxjSLqydhAZAbS9fSBIuiWLJ2rsiVfMP8JDIVMLqVB6FpXjEyLoMiuO+wnZk5gej5G/wtYMJtcs25RW5OOAYcWid7nwVfOTRvW/xbT3YNpUM2By/yQDbzADCDv+7XyuJNMJSx1r7KT5BpWLF6DdFQ+qHlb9C/SmfaUCIX7ji/GiAvxgV0VsaEe+VOsB7iOIoMxxtRsNYlAYO0+xSQ7dW56x868YMxRFlfwkIiy6kkB1PenEEBM2MR50r54FYZx+CV6GT89TLfLt0vbjFk9xikhqlN1XS8bDfFEc+lZEP/fARRQtAE0RfNE0T0tSUGu5YRWfsB9Fum+iWWCcR7mpO+jWeOc4KbQi6r7dVKbVZVRfopjwMfB8m/X3EMNnherMPVWzeSuRTAfKjJ5GLy9LFDPxx57kzZ2d/L3cbHRocZnJNA2+8aMsEXaPKIETU7P9vODNYlMEk8WAvjQ3uIMOGu6g+TwLadCnz8w0taWGWMWXP0rlzu0AYwQsDxpu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXQ3TEVnVXpFTjh6dXFuVCtVNFBzZFhHZG1aVzVveFhPN2ZMdkNYd2FwbHRx?=
 =?utf-8?B?eFlXYjgyNzJuKytNTkYzdlBFbTQ3NWhsRHFpVFNNUlVYcUJvYUlDRXVlU0hU?=
 =?utf-8?B?MHdBSlpNOXlVMSs4SEJyVHRqM2c1eWVnZEdrYjl2RjMwbWR6R3FIS1Q1ME81?=
 =?utf-8?B?a3puOUtpV09Vem5zV1YzVzhFWlE1enNsOTVSLzVBVEJiYVFVNEwrT2xoMmJ4?=
 =?utf-8?B?eTNWNGlhYmM1TTZCMml4Rm1sbWRMTG11ZHV5Z0ZGSmNrdlZYbFNSaUppeXlS?=
 =?utf-8?B?djlxYm9WY2g4dS9kN09XbHlBdHRtNTVKSWtKaUlsMHVodEJ6YVJLY3E1QnM1?=
 =?utf-8?B?bHZuQXJCS3NQQWE5RFVhRFhGY1hUYzhQZWdFOFNCVnRjYzU3T1lKOWpFcllO?=
 =?utf-8?B?dUtETHZkczdmSEdRODQ3QUdJMGFLWFBNUUMrRFVWM0JqVmx3ZVBUa0M3MWd5?=
 =?utf-8?B?aUJNSDVuRHVsWkowYXVSeGtXWHNhS0tkOGc4eEZ0QjhXTzZCTit1TzhrVFpl?=
 =?utf-8?B?L05BekR6Y2xGWG5FbFdQWWNPaVpacHZITUdPY1pEU0FzMjk3QldQZittdnpy?=
 =?utf-8?B?eUtZUnI3emd3Q05yZUgrVG5Xc0dsS2RwK09ld2svc0w1QThvbDZnUzhuVDNk?=
 =?utf-8?B?N1NXN054TUFlREpFVEhFYTE1RHJ3Q1MvSlBqYTgzamhhS29nREtMZGwwTS9J?=
 =?utf-8?B?OENJTUliWXh0R0R6bHlxekI1ak1STHJyM2FDdUcwUVlEaVAwaThWSFozR0Ey?=
 =?utf-8?B?TERxSmxUT29KMHl3K0dtMDhseVExV3IrWEVlWjg4TXB1dDluRU13bGN5N2VH?=
 =?utf-8?B?UDVJRDF2SEE3NFpZQTVXZlBibC9IVUNNK2VZY2o5eStiZU1paC8wZnVOdk05?=
 =?utf-8?B?OSs5aU1xL0pRWmtpMHdVd1FvSGZhMGdmSWxuWFJqQXlpdmFSS05pUEMyU3gr?=
 =?utf-8?B?QTFHcnllK0dqM2tDMHdyQmk4NnhUZUNUTHh4NmljcmR0VE5KdlJSU3d3NHZv?=
 =?utf-8?B?ZkVETFJFSWRndHZHalo1OEJMQU4zSHE4V1BHYzk1M0JJT1FUUEo2Y05sNGpD?=
 =?utf-8?B?RE5NZkZOU01LdmlPcC95dzlGVlNoS2xWM0JwcUNqcG1KNDlzNjJOUjFqbThB?=
 =?utf-8?B?ZkF4cElqcjdPR05mbHpMODd2bDR2NFdjRWp6bUN1aVBjTlBZZ0hUbERIRmx2?=
 =?utf-8?B?Z0k3YkxBTWpKQzd6b2xhbklJQmR2TXRka2JibENTS29jMWRMRG9RR1prMXNY?=
 =?utf-8?B?TXNFUy9KOHBSU2dVMWJlQTRoN3FwSnBFdjJXUVJhNE9zUkt6dGlUYnYvSXR0?=
 =?utf-8?B?dUMrb0N3Y1hzRDBVK2FpaU5GN0NBTjEzM2RML1V5VVNXSEtZbFBNZERUMGI3?=
 =?utf-8?B?U2dnaWQ2ZG1ndFlLMWFWekI5TlczN2xGcy96VXVTZmhUd3pyN0pJWW45cXZl?=
 =?utf-8?B?TUdma0x4WUJtVWtWSWRKMlExNVdKK2JXMzhmdmhQekxrK3o0U2Q5S1ZjQWtD?=
 =?utf-8?B?dzQ0dkRLWldrTWxteHVSVERRZklyZGE5elVzTnNhWktGbkJ5WXBJcERxVzFu?=
 =?utf-8?B?MUV3VWp0N0pSNkNtNytSazBjTTVMSld3M3NWRk02a21JWHgwVkpiMkMzTndj?=
 =?utf-8?B?aCtERjVEamdUcW5VWWNPNFJ2akdXbmQ0dnNtdGVyYXlYUDlNWXVHZU8yekR3?=
 =?utf-8?B?Vkl1cC9SZGg4NHFLeUFhcFo4NDAwUXBJb3VXQWxQRHZsa2ZQMnl0Smp0M2ZZ?=
 =?utf-8?B?a0s1aTNCekpNM0NUbmcxV3IyTVZyRy9BWXFFWkw2cTFnQWpxb1ZQeHZ4ZkJ0?=
 =?utf-8?B?VC9XVE1IazFCTnpkYkdHNWxSVmhTdm1JTXBocU5NQWNXWnVNYXhWM2xNKzVp?=
 =?utf-8?B?V1lLUExQakVpemh1WXp3THpzN0QvSVdQbGtIN0FCU2hsWDRnLzY5Z0xsU3N6?=
 =?utf-8?B?NDdQQWM3K0lTTXVJa3lYWTJNSFZGczdORzNzM05KRTFTN2hGa2pTVUI0OWlx?=
 =?utf-8?B?bmh3eFgxbjBBK2lKMGFYVWd0aTh0MklkRmNQTHJIZm4wYjcrbHVRZFRPY2JI?=
 =?utf-8?B?RU1ZVmlnRkpSZUVKL01FbzlwenpNUnJ1R1huSDUwRHpQNnNPaktKaEk2N05J?=
 =?utf-8?B?aWNtS2dRd0ZCcFdrcEVHWHowaVl6UkJFcmZHL0xNU045N0t6eG5SQmJqS3JW?=
 =?utf-8?B?ZEJTeUp2T1R6ektkMEViQWpUS2lKUkkvclhGbVZiT3ZxaGl5Zys4L05CS1Vo?=
 =?utf-8?B?enNCQ0psYmY3OXh0QkJSRlJKNmhWbENCU1liOHN0S3RSQnUyS1FlQjVaTWFq?=
 =?utf-8?B?aGJVWVZJVUF3Mk9BRmYyQ3NKSlNZdHZYMUJWTVJ4RWM1UEhreVdxUT09?=
X-Exchange-RoutingPolicyChecked: b9Dx1CfqhzjpX284a7pUVSVtJPQWGmU9M7yJyvbAV22SLB6YhEUzxMnV0zGBA8GM8GS/0s6ITiWhrXi+DFzppbwvxbcFSD+htKR6rHyXYCaJK1odPByTTMRRE2XAOTUFammFD8YwWwRbqIbVsOmA+mCMJPsYutuUIbw53WvU+jZN1o7KDBi8PNpGR7AY5/g8eMnSNJvlaDnobYA4Ib3iv8up083FSo0SMHzuV4eYSWNB3jQ27P9ikLijjpBFnB7m/e14q9c7tzZHJKssoYORAFEvE6g1+6d4ntWT+ErmcstmaD8HslKltmf1+9hoFYzOXOMraCHcaOpL36KyleIiiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4e2ee7-d5fd-41dc-3556-08df22ad3a05
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 06:52:31.0052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WC6KswMBLs4KpfiQX/1ARJo95UTxHkRxZgFJb9wK55Xv9OcVPa6h+VyXl+EtbEPHhimOncJyXY1bB4cV2u0Qig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
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


On 29-09-2026 22:58, Sk Anirban wrote:
> Bump the upper ratio bound from 1.05 to 1.1 so residency_accuracy()
> allows the same ±10% margin on both sides of the expected duration.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17049
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rc6_residency.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index 346796fb2..80c102e31 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -112,7 +112,7 @@ static void residency_accuracy(unsigned int diff,
>   
>   	igt_info("Residency in %s or deeper state: %u ms (sleep duration %u ms) (%.1f%% of expected duration)\n",
>   		 name_of_rc6_residency, diff, duration, 100*ratio);
> -	igt_assert_f(ratio > 0.9 && ratio < 1.05,
> +	igt_assert_f(ratio > 0.9 && ratio < 1.1,

Looks fine,

but what is the reason upper bound was different previously ?

>   		     "Sysfs RC6 residency counter is inaccurate.\n");
>   }
>   
