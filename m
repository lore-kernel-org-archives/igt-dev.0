Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4526FCCD19A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 06:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB1110E202;
	Tue, 18 Nov 2025 06:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAQI5gew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746C10E202
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763446573; x=1794982573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GOc/LHDlfdNXVBsCsjvCkiF6uvkJEjjkL0AMfKthnLE=;
 b=QAQI5geweNZc0HhjYeCseA878Le+XuiwqM+rbWbkSMIndw4gtI5MSbSU
 z04a8XWci7G+GO6KDrsJmPftJUet6prk62ubxV/4TNuNCR9nsMIcsgiGq
 6lZb0zOo/5rY5HSPHIJnBLJ3bGwJM+wRt8a7Z/lwaoRjApnGMrVICrMGT
 08ZkPpH/K1pzTdo+AfYaLXlv8GSqFmrt+qS6m9LKosoM4K/r0bX6ehP/p
 yOF14U+ZjdSQwWLl53syXgR0I0zJXGne5FVVYM5upYahhOZPHbAZ8AC8U
 2bXkFKGkBL4VPuzqrfCCfCMSr05mDnCP90lVfzyo4repRoXbJFOz7Hik/ g==;
X-CSE-ConnectionGUID: eAiAkt+cSVCbexOZOag4ug==
X-CSE-MsgGUID: uqgT6Qv4RjmHjvuw8+XQtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64460372"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="64460372"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:16:13 -0800
X-CSE-ConnectionGUID: B+Qj4p9CQHyDAas+LRhSLg==
X-CSE-MsgGUID: 5F6sSt3CQEeB+KE4SQwBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190462227"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:16:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:16:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:16:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:16:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC4WZhxqLhkLr122auJLp5Fdgtq9AmKSZJ/8y4viAV7Y7QV7t3auSip8sdA4CDpzZGtQ+Pfn5Lcm7RDbvc5VHBPUI3/GYxEfxMiK9n/cxhErxuHWhtDm3n1MPxA5go4zB/1T9D+hFCOPGJRYGOWEngq7M2e14leOp60HuC73IUogW/TbYrZsmnMulGQg71WnyFu4zsRRFNDcPLSXu25Pj/lPWow994AhvKX7NFE8WJoXv3q796skQ/4XX7bW8ay659i8u4cNXfsNsu/91h3OgD2wYxPTFz73RPXt9YzNgdxriKohlg+Fuq5NQX3knw6g4jFMmj9Cw2yosFigHH9G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOc/LHDlfdNXVBsCsjvCkiF6uvkJEjjkL0AMfKthnLE=;
 b=NNh3fqQQm/vm4jS+XCAjwqagZu8t3L+N/f1lef5GYmmIFxeNa/GaYcZ2eMMpdjpU3x3O36jIvvag2JorixOEBz1vdqkUDB9KjsImz8/KczQNTe4OMhOyMYpK6kcPCzQzxiaOFpLzq4z00jZBwMj37mToBkliNfkhvZNgel29g6mV9RlhETmOJDMB0v5ACijo5ONsPXhXHSk8eVzR8ERwF3jFm4Aq5z+vlmSZC7CDMNUyje6kw8vN0MqAztXez2j3o+Zf+FHJIFB+1uzS8lX6+c1pqlbA8EyB7O11APSyU/QgGadZGHJtolrp7PVw4ZQud35dWIyGXkFGJhbhhAiQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:16:09 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9320.019; Tue, 18 Nov 2025
 06:16:09 +0000
