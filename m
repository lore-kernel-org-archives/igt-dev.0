Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B5E65D2F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8620610EAF7;
	Fri, 22 Nov 2024 08:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npXwjF4M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5190A10EAF7
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732263702; x=1763799702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HuvDqpJNNr+avBv6miLlsUu1lMJBE+ihYfgLF9/gVM8=;
 b=npXwjF4M1iIBF4cj+mxfh/qznjFODvElTo82CzsrLprnMLpF/89q2xfQ
 I0U/zxTs8buHmNvnXBE4os34cZQJ5E/4lxm+YS2zKMpwuvaIdCR3NbJUm
 DtHbSLjz0teJth2RzLcbGxJSX3ygObbhRj7wRGqkSK6ODlD7btQ4v0bke
 ZkL36nFBfaPDbQ20v1Qa45RpLgeD2tAcucEcI6AaIffNZIl5DN6swBoSh
 S+p+XSQ4hz86ybS1bM45EcPfFLErOpOppdTSn9I3WeR6paHShIBspCS5o
 fImmlo9CWGs75lWm/KVzGXP+RZa66o43e9Q2hzBR9DkB5unwcmq7PULYE w==;
X-CSE-ConnectionGUID: O6rTUqLASXCiGKDJUHlk1g==
X-CSE-MsgGUID: 0sP0JEJXTQ2Iq0tN9oO/+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32342227"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32342227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:21:42 -0800
X-CSE-ConnectionGUID: Lo7ejTrOSMm3ozj7qwNnVg==
X-CSE-MsgGUID: bc7bdhVNTX6ICYIWHAMQDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="121376796"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 00:21:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 00:21:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 00:21:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 00:21:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYEtzV/Rpy7K4qag2k9S9yqTLJMS/rCxcrzX6h8mistT2uCxAciS/dxBt6PCE+pjxaVsdQ4r54WQV0TVJy6QwcG0zs6gt3ZNZMPighe3YXNFeBvhMVI+qPAy5Jhz1O0HJ7VlBlGjRJj7M/K1jHM9lFHC1rdn6Ju08HlcHStmUdZ2DVpG+A43dazcWBGwXJK5pqROBCNkT+WoC8N5LVBIb1y5xCkKti4rVKMBij41VAj/BOYavjBvc6jy1NQaM9maiG5/80oaSd7J/f3v3/ZjBqnDSOB6dR84Zw/TurKXgLjDq2YQFK1YcQ2y330Fe4KkHogTNwVVjI6yLcyJIyB3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDGi+hlxnk8Pt/rEAwDQo0Mvp96Rrk14RLpVeluijXA=;
 b=KPhTKzGw0DT3NxHeS6gYIZ0QcWkrIdDNNZFRDc19KK8x9gd99BaXMxcLQYQiZKifKx1DA3NDzLJuIiElyTX+EtUc/wKj+5t5zv8t3fA2dIrK0Q6fnArdo5OpU/nprOb9Thn3dAjyGhgGFS8Oi1gTQkGcxQUeMy5zNo63AK3NmGovmORZa0Zbw2IvziLYSn1/Jcvfl3IsemdR1x9w+6mIIDOa979zyQuwt6oW+809HKu6veg6urKtji2Xonw9kDpT8t5UTsMsWXhEatYeD6bVB9bVO0CzkytEPDQu36vV8X6xoIFpynnHfQsOQd/y/3lI1aV4tX8GNIGsUulrz7Qd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.22; Fri, 22 Nov 2024 08:21:33 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 08:21:33 +0000
