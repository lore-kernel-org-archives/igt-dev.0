Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8F3D232F5
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 08:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCBA10E858;
	Fri,  9 Jan 2026 08:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P++VNhNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106810E858
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 08:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767948465; x=1799484465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HaW68dkoNCJ6yzNJSFGODUaRquLWTeYcMfRm0YcpdHY=;
 b=P++VNhNpIMC7OrZWk1N9KJ9xCT7ckMUOJXZKmLuUyjzc7Vps/yGIlmY4
 FrRZ/Y/Fsf5M1CElIgPaQYxxlI797tued32m9ps96rRWQLvW97HoNULCo
 dkjysUp+/Ea7S16H9uAX4cem3HExrSn02thDK+eETFOsTfONkZx3k5C1j
 QjueGt2FIdSYMv+1GlamYOf9Eql/sRc9USkdjObcoYIDU96VLpw7p9mno
 AlghPRGMj914O5/l5LH3jUUkjGSrm4pjSQSwxuLT7pOEZNymFR0UmInG9
 1RR0O00tFrsJjPKnTKpeRgG/KzbhW/aHWvytmXicrhsmeBn2My40Mli4P Q==;
X-CSE-ConnectionGUID: aXGxKsIVSSG+ZUOlvcrPUw==
X-CSE-MsgGUID: 7qSKylerTyCWoW4j0L9ynw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94800419"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="94800419"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:47:44 -0800
X-CSE-ConnectionGUID: MBYyYjntTfS3i3vZbRACsQ==
X-CSE-MsgGUID: hhKtro8eSc28y7PjKEttTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203849560"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:47:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:47:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 00:47:44 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:47:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVZ06euoaK2oOrmWhxxW/RjJDrlwsLjhSeNpRbJAn/LMVBwMzSvJsJ2wP0bkVy5jHTHcMPWr/XEuy27EdepOfcGy1QuPusslp7KOGRQUgVPD8OdWZKTvLfkumBzUOpvaMEo5aqqnO8zXxo6N+VpsBZLKowUljr6/i72YeNGmRzajt3oMNFXodlLkU3mg6SRWb3X6zH2nq6+rCwEbfjHMCMkSPouaH61AA9ZLWGkFvQ0QKDRiBAZwPHQzAl4VEEOV/X0V7LnZBSgyMbvdY00SIXOhjuD+Ajht+BZtFg3ta6tv8j1YbGjXINc09Sf+E/L73YtUyDd+NizSL1EpRL/1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e+IraEJl1pZhaJRkGXlH68WKUSbkhp62I5kaBuULps=;
 b=EhG3HkRvykIAnPmGoEmOFuNdimoaqUfu1jjgX6c/HelGhZZMhiNbJPlXQVq2s5huB9gwbbhQhwI5egU/U46xTOs6fgH2IJIpMu606CnHI4Q/oJF4oCQO9FM3rTOivIABMTPDQV7cyKJIQUUrvAT0oaX43KNO/zYlrmduQT5VLMLGCmwmdsFVkaUDzVFvhetoi/fRzjj0nfBnhYH5cu3Qf3qSYVqcSCIWJ2rEtT9EbdMbKlEycS76v0/gbZ14gaMMq8UEkAKD9cGGjwax7WTZR9fjiNBzNt/Hcmsa2/N9oaAM+nQYTUf0SEyv5wXmAuM0oAX7lsmDfAWyf1OCa9yo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 08:47:36 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 08:47:36 +0000
