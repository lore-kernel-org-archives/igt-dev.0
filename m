Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6FECCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 15:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8C110E174;
	Mon, 27 Oct 2025 15:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwjrrSaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BB710E174
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761577773; x=1793113773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v+bLgGOxKEEEAdNBE8ffTnVXp3gLAo2YyBcbHV4rWG8=;
 b=cwjrrSaUCKtC7iXuNRVK7EJiVZ2fsX2GUFlSUY6EB/Dmc2FBtwKvBYm9
 pq5XePIZNe5kf7fuopxbRF9M6FGoRXN3/2LIRt4wNz3lqvSG+PgsZbvPE
 WPXcrlRMA8WGW8uHaHAASK0RcXK+qYP8NHmG7bIxrnoxjZ0z5cgOo0TbC
 9uD4WSccXiWLWsmDqIl7NvA+Xrs4LTCQK9UfjbL/jkRo+zySmUyL9810T
 XjFrk8ONVdYPUyepQZWwRyedyDv2T3vtJl18pCWeK7UwRfElz0ow2N/df
 bRvd0/xV9I8YT2CnjWtjEFIydttIp1r9jgGH0S73SftVi247cfI5WS6mG w==;
X-CSE-ConnectionGUID: m7cH4gSSQmCFzvOjMwWSpQ==
X-CSE-MsgGUID: 8VQr4BUoRaqrV7AaurtIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74777524"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74777524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:09:33 -0700
X-CSE-ConnectionGUID: 1A0zwwmqRy62VKVwvsfReQ==
X-CSE-MsgGUID: p+fA/sZ0QnWYD1cb7BT0hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189381766"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:09:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 08:09:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 08:09:32 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 08:09:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyWyL3S/WvXQl8xsG1KAgZ32qI+CS520211qFGqB1gMPKWAj+yMqjJIxV/MK6tDhsL/028urMeDjuwQ6eea+zNzc6mZXa4a78f6/F09zULkzi5Mbhahr0zEwk2M1vuVyjaMSz3MbbAJ9QkF91d/IBYRwYeNpL27qJjMvU1YCoJWW4fGEYjhfoM/MGEZQOcJwE9rNa7iny5VLOrFQDXUCuZ5RHWszkOZEjO7xkVDUITcP5MnCEJoEYKMCZ0w2VdFE3/QfWILrG+Of6vTYOQlpTTQJBDhO35CYse+26FyRAYW0P/WGmb/OEGvDJYW/eple/VLrEQZwVlvNDiYwkmrLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O61jMGGqwZtE8BBkvQJZJ4DqsluGCn/3VQY08bUjzSA=;
 b=OpPZH8dFWf26hqqDJjbE+LaftqlwFcQU6LQveHAU0Wlxr1n9yV3z31aXxdwHyhEJasIVQHEQcfXw9KUJP7j6mdFwi5SjY30MoP2unNeyDdtMR4CIWZGPcVtYhOgnstBXmUcFJsZmYUgE1IZonVROUFP1vDMwTccYHcuO9F6sFGQAqlvXZSYllEn3ifb1XPyFbf+BWmVaUDTH0rZnXVfEmgJ3/Fo/2OQ6vvVTMW3hzjlilm2Dk4yszXJPVRmnnxvZAgKZZS84s74bRmd6ApVb6oNu56pUpobRPdDFFH/bcS2ig1gTeE6krAwd3wMfEApfWoL9CFXMvalKNdeYulujzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 15:09:29 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 15:09:29 +0000
