Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88FE9E308
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 14:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4718D10E0C8;
	Wed, 11 Feb 2026 14:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATU/GBr2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB4110E0C8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770818837; x=1802354837;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5WiXKLM/QdtzCxcwGFxrAKA8JWouJJrTcjzstlw8fbY=;
 b=ATU/GBr2XLwsgM8q547Vuxnbo+NxFSkW16BR7HtkJWlWVEEpbAfFDgXZ
 Tq9sdN/1MoDRzEK2b8TeA5ihs0729QHKHI7TKqRG7s6RKOtYniXH+Nh9i
 l7wPg0OxYveaoEoDSOGom6a0lOgewxHjERiGgbLKZ1VkUXl9K8b2NT/Pp
 Iod0MGWsV4Wst1pw9xty5txnXeqQgjN1g7i0VYWpoDXNJNNoEYxZQG8OT
 nbfDoslWj/fnH+mu3BnhnvbunvfdeH3yigKRvt8Liy0oryzxr/NUDepMk
 TOdx6tIfzP4oZTE9WbP2udmol2r3xrlucB4RAyGEcf9V2EnBFAeL/9rks g==;
X-CSE-ConnectionGUID: IZCNYmONRbKJY+Oo8lTeEA==
X-CSE-MsgGUID: 0nhvq+kvQF6FMGqI0EYbpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75809668"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75809668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 06:07:04 -0800
X-CSE-ConnectionGUID: sz5LXAv7T6Or/RUJhAVNFw==
X-CSE-MsgGUID: IgYvRV4MQrCM6BnjbiiUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242861954"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 06:07:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 06:07:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 06:07:03 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 06:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVXkhzSbVT8KJruQDQ19CRSlHFHNbZnnE/My5uLy0K6oJj3VfX2PJTMPqdvoIzNutDGERxtfush7VA5jqA0jK2TAoKdmzVco+Xsw067CzQsYaVLw+8tfNBk0RmMXJt2xIy9MoO44N56zpx6Sr0PoopBsQCI4xD3xiCgJKgStjcr9ISgpoVeTvwsUoFiFrEAdXv/2foHtPrTBBbElimJQqrquZoBvNSvmI7cVaxxWcrfTaA+VdLI4l13UMY2TG9dvRK5BmHJOyOtWzEmY6RpDDNAptlTK5dDsynEDDHxTVxc/jlerUlVnKPWHw3C6f1gPQwxIIeu2s0a3yAjiDNoYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zSFTMnlnLst0zgNQ3pdWW0KRmQHScKHiNw2YD9Bb1M=;
 b=wEY501t2YUfDF6D5czIkcp6i+JD9SYzfeH5GIPRYMBTfYr6itoSHnbzgvaljPqHhAecPUFXGLiD5RrxIH8d8X+LEirXQgktr9YLc033nlX/ab4M4Hwq3lfH3JdjWtEyDfnKLdxYvr5LOnt8wzjli0yi6BnFW/24ZSyJBKvejryunKVkvQKSvfT7r4HN6iQT7YI0pEgJFpqu+sUdBBKD6DNx8tTOEHVe+2iHdeHectjoXAArwsipbfaN1e91wuVXOvRah/j1YcKrymYFDBr8RzkjRh9RTtVDi0PyQd4gmlkLVgVwcKSemyKqWDlLsC/dsUbdySc4R5z7adWWobL3EZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB9463.namprd11.prod.outlook.com (2603:10b6:806:45e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 14:07:02 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 14:07:01 +0000
Message-ID: <243504b7-abf5-4ee5-9fb6-b2effa3e36d5@intel.com>
Date: Wed, 11 Feb 2026 15:06:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Skip canary check in
 set-breakpoint-sigint-debugger
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260211135549.14135-1-dominik.karol.piatkowski@intel.com>
 <20260211135549.14135-2-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <20260211135549.14135-2-dominik.karol.piatkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0217.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::38) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|SA3PR11MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6bfae0-67ef-4f47-32a5-08de6976d3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2RCZlNLMElRRVhHZ25TT3J6Z2VjMTYvSCtCeFJZcGpCa0g4Q2lsaEljejIy?=
 =?utf-8?B?aERCN1FPSHVxeE1WajBweU9zMFB0QzdKeU9FL2NBME5LNEdXNDhocG9vWFVC?=
 =?utf-8?B?OGZjRVcwR1lFUWw4NU5FZDJkY0R4OUg3c3RwM0V6ZVhSTitJdWlFTjRwN1Ix?=
 =?utf-8?B?WE5Kei9leUNWTE50d3hzc1JGNzE0cStCZGRrL1dFZVdwWnExL29YTWFJVG9H?=
 =?utf-8?B?OUd4WXZidER2RUZvYUo0cjFzSjVodDg4U1JsbTFaQkJBWTFYNW8vK1FaK2ZN?=
 =?utf-8?B?a2kwTWx0UlVFb0ZydDdhVGFjRWFkUEFOdHRza0JVaUdOOG5HRHhGUzhGczR5?=
 =?utf-8?B?cUViaUdodVFtVEhmd3lZM2Rrc1ljY3g4WlhaSkdBYzBrV3B5TmNUbk00aDZ0?=
 =?utf-8?B?Sk1wZEwvUklaREpkN3VVb2NBeERXbXZGTm1BelBKeFJvbElxVlFPRUtMOWMy?=
 =?utf-8?B?bUpjWkI3ODdGMVJUMjg3cE1KV1ROZVhPeWp0dU5kU0xwZkV4TVo1L25idWNM?=
 =?utf-8?B?OFRDWDBxeHFJZEYwZFBzZExYSDI2Vy9ScUp6R1cyM2c4OEJjNUxSR243M0kv?=
 =?utf-8?B?LzRtYm1LVk02SitpOENzSlFkcjJ3KzFzenY0OGpzcThzcWovQTV3QVljOVZw?=
 =?utf-8?B?N0JLcDFiMDduMHhtWkhUcFlRSko1Qmw5Q2U1OHl0ZW5IRVdnRHRBaWpRNWxv?=
 =?utf-8?B?WDhDTi8wY1UzWUNDWnNwaGsvSzY5T0dzZ0VsUlFadFQzQmdtNlhYTUpMaWI5?=
 =?utf-8?B?bjkvQlQ5SzNKVndURzFlU2tsV04vVldCL3N3NG13OFVCQ05uRkFkRnc2d0lG?=
 =?utf-8?B?TXNWWFpTc2k5enhPcVZxWk5nYVlUcXVGdTRhQlJ5VExPWHhVWFlzMzI1LzhL?=
 =?utf-8?B?NTdFY0JvQWJoUFBoTG04NUFzUU5kc1J5b2xCKzRlWDVyY0poMmxSeWlyMk9z?=
 =?utf-8?B?TXYwdmVIM1FMOHhlMmdUK1EzMDVDSFU1NDM5SkdyNjM5MXVicmFNQmR1UVlN?=
 =?utf-8?B?RUsrN01wbVdqd0xVNXhERnNNNzlaWk1aOHNVWDJqMDNsRUtRb2wwS2tpYVht?=
 =?utf-8?B?WlZPNGttQm0xbThpOVZFSDRtdi9zQ0FwYVRTWVBNM01ZWjhNWlhHRlJhQXlS?=
 =?utf-8?B?bVlZaWd4V2FZdnhZT1BOUjJ2WjQ1TER5K091SFhyNk10Wmh5dTNVY0lTTVVU?=
 =?utf-8?B?SDZiNGppRE9uNUZ3WTdZWFhQMmJYV0Q4aGlSVDZlNnZZZkVKcUxnNnJOZCs1?=
 =?utf-8?B?YzZKalRsZEREQzZWTEd1aFRIYnkwTlFESlFYRThkY3JYS2FXUjhDSWFPSmgv?=
 =?utf-8?B?SDVYbHZ6SmJRYTVhZEFPQnEwbGxCMkNpMkxWSU9uY3FxemwvaDR3L1ZaTmd3?=
 =?utf-8?B?djhYdC8xQ1B5VUNrWXgvdVJVT2ZRT0ZvZ3RWSnVScUp1dDN1dkF5OHBkRDJI?=
 =?utf-8?B?Umx4eWs2YTBtNHJwM0p0ZzczSDU5cy9mZllMZzNKTEF5RmZ1K2xwYzhqWEx4?=
 =?utf-8?B?TU9rYUp0Y1NndlU0YUZKa0s0aGxac1ppQStjVnhmM3I4VUxzOVlkQXFydHZn?=
 =?utf-8?B?RXRmYTAyN2RYYjRaamVwMXVMUG84a2cxczZjODZMWHRlM21XbHhYQnFMZWlt?=
 =?utf-8?B?VUpFSUhOc2NWd0lYVzI4cldZREkwcXBTYzd1bXU0MU9YSWptV0haNkp0S2RR?=
 =?utf-8?B?NEFoYWxKZU50eTVFMzFOaGI5RmE4bFozRWVkTUJERGlDU1J0QWxQa21jZis3?=
 =?utf-8?B?V0JxdXF5bEM1S2xRa0JZMlE0Z09ac1BmdC9xWm4wRWNYT3htNDVjWkJvdjNF?=
 =?utf-8?B?dFV2K3FuODNhZDY1a3VoRmdDekVUeHdLQk1pbWhIYmEvbHRzWXRJb0VOTUlT?=
 =?utf-8?B?YjNwcFJiN3YwNDRWaDIxK3BJWVE5OWZJMGQ4N2VGQm5vOVFUbUpFSHFmcEF0?=
 =?utf-8?B?ek4wditxM1Z1SjcyemN1eXNOVVl3eTRQaUw4WDQ0WFNQNytqaFlMMW5aK25v?=
 =?utf-8?B?Ujd6Ty9WTG9MT094M0FuOWhGYTdIdjZ1eUdIU0Qzb25wMHFncTAvYUxoM2dM?=
 =?utf-8?B?bHQwV2czSDJwSDVoUk1rSXFWK2szZXV5SW5zN2RuOEdmSUNqem1GclovUXF0?=
 =?utf-8?Q?Dd9I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEkxMEtlQzVkWXZUTmNwZEFCZjVkRFNxTWVRT1dNbVkvcnQyTlFsZktnUXVp?=
 =?utf-8?B?dGdiRDY5MDltYjJIV08xTUE0NUNlWlgvV2kzaWRqVDFrTjZxbEdWcE5ma3hj?=
 =?utf-8?B?TDhvZVJKRXpiS2ZqelFLVkMwMlk1TTI4RFNmZUQ2TFRxanNRVmdMMXgvTkZi?=
 =?utf-8?B?aTBUQ2NVcS9xYnprVjFwZk1pUGZDd2lTWkRucVdTY0RVMmpSNDJ0VVNvSk85?=
 =?utf-8?B?bTNxODVJQ01ZS2FpMXpNRitSL3gxU3Vaa0IrVDlPT3k0NURaekErQldEYWpV?=
 =?utf-8?B?bHNHV3hpOUlqWDJCRFNyZHlUUDNNTjNFdmxwR1lYdmJwNUZ4MTdvbk45NU0x?=
 =?utf-8?B?ZHIzUWlPaXIvamtvNzFzSjJnb3VEajl6RldRQmdibGxoUXFLOUMwdDFSbVA1?=
 =?utf-8?B?TUdSSDRPT0ZsZjJzcGxlRmcwWmZUczQxbVNDZWJreUhkQXAzQXpSMzRhOFVX?=
 =?utf-8?B?T2JpSDZ5L3hZZ29QSkdTREJQN0ozaDhwRlhVeGp5YU5Nc0tQVXdNVDhkNUE5?=
 =?utf-8?B?ZTVRSHRWTzNyckdIdDVkckxNOS9velFMV2ZQR1VIbytRc3YwWjZtR3hVY0Qy?=
 =?utf-8?B?M0RtMU1vODd1WWFSdzNlaHRCSjVOcktGVWg1N2IxcXpwTGpDckU1dHI5a1Fm?=
 =?utf-8?B?TEowdHFyOWg0Y3ZKQTVhcjJrTVhQcWFYdk83R2xXcWpNQjdUZ2hZaFo0cTg2?=
 =?utf-8?B?SGl4L1pCY3ZscEpMbnZRZldOU3hqbG83NUdFUEtRcWZSYTJqTGJCTzhFdUJR?=
 =?utf-8?B?cFRHckI2VFpJSlV3Wmp6N1JmVUpiTDlmcEVidGxjM2ZVY3JzOWgzYWV5VHNN?=
 =?utf-8?B?dGRZUjl3WjU3T28vS1g4MnRUNGZsNDc5T0J6aXVyUkRvMHBwaXplWVBFaGtO?=
 =?utf-8?B?Y0FhUVg1c2M2N1djNmpTUDlUOXBKQ3cyRk5PNXY0dk5IREk1YkVMWlFIZVha?=
 =?utf-8?B?QzNKblZFaVl6NkkrZzdMVE1PVnoxa1FKcTlPaHFuSVZxSnJiRjFtbUJsVkFR?=
 =?utf-8?B?ckhjazNkbk1yZklvWGw0NWFzTThmeVB3Q2JuYmtzK215UGIrWUN0TUpIdFJS?=
 =?utf-8?B?clFtUDJzaFVsMzlmUFdRRmQ4a1VHc0RVNjNKM1NLUHQ2U3E0TGNJVDJaY01y?=
 =?utf-8?B?TlZZU01uZFFscTRwOUR5K1l6dHh1Qk5sbld2MFdQMTZtekE4cTAveGF0UklB?=
 =?utf-8?B?SGswaEcvK0ROY3gzSkVyYmhTMkIxY1NWYUwyODVRLzVKOXBCeDY1cnFkcmEv?=
 =?utf-8?B?WXNYY3IyalBwZVhiTzlSZGRtOE8zZWk4MHN3Y0FETzJYdUFDaTFhM0RQQ1pO?=
 =?utf-8?B?ZktZamZLSHpVcngyYWVkLzN0Q1k4TDFsU1VYZnNGc1NGS29FZnFManpBM3k1?=
 =?utf-8?B?YUdoU2F0UVhlU0hYSFJjN0NNSm9BMVlBMXZnK0xPYldrcmxYRFoveDBlTklz?=
 =?utf-8?B?RFYxZkt2N04rWll6dXRiMm0wTjROUkdwNXJWanQxWVltOXowaHRuSjVTWGMz?=
 =?utf-8?B?NDNoUGVQUW5ES2dvZ3AyaEZ1aG1iYW9pYXhqRnllRmQzSUNGclNIWXh4eFMx?=
 =?utf-8?B?NXVZS0owbUlzY2tZbDAxdVIvc3c0djNBS09KUUhpVFM5amJ2azBnWWRCbDBL?=
 =?utf-8?B?dVB5d0ZDbG94K1JwY29Xci9UemJtWUd1RHJpTVhmWVhXZFREKzJFSUxNck14?=
 =?utf-8?B?eCswa2N2bCswcFZvTi9LZjBDV2YxTlRhKzcyNTFSVjdTNTNQNkZDRVQyOGVy?=
 =?utf-8?B?NzFyUzBlVm5kQWdkZWdxVTRTaklDVXB3QXE0eG1rK1UySnVPZWlVYlhET3kx?=
 =?utf-8?B?eUU1K1lPamV3dkVudU9ob0J4VVN4RWNMQUxzd1I0R2oxbkphTzRRV1BHQmFz?=
 =?utf-8?B?Um12dEJxNzZSV3pNdVFDMmtzUE8zOTZjVm1OM0pzUHh5YjlKNS9yUC9RMUJs?=
 =?utf-8?B?RlpKK0Myd0dCQXNNcWFaS2poWTc3OW91U2NIOXBpUEg5dEdRdEt1TTVnQ1FT?=
 =?utf-8?B?UXJTZjZ3b200TFZCRTFKd25sbVFkM2lpSGFmVkQzcE91NDJORDY4S3pQTnB1?=
 =?utf-8?B?eUR5MGlHM01BMEZ2VTQwSktxd0o5YlF1cFdlZEZ1cy9YT2xLZ0JwZVltODcv?=
 =?utf-8?B?UmtWblpLcmhzd3NJUHg5dlNVL0VWSGRMdjJySDVaazIyOTZTa09LcjEzQ0JU?=
 =?utf-8?B?QVRFMEdBdlZLdXhDd0tCL0hRREp5bWFEcDVzVnpTa2JadjBHeTlCOUdQL3Rr?=
 =?utf-8?B?ODJ1ajBmSStLcHlCZXlKVnV1dHhhdG5rcVRpeWtwOVRsRDJORHJtbFBBZ3lK?=
 =?utf-8?B?YThhdlc0Mm43ZUhpWGRVRG5WUUpWQzJSMklFUHZZVEtPdUdmaU9pT2J6V1pp?=
 =?utf-8?Q?vGOwrwzFH53/F/FQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6bfae0-67ef-4f47-32a5-08de6976d3f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:07:01.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0kIkeRVj1ANl4THSnEygA/5h8kmizLaz7VLRRN5uqC8bp/bZkvmhCQudySOWRmb7tbmLaeJ09EinENmaIKu80bE9wXgluAalQy1bwm+PSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9463
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

Hi Dominik,

> Unfortunate signal timing can result in tripping over count_canaries_eq
> assert in run_online_client in set-breakpoint-sigint-debugger test. Skip
> canary check in this case, as it is not important for this testcase.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
LGTM,
Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 39ecca479..059f918a6 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1667,6 +1667,9 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>   	max_sleep_time = set_breakpoint_time * 11 / 10;
>   	igt_info("Maximum sleep_time: %" PRIu64 " us\n", max_sleep_time);
>   
> +	/* Skip checking canaries as they can be invalid due to signal timing */
> +	flags |= DO_NOT_EXPECT_CANARIES;
> +
>   	ts = (struct timespec) { };
>   	igt_nsec_elapsed(&ts);
>   

