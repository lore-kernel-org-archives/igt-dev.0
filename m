Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AD5CCD1A7
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 15:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1097310E300;
	Tue, 21 Oct 2025 15:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fa+8bfVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9412F10E06D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761060781; x=1792596781;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mqil6MLbcWKB03lcYF/sFM9nJr6EDuzpHEuihe8qp68=;
 b=Fa+8bfVGwUwjgJXZEmdpzWQqfx5hSUscb48CuqT/8zG19SgluuuWD905
 a4zSwoLQ4U3OrhQxZInJluYKXTeajXpE4iZPDKT4JTjfeKozbbrp58hAk
 xeBa+0gh7x0qOqnCByUa1IJztQjiC+Z1QUc3pE5XG5pHKXwm+xgaThR5R
 RqdQm9jZEc/KFUvE/2PT93iV9vNjJx6nm2Roc2LaB5+5yXIrLTeeXTFwH
 qIoKeeDzjbYci+l1oyRQoUUFsGTOpOf06QDBXWjEXzpRvJo4bA5ZJevps
 KmhZsOPQtVcWkp0QzwtDNHx8GN1Hrz+zAxssbYCNrTSNinBbTMxXq7bGh A==;
X-CSE-ConnectionGUID: f+ZoQH/tSYiYELSibg5Saw==
X-CSE-MsgGUID: NEKsxxXSSjqVQZ8cvnRoww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74627670"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="74627670"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:33:01 -0700
X-CSE-ConnectionGUID: kUKoz7KmT06Rnn7MaF42/Q==
X-CSE-MsgGUID: lowuvo6ITe6iH+ljIDH+EQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 08:33:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 08:33:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 08:33:00 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 08:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcoZrUsFJgxJyAIB/++PsXyo3TJQs85rLysUtCeWtWxME55Eagu945Z2EqRnGbM7TgTpfEl5MtJAZD/pFYYbgEXBa5UhuZfJWP4v3kev8cFNyyYct2fSA46LImf+QNXLkjRbutOyRBdTFzlKOoGPh1EVCwpsTrzd4+DxjrOqMzN6SCMcpOfqa3zB6OwTwjVFZqJm4T52bUSgVfHu13cd8SAYmdCaBa8Gw105egj+eE3xIkWJv2DjhfxoahG5vepEdkSYaPyEV9s5qdfCYvT9/pyz3U3/LQof0gDIZTfLRpK8G1BG4qIl/wru3wvdGAVSm2WjDtV+oZAMMogh2eKovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMldK/jvLhcdDbpwmTHGTGoRx2a2HZT5akhkgAlGCaU=;
 b=KWn/pkFhCIIaDe+85V0bH1GdNiRhxkrOefkPcTa/TfiXgpHORNIxcKg41t7IkXFWmB9yd5OJbNA/c9psaZ+Xq+A+HP3OxtwXUGAbOjvL8sH8Pbb+HEOgtvUonAZyFBn96lPo7hqL3bwhr5b0UnU6UbR1/JWUoWNS0ue9o5rqqR+/0Knhudak9zmD3cAKI0RiwblTbXoHD+0VyixzDZw8UUEZm21NmwdQxcLKxpYcB9L6b0UbyjlBcP1KTR6r0y37xbGYM41TBSofR/tAHTtUXeZq4YIJ5/CugcGqZrNnqZYIhF12MngItE3+BegkyYrKClI7UFxeNl6cyY9/uZXZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 15:32:56 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%3]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:32:56 +0000
