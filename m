Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC27CD690E2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 08:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7777D10E30D;
	Thu, 28 Nov 2024 08:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6SptME2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9CF10E30D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732781715; x=1764317715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rf5zMGMhf52kOb8ydE5dJQRtb/TFb8XY7+p1pM8q3HU=;
 b=Z6SptME27BowuD+c0EGtMnnOPNsysMAAwVwDExIeR1e1hhWH//aE4XfT
 Uf42R9vF7AJG7eQRlf/SsDN4YN5uIUfgYzi78x0q1J+4BkfcohmofIQAz
 XL2BalRrVz/UFIPFgd8o12TJHPrCA3TAGZgHWRaekEyW6JEnI3+WyMZsz
 6Pu9c3bIJcg5rT3Gyc9VrYqbiXVrS6sNLYWoa75GFYwKYJ1WF2zkY8F25
 EfrnLy1qQTlb0bdckpk63DR4DPKA90yrkVdDHoriwlCv+dhw5QEsMZjIV
 DxJ3nNzMTaEX7Aehsh6IDRuzCQ/hrZdd0J3o1pERkxi9z8VT+GhijKvgO A==;
X-CSE-ConnectionGUID: ++nUPyQNQP2TC4EK2p/BSw==
X-CSE-MsgGUID: k8oBOU2GSmiVI2ehIDMmuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="35865949"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="35865949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 00:15:15 -0800
X-CSE-ConnectionGUID: TQWM0h1FTIe0xrLGviM/GQ==
X-CSE-MsgGUID: SBWCHrlVSTaqgsIa6S8pSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="93003339"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 00:15:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 00:15:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 00:15:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 00:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgpxS31hWa7N+oKYj/YqkG8Q/U52JP8WMtCBUi2ggB/LhFM2xnD9Zh91Jxs9AWykJq17RDXlPKDmYigYLDsFnrbmsBxh5XhsQvy5ljVQLQW5FT8FZxP6YWGGcXLsxpZLcRfod1E4Qe4MwEVGfi1K8cjADuW3KC0yp0daOyLrV/MrIby89EV6fZS0jD+imEaxKfH3OnlVOYHP0WpYtbAuV+ImTv05+OVATxYrFoTumcSfjoBqC0OX3FQRONMohH/x0dWWfDsdwAj3qm3PeeO0uZswP0pNIBVDHShyns9bmGZx8mvuAx4e5Pi3ONIewPdXHjRafh08sRP8sx7b6TlrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK/C9IHIWMajdDz/KJzUHZMiVFIw6BDM5ZYl/rHVpNk=;
 b=AiMWQeJ1nBUyIsOZBWlM72T/0K4EfOYoX808+9JxDRBf4V60ngwYFaOrwACQ1rC/UZBaieLl3ImLD6Gvy5Eq597nEFw/54BiAZDMYzpOwhUu5NbHwGStOnqyB8wL+QwJrazd0ZREgfCPgqk3OpAkInG05B2J5ECJbGU/zAEghe7N0ASd+U/FxsDvyODNcm65zwdUzfuAsbOGnviOnyURE15A6Pb8V1DG8ndVWk/bJ1Z5MVNtqgipod4IkqhCgwJXFnBarcethLRrtMvQoeazdaq0R1vABmQZ+f13j8jzIkYNOqe46JSp8JKicdqtfpfp5jjmcJfbI3tCtM7wX65Yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 08:15:05 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 08:15:04 +0000
