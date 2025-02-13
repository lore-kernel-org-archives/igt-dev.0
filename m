Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131EEC021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 05:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBBA10E1BF;
	Thu, 13 Feb 2025 05:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6WJdqDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B92B10E1BF
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 05:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739426028; x=1770962028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=id8rr2SST8iV3nwGei8+UdMoaUTQATQHM22lyhVN0l4=;
 b=C6WJdqDOOcaNoFdJ9ClSDZxE892l0/4E87mdPOFn36N7FfjugcqvCip8
 0YRv3Lt9aZraTfE8HAaFR+EJ9K5WtVOhRf8HQUdXufX4De8i56TYL0apT
 Z1ro11eyIpwi5h4W1WvmV5tW6Z7orTr6lypkWF6TSDvFSjotRHYBskb/u
 mQhjE/FmPUSGTNmFYSSmMlu8AMsGJnz27WdAnQBRkko0dvpQE5lZJavlM
 wCki+5WDzJvUQVYBIeXKvAEVj1If9hrEJdIR3BS6jX7lhBWg84mC8Drii
 fEuhn0IE3PComgE3NdO5Qo3EoYXX+fo6lpuhjwxlLWQPp+bLLw8JwxkHH g==;
X-CSE-ConnectionGUID: LKSuiJFZRKSLEqhmM19xfA==
X-CSE-MsgGUID: fmXRmX+qToWVfWXfEpyUBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="42950299"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="42950299"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 21:53:48 -0800
X-CSE-ConnectionGUID: c3gccIxfRmCsmB0YXWCtLA==
X-CSE-MsgGUID: TE0OIPBrRFyIZhCCwksWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117661389"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 21:53:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 21:53:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 21:53:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 21:53:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0tj9fmDCORC64AdP3p/ggSN7BLttosGRP9cZ6Au2jKTg1i9UEEkZsifsCINhyhYODnJqhGbN6KyplIGGmUluiJ/MdsaZn/Cl/TDyt9jgPJelhUrbNiQwcqNsRkOt6K+z4DXGJuPrYJ+UnvuvQGg+Lj3lTSJO6G7KW1jEcgFo19HCJucuN1i3aVNnmEAK9Uk28HAlSThMynqyOZHm3XkABFNrgV8aXogBoN1S++O8df0WMypr69WsqK0shTo1rLgI2ofh8asR0LRXVPEaPiE7nFpaThDAomh3DVdyOIiyXO4JnR2WducKUCyIxwnm3C74mnOqbXPJa5LPxg/8ibijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u87Q+vVN8jate1EM3a5COtyWuHVkixNnlK62kn1YCa0=;
 b=mWfCxaFVkhCZ+nmWQoVVwYZGVPWqCmTjrJBFXKJPMMM4vZrwknmY/uhPOC0wkOXr+T5t4Mj123IfDW8oyOUuK/22enlDt89HyH0tEv/q26Byi2H5qty6NuhMQz46DJ1VEl+2P6MAauT89TudAU4wbg0ezt1Ey/O8qziZoDH+Vm0Q9PJDUei7Zrfi2WD3hLAGsU/nBRcrG7A0/GBQt1xKdNBzziGWQNytxNdHXEKI7NBntAKHS98JiRv3r6L/AUsiQeqdgzF8kWBd3fkXHryQL7xGqNXNRNW8I6grwJDQ1PGyGbLUq1KRNXkbzsrc3E5wBCMIKruOzI8qVEbMiaMceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 05:53:25 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 05:53:25 +0000
