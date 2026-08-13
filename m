Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B83C5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 14:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A2010E039;
	Thu, 13 Aug 2026 14:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHzp7OGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BC210F366
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 14:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629616; x=1818165616;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RC7uANxmGFMeYG+NeaC0tzsTx6Puiqu61Y9vu/swlMw=;
 b=HHzp7OGwwOJWr0QLDGZ9Z1114qVg0x/hiNQxTs8yJ+WOvjsK/UF8lfWl
 SOZy6f9wAy4IGS16PC7JeqRvhLJTkbicm+S/2COVnnZyrwzMkgvJ1aMs7
 Xg413MJgHOCdECUMt7QSyQfkeHlQWhheTatWqGyzaXoazJ9sBoEVlXpx3
 ECAqqumw8rpE4MsaQYqyGTDw534okhjJ6iNeD0XCf4B6Q88hDYG5RXgNG
 pX+RaHdSa4cAenYL3Cr1Nm3pDtLrVn2mTJKhqppAyHZ0oJUFtL8RmiCJq
 B1gFmgNXdUM/GbKihdbuSl2gB86gQ8phu2ZxVZg2oHMx5oaiKxZodh/Bn w==;
X-CSE-ConnectionGUID: 4pBSVvRfSJ62L5R+BjLY2Q==
X-CSE-MsgGUID: 8Qac4KnwQGOIqi48eXdHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="109988845"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="109988845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:00:16 -0700
X-CSE-ConnectionGUID: Ma1jueG7R6alEvK5i2HwkQ==
X-CSE-MsgGUID: ose3QIJ7Sry1AJdjEyVynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="263973891"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:00:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:00:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 07:00:15 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwlxzcsMcvX005uvplq9FqT2W+n+ZkB1IzZYHja9z/x0D7L1hA1vk/bp3Gw3FCvcZeY3ta9jQVUluweflsIBnFHCyEdkpfsdh0oeMST0BlQMXwqWAFAXSeq2FcaYlIdpeskgUyTi+4QTrZFNu44VBm8PRD//k4EOrt5Wta1oexny4bN0U0+oXlVWq19CXRiZ+ZA87NyfXPFhG98OWoIjrLh09g54bkZgrPv6dR5tVOeDQVddp6Jb4SnEghLEruUg1sPqIkCq3u/hDmb22PryatPwhBMl/40+z6B4jN3eo2EwgfnafcHgjay7285FGmJRfZy7fsctPuSKQA76QyJqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb6dsJlW0GmrCIWwOmlH4LvUt34o13seaniBCofBrSk=;
 b=eUcylTi1ZyfZDeKK6nHtYKLBWL755EeBFpEVZfn3Y9lmsAcw5OTwJeEeY4NEU/NYXcYYOaX0IuloY7f3gteX0cin/Ej4kW4uJ31I91ZyuuQfJX9zUHX2y/l9EE4M+knzHpU0UkAQwlLU4gAJ2oX09E9Ynns9+UfU53t5bpJmmEApz/EQri+lP8ROcFJhgt750KQqTkw+ApJqHyvJtewLu6QbAnDQhYlb14j5aOrT79oraYtZDtmRJH4NJsVYBoGnHME93ppnvzARnfkzc8CyyX15AQKHu64x9cxO4U9lpGmLtOmkCvkN4VsP0Gh3e6ffLcKuznLjeuQE0GkoouK59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 14:00:12 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:00:10 +0000
