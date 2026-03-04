Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB8EB7ECE
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1405110E9AE;
	Wed,  4 Mar 2026 11:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxSc37Mv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2310E9AE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772622279; x=1804158279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WMF+D6JjrM21gggzml0QM60TnzcBwGc8Ry/YbLZLljU=;
 b=FxSc37MvT+i137njCjc0JI42L2OvvOTjXJWIgha3EaQYR9L9KnkjEv/a
 8vIlNlEFHVRbgDsNhdmDGELFUocQ1ZxxdDxVk9DJ66zzv7qvOaZ+hoscV
 Ox08I6SlgAd0eClOQx1GvnWwcTynL1NGO6uu3fun+T7dF3ZmpudTCYeNc
 0HfWDuZ6snCtt/MtauOMHCty7HvyJtd4ORco3kaVI3fxrIxDuHkXTx0di
 N9lf6RFwQvDo1WpAnYNqb9ntdZmYcZRctNVJBd4P8ea9ry0ovmc9Ea6yE
 QTBAqH+LkoQimFdKC/S27kVKYqkYenILXrYqo0J84NgwwtA3LNsUUg/Ep A==;
X-CSE-ConnectionGUID: f7cTQMagSIWHZNyo3dvb5Q==
X-CSE-MsgGUID: QrB6RzprS4atvTt7vzlmZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73553693"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73553693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:04:38 -0800
X-CSE-ConnectionGUID: PuixoPGVSoicKa/sX0OLBw==
X-CSE-MsgGUID: aYt4TbLnSLenfE0weTk7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222482536"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:04:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:04:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 03:04:37 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 03:04:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0nAs9VcQLr3YoD0oZWiPzq2+92MOBMv8yh+0ssOv0axVDRpWSho0pI9oPBnTBjv5tFrU9jIvCwEdD2tCI3zWqsUmKTFSGKQE8rV3So7izbqsWagT1BGQk3axd7mlvBy/07VMDBAJqMBC1PK2KWq388yxjA1+GtJD8MUw5E9ZBLSrziT/aRMhNR3F6tok4rSJPc8DpsHDb8She9BHx4TqdA+tpjXnQQSdwG+w9hxd0N6FlQ454UqRjjsUCPPywyz+i/Ku59IlwY1wTBirNNVQS4Y+L+u7UymjlLu913ah3U6/oKwt0sTY3424J/aEoO2KFSCwwPW+k5FfB2HOFGkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCwwpewovDlBw/avO2iXNm23g6eSK98peC7vo//E5VA=;
 b=d9ZrpOYjCKSk69UaJb4K0RVMaA6tjqNQ490ETkPMQiRObZj9R6Dx9ucnArszcg0tpNmsvGqFygnsy0jKXqMxlJdWVaVBPSYiAjKx4V2WazHXuQG/XkYM8HkBvPOSkDn/EpgdVLCEcRaWge2bT3MCUw6I6//Oyzezy+vvWYNyhCo18lJgsvqMja82OkwwY034ZgRZg3YRmKHjC2tdpI7DcDHCp1bDBeFAKAItvGCnSw7rCSYE8LsL3iKRVE76Stv3GqngWs/BddxxWzjO2R4b2W6HVfEDyp1mClEcBD+c02geUPgoWNVuAGps9RWRTFOdczvyu5pEawQHTCJp5cCU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by DM4PR11MB6334.namprd11.prod.outlook.com (2603:10b6:8:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:04:35 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:04:35 +0000
