Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F58606A639
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQVaG2mf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9DF11272E;
	Fri, 30 Oct 2026 10:37:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C22611272D
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793356573; x=1824892573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9tw6/ud/1uHegyOoHdnAEiJqyD79POWUE7ybg8BXGPU=;
 b=DQVaG2mf+31klFV2ol/wWkg5OZ+1bwddBwHpUr9+jHo2dnfyf048y3R7
 l8bnubEPfjSCqlz+nCyUKep/mY8Y10sP3+3gRW+r+xUguLhU2nNIF5f9W
 zbFQE8CAyLMKAAAV0+ocGljAR+TRwQ85xM4U6at2KKIAVzW4GPYfg+uB+
 iuWqpEC25gO+aeoMCQynkx4jbUSoGf+VV4Hrfv8RBWyomG7y67TfNnpWA
 kvMxHWgg036In2n4bor//6kYD0QiFO55qmza/Yfl5YlbL31LfqFKrDBkP
 9QMEhJB0OIMLMUDvfcbXrhTX+jPz6aZA24RO3NyQ8+eAxavAbKZUFvgYp w==;
X-CSE-ConnectionGUID: djFmivkxRGa0hRNmKT/wIg==
X-CSE-MsgGUID: tTjnaCrAQ7asdFkxavrGtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2131495"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2131495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:36:13 -0700
X-CSE-ConnectionGUID: bqPZTpQYQOO3eMS/ph72MA==
X-CSE-MsgGUID: 53S7qwF6T6WpLmQ8ZOwXqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5282397"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:36:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:36:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 03:36:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 03:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa8j5xPbclksOyOXz0VvztbwhLSRN7fzgSeXj+kjukTCSizMvxvUuvf4hdZ8KAtRzX+jdWTkQHq/EY3+DCK3aJ1SG88SE6XMNCRWLZNyvyxOZU//N1i4k6LT4HR7yqP4lHNRts8vtZSCsr4+0dYMB0v95B2XbDXLw5M4mor+zSrUnx83zaycH7EZE4vumnwiRIu7h9P6T7lIdSJ/tnaOv4gcck2t3H7FRkqhii0w264wOaWg4Cq6ucU/qpqr7k8ltnOAd32VA+WMQNSjOCTBOqTJ9r4MpPhTHlDGrtMzXSxeiPI19hUpz5gyfSK8O/bdsfoNImbbEsWYNSc+ZaVkIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaaK/VCG3xhxJQx3GH9n+rg78+z4GCx00unsB4A4kPk=;
 b=U/pgnDveXSh31wpQ757Vm2MUVn+3dfUXTRDXh0Vysj9D/7wX2YFYdvFPhh6dYYwB8yyxPP4xsVRlCyZxgLarCYB5B4Cp1zyeiLekSGBwVT44E9TqE0e8bJiJ3uFzpJB7h4y6rY/gmHDRrg/getJl4IE/20XNMBAsvz1SJyWhW9HUFoQAIcOxxlCnjlWV63pKgBEXtLt8rP5Cr4Bb3+XQCzNBWXJruj7nKsE0NgX298PMEgbofPbECagTSn8eaBvIeZjTADoYAjPe+qH/S9dGpvuYTtf/gYnKrVlKSiOIgqayiBplPO4LsU8/y968CUqb/VJk5S2eHKw2gJLaj8TLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:36:09 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:36:09 +0000
