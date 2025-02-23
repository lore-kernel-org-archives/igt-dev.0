Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031B9C021B2
	for <igt-dev@archiver.kernel.org>; Sun, 23 Feb 2025 12:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C57010E29B;
	Sun, 23 Feb 2025 12:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3ldX90L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC32210E29B
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Feb 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740312180; x=1771848180;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s+alT1p1SevBZzXJRg/h163Z8AvErmSkPVL8Gw6/x54=;
 b=R3ldX90L4byKj7HNwok0G8nGACZQiXOZPvAmZHnAIuE0eabZ5RA4MEPf
 oh2mlD25606yk+2ZslQXwYKDNHhNK6V8P52E/D9SX4uYcMcuSH2yhCLhW
 dZhNdc7vt1OJlS2o8D0l6KBubW6ae2+/uc28fdSkvMg/Jaz1BN7CaHG7G
 AVxUbEf/SzTqynishy15pieAtty3nez70otvmFm3SdVX57d2JbFs0UoGj
 8Qr6U7iJfs7exB3SutQbpR9MXstxHUz/gcf/u88WH81LTOeuqkPQtzoP6
 c2y4P/ZEzoDDeStqIJ5r1BSR5DRaACYw4ICyIXTTSMilAHk1NCSxaQELf g==;
X-CSE-ConnectionGUID: wqFlFIYARgaqUGg5KcQRiw==
X-CSE-MsgGUID: PULJr1+kTXCcSkNGMCem8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44729778"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="44729778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 04:02:55 -0800
X-CSE-ConnectionGUID: d9/l00VPRWilhhe1X3j4pA==
X-CSE-MsgGUID: iq19GrySTH6zcXaIqEWFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116296454"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2025 04:02:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Feb 2025 04:02:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 04:02:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 04:01:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U981Jb3QOX+r8FjsBSG8GMdeqUe7oDsSL6KLc+ziqncP7lCuGlzS1uu1W4B0M5Wz37smdgB1AKP7DB3S8mzDh/U6mE0b8PuUxnZahht9l0nxoywNDtbG6lWgtwhMC+VOBmh92F88cSoVcToW1kZUeva6YqodeHDIEa4/u8fFgKV3vKdLyeO02fewocRI9zVw+oRHFhQB5j8uGEXB3bp3F4MoeHBoN86hq+M4Fnicum+36lsH8hnxzuZzDp6xE+iIcGbVoQTvNg/YM9kXoPmKent0KHlbjVkXzbqSckcPkRtL41+v7dshnI6APaSpuZZN9HmWqz2W2PnllsrTIgVpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzabQHu+l73xj3vSl5wtVvGq/dJooupCzfKE+OcnxLI=;
 b=aDXmrJG9Kkv0mZqTH+sO6HGfYAmn3egU/xkqMUf5eD+CZjU6kzLCA2glqZ7Oso8H1/5JeST2WinKoHYPLejm/GokpSWRhM7BZoYBOEVhlT/JHbhsaNZ7ERrPOeQQBpZvRfralzT+3fusirkJfd81K5snhldzXF9bhvcVI3xWolalNUH/v1r87cWQXL4w/06JR1Ivg+tW91I7kEMFt18EdMVwBBPuzmiI/G3+j44mwmfz2BP7Rliez9IeVfqxANqeNNHd9rYYv+uXPTlfUy1/Oyn0ZIISzQ8xD2bvAPdhsW58ZiWmcYHiPt4prHwc0PluszaN2yWykiqM6NlyhSJXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB7279.namprd11.prod.outlook.com (2603:10b6:8:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sun, 23 Feb
 2025 12:01:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 12:01:42 +0000
Message-ID: <d6c2eb7c-1253-453d-8f6a-6ca4c097eba3@intel.com>
Date: Sun, 23 Feb 2025 17:31:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] lib/igt_kms: Add func() to read and parse cdclk
 debugfs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250217213531.402162-1-swati2.sharma@intel.com>
 <20250217213531.402162-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250217213531.402162-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cd533c-f586-4684-96d6-08dd5401d645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk4wd2syclg5aG1qbW1lYlV5cVlGN2x5T0txdk0yeDlqRElFTGNlWllrUC9k?=
 =?utf-8?B?UElvN3JTQWVHWmRUcDczUkhRNjA0NmQzSFlIT055Uld3TjVlMDc4R2VjNjY0?=
 =?utf-8?B?MDlBRjRZSitVbmJZS2xOeTlpWFlkOXo1TlR5VXdJc05aQnhQUldsWjBBVnNP?=
 =?utf-8?B?c2preFZaVUdIMjV1S2Q2TW1EUUdLczVYYzBPa2ttd2xYQ0hoQVdXbUo4Vys4?=
 =?utf-8?B?bzFuS2cvaGFrNzY3TldwTGtLa01XdXVTZWUvNFZLZHhPQ0dnaUNWSE1SUUxz?=
 =?utf-8?B?VVlBZU0rSzRSQ201TzNwYkpXMDAxdzlQWDdLb3AzK09JRzQ1Ull3cURXK0Mw?=
 =?utf-8?B?eStjZVA0dEMyaVl0MXJUV1prdDVxZGU3ZDJ2UzQ4Unc1VUhsTlNwWFZKUmhx?=
 =?utf-8?B?TkNBTjJKeU9DalRYa0cySklPNm9zQmFKS25QcWFtUmJDY2JIWm1sdWtzd1lJ?=
 =?utf-8?B?L1FkTWRhMEZIWGxGN2tPRjUvczlONlFZTGZjMC80Y1hRalBORy9XRVp3aVdj?=
 =?utf-8?B?L0RaNTNEVDFPcFBTeTJYWmhDMlB3N0xIWElldkxNU3N6a1pHOXRicEdBZWV5?=
 =?utf-8?B?N2ZoM1p4QjF0d2c2cUJPR3c2a2FyYitjZ3QyNzRmMHhKakNCNE85d2FUNE1G?=
 =?utf-8?B?Wmpndy83cEV6QjVIUjlHQU55b1p2S2d5Y1VKMlgwaWtsMm5uU0YrY05vNlpO?=
 =?utf-8?B?VG5XNG5QQkZJRkpHcnVWRGlPa2pGakhaVU5HMWFLSkhsL3VZRnlaZ1Y2c1lQ?=
 =?utf-8?B?RjMySHQwcE1XcHpObHpXRGxLQzJNaE5DNXQ2ZDFXUXpCMjZLY2RyWHNBM1Ju?=
 =?utf-8?B?cGduV2h0QkViYmxmZVZDNVFWcnIxeVAzVk1wR0c4cXBDaGgzN2RXY3BYaWYw?=
 =?utf-8?B?UlYwdHhMRXZIYVdqM251OHkwWWxITkNuNkR4TGRqRXFiM043cmtsRnFsNlNu?=
 =?utf-8?B?TXVRRytlQTFEZDhCbHhWZHFlUnlOYTZNdGJLRkZwTzc0SWYxN1llYjg1ZjJI?=
 =?utf-8?B?elF1N0xJZlJHM0RsV1VkUFJ0N0wyWXRsaC9rOXkzbHc4LzAyYXY1RGpWL0FM?=
 =?utf-8?B?Rlp0SXQxakRUZlRmMDNhakFhVW1kQWs0SjhJdmFIOWFwOFkzbng3RWNQWjdH?=
 =?utf-8?B?Z3p0WG02ZlVEUUIwVERIVHVCMEo0RWxjTGxDdjgreDBVZE01QjExZnZ5dTMw?=
 =?utf-8?B?anZRZFgyR2huL3oyQXRoR2NTbVczdmtzTy9TV1VWTXV3WXNXSTRaQXBhZnZt?=
 =?utf-8?B?VWdwOEJZNUtoclhORUk4aGQ4VHRpUnVaZldZd2dRS0RrcG1JUCtFZnFvTUJl?=
 =?utf-8?B?UlBFLzQ1ZnRicDUxTWZCTXRXcEZHbFhkVkNjTVFXY3dYSjBXMlUzblRJb3FZ?=
 =?utf-8?B?akZ6T1JLZi9NRDlva3R4S0dCdnVRNVlXdm5Hb2tvVEdUSzcwSG1EeloycmRJ?=
 =?utf-8?B?VjkzQkZoZUxGNWVud0E2S3NkaE90dCtNSStuUFRueEM1a3piS3lTNUZxaUx5?=
 =?utf-8?B?eHQ2SVhnMlhuRFMxR1hmbTZxcUczTU9VSGpFdHA4QmoyelU2RHRtVmFmVEls?=
 =?utf-8?B?WVZMTFVCWmJEd2hGTHFPWjhrMy9nZm9MNmc3dzdUaWtRVjhpVVh6RUxUalRI?=
 =?utf-8?B?N2l0V0gyZkVLM2FoTXZJM09qLzJFWVp5UTBRK1cveGtrb3RxczBDUlJZYW4w?=
 =?utf-8?B?SDNqclYzZjROYkVwSUJUZWs4VHhka1E5YXhqQyt6Nmc0YTJCeCtFTTNneGZU?=
 =?utf-8?B?eEk5ajVsOGRhUWR6c0FPTkNBT0dIU1Y5SDlLSStHNTBZSDd0dytOTDNpb1ZP?=
 =?utf-8?B?UkFORnFQZnA0eWt2SGJiVjFrdGJFd1BIU0JmZUQydVJrbWdiVmsvdXlOV2VN?=
 =?utf-8?Q?SeGpdJER1PqrN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRhMnJnaXovUG5PUzN3akIvdThZWXc4OWN0dmxqQXZIL2lqcXA3TkwyeEFC?=
 =?utf-8?B?NzRqTU1VcXNvMDJPK2FGZG0yNUxxQzkwQXNnTHFhKzNSN3AwQUZpOEo3TEs1?=
 =?utf-8?B?VTFYMTY0Qmxndzg1NFA5TnR6dVdZaThzZmI4eUVvNlBLUjRPMVBRVVNKdE5z?=
 =?utf-8?B?cGVNYWhjRkU0ZnV5UEZ2SmVxMU03blAvSjFFQ2orR0NidVREc0RjNWZYTzlQ?=
 =?utf-8?B?TkRpK3V6TlIwTERqUllJeUJadERRSjNmTWN4bmtWNHNWV0lQdUEwc2JtRnNW?=
 =?utf-8?B?ZzdyZkk1MkJUREtyTENlRVRCY2Q1aThndGFObEF3T3ZCdU9nNXRPLy9jOExZ?=
 =?utf-8?B?WTRWM0lQVElyb0xneTFQMkRmTU5hNm82K0FGam9zQ0JDb2Jqei92ZUdmb05B?=
 =?utf-8?B?cVM3ajJHQ3kvb0QzKzlxNUovZzBHWXJJS2RiMHNCTUpBOXpRYWVwWHg1VFJV?=
 =?utf-8?B?ZkoyZ3pFM2lDTml6YTJTNGZOUWUzN0FrajhBOWZlZWhlbkVPbFVGMDVGdzc5?=
 =?utf-8?B?ajdLMFp3dDBHN2V2dGVVU0VkdTRhdnRLcmhyQm9hZXlyZ2s2aFNaVFQwY2k4?=
 =?utf-8?B?c0lSZWl1aGxxNVBhVHB0Y0RxQWdmRm5uVTFrSEF3eXoxRGl4dFBaQ1hDM0h0?=
 =?utf-8?B?aWpoVDZObXlVYkhIdTRRdjB2bC9qcXF1eXZXT2t2SzJoSFF6OXBjUlU5bk1r?=
 =?utf-8?B?eDdWSHk2S1BudWR2ei9WcDZmTkNXSGh4QW9TL1ZQWUxQUy9MSTBFekxXVDRN?=
 =?utf-8?B?Zjdnb01GbDBkeDdQcDJiSnYvZDE5c29LVk5vK3psQlNqTjFFRzlnQngvNE5T?=
 =?utf-8?B?TFlsQms4aEJrcWNMRTM0aVdBQ0Qrd3pUSm9kY2I1a2N2VGxCK2Q5ZkpYUkVl?=
 =?utf-8?B?bWFWeEpKVG5vQW5ycTMxd0s2ZlVianZkd292QzRkWmhPNUJPaFg1NElGcGJB?=
 =?utf-8?B?MWJqNGo3Y21XN3o3QXRocUluZk1qSlM4OVBES1d6NytHRk0vdDNueVpPVzMx?=
 =?utf-8?B?aWVsdGdnWVBnQmdIT3BPK2xONFMwaEhZUWxJQkJqNEc2WmJCYVJSbVI0ZnZs?=
 =?utf-8?B?RWx1OWM5UGtkdDUxaFNGaXFLbzJaOUR4V0RFQUlEOTNIengvN0VjMTlqYmNa?=
 =?utf-8?B?bEZRWXdpRC9mNHhHeThkSlB4ajRRL1F0MEh2K0RyRGpOdnYzeXFTUW5iOUlz?=
 =?utf-8?B?U3o0YXE4NTNkbHpURVRaQlNkcXVxS0QyeWdDdVpaYkg2UnRydEdwTWplUkJi?=
 =?utf-8?B?WnBqbmViUGxPS0VXZ2dDTjNjY1FtSnRGRGJtSi96ZEhQNkdsZHNPVFV6YWZZ?=
 =?utf-8?B?aE1kb0EweTdEWUFQeWFQM2FCcU9zalViQmNZWXY3TUNRZmZYUlJRZmN3RXVq?=
 =?utf-8?B?NC9kYXBKTlg4aUNadmJMNkc4VTN4L2JsT1dDRXgvdmpYUTJCNHpnK01ITEhU?=
 =?utf-8?B?VVJFZmxkdHVqWFBXK0hkZkVzbjMzT2RRcWdsa0ZKRmpkZldtcEl3WFR5UUxE?=
 =?utf-8?B?TFVkd3BiVTJTMHh6eUd4WGRuL2VJN0UrVHZXTHphcnBhWERkTFR1a2tvMFhL?=
 =?utf-8?B?elRiOEdrTzlvMXlGaWY1cHpuSHN3K3dUUFJPZ0c1ZmFidFY5VWhYRlA0N2JB?=
 =?utf-8?B?NmVZMk51K3VlUURseXViZ2s1ZUU4T01PVVBiaC9ZU05IT1MvcHpDam5LZ3d6?=
 =?utf-8?B?OWxDdC9XY1JPV0JLdFVabFFMTDVFOVhHb1h0STdiR3RycTRnV0dmaDRPSkg2?=
 =?utf-8?B?TS85RnpqVlh6TTI4UDY5aGNsSi9LVitGQWl2U1h5cEx0QWZjWU90TGJrd3pW?=
 =?utf-8?B?WU1YNS91eHI3Z2c0VTh6bGJXNjMyUmltMThtSjc3SWhUOHBsajVlNEVKSWRF?=
 =?utf-8?B?U21QUml0amRLSEc3TzVWN0pQWldxWFpwVUVLTVFyNTVWZ0xuREpkZHlqeisr?=
 =?utf-8?B?dkZwQzgvamFVL0M1RlRxblpESUVVOUVpSk9yRTgwZDVLQjlYY2dUNDg4OE56?=
 =?utf-8?B?MExla3VNVExGUlpwMzRQS25CdDlVU0RXNU9rcytyYnlLbjZiQVRNTGhUeGR3?=
 =?utf-8?B?Vnl1UlZYOGgyMWUzbFZyZzhmcTlhbEdoZXlOdE95K3pLUVJRZ04wZWY5c3VO?=
 =?utf-8?B?UUl3MzFhMEViMm1kRlVLV2RrRVNibzdPTUtwbnAwRzlCTXk1UXJWVGtRYzFD?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cd533c-f586-4684-96d6-08dd5401d645
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2025 12:01:42.6546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPF9Xu7pKs7dZo8wRw8XNySN6BARKHOmR0FAB2t7Wq1et6n0kv45Hyp5EH7r1YZqlYG7Bawn10sEhOEJ5UbDDWv/v5sRVwXV/pTaKrVMzxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7279
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


