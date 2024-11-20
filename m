Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E3D44171
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 09:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378AB10E3BD;
	Wed, 20 Nov 2024 09:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/ie88ef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29710E3BD;
 Wed, 20 Nov 2024 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732096624; x=1763632624;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LT55cxuF4f9ZI5fkav4m4Xb0BtYw4aR4eBWgOG2fPoM=;
 b=H/ie88efUP1qp800eNDMiFo7ZpXScJo1EZLP1oMSEhEuCcgzKOjZmlQt
 wKQ2VDik4lZCmFgza5F7lAnZ0vhfk3skwaARZQ7QlGsnmJQXh0391D6CE
 N7AWfW6ZDeWY/p9JnKXG/vnTy8SDtUhFGEILnNyo6SxdZJa01pZFg1jpm
 Cm7wnoZitsgN7b55uutR23Q21VmVvjOgBgtbIN/AsUGjln+2/ntD4WqDc
 Jtx8mg98CVeRD54M7nPTcQUNR3dAib6Kc2CWInGhoSE0H+GwWrVvs0k6J
 A84iJiWfKDrVi2CTm8GkTBDxZuXEv872oubPu1XMnEOsgJYLLlwtqBUkg w==;
X-CSE-ConnectionGUID: H/QrMZEVT2GQ7+/ujqYMXg==
X-CSE-MsgGUID: 2dkrpCH9Sh+hWemElMVz8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32281452"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32281452"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 01:57:03 -0800
X-CSE-ConnectionGUID: 8n1K+fsoQu+pm4O+D1Qsxw==
X-CSE-MsgGUID: O1MVDeXlSQqpfzOvCRvc3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94928466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 01:57:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 01:57:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 01:57:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 01:57:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCpz+w5UOt9p0i/C0jdfLmk5PK7WDQKFQdAm9hTOXZJVZuxqIuybTRVkqVmXrTXKauAH7LYae7EMqbqMCE127lPsn1/2STxqIbY3bvP0KHl5SjgLw3TL2uUAveDZpY2PCWZiYUjXmAlb1nPhOIImy2KZ4UQpiMK6OVLUfda5jRw86fJgCgcbPnwSVAsMp7lnjf9pEK1tneWlPoe7nYaOoC1XJ9uwZu6HSh/82WpirNl6NIpjbR6E5wOBt7dS2dQQ85hRf8ppNXpvRqvy5IiI8yqV82ZIh9S4TDn+zMFPWBMiF8dKTc2xYcaTsvAGBHd93lkAXwpG75fYbQg6dwhtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSFhkZVD7gkCEDYl2sJMdWxx/uPxlg+RP4vANWplAn0=;
 b=AKP51uaJOJULsucfex6TlHg7ExhyYRCp9NJ6OxsXBqC1RC09g1UcwnBWs+pEsHoaYgMe6HLWQ46Nly/U5HA3LHVvoyGBNfr/APw5pMUINAGWkyhuPD689wb/K2StlAFj2hiFxKEVfAlJ47oCv+9OoKxiEeNt3spwIWERRkUjUQGOojC5/MmeoVnVOiCmON7XQJvJUnzhYwfmm/N071UO8xGzzPEGgjSUKIOlcnyMvuMWmuLediZ6niX7tA/Sjm6n0t5MDvzw9svlaNG+rM6Lg3bAFj5IKuZNZo+A1TNu36YQ4iKjjT7naQjodNBBw/CjSUlmY1vn7i2ySaORXZmhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by BL4PR11MB8823.namprd11.prod.outlook.com (2603:10b6:208:5a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 09:56:59 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 09:56:59 +0000
Date: Wed, 20 Nov 2024 10:56:50 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fctx=5Fpersistence?= =?utf-8?Q?=3A?= Wait for context
 termination (rev3)
Message-ID: <j2iuxf4ckrnsxuizoadsxf44kojfso55vqlorlrrli52vssuml@jshphbxuckmp>
References: <20241118121657.10624-2-krzysztof.niemiec@intel.com>
 <173197925847.107714.1197486447801164579@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173197925847.107714.1197486447801164579@b555e5b46a47>
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|BL4PR11MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 0925a727-ce1c-4904-a846-08dd0949aca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1JmeEQwOUE2Z0FsSzNYbDFKUW1XRHQ3TDlVSnRuSG1KQmd6bGQ0c0ZKMjJJ?=
 =?utf-8?B?Vm8vUVZ1akZkTEF3UEUwU2dFVUVSOHZMNEFTbWJ4QTlQbTVHTy9NQjgyUU92?=
 =?utf-8?B?aG9WZHJWOW1NYTlGZnNtYlJGNU1Bb05aNk1JMEF6MlN6TVpDcTBxaGhXdGxn?=
 =?utf-8?B?bGtkRllpdWlLbU9jdVVHa0RZTnJWUGdGV0tVOHBWRXZ5amg5NFBWRXo5YllJ?=
 =?utf-8?B?SUFMb3J5NjFlWm5xTGNwR0RBRW9VZ3F4L2o4eG1WaEc0ZDZVMGN3cktvSjUw?=
 =?utf-8?B?ZUtvTkpzR2M1TDdLNTlmaDBKUDNQNUl1MHBGTUZ0M3N1REZvMkpKL3hIOER6?=
 =?utf-8?B?bTcvYWxGUW9EY1NPS01vM0c3aDcvM1c5Y1N3N3RPc3JZN2lZTDY4Y2Q4RDRT?=
 =?utf-8?B?QUdxRUNJak81SGJ0cHVOczMyOC9wZ0krUExsM3RZZ3RrdmxCb2hwb2IrMk5o?=
 =?utf-8?B?eDdNSHhSa1dQcEZLSWRKTXR6dmRCMmE3NE11YTVydUZiTnRnNmNyTVg5M1Bk?=
 =?utf-8?B?TFRRTXVSTVdaR2t4RVc5bGprZGcrUXJVSUlLVkNKNkVsQTJ0ODA0S0FVdHRB?=
 =?utf-8?B?bE9IUEY4SmpKWmg5ZnpMQ08vWlozcWU1S0pQQmpNZUVRNG1ieFhxMmpVUlg1?=
 =?utf-8?B?cTR6M0JKSEVrWXdIK0o3QVNvYjZrdnZjQXlOQ1Q0bkJqWGpoQXFIeERZdGdG?=
 =?utf-8?B?aFl6UkkwZ2VYQThLZWRQeHJaWjNFYnh4UHBxVVpNeThXbHV2TVRFeDBHc0dv?=
 =?utf-8?B?K0dWUGFPOHBzdUtEMzRnZDg3TGRka0JzRis2bnd2cTRGdG8vTjZVa2UxNDhq?=
 =?utf-8?B?SitHSDQvMVl2d3M1b3FhelZtRkduOG92c3ZhTUg4ams5cjV5ckZoTVFzU1R0?=
 =?utf-8?B?UzNSbkwxSWI4bmNKb2ppcHVPM3U5TklJcVdoVG93MWs5dnA4MzB0ZjJoU1d3?=
 =?utf-8?B?ZGRiL1JWclVaNStnOUxVMExqUDkvLzZNWVUxSU1EQk1qNFEwdyt0WUdoL2th?=
 =?utf-8?B?cEJMVUE2dFBDa1RlUkw5N1VKY2s0WmsxVXI0Mk1BNjB0SVl3U1JIdHhTRHpV?=
 =?utf-8?B?NTZjU2tEUzYyUDFMaTFhcllHbVJUOWpWV3hLYUZLVDFWb0ZQS3dtSzNlUmhV?=
 =?utf-8?B?WHExV1B3TjZOTEszMHFhOGZDdjFaTWM2N3k5NXpPcnRWNDE2K3lQZW40eUhq?=
 =?utf-8?B?eVdYbFlVQVJMbkpXSmZWdStaNE12Y3o0OW9HYmM4bDF0cW1MTFdjSWJDdUdl?=
 =?utf-8?B?bkYwTnk0Q0pZR2ZZOXNyZHlPMVB2ZFFRQkIvUjdhY1Rsc1ZXLzZZb3BocnQ0?=
 =?utf-8?B?NlhQKzJHR3lmVHVSM0NmM3RpYVErR1JzUURBcy9RcU44eFk5TmlxM0hZZ3Iy?=
 =?utf-8?B?Lzc2UFNRTUYzYmtJaGRYWGJzYk5yRU9ydTlTSGxnaTh3a1FjaGh0L1F1WWxh?=
 =?utf-8?B?SWxIeXk1RHdHUkdPbUtBYjJqREcrdFdFSTdYbFh3cGErUmRIQ3RNUnpCSlVS?=
 =?utf-8?B?REdrRGo0MEprdkM5alVwcVRzQVF4bWIwYnQ5NUh2dWRJTjdubE1YRmZwbTNL?=
 =?utf-8?B?SHpoUHlrM3JrMEtQK2E1RFMwdjR5eFU3Tkx3Zk4vMFdqWHk3WEhUYkRBYTZ2?=
 =?utf-8?B?M1ovRGcxcVMrSWl3dWJJbUdwWW1rb3EvQ296bEFtRUNPSDJTdzZsUVFaL20v?=
 =?utf-8?B?WTNycDJyVEt2N3RIQU1KVFd5VW54cXF2OGNYUXcvbGVvSnB6eXQ1VWxuTWhO?=
 =?utf-8?Q?w9NW4ayYNH/qO23vaDZm5JpLhy+5i3/9axAlHbV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVpYSFFOQno3OUNxVEU0Z3l3cW43bElkVzRKbU5ITWZpZXlrSmlxNk1PUzdk?=
 =?utf-8?B?S2RWN0JaejZPVHF0ZHd1TUtJZ1prNHF1QUxkQmRwM2hLdG15aTVxOGpHMzZT?=
 =?utf-8?B?aXZERFhmVllPVzhNTDhsNlBmN0w2ejB6V1BXNTVkZzlGQ2tXT2FWTlIwSllD?=
 =?utf-8?B?U09xWGp0UWdibWpSU0JRb1lqMnh4c0dBZ0g3enFLaEl3TVllSExZQ3ZJc0Jw?=
 =?utf-8?B?Mk1naU1Ca3RQUjBRd3cwZnNidVczdVNNWStmdWpyNVNkZndMK1JueVFTOXoy?=
 =?utf-8?B?bC9tci9UaitYWnpTR3NWSEM3V2IzNGlRTHc5THNFMWRiZEtTc2hmU2o5RUkr?=
 =?utf-8?B?RTBWa3lYSUh1WlM2VUFoT3BZOTZTTGhYZFlTaC9yN1lhRkR4LzdESGF4bkJE?=
 =?utf-8?B?UUtOMFA4UzNOa2ViSlNGTUR6SUJibDIwYXI1emcycDVpQTRMMTBJS0VpTWd3?=
 =?utf-8?B?dUFtaER4NVJkN3NYNEtHWHo1U3VGRzhQWmxnaHlkekJubzdjRFJ0OXlWZEdo?=
 =?utf-8?B?R0x4MkRrenlBUkFSQU8xZ0N1ZXhYY1hESkVyakJaSFQ0ejNyVzNoTGsrMDBK?=
 =?utf-8?B?MTdNZUUxc1FKZWdWTWxEbkk4SmF5bGRJMGQ4SlBlNVRFS05XMzZIS0RELy8z?=
 =?utf-8?B?UlFVTWhyNTY4V2hpZHg5dlhFYzhXbFZ3bC9YYlF3U1dBdFBXZEsrdzE1YUVa?=
 =?utf-8?B?azkvR3ZPUEpHTFhOTlRDeUgwUDdoekw3YjlZcW5FR0JtenJ4OHV4Q0wzTlE5?=
 =?utf-8?B?UEhDSUZxTE45NUM2dTgyQ2V2QmFVZjl3Qno1ZmlkMmpUaGVFYS9wa1ZYUEt2?=
 =?utf-8?B?aEVBWWlmYkY2S0cwNlk3SnNmRTNyWFd6b0dRdnFpb0R2dDEzR2VPZDQzc3Jl?=
 =?utf-8?B?MmFUZHFhUDZKWVBuTEI4amNqNkRSZ0UwY05qZVBWT2hhYnE5dkI5RkJCZXdF?=
 =?utf-8?B?Z2Z2cE96dmxMekhzVzcvVFQ3YjRwRkJ1citDYTNydWppZ1Q2LzM3Q0Nid2hC?=
 =?utf-8?B?dHd3VzYwODk4eG1WWi9vK1ZkWXJvN3N0WVVPNGdLZ0Q3ZVZYRjRvMnhaNjVB?=
 =?utf-8?B?b2k5ekxhR09aTzNuZGFjTlM5VmFBbWpBNTQxNkQvU1NrSzhlc2RmM2xpMXZs?=
 =?utf-8?B?RWlFNkRYM3JRZHNMb3FXa0Q4djBQVURWbEJGVU1WTU5VQ0tUMmZIQ3Rjdi9j?=
 =?utf-8?B?VXp3VGR1ZTY4WUZYVFJhZXpwL3c5OGJwWWYyQU55cjJ0aHd6WkM5cG11c1VF?=
 =?utf-8?B?MHBFV0p4aUxDT0lCVlFZRVdTc0tKNHMzb2U4OXlIQWJham5PUHhPMndyOWp6?=
 =?utf-8?B?b3RaQ1c3eHErZm5BNkRGV3F5Q1BiUVhZV2g4ZzJpcGxuWkZLYjhkSzFwWnVQ?=
 =?utf-8?B?VmNuMzFVbFVSVS9POVFKNVJEdTRaZmowRkNqYk1qNzF4MW9SaDBtVnZpbllz?=
 =?utf-8?B?aGcyOHNWNjg5K0RVaUk3ZUYrdloxL1hxejJxYVFERlFLczJUWkJYRnhjcjdD?=
 =?utf-8?B?YUFYeW9VTENpMjhPaUtTeU14bHNGTm9qcy9iL1MwYjdqZVdxdkZLd1V2OWxz?=
 =?utf-8?B?cU9VMkM3Y2I2WktodGtvV2V2VVp0bGNCQ2pwYXpZUit3bnZoTityREJ3TXJO?=
 =?utf-8?B?bWUwQnhmakg1Y1pGMUlyMWkyZE1UOEpwZUJLZ3I4c2hYNFJCMVFqdHNiS0U3?=
 =?utf-8?B?YnVyYVRjQWlJY0RiM2NIeWhRblJad0VDTEpncmk4Y0xZZEROWkZJVGM3TlAz?=
 =?utf-8?B?Z09EeU9XVlJRRFZaQytYeDNDZXA5bVBpekZaRDZNVlVlTzZlRlNvWEMyT1ZF?=
 =?utf-8?B?OXM3V3VObFB2Q0h3VUNycmFLNE04R2dXcUxhMjZKN0hueDNYT1hyc2Y2eVZY?=
 =?utf-8?B?cERPSHVVTTkwakM2YnladVJ1c3VZVzdzb1p2OURMdW1POHFPaklxVXpNVGV2?=
 =?utf-8?B?QlhtTWtxaXQ3MkNaTld2TUF3ZkszRFJwdWNmdmljZXRmd2VVc05lY3dlMzdl?=
 =?utf-8?B?USs0Vjg3Q1FsSTY4eUh0bVpTZ0E1V29TWlVGNVdYZXlPQ2QvbWZ3enVqdXFo?=
 =?utf-8?B?V3V6enFabEJzU2xvVVpIY0NUZFNwRG1WeWNJNzd6NU9hYlNGTmZIajBoQU5l?=
 =?utf-8?B?NGw1ODFtRCs2SndEbmk1bVdKeUJlcHNCOU9oZEsyQkkxMHV6NG44UWlQRkhK?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0925a727-ce1c-4904-a846-08dd0949aca9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 09:56:59.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMgbDzKSeCJGfj3LeAtTWrNsVFcKqgIhS6ufHxybljZYf2ShUpxpxPz52gz0mSKrUzMlwEHwElWJosX1eKsVzLZ03GG3QgTD6ZAJ+kak1NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8823
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

On 2024-11-19 at 01:20:58 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_ctx_persistence: Wait for context termination (rev3)
> URL   : https://patchwork.freedesktop.org/series/140582/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8115 -> IGTPW_12126
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12126 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12126, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12126:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg2-11:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>     - bat-adls-6:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>     - bat-rpls-4:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-jsl-1:          [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-jsl-1/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/bat-jsl-1/igt@i915_selftest@live.html
>     - bat-twl-1:          NOTRUN -> [ABORT][9] +1 other test abort
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/bat-twl-1/igt@i915_selftest@live.html
> 
>   

Those are unrelated, please run the full suite for i915.

Thanks
Krzysztof

> Known issues
> ------------
> 

(snip)

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8115 -> IGTPW_12126
>   * Linux: CI_DRM_15716 -> CI_DRM_15717
> 
>   CI-20190529: 20190529
>   CI_DRM_15716: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15717: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12126: 12126
>   IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12126/index.html
