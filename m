Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3633ED5C0C9
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 03:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D962710E27E;
	Wed, 17 Dec 2025 03:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hh91e0O/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE5D10E27E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 03:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765943674; x=1797479674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HE143ZzOza6nC90XNXtydKC9OEFvnS/WJkwyW4N/iRA=;
 b=hh91e0O/709T3M3O7OEypKyf/9buV79P2tk1LIx7qdWSwHG24g+xhjYF
 Ol9T3uIIr8NRr50KiWBJCo2v5U9SpneUD8B3HKw4gXTuPB97FIQp2VSxA
 PpSpe/+jgQG6aUY6li7qmNiXkNTnsOt06jE8GKwm7dEoSURvQxeEkUYPl
 ZyAPSgSSwkNJb4aPhLzLcgSdj7Bk6VY9AU18+tZdLlMf9NBUAD1iUXlBQ
 ZdIK8k1ifJp29FCDHJfxYwFTrbITzZB71iYusICf6WspVot+BHKiPNP9v
 Br2nIB9COQPa9Z3VYh4qMWlYtJXHsAkI/nIjTE9agSibIdshzF1nWFRUD Q==;
X-CSE-ConnectionGUID: ctXpxHElRe+SPcZrukhHig==
X-CSE-MsgGUID: BTxBHIc4T2iyP/f3Hrnigg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78585102"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="78585102"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 19:54:34 -0800
X-CSE-ConnectionGUID: 6dwC6WLyTqyoN5N5G7KKFA==
X-CSE-MsgGUID: ZjevrlkZTvmdVDlKyHF1qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198254180"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 19:54:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 19:54:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 19:54:32 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 19:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsDweTGV6m1crpZy8T2engPvmrNAxS14MRFpc5ae0pIK5Tzv3WDa9Uo1/xeRoIqkljQfdtDj9gjqVdo0fj4JJRiGtcBCVnzQDM+GjUekHF7R6LDPrv8M1cBHOV+CkjaDAcOpIndat4k1o9UyHNxetHSuCeBWSzsjD3BWCWNP7xaqtpwENXB/OhWqr9dxvE+8U93MY4hqpM5DJUSNcEBoUm/HMHOzn8VZO/liVn2sAnrlAtfMc6gRnq2+LZE6S+dr0cWpcOv1LLuDW2T9QcpHeHr5JAW3DxJFlGw5pO6yATg/BRr4nRvmKKTUHe7P/66e1x4KsCUvAHlRMopgtUYTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol7fLJqSw3Ly/Y3/9L6DVAV2CcOIm1lPyq9M1fwrPbQ=;
 b=Qsq0HbjLWXoqxgahZ7NuDCvizQ8tkl6zPbyivS1Hw/PE0g83ElOmY0/NvzXCb3h2YkhVb2oJtwH0Af3BVYSbbjemWzcsVohT70PeAPUVUy+gaG9AglEEDTm9HZ9lPoUkJsTvQ9nHpNmQGOUIOc1iPBHYT0269nIwBvch44t6hWJkF4yRycpyRaeeb3btnMYFhUonbQ+KkuV1joFD9pTbBX7650xaezANANSaHpgNaR5oTcDYzcS5SoQsK9rC6rLohIIf48d9HV5ffckUs91XHSjBY79sOu+z0qFQekfVlkKbdM6dVH0mYFqFgEPT6j/wGfFTf2tZe0HEUSwMbWEr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:54:25 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 03:54:24 +0000
