Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639AFCA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118A410E277;
	Thu,  1 Oct 2026 07:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOhMfxHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D286A10E036
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790840982; x=1822376982;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CLDxqepgITyO6TqcrlNFoAsjvmCijwJY78EMOP4KFgE=;
 b=WOhMfxHUmNXHF/prhDDqhrBhTnxznaHVgWHeBC1wcZ3vLt/6W1Uqs/iW
 uc7vv7YWYrMmY40kb2lscFyT+1TCah+ypCZA5xXXsdCorGnPOea7otbM0
 0zKcf6cxVtDvpHzbbi5IjYkcPUXnKY+eMP6tv7lZ8pnKH/ViRX7A+cFCc
 kYWMIlSl1X7gpgHsxD5pNH4dy9IghcSOQ/1eKOxmrTch8UjJawVPX6FgK
 2BgKe1Ifw3zizHSh/MNRE77LFZvD+FWIYMc8847cFiHN2xkpe1z3PHJ+7
 BUQfP/usrXh3bL88Ww3L1ZOHbijvffBqmladd9mEZSk3zOxl0arp2pT2l g==;
X-CSE-ConnectionGUID: ukTw+4KmRtKq8WuBDeDspg==
X-CSE-MsgGUID: PWm9pOU3SOmaTLWu6ZxxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79151924"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="79151924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:49:41 -0700
X-CSE-ConnectionGUID: RnOB967kRA2pdpW9BIt69Q==
X-CSE-MsgGUID: Du5glWQ5STu8ZctlaGujlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279218447"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:49:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:49:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:49:26 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWe3AUVmyFYTH5hjGQ+g9A15m4PPa67p+gYYoryVKGdqRHEJ0VyE+YuQMoO1QBXCUQPfrwlpLJweuTwHSg092MIvnLAOQBeiZnzENs8wQ5lcROIuolR9K1CCbQbjHROmz2ocAy/H4yv1PxW+mPF8PB3TCkOw1qxE5s1nvSopGYY4gwwlpLw5vKlgrdkI9zhEWeTsC2gGquK1+urjBeLyG7rYt98n+C07QPozaJHtQBRidFQbkVX5zKq+YLUCw08ZnahyT2t4rN5VUqUG7gMuIIWef5oPcnE5ohJ6H1DsJZslABNgIatY0UlKeLepynKIw8z3lr/fSEcjBWKEb1aGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Qvm39U/36k5taTaJF/KcwatzdibUzgHVecT00mgeDA=;
 b=y91cnYMRF5R3nmvcx7Hd01APdJggz4NzDiVnw0z2jRwP1gD+ygZ2oowgfOrB2iKQqUX9Zstw4wsa1ZX65OCB6R8viCpDWDCq/psqSL/ZB+Sh5M21DNHpMWIhfw5l+m9S2gNEw7XNSd1k4/9h+8aPJhIcdyVfT1ovGNOj92jlOF4uFyedI0QcMMMgdV89ZwU4o2vvRXKrkqFMhPn0WJqRmNddgQfnhjF2MT4o3VYOpe0ZhwupWO74uMFX/spU7tBKyTATU1k1UPCJ2twpvac+Wjt/+nm4dvtX5JL9Nk0NTQ/HZLiQwLhBZ1oDwAInyY2UVbylVEVjpRg7nfoVv9oI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Thu, 1 Oct 2026 07:49:21 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 07:49:21 +0000
