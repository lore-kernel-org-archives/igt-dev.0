Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6CE606A33A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8wR+i0F;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QCBBXfvr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B612E10FAF3;
	Wed, 25 Nov 2026 10:25:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCE410E0CE
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795602246; x=1827138246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Yoq3pDzAcw8vi5HA4b2sGyTyA6mVqoFex4pQIPKGAk=;
 b=L8wR+i0FDiRGFy/D1hwcJ2Nq5QocDEDfG11JXuXHYwbdn+hlNvV5GCDR
 on8esKrx6dXuGJlanoV6uaIkyCfkQjD6nGEkFOINkIPf4hr4ay/7roIOm
 d9bZ3XioFOh3CsfS4HtVs481WgTCAwg8GLoSRsNs3Mb2+eSgORv8FRta2
 i6MGLwknlvp7s/SiTcebFfFbDwlOTT+fHjW6tcgJK0iZd9SljG0Cx0ZIn
 +i1JXTJJ8SPqzRfmqXR16xE2a8/gY051c/Y0qMoiLEeDL6TW0i4f+HUbk
 N9FWK0Xg89pQtq76NU32iB1jXfvsTI0iqDWBTWNZDYp2MGYi3ZvbPHlMM A==;
X-CSE-ConnectionGUID: 2bAMFJ6cToKToJPHP54D/A==
X-CSE-MsgGUID: PkMHhEXYQimZjpLKj7wVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4378181"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4378181"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:24:06 -0800
X-CSE-ConnectionGUID: k+h/ZgmaQs2oEn93OCqsiQ==
X-CSE-MsgGUID: 7h7K1gvCTQW5azWDS5jvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11849672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 02:24:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 02:24:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 02:24:05 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 02:24:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmWckdZGtZ4oa/S9JdDciaF6NRM2+5HEnTyHel/GJ0vMkytRjf/OqOb07Q/lv+77nFYwehgxnGF3Dt5IrhL1rzjJyWPslYBXQftacpIyxDa/0/T4JT2WE7fMJpZC2Ih+QDIIJcxVE97Ujb4NDcfm/DmEMzGkj9Ss1pMU5EuQLNFP94iDyK2HqFfxCPvldpdj7vRopiLzHEzM+olIRPi0rlN5CDPnR0qNviGjYyqRzXWLhusAhTMPSE4TAY1sFcpYUJRGAspjEVyZYZYOJuCvneVQWhbq9kdGtCfKTnEPRnYc29LkXSGWYkSQIuCZjyiBSotwxlAoIZySXyvEolc6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtB5k4qd2v1X7NpocRRjYt/sKMmIj3eArabMDwA3LUM=;
 b=sQpBjuVUA1iZgIb94VL4K++64PKyJIlNorK7H+tvCWD4Yhss54Ub8Sbq/bO0/WhAUDRUkpCFDKuwOh6aDSlQ5yFGomlOO4xv0/fTvrfbFKFxbc8+ujjSin4V+iIZF5NSJgTMyKC12SNzc8aQNVcOHlpku6PcUpYjZm6TEwOMRsPAUQZjPUlyWTOKAQVfBLlqbIfU5nKvHL2LkzYiG3+eN9pniYKhAbTS5en6zQ0K0HN36RQdI/B3VautHA1xYUhbjBwWUnVKH/139cPoQDAYRe48mnLZlGEmsXf7FJnQt035neWijABzOS9nzcIIOSBJC/s1DVdf1mNRWU2rvDsAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtB5k4qd2v1X7NpocRRjYt/sKMmIj3eArabMDwA3LUM=;
 b=QCBBXfvrcnAI9pNQ3vJmlX3uvz97UEwwLNreJWwXAbBYTwSGx/YJuDOFRWJ3jsjnUEsFt2YYNrsqvRhwNH2Se+p68ldVLIOAy5xQKL4PnuO9CRSdONfDKthUK/qKrrq88w3n4hbKgk8PaJtnlqTOOPvMQNCckj35DYZU2c/Rins=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 10:24:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:24:03 +0000
