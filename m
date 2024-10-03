Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A29CF855A
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 04:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8F10E79E;
	Thu,  3 Oct 2024 04:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBu5GfcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5696E10E203
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 04:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727929447; x=1759465447;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fyWrUZ7Gke4AV7Qb/qaDl/zWMnt+ct/6xQtQr45QNo0=;
 b=XBu5GfcS6xnCznEiefeMRdQ8zYWk4XAPUhq1JI837tUHYJgroYKrD6QS
 ZNeYGxt6N9xTQB5xEslXxAzsnx9+W8wdxRgjedalsWIxLdbEMOyO4PjRa
 CMnOhCZGTHhY/MePhEIgcJGzJlB87srPJXgAWQdK+Q2kimgQnbqNw/9RB
 l7L4sAvG8YsNfy18ll0pFtdiF5UVQtTob9y+Dh/f2S6ChnJwuQOnKEBb2
 aaI6jIHeEcqJB2TmxM0hvwDU+9Yi7Eh7nTBp9Ob+xFByMeortJybTpvJ8
 NYEC64KZsGa+IFsGcKG5wzzOa7Kb0x+csby7mhxvdLptVl96JbaRqpWGy g==;
X-CSE-ConnectionGUID: JxqU/i3RSRm1rjlYSdDS6w==
X-CSE-MsgGUID: x3aLP5YcRj2NctAiBb89PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37708229"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="37708229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 21:24:07 -0700
X-CSE-ConnectionGUID: yG8xcvPlQxyB+ClCb9/NMA==
X-CSE-MsgGUID: JCp+0SuRSoWnsxVtJ+ksww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="73895707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 21:24:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 21:24:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 21:24:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 21:24:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 21:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDcuCcpJeAPazKBiJS6eVrWrr73Gx4txKmQJqpTrb1OdnKzDfv0P7sDI36SSxSb3bPGUXlTk8INruq+vrYo7cahcfSi7pxi/wnkpIfOgFlsmCvcCWoEtK3kq5HXMjeVksikw7gsJlYtNevS5OY3JbsvKEoWc97UFfzM4QGv9PbQMHrgIYOMXja4Nr4TOKJds39O2Qt3563cDDaiPawIF8xthl0AKgYRdTQA2MT0gba8tLjslXOXH9afh1kFw83T7oRg9YCzgPsKThdN6kczJNUT7oPQq9DNEeihQq3VmHMnEuxauQrjg3IjNLee1hw9JJj6EJuIoQDAFQo5FTEOL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lr9r6B0RQeIcB0HTZ97nwCPX56HISTqwlTiAtyxAMYQ=;
 b=SV/Ns1ilU1qEvKEYDNSKDs+lfoTqmNptJlBiykpOgHPPjrICFCrtCFEyxzI64bnp1Z6Lc+QxNtZytOLb4dD55ZXZda7dafwnce2JC5QJMYLXtbyLLSYQDRQWdGOpSVnufGeXohr9A1kCMdC8HW7F5HMtkQL4HS2R6eEzyy3ruz4Q4yk66HfGRxyMTXCz9dyNk8TWhy/avvunKoY01Oxv74m2S6x8Tv1cDH5X476hmw1/EwTLmfM+nZOc3gt7/wbg8rcFt34xERZXPDHnyG/8zDOY9rKfWIqK2NVEvf6ms4So0Q3fS22XR20y+vYC7foClP+AdLK9BaSiqwAo7OWQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 04:24:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 04:24:03 +0000
