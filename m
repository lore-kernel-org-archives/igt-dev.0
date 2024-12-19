Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D547E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 21:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35E910E2B3;
	Thu, 19 Dec 2024 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ+TXW0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622D10E2B3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734643147; x=1766179147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RMbXiE/6xpf+YBVCdzY2Ho1vtlX/r6BS7GhqbHBqjgA=;
 b=nQ+TXW0lSK6d1tUEGlGkSzRsgoJLCl5qkc1Y74ApKDQQcQ9hIfiheZ+q
 udmBHiYnRItyPY0cLX7j+/UC8CecsvuZ9WsTZ+Ft2nvv2LF8hEQplOCX8
 Q2xa1Vk0sqe08L6NUoxHluU/6ZdFhCo5u++6qWxMiH5Y8QG2Me5yCUabt
 Ym/1CpV5K1hksO4OSiG5j/IWc3Oxfyb/zqAy28oWD0i/dkUqHWsWX6/57
 PCDxtLg6vnA6KXurDxsHXAnrhFUUjawaqAgXAuZehfpsNt//PXDWgdvXq
 dbSfcCEcVYxg1ZFqvdBIG55/x46OFxdwZdlEPj9ri+Uav5ieRWsKFGb2N Q==;
X-CSE-ConnectionGUID: RFllmDS1S+iY7l6uefKDpw==
X-CSE-MsgGUID: IpXNsuRRTBOlxjKbrvex2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35070456"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35070456"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:19:06 -0800
X-CSE-ConnectionGUID: f7fgIFczRsu4YoLKavJKvg==
X-CSE-MsgGUID: xZymnVc6T5SlFCAPd98WOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102927735"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 13:19:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 13:19:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 13:19:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 13:19:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvBUsO9kc52FYKCEzix9RCd24qesjlOR5FT1OCxJW0RC34fcSFnHitU0itFeM/4YrF5MX01Sw2TDDB16GlH1bCzxeSbINpUN0ImqO3gXKDcX4TsFhfH4GkelVY56infPlOkcfKOt2a/qxcpmRmL48mrCZR/FmF7TyI+CcPLIbAnFWyd7VnIVaTFGM0mPrKWm2YoF7L/AMlZb2lcG0ttdx5KlZuPfyn04d/adXNOjSugS3zMqpjbY9p8ch+ZyjbG/ql/KEZaLyZxQ5UAipVQm38R09+rMd8wAxi3FlapNu/53dVvMFaon+NMlUWqpXKy7dInB1eFs0FMeCjJ/148DEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LpynaOpxKlEfQDPt9KlloYHmpBK+p++c8pGOxtXbKk=;
 b=KsmVCc/1wdanEyxFhQuxvIyAjEYEfAKuxGfVkcPXuON2raiK1LxE1ly/84Bz1EUkCcSnK3rScgeC82cMiziawJWEu1lmCDTagFZyzPEZJB69b0s/8R7c8RCf2cYiMcNouvVRiArI3dPjlBCdrcWTBZeKYZjK7lrwI8O9Y2bFeO7tYbLKg7pObeRevBL0qEn8Li7V2sOKBsCCY7kKyp3X+a/TkX3V1wos5Io/jbtDP618vAuGUd5aNN1xhUvOHnDk87gQDqOIg3JUSVo2m4QqvKEweI61lE2KrDhJAR4/mDd8B8nLo5euAVv3dj3mQ1SMxQj2YPZhYPLyHh36G5kV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 21:19:03 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 21:19:03 +0000
Date: Thu, 19 Dec 2024 13:19:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <andi.shyti@intel.com>,
 <krzysztof.karas@intel.com>, <janusz.krzysztofik@intel.com>