Message-ID: <879a35f5-1487-4c29-8767-8cb64bcdf197@intel.com>
Date: Thu, 13 Aug 2026 19:30:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] tests/kms_color_pipeline: Add FIXED_MATRIX
 colorop tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-5-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806120345.19406-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3cd0ec-3bcc-4c43-0442-08def943308a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 9vVQMzQDiVwCBoD3uXUGT0W9UjknV5GqSLhMZB0+IqPiZRojlM8HciHDx0CDn91iRaY3WKcuK0HyPFCJsl69wBNe2WGIAZJpC/AhOHtZFacgRS0X0cUmccmbpL+PPaegCjNJj59YcJSS0n9ZjhItZ5/IAk16OfEDJeTrU50onkKRWvvUR6w+xXQ5b06yzPgqG1xIKjHrTUNhDy2FPAr2rb30My7yaeaT0D4bTQUYHpxrv8PssOOIunH0XlRVQS+iIwjbsy7vX3kkcsGMjGOj0zMcx8JyII6DYXvjQole3e6qMZIYXbgC4y8vSHmhjqqjG0YHrSkou75C+8qrESISdHGpjtFmFZLQ9MFHXhof6FHVat3ti5l8bLIbjLQI46NnuSsrHuuBJ14yV6FjBh0A3KhCq1c8ZH7iwW1qpa6PzCuHS1KFR+KRVcDZD4/0HGhfFSY87sV2wRQ8v/XJCstD/C6prb/krO2KyfpKcOWtL0oahcKugTk0gF61j6vhjK7VGAJWIN5wVYjPVlKLYN2UwKoXeTUMMah6rieQaIggDjt/VXXibrKDS1fJHm1PpLXRIBqOpd0kkp70xmvtFtop8LFN7mfHmNhBipBm8j1zPRB/6nvMtyPeKtp4RBWOo7y1O+0mCTvu8Dp0rLHgSNJfYdNuh4miTzK34ulbAOL/iRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGN3U01LcWRrUkNqN0dqRzRKM3pSNEF3N2RuaUVNa2FML3FuU2FYajBxcVNK?=
 =?utf-8?B?UExLN1ZiTGVTZzEvQ2orVnpxL3BpVi82MTdieHB4ak1vQTBzUnRLTFVPeUdx?=
 =?utf-8?B?MjJhVWE2YzdSMmdlSXVOTGRQVjJLRjA1eW5iMWwzVWZZcVAvZnREYnRwTjBa?=
 =?utf-8?B?dGtsbnZvdmM3eUVYQktGRm40UE9ncDhIbmxhS29FUm9zOEVGMGZvRmZLY052?=
 =?utf-8?B?UEQyaEk5YnF0VXBRR3F1NUdvUG1kbjZjS1h4UnRIVVJlOHdqL01ZWmEyNGJL?=
 =?utf-8?B?OXVuS1U2QWZlRXhzNldRa0o4M3pqeGVIdnR5TlltcDY3TVMzNGRQR2V3TTBk?=
 =?utf-8?B?L1VSZFpFamFHOHB2SWhNejZhMVZkNnpaNFljT01CUSsvVWZLUlRocXBqRGJv?=
 =?utf-8?B?UkMrNUVEV0ZmRG5mVzBGZi80YVJRdWNYVGM4Mk03OUpGTVRhTnpXL0RyODhB?=
 =?utf-8?B?aWFMK1pDejdkdXpBd1dyRkN2K0VDZmdPZERpL21ua2oraG8wcDgxTmFhS21j?=
 =?utf-8?B?RC81OXlaTkF5ZnF2V3dTNjVIQzlMNFhGRFZaYXFYaXBsRWUwb1lNdDY4OERM?=
 =?utf-8?B?aUhsVWFteEU5czVDZjhvMlNZVE1ueVphRGVsWStsMlcvRGxPK3ByOXl4cSt6?=
 =?utf-8?B?N3pYSldWczgvZTR4eWdtQ2NuTmhiYS9UK2tiRmo0NjRyZGg5cmUrK3lJQ1Np?=
 =?utf-8?B?eThQZGJDeVpMeUxXYXNabTlvMHhVT1B2RUp4b3R5Y2JMWjl1dTY4cWZBWENr?=
 =?utf-8?B?VnhZUDR4eTdBVkxOMURaZmJPdFAwc1QvVlF1WnJDVHFHMXNzTUJIbEREM3Va?=
 =?utf-8?B?a254UlJVYVJiQlJKWTVTTXBEUkdtZnZDQWJobWdtS3o4UWV0Rk9Gc1NuKy9M?=
 =?utf-8?B?WU1RczEzRUxpdlU5U2k4T2xQbmJOODUva2htaFhRV1Q4U3FRdlFJeXY3azRV?=
 =?utf-8?B?eENjdDdBQmMxMWcvMm1jZ0hYbkdxcFJGRkRQYk80K1E3ZG96aHE0UmtSK3U0?=
 =?utf-8?B?VWN1THpNYlhMSCtneEgvL1E1eGhDd1BSWmtuVkFZamtaQVhoQXZkOFlkT2Qy?=
 =?utf-8?B?c1d6UGlMSjFEOW5tTlpIQUt1dElUUWJnSnNJamhFdk5QWkt6UWY2NWFoaXV6?=
 =?utf-8?B?N1JEQjRyVndGTjNlaDhZNWJlSHdMbGl3Y2gvckxyaU8rY1hVTkFFS3ZjK0Vk?=
 =?utf-8?B?T1A3dzBBRElBNXdaMGphTkRMVXRUMS80d1RPNlB1QVlxM1dkcE1oNFlHamp2?=
 =?utf-8?B?d1dOcG5NZU9WMFg2YW5PWmxjZHR6MEV5aDdhRFhYd21MQ0tZcWxhVVAxWHNk?=
 =?utf-8?B?N0N2SDhveHRVdnRUTjl0QjU3WGYxWlcvVncwbVZhMXM0RFdvWjd3aHlUeXVQ?=
 =?utf-8?B?S05rYzdISHNBckRNcFRXNXJvWk0rWXFkbHFmbUgwcGF1SmQwazJmcTJXQXEz?=
 =?utf-8?B?b0twSkdiVUo3N04xTk1GSktISk1ubE1oUWs2dUk1a0pFYTUyL2MxWXI2SnRs?=
 =?utf-8?B?TGtXOGR5c0g4L1AyNmwzQ1dOM3Y3dTZoekMxbWpJMWp2cW9waDN2cmx6ZVB3?=
 =?utf-8?B?Vmd6a1Zjcmo5UHB2dGcrbWp1OCtOaURaUVZYcFkvTGNIa3Jnb3ViY2c1UzBK?=
 =?utf-8?B?eWFmMExnSTVTa29hTVhLTXJ3VFFTY1gyekZqcGwwUUtZaHU0WUNIWWx1N2pY?=
 =?utf-8?B?Sm1Ub0QzcnJyWkxueHNSbmllVkpKZitFN1NJcG95czhtNTJQYzh1VjQyVXZq?=
 =?utf-8?B?bkl5WWx0SXlMRHFXQ3JvZnU0U1pZQTBkUXBEekx1RGN3V2RtT2JxQ2RKcmpq?=
 =?utf-8?B?MEljNXJPZWVsL1EzMlFoYmtWZE1waUNqdmJDWjFIWXZGS2JVMVNGZjVqV2U5?=
 =?utf-8?B?bURXRGR0Qk9jT2R6d0RVS2hpVzJ4T3JxcFFXeEtEcUcyOXBOdGlLbUlwVFRW?=
 =?utf-8?B?bnFubysyMGg0WVpJZnVsT3lnR3RrTFJqU3BUanQ5aFNMZ2xudlVWeElQS0J0?=
 =?utf-8?B?dTd3MmFoZVltd2lJcEFPQ0Zjell0di9GREtBR05FZjJlS2VFZ29PR2Z3bHdn?=
 =?utf-8?B?Rm9EcUF3a24yTUcvUW5TcEZ5cFhmSFk2Z0I4eld2RFVSY1JndTFUdHM0UjNx?=
 =?utf-8?B?ZDdRQkJQamMybERHaENxUVBNU0lRRUNyOCtRVFdza0VLaHhxNnBQNXNsbkE3?=
 =?utf-8?B?b09oa1RYMjZQS0ZZdER1bDlMUVp5SWg5NnN4anNSY2N0aytRdjhxN3U5R0wr?=
 =?utf-8?B?QVhHVXdteFo0ZkNneXpKSW94L2VJL3ZmalEzVDNJRDlVU2hGSG1IRDNvVGlj?=
 =?utf-8?B?YUcybTZQdGVrb0ZBaUFsY3VScE1ybVY1UHJnT2VIcmxjNndYd2dFL2w3MEpZ?=
 =?utf-8?Q?3UpPxmzgvlrzOnno=3D?=
