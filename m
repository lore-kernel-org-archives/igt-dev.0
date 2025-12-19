Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B13DE668A5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 23:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24A310E008;
	Fri, 19 Dec 2025 23:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEG9yNZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AF610E008
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766186330; x=1797722330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=thHlGDx3zr/ZnpjocfDZnQgGFAsnjhzdk6vNZali1IA=;
 b=MEG9yNZfS07CBasulZYrQ6UKnjNyLRQrTCcZS4+Ro+NdkuHiV7AzQ4uC
 UqF0dMRHklJyaYaQ0DGXdIqUqLtOjlXl7FQEqp/rubQpqftgQNr9mi/rE
 oKq5mQ+yf0yZmIKYJq1aTIOzJuQqgjPQKdpddDAapCNvqDoXB6HvOg7V/
 DNlBMcIfAfEsPCAcJ4Fr8SzG8UvPRTI+FsJa8ViAoHUAvlkYo7wlqfZxP
 o1Lok5I9/8CCzb08uhV6oMuK/0FfaxQeBHYHKQbM1qjyYJCfkZxafT/+/
 tclt55kO671NaeatOZhzm5QQQVMdHqYT68kwD+pw/LNosDl4YgRSLdnGm w==;
X-CSE-ConnectionGUID: N/SEzZ50QFCRH9n/WRW2SA==
X-CSE-MsgGUID: /eyZsOSWTIqHJYcUeJIv8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="55722782"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="55722782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:18:49 -0800
X-CSE-ConnectionGUID: gulIzM3pQj2AfihVQHLwzw==
X-CSE-MsgGUID: uDVTV7AZSAaZqaqKifGmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="203404807"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 15:18:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 15:18:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 15:18:49 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 15:18:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbrg4Ov6EPXK/Bz5SqHT03vvsZzkVJIfQQlx4+SO1MiglDqjmIdpx/dmKFEPaYtMlqbbNah/kOEGqdoZxZgOrIewdr3q8U72kRQEeRjwUJ+pkt88MkSOnLYJuyXzVW0PIlYvWvYSxIsfDgYtCKSfYDx3uC6jkiVeJZ2dK1Wn9qDctiRn1dfGEBvDifZY8SqKOQztOrRRqLtq51ZaC6kQmhO5eimKX7bkDgpDH+XU6ccMhOvD20EPVrh8XNjoK4qekbGAi0xd4Hwf8i8ztIGh0aVOE2jgwBUSBDL7zqz/gNidFJte0Zz8PYR43OnxdKv8n/uVV+SL+5tVVpV6Go+w1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jM+L9cNQVTHEhuOA5ILEbqo4Vy3YOZlBdkGbkcW45Pc=;
 b=KcAt1oOhN5gVoREv4IoHxNoidnQZYHCg/hDCkA4n4EwjpZG84MJNS7XN5cZ/BQkLMC816y7rWC01gNFsqB3xeBt6wHJI5q5bC0hwFcN3FY8W7Pr+HX2NTc3cmty2S0JzJtKtEDcsQ2fSWdUNWseoy5Sg4rOuNnEaWgjCS5Za8eMdBoBZlG8EKcruVp8aJFaUtjKVpUolDl3dT8HaXmrS1RO89NeXK9FKlyH4pqAD7POQjJoY6pjo69nnGmvURnPITGCIqfJdZhWWOW9sPKna21/SSeE7PAGpO8m/ZA0SHxx+0dN63VGo6MCO7li4QcgocfKrLbiLw2th6bSOEyq2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 23:18:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 23:18:47 +0000
