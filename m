Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F03CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 00:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD8710E1C1;
	Wed, 27 Aug 2025 00:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VDUrtdO4";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADEE10E1C1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 00:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUb260OKhKgMfZ0gXUqjezP6XTEZf5V8rCS4CZ2gQZn9CbDMpNyVKsAGjP3qydOJuadS+M0vTt/epToyndcRvA7WLAg6c9CtOd9Qzp3Uw+zTxnbrLg4GOnAgaywNeR11pB720fj+TOEROo2cf1FCkKT6Cw7Vau2JqygJV3qRwRS8v4qPPFmxONqzs2tL6bm1ZtcG5+6IBkC7OHve7J+v+sBpUweQ5Xcq/az15D4WtzAd5/DWmABcAcx1YEfxeikGTgfM/qwsZVn4Jdn8UFVDjrwB8Lw4N+3tpTpauJbVzxpgekkIIp+kiL5x1EP7PRHZYn3KSoOIUa9TmnOHkfQzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T99kHUXWIesrKWdshNHeDG7K4bmSTmhoahzqLqjq0sQ=;
 b=ZSbagogBQe1fjvLWVzO5XTwury4WzfF2XRnwIQfD6exGCDPdhhy+KchdnYNTcein6xQEPwCNTVc6qPjccTHMNTkPVcE/y1dZg0/PWT/K2/PYOFlYj1ElziZqDtiJRdzxWH4zS5sykV6+nPLlM5r1GynSriqeHjy9E0Re9mNcH7ZHWgFNxFDCEXQT5DkIIz5+t/L6zLi/egQ9eogX+bMgyYCcrJXmACukzyGr7aymZLlHX+GDe4stxSns1oVX46iElTdpadvJVuht8FDXYKOY6do7L6Kabfilqn+sGZ/dk+muo3UH5hGXvWEnOsUnbsOc9D2QevJFOuZL7QiYwGQaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T99kHUXWIesrKWdshNHeDG7K4bmSTmhoahzqLqjq0sQ=;
 b=VDUrtdO4cQ15fFjNGjB+dV1u4Cz1YeuvxLbP3nAKmXdLzc5cF/TjfOCBn6bc113daHVZsIP1v6gzBIZ+9cpDb3XBNkgyT4wS8wCgQHLH8ian3qkHIdxd2No8bsB5sGK8ATkOQDFw0C76eOtqbTIANDFZwpHaleCiDWfefnWjqGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 00:28:28 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 00:28:28 +0000