X-Exchange-RoutingPolicyChecked: hK5NlJAldZ/ccE9T4YviNDECzFJZ0AdTW0MlLDOkZj2R3/alUER37eINmvpATP0Sd/cg+o4tyuuZrx/od0upXPsyL4+cy9Ct2zNlOwCjltbK2Ukp6n3AByTv6ZvpDacbVO0y0iYfhalgpYh2U2mNNFKgqPll4103llvvLkyPVAYHhBxyz7y39sBrDMowbdGR3m5odBA52nADI07n6mV6PCWRUrpbdUvnVNRh0Ly8nm3lYz43T1P4s+USVtoza8hB85tEu5w8sfEXvX9KkhtRLSwo7XRNrdJxzH+2wsaVsUudJ4H9vz70Rdane4V2lhxCdOrHvAl/sfENc9m6KtpY1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3cd0ec-3bcc-4c43-0442-08def943308a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:00:10.8743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITPLbZ2DiYLVYlPkXAx+ui+vJRHejOKwcrWx/QTggWIF+yJq1M15I9LMUw6OZ6c8JE2hNrTmSI6nNwV1MvZtOPw73HPm8Cw6eBRkwsF7Prk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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



On 8/6/2026 5:33 PM, Swati Sharma wrote:
> Add plane color pipeline tests for the DRM_COLOROP_FIXED_MATRIX colorop,
> validating color space conversion through the color pipeline framework.
> 
> With this, the SDR plane color pipeline looks like:
> 
> [YUV Full/Limited -> RGB] -> [1D LUT]
> 
> A single FIXED_MATRIX colorop now handles both full and limited range
> YCbCr to RGB conversion.
> 

