Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3775CA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 06:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA3210E0DD;
	Wed,  3 Sep 2025 06:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GK4ruqMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ED010E0DD
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756882233; x=1788418233;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EjGFKEfKvzoUIhE+K2KOu+9+4JIylQbKLtBE9xaIP8w=;
 b=GK4ruqMNlIzQdOI0FS6pwN7mXQGMd62xvo2Ev8coMNhFo9dLumaOx/Z5
 FnD8D3gnyuYTM7TeUe8Aiqky57YPOD8U5xYD1l8cQ0yqkiKZNO/zP3Wsk
 CpS0+HQkAa+5QRmPh4tUNa5isR0de3gREP46jeZ4jTd3DpreYSlWX15mz
 1pVnKfGya5O1ubhbIkGCsm3B3mWTLr+oCj+SFiXhCk3sW+tQJh6N4b8l7
 tan/8IGhd3qnxZ703mFLLJfnLeggvp00NX8u0ZAjmSbkdHvkXI/gRolKS
 v3uEtGVu9Zqj6ps7iKMtos4eKXea3unucopcuuc5PRcv9nLFfEaGwkq0j g==;
X-CSE-ConnectionGUID: Z+VX1zMmSiaP8O6xgOirEw==
X-CSE-MsgGUID: BHdo9ntQQE+WoqwatNWMOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70284922"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70284922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:50:32 -0700
X-CSE-ConnectionGUID: UVKqfP8HQv2Zxch+Hf/shg==
X-CSE-MsgGUID: 1zHZyziBRNqO2T42Eb7GXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171384147"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:50:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:50:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 23:50:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.66)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 23:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok0dbyu3K0RBqkaP3ydDd/LAv73UQLboxMr+39hgk6hV0rIh6zZTqmeSbnDsrbKtAac9RJ/WbpSO8isSkQYfigiNC2QOjE4t6AbmQnwhkQw7+UpBDzuJjfCHiAeB/Pn/Vxu2z4RGR2o3eBlRbG5ONoZKzG5fFKDYKQ1uX8GUhFZHDqVbB+k+puG0sMDlU+lTrHeG/FDxpykzVWi1thpzv7mlpnIcxkDruxqieohI8Pe2j1V+hCWFMOVPFkMzmQbjcsCy84hZebq136ObujurbxeBb5hY0M5jYnb/rlmq6b9kiLzuD8o2mE4ZgSBMTyBPAzsXrEMxFxsrN9xHww/xHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFJSL00WhyWQJiomWFV2ymYpKgqpuBQPZfFsQ8Vt9So=;
 b=mssWySnChslGA9ER+XFxS+s4eOauUqwnH3QhlBBxEhx3u3+xNuHjIa1CHpVQeT+2BLUOPsM007YFSTPdSbYlbCfBwll8tDPEfgxn55+5b/uDWz9epxhZ/XwX+85rsY/6QtHesN1DewZG9LlhOHTiLVAUfW9wSVpRamoAH3wb2qubmq//DhLzTH5wg93uzuLpAh90pFhmsesiJDgbZv41JThNfZIB1wQGUcWwjsfF07US9aK3xaHBt8Z3JSAo426+1u6ft2vAE3Big1sxHW1geMRCwkfxNTzxT22rTQGaIW7Brn7u2MypUIJhMPWvjKcgibzpUFI1wsIt9mjti9k5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB7725.namprd11.prod.outlook.com (2603:10b6:208:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 06:50:26 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 06:50:26 +0000
