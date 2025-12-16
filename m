Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18F2D5C0C0
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D2410E290;
	Tue, 16 Dec 2025 03:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLZquCzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BE310E290
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765855639; x=1797391639;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ngp0o9W72BeS71NUCZd1C3pj6vtZWKYfjj0pl0pHGxU=;
 b=JLZquCzoWv8EsQdM1zfMaCZxTkKoOdMNgPAmt0VaXGAtcCOa5+95f6D9
 q6jSBSQJ8XjpFDa3ecoVhuBZggriE3xn9vjTm7sbU3x6FLzrbgAZO/28j
 AtojfBw9ZgWPwqOnKRyZ6GcoJFSXYrSk87/3zf74z04k95gYEpwPnRqjD
 SmDnmwSQg9W0OY862UmCq9gztXJ9qvr6Xy3AuxRTEtOwUEVuFDzfphYlN
 UdwMLgKasAJPvuZetaYBf05tV2YaleUN6UJTM4Dd00C0omNhz9pqd5zbn
 LxNNou8jSsl5CI695vNb2qarrN4/n/yPDf9mHpislHdaWYvn8BBtPVjHz g==;
X-CSE-ConnectionGUID: 289VxG08SMCtO3BaBFn01w==
X-CSE-MsgGUID: WT0t1QPAQ7aKfygh+phvGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55333328"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="55333328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:27:19 -0800
X-CSE-ConnectionGUID: BzJNA4fORFuUD8hvywxOZg==
X-CSE-MsgGUID: mOQR/y2jQUqPlgDwV7aKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197947757"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:27:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:27:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 19:27:18 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:27:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOi1xBI8ZuGbDr5E72YfCqh73uTNfPgWkD+dk6wOSR7t2MntaROJkVQkMkMYh3PQaN5j5qBme4zCS1guYoZ5mTjSNtdqcwjN3KEjcMwK/HkhAZvSwDeOTxQx771B17gfuutCNdUZwv6DI8X8A9KqZHGU7YIhb6WckuJNOKYEX7fbvm4Dwdi2bx9djggcyhC/Xu2TqJAIXzIOew6X+jqrFIGpf8CJZiKQNgjDsD73rg/ZsE0IH1AaMJh+Q83DU6qfS6GZKCudvSE9DCH5vA4q9b2PMtpAnPe3bVvx8YxId5JwgSzKM+IOQ5dtlXfoATrZPADmXJJxmoSsXtSinkYUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b57WZpiSWinHwC9N+TfXoExRdPAUMOQKMtR6PL18Oio=;
 b=M/4+vydU26n+UfRyZsNVtg2ZS7QPgFCQaQzTEpmD43ZQE3M2n3T2x7Sl+FxwDQB3v0wy6ykPoSO+SSPwn1ajkPZ3gJpWh6/rrANuhk59tLHY79Ks8295kkDVmlXH4fV9IMLWzhGy2bLA0TvpMSOHXWg05Coih2rsAdCdVqBMvXZ4ErNXZnGUqhZKQJDEidBU7UpN8Jstd72OVMO8vfvAZoQwbNbRwOmOpNFwvU1pMJUil4wIaYAfcHva0kccvFyHj6oq0BkVXLJgv1g+IojQylJ6/QUHP4wp2E786DFLdEEqErh+ggWNEAsAaajEUuoacpExDyPO63R5HndAszzjBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:27:15 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 03:27:15 +0000
