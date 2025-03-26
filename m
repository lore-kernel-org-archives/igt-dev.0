Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD99C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 05:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6930510E078;
	Wed, 26 Mar 2025 05:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHFkoCzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640A910E078
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 05:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742968458; x=1774504458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rsHJHSH2CRgLedDBazZa/v/+Cz/Ee4FeDjchgYC+WyI=;
 b=OHFkoCzNadjjhT5wE505BNgM0ltUzX2peSl9ODJyL4VKS8iJBVvh65ws
 fSlBbI1eTFxUN6Q/zQTabVstY5BlWSdosbWKm6UPjgQW/Iq/BesYLW78g
 /fobX0pUcbdZRa+gt3h9n6T6DhOVvCSBOtEbcci+KCrFlDCntkT11HCTV
 JqZMH54fm5M3CygwlrlYiCBb8aJfidc5mvhgsKghtr8zjHuqG2Hag2t+s
 UBfDA8NqSvz47pdQ/sh8/yDAUzKDDl1fNAd4zOxGb1fBymzWlLpZKCc7m
 FoWjlCfkJbQGvAR12nnae2khyoRTP1PXxV12Q3ZYRd8yf3J9kSOlEfCLR A==;
X-CSE-ConnectionGUID: Wpr9wPU3QYOUv1BAMs4OkQ==
X-CSE-MsgGUID: DSnMR7cwRLWFsXNL8FFtZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46977764"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="46977764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:54:14 -0700
X-CSE-ConnectionGUID: DVuealmIRcWaoXXwKcrGjA==
X-CSE-MsgGUID: rWEAXD4CRWqhAJ+mq7V9Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="124654818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:54:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 22:54:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 22:54:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 22:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amUDxGG7JQxnJZPYZ2Fj+LdvOBJ4Ftvqmn1xJx8kMS6TeqUA6be2hUkPfwKAPHDsg4rwqfOewFovnBRPfTCMc2dPbWuwOSwBgNXmpJhcm+cxwVKZ3dUZRN+ahWPb75zOO1u1zyXEjxvjSKBiuUICY0hlU9ivXfM8tktpzxfn0nPUXXyQ7q3kV0wT/hcivj5aQSn5LT2rCE23U2niube5weKxLwT/B7FP56YjX/ETQSb8+5lwmUzrZXu/BZuKo+h5k16EcP6XAu6sBeJbromM4EQP/U8UR3Y/x6vsFfhRhqEiwnOKqksVTXdHVOusX/1Q2U8cysmems4e/L5hemxMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7Znib/ey7tvzFjFCxtsZymXkbRHxBjzUBvlgx6+Z0s=;
 b=KFhnGCJeR6dqHlGYtU2x5LiWhcuBZsfqcgrURmDwDaxvRdrBca5sMKfWB8T3kxh0oluPxpNxMrwbNcd2c622xb7lh6BgrkRaExI4c/g9G7mo1+7zWyQgj7IZ6vxZvQTfjKRfzZv1bwHfLylb2n8qTcfclnRsRgXfW15efPob7OjFMCt1qegZo4FLbRnb8TDb4egkX+fw4ranx4eQCPu87H2e0wt7nsKekgf0RQ4t5dtYb1K1bvjg759qIhc2EU194WLih2V0rC+eBD0376ZJ0oXe27/DTICA9CTulw/+YruaCWuCjD/yI1UyOUuv16f51iKiULx0/NtIb6+PNU93iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB8116.namprd11.prod.outlook.com (2603:10b6:8:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:54:10 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 05:54:10 +0000
Message-ID: <48a20710-a884-45f1-8485-ed1f17450741@intel.com>
Date: Wed, 26 Mar 2025 11:24:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/dsc: use intel_display_caps instead of
 i915_display_capabilities
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Vinod Govindapillai <vinod.govindapillai@intel.com>
References: <20250325130842.1821042-1-jani.nikula@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250325130842.1821042-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: 798672af-c09a-4201-6d55-08dd6c2aa125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amxWbEUzSXphbmRtOXdQRXlxRmlhYmtSQnRkTUxUL01jRlZ6S2dKRnhtRWhV?=
 =?utf-8?B?NmkrbTJ3dDhWcDI1MWtqdEJ2N3crWGRiZ05zOTd4N1RNQUVCWHhKYitHOVI5?=
 =?utf-8?B?NldCLzhIZ0FXMUZVOG85MkUzTDhkZFYyWGxMc0ZTa2lHTExyVXZLOVkwY3gw?=
 =?utf-8?B?V0VBcFRZanlhVkVVekdwNmtNMTUrcktLRFhLQXRHbFRPRnVLM2FnVU5WanFR?=
 =?utf-8?B?VC9BV2NjODJMOVBTaVJxMFZseXBUeXJ0Sk9yUU1pVmtLd0JDTmQzMy9JVmkr?=
 =?utf-8?B?MnRDWW9qdnFvbVVnTUcyOWhza1VDZXNJc01OWGxCaVZ0ODE5VlR0RUtmVVlr?=
 =?utf-8?B?K1IvK2cxQ3NqSUphZ25qQnRLaVN2VTlzZk56WXFoMTIxMlhWUjV2ek5jT1Uz?=
 =?utf-8?B?MTF2NFQ4V05yS1VrVmFCZFB1MlNYQlRobjJYRkxFS3NrMmFLTDdsZkRRYmtJ?=
 =?utf-8?B?TkFQRE9WMDRTQkRxdFVYWVpObU1EYnJXb2tkNTgwOGFIeFlSWUJUclJpYkth?=
 =?utf-8?B?TWFkSzcwcU4vYmJ3OUxndnowV1pEOXlwcmw2VnVsRUkwUXdRejBqaHphV2ww?=
 =?utf-8?B?VEllallHWEN2Zkd2WUF4MmRNVjM1Q2p0MytPcXdHSEpGSkJCdTNOMFVVSEkv?=
 =?utf-8?B?SjQvSjlpZDNxNm9NNVczcHlaQ1BsK3Y1QXRUSXJWbWp6WXlpZkYrdit6VEtT?=
 =?utf-8?B?R0dlSFdRRlg3RW5yTlltdzUxcERwOS9KbTZFcTByRXRBVUZRZ3R0TnoyVmVp?=
 =?utf-8?B?TE8xZW1xMGJXQnhKTTdqaTQ5Sk5UTXowUi9La0UybWRYQlNqYy92OVlhTDNh?=
 =?utf-8?B?bCtFa0NEWmxOcmkvMHdqL0VZZWg2RDhRdnZPR05NMi9CYko5VXZtMEx2TlZr?=
 =?utf-8?B?bHcwRCtlbEdzcFJuYWFqL1IxWFVXM3J3bGdXdWNqbkpTb040Y3JkRnVzRVFw?=
 =?utf-8?B?dXNra2tpZG5PY3BDYkRiYnN1d2dVTGcycVFjM0lZYkNoSmNLTmcvQVRQcTZm?=
 =?utf-8?B?L216TjB0aFllMDk5WVNZU3NSN0JvYTVIbFVFaGxtRlh0SVVtRFFwTVFtMWUx?=
 =?utf-8?B?VzlIS2JrYUZ2ZnMrZlIzM2E5dWROWXVxa0hWUWh6UEpPdFdicmxDcHo3bFE0?=
 =?utf-8?B?UUE5eDk0T1pJWm10T2V5My9wc28xT1dqME1kWkhyQjRON2JtLzBSRUIzNnBF?=
 =?utf-8?B?WDBpRGMrK29HMUdUbFZhRlpVSzdQSFZuaHMzaXBLY2VsZmtpM1NSdDVuQ2lD?=
 =?utf-8?B?ejBHeTZlUFcxOW1MN2FVbExEekV4ZkxBdmUyZGFVb0E5K09PTXVhbGRLVFcx?=
 =?utf-8?B?ek5NMXMvL2E2NkhJOVZ5Q0o5M2M0OC9Zd3dHMUVBcXRGUmJYSGxndGNvMVFp?=
 =?utf-8?B?d3k2ZmdTOGYvMnpnM2F2K0ludFh6emtVSkhaZFY4WFg1aE9oQnlCT2xlUEps?=
 =?utf-8?B?WnpsWjRJTlMxaU9OSUFqRUlIOUVsWFdsZ2RSb0g3K3J5VkpaNTJjWi9WSFNM?=
 =?utf-8?B?WGdDalFXbkZsa2NkekQ1N3JpejVPaVNEeU8xTFBMNzlMNzhrL01wU3c4cG82?=
 =?utf-8?B?QzQ0RzQ1N3ZGRWRaRjdhYlNndkVPWGtsMkhPczRuVmRSVlVJMUhPNWxrNTVu?=
 =?utf-8?B?ZGZ5dFl0V056d21VWXFJZFMvSWFkSmFGZmU2YnZERFVQcmhXUUZVZUhEQ2ox?=
 =?utf-8?B?WW40ZTRUL2d6UE9GNVJpcE9sTE5BOGdWbTFlQndqc0RkUDVYb0lqMFVhcmVV?=
 =?utf-8?B?NWtORWhtbnduTmpOeUh1ejZwVDJrSVc0eDcyUWEvczg3SjBUeE5BOEIySHlL?=
 =?utf-8?B?T0tRVDA5T1I0ZHRpMzdUUVVtb0hxMGEyTTh3V3NOaitFbmlFN0ZlSnFFL0M4?=
 =?utf-8?B?OGlab1dVUkpVd1pRVXJ2RCtOVi8xU05sdGhMUkNLNnNWSW9qWVVQS3NXaGRx?=
 =?utf-8?Q?eOAWtyZMzU4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG5KY29GOCtmeVF5SHJTOW5tUGlvRExqQmNHVVZkMjRFb0NKTU91cGlGTXVM?=
 =?utf-8?B?VURsRmpMbWI0K2lmRDVPeTl6aFd6aERqNGg4dlZvaGxwMUJ3eGNsN1Q4Q1ZI?=
 =?utf-8?B?alFMamxqZ3p1aUpSVFJ1UC90TVF5WmlrOWN6SDluMXdaQmhicHppZHVIUDRL?=
 =?utf-8?B?dDVQT1oyNkNkS0d3aEkvWVE4bDZlUE40STRqRnJpS2ZZYzBEMnBkbmNDbjJ0?=
 =?utf-8?B?eGNGZ1VoeVZsaG96cklnUTRGN3VoZXEyQVpDS2VEVkpsY0VXZkduSldnanRL?=
 =?utf-8?B?bHZ2bWdUbkZ3bHJoVVVpa0dVOWZHZWgrWE5VWlNzdTQ3V1RvZG5oR05kZGxx?=
 =?utf-8?B?TUdlWWFMOUFmVS80TmVYOTRBS1NyeWE5YlNyNWNFNDhIMDY0eVBLSVQwU0li?=
 =?utf-8?B?NDZka1B6L2lNOGJiY2d6Qzk0ZlExUC8zVmo2R21RT3lEdUwzVHlvU0VsdDRu?=
 =?utf-8?B?TnM1bFFQcVpwN0xCUmNRdXoyOERERzQ2SzVhRzFCYUNQUHJ6NHhuU1ZvSWcx?=
 =?utf-8?B?M2ZUdUNXUTEwVEloNXRvSmlpaWdEY0l6NnowVWtBTlhqVlNCTEdjTmFCSksy?=
 =?utf-8?B?SEp3NVg2ZXA4YjVKYXRnRWJxOW85MHRoMHd3dkVxZmZlODkzMllFNXpJYXoy?=
 =?utf-8?B?aG1NNUdydnRqT0ROYVB3cDJyUktBVmNzUDMxSXdFS0xyc083aU9qVG1WbUVJ?=
 =?utf-8?B?eXNpaUJzSXB0MGhHNWMzQ3FYdjlESDlOem9KbTNweTlGaW9mV21pbE16RkJq?=
 =?utf-8?B?OHlEeUhab0ZXTjR6bFAzRmpCUHN4UUtpVzV6SmZKQ25RQjdJT1VjelFxamRS?=
 =?utf-8?B?VVBZazV4NTdhZEVOMStoZzZtVjg4cXJvdzR6a2J5RXZ1dTdLOWNra3RLT29s?=
 =?utf-8?B?RGU0OVl6M3pTMW5SYjVuQ05HTXVKQ0RKYTVMMHZMazVsbDVpT0t6UVplNEJQ?=
 =?utf-8?B?ZHVXSXI3cklYN3pwcXczUlFWSFVqWHJ2RDdhZXNjMk9LK2ZpNEpKZ2gvcVZO?=
 =?utf-8?B?Ty9ibllVSWJpNlYyd3plU0h6eGJObWVzVFFzU0p6cXJnelBoL1dmRk1nSTU4?=
 =?utf-8?B?Z0k3a3ZDNnRZRllFZy92ejg1ZTduSU5seHM1Sld0czd3ZTdlbHRIaHlHTGZM?=
 =?utf-8?B?UlFaNll4VGErVG5IUWNzUzdpUDRTeEcxTlk5eFoyVFdUS1JiU3lQakdSZUNQ?=
 =?utf-8?B?ODdWODNFQ3RlRUJDY2R2My9EV2hLRjE2MHVKY2s0Ymh5QzZkcjRxKy9OVmZj?=
 =?utf-8?B?ZjRpUzl0MWFrWUcyVUViek03Q3pSUHdQdGxidzRYbXJBU1l2VGpEblFqeU50?=
 =?utf-8?B?U3NQREhxaEI2NXNCclEzbXkrL09HMXdzWml2RmZiYTlaU1pCU1dwUXkydFZu?=
 =?utf-8?B?VVBaZzEzVTB6RXhTZnJqZGNBNytnZG4zdG8wY0g5ZjBvV0E5K3YwS2N1OGRN?=
 =?utf-8?B?M2RQVzk1eHBXSGdZOUw0a1MrNHR3Wlo4T0Ewc0x5NitsVGtjeTg4bi8xSlNO?=
 =?utf-8?B?T2RJY0FhUWZIU004cUlndmIxUTFvYm02TFl0c2xVeEJUWnBkci9lR0s0U0p4?=
 =?utf-8?B?Um1idjBZaXBaZXNSR2N0Z3ErUEVkeGE2Z2xxYjlma25YQlNkUkhiU1Zsdksx?=
 =?utf-8?B?Y1puOGV4RzhYQTBvRHgwWTBqSC9GNlVmNEhXQ2xKVUdzWTMyYXNXbWVHQitG?=
 =?utf-8?B?RWZGck9TQ3YvZHhTcFFSZ2Zab0RLbXkvcVdlYUlHSXEwTnFoUTNxWGdEc1F1?=
 =?utf-8?B?SDN0TGhLck1XVUJ3M2YrOVlUZllhTk84bDNWUWhxcXY3SkF0S255YU4vQkVv?=
 =?utf-8?B?S1BEdnBQK2gxWWRKdDFlVXEyTHdEZ2poMW9xN1k0MlZwS0pjdWt3VWlYL2pn?=
 =?utf-8?B?TVRFczhBMmEzUGxGQnFLZzF1Rmd5TXJBQVJ4T2kxaGY5L29OcHhpSUltZ2Q4?=
 =?utf-8?B?VmRrL3VYSXhEaWRXSkdoTmdIcUNYbVIrNkNMcmxnWWhrZDF4K2JxbU0zRlNB?=
 =?utf-8?B?dmpGL3NWYTNaR2s0andCZHBLb3g0QUtTTmw4dWVrM1R2aURISDBXSXNxeWFt?=
 =?utf-8?B?ZXN4K09PNVBlVG8zYnBGU0RjcjY2eFZsZDFDWW9oUHdnSzgzNUhDaTVmNGRV?=
 =?utf-8?B?WDN0RUEvSGpvSUw3VEVDbWsvZjhpcG1jZ2VQMGsyL0lVMkhZSWkxZndVNHd3?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 798672af-c09a-4201-6d55-08dd6c2aa125
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:10.8089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4FghWw3lKdh9jCaRMToxgd23b7cQpR7i+tQDQeOo5McTkKAVKacbH7ocjOTuUEdGhAeDYCY7zPR325hh6B37w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8116
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

Hi Jani,

Have few queries:
1. Are we going to remove i915_display_capabilities ?
2. Since this new debugfs intel_display_caps, has prefix "intel" whereas 
all other debugfs still has "i915"
Are we going to make this change to other display related debugfs too?

On 25-03-2025 06:38 pm, Jani Nikula wrote:
> Turns out we've added two similar files in kernel. Consolidate on
> intel_display_caps as the more driver independent name.
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   lib/igt_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index 8d259b7344a6..4caad39db7a9 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -56,7 +56,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
>   	dir = igt_debugfs_dir(drmfd);
>   	igt_assert(dir >= 0);
>   
> -	res = igt_debugfs_simple_read(dir, "i915_display_capabilities",
> +	res = igt_debugfs_simple_read(dir, "intel_display_caps",
>   				      buf, sizeof(buf));
>   	close(dir);
>   

