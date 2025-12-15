Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87771D41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 08:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7910E1B2;
	Mon, 15 Dec 2025 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="felF9RBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55C10E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765788835; x=1797324835;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5mZTbCaXosMn9JoAEnZ0hXgXqzy6JgeEQCpQZ8SmcIo=;
 b=felF9RBDN96fuUGKxj6QM5IlQ1Za4vy/qSeD36sNxtC8sX5BarSYCQRG
 OC/h+/Ht4ncy0OFbSpihuELgROm4bCndHxIWkOpsg1qer18a6dvItB9k7
 pCk0TUiDlNNURSNCYWknxa75YjNnxijlULSAVOqFNlvEqPftd6u+B7zfg
 TEyWegh6jVZBR3zisK0X5bcaiyzqyaBWirZeYe86Pi5YajJcx/mgZ1dc0
 hXV8KXMes60wfJMedX2o7BYV98gig8k63slr5S8WkUaBL665WVkYVVnyN
 SCMy3h+pBDvM6lTrheSu+k24TUFovBCPKJtlr493M+drKmdM7vjCQl72d w==;
X-CSE-ConnectionGUID: QuZ5RXyPQr26Kl6IVkHxTw==
X-CSE-MsgGUID: 8bKWHLBBTZ+Cl4hVGz4ZLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="79056984"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="79056984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:53:54 -0800
X-CSE-ConnectionGUID: nc0FkkpyTAyhCNhGM6/66g==
X-CSE-MsgGUID: gFBRJ7hZRn+phtCziusSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="202172534"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:53:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:53:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 00:53:53 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 00:53:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9PLfHxr5ABQfCl4dAZo9hIo2GQkrCyFscYWtdkUyZ+CRKDVdAT/Muf26s6MjBfWVwXzibMEFdmXqzfyRVLrEcfiHefagpNQxDtS++OAD0ZxOWDqn4WUFBW2w9WMPI8jQEMeEegHh0iVcORt0OhRrdcB4ZH/ZonJ5kvFrXUwcRhai8YDRd7Ia3Uj/PYt+tMuKYooRabYYSd0q9jQwEAw3IKoymn6mll8AIC5DYBzwJAGJH3EPQsVk5TMjl5EOukB+O8ZHoMVSYuDcDqLbYFUyIZ4HI/eFb5SHBteMagfB+nftHmWBD7UAyzbld2/YEcmedfrXrnZUJjswdCYUib3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op2ll0VM1ee3+8OvQM9lqpQ0Tpw3qCTc+60RWSIym4w=;
 b=BRmMnPblQ5hIa5RidazISH6TtOAx7deRH91xpxQENX/q5UXkuu4wMtwAyBCSrlipqRHpvqhly9MJXi2krEqGvLGdr1i5q5qs0OPkn+mAv6u4RIUr5m3749M2pMRDoqP7T8mQvbTvYTdtGJE46JUHqul5TKBVHfkF5IoJIt1DXxHfZfcoys6qVJ0FRIcdBT+qXmblHQbRyPySh4xFf2PwaFHhHHa8JtymyBD81tBNFRfNQdELcVV1lONjkxAzZCdAPk6I1V1V7LYWY4spe2EuFAtxfDuhRvrzuFteEGPdNqX33qe5xA/n4JHoHxKygkVkQoJBhQTMAdmb8tPMhaSTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPF195D11F0C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:53:51 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 08:53:51 +0000
Message-ID: <b1a54ed1-ff37-4b7b-b11e-b7fb28aa1ece@intel.com>
Date: Mon, 15 Dec 2025 14:23:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <santhosh.reddy.guddati@intel.com>, Jeevan B
 <jeevan.b@intel.com>
References: <20251212055717.2870018-1-karthik.b.s@intel.com>
 <20251212055717.2870018-3-karthik.b.s@intel.com>
 <20251212123216.ewyroutl4gx4wrcl@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251212123216.ewyroutl4gx4wrcl@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0079.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPF195D11F0C:EE_
