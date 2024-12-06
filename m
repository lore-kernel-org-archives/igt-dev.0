Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47413E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 22:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2DA10F1C3;
	Fri,  6 Dec 2024 22:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lriNiklz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC20610F1C3
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733523657; x=1765059657;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UpN9Tga9Z2U03V+ckbv8cmTmZW3AXOIgW+PfQJR+/Bc=;
 b=lriNiklzm/6hYPYLYa/LyALTWpMKNgkDPu6MemqDzEFKnXD/KmADNI/f
 2v25ZVbqKp4lG+upmya4IvIqSfbzY7l3UTA37Yl8eBMbewfLsa+Seu9Kj
 lMYXcjcav0zI8Nm+tf4lAtrtiXniVnKds4/Ytn3CECxiLZMDTViIs42Ie
 GHsIupMSCf8ClB9FOXsyZNlu+aZA0hmEmT2teJx+puqhFvOuR6Vd2o/GU
 kFecvHsgtUO5MvfiRZpVUrtUARVvYaAHwcF00AmXHZwJzIw4mSEK+co1I
 v1HQRKpvGv+VJEWIr7QxyDkiz0H0M5HbFFQ0GJtfnrDEXPoxVKmyUFKBB Q==;
X-CSE-ConnectionGUID: 17t9CV4nR9yBQrwMt4MsLA==
X-CSE-MsgGUID: ibLfzQakT4STxZzIq270lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="59289468"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="59289468"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 14:20:56 -0800
X-CSE-ConnectionGUID: W+WPN/s7QvSgU3ojD3rAmQ==
X-CSE-MsgGUID: 7P/slhOoTmumLnbcoqpwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="125358650"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 14:20:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 14:20:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 14:20:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 14:20:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmvlilMMABAoKrspfLqjGdPuy3XtKwHWKYeM3Qs4oRZZHpUvbM30q33Ra455J7oOHINBcAJ/gucA9j0Cyed9397rgVv+MHkVUKQA2c66C8nxWAK3E7YNG/rFhZLexyS/bExWZJdL9zUaZQkDdI9arl0g71pl/xyN127rdrVeQqW75o1IzmlUyIdo1JtWbZWu7YfiVnfPuEaVD0ufscNmLncpgB/r5Xtrx0ZCMl7QVxfsaJGFBfswREAv9XVBr4/MippnOWczju26Z7N8/r/hjXV1sV1qZ13Hqx4tl9WPjeBbkUvi4IbPp3h/GKsNmgD3BNGuLY/wROzQlJ5glH2NdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vetenJYdndAt0gD4xiMm4SK2ONAEwOL5n1/v9qjOUxQ=;
 b=b2pA10mucCHgU3lrGDlWKYfq0o1fuTtxJNE1S9G9gJV4LvYa0V6+xJ5W4JAEH6n/lKKb286gSY6hnZPSxGPyy4rWXode7W7czH1Y2mi0xXDhVHvgTx5+2MVKnW8F0eHhRp7OiISt5fbbmWYsTPTmjPjvR3W/6kzEmKBGN4pDRTS19pd+h4pmw0P2Z106x3NR5cBS2r2o8VTNG2KHEZKy77Sla8dNCPssNc4EiFfo2ctoWhYWdj1aHZwbZK4gvcVSqHGmmgzEx7SbCfbNYXn9Dx+dMxaJrUopc/mLArWlMuQqzeIENKEodmkg2ZL3Uy1Uefp8eh7NHIkLhfQ+tWqMBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 22:20:44 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 22:20:44 +0000