I would remove the 'now' from here.

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
> The test works as follows:
> 1. Creates a YUYV framebuffer with the appropriate color encoding
> 2. Converts it to XRGB8888 in software using igt_fb_convert() which
>     internally uses igt_ycbcr_to_rgb_matrix() with the matching
>     coefficients
> 3. Displays the SW-converted RGB fb and captures its CRC as reference
> 4. Programs the HW color pipeline with the FIXED_MATRIX colorop set to
>     the corresponding matrix type
> 5. Displays the original YUYV fb through the HW pipeline and compares
>     the resulting CRC against the SW reference
> 
> This ensures the HW fixed matrix implementation matches the expected
> YCbCr-to-RGB conversion behavior.
> 
> Also refactors ctm_colorop_only() into a generic colorop_type_only()
> helper that accepts the colorop type as a parameter.
> 

Is this change needed anymore?

> v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
>      -Use SW-generated reference CRC (igt_fb_convert) for YUV tests
>      -Remove redundant tests
> v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
>       until we have non-IGT userspace that shows their use
>      -Add limited range YCbCr to RGB tests
>      -Consolidate all tests under single plane-fixed-matrix prefix
> 
> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color_pipeline.c | 342 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 339 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 78860a845..3e821f8de 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -13,6 +13,7 @@
>   
>   #include "kms_color_helper.h"
>   #include "kms_colorop_helper.h"
> +#include "igt_color_encoding.h"
>   
>   #define MAX_COLOROPS	5
>   
> @@ -69,7 +70,8 @@ static void test_setup(data_t *data, igt_crtc_t *crtc)
>   	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   }
>   
> -static bool ctm_colorop_only(kms_colorop_t *colorops[])
> +static bool colorop_type_only(kms_colorop_t *colorops[],
> +			      kms_colorop_type_t type)
>   {
>   	int i;
>   
> @@ -77,7 +79,7 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   		return false;
>   
>   	for (i = 0; colorops[i]; i++) {
> -		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
> +		if (colorops[i]->type != type)
>   			return false;
>   	}
>   
> @@ -155,7 +157,7 @@ static void _test_plane_colorops(data_t *data,
>   	 * Use flat colors only when the pipeline
>   	 * contains CTM colorops exclusively.
>   	 */
> -	if (ctm_colorop_only(colorops))
> +	if (colorop_type_only(colorops, KMS_COLOROP_CTM_3X4))
>   		paint_rectangles(data, mode, fb_colors, &fb);
>   	else
>   		paint_gradient_rectangles(data, mode, fb_colors, &fb);
> @@ -347,6 +349,337 @@ run_tests_for_plane(data_t *data)
>   	}
>   }
>   
> +
> +/**
> + * Capture reference CRC by converting a YUV framebuffer to RGB in software
> + * using igt_fb_convert(), then displaying the resulting XRGB8888 framebuffer.
> + */
> +static void
> +capture_sw_converted_ref_crc(data_t *data, igt_output_t *output,
> +			     struct igt_fb *yuv_fb, igt_crc_t *crc /* out */)
> +{
> +	struct igt_fb rgb_ref_fb;
> +	igt_plane_t *primary;
> +	char *crc_str;
> +	int ret;
> +
> +	primary = igt_output_get_plane(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	/* Convert YUV fb to XRGB8888 in software (uses igt_ycbcr_to_rgb_matrix) */
> +	igt_fb_convert(&rgb_ref_fb, yuv_fb, DRM_FORMAT_XRGB8888,
> +		       DRM_FORMAT_MOD_LINEAR);
> +
> +	igt_plane_set_fb(primary, &rgb_ref_fb);
> +	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	igt_assert(!ret);
> +
> +	igt_wait_for_vblank(primary->crtc);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &rgb_ref_fb);
> +
> +	crc_str = igt_crc_to_string(crc);
> +	igt_debug("CRC for SW-converted reference fb: %s\n", crc_str);
> +	free(crc_str);
> +}
> +
> +static void
> +_test_plane_fixed_matrix_colorops(data_t *data,
> +				  igt_plane_t *plane,
> +				  const color_t *fb_colors,
> +				  igt_crc_t *crc_ref,
> +				  kms_colorop_t *colorops[],
> +				  uint32_t input_format,
> +				  enum igt_color_encoding encoding,
> +				  enum igt_color_range range)