Date: Fri, 19 Dec 2025 15:18:45 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_oa: Also print oa_unit_type
Message-ID: <aUXdVVlaVODfR2XC@soc-5CG1426VCC.clients.intel.com>
References: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
 <20251215222935.2002656-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251215222935.2002656-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 78908014-81e5-40fa-3d55-08de3f54f671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjBjTGZSQ0VxTHBkYXg1VVpKSk9OaEl4bHBzMlJZUnhZQUpzSDkrM3NXODd5?=
 =?utf-8?B?V1h3ZEcvYmh0VDNNYjMxdFZxSGN5QUNhbUtTL0ZwYjJqWEhpb1R1YWxMMkla?=
 =?utf-8?B?Ynllc1hFYmk3MHMrbEtUY2ptYkN6TzRUL05TZnJ4bURSajdhTSs5aWVqU2hs?=
 =?utf-8?B?T0FsbGNnVWg3OGdpbVdiYnV4UDdRd3ZNL21na0oraTVHVEhYQ0FSVlpZVFBa?=
 =?utf-8?B?clEwa09Wb0F3RHdXWFNLRFJ2aWVpbW9yNnBqZTBPcU1jQTZ5QUZzUnBVUXhP?=
 =?utf-8?B?VnhEQmQzMDZWY1VzMFNya25KeS9lR1ZqUUFYSGFpUTdOMUcwS0M4cUpaRHhy?=
 =?utf-8?B?NHhQTTF5WXgrNFBHdWRZZm1mdjVWbTNqK2gxUk9BRTNmNmhSTlBaKy9mSFJR?=
 =?utf-8?B?cWorSUpJMm9wZTJuQk9YUjNmaGdQQ1QrL3lma1NyZ3h1MEJ1ZXYwODQ0bS9X?=
 =?utf-8?B?dzM4WUFaUFlYekVsem1rWHJnbTFlYk9ZRnpPN0N6Y0JsQXN0YWhkOGNGYmwv?=
 =?utf-8?B?Z0g1NnhuS216S3R0cjYzdGJ1M2xmdTV1clQwbkFhME9tR1lhYTF1dHJHbkpO?=
 =?utf-8?B?WEdDN0pjQ2RkK3c4T2Ivakt3SkRQSUF3K01hbEZSQ1d3QUJaODd2VVY1WUdE?=
 =?utf-8?B?ZlJyWlZUK29wb09RUE9qMDFSRXVnZDZ6ZzJyZjMwa0trcS9tdlZzVC9FN2ZY?=
 =?utf-8?B?TGU3eEdPa0lJS0w1RnVlL0ZXQ2QzWlUxY1hYWG0vMG9BMjBtSGp5Z2NXN25J?=
 =?utf-8?B?WjVXUTYzdjlpNC9YVVNMU0c5Y0FNbUJMb3Z5SHpERzZTTHFtQjUveFgzSVNS?=
 =?utf-8?B?UkxTMkJ5ZEhpUHB4Q09vYnFQbGU4ZWVaK2Vkc29oWVF4NEhyTFBqa2QxTXJt?=
 =?utf-8?B?Lzloa3JxTWdmTkRNQklmajlsSWk0cjZwMDFxWUpOV2dXUmRKdG1Gdnk2RHQ5?=
 =?utf-8?B?SHlGUkx2Vkh1eGdxL0w2djQyeXlJQ3A4OHVpdVpTcGFVQW1UWWZKdnFnclND?=
 =?utf-8?B?VnI3a0xGKzdENnZoWENBb05STWFJL3J4SEUrRk1URFRndEVCUFhSL2dZVzJO?=
 =?utf-8?B?TVhpQnZSSmJXQVRxbEFncWt6SGt0V3grdG5seVhScy9HMHJrK1FBRGFreHRD?=
 =?utf-8?B?dFArTUVEaHVJWm5DRWVMVUdLbmtIcDVpT1huNGQ3VFJZOXhGWGtJalh3cGRH?=
 =?utf-8?B?bXVsZ3BqUUdYdkQrZTZPbFpydi9ZWU1Db2t0KzFTQVhkWTVoakhlUWxOVFlL?=
 =?utf-8?B?TXlib2c1a290ZFQ1RzFkYzRKdHZOR1ZUQlFFTm1YYUxOSUpFT0JZTjV4TVI0?=
 =?utf-8?B?TVp2UTIxT09ieTFpZlhSK3ZlSHBZL1ovbjNFMU1vWURXaEJBMUpMUW01M1NP?=
 =?utf-8?B?anR1NXQ5MHhtTlBLMlVVUUZzRW94eldLTms1R0tzZUwrMkovc1RnOTdwV1Vk?=
 =?utf-8?B?ZytWaVpRSGQ4S3IwRVFXZDJuZVdIVG5PekZIZCtVVUxieE84Z2M2VDNObkRS?=
 =?utf-8?B?UzI2dkdpZXJoVm5hWjF1ekJqRko3TEE1UHdCUktjTzhoMzZ1UllpdWZvbmhG?=
 =?utf-8?B?cm9iRldkT1lVbEVWUnh3WkdMNmp1ZVFObGhkaTJ1QXZsL1NlQ1RoaC9iVmYy?=
 =?utf-8?B?THV1cGgzMTVHZkVjcFpDMGhpc0NSK1FDZjNta0VFdWZ1TjVBVjVnMGc4TVFI?=
 =?utf-8?B?Nmk4aGVlR0RER1RyU1RIV2pjdS80NTV2R2JSandoVk9YbVdqMVQwaWlBait3?=
 =?utf-8?B?VUpLVkc3ek5pQ0w2by9RQTFwMWRMNFpycGY2RGVNZDRQVzdMNVRXMFZZYVpx?=
 =?utf-8?B?Q1RDZGtqaENCMUcxbUhHNjN0TlVIUkIxeGplV0N0dThSNkpldkhMK2w3eEUx?=
 =?utf-8?B?YkhBcmJZQTNMNjhEVGVObnZpb3NaR3NvTWMzZFI3REU5OUZnUlJJOHFYdTVa?=
 =?utf-8?Q?cNs2lRDtmauuvx0Bh17/VdtTHX5jddA1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YldQalJHZWZ4OU9wRHJFT0hQZ0xqVjBUZ2lIdzVOM0hTZ2FEOFRIM3NDaVpj?=
 =?utf-8?B?R0RhQXlPa0VCa0hSWlVZS0ZZbUhxT1hLaElZeFp5bXFSTjRpUGZOS1AwVE1J?=
 =?utf-8?B?amp1bTN1QUJ1TzJpK1E3WGZuMDNJWXRZeEFrR1cyMEczQlhBanJMSTZ1cnlO?=
 =?utf-8?B?SFBjc2VIRzcwUk1CVFdodzFrbjZxbks3YXhHL2YrdDBPSElpNU9jR3l3ZjVm?=
 =?utf-8?B?aGFnU0FmcHVudGh0RlN0cU1qZmJuWDZqVEVvUmhNWTMwRVF3aUFsUmR0dHln?=
 =?utf-8?B?OHBUeEhjWDVjNDVXQ25oNHRuMU1tZ2JkZzZQLzUwVFFJRmJEcVVxRjlYUGpm?=
 =?utf-8?B?aGhPeXNzUlNmcHJIR0tRTFFWbEFDWi9JUkxOTjEvcDZpd2ZwYmU1eS80RDJx?=
 =?utf-8?B?dnZFckYxTEE2UHNGdDYvcHB4TUgrMXlKaGNRRDNwMGx5Ny9icXBYYkJwZDYw?=
 =?utf-8?B?akp2SG9lUTZmaXIrNGd0a1hGaFIxQVFjMlN2dStsUWE0VGx3Z3A5cXA5OXVC?=
 =?utf-8?B?TFU1bjIraUNHdXNRSXp0a01PMTVtdkNUY2lZN0JZUitDVkdVVlhJME04NGFo?=
 =?utf-8?B?YXJEejAwVVJhTHA4b2IydElVM0dleXlSYkc0dXp3YzMxMmJubHUwM3pTeko4?=
 =?utf-8?B?NGd5VXJpVmlleURSdS9ZR0l5K3NsbWlqZ0RhaTIrVHQxQ0VFb2lObTR1Y3Fv?=
 =?utf-8?B?OFdDVHdOQ2ZxRFZNUFc2cjNaZFd2UGtRSjViREYzSTlXZmduNFhVVHQzSHQ5?=
 =?utf-8?B?TmFMWW9ZRWNQQzBoc3VEOWhhNlFwc29TQmQra2tOOStNUDQ0VzV5K1FUTUtK?=
 =?utf-8?B?WVV0WmYzajNhWkxERW9CbG55S0wxSTZOczdzeHJwZTZwMzlRdzMvSzFqVkNx?=
 =?utf-8?B?elEvL0JYVzVsVStsOXpER3NDOWo4WDF2WkFEUElKSTBIbVBaazRxcnh6czVm?=
 =?utf-8?B?eXhlaFZ1NVY3UG1kWWZsYU9lWUxtaUEwSVIvMlcvME1XMUdhN2p3bDdiYXp6?=
 =?utf-8?B?L1MzdzB0ZEovTURzQ24wMHM1OW5NVURvcHdnWkRVQ1htTG9iTGk3b2VYNERl?=
 =?utf-8?B?QWNEUTFJUVlSZS9NZit2S0lGOEM5WnNZNE9jNGdTcVFFazRGOHdxcTR2dW9r?=
 =?utf-8?B?NFhQSG00TmFOZEZPRC84QzVqTWJQNDRRRGdoYTRHaDgzRFphYXEvWUovVkhP?=
 =?utf-8?B?cWdMZ0VQKzZJTXhFV3p5SUdGMkpzYld4SGVEUXhKMHJXVzRmSEF0UUg1cmpT?=
 =?utf-8?B?ZEZqS3BuYk0xQmNHK0ZVRmhrYWwrb1FrTEFEdHhVL2lOaitGSzg1VHZTWFl1?=
 =?utf-8?B?V2NvZG0ra1BIK1hmWmxmZ3JVWTIzajQ3Z0lrUVV3eFhPSjJIZ2tzTGkramd5?=
 =?utf-8?B?dlA2SVFJaGtvTXd3YTU4TFpmc0w1T3NpWE5KTDhuSkxQWENLQmQ1OG43bG5x?=
 =?utf-8?B?S2hpZjFDVlhldFNGeWh0dlRhNFJ3ZXFMM3pTZ0hBQ09CeWJIQjJ4TEdvWDI5?=
 =?utf-8?B?QTNSbGx0R0piTGhQL00vYUhjVloxeWpaVVJIbDNmUjhKa0dVZmVvQ2hSWjJ1?=
 =?utf-8?B?WlVsZGxmbEIxOWVWRXJJNWhreWlULzBObE1lb0VmbHRyeWJJMm5aZ1VhalZE?=
 =?utf-8?B?YlBFSWFNLzlRZ2wzWUw3Y0VrcUYranZsSlFSOGNVYk1KZ3Zac1BxMVNmTllJ?=
 =?utf-8?B?MkVHRDRRRWdXU2hiOHlQTHdHS0wzbWRrbnhmZkdPNXI4bkRuWWxQNHpab0x2?=
 =?utf-8?B?ZlFsaXdYU1U0MnJuK1VpeU00akVmbDViZWZEc2U2QjJBZHBGN0MyK05kMmk5?=
 =?utf-8?B?ckVoUEp6VEdSaWtkSVZPaXFuK3k4cVRsd0c4L0NrMXd5UGtSNHNPM0lIem5F?=
 =?utf-8?B?NTJiMzljclhqeXVYY2FnajBLWlhRa3JJRWlGVFVMR3d5eDlBVGw0ZnZ6OVND?=
 =?utf-8?B?SnBYVWxhV3hxK3FudXQrT014em1HQWttWXpsT0JGM2tQNnZ3a3YvM0FLbjhN?=
 =?utf-8?B?N3REZjVJcnM3QlNSZTZiVVBpSGdUYzJxK0pBTEVTK3I4c3JCOHh1Szl4aVJq?=
 =?utf-8?B?TnpzNlNHdHVLb0hGa0MvRlM0aGVjZ1gyY1dPeUhxQXBBZXRuWU8zWmU2MU1p?=
 =?utf-8?B?VW1zaVBGaVh4ekdIdCtMWW1RZUVnRm1tWTNidlNXeWlHWmhaTjJ5OWpST0M0?=
 =?utf-8?B?Y2hBVHlJT3p5MzdqbWJQOURMSE03QjZDVzJaaFM5R1R3N042ekgzeG9XRDVR?=
 =?utf-8?B?Qlk0QUdqOWlnRVdmODlUUHV5TUhOQXZmUE9PcGV2MU9oWlBRUnJJRjQ3N3M5?=
 =?utf-8?B?UU9JeU1sbjF0QUFOM1JOUWZyL1dVL1VwOC83d1N5ZDNZMzVZUHRXQk9tL2Ro?=
 =?utf-8?Q?vADRRDSs9D78N18E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78908014-81e5-40fa-3d55-08de3f54f671
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 23:18:47.8598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOKuG9AcscyvD9zMKyDSXUTajRYUayuvTtFiV1UH4E5E//4dRk/CWCl/Ptf6y8uEE+Ope+s3VAWKvpo3El40+9wyR4/aayW5QgkXJXWiAIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
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

On Mon, Dec 15, 2025 at 02:29:35PM -0800, Ashutosh Dixit wrote:
>For easier debug, print oa_unit_type when we can't find metric set.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 474070e238..927f3f4f20 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -382,7 +382,7 @@ static struct intel_xe_perf_metric_set *oa_unit_metric_set(const struct drm_xe_o
> 		  oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
> 		test_set_name = "MediaSet1";
> 	else
>-		igt_assert(!"reached");
>+		igt_assert_f(!"reached", "Unknown oa_unit_type %d\n", oau->oa_unit_type);
>
> 	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
> 		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
>-- 
>2.48.1
>