Message-ID: <77a81ba4-25c6-4505-a96a-8a690b5def26@intel.com>
Date: Tue, 16 Dec 2025 08:57:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/4] tests/prime_udl: Fix error handling
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <20251215223639.117028-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251215223639.117028-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::10) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 6884a886-808b-477b-3fda-08de3c530231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RU1RL0xKZGtOWHROSlNlQ2RKUE5LV2h2dUJnS3I4cS9hYUtlZkZndXJwOU1R?=
 =?utf-8?B?dDlHVWozUEdnRkRFZkNTQjI0a1RCNUdoRGtGbDlDZVBac1hXNjE2ajJLQzVk?=
 =?utf-8?B?ekNuSmJMOHNqYjU2Mk1nc0xGSWQ2RXJIOWpQMmdjU2ZNK1JMdzNicHpSbmFn?=
 =?utf-8?B?QS9RMkwydjl3dTB1dGlFS1IweTJRZkV2YTlZMWJibkQ0b0F0UEVha3BiT2tU?=
 =?utf-8?B?cFAwbTZia3cxclhrMWZIN3dSdjNqWndHbnNLRllYZEh2MWlDSFU2N3NjK200?=
 =?utf-8?B?aUlCMG1VTkNUMlV5cGZrWnRhOThLcnZFVE5nTHdqdnU5RHJFK0tHN0xYWG5x?=
 =?utf-8?B?My96TWFMTWZqd1FMOTErQlR0dU1FWUx2RXhpS0srK096OG5LVU5LRFZTWWlJ?=
 =?utf-8?B?bk5Vd2h2NGN0Y1ZhYlpncXJ5aW5lRTVZMitIMlJ2SnY1bHdtUld1N0c3Zm9u?=
 =?utf-8?B?enZRTTRsSlFXdCt0cVBwKzcxQnF1eWMydjV2UnRGdVIxb210Y01ucXNtVzFk?=
 =?utf-8?B?YVpRNzU3QjJ4R3RGSlcrZ0tIN1JpUEs0elR5TUdOSTFRN0l0NGUzNVhCa1RJ?=
 =?utf-8?B?eGt5VllhTDRvcytUb2ZoWER2eTQ0L2FmN202aVVldTB0eVduSnN2aURuVHRL?=
 =?utf-8?B?dHQ0UTZjQzhaeForZ2hCODFOT2R6NjlzTWpMTkF4cmg5clFyL3QrMU0rOGFa?=
 =?utf-8?B?a1ZSMW1obmpFTisyL1ZPS0YzOXVtR2V6SnZmVy9wOVZOTVhlOXpEdDh1d3lk?=
 =?utf-8?B?ZGdXaExMZXZzUDBobGc3bEpaL3lYaXQ4YUJ1ZklSU0VCbkh6SHVRRzhBYmRn?=
 =?utf-8?B?MElJM3VuaHNpVGJ6S09lcW50OTNqTzRaU2dHaEVVWk95NTNJOWxRYU5rSHY5?=
 =?utf-8?B?L0pFZ2p3dUtpTTRuQTYybzkrZHN6UEhVdFd5U2NZemtLOCtjdkN2MEdnaVhs?=
 =?utf-8?B?K3A5MlJ6aW1CSis3ZHk1RTF1K1pwVytXWk5JMkd1TjVPUkFvbGVkWnlZTE1J?=
 =?utf-8?B?MjBBZ3Y5dXE3bkZHLzdzQlVQYW5NU1JhMGRJTEpKTG8zK2U3Y0x6cUVFelpa?=
 =?utf-8?B?OHFvdlREcVNtdW95N2NLYWxLRzhKY0xiNmVobVRyYUJwaWxYdE1ZQTFBUlVw?=
 =?utf-8?B?TmRvejN1UUl6dHhQK1R0aUVkdWdPR3JMZytuZUZhUDRBaHdhY01KWStHZkhZ?=
 =?utf-8?B?a1VSZG1teGpyR094MlgvSHlsQUErTWZWNVg1RG81MDJZbExWeUZTNEsvN29J?=
 =?utf-8?B?RFhTS2htV3grMFo1RGdESGpCVVFjYkxZenJGVTB3bWNYM3NabmROYjVXeE5W?=
 =?utf-8?B?TklHc25hMnp1Z09keVBDUUdUYnZqb095bDNlLyt5ZG1kRTJ6cndPSHZlWFVN?=
 =?utf-8?B?VTNzUFpaWmZaY3RQV2t1NFRPaUEzN3pBYjRvejhSTFRJVXZZdStMUW9RM1li?=
 =?utf-8?B?RlRuWmZPLzRYZE0rUzh1UVR2SHVUdWdTcjlDWUxxKzBpalRDckpJaDNieHV0?=
 =?utf-8?B?RTVGWlhXbThIc0kvdjRwL0tIdWMycVZ3NnYrZUZyekpoNmJtU3FqNWpTRVR5?=
 =?utf-8?B?czhsTis1K3VZalg3SU51d0JVeTJ2ZmY4Z1FQbldqNVRpU2JaL1UrTlgwMk1r?=
 =?utf-8?B?TGNSRlpZdnFQcU9rTVdkR3ZVLzllREVJV1RjV05TV2s3VFpZcytNcnpNTXZV?=
 =?utf-8?B?T0FrTnhHYlpWc21DYUJkWmJ3eDdtRXZYTTRad3J2Q3NWbUJtdGVPMmg3L0py?=
 =?utf-8?B?SWhCZmJucDZycU1GKzgzeXV0NCt2c3FwQXZjQjR4c24rWXd5WWVuR1RUMThS?=
 =?utf-8?B?VmE5c1pvRzl6am0vZ1VHd0xlSUxoc2lyRFU1dFQySXN5Rm4yWEd1ejFuNHpT?=
 =?utf-8?B?aDhLMmxtTlBPS2NrT3RENlhzZWVVaVJQakJHMndYT0NaZDl6V1BVT29yZ2Iw?=
 =?utf-8?Q?dAj9colj0NIBEr93ZoxLny5vZ1z8v0zO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUNQVFZPVmdFaEFOZW5JOTEzK3UyOEJNQVU5U09pbkh4UnZMTXBrM3FvK0Nn?=
 =?utf-8?B?alJ6NjZiQm1jMGxLdXQ2K0ZzU25tNmhtY0Uxb2NvcHBESHdETG8vR2drUWtB?=
 =?utf-8?B?a3lzUHJoV2QyZ0JpSG9RZGtWQXRsLzZJSVg1MGFzcTZaZ21CMXhiRmZMQVZQ?=
 =?utf-8?B?Q0Q1MS9QNFE2RUU0VFhGd2tla1FzeTNIamV6VWpQeUlzV1NpOEJENTAvTTlP?=
 =?utf-8?B?U09uU2gwaVBZaVk0UkgreXVNYjlFSU9qNXl3ejYxZUxtenc4QmNLdlhaMUpJ?=
 =?utf-8?B?TzZ4b1pBMTlLeEI2bHkyNTF6TXJxSUFsNWNabERvSi9pOFVRUFNCTjl5SmZp?=
 =?utf-8?B?TnplTkVJditiVFkxTnduWFA1S1o0blB1VUI1Z3pkakp2SkJnTzZGWjcvc3BW?=
 =?utf-8?B?SnViNVNJWTFHVjZKZTlZQlc0b3MvMFhJcDl5NUlxSWZJS3dzaFpUUWMzNGhr?=
 =?utf-8?B?VmQvYklZYzE5TWwrSis1R25WdERDZ0xlVEg4dFFqWGFBUnYxa3FyYzBpVHVZ?=
 =?utf-8?B?bnhxWDFId2xRWWpnKzdaa2RoMnJCZzhrZjhlRkFRU1E1bGFZRzN0WURGTnp6?=
 =?utf-8?B?eFFzN1Y2ZU8xRzI4bUhuUTZqQkNDdVM5RGpKQnFDYi9WTGhuYmVhZnVtT0xr?=
 =?utf-8?B?NFJrNmFOTzgybGlGTGJiek0zK3RJVjdxNS9HYUE1Uy9QYzZpSzI0Z0s3ck5Q?=
 =?utf-8?B?YW9tNUU2ZUIwU01ncFo4QmxsWnV2YXFoMzFkRUtPUzdFWHBhREtLK0tMWWtY?=
 =?utf-8?B?dHdRNXNrcjZ0M0svWUlRT05ibytUNTVlbUlPMW5TOGN1QkNrWlZaMXptS2Vp?=
 =?utf-8?B?eVB3VkxJbFh5SGFMekVTaWw0TzUxd25FTHF4NzgzajNCZWRENTltYVUwTDBv?=
 =?utf-8?B?T3ZBV2tqL1U5M3lDTW5xK0NMcFk4M1kyb2JEajlQWWdnNk82ZEI1cnFtVlRx?=
 =?utf-8?B?aU1yQjZOTXR1OEtlOUJZWko1YWExQitITDgxelJxcmhYS0h1enBNTmZpZkZL?=
 =?utf-8?B?VkJzbjZHeUlPcE1KTFlScHhON2M1Y3lnU3Z2LzRDcC82dmtnMmprZWhwOURV?=
 =?utf-8?B?c3U5U2paSE0rM1RLLzNjWVVCTVpXOVZ2UDNLQytndmJWdDk3dTF2KzFNbmlt?=
 =?utf-8?B?TVVMTEtyY1pZTEsyL3hUanBSaEhKYlFoVHU4TWhGbnluL2t6VTh1cmFXZ29Y?=
 =?utf-8?B?U1I3OHlWZ0NIb1htSTlmWk8wSkJzV1JNTjJLNlRNeDgzbXg3V21FTFh2UDBj?=
 =?utf-8?B?eUtWSjlIUEc2OFFjeVZrenc0WjhDQ2FvWDBKbW9QS2o5ZTJOTzhnT0hvdmU1?=
 =?utf-8?B?dUh4Ly9JNjVnRVM0V1BwM29sWnplenBoOCt4bHB6ZHdFVG45b3ZVZS82Q1Fv?=
 =?utf-8?B?SVVOWWhWQWgzTCt0VWlHOE42anpQUUlNbnNsM05oRk1qOGJlZXBrUm4rVklM?=
 =?utf-8?B?MVRhTitCb3ZXLy9udUhXL0JxUDN2SHVYdjRCZDg3NEV0dnFkSVJDYmZpTHJz?=
 =?utf-8?B?dWdxKzRTOWZIeWIvRDBZN0dOcmE2cEFjejJreWU5NlREQTFiUG42QmVnenVF?=
 =?utf-8?B?aHpVdnkrUDhqNSsreHRFaEg5Vmk4WUp1QWpwWlU4eVFmQjY4dEMxU0xVZ3BN?=
 =?utf-8?B?QURLVTU0cVpzcDFaVkx0K1pNSHNqRm5vMW1Wakt5RVd6d2pmSk5BM3lSb0N1?=
 =?utf-8?B?OGswREtrSkVQTUd5Y1FuNmNySFpkakU5N2pXekdmY3AwUXdVU01CeDZybzFm?=
 =?utf-8?B?Z0kyTGZUdWl6ZHp4d2RwU3lqNFNBcTJYeEdLNURLbGlqRnNWTThsSVFvdXU2?=
 =?utf-8?B?VFoweUZXUy9QUnJiRUNPc2xYYkE0NW5nRGxBcDZUVTJIMHhZVzVHZGhEUVY1?=
 =?utf-8?B?SEJPZUM1WVJuZWVWa3NTM01pdzkyMWdLSDhQTUV6T2MwMlNXR0FBK3o5dFc3?=
 =?utf-8?B?TWVvbHBjUFQ1TjlLSGRkL2EvOFRVWWhNQlVyNkhwaHVTeDlvVnpudVh2d3ln?=
 =?utf-8?B?Nk5kSytacnBmVWJzeUU4aFVqNUNWYjZaNHRqK1lYNnpyU2UxRU5JSnNJcm4w?=
 =?utf-8?B?QXRFQmVUNlhycm9HN3ZRSitGZUpCcXlQK3JCdVVOaDNFc2daYzIvL1Y0N0Vn?=
 =?utf-8?Q?MGEeNPjV5Yy32RE5orp4f8p9B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6884a886-808b-477b-3fda-08de3c530231
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:27:15.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKOnnSfDpKJHoOyRqhtstXyzoh2GqyJflWlLmdYWrRYQyGWGcO6xfMLs+NFnF+k2Rbtf9NAMIaxfFV8XV3LXUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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


On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> Open function returns -1 on error so error check was never hit.
> Fix it and handle it properly.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/prime_udl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/prime_udl.c b/tests/prime_udl.c
> index 117663a30..8dcbfa58c 100644
> --- a/tests/prime_udl.c
> +++ b/tests/prime_udl.c
> @@ -47,11 +47,11 @@ static int find_and_open_devices(void)
>   		sprintf(path, "/dev/dri/card%d", i);
>   		if (venid == 0x8086 && intel_fd == -1) {
>   			intel_fd = open(path, O_RDWR);
> -			if (!intel_fd)
> +			if (intel_fd == -1)
>   				return -1;
>   		} else if (venid == 0x17e9 && udl_fd == -1) {
>   			udl_fd = open(path, O_RDWR);
> -			if (!udl_fd)
> +			if (udl_fd == -1)
>   				return -1;
>   		}
>   	}