Message-ID: <d7767891-c093-4927-83a5-61f0b9e6b94c@intel.com>
Date: Wed, 4 Mar 2026 12:04:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_eudebug_online: Assert fsync return on
 debugger VM fd
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <gwan-gyeong.mun@intel.com>
References: <20260227114133.2850125-1-jan.maslak@intel.com>
 <20260227114133.2850125-3-jan.maslak@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260227114133.2850125-3-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0231.eurprd08.prod.outlook.com
 (2603:10a6:802:15::40) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|DM4PR11MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a3b0a3-de56-43e8-dfa4-08de79ddd215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: i1QLaGkRsbChvd6PWkdGnRy7ePo0aBx7+7BO/TRnPgmXKxE3HGvzp/4vwhB/jobVf1dCQSdL6ntURf63Bi529VIk5mnBroizcdNNDimqe10MD/2XKhTYquktqbw4gT+nmNbZU9uYalN6zdo8GrpW9GvXP8wwihQZ7Qopvl/BJQJMpA58aUjZVO2GMEjuYFIgE6vm57PujGbUyoyJz3LdUB59OlSBW5qRBkcAK/Pq/eXXfiF6nAO0ZUBQZpR214wRuW5TEXG4oqLMUW4nW/MjqIsY9SmGqK1gYNAq5f5mTmqxKfqSTMLvSMCsfXLRNI3URVDy/dBHB/YxG8Lw2wBHFveWEnNA8p0sLf/5RORGfr0kNdnd64ryNJL+ioeqcdWXQ6Smu7a5x2lFBBRiFPtJA2SRRv4DW8z/xcTidi9nbWbz96jhACUd/7HOQaIVcSxjGy6sJQ4tTlU1Is4qlIcNtTJamYbqZaeJrzhSKG28RWydDFJ3Wk/PxK0xMs1jNTfGem24CD8Gd2iFGJCTFe5jEdm5awlYqlGg0hRX3fuCQ4igFvRMfsH+bc8b1yS0aVVuPD6NYNuevjd7Sb4+yXsK41DDe5sHeeOinUlD7vOhQ9LVuFUuM9BHyWr8c+tzMMhPnKxO5zM4aIC2GKn9eHOFhCHYsCX0IE69haiADY8FA8YqTbHhxk6M7HuPujO+hBSK7P9/m9ZL4ZNKLJhNsuImpCAgcQ8BY13ELLCfSYqgDzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5UYVM4d2lrYXE1bDlBTkhvOWtWM1IyOHJUZ0lkRkc2WVdaTUYyanZOZUxW?=
 =?utf-8?B?K2JIR29WUXNTdVdXanZKV2MrUXZzMC9TOHVqSllwYlAzT3l5aFkvakRPOG9p?=
 =?utf-8?B?RFFuRGF4d05Sb21GbTJTSHZHenRVWVdNalM3UHNxc0VxOW5uREh2Z2c1eWpI?=
 =?utf-8?B?R0FWUzlIQ0VQMlgwdDM3YTBFRnRhTWtSdUZDSkw4OVFLaFVWWjV5ejNLYTBx?=
 =?utf-8?B?UmZaalNtcGt4UVhKaW9oMDhPY2hmay9pVE81VTdVM05Iek85QmpReWsyb3A0?=
 =?utf-8?B?OURBV0xXVWdOL0J2akIyci9CbFFLeWNLTUxObTFWRUVtV2tFeWNqM1krSFhW?=
 =?utf-8?B?Vit2MWdMZXBOdU1qMWFpNzBTbVB0N093eUc2SENhbTVKb1BWNkVlcGJ2NjZR?=
 =?utf-8?B?b2kwK1Y4THoyRG9ZR3lDNysyc2o5MXVGeFVJVFNlVFI0MkRpQzRRSVFzZW4w?=
 =?utf-8?B?Zi91SEFiQjBGQWNwZTJmZjgyWmdQVmpld2svZTZSUkRTSXpvNDd1Wmg1TXp4?=
 =?utf-8?B?Z2lrQ0dYc09jZkhpdXNnUktDaHJJS3R5ZWQ2bld4eXoxRmpTSG5RRW5ndWM3?=
 =?utf-8?B?VHNFMlJlTmc5ZHdkSWMzQXVBR3hVTmovT1pGSGNzNlFzTlJXNkppdldhUE1R?=
 =?utf-8?B?V1hOK3JHQmxUUnVidEpEWis3a2RuZWhQbkVkbnFBRlhSQnRydTVHWm5HOUhm?=
 =?utf-8?B?QUZiQXBQOVhCVkFlTlJpVHErR1o0elVZc3p4ei9HcXNPTmRpelZJbHlIdk5o?=
 =?utf-8?B?UE1RZHp2VEZUVSsySUVZWnB0SHRzZ2tjOFdzVFVaWWhLc3B0QXdtRFJoWlda?=
 =?utf-8?B?TjQ2TVpZVE4rbkg0c2RxMHNuSVdvdWJoSHdaNmdmZGE5QzgvOXAvWGdSdWVq?=
 =?utf-8?B?MXNqSGtBanoxVHNkaVFSQ0pVTGhUQkdrcTRSRWVQdWZrOHllQUNWNnFqTzdB?=
 =?utf-8?B?dTlCMGg1SkR3ekZiWHhQekwrK2pTUkZYQ3V4UHhwVUVQcFU4aDJyMzd0SnAw?=
 =?utf-8?B?Slh2UHdtamVlRVYvdjNhNk5qUEdPR3c4bkNZNDMzZm5NWllka2xocklLMlhE?=
 =?utf-8?B?YVNuYkt4eGNReXhjajU2eXk5cXA1c29zdURsWnh5Q281b3BKVnY2STgxN0JJ?=
 =?utf-8?B?REF2ODcxNVNYUnVMK2JFUDRKSkNMWGx2YWFhd1R1aVhXL0RidzE5ZkNSU1Vy?=
 =?utf-8?B?NkdJV0FSRFRZS2U1eG01eUw5NUpiYTJrMDN5WEdRdEc5K0NVU083QUpyQVVs?=
 =?utf-8?B?Q2tnVmVkWDBXZnpVS05FTWljRjMvbkRmV2NiRjlCVm9WSVNZTjFvdTg3WVc4?=
 =?utf-8?B?R21xcUFpc05abmN4UTdIV281MW96aWpWQm9lTXBvTklRUEJBdjlucUZoVzdm?=
 =?utf-8?B?VGxmZ0RWRUh4Qm14NkxhUmdtVmJOSytrcjBDdnNiMXcyV01GaE51a2QwbmQw?=
 =?utf-8?B?QU4vYUJ4MzFHOXU0ZFZleDBaTnZWanlaUENFMXZ3NlN1SHREamIrY290N2Qr?=
 =?utf-8?B?NDZnOFR1ZlBvR1VuOERoeXFraS9RRXBhdkx4Q1JDamR4YU4ydlI4MUt3YjlJ?=
 =?utf-8?B?SnUxQ1JlajRWaytRSFFxT2ZGd3J0OEVla1I4ZjZUblZaNG9WUkNYSmo4dkV1?=
 =?utf-8?B?ZUpnNE9hMkdXcUJINU9LTUdkZUNMUjd3Z3RXUXh0czBUd3hZd2hMTE1NN3RR?=
 =?utf-8?B?M3ViTWlMY1I5cXI0bEJUdjFxTU4zVkFNVWVFMVdZMzJqRk5zckZpbUIvc3RX?=
 =?utf-8?B?eUpNZXdwK1phcWQvNkw2YW9XTGRRZk9VV2JQaFBFajRRUGwySjJCSjltR0lN?=
 =?utf-8?B?enpCM1c3NzFjQXB4c005K2hKelFFRVVLN3VMSXZIdm5XNStYcG5xNGgxOFB4?=
 =?utf-8?B?aCtTQ2lLY1F2ZHE2WDVVNWRGQWVDUlY0Ly83dW9XV0xVRmk1SEVDNWRMV0p1?=
 =?utf-8?B?QmVhZWgxTGdkdnJSNEo5eVhoeXdsb1MyOHBFQW85TWlvaG9YWkdVVy9RV2Nz?=
 =?utf-8?B?K2p6alVtaUdoRHNvV1lzOVA3bEFoS0p2anRMbDhaTER4NVpLVlpwemdGbnZ2?=
 =?utf-8?B?c0R4NmUxRERQS3FISk4zT05pUWFRZFdRUmtHYjR0WlVVWW5CWW4wVW9HV2lW?=
 =?utf-8?B?QXQza21GdERuakRVZ3dpS2FjbnV1Yk5MemdJTlZxN3c2K0JWd3RrN1BsYWdv?=
 =?utf-8?B?Y2pIRlAra0JXSXducGpBM0s3bDhaVDQvZzlLSGQrQzZ5Q1hnNkRtSG9TeUp5?=
 =?utf-8?B?NkN2M3JtTUsvSmNsMDhNZjVYMmVuL3N4SFl3R0JPekgrY2d5S0dZdzIrVmYz?=
 =?utf-8?B?bDJpMVV1aFdkL2x2WC9YMmw5bGlBWE9ydjdSWkZQM29hYis1amZDZURyQ3Bo?=
 =?utf-8?Q?e3lgnc5cMGIN6vFk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a3b0a3-de56-43e8-dfa4-08de79ddd215
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:04:35.5396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfqecaDMsv0+BBjOMAYMAb2HiwobpUoEp/bM07J5EnOIUiU89Fvjx5iZwoOgd4Mo9thOOb9kW1bWZ7vw8AuHmG0lHEGVvJIt19199Nb2jYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6334
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

