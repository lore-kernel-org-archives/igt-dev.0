Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82DDE98E0F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E0410E2C3;
	Mon, 23 Feb 2026 09:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGqe6p8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDB810E2C0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771839228; x=1803375228;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7utLY3t6bvrU4/InmxMtQxttUKZvhkHA6ONEGJAjibo=;
 b=oGqe6p8iTNjaszgiPfOCvlqlAT2ZYE0WjA/CmhSQrGuh+UQedQ5l/gza
 xYnyBqMVLUx102o1PKRtWamstuiQhFBnW1P20Bw7l0BDi+7LWGHyOF4eN
 aiT4Q1jHT2EpZ5JtV7Q7Mx8hYnM8eKwJECjVgwFil8tjenURpqVVyUAJY
 xngBhoMZInkn66YpxuoLTS1riiSDWP7aRBUHqKPrFZWICE8sYNOIj6BMW
 QFe0FRGnL9RyP8/H6KdMnqzFKlyx4YmbT8slrW1DjeLU9ZdgymFolHXMH
 LO+eipuYowoLtvdwSsOmYu3afWmnSnuomWpyVUkwzoMETh7FCwBdvtUiP A==;
X-CSE-ConnectionGUID: 39lnhd83SEyLEDLVSZdl/A==
X-CSE-MsgGUID: a6BQb/WyQXus4nRTBgg6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83146002"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83146002"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:33:47 -0800
X-CSE-ConnectionGUID: BOhFsCz6SxGEZbU0TBdpdQ==
X-CSE-MsgGUID: LO9zpU62QRGQlvSqKWD3hQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:33:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:33:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 01:33:46 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:33:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iirStqDdQz+1p6gTNMguECtfGMyg/ymZHAIL9stII+//b4Xhvqdu7jh11+Y8seQ2exYwBcz1pxu5/VjInaq8DLfrFzHAqvBjQaggB95RX7Vese7QrcgBKhuDpe+qpAHOteOU76xJE0kF1KcWUxONifC4LzDxbUzd02hDlPykJ/UXXW0Obfg3Izenr8Yn0zr58HWV44SKBB2Eh9rU7uHqyqcayRTcIC/TAZFdFT16wKYvzguVUfy6VksGZ336OuirUp7GoYnTOErpJB+RXq486vHWgS2x53n2ZbFVdM13E/O3oxRKKBO/g2ecNG4QJDXZWlujWCXHbLCtXgNb1HXvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXom3ApSUi1oGik9IuVdde8M8o28VnDCtDEJitLrbGc=;
 b=YW9kac+5ovDv0qMwjdg+rXfMuel5zuAYgnb5qH17NzAx7E6T2lQviwhWbjx2IeQyrZrcryOOYknUWlsvd+V6mAY9WzS2dn9dizpK6sZ+5azbhqKUkGQ7OMw3CRx7NBsSpMWyE7c/cdk9Al7fb3ZvmS3R6q91BRQzUP2GMCscNlU8iN9ky6GUcypqVEB3lC+uDq5ki1DOT0Bl3yTM2ihFlpu7/0d8gn2pZSpiw4TL4/97HlD/pQY6PTqP6zLDM8dhEOSame2lwnIe1nh9vnYA6a3Ep9U73HzuCHNUHyphB6gbDRECQ4IqNm2BuCaYrDHFCjJgmy+3/c0WKNEr/bivFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 09:33:44 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:33:44 +0000