X-MS-Office365-Filtering-Correlation-Id: d75092db-3200-4f2a-628b-08de3bb77804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|42112799006|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjhiWnFJVmtrT1ZqQ0M1OGJ5aWJVYlBXN3A2cWRIaHQ2d1JCVGJESURjK1FI?=
 =?utf-8?B?dTcyNGswajlGcUd5QllseHFzMkRYWjVHUitrYTJQRVpvbmdpSlpKZGdIaGlQ?=
 =?utf-8?B?dVBYbnBJN1pWamZCN1RZb0VRdnpYK3A5Uk8yazFOb2wxazFCdGVBbXh3TDBx?=
 =?utf-8?B?SWR3UW9vVFNxU1JRSHlLN1pObllIRTBPTXFpOGIyNysyT0FtT0RxRUo3clBn?=
 =?utf-8?B?WVhUb05BU1ZGSEJaNXNzTjYrMXB1ZzBEQUg1NkRMUHh0eks4TStlMkU0RWI2?=
 =?utf-8?B?dkpteDc3MnNNRjk1MTdLd05kUUtjOGpkZkpoRjBWMVREaS9PVGsvQU1WM2F3?=
 =?utf-8?B?SW14QmtxdWk5VDhRNmZkTXFxL2trZmtTMmZGV0MxWkpUSHZyaitmSkV5SHQw?=
 =?utf-8?B?SktlaGdia1JwSDNlK25HQ2grenFPTjB0SC9qYkdESDhhcy85VlhBalJmakNl?=
 =?utf-8?B?WmZNOUZxTVhpN0lyaFYzRVptOTAwWGdPNjZqQ01UN2hWQ1plLzFGUjRHVUdG?=
 =?utf-8?B?aXltUXdQMzQ0QVM2YkswS2ZvdFdkZjNvZ0hXWDdjLzB2OEgzM0dOZjJXcWE5?=
 =?utf-8?B?d29tbGtEMEErNVNwY2hxMlZDc3ZrNnU4cnVnUWFOaWIwckF4aUcwUnQyYlVB?=
 =?utf-8?B?N1J6akRyS21ZRllvdStOVVBHS3hlbUVlQVpma0d0NkNJeGR3SkRJeDBlOWMr?=
 =?utf-8?B?cmRDdmxpVWdQVWZ6ZVhtK0pDeDZXMjRHTnBwMkY3TkV5YVVXeGdXbjhBbDA3?=
 =?utf-8?B?Y3JiR05lL21XUmtCaDJwdGxJYTFoSDl3bkgwN1Z4VVhJMWg1aGVIVmQ4Um5j?=
 =?utf-8?B?QVZyK1VQSDdLNnRQcW9kMlFERUNJckJ0OFpNL0M4T2RjTTNreVFObWpJeGNC?=
 =?utf-8?B?YWhBVWpzR2hRdE1aaWlsYUVYSERkVGJVSjcrWEZwVGNKYzdMNmc5UnBmZ3Nn?=
 =?utf-8?B?TGZOdGhXSS9zRGNDUG40NlZmRkl1MXovS256aUtaWGFTTTl2T212Nk9uWFdr?=
 =?utf-8?B?L0t2c1FzL29ndS8wY2xNOEs5NnVzQjJXalhPOUJrN1czYUFTaWk2VFRYNEp3?=
 =?utf-8?B?OGNNUHErWjNOd1YwbmoycGFOZTc3dUZVTmVuTHo1NmYwQWo1cE40NW9YZ1RG?=
 =?utf-8?B?ZklyMERoa3JSYnJFUDRWY2RJclVLdVZYTTN1RURTb1FleEFjeXBXZElrM2hm?=
 =?utf-8?B?d3FVT3ZLMWZ6Q1F1L1RHc0xIRys4dkFBYzlzeWpnaGNpMWJWNi9zbHpLblV1?=
 =?utf-8?B?YkJDQzBJbldVVXZuOFZ2TE01OEo4b2xIQ3ZObzAzSWpxdjNxcW83S2xpdGpR?=
 =?utf-8?B?UCtWOS9ZTEwrT2wrUUNQMmIxRDVTNGVJdHRtOHRXMENRUlQwYStFT3YyWVRS?=
 =?utf-8?B?NE1LNTU3ZTlXazlQbGJQSHY0emcxUDVoMmY0UFovYUJxWFBwa1dydWMxNEVt?=
 =?utf-8?B?OG01S2N2aUpQQ240MU5HcUZSc1ZCSmo5L01BTWl4WTJpaVVGQ01wV1ZmMEhy?=
 =?utf-8?B?R1F2VzFpS3A5QU5PTjBhK1U2N2FEQUJrNjA2RC95L2Z2YzNXZHNmZnhZU25v?=
 =?utf-8?B?c0UvczBycUtWQzNLa0IxeU5adXBlZTlVQ2VOU2QvR0NZSzQ4Nzh0T0htODZz?=
 =?utf-8?B?YXhJcWtKRWtGWnpjZ2V3ait6d3c2WFhBdUdJajlRaEJ0TmM2Rk9kS0hRRGhR?=
 =?utf-8?B?V2Q4U25udUZNVzNBeUIwbzNvd0lteEk1ZzhQbGhkbXpLUExHUGhJK0N3NGY4?=
 =?utf-8?B?MUV3ZzcxRUR1UVN3bnlrQ3NFalB3NHkzZXUyQy9iMXdmWE14b0dOSW1KV3Qx?=
 =?utf-8?B?TGkvR1ZQR3huWXgvNnduV1lvQWpmVkljTmRrZTl2ajArSnhaWUhpWm9FSXhy?=
 =?utf-8?B?MnFLSmg5czdocDQvTjdHR3hmOEJWVG95UGJ1SFAzVVljMG9CbEM5S1d6SFBy?=
 =?utf-8?Q?KkpJFps5V0DuMoLWxiDYuTzpgOEtTuD9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akErRzdaRmIxTmhqMVdodlQzU2hjL2Zsc2dyWlJmT1V1QnRrUk9HMUZSZzFi?=
 =?utf-8?B?MGJSSGJqMVBOQzJNSUQyc05kQWs2QlNoY3owL1BDQ0x4RjR3UjZ2WGJ1bFJM?=
 =?utf-8?B?VTZ2Rks2QnA1cFhVYlNKcU1Qc1VLMy9BZHh3N3hTN2FjeXd1dWpLN3RyVG54?=
 =?utf-8?B?NjNZdkQ1aTk1S3FZZGdheSs4ajlPZklWU0toUG5yUUN0QUl0U2c2U3QyNU11?=
 =?utf-8?B?NC9IS3VkUkJqMFoyRkxxUmpjcGR4NTRSdjhsQk5FakNJRHkzeHZYWGoralBk?=
 =?utf-8?B?a2ZzYktldmpRMkUxRTlKYWhjaTRWUGdBNUtiaFZESjdDRlRJVjFlNVNkeURj?=
 =?utf-8?B?bFZxNmNETWpTdTUyNWpKbzRGYzJwRGpOSzhiM2FDa3hvN0NPUjZNRHJZQXNJ?=
 =?utf-8?B?WFZDenRHTml5SG1DTUZURFlPbjVrZzZCV09zYU1ZWGdFWHRmUkRPVU5SdWtZ?=
 =?utf-8?B?OVJhMkpxekk3b01jODQ4NCs4SXBFSnRuVExuU1lTTlJtTzRRNG8rOEpBcmJs?=
 =?utf-8?B?NDdIRU8xMHh2bExTWGZkdGN6MnhIMFphQUZQNWJvandiZnhkRHBuNHNTUThy?=
 =?utf-8?B?Y0tiYUNQVDQ1RXNUU05Id3FLUzVmMnk5bnhZNWNiUjE1cjVWa3h6ejJrUksv?=
 =?utf-8?B?RzlYMDhCbzJEOVpwaWF5RlR6a2pISGNTNUxOMWxDZFNvelgyVmtPZ253ckZz?=
 =?utf-8?B?bS9WZjZrOEpTUG9DMXdnY09zb3czOVY3YTFKN1BkYTZyKzV5T0RvRUQ1OXhV?=
 =?utf-8?B?T01sNXNoSlEzbmtqZDhiWElaZmhqN1B4RTdKWDBkeU9lenArTzB1aHpIYWNF?=
 =?utf-8?B?UlJ0RmxyMjBqOE9OOXhhaFRSdEZoTlU1NEJNdGdHNWV0TFh2ckdJc0VqQkw4?=
 =?utf-8?B?eHp1b0wzc3Q4MmNpYjQwZHZsZVRvZTVwVTRYK1FseTZYUlRjaTUrRnNNUG1B?=
 =?utf-8?B?cy9TK1FQcEdGTlRORk1relM4eTBOeUo4L2orcjNwNFQzZFFkOEdVWXZpZTBY?=
 =?utf-8?B?NDBINGRWM0VpYUg5cWpYUXdpYWU4WG1yWTR3ajdVNG9nWjVyVk4rd1Y5Nml2?=
 =?utf-8?B?RW1JeEJyV0pHV1I5VWJ4RytMRmFyRHo5L3M2T3Qwa3pkK3hwL3lSLytNRSta?=
 =?utf-8?B?MnpReUp3RUo0VHNLU05qbENsemd1bDVlWlNxMEhGa0oxdVZKcEcyZGV6bENv?=
 =?utf-8?B?Q2FveDlCWDN5cWxwM1NZOWU0T1dNMjF3TllGdG0yS1ladEF4OWlxYVNHTm5L?=
 =?utf-8?B?cGhpWFkxSmhoOVpVUkpjQW5kNmNEOGJRdi9YZnowckN2WmZxQ3NIYnlycVc2?=
 =?utf-8?B?aktWZDFZdGNjd3lLRnBRemNaa0NUdVZvSmR2UCtLVmdJZkcwa1V5dnZDNHA4?=
 =?utf-8?B?MDlGNktRajJ3aGQycDFuTWVicmpMQjRJYXJxOHdpTy9oM0lWWkV2UmZCRkYy?=
 =?utf-8?B?T2g2dzMwalI0NktJKzRYa2NMQVBlS3BKNUxCMVBFcmhiNjkyaHBwRnNmS2F3?=
 =?utf-8?B?VGdWak1uQjc3RktINjlqSlBKaUhCOVlqdzYyYWIxbkl1L3BVSzE2ZlIyZzZq?=
 =?utf-8?B?YjZWNnJHa1NpYWRmQ3ljNnd4aW9MNHliOEd5SE4rNks3WFhKeGQ3R3FrS1dx?=
 =?utf-8?B?VDRLUDV0YjVJWE9haG5KUWFxZDZyOEhxbFByY2dkUlVxaU5Tb1Bpa0l6UGQz?=
 =?utf-8?B?MTl2NVoyWDQ4dFJ6bnJ4TmtQZU5KTGFIZnF5UXFuMWdrVmJJU2w5K0tVUDdX?=
 =?utf-8?B?LzVnNS81c1p0ZE5QQ1piWDRmSW5Lc2ZYdlpsSFZXT3lpZWxwN3hwTXhtUEtG?=
 =?utf-8?B?TGxvWWZUajJkZzlncExNTjJyZEhSMmxHK3hWQmxlaXE1OGR3RFliL2d4S0s5?=
 =?utf-8?B?SXhFOUNFLzN6NGtOZ1UzaXI1REFiTjVrQXEwRyt5UEJqRjUyUFN3MWpQYWRv?=
 =?utf-8?B?TjFXbkxUZ2lGYy9meG1KZnliYUt0MmhVQjJsN3I2ZGlRK0VFUGJsRWJNSXE4?=
 =?utf-8?B?ZStlV2pBdCtyL05ZSTNjRW1Uc2d0eUtQdG1sdTJxNHVrTndkOHoxYlhnRC8x?=
 =?utf-8?B?eVJnUlNLVC9YOUw2NHFlWjJJRjBOTXFKcGNCV2RsNDcrTGFjbWRoNi85Y2tp?=
 =?utf-8?Q?GMQvF2YXWMVcEdh3GMxC5BsdO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d75092db-3200-4f2a-628b-08de3bb77804
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:53:51.4964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxU29e6SHCc/MjzId7uHDfklq1YLPFftN3tatEvMxrJ2kRXiRPV4/vfjvfQXO58siO8d9TZYYAYnV4ePGumR0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF195D11F0C
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

