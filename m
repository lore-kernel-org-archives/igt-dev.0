Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF761D5B16F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF4410E4B4;
	Mon, 15 Dec 2025 13:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="he1PAIgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925BE10E49D;
 Mon, 15 Dec 2025 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765804241; x=1797340241;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=mPQ4fHRM9Ayv7Ofdd3E3KPUJozHzvG3BXTdzrIl+P3o=;
 b=he1PAIgmawh4GXfKjQ6Xo0cacvTZBHe/CPlkCsNzIyYslLfgLaMpvUhZ
 nHsG3gst6Ry8swfg+oh0O0Qj21TVEfrBbWTacqjZkCJ6ruqmPZjgsXXmC
 TzrEnf7SDpcprTfZR6gLGRgv4M02L4BEaMXOxrp4G/YolYtR0H5OyBnNi
 EfoiQHUvxo7D8fuV59OIFl3pypM8ag8WDAq92GXwTAF/9r5p77cvmCh7x
 KynqD6nvyBMfbOEP+I6Es3GfMhRsKrfLLyE11iGZF/vAuCOBzpBiCdl0z
 eQ4H3Ap0cKp4kuJ+gYFKRaTQQxN53Y3zFwbqQ3+eR2bTZDzP+ei3Pkkwy w==;
X-CSE-ConnectionGUID: +ECRUJDuSNWDGKRoIYfhBQ==
X-CSE-MsgGUID: 4pTu10HgT8K8RYDyzJGHdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70281935"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208,217";a="70281935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:10:40 -0800
X-CSE-ConnectionGUID: gnRzf7OSQu+xoesshuQ05g==
X-CSE-MsgGUID: NWniSn7aQH2t4Xbd2qqM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
 d="scan'208,217";a="202223639"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:10:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 05:10:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 05:10:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 05:10:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLuHx2ZclWN7X9Kao85baNAiQLs+lmRkAJiy1CcweTclqem3yT5DAjmfGL7YsGa5wP/keBrYrJ7miaMNHSk07cJH9/cVTZfWm6/f49kaH3ALWDQbroxGim7bgOZ2lyXloHmexPgaKKCjeYqJBsvryZ0chPUGHI8YMrP8tC7W9oaTWzRO1o7lww9Wtui14B9j+oTwxlMvv9Mnyrv+lh7cjgiKoj7OOphg24+rBlVXyeT6wKtegAZzoe/Ah3rsf8y2vrqhSACHQZ8X2pus+Kh4/U3P04GgdETG8RpqC5M/JqYlBz+nb+5b4TkXdAhHT/QRnLamf2HMe2xgPQbxNX9mLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlp5hkR3q/blyWhTYBKgIekQVAjVFApWDOtecChXgHs=;
 b=RAwrQHHfcBhaDHMFXT/GoqD1uT9Hhf4rr0HMEZb5C+uUkEejCKQzjjEW54wdZbOWGABVv2Ujrh55caVpig+np3ZFjzxG3uz8Vs/COGS6ObR1+8p30+RrxhTLUJcC1CSL08Re40qZu2vcSp1XxfHoYq6ggLAXQsmG5DhzSOYMT67cW+Eqrs0Uad29BIMenEQB91PbcAP7qFc8S6wVcUL+WKAjnePhVFZiepykUbW/LOa1I9nTb8/1Sy35Xv0BTRDSPNKUcgOl2f/p4Nw6tnHYzK469DVTvQ8MK9L0uDz04z2uuKUeodeYNkCLnjNJrenZ8KLNwUrflJAS192uBa0ejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:10:35 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 13:10:35 +0000
Content-Type: multipart/alternative;
 boundary="------------KXP8JBW5TJohY0W53HzUC1e0"
