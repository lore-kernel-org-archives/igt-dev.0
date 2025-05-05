Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006FFC3ABB0
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 14:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE510E2E7;
	Mon,  5 May 2025 14:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCWmU2wS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B4610E2E7
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746457160; x=1777993160;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QEMI8vKcDLeTVSTSiADtqj5nHYFewNxw2ICc5Orva+I=;
 b=GCWmU2wSeyLVt7m1bHJahaVwthx7+SeCoZyKLBHGzUjo+1RCDUnqYLxL
 Eeu5/RG3wrU2O4eofnaqJLY35xJDai3u/kRaPikS9SsOc3Md9NYnX+aia
 kjMaVXvUsGYlheOnBujYYyL5rz4PAvVzo0Vt4R8oQT/JbkzaWphx7lUrc
 eWNdy4svjw8KQc647Z4aynOp3/AReo6OcOSJWM9j+3y+Jvjklzhbfdvhr
 DCF2QH7LyPNJPpnx+SpFPXqNgs/zisOnOWCVvWfoh0cm9gu091EQoSQWU
 cmsl25Tgqt7ygFd7MY7sydGmJAbhqpM41tXtVBi4X1jPRBRdmdMQMU0Tc w==;
X-CSE-ConnectionGUID: asWouSHDSEmeWHQcq/S/pg==
X-CSE-MsgGUID: p6XWWYB1S5mYjQugpMR91Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47970619"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47970619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 07:59:20 -0700
X-CSE-ConnectionGUID: n5B73f4mRdOwPvMrUCrMKg==
X-CSE-MsgGUID: uaErQewfTQSnAhuOKwPbcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="136220996"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 07:59:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 07:59:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 07:59:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 07:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6bk1DHCMFWpDfMSRyPxNtK3hGOMd31WZlD0cAKqEqcQSvLceYPS2+1WhemtOKb0CdF6xX3YB6L9jQUAtDI7tgMDfuEDSYkMM4Vb4kNN/LmYtNqc7l2yeqlxjXwnJfxlakYjYGhXM4zepgCpMjzkd/7J+KxSga1CaVkvXvxfit56YTQAYKuVOZBEmLyhPB54dnm6VF1xN3KTqce4U1TWEq0Yc52OLxDGngTHhs8xWeHmOCt+cvxQ67ms4gNb++bpqM9XFsbO3KRlqy1+mt5AezFopVLgT8KN276y3mSnFR7eOJOCFfJbjuhfJdQEYWIg7R8mV3nkeip9GY3olOODdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rB4QGlvOhzuSen8qAgH8uH+ouRG9wadlRMSjw4Z/DM=;
 b=sagHgHCg49oJFvbQTETa54/aXDbS/8x+VulUHHIRwvAOK/IeNIDfHF0QxPwNCuoAXW9mCkRCnxoQSqOaZefCMSSpbRIkc9gf74VjkNxLn3PoSf//33kCx3PFE9uWPwOi2GnEOIJmk2U4tgiSNREFgysi8D6OcitYbn4TEIKhB7Fu2nKye6YjA1pbUEHvSbRu6ZiDY/Zzb6vFucAguhT0wWTMSv60ftHKht24x2BGBugvaIQvpQly+NcJtAxFo81xtzKs3aJ0zij6gGUCSfEYP3bfxvrSfrDwB6Yr5JzK4Gp16CyyH+DPNk2F+fXydio272Lj22Wb84RAzdsUAJei1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 14:59:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 14:59:14 +0000
Message-ID: <25559ba6-892c-43ed-a6b2-e4d9dc2b9f57@intel.com>
Date: Mon, 5 May 2025 10:59:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Ignore faults
 for *guc*
