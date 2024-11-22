Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252ACE65D29
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D926110EADD;
	Fri, 22 Nov 2024 07:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ug3JWV7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B198810EADD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732261944; x=1763797944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IAeH38pVOXd58P0a1rQn3w3KyiEuPVrpnIYYSNbZLn4=;
 b=Ug3JWV7hU6Qv9VqeqsCEY6ebkyRpvfXkxengH1wnd5GUrb8XIdabTHqQ
 MapFmT7te2yDgIeXgxS+pLjZ5ixXxGkSy9j1O7WaHxKEDR37qyxQ6dWTW
 /IotVHXMaa6nCGv8hUH1mVLsYx5Qsrrdzi5HD/U4SGSBDPLKFkUX0IJmb
 G5aQxzNNGTRPelaysFGOg9jW98FMoAfEyoOa+9kUpTpc/D7qjvC6royRx
 xYbYiHDJ5XHYvqyb8rQGfcPwToMb2TMoWZzR6H6QFB3Pwfas3ZPGMiY0X
 TkdRV04HpC7GSGKhRbChfk0/QUA8yM03/o2EOvkLUlzQLtekApPyXG7C4 g==;
X-CSE-ConnectionGUID: qKS1AEF0SnuofCpPcchk2w==
X-CSE-MsgGUID: b+Qco7ySSom+fZ0ExMbh9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32561681"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32561681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:52:20 -0800
X-CSE-ConnectionGUID: mvc01Js4TLSskHY3f9DhWA==
X-CSE-MsgGUID: y+lNqubzT9ufLsuxr7Ijnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90872916"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 23:52:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 23:52:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 23:52:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 23:52:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxZWslEgiTrPKq1Zza6ZCxht7TA+jnkJKDx8TibiJVJU5EyZ4/MpvPLrIHdAtcDzO3rTni87VLlRNH1eOW8+jWler1C7b7UOymjzg0s++lMWbR5xDJkjK9G+H8AC1Go9xW/ADTfy+S7h4CEN1AEE0M5TsecC8OkufFRcCfXsSNx0DAJNAaEj8Jt4fgE91T+tMsrflYK6m3Bg3K/YgDBvFPOL+GSwSGb5S/JFHnwrjeyjaj6qjP787kD+lfyQn3NQDDAneIcnR+2GXqSyI9hDH9UGG4UhHsan6/ltvtnupzEtHpKLJ60kwY+NtWnMs9HGx4chr3cS8iiET76YY+SZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR6JVOZG1/humqETyin+W+XFkDtrE98+chvssOdh6dM=;
 b=hBjmHNAC3jhaXjEnaukJYNBWyuE/E6APHjJs8H097F5ryG3bC6uJp3o7M5nvg1e5NIcndQnrwLaC9ZGHZkeBR8D/c/ZtWRG/W0VJxYPrFcJSuMIaWVay9BXpUe93w6uTsrZSLiYfRZChmYTJ2Vjf/mp+pvlTgfVTvicsBz3wtsKZv+ZJtgWXDpN0X1E3MnpInjSKC4otJJkkuQywL7Z9VtNh68NAXOx3atVBAbqyLi5P3J+a7Qz5G7hmf9+yb7bn8oh3Lo5MdTu/y1uem2tSPmvD/7KSAOsTyWueetuG6j43T+nKi0MY6llRUpR4YZuXmuoC5eiIpv9/txd/oAn4FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.17; Fri, 22 Nov 2024 07:52:09 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 07:52:09 +0000
