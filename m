Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF174E7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 08:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975A510E5C3;
	Mon, 13 Jan 2025 08:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJd97/cC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724CA10E5C3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736758077; x=1768294077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Ofi/84uHEUGZYvcp6zg4kjVk0t87KV9cmdV0IxLOwQ=;
 b=EJd97/cCaQ9i4CcNX/IxORLiDn/lDW0+jnI4f2UxgjkqXfqd3FWzIVU6
 mtE2UUSbvOYltQCpSH6ZHC2bZfHLbWzdXDD8XMfVhgYoE2pmxr+KemIjd
 Kyfk5+3P2RtTQ2ekbby/L5qfkAzlOKeFGX0QjaVbdcqMsiI2lnRFvkwuv
 J22I8pN2NX58zK/y3N9vGh2ObKxUIQKYdRbD1W4MYIzHi4ng2iG+AUCOY
 EiVULMJHJn3h0VMm4tE03Zl8ttOWKrQdMdO3dPjmmUAmgsKeq3ujb8aYQ
 bVitfs7NCeH7PTXhMDLNltGsTTnehoUEXxr6lVArCv0pz5Z6hyLdVUUTQ w==;
X-CSE-ConnectionGUID: 86tq+Z2BRtSwS0l3e+R3Hg==
X-CSE-MsgGUID: DflP51nxQjeYU7EXycNvmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48006064"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48006064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 00:47:40 -0800
X-CSE-ConnectionGUID: hX1tgYkjQfiABv6RD9rUZQ==
X-CSE-MsgGUID: UZ2azlUQQFqCM4C4raQ3BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109040774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 00:47:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 00:47:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 00:47:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 00:47:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1/istMPGMoq9SqPtpHJm5xN1CEalAhwq+jQlxrXE0uxQZuAxuZXlddEhpnIQDmY6dBb+Vx24V3DtqNf/DVBsGxikbtkg9E7CXWD2UqmtNr9df6xePrxqk/OgUDThtEmP5EVNvG3usWWF9UOb68uQWJxaiABJxApa/jNfAMTsO0go2CDzbA//j4Tfmbs7aG6LAr/XpI5qmQWtAPWXL6C/CiJJsqWZQdNSSb96m9T6Uy9Iiucko1I95ntMwtaJKL8cyw1P0RGYK+3FBrRVOljyktjsKTdZcaniFiTmCLTEBXj64Szgyw4hOAl76pnqdxQ6cqTdl2L5OUo3G7Jkaa5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQyuso6OLYwOnV+ludm+s+zAqanD5GLKxCzdYb3BUfo=;
 b=IsPAxSkxrPWwPTjL9FYuA2awoqdE/MUCpmNnfvfD2fZ2AEXBsvN0bR5dRD5a2Yw/jjkuDiDzx7Z0sAfpbRHhXlSnTzCH7faWClAm71swQo09qOE/AnSvW+GKjS3wfA0tylKemz1KTdP2XlbUvtMgHHMwb2dmaF6U2UyTuyE4CAlxTtbwq0qApy6S4mP3HjVy2Vs+MSsyT28flUlRg4VgUc2TY30OYkK9xbcr6QbQys+3LFuWTRpWBLkTzqIT1wrJRO0OkDTkfh/1cG6cabkoLD9oz1ngWz36U12xtoTt6iXZctdSrf9omaRDJDYvLx0HQBsza+R5jsr75LzZpbuFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:47:36 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 08:47:36 +0000