Subject: Re: [PATCH I-G-T v5] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <Z2SNxfSA/stYuCbt@orsosgc001>
References: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 60869189-b674-4b00-5b11-08dd2072c343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzdIOWhlcCtDMzh6WGYvOUp2RVZpS2hIRmYwRUszd0hobGdjeUM5SlJWSmRz?=
 =?utf-8?B?NXRyamszMnpzdkJodGtNSXpuTWZJTE10UUtrNFF2TzJJRndULzVBZkRiek9i?=
 =?utf-8?B?dDZZR3pHR2ttdC9qRUtFbDJiVnROZDRyZ3BiVlYyeVo0RlZkUVFKUDFlZ2dC?=
 =?utf-8?B?ZjQyRnMveHk4NzR3b2xMS1ZkUWx4anhhR21xNys4SEtSTjMzRUYrcUt6aDJX?=
 =?utf-8?B?VFZEQjdNd3NJVmVBZmRpZjhDbzNJcWNHamxiTW16ODMxVHQ5czR3VkpIRGxh?=
 =?utf-8?B?ZGFYQWxnVExQUExud0dkdmcrNFN3cE10RDBUQzlhb0dyWSt3QXV2V3V1MTBj?=
 =?utf-8?B?aGE4ei9vL2F3b3NXQnUzRlFlNktNelMzTFpkVWo5aVZOUExLRmpNd0Zta0ZW?=
 =?utf-8?B?Q2dJbDhrS1FZaC9QQVV2L01WaDdmZGMvY1R6cXVrT0FyY1JCLzZTWkJ3eURl?=
 =?utf-8?B?eEx2Yi8ySnljc3dYNUx4VEh0WnFnVkp3NStOdzg3ZmZIS3IrQ3ZNN1pBakpP?=
 =?utf-8?B?ZUVWRUErWWJBYzJPNkdwTERROXVabHk4VzBwTjgrOWl6VUFPOUdhWHBtTjRB?=
 =?utf-8?B?UGwxNm5GWXRyaVZKamtJSW0yR2svQzlUZ0xyZGRZbEZlMjZBY1ZWY25qTFI5?=
 =?utf-8?B?NkRkT0tBaGpuN016ejZWeWdsMWNqYkljNDNkRExONkZoV0FvekpwOHdLOWZn?=
 =?utf-8?B?L1B2NlB0SW5wWkIzakVKOSt5bW9Qc3IveWNnYWZ1cDlCaHFEVU95MVprVncr?=
 =?utf-8?B?bk56Si9LNDY0Snh5UHNicDJTQVBYVnRwTU1kSWhsa01sNFV6VVlpcHFiSGxu?=
 =?utf-8?B?L0t3WnUzcUZjWElQdlZ4OVVCZzFRV2dueGRYY1k4ODN1YmoySVFkb3BSK1Vz?=
 =?utf-8?B?d3ZrQWRRbVk3NDB6QXBtNHN0WWhUM3lGWXBmVTFmSXlmSnVYUndJeWp3c3hq?=
 =?utf-8?B?S0NkcWRuQlVOOTFWaGd0OHpHWUxsanlob1FaYmFZaG03aUFqTk5kZmROSjIw?=
 =?utf-8?B?aWgva0VWcGN0L0pnU0VsOFB6ZVo2UjB3ZzBoVmdMbGt0ZVNQZk1Tbmw3NkUv?=
 =?utf-8?B?YW50ZGQ5Q05kVXBBVmtlYXpxNTBJN2JZayt5Z1FTcFZjRWFhenlHcSs3R3Ey?=
 =?utf-8?B?T09Bdi9yMnpFQUFKNmpjWVJsZThTZVVBcXFKdHdyMWhVcDRXVzAzdkdhRUpD?=
 =?utf-8?B?bGxzd1lhb0VmL25ocmluUVY5WjRkc28wT0wyZ1ZmblBUK3hnb1NwTlVIanNR?=
 =?utf-8?B?QnpZNHNqRG5aUHRMYkwxMDAzcEE4eHVGWjZNYXVERVF1MnpTUksxek1uSlJN?=
 =?utf-8?B?aXhhVE96aW9zd3VQMG1CaEpmSS8yRDU0Q1RGbGp5OW5rRzhnNm13S2xrU2cr?=
 =?utf-8?B?b25FYnZHaG8xNmZ5bG9OVW9RS3MvdDB1Nm83ZFdwN0JKRFYwMHFzL1MyS0tQ?=
 =?utf-8?B?TGoyWjI4dFlvMGtTTXhzdTU1TlIzaGVZcXpYQmFJZGc3b1Z2aHBMdWxYcEdH?=
 =?utf-8?B?dmxFa2Fwd1h0UldRRVd2OG52SWtOb1hsUmRrZDEzVmFIV2Q2RUNjb21rNk12?=
 =?utf-8?B?Q21lMzRaSUZURE5vUDVUZUhscTZ0SU9wMmowWkkxZWpmaFlwb05ramNDckpV?=
 =?utf-8?B?RGdYVlVNMk1leFJRRHdYNm41ZWI4TTBTdjMwQThnREtKMXA2WndjSm9kMUpM?=
 =?utf-8?B?YXlLck5uRjg0Z1ZFajBCZmJ6YXdKZ2xnUTJHVE5WdUFCcUtXVW9FSkpLT0tO?=
 =?utf-8?B?YlJQbG15SmovM0JYQVJxd2h0djR5OG9tVFpVWnd2RmdsTWMxR3VWbVhmWkNE?=
 =?utf-8?B?aUpGV2hERjlYTlFJRVYzL3VxSXFOUkpwR2hrUS9PZGtkSG1hN0xqOUJwTGNN?=
 =?utf-8?Q?tVdIhyML8HqUd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azYzYk5XYXZCWDVvYVN0UDhoZUs5ZkVSWmtNOE9NNDFUaXZBQkprb3plWFEx?=
 =?utf-8?B?cWdVdmIvNlJrUy85ZEMyKzRyNEpEbjg4SkZNVGRFbGxCMU1RTnBVS1EzRWF5?=
 =?utf-8?B?WjhITThMTWFvQ2xXVlZBVUdtYVlhcVNHL05RQ21RN24zUlBqakNpa01zZkNN?=
 =?utf-8?B?RElVVmkzZEQwdHBkaUE2UGJ3b0FaNThGYThwdWVWbEk5ZnZQVnB4SG1XU2h0?=
 =?utf-8?B?YUc0ZWEzWklDN2xEb05HUndWV1hZVGJ1VGhheXNHZCtUdzRvY3R2NDY5ZlNO?=
 =?utf-8?B?NlJBeW1LVEpYYTZuc3A4UzFZUDVDVHJoTXgvQnlSNk9JODZLMmtwdG8yWFh1?=
 =?utf-8?B?ZmtWTHhMWC84SzQrSndwZjFpWk9xUnBHZ0R0TnNjQzJXa1M0em1JcEJweEkw?=
 =?utf-8?B?OFArVHNQQ2h6VXZ0UHpZcEJ3NDNVQUdLaGJUZTI5Y093OEtkNUNlNjhUTTFY?=
 =?utf-8?B?eXFqMndVOFV1ZTVwYWFydWJzTXpvK0s0RlFLcE9UaHRiR3hEQTQycjdkQjQ5?=
 =?utf-8?B?aEFTWFJ6MHkvM2Z4Z0RENVN6d1h6L3NYVjBpL0JkbGtZZGV5UmloZ0RLenZU?=
 =?utf-8?B?UHZkaXU2SlcvOFV3ZFRrSk5lWkVRald0T3VGTHhGUEtiSHZySENja0hTV29J?=
 =?utf-8?B?U2dYWHBoUGVVbFNvc29tV2kvaGtzNkNHNmFQaVcwbXhsVm5WUnpSeU55blpv?=
 =?utf-8?B?QUltZExDaWZ1blhsZWF0a1R0OEtPcGx2NUhBM3pOUlAvOE1HSTZONXZXNmxz?=
 =?utf-8?B?aDVQSzE1VitidUMwK2U0N3I5WDVoT0paZDZVdHEvd29HYnJNeS8vNjBBSDk5?=
 =?utf-8?B?UEJTa1ZXNW5pd3ZkVHlTUmN0UVplQi9KbURnZWVEYnorVWVYTVhPVWJBN3NN?=
 =?utf-8?B?SUt6V3FvNmFvcitTSGl0RjFUeVJWTzE1elBlT1hMNG5ERnIzUWxnRFFvNjNv?=
 =?utf-8?B?ekpKOGlqTmwxTkdaYmJMQkVUdDdmdHE1ZnhweVZBOUdzdHg1MG9YbWpsUlVz?=
 =?utf-8?B?c3libUlIMFgzNVJrRms5amd3VVprR25JRzIvdTN1WGtmbWlRMGp2ZE5PcGgx?=
 =?utf-8?B?bDg0RXFKMEZGOHBQUlJRa1BOOFZmd3hjTXRBNnhGbUo1TXl1YmcvWE9mU2pt?=
 =?utf-8?B?ZjJjOGllOHBMSm9Xb2xtdkttL256OXlienlvS2NuMEtralF0V09haW9LanRH?=
 =?utf-8?B?UC9aMnM2TjM3cUFPeEp4VHRRUmZJZlJxdXZpZWpkK1dZbnp3YVczWlYzRGNt?=
 =?utf-8?B?NmlIOEFzL3c5N1k2aGl4UlZYWnBVeFgrS09xQktxNHMvUURPUjdQY1NCS2ph?=
 =?utf-8?B?dTN4azlnYWZycGRKaDllM2doOTgyblFwVDMyZ1RzbUVCSG1hRDMwYm1DTzRY?=
 =?utf-8?B?RHRJcnFnUDdDRTdISk4xQUVXcTRpMUdkMHc1bzB2NVFGQWpSL3JwZ2E3OFlY?=
 =?utf-8?B?VmYvNStvZWJ1TU9INWFHOERHV3NnU0pvYjdzWU5LVk9kcHpxd1Y5b0ZwVEhp?=
 =?utf-8?B?NDlRNzYwNHJJNFkwVnlNb1RoRmxRWDRsVXJvU0U0bXErL0RiclgvU1ZJNkJW?=
 =?utf-8?B?c0o4eWJxSFo1WjdjNUVsbXk3cGsrRjR2SXVzT3lFQkhGcGVQcDZoNGVEbnQ5?=
 =?utf-8?B?aVJKNTlVd2F3Wkdaa3JJTWxCZGNSdHh3SGJlaVg2QTZzcDFpUXdoSk9tUVVP?=
 =?utf-8?B?Z0FCK3c2NURJRWk3blJ1LzNDYm1abnA4S1VmQ0xuRnRmTWJ3WEdjR1g2TVlL?=
 =?utf-8?B?ZnBKOFdQVmlaOTBSOE93SFBjOG5vejhZc1R0cnR3UURWZitMcHRmSWx0cmQy?=
 =?utf-8?B?bFRFL203N0JaYXd2MitrMFJvZFczalBaeUFMaUdUYW45ZGh4eXdSQ3ROUnMr?=
 =?utf-8?B?QXRtczV2VWRuT3pKZjN0M2JOUVEwNnNER24rV2hzNW5KTmdHNlhqV3NlRjVW?=
 =?utf-8?B?eVplTVhFSDNmRS9YK3dqcEwxMXcvdVJRU1BoMXBjYU5PRElUUjVDcWZjK3RN?=
 =?utf-8?B?WWlHMXd6VEJiZlV1MTl5V1l2TXV5WGFtRVlrdVBGbHRHQUFueGVOMXY2QnVQ?=
 =?utf-8?B?c2J2MmNIMCs0RXNUdHova25zOXZNVC84QlRSVm4vYXNrb3diQmdReHR1Unl2?=
 =?utf-8?B?MHV6L2RERlNQMTJ2OVZqQkJRRS9FRzFvR2lLNW9uYkNXTFkybUdSUzFPTjRn?=
 =?utf-8?Q?FngeBXxlfPshDSiSjp62+dA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60869189-b674-4b00-5b11-08dd2072c343
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:19:03.2592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C02Ea6D3hVIqOtqf50Xe5YYII8HjC7ya6P9WbcVYvLiHb09Mx+zbyMslPavsXU3oSJEen2WHs6gzB2uWxyQz64SjKTfHVIApRibq8OBzJRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
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