Can we re-use _test_plane_colorops() if go with 
kms_colorop_fixed_matrix_info used in

https://lore.kernel.org/igt-dev/20260731180200.668795-4-harry.wentland@amd.com/

> +{
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline;
> +	igt_crc_t crc_pipe;
> +	struct igt_fb fb;
> +
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_skip_on(!color_pipeline);
> +
> +	igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
> +					      mode->hdisplay,
> +					      mode->vdisplay,
> +					      input_format,
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      encoding, range,
> +					      &fb, 0, 0));
> +
> +	/* Hardware pipeline CRC */
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +	paint_rectangles(data, mode, fb_colors, &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +	igt_wait_for_vblank(plane->crtc);
> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
> +
> +	igt_assert_crc_equal(crc_ref, &crc_pipe);
> +

We have to be careful with the assert here. When lets say plane 0 fails 
and the test moves on to plane 1, the plane 0 remains active when assert 
fails here. Therefore, plane 0 continues to blend with plane 1 while we 
should be only testing plane 1. This is a problem with 
_test_plane_colorops() too. Simple solution could be to move the clean 
up code before the assert.

> +	/* Cleanup per-test state */
> +	set_color_pipeline_bypass(plane);
> +	reset_colorops(colorops);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +
> +static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
> +					     const color_t *fb_colors,
> +					     kms_colorop_t *colorops[],
> +					     uint32_t input_format,
> +					     enum igt_color_encoding encoding,
> +					     enum igt_color_range range)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_plane_t *plane;
> +	igt_crc_t ref_crc;
> +	struct igt_fb yuv_fb;
> +
> +	igt_require(mode);
> +
> +	igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
> +					      mode->hdisplay,
> +					      mode->vdisplay,
> +					      input_format,
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      encoding, range,
> +					      &yuv_fb, 0, 0));
> +	paint_rectangles(data, mode, fb_colors, &yuv_fb);
> +
> +	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
> +	igt_remove_fb(data->drm_fd, &yuv_fb);
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
> +			_test_plane_fixed_matrix_colorops(data, plane, fb_colors,
> +							  &ref_crc, colorops,
> +							  input_format,
> +							  encoding, range);
> +	}
> +}
> +
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
> + * @yuv-rgb-bt2020-lim:	YUV BT.2020 limited range to RGB BT.2020
> + * @yuv-rgb-bt601-lut1d:	YUV BT.601 full range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lut1d:	YUV BT.709 full range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lut1d:	YUV BT.2020 full range to RGB BT.2020, then 1D LUT
> + * @yuv-rgb-bt601-lim-lut1d:	YUV BT.601 limited range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lim-lut1d:	YUV BT.709 limited range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lim-lut1d:	YUV BT.2020 limited range to RGB BT.2020, then 1D LUT
> + */
> +
> +static void
> +run_tests_for_fixed_matrix(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +
> +	static const color_t colors_rgb[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "1D LUT (linear)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +
> +	kms_colorop_t fixed_matrix_yuv601_rgb601 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 to RGB601",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 to RGB709",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 to RGB2020",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv601_rgb601_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 limited to RGB601",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 limited to RGB709",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 limited to RGB2020",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB },
> +	};
> +
> +	struct {
> +		const char *name;
> +		const char *subtest_prefix;
> +		const color_t *fb_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		uint32_t input_format;
> +		enum igt_color_encoding encoding;
> +		enum igt_color_range range;
> +	} fixed_matrix_tests[] = {
> +		{ .name = "yuv-rgb-bt601",
> +		  .subtest_prefix = "plane-fixed-matrix",

Do we really need these?

How about

igt_subtest_with_dynamic_f("plane-fixed-matrix-%s", ...)

?

> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt601-lim",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709-lim",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt601-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt601-lim-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709-lim-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(fixed_matrix_tests); i++) {
> +		igt_describe_f("Test FIXED_MATRIX pipeline: %s-%s",
> +			       fixed_matrix_tests[i].subtest_prefix,
> +			       fixed_matrix_tests[i].name);
> +		igt_subtest_with_dynamic_f("%s-%s",
> +					   fixed_matrix_tests[i].subtest_prefix,
> +					   fixed_matrix_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!crtc_output_combo_valid(data, crtc))
> +					continue;
> +
> +				test_setup(data, crtc);
> +
> +				test_plane_fixed_matrix_colorops(data, crtc,
> +								 fixed_matrix_tests[i].fb_colors,
> +								 fixed_matrix_tests[i].colorops,
> +								 fixed_matrix_tests[i].input_format,
> +								 fixed_matrix_tests[i].encoding,
> +								 fixed_matrix_tests[i].range);
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
>   int igt_main()
>   {
>   	int has_plane_color_pipeline = 0;
> @@ -377,6 +710,9 @@ int igt_main()
>   	igt_subtest_group()
>   		run_tests_for_plane(&data);
>   
> +	igt_subtest_group()
> +		run_tests_for_fixed_matrix(&data);
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

