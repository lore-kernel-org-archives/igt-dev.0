Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CD5C0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 08:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E51F10E199;
	Mon, 27 Jan 2025 08:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rs68VOJl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0610E4D2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737967443; x=1769503443;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nHaGjymYrXfJ+uIkMqbxHJA2MMeEubfLJl+f2VJLvP4=;
 b=Rs68VOJlTT75BJjI+/XHCKbGEiZhTvmcJBrHT+/LUhAez5cuS7yDO1YE
 aaYsWM+GxlSr6tmIjRmcgppu9uXyodrttnVG/fcQTDOeJDBRWP/XddKvr
 mUqNEBQpeG+Zz9v/ryFEeVJJzuYjbTEEq0mu5UdvOTog5fJPHLdqRDm7E
 /6eoqqSNSCsqX+0tUvKby55WEHRcDS+PefCgLC3js3eiGDZS2rye7Vf0m
 bEUHIjd7hQ592mtPGfbmbrVdwbci7bMPyZPm/+5QCvxIN/4+Gm4iMQI+d
 b3RZUOuCYrEZ/jKeINTCpxDwBlNjgfqPhFBMe9ATSzLKNk225uGzbmHje w==;
X-CSE-ConnectionGUID: EA1Pc+y4RTCV9sp5/9UgIw==
X-CSE-MsgGUID: Xxid0ftpT/WHS+Q/9UmcAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38519746"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38519746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 00:44:02 -0800
X-CSE-ConnectionGUID: wnuHNvuNRA2SJxsFF148eQ==
X-CSE-MsgGUID: y4AONSMqSviBZEX+ZuMZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112982072"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 00:44:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 00:44:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 00:44:01 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 00:44:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrNgHCy8Ib9CgH0xsYHaMwaMDYGBqcDBcIqIs7YMu+IsIa9/nZ9Bi4t450HzHso82r6LaGWxfuDDNKzWpnEG6QYwz4sLuldDW8LTKyRIHRYugp5YYvZcvgkIyUf8+4Bhp3mZO30KvLb/kojQ530/xnCxs5JGo0SOs9vLIfxS4re1oeXeuWe45GYAuZFdgj4ufHv42HdxNYmQNEOzUoCjsrXtC2gO60psuVFTzaCJA2X4nK99nBE7LfHH1OizV3H7m0J19ZA3bvRnbY/Z43tx0/RNHYrmR3fPzC0NcJdcUjLsFSd3oiSUn81wnPByovEfuGbiN36a5oa5a5GBhgv5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Don40EnzGFI54lu3ZgerlYyhmtOOXNw4cXTldxv1tos=;
 b=kKSDZB07N2jhDAgas7q+2xq64sLNfkOdCDqyXG/nnhOkYEgq4iaMhx8FWuYnUr3mzXwPmr26sBG0M75qQb7uHZS+0DdNogj3FxccDwKfnZVdXc029M7RiMRsHRBkG7tzKAcvoh0XTBPFUXlpzSvD4XOl6yoAALAZwZZwZfZUuPD0kGbSkEcRp0vtnyXW1rsIWZTl2AhMamE7WTHSS9CqrTEbpx82sMiTAKrQGUg4/AH9AINQo0u6Y5T+ik6Y5T6YupQUm/9vb8GHN37yo+97ZE0LJ7AIhQlidncX3sQvk+oE3GsLU7VudxJXH2+djPSzrwh+yUqIdchjcLtSghnAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 08:43:58 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8377.009; Mon, 27 Jan 2025
 08:43:58 +0000
