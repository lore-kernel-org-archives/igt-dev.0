Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7631D12694
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 11:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C8D891E1;
	Wed,  3 Dec 2025 11:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7ANDsuj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9573891E1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764760572; x=1796296572;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D9hYjY3o/hN8OYgUVVwrs4TUajvzJQ+7TFNIE6Ria1s=;
 b=M7ANDsujLm6nhC3Krd2nZDJmFXd0Rpg9HN5iol99VTUAUYcSnd2qOIQH
 Bl1HagGeClCnWJeAuYWYFTLFK6x4E0/mgR5h/tr5BBTfqe91n4IrrSb6N
 XqB7VgmhR+xv0serlRWDFdEdaojWuSN6toY5jr+5EUXzII114UCld8aqP
 LqUFzzUYVrmV4xpbpxisL9DCSicmcRf4EJYq4uEhX9KoZXNHjVv/SZ9Js
 ttopnILsFvHjOZUbvmwPjOoq8J0HmG6yewfhq6OH+ntq8Hu/cSEm9ZiE/
 fSTfyRBjqKSr0EOYeQKm+bMZ7FijGR0txdaOeQc5NgoMSHaTRXejkErY+ g==;
X-CSE-ConnectionGUID: v9NtSBPNRs+GMFNKWQPWcw==
X-CSE-MsgGUID: aGozHngsTeCPo5vQIdGm7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78099229"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="78099229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 03:16:12 -0800
X-CSE-ConnectionGUID: VJ371cAJTViXABI4jwxQdg==
X-CSE-MsgGUID: kO3G/DY6RpqdvibQ6UmYPw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 03:16:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 03:16:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 03:16:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 03:16:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAb1GnzDEBQztEHGEAB8DvcYw+AAwKBhb0cnxmk620/Jr8AatvhF5LGynRrcCtASIsDhtL5kE57cX2l0WZCK92F2QzzvnMLyxnTwnNxG7JWU/F23EGN2WV5jIjGiflZElQ4qUZ1hexE1A25Ha62hPv11DUvBWKkb5LAEFpiUELM6mb/2FFJahGaoTLMjX8CEYBXsYNWcAcIGAewEs4Lrt2UK33K7vc3pu4xlyfmisMg9tN0W2DpQBsakM1cXfiapZ6GU+YiK5MThjN8AHzELJcl6OSwrJkNUZMhhg0s4E3oNB7tG9N+DCaPXsAAebOiaiGjqiiS8wIXCvV3NRwXEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6stUZFjM346gZCUpQR5nxDfUI6Gj0iYNdamrtHcGBbs=;
 b=r9k1+wBRyLAhoSCEFAuzLeaC7thNH17/EYeR9pMIwcAuk/5/2wdgTV6pdLQpAVXZ5b9ukJDI49Sw5o52u65KkSuQQ1TjePWU+v9e0ZBihXHLgwm894eo1Y9j+Of56EoIxo8me1oqgAulDauBF2BJeiYweFZ8ITz07FenigMcAYPf7ofjNVTbKyvw+Euz7aZkOYqsVoYEsMRTK6TP5JiDXUJ/j9R73MnoQK6ksTtdr2rHf12Jrdytc5e+U6cYad2xy9kzJhegbvUYkClBBKCZAoHedaMaLVvIPOYY2jVC25wMHK8xQqzpcsr+PA9znFlyK1C7CHehUufAurrf5HaCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by SJ2PR11MB7714.namprd11.prod.outlook.com (2603:10b6:a03:4fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.19; Wed, 3 Dec
 2025 11:16:09 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::2701:d09b:709b:953]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::2701:d09b:709b:953%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 11:16:09 +0000