Message-ID: <350476f3-0b91-40a9-a18a-2ab1bacb97fe@intel.com>
Date: Mon, 15 Dec 2025 18:40:28 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fpm=5Fresidency=3A_Add_ASPM_Link_residency_test_=28rev5=29?=
To: <igt-dev@lists.freedesktop.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 <I915-ci-infra@lists.freedesktop.org>
References: <20251212165830.28286-1-karthik.poosa@intel.com>
 <176564682438.84868.16498511792168966194@a3b018990fe9>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <176564682438.84868.16498511792168966194@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ac31e9-4761-4799-98d6-08de3bdb551c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alhRTU5rclQxVmJQWWwxVFZZRWFrbUUyK3pYNndJMmE4dEw5MUEwK3RzN015?=
 =?utf-8?B?WFNZbkNLVThGZ1NnZDg5ZS9TRUhFejlGc3Z5a3VxMVVuYkMxOExjNlhQZG14?=
 =?utf-8?B?a1loM2V2RlZUdWc2OWtVNlhGWkE5MWttL2EyRFIrN01yeXI3UE1tZSsyVFZq?=
 =?utf-8?B?dTJ0MDRKVHowSTZRN281ZWl5SXV3ZjZiK0pFVldjQXkwcEdmWWtYRFdLWVdX?=
 =?utf-8?B?TE03S1Q5U1l2bFk3VFVSSFhWSGU1RnRGZmZlRHIwdkVuMHdZdkt5U0RLYlhu?=
 =?utf-8?B?bGNZVVBJYUFQYkowRkV0aVRUMzBDOXBpTFduSzhuN1dKT3B1TERNVWY0cm5M?=
 =?utf-8?B?THJEN3VTWjBkYXc3WXE2RXpYdlc2UlNoRDlscXJoeldvZldUUm5EMWJnK1NZ?=
 =?utf-8?B?enk2VWxzWVp4dHlVNk5GMGFCaHB3NDJ2cTE2QWhlWmlvQVhwaGtkU0RrdkxJ?=
 =?utf-8?B?cGdWYzZoSHJkR3pORVlPT1Y2eWQxSDhPY0taT3F2R29pWHdDODBwUHJIcnR6?=
 =?utf-8?B?NFhEaDg5MFYybVBLZDhyQ1JYYkx0eGErUVA0NEN0ZGRxT082S1NWdVVNNWtv?=
 =?utf-8?B?N2R3YVhqR1MzSlJtbnF2TVNxNWlOQ3hFdjFBTHcyWXRoaExuMWFTVStpcG1L?=
 =?utf-8?B?akFEMUpHZXdWY3JTbnp6MlI5bnZBNzlMVkNpbUZDKzlUNGdpZzRoa09idXUv?=
 =?utf-8?B?OFVqRzdDdEk4ZjFLUFl6M1l1UnlRUTVGUHNWMXc1WDUvOFJLclYxWHg1SHcx?=
 =?utf-8?B?V1QwdldZcVplN3pJS0NjRG9ZWWszVUZRYytyS3pTLzBqcHZ0L05TTWQwTHVT?=
 =?utf-8?B?WEdVTUJWaHp0MytVU0wvbDRaamVENlNrci96dFFHQS9JRm1ES3MzRGcycWVn?=
 =?utf-8?B?N1JWV2p5NWg0YkFaWm1CSkZMcVVxRnkyRmhmdUYwWUNZaXIwcW9KQUh0U2pw?=
 =?utf-8?B?Wnc4T3R5V24zRVlPY3JIUXlxUUNNdVNZYm5pMS8yNWV6bG93dlRWdi9ZVElq?=
 =?utf-8?B?Q0lpdXdJSENZT1JES1c0SUxUcnUxSUJkUlJIOGNNYW5xYmQyNW5yb2w1V1Ur?=
 =?utf-8?B?SEcrT2xZRDlxK3Y2Zkloak9DYlpSTHRnY2JuQ2RyUEhqMklEdldEZkhiZnVr?=
 =?utf-8?B?M2E1bDgzUDRNMEg4TWpEMkNnb3Ywc1hyL29ad1V2K3p6UFlCcjBTTDZEYmlE?=
 =?utf-8?B?MEhKTk5ZZjhSYmtSbDVEb3M1dzJKQWhYRzVLVFBxcHc4cE9OWmkrL1RlNUZS?=
 =?utf-8?B?Qi9RdDBYZXhWM2U4YTQyMFdMWVVJR0tMMmZOQjhtZ0cvMWY1UXM4U0t3OVUv?=
 =?utf-8?B?c2NodFBIVUZEWC95RTdqem82QXhCOG8ydHd2VldtRnFzNVVzWVMvVHJ0TDAy?=
 =?utf-8?B?aUJhV2pDQ1pKVGYyaW1GSjlERGRCYkVpaEdsR1NTVVlRT1NqRnk1Zm5Ickhj?=
 =?utf-8?B?QlRTRnlLUDBWbkEwZ1NWYnRWZ1ppMGJqOEZRemU4Q2s2bUZkRG02SXJEMDB6?=
 =?utf-8?B?MndFVkhkS1l1YitEcExYSmlCYW9IcjBod2FVc2RQMS9mQ0l2OXBvMzlQYVJz?=
 =?utf-8?B?bzdRNGM5RlpVQ2EzWFh1NHpqeVpnbjBIaDNZNEtERkVVYmx6TFdYbWY1Z3NX?=
 =?utf-8?B?K0w4UHl5dWRnSzdNSklqS3VoU2pYTFVTQXhmUWVtUFNYRjcyZ2tmYXBleTZY?=
 =?utf-8?B?M2traENxY0JtTGw4ZXA4cUVDeWdNOHk3R0N5MjFlcGZrbW00eWZlSDhERFI2?=
 =?utf-8?B?c1AyeGpZZkNEaEFIR0VIN3pQeFczdm5ObE51Y0Q5WXB5RDlxQVpkVFdLZDh6?=
 =?utf-8?B?Z1QzSHNwQ2tWZ3pGdzRvYTlnNWdVNE9DdklmczI2c0UyNDZnUk81bU9GajhD?=
 =?utf-8?B?cHVnWXNTWDJweWFaOVBndjluM29BeWJldHJwU0x2WXNoeEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1diZDZNYnJMdTlTYXdqSDJTQzdzampWM2VIS2YrUXUxUkE2bmFSRGM2VFBC?=
 =?utf-8?B?Qit6L1RxYWY4THNtakFrNWI1R1p0MGtKdFVRSVUwSFVoa1NLWUx4aVhqRHZD?=
 =?utf-8?B?WUgxTzlRMW1uTDRFRlgrcExKTUE2akh3c1VGRk9OVDdPRmVtMVNGcnNGV1hV?=
 =?utf-8?B?UlpSdzI0L2hjOG9UTzBBaFh6T1Q3U1dZR0trQ2RGMVA5VENwczlwMjhoSW1L?=
 =?utf-8?B?dk45RHFSbXlHZXZLRmxyblpTT2diQ0g3N0Y3eHhKUVd4dGpYWHJKSWUyOGFQ?=
 =?utf-8?B?aDJVOStnSjd6K0REdWdMMHdXaGFLRFgxMFh2bW9acTdVTDVnR1hiS0dKZDVM?=
 =?utf-8?B?RkNTS1dOcm14Tk1lYUlzRlNDZFMyV1QyZndNWHZHc0NwbUowTWlSN08zejJ1?=
 =?utf-8?B?b1ZwWnMyTmI5RzR1U1JyYVYrVUI1OGhXZ1JZN3NUS3RGZ0ZXVjQ2YXZGTDJX?=
 =?utf-8?B?MGlKOXBLQTRNZlA0amppaEZFazdoVnJJWTBSeVRlbzR5ek5PdlFiNlRBc3BN?=
 =?utf-8?B?YjRrOHlEZktpZUp3NUI4WWxmMTNOSDJjMjd4MXJWaytvdFordnVUOTd4WXVx?=
 =?utf-8?B?QjVlZjgxNlE0YnZLNXQyWEFieTFUQTN0WTVINWJrZ0hBRUhLVlJTWGNPdytK?=
 =?utf-8?B?aStpbmhZcktFa1A2elNoNG5Fb0E3WmEvVkl3aTJMVVRqL3NVcDMxTlBhNmJs?=
 =?utf-8?B?a3Z2N2VUVmk2YUVvZGk4WjlNNXNPVTJUZnZFaCtKQlR6bm9GcnlBYng3MzhC?=
 =?utf-8?B?U3dxVHA5dXB6QnlaNHhkM2hUaWZUUGJHZVN3SDJVbnphb0dYZEpYSEdtd2wz?=
 =?utf-8?B?QithUU9aWWJyemFSak9jWW0xUzk5TjF0L25MOHNZSmE2cVIvRmZVRCtUS2Nu?=
 =?utf-8?B?UExQTlBsRjVhTkx5RWNxZTExQzBaOU1xb0dGN2lMVWhsNTVBREs0cERhcWZm?=
 =?utf-8?B?UjBTZTRCNkdwSzNUTHFiUk1CNjM4b1VxRk54ampJaTV5VTBhZHFxcXhwZ2Z0?=
 =?utf-8?B?VjJrQ1poMXRIWHhTWGVHZkJMMjlIMlIwV25BOSttUVJoREZtb0lYRll2VzJJ?=
 =?utf-8?B?VkZkUUFlWTdpclhnRWowREs3U2JTQytXU3lyTVE0NkhHZUJneWdBd3F5ZHZy?=
 =?utf-8?B?SWRQWnB6TzVMM0JNcVAwT2dEVk00dzUxUXJhbGE0dEIzQWpVUDd0eW5xM1hU?=
 =?utf-8?B?NGk0L1lDRFcvMHgyWDBBL2w4eDZ2Q3VRQkVLeldlVC94dm91eDBDellQY01G?=
 =?utf-8?B?dHFBRnN3Z05naEFqT3ZtR0hEQmtlc1R6STdGeHZ6V1dtdmdPMFgrSkI3Yi93?=
 =?utf-8?B?UW9hd2xrLytMQ094a3VjT292WGM4dkxjWU5ycDBXRDZLOERGVWlHYytvYTRE?=
 =?utf-8?B?Y0Z4aUdvRFdSRElzdkd1MjNxZlJDSi9ENkJWZDk5UDRMYW1ZWjhOa3JUc09l?=
 =?utf-8?B?N1hwR3hyaHFhOWYvR2htSlNPdjlzRnVmdjRheUV3bys4QnZQU1hxNGRsdnVG?=
 =?utf-8?B?cXIyYitIOFIyRjZ5MWM5ek9Ha2hyNThpaDdqdFEzejA1d1c4ZllSRHVnWnFP?=
 =?utf-8?B?SmpoWHBHYmNWSW9yZnY5S2hWU0dnY3VDME9FTFVoZlVxTGkvcVE3TDVJb1cr?=
 =?utf-8?B?V0Q2WWo2SGQ0cUNDYlZpMm1ETTloNmVBZFdHTmpiOHczWEwzVkR5Y0VVc293?=
 =?utf-8?B?WmhUYS9peWxmOTVVQjVNc2RsSW45SDFDOXZwQWhuMzJqYmVzWStBSmRhL1dH?=
 =?utf-8?B?TXdWakl6NW12UTJ0OFBkY28yaTkzRE03YVA5OEx0QjFucjBMTHpRWENITTFF?=
 =?utf-8?B?cytHb1RmTkM4d093eHpvM3p0Z3F1NVphemYxWExWK0pXZDJ6QmpOUzVKYlg0?=
 =?utf-8?B?cUJnRG05V2FCc053dVo5N205N1JsMVVLMTlBVVdVZ0pKamdQUVdYMkJ2dW52?=
 =?utf-8?B?U2xNb0ZnaS9HNlNsczRpWFZvSFgzYzY0VVd2d0IrZGFHVUFJWUhtWDFROGda?=
 =?utf-8?B?dUpRVGJWWkZzcGtIdDFQR0FCZ1NzR20wWWdWNDM3MGxpbGVWWWVrbGJ0RjVQ?=
 =?utf-8?B?cFpWQnA1Y05VeEtITFUrLzR0M1VZWjFxQjVURXlEd0p4akV0R3dLaHQxU3lN?=
 =?utf-8?Q?tBEhC80d1kToDwYqyYSoLYGXn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ac31e9-4761-4799-98d6-08de3bdb551c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:10:35.1213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X2vvXoj7Q/efpiwO53il3xBBBeR5wPUeshaT7ABQrJiPYtR56eTDbVp6SRXmlPqxOD2RJdW+I8r+d6bN2yX4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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