Message-ID: <c0f26dfe-0591-4ac9-8d2f-4e61084947bc@intel.com>
Date: Thu, 13 Feb 2025 11:23:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] add dsc-fallback test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5e223b-4e0b-4824-7e63-08dd4bf2bada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnRrYVU2KzJnNG9VR09MeDNtbS9lMy8ydWUreXp4QjJBUkhDd05xYXFkZVdn?=
 =?utf-8?B?bDA5RzdDak1LVmgzaHJXbGdzRzUvK0lJM0lDdkpVVThKRngxeStQVXNCMDVG?=
 =?utf-8?B?S2hQNkM0RjNlSzkvczMxTG9FejNDUytld3ZBNFBhZHBPWmtHUE1ObXYvSTBw?=
 =?utf-8?B?bnhKcUpoNUJNN0pJNDlYZUFrdkZCb2lMQVJDb0o5RGc5Mjl1ZVk5UlJOVkQ1?=
 =?utf-8?B?NTFDS1BwcTVZMGEvWnd6cTJqREdvN3VrZnAxTE9ZMEVxeEZWaFd2LzRnQ1Vj?=
 =?utf-8?B?aDExeFNPbG9aaTVrVmsxUnlZSHRqd1Fxd3BlM1JHL2tHbFNqUW0xVnhuZmVq?=
 =?utf-8?B?NnNweW42WUZSNkJGd1ZxODlOQjhiOTZQaS9IMUcrUXF2dGR2K21hVThCUWZo?=
 =?utf-8?B?UlBEa3VOMWhiSDJHL1VpVVNvbHFSMmE2MVR1VTNwWUJ5dFp4YzhYcCt5RXhh?=
 =?utf-8?B?aVdDQVpaZHRlVzdHMWpIYkp1VmRUbWpicnpEYU5mekdQREp6eWZkM2xZV3pN?=
 =?utf-8?B?YisvRkVFNERpMXRibXl5Vm12QldyMlh5RGM0djQwWVZCVUhNRkRqM2IxeWpw?=
 =?utf-8?B?NXM3bkxCdmlKZTgxLzI2K2UycVlWL0UxZ2o5Q2VYS0dvRXFkU3FDWHRPK25i?=
 =?utf-8?B?ZXVVVjVCWC9zc2dUMmtVL05hVGRkN0gyWmo1cUE0NVR2VTFSMWRXeHg5ZWpI?=
 =?utf-8?B?RlhLeFIvOTNtUXhWdGw3ckdQNFFMUlZsanhMSGl3SklPN1pMK1pNWndRYlE0?=
 =?utf-8?B?b3VhY1l4amxYZXdiYzFZVTFDdXBmRzZrQ21mYSt2eEpPU2JqZzU0RVFMd3JW?=
 =?utf-8?B?aEU0eFdmK0ZiQjJ1eTNPQSszcnJqak91UUVTYStrdDFzeFQyWnlGSXdDTVhZ?=
 =?utf-8?B?NUhHK1VzRGw2dFNXNkhXNXdJNXJqWEJ2TXRCRUJ5eS9oL1ZNemh4WTREREVP?=
 =?utf-8?B?Nk1DbXpkNVZYWS9uQlBTSk1CMWpXOEhZSkZaaWtDUU1oNlRwVENWWHVjbXEv?=
 =?utf-8?B?d3pQa28yMUpsV0RMQzZ3ZjcrOG1CRGJhYUxrYm9HREJZRE5DSDJWTk1FOEJ6?=
 =?utf-8?B?UUFvbFY3aVdpOE44VGRLNWpZdlB4LzhIRnkxVjhub2Ntdkg2bnJUWkE4UDNU?=
 =?utf-8?B?aEVBYVlqY1BaaUkzWGVZYmMvWG5xM25KOTNuUGRXdzRheGt0dklLaExXWnJE?=
 =?utf-8?B?S2ZFSno2Vi9ST2JvVFhmbW5JbWU4SHY1UzB6Y2paOEh5NW1ZTnZkNHV2MHBE?=
 =?utf-8?B?WG5aaWVZZWRpbjhJYXlQcjgydFpSMW5yTGFRL1BQZ2tkenBOTHZmcGdZTmVR?=
 =?utf-8?B?L0xPZXhPWlJHSEV5TlZyWVBsK1E2eWp4Lzkyd2RINXhEdDlrUlRuYkhMT2pC?=
 =?utf-8?B?anY1R0RpejZ1RElaUmRyYWV1ZUxpRzZBSU5uUVM1Y3VLN0pVTlZ1Q2hxMnJK?=
 =?utf-8?B?MUg3Wkg3dHVOMzJrN3BENEh2d1dmVmtZT1JLVWhFZmVSNmYybmZ0a0c1NEVo?=
 =?utf-8?B?RWtDRE1BMDdTY2F4RFFYaVNmaUFrY2FuWUdrTGtQN21HaEpQU3hlM1QyWTBh?=
 =?utf-8?B?dGlFekl6WlBmWm5wTXQ2MzVKc01KdVFhMWQ1VlV2TllpalN3VS9HSUVVN2JJ?=
 =?utf-8?B?d2xYc3VpRHBxUWRxNXBoMVJkdzB4OVRxOU1IUDBidGMyZWFpUHRISEJpWVJB?=
 =?utf-8?B?aWhWQ1JNdlZBek9CeUh5VjNERi9PL0tpbVpZYzJHL1hxYXdqRGx1UVJUTlFW?=
 =?utf-8?B?akd2cDZIbUxZOHg2N2xtMWxLTkRObDEzenZCN2ZDM0U0TGp4WXRscnBmM1ps?=
 =?utf-8?B?Tlk4ZDRYcE5UL0Z0NmtKUnZDRWpKR1lHckNSRnRRWnc5Mk5DL0NIcFF5Y2ta?=
 =?utf-8?Q?wGxvpf6QypP3B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmU2Y1ovdit3MVlxWUNiV2FkU1JmQ2Uxc3dkY1ZXajFBSHpYRCt1OG15VmU4?=
 =?utf-8?B?Q29hK2ZWREZzaHlWdDUrRk55SkVzanFSMDUwbEoycEMxVlVISFQ3b0JjVFkz?=
 =?utf-8?B?ZzRlcWFFUVJNL0w0SCtvbUpoQTVWeWJZaVQ4eTBTYjUrOXdhOGh3QXExS1BO?=
 =?utf-8?B?WFE2bk5vVWZzK3VpL25FYk9oWHdCcVZMbDJsdWpyWDFBVDJzZG0xaHdjV1F2?=
 =?utf-8?B?eFk4cTR4LzJOMzFiUlhVN3Q0MVU5Vjh2eW1PME1XUzhlZXQ3VWd1V3hEeFcz?=
 =?utf-8?B?QXUwdDhEUkxtalNMaEswM1BUR0dadnZWVnJiaEc1M3VGOVRIc0MyREFBWFpM?=
 =?utf-8?B?RTdMSU1ZRHRlY21ub1VKSHVtSTBwbmViWmN0N0JJaXUraU9zaGw4UjZ4cE9C?=
 =?utf-8?B?VnR0V3FTcEVqTURidlVCTTkxWk9EWFB0a2VMMGMrY3RlR2ZJakJPWDRhbE5I?=
 =?utf-8?B?QkNiYlBDVi8xOFNXeXNKM0cxYXhIMFIrd0REZE9VMllxS1Ftd3l5RWQxZVhL?=
 =?utf-8?B?Q1BUbmhRSWJpeEIzeFQ1TW1SY25rZUNEbW1xdmdVL0RnalE1MnUxOTlKczU0?=
 =?utf-8?B?cHhVUmdIeXNhdXdTaHhQdkRRSEc4VndubXJNM2tDSU56MGRQZm9DbTFkQXFB?=
 =?utf-8?B?M1FVSW1ORUxjSDRmWGFTNU9MSWpFQVlMYlk4V2l0N01COHZ1cW5UYlRmTzZn?=
 =?utf-8?B?aklWaHNJY3owYjN2T2lXM2dEdzZpaVVObU5rUU02OEZRNmVDenUyZ0VSRHIy?=
 =?utf-8?B?WG5vU1hGVHZvNzE4YXZVMVp3Q3JZS2VMbWJEWFZtU0RQOFVFcHR1bHFmVnNB?=
 =?utf-8?B?NmtGR0V3UjFSYVFjTDQyaXRsU2NINElKQ1NUSmQ3YzdVTFpIY0VtVUdsNXZH?=
 =?utf-8?B?NTBBaU0wS2I4RHFQTkcxR08vL0U0RWJqZzBrcEIvRjRMWW95NURQQ3lENjFj?=
 =?utf-8?B?NGE3QmhmRndoQktNMWJHelZmYWlvV3hXK1hFTDkrRHIyWkkrcUk5TldZNGdZ?=
 =?utf-8?B?czBucnNaQVprdVM5S3NVTXVLQjVSMk12UUtTTGpWV0lFc2YraHRCSWFYbzVX?=
 =?utf-8?B?a1JnWW9aanVLc0NuV1l3WTBWd0NSZ21adTNKeHRIQkw0QUVoQTQybDBFbmNm?=
 =?utf-8?B?Z2RmNFY0U1hhOFliWUxRdjZJd0JTektyTUhOYUx5VkZKc3ZDemRVV0FIbFhs?=
 =?utf-8?B?elRYZ1NQSkl3ODZrc1hPTzFyTDkvMHhGbWIwSnJLRDF4RGNJTUk3Sjh3aUJa?=
 =?utf-8?B?K1VjRDZvVlVrOTJjUW5GenZDWlFnZ3Z3MW9NdHdYNVpFbTNiU0RldDgwb21G?=
 =?utf-8?B?disxWG5QN08xeHdoejBUZ2d2eDllQVJGMHlWeEFMZi9mWWlVaDRaSHQzMmRw?=
 =?utf-8?B?aWNlTkxHbGd1a1JsTFhXRHMycHRmZzZtOFN0SGQybDNmL1lBY0lQZFZFRytK?=
 =?utf-8?B?UTE1aCtwdVlwNjREa2U2VVhnTU12Rkk3N0Y2Z2xQeTVkQVJhMEdtODZKb0Zi?=
 =?utf-8?B?NXVMRHpKMi9TUjR2TTF1ZERjNndNdmJoNTRXcytFM0ZTcmlZVjNHVUtKbWFX?=
 =?utf-8?B?Uml6TVRLMDdwd0hmRlBhdkpJV1A1aVlNVTZEV1NxR2hpZTd0YldJUDVNRXBE?=
 =?utf-8?B?QjRPSC9LcUtsWHU0L0ZqQUI2UndFQ3hIbjFBV3Iyd0F2OFRXazRKcXhZMk50?=
 =?utf-8?B?RDNOTGQvQ1E0b1BodnJ0VWZwVmR1c2F5S1ZsNForZjUwYklYZFM1a044bTFK?=
 =?utf-8?B?Q1NNQ0NCMFlaZmIySmNKRW0xbGVuVkFXQlJiT3pwYXQyUmtsNnN2OVNLT25m?=
 =?utf-8?B?Tkd2ZHpjOEVlNElzVEpvK3F2MVNWQVJzUk1la28vRU5CVjBmV1owUnpkZkh1?=
 =?utf-8?B?NWNrcHFnT2hST09DMWw3cktLU3pZK2FNN21LQWt4MkNtamlEcXoxVEs1Qkor?=
 =?utf-8?B?VzhrZmFqN2ZXU09MQ3hKbG9zZXdtY0MvTGErdm1VcjZla0hKTWVYaXlKNFR5?=
 =?utf-8?B?SXNZN3Byb0FZNHc3c3UreFg5WTZFTTFac0VRUFg4RXYrNXA4U3A0bWlGZHNp?=
 =?utf-8?B?cElTZlFQb0Z2eWNoV0RiZENSa2ZVOHVGcFJqVUNzUk1zRDFTbzJ2Vm9YUnY4?=
 =?utf-8?B?bjNwRkJuK3Z3OW1Tam1aZWQrRitYM1Btbm11Q1FiU2ZXblloclp2cmVmZlRW?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5e223b-4e0b-4824-7e63-08dd4bf2bada
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:53:24.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsscvIgzncXl9x4yrsApfTJWk/iBWvA6daJt/iUsEuFV7RIuu+jQy8ubcKTmX9d2Tqy89plkFaBgzxZcMPFzGuIXJ7m+wXXfuYWWk5fpf2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
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


On 2/11/2025 11:35 PM, Kunal Joshi wrote:
> Add test to check we fallback to dsc when current
> link params cannot accomadate bw required by
> the current mode.
>
> Kunal Joshi (7):
>    tests/intel/kms_dp_linktrain_fallback: refactor find_mst_outputs
>    tests/intel/kms_mst_helper: add helper for MST-related functions
>    tests/intel/kms_dp_linktrain_fallback: refactor dp-fallback subtest
>    tests/intel/kms_dp_linktrain_fallback: fix typo
>    tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
>    tests/intel/kms_dp_linktrain_fallback: disable ignore long hpd

The series looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>    HAX: Do not merge
>
>   tests/intel-ci/fast-feedback.testlist    |   3 +-
>   tests/intel-ci/xe-fast-feedback.testlist |   3 +-
>   tests/intel/kms_dp_linktrain_fallback.c  | 356 +++++++++++++++++++----
>   tests/intel/kms_mst_helper.c             |  48 +++
>   tests/intel/kms_mst_helper.h             |  15 +
>   tests/meson.build                        |   3 +
>   6 files changed, 367 insertions(+), 61 deletions(-)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