Message-ID: <9d21bf9c-e556-4811-a5aa-ab54d7de0d7a@intel.com>
Date: Wed, 25 Nov 2026 15:53:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <chaitanya.kumar.borah@intel.com>
References: <20261116091832.1312335-1-karthik.b.s@intel.com>
 <20261116091832.1312335-2-karthik.b.s@intel.com>
 <30c5d931-4e9e-42cd-95d9-8019f4ce56ba@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <30c5d931-4e9e-42cd-95d9-8019f4ce56ba@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0364.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: e740605d-2b29-4db6-c4a3-08df4ade3a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|42112799006|366016|10067099003|4143699003|261028144727099003|261021121427099003|56012099006|11063799006|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: BCUoO/0zVbbyb+snjOn/3s8cd/SwjWTU9VMQ69UU1xzcqL/wAf2Ix/sRE9wpDBjiMKCFabkUMRccST9tkFVRzuE0YrxqAH4TVaF+HyXGTibc3fdB67AytVGHXhUffX/Q1YMgbY/ZWpFIXXUg1k5eI2NP5QlAbjIBPpEKXCtZSEdwEN3ZkMLslaZZnjvXJwKECDuezTapqNHrR6fw0JMknUXVJULZ0aBwci8YyEOAehK3H1m9C1rHllfsa8RpKTjhNk4wOC9EFWwI+7dsmJnlPi6isoQWiFvBUQ7xv/Ft3m693BUe9VNXcYOaaQQqMqD05wEDUJ7bBb5hIknvPkiHE7tRJm8wWPMgbOLFyqcNfFZNzVuVhlZpKH62uhRrvUti4aesVQxciBA8c2Fe6HlgYYdHeHvsKCL2mK4d3wKFGDGbwztukYodpJLwL4k/ZBThHjXZAF+Utot059bjfER0co+VaJBixD8lKQ1w5IhwVzddryHvSlpKt9u6JvDEfFExNXIVjdfk+v8AXciTwTnzsH9qF4qkQGndFvs0CR+60IT4XJTe9Gs3xK60vsK5Y4N1nehEjAwUZvI1fZksSgVopxr34U8p5eybd0iSDtunw/ITmxb2FuOUszbRrybqL6xN8/hWnEvic5NOaz5rL6+j3Qjc0mkUi/vh39Ff5I57Aug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(42112799006)(366016)(10067099003)(4143699003)(261028144727099003)(261021121427099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhkL2w2YjY5S3FqaEJtR3VIRXZuWVRlSWI2WHB2bW9PaFZOZXBFOXdhUUU5?=
 =?utf-8?B?M0hmeXMxWEhTb2Zia1hkZ2tjYVYyRGRJZncyY3hRZ2tqUW96bnRFUlVJQllD?=
 =?utf-8?B?WktqWG1WOUkyQ2kvTzIvamhLT2dWc05EMnV2Uk1BWnA2YlpyS29SeTN5QSt0?=
 =?utf-8?B?bm9GZnZYVDF3V2ZGTHN0Y3BleXVtTnBrTmgwcDJVUlQ2bGNaMjB0YVcwUG53?=
 =?utf-8?B?dU1ZQm5xTEJkZ3I5MDFRWmtTM1pCOXJGSytPNkZ1eEVuS1RZU3pwa2MwcExK?=
 =?utf-8?B?N3Y1Ykx0ZjhibDNQKzhwblhnRGc0M1NOTG9wcGhNd2IyMEZ5NnRPdUlLNEF2?=
 =?utf-8?B?ZUlkNHV0MG1Gd1pzNWNvOGZ5bDN1WmpwYzJNWkttUk9xc3RaaE9WZlYyOTNa?=
 =?utf-8?B?VU1kSUdSWmZJa1AyWGlDYWFaOERUZFFNbjhqRUNQOW9TOXl1Y2I3RFJSMlky?=
 =?utf-8?B?RTZoVWF6ZS85SE1tcmI5OUMvSGJ5dlA3cVJqNmk3WERaN25uTTFwSkVoeVVN?=
 =?utf-8?B?czB0SEkvY2NkVUt6Q281YnRpVERwY29qRWxLR2UvaXoxbkNMcCtmdG1KZS9I?=
 =?utf-8?B?UHM1U2VxSTB1dVB3VDFpT3d5TTJzT2lUaVVBQmFrN0JLQlVUSUR4R3p5UThM?=
 =?utf-8?B?c0VZeTJidnBvNTZHQXhqRExacjdaZ1YrT0hPb1BTSXE0dlJ5bkNWRjkyaTk4?=
 =?utf-8?B?NXJabGdJeis4MWJJQUxVdWRBSWN5cUdmalpUZXdBaS9OVjgveFlKVkpEUjdk?=
 =?utf-8?B?VkpuaDhRY1NxK2NrbDE3S3o5b3JMQ0pwbUpkUXByTC9Qci9CTzZZVVB3bzh6?=
 =?utf-8?B?SUE2WUdwWFpRdEx1MTZBR01pQmM4LzNaaWU4bnJFb1ZwVktUdWhUbUpYRGZu?=
 =?utf-8?B?MXYzd2pEZEpxdGdIc3hlQSsvaTU2RlJWNi8yRmpPOXgyNDJ3THRWR01WNkxN?=
 =?utf-8?B?V0hSWDBzczNuMHozQmU1MU9MQUMyd2NreEVQMDYzWjc4b1BRVEpmMEhrZlZB?=
 =?utf-8?B?a0RrdkprSy9OYk5GaEM5enJlVEYrZFhnTHdPSENqRUxyL2hJUWlSZmJoWmYw?=
 =?utf-8?B?STA3ZHY5MFluNGRxbDVqZ0hRZmgvcTN1Sis4bm1FRGRXdXc0V2lMc25FODJk?=
 =?utf-8?B?a1BhUXB2dkptRGdCNW9IZ0V5TmVmZlh5SW1DanpaRVMzRFp3eDhMNjVNTlRk?=
 =?utf-8?B?RHViUGNxN0ZvRzlnV29lQ3dUNm5zZ28xSEhnSHkxZFZSbnQvNDlSczVDcEx3?=
 =?utf-8?B?OEh3Uko0UlRiTWltWFZUVTdybmlqK1RoTGFpcjVyaTJhZDhNZzJFTFBHeHBO?=
 =?utf-8?B?NWZQTk1tM2FhV2FCUFhITEdmMmxnMkhiMUFvRk5CUDRNWVp0blZLQUxIWXVI?=
 =?utf-8?B?cWNrWmJ1bnlEU3hjZi9acWhrZWJaQUFPWXRodDRRYWZSYTF2dHpuS2tOdkZu?=
 =?utf-8?B?UjZ6SzdrRmhrQnRVd2FOQjcwOFB5YS9YSmkzVWN4K0VwcU9tQmxuWE5QcnIz?=
 =?utf-8?B?Z1E0dDJnemROMmlJVnlSQlR4dFBWeEVVa0JzUUVlSUlkaVF6Z1Rrb08zMG94?=
 =?utf-8?B?ekp5S2xhaUc4TWZVQTFRZCtrNjViT29RR0dlSmJiTFFwRHFja2g2R0x0YUEz?=
 =?utf-8?B?YXZjTGtJVVZJRWluQlJuSzc2SDgvWHNpbjdwZVZwR1FwVVZ5UmRibEo3MVhR?=
 =?utf-8?B?UmVoSmkvSjNqSkNsQXlKcjlrTzJKdHBLUEF5eUVMZE50S1F3VldHNG83aEUx?=
 =?utf-8?B?R1BqZHFpSHcyRDRpc1JCc3BZQmRHZms2QkFORVkrY0p2dVowZ0QxTkZJbS90?=
 =?utf-8?B?L0pkUlRraFVWNjRpTVY1S2dseS9teVF2dm10ckR2eTZ0bm1VNytyeXNSaWlh?=
 =?utf-8?B?Mk9nNGlLeEJDRmNMUmpCejhad2xVa2NsaktJdU4rdW55Q1Q2M2RLUERKeUZp?=
 =?utf-8?B?S2VOUU9UL0xzVEttWklLZ2F1U1hXQTFOOTl3TUwyK3p2b3Y1MHUzSG42V0Vz?=
 =?utf-8?B?aDE2VGc3eFJJK2tzckJITzRZQjN6dzZyYkJIRENYNW9MSVZYWSsyZDJxeEpK?=
 =?utf-8?B?Mis1ZFF4Slh2QVdNSnhqTWhIVklLejBmcWdxalV3SVBLVjQraFJ4ZlV1czN0?=
 =?utf-8?B?NDhpUmJVZUxJKzBBdW8zNXdMdVNuREdFVmRldVdLbGZWRmdpd3BMbmtiaUM4?=
 =?utf-8?B?RXZNU0dndE9YL0s0cDZBdHE3L3ZXcUFuMjVJSGRsQTBHRVh6QUhPblk2cGhh?=
 =?utf-8?B?VWFCNmw4TzRZeDRWQ0ZnaDJvWE1vdWZYMkQ3UnpSeU8vdzJiNnZVZHdRLys3?=
 =?utf-8?B?OGdDcU5aWjB6MzBPbXdPMzE1bEpNYzJPaHhsOWhuV1NCb2wxUUhUUT09?=
X-Exchange-RoutingPolicyChecked: Sxbq3k8De+D/mH2BP/U5GMnz7i6xx9HB3JgEXb2yoNdBQ1Cxj0ASe074W1LCyx15RvByx5uvv02YwAGYYZENCBRXPDxwiu+h8t0EtkbwDMrTDtFe2qyIfNXa59VAbHNy/9SGlmMrHEFaKSnipa803SK2ROVzfWSW1l6UEVFwWjGjdcK/kggbaRKWEVqXLfhf+sKd1SVpLsqpQHIllBTo7hIkZKmqlDw0j/HspsLSR4JCQWzsZXJno4tNyQRP0Zt/zFpSS2G2yCllJ0EUogu+usBnB7bDDcOvNDSOZnysZ3ke9WzWUz42WsULzq3ueoNvOEj5KCwKqkncv+BBvEPF8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e740605d-2b29-4db6-c4a3-08df4ade3a47
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:24:03.2098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXak4s3GHW+365AI/I95EyEj3tJZHBySpi8fLUB0m+2KDi25Uw4IuoY6wN1n+mhyfFWtPYdpjBtvHyCWoG8WoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ankit,

On 25-11-2026 13:52, Nautiyal, Ankit K wrote:
>
> On 11/16/2026 2:48 PM, Karthik B S wrote:
>>  From display 30 the kernel limits the single pipe pixel rate without
>> DSC to the maximum validated frequency, which is below the max dotclock
>> derived from CDCLK and reported in debugfs (see
>> intel_max_uncompressed_dotclock()). Above this limit an uncompressed
>> mode can't be driven by a single pipe.
>>
>> intel_boundary_non_joiner_mode_found() only checks against the max
>> dotclock, so on a sink without DSC support it can select a boundary
>> mode which the kernel drives with joiner.
>>
>> Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits
>> and use it in intel_boundary_non_joiner_mode_found(), so that the
>> selected boundary mode stays on a single pipe irrespective of DSC
>> support in the sink.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 915c6a8a2..b28647696 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7207,6 +7207,32 @@ int igt_get_current_cdclk(int fd)
>>       return read_and_parse_cdclk_debugfs(fd, "Current CD clock 
>> frequency:");
>>   }
>>   +/**
>> + * intel_get_max_uncompressed_dotclock:
>> + * @drm_fd: drm file descriptor
>> + * @max_dotclock: Max pixel clock frequency
>> + *
>> + * Get the maximum pixel clock a single pipe supports without DSC. This
>> + * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
>> + * limit an uncompressed mode can't be driven by a single pipe, so only
>> + * modes below it are guaranteed to use a single pipe irrespective of
>> + * DSC support in the sink.
>> + *
>> + * Returns: The maximum uncompressed pixel clock for a single pipe.
>> + */
>> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
>> +{
>> +    int dev_id = intel_get_drm_devid(drm_fd);
>> +    int limit = max_dotclock;
>> +
>> +    if (IS_WILDCATLAKE(dev_id))
>> +        limit = 937500;
>> +    else if (intel_display_ver(dev_id) >= 30)
>> +        limit = 1350000;
>> +
>> +    return min(max_dotclock, limit);
>
>
> LGTM.
>
> Not expecting with this series, but we should move intel specific 
> helpers in a separate lib sooner or later, IMO.
Sure, will get this fixed.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Thank you for the rb.

Regards,
Karthik.B.S
>
>
> Regards,
>
> Ankit
>
>
>> +}
>> +
>>   /**
>>    * intel_get_max_pipe_hdisplay:
>>    * @drm_fd: drm file descriptor
>> @@ -7340,7 +7366,9 @@ bool bigjoiner_mode_found(int drm_fd, 
>> drmModeConnector *connector,
>>    * @mode: libdrm mode to be filled
>>    *
>>    * Check if connector supports a mode at the platform's maximum 
>> single-pipe
>> - * hdisplay boundary.
>> + * hdisplay boundary. The mode clock must be below the uncompressed 
>> single
>> + * pipe limit, so that the kernel doesn't fall back to joiner when 
>> the sink
>> + * doesn't support DSC.
>>    *
>>    * Returns: True if a valid non-joiner mode at the boundary is found,
>>    * false otherwise.
>> @@ -7349,12 +7377,13 @@ bool intel_boundary_non_joiner_mode_found(int 
>> drm_fd, drmModeConnector *connecto
>>                         int max_dotclock, drmModeModeInfo *mode)
>>   {
>>       int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
>> +    int max_clock = intel_get_max_uncompressed_dotclock(drm_fd, 
>> max_dotclock);
>>         for (int i = 0; i < connector->count_modes; i++) {
>>           drmModeModeInfo *current_mode = &connector->modes[i];
>>             if (current_mode->hdisplay == max_hdisplay &&
>> -            current_mode->clock < max_dotclock &&
>> +            current_mode->clock < max_clock &&
>>               !mode_needs_joiner_exception(drm_fd, current_mode)) {
>>               *mode = *current_mode;
>>               return true;
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index dfcb91e02..c0565479f 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1381,6 +1381,7 @@ void igt_sort_connector_modes(drmModeConnector 
>> *connector,
>>   bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>>                   igt_output_t *output, int bpc);
>>   int igt_get_max_dotclock(int fd);
>> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
>>   int intel_get_max_pipe_hdisplay(int drm_fd);
>>   int igt_get_max_cdclk(int fd);
>>   int igt_get_current_cdclk(int fd);