Message-ID: <09eb903a-5f09-444f-abbf-875f75a0ec4e@intel.com>
Date: Wed, 3 Dec 2025 12:16:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] tests/intel/xe_eudebug_online: add
 pagefault-one-of-many test
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0168.eurprd09.prod.outlook.com
 (2603:10a6:800:120::22) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|SJ2PR11MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7167a563-9f50-4cc0-9fa7-08de325d5c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1l4MGRtN3dyOTNjMUN1QUJFNFl5cFp1MW42cUxiOFpwbUJEeDNGNGpXRnZj?=
 =?utf-8?B?b2pVNU03NVdVWWFQVVROeWVKWTFGZVF6eWhoMTdPb1pQWmVmRFFLL0x2WEt5?=
 =?utf-8?B?dlZiL0Q0c1BVb0xWS2xSYUp0aUQ0Skt4aVZtY0JLN1JoNXZqanIvSGhNSS9l?=
 =?utf-8?B?Y0Y0K2hSWGRaaEprNmRKM0NPUFBZSGkwS05GQlJ6UGlPU2svSlRhYmhDYzds?=
 =?utf-8?B?RjdoaCtGbDhHb2dubVFGQUI3YUlsYytKZ2MydEpyN2RiMnFIek5LOFBBdTA4?=
 =?utf-8?B?ejd0WEZIZVNWNTJaTmNGdFdsZjQzNUFnVC9GYVFHbktWOGpDanR1RGtDOEc0?=
 =?utf-8?B?Wm1VMTNFTFppN1BDOTJra0ZtUWNQT1lrWmh4REhENE43Y0tUM29PWHh4aDdD?=
 =?utf-8?B?RnFVNlBqN0RscW05aSthbk9OcktXd0kxSk90Y3VlVGp3R21UcTVURnBLUUh0?=
 =?utf-8?B?ak9BMnQzSzhFblBGVGQ5VzN4ZFRYbkM1S0dTYlBRa3JCbC9TWG84MVpnQjEy?=
 =?utf-8?B?dUhGczZQSlJtZ3RvOUFNdzlNTFRvenFHTUNkZFRqZTVKWW8vaG9HbUd5bXBC?=
 =?utf-8?B?bHo1d0FicXdTTUU2V0NnY2MyNU1pSkl2TkIxSEJhb0ZuaDVxWG5OMjc3SlR3?=
 =?utf-8?B?SEJUWTJQKzRxYjdpZ3UzZlZMRmZ0OVRjV1RxbFhSY2hmOE5hbE84L2FkdDVr?=
 =?utf-8?B?SFhiK3B2eU9vbFg5bTk3VHNqYWdENGZNRW9mblVoVXJsTnRiZUZ6dHU5ODFM?=
 =?utf-8?B?ZUlzbkJmKzRWKzV3eVRMKzZDWDlaZEtJRnFhcThqclVUdkhpeU9MTU5YalVT?=
 =?utf-8?B?L0doNjY1UWhsdUZBQ295U2J2VXY3UHFkbEhBeVhqWlRLc01NQjNVc2Nrcld2?=
 =?utf-8?B?emlGRU9udnJUK25SaUJRUTVkRENhNW93ZzUxaEZxaVptQUVrcmQ5bno1YnJ1?=
 =?utf-8?B?VWtmM25EWUMvTmtUdGxzK1VodXdNRXNNR1cvd3FJa25SNWpFQUc1WDF4Z2Rs?=
 =?utf-8?B?M3VOU3RYNlpJM2dVK1lIOUQ4ZzRYR2J2MncvLzNUQ1ppU1F5dzgyMHRCc0xj?=
 =?utf-8?B?VFVGenpTWW0zS1hjWGg3QW5rZ0k5Smc4akVsMEpJTXdNQldmVThFQS9aRlZw?=
 =?utf-8?B?VXVrbUdTaFlDT2FKUzR3eTF4bDhoRTVJOUtJOHJUQmxMd0gxTklXa3FFM2Rl?=
 =?utf-8?B?aGJFTEl1a0ZTcjQvbmxVYmVnV2dscVdzQkpyZitaN2pLL0tqR1h6bE9LbHV5?=
 =?utf-8?B?UmcyRjM5Vm5tRGgzam5jYkNzcVo2SGh6VzZ5U2lpQXV3bFZOWE9sTTh5d0FW?=
 =?utf-8?B?YkZaMEgxSVp0bURUSmhjd1BubUdSWG5oaDE2Q3N6UkhMVHhBZ1NHdlJoTmhS?=
 =?utf-8?B?T2xIeHg3c21GMWd6YVY2WTdZTlJsZ2pYQjRtWWlvTUJCb2NFeGZpekZ4WFUr?=
 =?utf-8?B?OTF5d2ZxUFN5cjkvNnFtd0ViZlN5MFhWa3I4Rm9Vd2dpazhOKzdsSFRXYmVE?=
 =?utf-8?B?dG5LYWFZWUtOYkkzWm40dTZvdFk1ekpEWndmenBMTDU5ZjQ0ZDZSUnFzemNK?=
 =?utf-8?B?aVpDcnpIN1QzanYwV0dOVXNYTnVZN1RQNDRVOER5ZEFVSldFQlVDWGdLR2FW?=
 =?utf-8?B?bVNrWHAyNXhxMUdpZFNibDhJYUplcThNa1N5Mm4xdFVHa0hjNlZMRENOMTZB?=
 =?utf-8?B?d0hPa0YvMU1McTZmQklQb2hKNWdzV1JGTnIzT28rNG9nZ3Q0a3c1cWJ6L3Zp?=
 =?utf-8?B?bURuRWxzb0k1OVZ3TEVUUkxybXlzbHA5dEJUa2tJZmdSMlRiVjd1VmJRZXpB?=
 =?utf-8?B?TmU2K1VKaDMrS0MyaVZZSHlMY1NKckpCQzNoRC9sU1JHNmlCaW5zaFdZWFFK?=
 =?utf-8?B?byt6MkxtSk5ybStEcmJwVmdaeVpZSlpVRG8rT0NDMGVBVnVsdlJSaUUzbVVy?=
 =?utf-8?Q?/OzY1nOcbk4v3QtGhQoY1uoBDM5z/xRG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdWanJTOFl3RmtWRHN5dFFKZ1pkdWkzdFUxM2VNME8rekZKZ2tQQ2xZczRJ?=
 =?utf-8?B?TGxDam5kMGl0YTk5Nk1YaXl3NldLYUg4MjFGSmpJRjJLVXIvNkJuM01XUXFE?=
 =?utf-8?B?d2lubEFSYXBHRHRLcm1LYk1kdFIxcWR6Zm9SWVBhMElUS3FMNFoyR2VERmxX?=
 =?utf-8?B?d0kwRWpHRDNpdHRyb1NqU2ppenlIVFhLT2hkbThTRkUzaW4yVzdGcFRtcERl?=
 =?utf-8?B?R29xaUg3N09JQTZCNzRWaGQwU0pXTTUvRlNTNzhJVjA4ODBYN3FmOVVVa1Fp?=
 =?utf-8?B?bmxYK0pXYStlZSszYmZURGY5dE5aZ2l0c29kYUJIaUU0UU52M216bjVyckFU?=
 =?utf-8?B?M1dGODVyaHRQRnhIRFNiNWUvSDdBK1FKWmlYVXVPMy9DeGxBZ1MwSWJ5THM1?=
 =?utf-8?B?b0dleSthOGh4cEhIMjdxVkVEdnZrNG10a2N5c3VKNnROdGtqZTVhMklFdFBX?=
 =?utf-8?B?b0N6TnNpRGdQcFFDZ0h0V1E0dGxnOTZSa3k5am9EWEo3bWl5ZWI1cERvQUpa?=
 =?utf-8?B?OUZRTThUdzJGU0xHTHJ4Mk9VN2hxYlFjYkNXenplUElUVThNVTYzblpUc05D?=
 =?utf-8?B?cGk2VEx6ZUJCb0xKUm1VQjFSK0JGKzVlbUcwd3AvWHZ4MGlQZ3U4bXQybStY?=
 =?utf-8?B?blJOU3UzQVVjV2lGQmZnTUZOa2FFbTl1eUpsN3UveUt0cUh6NVFEMFZCenN0?=
 =?utf-8?B?a3lQTy9WMStOMDhLM095a2lZd0N0Kytqc0RaTjRLZ1dhd04reTZSZmFINTlW?=
 =?utf-8?B?YzJBYUhSS3RUY3MvVmI3VGk4TncwU2d1UkNYUFBPWW1iRGxnd2hYWjNQOFV5?=
 =?utf-8?B?ZitEdjJvaUtvNmVuUkE1OUV6RW83clg4T3c3Q3JFYTI1K2JhQklrYk11WDBw?=
 =?utf-8?B?ZE1tVXBJMTN5YTJpQ0YzZ0NLeE95d0VrNEUwVUJxeGFlamJPY0hWeVJSVzRE?=
 =?utf-8?B?SVJuMmxZN20yR3pzR25NSUYzRldlWjN4Zk5Yc2tHRHF4V29veVVHOENFM1Qr?=
 =?utf-8?B?VmtaQjkycmkvamF4ZXpIUGVab2RXS0RGbC8zN0dqeDA5K1BmcU54dEpPTXBI?=
 =?utf-8?B?Mzlicmh0WVFyeGxiQU50SmJNUWg1dVJGemxiQnpnR2hRZnhrVW9CamhSNFIv?=
 =?utf-8?B?RzhNZmYybUIzUHBQU2tVQ216bFZLL2x4TW9Xa1N2UnZ1TWMzMXNuWnZXR2pI?=
 =?utf-8?B?MnhYejhoREh2TE5FcktHUmU0MTZJZnBuYmdQekl3TDBZZG8vaHNDUHdabkVn?=
 =?utf-8?B?VEdMNmJvU1F1MUdUeWNwZzY4cURDMWduMmZzZHRWcEtkSXJ6eXNSZTIwQ3My?=
 =?utf-8?B?eWZCM0wvL25PZy9MRnJJNHVyb3BmemRYc3Q5N1FOMGVFMzJRTHZCRWxjT1ln?=
 =?utf-8?B?aFZFamk3OEQ3ME9rSENQT2dTY1E4b3VlaU9sRWVSNWxmRkMySDU5YktVMEpF?=
 =?utf-8?B?NlVaVWFnWXhpbmtOcHZ2Q2w0SnVKTWRKaCtOaVlrbkt5ZWFjUCtTa085Mllr?=
 =?utf-8?B?aER6TmtucldHSkloTHFiNTRrQTlnWU9wYW11aXVKUWp2b0JjOVdQUHkxMzJL?=
 =?utf-8?B?TTBCa3o5ODNSekN0emtTdDZCUTFCK2gyUVVzQWtTUGJnbGgyUndWc0oyS25Q?=
 =?utf-8?B?cEJtY28xYk5mTXFucnNLMndVeDVJTTF5ckJHUWFKRmsvSVhYWnExU1IrMHZQ?=
 =?utf-8?B?elQ0VDdzZDE1bFRabGJOVlhwZWk4bjdSd0k3bVVqeWpRK1BiQWhNL2NKMW5N?=
 =?utf-8?B?K1JHdHJmallGYkhOWXhvSHA1TkNOVWpUTUFGYnp6VUw3bWpSUllCbW52U1R2?=
 =?utf-8?B?Um5wQ0tFT296NDJHOFdRZEswTWJlbHZxV1RNWUR3TDNYT2VQVTZMc3FnWStp?=
 =?utf-8?B?UVB3UnovQ29WV2kyNzNxL2VZSGErT3V1SDN4K29mQ25zMDl3a1hqRzN6Ym1a?=
 =?utf-8?B?cjFDUXpXckJTdFEvL2loT2ZZUE1Tb2UrdVhBckp5NktJY0wzUCs4MkRYNzhi?=
 =?utf-8?B?M1hSMzF3UDZBbjJheSsvZjBOYW5hWnVJOXU3RllyamlYNHpENlZSYng4VTVy?=
 =?utf-8?B?eUFXN1pZVEhXOUh2c2k2cWYvREVKUXRpc29WaXdMNXp0clpSanp1dUd2ZjFO?=
 =?utf-8?B?WFVPY3RnOFhLcHBacEdaZVJUMHdjNmIvTDN2Y0p2QW03SW9VQWZGVnFzc1lJ?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7167a563-9f50-4cc0-9fa7-08de325d5c46
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 11:16:09.7079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmNZ9ShNYUMx7tyFVoSQNsC37uyp1q0H7bKdGiH2EAF2b6Uw7fscz2Sk5rSvwpHCaKUyOeuWE0f0bPoztE+QrKrWcxvfJMsHV2RDvk3fIy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7714
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