Message-ID: <dcd791b0-72d9-4209-a992-ce159290263c@intel.com>
Date: Fri, 22 Nov 2024 10:21:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_eudebug_online: Add
 read/write pagefault online tests
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <andrzej.hajda@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-5-gwan-gyeong.mun@intel.com>
 <5d6d89aa-8bd7-407a-ab68-351c7ce87bcf@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <5d6d89aa-8bd7-407a-ab68-351c7ce87bcf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA1PR11MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 10607d9d-5362-46cd-700b-08dd0aceac74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cldsZ2tQcWkvZ3VsTHZ2QVpYU1Q0NDVJOE5HdHZFL29kTEhyOTlnN0dKQTlW?=
 =?utf-8?B?ZTVwSkFVVGZCMEcwZU9Ob0I3MEZoVlUwMXY5SmlobHhxelhMR284V1F0U0Q0?=
 =?utf-8?B?bkkrcVk1MHZ1YkM4TTAwYWpId0NNYlhPTU5ENDJIZ05TMnlMMVNPUjhKdTRZ?=
 =?utf-8?B?UWs4R0sydVo1cVN0ZU40bXZxalFYRG5reUZWWTVWVTcvK1dsUGFCc1N0NXFu?=
 =?utf-8?B?Q2dCdzIzM1l0Y09ZRTU2THhjUHd3RW42WksvRzJyVXFNc1JBZThHZjR3bmZD?=
 =?utf-8?B?Z3hGVGhmTVlzWlA5b0FOOGg3R3JKdkR3M3I4U000Z2JiN1BEZ0hDSkhsdmRG?=
 =?utf-8?B?WmNmZStyWC9vUXcrZElLS3VXZHhQelFrK25RRjZxQmdxd1BCZGtKWXV0amNq?=
 =?utf-8?B?UnlReFQycWhkZm5DbWE2amxMWG05VmltdEVBT0p0L1o2cVNyQnY1LzZPbjBW?=
 =?utf-8?B?VnVpeFFOaUFmUlBWeUZvS3NRK09ZZCs3Q1RST0ZtUlRIQWFNSU50S3ZmRHZx?=
 =?utf-8?B?ZUhNUkRZOEE4NTZ4aHJCa0ZUMHhwMjBaVDJYSFJ1OEcvYTNqN1pBWU1JTUp5?=
 =?utf-8?B?SkZzRzNCSWphYWFFY2NHNThrckp2M3Z0a2g2aVVib0c5UWJuZ2d3U2pFSEVl?=
 =?utf-8?B?bStkV1haZ0pwTnhGYXNQcjIxWDEyelRpQ1diclFwdUpWa0V2YndaNjJFK1ZQ?=
 =?utf-8?B?SjdGbmVQamxnZjUzdEtnK3BtR3JqUDRTNHpoZXhnMVNmRDZ4L0pBUXRBSjc2?=
 =?utf-8?B?T0sxRXBLdzBhYWw2WSt5L2VJSFVEQldvbERDTWhlUzRPOFZtbFk1OFRSbVVE?=
 =?utf-8?B?UE5qUFpqVXVTNExYNjhaTFh1ckF6MFdYbnFvMEtNb3ptVG9KK1VsMm9pbHFv?=
 =?utf-8?B?ZHFiOElVOElqQVZ3eURpRkI0azV1Z2JReTRmZlpvK2lVTEoxV0RsKytEd0d6?=
 =?utf-8?B?d1Zrd0FqVGkwc0UvNlRpVUVqakpXOHF6Q1I1aHVzcTlzWHVBZHA3VDFOVHRG?=
 =?utf-8?B?ajdIQXhKVmEwR2Npay84UEtUMVhZdzgrSWxGemhMbGJXN05DMmFNaVVEUlNP?=
 =?utf-8?B?UXZic2lSdmhrUEsvK3VCc0g4aDk1YTFNSW5pNG1YcDFWRFQ2SWJXaEhYSWtm?=
 =?utf-8?B?QmM0TVRaY2pIN0Y4d092KzE3djZOYnhCQlBva2ZKMXh5cmI2V3hpZmkxVWFB?=
 =?utf-8?B?ZitGd0duSFRLdU5tdjR3VEFwOWVkZk1TSXNnZThOOHdPSGFFVmZCMkEwTE92?=
 =?utf-8?B?cEorM01XOFJ0WTU4SWhDV2NFYW40SmpUNHFTYUs3aGRhNWllSmM3STQ4cS9Q?=
 =?utf-8?B?NEpsbHdhZXRpQVo0WFdMQnh6VVEzNGxValFNMEFDQUh0eExHaFJLa2NSbGh6?=
 =?utf-8?B?amM5M1Z2VlI0eHJ5RFFnN3FsRi9BYVRpZlZCSGx6R2hiUlRaQThkSlY1aTUy?=
 =?utf-8?B?a0xRTHlwWlhhU0pRUnV2aVFiRDFXL0N4WGF0ZVQ2S1FlMDhnbG0xWWZSbnpD?=
 =?utf-8?B?VFVIZmp5N3hCU0xsWmFmbWwwVGxJZjA0Y2U3bXg4UEJ1V2k4YUozdVpTVU5v?=
 =?utf-8?B?YlUxd2g0dFVkV2xmdnByWVJsRmNuY09ibHhDOVkrbG9Xa1RBU3hzWVF4dGs2?=
 =?utf-8?B?M3hndmxFWDNTWFh6eXQvS0lkSlZ4Y2xacFZHL1pkUFpFMC81NjdOQnV4MlVz?=
 =?utf-8?B?bTcvbHdLMXBvLzRTZHp4aHQwNDhHYzNSTnJnUlJTM2RrOHFSM1Y5R0hNU3Rn?=
 =?utf-8?Q?gPYspW8xdAOWP1A66HcdihC7AV9sTC6O+9MqnBE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3NQaHRIOHZJcGwrS29CWXF5bkpIODdLaUhUZ3NjT2FsdDcvNTVjTVR4bjdz?=
 =?utf-8?B?OTZ4amVrVTVucHk5Y2tuQTFybUQ0b1VKVmZ5aXpQT0dyYVJRZkhaVGI4a21w?=
 =?utf-8?B?WkRSV1B1T2lpWVBYTkZoM1UzUENBenpNb1dtY1BEMy9Xc3BNZDdYOXNPMnFx?=
 =?utf-8?B?ZEhtbmZKYkxuMEViRkdqSHVKQzNqSGNOeksyVi9pTyt0RVd0ckNhQW5RVkFY?=
 =?utf-8?B?MzU0M0h5MlJydkF3UXVkZ2lkRk4vbnNKMWJBS2NOVm1FbS8ybUU4Zi9qdUhE?=
 =?utf-8?B?ZGcwMzNGZFlkSGZpWFBCSmRYN0UrRnhNdzg0bU9GMnVIUHFsbitpQTJERkFF?=
 =?utf-8?B?Z1IzRHM2SUtZTStaejkzRzh4MnF4ZnBmZUdzSkhaVmxIMXlZaEZuUUhFeElE?=
 =?utf-8?B?Nk1zTzFVbmtIejZYREVzQXE1ZE8vSi9PYzVtTkJXU1Zscnp4YlljNXBBSENY?=
 =?utf-8?B?M3FGNVUxdFFTZXBtcjFnMjB2ZTVOaC9oM09qd1lEd1kya2dPZ1daOVZYNTJM?=
 =?utf-8?B?d0VWRk5zR1lGcjluK3RYcWFOZXRNN1lTUjJkUnlOczA3c1d5WG1DWjlsY3pv?=
 =?utf-8?B?TUFwcGNNejF5bUQ5Y1UzWnkwTldZS21OMnRjRWFXVjBpZXZDaFRnZGx5VzVy?=
 =?utf-8?B?Qy9rZk5FdUFmS3lDMjBKcmthZ2V3SjdOQ1h6T1VFREs0enNtbU9oMjNLc3d0?=
 =?utf-8?B?T3NJeHhhVG1kU1dyVDIxWG5QSk5uKzBSY0hxMjBzQUtKMTFRc09xc29LYnFU?=
 =?utf-8?B?U05BT2lVRTc4S0ZET2NoR2FZbnRiMTFuak96YVJnTk52RDFjQlhURytzUnBZ?=
 =?utf-8?B?eUc3c3orcE5BK2VYc0s5Tyt4SFpoYnFGOHFzWUx0RlZmU2FCWUxKcnBEcUx6?=
 =?utf-8?B?bUZpQmZvckZGdjN6T3g5N05VM2hIcWRtL2JlakpyaTU4K3YyQUZiWUpZRG9N?=
 =?utf-8?B?NWdJSzhRdEgxazVvRTUvMEcxRmcvK2tiMkNwaGM4eTVZbzd1NHE3WVpEQ2pX?=
 =?utf-8?B?Q2l1d09FaFFEOUpzYzAwZVdYT2dqQjRlNlR3NytkYVVQeElIeFdiU3BhYzMw?=
 =?utf-8?B?Nm1TM1oyMzQwRUtLcXQvd2UwVENDWi93T0J0UnI4bXE4MEFGMUV5V2IxNEQ2?=
 =?utf-8?B?T1FmR3lldlVLbDkxTzA4OCtrTnhDcG01UUtwYm92TEFaRjBJdVdYbm5QazBv?=
 =?utf-8?B?emZZa2tGVmhZU1k1U1huYUdSZkhVNis4bFZseFJrNVhlUmhOYk4zVVZqL1dj?=
 =?utf-8?B?dXNVY0ZKaE1wbGhsc0ZJM09RakRIb1Y3YUZCRVNHRHVHUTNKS0cwTEhoTWE2?=
 =?utf-8?B?Z2pTZlBCZjhxVzBmTnJDNHJrOUg0Tlg0cW00VU1rUzI0ZWtHOVhqWlVuZUxZ?=
 =?utf-8?B?SWJnOWpjM2dvdTcvYU1YK1l5Zk8yeGk1VTZ2cEpLaTVEWDZJOWJuSFAvcUxj?=
 =?utf-8?B?eCt5aFdkQkg1bE95Rmt1ZEtnZFZ1WUs3OVRtclVVNDFKelZuNGsweHNmMVZr?=
 =?utf-8?B?OFRBR1NUYjBSMWNhYVI4MFUrZ2IwOXc0MXVZNkdMaUI1b0s4MDVkWXRmdXFP?=
 =?utf-8?B?bUQ5cmtoM1ViMHhWUkNoMGFvdExPa2hvKy9BU0JOM3plSkUrQnpMaUNxUFBw?=
 =?utf-8?B?N01zVWVJUmdQTXQ3aDdkN3VNU2tnR1JrWkF1eFZmRkxhYVh2SW1pUEorZzM1?=
 =?utf-8?B?SW45ZlYvWnhHQzFHeGpXbUpwazRyZDhENkZuRWhCbG5sVUU5d2FsRkM3MGpq?=
 =?utf-8?B?bnNmRC9aM0NFRnB6MUpjMjlSOWQ5cDlKRmExdTE2SWlzTnh0Y3JNNVgwU0xZ?=
 =?utf-8?B?QTIxODhJRlBaN2tOMkI3Q2RBeUtILzkyNkFUcy81aG5SdDR6RGh4NlFRaFJF?=
 =?utf-8?B?bE1YNkhxYVp3alhBODVnTGZTMUZuendBcURGRTdxSHB5aEtGckNhK3BuR0hT?=
 =?utf-8?B?VmE0SDZQRHVwN3EwSUhzaXVPSm55ZEsxYlpMYXZxYlJybjdEQkRiSlE2ayts?=
 =?utf-8?B?Wi9TRHBNTmlhaGtSdk1PdlNZWHI5UVBQVW1JaFdpMG9JZ3dZeGRRUVdaRkhD?=
 =?utf-8?B?WVU1NFJIT2MyNG5OaUNUWXk1bmRrdGkyRHA0OWEwNWFYNlVsdWk4U3gyazJn?=
 =?utf-8?B?bk1UZzBqcG54dXlJVmdRd21BV2VpVHV6dVJQYXU4SEhOekpFNkJXN2dxQmxM?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10607d9d-5362-46cd-700b-08dd0aceac74
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 08:21:33.3987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atgmIJY0r4lxUtrTupX00WyvCtgp7eioLn0mIZYXHJhuSwY8Xr9lORu5bHzPejxjQG3L7jgTHEozZltSCjQNhBnAGM+11YIevPx1ldfmqCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
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