Message-ID: <b4d29d9c-b828-46c6-abcc-313f6653cf16@intel.com>
Date: Fri, 22 Nov 2024 09:51:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/gppgu_shader: Add write D32 to ppgtt
 virtual address
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-2-gwan-gyeong.mun@intel.com>
 <119dcb83-dca7-446f-bd0b-d028c76f54c5@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <119dcb83-dca7-446f-bd0b-d028c76f54c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA0PR11MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff9226f-7e44-4b72-48f3-08dd0aca90fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmdKcjZJTXE0Nm9Fcm50TGt6YnBNTWJZL2J5SnRJdmxrSXk0TkxFczMxenJj?=
 =?utf-8?B?b0JtK0FleHlGbitIb3J3bCt6Vm53QTdDRzBia1JwUHpxODBwLzVtSy9mQmhw?=
 =?utf-8?B?Y2lYVzZqQWdDSXBINktvRFNVbzFQWEVZbUt1NEtUSHhHbHRldGxxYWRhRXNL?=
 =?utf-8?B?UE5ncmJHQWFPUDVyMzRQWWhrczdLNlh6NkFjS0lqYVJPVXQ3eGIrTHhTVG1M?=
 =?utf-8?B?UU0yZWFBWnVOQ0ZJelR5SEdJcCtQV3E2bVNlaFFOWEdpcEY2a1VFT1Z6OUNC?=
 =?utf-8?B?Rkk1a2VwOVo3QmI5NFNmdFBpa2ZESStzRVhQc0hraEFheHZkeTQ4MS80eVFx?=
 =?utf-8?B?WS9Da2lCdjhoMnBBdjc4SkVNbW1JTHBHMTNyWjM5SGFONExiSEpOQVZXb1VL?=
 =?utf-8?B?cVI3cGhxQUNBTEpXeXplQkZOUG5QSDQyb2xXeDk0R08veW42TTl0cXVPUS9W?=
 =?utf-8?B?M2U4cy9DQ216Uk9GUjkxaTczbVlBeC9vdER1QkEvQVo5clczS09XZlZRMjVq?=
 =?utf-8?B?RVRPUHdRTXhOWm85SURqUUZjZVZmdUliWEs4Ni9lTVYzRlpjVFNTcTNlbmxI?=
 =?utf-8?B?bUw5bHNQY211eWVMTWhVbXh3VXFTNko4ay9HMzgwUEV4Y0Rkb0czSlREZTFS?=
 =?utf-8?B?Z21HcSttTmt6NE1NZVgwMnkyNXVkWFhoM1hPaHljTUNPRFdoS3dyREgwUFNI?=
 =?utf-8?B?ZHJwKzR3Tng4d0J4NDJKSlZtLzM2Z1oxYVdUUlBvSUJDVCtpcDFYeXJRUXBh?=
 =?utf-8?B?TWVzZCs4NUNZMXRHTldZazRRQjU1VkFJYlJPZDZOb2RYcCt3K2xJSVljM3Ru?=
 =?utf-8?B?NGdhaHYzSG9aY2pyYWdUSmkrSUg4bVVzejhsOUZvMnBKWHJ0dXBDOW94ZkZ2?=
 =?utf-8?B?QnBzS3pyMSsxazB3by90NitVUmgvcEc1TWtObVFQV09LakJXL1Z3aDdrcjVK?=
 =?utf-8?B?cXFnN203VEpvSnc5WUNlSmNqWXBuYlVQUmNGWS9GRkxXeVNVZlJLQUxmdnRE?=
 =?utf-8?B?cTQ3aWZEVGxpTUtaVWdQdEhsekxIWHh1Y0JSdmFNVEJXTGh0d3hTbnF1d2FE?=
 =?utf-8?B?OUtoYWhXSmNXTy9YdkVVdmJ2QUFWYjdzQ2Z1K25YL0N4TEpCQ3N0NTFuckI4?=
 =?utf-8?B?b25rcFFYWFJaOUtneGxuVllzN2YreVNkL0xJTlp5N0VjMnFjQ3pBVC8raG1v?=
 =?utf-8?B?U2ZzazZOYUNKYjZGVStrT3VEZjYraCt3VG9FUFVtTGRMTWdTU3hkUVpTOHdu?=
 =?utf-8?B?MklQSE9kR1VRWjJSSm5GWVFHUE5aQ1V0ZVA3eEhLQjNQMjNEUzNkSHU1U1NG?=
 =?utf-8?B?Z2NRZlZFMURlejF0OGR1dVdZajgxT1pIN1BFK204U3hRdzRUdEcreG9FTW5i?=
 =?utf-8?B?NkEzdDBTRDBnTGR5VkFWRTRjQXFqQTd0ZVVDNlJBYmxrRC9MazJCN0w5ZWxa?=
 =?utf-8?B?SEF6TGIxeDJQbUZoT0x4TnU5akF3dUtURFR6STlmNzBDWkpOci9mWWV4T0ZP?=
 =?utf-8?B?ZmNKTWJ0bmxKaXh6M1hxMkJoTWtCS3Zya0RVY3YvYUlCYk1scFNzUnBrOFFs?=
 =?utf-8?B?bXZ6aDhBeWpyVEUxTmJLNHZqc3VnQ3h6eTMxZTNtRGlGWWFaZFp4R3cvSkFT?=
 =?utf-8?B?UlIwT1dhV1I2TEZNVVV3RndEZ3FTa1draERSVUJzQmEvYWtXbmVCSmtaTCtP?=
 =?utf-8?B?aUtxMUVuMmZOUnRPNmtCWlFtTThKZVZaQnBBUnBvRHJ6a2hoUVhWVXptTmFE?=
 =?utf-8?Q?YsG34v4qdbiFQ+KsdiijD+23W/URjlyx6CkqXvw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3p2VUxVOGxOcXZla2NFVE1NUVhNbHRSTVpvS0pNOEc4TW5OZkViR25rQ2sr?=
 =?utf-8?B?c3A4SXgyN3BwamVtalN4bktNclYwTDBlZXhIeEk3Q051ZFpTY01aWnlHZEg1?=
 =?utf-8?B?enNPUjJ3bytDOGFkS2RYOTVOaWlJcmpLYVBlczB3VTFvSHEraWVqb3AyR3hX?=
 =?utf-8?B?b0h3Sm5YVHhwZmtXcytGL280M3RVVjl6dGgxUW5lY2hZMnhiYTlRNGV0VkIr?=
 =?utf-8?B?azN1OVRGVlpZZkVvWU9xZUQyOVorNEdHWHVwMEhMY0prbEJUTSs3NUdUdVRQ?=
 =?utf-8?B?UEo2OWJXNWlYZ3dNQ1Z5NEZmV0MxMDZtbkVuOHJwYnBDakd5c0w1NXRDclZh?=
 =?utf-8?B?bUxkUGVVemVFandBVFA0TklnYWVMVVo3T0ViS0dCdU5sbVNzOWlMbEYvQ2V1?=
 =?utf-8?B?RU4yYk9BbmN5VGF2Ri95enJCMzFiUno3S01CUy8rR1JNY2Y1OTFGTDZiNTVa?=
 =?utf-8?B?SG5EY0JmTE9ldEliRWltU2dvMUpLN0pWTjFmTmhJQ05LSUxmSWlqRFFCUVp5?=
 =?utf-8?B?eDRFZ2Z3aDc0K1NPejduQzlKemZLdmhLNFd2a3k2eUx5elFWdExqTzVvSnhF?=
 =?utf-8?B?bzZhbGRiWjBHSzlaR1BLMEY5VzQyQUZjbUlvNEljTkJvZVo3dTcvdFBkT0gw?=
 =?utf-8?B?U1FGSTVzTTVoSVcwaEMyc1RiQk04c3RIemE4eHdnaHRmYk1ISGxLYzRYcWUr?=
 =?utf-8?B?V2QwZG15aitXdjZ2T0ZKRk85S0x2NG5VZ1paT3c5TE5YUFVqOGViOVNjbzlZ?=
 =?utf-8?B?Z05VQU1NZ25HTC9laEk0RVptSDRmM3FCWkNPOTRoOWV5ekJtc21yQ0ZRZ1gz?=
 =?utf-8?B?Sk8rNkJVK0lBcDI2cXB1OTEyQmhtUkQvbkZxZzhRTFY4Z1hqTHN3ZHlPR0ho?=
 =?utf-8?B?dWVjWVdJejBWMk1WMWNQbkNSdUlvdm5idjRzdWticVVKU0t2Y29FQTM3U2Vj?=
 =?utf-8?B?dG1TODg2MDltOFllSzRLYjA1a21TbTJxYk1FWTVSNVZzeS9EaDByMlQzZWpM?=
 =?utf-8?B?SUVWNXlBS2dST1NEMmtTQk5SejdONG4yd0QwVzVHcVVIMWtNY0tQWDdFdHhL?=
 =?utf-8?B?cHpocnFBeFl1VEFtMklYVmxhUGxQMzIySmswbWhiVTVvZWhSb2psdFJrK1p2?=
 =?utf-8?B?UHNIUjBPTkI1S0NkVWlGd3U5T2VLdFBISjdGMDZzSzBDZ0hBY1NyUEVPTkc2?=
 =?utf-8?B?aU4yV3drRVUxRFMwZEkyczE5V2xKQldZR2pQNU03NjFIR0xnMlBRTFJadWNK?=
 =?utf-8?B?RVpQTTUrYVpDaU4rNHF4N2x3V2ZWK3FRaEJZVi9hanpsWitITjJpMVZpZFNp?=
 =?utf-8?B?M3FpV2JRUnFjeTVZU0ZIK3Vpd3FPZC82anZOdGwvVjFNNlRHYUVrUG9LUWVZ?=
 =?utf-8?B?a28xdkhsUm5JS0xNcmFaNWt0V3pOODBHOHhpRjlWb0NkZ0VrWmxpYTRNbkFD?=
 =?utf-8?B?dmFsbWJhaUVWSGw4a05oRDhFblliTVdKWHBSSm4xRDRIQVpWT0lEMWhGZHhh?=
 =?utf-8?B?WEkvSENrQVJ1M1RuMGxIdGc0RGhhaHdFVCt1THh1WmN1dkE2N2p1cE82dHkx?=
 =?utf-8?B?d2h3bEthVmQzMm5PdXRaTmc1TVVqdVpDdnVNT3pOQ01kdXJxaFJ2ZWhWaUlT?=
 =?utf-8?B?Y2VJOTlFWEZFc0REV3h2aXBCYjI2aFQ0dTg3ZjZTK3lHa3IwOEVBNDBaSHdN?=
 =?utf-8?B?alZmd3dNSm91VFJ1SU1ERmlnR2x1QkI2S1pPQ25uajNlNnVRUmJOUWVjMGFm?=
 =?utf-8?B?MDRpaE1XZVhMamxmK1ZrU0JPdllzNTZpRkxoVmlVM3VXUWduR3RsVUdHM3Zy?=
 =?utf-8?B?SjFnNHhwU0NlMnBTMXBjbmt3elU4OWlTcWQrb3dXUXFzS2FlZTNkN0FhcGlG?=
 =?utf-8?B?VEVBM3BIZTdaVnQzN3h4TnlWemRxd0ZMTXNlUkc4REJJQmpnR3A4c3lYQ0RF?=
 =?utf-8?B?MDJXZmFmakdOcmFKM2RLUllnWXlwZHI0NVJWTms3NFQ3R3ZJcUhPVFhEVFp2?=
 =?utf-8?B?dG5YOHlvZ2MxOGhlRjdsRXJhNTRmWCsyVEhXRkpWMGo5dGFLd3o3dUgyNC9P?=
 =?utf-8?B?Z0VDdUt0YlNiZWV6bCtYYkxuN05XcHBjV25TcHoySnVHKzdESTFNL003dG5B?=
 =?utf-8?B?dFhFc3ZZa2w0ZGlZcVVrY04vbXBRVm1rc0xvazlaS0NrTEk5UUxTZWJ6NWZQ?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff9226f-7e44-4b72-48f3-08dd0aca90fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 07:52:09.0382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVsH/g07dsSONt6/2fxkLesF2S5lVOmATq+90dsx4tR/hhIjVHABemUkbSghobmrGC/7/zxoyTar9SWkuWLrJx59X2GIVheTJSJvd1HgTnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
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