On Tue, Dec 17, 2024 at 02:45:53PM +0100, Mikolaj Wasiak wrote:
>On DG2 when RCS engine is active, the CCS engine freezes which leads to
>hangman test failures.
>This patch disables RCS and CCS background spins when testing any engine
>on hangman.
>
>Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
>---
> tests/intel/i915_hangman.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
>index a556eec53..6f1fdc788 100644
>--- a/tests/intel/i915_hangman.c
>+++ b/tests/intel/i915_hangman.c
>@@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
> #define ERR_FENCE_END  3
> #define ERR_FENCE_STAT 4
>
>+static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
>+{
>+	return e->class == I915_ENGINE_CLASS_COMPUTE ||
>+	       e->class == I915_ENGINE_CLASS_RENDER;
>+}
>+
> static void
> test_engine_hang(const intel_ctx_t *ctx,
> 		 const struct intel_execution_engine2 *e, unsigned int flags)
>@@ -388,6 +394,14 @@ test_engine_hang(const intel_ctx_t *ctx,
> 	 */
> 	num_ctx = 0;
> 	for_each_ctx_engine(device, ctx, other) {
>+		/* Due to Wa_14014494547:DG2 we can't run RCS and CCS
>+		 * in parallel. We still want background spin of the
>+		 * same type as hanged spin to be run.
>+		 */

Ideally this should be (IS_DG2 && is_rcs_ccs(e) && is_rcs_ccs(other)), 
but if this is working for you, then

Acked-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>+		if (IS_DG2(intel_get_drm_devid(device)) && 
>is_rcs_ccs(other) &&
>+		    other->class != e->class)
>+			continue;
>+
> 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> 		context_unban(device, local_ctx[num_ctx]->id);
> 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
>-- 
>2.47.1
>
