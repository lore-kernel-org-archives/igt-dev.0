Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA81AEC1423
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 10:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C12810E178;
	Tue,  3 Mar 2026 10:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5CTjvIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783C510E178
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772533869; x=1804069869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ozfbJViAdWMPn9L8IEM5HMf34fwVfHzSDSZ2cCQfCcI=;
 b=Q5CTjvIxqvXeR7RbadmCYcdlC3d2JyMnQkhVLPWqJy9TCS9Xqf1//ZM9
 VQ2WTc6ajni+B+y7F9BqXTk5O6LHVPl8x70BV39jVhwevF7x5yx0UdjQW
 QslR9c2ancl9mkFb5CSOIGiv5uFHaZJs2uG/fPPcEouPObDzMkPEDzQ06
 GTA3Zc2Jcjyvi0WPt06ENXzEqIt55UL4l8z3BxIgY4iBp4NVMFfsVgdsR
 G8A1ieHfdjt2IaHY7NEZ+/Jh2YmWc4/E8xI/ceHP44dAayDzGRDmps29X
 7+M8sxmFLw/mRrZ+9FevmGkrhM3LuKYECHjZPDNPkySMCLcCjagu1DYnY g==;
X-CSE-ConnectionGUID: 58JXTb9VTr6NoAnwISd/qw==
X-CSE-MsgGUID: GxBKvr8sQ7ulTI7xkY3YPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73474828"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73474828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:31:08 -0800
X-CSE-ConnectionGUID: lSxTnF23Teq555SF/IVpYA==
X-CSE-MsgGUID: fHWdL1zCQGOF0iMm0ENnvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222109773"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:31:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 02:31:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 02:31:06 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 02:31:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EagnAsJVevv6BKMxY0OTVNFuZfW4YnyPeWl1YryilmZEeR+QZUYDhOmf7h24Mayj1OE/M/Ai/s/aF9vYoVqU5TKF6j5xHIO9gMDg8Qvpfs4StRJ1wFrnIiFx/p5YrI/G1S2E6+Z9nQ0tSrKe6r4S7lmgaVx9lblqOxu0YZS/Uqmua8X7PZ7ZS0XlAuPhEgW/lvSSEDm+9RanyyiS+Bcojp+VGRRWcjT+tDDfLENYUp6mhz8CUiDbDEUBVvFzZQL9jrf+QKcnvprWyFiolssNIbotKCBAW8/3/UPAGkWZc7zOwbCIVfmoniBWJczvCGH/VTL5r2aOVyUMUQbx7vCLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvRalCztTZ29yr5F/40U/PAAL3I8sHN6u2f/h/5xO0Y=;
 b=CbEDLnft7jRVEzeBz7MsLLLGxpNanpy2msiOqb+zIj+scuF5/5p0TIvNu5Os3b5syOB6EQ4akpAKpARu6MqBoWYxvXzaXZZxkmEtiGT0w2gAezVy2LBUNFgXGBKKofWG6tsf4tKsV0jQ9Z+/FYmG0J0kJF9egNQsdb0XEq3qPJVz0+i22MxczwJfUDxwBNAZ/noEBINXUw3/wntRulteCov9PQaO0LwwtuIPFVUre5yqpug9Fvl8/LMJ9E1mrBdxGYAIwlfdnrBMZOVNMCzdqB6bLxY/VsUeIIXIwdIPu6D7K3AgCjIjacuAH2+IJaL/L2d/2tecoG6bN3s2GtrJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:31:02 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:31:02 +0000