Message-ID: <179e3f80-a49e-4c55-877b-8ccced1c169c@intel.com>
Date: Thu, 28 Nov 2024 13:44:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/igt_kms: Add 6k resolution support for a
 single CRTC
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20241127081357.569876-1-jeevan.b@intel.com>
 <20241127081357.569876-5-jeevan.b@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241127081357.569876-5-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7714b2-ec7d-4dfd-65c4-08dd0f84c354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2pDcGRIS3VMUXJJNC9zN2UwNi9ucHJLVmdMRmtIcTlJczVlVk9PZGt3ZnhS?=
 =?utf-8?B?WUFhaVlEdWlxOWcrWTlxdFdYanlrN3ZJVUk0QmZHOCthcyt1aDRrM2EvQ0VZ?=
 =?utf-8?B?ejVEQkxwK1ZnbDVlWFZGYWlWaVJYZDdXb1czWVkrQW4rY3dJNVlJUFVBRDJT?=
 =?utf-8?B?bHRIU0d1OTBPU3cySmRMVEJGM0JuL0lmdEI2YzQ5V3lsWmxVWjdPbm5rbEJr?=
 =?utf-8?B?SEVRV3NPNm1UZFRKUzQvTFZES1JBWDRzeW5iUm95ZForTW9wSSttcWhSblVS?=
 =?utf-8?B?ZHNRVjRFMkllT013R2lDdzFQTXFWVWxBOERlWXpRYWlsSjEvSzBuOEV6bTJK?=
 =?utf-8?B?R1pTUlVqZW9lOGxEVVJRVnI0MGFjOUdVbGxNSGFSZmlvVEs4K2tMcmFHZ0VL?=
 =?utf-8?B?andISjN2UlBFcWRhZlcyMFU1d2VLUmRVN0RSUGxaUks4WG9mWDNrZmgyRWpW?=
 =?utf-8?B?dnRLbk16Q01wQzlkYmJNdnJoRHQzQmo3eE5VU3NyOU5HOENEMVplR3YxOXlP?=
 =?utf-8?B?V240eWszd3FXY21xczlqd00wY1VYRjVlZkdLRy9Pb3VOVDRuZ3A3eEI4TUpW?=
 =?utf-8?B?Q1pyMEg3UHlyYjBhWHJZbExpL0VCRjg1RGNGTFlzMHliNFkzMmtIUENiWGo4?=
 =?utf-8?B?Zk5XYTM1bjB1OXFUZXNuaSsrcVNYZUlZbzU3aFhYVlRoaC9HRy9xbnNLQmRn?=
 =?utf-8?B?RFB6UHdFL3hpdWEvNEpMc0pNSk5hR3kxVTVkRWRYTUk4QkhVdVlXaFcybEUw?=
 =?utf-8?B?eWNXcnRaaTd6dXZCTlBzbm92Z2VxTjdpSTNLNGFRZ1NOUmpsVnFDcE9nU0Jo?=
 =?utf-8?B?eFZrcjIzdmhaTXQvRWFKN2JrdjNlSG1WUlBDQ3VaS0tQL3BDU3NoTFpCNmxn?=
 =?utf-8?B?OEdLdWJ5TVU2S2krYnk4MTRabnE5em9uNFFaWEo5MS8wbEMzQlBzYmhMK3dF?=
 =?utf-8?B?MzJPSDF0OUZjaHVqTTUzNHBmRzEvRzFCUlVPQnd2cVN3UlRwS2tjbE1uMGRT?=
 =?utf-8?B?Tlg4N1cxVVArZTFPeHVVUjlWYy83Ym4yeityalFnaDM3THZrTHJ2NkJJYWJW?=
 =?utf-8?B?L1dBNTBnNFFHUVdrK3I5bFViSndUTXhmcG9EcnlWemY5YklVT2xBMjNieHEz?=
 =?utf-8?B?RUtISDhCbUk4ck5NSUQvSDVKVDV6Z0J0SzFwY2sxVGU4MUtGb1VsWTM3bmdQ?=
 =?utf-8?B?RXZNcFVhak5RYkxhc0Z6Sm4xMHhaQThOZTB1QzhyaWdiMTVhMm81MllYQ3VM?=
 =?utf-8?B?anRZN2hoakJrZkxkQlNvRzRLbFl6NlYzOWJNRkhjcmJpTU5HVHhmWVo3ejl0?=
 =?utf-8?B?Rko0b0NpL1JVakZJeVpqSjA2UVA1VFNKNUhaaHZnUkgrQ3haQTdlTHU1blhh?=
 =?utf-8?B?SnRRZjh1M3VtNjRUd0ZnYUsxdlBCVyt6ZTlMNVVMV3lHamIrZVpiVFdxaDRy?=
 =?utf-8?B?eTcyZXZtVExSQzY3M1Z2bDNqQ1BYWlcwUTdLRXVmVFhBeGVzeUE5YTBtY21V?=
 =?utf-8?B?c3N3NXJVUEFDM2lVNDRLS3d3MjdaQ01wMXRub2JkSStSc0lZLzhCVTNOZzBq?=
 =?utf-8?B?NG9Qb3Y2VkpJNVR3L0IvcVVaTnBTSnVoQUV6RmNFUXkrUE1Zc1FzR2ttWDVp?=
 =?utf-8?B?bDBDWm9hdHp6U3h6bWVmRWloSmZZRmFtbGpNUjdPYzlVaVRjQ05kOUdTcE0v?=
 =?utf-8?B?ak1YaFNKTTB6S2xxa09WMDVVV3I4T2pvN2dVTGhjdDBZLzJvUU5BNXZQbkRH?=
 =?utf-8?B?N2pUT3hrbk5uOWxreGorek9ySzc2cXVMb0FVaFRNVnpSSkc0bFpKTDY4VDB1?=
 =?utf-8?B?Zy83bE9LNFpxQzl1SFVOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWVnNUh0QjNPN2VJUCttaGFKUy9pSVRvZXJxRTFVRXVVNXJyRSswK2w1aXh6?=
 =?utf-8?B?cCsyVzg0eVZpUXpTdXFyRW1jcGJnZHJScU11dE1RMFpoR2ZCL2E0YjlsRjJG?=
 =?utf-8?B?b1YvOTVJVHhRazVxZ2MrNytvTElJMlFpS3hJdmxWMk9OUmxiOFJVeWFKR3Av?=
 =?utf-8?B?R2FwSUs2cHJFdDBuUEI4NWJzeG1oS0lRWENjRUJ6b2J2Rjc5WHZ6cVlDdVRP?=
 =?utf-8?B?WHBzdnBnSUJjU1E3VnIrTlBpSEsrYWh6WUc2amZTRC8rSUpYRFVyTk0ydkxj?=
 =?utf-8?B?aEZvdksvWXJuVEVnbERZa3IyNCsrS21iL2pzODFxNWpLS1g4TDc3Lzdnb01C?=
 =?utf-8?B?UGhoYzJ5dWNvSEQwOFdWTFFUZktpUzBGUXZqVFplTkh6MzBhQklMQXZhMmQx?=
 =?utf-8?B?NG41a1U0RnJwUlVJd0kyWmhoUGNSb0pOVUJNbjZYNk4rQnRiU0VIKzFRZW1Q?=
 =?utf-8?B?MkpvVDNDbE1QV0VYMmZhVVFDR2dqNTAxVEtXRDF2NWhQVTFLY2xrekM5Mjht?=
 =?utf-8?B?R0taQjkwZTNhNjNGL1JMWFF5Sm9OWUV1Qms3THZMdjl4dG9WdU41Z2xnZUNT?=
 =?utf-8?B?U3d3SWpnQWRTYW41cTBUQzArSm9lRloxdHRjVW9mWHJUSUxvZzVOdVlidUlC?=
 =?utf-8?B?YlZzWnFyL0lUNFMvWFlqYVRxNUVyTU03cTlHOVFPdE9xeVdvcmhTQituYjFM?=
 =?utf-8?B?Q24wTjZ3TnhNZ29Ra3NUVnoyUGM3ZmtpcDR4b0ZCSnBsUStuZGl2VmxwZllB?=
 =?utf-8?B?cjB6ZmpnRFBwTXhhUlN4U1dpM3duT2d6eFV3anphNHhOVXVNRXRPU2pXUnhi?=
 =?utf-8?B?ZENlL0Z2Q0pIRktJVjREZzNkTjNKQXZSMjFDb1c1blRVVnpkQlZKSUsySlFZ?=
 =?utf-8?B?L0xmQ0JKVDdmcngxb1d0eFJFaTY5SDZWVzdySTdMT1FqaEVmeGUyWjUzR05Y?=
 =?utf-8?B?cFRXcGN5ZTRxN2p3OE5JS1YxaFovZnltQUt0YkpTYWhGRUJYYTZyemJkUmNR?=
 =?utf-8?B?QTFSY0Fld05zRjZZekhFK3NtaTVUeXMvcGExa0cxSk81cG1CdU9jOGhEelQy?=
 =?utf-8?B?ZDhkLzYxaFp1R0Vhd21adWR1NDF0UWRWS1dScGdCWnp1V3dVTjBPNDhKQWFR?=
 =?utf-8?B?Tkx1dlJmZm8zS0F0RnNjVFFmMmx0dmUvYi9uK2trZjA2ZERUcEhucjdxZWFz?=
 =?utf-8?B?ZEtZNGpJREpzblAzNUQxTkowYU8zRmdqOVVPS0FObU1mcEFTeEF0cllPN0JC?=
 =?utf-8?B?cGVReUIzK0dmUkRqblp1UXQ4TmpmUmxjNkllZEt0WWdXOWVIOUhWWjRYVjNH?=
 =?utf-8?B?UnVSM04valBYd0NzWlQ1dFNQWHR3OUIrUFlzOFc5NGlHU1V4eUFjTjM2U2g2?=
 =?utf-8?B?ZVZYT2lEQlY4eXRUNkxETmF6QWRiUE5WRkxMV1dLZlp4Vk9Sd04wS3JDdk52?=
 =?utf-8?B?dEJLM1pkU2oyOUxIKzdwYTNTakpIei9DblhOOURvU1RUVlhJOUdMWmd1M0lL?=
 =?utf-8?B?RGJyOFhuNy9zb2RxbVl5SmVxVlMyZDRSR3B4R0lCS2QyOWNPYkt0Z2lUMmpJ?=
 =?utf-8?B?VXY5Sk9xVjliMFpoc255S254WFpTb1lVbHZxcEpQcnVSUkc0SlhiNjdTbFVR?=
 =?utf-8?B?eXVvQlJyTWlOQzdIMW1DMXFwcng3TU05bFFmSTAyRlBVbzQ1eCtaWnhWR2lK?=
 =?utf-8?B?RUhWNm53VjFGVGluRHhETjZpVUd5a0FvdGFMWnlqSGVSUVo0dkNwd1d0WCsz?=
 =?utf-8?B?QncyS1VJelBNVFI5Z0I1RkpkT2ViN3F2TUJwUXVaVHRlL2Y3RjNRM25YZ1Vl?=
 =?utf-8?B?RzVEMTBFYnhBamVhYWttR3VoMW5YZ3ZEekJMNTRPQmhQK3N0ZHBlVG5neXd2?=
 =?utf-8?B?SHUxMHNlZ0xhYnQxM3lHVlNieDN6VW1OZWh6U2JhZG5LMFp6cWFXTENhc0I2?=
 =?utf-8?B?SFNUYkFneHBpc2NnR1NoZjJaRnFVcWUxK0lGeHRWN1Y4WGR2M3UwNnBkNk5m?=
 =?utf-8?B?d2JVQ2NURDF3VFJ0N3NlRFp4QmxRMzVwMjN1TnB6VHVxVERsQXhOUmE3Ymli?=
 =?utf-8?B?dTY4K0FPT3lpMVhCVXdVZzdvOVd4aWQyRU4yRXFyRHNUcUtsL216Q1hUUFFQ?=
 =?utf-8?B?eDBJSGM5TE0zczQxdTJYVUZwRDdMVm8rTzZYR2lhYVlNVjdJWXZqaG1yakh6?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7714b2-ec7d-4dfd-65c4-08dd0f84c354
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 08:15:04.7566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coyitGKe42bg6JVSVou5s4rmk6qsonveZtu6c7tgAcb4Ey0N3Xqdh6SuaYs60ORjVKao+4rpKeYfTTlB4h6uXryobCeO1PfZBEXV7C642js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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