On 11/21/24 6:08 PM, Hajda, Andrzej wrote:
> 
> W dniu 21.11.2024 o 13:22, Gwan-gyeong Mun pisze:
>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> Create a function that adds the capabilty to write an dword size at a 
>> given
>> ppgtt address with a dword value. Use an Untyped 2D Block Array Store
>> DataPort functionality of XE2+ with A64 flat addressing to direct 
>> accessing
>> an entire ppgtt address space.
>>
>> For the write to succeed, the given ppgtt virtual address has to be 
>> bound.
>> Otherwise a store page fault will be triggered.
>>
>> v2: Fix the function name to be more clear. (Andrzej)
>>      Use lower_32_bits() / upper_32_bits() macro (Andrzej)
>>      Drop unused code
>>
>> Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 94 +++++++++++++++++++++++++++++++++++++
>>   lib/gpgpu_shader.h          |  2 +
>>   lib/iga64_generated_codes.c | 23 ++++++++-
>>   3 files changed, 118 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 4e1b8d5e9..d9da35895 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -803,3 +803,97 @@ void 
>> gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>>       ", 0x807fffff, /* leave breakpoint exception */
>>       y_offset, value, 0x7fffff /* clear all exceptions */ );
>>   }
>> +
>> +/**
>> + * gpgpu_shader__write_a64_dword:
>> + * @shdr: shader to be modified
>> + * @ppgtt_addr: write target ppgtt virtual address
>> + * @value: dword to be written
>> + *
>> + * Write one D32 data (DW; DoubleWord) directly to the target ppgtt 
>> virtual
>> + * address (A64 Flat Address model).
>> + *
>> + * Note: for the write to succeed, the address specified by 
>> @ppgtt_addr has
>> + * to be bound. Otherwise a store page fault will be triggered.
>> + */
>> +void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr,
>> +                   uint32_t value)
> 
> 
> Nice name, could be even gpgpu_shader__write_a64_d32, to follow spec 
> convention.
> 
Ok, will update.
> 
>> +{
>> +    uint64_t addr = CANONICAL(ppgtt_addr);
>> +    igt_assert_f((addr & 0x3) == 0, "address must be aligned to 
>> DWord!\n");
>> +
>> +    emit_iga64_code(shdr, write_a64_dword, "                \n\
>> +#if GEN_VER >= 2000                                \n\
>> +// Unyped 2D Block Store                            \n\
>> +// Instruction_Store2DBlock                            \n\
>> +// bspec: 63981                                    \n\
>> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies 
>> both        \n\
>> +//    the block parameters and the 2D Surface parameters.            \n\
>> +// src1 data payload format is selected by Data Size.                \n\
>> +// Untyped2DBLOCKAddressPayload                            \n\
>> +// bspec: 63986                                    \n\
>> +// [243:240] Array Length: 0 (length is 1)                    \n\
>> +// [239:232] Block Height: 0 (height is 1)                    \n\
>> +// [231:224] Block Width: 0xf (width is 16)                    \n\
>> +// [223:192] Block Start Y: 0                            \n\
>> +// [191:160] Block Start X: 0                            \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 
>> bytes)            \n\
>> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)                
>> \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 
>> bytes)            \n\
>> +// [63:0] Untyped 2D Surface Base Address                    \n\
>> +// initialize register                                \n\
>> +(W)    mov (8)            r30.0<1>:uq    0x0:uq                \n\
>> +// [0:31] Untyped 2D Surface Base Address low                    \n\
>> +(W)    mov (1)            r30.0<1>:ud    ARG(0):ud            \n\
>> +// [32:63] Untyped 2D Surface Base Address high                    \n\
>> +(W)    mov (1)            r30.1<1>:ud ARG(1):ud                \n\
>> +// [95:64] Untyped 2D Surface Width: 0x3f                    \n\
>> +//       (Width minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)         r30.2<1>:ud    0x3f:ud                \n\
>> +// [127:96] Untyped 2D Surface Height: 0x0                    \n\
>> +//        (Height minus 1 (in number of data elements) of            \n\
>> +//        the Untyped 2D surface, it represents 1)                \n\
>> +(W)    mov (1)         r30.3<1>:ud    0x0:ud                \n\
>> +// [159:128] Untyped 2D Surface Pitch: 0x3f                    \n\
>> +//         (Pitch minus 1 (in bytes) of the 2D surface, it represents 
>> 64)    \n\
>> +(W)    mov (1)            r30.4<1>:ud    0x3f:ud                \n\
>> +// [231:224] Block Width: 0xf (15)                        \n\
>> +//         (Specifies the width minus 1 (in number of data elements) 
>> for this    \n\
>> +//         rectangular region, it represents 16)                \n\
>> +// Block width (encoded_value + 1) must be a multiple of DW (4 
>> bytes).        \n\
>> +// [239:232] Block Height: 0                            \n\
>> +//         (Specifies the height minus 1 (in number of data elements) 
>> for    \n\
>> +//         this rectangular region, it represents 1)                \n\
>> +// [243:240] Array Length: 0                            \n\
>> +//         (Specifies Array Length minus 1 for Load2DBlockArray 
>> messages,    \n\
>> +//         must be zero for 2D Block Store messages, it represents 
>> 1)        \n\
>> +(W)    mov (1)            r30.7<1>:ud    0xf:ud                \n\
> 
> 
> Shouldn't this be 0x3:ud now, for dword ?
> 
No, r30.7 needs to set 0xf:ud.

