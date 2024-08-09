Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A351C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 16:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285D610E073;
	Fri,  9 Aug 2024 16:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rkb0J2UB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB7010E073
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723220711; x=1754756711;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RKrXuuZHVABcz9ByveU9Sy9y69MPR854opoaIAzvlI8=;
 b=Rkb0J2UBeVDLF6+mT5/xf6ITQUMMXIJI7PUU4SQWToJ9b2aJ6TZ71Q8K
 42sPsTHPSeIJVEM3YSVoiXWEGdVgaMEjnRMufTwFUTi2fj/+Qg9TATG0v
 m40CZMQsmr6xzo9govLbiM3zBWV300I1E2Y+kc+8IGzrmzN55pvw/MChy
 IcDPwH9cY820beCkh1Yd2ew/BpYXeJ94gJeai31XbCiPyYsxhyCtV6fyi
 E9eiXRpqoGpUjYt9VEWqUbNadPche62G+op+yCHS3etvsSagSd1LmoOMd
 qVaGrRpE9Tc0Hl4ezZnJNrufsUfD2UCUfkksVe1jnHr0Se2BvaT/tNDD5 g==;
X-CSE-ConnectionGUID: dQTspCenSwyohyXgvP6tzQ==
X-CSE-MsgGUID: HwUWfTd7QWCVa5Z/KNt6eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25268718"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="25268718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:25:10 -0700
X-CSE-ConnectionGUID: tTXRgWpNSACThpBxwd5KHw==
X-CSE-MsgGUID: O1rnKHYZR6iKqwtCR7mThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="88252878"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 09:25:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 09:25:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 09:25:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 09:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg0O5UVLzZdfxiqgMO3vp7kVia2yD3eeJAznccfZpsTkjcyM9Bc1ynTm6eQdOm/Ku3qho7YvV62nt2XtB+QpFUfQOLl9702nUKWnRt4rSG/fAK8iQMzNqSnFR2aq86x8vekYPI4kaFHBZ+QNFle1oBzhKKORctThrsJzNErxIaRvoU88JDA7iBhrnz03+lAFqZnKHwxwMjLNULGUeoNQ//lp2jhkU9TPQ1rgncESKgaRTZ7b7Lz42/KItoKj9ttHjL8iZ3voKmGb21c8bZEHVunSb6xPXqa25rbGPmz7GltSs7U9zWOxKpo77Yqj/f/v9BM71K6ckLqGk91N+UBexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyiCCvQm0ymjKWEPsaGJEmxGEyJdQdyoYbYtO+0yErk=;
 b=U93S9H8k1vaI13miH/ixNQQtaenAuV3c7yAxMtDqk2vqosP7lOhAMq+YZ2zgdNtqn2Ttw6pxOMV7jRu4JBUxgVVT5NJTKCWLqmKeKOMhLlMqDEvf+M8dX3V2WkjYqHL97Yxkri9L2E1pIhYE2xo05lq7UjurKp6kqSD5jfZK2+byRlM96msC98IX5FC9cNqv3QxA4VZBVXAEof3RMzNel6IQl/+drFWV3scs8IoFUeemCWmF9kgGpGiIUKO0Iu7JvDFn58TNKA//BXkQj6mNkXCh5twXVha69Ofc33MK54V5FDHr5M4fxYTlhsRkN8rjVBIs6aYC0YjYl5wcd67/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 16:25:05 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 16:25:01 +0000