Message-ID: <d21a6a7b-6515-46f3-9f99-ef96b1e119be@intel.com>
Date: Fri, 9 Jan 2026 14:17:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 2/7] tests/intel/kms_flip_scaled_crc: add flip
 to reflect-x tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-3-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260107093535.70116-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 35dccf47-75de-494e-f1d4-08de4f5bbc67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmhBREhkLzUwTHVJUDFSOXFSS1NuSVczVnhCUXJqTHk4Tnl4YWhCa2RnN0J3?=
 =?utf-8?B?NlZsMDNBeEthQTlFSGlCWTZlbjdoaWRqLzd5SWVLL1NsWGV3SkZVdzg0ZlU3?=
 =?utf-8?B?UUdEMFJXcnZlNW93K0IzWlk5UWJEeVYrUDhWSDZoNDdJd1FiYk1RdjhBblk1?=
 =?utf-8?B?WFR0U1lHeHJ6MnN4dU5mMVBxZ0JOY0ZmUEg1N3pqKzYrZ3ZvM1FpYlRzM0NR?=
 =?utf-8?B?NVBuUW1UY0ptNlcvL1ZNSmpLcG1aRHlYeUlhbmRXd2JBN1E3TUpUMXh4MUZW?=
 =?utf-8?B?MitEYVhqbi9MZnNHTEF5R1VzV1FXVDM2OVZaeDFWSExoalBvOGRvNFhWcmFQ?=
 =?utf-8?B?Q3cyNkRyaUZIM1FGSlN0bWdVOThFOXllMC8zY0xoVktodTREbkJianczVDNK?=
 =?utf-8?B?TWZKTlp6alFVSVJSTjRvOG5QSDkrbWZVOHpWSjJ5emhZYXBPMzR1dXFablVD?=
 =?utf-8?B?NHY5SzNqSmFSMnFMbnJIZ3UyQUVicHU5dGNGei9jUitmS0txZzRQMVJmOUt5?=
 =?utf-8?B?Qk1zUzJYek1NWnB0SWMzOHpxMWtHUWtTVkUyUzNCbmlMSUxaKzlzdHRQZ01Q?=
 =?utf-8?B?S0xyUTZlZkd2RHczcTIxTStUV1VUcnc5UCtDT1NhSmFSUnlHbFdCY0FTU2Fa?=
 =?utf-8?B?ZEQzSnlrYTdmSGdmOVdxZ1hBbDFnTkUySnF2dDJOT1BWRlRJcmFsaUVwelZa?=
 =?utf-8?B?QXhCZlU2T3JGb0s1eXBZQkhSK1JVREFBNHpvUVRjRDEvaG1oRmM2QkdYTExX?=
 =?utf-8?B?b3pxYW9sR0xQYlNUTTg1cm1sVGNtTENyaGVha1VYVHpsU0syYU1lZ2xMQk9m?=
 =?utf-8?B?VGVjckF5N1I0S3ErS2VJaTl2S29UODMweGtucnNGdkgyS2doWkFsY3NFTXVB?=
 =?utf-8?B?ak9qZGNlT1RkTGhRVFlERTJLUHhIbnVmV1d3VWJuOFQ2RFVnZFFJbDd2U3lD?=
 =?utf-8?B?d0NJWnVDYVQ1eE8vNWNQdHZvS1QwQ0xLcjVxU1lFQjl2N1VrRHVZZWtwMTh4?=
 =?utf-8?B?Q1NXZXNtSzBLWDhQYjRUWUl1ME1zN1QzNUpBUjFyaDdaaWNaRDlQV01sZytV?=
 =?utf-8?B?bmZQQjZOZ2pFNHRlNnhJOHQ0bXFBdHlkT3RaTmZkQ0F5V2NzQlhKTEtRS1la?=
 =?utf-8?B?NVhGbDNYcTNZaEFSM2NaR2FSbGhGUGF3aUZhUGQ1eDNsV2t4UFlDUG9WRlRM?=
 =?utf-8?B?bHZhbnVDSzFGY2QveFVzZVF4SGJGOHNjTHZheUorcXlXbWFDemI1MStZVGtP?=
 =?utf-8?B?UDZFdDB1Y2ZueEowUi9pY3dhcDA0YWJsbGtzUVg0WExpWGRzOXc1cG0ybFI3?=
 =?utf-8?B?VjdsRFVQRjE4dUhqZzZKZ01yR0psT2NjMEtJSThEYVMyblZOc0FLRS9zUXhi?=
 =?utf-8?B?ZkhKV0tUN1pzOHdvZzdzSE5WZzRsV2JBNzlpWGdRWGk5OCtUaEVPYzY2ZU0r?=
 =?utf-8?B?b3VjSkFGZnZYSDFjTjhaRGZJU01CZ2JPQWtqS056eHZDQmxYSjE4bm1MdzR4?=
 =?utf-8?B?Qlc1SzNNL2QvQ2JDR3BNeFdkUDlRS2w3a2ZialdvSk9vdmFJUDJrdU8xbkcy?=
 =?utf-8?B?OWJBemJpdmlsQm1uaEI1ak5QU3crMmxVZndqaXhJT0lNRWxYUVNoUFJQWVFF?=
 =?utf-8?B?eEVMQnRiWjQvTXhCU0VBS0M2eXJGYm1DUWNRNVBIL2xVbXNvdEVKSDRzZ09v?=
 =?utf-8?B?YVFZOGNPT0pNcDYyTisyd1QxNDBvMEprUnMrQTNHck0veGtsTjN3K1gybGtP?=
 =?utf-8?B?VEpDb1RxL3ZxVUhsSjNYNnBiSmYranNmSjFRQWVDdklNTWoramJtVzRITURx?=
 =?utf-8?B?bW56L2pwZW9EU3NSWHJLUnFxT05FclJudVNZNll3RS9vYmZlQUkyaXBpYjlG?=
 =?utf-8?B?NE9xb0FBVldycUVkQnMxdnh3cFhVakxEQlFjNXJjNWd2cDJzRE4ra291MTUv?=
 =?utf-8?Q?h1FasC1bwVx8DEA9oKqL9UnssBn3MFIb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHlGclpPYUlJbGRYUEl4amtmUFZvZHd5cml0bEdZcW02bWVxSThURUx0U2x4?=
 =?utf-8?B?Nysybi8raVpEY0ZYU0M3OXp2cHI4eis0OW9Pb0lHL0FmWmhpaEhDeE15SEFJ?=
 =?utf-8?B?TjZMNGV0dlk0dnE0L1R0eExwTGVPL2tQNUtod1ZkVytVQWVCdDFiUW10ZG8z?=
 =?utf-8?B?QW5rV0Y0Snl1ZzFyY1dFYUN0bU1WWDNJczhrZENsQ25DZitDem1NWmNsOXNP?=
 =?utf-8?B?RDdyNWNENUhsWDNCa2h1MGpocTk4dnNlazlBdmpscjJ1Wjg4aE54MEloZU81?=
 =?utf-8?B?L1dubW9TejhJK0d4Wk1MaEZyUTBpWUZiWHB5SXlTSlVZQm02STB1MnNNRDcz?=
 =?utf-8?B?anhvV3NTTWxlY2dqSDM3Y0FNbHFUazZIVjQ0ZEMwMlZ6aTRqVWxKM1duU3Na?=
 =?utf-8?B?VFQvdjhaN1VmQTJmWlVpYW51VlBZNnBYR0lRZHZKa0ZWT2l0ZlJSdldEOGQ2?=
 =?utf-8?B?QzZpQWpYcklvOXZucWExLzM0aUpKZjFGNjZDNnF6K1daRG0yZFhiT2FPZnZz?=
 =?utf-8?B?VmFuT0lSa3FKcTRxVzZQWDhFcHMrY01ISFFuenFmNXRQdWcvc3lHT0EwSVZO?=
 =?utf-8?B?TG85bXd5NjdvczlQMmovcVczeklOOHovTnNhSjBVbk9aZjEvem0zQlpXMUdH?=
 =?utf-8?B?bmF3S2lJc3VQYlZ2aGVuVGhkZ255WVlDaUJsL1g4aUZySmdaQWlJZVY2S2Jw?=
 =?utf-8?B?ZUpNUk8wVjcxdFBrK3ViVE84Q1IyelpPTGIwYW0yMFg2QVJ2NDF4Snc5TGRG?=
 =?utf-8?B?ZkZSY08rNGpPVWtxcDdTdk5meGVWSGJVUEZ1SERFYVJrbytPNFdsNk5IdUtn?=
 =?utf-8?B?djZHQnN3LzZDbnJQUk5VQ0I3eC82T1pjNjZORE9OVHJidzhWS2JDZXFyenNK?=
 =?utf-8?B?Qk8ybkltUGVFQndQSng4MzBUOXIwWVEyU3NjTUNmSHRQS1cyOGNvWXFBM3lP?=
 =?utf-8?B?cVQwRzhOTXNPRzcxWUJMd2ZjS2VkcS9iN0ZCckc0eGU4SFRxZm4xM2JwWjdq?=
 =?utf-8?B?MTFUelEzYU1Pczk2UDRuU2ZSWlJLZWpIM0hIaUVjR0VzZjdRMUNnMGEremlO?=
 =?utf-8?B?NFB6OEN3b2oxRHJudVJ2WWREUS9LdjVXclVZc0NuWWxPUzE5dHJmMXJOckNO?=
 =?utf-8?B?QzVLaG9rN2NlYkg2M0FGaVhNdjROQ1NoQ3NJQXZvVzVOUTNVUjBSbUpCWmhU?=
 =?utf-8?B?VlNHOFhFUXl5QTJyY21SNHRtcE1BbkJHNERDRXNPZlY2VytKUDJvQTZjQy9o?=
 =?utf-8?B?Q0NCOUl0c3JtbitwTnZWdlpaNmdmbzRsLzVnWDJwaUZOUHBjbDhRbmIrZU91?=
 =?utf-8?B?OXpMcWxkMjFPTGdsd211cXRiN0FzSHQ5dlB0Vk15N2UvV24wUVNoNHhNbVlN?=
 =?utf-8?B?Qk44QWh6VDFNTTh4aFVia2hHZjZ6THo2SzhJMzE2Rmc4V1V5UGRtMHEwQ0dC?=
 =?utf-8?B?N0hnaWJoSnRzZmYxQnZ5a2EwMzVXR3lFdFYrMkZtc1hMZzNibnY5MzczSVM5?=
 =?utf-8?B?RU9ZNW5pVDlZWEt1MlhpR2JEaDNFQ3hGVkN0U1JScjV4dkEvanBUTytoVERl?=
 =?utf-8?B?VzVzVmpsWS9NT3AwL2cvdUFkNzhKMWFMcWlCRmRuWG51VWU5T2w0WldIRHlC?=
 =?utf-8?B?Tjl2OGNvVGRWeW9uOGZhdnVwR1NGcldXRmNJaTIwNjA3K0xUTC9taE5YZHhX?=
 =?utf-8?B?Q2dxbEpEQ1pZVmt2RFB6ZEw0QjVTazZCc3Y4WmNrZlQ0WStMcFNvY25yMjJN?=
 =?utf-8?B?bERldnVidHBuZU51ZTc3eUdQTTNDQlBJbFRQd1ZXM3hQSlFqWVg2TEJWaXVp?=
 =?utf-8?B?UnRZc3AvRFZ3cWVyYjlTZ01KY2xYTTVobk5rZ08veklVL1lkbEg1dkpxa1lS?=
 =?utf-8?B?eFNJN2c0Rm5HRWJ3dDRjNkh3Ym1jYnJJU1luNzNRVmppVDFKRUdLeVhXNFM5?=
 =?utf-8?B?WDVDZU5CVTVmYm5Lck4vTW0xU1l6L01senp4b3J2NU9QQnpVQ05ReGZzRE02?=
 =?utf-8?B?bW1ZTTR1azVaQXMzZVJHKzBVdTBxZGxIc2ZLdk04SUtkdTI3dHFaTFZXOFl1?=
 =?utf-8?B?NW9UN2pNdFNqWWVqTW9NeDI3UHh3QndpWWI3c1RIMkV6dTlhSnJnbjMwdzF3?=
 =?utf-8?B?eFNCbVBXVXZEZFNKZlgxbWdWdXlFd2ZOM2FhdGo2MFJSRXpVTDQ2QkZLSVM0?=
 =?utf-8?B?TVJ4N2JGOWNCMnJJZDE4Y1FKV0ltTmxVZGcycFptcVhzaEhuQVlUazZTN2JJ?=
 =?utf-8?B?Y0xRV1gvRFNiY054N1U4RUMvVmlpcTM4Yi9aVSs4Tkd1TDFWTFBZTlQzTjBL?=
 =?utf-8?B?Mk1DUlQ0dkVhVEpESGlPNzhmTkpsZ0NzcUluUE9aYUtSdWJrVmZpZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dccf47-75de-494e-f1d4-08de4f5bbc67
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:47:36.2526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDf+KQZCH8DRBDmn5joXcJNc5E0MuasLojftSHMCQoFyIxnDoW2htwI4W+PFxkH2maM5osANCIXc9MOWFjzPCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7636
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


