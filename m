Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08184E7718B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 08:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE94B10E2A2;
	Fri, 20 Dec 2024 08:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCSbUGSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681210E2A2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734682974; x=1766218974;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6mYRJumv/s7gMkznD36pH7jnQr/FUWZV1vmg0oSP+Nw=;
 b=LCSbUGStKydWh8sy0EZtPa75PUJetSx3KR1n9KHVVps7T8SezwDXO+gG
 4BEBNTqpq/x1sbDHBYGsZY+ceL8NxQLUXeiARrHNcMOzE0PAHWsKE9YeX
 HNnA630iYfTXjMuww/5gqxDnLzzuTNSPAOQHEQPpJ1q3VpdkzNVWIweu9
 5T18JRWfZ7281teA4eXq7h/5/fYUcMN3f0gO/mwD+1Lj1qlCo6sA0MFM7
 NZBAD+Wc44kmwVVIyGk9M20+K2NeQLq7j9rJRgNTxNr6iSBxzj0K6ryKr
 sV2XuL3jsRqXDJWc5CkxhON5woWx44cjFm6F+bdwdPfeRL8Z0FffZqNSa A==;
X-CSE-ConnectionGUID: FQBM356GRUOUkjJu3i/m0A==
X-CSE-MsgGUID: fauzbYQMQOiZVKD516Dlng==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57699370"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="57699370"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 00:22:52 -0800
X-CSE-ConnectionGUID: GxYL7NuJTumeh9E9aMDfIA==
X-CSE-MsgGUID: dsxKrDjET2KYNdetRqNdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="129274650"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 00:22:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 00:22:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 00:22:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 00:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XitG3e2kuzJyfX1/a6Z//X/qRNy59vHJBOwnydb/1gBmsdFC38cvkZFTd+tlBU2XIsOHrs+sHhgmEPRJ+gHxf6BhMASfHG6P7tifSp6XnexAn2OMQId/YjJqX0wRRMl8Irz22q+vgszfguqCl2LNcAE2YTlzE1e4ZWgbzVU1hteDoWIOqhRMxzRARne/0af/uHRnH85RsReS1CnVoLZEerxxSLkLZTzpi2KPc0SBJgwsx7UGmGKobIKaIb/Lfqi3g6gYILTBKoCgbZtzW5xsCTZ4Jz6j8rOZzudinNyOyuaJDNhX/vEaOFWbagkOU1yicOetxZpyKv7kPm0LyoOeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW8WLBPaCgqVAbtvY9tKizIdpwLRn9iSJ+fhRBW7Pg8=;
 b=l1VWFdGQ7Xsshv2biAjkOiL86aDyu/tRqKuDYpOpbMXpIPmXc6aLIlF6USDlsR2yyoq/Rb3TmCXjSTGwCLgxwZmLq7Hw6DOdPZukA1WjDZdOJ20ACFY6zXx960ExoFkHupfTKyXk8m/lwCRdQYlmZSBFoxioKTOCGm7YEccacvRdIwof3u+yHEi5pNy/GmenzNPxuKy3aeFrTSiqTV9C1tTfhRwATCPHmqoIuFojFSMtEZqelJRaJRjlhTNPdqBTVjR+O8bOaIElGdmxhUjpVEpjL2Ctd+1B+GkPHrVNPL5iReLIugopumcfjzmv22F/K+OxpBclZiYMwTqBuQy6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 08:22:21 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%2]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:22:21 +0000
Date: Fri, 20 Dec 2024 09:22:17 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH I-G-T v5] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <fsrdvcetehtlvgwh75cffdjdejz4jj35uee42e2f7cwakelvch@rer4q6wqn6wb>
References: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
 <Z2SNxfSA/stYuCbt@orsosgc001>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2SNxfSA/stYuCbt@orsosgc001>