Message-ID: <12e968d1-1065-4f25-bde1-87e78309dffe@intel.com>
Date: Fri, 9 Aug 2024 21:54:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_gt_freq: Add a wait after gt reset
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240809154008.2438925-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240809154008.2438925-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|CO1PR11MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8378efcb-781b-4501-1d54-08dcb88fd157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTgycUxvOU9BL1ZwNWwwM1lJZFdUREloRGNRQXYxRUQvbUpVTzhucUVHMTlz?=
 =?utf-8?B?WnpIUXo5all2cjVaNGpkajNJUjJvaEd0WDloN1ByYWNkTWFKUHRaM2hmd3pZ?=
 =?utf-8?B?Y1VJV3FRY2pxODNJdS9kTGp3K3RXQTRXMUIxblE5azdMZFRrUmlCOVcvQjFj?=
 =?utf-8?B?UnZMVHNmM1lZYS9rVktKeHVYcm5CV1dtS1Y5TkJPalNsOXV5RFFxR0hHL282?=
 =?utf-8?B?Nk13VWU0M2lpNm1xbTk1UlcwN3Z3RlVHYVByZjJyemhZaTRZWUNmYVNFZVlK?=
 =?utf-8?B?Y1g2cWhPcEJaNnNaa0s4aUduNGVyZVoyM2Zobk1qa3RZNDNDVW13My9PcFlE?=
 =?utf-8?B?VlFCSHdpNWo0Z2VTL0cwWnk4RENRTnR0cDdkbDB3amt0ZTl5ZEdxWHZzM1JK?=
 =?utf-8?B?cWgzR1JvcllQVEZ3Tlh1RDdMQVcwc1NGUkdRU1lmS0tobEdTK050ekw1d0R2?=
 =?utf-8?B?eTBEbnB5N0g0M3Z0TWpPbmtaNHRZSEhLenMzRHJxUldpNTlyc25sKy8rLzNE?=
 =?utf-8?B?cFJZWU9PTWJINWFGYlN6eHJlZXBpb2hFcmJUK3l4aUZVbUx6aWpLMEFVWlU3?=
 =?utf-8?B?a1pLamxpOWJIRkNReWtVNXRNSHlibFJNRmp4YnUvdktOQXlWRXFhNnQ0ZldP?=
 =?utf-8?B?Y1hiWGVKYUVyTDVvRkRkM3pOT1JOL2gyQncwTXR6OExhdllySzNmVkhFaExV?=
 =?utf-8?B?UUcrY3lwUE5DcVJUcVppWllydlNTUFZBa2tnK2xoYzEwSVlXN3pNL2lSKzAy?=
 =?utf-8?B?VmN2U0lseHhWZlNsbnJxaUgrdXR4UmhEdWYzWC9XZXZQMmsvdXUzekJFdDFG?=
 =?utf-8?B?VVVVSVc5Z3lJWWhhenhodTdRMG1paUphOFBhMjZ5K3JWVERzcy9ZRW50WXEw?=
 =?utf-8?B?aDdsOTRoNzZEY1V3andoaWRaVjlpb24zVzRBdHYvQVlvVkN2eVAyd2Z2RXRj?=
 =?utf-8?B?UVkvaTBEUmFtT0ZtWDlTck9QSzVlZHRNNnFpS2lFMllmWUoyZVFxTkZnbDd1?=
 =?utf-8?B?aXNZOXJQOEpIVkpvNklmODJqMDZoQ05qZkVGc1BMK1hPNzdTbXZTRnRoV3g0?=
 =?utf-8?B?cEpHbVYwRHVFc05PdVBwOVhLYkNvakhQSzdmMU9IczlMQkJlSWQzTDZ0V1Qw?=
 =?utf-8?B?NEdPcWcxdkhrRjM3MWxpWm9GOGRhT2lsMDZuQzVDMVhXaElzdVNvVVlsL1lj?=
 =?utf-8?B?cGZUSkl5WHhILzFMUmt6NVdrNFZXSEhHdERXWGVkc3hlUy9XdEVwbTc4MzN1?=
 =?utf-8?B?QXNaVlhtMWptQ0xRQkJhdXBpZW5hbHVhamlxQmY5ZEdvbFdYdTFTY2hNR2tI?=
 =?utf-8?B?b05BalZIMGo4Y1d4NEFjbGdXQWhPNy94RmhhWjlQOW1OUmZjQUZodFp6Q1Vx?=
 =?utf-8?B?K3BVSHUyVXpyZG9Qa0pYTlBTd09UQkN3S3hQbXpPV1duanZkNk1uQm4ycXVx?=
 =?utf-8?B?VWFidGp6L0xvREhUZnRGMnZ1NEZnMGUzL3NJNFp2djlsYXNua2VXNlc1b0xU?=
 =?utf-8?B?UEVHbU5hSWFJQ3lLa2Z3MnViMDhMRHQvZXlqOUVPUURaamVKNzNpYU9QeDdv?=
 =?utf-8?B?dnR0TWtuckZXTFR3RzcraVhaWGhhM1YvKzdFRG5KVWprUWJob0lGUkNkOUJC?=
 =?utf-8?B?MG93TGtjTmp1cGQwbU1ybUxxT2VlcnFyOU9Nc09XT1pWTzRUQVNQT0R6UUVr?=
 =?utf-8?B?YldEM3NMS2d2YmR5OG5JL2tsdFpYKzZIa3dXcGloUDArZW5UQm42R0RVN1Jk?=
 =?utf-8?B?eXNJaFVBYWhKaDVENXdlMithVDAzOFpYdUJ4TE9qRVBNSW1wWkNUV3ZGaXQy?=
 =?utf-8?B?Um53R0VZd1BMck5SZ0hJUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmlrcGdGanpBZFFQK2FUYjFCY2ZXSldVcDFCZnAzVkkybXM2anZrbWxURTlX?=
 =?utf-8?B?SXdwa3pOQVBGSnFHSlhITTlBM0p4Z1VremptYkx2YS8vQlhDMEZRUjJHS2lD?=
 =?utf-8?B?STNxN0xJYWE4TGNNQmJVUTdsWHdyekJBZHdJNTl3QXNoSDl3dlVnUnNSNzlJ?=
 =?utf-8?B?bXpoUkEzTjFhclQwejNBaUJLY1EweGRCbWhmVzg2M1ZUS29wZXZ2VSs0NUZB?=
 =?utf-8?B?Si9sSkZCakI1RG1UT3ozNkZoaG5nLzdRclhJWVBGTEVQcFZ0NkdtdWtpT2s0?=
 =?utf-8?B?eG1RWUxCeTJ3R042dWVNSFlyVTV6MVVyempGcEJRYzlWQ0dtRWNTVFBkN1pO?=
 =?utf-8?B?bWpZTkZGb1pJWmQ5WFRCeUlwNUx0NmlPSUxieVkzV0F0NlFvL0c0TTFjbTBp?=
 =?utf-8?B?ZEJneWxZY1EvaWp0RmU5ZndkazEvYjZTWkZkZGhJTnhPWXp0RHUxMVk0UzFW?=
 =?utf-8?B?Vk9jdVFjaGxhZnNCaS93VnZnSjRMay8rQWpJTkdYS3RNUS8xV2RZSHYyTXRB?=
 =?utf-8?B?ZmVzSHFuMDg2cXhqY1lGMlIyOFZCVUxlR3FvRU9VWkNFV0RXRkRmdXpDNUJ4?=
 =?utf-8?B?Z3BGZjVNaVBpYnZERDRmMExrdVBveVpOODVSd1hFbjYyRjB5N0U3VkFJbjRs?=
 =?utf-8?B?dVNYSUxoVDZHNFFRVlRzRmRHdk5hY1Y2YW1YN3I5VHAvKzJEOU9vMnhyeFdI?=
 =?utf-8?B?d3NnaEorK1NUaTJXaHBOeFR5dmJOTk1tWE8zc3JoOVRyZkx5VWl0VnIreUkx?=
 =?utf-8?B?elliM2d5a05EWjJ5WGZqRFNNT0VXS0d4QSs0RW9HSTdYSnNmK2ljVU8xRUlV?=
 =?utf-8?B?SmhDYTNZdkpVWmZkSDNnenp5cWZiWXRCTzArVmR5L0dIRVI0L3JHT1lURFVD?=
 =?utf-8?B?WEtzOWJDYk9Rdzd3a2toR2gyMUswWEJyYng4YjVPQXYyZERJZlBleElNOXFH?=
 =?utf-8?B?aFhES3NLeEdBZy91MXFXcC96L1dmVCt3ekpzNnZSVmV2STZlQzZGMlhRemJx?=
 =?utf-8?B?cEpwWnZ6T0gxdUtBekg4aWtDT1R3T1R4U1FxWUluWU5HNHN3V2VaWmI2QW9n?=
 =?utf-8?B?ZllZTG1wMGtwTUNQMjd3dndITWZiVVdPUUFLaHNJSTBxa001c3JDakN4K3NY?=
 =?utf-8?B?Vll1bFpaT0lYbjFzS3IrN0ZpdjBTSDZ4Z0ViL0k5V1F0KzZ1U1VPY2N0V0ly?=
 =?utf-8?B?QUZnTUk5eHF4VEhUNmFRRjVpYjFadmg4WUthVnZUY1piU0dqZGkzSFlLd3JS?=
 =?utf-8?B?Z0lWUTc4c3dadU1SYSt2SFlRV3IydVpYSE9LR1RQMXppYUVhL29sZU9oSW9B?=
 =?utf-8?B?VUtPdUtvMlpqaDNoVmE2YlJ0RXM0bXIxMFd3bW9HQldrZm9adGo2bE5RVXpM?=
 =?utf-8?B?YkdmaGdIVUc1ajh1T2xlTWk2azdkbENodFpzblVjbXNhaFltQTBQM2FVclFm?=
 =?utf-8?B?TmNYVHVibmU1VTludzRNbGhwNFJ2OFU1RzdCelpkY2hyYzV4Ui94YzA2dlJE?=
 =?utf-8?B?dkhCRGlPT254dnptNUhuWGswbGlvWHpKbkJHYVFaRWlZcEphUUdSbk5ScVRx?=
 =?utf-8?B?RHljWTZ0b2VQYTZ2YVUxSlplZy9HYmx3VGpsUmxrYjNybWpRY21icWdpSzVL?=
 =?utf-8?B?UVhCUTl3aXZKcnlQSDFrL1VyTEFUVnVRS05STHRJcTNqZFpVZ3pLeklLNjVT?=
 =?utf-8?B?OXhwVWZlSUswR21INHlWK0JxNmpDWG1CbGdsSDI3MWV3M0d5MWx4bER5RklG?=
 =?utf-8?B?eGxCSWF4bS9xcXlNaUdTYlpEck5jRXVlajFaSDVnQ09PQ2hCTkFlK2liWkhB?=
 =?utf-8?B?Mkt0VDNnc251enB4NXFiODZYbXUzYXMxWk1iNW5lWkFhZXd5emNpclY4TVdO?=
 =?utf-8?B?Mm9UTlR1YlNXbzVSeXpmMjVBY2NVNWFWOWtQaTNObUpuaC9kWHN4SmFRcWlV?=
 =?utf-8?B?SG0rTk1LNUx3dkx6d2phaktmeWZsUlR5anNESHVnSlpDNEFFV0prMVBQUjdi?=
 =?utf-8?B?bUJjZVh0M1pmNS9CM0pGQnN5ZGRDak5jRTIwbnI2QUdEOFMwSXBIaHRlcU5J?=
 =?utf-8?B?OE5ydHUvc1VGOGJzTE5LZWkwenJQK0Q4TllEOHhVenlnNkJyVE5ReXNkSEV2?=
 =?utf-8?Q?kIxd7cz4fmNjKHcRPNIATRdoA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8378efcb-781b-4501-1d54-08dcb88fd157
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 16:25:01.5614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYvqoL/YZbzNpydfGksHYkhHMH1YWXFbgceBe+Wiwb+PWiDzNosoSXvTG5C+4uPVB8ZD8wRowMYdUHiw0/P2qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
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

