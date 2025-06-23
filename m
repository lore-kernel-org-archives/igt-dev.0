Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD4C7115D
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 08:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBB810E0F6;
	Mon, 23 Jun 2025 08:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzkLgXGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AE210E0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750665618; x=1782201618;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mmR31DH5i8zqa3nnzWz+oS3PjLQsqOhwOnRgKQDt/PA=;
 b=NzkLgXGwteUa8gw/Thl1LrS7Cu1Yj1YbWTVzqfFtnmT48pbURzzGSUYG
 EqD+ecuqWtB/IXOS1zQ3RRsFgJSbaaaHUy51bKWeM63VbbV92Z2IX73nx
 LURl/yoRtBcy661BOtGSJRkzQiDJfVPQhXihs5sg335aUDA20p6iTrRPk
 dF5C0fC+q2kCQQPzHiiCLKCn9IE3vpkSoLHRAloTbD19m0T0dwW0zgRLm
 07ByfWBNlKp+cW9IcVGU3dDSK9OM0xZhsf16loI3vRx0BcYPG+7rxWjUJ
 zNub4hHBr90Cw+m047wvxhytH/Y95fAt70ufIXdfcQf//zFTgFewG/Pbc g==;
X-CSE-ConnectionGUID: p1oSatxKRQaCjpn6wLIjeA==
X-CSE-MsgGUID: HdsPmoYHSO6uTqPz7xSlSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75393452"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="75393452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 01:00:16 -0700
X-CSE-ConnectionGUID: vM7hihGnS6mn/lSxRgRwNw==
X-CSE-MsgGUID: pyGZuXd3Q4ahtURycqXQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157305957"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 01:00:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 01:00:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 01:00:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 01:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmUI+ZX4rPbccCqkkt52ztUM23Dj+fyAftUnjgD0ecyRdO/3wo91IXk+SVeFfW/IhuvxeMnFuGhLXGu81cY9nrdfM4D7BP+J2v1ibPGUAogp/cNH1fdu68KsAKz7uzWR/HXO4c7H7Rk4N8+qPV4o+1ZKaLfMI48OqIx897XuqedKiC7LT9t9+ndv7jVGteV1Wvjtxs/HpBAhpvIIxtKJEcHT2LVkXs80/L/57vCE8tAMKQtpDyZKNJha7C4Mc1fr3Qc1m7r/bbDk0MViwnzYZOOUJeZbC0eojBnXAMWxuP6ua2W05KHvebwBGZGsadQBKZofNHy7EdJozi7cLQFwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xON6OV/Ko9X1Y3lnqp/T25l+3LNZrZIdCLeI9xZ48YI=;
 b=NfcLOZKMr63WQY0a1rinNdunWwdxKUM4sS/r2Kp+kim2pIS1jTo+NkLtXIdxk+rEWWObwzu3Q36FwOy7wOFKFGbVe9V+OYJoGs6cbChFBpnNQumPwVhVVRxgt4cx3BZacYdiDPwwwbV0/Yf1XPQmF83XoKPY1GrpYECnAmOcskAViJ7p5KyNTz/4ZEYZVm33qiew5NETuM1dGOHiaRZdYJETOoAzwTdiY5GJgTJHQFAOLoC7be2NtpLvXOrhafw990u9kxsO1o3zMvOkAQUB+01txZcaoSHYMhoukt3ERYzz5ePgdyP07w5hkSPGIfasJ2ojSRidGWHhd5C04TGnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 by PH3PPF23335A1E7.namprd11.prod.outlook.com (2603:10b6:518:1::d0e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 08:00:00 +0000
Received: from BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::28c1:d233:2034:754]) by BL1PR11MB5302.namprd11.prod.outlook.com
 ([fe80::28c1:d233:2034:754%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 07:59:56 +0000
Message-ID: <789801cc-6f76-4203-8de0-cc120cbb4a3f@intel.com>
Date: Mon, 23 Jun 2025 13:29:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
References: <20250617142707.490235-1-santhosh.reddy.guddati@intel.com>
 <20250617142707.490235-6-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB612984BBBEC9F5DAD579E12DB979A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SJ1PR11MB612984BBBEC9F5DAD579E12DB979A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To BL1PR11MB5302.namprd11.prod.outlook.com
 (2603:10b6:208:312::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5302:EE_|PH3PPF23335A1E7:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b69ad0-8e4a-4cda-479a-08ddb22bee2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejliaWx2VGdtNWYwYktvM3AxRlZCeWxzRzBiYVBXUGVxTjVtQXJFVk5oVFJW?=
 =?utf-8?B?ekRpMkcxN1ZMZEFIdTB5a0ZjVmhpbWJ6U2xhb2hWZ2U5RFlkcHRISU4rd3hX?=
 =?utf-8?B?KzJleHVpY3oveW9WNzF5QTJEMDR0ZzVlYVB6WTI1SHBwZzdiRCtELzM0emxw?=
 =?utf-8?B?TlhMZjZoSGQydXVJMHZMMGFOQko4N2dvRWZQcGJxVEloc3d0Q2N0NktZQmgy?=
 =?utf-8?B?NWlzYlZGRi9PZGo1SXVickptUXMzU0IxbGdPL2pCYVVlaUNPSHd1R0dHelln?=
 =?utf-8?B?YUFkSm9vT3Y1QTZYZW1ZUG4vL1AyalFjTnJ4ZG5HS0dqYjc1SlhiTkI1aFhs?=
 =?utf-8?B?T2IreUs1VVVQSk1SdWF1Q2NLdHlBc1lQaEh6RDYxd3dLMkp4SUU3MEpSZTh0?=
 =?utf-8?B?dnhZMjRnOG9zUkI1bDF1bnJIY3haWTFER1JPNTZLRG9yWUdmNVJLcVFEbFQr?=
 =?utf-8?B?dnJHU3l2MG5jdi9HSHorYkhuRUI1NmJ0WnBvdEtPTmlaenhqVk1aMWtEalM3?=
 =?utf-8?B?ck9TUVZDZE5iMFFNOFcvNW5ZU3lQa0s2dEREdEJDRkdyWDZOeStpM3poZ2xr?=
 =?utf-8?B?cHI5MnA0cVcxRkdrVGgxYnJvR1hORzZRMTF0QVVzNGgwSG9PVWYrSzZoVXJX?=
 =?utf-8?B?ZXFKNEtqbWlIWGpKL3dwb1I0RVgrM1ZnNmZINlNyVWxiVkkwdHBnMXBaNG9P?=
 =?utf-8?B?NDcxdndjZjBRTVpDaytRNDI3M3UyaTFjUGpIcnZ6Zzg0bys4WnM5OEtaMVhH?=
 =?utf-8?B?REJpODBySHB1OXNUcjM5VFVmTmkzejVWWkQ4bFR4bTdHUkdDWXpFOXVHaDF4?=
 =?utf-8?B?QmtWSGpWS00yTzFYbUcxZ1JQWGpGa0dEblFHMnd1Tm1QT2t1b0RTTkVqMW95?=
 =?utf-8?B?QTV6ZFNNdi9OOUErNVAvQkhrWjFhQ1ZJc3hUSzdiUUpVMGUyVmY0QVY2ekRO?=
 =?utf-8?B?bUdSVjdsRFQvVFI1OGRHSHJEKzBHWjErR25CbWYyVFNHTDBnK01iTjBWQ1Yr?=
 =?utf-8?B?RWl0UlJCbmt6VFVvbERzSFdraHlqS1FwNjE5S3NIemxtQlNmUm02eFdQeFFr?=
 =?utf-8?B?VTEwZHIrc2ZoSnRibVo4cEZkbHkxcml2bFFUeHlrOWhZU2k1S3p0WDZLSDRY?=
 =?utf-8?B?S1FQSW1qeDVXOW9FQWlRK1daZFZpMVFOSnRwci8xN1ovbXNEaDdNck4rUDM0?=
 =?utf-8?B?UWpuRnVtZU1lSmFpTlAwWjFyK2lpaFZhQUkzSzdwTlk4WUVHSGw2cmFCajd0?=
 =?utf-8?B?NU5WdWJHQXNsZFVEc0hsTE9peWY4aklFZ2VaMHp0Y2QzSGREejV5WUlxMHJ2?=
 =?utf-8?B?TXhiWXljY2pabXl3NGtKenVQSytqQnQ5aVRudUZUb3F5MDZIS3Ztd0crYUpq?=
 =?utf-8?B?R1JLWWFZUEozbTY1dTcyN05tR1RubGt0Vy9aVUNDU0RKYnJGS3pTY1Uzem54?=
 =?utf-8?B?R3VpQmQ1b2xQZDVYbWo0di9UbjJOdCt6dTJGcVZQamNrU1NOUWVzL0JZb2VR?=
 =?utf-8?B?QkJmdUFLa3JTc1QwRGtIM1V5MWdiUDd6UmVVTjF5aERNRGIrUVkzWElaeWla?=
 =?utf-8?B?TmRjaXNVN2lEV2NUR0phOXl5RDVYb2pualNFSEZIYlpNbFhQR3Z0d0F0WjI0?=
 =?utf-8?B?c0FkR1hmeTViV0UwN1lqTTJHVS9EMGs3VU1Vb21VR3ZqcHB6WWFCNzRVVURm?=
 =?utf-8?B?WE02SWVSUkFGVlJxbElSWjRob0Vsd2NDeDFHdnB3QnlLdXFnSlQwUm4rT2lT?=
 =?utf-8?B?THNHeitmR01oWUhFNzBwblN1K1gyV3BabUdybXVzTUJWclkySEljYmh5cE93?=
 =?utf-8?B?VEhSMlR6c0J0Q09qMTQwb3p0aXQzOHBSaHF4eTZCVVc2VCtJV2NzQ2pkRFpC?=
 =?utf-8?B?NldkQXdoVzJpamZXb0hXZGFWd3VBYktxVmZtenV5T3dZVDY4VnkvN1FjbTBI?=
 =?utf-8?Q?YsP8DkO9AdM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE8xdXhzRk82NmVwKy9MdmwycE1yWlRFSFZqUWRKWnJoTklRVjBMelo0Q0hI?=
 =?utf-8?B?NllUd1ZVTmdvSEdPcHdiemlyRW1QeklTcmJPYzMyako3Y1pUNEJRUStYemha?=
 =?utf-8?B?dXhpaWNYT3BldmZ2OTNFd05RZ0dtaEtadzlrcytGLy9IT2ticC9xZWtBRmV3?=
 =?utf-8?B?RVBVbURhQkxWZGFZQWkwZXlWa2RzYW8xYXRnc3g5eTZUODVZQzJCblBoNXVk?=
 =?utf-8?B?L00xeXJZN1h0c0RleDlNVkZSM21zcE9xVjBydGlaWTJQblBjUTY3VmRHNzNp?=
 =?utf-8?B?VmJnNHRqeDQ4NXJFNS9WWW5UZWhhSjBBR25DSlVRYTdQeC9tRzdCWHV0a2Zp?=
 =?utf-8?B?a1Vaend2WTVjeEhWWTBnbTZPdzBCQmpQaFNSK0M3R2JaSnptUEVrbnN3WWJw?=
 =?utf-8?B?Wi9hRzJOYmQrbnE4OVpyU1gwWUlNMStQRVFIK2hUaktZSVpWRWVDVHdZeWxz?=
 =?utf-8?B?d3NYRkpOSG1OZkNmU1BBYldaUGdBd2ZlbWNWVVhIdnR2cUEwdk51UW5pcWo3?=
 =?utf-8?B?ZEVTMEdIL0NBWkp5bjFIVlNIYnJEMWxUaUpBcjJvTzJBVytXRDVKNmZQSTZI?=
 =?utf-8?B?NXN5TzJERTR2RkY2Rzd3TVZzTWFxdU9BRmFHa2dLQmViQUg1WEQxbzRPa2xF?=
 =?utf-8?B?VHlLK2ZGTDB6eUtoZEdaV0lhcWhsK0lWZEdEY05vYVlWK2tsUVA3bkNucnhH?=
 =?utf-8?B?UitDUHBNWHp1ajNoVHFPU3lsbFhKMks4L3dDMmtaeXVjWU5ITGhLb1lTME5r?=
 =?utf-8?B?YUZ6UEZyNXF2ZllrVTVUSitHWFpodndXYjIxMDlFWmJRbHNjdDBxZklqWUZ1?=
 =?utf-8?B?UTNWV1Q2akVMNGYyMVg3TjBkdWt0MndEY1oxM1A5WUpzYzlVYlJuUytJLzZz?=
 =?utf-8?B?SG1ndTFka2p1R3BGZXpGVyt2MElNalNoa1BqZGl0ZzRLT0VNL1QyUHU3VHls?=
 =?utf-8?B?aC9wRFZubzV0Q1lUN1EzL2ZkTEFxbmVaUHJFUktxRStCL3o5Q25pME42eGZH?=
 =?utf-8?B?OTJoYzhaR0NOaFNEczU0MGYwckk5NjFwWndwYjVGZmQxa1o5VGptb1o1emkw?=
 =?utf-8?B?bzFhRnhWWkxaQWt3b2xIenl4QVRCY0MzNzB1NlE1L0tYTHQvc21mWElZejRI?=
 =?utf-8?B?MlRtR0kxOTR4emtKRnI4RGJ5U0xxL1pqempwYmFJYUN5cE9wSUFRcUJIUjBD?=
 =?utf-8?B?RGxESENCRUh2dDI4amZrWk9VK1p1bFc0MFdIbDMveXFic0I4R0xUQ1M3L1h0?=
 =?utf-8?B?NXBWQzg0dVRjbkpHNEpjMXZmWlFRSFkvZnRiZm5lUDRBNHpWUFowLzJRVm1N?=
 =?utf-8?B?bitRSElEYVdML29HTDZkSk1rL2VMQ2VWcmxuWklMZzNEdmZ4cUhGZXFablhK?=
 =?utf-8?B?cVhmZitWbHRnRUJTTlB1YWFseGdHQk1lSCtpVHRxaCtsS2YyN1ZXYVdncmxL?=
 =?utf-8?B?OG1vNk5qN1gybmJYL1FhR2haeGxxbGxJL0FkRzgzK0xZaXFCTmJ2a0lYWGJY?=
 =?utf-8?B?bmxrWmJjSm1GblBpUmRLM2gwSVdVelhKNDJybnd3QnF5VlhPNFk1dGdKdGlF?=
 =?utf-8?B?YTZxZWMvM2RBYjNEckM5Wm01UG96Vm5OLzJ2L3BHM0k5eDFaZWl0QjFYL3lj?=
 =?utf-8?B?dW9wZFhHelV1d0ZRSytuVFJyRGY0Slhya0tPeUI5Yk9CM0NKbFlIWHNSc3Q5?=
 =?utf-8?B?dEp5Y1lTSktjSWVrSUlVbThObUJYU3htVUR0aHpEcHl0MG1yenVQZ2lXcUMv?=
 =?utf-8?B?UHBUazVLbmJrN3pDODFWWm8zWlhuZG5UdkUzTDYrN295ayszYmE5aExnZytp?=
 =?utf-8?B?VCtNN2J2U1pwQWV4MjA0RUxIWk1DSHIvSHNMQjdHQTFqc2QyTVgxR2RoTXZX?=
 =?utf-8?B?MW5ISnZwNkpDQUkydW9seXFtczZtWGFvZGFvaG8xNmlwdEEwM0ZGTytRdTFu?=
 =?utf-8?B?QlhUTURpRUxpRVIzSVVKRWlCTnpHTW1HcTBUYXF4OEg2NXpTeE13ZE03a05p?=
 =?utf-8?B?QmZTSkhyeHhxWHBodFZyYTFUNTJsRnc3MHhZd0JVZjN4dERkN2xEaTJ6d0FC?=
 =?utf-8?B?YjVkL3QyNTQyeDJEY2pTM29UU2w4djV6UnAwaHZlUU52aHB3WTVPK2QxM2Rq?=
 =?utf-8?B?TmFZNVVOT2IwK1hhQnE1WkErbUJjWERIOWR6WTVPUjE0SWFUN2VtanZtMXA4?=
 =?utf-8?Q?KVcXEN9RLRxItZY/fw9i7GA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b69ad0-8e4a-4cda-479a-08ddb22bee2b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 07:59:56.7634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QE0gpbKlmwxaPCXLUJFA23xfJFTzmpYXGDmdmZQ/q2CMOR1mRU7f0SBgqoH+fHMtBaB4x3Jf5v1kOJhjGt1XpGvBl49ePCjs5be5oipdtFiiC2Vs5FhuUaIJ8AzhubT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF23335A1E7
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



On 23-06-2025 12:56, Borah, Chaitanya Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Tuesday, June 17, 2025 7:57 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v14 5/5] tests/kms_async_flips: Skip Async Flips with
>> Linear Modifier
>>
>> Skip the linear modifier subtest on unsupported platforms
>>
>> V2: Remove platform check and use in_formats_async (Chaitanya)
>>      Update the commit message
>>
>> V3: Fix crash
>>
>> v4: Handle the case for linear modifiers on platforms where
>> IN_FORMATS_ASYNC is not supported. (Chaitanya)
>>
>> v5: Move the linear modifier support checks to run_test (Chaitanya)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> e176b2a28..0c8f4afae 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -799,6 +799,35 @@ static void test_crc(data_t *data)
>>   	igt_assert_lt(data->frame_count * 2, data->flip_count);  }
>>
>> +static void require_linear_modifier(data_t *data) {
>> +	enum pipe pipe = PIPE_A;
> 
> This again the restrict the check only to PIPE A.

As format/ modifier support is output independent, PIPE_A is chosen
here simply to ensure a valid output is available for the test setup.

This choice is intended to simplify the setup by choosing a known good pipe.

> 
> Regards
> 
> Chaitanya
> 
> 
>> +
>> +	data->output = igt_get_single_output_for_pipe(&data->display, pipe);
>> +	igt_require_f(data->output, "No output found for pipe %s\n",
>> +		      kmstest_pipe_name(pipe));
>> +
>> +	igt_output_set_pipe(data->output, pipe);
>> +
>> +	data->plane = igt_output_get_plane_type(data->output,
>> DRM_PLANE_TYPE_PRIMARY);
>> +	igt_require_f(data->plane, "No primary plane found for output %s\n",
>> +		      data->output->name);
>> +
>> +	if(!igt_plane_has_prop(data->plane,
>> IGT_PLANE_IN_FORMATS_ASYNC)) {
>> +		data->modifier = DRM_FORMAT_MOD_LINEAR;
>> +	} else {
>> +		igt_assert_f(data->plane->async_format_mod_count > 0,
>> +			     "No async format/modifier supported\n");
>> +		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
>> +			if (data->plane->async_modifiers[i] ==
>> DRM_FORMAT_MOD_LINEAR) {
>> +				data->modifier =
>> DRM_FORMAT_MOD_LINEAR;
>> +				return;
>> +			}
>> +		}
>> +		igt_skip("No linear modifier supported for async flips\n");
>> +	}
>> +}
>> +
>>   static void run_test(data_t *data, void (*test)(data_t *))  {
>>   	igt_display_t *display = &data->display; @@ -806,6 +835,9 @@ static
>> void run_test(data_t *data, void (*test)(data_t *))
>>   	if (data->atomic_path)
>>   		require_atomic_async_cap(data);
>>
>> +	if (data->linear_modifier)
>> +		require_linear_modifier(data);
>> +
>>   	for_each_pipe_with_valid_output(display, data->pipe, data->output)
>> {
>>   		igt_display_reset(display);
>>
>> --
>> 2.34.1
> 

