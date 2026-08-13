Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0001DC5CFEB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 14:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6E10F358;
	Thu, 13 Aug 2026 14:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgcELhYH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B94210E039
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629658; x=1818165658;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zKIp4vfyb+ZbRSmzyrgqwainX4j8/NJFHqGb0IKkKSs=;
 b=MgcELhYH6myGJC0tpoih0Vp5alxZLpmjfRhYLPVGS+4x8lnYHra6nGf2
 liBYpivhVqGlTu1Jq3fBUK+2yW6aMHwx+Phuua+j0/EXP8W7uoDiBnqrN
 bbewO7foVzFHc2SlMbsDuwoDGYhLHq/pVB1lf/GYQOz02C0CeXEt3DBJD
 6YfC8Ha8sIrRqLrPywifLg9Efp2nZNaAGTbbMF+T++91E4NTjKWFBOHY5
 JOzwaQP+lSBx9+Fe93NuCDh0Ayf2jEF/4tbHfiP8xnztCvRRnXt9cRKd6
 B81RK/NZRAVNccePErKYStEmeyeDkK3lLSkmHg/0xCRQwyTPCbNFA5Yd/ Q==;
X-CSE-ConnectionGUID: OQ84C+jqQnaKrvc1CLy6Sw==
X-CSE-MsgGUID: nRh/HIBLQ1W2apan29oz1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86323233"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="86323233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:00:58 -0700
X-CSE-ConnectionGUID: RRA02JFRQG+xSGIH9mOqNA==
X-CSE-MsgGUID: 5/63tFNBQBmA1S8jfDMMPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="267802041"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 07:00:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:00:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 07:00:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 07:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcbCjXlslNCA+7uQZicCeG25PCmfEFUucRg6k6peu/nIgU0wMOB7d6Dh7VrctW9JWxDEzIshUp20uHvLYKwSR4NN1Q9Kullfe+wGzthEy/BtuAB/ahIH9rr4uVqjcEMDcAr1E31b0QVEuj61Y+aVwViY3Bymw00qYfephlO90j+8ASihbEn4GAtz2iwKHNfXvycjdmXJyuuQwAAJWx8ruWqj+NYgnWcgwV+BlEfTGWJv1APx2A+oePvBi6NWCN3okLffrSYPr7UXTaVFAKeTUQZ8EGk3WenzFEXRIg5E/Ha0BMg1sCIFBgr0VjZEd8RWaAhPStQv8deTe78HkqMoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vthC/U4B+HZDC+Sf4taQqyUpppHA7VBqeVm5Pi/FfUY=;
 b=d0DWHTyJSM/KyRf1/NpkRw6TXcqR7uFSf3b9/ayBGnG0htylAfZyK6Rtku9Fbks4gkkr0FW5DBYAADvNpQ0FP982EjG8Mm+r3yLOi0UsXdcUmB9b/XswvhAOolkkHIMMeHQZcWj+UFqU0jpZBLeX6a7fYAFk45+quor7ip/mljWfL2im6cQ5RrGTEjD02k5Hl1iI0JD7ajbL9gn2BWKlRiWF9WdkarsEbmAVrTNIRs6+uIE4vtkneFngj/3Kgt+266Nf9AFdI6b1qb9OOcQOkDmbzLpOKRHViI7D+UGnHlTQ1Gc5/kL1KlzFTj9WRBJm1nClmLLKQG3Vq8WSFSG8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 14:00:52 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 14:00:52 +0000
