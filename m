Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B753C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B891410E89B;
	Thu,  1 Aug 2024 06:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKJyH/a+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D6010E89B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722495147; x=1754031147;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=rl0C5lS9H/+vIB/TnnwVUWRnETa6K5zkfbwi6uVdhao=;
 b=dKJyH/a+zLW3RQGeGOjr0CRJtcuZdv435XS+IQrScefmDnEbmHW1KVCj
 JsaRa/t1D8e4QMMCdmdH18vaaEwgq24TjZZeOOeFV7kRtPnHrsQahskxd
 tC4UAzArHTUZtREHKmt+o1+YTwBDY/3Xdp8vG2XJLSbGUVxqi8UTApOqm
 7Cg8WSuG5nW5sQWHyUBd/4WblNjR+1EueSnwi2n0IPIwT/JywCI9RKNkx
 W/t2jNK6OPTjWFNI7MqQ+CUNxCTus4NHtuKi/JVeW6e+ud3aVFze14yPY
 gy7X2vQU4PSXg2NKmXiagaHaNKG75YLd//21aT9YiX5ps3xS8l3eRgTeX A==;
X-CSE-ConnectionGUID: c0KGVKtNQBKeeMixe5NP8A==
X-CSE-MsgGUID: qEzDcrfNQhiwKo5IVtryoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31811311"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208,217";a="31811311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:52:27 -0700
X-CSE-ConnectionGUID: XXEYBFGaTF66ECGxACsYwA==
X-CSE-MsgGUID: zOXKE72+RHGraPfp8sXLVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208,217";a="59735670"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 23:52:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 23:52:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 23:52:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 23:52:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 23:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYBMNnqObsIvJzBsaN3xHcO9Fie18K/0jg8MzuEZRagFC7pL65UpzjuN/g51Sf0/0V6SiwIrE6HsXzumFYJoyia+rBlNasC4cKzagEwlw1zD1w8j1z30Kw5CaubKFej0HZq+W51hCZvu8+CCyW5tnUlKtj9LRz19bvzG71oYD596ydFPbnfw0LKeKcegBn5HAXhfO8Ht+jxRzFtAhSGiJtq7PzZqsBnbuvgSE1dJCB1YvHk/fxKLK6ggoEt8AXJJ1GdS991tsE3P5cWoryX5cty8pV9DJUYJHnzPX/ohxtlHayG8Cor1WX0+1T0VI4jtca3qaLfLNFtaD/8KBYlwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf9ZgZhjl577EC6gl21x1fp1wtrWG1rlWXCK1A85Z04=;
 b=tPT0+KC9du9750xe1sZX52tw1t8iCyVoJsSkqzwxS32MU0qqh0DN7/saUEsnAl+M24HlXUSrL/OUYEc0umyT2H6A/r1NmqjMTbbzbtDdNTr3el9VXW1AqdpTcZ/Pi2WDYJUEGYeDwtUaDoDxIDkblGIpURg0QeiQBvfIFXROqBKg2/d/Z0b3NZjp1b8VlXKKj/Xt4bw6G8q6CF2KY9igicxptP2cDT0zViSDoXDUQZVGmM2OZCjDAAKk2JH7t0byyWk47dZDeCpvj4FbylQ2fwtYPVbamgUjddW+rl5jtyNXZ+wwMLFcfipOrX2PrWzazdrrxnjLINcbsHTOFvnV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 06:52:15 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 06:52:14 +0000
Content-Type: multipart/alternative;
 boundary="------------1F8A1qkXGd7Nnvx1tW6d2L5Z"