On 11/21/24 7:12 PM, Manszewski, Christoph wrote:
> Hi Gwan-gyeong,
> 
> On 21.11.2024 13:22, Gwan-gyeong Mun wrote:
>> Add read and write pagefault tests to xe_eudebug_online that checks if a
>> pagefault event is submitted by the KMD debugger when a pagefault occurs.
>>
>> Test that read (load instruction) and write(store instruction) attempt to
>> load or store access to unallocated memory, causing a pagefault.
>> Examine the address causing the page fault and the number of eu threads
>> causing the pagefault.
>>
>> v2: Refactor of output attention bits on pagefault event handling 
>> (Andrzej)
>>      remove / update redudant code (Andrzej, Christoph)
>>      use igt_container_of() macro (Christoph)
>>
>> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 178 +++++++++++++++++++++++++++++++-
>>   1 file changed, 173 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/ 
>> xe_eudebug_online.c
>> index 0ef0d8093..a70d18ee4 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -36,6 +36,8 @@
>>   #define BB_IN_VRAM            (1 << 11)
>>   #define TARGET_IN_SRAM            (1 << 12)
>>   #define TARGET_IN_VRAM            (1 << 13)
>> +#define SHADER_PAGEFAULT_READ        (1 << 14)
>> +#define SHADER_PAGEFAULT_WRITE        (1 << 15)
>>   #define TRIGGER_UFENCE_SET_BREAKPOINT    (1 << 24)
>>   #define TRIGGER_RESUME_SINGLE_WALK    (1 << 25)
>>   #define TRIGGER_RESUME_PARALLEL_WALK    (1 << 26)
>> @@ -45,6 +47,7 @@
>>   #define TRIGGER_RESUME_DSS        (1 << 30)
>>   #define TRIGGER_RESUME_ONE        (1 << 31)
>> +#define SHADER_PAGEFAULT    (SHADER_PAGEFAULT_READ | 
>> SHADER_PAGEFAULT_WRITE)
>>   #define BB_REGION_BITMASK    (BB_IN_SRAM | BB_IN_VRAM)
>>   #define TARGET_REGION_BITMASK    (TARGET_IN_SRAM | TARGET_IN_VRAM)
>> @@ -61,6 +64,8 @@
>>   #define CACHING_VALUE(n)    (CACHING_INIT_VALUE + (n))
>>   #define SHADER_CANARY 0x01010101
>> +#define BAD_CANARY 0xf1f1f1f
>> +#define BAD_OFFSET (0x12345678ull << 12)
>>   #define WALKER_X_DIM        4
>>   #define WALKER_ALIGNMENT    16
>> @@ -120,7 +125,7 @@ static struct intel_buf *create_uc_buf(int fd, int 
>> width, int height, uint64_t r
>>   static int get_number_of_threads(uint64_t flags)
>>   {
>> -    if (flags & SHADER_MIN_THREADS)
>> +    if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
>>           return 16;
>>       if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>> @@ -179,6 +184,16 @@ static struct gpgpu_shader *get_shader(int fd, 
>> const unsigned int flags)
>>               gpgpu_shader__common_target_write_u32(shader, s_dim.y + 
>> i, CACHING_VALUE(i));
>>           gpgpu_shader__nop(shader);
>>           gpgpu_shader__breakpoint(shader);
>> +    } else if (flags & SHADER_PAGEFAULT) {
>> +        if (flags & SHADER_PAGEFAULT_READ)
>> +            gpgpu_shader__read_a64_dword(shader, BAD_OFFSET);
>> +        else
>> +            gpgpu_shader__write_a64_dword(shader, BAD_OFFSET, 
>> BAD_CANARY);
>> +
>> +        gpgpu_shader__label(shader, 0);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>> +        gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> 
> Now that I think about - do we need this to be a loop? Can't we just do 
> the read/write instructions? This would simplify the code and I don't 
> yet see why we need to loop within the shader. The SHADER_LOOP is used 
> for interrupt-all because we want to interrupt the workload from the 
> user/main igt thread. But here, similar to the basic-breakpoint test, we 
> just submit a workload that will halt because of the hardware/kmd 
> intervention.
> 
the pagefault tests also need this concept.

When a pagefault happened, KMD sets “Force Exception / Force External 
Halt” in TD_CTL to cause the eu threads to enter SIP mode.
In the pagefault handling process of eudebug, kmd installs a null page 
at the address where the pagefault happened and makes the halted eu 
threads resume (make unhalt).

It would be ideal if all unhalted eu threads immediately entered SIP 
mode due to the FE/FEH settings, but it may not happen immediately.
Therefore, the purpose of using a loop is to ensure that the kernel 
shader does not terminate until a pagefault event and attention event 
occur by adding an additional instruction after the instruction that 
causes the page fault.
Therefore, a loop is used to ensure that at least one eu thread must 
enter SIP mode.
The attention callback sets to exit this loop, so this code allows the 
eu thread to terminate after the sip shader is processed.

Br,
G.G.
>>       }
>>       gpgpu_shader__eot(shader);
>> @@ -217,6 +232,16 @@ static int count_set_bits(void *ptr, size_t size)
>>       return count;
>>   }
>> +static int eu_attentions_xor_count(const uint32_t *a, const uint32_t 
>> *b, uint32_t size)
>> +{
>> +    int count = 0;
>> +
>> +    for (int i = 0; i < size / 4 ; i++)
>> +        count += igt_hweight(a[i] ^ b[i]);
>> +
>> +    return count;
>> +}
>> +
>>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, 
>> uint32_t value)
>>   {
>>       int count = 0;
>> @@ -636,7 +661,7 @@ static void eu_attention_resume_trigger(struct 
>> xe_eudebug_debugger *d,
>>           }
>>       }
>> -    if (d->flags & SHADER_LOOP) {
>> +    if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
> 
> If we drop the loop we can drop also this.
> 
>>           uint32_t threads = get_number_of_threads(d->flags);
>>           uint32_t val = STEERING_END_LOOP;
>> @@ -746,6 +771,44 @@ static void 
>> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>>               data->single_step_bitmask[i] &= ~att->bitmask[i];
>>   }
>> +static void eu_attention_resume_pagefault_trigger(struct 
>> xe_eudebug_debugger *d,
>> +                          struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_eu_attention *att = 
>> igt_container_of(e, att, base);
>> +    struct online_debug_data *data = d->ptr;
>> +    uint32_t bitmask_size = att->bitmask_size;
>> +    uint8_t *bitmask;
>> +
>> +    if (data->last_eu_control_seqno > att->base.seqno)
>> +        return;
>> +
>> +    bitmask = calloc(1, att->bitmask_size);
>> +    igt_assert(bitmask);
>> +
>> +    eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
>> +               att->lrc_handle, bitmask, &bitmask_size);
>> +    igt_assert(bitmask_size == att->bitmask_size);
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +
>> +    if (d->flags & SHADER_PAGEFAULT) {
>> +        uint32_t threads = get_number_of_threads(d->flags);
>> +        uint32_t val = STEERING_END_LOOP;
>> +
>> +        igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
>> +                     data->target_offset + steering_offset(threads)),
>> +                  sizeof(uint32_t));
>> +        fsync(data->vm_fd);
>> +    }
> 
> We can also drop this when we remove the loop. Btw. why can't we just 
> use 'eu_attention_resume_trigger' instead of this whole function?
> 
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, 
>> att->client_handle,
>> +                            att->exec_queue_handle, att->lrc_handle,
>> +                            bitmask, att->bitmask_size);
>> +
>> +    free(bitmask);
>> +}
>> +
>>   static void open_trigger(struct xe_eudebug_debugger *d,
>>                struct drm_xe_eudebug_event *e)
>>   {
>> @@ -1015,7 +1078,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       struct intel_bb *ibb;
>>       struct intel_buf *buf;
>>       uint32_t *ptr;
>> -    int fd;
>> +    int fd, vm_flags;
>>       metadata[0] = calloc(2, sizeof(*metadata));
>>       metadata[1] = calloc(2, sizeof(*metadata));
>> @@ -1025,7 +1088,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       fd = xe_eudebug_client_open_driver(c);
>>       /* Additional memory for steering control */
>> -    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
>> +    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c- 
>> >flags & SHADER_PAGEFAULT)
>>           s_dim.y++;
>>       /* Additional memory for caching check */
>>       if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & 
>> SHADER_CACHING_VRAM))
>> @@ -1045,7 +1108,11 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>                                  DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>>                                  2 * sizeof(*metadata), metadata[1]);
>> -    create.vm_id = xe_eudebug_client_vm_create(c, fd, 
>> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +    vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>> +    vm_flags |= c->flags & SHADER_PAGEFAULT ? 
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
>> +
>> +    create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>> +
>>       xe_eudebug_client_exec_queue_create(c, fd, &create);
>>       ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, 
>> create.vm_id, bb_offset, bb_size,
>> @@ -1245,11 +1312,13 @@ match_attention_with_exec_queue(struct 
>> xe_eudebug_event_log *log,
>>   static void online_session_check(struct xe_eudebug_session *s, int 
>> flags)
>>   {
>>       struct drm_xe_eudebug_event_eu_attention *ea = NULL;
>> +    struct drm_xe_eudebug_event_pagefault *pf = NULL;
>>       struct drm_xe_eudebug_event *event = NULL;
>>       struct online_debug_data *data = s->client->ptr;
>>       bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>>       int sum = 0;
>>       int bitmask_size;
>> +    int pagefault_threads = 0;
>>       xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>>                         XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
>> @@ -1265,6 +1334,17 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>               igt_assert_eq(ea->bitmask_size, bitmask_size);
>>               sum += count_set_bits(ea->bitmask, bitmask_size);
>>               igt_assert(match_attention_with_exec_queue(s->debugger- 
>> >log, ea));
>> +        } else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
>> +            uint32_t after_offset = bitmask_size / sizeof(uint32_t);
>> +            uint32_t resolved_offset = bitmask_size / 
>> sizeof(uint32_t) * 2;
>> +            uint32_t *ptr = NULL;
>> +
>> +            pf = igt_container_of(event, pf, base);
>> +            ptr = (uint32_t *) pf->bitmask;
>> +            igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
>> +            pagefault_threads += eu_attentions_xor_count(ptr + 
>> after_offset,
>> +                                     ptr + resolved_offset,
>> +                                     bitmask_size);
>>           }
>>       }
>> @@ -1279,6 +1359,9 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>           igt_assert(sum > 0);
>>       else
>>           igt_assert(sum == 0);
>> +
>> +    if (flags & SHADER_PAGEFAULT)
>> +        igt_assert(pagefault_threads > 0);
>>   }
>>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
>> @@ -1302,6 +1385,43 @@ static void ufence_ack_set_bp_trigger(struct 
>> xe_eudebug_debugger *d,
>>       }
>>   }
>> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
>> +                  struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, 
>> pf, base);
>> +    uint32_t attn_size = pf->bitmask_size / 3;
>> +    int attn_size_as_u32 = attn_size / sizeof(uint32_t);
>> +    uint32_t *ptr = (uint32_t *) pf->bitmask;
>> +    uint32_t *ptrs[3] = {ptr, ptr + attn_size_as_u32, ptr + 2 * 
>> attn_size_as_u32};
>> +    const char * const name[3] = {"before", "after", "resolved"};
>> +    int threads[3], pagefault_threads, idx;
>> +
>> +    for (idx = 0; idx < 3; idx++)
>> +        threads[idx] = count_set_bits(ptrs[idx], attn_size);
>> +
>> +    pagefault_threads = eu_attentions_xor_count(ptrs[1], ptrs[2], 
>> attn_size);
>> +
>> +    igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
>> +          "resolved=%d, pagefault=%d] "
>> +          "client[%llu], exec_queue[%llu], lrc[%llu], 
>> bitmask_size[%d], "
>> +          "pagefault_address[0x%llx]\n",
>> +          pf->base.seqno, threads[0], threads[1], threads[2],
>> +          pagefault_threads, pf->client_handle, pf->exec_queue_handle,
>> +          pf->lrc_handle, pf->bitmask_size,
>> +          pf->pagefault_address);
>> +
>> +    for (idx = 0; idx < 3; idx++) {
>> +        igt_debug("=== Attentions %s ===\n", name[idx]);
>> +
>> +        for (uint32_t i = 0; i < attn_size_as_u32; i += 2)
>> +            igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
>> +                  ptrs[idx][i], ptrs[idx][i + 1]);
>> +    }
>> +
>> +    igt_assert(pagefault_threads > 0);
>> +    igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
>> +}
>> +
>>   /**
>>    * SUBTEST: basic-breakpoint
>>    * Description:
>> @@ -1383,6 +1503,49 @@ static void test_set_breakpoint_online(int fd, 
>> struct drm_xe_engine_class_instan
>>       online_debug_data_destroy(data);
>>   }
>> +/**
>> + * SUBTEST: pagefault-read
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a read pagefault.
>> + *
>> + * SUBTEST: pagefault-write
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a write pagefault.
>> + */
>> +static void test_pagefault_online(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>> +                  int flags)
>> +{
>> +    struct xe_eudebug_session *s;
>> +    struct online_debug_data *data;
>> +
>> +    data = online_debug_data_create(hwe);
>> +    s = xe_eudebug_session_create(fd, run_online_client, flags, data);
>> +
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_OPEN,
>> +                    open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
>> +                    exec_queue_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_debug_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_resume_pagefault_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_METADATA,
>> +                    create_metadata_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
>> +                    ufence_ack_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
>> +                    pagefault_trigger);
> 
> Removing the loop would make it possible to reduce this to 3 triggers.
> 
> So again, I may be missing some detail that implies we need a loop in 
> the shader. But for now it looks to me like we don't.
> 
> Thanks,
> Christoph
> 
>> +
>> +    xe_eudebug_session_run(s);
>> +    online_session_check(s, s->flags);
>> +
>> +    xe_eudebug_session_destroy(s);
>> +    online_debug_data_destroy(data);
>> +}
>> +
>>   /**
>>    * SUBTEST: preempt-breakpoint
>>    * Description:
>> @@ -2344,6 +2507,11 @@ igt_main
>>       igt_subtest("breakpoint-many-sessions-tiles")
>>           test_many_sessions_on_tiles(fd, true);
>> +    test_gt_render_or_compute("pagefault-read", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
>> +    test_gt_render_or_compute("pagefault-write", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>> +
>>       igt_fixture {
>>           xe_eudebug_enable(fd, was_enabled);