Message-ID: <8cddfa89-58d6-4a96-87f2-6acd3b5b0c75@intel.com>
Date: Thu, 13 Aug 2026 19:30:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/6] tests/kms_chamelium_color_pipeline: Add
 FIXED_MATRIX colorop tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-7-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806120345.19406-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::17) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 928e3a52-10c1-4bb5-40b9-08def9434930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: wpFwwAv0vnBXo9/tTHu65hIftmRxPriIOahdIZPtST90xCWZouvj9wg5YBcpceEFNzOBXB58ouKHx1lDPHX9BXPZBJNYbZ+LPI1egG8vQuYtK4MHZpJ0GAplz1oajTeISFzKUtU3fdOwpH1CL05ooR22aUHOw29WSwgSGm+0Q1/h3PcouHR6Bbh9gtdpJMZY6YYxRNjwAOWGXebcCjowL8QETNgD0Y/oTsk6zzfnna/ocLL5HbcZpIi2S1GSIcyZL1DEHdG0ctqZ/BH/I8Qo6lUmHtaGBvZBHB2ZruDA7tWrD0Xtqkyo/bqg0haYCNT1tKVam/gFEEFPfJnI/R21LahfDxPEMgT23aHHLH90lBYckNtDqbBbmcALnFTEp0egi/3b3tYZfetQXyzNJWY2ovbj5sDkq9lqQrXkUOVAe2GzkmQA6qhsJzwNSMgf6Yir9WHAFF0Q8UnDQYCaZf6CbRik3SAzrBDv2P9J5dqVsrjDVEdxoSASU9ZeH8zFfhD2A4mbDw9Z5a7Hz/AW1eJN3QTZxpE51Vc4ML0YzGOk0UV+vfdPghK7sowBmOWsvBao2aeGyt4MtXRq27PDQjLN8EkA9qYV42WK0dRsKU0UH+mCSCje2PZIuNtxRlZaUwX6LkkMAksjL+cYeJkV2/2rlce00cpr4YgY6j6OCXPFB1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhZejhXaXQrdHRmWkRxOUp2N0RJbFhJWExIR2FZdkFUaTVoNmNPZ0FHN0NE?=
 =?utf-8?B?MFRHdDVPbDZGemtNSVY1VWtDb2dqYWdVeTh3SFhIWTFyRmt6NjViZE96VVA5?=
 =?utf-8?B?Y0RjU3puaHJwTEFTUVB3R2FBY0JPWVlUaC9McjluUEVFdndza2tNYlpDV1Jw?=
 =?utf-8?B?WWVhODJpWGVGTTNVN0hJWm9PajRBUlVwTUJuYU1GWmM4S0U1T1hqbEZ0YjZ1?=
 =?utf-8?B?OXhGZ3JWcE5udUw5aEV3RUlQd2hHOVpyRTduaThnVkVFN1VPSkdPQ3NvSTlk?=
 =?utf-8?B?UUtPUTl2VTJSRkM3dEFjaDBvQzZ5V29qTGJtVmw4ZlBoZmV6ZmJuLzczbE14?=
 =?utf-8?B?dVBVUDFNU0Q2c2VKckJaNWVqWEFQaUZhaDRsRXpROHltcFFLY2xncThuTjVY?=
 =?utf-8?B?SEoxRWQ4a2ZhOXpqU1RPcER6eDdSaXRQNGI0bHlrVnRqVTNQMktNODZvZW10?=
 =?utf-8?B?Zk5RcWZsM1RPRzFqc281SGlVWEF2K0Rqd0UxclZDSndJaU1VWGdsOFRIR2RE?=
 =?utf-8?B?KzQ3UVJWVXJjWm4vRVhLOGpmK2JhM2FPY0x0Y2prSmY1Y3lrblA3MmxrNXRJ?=
 =?utf-8?B?L3drblN5eFVDWjF5TDhMRFNHcmdRZmhZZSt5b3RpQ2xMUFJzSEtvSllKd1dT?=
 =?utf-8?B?aUtwaXBFV0J1SER1VmlzbzhIdDBkRHlObEg1K0pUUE5ab2FwbE1NNlQ3aVlC?=
 =?utf-8?B?SHpNT09zQkN0aC9UckVWS3NDZW1aSmlxSGVRVHlFZTNnZUhvMENhVEJVa3Vv?=
 =?utf-8?B?Nk9MQkMxY0tuWWU1NWRyRU1tSDJmclgvRGRSN0ZidmNBN09vYnRsVkQzckxR?=
 =?utf-8?B?a0dGVGdDRGRDRkpOc2xTSWZDb2Y1WnEvclM1WkpuOXpEc3l1TVdGZU9VT2p4?=
 =?utf-8?B?QmlCaldxWmQ3ZjVjMnA3YnBFR3BSOTBaZFlOYmVIV0l1NzlMYnI4Sks5Wi9l?=
 =?utf-8?B?RTJOblVrdXZZWS9MYitBODVSK3ZlaTczNG1SVzArZS84K0RYY1dRNlJiS0th?=
 =?utf-8?B?Q1hBbDVPY3FTaTVxck5BQ1ZpdVJJVWxEUWd5RVA0VGVvaFV6OElMZVE2Z0h2?=
 =?utf-8?B?b2szL24ybVFnQVVKaForWEY3UEtEcnJpbmV5aEtGNnJrWnBXaE9ncFRZMnNF?=
 =?utf-8?B?MWZQMVlxYlRDa3JBSWJ6ZWZJNnZ3VG5WUXNXNGlsRUNLNFg4a3J3SEZLenBI?=
 =?utf-8?B?USs4a0FuL1ZNMjl5Tno0eURuZmFZZ21FUTZxb0JXWTh2KzhOVkxTVWs4WXlJ?=
 =?utf-8?B?UUdwcDc5TE1VbHhBNGUrSG53cUJsV1VPeW1wUStOVGwyZ2pLNmo5ejFiZ0Nv?=
 =?utf-8?B?QTBiQnNIQzZ3M1Q3VVhubTdMSmJCVGJHcjJpMy9TWjRsZ3BrV0oyOFBqOUxW?=
 =?utf-8?B?ZnRRa0NLbXg5TmxiMnI1TmtLNVNpN1M3YUdnZExJWDFHdmFpTU56Q24wU1FD?=
 =?utf-8?B?K1hwMTFOYzVtc2FzdERaeS91bUs4K3BRZHFWSE5IYlVMbXZ5WUNsemdQQnhU?=
 =?utf-8?B?VStVcDBlODA5R0l0bnoxckxlQWNvQy9jZnRnZU5LdTNwMHFYQ29OM2RFNW1C?=
 =?utf-8?B?QTRoYlAxU2kyVG5XQkdSQXVQM3JIb3I2Z1RydFJBNktNdzdLWkFndjIvVHo3?=
 =?utf-8?B?THNXRnF0aUM4dHJXSEVoa2NDZnhHamx3V1B3YlBZdHhFdGU0TmdnRHJaSUJz?=
 =?utf-8?B?V2xNd2JnSUZ0VFFLankyYnJrRzFkQmtMRUVMVmt5Nm9HUmZpVUNXaytkR3NP?=
 =?utf-8?B?c1dCLzZkMVhFeDBkQjlJalYrSEJsdks2dUh1eEFpOVZCeXZKTWlsZXZ6SExC?=
 =?utf-8?B?dWNWdnppdlVkRGZLbSt4R0k2K2YvRDkrTnU4eUhpTm80dHYzUS90VU9SVmpl?=
 =?utf-8?B?TldMTkRCMlNSdjlGK01zaS9JT1k3Y1V1VHlVVmFib0hPVVJNY1NNc3dSMDBo?=
 =?utf-8?B?NnpaRjFpekxIblU4bzZ3Ti9uU2xtUGZtSWpnODBGeXFoY3JVL3oyV2FhSjZH?=
 =?utf-8?B?N2JOWDN0TGNadHdtSlg3VmNRdGxFenpDcXZTSnBtMzJ4SnAweTlqbHRzbGx2?=
 =?utf-8?B?bUxheWxwRkI5YTZpYlZTNHVlSXdaQndTb1V3S1BtTTc3a1lTZzYvbWVhL3Fj?=
 =?utf-8?B?U1kzbHg1Vi9GYnBPak4wcG1UTUFMWE5FL2hZbGRBSmVOWXFQRDNSdGdueVZ1?=
 =?utf-8?B?WmJMWnVqRUt2M3JYTXB2U21MWStzRG5VL2JhbzRndFlsbE9nSWdsSDNmbEg5?=
 =?utf-8?B?WWFlM1FDSlR0Vzl6WGhpWHBTeHJONWVZUFloRFJSVEUvZGNVSVc0a3Y4WkhU?=
 =?utf-8?B?L2ZaOEdocnFFSFpCMmh1R2U0Z3BmMjBpYlNwaTJGVmwzY0RYenUyZHExRnVm?=
 =?utf-8?Q?STWu3JVxUqLQG3IU=3D?=