Message-ID: <d0b25a7e-e3d7-414b-8194-84f4ce9ce8cc@intel.com>
Date: Thu, 1 Oct 2026 13:19:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-4-ravi.kishore.koppuravuri@intel.com>
 <4e07ff06-6b3f-4d41-ae82-1a1458ceca1a@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <4e07ff06-6b3f-4d41-ae82-1a1458ceca1a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0168.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::10) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|DS0PR11MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 253c44d2-7ac4-4d6a-4fcd-08df1f908116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IG73lOET7RX6Y+uCUX+JKa0IzrvviBnYnTeKSiz7aLXlWVxzqPQxsA5shZ5whbGgYlckCEy+QvD/P7CzeZn8w5GCzGUtk26ZABervn3MyQXlQ89Z5/LzN/1v4fyV0B1Rdu60kV2xfhxnCyTfmrcZSBOIfSf/xjpuTeopY7acBGGeiWQsyQXEd7E9pGUJT4xwYNLczYqMtoiIbXGndD8ASmiDb8Y5vi00IRDW3/qV+rYI5j6+pnd3TVoXw6MNyNCdh7CBRZ64dHhxg9VmegXkyJ8xRJbprqQPphPqW+lNxMnOnyZuF3SuD623eQdLcOQIZlbj0/bK5ubmC3FQZ7chsmGFr5Uvq9zc/hp3QDASsDUaT/GN1YdgrM8TX/yHyLgm6fuiuDUREBhhGYHDyIW1c/DZmdtJY7QHZo7PaqJSMsJDhVAX2ma50zsz/Wo2xL42MwZnuhm7WBpkBxy2RXZRrrULfqXGzjyCGJX21sFVzrnOOo7oZySclj96MsPTQDb2HZPETeXpXKV5KntwrH2VyyOXHdNXaOXnvhwDnOo20xP4oWiyKijSHFNEbvMKXXt9Eaqwct2gKnI8qvqWstWdIm76ufblVoG6Po4+oTUO0rc65ZbKYJQsLqBACcJZiVbRLgEhOD15EG7FEqXITl41kSZIPPiFXUW+sG3a40lGI/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWp2QXlZdU5oSFRaTFNUcFJQTStsZ3BtSXQ0amFob05KbkpxaGM3RHJLYVl3?=
 =?utf-8?B?ZGhuMVdHK2FXVUV1UUF6bE80MkNLdEtLZ2dPN1dTK2hLZ1VQbFlxcDdrbnI0?=
 =?utf-8?B?Um5naUJGOHR5Rm5PVnJUd0hmc3VRa0FvS0crWVY5NGVzamJtOXhMRjBCNnI2?=
 =?utf-8?B?WURXUFRUK3laT2I3d2w1NUZPQ0ZXMzVzVVJSdkFhd04wcXlJWVRxa2VyaHJ0?=
 =?utf-8?B?Q1VscXRpRjRzNkgwOEdRem5CNGxGYTVkWlVTU09jeG5KMndSZkN6d2ZMTzNE?=
 =?utf-8?B?anluckVUNzdvdEl3bHhFbzRiV3JEeE52bkRxQ1ZCQ1IvQmNHRkVjVjhNeGs4?=
 =?utf-8?B?RUkyUGNBK2VJaGdnWTNFM0V5Z0c2K1FONEhwVnkyZXVISEd1dUJTYmI0Z2VF?=
 =?utf-8?B?dnp4MldNRThmN0JFaVF1NS8zOEVVcWt5VkVjVmR5MEgycjQzZVE0cXZZcUZT?=
 =?utf-8?B?bmNkZTBBeVVEK1dvcm5PdVRFRitkU2VjSW90ZEZ2azRZOW50YXlkZDNMMnR3?=
 =?utf-8?B?RXA4UG5FZ21NYTJuU01IbjRGb1EyRmRKYS9QMmpwaG5kU2YzaTZVc1htT0Fo?=
 =?utf-8?B?OUNLN04xWFJ3UUZ3aCsvRlZ4WWliWWpSQ1lnL3BmTlZaZ3hoRUdWaFJSeDVL?=
 =?utf-8?B?YlV3OTJGajA2QmtqcjJmUkd6Qnp2dzdxQTNORWo4dDhqZVZKT3A1RkJmYjZY?=
 =?utf-8?B?SFdNTENGd3AzKzJ6T1RDMndFRGNZMTk1em1VQ2xvc00zZysyYTBlQjBlSmxr?=
 =?utf-8?B?QjkvdndJZEVhc3ZzVGllTEthRU8vSStHKzNoSDlGMWdxaHkyajl0S3FMdU1Q?=
 =?utf-8?B?eVZzYnRCdVpnOEk2cnBLaXEyaWxEM0JvTmZtQU52RVJ0QVJmc2FleTd0YzNu?=
 =?utf-8?B?VElhZTJRNEhVQ2RUMzhtSGlxaWhmRUpOR2JQcU1DSTUreGpXdkFGQVlHS2pm?=
 =?utf-8?B?U0FhRFZTY05QVFZoSVI0dnZYamhKdXF2bkR0MDBtQm5MRnJlZUpaNGZYSXV1?=
 =?utf-8?B?c1I4U3MxdzZWbFdiaHlIL1J5SWhhbzBwUTA1N2tNeGJ4amJiSjVtMDYzTUdG?=
 =?utf-8?B?VndwcCtSWlgxMmFCSis2TmVVR3J6a1hLTXNzbFd6eXlQTlRoaWtSNUxWRFB4?=
 =?utf-8?B?UWtTWmpwSnlTMmFpVWxUa3lJdGlsWnZpTXlHSkdReCtSUW9WMllaTGM0SVgx?=
 =?utf-8?B?dzRncHpkVytzM0ZPVllNM3VMaFRvdUVYNDJXdWNpYXJUbk1PSC9GU2JDMXhR?=
 =?utf-8?B?WEpibC8zSi9CRm5KelZMUlFhYjNNa1ZmVy9sbkc0REFVNEU3ajVSNk16UXE5?=
 =?utf-8?B?N1k2Q1UxR0FjSisvaGhFQXlxcGVpMWlGS1hvM0JYb1JGWkVLT0Y3MEMwVmtD?=
 =?utf-8?B?a05NdFJrei9hQ0I4d0JBWnBNQlZWaU1QQmRsSi92cTBhRm5LRkpTeHdsbUJU?=
 =?utf-8?B?c29jZDZ3bWdhSnk1SVFmN3V0cDhPcytNK0hkTFNUbHI3Y25rdXN0K1BESXpq?=
 =?utf-8?B?MlFNR0R6Vmsvc3Jidy80ZzJoalRjOTI5Y1d0SHpBNE12UktCTHhKaDZOYzdM?=
 =?utf-8?B?MkZXbTNNMzVLcGFhZWtJM2pnWDJuU1hudHJjQ00rQTlHMUwyR05QVmtoeDgx?=
 =?utf-8?B?aTQ1Qk9hUEVvY2srUE1hSnRGQWwxRG8rV3hxcDd6eHorT3FjbzI5NThhcWUx?=
 =?utf-8?B?SzZvc0QrM2l2TlhwV1c3SWtpelplYUQxazFqem45SDBzbUN0YUpFaTdkZzhJ?=
 =?utf-8?B?VldTZUIrV3pZUkNMM3dVaDkxK3M2Yit1R0xjOWkrMlFmaVNZSS9YckJsRGkw?=
 =?utf-8?B?SkdRVWgyMjdVWjBRUXU0NDg4Ym5zUHZ0SlFrSmhHdlZIUGNiL24wYW5mdDds?=
 =?utf-8?B?MWUzakxyMG1tbWtiMHo4RHRTbGI2SXZLSFNDdkZqT0hnaEhjWklxdDdIbUVo?=
 =?utf-8?B?MGxvSGlRbU9UdjM4OUVhc0xmcXFDZXpuVFV2TVB5WitxZzZoVEpyK05xdkhZ?=
 =?utf-8?B?U3B4S0huSC9rSkhFcmF0NTRaWW5OcjJMMXA1MGFPSzNzTVF6MUg3d0tXdVh6?=
 =?utf-8?B?NFVWVjlkMXUxbThmdGhVUDFaaCt5VkFudExBVWpCeUIrbGlETkN3VEs0NEtC?=
 =?utf-8?B?SGs4dkYwZ1ZVaTdGcjkvempNci92TnNVMk55Qjh5dkFhLzB3U2tlL1dzRGFU?=
 =?utf-8?B?cGtLVTdVNGdUbTVnNW12TTIvd1FDZVgzNVlHYWVmVHdQYnZpbXFkcVVLVXd4?=
 =?utf-8?B?amtFemxaVFY0QUIxWVAwamd3NEZvM1dvM2U1VHNUSnZzaVlFaWI5bjB6eW0y?=
 =?utf-8?B?RG5vejY1ald1K0N3djEyUC9DTkZVRG0xenVjaHhITWcxcS93RzdWNVhma1lU?=
 =?utf-8?Q?XH19BQ1orovpIjYHr+HGZFNk3dVj7JgFPsfcc?=