Message-ID: <38050f47-1bce-4f7b-ba4b-1b95a84d2630@intel.com>
Date: Mon, 23 Feb 2026 15:03:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add UAPI support for
 purgeable buffer objects
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-2-arvind.yadav@intel.com>
 <BL1PR11MB55252D5B6142F8A728A48CA98477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <BL1PR11MB55252D5B6142F8A728A48CA98477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SN7PR11MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd75cc5-f535-4d0c-304e-08de72bea334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTNMcTcyN1dtYmFEejZ5Y1BuUVU1T0diL2I0VE02bkJLVjZnYldyNTlHQ2Jh?=
 =?utf-8?B?NXlEb0E5VXpsQ2dmK3ZsSFhGcW5qbTIrMXBxSVRWTEF1Q1h4Kzcwdm0rWm5v?=
 =?utf-8?B?cXN1UlJ1a3haRm9TTHdETkV2T3JzaHVBT0xodTVLVW5HT0ovdDhITWRGS0po?=
 =?utf-8?B?M0tKZnBKRFFJSVd0TlBFd3VoN01WTXVaMlpOclhxcHFpSGNTcHV1SHRZQjdw?=
 =?utf-8?B?TCtnSGdRVlFWVFBwNnJtUTkva0lMTWlYNkFoMVU5cWlRQUJvRmQrMHN0VFRM?=
 =?utf-8?B?bUZ1V2s1LytmWGo3d3ZkcndHUDgrekJ4b1RyUWphUUhKc3RwSWZlKzhWaGI2?=
 =?utf-8?B?L082YVZuOTR4TVJTREg4czdUWnJUemFHQ3A1Y3g3MmxuMzNTRC9lZHVUbjQ5?=
 =?utf-8?B?VTZjRkJEaXQzUHlwSlpyeTg1NHJKRGpySk9IblBqaTJMalFLSmpvQThnak1o?=
 =?utf-8?B?Mk5VYkFmTFEvRyszc3hFK2RxS1BJelk1NHF6UVd0N29XTXo0M0JLWUJTUXhV?=
 =?utf-8?B?ZE5zd3BCMzNvbWRJYkhjZ3g5ajBubk1MR25XQVNjRFVKcEgxSjFjbStqbU5n?=
 =?utf-8?B?ZVhoUC9oeks4OE1WVUJxYk1oU1dpSGNSZnVJdVY2V2NpWlJsLzRsMXhhUGhQ?=
 =?utf-8?B?Qmd1c2w4MWZsQ0RsMVlzVzdpcVF2ZTl5VTRtWlZ3RWc3Qm1hZCswcWZyc1ov?=
 =?utf-8?B?eEtkL3VHQisrVGxIMVk5dFkyMmhyNXZwcmdaaitUMVJEU3hULzlwditLVlc4?=
 =?utf-8?B?b2crUGFkRFI2VEZHczh1TFlSWVFrUnVlYXFTVDVab01taEQyNlF1R2wxOE5w?=
 =?utf-8?B?ZTBSc1ZBeHlsVXpFUStxK1g2WGVoZ0pLVzlHODlyOGxxdUw0VkZQb3haQWxa?=
 =?utf-8?B?U24zcTVXZHh3MVV0aC93dlFWQ1phU05KaVVGTFM3Y0hLRXROQ3VwL1RzejI5?=
 =?utf-8?B?K2tBZmZMRU1kaU41eXVmelVMa01YRytPZ1ZOaWxmN1RNbks5UTYrQzFpbjNM?=
 =?utf-8?B?MnpHTGx0UERndUx6NlBIcnB4eWFEQmp3YW5ZTUp5NVNGL1lQZDhGTGpCZVZ5?=
 =?utf-8?B?Y05EYnpWMkcraXhCcVlUTkYxUTlNMTJTaEpKWi83SnA0VGVHWEpvTkh2RTlU?=
 =?utf-8?B?SlNaQWE5d0RDWXlraysxMlVLVW9nN3J2b3JJeEIydGo0MWE2ejFqNm9xZVds?=
 =?utf-8?B?Mkp3T0FjaWlQb0ZMWmJTakt2STJQV1FYeTJKWEZ2d2pJS3RQU3pmd2F5WWFC?=
 =?utf-8?B?UUduTmlPK3ZkY2JTNHZSWTMxUXRHOUt1MW8vdU5JYktLenVNb0hDT2p1SmM0?=
 =?utf-8?B?TXhFbHlKNmlXTTlwTDBIbkgyN3FsdkRyWExtQldpN1JWQ2dnRkVYL0JZa3pj?=
 =?utf-8?B?VE5oL3E1NXpWUnlsRHNJS0w2dmJsNVBlMjNIU0VuVjBwdFVjMzJTNnJZdVNa?=
 =?utf-8?B?SGFRZlNkaVAwYnUyNHdobm1TYXdoTDZpK1hsb1hyU2VlL3ZTM001UnRCOHFH?=
 =?utf-8?B?K0d2TzNTdkVCZlZobDY1azFLajdqMUZlUElaRnJ5eWhMNkdLTnN5aHZYbTdu?=
 =?utf-8?B?ZitnMVJSTFlpZllYNC9HQ0hjSHp3SDFJekVtajFUN0syOUFzbThaV0Y0SVN6?=
 =?utf-8?B?RWIxRWpUWFdySXR5YXBUb0ZuMHhERzdkRWZWU1YvRElzVFpBdkVkcDN3RnNs?=
 =?utf-8?B?WURpUlIvTDZpMnA4OGRKL2NZNDloZFpUSFhNTWd0WU9taFpvUDg4NWdNaUZX?=
 =?utf-8?B?djJ6ekpUQ2xraGQ2UExMR1Bjd2g2SlBITThVKzlFTXV4ZjNSeFYxeVhISlFT?=
 =?utf-8?B?NzM2SjZodnhESS9vNTF1eGoxRU1UVVlhL0gxbmRnczRpM0VacE45TlM1SGlx?=
 =?utf-8?B?ZExMZXdiRm5lSHVjK0FVVWtNQmhzUlZ2SE5mbTZXdU9YWkpHRnN2eEt0UnVV?=
 =?utf-8?B?SEpDU0ZnTTNybDROUXloYlYzNGpzVjdJUG5pcjNNeVk1dzc2QVcvZk5qMm54?=
 =?utf-8?B?Vnd4U3crWTB6N3ExTndxaUJFbTdRTExkUEVnNm12UXVuV21jdFpkcW1kMGNF?=
 =?utf-8?B?elJabUtDSXpHck9kdGxCeTYwSnlqdUV2Um83T1Z5Y1RvSm11SGdSQ1o3RDNO?=
 =?utf-8?Q?PLJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxJUXVCaEUxc1Bxb0JudjNiaDNxa1h3dmp5TUlPVjM2VzNxMGgxUmttTE0v?=
 =?utf-8?B?VlFIR0hXNGlEUGdPVkFoVUtYc3hReTRYUG1wZjkrbmhXMUFWdG9mUGtuZjZH?=
 =?utf-8?B?T1VOYTNNRFM4UTBoeUs4MmFXZlE4QWlVRXIwd0Q3dXNDSlAvRVJTbWFVYzh0?=
 =?utf-8?B?OWNWOGIrZkZIS2RhZWIzSStFSWdQajNEakFCNUdtK292NE9IQ25RSERCMmVL?=
 =?utf-8?B?YTdYeGR0MWkwRGFiQ2RMNVh0Q1F6OGZKK2FHWjZpUnpvZnF1NXgydzVHZFE3?=
 =?utf-8?B?UkcrVVVneGw0QmNkUDNjbXdtNXI0T2VXL013dUdrQXVxdnk2TFhabGdNNllR?=
 =?utf-8?B?YmJyeVRRcFVvOFlsSGF0UXF0K2IzMWR4TW9iOGxjSkdNOUZrRlMwN0tXZ3Rv?=
 =?utf-8?B?VTJ3VWtXS3RiUDJseHBoeXJtOEt5aXNpaitvaUlROU1XYldpRmw5dmFBK3RB?=
 =?utf-8?B?V3hwcHFRdVFtTWhTY1hlRlpBU0phNy96K0prVTA2Z1ZIa1k4K3U5RjVmaC9C?=
 =?utf-8?B?N25ubkhyTjFsbTVGZkgxK0pwb3Z2S3dtbkZrdWlZcHNuMGFFdWZObEU1dVVn?=
 =?utf-8?B?YkxwSXNqZlpKRllrU1UxSzdqaTBYL05lNWIrWVRRV3laYnJGc2tRbElOMkhF?=
 =?utf-8?B?STk0RmVacHM4Y1Roa3Y2K2NCSFhVZ2xHb2ZpR1NwSGtxOW1uMTk0dlJjTVZD?=
 =?utf-8?B?alVBaGdyY3g1bmNYQk02KzltUHltVkE4MXo4RU92dU8zRzZDcnJnRVNxZmNj?=
 =?utf-8?B?cjlzRDQwNlBjZzlweTJqelFLeWdrVnJLVG5WSUYyd2s5L3NNUUNhSnFuYUo2?=
 =?utf-8?B?dWE3LzVhaWZIM2ptMlpyYVcySDQ3UW1oYm94MWVSZ0o4UGN6dHV2S3ZSTUQ3?=
 =?utf-8?B?Q3AzTGJRL1ZsNE55TDRwSGNjWFZVbkpPaThvRk1hVWZONE1sbndLNlY3L3cr?=
 =?utf-8?B?QThXbzlnclBPeExRRTBXTVZ4SUNicjIwaXZqbEVRanRRZFJ6U24yMWx5b1JP?=
 =?utf-8?B?ci8wZU81cDEva2hlcnRsa2l5VXVOYkxXZkZXdEZLcDFDWWt4cXJrVHQrSDhE?=
 =?utf-8?B?Ti8vZFBQemIxOFF6S1NtVkI0cmN1WFlPYmJ1R1lHdmYwRmdoWUZ6WTVweEdG?=
 =?utf-8?B?NTFPUHRTcWdOalFqdzh6Uml3cXdiVExyOTZoWUlaY3prTjJMdmdlNTdKVGpQ?=
 =?utf-8?B?TzBTakZsTmFXQkdDL3VZeDQxLzBCZkJuZUpwYUtqN2Zqc1hVeDlFK1ZyNEJi?=
 =?utf-8?B?M1F3dzhKWVdJVVJ1ZndwSkpFN3psVStObFJnc29GMFNqUmFpZ1ZaUHliak5M?=
 =?utf-8?B?NVkzemI5Q3dranFkbTAvMjFOU010dUZqWWkvMEJjN1R2MjV3N0Zab1NBNDdJ?=
 =?utf-8?B?SHQrNFlkSG1DNExxRDQxN3BCZFNGWHlSU2xyYjFHcXh2c3liVThaVVltcnhr?=
 =?utf-8?B?NVFpbU1PdktyN2Y4R1pMK09zVXZoR01QejNHeE42U2lxR3BiOVozUjB5YXNL?=
 =?utf-8?B?d3ZMamRJMk1ZZ1V2ZXJ1eFN3a3ZhS1lBcUJFR2hGS3FmM3Z3eWJGcUI2akky?=
 =?utf-8?B?cjJmN3hJRzNKVjJZVjlqbXg1ek9MK0VxTkZiWnZIRHFEWUFBMWRFeE43N0dH?=
 =?utf-8?B?TnU1eW9JajEwb1dlaUJIV3gwOHFOSlZkREU1ZnJjNXFOOGNxZXVZMFUrQ1c0?=
 =?utf-8?B?ejgweWYwVmpGNFp4TnNKMTVmOVAxaXE1aWN4MG9taXk2Y3R1RkR0V2hmZElx?=
 =?utf-8?B?MDRXWXFRaDlOZXJBS212WThRZ3FIZDhaeVFpS0NGZ01OTXhjV2JQOUJkOGdS?=
 =?utf-8?B?d1NLRjRtTGFWTWRlN0xIZmFLaGdkNDJjQ2w1dERoblNnYUU5blV2MmRJaFda?=
 =?utf-8?B?ZjE3MU9FRnNlSVM5YlVBeUNTVDFmR0dyUDZYRDBkZjBnRVNOZWcvK3BWNlVy?=
 =?utf-8?B?SUJtaTVOZ1YwMGR1TjVBV1hNSm5IWXJEZ1VoMzJDRUszbHM1bjR4WG83Sys4?=
 =?utf-8?B?UUUvcFNmLzVXdDMydFZ2S0Z3TTkyRk1RU2U1cHBSSFlCQm9xRHJYWGtSdmhY?=
 =?utf-8?B?aWlRNSs2b09Mc3djak1XL2QrQ2wyY2hzUkRXc2x4aXlkOTVMb3ByRnFWc09L?=
 =?utf-8?B?RkhBbUZvU3drQ2ZJYkhmbmN3K01ZTzc0OExQUnlYZFoveXpwWkRScTk2bUtC?=
 =?utf-8?B?aXpxS01NTjd2RDB1VlZpL2xkY2tYcFNHZ1VNZE1LSWpZNjZxNjNRaEl2MjA4?=
 =?utf-8?B?U2Nwc1poTFZIbUIzaU5LS09sOEFNWnhlOUJQZndmdWUwL2ZkbFB5Vk55TmxO?=
 =?utf-8?B?TndocDFmb2FJdFYvNjd6aW1nUHdmd21EV01wc0Joc3psS1F3Z1V3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd75cc5-f535-4d0c-304e-08de72bea334
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:33:44.4446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ew0O7DLogdRwfGabf07jb2eYUbsBRPq8jrsN/MLzFIuvOqjIx73cNf8K1Mxl2QwuqT70O4yzP1zX0U/7hRQYNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
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


