Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8780E109E55C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E12D10E9DD;
	Thu, 26 Mar 2026 07:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngh2ZBoG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7892810E9DA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774508472; x=1806044472;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KuvYXZ3nX+O0w/GpD1yJXUffYxcPVHuQ5Vealig+Ex8=;
 b=ngh2ZBoGx/EY8lVJSXORsMNzPi15N7i1MOBCYf2wIfp/l1KiItmtMbwF
 r7p/o8tIIsAEgMbPwknjdyGD0u4ec3P67hiCjPV5BPWFsdw7ewEVj+z8T
 6VQyZyX1jon+LQpaOMqLzqx+F+TKJe+vpNyYKbnjTe13r/DUR6kBOp1OP
 6S3GXHur+iy8wIlF6WTpFsY8xMhD5u/zSWt9TYGShmAQ71Gci+ccsjWa+
 E9VQ0lEnKJhpxyxBBC/Ekvdt1lBtRxaV9JvmAoyjoaXu7V8jDHqbPVkg8
 oL40pQquIsgruvRig6YaSjvrOhoyAKMcgQ6/+gcPprBY4ifU3e/EFMSnz g==;
X-CSE-ConnectionGUID: Waah4XTVSX6DQGLmB8Xopw==
X-CSE-MsgGUID: JTprifAeRV6vIFKnVT61Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74740422"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="74740422"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:01:11 -0700
X-CSE-ConnectionGUID: y9bqg6OgR5WqC34mMgR27w==
X-CSE-MsgGUID: 7g6+wJnFRQWanUYDfbzU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="222015677"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:01:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:01:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 00:01:10 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoVqs+qeyeH+xzJEAlo/AD6iGqcLR7fdxjPNTtPCD8viurpxu8ePxkihRV7aSsqZYS7mxhJkwt6dv+BbcxUBWvl+YR5bOa+F0C6wob+z2btiqrB+AnkhRaiQFl98et6OAFBHyjCTc69g1+AAHuY4MpIvpi0yOM/4RNSQ0x+8/oNTaYzNX8QBoT9yenxSWaiXsB3eKlDt/weEIyPo8G+Br8No1ONiL18baU6mEp3LThbCpa0WUtfYkZxijwrOrnguB0Iw0R28+DjK7udDQuYvEHRBDp4Qz2/ANMazYcYkgtGFbqkwGjm/bEAeLbdChPgzZlv5PNk2aZ665Fa3daMMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIHvIQVDiGJuQ7YSgWUrtoqMO50TU7SyxOaN6vCyIdw=;
 b=W8FSUvL8S1MxOHmq2Ak+7XFsJtL+L1ZXkPNiIv+GjuRJQ/fS1jJo7RoVuu8QE4IoL8zmV0qQEwxWmR4gjGf5KPZvT0pTk+qaQUsBYIRYSaIUr8gjfy7ea1Z6XGfxKh+bBTabzDjV/q/tjFeX1eOqWLBHLCvxCGeq8TpJtX3Nm27QV78Z1/cWGhHl7z51ZH/yWu+6grAtr8ckhoC0R18fuT6pP/P9pTW3Xaz5kcNPxX530/dJQS0uJu3KF7abKLEr0128i3ebNKjfdOSh66nA+v7nRgS2eEYYfyBsQYVWn35PoL3UkFLkeah/Tu7ZuWx6WCpiSkt/V88WRmXZ6RuA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:01:06 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 07:01:06 +0000