Hi Kamil,

On 12/12/2025 6:02 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-12-12 at 11:27:16 +0530, Karthik B S wrote:
>> Move igt_require checks in individual subtests to a function which is
>> called from all subtests to avoid code duplication.
>>
>> v2: Use enum for various joiner modes (Santhosh)
>>
>> v3: Split the function for big and ultra joiner (Kamil)
>>      Use igt_require_f (Kamil)
>>      Minor Styling cleanups
>>
> +cc Jeevan B <jeevan.b@intel.com>
>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_joiner.c | 98 +++++++++++++++++++++-------------------
>>   1 file changed, 52 insertions(+), 46 deletions(-)
>>
>> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
>> index f8e684b47..ed82f4789 100644
>> --- a/tests/intel/kms_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -101,10 +101,16 @@ typedef struct {
>>   	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>>   	igt_display_t display;
>> +	bool ultra_joiner_supported;
>>   } data_t;
>>   
>>   static int max_dotclock;
>>   
>> +enum force_mode {
>> +	FORCE_ENABLE = 0,
>> +	FORCE_DISABLE
>> +};
>> +
>>   static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
>>   {
>>   	bool status;
>> @@ -179,6 +185,32 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
>>   	igt_remove_fb(data->drm_fd, &fb);
>>   }
>>   
>> +static void require_ultra_joiner(data_t *data, enum force_mode mode)
>> +{
>> +	igt_require_f(data->ultra_joiner_supported,
>> +		      "Ultra joiner not supported on this platform\n");
>> +	igt_require_f(data->n_pipes >= 4, "Minimum 4 pipes required\n");
>> +
>> +	if (mode == FORCE_ENABLE)
>> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
>> +			      "No non ultra joiner output found\n");
>> +	else
>> +		igt_require_f(data->ultra_joiner_output_count > 0,
>> +			      "No ultra joiner output found\n");
>> +}
>> +
>> +static void require_big_joiner(data_t *data, enum force_mode mode)
>> +{
>> +	igt_require_f(data->n_pipes >= 2, "Minimum 2 pipes required\n");
>> +
>> +	if (mode == FORCE_ENABLE)
>> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
> Should this be:
> 		igt_require_f(data->non_big_joiner_output_count > 0,

Thanks for the catch. Will fix this in next rev.

Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>> +			      "No non big joiner output found\n");
>> +	else
>> +		igt_require_f(data->big_joiner_output_count > 0,
>> +			      "No big joiner output found\n");
>> +}
>> +
>>   static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
>>   {
>>   	drmModeModeInfo bj_mode;
>> @@ -554,7 +586,7 @@ int igt_main()
>>   	data_t data;
>>   
>>   	igt_fixture() {
>> -		ultra_joiner_supported = false;
>> +		data.ultra_joiner_supported = false;
>>   		data.big_joiner_output_count = 0;
>>   		data.ultra_joiner_output_count = 0;
>>   		data.non_big_joiner_output_count = 0;
>> @@ -574,7 +606,7 @@ int igt_main()
>>   		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>>   		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>>   		if (is_dgfx && display_ver == 14)
>> -			ultra_joiner_supported = true;
>> +			data.ultra_joiner_supported = true;
>>   
>>   		for_each_connected_output(&data.display, output) {
>>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
>> @@ -630,32 +662,25 @@ int igt_main()
>>   
>>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-big-joiner") {
>> -			igt_require_f(data.big_joiner_output_count > 0,
>> -				      "No bigjoiner output found\n");
>> -			igt_require_f(data.n_pipes > 1,
>> -				      "Minimum 2 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_single_joiner(&data, data.big_joiner_output_count, false);
>> -			if (data.big_joiner_output_count > 1)
>> -				igt_dynamic_f("multi-joiner")
>> -					test_multi_joiner(&data, data.big_joiner_output_count, false);
>> +		require_big_joiner(&data, FORCE_DISABLE);
>> +		igt_dynamic_f("single-joiner")
>> +			test_single_joiner(&data, data.big_joiner_output_count, false);
>> +		if (data.big_joiner_output_count > 1)
>> +			igt_dynamic_f("multi-joiner")
>> +				test_multi_joiner(&data, data.big_joiner_output_count, false);
>>   	}
>>   
>>   	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-ultra-joiner") {
>> -			igt_require_f(data.ultra_joiner_output_count > 0,
>> -				      "No ultrajoiner output found\n");
>> -			igt_require_f(data.n_pipes > 3,
>> -				      "Minimum 4 pipes required\n");
>> -			igt_dynamic_f("single-joiner")
>> -				test_ultra_joiner(&data, false, false, false);
>> +		require_big_joiner(&data, FORCE_DISABLE);
>> +		igt_dynamic_f("single-joiner")
>> +			test_ultra_joiner(&data, false, false, false);
>>   	}
>>   
>>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>   		     "when the pipe is active with a big joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>> +		require_big_joiner(&data, FORCE_DISABLE);
>>   		if (data.big_joiner_output_count >= 1)
>>   			igt_dynamic_f("big_joiner_on_last_pipe")
>>   				test_joiner_on_last_pipe(&data, false);
>> @@ -670,9 +695,7 @@ int igt_main()
>>   	igt_describe("Verify if the modeset on the other pipes are rejected "
>>   		     "when the pipe A is active with a ultra joiner modeset");
>>   	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
>> -
>> +		require_ultra_joiner(&data, FORCE_DISABLE);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>>   			test_ultra_joiner(&data, true, false, false);
>>   		if (data.non_ultra_joiner_output_count > 0) {
>> @@ -681,12 +704,9 @@ int igt_main()
>>   		}
>>   	}
>>   
>> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>> +	igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "No non big joiner output found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum 2 pipes required\n");
>> +		require_big_joiner(&data, FORCE_ENABLE);
>>   		igt_dynamic_f("single") {
>>   			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>>   			test_single_joiner(&data, data.non_big_joiner_output_count, true);
>> @@ -703,10 +723,7 @@ int igt_main()
>>   	}
>>   
>>   	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
>> -		igt_require_f(data.non_big_joiner_output_count > 0,
>> -			      "Non big joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 1,
>> -			      "Minimum of 2 pipes are required\n");
>> +		require_big_joiner(&data, FORCE_ENABLE);
>>   		if (data.non_big_joiner_output_count >= 1) {
>>   			igt_dynamic_f("big_joiner_on_last_pipe") {
>>   				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>> @@ -724,14 +741,9 @@ int igt_main()
>>   		}
>>   	}
>>   
>> -	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>> +	igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
>>   	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "No non ultra joiner output found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum 4 pipes required\n");
>> +		require_ultra_joiner(&data, FORCE_ENABLE);
>>   		igt_dynamic_f("single") {
>>   			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, false, false, true);
>> @@ -745,7 +757,7 @@ int igt_main()
>>   			      "Ultra joiner not supported on this platform\n");
>>   		igt_require_f(data.ultra_joiner_output_count > 0 ||
>>   			      data.non_ultra_joiner_output_count > 0,
>> -				  "No ultra joiner or force ultra joiner output found\n");
>> +			      "No ultra joiner or force ultra joiner output found\n");
>>   		igt_require_f(data.n_pipes > 3,
>>   			      "Minimum 4 pipes required\n");
>>   
>> @@ -754,13 +766,7 @@ int igt_main()
>>   	}
>>   
>>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>> -		igt_require_f(ultra_joiner_supported,
>> -			      "Ultra joiner not supported on this platform\n");
>> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
>> -			      "Non ultra joiner output not found\n");
>> -		igt_require_f(data.n_pipes > 3,
>> -			      "Minimum of 3 pipes are required\n");
>> -
>> +		require_ultra_joiner(&data, FORCE_ENABLE);
>>   		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>>   			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>>   			test_ultra_joiner(&data, true, false, true);
>> -- 
>> 2.43.0
>>