Message-ID: <1fd6466a-7ac7-45f8-a341-023452c128a9@intel.com>
Date: Fri, 6 Dec 2024 17:20:42 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/xe=5Fexec=5Fcapture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev7=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20241206175339.439177-1-zhanjun.dong@intel.com>
 <173351690737.3452147.3064087697902985594@b555e5b46a47>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173351690737.3452147.3064087697902985594@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|BL1PR11MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 183b2605-1334-4300-7613-08dd164439a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVJQb1hiOGdrRElaOTljNGV1NVl4djAwZFhvT0ZjS3BlLzJrZSs1UXg1ZmFT?=
 =?utf-8?B?RmZJV3ZoL3pLSFg1T0FYam1JNmNaZmVMaklJSmp6bGVEeGRaUnV0VjQzMDA4?=
 =?utf-8?B?eGZPeUxhUml1QUJzT3dEbjVRZXZFbVg1RlF3QzF0Z0ozS1Vmd0VmR0VQNFRt?=
 =?utf-8?B?T2lCOVlkQi9IVnplWFRlVDVlV1llVUFKNzNNQXpBT0ZSRUkyWlE2LzVnRnJY?=
 =?utf-8?B?Q2h5OEpENTNHbzFscWVtK2RvUzUybXVlY3JWemxnMjhKdThwOEcwMTBFbHg5?=
 =?utf-8?B?ZmMwVlRRU3Y1WTYva1dzTm9oVS8xeFRIaXNWUmNsWm0zOGpTUHBZS21vQzNk?=
 =?utf-8?B?ZEJFMkxObFpKMUhPSHlhWFU3Rkx2d1dKSmYzWmZCUFpiNkNFZVBKMlJZZXpa?=
 =?utf-8?B?V1MvSDg0MkhwT3lCUEpoc2FpclNVNy9WVnFBbG1TNFdEdGQ4TjhhQjVzQmJM?=
 =?utf-8?B?dEtkNnMwaVV6eEJCQjV4WEFFSjJoM2lCYnVGVUs0V29adkd5NStOalVYR3kr?=
 =?utf-8?B?NGZVTDRoVWpRS0Q5NTVRdXdQSkJZbUY1L3RTZGl5YlB0bHQ3R2oraXdoVE1T?=
 =?utf-8?B?Um5OSnJObk1YeHVIalZic2lQZFB2Y3RKZEpSZE5NdkVoYjBsV2xZeThUYXlh?=
 =?utf-8?B?aHdwbllMcW5rbW5VZzN6dnVXeFhrV0prbjZoWld3M1FnTG9oRmJ6eEw5NDY5?=
 =?utf-8?B?WDFkRy9taU12QTljUGhSTTB1Vm5jV3NnQTZDRHI2NjlrRkNucXNYWTVSTWlp?=
 =?utf-8?B?dC9nM2pjd1B3TE41dldNWGVDbzFtWnVhZ0ZrU0psNHIxeFgzNHRZZSt3NWpB?=
 =?utf-8?B?ZlBLMnpjWHUwWm5yckJhV2tLSG1OZ1V4Y005UktsUC9RaUpVQzBxUWVvdGha?=
 =?utf-8?B?ZW9tdDFzMTRob05RQ2doWjRNWWtXa3c3ZmNpVzBTRXMxSHdHQldOZ0hNcXNa?=
 =?utf-8?B?UDRmenpVaGwvWHMrODhzeUQ1NXpiZERHclVVcDV1NmdXSDk4VVVNMmNjRnVS?=
 =?utf-8?B?aUZlWksrN3R2SGlVNFJVUVZyRjZTUWF5SFlNTFc2bFludGZRZHV0THd3Tmpw?=
 =?utf-8?B?QUExS2taaGFEbHVmOHd4VHdpYTZGakZRaUJoczU5NUFnQkU5bWtRaVlOODl3?=
 =?utf-8?B?dkpTNHo3WFFVU0liOXhzVHlQVGFWMUZVVm5CRko3cjVQN2NzSW52b00za0pB?=
 =?utf-8?B?bHJQcUdpRTVEcVlrWGRaT2pyK2toZUpSRVhtRmprVFhCYmVvRzZFWEFvOUhS?=
 =?utf-8?B?T1FHcFNoaS80M0JWS2gxb3JBaVpPMU1CMWl5L1VhUjFDWkQrZWhLTWxuaDZ1?=
 =?utf-8?B?VDl6UHphWlBzUFdxTzBjcmpoWCtLa3Y2b1hxdDNqU0V0aGdEVG9FeWpaZUlK?=
 =?utf-8?B?WTNwYlUreGoxNGdYbDdzKzRPY052ZEw0T2VhWWVKM0hKQStEU3EvYU14a1Zr?=
 =?utf-8?B?aWpWcWRTTnB2bVMxMEtkek5nZ3pjSnpYVkM5ZGVOVEdDTGtieUdKUXIzbjFl?=
 =?utf-8?B?alQzZ0FqMjZPc1kxSG5zQTAydnNTUWpIYUR3QVZoS1FjVzFHR0I0elZjYVFr?=
 =?utf-8?B?Mm8rdE5nNUM1TldjbHN5TTRONFkybTh6enJha0tnWm1obGVVOW9WSG45Vzdu?=
 =?utf-8?B?RDN5RkJGaFhuWFcrV2Qza3pKSThNWTludWpuU0pVbDh6UWlVUU02ZkxsRnRa?=
 =?utf-8?B?SGpxS1RpVk0weXZCL1d5VFZ6ZGkyK2NjcXBNMnhBSWZWWHdyM2ZZYytaSnVi?=
 =?utf-8?Q?+to9U/dLlwjEVaZozU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTNuVEdPMTZtaHFjWXZ2MHVLWENIM2R1dWphajU3L2VXeHZBaUdrS2JtU0l5?=
 =?utf-8?B?dk92WXZhZG9UbVRSZGVCbnJRb2dPcDR6V0pGL1lIL3AzUDlrUk9KV29xWnFJ?=
 =?utf-8?B?ZWYxK3JHdHB3SGdIZzFLeXNBQVBXekUydmE1RzJsVTNOQXJIaHlCb0MyZHQy?=
 =?utf-8?B?V2ZGYy8xMGt3MWlqakIzeWFUQS9Wb2tjVDMrUnRrWEw1aHR0QUgwdjBvdnN4?=
 =?utf-8?B?QVBFSmQ0cnhwL0FCVkFoQXFlR04wWlpYUHNsc244TDZFM0JhSlZMRmZFVG1U?=
 =?utf-8?B?UlR4ckZGb3ozZk9RYnZ6STl2UnA3UHAyMU93N3dITXR4QUU4NUdDYXluL3F5?=
 =?utf-8?B?TzhpenZ2dDhxcm9zT21IbjVCekx5ZS9yUWdmU0M4TFFFblZ1eGt6SUpnNW4w?=
 =?utf-8?B?NERGMVFycXN6VGRaWjM3a3BOY0pjM0w1U3U5MitucVNqRnZJYUVDS3BqNWtD?=
 =?utf-8?B?bTJoYW5WbHlMTDZWWnhhVHFNcUVKbzQwdnpyUEM2MDB0aHRiVXhTOXA3dTRO?=
 =?utf-8?B?djhrOHVkOVpMQlRnbWdRWmlIN2VzZEx2RWRyRlpsczRQNkhLWmFvK2oxSzJ2?=
 =?utf-8?B?UEdQUU1YbWtNNUUvbFF2Wm9JaC80Y290OUthdEVmNWM1SjlsYTBSK0Z6KzVp?=
 =?utf-8?B?VGxTbjRPcmlVOUh3eHplRlJLMUdIampqd21POGhWbGFyYlB6cnovV2ZyY3dM?=
 =?utf-8?B?Ym40amUvTVFtZGcybHljS01TTnppelg3bU5iVEhPUGtEbXZ0bE4xSGlJRnBv?=
 =?utf-8?B?K2paRVNTRDBLMW5BeUM5U3NORDN5bEc3Mkh2KzJZMnB1SlY5UWZXK3RGM2Vq?=
 =?utf-8?B?QXNpVU9QVjJIc0RJTVFYakxFVTB0UnM3Z255NmtKR2djNE90eGZJc0R0cE1K?=
 =?utf-8?B?TXhHTjlvTVJlcXUyN0c3cUtSRXRDTHFiaXA0VjdWcXBBdnMyOGhRdVczaW12?=
 =?utf-8?B?WmlFcW1VU3BGV1E3Q29EUWI0SklPQXk1MnBKaU5WR2hnOFlDWC9VQ2c2QUVD?=
 =?utf-8?B?MWJ1N2ZsSndjd2pkZ0luSXl3OXF3ZnQ3Q1VBbk0zTzU5NlpaZ0oyblRjaFpl?=
 =?utf-8?B?TTJXdXZEWit2WXpPL1FSZWFnd3c0SEtiTnA5WVVlZWJpR09yWnlsQ0lqT25u?=
 =?utf-8?B?K2h1MmVTOHo2UjlsaEpGZU1hMjhkRWZPUlBPd1ZGQkxYVllGVVU3amEzcUV5?=
 =?utf-8?B?S0tEcVMvenJ5VXU5WkNLMGE1YW5sMDlYNzZHYTVsUnhOcTRIazZyUXhIdzEx?=
 =?utf-8?B?R0pJU3MrSWpjRHl1TmE4YzJBVHV0VFdldHM1Sm1pL0dzYjZUL0xSM0dDaHow?=
 =?utf-8?B?dXNWQmNXNzFkWEliWk91M0o5L2lmMWJ6RnhhMmRkaWxUNHNJQ1BwUTl6ekQz?=
 =?utf-8?B?d3diNDNwakt1cHd6NDdiUzNkOTNOV01VTzVsS0JwL2drVERPOTJxcjFncXMy?=
 =?utf-8?B?Y1J4eFlWdWhSQk54V3dJcE5JeDFCUWJ5OW1MYmlSdHJucVczSlh5d3JLajVh?=
 =?utf-8?B?NnN1VWpaSm1oR1RzYkEvMlFYT0ZRd0xxWGIrQyt5TkFNUk1NSmNhL1Z4OFdu?=
 =?utf-8?B?ZU5QQzhmWGtSOUtRY1M2cHorSkxmZDNyM1labFdCa0tjZENNRzFNUWZ2dmNN?=
 =?utf-8?B?Wk1TZ3JtdFcvT3RiUUc1NFJVT1FYNzJNem0vOTVSdGhIUDFONUs3UUZaR3dM?=
 =?utf-8?B?OXh4NkhUZEgxMEZ3aFVBMm9xdGhtc1hHS1BQazc0V1BOMkwzejFSZjNWbnVw?=
 =?utf-8?B?VDBPdjV1dnkzSThJbGZ2M0V5MWFNUHJGUEtEMWRLNnNUd2p4RytIeFJvalY2?=
 =?utf-8?B?VXdTNmxteHoyNlVLS0pWTWZrUmpnMCtKZFB2VHg0c2NTaGE3N1lISG8xbjRW?=
 =?utf-8?B?UE1hWWpYYzdNN21YK0lUMEN6S2NSVGdoSXU2a0xwamJYUU1XNXlVbGFuWXpz?=
 =?utf-8?B?V2ZmajdNb1FLa2hLcVlWZzdEbklTdjVJbTFKblUxbVhUTXFSWWM3UjBRblRI?=
 =?utf-8?B?SzNrL2JlMmpudFI1enF3bk1zUFdScVlPWFp0TjJsdGhzeitwNWJqVlFHQytC?=
 =?utf-8?B?V2wyN0E5VXpPTGdwYmY1U0FZZHhoUzB3MnlXKzVsQzlPQzIxN29hYmNiVFJq?=
 =?utf-8?Q?GGGr2zXSoB8HobRN75O09Q8JR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 183b2605-1334-4300-7613-08dd164439a7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:20:44.0940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYOOFktsUWvgqoC1cQAruo0i+Hu4b4mVN0jIb55ft4RITh70ySZKEq6kNXwOvUnFItIOhhoIYf77NzgfYoo+yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
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