X-Exchange-RoutingPolicyChecked: T1o3f/vLa3lNb0ses60vVauY9sHiyU2K4lWT+ZupgusDcTsHaFL/fW28YnbBCZ7oc5Em9UPoqEeF7PbQRmMpRegjImFlkESTdrwnbIsTgpwmBhf7Dzh2sGzuo89s4RX3lGqa+IsAq7m5PWMtIoVnS/+aykC1IY+HJ1LM4L7pExv8OG30jj3i8AvFy+mkkaLhcM+g3fBwmseGzE0ddph6oJpana7WkIYrbOuqrHBQGkqn7egbPBPmmmOibn6Y4D3NDfrTdUTXvTSkGKjNPbXcF58uykiWJYOS0L4QYkbW3BS9aKynq8Ab74dclhGW1j9lQ/Ept/HGGF1/S2Sqx/Em2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 253c44d2-7ac4-4d6a-4fcd-08df1f908116
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:49:21.2537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46fIMXoIMQjtjSEMJrL61lf0pjyaH4kcY5sOPpbLUNfqntBgpTVyOxvFs1uGnfnJr5/hPjQC2DYfb1jLIu+yNZXjyGf1AvuQHaIRssl1DzFra4lscTpWNncnfUi2jGJ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
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


On 10-09-2026 11:47, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Introduce an IGT library for communicating with DRM RAS Generic Netlink
>> interface. Add helpers for Generic Netlink socket initialization and
>> cleanup.
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v4:Renamed library function names prefixed with igt_drm_netlink_*
>>     (Nikula Jani and Kamil)
>>     Moved the headers to other commits which are not necessary in this
>>     commit (Nikula Jani)
>> ---
>>   lib/igt_drm_netlink.c | 54 +++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.h | 20 ++++++++++++++++
>>   lib/meson.build       |  1 +
>>   3 files changed, 75 insertions(+)
>>   create mode 100644 lib/igt_drm_netlink.c
>>   create mode 100644 lib/igt_drm_netlink.h
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> new file mode 100644
>> index 000000000..709c01987
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.c
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <stdint.h>
>> +
>> +#include <netlink/genl/ctrl.h>
>> +#include <netlink/genl/genl.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_drm_netlink.h"
>> +
>> +void igt_drm_netlink_cleanup(struct app_context *ctx)
>> +{
>> +    if (!ctx || !ctx->sock)
>> +        return;
>> +
>> +    nl_close(ctx->sock);
>> +    nl_socket_free(ctx->sock);
>> +    ctx->sock = NULL;
>> +    ctx->family_id = -1;
>> +
>> +    igt_debug("Cleaned up netlink socket.\n");
>> +}
>> +
>> +int igt_drm_netlink_init(struct app_context *ctx)
>> +{
>> +    ctx->sock = nl_socket_alloc();
>> +    if (!ctx->sock)
>> +        return -1;
>> +
>> +    igt_debug("Socket allocation successful. Connecting to Generic 
>> Netlink...\n");
>> +    if (genl_connect(ctx->sock) < 0) {
>> +        igt_drm_netlink_cleanup(ctx);
>> +        return -1;
>> +    }
>> +
>> +    igt_debug("Resolving Generic Netlink family '%s'...\n", 
>> DRM_RAS_FAMILY_NAME);
>> +    ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
>> +    if (ctx->family_id < 0) {
>> +        fprintf(stderr,
>> +            "Failed to resolve Generic Netlink family '%s': %s. "
>> +            "This may mean the running kernel does not expose DRM 
>> RAS support.\n",
>> +            DRM_RAS_FAMILY_NAME,
>> +            nl_geterror(ctx->family_id));
>> +        igt_drm_netlink_cleanup(ctx);
>> +        return -1;
>> +    }
>> +
>> +    igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
>> +          DRM_RAS_FAMILY_NAME, ctx->family_id);
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> new file mode 100644
>> index 000000000..0e563e55f
>> --- /dev/null
>> +++ b/lib/igt_drm_netlink.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_DRM_NETLINK_H
>> +#define IGT_DRM_NETLINK_H
>> +
>> +#include <drm-uapi/drm_ras.h>
>> +
>> +struct app_context {
>
> app_context is too generic for a non-local type in a public header. 
> Please prefix it with "igt_drm_netlink_". e.g. struct 
> igt_drm_netlink_context.
>
> Thanks,
> Soham

Sure. will update it to igt_drm_ras_nl_context

Thanks,

Ravi Kishore K.

>> +    struct nl_sock *sock;
>> +    int family_id;
>> +};
>> +
>> +void igt_drm_netlink_cleanup(struct app_context *ctx);
>> +int igt_drm_netlink_init(struct app_context *ctx);
>> +
>> +#endif /* IGT_DRM_NETLINK_H */
>> +
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 7248bbc2d..70da9a4a0 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -27,6 +27,7 @@ lib_sources = [
>>       'igt_device_scan.c',
>>       'igt_drm_clients.h',
>>       'igt_drm_fdinfo.c',
>> +    'igt_drm_netlink.c',
>>           'igt_fs.c',
>>       'igt_aux.c',
>>       'igt_dp.c',