On 23-02-2026 09:59, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 1/8] drm-uapi/xe_drm: Add UAPI support for
>> purgeable buffer objects
>>
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
>> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute
>> type.
>>
>> This allows userspace applications to provide memory usage hints to the
>> kernel for better memory management under pressure:
>>
>> This allows userspace applications to provide memory usage hints to the
>> kernel for better memory management under pressure:
>>
>> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>>    previously purged, retained field returns 0 indicating backing store
>>    was lost (once purged, always purged semantics matching i915).
>>
>> - DONTNEED: Buffer is not currently needed and may be purged by the
>>    kernel under memory pressure to free resources. Only applies to
>>    non-shared BOs.
>>
>> The implementation includes a 'retained' output field (matching i915's
>> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
>> store still exists (1) or has been purged (0).
>>
>> v2:
>>    - Update UAPI documentation to clarify retained must be initialized
>>      to 0(Thomas)
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   include/drm-uapi/xe_drm.h | 44
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
>> 077e66a68..3dd1ba875 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -2099,6 +2099,7 @@ struct drm_xe_madvise {
>>   #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>>   #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>>   #define DRM_XE_MEM_RANGE_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>>   	/** @type: type of attribute */
>>   	__u32 type;
>>
>> @@ -2189,6 +2190,49 @@ struct drm_xe_madvise {
>>   			/** @pat_index.reserved: Reserved */
>>   			__u64 reserved;
>>   		} pat_index;
>> +
>> +		/**
>> +		 * @purge_state_val: Purgeable state configuration
>> +		 *
>> +		 * Used when @type ==
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE.
>> +		 *
>> +		 * Configures the purgeable state of buffer objects in the
>> specified
>> +		 * virtual address range. This allows applications to hint to the
>> kernel
>> +		 * about bo's usage patterns for better memory management.
>> +		 *
>> +		 * Supported values for @purge_state_val.val:
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks
>> BO as needed.
>> +		 *    If BO was purged, returns retained=0 (backing store lost).
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints
>> that BO is not
>> +		 *    currently needed. Kernel may purge it under memory
>> pressure.
>> +		 *    Only applies to non-shared BOs. Returns retained=1 if not
>> purged.
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +			/** @purge_state_val.val: value for
>> DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +			/* @purge_state_val.pad */
>> +			__u32 pad;
>> +			/**
>> +			 * @purge_state_val.retained: Pointer to output field
>> for backing
>> +			 * store status.
>> +			 *
>> +			 * Userspace must initialize this u32 field to 0 before
>> the
>> +			 * ioctl. Kernel writes to it after the operation:
>> +			 * - 1 if backing store exists (not purged)
>> +			 * - 0 if backing store was purged
>> +			 *
>> +			 * If userspace fails to initialize to 0, ioctl returns -
>> EINVAL.
>> +			 * This ensures a safe default (0 = assume purged) if
>> kernel
>> +			 * cannot write the result.
>> +			 *
>> +			 * Similar to i915's drm_i915_gem_madvise.retained
>> field.
>> +			 */
>> +			__u64 retained;
>> +		} purge_state_val;
>>   	};
> As kamil suggested please make sure that it’s a copy of kernel
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>


Noted,
Thanks,
Arvind

>>   	/** @reserved: Reserved */
>> --
>> 2.43.0