This patch add xe_exec_capture for Xe and not make changes on i915 igt 
code, all i915 failures is not related to this patch.

Regards,
Zhanjun Dong

On 2024-12-06 3:28 p.m., Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_capture: Add xe_exec_capture test (rev7)
> URL   : https://patchwork.freedesktop.org/series/140007/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15803_full -> IGTPW_12271_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_12271_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12271_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_12271_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@i915_suspend@debugfs-reader:
>      - shard-snb:          NOTRUN -> [ABORT][1]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-snb4/igt@i915_suspend@debugfs-reader.html
> 
>    
> New tests
> ---------
> 
>    New tests have been introduced between CI_DRM_15803_full and IGTPW_12271_full:
> 
> ### New IGT tests (6) ###
> 
>    * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [2.24] s
> 
>    * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
>      - Statuses : 1 pass(s)
>      - Exec time: [2.77] s
> 
>    * igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:
>      - Statuses : 1 skip(s)
>      - Exec time: [0.0] s
> 
>    * igt@kms_psr@fbc-psr2-primary-mmap-cpu@edp-1:
>      - Statuses : 1 skip(s)
>      - Exec time: [0.0] s
> 
>    * igt@kms_psr@fbc-psr2-sprite-mmap-gtt@edp-1:
>      - Statuses : 1 skip(s)
>      - Exec time: [0.0] s
> 
>    * igt@kms_psr@psr2-cursor-mmap-cpu@edp-1:
>      - Statuses : 1 pass(s)
>      - Exec time: [1.68] s
> 
>    
> 
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_12271_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@api_intel_bb@blit-reloc-keep-cache:
>      - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html
>      - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8411])
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@api_intel_bb@blit-reloc-keep-cache.html
>      - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>    * igt@drm_fdinfo@virtual-busy:
>      - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8414])
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@drm_fdinfo@virtual-busy.html
> 
>    * igt@drm_fdinfo@virtual-busy-all:
>      - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8414]) +1 other test skip
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@drm_fdinfo@virtual-busy-all.html
>      - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8414])
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@drm_fdinfo@virtual-busy-all.html
> 
>    * igt@gem_bad_reloc@negative-reloc-lut:
>      - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#3281]) +2 other tests skip
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html
>      - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#3281]) +2 other tests skip
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>    * igt@gem_caching@reads:
>      - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#4873])
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@gem_caching@reads.html
> 
>    * igt@gem_ccs@block-multicopy-inplace:
>      - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html
>      - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@gem_ccs@block-multicopy-inplace.html
>      - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_ccs@block-multicopy-inplace.html
> 
>    * igt@gem_ccs@large-ctrl-surf-copy:
>      - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#13008])
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html
>      - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#13008])
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@gem_ccs@large-ctrl-surf-copy.html
>      - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#13008])
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-copy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#13008])
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>    * igt@gem_close_race@multigpu-basic-threads:
>      - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7697])
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
>      - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#7697])
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html
>      - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@gem_close_race@multigpu-basic-threads.html
>      - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#7697])
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@gem_close_race@multigpu-basic-threads.html
>      - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#7697])
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html
> 
>    * igt@gem_create@create-ext-cpu-access-sanity-check:
>      - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6335])
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html
>      - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#6335])
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-sanity-check.html
>      - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>    * igt@gem_ctx_freq@sysfs@gt0:
>      - shard-tglu:         NOTRUN -> [ABORT][27] ([i915#13218]) +21 other tests abort
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-10/igt@gem_ctx_freq@sysfs@gt0.html
> 
>    * igt@gem_ctx_persistence@engines-mixed-process:
>      - shard-snb:          NOTRUN -> [SKIP][28] ([i915#1099]) +7 other tests skip
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html
> 
>    * igt@gem_ctx_persistence@hang:
>      - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8555])
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gem_ctx_persistence@hang.html
>      - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555])
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gem_ctx_persistence@hang.html
> 
>    * igt@gem_ctx_persistence@hostile:
>      - shard-dg2:          NOTRUN -> [FAIL][31] ([i915#11980] / [i915#12580])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@gem_ctx_persistence@hostile.html
>      - shard-dg1:          NOTRUN -> [FAIL][32] ([i915#11980] / [i915#12580])
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@gem_ctx_persistence@hostile.html
>      - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#11980] / [i915#12580])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@gem_ctx_persistence@hostile.html
>      - shard-mtlp:         NOTRUN -> [FAIL][34] ([i915#11980] / [i915#12580])
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html
> 
>    * igt@gem_ctx_sseu@invalid-sseu:
>      - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#280])
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gem_ctx_sseu@invalid-sseu.html
>      - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#280])
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html
>      - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html
> 
>    * igt@gem_exec_balancer@bonded-false-hang:
>      - shard-dg2:          NOTRUN -> [ABORT][38] ([i915#13218]) +30 other tests abort
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html
> 
>    * igt@gem_exec_balancer@invalid-balancer:
>      - shard-mtlp:         NOTRUN -> [ABORT][39] ([i915#13218]) +24 other tests abort
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_exec_balancer@invalid-balancer.html
> 
>    * igt@gem_exec_balancer@parallel-ordering:
>      - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4525])
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@gem_exec_balancer@parallel-ordering.html
> 
>    * igt@gem_exec_fence@concurrent:
>      - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4812])
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_exec_fence@concurrent.html
>      - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4812])
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gem_exec_fence@concurrent.html
> 
>    * igt@gem_exec_flush@basic-wb-ro-before-default:
>      - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +1 other test skip
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gem_exec_flush@basic-wb-ro-before-default.html
> 
>    * igt@gem_exec_flush@basic-wb-rw-before-default:
>      - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +2 other tests skip
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-before-default.html
> 
>    * igt@gem_exec_params@rsvd2-dirt:
>      - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#5107])
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_exec_params@rsvd2-dirt.html
>      - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#5107])
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-8/igt@gem_exec_params@rsvd2-dirt.html
> 
>    * igt@gem_exec_params@secure-non-master:
>      - shard-dg2:          NOTRUN -> [SKIP][47] +3 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
> 
>    * igt@gem_exec_reloc@basic-cpu-gtt-active:
>      - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +3 other tests skip
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-gtt-active.html
> 
>    * igt@gem_exec_reloc@basic-gtt-cpu-active:
>      - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +3 other tests skip
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
> 
>    * igt@gem_exec_suspend@basic-s4-devices:
>      - shard-dg2:          NOTRUN -> [ABORT][50] ([i915#7975] / [i915#8213]) +1 other test abort
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html
>      - shard-rkl:          NOTRUN -> [ABORT][51] ([i915#7975] / [i915#8213]) +1 other test abort
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html
> 
>    * igt@gem_exec_suspend@basic-s4-devices@smem:
>      - shard-snb:          NOTRUN -> [ABORT][52] ([i915#13242]) +9 other tests abort
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-snb2/igt@gem_exec_suspend@basic-s4-devices@smem.html
> 
>    * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>      - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4860])
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
> 
>    * igt@gem_lmem_swapping@parallel-multi:
>      - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613]) +2 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@gem_lmem_swapping@parallel-multi.html
>      - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#4613]) +2 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-5/igt@gem_lmem_swapping@parallel-multi.html
>      - shard-glk:          NOTRUN -> [SKIP][56] ([i915#4613]) +2 other tests skip
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk9/igt@gem_lmem_swapping@parallel-multi.html
>      - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613]) +2 other tests skip
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_lmem_swapping@parallel-multi.html
> 
>    * igt@gem_mmap_gtt@basic-small-bo-tiledy:
>      - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4077]) +5 other tests skip
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4077]) +2 other tests skip
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
> 
>    * igt@gem_mmap_gtt@fault-concurrent-x:
>      - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4077]) +5 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gem_mmap_gtt@fault-concurrent-x.html
> 
>    * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>      - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4083]) +3 other tests skip
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> 
>    * igt@gem_mmap_wc@write-prefaulted:
>      - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4083]) +3 other tests skip
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html
>      - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083]) +1 other test skip
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@gem_mmap_wc@write-prefaulted.html
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>      - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +5 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
>      - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282]) +3 other tests skip
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>    * igt@gem_pwrite@basic-random:
>      - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3282]) +4 other tests skip
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@gem_pwrite@basic-random.html
> 
>    * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>      - shard-rkl:          NOTRUN -> [TIMEOUT][67] ([i915#12917] / [i915#12964]) +1 other test timeout
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
>      - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4270])
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
>      - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270])
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>    * igt@gem_readwrite@read-write:
>      - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282]) +3 other tests skip
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_readwrite@read-write.html
> 
>    * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>      - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#5190] / [i915#8428]) +4 other tests skip
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>    * igt@gem_render_copy@yf-tiled-ccs-to-linear:
>      - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8428]) +4 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-linear.html
> 
>    * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>      - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#8411]) +1 other test skip
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>      - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4079])
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>      - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4079])
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>    * igt@gem_userptr_blits@dmabuf-sync:
>      - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#3297] / [i915#3323])
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html
>      - shard-glk:          NOTRUN -> [SKIP][77] ([i915#3323])
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
>      - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3297])
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-sync.html
>      - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3297])
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@gem_userptr_blits@dmabuf-sync.html
>      - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3297] / [i915#3323])
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html
> 
>    * igt@gem_userptr_blits@readonly-pwrite-unsync:
>      - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3297])
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>    * igt@gem_vm_create@invalid-create:
>      - shard-snb:          NOTRUN -> [SKIP][82] +389 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-snb2/igt@gem_vm_create@invalid-create.html
> 
>    * igt@gen9_exec_parse@bb-start-param:
>      - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#2856])
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@gen9_exec_parse@bb-start-param.html
>      - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#2527]) +1 other test skip
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html
>      - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#2527])
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@gen9_exec_parse@bb-start-param.html
> 
>    * igt@i915_fb_tiling:
>      - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4881])
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@i915_fb_tiling.html
>      - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4881])
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@i915_fb_tiling.html
> 
>    * igt@i915_module_load@load:
>      - shard-dg1:          ([PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110]) -> ([PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [DMESG-WARN][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133]) ([i915#4423])
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-17/igt@i915_module_load@load.html
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-12/igt@i915_module_load@load.html
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-14/igt@i915_module_load@load.html
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-14/igt@i915_module_load@load.html
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-18/igt@i915_module_load@load.html
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-13/igt@i915_module_load@load.html
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-18/igt@i915_module_load@load.html
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-14/igt@i915_module_load@load.html
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-13/igt@i915_module_load@load.html
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-12/igt@i915_module_load@load.html
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-17/igt@i915_module_load@load.html
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-12/igt@i915_module_load@load.html
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-14/igt@i915_module_load@load.html
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-17/igt@i915_module_load@load.html
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-13/igt@i915_module_load@load.html
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-12/igt@i915_module_load@load.html
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-17/igt@i915_module_load@load.html
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-18/igt@i915_module_load@load.html
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-17/igt@i915_module_load@load.html
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-13/igt@i915_module_load@load.html
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-14/igt@i915_module_load@load.html
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-17/igt@i915_module_load@load.html
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg1-18/igt@i915_module_load@load.html
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@i915_module_load@load.html
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@i915_module_load@load.html
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@i915_module_load@load.html
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@i915_module_load@load.html
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@i915_module_load@load.html
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@i915_module_load@load.html
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@i915_module_load@load.html
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@i915_module_load@load.html
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@i915_module_load@load.html
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@i915_module_load@load.html
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@i915_module_load@load.html
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@i915_module_load@load.html
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@i915_module_load@load.html
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@i915_module_load@load.html
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@i915_module_load@load.html
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@i915_module_load@load.html
>     [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@i915_module_load@load.html
>     [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@i915_module_load@load.html
>     [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@i915_module_load@load.html
>     [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@i915_module_load@load.html
>     [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@i915_module_load@load.html
>     [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@i915_module_load@load.html
>     [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@i915_module_load@load.html
> 
>    * igt@i915_module_load@resize-bar:
>      - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#6412])
>     [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@i915_module_load@resize-bar.html
>      - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#7178])
>     [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@i915_module_load@resize-bar.html
>      - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#6412])
>     [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-5/igt@i915_module_load@resize-bar.html
>      - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6412])
>     [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-5/igt@i915_module_load@resize-bar.html
> 
>    * igt@i915_pm_freq_api@freq-reset-multiple:
>      - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#8399])
>     [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@i915_pm_freq_api@freq-reset-multiple.html
>      - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#8399])
>     [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>    * igt@i915_pm_rps@engine-order:
>      - shard-snb:          NOTRUN -> [ABORT][140] ([i915#13218]) +14 other tests abort
>     [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-snb7/igt@i915_pm_rps@engine-order.html
> 
>    * igt@i915_suspend@forcewake:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][141] ([i915#4817])
>     [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk4/igt@i915_suspend@forcewake.html
> 
>    * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>      - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4212])
>     [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
>      - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#4212])
>     [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>    * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>      - shard-glk:          NOTRUN -> [FAIL][144] ([i915#12238])
>     [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>    * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
>      - shard-glk:          NOTRUN -> [FAIL][145] ([i915#11859])
>     [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>      - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#5286]) +1 other test skip
>     [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>      - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4538] / [i915#5286]) +1 other test skip
>     [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>      - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#5286]) +1 other test skip
>     [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>    * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>      - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3638])
>     [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>      - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3638]) +1 other test skip
>     [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>      - shard-mtlp:         NOTRUN -> [SKIP][151] +9 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>      - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +6 other tests skip
>     [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>      - shard-tglu-1:       NOTRUN -> [SKIP][153] +10 other tests skip
>     [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>      - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538]) +4 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
>      - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#6095]) +14 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>      - shard-glk:          NOTRUN -> [SKIP][156] +191 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6095]) +24 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>      - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#10307] / [i915#6095]) +44 other tests skip
>     [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#12805])
>     [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#12805])
>     [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>      - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#12805])
>     [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>      - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#12805])
>     [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#6095]) +13 other tests skip
>     [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>      - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#12313]) +2 other tests skip
>     [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>      - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#12313])
>     [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#12313]) +1 other test skip
>     [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#6095]) +30 other tests skip
>     [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#12313]) +2 other tests skip
>     [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>      - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#12313]) +2 other tests skip
>     [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#12313])
>     [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#6095]) +58 other tests skip
>     [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#6095]) +44 other tests skip
>     [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html
> 
>    * igt@kms_chamelium_audio@hdmi-audio:
>      - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7828]) +5 other tests skip
>     [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@kms_chamelium_audio@hdmi-audio.html
>      - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#7828]) +6 other tests skip
>     [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio.html
> 
>    * igt@kms_chamelium_edid@dp-edid-resolution-list:
>      - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#7828]) +3 other tests skip
>     [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-10/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>      - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#7828]) +4 other tests skip
>     [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>      - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#7828]) +3 other tests skip
>     [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#7828])
>     [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3299])
>     [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html
>      - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3116])
>     [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-1.html
>      - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#3299])
>     [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-1.html
>      - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3116] / [i915#3299])
>     [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-1.html
>      - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3299])
>     [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6944] / [i915#9424])
>     [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7118] / [i915#9424]) +1 other test skip
>     [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-5/igt@kms_content_protection@type1.html
>      - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#7118] / [i915#9424])
>     [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-1/igt@kms_content_protection@type1.html
>      - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#7116] / [i915#9424]) +1 other test skip
>     [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@kms_content_protection@type1.html
>      - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>     [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-3/igt@kms_content_protection@type1.html
>      - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3555] / [i915#6944] / [i915#9424])
>     [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-6/igt@kms_content_protection@type1.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-128x42:
>      - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8814]) +2 other tests skip
>     [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-random-512x170:
>      - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#13049])
>     [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#13049])
>     [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#13049]) +1 other test skip
>     [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#13049])
>     [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x170.html
>      - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#13049])
>     [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-32x32:
>      - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3555]) +2 other tests skip
>     [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-32x32.html
>      - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#3555] / [i915#8814])
>     [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>      - shard-rkl:          NOTRUN -> [SKIP][198] +10 other tests skip
>     [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>      - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4103])
>     [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>    * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>      - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#9723])
>     [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>      - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#9723])
>     [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>      - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#9833])
>     [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555]) +2 other tests skip
>     [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html
>      - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#3555]) +1 other test skip
>     [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@kms_display_modes@extended-mode-basic.html
>      - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8827])
>     [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_fbcon_fbt@psr:
>      - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3955])
>     [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
>      - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3469])
>     [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_fbcon_fbt@psr.html
> 
>    * igt@kms_feature_discovery@display-3x:
>      - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#1839])
>     [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@kms_feature_discovery@display-3x.html
>      - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#1839])
>     [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_feature_discovery@display-3x.html
>      - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#1839])
>     [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_feature_discovery@display-3x.html
>      - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#1839])
>     [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_feature_discovery@display-3x.html
> 
>    * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>      - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3637]) +3 other tests skip
>     [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms:
>      - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#9934]) +4 other tests skip
>     [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html
>      - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#9934]) +3 other tests skip
>     [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms.html
> 
>    * igt@kms_flip@2x-flip-vs-expired-vblank:
>      - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3637]) +1 other test skip
>     [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-fences:
>      - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#8381])
>     [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html
>      - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8381])
>     [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html
> 
>    * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9934]) +2 other tests skip
>     [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][219] ([i915#4839])
>     [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk8/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][220] ([i915#12745])
>     [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
>     [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
>      - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +1 other test skip
>     [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#2672]) +1 other test skip
>     [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>      - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#2587] / [i915#2672] / [i915#3555])
>     [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#2672] / [i915#8813]) +2 other tests skip
>     [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>      - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>      - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#2587] / [i915#2672]) +2 other tests skip
>     [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
>      - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672]) +3 other tests skip
>     [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#3555] / [i915#8813])
>     [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#8810])
>     [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8810] / [i915#8813])
>     [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8810])
>     [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>      - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +3 other tests skip
>     [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>      - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#2672]) +3 other tests skip
>     [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_force_connector_basic@prune-stale-modes:
>      - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5274])
>     [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>      - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8708]) +9 other tests skip
>     [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
>      - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#1825]) +25 other tests skip
>     [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#1825]) +19 other tests skip
>     [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
>      - shard-tglu:         NOTRUN -> [SKIP][240] +40 other tests skip
>     [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-suspend:
>      - shard-rkl:          NOTRUN -> [DMESG-FAIL][241] ([i915#12964])
>     [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
>      - shard-tglu:         NOTRUN -> [ABORT][242] ([i915#10159] / [i915#13218])
>     [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
>      - shard-glk:          NOTRUN -> [INCOMPLETE][243] ([i915#10056])
>     [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html
>      - shard-mtlp:         NOTRUN -> [ABORT][244] ([i915#10159] / [i915#13218])
>     [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
>      - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#8708]) +8 other tests skip
>     [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>      - shard-dg1:          NOTRUN -> [SKIP][246] +19 other tests skip
>     [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>      - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#9766])
>     [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>      - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#9766])
>     [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>      - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#9766])
>     [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>      - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3023]) +16 other tests skip
>     [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
>      - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#3458]) +11 other tests skip
>     [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>      - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#5354]) +24 other tests skip
>     [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
>      - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#8708]) +3 other tests skip
>     [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-suspend:
>      - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3458]) +11 other tests skip
>     [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>    * igt@kms_hdr@bpc-switch-suspend:
>      - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3555] / [i915#8228])
>     [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html
>      - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3555] / [i915#8228])
>     [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html
> 
>    * igt@kms_hdr@static-toggle-dpms:
>      - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228])
>     [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms.html
>      - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228])
>     [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html
>      - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8228])
>     [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_hdr@static-toggle-dpms.html
> 
>    * igt@kms_joiner@basic-ultra-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#12339])
>     [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#12339])
>     [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#12339])
>     [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#12339])
>     [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#12339])
>     [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@kms_joiner@basic-ultra-joiner.html
> 
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#4816])
>     [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>      - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#4816])
>     [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>      - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#4816])
>     [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#1839])
>     [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>      - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#1839]) +1 other test skip
>     [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>    * igt@kms_plane_alpha_blend@alpha-basic:
>      - shard-glk:          NOTRUN -> [FAIL][270] ([i915#12178])
>     [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic.html
> 
>    * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [FAIL][271] ([i915#7862]) +1 other test fail
>     [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html
> 
>    * igt@kms_plane_alpha_blend@alpha-opaque-fb:
>      - shard-glk:          NOTRUN -> [FAIL][272] ([i915#12169])
>     [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
> 
>    * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [FAIL][273] ([i915#10647]) +1 other test fail
>     [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>      - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#9809]) +3 other tests skip
>     [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>      - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#5354] / [i915#9423])
>     [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>    * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>      - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#12247]) +4 other tests skip
>     [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
> 
>    * igt@kms_pm_backlight@basic-brightness:
>      - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#5354])
>     [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html
>      - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#5354])
>     [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html
>      - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#9812])
>     [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-10/igt@kms_pm_backlight@basic-brightness.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#12343])
>     [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html
>      - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#12343])
>     [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-12/igt@kms_pm_backlight@brightness-with-dpms.html
>      - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12343])
>     [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-7/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-mtlp:         NOTRUN -> [FAIL][283] ([i915#12912])
>     [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_pm_dc@dc6-psr.html
>      - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#9685])
>     [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>      - shard-dg2:          [PASS][285] -> [SKIP][286] ([i915#9519])
>     [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>      - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#9519])
>     [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>      - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#9519])
>     [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>    * igt@kms_pm_rpm@dpms-non-lpsp:
>      - shard-rkl:          [PASS][289] -> [SKIP][290] ([i915#9519])
>     [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
>     [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>    * igt@kms_prime@d3hot:
>      - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#6524])
>     [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-5/igt@kms_prime@d3hot.html
>      - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#6524])
>     [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_prime@d3hot.html
>      - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#6524])
>     [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-10/igt@kms_prime@d3hot.html
>      - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#6524])
>     [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_prime@d3hot.html
>      - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#6524] / [i915#6805])
>     [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_prime@d3hot.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>      - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#11520]) +4 other tests skip
>     [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
>      - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#11520]) +2 other tests skip
>     [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#9808]) +1 other test skip
>     [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>      - shard-glk:          NOTRUN -> [SKIP][299] ([i915#11520]) +2 other tests skip
>     [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#12316]) +3 other tests skip
>     [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>      - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#11520]) +2 other tests skip
>     [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
>      - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#11520]) +2 other tests skip
>     [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>      - shard-snb:          NOTRUN -> [SKIP][303] ([i915#11520]) +10 other tests skip
>     [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>    * igt@kms_psr@fbc-pr-cursor-render:
>      - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#9688]) +17 other tests skip
>     [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_psr@fbc-pr-cursor-render.html
> 
>    * igt@kms_psr@fbc-psr-sprite-plane-move:
>      - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#9732]) +9 other tests skip
>     [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-10/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>    * igt@kms_psr@fbc-psr-suspend:
>      - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#1072] / [i915#9732]) +13 other tests skip
>     [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@kms_psr@fbc-psr-suspend.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
>      - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#1072] / [i915#9732]) +11 other tests skip
>     [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-18/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html
> 
>    * igt@kms_psr@pr-basic:
>      - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#9732])
>     [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@kms_psr@pr-basic.html
> 
>    * igt@kms_psr@psr-sprite-plane-onoff:
>      - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#1072] / [i915#9732]) +10 other tests skip
>     [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>    * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>      - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#5289])
>     [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
>      - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#5289])
>     [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>    * igt@kms_vrr@seamless-rr-switch-vrr:
>      - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#9906])
>     [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vrr.html
>      - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#9906])
>     [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
>      - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#9906])
>     [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-vrr.html
>      - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#8808] / [i915#9906])
>     [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>    * igt@perf_pmu@busy-idle-no-semaphores@rcs0:
>      - shard-glk:          NOTRUN -> [ABORT][316] ([i915#13218]) +21 other tests abort
>     [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-glk2/igt@perf_pmu@busy-idle-no-semaphores@rcs0.html
> 
>    * igt@perf_pmu@cpu-hotplug:
>      - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#8850])
>     [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-3/igt@perf_pmu@cpu-hotplug.html
> 
>    * igt@perf_pmu@idle:
>      - shard-rkl:          NOTRUN -> [ABORT][318] ([i915#13218]) +27 other tests abort
>     [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-4/igt@perf_pmu@idle.html
> 
>    * igt@perf_pmu@idle@rcs0:
>      - shard-tglu-1:       NOTRUN -> [ABORT][319] ([i915#13218]) +4 other tests abort
>     [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-1/igt@perf_pmu@idle@rcs0.html
>      - shard-dg1:          NOTRUN -> [ABORT][320] ([i915#13218]) +27 other tests abort
>     [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-13/igt@perf_pmu@idle@rcs0.html
> 
>    * igt@prime_vgem@basic-fence-mmap:
>      - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3708] / [i915#4077])
>     [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-8/igt@prime_vgem@basic-fence-mmap.html
>      - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#3708] / [i915#4077])
>     [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-6/igt@prime_vgem@basic-fence-mmap.html
> 
>    * igt@prime_vgem@basic-fence-read:
>      - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#3291] / [i915#3708])
>     [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-3/igt@prime_vgem@basic-fence-read.html
>      - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#3708])
>     [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@prime_vgem@basic-fence-read.html
> 
>    * igt@prime_vgem@basic-write:
>      - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#3291] / [i915#3708]) +1 other test skip
>     [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-5/igt@prime_vgem@basic-write.html
>      - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3708]) +1 other test skip
>     [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@prime_vgem@basic-write.html
>      - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#10216] / [i915#3708])
>     [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@prime_vgem@basic-write.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-on:
>      - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#9917])
>     [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
>      - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#9917])
>     [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
>      - shard-tglu:         NOTRUN -> [FAIL][330] ([i915#12910]) +9 other tests fail
>     [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
>      - shard-mtlp:         NOTRUN -> [FAIL][331] ([i915#12910]) +9 other tests fail
>     [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-mtlp-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@kms_pm_rpm@dpms-non-lpsp:
>      - shard-dg2:          [SKIP][332] ([i915#9519]) -> [PASS][333]
>     [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html
>     [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>    
> #### Warnings ####
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
>      - shard-dg2:          [SKIP][334] ([i915#10433] / [i915#3458]) -> [SKIP][335] ([i915#3458]) +1 other test skip
>     [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15803/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
>     [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
> 
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>    [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
>    [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>    [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>    [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>    [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>    [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>    [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>    [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>    [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
>    [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
>    [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
>    [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
>    [i915#12238]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12238
>    [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>    [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>    [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>    [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>    [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>    [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
>    [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>    [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>    [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>    [i915#12912]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12912
>    [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>    [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>    [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>    [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>    [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
>    [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
>    [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>    [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>    [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>    [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>    [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>    [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>    [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>    [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>    [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>    [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>    [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>    [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>    [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>    [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>    [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>    [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>    [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>    [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>    [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>    [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>    [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>    [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>    [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
>    [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>    [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>    [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>    [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>    [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>    [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>    [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>    [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>    [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>    [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>    [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>    [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>    [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>    [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>    [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>    [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>    [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
>    [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>    [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
>    [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>    [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>    [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>    [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>    [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>    [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>    [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>    [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>    [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>    [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>    [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>    [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>    [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>    [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
>    [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>    [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>    [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
>    [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>    [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
>    [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>    [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>    [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>    [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>    [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>    [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>    [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>    [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>    [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>    [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>    [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>    [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>    [i915#8827]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8827
>    [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
>    [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>    [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>    [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>    [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>    [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>    [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>    [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>    [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>    [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>    [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>    [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>    [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>    [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>    [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>    [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>    [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8141 -> IGTPW_12271
>    * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_15803: 261a0301bda5af29477bd710465a8886e8609a4d @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_12271: cedc5aa23c601995e871c7fc19f77c987bf3638b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12271/index.html