Message-ID: <945c23dd-6f1e-49cf-b212-9273995e7b5e@amd.com>
Date: Tue, 26 Aug 2025 20:28:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] runner/executor: Abort if dmesg is flooded
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250723160609.103140-1-kamil.konieczny@linux.intel.com>
 <02600808-da76-4681-99f6-73ab1711ad67@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <02600808-da76-4681-99f6-73ab1711ad67@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN0PR12MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: c05a03eb-ee0a-4f90-1add-08dde500a4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHVId0I0eUQzUHl5ZkM4VEwwSlFOM2xHNmxRWlE0bjlMblErU2RYMFRrNStX?=
 =?utf-8?B?bWxGYm1kRnM1YlZVQTRiamZ1YXhMZlJZN0hDTExYOTlMaUxEdmZwU0M2SVlp?=
 =?utf-8?B?eXhaZ09vdUFCQ1RrSjRXL3QzVHZMMzJzU0xwclBRdnByc3JLUlhTclQvQS81?=
 =?utf-8?B?TE9jUCtIMWlTZ0d6Z1puWEZNNGsvUmE1TzJmOUY1elArbS9iTGEwZXlVb0hV?=
 =?utf-8?B?dGdrakJFTjM3SGVhQzJlTXkvOERBRjFNaXRlUGw0WEsyeldDMjNlWVA0MWdv?=
 =?utf-8?B?bFNVRlF3eUFLY242bUZIQ2oyb0R5Qm1aR3pSbEhmLzRmNjJ4UWxLY2NyYy90?=
 =?utf-8?B?UGdGNXBjL0l2NjE5c0oyQjB1WU9HNVdTT0ZTa2hUTXZYSVlZVG9UaExiVmJz?=
 =?utf-8?B?UWNCSDNNbkgwRDY3SUUyR3JQeWdLamp3STIzZG1CL0tKRFFMWVROblM1NXJO?=
 =?utf-8?B?U2tVd0JQMUhUNzFqdUQ5VUFrSDhqakpTTi9yVTNMU0dmZVBFRXZ1N21MWXoz?=
 =?utf-8?B?OFJCeXhZYkNWQ2RhTUNVVzZQWlArS2ZKVm4rc0prL2pZazNjc1R1cjBPWWhI?=
 =?utf-8?B?VGJQNEh4WnZVK1IwOW5ITFNXNU1mV0p3U0QxVGhkVkwvT0ZMalVKTmJCTXNm?=
 =?utf-8?B?Mm1IQTFVd0pzUkVYVDg5TlJJQTZXUmJ3TmU3OU1xemQ1YWw4SnNvVkJlcDAz?=
 =?utf-8?B?MjF0dkFjRjlJb2hBMUczaUFoVXh5Q0ZQQm94b1kvOVAwaFFIQkdJTVVRRVhm?=
 =?utf-8?B?WEtMVjhjMTc3YkFleXEzdHlwSnA3YXFHUS9kbzkvSG9xd1Q0TEhVOENaNE56?=
 =?utf-8?B?RlhUSVlEOG4zbWFlVXpJMXpCL0tESnd5NzkvblNTN0dZVzR1bVFiVFpaQ1Ns?=
 =?utf-8?B?aFcyVmJFU3BaejZlMWtmYThVVG1scWU1SG8vRy9hTEIyOFY4MmJvUmRxTVJy?=
 =?utf-8?B?ajNxc3d5WkR3ZWJiaUpNRGN1TXN1cVFNYWw2TXNHSVRLa04rbkd1V2lzVGp2?=
 =?utf-8?B?R0F3QnBWMnFnZy9WellMOEMwV1VsTjQvU1VKNTE0bDJIYjI3U0ZkSWFoNXNC?=
 =?utf-8?B?R3NsWjQ3ZDkvVjJzTG0vYWtObmZsUEJadnk1R0tMT0FNUnREUkNvb1VIcmtw?=
 =?utf-8?B?ek1ySnZ4c0VVMHJoUkxzeFF5bkxwSFZoTkFpVFJNdDZnTEh4dkpXU0lFV0Ro?=
 =?utf-8?B?Syt1OWdyZGVwNUZDM3BXTE1lTmRSbk53d3Exc3o4bEpQVnpuaXJEL0llRXV4?=
 =?utf-8?B?U0N2U0swdmZ5K1dCOE1aZ0FJTjhoQVhXN0pYTlBjUCs0S2Q0WDd1Tmt3VWRu?=
 =?utf-8?B?ZTcycVdUdURsQld3QS81eTc0bU55V2ViOFZXNi9aN1o2MFFOYmtsUnNCUU4x?=
 =?utf-8?B?SXlPRWp6L2hLWE85MUh0Tk1aeTlJYndCNVFGbldiUjFVK1U2ZC8xVUgwOXVE?=
 =?utf-8?B?dEI2VGZMbjNQYlovdzNSRlY0dGJjMU9zWXE3TXhQKzRiL1YvS1BJVlBWTklQ?=
 =?utf-8?B?NzQ1WXFDNUYyUFBxZ3lmRjBIUGpKNVhMTEh2Z0ZYSS92ajdoUmRtWkZvVFBk?=
 =?utf-8?B?MVZkUmhyRnhHTWNwY29qcHU0USsrcTdtYWp1Tk9GRTQ4OUpNWkdmbzRIeDVO?=
 =?utf-8?B?bVExdW9Yc3pKaWUva1plaXRlTHZxWWRmdkV2eWNlVHU1TUNNOGZzZ01vN2xD?=
 =?utf-8?B?WUY5ZUkwV1pqUUlESDJoMmZjR2pyMzlpc09STnlsdG4reWhFQUVOMnQ1MGNX?=
 =?utf-8?B?UXVwY0lNVE1HRlRERkU4YkZ2Vng0SCtTbkw5RDJiNCsvMHZrZWt4R3MrUEtt?=
 =?utf-8?B?MjZ1eG5QbTdaYWdSemxoTG5LcVJZc25GSG9hcXgzZUEySXc5RzgwY3pWalgy?=
 =?utf-8?B?SXhZOEJuQlB5SXdvQ2srM0plQmZXcGxsZmFvNWY1eXZ5SkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnVEbEVGS2dRekZueE9tS045d0JBbTcyZUZKMDVLREhIeld4NjQ2UVFJckRs?=
 =?utf-8?B?U1VkZHI3dEt3T3JndmhHTVcrVTRZb2s5bzVwV05BVFRWTldXaU5JS3RlOVl6?=
 =?utf-8?B?RlFzN01uOG9KUU1hc2lLSDFMS2gyL3JUdWhxR3VLaUJLQm9QWjBLZVVOemZF?=
 =?utf-8?B?dkZGOXF3czJhellJV2tEL1gyemgvYyt3VVhLV0VWcUpicHY2OTRyTzlHM3lG?=
 =?utf-8?B?eUZzM0pZU3J2SkRNQnFLYUgzc2ZwR2drM2syQnpNTjBodXVST09aZHpFNFR0?=
 =?utf-8?B?OWFNb2pCWjV4aVozNjZZRnI3L2pwM2VZcHFTNEdBV3VRKzcvT1lCNnF1c2xu?=
 =?utf-8?B?Sm04UktoSzNuNE9PR1NsREJ0WFlleDdyMDhVVWlXUDlsOTFCUVIyZ0ZYSWlW?=
 =?utf-8?B?cnVYWVk5UTRGaTY5N3kwZ3ZJWTY2dzdaanJLZWhRREhJZFl2d2xSSCtseW5q?=
 =?utf-8?B?WUo5My9vT0dGaEZaWUE3dDcrQUNCSm83WkdkZ0h0R1FCa1dhSzVHTXpLS3ZE?=
 =?utf-8?B?OXBoSVhpQVRwcitRRE9acWwzY2xyNXcrOTJVSWdWQjh5SVZDY1RNK25VM0VJ?=
 =?utf-8?B?Wnh5MElEM1RySDR6NGpzOHh0QWl5U2wzMnY5bDRsS3N5WTF3NnVqcnBjMllV?=
 =?utf-8?B?RFlHbXpXR3JkeHZrMzhad1o5N05kSTc1cWU4M0JWcHF2T0NuOUdZbVFxaGF0?=
 =?utf-8?B?cXBtL2RsTzZuWUVqZ01EdTdKam8vUVFkYlVjR25JbWs2NDhvUDZSQTZxNUdp?=
 =?utf-8?B?Z0pNcHE3V3ZENjhqNkNHMzBleFhadXkxT1FMLzlERXdBZXdtY0dxZGh2dWFO?=
 =?utf-8?B?NzRVTE9zeVdqUXJ5RHl6ditkZkhxMngyUSt1Tk13R21nWXBnWHZKaGtrcWNm?=
 =?utf-8?B?b3ZUT1ZIM2lGTUxFNTd4Si9OcWZBVTRER3o5T1lLb3JDL2hObXpwd3lqVU9P?=
 =?utf-8?B?UnY4Mlh4TkJWRUpIejNVMmYzQldtWng5N3V3ZDVUM01tSzkzT3JZcVNjbFZ5?=
 =?utf-8?B?aVlyTVpMOCtKZHdKelA0L2tacTV6d3poMHo0elZRd0VkM1RVT2xsN2JTRGFR?=
 =?utf-8?B?VkFZMHV0cGZ4Sm9YQjN1SG9PQXRHSTlQNEMyclFmMmNVZk5WVWFBMVZBUTZD?=
 =?utf-8?B?N01Tc1FuazZ5VVhuK1RNRGNkSXEvT2lKd0M3aXhsTU4xK05sa3prSElJK3Vz?=
 =?utf-8?B?N3d4dG5aZ1g4MDRsRERERGlhQStGYm10VXFiRmpQNU1sVFdHcVgvYkk1QWNa?=
 =?utf-8?B?Y0drbWpqOG83VWMveklVQzFuSjZvT2hzZEUzMkFOcFR3USsxd3R0RUd6UjBm?=
 =?utf-8?B?MWFscEs1RWVWekZ5SXJhSWF0ZExnakxCcWpyRnJsN0g0U0NIUDJPNmpjOU5s?=
 =?utf-8?B?UjFzQnNyaUtndXJWSEhKKzRpTllJT0ZqOHBmMEU3MVBISFZpdXUreTJMWlBo?=
 =?utf-8?B?YlkvcFlMY1FqN2x5dWdUVDdGY1A3YVdGdENnYmNYWGxSRG1WUVBmakVkelRB?=
 =?utf-8?B?V0FUaDZ2KzdXKzlyMmhSZ2dyVVVkMGJDY1NJN1J0VXM2b1BTM250VEdTdTN0?=
 =?utf-8?B?Y0hNd0lzSWtISkZ6Y0Y5Q1l6ajZPcFRQVWtZVVRVRmdoWGlYd0tQOVNlQU9v?=
 =?utf-8?B?Y3ZhMlVyWm8vWWlkZUlrREJqb3JkcDNWdjBvdHBha2E0b052YVVuSEVYNlB3?=
 =?utf-8?B?UUJaVEVaTzA1N0tsdXV2NlFNQ3ByOHBNbWZScms3M0NYMmE1WFcxY1ZMREV1?=
 =?utf-8?B?bS9NUm9OOTd0eGZNRWtGYys3bnNqc0ZvTkJ3cFZ6MHR3RnhhRTBxa0lhSCtQ?=
 =?utf-8?B?bzVlQ29HaFVrOEs2bGczMG5vMVUyTHhGNkFzWENDZm9LOFRiR2hxTGhySnE1?=
 =?utf-8?B?MmM0N3o4Y0RTckEwUzJXZkRBSC91cU1OVmY2dmVTV1o3Q0UvMGcrOXI5ZHR4?=
 =?utf-8?B?R2JNbG5VdDhLQXdyUlBuSDBMdVdxek90OE05WTM1ZmhiVThMLzVuelJaVkJ3?=
 =?utf-8?B?QnpxWXdvREZkYTI2dlpocjB4ZkkwYkNpbUVMUk9uRUlRcmNvMDJmUEk1SHl2?=
 =?utf-8?B?b1dyc0l3ZEozUkc4aXdXVFdWNGRYd2Nvdy9IS2pRUFNJODJpTHlYUEZSMlVY?=
 =?utf-8?Q?j9w8KHLmwMWZp0MHVvCtJ+24o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05a03eb-ee0a-4f90-1add-08dde500a4a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 00:28:28.3553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3IWmadrGpX6FPnIb2qYqOwsf1u3B+cipLCdnlEqqLio7h/5BqGjTQ/WaTqmO33WJTHN9Oapi1eM9jov+VJX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906
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

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-07-24 07:55, Peter Senna Tschudin wrote:
>
> On 7/23/2025 6:06 PM, Kamil Konieczny wrote:
>> Current disk limit triggers once when it is exceeded during test
>> monitoring. After that happens executor no longer checks if
>> kernel is still printing plenty of messages.
>>
>> Create a way to abort test in such scenarios with the help of
>> measureing kernel kmsg activity before first test is executed
>> and then also check it after exceeding disk limit.
>>
>> Also print info about it after each test ends.
>>
>> v2: fix error when kmsg open fails, fix reading proc (Kamil)
>>   changed calculation of max bps (Peter)
>> v3: abort only when disk limit was actually exceeded,
>>   print info instead of aborting after every test (Kamil)
>> v4: added abort at main monitoring loop, also cleaning up
>>   printing messages (Kamil)
>>
>> Cc: Ewelina Musial <ewelina.musial@intel.com>
>> Cc: Karol Krol <karol.krol@intel.com>
>> Cc: Petri Latvala <adrinael@adrinael.net>
>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Cc: Ryszard Knop <ryszard.knop@intel.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>  runner/executor.c | 228 +++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 214 insertions(+), 14 deletions(-)
>>
>> diff --git a/runner/executor.c b/runner/executor.c
>> index 847abe481..db2c05b03 100644
>> --- a/runner/executor.c
>> +++ b/runner/executor.c
>> @@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
>>  	return "output-filename-index-error";
>>  }
>>  
>> +static int open_kmsg_rdonly(void)
>> +{
>> +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
>> +}
>> +
>>  /* Returns the number of bytes written to disk, or a negative number on error */
>>  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>>  {
>> @@ -734,6 +739,95 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>>  	}
>>  }
>>  
>> +/*
>> + * Measure how many bytes appears in dmesg.
>> + * This is the same as above dump_dmesg() but with reading only.
>> + */
>> +static unsigned long long read_dmesg2(int kmsgfd, unsigned long long size, int wrfd)
>> +{
>> +	bool underflow_once = false;
>> +	int comparefd;
>> +	char buf[2048];
>> +	unsigned int flags;
>> +	unsigned long long readed = 0;
>> +	unsigned long long seq, cmpseq, usec;
>> +	char cont;
>> +	ssize_t r;
>> +
>> +	if (kmsgfd < 0)
>> +		return 0;
>> +
>> +	if (wrfd < 0)
>> +		wrfd = 0;
>> +
>> +	comparefd = open_kmsg_rdonly();
>> +	if (comparefd < 0) {
>> +		errf("Error opening another fd for /dev/kmsg\n");
>> +		return 0;
>> +	}
>> +
>> +	lseek(comparefd, 0, SEEK_END);
>> +
>> +	while (1) {
>> +		if (comparefd >= 0) {
>> +			r = read(comparefd, buf, sizeof(buf) - 1);
>> +			if (r < 0) {
>> +				if (errno != EAGAIN && errno != EPIPE) {
>> +					errf("Warning: Error reading kmsg comparison record: %m\n");
>> +					close(comparefd);
>> +					return readed;
>> +				}
>> +			} else {
>> +				buf[r] = '\0';
>> +				if (sscanf(buf, "%u,%llu,%llu,%c;",
>> +					   &flags, &cmpseq, &usec, &cont) == 4) {
>> +					close(comparefd);
>> +					comparefd = -1;
>> +				}
>> +			}
>> +		}
>> +
>> +		r = read(kmsgfd, buf, sizeof(buf));
>> +		if (r < 0) {
>> +			if (errno == EPIPE) {
>> +				if (!underflow_once) {
>> +					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
>> +					underflow_once = true;
>> +				}
>> +				continue;
>> +			} else if (errno == EINVAL) {
>> +				errf("Warning: Buffer too small for kernel log record, record lost.\n");
>> +				continue;
>> +			} else if (errno != EAGAIN) {
>> +				errf("Error reading from kmsg: %m\n");
>> +				return 0;
>> +			}
>> +
>> +			/* EAGAIN, so we're done reading */
>> +			close(comparefd);
>> +
>> +			return readed;
>> +		}
>> +
>> +		readed += r;
>> +		if (wrfd && r)
>> +			write(wrfd, buf, r);
>> +
>> +		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
>> +					    &flags, &seq, &usec, &cont) == 4) {
>> +			if (seq >= cmpseq)
>> +				return readed;
>> +		}
>> +
>> +		if (size && readed >= size) {
>> +			if (comparefd >= 0)
>> +				close(comparefd);
>> +
>> +			return readed;
>> +		}
>> +	} /* while(1) */
>> +}
>> +
>>  static bool kill_child(int sig, pid_t child)
>>  {
>>  	/*
>> @@ -948,6 +1042,78 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
>>  	return dt != 0 ? dt : -1;
>>  }
>>  
>> +/*
>> + * Returns:
>> + *  =>0.0 - Success, measured kmsg activity in bytes/second
>> + *  -1.0 - Failure
>> + */
>> +static double measure_dmesg_bytes_per_sec(int wrfd)
>> +{
>> +	struct timespec time_beg, time_now, nsec_sleep;
>> +	unsigned long long readed, rnow;
>> +	double time, ratio;
>> +	int kmsgfd, cnt, zero;
>> +
>> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
>> +		errf("Warning: Cannot open /dev/kmsg\n");
>> +
>> +		return -1.0;
>> +	}
>> +
>> +	if (wrfd < 0)
>> +		wrfd = 0;
>> +
>> +	lseek(kmsgfd, 0, SEEK_END);
>> +	nsec_sleep.tv_sec = 0;
>> +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
>> +	runner_gettime(&time_beg);
>> +	for (cnt = 0, zero = 0, time = 0.0, readed = 0.0; cnt < 11 && time < 0.01; ++cnt) {
>> +		if (zero)
>> +			nanosleep(&nsec_sleep, NULL);
>> +
>> +		rnow = read_dmesg2(kmsgfd, 128 * 1024, wrfd); /* 64KB max */
>> +		readed += rnow;
>> +		runner_gettime(&time_now);
>> +		time = igt_time_elapsed(&time_beg, &time_now);
>> +		if (time <= 0.0) {
>> +			errf("Warning: Time underflow\n");
>> +
>> +			return -1.0;
>> +		}
>> +
>> +		if (rnow == 0)
>> +			++zero;
>> +		else
>> +			zero = 0;
>> +	}
>> +
>> +	runner_gettime(&time_now);
>> +	time = igt_time_elapsed(&time_beg, &time_now);
>> +	if (time <= 0.0) {
>> +		errf("Warning: Time underflow\n");
>> +
>> +		return -1.0;
>> +	}
>> +
>> +	ratio = (double)readed / time;
>> +
>> +	return ratio;
>> +}
>> +
>> +/* Returns: true if ratio lower or equal than maxratio */
>> +static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
>> +{
>> +	double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
>> +
>> +	if (log_level >= LOG_LEVEL_NORMAL) {
>> +		outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
>> +		if (sync)
>> +			fflush(stdout);
>> +	}
>> +
>> +	return new_dmesg_bps <= maxratio;
>> +}
>> +
>>  /*
>>   * Returns:
>>   *  =0 - Success
>> @@ -960,6 +1126,7 @@ static int monitor_output(pid_t child,
>>  			  int *outputs,
>>  			  double *time_spent,
>>  			  struct settings *settings,
>> +			  double max_dmesg_ratio,
>>  			  char **abortreason,
>>  			  bool *abort_already_written)
>>  {
>> @@ -1463,29 +1630,31 @@ static int monitor_output(pid_t child,
>>  				 * exceeded the disk usage limit.
>>  				 */
>>  				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
>> +					char killmsg[256];
>> +
>>  					timeoutresult = false;
>> +					snprintf(killmsg, sizeof(killmsg),
>> +						 "runner: This test was killed due to exceeding disk usage limit. "
>> +						 "(Used %zd bytes, limit %zd)\n",
>> +						 disk_usage,
>> +						 settings->disk_usage_limit);
>>  
>>  					if (socket_comms_used) {
>>  						struct runnerpacket *message;
>> -						char killmsg[256];
>>  
>> -						snprintf(killmsg, sizeof(killmsg),
>> -							 "runner: This test was killed due to exceeding disk usage limit. "
>> -							 "(Used %zd bytes, limit %zd)\n",
>> -							 disk_usage,
>> -							 settings->disk_usage_limit);
>>  						message = runnerpacket_log(STDOUT_FILENO, killmsg);
>>  						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
>>  						free(message);
>>  					} else {
>> -						dprintf(outputs[_F_OUT],
>> -							"\nrunner: This test was killed due to exceeding disk usage limit. "
>> -							"(Used %zd bytes, limit %zd)\n",
>> -							disk_usage,
>> -							settings->disk_usage_limit);
>> +						dprintf(outputs[_F_OUT], "%s", killmsg);
>>  						if (settings->sync)
>>  							fdatasync(outputs[_F_OUT]);
>>  					}
>> +
>> +					if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
>> +						asprintf(abortreason, "Dmesg ratio exceeded during test run.");
>> +						aborting = true;
>> +					}
>>  				}
>>  
>>  				if (socket_comms_used) {
>> @@ -1587,7 +1756,7 @@ static int monitor_output(pid_t child,
>>  	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
>>  	if (settings->sync)
>>  		fdatasync(outputs[_F_DMESG]);
>> -	if (dmesgwritten > 0) {
>> +	if (dmesgwritten > 0 && !aborting) {
>>  		disk_usage += dmesgwritten;
>>  		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
>>  			char disk[1024];
>> @@ -1599,6 +1768,11 @@ static int monitor_output(pid_t child,
>>  			} else if (killed) {
>>  				errf("%s", disk);
>>  			}
>> +
>> +			if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
>> +				asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
>> +				aborting = true;
>> +			}
>>  		}
>>  	}
>>  
>> @@ -1766,6 +1940,7 @@ static int execute_next_entry(struct execute_state *state,
>>  			      size_t total,
>>  			      double *time_spent,
>>  			      struct settings *settings,
>> +			      double max_dmesg_ratio,
>>  			      struct job_list_entry *entry,
>>  			      int testdirfd, int resdirfd,
>>  			      int sigfd, sigset_t *sigmask,
>> @@ -1814,7 +1989,7 @@ static int execute_next_entry(struct execute_state *state,
>>  		goto out_pipe;
>>  	}
>>  
>> -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
>> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
>>  		errf("Warning: Cannot open /dev/kmsg\n");
>>  	} else {
>>  		/* TODO: Checking of abort conditions in pre-execute dmesg */
>> @@ -1885,7 +2060,7 @@ static int execute_next_entry(struct execute_state *state,
>>  
>>  	result = monitor_output(child, outfd, errfd, socketfd,
>>  				kmsgfd, sigfd,
>> -				outputs, time_spent, settings,
>> +				outputs, time_spent, settings, max_dmesg_ratio,
>>  				abortreason, abort_already_written);
>>  
>>  out_kmsgfd:
>> @@ -2418,6 +2593,8 @@ bool execute(struct execute_state *state,
>>  	     struct settings *settings,
>>  	     struct job_list *job_list)
>>  {
>> +	static double dmesg_bps = -1.0;
>> +	static double max_dmesg_bps = -1.0;
>>  	int resdirfd, testdirfd, unamefd, timefd, sigfd;
>>  	struct environment_variable *env_var;
>>  	struct utsname unamebuf;
>> @@ -2560,6 +2737,26 @@ bool execute(struct execute_state *state,
>>  		}
>>  	}
>>  
>> +	if (max_dmesg_bps < 0.0) {
>> +		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
>> +		double set_bps = 0.0;
>> +
>> +		dmesg_bps = measure_dmesg_bytes_per_sec(0);
>> +
>> +		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
>> +			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
>> +
>> +		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
>> +		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
>> +
>> +		if (set_bps > 0.0)
>> +			max_dmesg_bps = set_bps;
>> +		else
>> +			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
>> +
>> +		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
>> +	}
>> +
>>  	for (; state->next < job_list->size;
>>  	     state->next++) {
>>  		char *reason = NULL;
>> @@ -2596,6 +2793,7 @@ bool execute(struct execute_state *state,
>>  						    job_list->size,
>>  						    &time_spent,
>>  						    settings,
>> +						    max_dmesg_bps,
>>  						    &job_list->entries[state->next],
>>  						    testdirfd, resdirfd,
>>  						    sigfd, &sigmask,
>> @@ -2651,6 +2849,8 @@ bool execute(struct execute_state *state,
>>  			break;
>>  		}
>>  
>> +		check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync, 0);
>> +
>>  		if (result > 0) {
>>  			double time_left = state->time_left;
>>  