To: <igt-dev@lists.freedesktop.org>
References: <20250430073845.30093-1-satyanarayana.k.v.p@intel.com>
 <20250430073845.30093-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250430073845.30093-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: b940d49b-f30b-4134-4cef-08dd8be566c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1NCcWJsbjMvREF4cm9zMkExWldGbGJUNmt6NXRpemYrNFdRV1NTZTR1SWlW?=
 =?utf-8?B?K2RLaXRPQTlDb2NFM1BiV2Jvc0d5Yk5DeGpaTWxIMlBtMlFQS0dUWXZtOFcw?=
 =?utf-8?B?cHNScVRkYzBYNlpnTFlXVXA4SkJ6RmtOZmpTWFFNUXd1OGVBY3RKY2lUd1py?=
 =?utf-8?B?TDhwbHpHbUI2Z1BDYVdLV0tYTkNGRkRhTFVNVDVYdS9jRTRmVTYrMlFaSVFn?=
 =?utf-8?B?V2dzaFVhclJlWWRwYWlncWl0WldpaUprYUh2OHQ2VEk1K053Y21CNll4RzVv?=
 =?utf-8?B?MGkwek5JUmJpSlkrWXVqVXF0TERCQ3FZQVNZK0hDSGlRbkltcnlvMW5tcW9u?=
 =?utf-8?B?RE40THVkM1NPcjZzTmFQMElpSlhlR2tZc0xKU0N1THlnb1d4OHlZb05VVjNq?=
 =?utf-8?B?THA3N0xMR01QcVJBTWh3ZzhKSXlhTGZiVW55L2ZJaTN5bWVGRTU2SzU3Sytq?=
 =?utf-8?B?dHlNSnZoRXJtdkJTeFF0SFlZdmRGOG5KcjEreTdjNmZjZkIxQUdCNzFWU1Rs?=
 =?utf-8?B?MUU4YW16MFAwaTJ5eFBreEU0YXBPVks4azJ6dUtSdXVLMFg3MjRqM3BwMm9a?=
 =?utf-8?B?TDRhei96ckM4c0pBa3gvd0NYTHJpK21RbHVmWHp2ZkVjODllYzVLaHltZXli?=
 =?utf-8?B?UlI0bkFYZXc5T2F4QkxocnRCNUtUcnFZaHRYQlNpekdsZ09SWDRzcE5nYXJB?=
 =?utf-8?B?b0F1bGN3SlNRU1BqRldkT1RaM2RlSnZHSjB6VU0xYm1iWEZ0eFlERTcwVmND?=
 =?utf-8?B?LzhpUDRtd2oxYkNsYk1GRFVLWG5yZXNncTZ5ODcwR2I2UzBRRWs2RkNHdysv?=
 =?utf-8?B?WmJWSmRXSlZWSFVTRkVpOCs5MEJ4MWhHajlTWDYyT2FmaDVHMzhNZGJIU1Qy?=
 =?utf-8?B?M051eE5XUFRSdUtpZkxPZ1dpRHB2cGxOcmo0cHRBZitwU2E4cjI3aEN3TjJW?=
 =?utf-8?B?OWhiVWJ5T0VTcVRyZTdoSks2YkZnM1FhK3lJTXFYWnhRM0dwMDBrR1RaaXd6?=
 =?utf-8?B?V3VrcXJQSmRhdHdwSWxGa3ZQT0tXSERxdG9Za1kzSHBhUjVHMEEzTUxTcFdM?=
 =?utf-8?B?cmp6c0c4VHBzWFBTMjlCSG4yUVdTS1ltSGhQU1RGUllldjlQZ1VIMExFZVlz?=
 =?utf-8?B?TzJnOHl3czdvQjQ5Mnc0aWJYd2dMMkgwdSszTVhGTU1LSDZwejlrN1lkL2kv?=
 =?utf-8?B?eEZ0eFdTN3diWWFYSkJjZzhVOExiMGhaOFZEckJaUW1HQndNdnhQL1VXRmly?=
 =?utf-8?B?ZlB6OEs3bVd0K01mSlhnd1dkZFFKbVVuMzlkQlA3RngzY1BtNXhEcU4vcVZC?=
 =?utf-8?B?Y0s2NTVJWUkzbVhVQkltNTFKRXM3elgxb3pJUjUwQldJZ3FEQm5heXE3UXJT?=
 =?utf-8?B?YThsN3krOGZka0hhN2hVYjNiRkg4RE15QmZIQ3FsTExlNVJEbFRBb0NPYjNi?=
 =?utf-8?B?aUpxbUE3TlhyRHphcXJGRHRzQnlGMGJTM3FaY3lWdHBaZkhDVUhUQ29xcWtr?=
 =?utf-8?B?bzRITzEvRllmQVpXb1ZPQ2FOQkR1OTNLc0wwVExOeDUvTWFkZG0ySUo0Q2ZY?=
 =?utf-8?B?cUdqRkk2Mzl1VlVzekNBSEJ5OUVGdUtpWkJVTmVDRldxZklLTzNaRnp3dTN1?=
 =?utf-8?B?R0lXSDJDY3N2M0NpQm1UQ3l6R2oyWW9WM0dxRmsrVTZza1lNalZOY3pJUVY0?=
 =?utf-8?B?M1l3ZjRmKzRNcHZFa2ZrbThQS045UFVBdW0zRGVsZjBTSENMWVpMdmcyN1V1?=
 =?utf-8?B?eDgzdVV1dVVKd3paK1E5elhkN3JRcG83Qm5hVTNJbHBjN3JnQklKNjJXdXdM?=
 =?utf-8?B?aCtaNGt6cnZ1am55MWNla3VMMmJsWWFwRTI0SncyK0RKRk8waTZSQkxGeFda?=
 =?utf-8?B?VlVsQVRQMjEwZFkrTjN5Tkt6LzBleGQxdjYyMjdQUFZiYS9pS1lkSE5pWWlG?=
 =?utf-8?Q?hBTAwCnm7vk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXNKTlFaSWdkcVZ0d3N4OHBpVkF5bldrSnRSWHZkQ1NORDZFWmlESlprNTlo?=
 =?utf-8?B?QzF0UEp6Qzk0NGd0TGJnaXA4MFpldlNidTdPSFFJRm5aNUh5MXNZdlFvR0hu?=
 =?utf-8?B?VGRWMiswODZFMU0razgxMjlXcUR5QWw3cTB1bWxSVkNYanRHVTFFTEgwNFcz?=
 =?utf-8?B?Vm5MZUo2bnlqWEpSM3JpbjFDSzQrbWsrZEdENUhtakZvTnY0WTlYenZleWpO?=
 =?utf-8?B?NkozY2tFS0QvY0RYTDBObk9JMDdkTmRGMmY3Y2h3aTdFdStsMGU5U0RIR0RX?=
 =?utf-8?B?YklJc1k1REpucHNJMm1pbTFnZlJHL3paTG5Eb1dGVjBhVW82eGs5cTdRQ3lx?=
 =?utf-8?B?MTYwcGthNEM0S25yd1hBZk9sS2lsWkUvVTFlQTI2T0h6TlNhOERmcE1qanBw?=
 =?utf-8?B?a1lYc1JWRzMzbFpFUkVUajd5RFdiaEVWekUrZ0ZneWF3c2tFN21JbkVXTEwz?=
 =?utf-8?B?eFdPMzZqMk5XMS93TjliMzYzK0kyaVR1UkVKTXh2M3F5TXVnczAySEVhN1Q3?=
 =?utf-8?B?aUs5NXRTUkExdnJQUjBheDhzb2lXektuSUZ4ZEdpU0pzdWpTYlArNEZmNUVz?=
 =?utf-8?B?TWlJZ05IbzREdmlZYy9EQzFWZ0tMUFFvSVR3SFlmSFMxVENkNUtmZkVibm5q?=
 =?utf-8?B?b0FIcmJkZG9PZzgrdUN2aGJhb3hHaklRTG5ZMVM2QjV4TXBZdXBCTjJLM1My?=
 =?utf-8?B?YzVzaUMwOEgvNGxjUTJIYUlid0FPdjkvRFZLN0p0M2hBOG5QUC9WYUtaUHh3?=
 =?utf-8?B?Z1FINmIzOWh0eWpoRkNiNWRySzM1ak1vbUQ4Z1U2b1RvR2R5L0NBTENLN1oy?=
 =?utf-8?B?UjFxYlNCZWhMRnBpdVBjKytDUmxBMG9XQUdER1lPcnlhcUZLY3J1OGZNRlpC?=
 =?utf-8?B?MDNpeGdkOTBMQzRJSU9Qdmx0VlFBdEJtdW9HSmZoQ0Rzenc2L0ZOVWplc3hw?=
 =?utf-8?B?SkV3L3h4OUp4dWtqcmpiREV1Ty91cUpLVXJVenMyM2tlaWVqa2RlRDFSYkhx?=
 =?utf-8?B?WWNERi9RWDBFbUsyVmVSUjZpY253NXp2ZXdGSnZZRFpmcm1zZ3VDNXM4SWpp?=
 =?utf-8?B?Yjc0ZHFvZ0xBcnA4VjN1TEsvWXM1NWhQNFlxOG9vVzNybG5PODlUcGd5RGVp?=
 =?utf-8?B?ZGp0S1p3WDdSWUpmZXMwaTJWZnJGbDQvVVBMVUsyTmtzYmhFQzhVRjhDNVF2?=
 =?utf-8?B?K0JsUzBubGd4S3diMmhMbFF4TUNyNTdqZGpJS3NnK3p6QkpsbVJlZStJaGQw?=
 =?utf-8?B?aEY0SzVwNERobC8rQ3l1bFBhNlFTalM3SjlSSTd0NnR0TGVFZkJnQmRrUnU4?=
 =?utf-8?B?ZnFSRDllWEowL0RnVmxrSk9FNWhTQ0VkWjFYRnF6dHRFYm13TXlwS0VVWVJq?=
 =?utf-8?B?anZ2amJPZkNBU3M2c0kvUjFvTzBNSEttcnVkdzRSL1ZZWEtQMW4xM3RNSno5?=
 =?utf-8?B?Q2RMWjlBVnZ5U3hQMDFLeTAvdlV4YklIbmt0d1orMjlqWHdyOHFiay8rblB0?=
 =?utf-8?B?bWl0R2lPRWIyS1lvWU5CbDlXV3lBc3YzL3gvMUZ5Skt2b2FreWFwSG5pOUNG?=
 =?utf-8?B?S0NrbGp6d05JcWFWd3lqdWhQYkdaNWtPWFdjR3dHUHB0M0FONkhlSDVvTkNB?=
 =?utf-8?B?UzljdHRvNjZuVGF1Y2hZMmtZK1M0RXZYVHdyTHJYODloN2hkTGg5VjJMcURi?=
 =?utf-8?B?NGJqN1FqOXovNU9nUkd1YnBLaEhZZDQxN3FPSHlkenR5YmVpRkIvMWp6TFhl?=
 =?utf-8?B?KzVjTFpRL0tCK3VtOHJ4Nm5Rb09jekhxQU1YQnhzV1QrT2FPMGIyMkxhWVFJ?=
 =?utf-8?B?Q2VYaHE2aDgrVjVGdk5TRkZKUlZLaU9qTmR2bWladlplS1JtV1JFQktZcVpT?=
 =?utf-8?B?Zjk0OVNwU0sxQTZsYWtwbGcvUWtuSGZUbFVaWCtzd1B0ZUQxeHlPaS9IS0pY?=
 =?utf-8?B?MWhBMmxranJoODRDTjF6blk3Q2lGQ2dLT3ZTL0JQcnU4d1Zsdksrc1lHYURE?=
 =?utf-8?B?QzdjckV3anRORncyeit0bzJFV2Y2dEFnNitRWDVCcU8yOUIyN0N0b2ZPcUpY?=
 =?utf-8?B?cHB1MmFBeldQOHZSK3J6dXcwbWpuQTFIN3doZVR4OUY1WndqYi82UVhadTgr?=
 =?utf-8?Q?l2nFik/G5VxDezmAyzcozHJtT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b940d49b-f30b-4134-4cef-08dd8be566c5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:59:14.6920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcRDiB1bX0Gywf2OaGB6eQ1wU0pEd6XCbtijrcDWL7h0MQVzwMkXdg9NQDZYG9TKu46UKD1n+0XDoWU0/tyEBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
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

On 2025-04-30 3:38 a.m., Satyanarayana K V P wrote:
> Add some more guc fault messages in the dmesg ignore list.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 82d730a7c..f293ac8af 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -83,6 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
>   	if (function_is_part_of_guc(function_name)) {
>   		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>   		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	(-ENOMEM)");
'(' and ')' is special character for regular expression. The similar 
situation applies to one line above, so it could be changed to:
strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");

And, for two lines above, is this test might trigger these 2 messages? 
If not, we might want to remove it from ignore list.

Regards,
Zhanjun Dong> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state 
failed:	-ENOMEM");
>   	}
>   
>   	igt_emit_ignore_dmesg_regex(regex);

