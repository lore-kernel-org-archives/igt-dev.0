Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE1CC71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 10:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFEB10E5BA;
	Tue, 17 Jun 2025 10:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/bD8Q8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6054510E5CE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750154527; x=1781690527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kFtGcRqdkQ+pO/BPvzLZh0UyffichBbtvcBlCMTD+cY=;
 b=I/bD8Q8tL37OvfOfoTQJOC1BflJUI3/PnVu8IFsUsX0mChQyWrh7W2cO
 lzMsPhIxFgSgkIXP+pzmmqbQa6OuIDLkXfzNMvJN2+z7FaLh+1NPNm0o0
 HvPim51+pux8+Ac90jycW/9SvDqxe35VOdNfpBItmHjWH2smitcWC61CM
 H3bisCbgnxd12lKeAFRYWq31HKbzT7Zcs4nQ/0qPcz/qIglhCWYoTh1fn
 545ikt2LdyCIHHi/gSWbPpZyljiF+5rExXWdTogRXJmEqXcwu/GV14HGW
 0oAbfWofJHBvZp8eAvlefHO6zpUhGuC/msXVUHfKvMaIWEwEYSv02YUJL g==;
X-CSE-ConnectionGUID: GLzvYqSkTZyypduSi82dIw==
X-CSE-MsgGUID: XJ8yuX55R3+FUMPcwTU7Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52458497"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52458497"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:02:07 -0700
X-CSE-ConnectionGUID: JiL/+qJiRYKClh0q4WXfZw==
X-CSE-MsgGUID: KE0uzGESTTeADUNNIA18+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="154031286"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:02:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 03:02:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 03:02:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.54)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 03:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMjj/KWWQVj1DpNcL/15QrKbmEzJkPstAqWOnYTBo2mp5eyqpU57jd4jhQScr+rpSlJFWUFeaT5WCnxQ7K9njgmSedNbSZlNMB1GfGEzGLGE92SvsfulK+c+iLWXyEuz3UKXf35J8e8U9yyyzXYe95YlXjgwBtmBUZUYMlZfeZaA32U3fPIJ9957RZ2F3mUyBVu3YzDOMWfbkoKAsFCyjjo3EEGIE3V+M+zHwQaJqI3HQHjh52aJQLQQxsM4aEy2iV1qft32oO++NCeYAGEOQE1FxG7YqOPmLZU8aIe4zifo65cICza95qk5SgEI4QTjmg+qfZFH3PqoOYBMpBcQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yqgiq8FQoIxP9PCAuVoqkYzX01lMSN9cSsmc5AahmI=;
 b=YOR7ZVttSLdnOjQtbCN3GG/YInV9BRGK4jCvKT7ooQK1FvH/NRC1UmnLHzfN4MiN3aG5Mcxu1oQJ7bL87QpJ1ehaUPemwIRtilekTknNiTGkT8TT3lzKon+6mORM1AAim6aTXvC3xWNri6rmvnU3M+l0SsXPZ9u8qDh+xdeCqifrkMJZ2xrwnMRVXCmT/kxYXDIHTJMKLzHyKj8QLe6Fq9T+WxJL27XYCg+NN+zZLLKNu4veeJ+V4K+C1SvpR/a1USPhBsgMOJAX/9JfCv4f0asOMQmhbGu5qVrL+E411ePZ6UKJWoPN4G0av5TzA7zF5hzpDuk9KBW+kfNHeiI9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:02:00 +0000
Received: from DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e]) by DM3PPFEF920636F.namprd11.prod.outlook.com
 ([fe80::84c:a02c:91a8:f5e%4]) with mapi id 15.20.8769.025; Tue, 17 Jun 2025
 10:02:00 +0000