please refer the Structure_Untyped2DBLOCKAddressPayload: bspec 63986

[31:0]    => r30.0:ud  <= [0:31] Untyped 2D Surface Base Address low
[63:32]   => r30.1:ud  <= [32:63] Untyped 2D Surface Base Address high
[95:64]   => r30.2:ud  <= [95:64] Untyped 2D Surface Width: 0x3f
[127:96]  => r30.3:ud  <= [127:96] Untyped 2D Surface Height: 0
[159:128] => r30.4:ud  <= [159:128] Untyped 2D Surface Pitch: 0x3f
[191:160] => r30.5:ud  <= [191:160] Block Start X: 0
[223:192] => r30.6:ud  <= [223:192] Block Start Y: 0
[251:224] => r30.7:ud  <= [231:224] Block Width: 0xf
                           [239:232] Block Height: 0
                           [243:240] Array Length: 0
                           ; 0xf

br,

G.G.
> Beside those details:
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 
>> +// src1 data payload size                            \n\
>> +// Block Height x Block Width x Data size / GRF Register 
>> size            \n\
>> +//    => 1 x 16 x 32bit / 512bit = 1                        \n\
>> +// data payload size is 1                            \n\
>> +(W)    mov (8)            r31.0<1>:uq    0x0:uq                \n\
>> +(W)    mov (1|M0)        r31.0<1>:ud     ARG(2):ud            \n\
>> +// send.ugm Untyped 2D Block Array Store                    \n\
>> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc                \n\
>> +// Execution Mask restriction: SIMT1                        \n\
>> +//                                        \n\
>> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D 
>> Block)    \n\
>> +// bspec: 67780                                    \n\
>> +// 0x0 =>                                    \n\
>> +// [32:22] Global Y_offset: 0                            \n\
>> +// [21:12] Global X_offset: 0                            \n\
>> +//                                        \n\
>> +// Message Descriptor                                \n\
>> +// bspec: 63981                                    \n\
>> +// 0x2020407 =>                                    \n\
>> +// [30:29] Address Type: 0 (FLAT)                        \n\
>> +// [28:25] Src0 Length: 1                            \n\
>> +// [24:20] Dest Length: 0                            \n\
>> +// [19:16] Cache : 2 (L1UC_L3UC)                        \n\
>> +// [11:9] Data Size: 2 (D32)                            \n\
>> +// [5:0] Store Operation: 7                            \n\
>> +(W)    send.ugm (1)        null    r30    r31:1    0x0    
>> 0x2020407    \n\
>> +#endif                                        \n\
>> +    ", lower_32_bits(addr), upper_32_bits(addr), value);
>> +}
>> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
>> index c7c21c115..18a4c9725 100644
>> --- a/lib/gpgpu_shader.h
>> +++ b/lib/gpgpu_shader.h
>> @@ -85,6 +85,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader 
>> *shdr, uint32_t value,
>>                      uint32_t y_offset);
>>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, 
>> uint32_t dw, uint32_t x_offset,
>>                         uint32_t y_offset, uint32_t mask, uint32_t 
>> value);
>> +void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, 
>> uint64_t ppgtt_addr,
>> +                   uint32_t value);
>>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
>> index 6638be07b..e97bcf042 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/iga64_generated_codes.c
>> @@ -3,7 +3,7 @@
>>   #include "gpgpu_shader.h"
>> -#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
>> +#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
>>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> @@ -79,6 +79,27 @@ struct iga64_template const iga64_code_gpgpu_fill[] 
>> = {
>>       }}
>>   };
>> +struct iga64_template const iga64_code_write_a64_dword[] = {
>> +    { .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
>> +        0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>> +        0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
>> +        0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e354220, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
>> +        0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
>> +        0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
>> +        0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
>> +        0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
>> +        0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +        0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +        0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +    }},
>> +    { .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
>> +
>> +    }}
>> +};
>> +
>>   struct iga64_template const 
>> iga64_code_end_system_routine_step_if_eq[] = {
>>       { .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>>           0x80000966, 0x80018220, 0x02008000, 0x00008000,