Message-ID: <d0d1c505-b2c0-49a6-83ec-6a202fc15509@intel.com>
Date: Thu, 26 Mar 2026 12:30:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/chamelium/kms_chamelium_frames: add intel
 related yuv restrictions
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260316161101.2808556-1-juhapekka.heikkila@gmail.com>
 <20260316161101.2808556-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316161101.2808556-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e84280-d22b-4f90-76fb-08de8b057388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: OUv3ztZa2HOiRUIKs6n16Shbjw2mxt41q7esDPGP8uJQzh2RYbRoKp+GWmpq0BZdnUZfIY7SQkNFFBqWQo1Eli4G1WzjzUdzn07bU7GwQxrp7nd3kJftw/+dgiM6WkOOfqOgVFT8h4r0JQYzKGxZyhBCvTQbU3zgDzIIZ0cYx3+R12hAFn042o11ge6dHBYIOQGb+Ap/BsrWF+RkA6oKc8rJn2xHovlSe0/I/WM4tBB0y7e6ZdR0GU8VaLZ0qXg/KRD03hrE8LcsvvyOCQPPh9e3tLxES6QqymSId4JhCsxkEMWmJ4f2YYQUYtc4OVUqb2i4pJzTffXSzhyZRg0tQQyJEBnPjVRm2iIgRTqzMDhiJ5EHWAgvR4YJ6IXdXozXaB/YoKcCNSRpV/dn/NfpRRxUwhpeyxH0ai8xpTJSE8jOmMZk0c14Hc0O0x7UGJ2lMbevUXaugC/+uorIUPWrusNf7ydYMHq06GpY+KNDaaFizd7Zwt8t/cFgZLhrgygpsV2xvSyza2PvMsfi0H3hzt7/BkdQ1MyEz9AY2ekhCHQuvfR6gI43EWNUajdl+zklQkiZQRD3NvLNNycftA5Yb4nivdQ70ZAwJuCKsEiPyjKZ6XsAe4WjuQeL57T0G5PK36H8xDkf3I3oygPoO6RyPmUgPU5AuqgPlQdiga8rwK39hX+EmS3fxQXYOlGXiA2eIENkxk2k1kcIDcMIu3n7GbKTe9qDK0kx5U8hUsZsBVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEs4anZqVmZkV0NpcEFzUm4wMlF0TWRjU2VjZFN2QmJvaWx5WWxLNWxJZWI0?=
 =?utf-8?B?bnJzbUZhUHNkL3dzeVBRU3drQWs2T2QrQ1hTOFhEYUo2ekE0OWN2RzU3d21r?=
 =?utf-8?B?Z1pvUmk0cTBJMlJUNUI0WHZ5c1dYblFTN2ZXbHQyUmwrWi91ZlQxZDU0QTd3?=
 =?utf-8?B?bm5Bcks4akhRVHhWM2ZlNDgzQUEyVGJaYWpGOUx3YkdpZVNYWU03bDQ5My85?=
 =?utf-8?B?QjJaTGhUV1hpRXpHRmFTVTJoTGNxS1JlRW16YlVySEZ0NmoxL05MQ2k5QjA5?=
 =?utf-8?B?eEdtcytXeVgwYkNjdzFOYW5DaFZGci8rY1crTjl1UlhHOXlmQ1V6aGRmK2o1?=
 =?utf-8?B?Z0xvZWl3Y2hYa0Z0Ull1VmMyT3ZzNm5DYTRRUGs3bkw0ZVc2YW1pRUpqQ0Vq?=
 =?utf-8?B?Q29aVWt6VHRLbkUzZ2xsTUpJRVc4WjY4UDJ6VmRhSHpUMmdEVTZOYVpYemdj?=
 =?utf-8?B?a2J3clhSYzV2N1ZxM09kVGJXbXd1Um53QXlpR0VEQ0UrSTFTWW90U3lvc2wx?=
 =?utf-8?B?TXlxdHNhTzdiMFA0NUw3dDBNYU1qaUIyaEFCMUl4a2dpODNJTHlXR3R0cldh?=
 =?utf-8?B?VXQzUWNNbk9rQ3pFZWVsVzk1Z0prc1JHT0tLcjZOSkVGeVN5dFVwTENkOE1R?=
 =?utf-8?B?c0U0NTUxTjY5Mzd2N1A0U2tScEw1Z0ozcWR0eExUOGgxKy9uelRaMUo3MGZ1?=
 =?utf-8?B?ZWR2MWZmN1k2WVZFY3N2OFJGakdLRVVWRVJjdkE3djBPc0w3UDFuanhvWkdp?=
 =?utf-8?B?b2hBYjh6N2dPeXRwUWVSUUdPZ2pFOGRjWmV0OVVnTUdXSVBRdmJ4aXNpUE94?=
 =?utf-8?B?WFRZbVd0YjVqVWplQ1ErWFk5b0o5WjJIbGloZWltK1BUQU5kdTBSdWlZMFJR?=
 =?utf-8?B?VnlLM2JDVzhvTzkxeFdTeEloZjRJQTBCYmFBczRIYytjTm9Ba1RHWGJqVURF?=
 =?utf-8?B?d3dyUFd6TXJkYmE3KzBCTjlMTU5CYjFFVnNXL1FrOVlOWFBUL1NTYlVzbUhI?=
 =?utf-8?B?NTdjSCtNYUtKS1Y1V1dJUzhEVnIyOGZ1RE5RSWJOQUVrVDlRT04vU1VDdXgy?=
 =?utf-8?B?VElpb2RGMnpLcTNKSVRRd0c5Si9HK0tRVGhNME55WG9IQ2lZOU1sVmlzeDRL?=
 =?utf-8?B?Sk9uTnZKOUNGL0lNMzJKZTJFczg2VnkwOUQ2aDFscVppeE9uczlIY0NobTFs?=
 =?utf-8?B?SHZNalc2WG83b1dUaHNSZnFpTFZ4NnZyOVo1bTlaVkZ4RmpYeGF2Yjg1Z2lQ?=
 =?utf-8?B?blVnd1huc2JuZTZTQnFxZkd4bmRsVENGZzJFMXRudndQczhqczB1dnpZbFNT?=
 =?utf-8?B?RXdlZkJVYm05MTU4M1d1T3FDVjlSUXcvUjhBaWcyQ01hNkE0NFc1TFRsbXdM?=
 =?utf-8?B?ZHBNY1NnQWR4QU5aZnZvbVVuTzNoOXNveVFtWWk5OXk4Q1pOd0lZSzV2L0N4?=
 =?utf-8?B?RFc1UDBiQTlaOXZtcWp4Slp4UTlXWVhSa2VNb21LVmhTQVdsU1VzUVJxZG12?=
 =?utf-8?B?UWdIZHdieDV5KzZMaWplbUNoQitLZHBDbUo0VGZyN3Q0SmFoL3MyTnNtQnNF?=
 =?utf-8?B?TjJHUCsrK2F4bTBLQWtLY1BPMDdzeEhNZ29PNy9XeFUwSExhbzhMNGpzVVJP?=
 =?utf-8?B?WmRsQVJ6V1FjcnpNVUM2SVI1V0hyNmd0YWZuTjJZVDZnbXBZN1M5NEp1TlVV?=
 =?utf-8?B?b0JXbSt5NlFrTS9seFRjNW1oVVBaTk92anNzUC9FVnhtekwzb0JzRWROSUlZ?=
 =?utf-8?B?NU5wdXM5UEo5R3dLUTAvZEpzNWZEY25HNjZUMGtQdjkyU2tWd0ZlUGJOb2ZK?=
 =?utf-8?B?STJHSW9vUmVQMmszbmNZUnBucHVGeHR3ajFtKzZmRlhvYUJnOWpLUXdzUkho?=
 =?utf-8?B?YzcwNXQ5VEtnWW5yVGZKaHpmdUpEcXRuanZpc1NzZTEzR2xqc29IOUJhTzV4?=
 =?utf-8?B?ODB6UEVyamo1RnB2MnpsSnhKWE9KeXhHZXl6c3hRdUEwSkJ5dEVIYkFqSlpE?=
 =?utf-8?B?REt5Q3h4NUNqWUZ3Vks4c29KNFNHd0FLQklwVkZSaWROUWNybFR2UjJpTk04?=
 =?utf-8?B?RDlmSjZ4aVpKSmY0MEhSeUpLZlplWW1TK3RTempqY0QvOEF0dmo4MTQ1ZnVv?=
 =?utf-8?B?Y1VLeHVJQlFaSjVIZFNXdExzdDNVTk1GSkdUQWJkNDl5RG1aM2M3RnpqbnVJ?=
 =?utf-8?B?UE1VVitySEdrUVRDM2xIU0NibWlJY3JvSTAzeHV2VUFDZ0hGeFVxVk43cGsv?=
 =?utf-8?B?UXdYU1dxSW1oT0VzTUFKSWdHY0wyalVGMW1HNUpnU2ZtY1NjQ29WMmgyVGhk?=
 =?utf-8?B?TWt6RWNKa252dG05VTlzR3AxMVAyUU83OFBuM09Qa2k0RjVpRHhEUT09?=