Message-ID: <8bf65d07-b6b8-47a0-b896-749315824e42@intel.com>
Date: Tue, 17 Jun 2025 15:31:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/5] tests/kms_flip: Increase test duration for
 flip-vs-wf_vblank
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
 <20250616063831.3332042-4-ramanaidu.naladala@intel.com>
 <9c9a4c5f-018e-4895-bba2-6b2a128d53c3@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <9c9a4c5f-018e-4895-bba2-6b2a128d53c3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFEF920636F:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 62da6980-e861-4102-9be7-08ddad860059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1VnRjdFRmJpL3hBakRiZUhRMm41c3JEMzExcDhZenQ3UHphRURMbjduR2JR?=
 =?utf-8?B?NEVaQmxDOGFua0owanBaL2ZBWEd1OFloNEhzRW5uWDRsLzdTR0lJMDRESnBh?=
 =?utf-8?B?RjVrTXlheU5MSGg0dkVaOEhyZHBDd1BIVWpXc1VDZkY1Q3MzQ1N0djFCVlIx?=
 =?utf-8?B?UkJwKzYzYjI3WEJwS0doUU9GbGkvb2JoY0xFMjZkeHBZOXdQM2daZys1NUFR?=
 =?utf-8?B?SnFmeFg1V01LTXNMTDNiUWhVTEtHV3FmU3NZRU5zYzFPcm0xekRjL1VtK3Bs?=
 =?utf-8?B?QkF6Vm0wSzBYUXZsd2RSNXM1U1ROdXpMSTBtZkZHczJaMGE3eWloU2MveVp6?=
 =?utf-8?B?UWQ5alVOaThtaWRDY1NJVUk4a1BQbXRlM3FhUzVFbkg4dENicENtYVFQVlV6?=
 =?utf-8?B?azhzVmFaNFlKYnhGK2I0UDlSa3NpVEwraU13UEpMUlN1NDFQSU01UkUwWlB2?=
 =?utf-8?B?c3lGYjRGM3NzU2gzNEN1bTRnZmZKNnVsNXh5UXEzSm5RQ0xtaE9aOXRublhJ?=
 =?utf-8?B?Z1FOMTdDcWRia0hTMXhiVXFJWUhNSnRXK3d1LzRGOEx4Nnc2K1VoMHBKU3U0?=
 =?utf-8?B?a2xyajNsbXdmVktxVGFVNTVqSHk1dXBSbm9kZ09rYVBKUkZHbHZFRkFJeXpY?=
 =?utf-8?B?MHd5Q2lTM1FkdlRZdWMzQUtnMkowaVVtNno4TUk0bXMxaUR0bUcwYlBQbXFI?=
 =?utf-8?B?WUE0UWh6STNGOFlCRW5qQzRzTnYvSTNTeHMyc3J2T3pIWG9lUUdaV0ZBUXZ4?=
 =?utf-8?B?QmRFRmJBU2RpMDFOazNuVFJyRTQzU0o3TElhcTYrTjQxbmR1ZlVPc3FqbUpI?=
 =?utf-8?B?VzliS05aUlVCQXI5WDR1aFRUVHVTWkdYYlUyYXFxbXJNWm1IbXpvVG5rODVt?=
 =?utf-8?B?WVo4ZUtHOUkycHJzRURadmNBNmpLcVRFeFZBN0tXNXZWWXpaT3ZMRUpwcnph?=
 =?utf-8?B?ckVxSyszemkyK1greEFEQkF1YzJxdjMyaUVXRmxBcm8xcW5WeS8zY1d5MVhC?=
 =?utf-8?B?ZWYzTkRoYnNXNXpLY08zeEtWVGd2MWFQbUZ1T0VXNGtxSlN5SUl4amhTcGpk?=
 =?utf-8?B?T1hEVTcvb0lYM2NKTVJ1aTYzM2s2MXIveW1JQkRaQTU5UUZZNWFOUGtITHNF?=
 =?utf-8?B?M0ZUSDBEMzRnNWZRZmhkYzM3OUpSSGFvVXZDL0hHMkZqWTdPSWNoZmNjdERZ?=
 =?utf-8?B?Z3o3TUtKTUsxVmlDUmZoSWdzYkwxV25CZGxYZTZsUmJwdVVLbWl2dHpKWUJj?=
 =?utf-8?B?TlpLZE9XZlp0U2lnTzNvQklGUWZvNG5hV0VrK1p1NEpJUTBLbU5wSEkwMXMw?=
 =?utf-8?B?QjJpdi80blZUUUZGTXpDQVJqYjhtcmpuVEI4Q0JKSEI0czE0VmtWdVVpTUZT?=
 =?utf-8?B?TVNuMXgyaXZvRjdDRWpVRmR1MG0vOTJHWDdEUUUyT3VKL2tsTHc4TDZzc3NY?=
 =?utf-8?B?eFZmeUZNTmlWSUY0Ky9TUkpScGRjSEtLS0w0UkMyK0JLTytxdkN2VDdJK1kw?=
 =?utf-8?B?Zjl5M01mU2R5c1lkL0dPNzhWeXFxWnRENTRzaGkxRGc2QXY5S3lOR0dPUDlS?=
 =?utf-8?B?dGJxZXRlMW9qVHNkdFpNVDVwR2tpU1BTalB0S1g0M2tXYTdWcHFFOFczKzA1?=
 =?utf-8?B?RHZyOEhCa0s1M2twUmFHaDZCSFNaWEtGUU1Ta3dlSnR6dVJhZEdzNnZTNEJt?=
 =?utf-8?B?N3Y5UHVyOW9jWVgvNUV5cmhrZElzNU9iUUFlVHd2MXJDV2V3NlZQMExrYzBa?=
 =?utf-8?B?cFdSdkE5QlExZ3A4M2FtRm9NL2Z0TS9yeVRPSW0xZ2dwWmdBVm9UUmZucG9R?=
 =?utf-8?B?SlRVK0xOcTk4WDRZa2pxL0d5akV3ODY4ZzJ4YmdmK2pyZk16L2V3bitoNHZj?=
 =?utf-8?B?b1FlTC9IWDlWTDlEeHAzWTFpOTBWTFV4MEtjZitFYXNqeDRuWlZsM1lnL1l6?=
 =?utf-8?Q?NQ2F84upvY8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPFEF920636F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ttOU1UT0tSM3g2NEprdVEvUjdkWHg1UjVnWlU4VGdQTzRDQXVHMlRYdHpN?=
 =?utf-8?B?MkZsM0Z0SE5iMTRLUVFJbDRRZE9NWnNob29yeHM5dHg5ZTc2ejh5enZFUUI5?=
 =?utf-8?B?WkxxZ3lGbGo3cldiWHB6SWtqS3VvcGlsaHlqZjlKeUVtRDJJbDZMZi8rN0Jx?=
 =?utf-8?B?QlFxdXhJWS9QYitlbDFTZk8wRDRMV1RuOGZxWCtpSE5VSFA3aWZtb0RacWJo?=
 =?utf-8?B?QklDMlZOS0NYMkdRZ3c3dDVFWXN2ZnlSWFZVRmFZNXRJVEtISit2UXllMmth?=
 =?utf-8?B?SmRtWmhNWm1qWlpITnY1VGNidTRyTHBGQkp5TjNSYjBka1Q0bnEzTlNZVHMz?=
 =?utf-8?B?dGVYaThoYXRMcnBacEtkaHRtYVN6Y0owZk9VOWRiZkxJYkQ5QmtSamtPTFVE?=
 =?utf-8?B?L2NlQkkraHpvczBKdyttdkxsOUZqZzNwaFAvdUtETlllSlYyOTZZaFYyRjhX?=
 =?utf-8?B?dTQ4T2tDYkdVcExDSnNSRVhYWGxEbElFcnh2RDhNN2NRUTJvQ242WHd4TTlQ?=
 =?utf-8?B?RHJtQXBvckdMK01rSHdGVGxVUnI4TFR0ZFBsN2VLVEpQU1B4YUZJUlZpRHdM?=
 =?utf-8?B?SVdUN1JyTXB5VmNRWjk1ZUxJV21idENaSFdTWVVqWUdzTHplY2ZUTko5Zmtn?=
 =?utf-8?B?Y2ptV2lIR1VjeEh4YTZ5S3ZoWVk1aUdxMXk1ZVRUbWN3cGM1Y2dCaElUT1Bp?=
 =?utf-8?B?RERzSmU4OEdESVBhdDJvMlJlN3lFaG9xV0VEM2kzVlhyclJta0FlU0w4bnRi?=
 =?utf-8?B?OEtEWlZhWjlsUG5EZDdGZ1oyd1RWS0lDVnF6eVZhUlg0enlhOGpKeHVUQWhR?=
 =?utf-8?B?ZEowM3pPMEJ6R1VFZHFQYmhZMkltQ3dtSzVMY0gxNGdERmorM2pVY2FLQ0VR?=
 =?utf-8?B?Tk1KQ2VJcENyaFBkTUQ0SG5IQnZZYzJTR1VRREhkUVFwUlhOM1BMc0w3TXFS?=
 =?utf-8?B?dkdWV29uaExVb2dJeFY4dVFNK0dyUnQyRDZNcmxJRWM3OERpS1BLUWpMUnVU?=
 =?utf-8?B?WFVoWHd4K1FCbVdTVngxN1d3cEtNcEFJbWlKL29zRENac0JpNW9TOWo2RVZM?=
 =?utf-8?B?RGdZY3BJYXFwVnZBbUZ3czlSdVVoT0hpYkxlYWhlaFhFWjNDMCtrU2M4bUEw?=
 =?utf-8?B?MFlzSWNlZFBwVFlNUitqaUZSM05ZajcrQWYrOFpwUjNiYXhmY0duS29DNHpR?=
 =?utf-8?B?RzB6YjhVUTI4OUowTG4rN2UzbkFQVm5uYllRSDlBZ0RCbzV1K21xN2JiSHFq?=
 =?utf-8?B?SFZaUTZSKzBMZ1pUaVZwTGdCcFBPbkE5SCtOWmhEWnpIK0ZqSjJuUDdLMHFz?=
 =?utf-8?B?VVV5dEJjVkp6MVczVG5mdEJvYWRhelcwU0RBUERDeHlvL1ZBQy9RQTZnS2VC?=
 =?utf-8?B?SlpwamdVQzM1UlcwWS84bzlZazFVZUFjQkdSWW1sMnRRc2gyNktrR3Q5cHpZ?=
 =?utf-8?B?YWVvbnRWNHI0VzlmeldFVmlsR0txQ3BIQU1sejZqSGx1NGJjVGlDclNPc2xt?=
 =?utf-8?B?Tk9UZ0JrUERxRys2a3Z1emZhWm1jVnJKWFRtOVZMTVp3TEVWZXNOamtxNGlQ?=
 =?utf-8?B?cHAzNU9VVWRLeGhya2lqbEpXRkFmTTZKemZyTkNCb01DTG5NeFcvTzJsa1ht?=
 =?utf-8?B?VWIrUDJlWm1RVWNxME5NV2tEWm9tNkJrQjRPMC9LR1dUTXRWTkZRU3RKZFo0?=
 =?utf-8?B?N2JQTkVzbTBjdE9OL1JjOHQ3QVF5WUpFNGozcko1Y2pOV2F5dDVYR3doQ1E0?=
 =?utf-8?B?d3Y3RXhHV2JCOTB4aldSTXhWZ2dHZW0vVnlFejVUcEFtS2VMS0FoYzFxOWRs?=
 =?utf-8?B?TXJ0UytYVnIzSWdtdjZ5UmlXVEVSTElyT3BxMGRFYVJmZFBrQUk4VHlwaklq?=
 =?utf-8?B?ZFNSdHVram13ZEU2Y0hhaFI0WWp3T2hKWDczS0xrSkZHUi95T2pTVm80Q3lK?=
 =?utf-8?B?d21kK3NMZ0QzeTJpK0REam11c0NvbjIvZE4rNkZCNllTRWJTVTNmb05GMStz?=
 =?utf-8?B?dnZqWHpWSVpiYkFLVDFzeUZWMFc5eXhiSFA5SXdocEZuZmFYcWZFMi9KTElZ?=
 =?utf-8?B?TVZmaUNEY1VZaStQL09NS1pDVUI0dVI2ekNtMXdGQUpzN215d3puMFIyVWhj?=
 =?utf-8?B?ajFBa0RFUncrTDZnc1NQMloweFNWSkhkSHI3Mi8vVEpSUHovc1d4M29DMU94?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62da6980-e861-4102-9be7-08ddad860059
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFEF920636F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:02:00.2884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgnOMhMxx9YYZBUwPD/8yHD3tg3jBa2wBYPPDdvU4aUEDYo6LKh9Th+uGDOC9bJXNF+sU1cJ4p/EeuKmkX2v52c4tuZUCrq0DxOMV1w5LOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
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

Hi Karthik,

On 6/17/2025 9:16 AM, Karthik B S wrote:
> Hi,
>
> On 6/16/2025 12:08 PM, Naladala Ramanaidu wrote:
>> Boost testing and coverage for lower refresh rate panels.
>
> Could we add more justification here? Are we doing this because we're 
> now adding the some buffer/tolerance to the flip pass rate and so we 
> need a larger sample size?
>
> Thanks,
> Karthik.B.S 
I thought it would be correct if there were more samples, but there is 
no need for time change. I will remove this patch.
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_flip.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>> index 2328259ba..5873591fa 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -2026,7 +2026,7 @@ igt_main_args("e", NULL, help_str, opt_handler, 
>> NULL)
>>             { 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_ABSOLUTE |
>>                 TEST_CHECK_TS, "flip-vs-absolute-wf_vblank" },
>> -        { 2, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
>> +        { 30, TEST_FLIP | TEST_VBLANK | TEST_CHECK_TS | TEST_BASIC,
>>                       "flip-vs-wf_vblank" },
>>           { 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
>>               TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