Message-ID: <86709185-c52d-400d-937c-93d6ddc2e322@intel.com>
Date: Thu, 3 Oct 2024 09:53:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/intel/kms_joiner: switch modeset from
 uj to bj and vice-versa
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20241001073448.2252300-1-santhosh.reddy.guddati@intel.com>
 <20241001073448.2252300-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241001073448.2252300-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: 9529e363-60c8-4029-e6bf-08dce36335c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmN6M2s0bGs0bkx0d3VhQ0IyS2xXNktaczI2cS90NTJKTHUwVVp6MWFab014?=
 =?utf-8?B?SmcydW43cHE4MVdNbHRpenFXMVVPMjRnWEVxRE04RDAwVjlWZGt0cW9PNDVE?=
 =?utf-8?B?b1NoRHNEUDFCaWk0T3FXWXNrV1ZRRXNsNldWY1dTMnJaNnFrRDBYU2lhbXBh?=
 =?utf-8?B?blp1SUxGWnZ1Q1VrblBHSklYK2xCWTlPSEgwZTR6eHg2Vy84OHBEQVFQVElv?=
 =?utf-8?B?dWRVUVJLYlY5Qm9pOWpSMHpGTUh3WFdLdkJTTit3MWhwSmZsZGZMcHVVN2Fo?=
 =?utf-8?B?ckxTVFdQdW55c2t5bHNja0ljdGl5Y1llRktWbXIxMjhiaFZxY09La2hYTGJn?=
 =?utf-8?B?VjEwZnh1d2oxakFNaUlxZU9FVWpqUnRJNUpMc2lRbFpyTTFKS0xwTktsVDVP?=
 =?utf-8?B?dnhwbWR5Y1NUOE04Nm83emI5MUNZSTNFMGl5WFpsbFlxS1FUb0oxekxzSUdi?=
 =?utf-8?B?alB1WVBOK2Z1OU8vUnUrR1ZuaHpSN0xZQ1k5aUFKZ2ROWG1ZaTBVWmN1NGs3?=
 =?utf-8?B?RDdOZ1RjQmpjcStMcnJEQkI4WDZ2R0xMQi8veTNpM2toVnpDcXRBQmZjdlJh?=
 =?utf-8?B?Tm8wSkYrMmRkK0ZKSVQ3OTJhVmlwNHBHZTJhcDFHTGZYeGh1SER5M1Rua0RF?=
 =?utf-8?B?Z3JXWHduUlJxclA0KzdBbTNHbHZqVnYyMHoybkdxdUpEd2ZXTjNwN3NQbkd6?=
 =?utf-8?B?Z1VMd3krdFg0Y09RaDNDclNSeXhZVDJYVy9iTVBVdUpzYlMrZ1VxWW5wQzBk?=
 =?utf-8?B?MXAyL3JWWDFuSFNENi9nZUQwNVQ3SllYWkFrajJBRy9XOGszRmJMS0hWUVUy?=
 =?utf-8?B?Zk51V09LNDVjUkJYdHEzVjQ3bHBtM1M5TUFkckJORjVhb0p4Mi9Hcld6am9I?=
 =?utf-8?B?UU9HUGVMV09oSkdpMFdIaXhjVUdtVkVtUlJObDA3M2dkdDBZYjl4R0tudi8z?=
 =?utf-8?B?YkRpM05UZEtnbnIrM0N2TUFvMXVWcVVIdkwvUm5xNDlITmJUeWhQcHd5THlz?=
 =?utf-8?B?d2psSVdjZ1RGQTFoK0VGcjZ1bXVNa0ZleFVvODNLU05nOEdMK0tvODNCcWd3?=
 =?utf-8?B?bEdta2VVRmpjdHdFMjFiSXY2MC9xTTJQMEU0cmpDMVlGcXZFcjNqK2xQSzZQ?=
 =?utf-8?B?cVU4blg2cXM2OGZ2R2FNU1N4bVVSOHpzWFQyWVZneG5YK014Qm5BYWlBMmE0?=
 =?utf-8?B?SjhJNmpaeWZic1c0eWUvdStONTlpdXY5akxqNzZnTGR2eFNlUXFQb0dNMWk5?=
 =?utf-8?B?OTdWZDY4Wk9kTjMxREtkaWdCUWx4ZjlCVFpwcVBlNXFDS0pLc2pnRDdLRWl3?=
 =?utf-8?B?N2lJMTRMU3M5SXZzSSswM2RlU2g5NFdib01wb2RjMjBhZ1p6L2FjSkxwU241?=
 =?utf-8?B?cXhBd1o5ckNFMDM5eFlEaklMK0gwU1hqWTJCMElOTENUZUsyeUxRYVdiMnZJ?=
 =?utf-8?B?ZktJKzNkbG9yd094aUg3d2hxckRMUWZvaDloeDE0VytKWDJTS2tOOThXM1Z6?=
 =?utf-8?B?V0FlWnJJaU0wTC9aTURNU1krNVc0cW11UG05b1JIM2NRckNjZ1pQMERaSHdG?=
 =?utf-8?B?ZzZtSlZNV2MrczZkK2NNS1JXbVI5QlkzbFBKQkhaSVlKM0djTmFrODQvSDc0?=
 =?utf-8?B?dlhyb0JsaWxzUlB0L2pURWk1T0FtZDhNZGswbXlMK0x6R2IzUDVOM1diMktM?=
 =?utf-8?B?cFZwcWdjWkNsNWUwUDlCMU5OQXQvMlh1b3hpK3cxKzYxNCtkcGRQVkZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3hmRE4zbzhVV3ZyNmttcXdTOUVBaElqdU5kVk51RytlZHpQaWR3TXB4Vkc2?=
 =?utf-8?B?Rlo2Z0QxYmVpbnIwSStFbTRhUklGZXhMajRtMVpaWWg3eHpRcHB4c0lUd2ZP?=
 =?utf-8?B?RFI1MVhnRzJkeUtBQm9pcjQ4YktKWW14RzA4VXBJWUppekVUbXVzQlVpM2sw?=
 =?utf-8?B?bUVNU21MSm5tbUMxRlFJUERlRnE2SHRBc0RDcEU2ZEo3RlF6b0htYTlqaUpk?=
 =?utf-8?B?cGtzT052TUpkSThuUHNSUVdBNUdCaHB5NjVRY3h1Z0p1Z3NLd0NVRUZVcGg2?=
 =?utf-8?B?UkNlOHpoQTlyZ1BhSWdDTWJ6K3pTMTdKU1ZyQjV2aU9GL0Z6RW00ZFNqR1Z5?=
 =?utf-8?B?eW1ncnJiNE5MZlJPWitIaUR0TDNPMUxsZzNTT1N1TDF6dmx3TzNUV1BaWjZa?=
 =?utf-8?B?OW1ZNEJRbUZ0VHFES3dHNHhkUmFQS2NnUXlKdXdmSURwOCtvOTlKQk52Q0Rk?=
 =?utf-8?B?UU9teGtESjgrMUw0ZWg3cFFiVk51MGhjNEhmZkU1YjV2a1M2OWh5YmpJbWsy?=
 =?utf-8?B?ekVEWWJUMUtHZGJzaGFqY3pXZTFRVzRDSjZ0aENsUWc5TitFQVI5Vm1JWlQ1?=
 =?utf-8?B?bUlaZmZYbWNVdEt2S1U2UUhlZmxtOTZWc1ArMmpJamo2RUhUOFQxcFBsNjJJ?=
 =?utf-8?B?ZytxcVkrY3A4TzZWb3UxSnRtNmo2bC9kWEtRRXNETTZsVGxTZ0xvUnRMaXh2?=
 =?utf-8?B?emFJeHZGVlp4TXo4Q3pZdEcxdkk2cnhkRWc5N1lGOEZwa283SXV0UGIrQ2ta?=
 =?utf-8?B?L1ViNDVCdVZBSUN2QTRvVUl3SDY5MlpseU9RbVl5YzhVWGM3OXZPbFFyV3Bv?=
 =?utf-8?B?Q1EyRGdvYzM4WVRsTW03V3pxaWxzZ3hZRVM4ZVhPS3VBVWxiWVJSdCs0ejYx?=
 =?utf-8?B?aDlZeTA3VjVVNEptQkNueDRzQlRmbDJmV3IzdkZpMFFVRjdCYmI0U0Z6RWlm?=
 =?utf-8?B?dDRuaEZVT0Ywd203ckM1MHh5ZytCZVJFL2tPay9Ic3ZldXZsUmhqZnJnWFVL?=
 =?utf-8?B?cmpRY1ZnWnFzei8veVFRTDZjN1AwRGkwVjA5Qnp2OFF1bmRNR2psOStYcGpu?=
 =?utf-8?B?czJaYzlNWlJUWExTVzNzWXRhYnd5bmJrNnpWL2RYUXM5c3N0TmZnd3hUWmR0?=
 =?utf-8?B?YUlhTloyQkVvYWNlZjIrU2p3dkdsVHB5VGhnVndkcHQyb1VSYm4xUno3TXZN?=
 =?utf-8?B?c05jd2h6UWVZUDZOcU9CWFRYenNMUUtHUVZzVUxaT1dHeFByK3pPcU5jOVZF?=
 =?utf-8?B?UkVNTzV2eEFXT283WXZRRUgwVUh0VGk5dFNNZFBKMUpLY0tjWDVpSFpmYVJa?=
 =?utf-8?B?ZXBacXZKbEs5TkV6OUhPdmdoRjFWbHhrRGtUcCt0dG1rWGdsbGFtb1E1MWJv?=
 =?utf-8?B?dFNkSytnR1ZTNlhaMlVPbFJYSlNiSHFDaWtsMTlhak1DeGlEZkVXQldBc0Y5?=
 =?utf-8?B?QTZpQThZdmNaZ1cyU254dkY4Q2puejRUdXBsSjNSK1AxU0lwNWhsZjA5Mm8v?=
 =?utf-8?B?azFsckZQYnVLcXZkQzFZL1U0VytMNXl4OUJhWWF3WGNPcmREMkk0VGowRHJR?=
 =?utf-8?B?dmRyRThGRmZNUWpldEpOaU5tUGJoc1JiTURJZEFWaXJpRE1PanRadHQ3ZDNt?=
 =?utf-8?B?RlZwdHFFSjAyWmVtZFNKWlZ0cnZMc2M2b0ZBTEdhV1ZsczZBTklJbjY3bW8w?=
 =?utf-8?B?ZU95TldCaEk4cFArQVVOcVJjVi9hRXdSdkhUWFQybUdSSWUrVG5HWDZEZWtV?=
 =?utf-8?B?S0Y1N0xXbXNIRDZPYzdiNU0zaDYxOHN0a0JISEhXcVNRV0JZT2lFSEUzSHBN?=
 =?utf-8?B?MjI3VjN2RXRKaVZuNlh0TnVFK291L25vUEYrLzRxY1hGWURndlljM1lMWko2?=
 =?utf-8?B?dDJwdlNMRjR6MDQweDUwU3hBYTl5dEphMy9YcEpjUjI4WUxYVWo4MEdTbUhN?=
 =?utf-8?B?TWQwellWK0Z3WENyUmVEMk5qYXF4OCtXM0ZUL0g0akdTRzJuNmNKcmFBa01Y?=
 =?utf-8?B?ekFJc1BPbHgxMzFVRmVBNW5CUWJFTHh4M0VBU1kvbjJVMm52djJaUXFmdDNi?=
 =?utf-8?B?N3RES3lGN2hod3NKMDdMLzNjaVBkbWg4d0ZNME5pQ0ZveVZFKzZLR1BZVlpa?=
 =?utf-8?B?bUN4dFRSeVM0cEZOa3NHVTlGUC8rNCs1eGFGSm1jQWJoS3V1bVA3MTd6MXFv?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9529e363-60c8-4029-e6bf-08dce36335c8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 04:24:03.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaW94xJ49PVa+OQDI2MVQQevXhh7WtobR1Z0R5GOgSWb/6GbcCizthDl24eebv3FPt8FaY+wf4RUXlBJwwP/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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