Message-ID: <1fe45045-44a7-4a4f-a87a-a8476de38d2a@intel.com>
Date: Wed, 17 Dec 2025 09:24:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/4] Various fixes for prime_udl test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <8e1ad796-fbb4-4a66-968c-d1acac4609a1@intel.com>
 <20251216154059.mtewdcrz5imazfdh@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251216154059.mtewdcrz5imazfdh@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 800a28f6-f3c8-4f00-bb5b-08de3d1ff6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZwWUEzM0JmV3BKRDlIeHZLV2dFbmRBb0QwNnRMeVRNaXJYNmt0MW0xdnJM?=
 =?utf-8?B?ZVQ4ejN1eUo2WFVBdDVMQ1hPcDF3cjhrMUY2czY5MDZiOHFZdVI3STgxdng0?=
 =?utf-8?B?U21ZUlNEVlQ4RUNyRDB1VGpxOXhpQkthN1AxendZd05tbm5kRFJhZlllYld2?=
 =?utf-8?B?MmtGSTNES1ZWZEdSbnB1dHcrbGV0STlZZDhhejdHdjh4YWI4UmFaQWJjbHdh?=
 =?utf-8?B?ZzlNRTFjdnhiYnF5YlRFLzdYSnpBaWgyQU1MK2YrSU5VQjRpOHVUZm1rQ2p3?=
 =?utf-8?B?d0Uya3o1MmRtMU9SdW1rK1V3a3NtNStiZ3hwdXdJSExVSitZbnROMmRPRmo0?=
 =?utf-8?B?NitENVM1NWdDVWNYRVdwWUV6U0dFaEx4K1R1M1ZZNXFPdC8yQzdzWm1NNFFF?=
 =?utf-8?B?UW42QUhDVC9ha2wwMUdKSmpPS0RVT1d1RzR1RFVkbkpnTnczUHc2Y3lHeHN5?=
 =?utf-8?B?VnFiS0dlNVZacVY2My9FZ0syR1JYYVp0ZENKaWg5S3hNM0tSVjl3UGJqcEVm?=
 =?utf-8?B?VmlWTWNDeW5XTGtEajZVWWpKVG1pVitvWlJ3OU1hejMxd1JKSlArR1ZCMEZw?=
 =?utf-8?B?VndGZllPNlpyNzZaNkJ2dXlQaTlmQXcyY2lhTVpKVmdSdktQR1d4cXVWenVF?=
 =?utf-8?B?ZWZLcnYreDdTSVk5UXdFalJ2WG41ejUyM21RSVlocVlTbGtRSmo1cGtESVRt?=
 =?utf-8?B?SHhIOHJuUmk3SlVmV0xIUjhRSndFMTZqek9DdHlBQ1gwZ3Q0ZnA5OE9hVWlw?=
 =?utf-8?B?VlBNSWN3Ri8zTklUWTNSdVVCK0ZUN1J5a2pseFhpUGxDZkZLY2x3NmNKN0No?=
 =?utf-8?B?WDYwb2k0Tm83bDlnRDJYTVRCcFVZbWhyUE9KMEJiM0Iva0dTL3hXUGVpY2da?=
 =?utf-8?B?d3JzVy91WHFubGtkRlVPWjhoZkxNVk1qOTVvS0ZEcU5MREhqTitxV0cyKzAx?=
 =?utf-8?B?UFVkRG1rSWVkZXRXNHYwZ2dRbldPdVo4OXgvdmxGSFFOcWxFZTNJeUdhN1g2?=
 =?utf-8?B?UmFXdVVJbDd2WVNCODJmVklHOStZVHZNOG9jU1FKa3dTS1BFN2xNVWMyblha?=
 =?utf-8?B?YVU3Q2UycXNLb2ZteFIwNlZYNG9IdVlTYlBFdElMbTJsU2hkekFIVm5ZeXpH?=
 =?utf-8?B?b0JTRlBoaUZvc1h0MWJiWGEvWHZkQVZSdkIwejdGeXFVazVVdmM4TXlPNlBZ?=
 =?utf-8?B?RjVWRHRVTWYwTHJGK1RqZXJBRFQwVWlYWFVkRnZZN0Juem1DbmlDVHhOSEsr?=
 =?utf-8?B?bUcxTU1LRU4wdmFCRzFGZExsRmI3bzBjQTJBR3h6TDZPczgrdGNiWG9IbHcy?=
 =?utf-8?B?TDlTZ0ZaRWtsdW1FNnBZaktXaW5kQUtybnVTQi9DdkRLVzJ5SHl5ZVc2V3lO?=
 =?utf-8?B?UVVneVVZVHc2UEhGS2c4UlA1RUIyQ3VVcHhIK1hWdXVmZEYvUXpQTy85VjRQ?=
 =?utf-8?B?ZDB1dGdrTnRZT2lYelZOeHdPVFl1RFR1WGpnbmRqbE9abWEvS29sdjkvS3hL?=
 =?utf-8?B?MURMVFljMFp3eERTWVJubkk5TjNoQnZ0TkJwOEV5b3g3NU9uaW5Wa2RZdDlP?=
 =?utf-8?B?SzJHRSt6d0tRZ3lKc1NaNitPWlJxNG1iZm5oK1NSSXRpZTB6Yjc0cHhiRVFi?=
 =?utf-8?B?Nmo2bTJBbVhHVUpvNjNGMlZiWHBDbWdZNGZTb1UvSWovMTNNazc4MUdoZHox?=
 =?utf-8?B?ZjV0a01RcUJhUTAwVE0wZlQzd1pXRk1rQmptclpHdmN5K2MzUDVkY2VFL0tW?=
 =?utf-8?B?dU1adXdmMDEvcE9kYTdISFIzeUI2OHFJYWZpNnQ4cmJaT3BEVjRkbml1dExR?=
 =?utf-8?B?dVFwNWg4b0NmZUFhVGt6a0YrbnlBWVQxbjJXZGlxajMxR0p5eTZxSUpwZFhu?=
 =?utf-8?B?MVJIamlwVEtyOGpURTJuSnpYaGNWVVdncDN3SWU0T2tTVTZCaXcrMDl4cVBq?=
 =?utf-8?Q?QYKRDGdXdBxwjsJGNmjRWk87SazPGjyL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alVsTG1BaTFyL0x1a0NRcHFpenBhOWk1K0ZOcmVEZ2VaRGprZkpMT09CMFUv?=
 =?utf-8?B?YXVlUGdyd2VnVnh1V2thU2lVQ3pHZkpJR080UmpBQmM2L2VoL3RZb2tKY09U?=
 =?utf-8?B?ZHNNdFd4SDdtUG9nQXJHdU9vQmVaL1lHcVhJZ1kvbStZVDBOaVVwdm9CNnUw?=
 =?utf-8?B?WGp2VTYxdnkyVFlNMWVlckZUSm5pYUlWZFpUeHVOclcyRFI5WHI5eXRqMUVz?=
 =?utf-8?B?WlY0aFpONTFmWHJnWmIveUVHQmJEUUwvWlNBa29teHUwV1JDbmlBVjVFQkRJ?=
 =?utf-8?B?SHg3WllmR2I4U0NUcm5mRCtDY2RJdGZyOHM1VXNFWXF6TktoSUJvZDFCUDBC?=
 =?utf-8?B?V3U4eGlEOXNsbnJZSjFIbzhUb1QzSHczS0xkM0NUR1NYWHRYbUR1N0lBQlpy?=
 =?utf-8?B?RTV6allNNXMzYjAyalhsWThjSiswRjZaYktudHZaVXlUQ2NEUStLWUVIUHZ4?=
 =?utf-8?B?dUloRTRwY09tMDA3Z09kT0dqd1FCQ3VRK0tQa2hCT2xYYzNQaDBwR3NZMDR6?=
 =?utf-8?B?aDArSHFLeFM4QTZab3d6Vi9nRWpDYnRDVDMvZHl3elk5Z2ZmYmFiZWJ1dXlz?=
 =?utf-8?B?L05qMnF4NHRJNDg1YWdwYTU4L2Nhb292SVVhZENSWlliK2E1dVBFMFE4MlZN?=
 =?utf-8?B?WHRRMUFjS0hBLzdYa1JHcC9GektiYmFOUjN5V1U5TWhaWmdiMnV4enJRNUxl?=
 =?utf-8?B?bnc4c1ZWK0pJdWQyTVljRmF4SEJ3VVZRQnovQ2tXdk1KUEQ3MjhXSXBudGhJ?=
 =?utf-8?B?b3lQaXNBeHBKL1R3Z281YzZCdkV0czMwOVFXZnBPdGRLdGMyOURFOWU1cGF2?=
 =?utf-8?B?RGRmWHNkdGhycmFOZjdyMkg2R2NIWGRpY2lNdDhTa2ZvUGRSQy9tc2VWdWlU?=
 =?utf-8?B?NWtKdXZMY1NWNTBhUUlMY3hUdk1Gejg2TWNSbjRFOGhoZnczcW9qSEZiNWVl?=
 =?utf-8?B?bWZTckxNckZKUTh2cm1ZVjFJUTVxT1ZPT1FnU1l0dVJkRTEyWUNxSFhXTEp5?=
 =?utf-8?B?WVdoZWltR1pseGZWQkNvbEZncFdqQTBBb1dGWmMvQjFOalFhUFd5NlN4MVRT?=
 =?utf-8?B?emNHTnU4Mk93ME9KZlJocWJGeDJrQUFHeUVxMndKTVVvb1JkZHg3K1JQZXRR?=
 =?utf-8?B?b05iZHBxNUZycFhMUFpHR3ZhNFlwaUwrT21jV2d3ZEdraVJ1aENkVkFOd09F?=
 =?utf-8?B?QjRleEIrOEQ0MERKOEttMXZmTllQbGgxUlJ0VDRnd3k1MUN5WkxJcENNZ3FD?=
 =?utf-8?B?R25Hbit4L1FSNVJpTXFXUjdyVXJwZE5teFhWYTJPUElWRnBWM3Z4OHpRQ0Ru?=
 =?utf-8?B?WmlGYWlhM0MzSnFxbVVmbEhlM25pSThBdzFMSXVFS0hiRmtCZ1ZiNnMvSGNs?=
 =?utf-8?B?RnFnTXJnZVNNbmZBNWtnU3RHbTNDUlBTK0lhREo3Q3FyQ2NiZmJ2VVVwd1Rw?=
 =?utf-8?B?RkljMFFSZU9heU9FVU5kT01lRGJPdnVzdGhYQUZWYUxWTHFYOVpOdEFLUFpl?=
 =?utf-8?B?a2txZnNxV3kyYzV1cXZjUEo4ZkM2YzE0RHBnZG90NXNBcTEzYldFVWF0T3NQ?=
 =?utf-8?B?L01PdEdZdUprWGs2YXRzUjVlUnZxMlV5ZG15cVZnenpScTg1SnVaNTVBUk9w?=
 =?utf-8?B?TVlVWlVETHJFZGlTSStvd3J2MXJaTHhCRW8xRi9pMks2SmpMblJVTE15RDBp?=
 =?utf-8?B?SEdvZTBmNjdBY1YvakxyMzQ1VUlpZjk1a2o5RWFrT09oY3JxakpEYUVpeGE1?=
 =?utf-8?B?WGVOb252MmdDaU10c0lyM000bDB5WnFTeGdWcHdGSmU4WGJZSFlER2lQSGk3?=
 =?utf-8?B?bkZpWjhlTkEydkFUTWNyQjgzdWNLd0s0cGRRNTh6ZThXM29mN3RTNGFldkth?=
 =?utf-8?B?QTMybnJmMlNnNUJqNUc5YTlERlJSckZnWDRXdjdMb29PM1d3TkROZlh0Vmla?=
 =?utf-8?B?WEVOd2NCNTdTVWJLbFZ1NTIzRnVUUTlXbVZuT0hVMlJnQSsyYkNUaFZETVdB?=
 =?utf-8?B?Y3VuWUp6eWZJbDdVdG11Y2hQbVhqUk1rTGEzUVZrV1I5RGVqYnhEUXJmbTZN?=
 =?utf-8?B?aVcvekVnSnp3NXN0RkZKcndWQXVSUEZ6RGdmeDFoRytTdnI5dHBGSVR1YXph?=
 =?utf-8?Q?yTRLdn1dmzeQl5cB/laFC9xak?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 800a28f6-f3c8-4f00-bb5b-08de3d1ff6f0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:54:24.6688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb5EdaIC63+LV4jmflBuyyoyHWZlvfcupEBMNq25EPmRjYV/QbgCnL1oyzBrD570rqESv0GYBhMFyVZ4WIj78w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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