On 27/02/2026 12:41, Jan Maslak wrote:

> fsync() on a debugger VM fd triggers GPU cache invalidation, ensuring
> that pwrite() and pread() operations observe a consistent memory state.
> All call sites were silently ignoring the return value, allowing cache
> flush failures to go undetected.
>
> Wrap all fsync() calls with igt_assert_eq() so that a failure causes
> an immediate abort.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 6009da4d6..538fefc13 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -620,7 +620,7 @@ static bool set_breakpoint_once(struct xe_eudebug_debugger *d,
>   		instr_usdw |= breakpoint_bit;
>   		igt_assert_eq(pwrite(data->vm_fd, &instr_usdw, sz,
>   				     data->bb_offset + aip), sz);
> -		fsync(data->vm_fd);
> +		igt_assert_eq(fsync(data->vm_fd), 0);
>   
>   		breakpoint_set = true;
>   	}
> @@ -647,7 +647,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
>   	data->first_aip = first_aip;
>   	data->aips_offset_table[table_index++] = 0;
>   
> -	fsync(data->vm_fd);
> +	igt_assert_eq(fsync(data->vm_fd), 0);
>   	for (int i = sz; i < data->target_size; i += sz) {
>   		igt_assert_eq(pread(data->vm_fd, &aip, sz, data->target_offset + i), sz);
>   		if (aip == first_aip)
> @@ -667,7 +667,7 @@ static int get_stepped_threads_count(struct online_debug_data *data, int threads
>   	size_t sz = sizeof(uint32_t);
>   	uint32_t aip;
>   
> -	fsync(data->vm_fd);
> +	igt_assert_eq(fsync(data->vm_fd), 0);
>   	for (int i = 0; i < threads; i++) {
>   		igt_assert_eq(pread(data->vm_fd, &aip, sz,
>   				    data->target_offset + data->aips_offset_table[i]), sz);
> @@ -761,7 +761,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
>   		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
>   				     data->target_offset + steering_offset(threads)),
>   			      sizeof(uint32_t));
> -		fsync(data->vm_fd);
> +		igt_assert_eq(fsync(data->vm_fd), 0);
>   	}
>   	pthread_mutex_unlock(&data->mutex);
>   
> @@ -856,7 +856,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   
>   	igt_assert_eq(pwrite(data->vm_fd, &val, sz,
>   			     data->target_offset + steering_offset(threads)), sz);
> -	fsync(data->vm_fd);
> +	igt_assert_eq(fsync(data->vm_fd), 0);
>   
>   	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
>   						    att->exec_queue_handle, att->lrc_handle,
> @@ -987,7 +987,7 @@ static void overwrite_immediate_value_in_common_target_write(int vm_fd, uint64_t
>   			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
>   				      sizeof(uint32_t));
>   			igt_debug("val_before_fsync[%d]: %08x\n", vals_changed, val);
> -			fsync(vm_fd);
> +			igt_assert_eq(fsync(vm_fd), 0);
>   			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
>   				      sizeof(uint32_t));
>   			igt_debug("val_after_fsync[%d]: %08x\n", vals_changed, val);
> @@ -1042,7 +1042,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
>   				     data->bb_offset + *kernel_offset + shader_preamble->size * 4 +
>   				     shader_write_instr->size * 4 * *counter),
>   				     sizeof(instr_usdw));
> -		fsync(data->vm_fd);
> +		igt_assert_eq(fsync(data->vm_fd), 0);
>   	}
>   
>   	/* restore current instruction */

LGTM,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

