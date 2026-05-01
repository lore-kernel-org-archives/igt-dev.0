Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12455CD3423
	for <igt-dev@archiver.kernel.org>; Fri,  1 May 2026 20:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7337110E214;
	Fri,  1 May 2026 20:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYKZyf+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0095B10E214
 for <igt-dev@lists.freedesktop.org>; Fri,  1 May 2026 20:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777668775; x=1809204775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ub0+LtJbb9hyoAlSW55VVovG2PADxrecH0rmscYdM4I=;
 b=kYKZyf+5/264eDS3rUY+KbobkAWSKockHV+p6eys3gP5unqq6W/n0mN2
 Ku9w9NkS2g5NTGjA/bb1wJs1OydyK1RkHLvfgzGUJfJKxs52F78sa/+tC
 Uo1pteSDFuyV9Y5PzoDPb3IDr/V1yh35zcSEmLxDI4A1wi+qiymgkr0FA
 TfITiMFyEm2Dtj6zglWRwdZ2Xaev8K0UYtZ2gYfqoKIXuRakSfjUrRxPP
 5AuVUGNI7AlQ1MqK2B8UcR4cbJRNDFqBmf5qlCj9gM1o8A73qSJM3zx9c
 5wJUQOhOrclbdctf9w0qwAuLZ7IiNy9vOLQDf4r4VQBWKs6Ie0QOdL/bZ A==;