Message-ID: <187bd995-ba69-4d36-af87-1acc1f0d44fe@intel.com>
Date: Thu, 1 Aug 2024 12:22:05 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel?=
 =?UTF-8?Q?=3A_Add_tests_to_run_suspend_without_display_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <172234852903.429045.14170895324895203803@2413ebb6fbb6>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <172234852903.429045.14170895324895203803@2413ebb6fbb6>
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ0PR11MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: b8840432-2a51-4021-61b5-08dcb1f679c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0VLeSt2QTRHVDYyS3hiY210T1orVkZoYXQyUXcwRHlwNlN6eXBaeTdQRHFa?=
 =?utf-8?B?Qnk2WitJZTVBd1FHbnRTVFlpWW96THZHdEdxMjRZcnZrdTltNHY2cC9HODRT?=
 =?utf-8?B?MXpkV1QxRzdGMURjSEdIYk1aMmRmdGRvaTlPRjl0Q2NPTG1kMHp0SzBvWGhG?=
 =?utf-8?B?VGpVcnZZYzlqLyt5MktRQktDT2JYcGpBMXR5T1pHKzVRb1ZFVE9ybU1NdzVq?=
 =?utf-8?B?VWpIenIrVFZ3czNoMmZxQmtyTEU2T3R0NVJsVFNwV2dSQmNTN003MWVvam5j?=
 =?utf-8?B?NXc0am9CU3lsaElpQzV0d1JuWmxJK0RRbUliZWswSnZhZ2Y0K0hHa21NMW55?=
 =?utf-8?B?UndyRFZjNGJyK1JUVE5uUGNHOGtldmhneHpwdEduQ0FEdFVadWZTbkhLNDAz?=
 =?utf-8?B?cnBIMGhjT1BVQnZhcXdxV1E2cmRYclhlNXZTUEpmNFZzLys2NTFucFVudW0v?=
 =?utf-8?B?UXhKcWxUNG5HNTljUy8wUU0rMGs5WTdVdFo4T0Zrb0UyOE5uSlNxa21SWm1P?=
 =?utf-8?B?MjRlRlZTOXhjVmU5dnNwQ09udVByQ04xVUJCeEZzb1c2bHkrVUtvUkhPS2RV?=
 =?utf-8?B?c1hKUDRQcTZnVkdjbDYyYzFLbklTQ3hsUEdBNWtJb2E5V3l3NVNWVmpNQ1dx?=
 =?utf-8?B?d0ZaZ09iM00zRUZqNEwyQnEvb3Q0R0U3NXllUHlPRDFxTVNpZ0ROeE93QTND?=
 =?utf-8?B?UGVvKzhhcUVTS3Y3TDJqWlArYThlQnZ1UDNOMjRoblZtekZ4YWZ3R09vbVQw?=
 =?utf-8?B?MUJ6TmNDMndaK3lra3BRYk5yMkdpYnJ5SlJvWEtuQkQ1U1EyYlFyYmJlbUNn?=
 =?utf-8?B?RkVZU1FmZlB4aFFtYUlJRjlGd1Zna3B3aDFBQkduTUlEMEFMKzNta3ROditK?=
 =?utf-8?B?cldqRUFVWC9MY0FleWVXQ3hJZkhDOVlLQXhsdzcvWm1mNjU1aE9GcXVVd1hh?=
 =?utf-8?B?bDE5Vjlqc1NtN1c4QlEyeDBIRXFKdlVOOXNFRTdycGUvMWR3VDV6S2NHemRj?=
 =?utf-8?B?UUNrTnFUS05sY0RkY0tQbURLOUphLzZGbE9GUXlvekM2WWZ6Y2ZVK2JWYTdY?=
 =?utf-8?B?NHNEQ2pLQk9xVTV6VE8vcE5vZDZHczd6K3hNSGMrR1lVRmhVdm1Ca1JTU2lD?=
 =?utf-8?B?NC9Hblo4ckkrU2hmK3ZMcEJUa2dCanpXTU1XRUEzaTc3MFRBblR2Zlg0eGRy?=
 =?utf-8?B?TDFlOW90aWxJb29WLyt5dm9EQ3Y4ZFdYdTh3aEdGN2ZnaEZnN2hMM2hmc2Ju?=
 =?utf-8?B?cFB1Mkd5NGVhUmhKajZjci8vd1R1WHVSNzNKVHZ4QmI4dHVnY0lBNDYrblVB?=
 =?utf-8?B?Mnh3YndGOWdPU2hOTHV3TXU4bFc1S3RjaWJ5RkhOeHNySERTY0p3d0FGaTA1?=
 =?utf-8?B?Q2xIeFBhaDMzR3pMMGU0NThIVVY0TTZJanR1eUpkSFFjMWNCbkplaDkreXB3?=
 =?utf-8?B?ZlVlZDl3c1RXUk9mWkFYY3BCT0FCZXo0S3kyblQzbktid2swS09NbzRRUGMy?=
 =?utf-8?B?ZnpxaXJjTG5aYTVDa01RRVR6UzVuSyt3ZXBpaUVTb2c0c1kyNkxieGdKWHl6?=
 =?utf-8?B?bjNaRWU2RkdKOVRldlk3dGpwNDRWOWJSMDZuQ3JLeENsdkpIdWpqdmFrV3lP?=
 =?utf-8?B?UEJkRVpBc2x2MnJqYXBKYlB6OHdzUHFHQ0JORWFqTGVjRlYvdmtDa0ttOTRm?=
 =?utf-8?B?eXJFU1RXcDBsMVhRYlBKdTI1UmdxNWIwL1V3RUYyOUtxbm1keld6TDd2S3Bt?=
 =?utf-8?Q?bsiyo2YvqHAS/nNl08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZHOEFlWTJzb0NxWll6cjdaOFQ5RVRDNmM4NytqSUxIWEtDMU5tU2Z4Ukpp?=
 =?utf-8?B?TklRMFIrRXlXWE9jOEVoRlpzYTNNdldrNVFnVTFwd3hyWEQwUCtPYnY2eGh1?=
 =?utf-8?B?MjRwQ1lwMGx4d3ZIRytPbis3YkpkZzRnMGh4U0VYM3RXMXhPY08xMm40cnN6?=
 =?utf-8?B?UWRESWZGcHVVZGxGYUlpQnVSaWJHNmlTUWEweUZEeFpuVXhBdUlZR0NtWUR3?=
 =?utf-8?B?dEs4VnhkY0VPZ1B1RUZRbjArRTRJdkhLM1Z4amw3K2h6V3RkOTFHcEIvSjZU?=
 =?utf-8?B?cHk0dWhFRGFHSjF3Zjl1ajlaNWJGeXFwWDhyQWp1bzUwTHVtc1lxU2lZSitF?=
 =?utf-8?B?NWg2SElBZGNwTm10WEQyMThDVE13alNlUGV4c09WWlkzTElJVkVvUHg4TG5q?=
 =?utf-8?B?OUI4SnVFblZxSGRmc29CRTU5d0k0ZzlNMnRkRTNJWFBKMXYra3FNNldBdTFG?=
 =?utf-8?B?MWRUVi9FWGgzdFgrY3NjcmJCSThpY0lxb1hHRzZwc2hLOVJQR1JkQ1piUFo1?=
 =?utf-8?B?RFJ1TlMrZkZtYzhIb05RTGMzelRweEs5M2xTWHhUSFVvNlQ2NXY3eWZIUlFr?=
 =?utf-8?B?eHNqTkF6V212dzNETmlHZTFCdzBwNGwreS9NWDhlRk9QY0t6K0RWSEFsazl4?=
 =?utf-8?B?cTZCMkpsdWw0YWZiZWZOcHQ5ampMZXhEUFRPOFZTYUFoM3NFemorZFovZlRP?=
 =?utf-8?B?YXY4MTB2d2h5aXgwbzlxamtDNUxZWWtuaSt6dXlZNjI3ajlOREZqWVhHMzZV?=
 =?utf-8?B?VEgycE5CQjRVa1hET0FLdnhpV2V4SnhGZzF6T0Z5YW5OY25tZGV0UXpLaERi?=
 =?utf-8?B?RkZ2bFlneEZrdFBMQmxDYVVoMDBSTHEwMnF0ZC81dHl0RFlMQWJ6SGhQUzNo?=
 =?utf-8?B?cHp0SVF0MHFwWTc2YUtpaWhKYlFRdWluSXJvYmwweGMvdFd3TE1adS9vL2d3?=
 =?utf-8?B?bFFSMitteE5RbUtZRG80THU5eTJySW1kK08vTFBHSy83UTVlaWsxdGhnNGxU?=
 =?utf-8?B?bDEyYlRkdGg2TjNwcU9KYmpiNFpTRzhETUJZNEgwTG1DeXZ3VDFBZkpHUWcv?=
 =?utf-8?B?TEErcmpOSjdaYTU5VEJFMHE1dmgrdWU3emNYeHZBWWd5M1hDK0wvL3BZeG5L?=
 =?utf-8?B?WjYwMzRsMjdGTFFSeUd3ejdwc2ZkUTI0UzNYMUJheDMrazRPOW5ySjlsUWth?=
 =?utf-8?B?MnkvL1ZsTVRCTmJDU2lXU1V2eDlaaSs2NDlYQkRWeWJsSmViV2JrY2lnRlVD?=
 =?utf-8?B?bVZSYlFERWk1SXBMNUJJWmZpYndOc2dNcExlZUpJaDlEZUM4dFNPdldzdmpv?=
 =?utf-8?B?cDAxVlhSUkJtVWZEZElkYTAwMDEvL3ZobVl2bDVPQTVzYXppREV2a282QnVt?=
 =?utf-8?B?OWhFaEZFc1cxMVZJWk9McEd0R1pKQ2pwOE1iLzdZQ1lnUHQyYXg1cGtJbGNi?=
 =?utf-8?B?cEhpRjNlM2hrVnJmeG01aS95OGN4UzdPbEpZQ0dJc25zNy9IczgyOS9CWSt2?=
 =?utf-8?B?Ym45UTVhL2lQS3JENDdtRWl4TVBpVFVGRk5jQUlPdXVZYjNhc1kvUjVWTnNm?=
 =?utf-8?B?YXVUMFFyelFJR3BnUlRxZkhLMVlkeXJDVUtIYS95ek1uZFMyVWVsSU9IZW5y?=
 =?utf-8?B?Y3haTFZkRWI3SzU0UVJVS3oxd1BqbEpkOXlxWDNWcGduamUxNXBZNXdMMlEr?=
 =?utf-8?B?bEtML2RNWDE2UHpxQzk4UjZKKzJZQ1FScVkzWDRDMWprR2I1SENlU0oxMnlE?=
 =?utf-8?B?L1V0NWxOM1VveTUySXZpM2VDWi8vd1NXaWRFNmxzSytrcUltd2ZqUithR1Jy?=
 =?utf-8?B?M0d5R1BkSkdaK0FQbk1yR01GNVUxL0lOQXYyY3pYdVdjRUVoMDROQ2pkYzUx?=
 =?utf-8?B?Vm9HUUpVOWV6ZjNJcUdLaE1QcUprSDgvSGpjODhqZlNiZ0I0Q0g5bTNBVkZL?=
 =?utf-8?B?R3p5cHRWTXVXNU9yZ2RMTk9Pckk3NHhJaitoN2FCVHRTcGIweHBzWU9hVnBB?=
 =?utf-8?B?MTZPemZ6NHRzdjZONG5CdlZKSzAvOFg1Nng3NmRDd0lhUlRhN0VkQmRUY0lG?=
 =?utf-8?B?S2JuNE02SXROckRPSmJHY1dvc1p0MXpjODRDQzBIM3d4UHZwdXpHQXE2MzVX?=
 =?utf-8?B?TmI5dENESHJucHJSbXQwUm1GNm5tWlExdS9TQTkxMjdISmVPVkNEcUpSY2tX?=
 =?utf-8?Q?jHB4Gv68UtyciZht4Ovct0M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8840432-2a51-4021-61b5-08dcb1f679c4
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:52:14.6218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGpFdlIMwfWdyYddK8sh9qswoY1Kj/HEZ/fPbZO4bm5BgemWrXJmHuMF0QbDwn6gh/HyLD9BomcNlmUEhhlY4kwECli/BUP6WmNbI8lFla0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
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