Hi Karthik

It's better to split patches. One for rename and another for wait after 
gt reset.

Thanks,
Riana

On 8/9/2024 9:10 PM, Karthik Poosa wrote:
> After reset min and max takes sometime to get set.
> So add a wait of 100ms after gt reset before reading
> min and max frequencies.
> 
> v2:
>   - Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US and use it
>     instead of new macro. (Riana)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 171f9cb44..427e12c55 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -34,7 +34,7 @@
>    * Too many intermediate components and steps before freq is adjusted
>    * Specially if workload is under execution, so let's wait 100 ms.
>    */
> -#define ACT_FREQ_LATENCY_US 100000
> +#define SLPC_FREQ_LATENCY_US 100000
>   
>   static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>   {
> @@ -194,7 +194,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	 */
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
>   
>   	if (gt_idle) {
> @@ -208,7 +208,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	cur_freq = get_freq(fd, gt_id, "cur");
>   	/* If rpmid is around RPe, we could see SLPC follow it */
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
> @@ -224,7 +224,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	/*
>   	 * It is unlikely that PCODE will *always* respect any request above RPe
>   	 * So for this level let's only check if GuC PC is doing its job
> @@ -259,7 +259,7 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	cur = get_freq(fd, gt_id, "cur");
>   	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
>   
> @@ -292,7 +292,7 @@ static void test_freq_low_max(int fd, int gt_id)
>   	 */
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   
>   	/* Cur freq will follow RPe, which could be higher than min freq */
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ),
> @@ -310,7 +310,7 @@ static void test_suspend(int fd, int gt_id)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
>   
>   	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
> @@ -337,11 +337,12 @@ static void test_reset(int fd, int gt_id, int cycles)
>   			     "Failed after %d good cycles\n", i);
>   		igt_assert_f(set_freq(fd, gt_id, "max", rpn) > 0,
>   			     "Failed after %d good cycles\n", i);
> -		usleep(ACT_FREQ_LATENCY_US);
> +		usleep(SLPC_FREQ_LATENCY_US);
>   		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
>   			     "Failed after %d good cycles\n", i);
>   
>   		xe_force_gt_reset_async(fd, gt_id);
> +		usleep(SLPC_FREQ_LATENCY_US);
>   
>   		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>   			     "Failed after %d good cycles\n", i);