Message-ID: <3c39bb18-8de2-4fed-a641-eacba20bb0d2@intel.com>
Date: Fri, 30 Oct 2026 16:06:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] lib/igt_drm_ras_nl: add set_error_threshold
 command support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-7-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261029085955.1232163-7-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SJ1PR11MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: d4552170-9c0b-43ef-c101-08df36719c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: JPRoV+jcdLQjwLQS6haLP1Lj7FSTBqS36XGuG8wNV1dy+JwMDzH9GWmsdr9QPozW2HrGU83o6F6HFfLpwDOaTT0/sa14zBRsWG3pLW9VuCfitDKwL2Q3IMmgT2z6rv/Lc3mUkzmCZwtOPeDkUy9AcEsXJ4GQt2PDCytx/XFDV0dXCBnGiEaLfiFQljUtkPvAim0kIYYOFpC00KPum54b0RtVNsbwL7tgEG6st7hWZbduIwfKFPmRBWz/3WBsCsKwuhrreZH1mPbMrMppeL3ubVspW3npeX8oC0WQ/e68WZCkfsmIXUTbIyyTL19+895h6uCRv6GIftl+3rUuI3AJe5n8i0K5QKA3lGA9KoZGhOGP+ZzCGmGP8uaUpOU4q00C8Ad+sIcR6iwHdj+5PEOV8uFM81cU/BjF0ajbozhC64pT6JcQ7qkQdDZVkOXTumD0wESy3BXPwwueoHpI68SByrfdynU7GIyHP7naOHrkOY2uRN7Zc2jXIfwvh9/Wziifm56gXQbDtLrglmuzmPqOL6jKL/6Mflgnuz0IA2NOykjew8dwQHWyi0AMRxEPlWv88czw0QFcGfUkR02l7wI7ueulO69s8DawHD/Phkgu2sOXL3lg/NB6v4JNHKEcXfEeHWgWBj0m9V7oeR6V1giXCXRFO0x6t4I9XjISTqX6aJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0NTeG0rZHNCNTRMRHFnOVZia3FPUFVocDE1V0ZLT3V3aC8xVitKZG9yUWIx?=
 =?utf-8?B?dkJmNDVLUXNUMDF5RDFqMkp6c0VXdWUwdEZjQWtNZ1BNeGV1T2cra01HK2lU?=
 =?utf-8?B?TlN0ZXBxMHdyR3VQbTZSYXJicEJmV2dTVFV4cWt0MTVJdHdoVU9YYkZZcTdC?=
 =?utf-8?B?emRMYS9ienhBOXc4RHdkUW43d2o1KzlSaVYwRG9YTHdzSE5aWnRyRVhLeGhW?=
 =?utf-8?B?Zmh2Qmw1RlZyeTFLZEo0WlJzYXRxMUxpaVZBNUgzdk9kWlBtY0s0Vnh4bnAy?=
 =?utf-8?B?RWJuRTdHbW5ObVMvNVpuMFl3eFIxeW5ZRjJYdWdFOW9QYVI0YWxaazN0Rm5W?=
 =?utf-8?B?dURLd0t1WWlaN2t1VC8wMXZwTXlvS2JyZCsvZC90MDZrYklCRjVMZTlGMGhw?=
 =?utf-8?B?WTRueEV6ZWxBS1ZZTlMyeU5yTHhFOWtSdFdBNnR0VnJaRmZzYU5FcEVXZVBw?=
 =?utf-8?B?ZVJGTGErUVUySE9OYXVpRDE5bjBkbEEySHBnVnVnMTNGUW45ZGpNZXBrNy9o?=
 =?utf-8?B?UXZubDJPRXQ3ck5iRURqUnY0MnJJMkRKNUc0UHd2c3lQY3BYYU9hc3NMeGhF?=
 =?utf-8?B?VWxYdXY2cGIxNjhuRFB5T0lBbzlNRWQyOXdVVWlyb1JxaWdoRXRQbnZ3MkRT?=
 =?utf-8?B?Vyt1TmR0bG5CNHArNjZvMDdyTWdSNjFXUmJqQ0hpdlEvb0RYdi9Pc3dkY1Fr?=
 =?utf-8?B?b1FXQU5vcjliS3ZSNENCUk44Q091MGg1NEcycUpPWHBmcDdFVGtUNEJnakQ2?=
 =?utf-8?B?Sm9vRm1xcDdUVis3dmhlSmcwN1NzS01mLzk5SUk0MHVzTlltWE44alRvMFFM?=
 =?utf-8?B?UlRFVmRwYVdGRUQybWRRSDdDTU9wQitCZytGa0p6b1BnVXJRelh5Rmprc09T?=
 =?utf-8?B?RjAwUDJaei9BQVVtUjVwNi9zU1lqTXZSSFh0NUJvcTQxQXc2TWcyaEdXbFIx?=
 =?utf-8?B?ZzlJaG9vZEE5UlRuQjRqTXdvME95blZnU3orM1ZLUDlrSEZHWS83YzNVbnJJ?=
 =?utf-8?B?aVlOblhLZUxGMEFJaU1PeXRvSitoMzZaL2V6ZmJhTFgwRWZhZm9LeHlSY2Y0?=
 =?utf-8?B?cEZFaGU5ZVRYaVdxemVobjRaTUZXL3JNZlN4TDc4QzhMQ3hIT0d4a2hMTno2?=
 =?utf-8?B?V0hyMzJCc2JBMEhCZjUyQk1iZW50NHA5dlQwV25WRnpEV3A0UGtER1NUdFEw?=
 =?utf-8?B?NTBUTEJwWmdlaWxZY3RnVFZxTVNyWUJQcWZqdk5tQm53b21DSzhVNHVBTTFX?=
 =?utf-8?B?akFZUi9sa0Z0SDdvSTAyNGpZOTFqb004ekd1ZXV6NmxkWldQc1dPNDNkcytO?=
 =?utf-8?B?SCtScmxTOUpQWW5mTDYyVFdvb21VSjNlUDkyNXFRYnVNZ0s4czRGY2FxeFh0?=
 =?utf-8?B?ZUZSSDNmK1RWNm9OOTMvYlpsaFR2Rms0aU1uZlExNXhQN2FhVlRCMzZkQktY?=
 =?utf-8?B?VWJxYlNjTnpHaTkrdnlrbHRoQ0c2ODJzeGd5UEhCNWF5UGtVSzJ0c2Vockg1?=
 =?utf-8?B?RjJ0T3VlN244MHpHVGJtNHVOcWgrRHdsQjZRRzkyeWd2TjZkQUFMK0hKQlY5?=
 =?utf-8?B?bGxQd1VEMXN5bCt1VzRKclRXcDZ0WDgvd0NBSEp2bVpTeExoT1lES3IvRk11?=
 =?utf-8?B?RllVZlpjVlVHaWZEeUpiWEpncUJyL3JkWHlvQUE2VnA1T1ZGUG5ya3NtZDFk?=
 =?utf-8?B?aVBsb1ZzT1JzYndDWHFlQmRsMVJOQURsQk53aCtNVytocC9Ha3hhaWloSUZC?=
 =?utf-8?B?dGp5MDNLanpET0VFVlBORXN2dDhOQWVieGJQRkhwNnJuenZQRkd0UWhkMHBr?=
 =?utf-8?B?WUxOejkrTVRjeFFhdUV1a21RVDVacWFDQy8wOUhjQ3ZtaUh4YmZHME85eDBX?=
 =?utf-8?B?Q0tBdDJDV3owVG0xOU9ZZ0JxQXcya2Q2eUc3M3BSOW9rQkk3eEJFUE5UQUJa?=
 =?utf-8?B?ZDRLbFMvZlhoUDIwaDRLWXJnVk9sNThTeG0vVjc3ZXFiRG9ISFcvTUMxcUUz?=
 =?utf-8?B?d0JOcDlTaldUU3AvQmpIN01FR0xlbDU3eXVuOUk5N0Q0N2pWZzgvNHRhL2I1?=
 =?utf-8?B?ZGVIYjRyT3o5RUFXb3l6NzQwS1dBVnQzYXluaVl0S1NFcURDM1RSMHlWZFhI?=
 =?utf-8?B?eGxMQUNVd3RCQnB1dEVUVXJ2QlpXREV6UFdVV2g4LzBsM1drV3lwbVUvc0ls?=
 =?utf-8?B?U2JUOGw2c2djcUFjYy94VDZBUzFnakNrSWFqcllUNGpML0EvbkVCN2gyaXdM?=
 =?utf-8?B?Q1NCakdEbERFLzFhd2hPR3NOYTNvejRWVlhsMWd6RVFpdDZNcEltb0hYays4?=
 =?utf-8?B?N1A2aVFLcjBITlk3S2FOUlNLTDJUV09MQU8rTlVKMkQ1dzkzYm1NQT09?=