On 28/11/2025 15:12, Andrzej Hajda wrote:

> This series adds few bitmap helpers, performs xe_eudebug_online
> file refactoring, and finally it adds pagefault-one-of-many test
> which exercises detection of GPU EU threads causing pagefault.
> xe_eudebug_online needs much more refactoring, which hopefully
> will be done later.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Andrzej Hajda (11):
>        lib/igt_aux: add hweight helper for bitmaps
>        lib/xe/xe_query: add helpers to return count of EUs and EU threads
>        lib/gpgpu_shader: use recently introduced helper to get EU thread count
>        tests/intel/xe_eudebug_online: use igt_bitmap_hweight
>        lib/igt_aux: add fls helper for bitmaps
>        tests/intel/xe_eudebug_online: use igt_bitmap_fls to calculate max dss count
>        tests/intel/xe_eudebug_online: add fd and flags to online_debug_data
>        tests/intel/xe_eudebug_online: rename threads_count to thread_hit_count
>        tests/intel/xe_eudebug_online: use online_debug_data in get_(shader|sip)
>        tests/intel/xe_eudebug_online: cache thread count value
>        tests/intel/xe_eudebug_online: add pagefault-one-of-many test
>
>   lib/gpgpu_shader.c                                |   5 +-
>   lib/igt_aux.c                                     |  48 +++
>   lib/igt_aux.h                                     |   3 +
>   lib/meson.build                                   |   2 +-
>   lib/xe/xe_query.c                                 |  57 ++++
>   lib/xe/xe_query.h                                 |   3 +
>   tests/intel/xe_eudebug_online.c                   | 353 ++++++++++++++--------
>   tests/intel/xe_eudebug_online.c.gen.iga64_codes.c |  43 +++
>   8 files changed, 391 insertions(+), 123 deletions(-)
> ---
> base-commit: 005281c52252a2b3790b186bf95c6cb378f9a609
> change-id: 20251126-pagefault-one-of-many-30a877d95441
>
> Best regards,
> --
> Andrzej Hajda <andrzej.hajda@intel.com>
>
This looks good.

Nice reworks which shall be continued especially for xe_eudebug_online.

Last patch a bit complicated as it is for pagefaults.

Thanks Andrzej!

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