X-ClientProxiedBy: VI1P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::17) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|PH0PR11MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ca391b-2986-473b-6793-08dd20cf6cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVFFUExnZER1bVM3VzRia0xsTUh2UEJDM293eWlPRW0xSDBwWERZa2g3T2Y4?=
 =?utf-8?B?ZkgwUUZMdk83RnNtRW81bm5IbU1IMFFvUkhrWmlHVEZxamJaelBjR0t0b2RD?=
 =?utf-8?B?cU5lYU9hMDhpMWtaNFhWVlV0eEJrb0VmYU5NMGUwcVgrS0k2Y1lTSHNLdVNC?=
 =?utf-8?B?UzVaSHMzYXVWNVZZdDJWSEkwcHRxMDJVQThxQnZab2JZTUVrbjFjZUxaZ1A0?=
 =?utf-8?B?dlArZ2tWSjkzdmxYVEZJTGxQQkZ0UndmZUJCS2J4MUt6RjFVdXpnNWlrdUJn?=
 =?utf-8?B?bnJ5aGR5TXhvcUduejVjZkxnaC9rUzNJTTFNOXRFWDdwR2EwUEJTWC9KaDlH?=
 =?utf-8?B?SGVkRVlldit6UWM4aG0wazBuUHhITjNDdVpuT1VVaFozeStvOUpVbEl6RFRm?=
 =?utf-8?B?Mk5FWWJlV0graU1kQzZLNUZraDFFYjNJejRRaWNjWkxQalFjbEZNZHlQVEg1?=
 =?utf-8?B?WjN3Y3JUUEJNUG1USXhZMW1yREt5U2JUcWxDZ282Sy9WNm80MnJHSVFtTGxi?=
 =?utf-8?B?T3JwaHRPckU3eEg2a2ZtTUhzSFV1VkVGKy9RaEZhRTRVZlBnUFJiVzNEZGdj?=
 =?utf-8?B?NTk5dHRocTNWRVFrRFVaV2FxNDVGUVR3MEtLY2Vsd3hFVmlBK0tkVnM5Tzgy?=
 =?utf-8?B?VXhZT1pOc0JJdno0QmFFdFBtTTQ5cmVVZWdhZmhsaVdUek9HalhzL1FNZEov?=
 =?utf-8?B?bmswaTFtVmlYMkh4RGQwNnFURkVXWVhabXdpcUtLTEhkQ3pqTTlhV2UxVXF2?=
 =?utf-8?B?Y2Y5UDNlSjZINFlSaVI1Tk50L3pIaDRPaGFiR3hmaFhBZjM4Uk5aQUIwTU1W?=
 =?utf-8?B?L0dOTlRTOHAvWlFnanZDR2dYZUVXQjgxUUZHMVN5TjU5MVdHd3NuNk1YZHMz?=
 =?utf-8?B?aFVYV2h3RGlHS1ZaU1luNE9ZWUNZKzIrOEx3Qit0NWV0M2MwMVdNQzNYVlhK?=
 =?utf-8?B?MTVaTHVSQkFUSmRwRG9uQUMvYk5DS2tNMlBkZmFjeEs5TWhYNHMzZUpPNVJ0?=
 =?utf-8?B?NnlNODhsSW82WVBRYlkwVWJCNWVxZVlwOHIzUEhjWG5iaTdIK0F1amhxV08z?=
 =?utf-8?B?aktDQ3JTSHZmSUxqdHRXWjl5Q0lyb0hXNkVaWnp1eVR5SHoyMVVKNEJacnpt?=
 =?utf-8?B?S1Fxd3RaSFk0MEhTQmVGWVNSZzh5dU5nNXN1UnVIT2RLZnpJMzBINmlBZG1X?=
 =?utf-8?B?aUdNb0ZiSmlTOFVETGlWUGxJUTBpSXhhYklhT2lEMEtXaFRvRGtVNTY1eWZa?=
 =?utf-8?B?b0Fmc1FEN1ZiVE15L0pRQy9nSHc4dTNtUFhnZWJHYUtCQ2Mwbm1qaVhVVlVq?=
 =?utf-8?B?YmdyWmlKaWllSzhpT0twNDVnQ2Z4SEh2eUM2NFZqTng3ZzZXZGJtWm5WVU5z?=
 =?utf-8?B?NUNkY04vcmJpVldsNTRibGFXamdXdXhvaFhjWkZ4dXRIOTI5MXdSUFdaRDg4?=
 =?utf-8?B?b1ltZ2daMG9oc1FXU3hpM0JzRUprUjZhMWFzQmxESnNZbGdoNWJpemZYQW1P?=
 =?utf-8?B?cmpzMVJqQnlBMmgyeWxJeXB5MU9vOWx5MVcwWWF5cnlnRmw5SWc1Nnk2L3kw?=
 =?utf-8?B?bzgweHh3SVZTRVRhaGF1Ylc2bVRKTlVKSTZZQUJuekJCVnl0S2FHZFlNYzJO?=
 =?utf-8?B?d0x2NFptcVN3cW5SVjZYQnZZMDRuOXpvTlEwVjZhazYzSXd2VXVkYVhWSTIv?=
 =?utf-8?B?anFBSDlock1HMXJ0eWdFTzByQlJ2ZXVJdmp2RFFKVSswYnB0bVFFcGdIbkVh?=
 =?utf-8?B?L1BkcmJwV1JhM2hRdVB2QzNQZy9ZRXlqR2sxcjQxUzEwbnNtTzl3dnlxOWhv?=
 =?utf-8?B?bE9IZ1hiQ25GT3ZTY1kvZlhEWDVzK2hlQ1NZdTFMVHRRYjlZekZUL1ZqRmg3?=
 =?utf-8?Q?tfB6+09Nu4qUy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXgxZ0plZXZjWlBxWisxK3g0anB3ejVJdFNCUUNnbUl5REh4L1JPMlNKVUdi?=
 =?utf-8?B?WUNOYnFIYTZuQlI2a3ZZQURoS1VsbGwrSVdNNDd5K3AzZnhnT3pWeVk4dm81?=
 =?utf-8?B?ZkErSkN5WDZlM2hSZFJzNUpERVFNVEF0R3E2OXAzcVhobnV2Z3hKTExlYU5R?=
 =?utf-8?B?MWZUYkFOelUyNmJYY0UzN1J2bG5zOWhSa05DM0gzRU1jenRBa1dMVWNmK2ty?=
 =?utf-8?B?K3ZqWHpDcDR6NG5MbEh2Rm42TVlLZVBBMWZHYy9RTThmNjRDaENNUDJEc2RZ?=
 =?utf-8?B?QkFHWnV0OWtKU0ZaMWFrd21ROWVHUnNPUlVnbVJzMGVrQVhiaFU3bE93Njcv?=
 =?utf-8?B?OHRvRTIwNWFJdFJmZnBqRVpCc1QxT3VFS0dQUkVKZHVXaE94UXFieU1hVXFJ?=
 =?utf-8?B?QVdYcU1uai9Qc05YdHBiOVRHK3pQSksybmJMM2hGSitlNWdXc2d0YjltK2dV?=
 =?utf-8?B?NVlyajRiU2g0NUh4UFVQb0w5T0NJMHJSNTUxL29TSGdITlBmeHA3UHZ2Zjdu?=
 =?utf-8?B?UzU3VXVoNlBYT3Ixd1h2OG42aC9CVUhFNThhK2lvZ3ZHVTRjMVZRcStwRGNa?=
 =?utf-8?B?dWxlSVN3K0M1dXFWWDR6TngwWHI3K1lSdWZDMlVHRXU1RmExdHc0K1BaMEVn?=
 =?utf-8?B?YWNDM0x4NkpLSFdWSmJNNk5OeXhDeWFqOE9FZTBGbjNJSHBGanB6UzNnajly?=
 =?utf-8?B?cGMyUktsRDlNK1NncHc5N215SXcrMzFqdWVZVkNlb3VMY3pUdHRmYUd1cEVN?=
 =?utf-8?B?eDFLbDhZbnI1Y2x2UTF1cTBKSGpVNXJJWUwwNktrM1kwUldnSGVKcW0wQ0tW?=
 =?utf-8?B?N05nOW1WcGNlUFNvdGcxWkxaRXRabGRSV1JGdXk5UFNWSjcrUkxOc1NMQURU?=
 =?utf-8?B?OURoSEJLeHdTRWRYc05vUmN5UnIyS1ZZU0E4UHZNUXppKzZva0s5K3VVUytL?=
 =?utf-8?B?d2hPenA0NFcycVJFVC9BTEZnWlB4U0YwRnZPZEh4b2w1ZHB6Z080eUpYRFpk?=
 =?utf-8?B?blRZSTNpZjJSeXB5bnkwNUJIMjRSdDhJaXMyN1RxSXJyekhIUlA0cXo5eFVB?=
 =?utf-8?B?ZU53Sm9xQVZnRVJMdlFYRUlQZ2lobHlBMlVYVEtvU1JlOE9XRVVVbDlKZEdy?=
 =?utf-8?B?RzNaWENQK1B0L1lISjROcmc2ZTVPeXpqemRjeXFLZjVvNDRGTDhSSEdBZXdY?=
 =?utf-8?B?QmZIRHlVOHFrMmtuUkdlQldSZDhGSTk4ZlNicDlqV2UySmhlKzFMenZESkl3?=
 =?utf-8?B?all2by8rcUlwWVo4cFBkZWpvY3IxajVieTNOS2g4UVBFZXV5Y1ZBQUF4Ty8r?=
 =?utf-8?B?YjdvQ0ZWbWJhcVJPRGdGeU1wV1dqUStKZUhQeFV4V3UzaUJ3ODNmaEYyT3Vr?=
 =?utf-8?B?aURoUGVWamxldzQ2WEZSTkFMUVVUZldudHVRNFpxQytMVnB0R0UwWGVMVWU2?=
 =?utf-8?B?RVVKQlBYand6dG4yaTlQUHJyakZ5ZHdTa2RROFVYWGx0MEJZb0ZPUXdURUp6?=
 =?utf-8?B?ZkNyc3hOdlg4VEVJQ21jR3dFSmdGUnpLZ3pmVWhZTGdnL1NlQ2hFWWtrTS9V?=
 =?utf-8?B?b3BidWIxb2x6Q0tLQ0xVQURMZ2psZ1UxTWoyQnM5akpoL0xGUnNPcG1yOHpt?=
 =?utf-8?B?QVAvbTgzdFFKNjZsRm9WMUk0ZFFRS3BEMkQ3S0UraWNEQzQ0bElMaWwrZDZz?=
 =?utf-8?B?NmkvTEM5bi9LSk05cWthRXhUeTI4NHdNVFZKQnZkWmlCSU1obVgvQWxWM0F6?=
 =?utf-8?B?cmZNTVNPeVNaYWFQczErQzY5UnU2V0VSejF4UUN4TzBqVGtINWo4Ujdna3JQ?=
 =?utf-8?B?VnhOUzFvL3d6K25rSHdhTTlDcWFCRDNVeVo0YmExajZCTk5lOEp5bkNZb3d4?=
 =?utf-8?B?bERXQkpYdnVVeG92d0QyeWdWSm1oaXF5VFp2OTJ5RFB6TlZ6NEFqTko3NmpM?=
 =?utf-8?B?OHh6U2ZVNksvbDg1dHpQNEZNemVtN3c2UWNHSVE1MzRKZG1teEZGS0piOFlW?=
 =?utf-8?B?Qzduak1KbHdSRUh0c0tVNW0zMmxQYUFadmRqSmx5MEZ3VUdHYjZXNmI4aEJI?=
 =?utf-8?B?dVN5ak5yNFYxUUNFckdPL1hrRVNZQ0hZSm4wMHczcmdkVGp3RWFNQ0h0L1JT?=
 =?utf-8?B?bkZhcUw3cGZQTG02R3F4WFR6ZG9qck92NExDL3NGdkpFUHU3M2ZsSTRteDN0?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ca391b-2986-473b-6793-08dd20cf6cf9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:22:21.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMxWl3GuOJTIUsg+NPJ7FOqy+3ojmm0X22FJnfmpVTkJk+fq9g7N5slDHghhm7xGXdZQZAi+WWadFfFyKq0JLa+D5oN3523hJHvmFfxL2p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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