X-Exchange-RoutingPolicyChecked: h44ADqW2vj4Dcs/3jwxizn8OfV9YLBAmfxw20TfsZdM6LNuMC2IXgIR9WQ4UH6CR+98qfE7yF2PvajKXHX1Y++oXSQo+pp3IxBoWIP5JO03e+M1afCvRdpvORR6fmYAYVvX8Jos6xt8OkidbOW3DevxZaPG+4lJ/tdpjss5OWMsnGcjKLcaHzFT16Mxglq/OPisgCCRTQlXrINaTec5HNt4fgNZsOiwvyE5fYBce9sE+EV7A257iW3FivZVgXQNcG7f2ylLU+PFJWL0pmyN7OD3pgRuyRaVTKY3ffwABzydwg5uddhn9uZeVuIHP1HEB2cN6dqRuV7L7XVCcoAKDSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4552170-9c0b-43ef-c101-08df36719c5e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:36:09.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlEk6uzxOJ61pw7qRuFGCdV7AKsH3kii+cbb6+bqGJZrYsTvC+qO2ZxJEV5iKY8RMh38Vs47NRoknQsMebzluA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Add support for SET_ERROR_THRESHOLD to set the custom error threshold
> value
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v6: Added normalize_nl_error() for SET_ERROR_THRESHOLD in send_command() (Soham)
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
> v2:Marked this command as response not required
> ---
>   lib/igt_drm_ras_nl.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_drm_ras_nl.h |  1 +
>   2 files changed, 40 insertions(+)
>
> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
> index d930b6e33..d23fce08f 100644
> --- a/lib/igt_drm_ras_nl.c
> +++ b/lib/igt_drm_ras_nl.c
> @@ -68,6 +68,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   		return NL_SKIP;
>   
>   	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> +		break;
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>   		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>   			return NL_SKIP;
> @@ -241,6 +243,7 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>   		ctx->response_required = true;
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>   		ret = nla_put_u32(msg,
>   				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>   				  ctx->node_id);
> @@ -256,6 +259,16 @@ static int send_command(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   			nlmsg_free(msg);
>   			return normalize_nl_error(ret);
>   		}
> +
> +		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
> +			ret = nla_put_u32(msg,
> +					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +					  ctx->error_threshold);
> +			if (ret < 0) {
> +				nlmsg_free(msg);
> +				return normalize_nl_error(ret);
> +			}
> +		}
>   		break;
>   	default:
>   		nlmsg_free(msg);
> @@ -351,6 +364,14 @@ static int validate_inputs(struct igt_drm_ras_nl_context *ctx, uint8_t cmd)
>   		return -EINVAL;
>   	}
>   
> +	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
> +	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
> +		igt_warn("Invalid error_threshold (%u) provided. "
> +			 "error_threshold should be >= 1 and <= 16.\n",
> +			 ctx->error_threshold);
> +		return -EINVAL;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -407,3 +428,21 @@ int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
> index 86cfd79d0..5c9be5b17 100644
> --- a/lib/igt_drm_ras_nl.h
> +++ b/lib/igt_drm_ras_nl.h
> @@ -53,6 +53,7 @@ void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
>   int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context *ctx);
> +int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
>   
>   #endif /* IGT_DRM_RAS_NL_H */
Overall LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
>   