On 11/27/2024 1:43 PM, Jeevan B wrote:
> increase big_joiner limitation to 6k from 5k for display version
> greater than 30.
>
> Bspec: 68858
> Apart from lib following tests are modified:
> tests/intel/kms_pm_lpsp.c
> tests/kms_flip.c
> tests/kms_setmode.c
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   lib/igt_kms.c             | 23 +++++++++++++++--------
>   lib/igt_kms.h             |  5 +++--
>   tests/intel/kms_pm_lpsp.c |  4 ++--
>   tests/kms_flip.c          |  4 ++--
>   tests/kms_setmode.c       |  4 ++--
>   5 files changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6fb5822ee..f8c240c22 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6355,6 +6355,7 @@ int igt_get_max_dotclock(int fd)
>   
>   /**
>    * igt_bigjoiner_possible:
> + * @fd: drm file descriptor
drm_fd would be a better name.
>    * @mode: libdrm mode
>    * @max_dotclock: Max pixel clock frequency
>    *
> @@ -6363,10 +6364,14 @@ int igt_get_max_dotclock(int fd)
>    *
>    * Returns: True if mode requires Bigjoiner, else False.
>    */
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> -		mode->clock > max_dotclock);
> +	int max_hdisplay, dev_id;
> +
> +	dev_id = intel_get_drm_devid(fd);
> +	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
> +			HDISPLAY_5K_PER_PIPE;
> +	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);