Message-ID: <19956a1e-33eb-45fc-ae70-119242df31c1@intel.com>
Date: Mon, 27 Jan 2025 14:13:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
 <20250127062904.3420225-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250127062904.3420225-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|LV8PR11MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee43c14-c2f3-46cb-5631-08dd3eaebd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjU1Y2VaNmROSWlJaHlkMU9DRTZVbVdJUXpPU0pJYzdpajE0Y0g3MytVTVJn?=
 =?utf-8?B?TDFCOGlvNmRid3ZyMld3cTlJTVFzS2F5WldCQitFYWtMVkh0d1ZObkdVOThX?=
 =?utf-8?B?eG1venNXbUt4VDgvRERoQkNoL3pCWCtLa2tsTThxSk9SRFgyYjNpRGtDdnJX?=
 =?utf-8?B?NWd1NXJOeEtvYzRWTGFjbFBma0d1TVNTemhpemJvTjN1SXQzdUhKaXUrMmhy?=
 =?utf-8?B?ZVhVWmRFNVZOTkhWN2huZ25WMldUSUtsQ0ZrSUxCTU9ocjdZeXh5YU5YbFNs?=
 =?utf-8?B?Z0ppdjdKazVBU1NQaTZHNVY0ZDY2SXRkaTRlWlZKd29nWXdvaW40VXJ6aUdo?=
 =?utf-8?B?TUhVdHgyYzZaU3FGOHJMSHR5V01JQnFmNXNjVmNnRHAybm1WbERPRGs3cnBu?=
 =?utf-8?B?QU82cjEybVhrdjIyT0tYMHlzUU5nd1NzMWx6elRtdmc1WnhzN2NkSGczRTFn?=
 =?utf-8?B?MEtPbjFwMThPMlE1MGx0N1U0ZlkrbTcwamwvelJJakRqZkdBaDZla1dxRFpS?=
 =?utf-8?B?S0VEd0N3U1lIWmVKRFU0cTRpYmQ0RXBVbGNleVN1ajRMT3NKeCtSc3pZZTM1?=
 =?utf-8?B?d09PcnU0NmF1NnlLOWRIOFdmcFhWZmJHbnEvNkE1VExWcDhIZnFTdTNYNStI?=
 =?utf-8?B?WjNuZ2lsNEZxbVZkZWpwbG9lYnV1clR1VTg4aWs0SzFmcU9ZUTMxdGlpa2JF?=
 =?utf-8?B?d2hVM3BTUjg1R2U5cVEyTlE2UmR3NjJvZjNnTlhSTGRuT2VxWlNsaktyRVJr?=
 =?utf-8?B?T2VoOTg3U1FOR3BVTXRsd0M3eEhjUUNxK1A0KzNya0VPUWM1b00zVmhML3JE?=
 =?utf-8?B?Rkw2MHhVTFlmbzhQZ1hxbmxLS2RoTGdNcXpuYWl3Q1prZWtuM2xnUGFOL2wr?=
 =?utf-8?B?alBxcS9Ra3dxaW9oVXRmamtaOHJpdWRTZUJUbjB1RUhoU0d2WkhTNUxUOURC?=
 =?utf-8?B?OWIxN3NpRW5KUjNRZzZOcUpLdmE1NmZ1c2pvZEhzOUNuRGYrbWw4ODArSWNs?=
 =?utf-8?B?ZTdLYWRBTVNRZm56Ym5WeU4rSGpKOGhXTDl5RUtsQmhSbmR2K3lwSEJ6YU10?=
 =?utf-8?B?Q3E2SFVjcFU2cDdrUTRpYnN6aVpVZ2xFeHJyK001UjBXVnpYckUzeCszNEdW?=
 =?utf-8?B?ZFY3ampWMjdaTHRTdFVJZnEwZFlqbXh5NkNsSjM5QTBmcjBwWStJY1J1aWdT?=
 =?utf-8?B?WlcxTzJoaE5pTitQSWc0QitBZ2ExMG5vRkpsb2h3RWhURmUxVUVrNDRuOGhm?=
 =?utf-8?B?dktEWHduMGpUdjl2TFRkemNmbzROOEhTdUtkR2VYb3U3RFBHMk9NSFl0Yjls?=
 =?utf-8?B?d0U1bzJOWjFjUVNqUVFoWHBhbUpVOFJHMjNqNXZCdUNSUFpqNjJ5amxoZkFF?=
 =?utf-8?B?aVhEeFMyb2tUYi9VN0J3S3k1L3ZMd0hwWFc3aFFUT1RvTmNYZWZ1T1loTGNx?=
 =?utf-8?B?SE9jVUFBblVhRHpMNVo1clFaM25ZSC9QZURKNkh6Q3grSmJzRWNmZ05zUzds?=
 =?utf-8?B?dnRJVlJrdE5pb3FSci9Za1pTUW95a0M0VHJocWlnc1dlOUV3Ry9XQXFVYUFs?=
 =?utf-8?B?OCs1V2RpWEdyaW9LdkU3YXN2VkFhS0ZKZkIwUWI5eUcrQjU5bFRxU0dubDF3?=
 =?utf-8?B?eEhPN2t4VVlrL1JSSmI5SnVsaithUXM4cTloMlhIengvaHpzMk9PWW5JbFRk?=
 =?utf-8?B?RGd2ZTUvcUpwNFpWeDBScm1iQnRMQmJQVDJZSGN5dUlkVFNia0tjQ2pvTHFv?=
 =?utf-8?B?Y2g5cTcxakNHSGpnMWRvbUtVM2Q5NEdsZUpvbkN4ajVUK0RCc1VKa1Zuanlw?=
 =?utf-8?B?ZTVOeERleXVQUHVWTE1ZS20rVmVtSjFCditURVp1RHRSTjk5elJObGtmcFJa?=
 =?utf-8?Q?EAYzTQ+dtiHkV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXZGR0NXYUNJakxMdjJtRXJNbzFSejhmcDZSeU9SSFRGVDkxVWljSW1Qbm1M?=
 =?utf-8?B?NGlmUGpVTmU4dGNlWmRSamhhanZQVEl3azgvL0p1VCtqM3RmdjQvQXF3dEJy?=
 =?utf-8?B?di9mOVVPQjlwRWZMRlVZQ2grM01PR3h3VVZZb3dKaHVCWGlBeDN4b0xHZ3pB?=
 =?utf-8?B?SWJYU05FSCt5MVFVYXcwSkNSS2dCeUdUT1pORVE4ZVkyYXRibUxPWExwMzdj?=
 =?utf-8?B?eStWbG9DUnZLSDE3T3d5TkRBdjYvKzRzM3d5M3JKbm5XYlEzUlZhQklUeFUx?=
 =?utf-8?B?K0dDRzRFR3VhYnBCZGF4K0htdUMvV1V4dHV0eCswam1IQTFhOVVzUDAzYXFr?=
 =?utf-8?B?Vm5uWnpBeGF0akxOdUo1d25xaEl6aUo1aWdOS2pwN3l5cU5JYk1qbVZFUjVF?=
 =?utf-8?B?cHU2SFhpT2EyalF1VjlVYVdyVjBsZ0hDUURHdDB4SkFhWUFnVnVHWElqUkZX?=
 =?utf-8?B?WGgrN3NOTC9Cd1pjYS9FZHVtMko1dk9CU3ZQYm51V3pvNkJyOGtDWS8vSEhq?=
 =?utf-8?B?ZVJjRkJXQWN5aU9LNkloblZnaEhtUWJXM0FzcUlYUXlFVTA5amVEUEsxU3M5?=
 =?utf-8?B?Y3pCN2M3U0VZZktKMzFDUVl5R3VKb0Fld3Zjc1NYeWhHYzFEVkxNTmFpUnpZ?=
 =?utf-8?B?M2hmV1FwQ3hHdmtVeUxCUEZadGFjM1l5TVZ1ZzRBT1YzRXkyNUtjM0ozNHYy?=
 =?utf-8?B?WUluZWk4TExobjczY1dOb0t4NCt2aUxzcW1rVkE4RGxEVVEydzBUaFJmQVFU?=
 =?utf-8?B?cEdoV3RyYkVmWFNIU0ozdnQrOVlxSlhSMWNGbW91RVJtTlI2ODFyeU9uQ1h5?=
 =?utf-8?B?ejJpek1xNXBYQTF3ZFdnM0RzdXBJYXdvVWhyZlNsRTlicHRzb3c0VjhxN2My?=
 =?utf-8?B?ZEQxaGgwUi9aMFl5d3NQcGJ6cERJcHhTN1pXUFVsOE1LY0UvYUNacGVhTkhp?=
 =?utf-8?B?Rlh4OHRTdU9lSnNLMWt4eEJJZzQ2Ly96YnB6NTF0Q1VieHZmNkxDZHVIWFdm?=
 =?utf-8?B?cUU2U1VxeVJKYjU0S05xZEl1VmhURldkK2d4SEgyZFMyTk5GalkxSzZ5RS81?=
 =?utf-8?B?N1l2aGF3bkZDT2RwOTllZzdYeEhhcEJaZ2Q2ZzRVbVVHRXhEbVNRbU9zRVpR?=
 =?utf-8?B?SlJFWERqdVNBdzE5NzVjNU52V0Vlb2RqT0labWt1UE9sbXdXSmVlN0lqdmJN?=
 =?utf-8?B?SUVNU1BwWjQ3TTJSNFRlRXNsd0JpNTVQN1ZGSEFwWnVvNVViUGFNZjlRclJ0?=
 =?utf-8?B?TTJmdENNMXJza3Z2aGpiU29uVU9VaFYrQVdvTU5yRkxBSnIzQ2F3OTFRU29x?=
 =?utf-8?B?U1R5b1M5MWowcWRjZXhjNmlkaHQ2RSt5dnhsT2xhRmVrUVorOEtCWjN0VWxy?=
 =?utf-8?B?MUd4N0hKTTRqRmlVaGU0aXRVV1FDUDR5WTM2TmJZb0cxS3NHQnNxeENsRXBZ?=
 =?utf-8?B?MzUxdlpCSWROUyt4RE9pK0NhUVZ5bVRMQSttYkNpVHJyb1lZT1VvaldaUmVh?=
 =?utf-8?B?RTd1WHVHVzhYZ2JZeEZZVG5KZUJkcmczV0k1d0J2NWl2R3VSV1pObk4zbVhj?=
 =?utf-8?B?Vy93SHk3ajVqU2pwOTFVZHFKeEdXMXlndmt2Qko0WlFuN2RFWHQvckRPUUxR?=
 =?utf-8?B?RnFTNktOeGpQaE8rQStZeUt2RVZma1ZzdFFYaXRMNE94YUZCd1UySWNxTDZO?=
 =?utf-8?B?blBKcFE4TnFiZFdRWHFBWDAxYWtFTkJVdVFSYS85Vm1sNk1yS3l0dmRDNFIz?=
 =?utf-8?B?cWlXNFFJTDdLYlptUnZyV0E0dnh4amxpU2NpSTN4T2RpbnZUd25tVTMrQ1ph?=
 =?utf-8?B?VFFHVTNuOGdXdDFRc1QxWm1uMEVsMFFJWTZ6THNpMTliOEplK2FFNjgzVWpZ?=
 =?utf-8?B?SGROLzE2SW9Bd2RXdCs2U1E0cFhVWUQ2am1KanhqWnNjcGFQOE5ERW1oSmlD?=
 =?utf-8?B?S0sxejVvSjlmY0FPWi9ZNFZqSk5yOStjMFhYVFdqQmxXdHdvODZOOE1WT2lJ?=
 =?utf-8?B?VExybXdsZW5IWHpvSE5pTzBYQU90S2w1SHBBUWo4R3pLeGFqMTdTOE00RkFk?=
 =?utf-8?B?THpEeXdxTkt2RXlhdndDdkJ2UGd6TXgzS0Rpb1BidXYvUDBMTHpPS1RzT09R?=
 =?utf-8?B?Zlg3M0lyU2VIOHc4WlYxNVZmeTZ6NHVyR2ZtYlNYSk9nWFg2cmRNTmpLRThD?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee43c14-c2f3-46cb-5631-08dd3eaebd41
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 08:43:57.9885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HFHjavoHaXVzhfRHfIQaAFXm6h9Yfe89G73VDMAnIIPclSD+byuI2AwnUyGCm5af5XzbYv+OovSDe5nsZVVnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
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