Hi Santhosh,

On 10/1/2024 1:04 PM, Santhosh Reddy Guddati wrote:
> Add a subtest to validate switching from ultra joiner to big joiner
> and vice-versa.
>
> v2: Add new subtests for switching without force joiner (Karthik)
> v3: start with uj to bj switch, if not available switch to force mode
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_joiner.c | 53 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 508e82ce3..7c7436b9a 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -71,6 +71,9 @@
>    * SUBTEST: invalid-modeset-force-ultra-joiner
>    * Description: Verify if the modeset on the other pipes are rejected when
>    *              the pipe A is active with force ultra joiner modeset.
> + *
> + * SUBTEST: switch-modeset-big-joiner-ultra-joiner
> + * Description: Verify modeset switch between ultra joiner and big joiner.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -507,6 +510,56 @@ igt_main
>   				test_ultra_joiner(&data, false, false, false);
>   	}
>   
> +	igt_describe("Verify modeset switch between joiner and ultra joiner");
> +	igt_subtest_with_dynamic("switch-modeset-big-joiner-ultra-joiner") {
> +		igt_require_f(data.n_pipes > 1,
> +			      "Minimum 2 pipes required\n");

We need four pipes to support ultra joiner. So we can skip the test if 
we don't have 4 pipes.

Also, I would suggest to add the checks to verify if we're able to 
support both big and ultra joiner before the start of the dynamic 
subtests. If either one is not supported, then just skip the subtest 
from here itself rather than starting the dynamic subtest and skipping 
from there.

Thanks,
Karthik.B.S
> +
> +		igt_dynamic_f("ultra_joiner_to_big_joiner") {
> +			if (data.ultra_joiner_output_count > 0) {
> +				test_ultra_joiner(&data, false, false, false);
> +			} else {
> +				igt_require_f(force_joiner_supported &&
> +						  data.non_ultra_joiner_output_count > 0,
> +					      "Force joiner not supported on this platform or none of the connected output supports it\n");
> +				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +				test_ultra_joiner(&data, false, false, true);
> +			}
> +			if (data.big_joiner_output_count > 0) {
> +				test_single_joiner(&data, data.big_joiner_output_count, false);
> +			} else {
> +				igt_require_f(force_joiner_supported &&
> +							  data.non_big_joiner_output_count > 0,
> +							  "Force joiner not supported on this platform or none of the connected outputs support it\n");
> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +					test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +			}
> +			igt_reset_connectors();
> +		}
> +
> +		igt_dynamic_f("big_joiner_to_ultra_joiner") {
> +			if (data.big_joiner_output_count > 0) {
> +				test_single_joiner(&data, data.big_joiner_output_count, false);
> +			} else {
> +				igt_require_f(force_joiner_supported &&
> +						  data.non_big_joiner_output_count > 0,
> +					      "Force joiner not supported on this platform or none of the connected output supports it\n");
> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +					test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +			}
> +			if (data.ultra_joiner_output_count > 0) {
> +				test_ultra_joiner(&data, false, false, false);
> +			} else {
> +				igt_require_f(force_joiner_supported &&
> +						  data.non_ultra_joiner_output_count > 0,
> +					      "Force joiner not supported on this platform or none of the connected output supports it\n");
> +					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +					test_ultra_joiner(&data, false, false, true);
> +			}
> +			igt_reset_connectors();
> +		}
> +	}
> +
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
>   	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