X-Exchange-RoutingPolicyChecked: nr0piwLbu/7zMHm5FdDHQ2iDGqy+OJYhXfCW4SlKtQy/hPlsxVz4C8k2rtGd5zheW6ialUvjGTpqjWkO3xz3l15cQg1WoyOHPeJ3zQ2cS4M5/FbrDKH+Wm2ppagnTPgBXcAZ5uFur1roijZVk15WQc63d6DlpeqNmshvgmRPlmh7HkhN554hUGljCk+lUsaN/sQ8asLAHBET4ixIdulxpUYGwQ9X1sEjowXQzjzQGIDjKkaOJ9vcjCxsJYdMx7Ys0hQOGKLzi6nhLLYih4gKw0/ABOTkYdKPF+7GhudSTPa7HSV9KESFDZoxMcxoO1akvH8k81l7HKtFKVnB7Ts4Ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e84280-d22b-4f90-76fb-08de8b057388
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:01:06.6299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixbC5VUFWQhyrIeUG0tPLxqkBx3kMEvErj5WIxTJUM9nKfouN/QfTF4MQhHRu5cGJDT1lu8/l3WYtPat/Pnyyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

Hi JP,

If you check randomize_plane_coordinates()

we already have fallback to align YUV to even if random config fails.

However, your patch enabled pre-alignment. Can you please check once?