Message-ID: <32e022a0-f084-4508-813d-c1543ed2b280@intel.com>
Date: Tue, 21 Oct 2025 18:32:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tests/intel/xe_eudebug_online: add pagefault stress
 tests
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20251014114336.1712360-1-jan.maslak@intel.com>
 <20251014114336.1712360-5-jan.maslak@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20251014114336.1712360-5-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0390.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::24) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4722b6-3a48-49ec-bd08-08de10b71b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUlPVGpoemo0dzEwV2pRQ29iNERxd2Y3QkRjNGNjUFF4d1JPMEY1QzVsNU0w?=
 =?utf-8?B?NnRtdi96akMrRFlUM0wvTFRGdGlwZitFRXFVRDNYVSs4cWNSYytKQjZsZlpZ?=
 =?utf-8?B?VE5jdWtXYWFOQkdFaXZZYmRmNU5UV1BkVHhGQ0IxaWlreGxUM2hpVll5NDFw?=
 =?utf-8?B?aHAvcll5RzhJeW1yVFpITWszeHhSdUVXTDA2ZVN6N2orTVgwT2h5aWNpdmxo?=
 =?utf-8?B?Q0l4SUR3YVZja2EzSWhidE51bUR6eWk1Wk81ampUbS9DNlhQUlpWSm1NRTF1?=
 =?utf-8?B?bzZQNzJLem1TS1hsUFlYenp6Zm5VenpuYm5KaHpubGNTeWxtdkNPbS9PZ0lG?=
 =?utf-8?B?ZGMvd1FVa1dkWVF3UEdjeVRrOEc0ZStMM25xS2RienpyWHl4Y25IWTYrbUhv?=
 =?utf-8?B?Q2IxNmxEWEtNUXNJZ040TTFtd1FlZ2Y5aHIwS0swMnllT0VIOEc3Z0Fyd3BR?=
 =?utf-8?B?VmYxSVVHaFhmbnBtSG52UVNydWF3ZG9rMXRFUFFFQ2JHOUdDaTZRYWZJWUFt?=
 =?utf-8?B?MXNZMzJQQ01ocTJTUTdHWEZBaThIRExhdnA5ZFFTUXR1azBodG1vamU0enFy?=
 =?utf-8?B?cStBc2JRaFVVYjJkRmtleE11Zm9TUklHcGVlaWYyeDI3dTVqNjlsdFBaQ09Z?=
 =?utf-8?B?U0F0Z3BONzRNeGxCY1lFaFFzQXkvWElqOEl5ODdkelZhZ3VkMFNSd3BuWUJL?=
 =?utf-8?B?enl4REtuTEFpOGhVWHFPeDVIRjZnYTcrSHY3N2c4T0FwaXlQNitleS9HY1hN?=
 =?utf-8?B?K1JQNHk0TlFhQUlQdS9sYk81THh6QVlwMmlaWmJJYjl6NUtYNUJsVlJjK0ZU?=
 =?utf-8?B?MGg4VHRrWkR2My9BNVBQSGsrWjZoZCs1WE9Zc1VuSXlnRHMrb3E2MDNZRzd1?=
 =?utf-8?B?UU5KY3FDSDkydGV0aE9ONVFsalBCNHB6djIwaXdlOXlQTHZxZzV3K3U3bjRu?=
 =?utf-8?B?V0VQS3N2U0V1UXJRYVlhOWQ3T1U4NWwrKzVHZWhDY2tRTWRuOGRreG9VYjNV?=
 =?utf-8?B?cUFDSDRiRjZUT25jY1Z1b1YycTFPbkNhTUlKaHJFQ2MydTFSUkx0cys0MStK?=
 =?utf-8?B?Qkd6cHhpanZNUDkwVng5b0NoR3VmaHF5RE1qZGRJb2wzRnBLejZPRGlFQ0pu?=
 =?utf-8?B?MjhLOUVLRVNmS2tENmJ3MWlVMmt2K1lzOE9IVHU3TkJwUzByMTBYV0FDRDYv?=
 =?utf-8?B?OWZncnYrc3JYbktSQlBYWWF3Zm1HRHNmZThJaVMyaUcrYkRWREVpcnpLM2xC?=
 =?utf-8?B?dG51eEhnZTZhcnVkUjVVbmhMM3FPdVFMckx5NDFaanJLVFNKR0lkcEhjTmtS?=
 =?utf-8?B?U1cyMkZta2pNNVVRMzN0ZitvRE5PU2dvdTA4eWU0KzM5ZFIwSWM2UWlWMElE?=
 =?utf-8?B?Rk9iYVR6U01KRTZoLzNmSDNDSlEvckZOTC8wVGhtRkd1VU5BUzJsMnJmenNw?=
 =?utf-8?B?MThFbnJDaFFHKzVmQVRVK0dpeExaekhseTUvTUpQdnVya09PeDhFUGJ3Q0lj?=
 =?utf-8?B?K09IaHZsdFVpalJJYjRMWVdwVVJObUNGY2wxR2pKU1JIa1hWZlUzOU8va2RI?=
 =?utf-8?B?UWZ4TlBtZEUxRWRpb2I2dlZpOE1FV01tRk1vSGJOUzFZS2pVSnZTc2VJUG1i?=
 =?utf-8?B?RlV1RTdMUEFwVWh6dXhkajVyRTBZN2VheHpGZ1JzaHplL2wzbUhkeGFtNUc4?=
 =?utf-8?B?T01idW5mem9aZm13enlSakNFaldIL1dYMDJCMlNzbDNSNGtBTS9jeEFWaTdz?=
 =?utf-8?B?a1UwdTVQWmFSTVhReTc3MGpFZVpzVm1XRnZScXBIRldCeitNNVk0WUZ0clJv?=
 =?utf-8?B?UjhKdkx1bHdncnZ6TUpKWldnTUpqcGdSUXpFOVVSUnZseFNyQ292NTBUWFRy?=
 =?utf-8?B?a2paclRCZ2FPOUswV1dCdHZTRHkrL3E4am5ueEtoWS9lUmp4dS9lWUpxN3o5?=
 =?utf-8?Q?yso8DY35198nVWXZp8a/4MEX1lW+NrDZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1h0QmxuQXhjRFhBazQrZ1prbDJxcCtqOWI4VXFHeUtkUXQ1WlRheWNWUHN2?=
 =?utf-8?B?ZTU1UVo5TzRDRG1pVkNIdW1mY3ZMb0lTemNPU0lZZ3puMUN6MDNvUjRsRmIy?=
 =?utf-8?B?QnhRMjNhYWRqUks3V2YzcWdyTktJUjl3RnhTYWVqWExRUlY0aGlRSWNra2xE?=
 =?utf-8?B?QU9WS2I2UmtQNGZlQWo1VUx2aTh5Q0RBeFhzZmRTd0pHZnQ4OFAxYk83UjdH?=
 =?utf-8?B?b1ljRHkrcThFS3ZhMG93UnEvWnpQdzl6czhBWHpnbFFEdHdaMlhvVHhoVHNh?=
 =?utf-8?B?dFdZV05GU0wzbklDYnIyd0JMRm9WdjEyUjhBVnAwVFNMODdtMEIzdG1tMWFP?=
 =?utf-8?B?L3dRbW1iSnNIaEtQUXVDUUw1TWVHU3ZzMmNQZUsrcjhHY09YSHFkS05iN3Qw?=
 =?utf-8?B?WEh4YnR2THVWK3RQNEdQbWxEVjl6ZVlIY0FwSGorMWVJcHo3ekxJLzRoNStt?=
 =?utf-8?B?K2lYTGJVOXpWWlBqeDFYVkRCNlMzNlk0WXlkTDhMOVYvWjd1dk8yUDF2K2Fl?=
 =?utf-8?B?dmRWMWFNWkZGK1NHaC80N0FDYU5Sbk5IcjNGVjF2R0p3OXNFL2pTNExtbDRi?=
 =?utf-8?B?Y1c3Qy94RnIrcE0zZjFyQ2hxbENsM2ErUmhHWDI4QVVjWUZNc1JPNDczeHhN?=
 =?utf-8?B?ZExKZENuSmxlaGFnVktFT3ZZMXlWM2F1dkZWMldvcFRQdEx0eXJMUjdhQ1hG?=
 =?utf-8?B?STlpekk1UlhWSkR3YmdHYlYzc1dXcDBncUEwM2dNdFhaN3lMVnpDN3dBYmNp?=
 =?utf-8?B?c2xnbWNTb1Q2T0VCY3dWVFVoc1RadDZDb281WnV6azhWTi9JcVIwVU1FWVF3?=
 =?utf-8?B?T3UwSy9pb09NdTJ3OTIzeEZCa0lQcEQvdzZYSDdnS2ttZGNpdWFXWVNiOTFK?=
 =?utf-8?B?bFB0bHRQL0NwZmxsbEtydlcvdDRya2NFVWFGM2lBUDltYWZvZ2xPd2tWeUFQ?=
 =?utf-8?B?dlplc1B0dWI5c2ZpRXprcnNQZlF1TUtuWVpQNTIyYkw2OUU3ck85M3BNRmFw?=
 =?utf-8?B?M3VmZ3R0SUM1YUh0a2RSRVFKbGtCZ3pEN2RmbXFPSTRaYU82c2cwbzcxc3ZU?=
 =?utf-8?B?RUtsWTJTcUhaM3ZrWkFVSXhIb2JvZ1lsR0VwQmdMd3VYTEN5OE9tWHcrK0dW?=
 =?utf-8?B?d0xxV3JqMmlmNTVWWkJHUnk3Tm1leFpGMTYyVGF4VTNvM3Zjc2szVzVTOWxU?=
 =?utf-8?B?NFQ1cElGK3RGMzFGTFpqSFM4U1J4RjNEdUtIK21QK0VrVEFHcVdHNHFyVDlV?=
 =?utf-8?B?YWwvaVNlazI1TTlYNlovVlNFZDNveTVVb293bTZoTUN4akgrNFpIenIxZ0xi?=
 =?utf-8?B?Q3p2aU1NaWhacUh4MGh0K2lUbEV4VzJzVXJNTXpvbXEzMTdOVFlOOVIzdTRP?=
 =?utf-8?B?MG0xSGhCOUF3TXNZbDdVaFJlckZsOTNKS3BCSDFBQTFLQVcraTJxcVhERXdS?=
 =?utf-8?B?UFI1VmhVMDc5OE5SUFNlNmZZaDBUZWVBS29DSnRNUzJNTjNCS3ZnWmRSK1BK?=
 =?utf-8?B?MU11NEltTDVoc1BWSVdDRy9FQmRnQk40QkEzWkxtdVVMT3kwMlI2OEh1NmhQ?=
 =?utf-8?B?NytiV1JNKzdYc0VwZzBkdU95U2wrdmZLeHdETmtYN1FXbUxoSjBoM2FQTmE2?=
 =?utf-8?B?QjZXVHQ2OTIra3hZb2ZjanFJUFh5QmpuYnBQRnk0TGswSldXdGNOMmt0bzNU?=
 =?utf-8?B?WndNVGdqZUZhenRFLzZEU0htbTRwNFY1c2ZaN2tlWWdaQWU1K3BxQ2FuQTRH?=
 =?utf-8?B?cEtGYU5FeW94R05xTUZUTTVEYS8yalhwY0lqbDM0SnpXTndsNzZLUHIrS1Q1?=
 =?utf-8?B?SU1nR0paZzVHdkorM1cxdEVXRHZ2UVZXb2tUemNLb2N6c01XY29UOUI2bkhp?=
 =?utf-8?B?OUx2eWR5SWp2YzhLak5zbStGRXB0SGxTQkVjeENGb2pRalR5L202UHFpWWh5?=
 =?utf-8?B?V29xT0pmUWZpOWU4TStrSllrc1ZPWVhYaU1Ea2RvUzRWRldtV1dsc3B6dDBB?=
 =?utf-8?B?NXpxejg5YmZNRWlrdkJOVGFyTTJGWTF5R0NFZXdkc0cweU50RjVyNVAwTlBo?=
 =?utf-8?B?dDhjcm5sbXc4LzhVSlJwc1NrZHFoVzRveGdWeEQ2RzNCZ0lVWGtrYWg3OTI1?=
 =?utf-8?B?VnVQc25yUHpLMXVJVEZkWEJMRVYwU0hSYnZaS29nV2RaQ3BuNlc0UlpLUTJN?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4722b6-3a48-49ec-bd08-08de10b71b60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:32:55.9764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtiLhkX1oJeS5gI0zmlAyhoSp+aDFOVFvEKm6r7XfdA8BWBV6ml89x3quzEs0wIj0Va6MAwZE8ClCLmOM9I8e+/f+9PzW4f5icWYyJix9SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 10/14/25 2:43 PM, Jan Maslak wrote:
> Add a stress variant of the already existing
> xe_eudebug_online@pagefault-[read|write] tests that increases
> number of threads in the shader and number of threads in
> threadgroup to their maximum available amounts.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 61 +++++++++++++++++++++++++++------
>   1 file changed, 51 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 4c6c31da3..356787ab6 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -40,6 +40,7 @@
>   #define SHADER_PAGEFAULT_READ		(1 << 14)
>   #define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define FAULTABLE_VM			(1 << 16)
> +#define PAGEFAULT_STRESS_TEST		(1 << 17)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -127,8 +128,22 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
>   	return buf;
>   }
>   
> -static int get_number_of_threads(uint64_t flags)
> +static int get_maximum_number_of_threads(int fd)
>   {
> +	uint32_t subslices = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_MAX_SUBSLICE);
> +	uint32_t eus_per_subslice =
> +		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_MAX_EU_PER_SUBSLICE);
> +	uint32_t threads_per_eu =
> +		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
> +
> +	return subslices * eus_per_subslice * threads_per_eu;
> +}
> +
> +static int get_number_of_threads(int fd, uint64_t flags)
> +{
> +	if (flags & (PAGEFAULT_STRESS_TEST))
> +		return get_maximum_number_of_threads(fd);
> +
>   	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
>   		return 16;
>   
> @@ -156,8 +171,8 @@ static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
>   
>   static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   {
> -	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
> -	struct dim_t s_dim = surface_dimensions(get_number_of_threads(flags));
> +	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
> +	struct dim_t s_dim = surface_dimensions(get_number_of_threads(fd, flags));
>   	static struct gpgpu_shader *shader;
>   
>   	shader = gpgpu_shader_create(fd);
> @@ -165,6 +180,11 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   	if (shader->gen_ver == 3000)
>   		gpgpu_shader_set_vrt(shader, VRT_96);
>   
> +	shader->simd_size = SIMD_SIZE;
> +
> +	if (flags & PAGEFAULT_STRESS_TEST)
> +		shader->num_threads_in_tg = gpgpu_shader__get_max_threads_in_tg(shader);
> +
>   	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>   	if (flags & SHADER_BREAKPOINT) {
>   		gpgpu_shader__nop(shader);
> @@ -210,7 +230,7 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   
>   static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
>   {
> -	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
> +	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
>   	static struct gpgpu_shader *sip;
>   
>   	sip = gpgpu_shader_create(fd);
> @@ -673,7 +693,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   	}
>   
>   	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
> -		uint32_t threads = get_number_of_threads(d->flags);
> +		uint32_t threads = get_number_of_threads(d->master_fd, d->flags);
>   		uint32_t val = STEERING_END_LOOP;
>   
>   		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
> @@ -695,7 +715,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   {
>   	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
>   	struct online_debug_data *data = d->ptr;
> -	const int threads = get_number_of_threads(d->flags);
> +	const int threads = get_number_of_threads(d->fd, d->flags);
>   	uint32_t val;
>   	size_t sz = sizeof(uint32_t);
>   
> @@ -920,7 +940,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
>   {
>   	struct drm_xe_eudebug_event_eu_attention *att = (void *)e;
>   	struct online_debug_data *data = d->ptr;
> -	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->flags));
> +	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->fd, d->flags));
>   	uint32_t *kernel_offset = &data->kernel_offset;
>   	int *counter = &data->att_event_counter;
>   	int val;
> @@ -1044,7 +1064,7 @@ static uint64_t get_memory_region(int fd, int flags, int region_bitmask)
>   
>   static void run_online_client(struct xe_eudebug_client *c)
>   {
> -	int threads = get_number_of_threads(c->flags);
> +	int threads;
>   	const uint64_t target_offset = 0x1a000000;
>   	const uint64_t bb_offset = 0x1b000000;
>   	size_t bb_size;
> @@ -1061,8 +1081,8 @@ static void run_online_client(struct xe_eudebug_client *c)
>   		.num_placements = 1,
>   		.extensions = c->flags & DISABLE_DEBUG_MODE ? 0 : to_user_pointer(&ext)
>   	};
> -	struct dim_t w_dim = walker_dimensions(threads);
> -	struct dim_t s_dim = surface_dimensions(threads);
> +	struct dim_t w_dim;
> +	struct dim_t s_dim;
>   	struct timespec ts = { };
>   	struct gpgpu_shader *sip, *shader;
>   	uint32_t metadata_id[2];
> @@ -1079,6 +1099,10 @@ static void run_online_client(struct xe_eudebug_client *c)
>   
>   	fd = xe_eudebug_client_open_driver(c);
>   
> +	threads = get_number_of_threads(fd, c->flags);
> +	w_dim = walker_dimensions(threads);
> +	s_dim = surface_dimensions(threads);
> +
>   	shader = get_shader(fd, c->flags);
>   	bb_size = get_bb_size(fd, shader);
>   
> @@ -1644,6 +1668,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>    * Description:
>    *     Check whether KMD sends pagefault event for workload in debug mode that
>    *     triggers a write pagefault.
> + *
> + * SUBTEST: pagefault-read-stress
> + * Functionality: page faults
> + * Description:
> + *     Check whether KMD sends read pagefault event for workload in debug mode
> + *     with many threads.
> + *
> + * SUBTEST: pagefault-write-stress
> + * Functionality: page faults
> + * Description:
> + *     Check whether KMD sends write pagefault event for workload in debug mode
> + *     with many threads.
>    */
>   static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
>   				  int flags)
> @@ -2679,6 +2715,11 @@ igt_main
>   	test_gt_render_or_compute("pagefault-write", fd, hwe)
>   		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>   
> +	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
> +	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   