Message-ID: <9888e938-4e5d-48a6-84a3-41af8baf7d3c@intel.com>
Date: Wed, 3 Sep 2025 12:20:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/fbdev: Skip resolution mismatch due to
 GitLab issue #2488
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
 <20250824194822.1437870-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250824194822.1437870-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: c4aa09ed-2668-49c9-4195-08ddeab62963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THdYTEdvMkdDWEU3cVMvc2NKL0Y3NnJCR1ovUDQwenBlQ1pLZTN1NVRvT0Fs?=
 =?utf-8?B?YytibitQcWdWN1d2cm1PT3JNSWZqaytFRnFZR2xBS3FJUnZTcEw2alowbXEx?=
 =?utf-8?B?UHY1MW1TVURpVUpwS2tCdXZVMlhKZmg3a0JOWVIvVUg2ZlEvM3N3ai91ZU8r?=
 =?utf-8?B?NDg3dUNFbFNlOHF4ZGI4S21YdWRwcEFTOUJTRFdjWXBaemdxUmxDYlhidWVh?=
 =?utf-8?B?NUZtNUMrU1BrVTBpak1iNlhoRHV2cjNHSWk1blVTYTA2UVE4WkxZR1pDd3Jy?=
 =?utf-8?B?VmdhdkRUZXUzQnBMbmt1RjROS2oveUtQclFsNXFEZDlHQnVUZGk4bmV4OFhn?=
 =?utf-8?B?Z2I1bk9rNWNCZkswcHpnWW12N1Vmd2F0dmNJbWl3b3lUMFJMSDFFbDNBOHRC?=
 =?utf-8?B?ak02U3BsUXJDMWxGS1JybmIwTXVtb1ltZVZLbVJvRFpIeEQ4bmlRN1Z6SElF?=
 =?utf-8?B?UFNGWnhOSGlVaUE3VWt1VGdtd0o2QWVxZ0hrbHZTKzE2N3liVklqWlRPQkgr?=
 =?utf-8?B?Y2hXSVFzZ3N5Umo3NzFORGNiRzRYenhpWmQwV1lDd09RaE1sVWMwWTl2V1VI?=
 =?utf-8?B?U3A2U0VrcThab3JUUmErUkZSV0ZaQkZtT09HS1dsSjlqTDJ0WTU5YzZ6Qm5r?=
 =?utf-8?B?UEdMYzVaTEt0KzdSbHZLOGhNV2FiclVWcE8vbndWcHljREd2ZXprelMvZnp2?=
 =?utf-8?B?NVlmdzZNbEJyVkFIOTRLUnFJRjdNTks2a29GamhpZlFPNTBJc2FYcG92Y2hX?=
 =?utf-8?B?TXR0anlVd202aVJjVGkxa1U1c1Ftc21BVlJqamRVTUVhTmw5UThnZUZpa3Yz?=
 =?utf-8?B?aU13VHNhVkdQaXU3Kzg4Znk0c0RsQ0JyRTA3ZGREYng4ZTNjTXRQVnZEWjdV?=
 =?utf-8?B?WnR3ZGdwT2ZOdWs0R2N2Q0Vld3dJQWI4eSs5aldZNUd2NERUaWpNU0xaTmZq?=
 =?utf-8?B?MVlVaFJvM05JU2prOUhocWJrSlg1bnJ2bzN1STR6NzBYTktrejAyMlN1RGlI?=
 =?utf-8?B?RDdGWS9DQzJnZi9LWXNvRzViZTZDMHhXa1poM05FQ0FnYUcxR2c4MnZpc05y?=
 =?utf-8?B?T0h6bDIwcWQrMFU2djJQYUVuUXdOck9MckRRWWl5cTQvRHdrbk1NREhDU21Z?=
 =?utf-8?B?UjNLbTJVMmM1cjRYb2VIS1oxV2d6M0c0MmRLOGxVdEFCSXMvRFU5Wkprdy9B?=
 =?utf-8?B?RjdzZmVFMWJsRGUrQkRjMXRpYXRsUWQ1b1FibVhTWUVKdEh0V0Frb2lCYU5q?=
 =?utf-8?B?OXA1U3ltaHFkdnZmM3psSXpXSlFvQ1FRY3FYVWlDTnM0U3FJNTYraDVLdVhL?=
 =?utf-8?B?NnRURXNIU1RmbkdvK2htaTFxM0RySEVoN0FLbTRIYjcvVXdMdmE4REprS0J4?=
 =?utf-8?B?RVNlWk1nSUFhRWdZQkRqaWlXZnIyYThNTGZiYkhjWXJ2S0dRalAxOHRmTnVo?=
 =?utf-8?B?UnFlVzNuMnFET0x5WllQZGZVdDY0ZFRaMzVLb3lTeDZhU0I5a0hJZU9heDh5?=
 =?utf-8?B?NWJXU2pMcjZ2Y2xtYTFlMmlvVTREdkpRVWZtblNkd3RBWThKS0JjM2hYK3Rl?=
 =?utf-8?B?bTJDUGxNZlo2MXhaTzVVajRDUDNWVlBqM2JYbExQblRHYno0ajQzY3FsdWZU?=
 =?utf-8?B?QXQ2aGNCMFJuaDMxUFkwaEkzQi9talN6aXBXOGVvajZ5WHh2MGFNci9HQStZ?=
 =?utf-8?B?UjdwUldVVDR0K2dUazB6UGZGKy9hSzdMZFVrV1A0cDhJNkVZaCtWT1krR2JJ?=
 =?utf-8?B?bFVxYVNKazViRTNOYkZVUGlrUWt6K1ArNEx1VHVIZDg1cjg3MksyWE1OakdP?=
 =?utf-8?B?RXc4dFVjZURiQnZCNTNVVzhpbDhraHd4enF4dWJVVFhRNEpPS1V4Slp4ZW5o?=
 =?utf-8?B?dnVycEFzRUUyL01ON2FTMngrOW81TmhkVldSa0g5YnBiMVc2bDMyU0EydlV3?=
 =?utf-8?Q?bYwymw2+tF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGgrQU9HeGtDWlhySW45U2U5K0NhNGVOSHQ4R3Y4MG5OMjJvcW10OHdtMmhV?=
 =?utf-8?B?M3V5RTZUV3VTT2J6eTFFNVlEa0VmSnVIbXQ2NTNHcVVLQUp1aURhbE4rTUhL?=
 =?utf-8?B?b3dEL1R1c3NBL3VjZlV5d045c1cwRFNlVUV0OXVCcnNRaUNReENoZS9OOUZj?=
 =?utf-8?B?KzZxWlh2WU54Wk5NTkpHcGY0ZjNMVUpDU2RJVUkrY21NYzRiZi9RNUQyUmNW?=
 =?utf-8?B?RGxOSlpHV1d5elU5eSttN2Zsb2RsMmd6NmhxQ05tdlFwZFN0Z3RhOUdyckYw?=
 =?utf-8?B?aXlUSjZSLzB5QnpOV0xRazdXbzkyMnVzL3FWalkzREVHVExKVHJpL1FqRm1W?=
 =?utf-8?B?T1V2ZGd1cTVqSkxNWFMxODZuNkJXM09WejdZY2dobUlVOGNuUStuVFFlK0pq?=
 =?utf-8?B?aG5iV2VFbzQ2MFFiNXFSVjVnbWxlZUl4VjJxZjd4QUhYNWdQS1N0d05vWmhG?=
 =?utf-8?B?N0crRS9vOFlZZlV1Z3J1aVhhNUlmQXA4Z3FTWTNadEl4K1NwOHBLcDlmM1ky?=
 =?utf-8?B?TzlJREFiTkIxZWRJbGpuWGlXN2VFT1FqeUxZanVvd0FXUmFmZkpiMHowNlBl?=
 =?utf-8?B?NytCZlBVMlhvV1BtaGlmaTlxMmpXY0F0T3pVMkZXWk1obVo1dlZROEQ2VW5D?=
 =?utf-8?B?bEJzZnNDTWI1YlN5SnYwcHA1ald2bGFiK3FRU3RLVldCVE9BM1l0RUIxQzlS?=
 =?utf-8?B?V0Y4MUJBTUpROFV0OW9UVnhCZ2h2QmdNMkZSUHFlelR2bzJ6VVJsMjJEMDcr?=
 =?utf-8?B?dnFNWlZhVGpPNG8xemowWjMwdDc4Tk91RlF3SytXeTk0SGFUeVJHSk1CbG1R?=
 =?utf-8?B?RXpPaEVweGppcXU1TjZtSTUxOVNMTTZCZmZSZFVsNUtXTm9EZTI2NlNFWUd4?=
 =?utf-8?B?OXNST0d1WHA1LzZ4cEt1TXRBV2JoekNQZmNVQVhGdDNLQUdVZlAydit2bUdu?=
 =?utf-8?B?blpPbm9NRHJVYXVuN0lWM3hCUlowcGpyNnE2cUM1M3dWdkk0MzN3eDg5M0sx?=
 =?utf-8?B?cmdPL01VbWdmYzhsRmprN0NSeERsbnlMY3NFZXVhSENRWmtWd0k4TlZBejBz?=
 =?utf-8?B?dzFjRjFQMnJpWjBWeU5WYjFyUFMvQ1V3WjY2Q0ZaMG5sRHhJa1pFYUtQZGZU?=
 =?utf-8?B?TDNFZkNkc25wZWFPaWNmZ0c1anFWZm1QeHkxRjJQUVo5MzU5bjcvUW1XMzRF?=
 =?utf-8?B?eTNDS3l1aWlERFhDanNwMmZtV0puSXlrNFNsZXAyMUM4Nk93bUJsTVA5M0NS?=
 =?utf-8?B?MisxSEpIRkVJRDczU1h0VUlqSDZQeE5FaDRMeDExb0RKRk1OUTdMVDFyRCtY?=
 =?utf-8?B?am4wblhlR3lMUmkrbEJGbEk3QkFUdnZsUHZ4VjR5NU5KNHVPOSs4dVVaM05s?=
 =?utf-8?B?dFR3azdNbi9od0MzNUdqaFhicklYZzQyU3RTalBPWE9kb1RNYUR3VDhYTzhG?=
 =?utf-8?B?NElnQVNnNzl0UVdXWmR3VDVOVjBJWFkzQjJaeXhMTTRnVUJRaHlVcXZQTTRr?=
 =?utf-8?B?UHAxYW5jNm5TSWwzcnE0UWlZdTI5OGdkeERTaGU0TDhGWnVub2h5OHNzekFo?=
 =?utf-8?B?TXY4UDdPTU9oV2lXWVVpenJLZ0dmL2Q5a3VhV2xzOSszcDI3MFVVM2M4bTFi?=
 =?utf-8?B?cDIyUGdEOHYwbHZoa1pvSVZBWDhndkcrZnkzTzNNVlptZ3p1dml3a01Tdkk2?=
 =?utf-8?B?cGFtTUJkVFZsd0RjUVdpQ0NEVE5YengvZnBFcXNDUHRjWHZSYWdSQXNaZWto?=
 =?utf-8?B?OHdadXR2Kzl1aWE4cllCNnRDbkpyOUtKNkVSWlRNZ2grcGhxZEtITHFkZWNq?=
 =?utf-8?B?SDlHU005YTFrZGJnWURhb1hMbUFBb2ZERmx5WTN3YnZwSWErVEs1a2RSTEVM?=
 =?utf-8?B?bVFMaVJsSVZRWXEvVHdPbDY2MGhHUzRHTnBLR3crb2UvSC9rWFlGZ0s0T2Vn?=
 =?utf-8?B?d3BmRzJWcm1xdTdQS2hEeklFSXZITVFWQVdBNnlKWGk1QlVycHY1RUt3NEph?=
 =?utf-8?B?TGhUTGF3ZW5oSVZ6Z2pHYkQxRjdBdHEwMkN1d2RXUjh0dGxPcm9rekdFUFBv?=
 =?utf-8?B?VVJtdFpVQTRZOGZYZktwZmR4TXVZRVhlNTBGdDU4Qy8relFTcnI4RzdTWUs5?=
 =?utf-8?Q?sOi74DyPwK56U5hN3cOqO5FXb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aa09ed-2668-49c9-4195-08ddeab62963
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:50:25.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zA17uuyG9J33q/lzYGYQ76wL8sunoldpftuG9hpvdrmgLqd3PpUzk7eO8ve42BsQGvH1+iDB3cYXkIK3vDbyew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
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