Message-ID: <eb5d84df-2ba1-43b0-a83f-aedff7eea4a0@intel.com>
Date: Mon, 13 Jan 2025 09:47:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_eudebug_online: correct calculate the time
 diff
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
References: <20250110153455.2791158-1-maciej.patelczyk@intel.com>
 <318cf3d2-950b-4be4-b07b-cb5a2c5d6284@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <318cf3d2-950b-4be4-b07b-cb5a2c5d6284@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::29) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d1e24f-94b3-463e-a419-08dd33aeed7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGZwbHBUOGlxTzdtZU1IamxEU0pjK1BEK1RFZU9MdkpEVFN0Qi9LNVk3dUp5?=
 =?utf-8?B?WUdBdnM1SnA3S0Nud1VTdkNKRjJXS0ZRZVliaHRKeXBBK2RpcnphaTcvNjNV?=
 =?utf-8?B?STIvNjJRQkI2anh4VWdROFoxUlZoaFUzdFNvMm9jNS94bTgvcW90bHlUTW5z?=
 =?utf-8?B?czlJYU1wL29HRGJweThsNnlNZytwSGZlRldLQndCaGhRYUszNkxvQ1ZaNXJM?=
 =?utf-8?B?L0tVR2RsQXFMbUV1MDhRSEhCdStMTkhnODYrVHNRMnM3ckQwUHBxMWRYNnhD?=
 =?utf-8?B?R2RLNnN4VWxLVXJJdU9ISFNRaThERjhXRVRHVWpyMTVZK0hmaHN6dWpKaHdN?=
 =?utf-8?B?akxVTk8wblhqTVd3Z1lwLzRXTzlVcVp5a0xsRXdkT1VjMGZQMnRHMTlPeXVD?=
 =?utf-8?B?dk5OQklodVZ3T0dTRGh0MlZZU2Zpb2s4OVFQa1VCWW9leDA0K0x4R0dlN09l?=
 =?utf-8?B?TVBRYWdlZjZJUXljMUtxRXFuVkpVbnBJRUpteU5RMlhyclI4RGxhV1ZmQ3ZY?=
 =?utf-8?B?QnBMZ3ZaWUo0Sm00bi9HemtoNUpnbktTRExnT3hkWmtidEQ3WjN4dnNLa3V4?=
 =?utf-8?B?VXgwSGtsdC9JLzlTTFdVK0Z0ZGRRY3R1Vmw3cFN1bHZpbjltMHNxNFAyTmZ3?=
 =?utf-8?B?Zm9RVFF4dTNqVWY1UlhxTjQrVHhlTmd5aDdhQldVQXRMVXQ2bzg0MlMyTkZB?=
 =?utf-8?B?ZGJLUUs0WmIwMGorRUQ0clVkUlQzOEJhTUlWZFlMaXdTbDZMRENiKzJyR2lk?=
 =?utf-8?B?YUZqQ2JpV2lQSC9YcXFDc2pXaHdVZ0xRa1Y1djlGYk9IQ3dnQWlMTmk3YUt5?=
 =?utf-8?B?cCtqeDg0M3lBMVRPbk1lS2FBbm1FTVJ0NmJTeVRYYVhrL0pMUm92OE44ek90?=
 =?utf-8?B?STRxZTFUK2ZkekRSdTNXTjM4bmpLMFplVk9xN0UzSXZQU3dTMFBOY3RJWEZZ?=
 =?utf-8?B?eWZraGVYandyTnBvdUMxRHp5Ymthd1c0VkJvY08xRzdoWXVNNHlYc0c4MlJJ?=
 =?utf-8?B?MHpyQWxDYXZZSzdYcjJjU0FNenJ3dXFaWEJSUWRKdWxIRXJuRXhTbXFSTS9B?=
 =?utf-8?B?YmVNTEY0NXNFVytPaUtYSFViOHVuZ3B1OFV6Z2JCSnp5U0xtYURkOTR3Vmpi?=
 =?utf-8?B?Y24ycWh4RFNkZkdRZ3pGcFJQRTh5Wk1SK1Fzb1VoR2d2MGp1elM1ZnBUWGda?=
 =?utf-8?B?eDNYSHpXVDJyK1hmblRENllwMkdXZmt3QVRqRmJjUCtiWnRYRnhXbmtyVlc2?=
 =?utf-8?B?UWpYeUs2aHlYVURpQXgrTWxpbDI4bzRMcGlocTJnVHI5YWs0b0V5RTFRYndW?=
 =?utf-8?B?ZTRFd1ZiSmdaRkl6RXRqWnVTOVIvQ2pqa3p3akNFK1JwbHV2R01lMmVmdlVk?=
 =?utf-8?B?NUwrcVh3blRWMnFvQk5HaGYvc1ZCMzJLcWY0WThHaTZ4TmNsbVpoWjl2Y0h3?=
 =?utf-8?B?ME92TmRLeStKMDd3Mzlxdm5YTUVIZXJnV0JKQ3BYYUtDRVJ4RzRxR01HcGdK?=
 =?utf-8?B?dXpzMWVDbGlpcFA5cmJyOWVjV01qM2lmay9WUGNibUhRU3JyWWNsd2lqcmRQ?=
 =?utf-8?B?bVhBamwyVmlRcEtURUl5aktCR1g2cFkvTUVvRWpxdER2WW5DYndQVGFRWkxZ?=
 =?utf-8?B?alVFOGVjNDNsb2RDRHpndDBSV2laZDhmSHFtWFppWVNuQUJsV2FhMHc4dEtD?=
 =?utf-8?B?bTFQZ3Mwck13aXVHRDF2bjZWcWNKSk1nbE1mYUlIcEx5Rkl5VVVnOEsvdjVp?=
 =?utf-8?B?RXhxTDRpZmc3RlUwMGZRbTFQN1JGckpRZzNBRFlUL1lFajRnWFNqZnAxUVhJ?=
 =?utf-8?B?bVdjV0tZMFUrZWMwZUZubm9BRkpiTXFVSkprLy9aTjJ4a1JPMGhCZUpJdUlP?=
 =?utf-8?Q?b3VVEGqvv8/ik?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHpwTWx0RHlsaUZnVndYeDhGbE05WndMbEVvbzlDOHlEZ0djSHg3Ynh5aDNY?=
 =?utf-8?B?NHExVkY0QklkMXgxY0Q2Zkl6azdwcG41TXIreE5RYkZLS2pvdys1UVVUbUlC?=
 =?utf-8?B?OWY2VFp4ZWR0WHdxdWk0YlRRMUhZM1Zma3gzZHp0QlBFVDJnUDBXSFMwVHZV?=
 =?utf-8?B?aytQM1NnKzRlNmJkZ3FxVzNTWUtCd0ZMc1A1YWNMZnhjTGN4ZHdhTkxZWlNH?=
 =?utf-8?B?VTNSakQzRGt0L0k2R0ZLdXpEUEpjQlp1aGh6R2Z6NERsaVMrMHdqN01vZ3Za?=
 =?utf-8?B?VzhndHgzSjcwYmliVHdNUExEcDBKT1BLSUl6SVJGM0RaVUwvWkdxVWk4MjJK?=
 =?utf-8?B?ZGk5RDNyWjc4SDZHdjFYRmVtSG1mZ1l4cDdWNWhJT2lYNXpTL0ZIQmlaTGts?=
 =?utf-8?B?bEJDWnZDam9RWVZpdTVCb3diNE82U3lOSldpdU5GdFprVFZOOUNQbjFIemxZ?=
 =?utf-8?B?cHhuWUh3S2U5S3ZBeDdOcS9rNmNzNEc0TUx5Tnk3UGlGMVFjZGhiNzRZZk1M?=
 =?utf-8?B?RU5KajZ4L1VCQlR0TXltVUJzbjhnSDBQYzNzUUlqRklJT0JlcFV1dWdzdnhM?=
 =?utf-8?B?RDRNd0V4QjNLREY0ZWdQdnIxM1h0VzZRQ01XSkhWZjljY240L09zMUJ6Mlgr?=
 =?utf-8?B?RFJzaXMxTEpsczd4ZDlHV2FRTys1aUNDQXk0MmVmNFhwcjZFejArNTdTTEZZ?=
 =?utf-8?B?TjBqMUdMZzB0SmN0bWxzckxwZFB3YWdqbmVZNHIrZ1d1ai9URkNtSjZMcXps?=
 =?utf-8?B?RkFMY0k4QU94TVRXWWFaOGFZd0srSHNnVVZDZVRiVjdaZlMzR2tWOUJaL1hO?=
 =?utf-8?B?ZmVPRkd0TEhDL1pLdTNrR0QyWCtaS0ZmMDArVFZZbUpheWdVN0s0ZEpMZDRN?=
 =?utf-8?B?aXZsRlVMbjlVSytYTExHN2tWYmhhNlQ2ak9IcEkyazN2dHNsWm1xck1PSkVH?=
 =?utf-8?B?cVIxemhsZnBWaml0Wjg0Y2UvK3JpRmd2ckdXN2hQWXBJTG9GNDM4eWNxMXlh?=
 =?utf-8?B?VzlIejluSVltSEdjWUVyZityT3BWTmNVOEN6ODNiN2hHQy9WZHhIRGl2a0ZH?=
 =?utf-8?B?dVZvMG5MM01HQUNLQWVYek81M1FHNWJ1dU4rbkFjb3FCTDdscVJUN2F5WEs2?=
 =?utf-8?B?d1FTTDhqVXJ5d0NVVWdKTmVHZ2JrbXR1UjNnSzkrOXVVZTlOMzEyQUFid1lU?=
 =?utf-8?B?M0JWV0c5QlZRRnVIUGhVelBucjBkNTFIb3plY0w3ZGliVlVtUFV4UXNtSzg0?=
 =?utf-8?B?T1BFYmRNUDRQZjBQbXFndUd5OVFHTHlicUZIOWlMRHJWLzNzSTkwUDNvdG1N?=
 =?utf-8?B?TW53bENoaU5yZVJNUDBHSG9FTXBISXh6Q0Qwc2xrZVdUdHRPOU5XOFZFdS9C?=
 =?utf-8?B?WUxsTlNsdk9IUjcrZURkVDd3RUNMUGZ0UDZBdWlBUzdPTWgvQjJ3ZjlRS2JP?=
 =?utf-8?B?YkQ5S1ZkR0pXajQzMGppNnJJUzdXVkN6cS8yK2NoWkkrWFE4RGxZYnRTZlB0?=
 =?utf-8?B?RlhKQnpuZFFMdWNxZGpGcmdQNVVGQmNBc0h6T29qZnZINlY3cHJlNW00NWlY?=
 =?utf-8?B?Qk0ydldISkkxbUgrWVlBYnRabzNpRDB4LzVVbGgwU3NwYUhwbXNwYmVrVkJp?=
 =?utf-8?B?bVlqKzJLMkZzVUhBR3dHQ2R6UUVpYWdDYWlIdUFORC9Nc1d2a1A0YzFaSWMz?=
 =?utf-8?B?RGMrWmZwN0FUaFprcWU1UExERlBiOUJ6dmhHTm0zVzZ2OVBmMUNlWSt0QUFR?=
 =?utf-8?B?bER4UVREUnBONElCcFEwdHJ3OElwSFdLd0J4TlBXQS9ORVY1TEpnVXgvVHlu?=
 =?utf-8?B?VFlWQUthcm1DT1hhMTdHa1ZRN2JINXNzR1dIUG4xS09YZk5QQnZYbUtVeXFC?=
 =?utf-8?B?RVUwdFk5ZFFhTTVSTG1XZXdkU3NabGFmVzl3L0dkWFFQQXhheU9VV0VmQWR2?=
 =?utf-8?B?aWNNZTJ3cmh2cCtRblN4NlhwUHZPSkh4U2RjZGNoYkppTURSMEZuamp1M1VT?=
 =?utf-8?B?ZGQ4Vk5oTCtNN0JMQVh5SjFDaFcyRnpzMDduNVc1bStSdlNFWEp6OXp6Uzgr?=
 =?utf-8?B?c2hQN2F6a05sWTgrNE1WQzJQT21vL1l2aTVXN2NzWDd6ekg0TzFEdk5rNVZN?=
 =?utf-8?B?aFNUZytlRHFESmplNmJSMk04Uk9oWEx3VlZodGhJUSsva3ZsaEF5TW9KU0dH?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d1e24f-94b3-463e-a419-08dd33aeed7f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:47:36.0715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAq/IHqruTFYHjNpqruHsI/X1RT2/0e5QVaLhBpBIiH5qrOY1pk+NQXRpJWpKRBMs6AVjpuoQj2+Y2sI44574yFYgX5rGkD8aGjKJpCD/Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