Hi Kunal,

It seems I missed few review comments in previous version. PFB.

On 27-01-2025 11:59 am, Kunal Joshi wrote:
> This patch introduces kms_mst_helper.c and kms_mst_helper.h
After the commit, this won't remain as a patch. Remove "This patch". 
Commit message should be written in imperative mood.
> to centralize commonly used MST-related logic.
> The new function igt_find_all_mst_output_in_topology()
> enumerates MST outputs that share the same root connector,
> simplifying code reuse across tests needing outputs on
> same MST topology. The existing MST-related code in
> kms_dp_linktrain_fallback.c is updated to use the new helper,
> removing duplication. Additionally, meson.build is modified
> to include kms_mst_helper.c in the build process.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 28 +++------------
>   tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
>   tests/intel/kms_mst_helper.h            | 10 ++++++
>   tests/meson.build                       |  1 +
>   4 files changed, 63 insertions(+), 24 deletions(-)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index a05e2015f..b10946781 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(&data->display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -}
> -
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
> +							mst_output, output_count),
> +		    "Unable to find mst outputs\n");
Indentation here seems off. Fix it.
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> new file mode 100644
> index 000000000..9d52068f7
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,48 @@
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to an #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
> + * @n_pipes: total number of pipes available
> + * @used_pipes_mask: pointer to a bitmask (in/out) of already-used pipes
> + * @master_pipes_mask: bitmask of valid "master" pipes
> + * @valid_pipes_mask: bitmask of valid (non-fused) pipes
> + *
> + * Assign pipes to outputs based on the number of required pipes.
> + * This function will assign 1, 2, or 4 consecutive pipes to each output.
> + * It will also mark the used pipes in the bitmask.
> + *
> + * Returns: true if all outputs can be assigned successfully; false otherwise.
> + */
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs)
> +{
> +	int output_root_id, root_id;
> +	igt_output_t *connector_output;
> +
> +	if (!igt_check_output_is_dp_mst(output))
> +		return false;
> +
> +	output_root_id = igt_get_dp_mst_connector_id(output);
> +	if (output_root_id == -EINVAL)
> +		return false;
> +
> +	/*
> +	 * If output is MST, check all other connected output which shares
> +	 * same path and fill mst_outputs and num_mst_outputs
> +	 */
> +	for_each_connected_output(display, connector_output) {
> +		if (!igt_check_output_is_dp_mst(connector_output))
> +			continue;
> +
> +		root_id = igt_get_dp_mst_connector_id(connector_output);
> +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> +			mst_outputs[(*num_mst_outputs)++] = connector_output;
> +	}
> +	return true;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> new file mode 100644
> index 000000000..291fcebfe
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,10 @@
> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..2cbd21c2a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
Add space before and after brackets.
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
