Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B50CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB2110E1E2;
	Mon, 24 Nov 2025 08:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhuJ2r/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000910E1E2
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763971999; x=1795507999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wvGt9h2eETeGJxlsl2D+RTG+wzHkTr14OPYRdQpER2w=;
 b=jhuJ2r/RZZeinmDLU86ZnMzdPNYWdUEr7z/bybj11c4vuPFusJOQeOE4
 Glg8XZd7slvuUwy63QJ5qhBG3BLdh+X8Y22HyByB40o2EdPTe4xiK+si5
 u9GqhAqgualDdI6pMM6ZZK5SND0Vyn7wGYVwDqLg/FDPe1rKrGqoc4Qys
 R/9E9DO5kd+qshODeQjmPZIdghrys6l2osuudcr9QjP8oOg5OUF4ShOuN
 LNDIKZ7DYWhrQJg5AJ3Uve21L0LjrO/jP9b4HW3zlsBMUBu+PUB3mWQXp
 czBZaH1bwpdDTl2L2xX34oZmKH5V3bpLgUDAr6n4upyruW7+5gV5aA4YV g==;
X-CSE-ConnectionGUID: 8+03sMzIQsuxigdo6aI77w==
X-CSE-MsgGUID: OYG4FJWJRAOtgZJ9SEBpAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="88617008"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="88617008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:13:19 -0800
X-CSE-ConnectionGUID: thWa1l6PS4GKZopvFyvmlg==
X-CSE-MsgGUID: IZ3ebnMoQdCUfIsZjCecug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="223234319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:13:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:13:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:13:17 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:13:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+9EZdzY15hwFf6F8uzcywolYy+I57qtU0XrE4ePTycvHToJ/8fYpaNoou6r7YLrFcnVR9eX0ukliTvubWfdnTv83PqhA4G305GaeUvOvlVM+Tft6NMLtiLycl9Tp4Q9OGeEsdyk/y8omutSPrtVMm/xwlqsDMVKCOtWu6pRwy+FLcR/dpBE4hXMexefgMvcUTXHxtbMXqnGesEZkdXQ8FNLTAWU1+9Pw4yAZz/S0cWwub92p7w526r4pTZZk7U9NC5p2vJx6tiPOjlaICsDc4ofCOYov14zCWsgQfb7bImqvuh32ETwhWylpnuNIDmEhkcXLHzklL2Ncdm/8LuwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvGt9h2eETeGJxlsl2D+RTG+wzHkTr14OPYRdQpER2w=;
 b=Agr49mSFNDwrwXLxZrwlb50CKBfZQX7OVONF3r7YxV2Eu5zWBOYIt+3tWVTaHpMDGG/HAFOqaJaTWouilLNxcJGo1+fmXmoGsOE/lqS5HKvGLgGheVEcIJVDOAQ9SoxcA1NsDe7jXVk4d6Wco2yYfEdstS/gi/tPs1JnUHftBlighe0mHpD2gw9pf3ZN6I5j/GGHuQHnRRc/0R+0YPd9rZ2ENDJj6j78y8TCcK9EDMy0zTaaRtUi0V6SAjPSD1Iq8ip/2tk7318QrcRMwWKiEh/+gK9G86L8bF0eOXs0UYYCAT7lRPeZ1spF6ZMzivJxqpJjsZmynL1tuGUg3KOZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Mon, 24 Nov
 2025 08:13:15 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:13:15 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device query
Thread-Topic: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device
 query
Thread-Index: AQHcWtYbcGdj2Xa5a0eOaOoUE2iXUrUBfjnw
Date: Mon, 24 Nov 2025 08:13:15 +0000
Message-ID: <CH3PR11MB8434E89B00773717823BD8D08DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
 <20251121-xe_query_helpers-v5-2-d69c1c160e96@intel.com>