Hi Kamil,

On 12/16/2025 9:10 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-12-16 at 09:03:11 +0530, Karthik B S wrote:
>> Hi Kamil,
>>
>> On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
>>> Refactor this test into proper opening fixup, then tests and
>>> last closing fixup. Also fix few error checks and make sure
>>> opened device is handled by i915 driver as there are now also
>>> one handled by Xe.
>>>
>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> The series LGTM overall, but one open I've is if this test should be moved
>> to intel folder rather than the generic tests folder?
> Yes, you are right, before that I would like to add proper * TEST:
> and other descriptions and I will test it in trybot.
> Imho proper name would be tests/intel/i915_prime_udl.c unless
> this will run also on Xe? Btw is this test covered by some other
> KMS one?

Agreed on the test name. No this is not covered. We only have kms_prime 
for kms specific validation.

Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>> Regards,
>> Karthik.B.S
>>> Kamil Konieczny (4):
>>>     tests/prime_udl: Fix opening
>>>     tests/prime_udl: Create subtests
>>>     tests/prime_udl: Fix error handling
>>>     tests/prime_udl: Fix i915 device opening
>>>
>>>    tests/prime_udl.c | 38 ++++++++++++++++++++++++--------------
>>>    1 file changed, 24 insertions(+), 14 deletions(-)
>>>