--------------KXP8JBW5TJohY0W53HzUC1e0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-12-2025 22:57, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pm_residency: Add ASPM Link residency test 
> (rev5)
> *URL:* 	https://patchwork.freedesktop.org/series/157057/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/index.html
>
>
>   CI Bug Log - changes from XEIGT_8665_FULL -> XEIGTPW_14205_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14205_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14205_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14205_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         +1 other test incomplete
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html>
>         +9 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html>
>         +2 other tests skip
>  *
>
>     igt@xe_pm_residency@aspm_link_residency (NEW):
>
>       o shard-lnl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_pm_residency@aspm_link_residency.html>
>
As integrated GPU is an root complex integrated endpoint there wont be 
as upstream bridge for it which is why test is failing as it couldn't 
find upstream port.

and also ASPM is not supported on integrated,  we shall add skip for it 
in next revision.

>
>         Warnings
>
>   * igt@xe_exec_multi_queue@two-queues-basic-smem:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-basic-smem.html>
>         +2 other tests skip
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8665_FULL and 
> XEIGTPW_14205_FULL:
>
>
>       New IGT tests (6)
>
>  *
>
>     igt@xe_pm_residency@aspm_link_residency:
>
>       o Statuses : 1 incomplete(s) 1 pass(s)
>       o Exec time: [0.0, 6.41] s
>  *
>
>     igt@xe_pm_residency@aspm_link_residency@gt0-engine-drm_xe_engine_class_compute:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.06, 0.11] s
>  *
>
>     igt@xe_pm_residency@aspm_link_residency@gt0-engine-drm_xe_engine_class_copy:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.05, 0.10] s
>  *
>
>     igt@xe_pm_residency@aspm_link_residency@gt0-engine-drm_xe_engine_class_render:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.08, 0.09] s
>  *
>
>     igt@xe_pm_residency@aspm_link_residency@gt1-engine-drm_xe_engine_class_video_decode:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.08, 0.11] s
>  *
>
>     igt@xe_pm_residency@aspm_link_residency@gt1-engine-drm_xe_engine_class_video_enhance:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.08, 0.10] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14205_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (Intel XE#5299
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +3
>         other tests incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
>         other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>)
>  *
>
>     igt@kms_hdr@bpc-switch@pipe-a-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-4/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) +2
>         other tests abort
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927> /
>         Intel XE#6590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590>)
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>  *
>
>     igt@kms_psr@psr-sprite-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_psr@psr-sprite-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +4
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaler:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-3/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html>
>         (Intel XE#4537
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug@vm-bind-clear:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@xe_eudebug@vm-bind-clear.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@pagefault-write-stress:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@xe_eudebug_online@pagefault-write-stress.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665> /
>         Intel XE#6681
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681>)
>  *
>
>     igt@xe_eudebug_sriov@deny-eudebug:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@twice-large-mmap-new-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-1/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466> /
>         Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>  *
>
>     igt@xe_mmap@pci-membarrier:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_mmap@pci-membarrier.html>
>         (Intel XE#5100
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100>)
>  *
>
>     igt@xe_peer2peer@write:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_peer2peer@write.html>
>         (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@hotrebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@core_hotunplug@hotrebind.html>
>         (Intel XE#6779
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@core_hotunplug@hotrebind.html>
>  *
>
>     igt@kms_addfb_basic@unused-pitches:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_addfb_basic@unused-pitches.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#5299
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html>
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html>
>  *
>
>     igt@kms_pm_rpm@drm-resources-equal:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html>
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@testdisplay:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-3/igt@testdisplay.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@testdisplay.html>
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html>
>         +1 other test pass
>  *
>
>     igt@xe_vm@bind-once:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_vm@bind-once.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_vm@bind-once.html>
>         +83 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-64x21:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_sharpness_filter@filter-strength:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_vrr@flip-basic.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_vrr@flip-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_eudebug@basic-vm-bind.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@xe_eudebug@basic-vm-bind.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug_online@interrupt-all:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_eudebug_online@interrupt-all.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_eudebug_online@interrupt-all.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>  *
>
>     igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>     Build changes
>
>   * IGT: IGT_8665 -> IGTPW_14205
>   * Linux: xe-4233-747b644466234c4933394bc6f4a13dafe87ae227 ->
>     xe-4234-90eba5e4087d6932c174f97637833862c9f9ec25
>
> IGTPW_14205: 26c4a1c307c12772a8f7e844f0c6e8c1be92202c @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8665: 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4233-747b644466234c4933394bc6f4a13dafe87ae227: 
> 747b644466234c4933394bc6f4a13dafe87ae227
> xe-4234-90eba5e4087d6932c174f97637833862c9f9ec25: 
> 90eba5e4087d6932c174f97637833862c9f9ec25
>
--------------KXP8JBW5TJohY0W53HzUC1e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-12-2025 22:57, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176564682438.84868.16498511792168966194@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_pm_residency: Add ASPM Link residency
              test (rev5)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/157057/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/157057/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8665_FULL -&gt;
        XEIGTPW_14205_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14205_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14205_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14205_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html" moz-do-not-send="true">SKIP</a> +9 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-preempt-mode-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency (NEW):</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_pm_residency@aspm_link_residency.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>As integrated GPU is an root complex integrated endpoint there
      wont be as upstream bridge for it which is why test is failing as
      it couldn't find upstream port.</p>
    <p>and also ASPM is not supported on integrated,&nbsp; we shall add skip
      for it in next revision.</p>
    <blockquote type="cite" cite="mid:176564682438.84868.16498511792168966194@a3b018990fe9">
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_exec_multi_queue@two-queues-basic-smem:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-basic-smem.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8665_FULL and
        XEIGTPW_14205_FULL:</p>
      <h3>New IGT tests (6)</h3>
      <ul>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency:</p>
          <ul>
            <li>Statuses : 1 incomplete(s) 1 pass(s)</li>
            <li>Exec time: [0.0, 6.41] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency@gt0-engine-drm_xe_engine_class_compute:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.06, 0.11] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency@gt0-engine-drm_xe_engine_class_copy:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.05, 0.10] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency@gt0-engine-drm_xe_engine_class_render:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.08, 0.09] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency@gt1-engine-drm_xe_engine_class_video_decode:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.08, 0.11] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@aspm_link_residency@gt1-engine-drm_xe_engine_class_video_enhance:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.08, 0.10] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14205_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x32:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299" moz-do-not-send="true">Intel XE#5299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>) +3 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send="true">Intel XE#6740</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-4/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send="true">Intel XE#6740</a>) +2 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send="true">Intel XE#2927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590" moz-do-not-send="true">Intel XE#6590</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718" moz-do-not-send="true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392" moz-do-not-send="true">Intel XE#2392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609" moz-do-not-send="true">Intel XE#4609</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_psr@psr-sprite-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414" moz-do-not-send="true">Intel XE#2414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaler.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-3/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537" moz-do-not-send="true">Intel XE#4537</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447" moz-do-not-send="true">Intel XE#1447</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@vm-bind-clear:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@xe_eudebug@vm-bind-clear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-write-stress:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@xe_eudebug_online@pagefault-write-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681" moz-do-not-send="true">Intel XE#6681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-eudebug:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518" moz-do-not-send="true">Intel XE#4518</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786" moz-do-not-send="true">Intel XE#5786</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-1/igt@xe_exec_system_allocator@twice-large-mmap-new-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530" moz-do-not-send="true">Intel XE#5530</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@pci-membarrier:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-2/igt@xe_mmap@pci-membarrier.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100" moz-do-not-send="true">Intel XE#5100</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_peer2peer@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427" moz-do-not-send="true">Intel XE#2427</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send="true">Intel XE#6251</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotrebind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@core_hotunplug@hotrebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779" moz-do-not-send="true">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@core_hotunplug@hotrebind.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@unused-pitches:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send="true">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_addfb_basic@unused-pitches.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299" moz-do-not-send="true">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check@c-hdmi-a3.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718" moz-do-not-send="true">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@drm-resources-equal:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send="true">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459" moz-do-not-send="true">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@testdisplay:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-3/igt@testdisplay.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send="true">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@testdisplay.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send="true">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@bind-once:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_vm@bind-once.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_vm@bind-once.html" moz-do-not-send="true">PASS</a> +83 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send="true">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486" moz-do-not-send="true">Intel XE#2486</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-strength:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@kms_vrr@flip-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_eudebug@basic-vm-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-8/igt@xe_eudebug@basic-vm-bind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-all:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_eudebug_online@interrupt-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-4/igt@xe_eudebug_online@interrupt-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8665/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14205/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8665 -&gt; IGTPW_14205</li>
        <li>Linux: xe-4233-747b644466234c4933394bc6f4a13dafe87ae227
          -&gt; xe-4234-90eba5e4087d6932c174f97637833862c9f9ec25</li>
      </ul>
      <p>IGTPW_14205: 26c4a1c307c12772a8f7e844f0c6e8c1be92202c @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8665: 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-4233-747b644466234c4933394bc6f4a13dafe87ae227:
        747b644466234c4933394bc6f4a13dafe87ae227<br>
        xe-4234-90eba5e4087d6932c174f97637833862c9f9ec25:
        90eba5e4087d6932c174f97637833862c9f9ec25</p>
    </blockquote>
  </body>
</html>

--------------KXP8JBW5TJohY0W53HzUC1e0--