On 16-03-2026 09:41 pm, Juha-Pekka Heikkila wrote:
> Add intel hw yuv related restriction handling; 16bpp yuv formats
> need to be set at even coordinates and even width. Palanar formats
> need to be at even x/y coordinates and even width/height
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/chamelium/kms_chamelium_frames.c | 33 +++++++++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index efd9ff1b7..404e32b87 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -333,6 +333,21 @@ static void randomize_plane_setup(chamelium_data_t *data, igt_plane_t *plane,
>   
>   	*width = max((rand() % mode->hdisplay) + 1, 2 * min_dim);
>   	*height = max((rand() % mode->vdisplay) + 1, 2 * min_dim);
> +
> +	/*
> +	 * intel related restrictions for yuv; 16bpp yuv formats have to be
> +	 * even horizontal width/xposition. Planar yuv formats have to be
> +	 * even horizontal/vertical sizes/coordinates.
> +	 */
> +	if (is_intel_device(data->drm_fd)) {
> +		if (*format == DRM_FORMAT_YUYV || *format == DRM_FORMAT_YVYU ||
> +		    *format == DRM_FORMAT_UYVY || *format == DRM_FORMAT_VYUY)
> +			*width &= ~1;
> +		if (igt_format_is_yuv_semiplanar(*format)) {
> +			*width &= ~1;
> +			*height &= ~1;
> +		}
> +	}
>   }
>   
>   static void configure_plane(igt_plane_t *plane, uint32_t src_w, uint32_t src_h,
> @@ -355,7 +370,8 @@ static void randomize_plane_coordinates(
>   	uint32_t *src_y, uint32_t *crtc_w, uint32_t *crtc_h, int32_t *crtc_x,
>   	int32_t *crtc_y, bool allow_scaling)
>   {
> -	bool is_yuv = igt_format_is_yuv(fb->drm_format);
> +	uint32_t format = fb->drm_format;
> +	bool is_yuv = igt_format_is_yuv(format);
>   	uint32_t width = fb->width, height = fb->height;
>   	double ratio;
>   	int ret;
> @@ -364,6 +380,21 @@ static void randomize_plane_coordinates(
>   	*src_x = rand() % (width / 2);
>   	*src_y = rand() % (height / 2);
>   
> +	/*
> +	 * intel related restrictions for yuv; 16bpp yuv formats have to be
> +	 * even horizontal width/xposition. Planar yuv formats have to be
> +	 * even horizontal/vertical sizes/coordinates.
> +	 */
> +	if (is_intel_device(data->drm_fd)) {
> +		if (format == DRM_FORMAT_YUYV || format == DRM_FORMAT_YVYU ||
> +		    format == DRM_FORMAT_UYVY || format == DRM_FORMAT_VYUY)
> +			*src_x &= ~1;
> +		if (igt_format_is_yuv_semiplanar(format)) {
> +			*src_x &= ~1;
> +			*src_y &= ~1;
> +		}
> +	}
> +
>   	/* The source size only includes the active source area. */
>   	*src_w = width - *src_x;
>   	*src_h = height - *src_y;