In-Reply-To: <20251121-xe_query_helpers-v5-2-d69c1c160e96@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ2PR11MB8346:EE_
x-ms-office365-filtering-correlation-id: 167a15ea-7724-4b1c-2a67-08de2b3151b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?b2ppVjczU3J6YjJ2MkhETWg4dW5nWVo5OUJKRVJMYWdHYzZ3MnpzZGFwZGxQ?=
 =?utf-8?B?bm4zRk9sTDZzTEVhV0VSNURaSld3ZlNRODNudDBMSEhnZ2l1QUJmd0FEQ2V4?=
 =?utf-8?B?VHlJNEpPNVNrUU03N0V6ZnBuVHY5aHBYOTc0UWlTVGRSQ2pNZ2dNQXJpYVhV?=
 =?utf-8?B?WDlNWUZrYldZaUs4QlZiclVnUzBFWmgvMUNSS3ROVzFML3lOWFdscUpmc1M1?=
 =?utf-8?B?UDgraVlJUXhKU3FEME5sOFA4QjR0OCs3WGJxMWhFaCtrSDZPZ1pQTlFXNHA5?=
 =?utf-8?B?MWdIMTJtcFBvcFN5TXE2S09ZQUhQV3VIRlFPc2Jkek1IcFJYenVhQzJsaE5J?=
 =?utf-8?B?ZjJwUFE4Y3ZidjFkRDZqeTZ5MEJVd1IrT3ZHaDJOTlR1dFAxUE12cVZGV2No?=
 =?utf-8?B?ejh2V1RGazQrLy9TN0g0MTJJTGFtZFJ5dyt6VzM1b3JYK3ZDbzdHTlUyOXVk?=
 =?utf-8?B?V050dlNGSFg0R3Nia2lCcTZEblJXQU1MbG1HSTUyTWwrMDJCWkcxYk5SMTNq?=
 =?utf-8?B?S29QYUswMFNnODNZV25NZGhkeUtReHMxK0x2akxrR05FbVF2Q2c2eVJaSWNS?=
 =?utf-8?B?SGpRbURiUE44V0RpcTNOVXlDZ1lTbFNpZW9vSGx6QWlLR2ppVGxCR0VWdTgz?=
 =?utf-8?B?VzgvM3Z3elVvRkx4dmVrZjlSeHFlcWlrUjAzSUwwZ1ZFeW9VZ2NpVjd3c2ZO?=
 =?utf-8?B?SlIxVzlWSHhQakJGQS9IVkpvdjNNOEZXdWdXclB1WkZyMHdJeTBtUEtsVy9u?=
 =?utf-8?B?WnVzTCsxNmo5aks0NXQ0VmdHL3pRVVJUSkVsc2xkbzFOQWV4RFQxQ1FMZC9J?=
 =?utf-8?B?cmk5elhXWlhWblJBNUpNQU90dDFmQnpBMEg1MjhCL2dESDU4S1NOQ3F2eGhw?=
 =?utf-8?B?dWttZTJGUVgrcStPbkFVRGdTK2Mrci9SeFUyUjREb0ZIS3lwSTM4ZnpSSHhC?=
 =?utf-8?B?TVlkNjNWMTI2VXpuaXF1bkI0VlJOTzFnUkFTU296SjlURkk2ajVnL0JEUnp2?=
 =?utf-8?B?c2MrcGlqRGZKMjB6Uk5wMzdvNk5OWW9TYXVyWm1aRTVxbzlVeE10aUg3dDNT?=
 =?utf-8?B?RmQ4SlY5SGNrS28rTmxCK0FmWlRIS1ZjY29Eb0dOVEdERW40eXlVV2lKRWZw?=
 =?utf-8?B?L21xK3U5UkpTWVlVQmdXMUw0MGZhZWFWSzlNYTl3R2RXeGEwSU8vQWNWUzd0?=
 =?utf-8?B?aHJtdC9reXNidXNta1BIU05uaFJ5WWt5RjU3OGdYTS9CN054QnZWK2tMcjBi?=
 =?utf-8?B?ZmZUQTMxNlV0cHU5ek1STDBaaWxiYnI3c2E4L201dW44d2U2b3dwTXRHMVo2?=
 =?utf-8?B?VDdiYzJQSTdudkhnNzNjdjI4SnJyY3BnQzdtWUhTR0xnbUsyenRpY2lSdmxa?=
 =?utf-8?B?dDNqSkRlOVFmZlRQaURNd1NUVFdyK1hHNTJRRno2OUdqcE5GSWJrN0gxcjEw?=
 =?utf-8?B?bFpFc2ZVQzNJak5IdS8rREtmTVhsUkhMK2Jka3NERHFRclhKbUowVEQvTjg0?=
 =?utf-8?B?bndBNnVGZUtnWHZIT3VCVkc4eFRJSXd2VW5tK282ZjBXT0ZydTJPR3NwVWNG?=
 =?utf-8?B?WDVZTXNRamtTazhTNGpKK3VvZENIcEYzcXlTRUp1SzZZbkVNcWJQbmJieVhH?=
 =?utf-8?B?SnkzOFEyNHpRTTJyeDNWeWdCZGF6eVVQTUFUcmZuOWRyNiswMlJRSEg5VFh5?=
 =?utf-8?B?dVhadXFvZy92OVVFZlByMGI5MUtlK3h6WVVwS2wwZmxYUXVXVVRJV0pMcllC?=
 =?utf-8?B?S25UeGpzOGhnY0tQeDBWNUNpRkFBdUlBOXo3VTFRaDNvcUtPb0RPQjFiNHEw?=
 =?utf-8?B?am5nRzc0YWdmajhCbXJJcFN0WVRxNkNrbWI1MkxraTlhMWx5QmJHY0ExUVFr?=
 =?utf-8?B?QUdtVlRJS28yL0VUOW1mVE9vVm9rMTBaZkVNR3Rwek45TkgyQzlYWkJzaUE1?=
 =?utf-8?B?UlY0TWFySm9JWUNHRUtEU09KOXVsdFB3bmpHTFNUZjZKMko5R3JlRSs5Z2Rm?=
 =?utf-8?B?OC83ZHhkcldTVDNWczE2dlZWbEJESVl2TWpBdExMczhJcGMzQ2pnRkk0Vkpm?=
 =?utf-8?Q?SfmzI4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzRrOHpSZVpKTzcycEJ0SnZ4TmVZQktNV1ZjZFY3OVduT1cvUldkZkNGOWVp?=
 =?utf-8?B?N2VMdXp4MDQwaUo3YUYwUjZPRzUvSXZZSzdWcC9VOUNrc0gvbGRIU1E2MUwx?=
 =?utf-8?B?VitFdWJOUVFRZ2RQTmc0aE9XY0xhMWVDWFBuaHFRRFVyVml1dlB5TnlaNlp6?=
 =?utf-8?B?WEd1MGtmOXhiZm5kM2JQODdRcUxaOFBjM1BkTHMxRWxGeFFwa3BQb2lRZHlr?=
 =?utf-8?B?ekNrbmQ3c3Y5MXR0Vi9OVmYrWklPRFFzdXlXWS9aMkJtT3lLRXRacHJzMmkr?=
 =?utf-8?B?L3ZCUEV0K1gxc3NHMEVUQldqZTBCeUNkbVlud0tRempndHZhSENZbFpXZG44?=
 =?utf-8?B?c25tU0luRmxWZjJ0SUZIMnlCZzNXeVFXbGtSYnBsWWVLMDFJZnJiZThEOVFh?=
 =?utf-8?B?eGROV0RZbURRNG0xUGRjZ0VwR1BuTDZTUmE5eWZLVkFkYW13VHZwbzBhY3J1?=
 =?utf-8?B?UTJ2WVp5a0pUZ2lTc1pxSW1lUGZOSGFkemxESUxjQXoxdHVEUkVrV2NwVkVJ?=
 =?utf-8?B?TS9kS2t0aXVUV1lXcmNYZ1haMFhVREhJa3Q0dUVFRkZFM1VFVmdEV2NwYzFk?=
 =?utf-8?B?bG50VkVuZEdCYkJQblVtcGxQOUtNVGRnVHF5T1lDbENRMERkeGlXTExCSWp1?=
 =?utf-8?B?M1Q0U0k3TURJQ3U3NGZsa2dyWXp3ZFJQckI4SVkyV2hoNFhiRTRYNytMNE02?=
 =?utf-8?B?SUFraTBQNkVOOWtMb3VLOFVKcTRRR3lVbk5JdkJXK3ZxQmNJanNvQzROcXJv?=
 =?utf-8?B?bnk0VzI5U1dROTBORXJrQWUyOENuSWkxUFh6TTRMNkV3VENQSWFrRk5RVW5m?=
 =?utf-8?B?a2hSUjNXTjcrVWE1ayt0RHY1SkF6S0todTc2YmtDQWJzemJhaDlwQ0UzdFh5?=
 =?utf-8?B?UTBxU1A2K25nbmpscGV5YjBEVVhMc3E0Mm54YzJjZVNER0ZGRmgwcWNPdlNR?=
 =?utf-8?B?aTJXanRBdkRsamNmaEtJeGdmTEplU3ZMRlBoODlDRjVuLzlodC8ybEJNRHdR?=
 =?utf-8?B?YnVrZURQOTVKNGhqcEZoQk5YSmIrVHpPNGxWMFA1TDlFTUR5aUZsUkl6djlr?=
 =?utf-8?B?TDB4VVhCbDNob0tOTWxqbkkvWVRCMGdiMTFyd2F1WEdxVlpMTVFnWEY0M0xs?=
 =?utf-8?B?S09qNjdhR1RZUGNhZFlPZ2FYS0hFa1l0Z29GdUxXK2xxaGJ6U3RpN3cyMjd6?=
 =?utf-8?B?MXZlOUpkSXJhV3dhMUdXN1NKRUI4eUJ2UE40UzVpWldDekdMTGFJTjJLRGEz?=
 =?utf-8?B?Vm9uV3Ezc01vUkFZcDZKTXNRVGlFTkFnaW1qblJsZS9rcHRZM0tUVzJKOW9Z?=
 =?utf-8?B?SEFrdGJlWDJ6NjZqRFNpdnNoL29OR29kck5Db21yeUpCa09Yd2JxMktucVJM?=
 =?utf-8?B?TVBPNEp5ajQ3QlJMMytkdVVJY3ZxM0ZqREZjNzdCcTJCazZjcFBPaStNMnVE?=
 =?utf-8?B?MUV5R0hPdnpSZy9QYy9Id1dWSEdWckVwMFlYd1hQMUNlLzRBekIzYXhmV1V5?=
 =?utf-8?B?SXpwUExPaDlPclNHZW9Nand1cDN5Y1JuVHllNW9kOENKMk9yY0ZsQmdXTnhZ?=
 =?utf-8?B?Nm5IUk5UbE5QYW5aaW5SUVZmc0tlL1JLUld4RTVGQmRMbDFzS3hvMFNpRjZw?=
 =?utf-8?B?eFErNXZncm13OERNVHduQ2wveFJEOFh5L29iMGFCZkxDeUEzaWkrMG8wU3ZI?=
 =?utf-8?B?SU9ocXFCMW4vbjdpTk1UVGo5MDlqZGQ1SlJ5aGdmM25GOTFXNUVraHcxbUQw?=
 =?utf-8?B?YzkrOHFMQUhOSDZDaW44UVBqbndqMWtvWEQ1Rm9mUnY3Nng0MStmMHNUMjR2?=
 =?utf-8?B?emh4d1JSVlA3dEE3cE9paDJyOW9ONWxZVThhT1FIOGZpZWtPWUhjMmIrUkRO?=
 =?utf-8?B?NWEzL2tXbS9JU2FXT0wrRkdpTFlHNGFMdktXaXVjNlpCSXJHcGwzci9waS9B?=
 =?utf-8?B?dVdLS1A0cU1yeXNiM2pUQ0I4dk92RWRiVHBLSWdjQ2VnQzN5V08xQVh2Y2hx?=
 =?utf-8?B?d09uUjFwTnA3TWY4amcrckRGSnR1VEZ2WXNySmt4S2FjK2dKMFdrRVhZMk5H?=
 =?utf-8?B?OWFsSDY5WXo2MmV1bW9uNnVnMERhYzBhZjMzL0R4WnpCWFpYc09mdENTcTAz?=
 =?utf-8?B?enFoNEt0N3h1T250d1FPRjB6ZFNqWGY1VmI1SjlkNWFxWksrQzU1L0s1NlYz?=
 =?utf-8?B?amN3MU4xcnNpcDdwcDhtejlxQUhoSUxnb2lOZ0QrSW9hQXV6c2dNWFZNcndn?=
 =?utf-8?B?N2l1cmh1MFBvNHhOZkZVa2VUUUpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167a15ea-7724-4b1c-2a67-08de2b3151b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 08:13:15.6710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCxxZE8s0b6Pq3fbdwW9LcGNrawFaJAvel+V/btcry6kg1aQTi5ObFnKK8dXsUE6yaUmrDhvN1LPaitwkWnj/QePtVfrToEnElGyRVYPdT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFqZGEsIEFuZHJ6ZWog
PGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBTZW50OiAyMSBOb3ZlbWJlciAyMDI1IDA0OjI5
IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPjsgRGFuZGFtdWRpLCBQcml5
YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IE11biwgR3dhbi1neWVvbmcg
PGd3YW4tDQo+IGd5ZW9uZy5tdW5AaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHIgPHBpb3Ry
LnBpb3Jrb3dza2lAaW50ZWwuY29tPjsNCj4gTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplag0KPiA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NSAyLzVdIGxpYi94ZS94ZV9xdWVyeTog
aW50cm9kdWNlIGhlbHBlcnMgZm9yIGRldmljZSBxdWVyeQ0KPiANCj4gSGVscGVycyBhYnN0cmFj
dHMgb3V0IGNvbW1vbiBiaXRzIG9mIERSTV9YRV9ERVZJQ0VfUVVFUllfSFdDT05GSUcNCj4gaW9j
dGw6DQo+IC0gcXVlcnkgZGF0YSBzaXplLA0KPiAtIGFsbG9jIG1lbW9yeSwNCj4gLSBnZXQgZGF0
YSwNCj4gLSBlcnJvciBjaGVja3MsDQo+IC0gdmFsZ3JpbmQgYW5ub3RhdGlvbnMuDQo+IA0KPiBU
aGVyZSBhcmUgdHdvIGZsYXdvcnMsIHRvIGZ1bGZpbGwgY3VycmVudCB1c2FnZSBwYXR0ZXJuczoN
Cj4gLSB4ZV9xdWVyeV9kZXZpY2VfbWF5X2ZhaWwgLSByZXR1cm5zIE5VTEwgaWYgcXVlcnkgaXMg
bm90IHN1cHBvcnRlZCwNCj4gLSB4ZV9xdWVyeV9kZXZpY2UgLSBhc3NlcnRzIG9uIGVycm9yIG90
aGVyd2lzZSByZXR1cm5zIHZhbGlkIHBvaW50ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUveGVf
cXVlcnkuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIGxpYi94ZS94ZV9xdWVyeS5oIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94
ZV9xdWVyeS5jIGIvbGliL3hlL3hlX3F1ZXJ5LmMgaW5kZXgNCj4gNTNhZjg2YTk5Mzc4ZGZkYTZm
OTg4ZTAxYTRkODQyYjI2NmU5NGE4MC4uYTE4NWI4NTJlMTliODdlMzkzZjRiYzYNCj4gZWRiZjll
MDk1MjQzOWQ1MTggMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2xp
Yi94ZS94ZV9xdWVyeS5jDQo+IEBAIC0yNSw2ICsyNSw0OSBAQA0KPiAgI2luY2x1ZGUgInhlX3F1
ZXJ5LmgiDQo+ICAjaW5jbHVkZSAieGVfaW9jdGwuaCINCj4gDQo+ICsvKioNCj4gKyAqIHhlX3F1
ZXJ5X2RldmljZV9tYXlfZmFpbDoNCj4gKyAqIEBmZDogeGUgZGV2aWNlIGZkDQo+ICsgKiBAdHlw
ZTogcXVlcnkgdHlwZSwgb25lIG9mIERSTV9YRV9ERVZJQ0VfUVVFUllfKiB2YWx1ZXMNCj4gKyAq
IEBzaXplOiBwb2ludGVyIHRvIGdldCBzaXplIG9mIHJldHVybmVkIGRhdGEsIGNhbiBiZSBOVUxM
DQo+ICsgKg0KPiArICogQ2FsbHMgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSBpb2N0bCB0byBx
dWVyeSBkZXZpY2UgaW5mb3JtYXRpb24NCj4gKyAqIGFib3V0IHNwZWNpZmllZCBAdHlwZS4gUmV0
dXJucyBwb2ludGVyIHRvIG1hbGxvYydlZCBkYXRhLCB3aGljaA0KPiArICogc2hvdWxkIGJlIGZy
ZWVkIGxhdGVyIGJ5IHRoZSB1c2VyLiBJZiBAcXVlcnkgaXMgbm90IHN1cHBvcnRlZA0KPiArICog
ZnVuY3Rpb24gcmV0dXJucyBOVUxMLiBPbiBhbnkgb3RoZXIgZXJyb3IgaXQgYXNzZXJ0cy4NCj4g
KyAqLw0KPiArdm9pZCAqeGVfcXVlcnlfZGV2aWNlX21heV9mYWlsKGludCBmZCwgdWludDMyX3Qg
dHlwZSwgdWludDMyX3QgKnNpemUpIHsNCj4gKwlzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSBx
dWVyeSA9IHsNCj4gKwkJLmV4dGVuc2lvbnMgPSAwLA0KPiArCQkucXVlcnkgPSB0eXBlLA0KPiAr
CQkuc2l6ZSA9IDAsDQo+ICsJCS5kYXRhID0gMCwNCj4gKwl9Ow0KPiArCXZvaWQgKmRhdGEgPSBO
VUxMOw0KPiArDQo+ICsJLyogSW4gY2FzZSBvZiB1bnN1cHBvcnRlZCBxdWVyeSB4ZSBkcml2ZXIg
dXN1YWxseSByZXR1cm5zIGVycm9yLA0KPiArCSAqIGJ1dCBpbiBjYXNlIG9mIEhXQ09ORklHIGl0
IGNhbiBhbHNvIHJldHVybiBxdWVyeS5zaXplID09IDANCj4gKwkgKiBvbiBvbGRlciBwbGF0Zm9y
bXMuDQo+ICsJICovDQo+ICsJaWYgKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9R
VUVSWSwgJnF1ZXJ5KSB8fA0KPiAhcXVlcnkuc2l6ZSkNCj4gKwkJZ290byBza2lwX3F1ZXJ5Ow0K
DQpJZiBpb2N0bCBmYWlscyB3aXRoIHNheSBuZWdhdGl2ZSB2YWx1ZSAtMjIgaWYgY29uZGl0aW9u
IGlzIG1ldCBhbmQgZ29lcyB0byBza2lwIGNvbmRpdGlvbiwgSSB0aGluayB0aGF0J3Mgbm90IGV4
cGVjdGVkIHJpZ2h0Pw0KaWYgKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVS
WSwgJnF1ZXJ5KSA9PSAwICYmICFxdWVyeS5zaXplKSBpcyBpdCBub3QgdGhpcyB3ZSB3YW50Pw0K
PiArDQo+ICsJZGF0YSA9IG1hbGxvYyhxdWVyeS5zaXplKTsNCj4gKwlpZ3RfYXNzZXJ0KGRhdGEp
Ow0KPiArDQo+ICsJcXVlcnkuZGF0YSA9IHRvX3VzZXJfcG9pbnRlcihkYXRhKTsNCj4gKwlpZ3Rf
YXNzZXJ0X2VxKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSwgJnF1ZXJ5
KSwNCj4gMCk7DQo+ICsNCj4gKwlWRyhWQUxHUklORF9NQUtFX01FTV9ERUZJTkVEKGRhdGEsIHF1
ZXJ5LnNpemUpKTsNCj4gKw0KPiArc2tpcF9xdWVyeToNCj4gKwlpZiAoc2l6ZSkNCj4gKwkJKnNp
emUgPSBxdWVyeS5zaXplOw0KPiArDQo+ICsJcmV0dXJuIGRhdGE7DQo+ICt9DQo+ICsNCj4gIHN0
YXRpYyBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2NvbmZpZyAqeGVfcXVlcnlfY29uZmlnX25ldyhpbnQg
ZmQpICB7DQo+ICAJc3RydWN0IGRybV94ZV9xdWVyeV9jb25maWcgKmNvbmZpZzsNCj4gZGlmZiAt
LWdpdCBhL2xpYi94ZS94ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmggaW5kZXgNCj4gNmE5
N2QzODRhMzY0OTc5ZTFhM2ZhNGUwNzg1Mzk3MjM2MDY4ZDBmYy4uMTVkNWMyNmJhZjViZTZlMTA3
NDk1MjQNCj4gN2NhMWFhZWZlYTU1MWQ4MjEgMTAwNjQ0DQo+IC0tLSBhL2xpYi94ZS94ZV9xdWVy
eS5oDQo+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5oDQo+IEBAIC0xNDMsOSArMTQzLDI5IEBAIHVp
bnQxNl90IHhlX2d0X2dldF90aWxlX2lkKGludCBmZCwgaW50IGd0KTsgIHVpbnQxNl90DQo+IHhl
X3RpbGVfZ2V0X21haW5fZ3RfaWQoaW50IGZkLCB1aW50OF90IHRpbGUpOyAgdWludDMyX3QNCj4g
KnhlX2h3Y29uZmlnX2xvb2t1cF92YWx1ZShpbnQgZmQsIGVudW0gaW50ZWxfaHdjb25maWcgYXR0
cmlidXRlLCB1aW50MzJfdA0KPiAqbGVuKTsgIHVpbnQzMl90IHhlX2h3Y29uZmlnX2xvb2t1cF92
YWx1ZV91MzIoaW50IGZkLCBlbnVtIGludGVsX2h3Y29uZmlnDQo+IGF0dHJpYnV0ZSk7DQo+ICt2
b2lkICp4ZV9xdWVyeV9kZXZpY2VfbWF5X2ZhaWwoaW50IGZkLCB1aW50MzJfdCB0eXBlLCB1aW50
MzJfdCAqc2l6ZSk7DQo+ICBpbnQgeGVfcXVlcnlfcHhwX3N0YXR1cyhpbnQgZmQpOw0KPiAgaW50
IHhlX3dhaXRfZm9yX3B4cF9pbml0KGludCBmZCk7DQo+IA0KPiArLyoqDQo+ICsgKiB4ZV9xdWVy
eV9kZXZpY2U6DQo+ICsgKiBAZmQ6IHhlIGRldmljZSBmZA0KPiArICogQHR5cGU6IHF1ZXJ5IHR5
cGUsIG9uZSBvZiBEUk1fWEVfREVWSUNFX1FVRVJZXyogdmFsdWVzDQo+ICsgKiBAc2l6ZTogcG9p
bnRlciB0byBnZXQgc2l6ZSBvZiByZXR1cm5lZCBkYXRhLCBjYW4gYmUgTlVMTA0KPiArICoNCj4g
KyAqIENhbGxzIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlkgaW9jdGwgdG8gcXVlcnkgZGV2aWNl
IGluZm9ybWF0aW9uDQo+ICsgKiBhYm91dCBzcGVjaWZpZWQgQHR5cGUuIFJldHVybnMgcG9pbnRl
ciB0byBtYWxsb2MnZWQgZGF0YSwgd2hpY2gNCj4gKyAqIHNob3VsZCBiZSBmcmVlZCBsYXRlciBi
eSB0aGUgdXNlci4gSWYgQHF1ZXJ5IGlzIG5vdCBzdXBwb3J0ZWQNCj4gKyAqIG9yIG9uIGFueSBv
dGhlciBlcnJvciBpdCBhc3NlcnRzLg0KPiArICovDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgKnhl
X3F1ZXJ5X2RldmljZShpbnQgZmQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90DQo+ICsqc2l6ZSkg
ew0KPiArCXZvaWQgKmRhdGEgPSB4ZV9xdWVyeV9kZXZpY2VfbWF5X2ZhaWwoZmQsIHR5cGUsIHNp
emUpOw0KPiArDQo+ICsJaWd0X2Fzc2VydChkYXRhKTsNCj4gKwlyZXR1cm4gZGF0YTsNCj4gK30N
Cj4gKw0KPiAgc3RydWN0IHhlX2RldmljZSAqeGVfZGV2aWNlX2dldChpbnQgZmQpOyAgdm9pZCB4
ZV9kZXZpY2VfcHV0KGludCBmZCk7DQo+IA0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==