From: "Wang, X" <x.wang@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Summers, 
 Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v8 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Thread-Topic: [PATCH v8 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Thread-Index: AQHcQhcXil1+Qpc7b0my5+DgG6Dtb7TnuDWAgBBoB2A=
Date: Tue, 18 Nov 2025 06:16:09 +0000
Message-ID: <SA3PR11MB80466F2883839420B367675086D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-2-x.wang@intel.com>
 <20251107193913.v2yaubnqbcr7chok@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251107193913.v2yaubnqbcr7chok@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|DS0PR11MB7381:EE_
x-ms-office365-filtering-correlation-id: cc425ad8-03b2-4003-21c1-08de2669f72f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eWNTbEp4MlpZc0ZzWUhGbGtNU3lZcWFsL1JzUEJkT1pWMTR3S3NYUEI4ejk0?=
 =?utf-8?B?Z2duc2VobDRpUUU5cnJtRnA3SHIvcHFyZW83L3Z0cHFCanB1MnpVcjJFbVly?=
 =?utf-8?B?TVBlaUdjOXJabEQ5SDh0d0pXQ21XalN4dUdVQW55S29BdkgyYTl4a2tMYXM2?=
 =?utf-8?B?T09EeHU1a3Vsb2RSanlCVmRPbWo0eFVCQ1VjSjJjM3NxV0lQODFlOHR6RFBK?=
 =?utf-8?B?TG9aTFdwcXRuTldmSWUxekFlOUtxOFRIM1BMbHNZMjY0clN5ZTZUVnRmUUxI?=
 =?utf-8?B?VENyUFBzNUFHVEVrTkd4KzMwbUVpdFpTZUlzWnNyK28xZWc2UElTME9LNFBt?=
 =?utf-8?B?ckhaZXhXUVJWcjIyWTdHZk02ZE1zK3VGTEg2M014KzE5M25GSGI2bDFXVnFR?=
 =?utf-8?B?cGFKSExLYnFPcXlVeDFaRzQyc3VvSC92L2cwR3VpdUpTbnFSdHRuTVV1RU5W?=
 =?utf-8?B?TDdYclNMU01DUFJyTWllZU16c3daY2tZc0plWG5MZHhaUGhEV1lvMjY3R0RG?=
 =?utf-8?B?bTJnN3c0V1I4WENPb0E0NktuZ3Q0cm5kOENka0hyRkZnSDdrYXlaTEJqYW1C?=
 =?utf-8?B?eEtOOXQ5cTF1R1RoZW82TGJ5QUNnNGg5QjQwMUgzSGNZSlRyOTRsbTFaNlph?=
 =?utf-8?B?SnRtb2huM0xsUTFPUm5yZzBJN1Q2TzcvQTBYdkNPT08reWZTTkdFN0RKZk1o?=
 =?utf-8?B?Vno5ZHNwYzhTWU1TcGxFTTlFVkFMZWlnNFVwQnJLOHNsTWxxZ1Z3WjVtNStz?=
 =?utf-8?B?V05XRGpjMHNEQXMyZ3pjV1ZCWk9HK1pDVWZxWkxjZ1pZc0trL0phOVBCd0s0?=
 =?utf-8?B?SzBRUTZyaWRtc2d3OTRqa21EK3FsMTEyL0tIbUVaN0ZPMndyTjBKZzAxTFNP?=
 =?utf-8?B?V1p4cXFCRGdUcUNjQW80M09FREloMndjUzNOYW05Tis3Y1F3VkdKRlo2dzFQ?=
 =?utf-8?B?ZFdGdHNuSjhqOWZkeWRHL2RFZ3JQbk9INDBOZjdDeDE4WnpRRnVkSm8vSFJ6?=
 =?utf-8?B?QmI0cjNUTzIxQ3dPVzh2VU5tVXkyamNtbUdyVzhmUDJUaVJ5ZzlyRnFtaVpI?=
 =?utf-8?B?RmgyeldBbzhOSkRBclMrVXptbDlrZGczYTNaQ3NhamJKVXRQYnZWNUxOeGwv?=
 =?utf-8?B?Tk91T0lrcGJ3bGZzc25zR3dSSWM0RXBCRURTNkxUQWc0QXM5dVhNQnZKU2VU?=
 =?utf-8?B?b08ySm1UVStCUmh6OE4wak0vVXpjQWlBaHZxMzQ2TzJyb21JQVhLWWdqSXA0?=
 =?utf-8?B?N3VvQVZJV3AzNExlajZleXZkOUlZczJqOEk5bnRWVEZNSVJNSmxoY3RKWHBQ?=
 =?utf-8?B?NkxTaUdma1VNOVZvQ1Rsa2w3VzF1aXNrT0NtQ2N0ZmNPSCs3UXA2Y1pQa3ZD?=
 =?utf-8?B?Wkd0c3ZKUTFsd0w5REhiaFJmUjgvRUZwVTJ0N1JuMExwMzczMTdVRGtvdXEx?=
 =?utf-8?B?VG8xdERSaTJUY0I2RXl6Nk5FVEorRTdqSHBFSDNENzlrUms0OFI2bm9QMzhn?=
 =?utf-8?B?UkFVdmVaUDd5M3FBc2w1QXNmTStsbnJ6N01DeHpuYm5DbmZKcldBVGRMaFpx?=
 =?utf-8?B?Rm1RZFFWQW0wdVVheHYvZmJwajNINUtPM1VPVzF5eVg4b3VsY1FJT1I0enho?=
 =?utf-8?B?bjV0ZTVZSWx3VVlRRzlSNENBSGNQOFVvY2xtNi8rc09ReFNDT0dWRDBjeHVM?=
 =?utf-8?B?clUvemFYdTJnMGMzdWE1SEpCQWw2UFV6cFRXNThQVkFTc1VaUHQwT2VMMHQx?=
 =?utf-8?B?aWxXVEh3ZlF0Z1NBcHZRUlFrSU1IM2dJU0VBVHQva3dqR1hCSW1WY3h5SXd5?=
 =?utf-8?B?SHlLa04vaVhUTDN6S3RqaDZCcmZlek9TOVRsVXZzb1NPMDhBL1d2dm5JZ3lu?=
 =?utf-8?B?VE9Gd29OM21zVGtPMDF5NTVrVzZ6ZWZNUG1oS09NWWZUczk2eU1LdmthQTZt?=
 =?utf-8?B?WVhtR2dncXdPYzhWUVB3em9xMCtTeFF4T3NVMURKL1VoNEx0NDdhUkRRbjNv?=
 =?utf-8?B?ZGMyVzNFQTlZU1lZcHhEUk5TdDlyM2N5Mm1KaGlZQ1RsZ1NrZEIxemhJdVpk?=
 =?utf-8?Q?1UP8Rr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(10070799003)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUNPcHpHU3dqNEJTWnBkYjV2VXB4U3VQL1hXVnkxRWluUVR4ZXdsNzR5aVdV?=
 =?utf-8?B?U2FBM21PQWt3bkt6bTdlVVZqTkU5cHRPaGd4RnRzalloSldYQkVqR25kTDcr?=
 =?utf-8?B?NXZZYUJxTGhRVVJ2TGxhajdEaWYvRjh1RWZjYXM4SXgyc3RTUHdvN3Y0L1Jo?=
 =?utf-8?B?RzdSY1NOWktMRWU3Rnl6U1MxaEtEWEswSkFIMlQ2UmlMY0FqTlIvZkdZV0ZL?=
 =?utf-8?B?Vng4S0FtN0k1ZG50bkc2SlhrS1gralA0L1lkYVF3UDBsb1BEcTFNVldBN1RR?=
 =?utf-8?B?ekg1NVJFdzB6QldoUEhTdU1WTnM3T01KNEtOOVJuTk9Ua3pRWjNWKy9Way9T?=
 =?utf-8?B?RnJFWGxGNVo3U0NvZ2hqdVpVZnFZbDJZa09SZ0FtWGd2Vm5VOUhtcHNYdUxV?=
 =?utf-8?B?Mm1YdkplQm4xOVQvaTJjNlZHdVkzMGdwOWVWMzNjeDB1ZCtWNC9iNG5EdzMy?=
 =?utf-8?B?SXYxcVpySElDWFVmR2RIZCtkdmRMd1BDbWk0NGdkcHY3dmhHUXVIZnpKTnEw?=
 =?utf-8?B?Z21hYTlNNFNESXlCK0FHS25hNllMdldYdzVWZ3VPcWR4Y0pOTEpQVWh6enIy?=
 =?utf-8?B?U1d2ekZxODhrUDhLL1NFU1h5dFBkY01SNkE2NlF3bkFSRlhPM2JUbGFEbXdz?=
 =?utf-8?B?YytkQW51QmFvVnFSdVdncG1RUEYxSHY5TmcyQ0oreXNKVjhEVzNQaWQ4ZDF2?=
 =?utf-8?B?bzRNczRVTGdFZlFGM1RyY2Q0emVKSmFFL21rVnhGSCtsRmttZWhyUUtZT1pE?=
 =?utf-8?B?Y1ZTS2t1azRxd2lKMGs3Sy9NTUc5Umw2Y0F3dGRqQ3FCTnRpcC9iOTR2bG5B?=
 =?utf-8?B?cTNxZ0h0MmFwVGE4MkltNEtUWGVQUlJhd21DU2kxUTI3S0tMa21MQ3BtRzB2?=
 =?utf-8?B?L3puT1pZZ2lENXRhTS9KWDBKd0lhSzQwendTNTlJMFUyK0ZKL1JkNllwV0dQ?=
 =?utf-8?B?R29FcHJuQlQ0RnU4VUhsMkw4MmNZSzZoZURDKzFUVlhGcUxwWmMydUZVU3hk?=
 =?utf-8?B?bnJMT3Yxa0xENDF3aDJ2bG5EV0ZDcjJsNU93WUtEN242WlNNR1FkY3BFZ2Jo?=
 =?utf-8?B?emU1S2h2UXhCb2ZFU2VFb29CMGxpZytOekEweHNRK1czUG5rZmN5WTdUV0Fk?=
 =?utf-8?B?S3VQcDZWTWtOQzdTanlOd1hHbXozSjVOdDJPMTFMdnFMZzRkbHI3Wk1xaDlu?=
 =?utf-8?B?bXVrQ09kdUFxTVhHeVJZSHVVeisyejVvNVRmTTd6Z1NKQTFOd0wyUWVlLzhq?=
 =?utf-8?B?RXNUTGhKVTlURW9pNDZjM1piU3B5OHo5Zm1ZankxTDhYc3V4OTlwVVRkNVQw?=
 =?utf-8?B?a0ZqZUNPbXl6SWFtSkFwaitwZlFZSjFRa0RJTUFJQTYreUM1dmFWWXgwRTV6?=
 =?utf-8?B?bjc0blNVZGMwRGpVTVRZK0NBVG1IV2NTQ2U2YThhZDNWbFJTMDNsdmpyRE53?=
 =?utf-8?B?aVBmVHBuY1JiNklwdEZDejI1cEtGK2RveTFnMk50bEZMS1dIZXVLZ3RSd0xN?=
 =?utf-8?B?ci9XcDZaOWZhYm0rcmVaaE5CNDFWa3MrWW5hVGluT2RCZHcrVTZmKzcvWkpv?=
 =?utf-8?B?bXNNU3JjQXc0Z09LUmh6NHMyYXVBSXRRNHBqeUhQc2JRWnNrV3Y2b3JZR0Jw?=
 =?utf-8?B?NG8zckhzSzU3UTlKM3UwQnBQUkxLV1dmbkpYMVp2blJ6cE05cklMbE1nYXBv?=
 =?utf-8?B?YlNJeVdhZkVKd0F5cWQ1cXN3OTJIeFFXR1FhYUNaMk4rMHlkcHF0M3ZHZGQx?=
 =?utf-8?B?YWk3R0lVbnRTNmgzSlVXOGhZK1k2c1dIbHRCU01KWXU2ak9KSkVmek5wYko4?=
 =?utf-8?B?dFdORk85UWRZYjFLVmZyMDJ0dUcwK2xhbGs5VGhHVk0zSE15RnVXMFBZOURK?=
 =?utf-8?B?bExvZjVNVFhJSzZaVnJHVEYxN3VsK29oYVRXSXlRVTVHa2hGWDJKSUdFOXFw?=
 =?utf-8?B?Mk12djFwSGpUTDVXQ2xVNnQ2OXZOcGJNQUpEL2FORVNxSE10UVMyQXdUVGZ1?=
 =?utf-8?B?U29zVTV0cGw5VW9rdXJaSHNxVktJUm1QcDRNRmNKS3F6S1Z4TWVFSForQmVH?=
 =?utf-8?B?dlN0c0NyVjZuZWVaTndMK25nYnZCVklLbTdhc0V1N0hBOWZjaHY4TnB5azhx?=
 =?utf-8?B?ODR4RGtGSS9yZUFWZzdGUTlTWU1LZVRMSDh2djB0SmNDMzFGVTdzOGRVSEho?=
 =?utf-8?Q?jtpSTG8bjF2Z9sI39ilS7Y4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc425ad8-03b2-4003-21c1-08de2669f72f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:16:09.3109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5fo2Lc5s9MuGqDtHLBICvDdEbpNXSsz3ma3oMud4xOygvcOJDCvERdUYi+spqDm2Rg6jiJAFaM7IQZNGFxybcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE5vdmVt
YmVyIDcsIDIwMjUgMTE6MzkNCj4gVG86IFdhbmcsIFggPHgud2FuZ0BpbnRlbC5jb20+DQo+IENj
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU3VtbWVycywgU3R1YXJ0DQo+IDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMS8yXSBsaWIv
eGUveGVfcXVlcnk6IEdldCBydW50aW1lIHhlIGRldmljZSBncmFwaGljcw0KPiB2ZXJzaW9uIGZy
b20gR01EX0lEDQo+IA0KPiBIaSBYaW4sDQo+IE9uIDIwMjUtMTAtMjAgYXQgMjM6MTI6NTIgKzAw
MDAsIFhpbiBXYW5nIHdyb3RlOg0KPiA+IFRoaXMgYWxsb3dzIElHVCB0byBxdWVyeSB0aGUgZXhh
Y3QgSVAgdmVyc2lvbiBmb3IgeGUgcGxhdGZvcm1zLg0KPiA+DQo+ID4gS2V5IGNoYW5nZXM6DQo+
ID4gLSBBZGQgeGVfZGV2aWNlX2lwdmVyIGZpZWxkIHRvIHhlX2RldmljZSBzdHJ1Y3R1cmUNCj4g
PiAtIHNldCB0aGUgZ3JhcGhpY3MgdmVyc2lvbnMgYmFzZWQgb24gdGhlIEdNRF9JRA0KPiA+IC0g
Q2FjaGUgZGV2aWNlIGlwdmVyIGluIGdsb2JhbCBtYXAgaW5kZXhlZCBieSBkZXZpZCBmb3IgZWZm
aWNpZW50DQo+ID4gbG9va3VwDQo+ID4gLSBJbXBsZW1lbnQgeGVfaXB2ZXJfY2FjaGVfbG9va3Vw
KCkgdG8gcmV0cmlldmUgY2FjaGVkIGlwdmVyIGJ5IGRldmlkDQo+ID4gLSBDbGVhbiB1cCBjYWNo
ZWQgZGV2aWNlIGlwdmVyIHdoZW4geGVfZGV2aWNlIGlzIHJlbGVhc2VkDQo+ID4NCj4gPiBWMjoN
Cj4gPiAtIGFkZCBuZXcgc3RydWN0IHhlX2RldmljZV9pcHZlciB0byBob2xkIHRoZSBpcHZlciBp
bmZvDQo+ID4gLSBzZXBhcmF0ZSBjYWNoZSBtYXAgdG8gZWxpbWluYXRlIGNvbGxpc2lvbiAoUm9w
ZXIsIE1hdHRoZXcgRCkNCj4gPiAtIGNoYW5nZWQgZnVuY3Rpb24gbmFtZSB0byB4ZV9pcHZlcl9j
YWNoZV9sb29rdXAoKSB0byBhdm9pZA0KPiA+ICAgY29uZnVzaW9uIChSb3BlciwgTWF0dGhldyBE
KQ0KPiA+DQo+IA0KPiArIENjOiAiU3R1YXJ0IFN1bW1lcnMiIDxzdHVhcnQuc3VtbWVyc0BpbnRl
bC5jb20+DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpbiBXYW5nIDx4LndhbmdAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBsaWIvaW50ZWxfY2hpcHNldC5oIHwgIDYgKysrKysNCj4gPiAgbGli
L3hlL3hlX3F1ZXJ5LmMgICB8IDUzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQ0KPiA+ICBsaWIveGUveGVfcXVlcnkuaCAgIHwgIDQgKysrKw0KPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfY2hpcHNldC5oIGIvbGliL2ludGVsX2NoaXBzZXQuaCBp
bmRleA0KPiA+IDJmNmJmNzg4YS4uMmRkMjE0NDEzIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pbnRl
bF9jaGlwc2V0LmgNCj4gPiArKysgYi9saWIvaW50ZWxfY2hpcHNldC5oDQo+ID4gQEAgLTk4LDYg
Kzk4LDEyIEBAIHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyB7DQo+ID4gIAljb25zdCBjaGFyICpj
b2RlbmFtZTsNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdHJ1Y3QgeGVfZGV2aWNlX2lwdmVyIHsNCj4g
PiArCXVpbnQzMl90IGRldmlkOw0KPiA+ICsJdWludDE2X3QgZ3JhcGhpY3NfdmVyOw0KPiA+ICsJ
dWludDE2X3QgZ3JhcGhpY3NfcmVsOw0KPiA+ICt9Ow0KPiA+ICsNCj4gDQo+IGltaG8gdGhpcyBp
cyBub3QgbmVlZGVkLCBzZWUgYmVsb3cuDQoNClRoaXMgc3RydWN0dXJlIGlzIHVzZWQgZm9yIHN0
b3JpbmcgdGhlIGlwdmVyc2lvbiBhbmQgY2FuIGV4dGVuZCB0byBoYXZlIHRoZSBtZWRpYSBpcCB2
ZXJzaW9uIGlmIHdlIHdhbnQuIA0KPiANCj4gPiAgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9p
bmZvICppbnRlbF9nZXRfZGV2aWNlX2luZm8odWludDE2X3QgZGV2aWQpDQo+ID4gX19hdHRyaWJ1
dGVfXygocHVyZSkpOw0KPiA+DQo+ID4gIGNvbnN0IHN0cnVjdCBpbnRlbF9jbWRzX2luZm8gKmlu
dGVsX2dldF9jbWRzX2luZm8odWludDE2X3QgZGV2aWQpDQo+ID4gX19hdHRyaWJ1dGVfXygocHVy
ZSkpOyBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gPiBiL2xpYi94ZS94ZV9xdWVy
eS5jIGluZGV4IGE4OWUwYjk4MC4uNWQ4YWNjZDQ3IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94
ZV9xdWVyeS5jDQo+ID4gKysrIGIvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gPiBAQCAtMzE5LDYgKzMx
OSwyMiBAQCBzdGF0aWMgc3RydWN0IHhlX2RldmljZV9jYWNoZSB7DQo+ID4gIAlzdHJ1Y3QgaWd0
X21hcCAqbWFwOw0KPiA+ICB9IGNhY2hlOw0KPiA+DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgeGVfaXB2
ZXJfY2FjaGUgew0KPiA+ICsJcHRocmVhZF9tdXRleF90IG11dGV4Ow0KPiA+ICsJc3RydWN0IGln
dF9tYXAgKm1hcDsNCj4gPiArfSB4ZV9pcHZlcjsNCj4gPiArDQo+ID4gK3N0cnVjdCB4ZV9kZXZp
Y2VfaXB2ZXIgKnhlX2lwdmVyX2NhY2hlX2xvb2t1cCh1aW50MzJfdCBkZXZpZCkgew0KPiA+ICsJ
c3RydWN0IHhlX2RldmljZV9pcHZlciAqaXB2ZXI7DQo+ID4gKw0KPiA+ICsJcHRocmVhZF9tdXRl
eF9sb2NrKCZ4ZV9pcHZlci5tdXRleCk7DQo+ID4gKwlpcHZlciA9IGlndF9tYXBfc2VhcmNoKHhl
X2lwdmVyLm1hcCwgJmRldmlkKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZ4ZV9pcHZl
ci5tdXRleCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGlwdmVyOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICBzdGF0aWMgc3RydWN0IHhlX2RldmljZSAqZmluZF9pbl9jYWNoZV91bmxvY2tlZChpbnQgZmQp
ICB7DQo+ID4gIAlyZXR1cm4gaWd0X21hcF9zZWFyY2goY2FjaGUubWFwLCAmZmQpOyBAQCAtMzc5
LDYgKzM5NSwyMyBAQA0KPiBzdHJ1Y3QNCj4gPiB4ZV9kZXZpY2UgKnhlX2RldmljZV9nZXQoaW50
IGZkKQ0KPiA+ICAJZm9yIChpbnQgZ3QgPSAwOyBndCA8IHhlX2Rldi0+Z3RfbGlzdC0+bnVtX2d0
OyBndCsrKQ0KPiA+ICAJCXhlX2Rldi0+Z3RfbWFzayB8PSAoMXVsbCA8PCB4ZV9kZXYtPmd0X2xp
c3QtDQo+ID5ndF9saXN0W2d0XS5ndF9pZCk7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkqIFNldCBn
cmFwaGljc192ZXIgYW5kIGdyYXBoaWNzX3JlbCBiYXNlZCBvbiB0aGUgbWFpbiBHVCdzIEdNRF9J
RC4NCj4gPiArCSogV2Ugc2hvdWxkIHVzZSB0aGUgaGFyZGNvZGVkIHZhbHVlIGZvciB0aGUgbm9u
ZSBHTURfSUQNCj4gcGxhdGZvcm1zIChpcF92ZXJfbWFqb3IgPT0gMCkNCj4gPiArCSovDQo+ID4g
Kwl4ZV9kZXYtPmlwdmVyLmRldmlkID0gMDsNCj4gPiArCWZvciAoaW50IGd0ID0gMDsgZ3QgPCB4
ZV9kZXYtPmd0X2xpc3QtPm51bV9ndDsgZ3QrKykNCj4gPiArCQlpZiAoeGVfZGV2LT5ndF9saXN0
LT5ndF9saXN0W2d0XS50eXBlID09DQo+IERSTV9YRV9RVUVSWV9HVF9UWVBFX01BSU4gJiYNCj4g
PiArCQkgICAgeGVfZGV2LT5ndF9saXN0LT5ndF9saXN0W2d0XS5pcF92ZXJfbWFqb3IpIHsNCj4g
PiArCQkJaWd0X2RlYnVnKCJTZXR0aW5nIGdyYXBoaWNzX3ZlciB0byAldSBhbmQNCj4gZ3JhcGhp
Y3NfcmVsIHRvICV1XG4iLA0KPiA+ICsJCQkJICB4ZV9kZXYtPmd0X2xpc3QtPmd0X2xpc3RbZ3Rd
LmlwX3Zlcl9tYWpvciwNCj4gPiArCQkJCSAgeGVfZGV2LT5ndF9saXN0LT5ndF9saXN0W2d0XS5p
cF92ZXJfbWlub3IpOw0KPiA+ICsJCQl4ZV9kZXYtPmlwdmVyLmdyYXBoaWNzX3ZlciA9IHhlX2Rl
di0+Z3RfbGlzdC0NCj4gPmd0X2xpc3RbZ3RdLmlwX3Zlcl9tYWpvcjsNCj4gPiArCQkJeGVfZGV2
LT5pcHZlci5ncmFwaGljc19yZWwgPSB4ZV9kZXYtPmd0X2xpc3QtDQo+ID5ndF9saXN0W2d0XS5p
cF92ZXJfbWlub3I7DQo+ID4gKwkJCXhlX2Rldi0+aXB2ZXIuZGV2aWQgPSB4ZV9kZXYtPmRldl9p
ZDsNCj4gPiArCQkJYnJlYWs7DQo+ID4gKwkJfQ0KPiANCj4gRm9yIHRoaXMganVzdCBjcmVhdGUg
YSBmdW5jdGlvbg0KPiB1bnNpZ25lZCBpbnQgaW50ZWxfeGVfZ2V0X2d0X2dtZChpbnQgZmQsIGlu
dCBndCkNCj4gDQo+IG9yIHhlX2dldF9ndF9nbWQoaW50IGZkLCBpbnQgZ3QpDQo+IA0KPiBhbmQg
YWRkIHNlY29uZCBvbmUNCj4gaW50ZWxfeGVfZ2V0X21haW5fZ21kKGludCBmZCkgb3IgeGVfZ2V0
X21haW5fZ21kKGludCBmZCkNCj4gDQo+IEFsbCB0aGF0IGNhY2hpbmcgc2VlbXMgb3ZlcmNvbXBs
aWNhdGVkLiBQcm92aWRlIGFsc28gYXQgbGVhc3Qgb25lIHVzYWdlIGZvcg0KPiB0aGlzLg0KPiAN
Cg0KVG8gY3JlYXRlIGEgZGVkaWNhdGVkIGZ1bmN0aW9uIGhlcmUgd2lsbCBub3QgaGVscCBmb3Ig
c29sdmluZyB0aGUgaXNzdWUuIA0KQmVjYXVzZSB3ZSBhcmUgbm90IGludGVuZGluZyB0byBjaGFu
Z2UgdGhlIGNvZGUgZm9yIHRoZSB0ZXN0IGNhc2VzIHRoZW1zZWx2ZXMuIFdlIGFyZSB0cnlpbmcg
dG8gbWFrZSB0aGUgb2xkIEFQSSBzdGlsbCBjb21wYXRpYmxlLiBUaGUgb2xkIEFQSSBpcyB1c2lu
ZyB0aGUgZGV2aWQgYXMgdGhlIGtleSB0byBxdWVyeSB0aGUgaXB2ZXIgc28gd2UgbXVzdCB1c2Ug
dGhlIGRldmlkIGFzIHRoZSBrZXkgdG8gc3RvcmUgdGhlIGlwdmVyIHNvbWV3aGVyZSBhbmQgdGhl
biB1c2UgdGhlIGRldmlkIHRvIGdldCB0aGUgY29ycmVjdCBpcHZlciBmcm9tIHRoZSB4ZV9pcHZl
ci5tYXAuDQoNCi0gWGluDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsNCj4gPiAgCS8q
IFRpbGUgSURzIG1heSBiZSBub24tY29uc2VjdXRpdmU7IGtlZXAgYSBtYXNrIG9mIHZhbGlkIElE
cyAqLw0KPiA+ICAJZm9yIChpbnQgZ3QgPSAwOyBndCA8IHhlX2Rldi0+Z3RfbGlzdC0+bnVtX2d0
OyBndCsrKQ0KPiA+ICAJCXhlX2Rldi0+dGlsZV9tYXNrIHw9ICgxdWxsIDw8DQo+ID4geGVfZGV2
LT5ndF9saXN0LT5ndF9saXN0W2d0XS50aWxlX2lkKTsNCj4gPiBAQCAtNDEzLDYgKzQ0NiwxMSBA
QCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfZ2V0KGludCBmZCkNCj4gPiAgCXByZXYgPSBm
aW5kX2luX2NhY2hlX3VubG9ja2VkKGZkKTsNCj4gPiAgCWlmICghcHJldikgew0KPiA+ICAJCWln
dF9tYXBfaW5zZXJ0KGNhY2hlLm1hcCwgJnhlX2Rldi0+ZmQsIHhlX2Rldik7DQo+ID4gKwkJaWYg
KHhlX2Rldi0+aXB2ZXIuZGV2aWQpIHsNCj4gPiArCQkJcHRocmVhZF9tdXRleF9sb2NrKCZ4ZV9p
cHZlci5tdXRleCk7DQo+ID4gKwkJCWlndF9tYXBfaW5zZXJ0KHhlX2lwdmVyLm1hcCwgJnhlX2Rl
di0+aXB2ZXIuZGV2aWQsDQo+ICZ4ZV9kZXYtPmlwdmVyKTsNCj4gPiArCQkJcHRocmVhZF9tdXRl
eF91bmxvY2soJnhlX2lwdmVyLm11dGV4KTsNCj4gPiArCQl9DQo+ID4gIAl9IGVsc2Ugew0KPiA+
ICAJCXhlX2RldmljZV9mcmVlKHhlX2Rldik7DQo+ID4gIAkJeGVfZGV2ID0gcHJldjsNCj4gPiBA
QCAtNDI0LDcgKzQ2MiwxNSBAQCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfZ2V0KGludCBm
ZCkNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBkZWxldGVfaW5fY2FjaGUoc3RydWN0IGlndF9tYXBf
ZW50cnkgKmVudHJ5KSAgew0KPiA+IC0JeGVfZGV2aWNlX2ZyZWUoKHN0cnVjdCB4ZV9kZXZpY2Ug
KillbnRyeS0+ZGF0YSk7DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXYgPSAoc3RydWN0
IHhlX2RldmljZSAqKWVudHJ5LT5kYXRhOw0KPiA+ICsNCj4gPiArCWlmICh4ZV9kZXYtPmlwdmVy
LmRldmlkKSB7DQo+ID4gKwkJcHRocmVhZF9tdXRleF9sb2NrKCZ4ZV9pcHZlci5tdXRleCk7DQo+
ID4gKwkJaWd0X21hcF9yZW1vdmUoeGVfaXB2ZXIubWFwLCAmeGVfZGV2LT5pcHZlci5kZXZpZCwg
TlVMTCk7DQo+ID4gKwkJcHRocmVhZF9tdXRleF91bmxvY2soJnhlX2lwdmVyLm11dGV4KTsNCj4g
PiArCX0NCj4gPiArDQo+ID4gKwl4ZV9kZXZpY2VfZnJlZSh4ZV9kZXYpOw0KPiA+ICB9DQo+ID4N
Cj4gPiAgLyoqDQo+ID4gQEAgLTQ3NCwxMyArNTIwLDE4IEBAIHN0YXRpYyB2b2lkIHhlX2Rldmlj
ZV9kZXN0cm95X2NhY2hlKHZvaWQpDQo+ID4gIAlwdGhyZWFkX211dGV4X2xvY2soJmNhY2hlLmNh
Y2hlX211dGV4KTsNCj4gPiAgCWlndF9tYXBfZGVzdHJveShjYWNoZS5tYXAsIGRlbGV0ZV9pbl9j
YWNoZSk7DQo+ID4gIAlwdGhyZWFkX211dGV4X3VubG9jaygmY2FjaGUuY2FjaGVfbXV0ZXgpOw0K
PiA+ICsJcHRocmVhZF9tdXRleF9sb2NrKCZ4ZV9pcHZlci5tdXRleCk7DQo+ID4gKwlpZ3RfbWFw
X2Rlc3Ryb3koeGVfaXB2ZXIubWFwLCBOVUxMKTsNCj4gPiArCXB0aHJlYWRfbXV0ZXhfdW5sb2Nr
KCZ4ZV9pcHZlci5tdXRleCk7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCB4ZV9kZXZp
Y2VfY2FjaGVfaW5pdCh2b2lkKSAgew0KPiA+ICAJcHRocmVhZF9tdXRleF9pbml0KCZjYWNoZS5j
YWNoZV9tdXRleCwgTlVMTCk7DQo+ID4gKwlwdGhyZWFkX211dGV4X2luaXQoJnhlX2lwdmVyLm11
dGV4LCBOVUxMKTsNCj4gPiAgCXhlX2RldmljZV9kZXN0cm95X2NhY2hlKCk7DQo+ID4gIAljYWNo
ZS5tYXAgPSBpZ3RfbWFwX2NyZWF0ZShpZ3RfbWFwX2hhc2hfMzIsIGlndF9tYXBfZXF1YWxfMzIp
Ow0KPiA+ICsJeGVfaXB2ZXIubWFwID0gaWd0X21hcF9jcmVhdGUoaWd0X21hcF9oYXNoXzMyLA0K
PiBpZ3RfbWFwX2VxdWFsXzMyKTsNCj4gPiAgfQ0KPiA+DQo+ID4gICNkZWZpbmUgeGVfZGV2X0ZO
KF9OQU1FLCBfRklFTEQsIF9UWVBFKSBcIGRpZmYgLS1naXQNCj4gPiBhL2xpYi94ZS94ZV9xdWVy
eS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmggaW5kZXggNzE1YjY0ZTJmLi40ZThiYTAzNzINCj4gPiAx
MDA2NDQNCj4gPiAtLS0gYS9saWIveGUveGVfcXVlcnkuaA0KPiA+ICsrKyBiL2xpYi94ZS94ZV9x
dWVyeS5oDQo+ID4gQEAgLTc0LDYgKzc0LDkgQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ID4NCj4g
PiAgCS8qKiBAZGV2X2lkOiBEZXZpY2UgaWQgb2YgeGUgZGV2aWNlICovDQo+ID4gIAl1aW50MTZf
dCBkZXZfaWQ7DQo+ID4gKw0KPiA+ICsJLyoqIEBpcHZlcjogRGV2aWNlIGlwIHZlcnNpb24gKi8N
Cj4gPiArCXN0cnVjdCB4ZV9kZXZpY2VfaXB2ZXIgaXB2ZXI7DQo+ID4gIH07DQo+ID4NCj4gPiAg
I2RlZmluZSB4ZV9mb3JfZWFjaF9lbmdpbmUoX19mZCwgX19od2UpIFwgQEAgLTE0MCw2ICsxNDMs
NyBAQCBpbnQNCj4gPiB4ZV9xdWVyeV9weHBfc3RhdHVzKGludCBmZCk7ICBpbnQgeGVfd2FpdF9m
b3JfcHhwX2luaXQoaW50IGZkKTsNCj4gPg0KPiA+ICBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZp
Y2VfZ2V0KGludCBmZCk7DQo+ID4gK3N0cnVjdCB4ZV9kZXZpY2VfaXB2ZXIgKnhlX2lwdmVyX2Nh
Y2hlX2xvb2t1cCh1aW50MzJfdCBkZXZpZCk7DQo+ID4gIHZvaWQgeGVfZGV2aWNlX3B1dChpbnQg
ZmQpOw0KPiA+DQo+ID4gICNlbmRpZgkvKiBYRV9RVUVSWV9IICovDQo+ID4gLS0NCj4gPiAyLjQz
LjANCj4gPg0K