On 13.01.2025 09:26, Hajda, Andrzej wrote:
>
> W dniu 10.01.2025 o 16:34, Maciej Patelczyk pisze:
>> When calculating time difference between two timespec values use
>> library function which does it right.
>>
>> Previous way wasn't working well on slower machines. It was only
>> taking the tv_nsec field from struct timespec.
>>
>> Fixes: bbf1730baf ("tests/xe_eudebug_online: Debug client which
>>                      runs workloads on EU")
>> CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c 
>> b/tests/intel/xe_eudebug_online.c
>> index 052774a3b..f532387af 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -2235,6 +2235,11 @@ static int find_suitable_engines(struct 
>> drm_xe_engine_class_instance **hwes,
>>       return engine_count;
>>   }
>>   +static uint64_t timespecs_diff_us(struct timespec *ts1, struct 
>> timespec *ts2)
>> +{
>> +    return (uint64_t)(fabs(igt_time_elapsed(ts1, ts2)) * USEC_PER_SEC);
>
>
> It seems igt_time_elapsed handles correctly case ts1 > ts2, so the 
> conversion looks correct.
>
> Something to bikeshed is the conversion from int type to double, then 
> int again, up to you.
>
> I think there is no need to explicit conversion to uint64_t, no big deal.
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Regards
> Andrzej
>
>
Thanks Andrzej.

I wanted encapsulate all in that function so that no further changes are 
needed.

I could change the diff variable to double but since WORKLOAD_DELAY_US 
is long int what's the point?

Some conversion is unavoidable anyway.

Regards,

Maciej

>> +}
>> +
>>   /**
>>    * SUBTEST: breakpoint-many-sessions-single-tile
>>    * Description:
>> @@ -2255,7 +2260,7 @@ static void test_many_sessions_on_tiles(int fd, 
>> bool multi_tile)
>>       struct online_debug_data **data;
>>       struct drm_xe_engine_class_instance **hwe;
>>       struct drm_xe_eudebug_event_eu_attention *eus;
>> -    uint64_t current_t, next_t, diff;
>> +    uint64_t diff;
>>       int attempt_mask = 0, final_mask, should_break;
>>       int i;
>>   @@ -2318,10 +2323,8 @@ static void test_many_sessions_on_tiles(int 
>> fd, bool multi_tile)
>>       igt_assert_eq(attempt_mask, final_mask);
>>         for (i = 0; i < n - 1; i++) {
>> -        /* Convert timestamps to microseconds */
>> -        current_t = data[i]->exception_arrived.tv_nsec * 1000;
>> -        next_t = data[i + 1]->exception_arrived.tv_nsec * 1000;
>> -        diff = current_t < next_t ? next_t - current_t : current_t - 
>> next_t;
>> +        diff = timespecs_diff_us(&data[i]->exception_arrived,
>> +                     &data[i + 1]->exception_arrived);
>>             if (multi_tile)
>>               igt_assert_f(diff < WORKLOAD_DELAY_US,