Message-ID: <cc6fb449-b15d-4f56-b2c2-4ac7f391b7af@intel.com>
Date: Tue, 3 Mar 2026 16:00:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
 index
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
References: <20260218103608.2015045-2-sanjay.kumar.yadav@intel.com>
 <BL1PR11MB552518C35C193641C8AC3DB9847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <BL1PR11MB552518C35C193641C8AC3DB9847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::7) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 329ac01a-15e1-45d0-f4e0-08de790ff7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: p6ViCr6bvFqaYRl+2dMgddGSNxXiA0okCPQm3Arz8SUfnie2c2lZ5cXhHinmz/Oq1207mkS3/rvn35WHfXGnHsU3BSOUHvyNrSBebf4k1yxg/GEejLiEXEcdYBes7mOQ0l6MNNISb4gVuvn3EHNOMHU4xkbt6L+CqVd15ukUOVnr2AoCly0/jfSzo+vtEWitnZp5L5mtelRWZleB2gaYpLzLdcxGreenk4WMmO/od7NH/N1AqDsTqiHYlNxFGOOMBqfk3Ws0YApXqO10SSisV+/5qRlLtp/6fgp6lv4QE81huuPruRNEoryrYqcitFrOrIZXjqy5ed/kjT5efP2Stf1e9pNBjD6lXyTbx7xYaCwITzGSpWeOx61Q3XRwZi2EzApLbYrkTSjIZkiX4XFlo9CSl1pxpC2rgijNqtUILZ3E8EFhBAyortBwCS7e6CeFfGYaIvv68+abUMeZrI/NVbvWpXPv7cMnxMwFMqSq/31Mp5Y6Bh8alToOWTUjD21CL8bHJUtM9MCWnFVPbaCoehJhrMVKJyyFQDp5Tx7CBd8MPfrtCnEXymGB2RKyJBmwjvOAkAimwfgtzxdIbVpMZ7vkshJahCc7Jo3jCN5CULSGfxrSL356cvUUxZg3r/wLWmoZE5/vR7IB/67+fN9G48SUygWKZdUCyECEYXh+v3YS5IVZxz35Eb+fXqeyO/ubDFoKR13M754Auhk1nWo5wCugMn9mb8OjBN/+sPbnyOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjVrWHA1NFpKa2JGKzBEV2V2NnQyNVBvVVNYeVN6OGM1ZFQwbHhXdGVvVTd6?=
 =?utf-8?B?QnpZS2Fic1RaaDF5Wkw0TEF4VWczZFRub1hKTkpOS1ZjQmNYVXVTbThndGpJ?=
 =?utf-8?B?NmRGakFSN0RaLzFwS01WRzE0VG42QklNTlJCRnlzUUhvYzJPa3A4V1BpMnRl?=
 =?utf-8?B?Y1p2SGFPSjRPVXlvd0w1SC9WNm9WaFFrZGpaYUd1bUZtQTlLalpvazZCbExH?=
 =?utf-8?B?YTZ1MFQrNmNNaThqN1RaUVc0QlFDa1F6T2lkdkdBaFViWEtuREZjSUM2bVZy?=
 =?utf-8?B?VjJHa0dYOHZrZ2p5Q09lYU0xQXQzU0J2L0tKdWVHVkhEWXRHVit4K25WOHhL?=
 =?utf-8?B?dDBmVExEWlRscjM1am9PV0RuS0FMeGN0bjFFSFdzRU9GUlM0aFJhR2dpZ3hh?=
 =?utf-8?B?NnpMMXRKTGswc0VabklFRDRhYnV3Y21WM1hLN1U5ckYvcllUaURaaG15eEE0?=
 =?utf-8?B?YkZ2SWZlek5rUWtvWlVjK1lBUFp1K1I0S0tweEtWdndhbUJQRE1NeWgyZWM2?=
 =?utf-8?B?UzJNd1NmREFzUEZHR1FSMDlsT1h2OGh6Q1hUQXNXeW9SM1U0d2wveExhMmtQ?=
 =?utf-8?B?TkE1Rk80QURVUGtBVERTTUtlaVRZYW1FaVVzZkdWVVkxN2VYcGw2RVZoLzRX?=
 =?utf-8?B?U0VkNTVNNWtWN0xVZjJTbklhaTZBVnRZR0t6OHhSUWd5NnVwaUVVSnlwOXBB?=
 =?utf-8?B?bFdBaEVnVFl1SzRhNmt0QytOQzcySEdZZ1gvMTRqaEdxdkRUR3kwT0M5VkI5?=
 =?utf-8?B?SFFaUG5Kak9PWW5iaWdzMXl5VXFFWU93OTkrRmRwM0hJWWR3cmh6aUxQRTVt?=
 =?utf-8?B?cmpLb0xFVG5lNzV3VDR5UEFZUUdHS0loUURhQ3JnWmM2Qllmai9hYkxPeGUx?=
 =?utf-8?B?WWQ5dVU1WXBTV1lLNWFudHRqVHFnVDRTK0wzN0VvR29UOHpVYlJCS1ZWcEVU?=
 =?utf-8?B?czhPVEpuYUVTWmdMWk03V3MzZXJNUEludTY2Ujh3b0JhN25TNDUxSVNjNVdY?=
 =?utf-8?B?aFVPVHlQRmNpZEloTTd1VWhDck1jK1llUXFmZUs3TzdsV0gybkFzb3BBUStD?=
 =?utf-8?B?NlNySEFuUWRkS25zOW54VFFES2F1TDUyeWhQd2pZZ0xBWk9qcFRGc2lJMVJn?=
 =?utf-8?B?QVFiRDBxY2h2b1hRSVF5RWovYWRaK3NBbnhNNFdBTmFhclVsSGpMUnQrTTVj?=
 =?utf-8?B?RHpMM01PMUNtUFY1d1BoTkhIdVVaejNHdGY0a2dsd2J1SlpQZHRVZXMyM0dx?=
 =?utf-8?B?aW9zNFFyYk83NDY4TjFrUmNaZS9OOTYyU0JLM1pIbDJ6cStMUGpYNzFHbytr?=
 =?utf-8?B?OUlqYlZnRDZIU1Z5S3VXLzZ1WVdtT00xdWRGaElvVUYzQ3lDSXNZL2FZbVJr?=
 =?utf-8?B?UmFnMmJGRjV2YUpia1NoNWhOb29NWWVxeERsOWhTLzhVaFpjVy9OYlFKRjVB?=
 =?utf-8?B?TWsrS0JGeFVVQzJwNFNveldNNmVYRllwT2FFZDIvdjZKUS9WcDhaRDNrb0hD?=
 =?utf-8?B?bjEzVEpTbkpWQ09HWkRKNkxHQ3VxNDY3czJOWnI5bGVNMFJoWmo3WGZZUE9Q?=
 =?utf-8?B?WmREenZqS29RMUVrV0ZGWVpYYlh6cVVYUms4eWM1SFArYW9GT3JTZi9aRVRG?=
 =?utf-8?B?Rjc2S1FlcVpRTDRsbzkwLzFRcHBGNExLSitQNXI2Z0s2L3k5WWU3d3hidnVL?=
 =?utf-8?B?Zm5RMWdISlIxQmhSNENsdld6UTUwOUhhZVlpell3dXRRNnV2Qmh2QmYyR2VQ?=
 =?utf-8?B?ekp3U1FicTlqbUJ3S3RsQTE2blViUnVwaDBMQ1ZLYWkzaDFFK0IxeERsN3Fr?=
 =?utf-8?B?QTVJeENUaUtUdWVxUThjdW5kTXVUdExnRTl4YVU3Y2tUQ2VhVlBZKzNyMnhZ?=
 =?utf-8?B?YkIzVXpGN3JNSStTcXVUWGJFZjkvWlU2alhRUlJtQzRNQnZDcjJva2g2WG1S?=
 =?utf-8?B?cmdmMVF4QlZCcGY2akFIUXRISGxnYVZ6S3c0Z3d1RVZSWUFEeXFkdUN1NU1z?=
 =?utf-8?B?Y3BRNkwxTDlUb2VDd0RmMHBZMUJac2JhcDB1ZTJ6cVV4Zk03TWlGZE0wRjFa?=
 =?utf-8?B?dXd4S1p2dW5LT0lFNjVJMlFlODhVRDhKbTVHMEZHU1VXdVJIVEIyVXVVWUpK?=
 =?utf-8?B?ZkRpQzZkdzdKVFo4TnBweTY3WGs3b2NYR3llSzFmY1ZKaUVZYjM3OVRvUzNk?=
 =?utf-8?B?VzI4d1d2a0tia1lSVEVYVU8wMXFRa3UwclEvbFZ5eFYrQkQ0dmxoWjRkK0pz?=
 =?utf-8?B?ejVWT2QvM2hiMzNNR2QzQVh0WW0xNWdEN3ZtazRNeExhaGx5TS9Jeld5UWxD?=
 =?utf-8?B?OFRsQ0w4ejgvR3E3UXV2UForVkV2YzRYckRCWVI1WlZoZ3dSdjlGWGdlYUdS?=
 =?utf-8?Q?/E3b/DUFFy2AsE1Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 329ac01a-15e1-45d0-f4e0-08de790ff7b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:31:02.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/q8qG+zEl73OAPa2ZkY6zf1ZlClPIlGEHNpvzaPJMbr9XdCpnOsOSKtUp5WcKDQedZgPZ7xrHa9DtxOf42O9E5DXVOy1qum59D4Womlhas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
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