X-Exchange-RoutingPolicyChecked: irUmbB0JUjjH3/wvf0q/o2XtVwYZ2DOSCJOwpLT0Llf7kIMQV9S5astYVlkDlhbNzetlvmgYquU2kzdrMH1WtrXf5GWppdztaS40BSXbPFhyvSUfs7CigHdEqg8y5rvsbQ9ExZU7cgCK90VdsNAGlkiwImoAPGZ9S0Dh1f4n2MCVSHF0L90WkW6GQG4n/NDJKx8nON1RAye01Vbh66z1pb1UphVrWIEvgEOQQimD5Iqdn+9uJsxFU6rDktcjvDu0MKYPN7lYn/HOw9APUJLXtCEHZCaOvTIk7/wxpXpsLZeQbri+3cXtiEdHe1mMJ631+l3K6hm4hq1MbQdCoBIf0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 928e3a52-10c1-4bb5-40b9-08def9434930
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:00:52.2809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbaeAu1mgsC2kjA0Vtb8fWzC6GrfEPj07bRlPTBvjBXJ7CNQ3mdDgueKARS3eMZSDRxy1Odf4Gf/Yjv+FnW+c2knQgMTS0m6n/ni7igUqpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
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



On 8/6/2026 5:33 PM, Swati Sharma wrote:
> Add Chamelium frame-capture equivalents of the FIXED_MATRIX colorop
> tests from kms_color_pipeline. Unlike the pipe-CRC variant, these
> validate the output using chamelium_frame_match_or_dump() with analog
> frame comparison, whose tolerance accommodates the small differences
> between the software color model and the hardware fixed-point matrix
> that a bit-exact pipe CRC cannot.
> 
> The SW reference framebuffer is computed by converting the YUV input
> through igt_fb_convert(), which internally applies igt_ycbcr_to_rgb_matrix(),
> matching the reference computation used in the pipe-CRC variant.
> 
> New subtests:
>   - plane-fixed-matrix-yuv-rgb-bt601
>   - plane-fixed-matrix-yuv-rgb-bt709
>   - plane-fixed-matrix-yuv-rgb-bt2020
>   - plane-fixed-matrix-yuv-rgb-bt601-lim
>   - plane-fixed-matrix-yuv-rgb-bt709-lim
>   - plane-fixed-matrix-yuv-rgb-bt2020-lim
>   - plane-fixed-matrix-yuv-rgb-bt601-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt709-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt2020-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d
>   - plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d
> 
> v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
> v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
>       until we have non-IGT userspace that shows their use
>      -Rename subtests to yuv-rgb-btXXX with limited range variants
> 
> Assisted-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../chamelium/kms_chamelium_color_pipeline.c  | 307 ++++++++++++++++++
>   1 file changed, 307 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> index db6107221..63c5a3a3c 100644
> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -34,6 +34,26 @@
>    * @lut3d-green-only:		3D LUT
>    */
>   
> +/**
> + * SUBTEST: plane-fixed-matrix-%s
> + * Description: Test FIXED_MATRIX colorop for color space conversion: %arg[1].
> + *
> + * arg[1]:
> + *
> + * @yuv-rgb-bt601:		YUV BT.601 full range to RGB BT.601
> + * @yuv-rgb-bt709:		YUV BT.709 full range to RGB BT.709
> + * @yuv-rgb-bt2020:		YUV BT.2020 full range to RGB BT.2020
> + * @yuv-rgb-bt601-lim:		YUV BT.601 limited range to RGB BT.601
> + * @yuv-rgb-bt709-lim:		YUV BT.709 limited range to RGB BT.709
> + * @yuv-rgb-bt2020-lim:		YUV BT.2020 limited range to RGB BT.2020
> + * @yuv-rgb-bt601-lut1d:	YUV BT.601 full range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lut1d:	YUV BT.709 full range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lut1d:	YUV BT.2020 full range to RGB BT.2020, then 1D LUT
> + * @yuv-rgb-bt601-lim-lut1d:	YUV BT.601 limited range to RGB BT.601, then 1D LUT
> + * @yuv-rgb-bt709-lim-lut1d:	YUV BT.709 limited range to RGB BT.709, then 1D LUT
> + * @yuv-rgb-bt2020-lim-lut1d:	YUV BT.2020 limited range to RGB BT.2020, then 1D LUT
> + */
> +
>   IGT_TEST_DESCRIPTION("Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC");
>   
>   static void test_cleanup(data_t *data)
> @@ -345,6 +365,290 @@ run_tests_for_plane(data_t *data)
>   	}
>   }
>   
> +static void
> +_test_plane_fixed_matrix_colorops(data_t *data,
> +				  igt_plane_t *plane,
> +				  const color_t *fb_colors,
> +				  kms_colorop_t *colorops[],
> +				  uint32_t input_format,
> +				  enum igt_color_encoding encoding,
> +				  enum igt_color_range range,
> +				  struct chamelium_port *port)
> +{
> +	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode = data->mode;
> +	igt_colorop_t *color_pipeline;
> +	struct igt_fb fb, fbref;
> +	struct chamelium_frame_dump *frame;
> +	bool ret;
> +
> +	color_pipeline = get_color_pipeline(display, plane, colorops);
> +	igt_skip_on(!color_pipeline);
> +
> +	/* Create HW input framebuffer (YUV or RGB) */
> +	igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
> +					      mode->hdisplay,
> +					      mode->vdisplay,
> +					      input_format,
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      encoding, range,
> +					      &fb, 0, 0));
> +
> +	/* Paint the input fb with test colors */
> +	paint_rectangles(data, mode, fb_colors, &fb);
> +
> +	/*
> +	 * Software reference: convert the input fb through igt_fb_convert()
> +	 * which internally applies igt_ycbcr_to_rgb_matrix(). This matches
> +	 * what the HW FIXED_MATRIX colorop should produce.
> +	 * Chamelium analog comparison tolerates HW vs SW rounding differences.
> +	 */
> +	igt_fb_convert(&fbref, &fb, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR);