On 1/7/2026 3:05 PM, Swati Sharma wrote:
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>
> Here added possibility to use rotation flags in tests, including
> reflect flags. Then use the new flags to create xrgb888, xyuv8888
> nv12 and P016 reflect-x tests.
>
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_flip_scaled_crc.c | 158 ++++++++++++++++++++++++++++++
>   1 file changed, 158 insertions(+)
>
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
> index 5ffa357e0..954b46b5f 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -122,6 +122,20 @@
>    * @downscaling:        Downscaled
>    * @upscaling:          Upscaled
>    */
> +/**
> + * SUBTEST: flip-32bpp-linear-to-32bpp-linear-reflect-x
> + * Description: Flip from 32bpp non scaled fb to 32bpp non scaled x mirrored fb
> + *
> + * SUBTEST: flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x
> + * Description: Flip from 32bpp xyuv non scaled fb to 32bpp xyuv non scaled
> + *              x mirrored fb
> + *
> + * SUBTEST: flip-NV12-linear-to-NV12-linear-reflect-x
> + * Description: Flip from NV12 non scaled fb to NV12 non scaled x mirrored fb
> + *
> + * SUBTEST: flip-P016-linear-to-P016-linear-reflect-x
> + * Description: Flip from P016 non scaled fb to P016 non scaled x mirrored fb
> + */
>   
>   IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffers");
>   
> @@ -148,6 +162,8 @@ const struct {
>   	const uint32_t secondformat;
>   	const double firstmultiplier;
>   	const double secondmultiplier;
> +	const igt_rotation_t firstrotation;
> +	const igt_rotation_t secondrotation;
>   } flip_scenario_test[] = {
>   	{
>   		"flip-32bpp-ytile-to-64bpp-ytile-downscaling",
> @@ -156,6 +172,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-yftile-to-64bpp-yftile-downscaling",
> @@ -164,6 +182,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-xtile-to-64bpp-xtile-downscaling",
> @@ -172,6 +192,8 @@ const struct {
>   		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-4tile-to-64bpp-4tile-downscaling",
> @@ -180,6 +202,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-linear-to-64bpp-linear-downscaling",
> @@ -188,6 +212,8 @@ const struct {
>   		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytile-downscaling",
> @@ -196,6 +222,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-yftile-to-32bpp-yftile-downscaling",
> @@ -204,6 +232,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-xtile-to-32bpp-xtile-downscaling",
> @@ -212,6 +242,8 @@ const struct {
>   		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-4tile-to-32bpp-4tile-downscaling",
> @@ -220,6 +252,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-linear-to-32bpp-linear-downscaling",
> @@ -228,6 +262,8 @@ const struct {
>   		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-ytile-to-16bpp-ytile-downscaling",
> @@ -236,6 +272,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-yftile-to-16bpp-yftile-downscaling",
> @@ -244,6 +282,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-xtile-to-16bpp-xtile-downscaling",
> @@ -252,6 +292,8 @@ const struct {
>   		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-4tile-to-16bpp-4tile-downscaling",
> @@ -260,6 +302,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-linear-to-16bpp-linear-downscaling",
> @@ -268,6 +312,8 @@ const struct {
>   		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytileccs-to-64bpp-ytile-downscaling",
> @@ -276,6 +322,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-yftileccs-to-64bpp-yftile-downscaling",
> @@ -284,6 +332,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling",
> @@ -292,6 +342,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
> @@ -300,6 +352,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytileccs-downscaling",
> @@ -308,6 +362,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-yftile-to-32bpp-yftileccs-downscaling",
> @@ -316,6 +372,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
> @@ -324,6 +382,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
> @@ -332,6 +392,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>   		1.0,
>   		2.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
> @@ -340,6 +402,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-yftile-to-64bpp-yftile-upscaling",
> @@ -348,6 +412,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-xtile-to-64bpp-xtile-upscaling",
> @@ -356,6 +422,8 @@ const struct {
>   		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-4tile-to-64bpp-4tile-upscaling",
> @@ -364,6 +432,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-linear-to-64bpp-linear-upscaling",
> @@ -372,6 +442,8 @@ const struct {
>   		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytile-upscaling",
> @@ -380,6 +452,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-yftile-to-32bpp-yftile-upscaling",
> @@ -388,6 +462,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-xtile-to-32bpp-xtile-upscaling",
> @@ -396,6 +472,8 @@ const struct {
>   		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-4tile-to-32bpp-4tile-upscaling",
> @@ -404,6 +482,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-linear-to-32bpp-linear-upscaling",
> @@ -412,6 +492,8 @@ const struct {
>   		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-ytile-to-16bpp-ytile-upscaling",
> @@ -420,6 +502,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-yftile-to-16bpp-yftile-upscaling",
> @@ -428,6 +512,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-xtile-to-16bpp-xtile-upscaling",
> @@ -436,6 +522,8 @@ const struct {
>   		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-4tile-to-16bpp-4tile-upscaling",
> @@ -444,6 +532,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-linear-to-16bpp-linear-upscaling",
> @@ -452,6 +542,8 @@ const struct {
>   		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytileccs-to-64bpp-ytile-upscaling",
> @@ -460,6 +552,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-yftileccs-to-64bpp-yftile-upscaling",
> @@ -468,6 +562,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
> @@ -476,6 +572,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
> @@ -484,6 +582,8 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytileccs-upscaling",
> @@ -492,6 +592,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-32bpp-yftile-to-32bpp-yftileccs-upscaling",
> @@ -500,6 +602,8 @@ const struct {
>   		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
> @@ -508,6 +612,8 @@ const struct {
>   		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
>   	},
>   	{
>   		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
> @@ -516,6 +622,48 @@ const struct {
>   		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0,
> +	},
> +	{
> +		"flip-32bpp-linear-to-32bpp-linear-reflect-x",
> +		"Flip from 32bpp non scaled fb to 32bpp non scaled x mirrored fb",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0 | IGT_REFLECT_X,
> +	},
> +	{
> +		"flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x",
> +		"Flip from 32bpp xyuv non scaled fb to 32bpp xyuv non scaled x mirrored fb",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XYUV8888,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XYUV8888,
> +		1.0,
> +		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0 | IGT_REFLECT_X,
> +	},
> +	{
> +		"flip-NV12-linear-to-NV12-linear-reflect-x",
> +		"Flip from NV12 non scaled fb to NV12 non scaled x mirrored fb",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_NV12,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_NV12,
> +		1.0,
> +		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0 | IGT_REFLECT_X,
> +	},
> +	{
> +		"flip-P016-linear-to-P016-linear-reflect-x",
> +		"Flip from P016 non scaled fb to P016 non scaled x mirrored fb",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_P016,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_P016,
> +		1.0,
> +		1.0,
> +		IGT_ROTATION_0,
> +		IGT_ROTATION_0 | IGT_REFLECT_X,
>   	},
>   };
>   
> @@ -642,11 +790,16 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_plane_set_fb(primary, &data->small_fb);
>   	igt_plane_set_size(primary, data->attemptmodewidth,
>   			   data->attemptmodeheight);
> +	igt_plane_set_rotation(primary,
> +			       flip_scenario_test[index].firstrotation);
>   	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
>   	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
>   	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90),
>   		      "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
> +	igt_skip_on_f((ret == -EINVAL) &&
> +		      (flip_scenario_test[index].firstrotation != IGT_ROTATION_0),
> +		      "Unsupported rotation\n");
>   	igt_assert_eq(ret, 0);
>   
>   	igt_pipe_crc_start(data->pipe_crc);
> @@ -655,6 +808,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_plane_set_fb(primary, &data->big_fb);
>   	igt_plane_set_size(primary, data->attemptmodewidth,
>   			   data->attemptmodeheight);
> +	igt_plane_set_rotation(primary,
> +			       flip_scenario_test[index].secondrotation);
>   	ret = igt_display_try_commit_atomic(&data->display,
>   					    DRM_MODE_ATOMIC_ALLOW_MODESET  |
>   					    DRM_MODE_PAGE_FLIP_EVENT, NULL);
> @@ -662,6 +817,9 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
>   	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90),
>   		      "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
> +	igt_skip_on_f((ret == -EINVAL) &&
> +		      (flip_scenario_test[index].secondrotation != IGT_ROTATION_0),
> +		      "Unsupported rotation\n");
>   	igt_assert_eq(ret, 0);
>   
>   	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