leaving a line before return would make it more readable.


>   }
>   
>   /**
> @@ -6387,10 +6392,10 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	bool found = false;
>   
>   	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	if (!found) {
>   		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -		found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
> +		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
>   	}
>   	if (found)
>   		*mode = connector->modes[0];
> @@ -6409,7 +6414,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>    */
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
>   		mode->clock > 2 * max_dotclock);
>   }
>   
> @@ -6605,7 +6610,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> -		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +		if (pipes[i].force_joiner || igt_bigjoiner_possible(display->drm_fd,
> +		    pipes[i].mode, max_dotclock)) {

Better break this after ||

if (pipes[i].force_joiner ||
     igt_bigjoiner_possible(display->drm_fd, pipes[i].mode, max_dotclock)) {


>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i].idx),
>   				 igt_output_name(pipes[i].output),
> @@ -6632,7 +6638,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   			}
>   		}
>   
> -		if ((i > 0) && (pipes[i - 1].force_joiner || igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
> +		if ((i > 0) && (pipes[i - 1].force_joiner ||
> +		    igt_bigjoiner_possible(display->drm_fd, pipes[i - 1].mode, max_dotclock))) {


This should be aligned with parenthesis for (pipes[i - 1].force_joiner ||

>   			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
>   				 kmstest_pipe_name(pipes[i - 1].idx),
>   				 igt_output_name(pipes[i - 1].output),
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c2fbbb5b0..a5ceaf116 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -146,7 +146,8 @@ const char *kmstest_scaling_filter_str(int filter);
>   const char *kmstest_dsc_output_format_str(int output_format);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
> -#define MAX_HDISPLAY_PER_PIPE 5120
> +#define HDISPLAY_6K_PER_PIPE 6144
> +#define HDISPLAY_5K_PER_PIPE 5120
>   
>   int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>   void kmstest_set_vt_graphics_mode(void);
> @@ -1241,7 +1242,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> -bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool igt_bigjoiner_possible(int fd, drmModeModeInfo *mode, int max_dotclock);

lets use drm_fd as mentioned earlier.

With few minor styling fixes, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>



>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 889da42de..74e9d799a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
>   	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
>   		return false;
>   
> -	if (igt_bigjoiner_possible(mode, max_dotclock)) {
> +	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
>   		for_each_connector_mode(data->output) {
>   			mode = &data->output->config.connector->modes[j__];
>   
> -			if (igt_bigjoiner_possible(mode, max_dotclock))
> +			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
>   				continue;
>   
>   			igt_output_override_mode(data->output, mode);
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 88cd41083..3ad4d0afb 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   				 o->kconnector[i - 1]->connector_type_id);
>   
>   		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
> +		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
>   		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
>   		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
>   		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
> +				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
>   		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
>   
>   			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bc7b8fabb..d61cfeb9a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
>   			 *   - current & previous crtcs are consecutive
>   			 */
>   			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
> -			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
> +			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>   			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
> -					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;