--------------1F8A1qkXGd7Nnvx1tW6d2L5Z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

These failures are not related to the test changes added.

Thanks,

Suja

On 7/30/2024 7:38 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel: Add tests to run suspend without display (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/130239/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15155 -> IGTPW_11493
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11493 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11493, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/index.html
>
>
>     Participating hosts (37 -> 38)
>
> Additional (5): bat-adlp-9 bat-adlp-6 fi-cfl-8109u bat-dg2-14 bat-dg2-13
> Missing (4): fi-glk-j4005 fi-kbl-8809g fi-snb-2520m fi-bsw-n3050
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_11493:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@runner@aborted:
>       o fi-cfl-8109u: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/fi-cfl-8109u/igt@runner@aborted.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11493 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>  *
>
>     igt@gem_lmem_swapping@basic:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@gem_lmem_swapping@basic.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_lmem_swapping@random-engines:
>
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap@basic:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@gem_mmap@basic.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@gem_render_tiled_blits@basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>         +1 other test skip
>  *
>
>     igt@gem_tiled_fence_blits@basic:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_tiled_pread_basic:
>
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@gem_tiled_pread_basic.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@gem_tiled_pread_basic.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@i915_pm_rps@basic-api.html>
>         (i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@i915_pm_rps@basic-api.html>
>         (i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@i915_pm_rps@basic-api.html>
>         (i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o bat-arls-2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15155/bat-arls-2/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-arls-2/igt@i915_selftest@live@hangcheck.html>
>         (i915#11349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349>
>         / i915#11378
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378>)
>       o bat-mtlp-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15155/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html>
>         (i915#11349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349>
>         / i915#11378
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378>)
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +7 other tests skip
>  *
>
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-fast:
>
>       o bat-dg2-13: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html>
>         (Intel XE#484
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/484>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o bat-dg2-13: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (Intel XE#484
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/484> /
>         i915#4550
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>         +1 other test skip
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html>
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9673
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +3 other tests skip
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +3 other tests skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-fence-mmap:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +2 other tests skip
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +2 other tests skip
>  *
>
>     igt@prime_vgem@basic-read:
>
>       o bat-dg2-14: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@prime_vgem@basic-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         +2 other tests skip
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7942 -> IGTPW_11493
>
> CI-20190529: 20190529
> CI_DRM_15155: 277a79bf0ef669d9b96f6787906f4e5edb827a33 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11493: 11493
> IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------1F8A1qkXGd7Nnvx1tW6d2L5Z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>These failures are not related to the test changes added.</p>
    <p>Thanks,</p>
    <p>Suja<br>
    </p>
    <div class="moz-cite-prefix">On 7/30/2024 7:38 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172234852903.429045.14170895324895203803@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel: Add tests to run suspend without display
              (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/130239/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/130239/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15155 -&gt; IGTPW_11493</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11493 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11493, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/index.html</a></p>
      <h2>Participating hosts (37 -&gt; 38)</h2>
      <p>Additional (5): bat-adlp-9 bat-adlp-6 fi-cfl-8109u bat-dg2-14
        bat-dg2-13 <br>
        Missing (4): fi-glk-j4005 fi-kbl-8809g fi-snb-2520m fi-bsw-n3050
      </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11493:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@runner@aborted:
          <ul>
            <li>fi-cfl-8109u: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/fi-cfl-8109u/igt@runner@aborted.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11493 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318" moz-do-not-send="true">i915#9318</a>)</li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318" moz-do-not-send="true">i915#9318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@basic:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@gem_lmem_swapping@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@random-engines:</p>
          <ul>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@basic:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@gem_mmap@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_fence_blits@basic:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@gem_tiled_fence_blits@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_basic:</p>
          <ul>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@gem_tiled_pread_basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@gem_tiled_pread_basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@basic-api:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621" moz-do-not-send="true">i915#6621</a>)</li>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621" moz-do-not-send="true">i915#6621</a>)</li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@i915_pm_rps@basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621" moz-do-not-send="true">i915#6621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>bat-arls-2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15155/bat-arls-2/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-arls-2/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349" moz-do-not-send="true">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378" moz-do-not-send="true">i915#11378</a>)</li>
            <li>bat-mtlp-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15155/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349" moz-do-not-send="true">i915#11349</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378" moz-do-not-send="true">i915#11378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_addfb_basic@basic-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215" moz-do-not-send="true">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
          <ul>
            <li>bat-dg2-13: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-13/igt@kms_chamelium_hpd@dp-hpd-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484" moz-do-not-send="true">Intel XE#484</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
          <ul>
            <li>bat-dg2-13: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-13/igt@kms_chamelium_hpd@vga-hpd-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484" moz-do-not-send="true">Intel XE#484</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4550" moz-do-not-send="true">i915#4550</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>) +1 other test skip</li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a></li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a></li>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274" moz-do-not-send="true">i915#5274</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812" moz-do-not-send="true">i915#9812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-onoff:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_psr@psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673" moz-do-not-send="true">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +3 other tests
              skip</li>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_psr@psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@prime_vgem@basic-fence-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-mmap:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@prime_vgem@basic-fence-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>bat-adlp-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-9/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) +2 other tests
              skip</li>
            <li>bat-adlp-6: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-adlp-6/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-read:</p>
          <ul>
            <li>bat-dg2-14: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11493/bat-dg2-14/igt@prime_vgem@basic-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291" moz-do-not-send="true">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>) +2 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_7942 -&gt; IGTPW_11493</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_15155: 277a79bf0ef669d9b96f6787906f4e5edb827a33 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_11493: 11493<br>
        IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------1F8A1qkXGd7Nnvx1tW6d2L5Z--