Can we re-use the pattern of collecting SW reference just once per pipe?

> +
> +	/* Hardware path */
> +	set_color_pipeline(display, plane, colorops, color_pipeline);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_port_wait_video_input_stable(data->chamelium, port, 5);
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +
> +	frame = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium, port, frame,
> +					    &fbref, CHAMELIUM_CHECK_ANALOG);
> +	igt_assert(ret);
> +

assert is a problem here too. In here it will also lead to the frame 
dump leaking.

> +	chamelium_destroy_frame_dump(frame);
> +
> +	/* Cleanup */
> +	set_color_pipeline_bypass(plane);
> +	reset_colorops(colorops);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +	igt_remove_fb(data->drm_fd, &fbref);
> +}
> +
> +static void
> +test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
> +				 const color_t *fb_colors,
> +				 kms_colorop_t *colorops[],
> +				 uint32_t input_format,
> +				 enum igt_color_encoding encoding,
> +				 enum igt_color_range range,
> +				 int port_idx)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
> +			_test_plane_fixed_matrix_colorops(data, plane,
> +							  fb_colors,
> +							  colorops, input_format,
> +							  encoding, range,
> +							  data->ports[port_idx]);
> +	}
> +}
> +
> +static void
> +run_tests_for_fixed_matrix(data_t *data)
> +{
> +	igt_crtc_t *crtc;
> +	igt_output_t *output = NULL;
> +	int port_idx = 0;
> +	static const color_t colors_rgb[] = {
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 },
> +	};
> +	kms_colorop_t lut1d_linear = {
> +		.type = KMS_COLOROP_CUSTOM_LUT1D,
> +		.name = "1D LUT (linear)",
> +		.lut1d = &igt_1dlut_linear,
> +		.transform = &igt_color_linear,
> +	};
> +	kms_colorop_t fixed_matrix_yuv601_rgb601 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 to RGB601",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 to RGB709",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020 = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 to RGB2020",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv601_rgb601_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV601 limited to RGB601",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv709_rgb709_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV709 limited to RGB709",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB },
> +	};
> +	kms_colorop_t fixed_matrix_yuv2020_rgb2020_lim = {
> +		.type = KMS_COLOROP_FIXED_MATRIX,
> +		.name = "FIXED_MATRIX YUV2020 limited to RGB2020",
> +		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB },
> +	};
> +
> +	struct {
> +		const char *name;
> +		const char *subtest_prefix;
> +		const color_t *fb_colors;
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		uint32_t input_format;
> +		enum igt_color_encoding encoding;
> +		enum igt_color_range range;
> +	} fixed_matrix_tests[] = {
> +		{ .name = "yuv-rgb-bt601",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt601-lim",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709-lim",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt601-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt601-lim-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT601,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt709-lim-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT709,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +		{ .name = "yuv-rgb-bt2020-lim-lut1d",
> +		  .subtest_prefix = "plane-fixed-matrix",
> +		  .fb_colors = colors_rgb,
> +		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, &lut1d_linear, NULL },
> +		  .input_format = DRM_FORMAT_YUYV,
> +		  .encoding = IGT_COLOR_YCBCR_BT2020,
> +		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
> +		},
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(fixed_matrix_tests); i++) {
> +		igt_describe_f("Test FIXED_MATRIX pipeline: %s-%s",
> +			       fixed_matrix_tests[i].subtest_prefix,
> +			       fixed_matrix_tests[i].name);
> +		igt_subtest_with_dynamic_f("%s-%s",
> +					   fixed_matrix_tests[i].subtest_prefix,
> +					   fixed_matrix_tests[i].name) {
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 output) {
> +				data->output = output;
> +
> +				if (!crtc_output_combo_valid(data, crtc))
> +					continue;
> +
> +				port_idx = test_setup(data, crtc);
> +				if (port_idx < 0) {
> +					test_cleanup(data);
> +					continue;
> +				}
> +
> +				test_plane_fixed_matrix_colorops(data, crtc,
> +								 fixed_matrix_tests[i].fb_colors,
> +								 fixed_matrix_tests[i].colorops,
> +								 fixed_matrix_tests[i].input_format,
> +								 fixed_matrix_tests[i].encoding,
> +								 fixed_matrix_tests[i].range,
> +								 port_idx);
> +
> +				test_cleanup(data);
> +			}
> +		}
> +	}
> +}
> +
>   int igt_main()
>   {
>   	int i;
> @@ -404,6 +708,9 @@ int igt_main()
>   	igt_subtest_group()
>   		run_tests_for_plane(&data);
>   
> +	igt_subtest_group()
> +		run_tests_for_fixed_matrix(&data);
> +
>   	igt_fixture() {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);

