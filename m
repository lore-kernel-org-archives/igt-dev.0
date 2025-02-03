Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76898C02192
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 14:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EC010E0D8;
	Mon,  3 Feb 2025 14:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRSFub9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1FE10E0D1
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738591913; x=1770127913;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fH9K+PnEkrnUu52oQWBTOQQ5d2KtifbRVJASH+NNZ/Q=;
 b=jRSFub9l/BwTaik6f3gB5vxrFAKf1IMkQqYWk5qjMaYTB3CNj1hgm29u
 +EtoR/9p+8b94FsKIjdZay4ie05uBngQGYDnDz8xm0b6CymSGtcTYb3RU
 tSXnwKWvv9VCIjzvrpR1B7VWIq7LgmsDFETy1rKcxABKgc3Kar/zxSOk0
 ilBw9FRWcQirI1qOmNnzxNBHeWNZcm44LMWOPCPxiXWsd4M5SfQnkGx5X
 fCVuyZfTVmbG5kgsLaBoVpFZM3uraSDqArkruo9lxAB3cru2IidIajoCK
 6HZIOKtZBSia026vXbpzGiMg4Gu3ayp5lQ2I68oACQ8NxSwry/hOFboJq Q==;
X-CSE-ConnectionGUID: ZJPoOePpSgW8qQcywKnnQw==
X-CSE-MsgGUID: +Q177vgkRQ2AC0K6soiAYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39223278"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="39223278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:11:53 -0800
X-CSE-ConnectionGUID: JJImBEtwTpiztYNERtfoCw==
X-CSE-MsgGUID: ZuWUmJFaRnajKj8/UMV0LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110192717"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:11:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:11:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:11:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:11:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGnPmi9cRA+jf2UC5A6sMcwo1yPdyGXaKR42BQpkFJZ5z8oF+8eYhMv9MSxP71x/ZDLEkhQBGeXPcjEBi56NjLzACwQi8SJQT3CHPdJDgWSczgQmfiL87zJsywTZlwZUJDR8q9Dd4bo4eNsxPqnv66ldjLol/GLMohcv9yr9qkfcOnu5CECoQOIFS57E8oQzrOILl6+/vyxQdjbOpZTAyLiFY92wsEu65XXtKe6sSLECDSEgiWbqmsHlWaqbPZ10VlYR9b89HwtY6FzcQIp3DDrz2RwgHZ/zlJoRRyF5/vE0Rk3Eg/Gh8eg61kB4/XUsQvsRa/YUXgMjEdRvM1UBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nb1UZfAQ22sf49KtbuchK4PmNxBdpDik9S6KHSSnCQ=;
 b=TUF3sZxVzVvLJIb0mSUPQRIOAu4raXNGZ6cp07KVPPZv571HUVw5fqiBllftwMUhCj0w5h0occkgBqUomHwjxArzPleNE+NKsj9A5wQhkuc3Xo9zbrZZJtRoaw4FBzRxHnZRWzkCX89JL8hKQSYqn+lVqGDPKXIdNKk+8hVUjmrrM/JmsC+o3TmwKDRHsfy8hT1JWX3EQyoOIIdQUaBtxDLJj9+HAhxkMwjsMi8Fp/TV0viIgcm2bruFWEM+9UO8H5RZKLhbhO2NlstMOanp7UC67lqfXVKAKXVTrBynaHo73Vx9rwFoqCT8NIKRQKCBv4lVQNZQPZpNLgl5ftbewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 14:11:22 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8398.017; Mon, 3 Feb 2025
 14:11:22 +0000