X-CSE-ConnectionGUID: XPosfVtgQZCWvKZmaPoYMg==
X-CSE-MsgGUID: IS1GyNNkQKCkxagdWZWAtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="96055603"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="96055603"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 13:52:55 -0700
X-CSE-ConnectionGUID: tAF0mqlRReWiKiAi4fCI8g==
X-CSE-MsgGUID: DCBybAsRTMG5jwdQbNtkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="234847899"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 13:52:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 1 May 2026 13:52:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 1 May 2026 13:52:54 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 1 May 2026 13:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbwzSCmdvYOv1G0sxRbyaomWoHAvYFecY+MUDPc+vUvaV5aimEC+fud8P65CiWmYtocUKLZ8wgASJJmJHzwqPmnN3oSB6Alc1nLnyKs3jXTVHVdggYTsfHYJc8SbrV49oshvEXvgwoRaOyUNOpZZdn30bt0NYKwsTKtIz3vLVb/NNzDM+lA0G1231rcMqPvhc+Dg0NbMCx4Wb1A4t5wHWvbRWjTNytc8LUhxqmbcn105fWk9lZBTd/3BFKBF0cJisEabg33igdrglxdmwp7v/xaMz1NQy7zXEdVeK17xPBbPenMqZcKaXl/pqbv4w7bsZYWxkp/SRtytVs/nwZV32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZIft+YA19Zra5GOfwjmOTuKWBc/67ImXAsQETmr7vI=;
 b=dLdNX+ngmHEqVvCqHp5orM3MHWG7AYZCci+RJFZxmOuxJtDHNxbg7+AEAJjbXwiwTHGtUnieybM9bT4uQLc8JD7CCCc5kfsArltIK/fGciCn0CeQMZGLAmVsgSy/rI3vLeyUWuFBNjqBHJ7qBsZMch0PRUVnMNe2VoSdMGIS7ZG4Lg2/WIEpEmMxOJ/oEtHTGTwFm8QU4Ct3/bYAuxCjda9CVurtJVvm831CnYE35WqEnIbgPAsIxed52HLijepEsdAMMsJDW2hOId+wXIxLHjy/Da51ssfKl9wIMTNHGsTcUc5UJtR9et1cHX0XVKa7XmkXM7nBtCOuayq3LYSwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA3PR11MB8048.namprd11.prod.outlook.com (2603:10b6:806:2fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 20:52:51 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 20:52:51 +0000
Message-ID: <437cf0fe-7800-48da-aa8e-46522c1dd9bc@intel.com>
Date: Fri, 1 May 2026 13:52:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <stuart.summers@intel.com>
References: <20260430041055.1901126-4-niranjana.vishwanathapura@intel.com>
 <20260430041055.1901126-5-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260430041055.1901126-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SA3PR11MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bc89b2-838e-4250-d677-08dea7c39c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CSFCA5Dm1iaVnRU0nzbUtRVGA5fmuCBwoZ3UUNibL7QEvPgIFKtY/CQ3Gbp7ydcAmsUgNb66Qf2H2+llQqOWkZt4LItSf+I609mHmQioFLVSV4IPavxWMWXCusC8V9SUX+uzls/Ii8A14O9oAqjGSkWa0027A09cGcFBAqM8bKnXiBBfkN/bX3HjuMVYEdXr+gjXHaaHY8aw71pPt8N+pZISSHeMsKYmVd6huRWXC9b8DMUBuwcbraEU6wgviwbA6PRULWMyv+BNnSqL5kVef0XL3fuTBXjjYkNl5hsVVCuZyGiyeHwFDGlbJjEDA4AFWLa0P/mWMRv+OqUohaTTT0UN1Yr9UKWXr3pqfQt/HlxAvGhibyr7vYBMpO/eetzChZylKZHIF30s55lgAf0LNhmXOruWyixb739LxZ5j0ZDenHDYVDSbAj7vMU7q4fnqL3FR49T70g0sMrN/GPKWqOruCprjotxm7xYYGke7+fmEC2JRodzYbJzsm66DAsds1cAr6HdCdel/zv37yzJuaeS0J/7lFSiDMvdWHp7QH60dpE0nb9iLrSEMv1P377aqBAJhbLLE2k08OORi1E2HRi/PTzl57ig//2DM881XRRTuN1fuRPILjiy/xycXhcIqU81yHWbDbPsH3WMLlP2hv7wqRTNPTdjsHHKWThreI56jU3idLJpMOvpHuusUmKf3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmUra09OLzNoTXpJK2ZFNEh0S2VRYXBNU1pJS3YrdHpLRWJJMVNSUWtuUHFL?=
 =?utf-8?B?R0p6MlNuMXNVd3BCWlRhWEx6dDhkZ1ZCZXoyaWc1azZJOHhGeUJlY1R2c1I0?=
 =?utf-8?B?cEFxbTZlK3ptUStuZGRLazJNYldTODQ5SG55UzZXQUNONDZhbUhxak95bVFJ?=
 =?utf-8?B?K3hwSXJIWkhNT3NHZ3M2bVFZbjJoa3V2T09ZQ2JUdGZQamxLZzY3cndZTW05?=
 =?utf-8?B?aGlpMmczWEVYVnpBMTFvN0cwSTNKS0lBbHNkVE5qRlNlNjZJZFpvOWczck9N?=
 =?utf-8?B?aU1aMzRLODlWMVUraWNFbjJ5Q3VWazVZK2pqcGNLdDZwMVBLY0lhRHhkSkpM?=
 =?utf-8?B?bjdtSW43RHRHbXRkL25JUDVpdExGZWxuTHlJZXl3SUhVeVdUVXlXdHBRT2lm?=
 =?utf-8?B?eHErVmY1YzlmNVhOUzJJL25tUzdIWEx6OVl3Z0cxRnVPVWU2K05VMkxKNDdU?=
 =?utf-8?B?UDBxbi9leWZITkJ3aVNPV2wrODRKczVFYjB1Vlo4bmlsSGt3K0YyUVk3VC9h?=
 =?utf-8?B?dnd6b3EyOE5nb2JFM0NWVDNLTFpJelJaeDRYZExJanhmM1RyVUdZQ1N5S2gz?=
 =?utf-8?B?NHJBeWE2MWNicTZYQkpBcFQrb2JBM25WL0dqcWZmYm1UaG1iUm5JK0hnUE1j?=
 =?utf-8?B?Y0MzOVZzU21FdGRwTzRJdklRaGlrSncvUXAzN0dVSUMrdERwVlAzdTVKeVBR?=
 =?utf-8?B?Szltd2JnclFCV2xWWFZndXY1Slc0RE1HdVY1QmhBVk1GTEcvWFB1YWVZTDJi?=
 =?utf-8?B?ZXlPVkxiRFhjTHpBc0EzdlBkZW1sTVI0ZUlGZlpNWDFwWllNbFEraEVXNGJu?=
 =?utf-8?B?LzFuZDJpTVRzMFZLZWc2Vm5GL0g3MzhoeVBaSG5INFB5T1JtOWZUb3lKTno2?=
 =?utf-8?B?WUFEeVZHdmJnbjRxNjU1T0ZEQjJ6Q1NTVG5JVmpTanc5T05ZeVBsUldUSlhq?=
 =?utf-8?B?MnppQmRIMnVjQnFIaThJa29ZWVp0aG1QRHBFR1lWNXpZVTZ1bnhxVGpZRllP?=
 =?utf-8?B?dG93OEs0bCs4SzBvRUxlaVhQNmZzdnhyU1dLTmVmbHN1SGhrQ28vKy8vRUhR?=
 =?utf-8?B?UEFSYk5GN1pvb0ZVVGduTi9OSDBuWEZCbmZaVW1XNmY2cmdKY0xJNlhyTGJ2?=
 =?utf-8?B?WVpBVzJoMWhtejVKWkd5VlVVZUVVS1lkVTFBVWFaNk1TeWdmTDZldjZ2YnVr?=
 =?utf-8?B?SVlyODBzV2ZyTm5jUko0NFc4Vy9ZRHdhTFMvQUZmNE9jemZSS2JxYlZ0bXM4?=
 =?utf-8?B?ZW83U1NKMUcyZjdWcXc3QUV4cStQK2d3K0k1R3BZWTFLVVYvMGZKbTVlZDdi?=
 =?utf-8?B?bHJvZEVPMmRzMXU0MTNFQXFlUm9HNUx5bi96RzB5T2FDVzlNeFJDbE9HL21C?=
 =?utf-8?B?Zkc4UDMvbFZFMWZCYXJQMThORkR5bTZJSldUMFJqb3l6K3VsWklHSkxvWGJD?=
 =?utf-8?B?czZLSE5kcEoxZ2pwMWljek5TRVlVdHRqQml2YThuQXA1Q2t1V3BXTXpxWnpr?=
 =?utf-8?B?bGZQT0htc3FUL3ZEMHpoZEx0ZDJ0TlcyRGJJVmVoUFN2RHI0SkIwQVMzMllY?=
 =?utf-8?B?MGlFaUs5Q2YxUHhubUUyaWxCL091b1BqUm9ZZG9zaVZZQmNFczNnckhuaTVJ?=
 =?utf-8?B?dEs4TmtMVGNNMjh3Y2ZjL2xpaWVQV2kzWGZHWC8zM283OUh3bFRjRFVTR0x2?=
 =?utf-8?B?WWxEd1pDWWNvTHR5V1p0YlJmR2g2eGNtY2VtWkpITkNvWTdBdEk1bGJNelBK?=
 =?utf-8?B?UTN1SUpNWUJGOGxINEJwSUw0V0ZhUVlWemxjNjN2WFUxZnJSeitIdFJSa3JD?=
 =?utf-8?B?YXMrdUdJemdWU3Z2Q2J1akNYcmNxOXBnZjhCYVg0dEdUdStHclBsOGZrazdv?=
 =?utf-8?B?aHZCdmtCSklweUJMUC9pWWxwOS9wb2tjYXR5T3Z1UGRDU3VvWFRtTzlaUjY0?=
 =?utf-8?B?cnY1eXNuVU1FOGJzT3FrRFpUd3JEcFBQRmh5ZGRQV25RTStGR2gyRHo2NmpR?=
 =?utf-8?B?RDFIWW1Hc0hMRlFmTnVBZDZzeUJZK1RvZ2w1NWlaWlkzbVdqU0dnUWd5TWMx?=
 =?utf-8?B?ek4zOFBFQmVFRjNWd0FXYU9TTTFCTU40ZEhjOXllenFFTE80UmFQK1ZaL2xr?=
 =?utf-8?B?b09qTGtlRURER29sdnBveTVFbzB3SS9yZVhqa1lmOGhna2x2TzZUT1UzUWRj?=
 =?utf-8?B?TDJoNmJ5aE1adFFNbXhBMWl5MFpQTjBDTEtnK2crbDl6emdYcDlWMmlpT3pt?=
 =?utf-8?B?S3hEZ3VGRk1KbzJRRTlrODU3THZ4c1hhOXpPbVVNWUdjbDc4azVWalFGV1Bv?=
 =?utf-8?Q?0SroPqfxVlNVu+gNrQ?=
X-Exchange-RoutingPolicyChecked: YdhqnDK/sKl6WBaFA7A7TPXqSOaILpj2cDcuxu07n3Y2mu1rWyI/eLmAdHkcxnrnykVmDbxDWpEr/QqArpb5pwbddmxJbJHbVEbL+b+3sFaRuByXhli7IFSoif0qX4JsrM87c64eNPRrck40yMRnehgYHwbNSLvHODcbPncLgzg/cp2G6ozhUYjngWahfmt6ZdBeYmVITcrjj86mG8acat9L/y4TkUYMb2zxB1WJET1w0nJRaQAmAOYFUC5apyeXJhMykNegnygOvcvla6Sq924/dsDVYEz4pFxWY4PPVg/bQ/sarsh4HEGupmTHrBeCvG2vRuCMaTQ5IrU32dM3bA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bc89b2-838e-4250-d677-08dea7c39c02
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 20:52:51.3108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7/vgJ0UvFlfhTsmY9+6tJtxeGgHDU0n9QK94WKif3x8KNPznl8XX2jsZUtY8nEoLmzJ5cKMl2RKQh67j9+uBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8048
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



On 4/29/2026 21:10, Niranjana Vishwanathapura wrote:
> In __test_priority(), enable write_timestamp in xe_spin_init_opts()
> and use timestamp value to determine the queue switch order. This
> replaces the indeterminate sleep() with a more deterministic wait
> based on the GPU timestamp.
>
> Pre-set all spinners to preempt-wait before submission so each
> queue, once scheduled by HW, blocks at the semaphore. This ensures
> all queues are running on HW before testing priority-based scheduling.
>
> v2: Read timestamp to check if queue is started
>      Use usleep to ensure all semphore updates are visible to GPU
>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   tests/intel/xe_exec_multi_queue.c | 57 +++++++++++++++++++++++--------
>   1 file changed, 43 insertions(+), 14 deletions(-)
>
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index ca96099d36..0b31dd7a3f 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -454,25 +454,24 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   	for (i = 0; i < num_queues; i++) {
>   		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
>   
> -		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true);
> +		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true,
> +				  .write_timestamp = true);
> +		/*
> +		 * Pre-set all spinners to preempt-wait so each queue, once
> +		 * scheduled, immediately blocks at the QUEUE_SWITCH_MODE semaphore
> +		 * after writing its timestamp. The HW switches between queues at
> +		 * this point, allowing all of them to schedule deterministically.
> +		 */
> +		xe_spin_preempt_wait(spin[i]);
>   		sync.addr = spin_addr + (char *)&spin[i]->exec_sync - (char *)spin[i];
>   		exec.exec_queue_id = exec_queues[i];
>   		exec.address = spin_addr;
>   		xe_exec(fd, &exec);
> -
> -		/* Wait for job on Q0 to start, other queues block behind Q0 */
> -		if (!i)
> -			xe_spin_wait_started(spin[i]);
>   	}
>   
> -	sleep(sleep_duration);
> -
> -	/*
> -	 * Expect the job on other queue to not get scheduled while the spinner
> -	 * on q0 is not waiting on preempt condition.
> -	 */
> -	for (i = 1; i < num_queues; i++)
> -		igt_assert(!xe_spin_started(spin[i]));
> +	/* Wait for all queues to start and write timestamp */
> +	for (i = 0; i < num_queues; i++)
> +		while (!READ_ONCE(spin[i]->timestamp));
>   
>   	if (flags & DYN_PRIORITY) {
>   		/* Assign increasing order of priority for secondary queues */
> @@ -485,6 +484,36 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   		sleep(sleep_duration);
>   	}
>   
> +	/*
> +	 * Clear timestamps and release all queues from the semaphore wait.
> +	 * The order in which they next write a timestamp reveals the
> +	 * priority-based scheduling order.
> +	 */
> +	for (i = 0; i < num_queues; i++) {
> +		WRITE_ONCE(spin[i]->timestamp, 0);
> +		xe_spin_preempt_nowait(spin[i]);
> +
> +		/*
> +		 * For Q0, wait until it is running again to ensure it holds the engine
> +		 * when priority arbitration is triggered.
> +		 */
> +		if (!i)
> +			while (!READ_ONCE(spin[i]->timestamp));
> +	}
> +
> +	/*
> +	 * Sleep to allow xe_spin_preempt_nowait() to become visible to the GPU
> +	 * for other queues before checking if they have been scheduled.
> +	 */
> +	usleep(10);
> +
> +	/*
> +	 * Verify that secondary queues have not been scheduled while Q0
> +	 * holds the engine.
> +	 */
> +	for (i = 1; i < num_queues; i++)
> +		igt_assert(!READ_ONCE(spin[i]->timestamp));
> +
>   	/*
>   	 * Trigger a queue switch by making the spinner on q0 to wait on preempt
>   	 * condition, allowing job on q1 to get scheduled and finish. When we end
> @@ -501,7 +530,7 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>   	i = 1;
>   	while (i < num_queues) {
>   		for (j = 1; j < num_queues; j++) {
> -			if (xe_spin_started(spin[j]) && ((already_in_order & (1 << j)) == 0)) {
> +			if (READ_ONCE(spin[j]->timestamp) && ((already_in_order & (1 << j)) == 0)) {
LGTM.

Reviewed-by: Xin Wang <x.wang@intel.com>

>   				start_order[i] = j;
>   				xe_spin_end(spin[j]);
>   				xe_wait_ufence(fd, &spin[j]->exec_sync, USER_FENCE_VALUE,