Hi Ramanaidu,

IMHO, we need to get this fixed in KMD or if we see this is not a valid 
use case then just go ahead with this patch without the FIXME. In the 
current form, this would just hide the issue if genuine.

Regards,
Karthik.B.S
On 8/25/2025 1:18 AM, Naladala Ramanaidu wrote:
> Add a conditional skip to handle cases where xres/yres do not
> match xres_virtual/yres_virtual. This is a temporary
> workaround for a GitLab issue #2488 that causes incorrect
> virtual resolution reporting.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/fbdev.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index fca688407..6edcd534e 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -170,6 +170,16 @@ static void mode_tests(int fd)
>   		struct fb_var_screeninfo pan_var;
>   		int expected_ret;
>   
> +		/*
> +		 * FIXME: This test skips when xres/yres do not match xres_virtual/yres_virtual
> +		 * due to a GitLab issue #2488 that causes incorrect virtual resolution reporting.
> +		 * Once the Gitlab issue is resolved this skip condition should be removed to
> +		 * restore full resolution validation.
> +		 */
> +		igt_skip_on_f((var_info.xres != var_info.xres_virtual) ||
> +			      (var_info.yres != var_info.yres_virtual),
> +			      "Resolutions not matching\n");
> +
>   		memset(&pan_var, 0, sizeof(pan_var));
>   
>   		/*