Message-ID: <759fc6b1-3460-4141-aabb-f077eaa7c20c@intel.com>
Date: Mon, 3 Feb 2025 19:41:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] tests/intel/kms_cdclk: Introduce set_mode()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
 <20241230190315.48821-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241230190315.48821-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e66dd09-01c5-4c8f-f3ae-08dd445ca30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUphVWE0OTJFRE5wVG40eXBjUEYxeUpnR0hFMitkLzgyZFJpeC9nK1VDRldu?=
 =?utf-8?B?bmFKZ0RGWE1taklUTFNJVHpieCs2MUZZd1BOZDNKcklJUk05azFiQWhuODZk?=
 =?utf-8?B?cHNrZWVSNU0wUlhzeXFReStHNDBMY1V6WlZDeDU5b1R1VjNyQlk0aWg2VnVL?=
 =?utf-8?B?ZmVicDRFYmpuWUN3S29lNit6Ry80NE4zZU02ZVduWHFqakZqTm9Zc2IrN09h?=
 =?utf-8?B?dHlYVFZnOFFiQlFxNmVRa2tKTSsxS0xCaDdnWnlCK0VKNngvbjRiSVNJU1I0?=
 =?utf-8?B?Z1lKOUM2NFhVK0dKWU9XZ0FjTWNPajJWeWY0emNnTnhtNHpJODM3YW1pVnRl?=
 =?utf-8?B?bDZrTDluWGlUQ3pFQ3lYUmxPUDhUdjVmOWFwTDNiQ2hIVVhoUlMxL1VWYjYx?=
 =?utf-8?B?VXpKemdDbEI5T3UxSFQwR0ljMGVGNzNDUUw4NjFLVVVZdGMrbkU2em4rVTQ2?=
 =?utf-8?B?bEpCRWp1dW04T2pYZFdTVW1pVmdrdWlpcE9iUitkN0pqOUlyN0p2TW5NRExO?=
 =?utf-8?B?UUwzUzltLzdNOEpUMkR4Lzc4MlV5OEYxRWxEOXVBNGNyaWRYN1J5RnFMQ0F3?=
 =?utf-8?B?ZmQvK1pLSFpnRFZ0T1gxd0pPemNwaVVObHV2ekZRVkJsZFZjdU90K0hzNzlV?=
 =?utf-8?B?QU1Fc3BLck9KQi9Id0hvUU83U3pGV2NPN093YURlYlYvU2ZMS0VhRmVxTkox?=
 =?utf-8?B?WlJycEt5dVNud2NDQUpqOFcvWEd6alJLSGh0OWhqK2xtTU9yNHdsWUtPNEpK?=
 =?utf-8?B?TkY5Rm1OZDlwcktRZ0xrUlN0Yjg2cFlwR1Fxa0JzWUthTmx4R0pzT21rcWE5?=
 =?utf-8?B?VFY1clFGZHVMM2R3WXhScU5LN3dMMk1xZVdWVjRza0RZVWdaR0hBRmhYeXBW?=
 =?utf-8?B?cFBGTGZrVFVaaktBNkVnNmpGQjk4QytNMHo3bXNvTlo1WGRoSXFoNXlyY3VR?=
 =?utf-8?B?L2phODVsSzcwL3VzdGN1cWFYUmh5dWJOaXNTR05CajhIU29kcENXbFQ1WmpI?=
 =?utf-8?B?OFZKVjk4NWRpVjVqZUVHZEc3RWwxOE1MTmJ0MHJ4d0pQMWozdlRSeko2TGQv?=
 =?utf-8?B?WFExZ2U1aWJxd1ZyV3J5VS9wNlprRUcza1hWblNEbUNPRW00aGxZb09CaWw5?=
 =?utf-8?B?WnFHMkN0UWphV21sYTFhcXV6ck8xOVFPK1Q3a0t3V3NpOE5NdHB0R0g0L3dU?=
 =?utf-8?B?bzlYSzRTenRraXU5ekdKUE9zTWgzNmFYaFdTZkE0SmtTcW1qVFhJK0htUjdO?=
 =?utf-8?B?Y2xtaUlqT05aOHg0QmRRb2p6RDJOdDlYUStHWkpvRHA4QnZBN2YvdjR5SGlZ?=
 =?utf-8?B?bnU0TTN0RkxrWjArdXhNOVNlS2EyMU1Id0ExWXg4aFArUGhKWmNBemZ1d0F0?=
 =?utf-8?B?TDNlZVhPR0ZiQzVRTThmODV6cTBQTHc2S3Q2cDBxYkVyK0xlTUwrNXIvSHJN?=
 =?utf-8?B?TkhjL0NaQm5YUWVKSlBqMEc4QklpRlp5TkE5cVdHM3VDQldXbEZhU09pLytT?=
 =?utf-8?B?c3VyMVpyN0R5eDlIeWFHa0s3Um9rN2Q4TXRvMFFPcVVOaTQrQUtibU42c2lq?=
 =?utf-8?B?SmZENWE2ckM4QVdTNUV0SkJaNitCRjdBUjlBTU8wa0xkWUNTN2VUUG1zQzg5?=
 =?utf-8?B?bWphN0FsQlNIdHhPVE5XMjZLY0xRWUovM3BpSll6eGdiWVN3alpsTDZhd1pR?=
 =?utf-8?B?RFV5WFoyaDhoRHFZZFVNd2E0V21KZkZScVJYVzRIZ3N1RU5sa1ZSVGx5V3dh?=
 =?utf-8?B?dTJLbU4xV0Rld0R1MlJBdUtjelhrY1Q5dFJYdENBWHAxQTFOSGRkU0xtME9s?=
 =?utf-8?B?OGJxaHF5eEdEN2pGMi9RWktoMG1WY1hYbUlwUkl6dEd4YisxdTU5QTZNMjZY?=
 =?utf-8?Q?ZqSuIKZO15WIi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1Y0NEFqak5CNmdaaFl5ckZRcTE0Z2tFeHo0ZzBlRGhKZHZXejZyOHowMlY2?=
 =?utf-8?B?MStHbS9HTjFIS29xOGVndHdRVnhUZ0kzV2VkajRvcFNkbGtoU3BBUVo2TkF0?=
 =?utf-8?B?OVA1dytWc0haMCtmSjV1dWllSG8zR0NiL3FCamxITUJiNTd2NzIzVUxjR0l1?=
 =?utf-8?B?Y3g2aWw0UkI5Z3JONFNJTW1nNXBjWnVOcmFzZlVBbzI3NXRTTjJEbnJscUFa?=
 =?utf-8?B?S3EwZmY5UEhCWDQ3RElpQnQyQXd5YU1RTlJMUkJTbis1Q0IwVkQwd1JyRldl?=
 =?utf-8?B?MTZuK1IybnBQT3g0NWVYZzNIMThBTmk2Sjcvd2ZRbTRQcTlpdWRUalVTcmRO?=
 =?utf-8?B?bnFSQTB6bzI1VndLbS9QVXNxdmpCL1ZsdmRyYyt3Wm1aM1VML2RaMkQxU2Z2?=
 =?utf-8?B?R2JMQXVManhTSmNrUFpnZTRvMjZvTEhkOXgrcjFpRnpBajEvSEtta0JrSUpM?=
 =?utf-8?B?OWRXVGJLL1RHY09MczB4NTI3ODFKc0VJOURJOXo2UkZZS3RsZVh4RVdMUnBK?=
 =?utf-8?B?ajhKbktabC9BWStkNkcySGhrZmUvTCs5cWl3bytWTEpNQmxob291WjJYMXp4?=
 =?utf-8?B?cUhMc09GTk1pMXl6Mk1hYkJTMjlqTENDbWtOMy9jbWRTaDVGUVFReGk5K1dB?=
 =?utf-8?B?YkR4RzdJQXNJM2ZyYjcyQ3ZQMnl1blFLRWdsbUxjSlhoNmtuVDVKT1V3b1hV?=
 =?utf-8?B?T2pZaCtMQlNpOXplcWQ2UnpxOWxPWWFia3hmTlNYOGNoanpVd2E1RVRRQnZ6?=
 =?utf-8?B?UG5aTXl5cXkwV3AwRElicTZ2VC8vRGYrRCtoSUo4Wm02cDU0SFNFTWh2VzEr?=
 =?utf-8?B?OUw3eW1qa0pSdWYzcjVYTEJobHViblY3WUxjWENCa2hJdjdKYkFEUGZWNDgy?=
 =?utf-8?B?dk0wOFUvS3FJYU4rUTVpL1dwNXJhREZ5R0pPWEVqTC8rNzZma0xWTEpKRFA5?=
 =?utf-8?B?WUYrMUMvSUVwZjM2ZFREbmdZRWFoa1BRdmZhMW5QM1NHTUQ4eVlqRzBMUVJa?=
 =?utf-8?B?VXRZOHhhNDN4TmNOTFFtMVlsRlV6akVDT25ESmE2dlVkYUdOUkFJY3NTRCtR?=
 =?utf-8?B?Qk1QaUtKZFUwOEpzMGNCS2FEZW9kK3dhMGF2RTc5d2p4YklsMDBTem5MeU40?=
 =?utf-8?B?Yk1kME5MVWJaM3NOZjVQL1kycms2ZU5qR1ZBNlRaempYQ2NkcDBSMmwyZHFI?=
 =?utf-8?B?K2I0ckRDV2htbS9tQkZWMVkrZWUwNTN6ZmJ4eEFzRTNHbW55eEVNb3NwQ3E3?=
 =?utf-8?B?cHg5eXdyVS9pTy82Ui9xUTYwTVlXbzAzRG8yMXpNRFNBakR6RmMzYzY3QlZU?=
 =?utf-8?B?cWRVNkt4SklEdGpKUkFIQTRtN2tGZmQxNURKNHdocjdOTStwQms4NVFxUXVn?=
 =?utf-8?B?SW5samNQVXBoSmx3VURJR2J2L0dRenEzMHYxQmZud0Rvd0IrTHVLLzE2ZlBX?=
 =?utf-8?B?L0d2U1MwQnpGYlNhKzJza0k1dVpZakdRR09xZGJIcGlxaHRvUUtzT3dYcjc0?=
 =?utf-8?B?ZWRtZjdMMm9lTHg2WCtrb2JlSnRUREhsUGl3dE5vY1ZwcUsxZGRKZlJBdFo3?=
 =?utf-8?B?ZzR0dGxUamNLN0lvVXQ1bUdLWTFTbytCWDdxSHZobW1hNlltZk1YbXVnU2hy?=
 =?utf-8?B?a1pKUHBFZ29wVGJ1QnVjeS94TVQ0S0VUYTM5NkhWaURiK3R3S1ZqY1FoVWZ0?=
 =?utf-8?B?cjdaeHdvakNhTm9qaGhUY1BzeDU3d0ZjamtJM2x5U0tORWhZK3pOZGt2Wnhs?=
 =?utf-8?B?SFV0ejhKRTd6TENDdit3Snd2TUFtUmF1ZzdYN2VxQVU1ZndjRjg3TFZlSFhl?=
 =?utf-8?B?ME94N2RtZzdYQlpnYm1OYk5Pd1JoenhmTXFNV0JXakg2RHVNUWtoaDhVam8r?=
 =?utf-8?B?ZHhFeVpEMVoySHd3TzRIS0NhVHlXckJFWEt4b0xza3JsaFBMTjJXdjNDclBD?=
 =?utf-8?B?c3BuN0xlYnZNR2hEVVhGQ0tCK0FOSWtWVHdEYzFWNHYrMmpRY0IwSW5WSWY4?=
 =?utf-8?B?eHp3ZHVhMU1ubjFWUXJwN2pqaGVSbmQyYlhVU1A4anIzVnYwNHo0eGdVakJX?=
 =?utf-8?B?RFhrZzNzdi9IMFNkV2U1Nkh5SzdKZUh4a2VJVzQ5endUWTFmNWFQcDdpQURr?=
 =?utf-8?B?Skg3SDdwZUwrN0lPWGtkOVF1b1BIZTdYenlqeXNjdzQrYnkvWDdYdW9WMWxy?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e66dd09-01c5-4c8f-f3ae-08dd445ca30b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:11:22.3513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0d1XEtX4noCDzunqbMS+8akHgxSah+byK1SYJcasMFemKf1XLEFtevGIdhQ4Q21wIbCyNiBniM80kVpC1Kpt3/KSqksc4R7xqn/f71PdLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
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