On 2024-12-19 at 13:19:01 -0800, Umesh Nerlige Ramappa wrote:
> On Tue, Dec 17, 2024 at 02:45:53PM +0100, Mikolaj Wasiak wrote:
> > On DG2 when RCS engine is active, the CCS engine freezes which leads to
> > hangman test failures.
> > This patch disables RCS and CCS background spins when testing any engine
> > on hangman.
> > 
> > Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
> > ---
> > tests/intel/i915_hangman.c | 14 ++++++++++++++
> > 1 file changed, 14 insertions(+)
> > 
> > diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
> > index a556eec53..6f1fdc788 100644
> > --- a/tests/intel/i915_hangman.c
> > +++ b/tests/intel/i915_hangman.c
> > @@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
> > #define ERR_FENCE_END  3
> > #define ERR_FENCE_STAT 4
> > 
> > +static bool is_rcs_ccs(const struct intel_execution_engine2 *e)
> > +{
> > +	return e->class == I915_ENGINE_CLASS_COMPUTE ||
> > +	       e->class == I915_ENGINE_CLASS_RENDER;
> > +}
> > +
> > static void
> > test_engine_hang(const intel_ctx_t *ctx,
> > 		 const struct intel_execution_engine2 *e, unsigned int flags)
> > @@ -388,6 +394,14 @@ test_engine_hang(const intel_ctx_t *ctx,
> > 	 */
> > 	num_ctx = 0;
> > 	for_each_ctx_engine(device, ctx, other) {
> > +		/* Due to Wa_14014494547:DG2 we can't run RCS and CCS
> > +		 * in parallel. We still want background spin of the
> > +		 * same type as hanged spin to be run.
> > +		 */
> 
> Ideally this should be (IS_DG2 && is_rcs_ccs(e) && is_rcs_ccs(other)), but
> if this is working for you, then
> 
> Acked-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 

Hi Umesh,
This version also takes into account case when both rcs and ccs are run
as background spin. Previously they'd also freeze but after patch they
don't.
I'll keep it as is.
Mikołaj

> > +		if (IS_DG2(intel_get_drm_devid(device)) && is_rcs_ccs(other) &&
> > +		    other->class != e->class)
> > +			continue;
> > +
> > 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> > 		context_unban(device, local_ctx[num_ctx]->id);
> > 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> > -- 
> > 2.47.1
> > 