Message-ID: <ebcfaed0-b991-4272-bcb6-25e05cbfa166@intel.com>
Date: Mon, 27 Oct 2025 20:39:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update LNL/PTL display blocklists
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>
References: <20251027150312.2209085-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251027150312.2209085-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c4cc20-c454-45a0-07e7-08de156ad337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTBka1A0anE0MjFMK3VsSWVnSnBNYUV0NDR3Z1N3UGZrOEsrU1JNVWU5T1Jo?=
 =?utf-8?B?Z0RtdFd4VUZvTy9kRlVCZDFVdXpPNVRwVGpQLzBVTDdkbnJxWUZYeVp5bWxy?=
 =?utf-8?B?SG5mTzc5bytMdWNnTDE2RmtHSWJBVERRM0pCQWhLWFJuY0RTNGxxS0VsZUIr?=
 =?utf-8?B?UVNGeEpZems1NE5XVXF5MVMvNGNnbldOUU15Q3MrV2F2djVjOFN1TTMwT2VD?=
 =?utf-8?B?K0dJVktRb0c5ektsMHVTb2E4ZnJlaCtJWW8vOTAvZ3U3NStXRzZWZEQwTUhV?=
 =?utf-8?B?NTg5Z0ozcjJwWHFCTUtsUTlLNEt4cUY1MDN0cEE0KzVBelc0NVFSbW8vTlFq?=
 =?utf-8?B?N3g3TFBrRTlScXlhbnJhd2phRmErWkNZYXEwU0JNTXBmNnZ1UGxvQ2JZMXRR?=
 =?utf-8?B?bUR4azZIZkVNWEtpTEY4WWdnN2QxZmEvNGV1WXdYT284VFh6U2UzM3QxUlJp?=
 =?utf-8?B?c3JOdmZON0dDYnptSWRyL0grVUtLZTlWWGgxWmliQldNSXg5OC9CUWk4eVY2?=
 =?utf-8?B?QzdwZXdlL05wRkUvTUZLcjBQaFhRY2c3U0k5RWhiM0VqeUsxTGhITFNQQ1FE?=
 =?utf-8?B?dWZnTUJSUzFGeUxFSEdNM2lJVkRmRkptTTk2cXhrMVJrdzBOdEtTQjVqZFIr?=
 =?utf-8?B?bzZBWE41NFErYUEwODJHeDM2V3orTmtNZFk4VXpHQnc3VXNHVTFjRkplOURo?=
 =?utf-8?B?SUtseUV1MGJrRkg5TlFtSnlveFkwbzJVbmlJN3VWTWtNMFhKb1FTMEQ5WFEz?=
 =?utf-8?B?cUFNRkpuRjBPQjNEaHF6MWlhT3NSM3JuSk9WSXZ1ZkFQSU5vYk1ydk56TnJx?=
 =?utf-8?B?ZytwSko3T1Y1UzhkbDdmZmlLZmtUeXY0MzZVT0xDM2ZQNGd2MHd0Qlk4aUVj?=
 =?utf-8?B?cFA4Y054RzNPY0tleFFhcTNSWURBU3BVZS96andOZDRzamFzbTNpVjRhdjlE?=
 =?utf-8?B?V0hSNFBEeEQwLzd5WTVHWm1QTFBVUGR2b0srZThxVkJwemZTNnNvbFpWN2ZD?=
 =?utf-8?B?eVMzcElQYTdvRzk3Ym9pcG1zTFovcU9tR0E3SFBxOEFhQkg1cjNBaFNIMXdM?=
 =?utf-8?B?VkZIQ1JsOGphRHFVVTBNRnlnMGRJZXZQNUdIR2RpRUkrRWpXRTRKMVdhUVBG?=
 =?utf-8?B?N2k0M08zRjkzZmZJbkFjTGZoZjdreGVjTCtWcEtiajZnWVI1bENtK3Q3M2hB?=
 =?utf-8?B?ZlJ5a09UMjBQSUhuWUlXekNwVTZPQzlnTWN4Q05aall0a2p4aUNwTGFpbkV4?=
 =?utf-8?B?MDAwY0hrS3B5L2FJZ3BlQXdNdFVQeHQ4U0kzejJxbFEvdUw2ZFphSWdsSHdZ?=
 =?utf-8?B?aXRmd2I0OXJsa0w4MmcrS2JINFBtRnNqN0Z5KzFPUzBySmlVMEo1TnlMVmZt?=
 =?utf-8?B?c2ZvZjE1LytKK2NkNkNKYTd0Tkhqak4vN2xzMGttYVRUNGN0NlIvdG1SYnR6?=
 =?utf-8?B?UGF0cXBKOUVWKzcrd21FcXVXcGZCWlJodHhPR3lEMnpXVEhlVGJsblpLSzB6?=
 =?utf-8?B?VTcwc09NRGNlY1JtcGhsV2tXQStiYWJSWEVCeGdCSlRVSXhMV3FCT1BFNFJp?=
 =?utf-8?B?MHBOQjFPTjl3ZXVQblhRelFsMUNYVXVDdFhWTTZhUEtta3RRdHN0TnU0Sm1W?=
 =?utf-8?B?QjlZZFp6TUptZWMrUjJNLzlZcGtnUDZGV3hjZDEzaHNVMFNyeXRUaGNYaVl6?=
 =?utf-8?B?eHdad0FkVDUxOGlVT3hOMGhLZ0tybSt3MTg2Vk8zOGh4UzNmN094ekhldDFD?=
 =?utf-8?B?V3VwUnc5T0VtZXdIb3N5VkJ1NU5sRGtiblFFYk9CVStXU2xjM3orY0RCOVkr?=
 =?utf-8?B?b1ZQU2t3UldGYVprRWdSVGtQSHRZbENhY2lMN2VoR2VTZmlKWXpleEE0QVFI?=
 =?utf-8?B?a2lUS2N4dTJwVzZOQzA3NnlOWW9qTUkxTmhzV09kTFd0QW8wakFvRHlBZ2Np?=
 =?utf-8?Q?a3ufBRjdQt5qltqkUFE8RO+aX2IeSt4V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekFaTFhGeEhPaHA2V3lJd1VmZjVwNkljYWR1U1pmcStaQWhkemU0OWFNRmpV?=
 =?utf-8?B?cFFHTVZJSWNWN2orUHRPUHBuSHRybDVKbnpheFBmRDc4bUtyZE9uRi9kZFFW?=
 =?utf-8?B?Wk1WWkd0WldEL0VkMHl5MjhzQ2FGak5sOWVpTWVqbUxST1pnNnBGWjQwa3BD?=
 =?utf-8?B?bTIzNmJ2OFRMUGoveDFsWjhteWgwVG9maExJYlJiOFpBUnZpbUpCTW0xUm80?=
 =?utf-8?B?SDl5RFBBTmFFQkpxbWJORGJGSXh2UWdUbVNwT3gxNEU5ZUJueTFJMldZNjVa?=
 =?utf-8?B?ZGcvZndZdUZUcWhneC9NcU5yMUdnVC9SVkxsdWFiZkx2Unlta0VZMzZKdDhX?=
 =?utf-8?B?YlNSekNwa1h4Zng1ZjcyVkNzemZvR2p3dVZYb2U0TktNWnZFOWU5a25GZ2Zr?=
 =?utf-8?B?Q2I2K3ZKUjNsVHhhMndBdWc2SVBrV2x5ZUpCMVBDL3pYblI4QnAxYXhqVmta?=
 =?utf-8?B?SWIya1MwY0FQTitnUmt6aG1wQ1g4WnNTUk5wTHhqdEhOZVlvWUxMNGhNU01q?=
 =?utf-8?B?ejVxVTJ6TGJEdkFiV0NxakRYaklzcWlMWUdGczl2cSsyUlB6VlVOaUQ4N25S?=
 =?utf-8?B?Z1MzOUdkVlhSS1ZVZWxHUDNuRHplTXRVK0J0VUJqTlRLM3k1MEtCQ2lIWnJ0?=
 =?utf-8?B?RGFqTkFvQVh6bTU3OEd4M3RsdnZKeVc4bnh2bGh5bmcwTnZURTQ0ekYzVXpH?=
 =?utf-8?B?QlU3c3VYRUdNT1RQelhKVStoTXE5bzdlWG1LaS9KR1MwWFdSbGNIRm5Senp3?=
 =?utf-8?B?dG5wMUM3WjJFQW1Ub3BydEZ3UEN5VWd4S1l2ZWlDdDNIN2x1alZuUXVzcnZI?=
 =?utf-8?B?TityUHN4ZzFXY1djK2pMOXlKWjYxSTFTcFNSUHAwRFcyVGR5RFFGd0xrVEZ0?=
 =?utf-8?B?RHg1enFGL3NTRksvcG5NZk0wcU5RMy9KZ2hzRjNRYWI5akJweWJRVlk5V0Zk?=
 =?utf-8?B?RzJOckY1N3E3NGpETzNHZytidFJDTDdKMXcwRmxSdlhCUDhvNDY2RGZXanow?=
 =?utf-8?B?MXpmeXc3VHhFd1JWNHg0SW1GUEpwalpKUnVNbGk3ZUxKdnhkVHZrZFl2NWpM?=
 =?utf-8?B?cXowMGxCTnNTUGFkMFZHelJRM0I1YUgzVEhaL05vSlNvdmhlM29MTDdVK2Ux?=
 =?utf-8?B?cVYxcmh2OXNsQkJRNUtpRm9oYkdsNVNxL3JyWlFxQWN6elNxczlPL0dIaU5V?=
 =?utf-8?B?eWRSVXBURUhJMFJiS1Z5RDdkOSt6S3pwVkJwVFBVZ2NjNVM1SzRjYVlJck5u?=
 =?utf-8?B?MG94RnpQSmpOZmZub3ZOd1dNeVorb1hjdDlLR3N3OVNzUitmenNaRGdrQXE3?=
 =?utf-8?B?czd0SEtnRlFJN2JFKzR5SHJvMGRsQXN1Uy9qVWJXSE9wWjFXOGNlRXVmR0JK?=
 =?utf-8?B?RXRDMHBEdmd0ZjBuTTVHVzZuQXB2TDJqdXRZdldISWJiclczUjFuMWNhNm5S?=
 =?utf-8?B?Wi8vcXE5YzBiNjQ2WEh3Mm5DUm9OR1NoSjl5VnNlT0FTWUJxWDIwZGYxSmdQ?=
 =?utf-8?B?eWVXQzN1OTRPaTIrK2dEckZCNGdERXhsbmprSW1xek5vRlllbGN4V3lzYzJ0?=
 =?utf-8?B?M0RNZ1hueGdUU2RaYkZsN3EwVnJ3dHRBNE1PTGpCMjdRekxYN2R4L1hyY0Ir?=
 =?utf-8?B?VXNtK3FXTkRKOEs3Z05oa1dNSXdieDByRm5mYU85a2hRNVcwMHhvYzhWb0U0?=
 =?utf-8?B?WFEyaGNXK01NelNMWEprd25IYWREMXZrOEZHSEEwWmFoM1EycTdBc3I3S21z?=
 =?utf-8?B?alBaNUJucWlqc3NPWUtpN0JnK2VHY2JBb2VZTGRZdkxCNHFGQ1l0eUhVTWFS?=
 =?utf-8?B?TEZPWk43U0RpeWYvNWVKaTIvZjVFRTZPRTQ2dlFXTEh1ajVvSFk5UUIvZkdv?=
 =?utf-8?B?c010VFB3eE9WZVBrU0dUd1BUZUJGemtXYStKQThEdy83WHlXZXRlM2xNa29M?=
 =?utf-8?B?Y1JMZUI2TGNRdzJjRUFrTW5RRTFZR2FNSnpsL3ZNMVJOdXVLWVQvd01qMHBT?=
 =?utf-8?B?dXhMc29FeVdGMDY1MlZ6VDJkb0hGbDNwSnlpbEp1SDF3MmZsaVJKSklFQm5y?=
 =?utf-8?B?UEdwMEE4d3RTUzlTRjB0TGhXelRVVkpLbjFrR25hSFRtcUl2bEV0NkdtaW0r?=
 =?utf-8?B?LzEzV2crY3hRTG1TSlFPb05NSUlBSTRHN1RtMHdFMXBsbFlmQkhKWW9ycGdY?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c4cc20-c454-45a0-07e7-08de156ad337
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 15:09:29.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJCNscjmo3lV5Xcdrb7H+e2WA5EfOLnEJwInYK8Bw4ab9RsjbXZMpVdcffv3t1gyKcdboBAWJyNdoK6GfuXooQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
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



On 27-10-2025 08:33 pm, Karthik B S wrote:
> Remove fbdev tests from display blocklist.
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> ---
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 3 +--
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 2 +-
>   2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index edde67d75..fd2065659 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -1,8 +1,7 @@
>   #########################################
>   # non-KMS tests
>   #########################################
> -igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
> -
> +igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
>   #########################################
>   # Valid skip :- Y and Yf-Tiling are not supported
>   #########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 12219f89a..4c3803235 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -1,7 +1,7 @@
>   ##############################################################################
>   # non-KMS tests
>   ##############################################################################
> -igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
> +igt@(?!.*kms|testdisplay|fbdev|.*display-vs-wb-transient)(.*)
>   ##############################################################################
>   # Valid skip :- HDMI not enabled in VBT
>   ##############################################################################