On 12/31/2024 12:33 AM, Swati Sharma wrote:
> Encapsulate the mode-setting functionality in the set_mode
> function to reduce redundancy.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 71 +++++++++++++----------------------------
>   1 file changed, 22 insertions(+), 49 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index dfc64ae2e..67efdaa3f 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -256,21 +256,36 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   	igt_remove_fb(display->drm_fd, &fb);
>   }
>   
> +static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
> +		     igt_output_t **valid_outputs, struct igt_fb fb)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +
> +	for (int i = 0; i < count; i++) {
> +		pipe = &display->pipes[i];
> +		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_output_override_mode(valid_outputs[i], &mode[i]);
> +
> +		igt_plane_set_fb(plane, &fb);
> +		igt_fb_set_size(&fb, plane, mode[i].hdisplay, mode[i].vdisplay);
> +		igt_plane_set_size(plane, mode[i].hdisplay, mode[i].vdisplay);
> +	}
> +}
> +
>   static void test_mode_transition_on_all_outputs(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
> -	drmModeModeInfo *mode, mode_hi, mode_lo;
> -	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
> +	drmModeModeInfo *mode, mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
>   	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
>   	igt_output_t *output;
>   	int count = 0;
>   	int cdclk_ref, cdclk_new;
>   	uint16_t width = 0, height = 0;
>   	struct igt_fb fb;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
> -	int i = 0, j = 0;
>   
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
> @@ -320,52 +335,11 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
>   
> -	i = 0;
> -	for_each_connected_output(display, output) {
> -		pipe = &display->pipes[i];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -		mode = NULL;
> -
> -		igt_output_set_pipe(output, i);
> -		mode = igt_output_get_mode(output);
> -		igt_assert(mode);
> -
> -		mode_lo = *get_lowres_mode(output);
> -
> -		igt_output_override_mode(output, &mode_lo);
> -		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisplay);
> -		igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);
> -		i++;
> -	}
> -
> +	set_mode(data, count, mode_lowres, valid_outputs, fb);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>   
> -	j = 0;
> -	for_each_connected_output(display, output) {
> -		pipe = &display->pipes[j];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -		mode = NULL;
> -
> -		igt_output_set_pipe(output, j);
> -		mode = igt_output_get_mode(output);
> -		igt_assert(mode);
> -
> -		mode_hi = *igt_output_get_highres_mode(output);
> -		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
> -			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
> -			      igt_output_name(output));
> -
> -		igt_output_override_mode(output, &mode_hi);
> -		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisplay);
> -		igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);
> -		j++;
> -	}
> -
> +	set_mode(data, count, mode_highres, valid_outputs, fb);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	cdclk_new = get_current_cdclk_freq(debugfs_fd);
>   	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
> @@ -373,7 +347,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	/* cdclk should bump */
>   	igt_assert_lt(cdclk_ref, cdclk_new);
>   
> -	igt_plane_set_fb(plane, NULL);

This doesnt seem to be related to the change.

Otherwise LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   	do_cleanup_display(display);
>   	igt_remove_fb(data->drm_fd, &fb);
>   }