On 2/18/2025 3:05 AM, Swati Sharma wrote:
> Add a common function to read and parse CDCLK information from
> the debugfs interface. The function retrieves the current CD
> clock frequency, maximum CD clock frequency, and maximum pixel
> clock frequency by parsing the contents of:
>
> 	/sys/kernel/debug/dri/0/i915_cdclk_info
>
> Example content:
> 	Current CD clock frequency: 268800 kHz
> 	Max CD clock frequency: 652800 kHz
> 	Max pixel clock frequency: 1305600 kHz
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c           | 76 ++++++++++++++++++++++++++++++-----------
>   lib/igt_kms.h           |  2 ++
>   tests/intel/kms_cdclk.c | 46 ++++---------------------
>   3 files changed, 65 insertions(+), 59 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0ba1afb08..9d49095d5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6303,29 +6303,20 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   	return false;
>   }
>   
> -/**
> - * igt_get_max_dotclock:
> - * @fd: A drm file descriptor
> - *
> - * Get the Max pixel clock frequency from intel specific debugfs
> - * "i915_frequency_info".
> - *
> - * Returns: Max supported pixel clock frequency.
> - */
> -int igt_get_max_dotclock(int fd)
> +static int read_and_parse_cdclk_debugfs(int fd, const char *check_str)
>   {
>   	char buf[4096];
>   	char *s;
> -	int dir, res, max_dotclock = 0;
> +	int dir, res, clk = 0;
>   	drmModeRes *resources;
>   
>   	if (!is_intel_device(fd))
> -		return max_dotclock;
> +		return 0;
>   
> -	/* If there is no display, then no point to check for dotclock. */
> +	/* If there is no display, then no point to check further. */
>   	resources = drmModeGetResources(fd);
>   	if (!resources)
> -		return max_dotclock;
> +		return 0;
>   
>   	drmModeFreeResources(resources);
>   
> @@ -6346,14 +6337,61 @@ int igt_get_max_dotclock(int fd)
>   
>   	igt_require(res > 0);
>   
> -	igt_assert(s = strstr(buf, "Max pixel clock frequency:"));
> -	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
> +	igt_assert(s = strstr(buf, check_str));
> +	s += strlen(check_str);
> +	igt_assert_eq(sscanf(s, "%d kHz", &clk), 1);
> +
> +	return clk;
> +}
> +
> +/**
> + * igt_get_max_dotclock:
> + * @fd: A drm file descriptor
> + *
> + * Get the Max pixel clock frequency from intel specific debugfs
> + * "i915_frequency_info"/"i915_cdclk_info".
> + *
> + * Returns: Max supported pixel clock frequency, otherwise 0.
> + */
> +int igt_get_max_dotclock(int fd)
> +{
> +	int max_dotclock = read_and_parse_cdclk_debugfs(fd, "Max pixel clock frequency:");
>   
>   	/* 100 Mhz to 5 GHz seem like reasonable values to expect */
> -	igt_assert_lt(max_dotclock, 5000000);
> -	igt_assert_lt(100000, max_dotclock);
> +	if (max_dotclock > 0) {
> +		igt_assert_lt(max_dotclock, 5000000);
> +		igt_assert_lt(100000, max_dotclock);
> +	}
> +
> +	return max_dotclock > 0 ? max_dotclock : 0;
> +}
>   
> -	return max_dotclock;
> +/**
> + * igt_get_max_cdclk:
> + * @fd: A drm file descriptor
> + *
> + * Get the max CD clock frequency from intel specific debugfs
> + * "i915_frequency_info"/"i915_cdclk_info".
> + *
> + * Returns: Max supported CD clk frequency.

Otherwise returns 0.


> + */
> +int igt_get_max_cdclk(int fd)
> +{
> +	return read_and_parse_cdclk_debugfs(fd, "Max CD clock frequency:");
> +}
> +
> +/**
> + * igt_get_current_cdclk:
> + * @fd: A drm file descriptor
> + *
> + * Get the current CD clock frequency from intel specific debugfs
> + * "i915_frequency_info"/"i915_cdclk_info".
> + *
> + * Returns: Current supported CD clock frequency.

Drop 'supported'. Add : Otherwise returns 0.

This looks good now. With above minor things addressed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> + */
> +int igt_get_current_cdclk(int fd)
> +{
> +	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
>   }
>   
>   /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 7227f0b0e..d4731af9c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1242,6 +1242,8 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> +int igt_get_max_cdclk(int fd);
> +int igt_get_current_cdclk(int fd);
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 382b3e9d1..b89b2f345 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -63,7 +63,6 @@ enum {
>   
>   typedef struct {
>   	int drm_fd;
> -	int debugfs_fd;
>   	uint32_t devid;
>   	igt_display_t display;
>   } data_t;
> @@ -76,34 +75,6 @@ static bool hardware_supported(data_t *data)
>   	return false;
>   }
>   
> -static int get_current_cdclk_freq(int debugfs_fd)
> -{
> -	int cdclk_freq_current;
> -	char buf[1024];
> -	char *start_loc;
> -	int res;
> -
> -	/*
> -	 * Display specific clock frequency info is moved to i915_cdclk_info,
> -	 * On older kernels if this debugfs is not found, fallback to read from
> -	 * i915_frequency_info.
> -	 *
> -	 * FIXME: As of now, XE debugfs is still using i915 namespace, once the
> -	 * Kernel changes are landed, update this to use the XE specific debugfs.
> -	 */
> -	res = igt_debugfs_simple_read(debugfs_fd, "i915_cdclk_info",
> -				      buf, sizeof(buf));
> -	if (res <= 0)
> -		res = igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
> -					      buf, sizeof(buf));
> -	igt_require(res > 0);
> -
> -	igt_assert(start_loc = strstr(buf, "Current CD clock frequency: "));
> -	igt_assert_eq(sscanf(start_loc, "Current CD clock frequency: %d", &cdclk_freq_current), 1);
> -
> -	return cdclk_freq_current;
> -}
> -
>   static __u64 get_mode_data_rate(drmModeModeInfo *mode)
>   {
>   	__u64 data_rate = (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__u64)mode->vrefresh;
> @@ -168,7 +139,6 @@ static void do_cleanup_display(igt_display_t *dpy)
>   static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	igt_display_t *display = &data->display;
> -	int debugfs_fd = data->debugfs_fd;
>   	int cdclk_ref, cdclk_new;
>   	struct igt_fb fb;
>   	igt_plane_t *primary;
> @@ -197,11 +167,11 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
>   
>   		/* downscaling */
>   		igt_plane_set_size(primary, ((fb.width * scaling) / 100), ((fb.height * scaling) / 100));
> -		cdclk_ref = get_current_cdclk_freq(debugfs_fd);
> +		cdclk_ref = igt_get_current_cdclk(data->drm_fd);
>   		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   		if (ret != -EINVAL) {
>   			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -			cdclk_new = get_current_cdclk_freq(debugfs_fd);
> +			cdclk_new = igt_get_current_cdclk(data->drm_fd);
>   			igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>   
>   			/* cdclk should bump */
> @@ -221,7 +191,6 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
>   static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	igt_display_t *display = &data->display;
> -	int debugfs_fd = data->debugfs_fd;
>   	int cdclk_ref, cdclk_new;
>   	struct igt_fb fb;
>   	igt_plane_t *primary;
> @@ -251,13 +220,13 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   	igt_output_override_mode(output, mode_lo);
>   	igt_plane_set_fb(primary, &fb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
> +	cdclk_ref = igt_get_current_cdclk(data->drm_fd);
>   
>   	/* switch to higher resolution */
>   	igt_output_override_mode(output, mode_hi);
>   	igt_plane_set_fb(primary, &fb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	cdclk_new = get_current_cdclk_freq(debugfs_fd);
> +	cdclk_new = igt_get_current_cdclk(data->drm_fd);
>   	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>   
>   	/* cdclk should bump */
> @@ -272,7 +241,6 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   static void test_mode_transition_on_all_outputs(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
> -	int debugfs_fd = data->debugfs_fd;
>   	drmModeModeInfo *mode, *mode_hi, *mode_lo;
>   	igt_output_t *output;
>   	int valid_outputs = 0;
> @@ -330,7 +298,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	}
>   
>   	igt_display_commit2(display, COMMIT_ATOMIC);
> -	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
> +	cdclk_ref = igt_get_current_cdclk(data->drm_fd);
>   
>   	j = 0;
>   	for_each_connected_output(display, output) {
> @@ -354,7 +322,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	}
>   
>   	igt_display_commit2(display, COMMIT_ATOMIC);
> -	cdclk_new = get_current_cdclk_freq(debugfs_fd);
> +	cdclk_new = igt_get_current_cdclk(data->drm_fd);
>   	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>   
>   	/* cdclk should bump */
> @@ -394,8 +362,6 @@ igt_main
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		igt_require(data.drm_fd >= 0);
> -		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
> -		igt_require(data.debugfs_fd);
>   		kmstest_set_vt_graphics_mode();
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		igt_require_f(hardware_supported(&data),
