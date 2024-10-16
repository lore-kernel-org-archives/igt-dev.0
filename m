Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4D1D2A53F
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 19:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F7A10E753;
	Wed, 16 Oct 2024 19:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DH9izxSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE4710E753
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729105730; x=1760641730;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8//xmwkbZI0U2psZsy/AzSEJN1toTyzMVFiRWPEoCBE=;
 b=DH9izxSRi7A2R+82plq2m1SdAzV4SKTLVzq26DZP/lXlthUNtGNATu7j
 tmw1fzQmYT60blpIZRkaNv3CrLwnPmAU32wmDidCvT7S2aWz2z6Re3Gth
 uxTx1eoNYYwq3DpYeXxVwm5S8v4QvpaJfwZs5yzG5CBTTsbhTitPNPfl3
 asaroyNSwFTTzemwefAJTns2VplelcfIALd5H6tc9fq6lNe5oxXyOzFSr
 5ZcDeNzPLaV91u5LSpF8pLRcSZmiDVi/GTPGCX40vGpIpBEvh3NQg8vLX
 xjeh5FIoseqJp1vd9CX7sLl5LYnHabYYD9rh9pznaD/ErRXVSp6Cg6cYv g==;
X-CSE-ConnectionGUID: ANc/845RRpmsPKbCxZtdiA==
X-CSE-MsgGUID: R4YtvKtFRGygSZpGbeKfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28013446"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="28013446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 12:08:49 -0700
X-CSE-ConnectionGUID: Z6+BSxTkTDuexPYSpMpbig==
X-CSE-MsgGUID: hYzpyWkWSeCrPFCVQrXp9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78761416"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 12:08:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 12:08:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 12:08:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 12:08:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 12:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThYQe3Q27SwonIhYWjfaSgHhTRPJA2cqNjq6NevXjKyzbLdYtirriY0w0tpZSSVBrS2CwbAMcN4nFC1AnK2MHFAeqDwJlsVeLRtNuTeGQc+olhSvAvAvOXCLXIetIv0fp/O+QWNdt5Hr2IIyuxUf1t/tk2MnVxbgX2nFaBTyeNKMy1zm9H1hPSLLB3rc06Mj5Q3ef5ozIH5e7yhHhQCtN2uFFdGOQmnYlrU5nymHibkvm82EUNIiDq2PQhhU17XB9o4HldfFt/Kj3wgKgX/Lva1sy0xCqtOT7+8w1JOau44OtitfKg8f8I/tUafQp5X1QaV2cbNhKqAddlQAt5klrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwYHQqME830ibOMeIS1IhU+zByBHoLqvDUL7VJuLkRw=;
 b=C9gdkjyd1D0pXbkWwFQMz/stkDOGSaNkd5qzS7m3B4PoXC/EwwF9pMGjHVr7Meq7nPMqYPUUasX+YAoMTOpZTNCSmDFzgFy6SFVcvhirFSSNm3SEgcywG9TmLPHSuOhiKVpqY/MJpG54eOEa/ZsCmLvv3GuqkAvPuDKx6ljeHcA/SyMI4noyEi6NymcUCec2t5wEZrcTJAcytsRf3qmjmD6MMZj67VJk+8cGJ3aiIMb3yZ6Dq08UKCHWjvTX7n9Ow6a1jwMrN8nT2IDlHGwO/ClwTpc9Ai7hCL0WFfe8Tn2og+I0qK+KY9zwsn/1d5FTrjWbTQmgucEh6Oavy2mDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB8091.namprd11.prod.outlook.com (2603:10b6:8:182::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 19:08:37 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 19:08:36 +0000
Message-ID: <9c08f66b-6852-41f8-9ef3-55a09fed4470@intel.com>
Date: Wed, 16 Oct 2024 15:08:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241015153101.4114544-1-zhanjun.dong@intel.com>
 <20241015153101.4114544-2-zhanjun.dong@intel.com>
 <1800328e-83f5-49da-bcd4-c37ec692fbc0@linux.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <1800328e-83f5-49da-bcd4-c37ec692fbc0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: a47ced31-a44b-4454-e018-08dcee15efc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU1FKzlkWFN6M3BFVUJHbWpTUVJhWG55enNHVWEyYzV4bjBxNnFJQkxPL3Y5?=
 =?utf-8?B?eEpoa0YvWFJ6N2pqL1haOWJyZHpxTnRCRG10YXVPeThXY2VuNjU5OWZHOVNU?=
 =?utf-8?B?YWJKUXZyYjJaYmlwZGNWNFc2bzFxdS83amRDcmhNN3FaanhBK2V5elBUdk43?=
 =?utf-8?B?QjAvRU5RVkJLNzhRSmRBeDI3YktibFJiTGVhWVZzOUdtZCtQTkhIT1ptSEpo?=
 =?utf-8?B?RUlkR21hOWIvQi9sbFU1b0JDajQyaDVWcVdkaG9jQ0NUc3JKeEFVdjAvb1BE?=
 =?utf-8?B?dTZJQ2ZwSGxEK3FsYk03L09PZ2VLUHZDdnZUQXJJdzE0NittM0ovcTJ2aXVi?=
 =?utf-8?B?K0pVYU1PU0tUU0Z2cGkvTXI2VFVNeFlFZ2hoWk82OG0vRzU1K3FBOE1XdFh2?=
 =?utf-8?B?dW5VWU54OHg2OTVvZzUvUDlxejEvZXViWG1sNjBKQTJoMlJGL1RVUzFoMjcz?=
 =?utf-8?B?b0RnS3p3WVBnZnptUndRZ1dlMlE4U2JiRGw4dmZhazdkNXFZbXQ0dm8zZ1hy?=
 =?utf-8?B?eWk0bEFzdm1yeFZDREtUTzBuTU5PVmh2UlF6MXBwV01OMjNmdjBZMVIyNDdI?=
 =?utf-8?B?dU42S1pSUHA3aUdXaEZWWkVjLy9mSk1GY0NySEIxektOaEJjNHI3WDk0VTBO?=
 =?utf-8?B?M2thVUNybFJUL1ZKM1VKSHVKb2VHbUJVMXR4WGIxeHhVU2ZvZllCbURONHpT?=
 =?utf-8?B?YXB0cEU4dU5ick9QV2Y0c05iUXAzeWM2bG1zWUx4TkN6ZXV1c3A2Z1ZHUHZJ?=
 =?utf-8?B?b2NUdHdSS2FQQ3hPZy9NVkVOQkZMcmZHYVg2S2RmVTdYQUtRNncwcy9BU3Fn?=
 =?utf-8?B?clduRVNYbEVtck8zM3o5eXdNVDJ1Nlk5djhDYWFNYjJBVkxDWkdpUlJ2QTV1?=
 =?utf-8?B?M2w2d2FiUjJaaFh6MXdXdkRER3h2ZmV5S0ZFUjZxWHBveE81SWVQeEdwUjI2?=
 =?utf-8?B?Q0t6OTJVR1Y1ZDdJVXFYMUZXTWVxcWdOT0NVdnhZTURkK01KV0R2UVJEaUR4?=
 =?utf-8?B?L3NJYklqeksyRzJvb09peHZvcWp1RXZxMzV4QWFhSGxLa0JGcVRnNVkxUW9i?=
 =?utf-8?B?b3QrTG5PT3pUd0U5LzZwaEhtdkVpd2UyVTJrem42SmJwUUpoaDArZnN5OUpt?=
 =?utf-8?B?SmF3SVZYNDhEQnVLTDdKN3JTb01YM2RCazVldmFzVUJFM3VZZndOSHBlQ3Yw?=
 =?utf-8?B?ZlBPRy9zTUNMdCtPSXk0QTd4cWJnMXhGMzJjaHAwWCtxT3Awa0drM1p5VGpP?=
 =?utf-8?B?V2N4eTl3aENPZHM2QVp2alJEVTN3eE01UjRzZnlNUExKSUNMWW1PR0J0Q3pB?=
 =?utf-8?B?T1lNUFVxaUsrekRzTVcyOTlEb25yRmkzZzBodkpWU3JjTVRJMnJFK0ZlQS9Y?=
 =?utf-8?B?bEtubUJ5Sjl2VTRnNUtzWWc0S1o2SHJUSm4xNnd3bVdTT3FZOVpoc0kveGVp?=
 =?utf-8?B?c1dER1A5NHFTdFpBWmhmT0FaK3RIK1kwYWQ3NlBJa3RRUWJZNTV6SCtLT3Nz?=
 =?utf-8?B?MUtaYmEvQldQZkV2azNpcmxGTG1EeHBZQU1iaFFSVXJVaFRvNW15Q0c3blcx?=
 =?utf-8?B?S0NaSUt5V01EZ09TRXRyUk8vWDZkR1dlNW9DWEk1OG00Q0RtU2ZrUEVVSmxX?=
 =?utf-8?B?V0pBcGhza3hKRndHY3BWaXF3QWNwYnpscnNJcExmbHhkdjFSdTI2Ri9UMHBz?=
 =?utf-8?B?UWZpcGtob0VjQ3daRVgvN3VEZjVKRnBXYUJjMDMvdDMzVDZtSXZqTldRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0VEUE9PTnFHK2hBajRKOU9qRkpmUFRBa05nMWZFd3V3QzhSa1c5WVd4THh0?=
 =?utf-8?B?YmZZU0l4MWowT2tSTGRsT0dWc1pZbWliZ21DVXZGam80MDRzL1dIQ1ZCNEV0?=
 =?utf-8?B?V1dIMGtTY0taVUoxNXhoRFVDTjgzcEVndDFKVjFDUmVwVWM3dEpaVEpzaGRF?=
 =?utf-8?B?cytRMnBiODZpRzhPZ29PdElycHVpR0d6WlgrSUE2cUxIZHNXSWZtVkU0d056?=
 =?utf-8?B?SURMVXhXaWFCZ0dtdDhhMzZ6dWZGUHhKcjd0ZHNEVk1JYnRTVFZTSWhZYkp2?=
 =?utf-8?B?TWk3N2lySlBHd0paU2diT1ZMU3djNGN6RG5rbVNuRThwYzlFMzQ4ZjlQVHZN?=
 =?utf-8?B?aDZnMnFSUkpYUDkrdmhBZGRGT1lPL0lTTGpESWRIdzNHQ003Mk0xMXlRblh4?=
 =?utf-8?B?eUNoNmVBdjlmQ2laajZ4OGxtbFhWMDlZd1RpcVNjcFg0cUQ1YnQrMnBpajNt?=
 =?utf-8?B?QUdOL2FlT2tjN3hEWHQwUzZPSXl0TWJsQXJ3VjJhRHJ4a2gxVmloVHpGRGRx?=
 =?utf-8?B?NHJOdURVQ2Y0ZW9LTGxScXl0bVZkdnB4RzEyRE9yeVF2MW82UUNHTzNqYVdm?=
 =?utf-8?B?M3NsZWtCS1dzdENGaTdQWkdYbWJOWE0wTWt1RE53Y2NQN2tPRUh1aTMrUWdC?=
 =?utf-8?B?bTNkclJ0emVkWHlLRDdCWXJ3b1lGcFJOQ2lzMkhBeUtkWU1uZlE5SC91VTlh?=
 =?utf-8?B?UVBjSUdHNS9kVStlVW5PUzUyYkc4cDdoOFBZZ1Q5bWFVYnI0dXl2WVdoVTNY?=
 =?utf-8?B?emtKTEpvQ1FHR3VQb28zOEpzT1hPMWNSaklzME53c0pVK2RNdmZ6bk0zaDZU?=
 =?utf-8?B?Z3J2OGF4eFg5K0VzSTBqQVVDdGRKNzBaMURwSzlGMGVyN3lObVYyVjF3enln?=
 =?utf-8?B?bW5LNUwxL1hrL2dVQndmWjhPcHFWdCtncE1vdlJaVG12TzlOYThwNmxoZVo2?=
 =?utf-8?B?RTVDOStzTDJOeVN1SzJpczc1eHo0bWtrVlZkSFJ6OXUvd0hnKzgwNnRlUkpt?=
 =?utf-8?B?NEgrL1I1Y2lwZlU1ckxESTIreVpqTVM4QTVhZ212K2pnSGgwQndLR0d0eTBw?=
 =?utf-8?B?Q0dlVU0xNzBNdzBDRFpUQi9vMzIvQnNZVWRscTV6SlpXV2toOE8yQmczQUJl?=
 =?utf-8?B?WmRoc25VbDlUSnBTdjVSZVQ4ejlZQ05ISjZzbXZtdEpUTThNV1FDTWZEMUtU?=
 =?utf-8?B?dkYzZ0JjUHB4blNrNXlLOFVha0RrZ0hzeTE1TUFpQWhsQnVkV3BTNGltbVpW?=
 =?utf-8?B?WU8zbi82V1UwK05CbU92WCt6MVZzNEFpR1pUNnFvN1IvZW55OTdMQlhQcnE4?=
 =?utf-8?B?azJUU09VcHg4am5LOTN6ZURXVlQ0THZjQ2Z5d1VNQTdFbDYyWlpjbUlkd1Fm?=
 =?utf-8?B?OXRhRlJiNkNheEFmVk9oOWdkaitCcnNQZW84c0lSMTZZYXZLb0hyeVBoWWsy?=
 =?utf-8?B?cVg4YmJTSjZuUWJzM2toMkp1RGJUSEQ0NnNQeE5VQ1JNQVJCeTRSV0RPdHNF?=
 =?utf-8?B?YkZrcnd6dkpWcUc1bCtDVDltK2FLQ2JFYzc2UHppSTBqVDhwaThLUG8rakF3?=
 =?utf-8?B?YWRRSVhPS1VhQjZVbytWWmVLankvTElMUWtHL1A1NjJQMUJzTmRlME9qU0dC?=
 =?utf-8?B?UnErZCsySnE1Mk1FRkNKYXordzU5cUh4Vm43Qk9ib2ZUNiszZTI4V2tlblpW?=
 =?utf-8?B?SWI4ZDZ4bTJnS1hhNkVRSUY4OExwYUtRdXhtR1hWN3gwVEZHS04zTGRyNHhQ?=
 =?utf-8?B?SURRUy9IZGRyYTIwb21obmpxTnhpVlFWRTlDeWVudjlIWGVFMHpRYkNjUmxz?=
 =?utf-8?B?RzN1ek5CdFM2eFBNQ2ZlUzFmRVBLMHMvUFdJTklEaFpmNTFyK2pmaUljdzdr?=
 =?utf-8?B?MEZ4Q2IxU3gwb0tEZ2QwWGoxeWpyaHRNY1l0RG5ZYU4xYjNuY2hiYXpwVURi?=
 =?utf-8?B?K09sN0xKc3FMVlNvV2hvMUIyTGlleEY5ay9ycFUzbTR1czNpOE5nYUJzOTFS?=
 =?utf-8?B?cVFOc2NWRGQvNGZoSHpFbTVKS0M4UWYwN0M3QnFWY1QwN0RtMy9RSGx5c1JD?=
 =?utf-8?B?WmUrWlJON0YrQTYrNklWaUdEd0owWUNiaUFIcmprelV3MVJ1c2M0UW9iMVJa?=
 =?utf-8?B?Q0ZDQVRzZXNFaHJGQ0txTmxybE5HbVY0SGtoMFJkMitjS1g1cUhRUGY3NDhQ?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a47ced31-a44b-4454-e018-08dcee15efc1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 19:08:36.5475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lR+HBXl934mJcfQZ6ObFSuVvpPsx4zpBQLOsp27xnxTuSllV4Tadr2m1LHZha6Gihc26kYoYyxGVcQe0O+X/yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8091
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

Thanks for review, please see my comments below.

Regards,
Zhanjun Dong

On 2024-10-16 1:29 a.m., Peter Senna Tschudin wrote:
> Dear Zhanjun Dong,
> 
> Thank you for the patch! Please see my comments bellow.
> 
> On 15.10.2024 17:31, Zhanjun Dong wrote:
>> Test with GuC reset, check if devcoredump register dump is within the
>> range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_exec_capture.c | 308 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 309 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..89b544c93
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,308 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <stdio.h>
>> +#include <regex.h>
>> +
>> +#include "igt.h"
>> +#include "igt_device.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES		16
>> +#define MAX_INSTANCE			9
>> +#define GT_RESET			(0x1 << 0)
>> +#define CLOSE_FD			(0x1 << 1)
>> +#define CLOSE_EXEC_QUEUES		(0x1 << 2)
>> +#define VIRTUAL				(0x1 << 3)
>> +#define PARALLEL			(0x1 << 4)
>> +#define CAT_ERROR			(0x1 << 5)
>> +
>> +#define BASE_ADDRESS			0x1a0000
>> +/* Batch buffer element count, in number of dwords(uint32_t) */
>> +#define BATCH_DW_COUNT			16
>> +
>> +#define MAX_PATH_NAME_LEN		512
>> +#define MAX_LINES			512
>> +#define MAX_LINE_LEN			1024
>> +
>> +#define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
>> +#define START_TAG			"**** Job ****"
>> +#define REGEX_KEY_VALUE_PAIR		"^[ \t]*([^:]+):[ \t]*([^ \t]+)[ \t]*$"
>> +#define REGEX_KEY_INDEX			1
>> +#define REGEX_VALUE_INDEX		2
>> +#define REGEX_KEY_VALUE_MATCH_COUNT	3
>> +
>> +int card_id;
> 
> If I am not mistaken, there are cases in which we have more than one card, and that we want to test more than one card. So I guess the logic does not work if card_id is global. I prefer not using global variables.
Good point, for more than 1 card condition, the card_id is expected to 
be changed when testing on next card, this patch only set it at 
beginning, need an solution to support multiple cards
> 
>> +regex_t regex;
>> +char lines[MAX_LINES][MAX_LINE_LEN];
> 
> Can you rewrite and not use global variables? regex could live on igt_main().
Ok, not a problem.
> 
>> +
>> +static bool access_devcoredump(bool load_file)
>> +{
>> +	FILE *fd;
>> +	char path[MAX_PATH_NAME_LEN];
>> +
>> +	sprintf(path, DUMP_PATH, card_id);
>> +	fd = fopen(path, "r");
>> +	if (!fd) {
>> +		igt_debug("Devcoredump not exist.\n");
>> +		return false;
>> +	}
>> +	igt_debug("Devcoredump found: %s\n", path);
>> +
>> +	/* Clear memory before load file */
>> +	if (load_file) {
>> +		int i = 0;
>> +		bool found = false;
>> +
>> +		memset(lines, 0, sizeof(lines));
>> +		while (!feof(fd)) {
>> +			fgets(lines[i], MAX_LINE_LEN, fd);
>> +
>> +			/* Only save lines after start tag */
>> +			if (!found)
>> +				found = strstr(lines[0], START_TAG);
> i instead of 0? found = strstr(lines[i], START_TAG); ?
It is designed to use lines[0] as buffer to load single line and search 
for START_TAG, only save lines after start tag.

 From other review comments, load all contents is also not a bad ideal, 
so this part might be changed
> 
>> +			else
>> +				if (++i >= MAX_LINES)
>> +					break;
>> +		}
>> +	}
>> +
>> +	fclose(fd);
>> +	return true;
>> +}
>> +
>> +static void rm_devcoredump(void)
>> +{
>> +	char path[MAX_PATH_NAME_LEN];
>> +	int fd;
>> +
>> +	igt_debug("Clearing devcoredump.\n");
>> +
>> +	sprintf(path, DUMP_PATH, card_id);
>> +	fd = open(path, O_WRONLY);
>> +	if (fd != -1) {
>> +		write(fd, "0", 1);
>> +		close(fd);
>> +	}
>> +}
>> +
>> +static char *get_coredump_item(const char *tag)
>> +{
>> +	int i;
>> +	regmatch_t match[REGEX_KEY_VALUE_MATCH_COUNT];
>> +
>> +	for (i = 0; i < MAX_LINES && lines[i][0]; i++) {
>> +		char *line = lines[i];
>> +
>> +		/* Skip lines without tag */
>> +		if (!strstr(line, tag))
>> +			continue;
>> +
>> +		if (regexec(&regex, line, REGEX_KEY_VALUE_MATCH_COUNT, match, 0) == 0) {
>> +			char *key, *value;
>> +
>> +			key = &line[match[REGEX_KEY_INDEX].rm_so];
>> +			line[match[REGEX_KEY_INDEX].rm_eo] = '\0';
>> +			value = &line[match[REGEX_VALUE_INDEX].rm_so];
>> +			line[match[REGEX_VALUE_INDEX].rm_eo] = '\0';
>> +
>> +			if (strcmp(tag, key) == 0)
>> +				return value;
>> +			/* if key != tag,  continue */
> Can remove or expand the comment?
> 
Will changed to
/* if key != tag,  keep searching and loop to next line */
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void check_capture_output(const char *tag, uint64_t addr_lo, uint64_t addr_hi)
>> +{
>> +	uint64_t result;
>> +	char *output;
>> +
>> +	igt_assert(output = get_coredump_item(tag));
>> +	result = strtol(output, NULL, 16);
> strtoull() ?
yes, u64 need this
> 
>> +	igt_debug("Compare %s: %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
> 0x%llX ?
yes
> 
>> +	igt_assert((addr_lo <= result) && (result <= addr_hi));
>> +}
>> +
>> +static void check_capture_output_str(const char *tag, const char *target)
>> +{
>> +	char *output;
>> +
>> +	igt_assert(output = get_coredump_item(tag));
>> +	igt_debug("Compare %s: '%s' vs '%s'\n", tag, output, target);
>> +	igt_assert(!strcmp(output, target));
>> +}
>> +
>> +static void check_capture_out(uint64_t base_addr, uint64_t length)
>> +{
>> +	/* assert devcoredump created */
>> +	assert(access_devcoredump(true));
>> +
>> +	check_capture_output_str("Capture_source", "GuC");
>> +	check_capture_output("ACTHD", base_addr, base_addr +  length);
>> +	check_capture_output("RING_BBADDR", base_addr, base_addr + length);
>> +
>> +	/* clear devcoredump */
>> +	rm_devcoredump();
>> +	sleep(1);
>> +	/* Assert devcoredump removed */
>> +	assert(!access_devcoredump(false));
>> +}
>> +
>> +/**
>> + * SUBTEST: close-fd
>> + * Description: Test close fd, check if devcoredump register dump is within the
>> + */
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> +		 int n_exec_queues, int n_execs, unsigned int flags)
>> +{
>> +	uint32_t vm;
>> +	const uint64_t addr = BASE_ADDRESS;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t exec_queues[MAX_N_EXECQUEUES];
>> +	uint32_t syncobjs[MAX_N_EXECQUEUES];
>> +	size_t bo_size;
>> +	uint32_t bo = 0;
>> +	struct {
>> +		struct xe_spin spin;
>> +		uint32_t batch[BATCH_DW_COUNT];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>> +	int i, b;
>> +
>> +	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> +
>> +	if (flags & CLOSE_FD)
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	bo_size = sizeof(*data) * n_execs;
>> +	bo_size = xe_bb_size(fd, bo_size);
>> +
>> +	bo = xe_bo_create(fd, vm, bo_size,
>> +			  vram_if_possible(fd, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	data = xe_bo_map(fd, bo, bo_size);
>> +
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +		syncobjs[i] = syncobj_create(fd, 0);
>> +	};
>> +
>> +	sync[0].handle = syncobj_create(fd, 0);
>> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +	for (i = 0; i < n_execs; i++) {
>> +		uint64_t base_addr = addr;
>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>> +		uint64_t batch_addr = base_addr + batch_offset;
>> +		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>> +		uint64_t sdi_addr = base_addr + sdi_offset;
>> +		uint64_t exec_addr;
>> +		int e = i % n_exec_queues;
>> +
>> +		if (!i) {
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>> +		} else {
>> +			b = 0;
>> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +			data[i].batch[b++] = sdi_addr;
>> +			data[i].batch[b++] = sdi_addr >> 32;
>> +			data[i].batch[b++] = 0xc0ffee;
>> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +			exec_addr = batch_addr;
>> +		}
>> +
>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].handle = syncobjs[e];
>> +
>> +		exec.exec_queue_id = exec_queues[e];
>> +		exec.address = exec_addr;
>> +		if (e != i)
>> +			syncobj_reset(fd, &syncobjs[e], 1);
>> +		xe_exec(fd, &exec);
>> +	}
>> +
>> +	for (i = 0; i < n_exec_queues && n_execs; i++)
>> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +					NULL));
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	syncobj_destroy(fd, sync[0].handle);
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		syncobj_destroy(fd, syncobjs[i]);
>> +		xe_exec_queue_destroy(fd, exec_queues[i]);
>> +	}
>> +
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +igt_main
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		card_id = igt_device_get_card_index(fd);
>> +
>> +		regcomp(&regex, REGEX_KEY_VALUE_PAIR, REG_EXTENDED | REG_NEWLINE);
>> +	}
>> +
>> +	igt_subtest("close-fd")
>> +		xe_for_each_engine(fd, hwe) {
>> +			igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>> +				  hwe->engine_instance);
>> +
>> +			test_legacy_mode(fd, hwe, 1, 1, 0);
>> +			check_capture_out(BASE_ADDRESS, sizeof(uint32_t) * BATCH_DW_COUNT);
>> +		}
>> +
>> +	igt_fixture {
>> +		drm_close_driver(fd);
>> +		regfree(&regex);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2d8cb87d5..b724a7c6d 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -284,6 +284,7 @@ intel_xe_progs = [
>>   	'xe_exec_atomic',
>>   	'xe_exec_balancer',
>>   	'xe_exec_basic',
>> +	'xe_exec_capture',
>>   	'xe_exec_compute_mode',
>>   	'xe_exec_fault_mode',
>>   	'xe_exec_mix_modes',
> 