On 03-03-2026 15:20, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sanjay
>> Yadav
>> Sent: Wednesday, 18 February, 2026 04:06 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
>> index
>>
>> Previously intel_get_pat_idx_uc_comp() would silently return zero on
>> platforms where no compressed PAT index exists (e.g. CRI), since uc_comp was
>> zero-initialized by default. This could lead to incorrect behavior when callers
>> assume the returned index is valid.
>>
>> Fix this by:
>> - Adding XE_PAT_IDX_INVALID sentinel to detect unsupported platforms
>> - Initializing uc_comp to XE_PAT_IDX_INVALID in intel_get_pat_idx();
>>    only platforms with CCS (graphics_ver 20/30) override it to a valid
>>    index
>> - Adding igt_assert_f() in intel_get_pat_idx_uc_comp() to fail with
>>    a clear error instead of returning an invalid index
>>
>> Also update the bo-comp-disable-bind test to distinguish between "CCS is
>> disabled" and "CCS does not exist" using HAS_FLATCCS(). On platforms
>> without CCS, the compressed PAT bind check is skipped since there is no valid
>> compressed PAT index to test with.
>>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   lib/intel_pat.c      |  5 +++++
>>   lib/intel_pat.h      |  1 +
>>   tests/intel/xe_pat.c | 30 ++++++++++++++++++++++--------
>>   3 files changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/lib/intel_pat.c b/lib/intel_pat.c index 9815efc18..d30bee453
>> 100644
>> --- a/lib/intel_pat.c
>> +++ b/lib/intel_pat.c
>> @@ -98,6 +98,8 @@ static void intel_get_pat_idx(int fd, struct
>> intel_pat_cache *pat)  {
>>   	uint16_t dev_id = intel_get_drm_devid(fd);
>>
>> +	pat->uc_comp = XE_PAT_IDX_INVALID;
>> +
>>   	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
>>   		pat->uc = 3;
>>   		pat->wb = 2;
>> @@ -155,8 +157,11 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>>   	uint16_t dev_id = intel_get_drm_devid(fd);
>>
>>   	igt_assert(intel_gen(dev_id) >= 20);
>> +	igt_assert(HAS_FLATCCS(dev_id));
>>
>>   	intel_get_pat_idx(fd, &pat);
>> +	igt_assert_f(pat.uc_comp != XE_PAT_IDX_INVALID,
>> +		     "No compressed PAT index available on this platform\n");
>>   	return pat.uc_comp;
>>   }
>>
>> diff --git a/lib/intel_pat.h b/lib/intel_pat.h index e9ade2e2e..e5dd8a0af
>> 100644
>> --- a/lib/intel_pat.h
>> +++ b/lib/intel_pat.h
>> @@ -10,6 +10,7 @@
>>   #include <stdint.h>
>>
>>   #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better
>> */
>> +#define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this
>> +platform */
>>   #define XE_PAT_MAX_ENTRIES 32
>>
>>   struct xe_pat_entry {
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
>> 21547c84e..052b7b699 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -844,15 +844,18 @@ static bool has_no_compression_hint(int fd)
>>    * Test category: functionality test
>>    * Description: Validates that binding a BO created with
>>    * the NO_COMPRESSION flag using a compressed PAT index fails
>> - * with -EINVAL on Xe2+ platforms.
>> + * with -EINVAL on Xe2+ platforms. On platforms where CCS
>> + * does not exist, the test verifies uncompressed access works.
>>    */
>>
>>   static void bo_comp_disable_bind(int fd)  {
>>   	size_t size = xe_get_default_alignment(fd);
>> -	uint8_t comp_pat_index, uncomp_pat_index;
>> -	bool supported;
>> +	uint16_t dev_id = intel_get_drm_devid(fd);
>> +	bool has_flatccs = HAS_FLATCCS(dev_id);
>> +	uint8_t uncomp_pat_index;
>>   	uint32_t vm, bo;
>> +	bool supported;
>>   	int ret;
>>
>>   	supported = has_no_compression_hint(fd); @@ -868,14 +871,25
>> @@ static void bo_comp_disable_bind(int fd)
>>   	igt_assert_eq(ret, 0);
>>   	vm = xe_vm_create(fd, 0, 0);
>>
>> -	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
>>   	uncomp_pat_index = intel_get_pat_idx_uc(fd);
>>
>> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>> -				   size, 0, 0, NULL, 0,
>> -				   0, comp_pat_index, 0),
>> -		      -EINVAL);
>> +	/*
>> +	 * On platforms with CCS, binding a NO_COMPRESSION BO with a
>> +	 * compressed PAT index must fail. On platforms without CCS,
>> +	 * there is no valid compressed PAT index, so skip this check.
>> +	 */
>> +	if (has_flatccs) {
>> +		uint8_t comp_pat_index = intel_get_pat_idx_uc_comp(fd);
>> +
>> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>> +					   size, 0, 0, NULL, 0,
>> +					   0, comp_pat_index, 0),
>> +			      -EINVAL);
>> +	} else {
>> +		igt_debug("Platform has no CCS, skipping compressed PAT
>> bind check\n");
>> +	}
> Does this test needs to be skipped here? If yes you need to use igt_skip
> And handle the resource cleanup
No. The test still has a valid positive path on platforms without CCS: 
it verifies that binding with the uncompressed
PAT index succeeds. Only the compressed-path assertion is not applicable 
when HAS_FLATCCS(dev_id) is false, so I kept
the test running and added a debug log to make that explicit. Skipping 
the test with igt_skip would drop that coverage.

>> +	/* Uncompressed bind must always succeed */
>>   	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>>   				   size, 0, 0, NULL, 0,
>>   				   0, uncomp_pat_index, 0),
>> --
>> 2.52.0
