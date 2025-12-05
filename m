Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9C0D2F7D5
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 10:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D48F10E98C;
	Fri,  5 Dec 2025 10:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnMQGzCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED3310E98C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764930598; x=1796466598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IAQ/WURBvRIzqOTj3yksmQt1d9w+A8D9WvkwSzHWqZs=;
 b=JnMQGzCrWy1Nrf9HP5DInFftr5S9l8YcmWefx9d9qZNAZD0xuuX6GUmK
 x1MIPngYfo3oWkVUw4IRu3cJt77eaao4a5ix57z2ehhkMQYgODkeTJf2M
 0hAuMPS6TZGTpRG9+f/rLT7baFsDXFAhdQmG0JPFRXcN0hMHPLWuIkLBr
 1F5Z5l9fnf7ka6W/NJa92+dztUgRF2O7dkv9ssNIJJ3i8OLKns3rnFdsH
 +yaKVzf8WPvTuA3ZRu+7l58V43lDx/vyck3oMTnLqAdHEL9oxUeUnNFbK
 qS4Czt9yl+Bjkz1dSBiKpBEtVcszv5bS12TlrY1/KxvFgnihNaSG8rTsR g==;
X-CSE-ConnectionGUID: L/jXfHWNQ76se+OApDKEAw==
X-CSE-MsgGUID: SCAtBXUBSUqTGTTryrIwfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70582340"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="70582340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 02:29:57 -0800
X-CSE-ConnectionGUID: D3988eHNSx6W9bohPswylA==
X-CSE-MsgGUID: E+OTsWOmRfed3eaoKANy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199696678"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 02:29:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 02:29:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 02:29:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 02:29:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1wzTrfwStHBImSNIlMbWRK9jvBZVlePd23TWnF1oheTZbZXBbygkCIKu0IhML0Hp7YPlhUcjNfjCwWFVtqN2KEVFP4rG7Wy2WfyP+7rQgQWG6RndwcK/hNv1evKn1OXLCFQqkHmhhAned7f/ub8LusW2WjA3tJ6VpWrweAhbGA33DAzKjrStl3K48PVsaifq9GoBnwne0pixIMiFuY4UMqkqa6Y50V1xugHUdLdzC2SIxdUizqjgxRUAu72yXCeGi7qOw0dM+xcnJqWsHFRZqTYU/0DwoHaluM6qwqQ7SlSkmCTCgEdGYoX0IWS59HQXGQszmWEtjY56sSTO2jbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAQ/WURBvRIzqOTj3yksmQt1d9w+A8D9WvkwSzHWqZs=;
 b=QOeWqJuVsfWBf+GPU8DaGcfIyJHOpbN0nQRY7lC3KWJrvS3tX07LZYO56gxpyfoVDxgUzeoCbbU0DGl4jdQyGvhLdPZRgoj/Ol3WIInQnddTjq+i1vRZMvbIbOvPh2VV6zrvQGvqhwPwQKMp/uZm35YV1kAJ6E+5yD9uhlrOgpXBAZFasQZueks3c3M7w1j/nzSsIn79HfScbc0F5ABWNfQ9oero1SgDz8DJWG9vI0RnapEhvoAjnnCbGk6xStrthbRY0WivnezPTlUeiGM8cSOwF9SUEo6cbcxSadrjoMCuaCkxtBbmMqZi0VdT2u2ws0V3dmzPHH/rQZGLeyhEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by CO1PR11MB4898.namprd11.prod.outlook.com
 (2603:10b6:303:92::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 10:29:49 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::7d8a:7d6c:1fea:d900]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::7d8a:7d6c:1fea:d900%8]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 10:29:49 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>,
 "Tahvanainen, Jari" <jari.tahvanainen@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "adam.miszczak@linux.intel.com" <adam.miszczak@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 0/3] intel-ci: unify Xe and i915 block/test/lists
Thread-Topic: [PATCH i-g-t v2 0/3] intel-ci: unify Xe and i915 block/test/lists
Thread-Index: AQHcZWYY+CDmjGGE5UK621e6gQeXTrUS2VoA
Date: Fri, 5 Dec 2025 10:29:48 +0000
Message-ID: <bf1f0f61ec2cdc60ab176c5cc70dcbdcd03b500a.camel@intel.com>
References: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF75D68BA1B:EE_|CO1PR11MB4898:EE_
x-ms-office365-filtering-correlation-id: 38515e7c-fe7f-4bcf-1cdd-08de33e937e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MUVBZTg2NnJiUlZDL1BqL0VsUEc2QkdnR3VjQmhEQjdGQVZPcHNVM0FEUzJ5?=
 =?utf-8?B?NUhvci8vY3FYS3RDZndOMXFSWllRMFNDS0hlYUt6c3E1Z3NyTmYydHBnYnJI?=
 =?utf-8?B?c2VoWlNjVVNnYld6cDQwcWtiTnRJcTNtb0NyRXA1andYWnVoTEo0dzFrOTRL?=
 =?utf-8?B?Y1ZpZUVZWWZ4SlJDV2MyeWk0MlR3VE5PSUFMNWY4bisvZk5QYU5vajArSFh6?=
 =?utf-8?B?MEdncy9ONFV3MVFlY29jS0lCT05sUG0ySGFOM0IwUEQyb3NUVThGTU0xWTRY?=
 =?utf-8?B?NjJxT3h2cWloNHFZM1dFNDdGQ0FnVDFDbnIzRXdmR0UwRzhnMHJwd3R0RVlI?=
 =?utf-8?B?MkJrRkE2TUJiTWM4dVc2MGZrQy9Sb0hFUkNHRTI1dGorZkFWWldiaVBqS3NB?=
 =?utf-8?B?SlpEZUZ3b2tsZXNxNUt3S2I0WGFCeG5zR2liUnJaOHY3b3FsTTNNdHpKVnBT?=
 =?utf-8?B?OUNFcnBCOGlINk1SZ2FZV1V0cmVjUitEcU14UWNSeGhURWJkVncvaFVXOWw2?=
 =?utf-8?B?OU8wS3NxeXVWRWorVEpGSFhWcjlURVBYQ1BVT2ZEOW1RQzRLZ01uNTQ1dFQy?=
 =?utf-8?B?N3JzZitPUmJqQWd3S3dTWnE0NXdUR1BCZzgrSGc2U3BOUFJXbWZGQmVqZ25h?=
 =?utf-8?B?cmxhbC8veDBjUk0wdVNzRkRtdjg5QWdtckZudlc4bkdiM2hKZ2VucFFSS0dF?=
 =?utf-8?B?amJXU2llSE40c2s2SnNidVBDODJLK2dEZmxlWjJxZnFOaS9IRmNkeUUwaXZr?=
 =?utf-8?B?cWRIZlNZZGNBaEhjN3Rvb1U0M0U5dTZReEMxV3F0T1RSREdWcUpFd0FwbFpD?=
 =?utf-8?B?aHZ1VnBwRGMyajR5bnhuK1RoMkd1L3EwT3JFejZLUjQvM3J0ZE50YVRQQXJu?=
 =?utf-8?B?YzRqb1BuWldlZS9hYkZOTmxxNVBlTjhtRFp5eFRSR2VxTDdwamV6Q04rNG93?=
 =?utf-8?B?WWNJWWtSeDVwSG8zS0FtN0t4YXY1bG9xcTJlZXZuYm0zZjFoVWVPejVRUVBj?=
 =?utf-8?B?ejR5eHkyd2dOQmxWZ3RvOU9ZRGgzcVRPUE1FcE9WZVBkSTNDRWFYTjVwdjJa?=
 =?utf-8?B?bDlPWWgxOU0wVS9oTE5UREdValhSMnZjeDh1NUc4Qlh2dForbjNJZWxPVGZl?=
 =?utf-8?B?Qk45UXJ2RjhlUFREU0o4UkUwenNXb3FSUDd0NFFhTll0b3Fqd1d4L1ZVdEg5?=
 =?utf-8?B?aFBPSUpYT3NMOHR1VGRYdUhMd2hVTFJEY1NkWEVPaUZsZzZ0cG0zM0F2T1pJ?=
 =?utf-8?B?RjBUdXBPZWJyUlMxQWEyWTFEeElONXBpS0U0SDhRUXJQUi9RM2N3NVlWbjdU?=
 =?utf-8?B?UTVJQXlQcm9TeTdNWTdnR2FIeURYdUxZSnpVdmpuWUNqc1NHTzFrSVVmMmZ2?=
 =?utf-8?B?MkF5OXZsU0piMDJ3cFovNTFUNlhUNFA0NDNMSHBicmtUYUNpRnhaNzhOVDB6?=
 =?utf-8?B?WVZ3SWxKUk51c1JHenFrWkFxMFV1VjZGdGVCa3VPT3kxUUgveFJEYkFKWEpO?=
 =?utf-8?B?WWpUMXZWT05Dc0JNUnJvSC9oeWVIRXBPc0JON0k3L0hObWlIK1dKaHRLUE5Q?=
 =?utf-8?B?a2ZsSDl0MmJ4ZTE0c2hVTHdUN1d5WW9hWU9JN0JvUlJRNHEwa2puK3N6SC9i?=
 =?utf-8?B?QTQ2WTdqMDNNUkV0aFRJd1NNa0pEUUJUd21PdnpFOWVNU1hycmwwYjkxL0tM?=
 =?utf-8?B?NHNyN3RWZ2l2c1oyL0srV0VsZVBxL3J0VVF1ejdHT0hxMEFweGNFOXpxRWRJ?=
 =?utf-8?B?S3M3b3lWSy9XM2hiRXJGRXp0amJXLzlxVFgydFh0SldNTzNlbFdaMzdsVWw5?=
 =?utf-8?B?NEk5RjMxOThUVzlhbUUvU0ViNnJvQWRTd1RJTWI0UzY1STJQWE1jZGU0c2ZE?=
 =?utf-8?B?M3p4b3ZDYXJVT20yRktXUGZvU2wxZEg3RmsvMEphRG1sL1ZKT3dwL2xPQjFp?=
 =?utf-8?B?VjBTM1prMEpvR0lDMUNieXZOVC9SR0xwQTM2K3hZbTI4azdnWUYrMHN2SjhX?=
 =?utf-8?B?eXUxSGY1RnBwYnZNa0xpMHU3dkpzR2g4YTc0SGUzcHBJcTZkSExENnZURC9n?=
 =?utf-8?Q?qlzOjI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF75D68BA1B.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTlxblhmREZ0WjVicHBNaEpNdExnNGdhamdRYkFwRVBQUTA2SzhRaWpLVEk3?=
 =?utf-8?B?eGNmQUJJZ0RKYndQNCtuOHNpaHhZcm9ab3BIdlZla3FLWjQ5UU0yM3dJT1hL?=
 =?utf-8?B?N3NINDkycUpCSC80bUo5K0hnbXJrVjdrV2xId2JtcUpZQS9NaWpwSzRVZSsr?=
 =?utf-8?B?UWo4NWcrREh2Ym4wdGh4T2VjUnU0WXJNSW1CUWJTS0F3V0VKK3Vvd3JLNzMx?=
 =?utf-8?B?YVp5b2Y5L3FUS0QrTFpSeEZMZ0pPVndIclBjTTkxc3YxVVFqOTNYVDFSMTF4?=
 =?utf-8?B?TUNvb0NIUHRrcElxNVkveTYrYUZ3dFBQbXdjbHR3d0FrbjNMTjZFNDBWUmpL?=
 =?utf-8?B?aGdyVnRaWjZlZlZwZ1VzM2o2bmpGalUxUXVaRm14ekdkb2lHMUVtMk1aQXd3?=
 =?utf-8?B?Q05FMWNEeTgwTXFNYWh3V2NPTG1OUHRTNXd2NWVPMjREd255T1hVWWlLVFFx?=
 =?utf-8?B?c3FZYjFwWkpKcEVQOWVvRzlDOFNzcmhsdGxSbUhXem1qNlI5ZFcwdmd6T1N0?=
 =?utf-8?B?T0t5WklJWHdjcUNCaG5UMVk4YzNESWVtQ3JaNkVmc1Rjc2JiT3dKNDEvdFA2?=
 =?utf-8?B?VWZTSEFXL1RkemRocktLYkEzWDdNUjIyK0RIRDJRRHZ5SFZxSHZVZFF6NXF5?=
 =?utf-8?B?Y3d6ZWd5UGpTdXlFTE1xZjNmM0dvRklua0drZSs2VFBvbm9QYVN4RWlsUFFz?=
 =?utf-8?B?OXIxcWJDQkNBaTcyWDZSNERYb05wZHVaaFBvSjYrWEVvb0ozaExLa0pUN01t?=
 =?utf-8?B?bWRQNklNb1VIaTlaTmZoU1d3RGZlcWRmUGhNMHZ6YjROdEEvZis3S0VmZWky?=
 =?utf-8?B?bmpTR0sxTk85aHRUYTA4eVRTWlpKYU5ST0RYRk9zWTZlSzB2TzZpcmdKaW83?=
 =?utf-8?B?aW5NNVNsMzRTei9YbFZLU0ZCZkQ4bmhTS05USUdhd1NycjkxWE1IdUZTZCs3?=
 =?utf-8?B?Q21HZC9qcVJQWWN5UTNOdEFuanBhQitEdDBwZUw0a2lJcXBBVllXejJSNGM2?=
 =?utf-8?B?RE1kVzFxWDNFRjNFUkFqSFBDajhCMktWcHljdXViVXhnMlAvaHplWUJ4anFk?=
 =?utf-8?B?N0R2ZkhIT0RvdjY5MDNNNEtMQ1J5WFBzQ0Mwa0JtcTJWR2hwVVhuVjRGOG9y?=
 =?utf-8?B?MUx2Qi9zNDAxQlNHUTc0SVEraWczZjFPVHkwVUw3N3lDNG5SdURseGtUc3BR?=
 =?utf-8?B?aHZxQ0NoR1FELzhBOTBHbVdIU2dqdXJidzhlclBjb2o4S1UwVHhsMm9kL2Vq?=
 =?utf-8?B?SGlHc0RmN3B2N2pVOEVQRktTTTJuK0RibG02TGtWWGdmdTB4ODkwWk5DVHNW?=
 =?utf-8?B?Y2lpbjZmdXZTWFlXSlpGaEFOSkFQYmdRVUFqbWg0MEs5VERnRGpOSW0xTUQv?=
 =?utf-8?B?dFJVQWtFL1JwUkN3dHAzT2ZtVlh6aXdOS3BlZWFYOC8wd012WVN2NEh5cHdT?=
 =?utf-8?B?QUpNWDJWV0QweEg5TjlnV0NjR1c5UjR0dWJsRHFhVzVQYWtkSFAyVmtycVlh?=
 =?utf-8?B?WnJYUDRJUHg0akVqR1g3dTdremp5NGl4aXovMEZ0bWVYUDUxOFBlOGd4MnNi?=
 =?utf-8?B?VDNYbTRXWjZYT1dRbjkwNk9pVnU2MVBJQXZzV1UyNkxKakN5T0Q0bitrRXFl?=
 =?utf-8?B?c2daKzBpUEVrNVR2VjdrVk9RNjlVVnlyQ1BiNFdMd250WDU0MGtzQmdlUVBU?=
 =?utf-8?B?RTh4ZnJRMGhyRVdxK0hDUHI0c3cwV2QxdURjZXhGU1lKQ3BZbXF0UUtCbDFE?=
 =?utf-8?B?TlNIR1Q4cXEySXZiUVZ4TWptL3ZEeVhBM3hZTVlzM0NEcFUxcTZRVXlzWnFk?=
 =?utf-8?B?MC9YQ0Nzb1l4Q0pFUjFqc29rYktXUXVuNXovdmVRRHJnR1BSTlM5cXFYWWhD?=
 =?utf-8?B?NklMYjl4UU9qaVpIZHd0THJZZkdCaDlQWFdkN0MySGlWa0JXQytJWS82L0tt?=
 =?utf-8?B?dUZFb25xV29DODh0VzJWT29tNm9vMHJxa2E1Slk5QnBYUUY2V3dVZFhZWGRa?=
 =?utf-8?B?S3NKcjViV2wveThzZUdZNkNLYVovUU9FNkFRTlRjR3VtbjE1eXlsRFVWNWdk?=
 =?utf-8?B?OE4zdUNqVExYNDBzdUFLSWE4M3B3T0NJbjFBTGxoVHFvRzlpMGJQcXM0NHda?=
 =?utf-8?B?d256VEU4UVc5UWJOZmxtdFlaTU5FbEp2S2hXQlZiMnY0NWF1MklxM0hNeHoz?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F010A81D16E6E144A3EB6375B1697728@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38515e7c-fe7f-4bcf-1cdd-08de33e937e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 10:29:49.0754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRE1VW8n7gz8yKQYF3hP2gUPd5rzxtnNUT4yuWpvYbOjy1Gm5KfUaAdMyS2PQmGgqnjY2sSHYKf4h71pMxsrng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

Rm9yIHRoZSBzZXJpZXM6DQoNClJldmlld2VkLWJ5OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25v
cEBpbnRlbC5jb20+DQoNCk9uIFRodSwgMjAyNS0xMi0wNCBhdCAyMjozNiArMDEwMCwgS2FtaWwg
S29uaWVjem55IHdyb3RlOg0KPiBVbmlmeSBuYW1lIGZvciB4ZSBibG9jay90ZXN0bGlzdHMgaW50
byB4ZS5yZXN0LW9mLW5hbWUNCj4gUmVuYW1lIGFsc28gaTkxNS5jaGFtZWxpdW0tb25seS50ZXN0
bGlzdCBpbnRvIG1haW4gb25lIHdpdGhvdXQNCj4gcHJlZml4IGFuZCBjcmVhdGUgdHdvIHN5bWxp
bmtzIGZvciBpdC4NCj4gDQo+IHYyOiBhZGQgbmV3IHN5bWxpbmtzIHRvIG1lc29uLmJidWlsZCBp
biBwYXRjaCAyIChSeXN6YXJkKQ0KPiANCj4gQ2M6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9w
QGludGVsLmNvbT4NCj4gQ2M6IEphcmkgVGFodmFuYWluZW4gPGphcmkudGFodmFuYWluZW5AaW50
ZWwuY29tPg0KPiBDYzogS2FydGhpayBCIFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4NCj4gQ2M6
IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IENjOiBKYWt1YiBLb2xh
a293c2tpIDxqYWt1YjEua29sYWtvd3NraUBpbnRlbC5jb20+DQo+IENjOiBBZGFtIE1pc3pjemFr
IDxhZGFtLm1pc3pjemFrQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hcmNpbiBCZXJuYXRvd2lj
eiA8bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEx1a2FzeiBMYWd1
bmEgPGx1a2Fzei5sYWd1bmFAaW50ZWwuY29tPg0KPiBDYzogU2F0eWFuYXJheWFuYSBLIFYgUCA8
c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IENjOiBNYXJjaW4gQmVybmF0b3dpY3og
PG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBLYW1pbCBLb25pZWN6
bnkgKDMpOg0KPiAgIGludGVsLWNpOiB1bmlmeSBYZSBsaXN0cyBuYW1pbmcNCj4gICBpbnRlbC1j
aTogQWRkIHN5bWxpbmtzIGZvciBYZSBsaXN0cw0KPiAgIGludGVsLWNpOiB1bmlmeSBjaGFtZWxp
dW0gdGVzdGxpc3QNCj4gDQo+ICB0ZXN0cy9pbnRlbC1jaS9jaGFtZWxpdW0tb25seS50ZXN0bGlz
dCAgICAgICAgfCAgNzAgKysrKy0NCj4gIHRlc3RzL2ludGVsLWNpL2k5MTUuY2hhbWVsaXVtLW9u
bHkudGVzdGxpc3QgICB8ICA3MCArLS0tLQ0KPiAgdGVzdHMvaW50ZWwtY2kvbWVzb24uYnVpbGQg
ICAgICAgICAgICAgICAgICAgIHwgICA5ICstDQo+ICAuLi4veGUtZmFzdC1mZWVkYmFjay1jaGFt
ZWxpdW0tb25seS50ZXN0bGlzdCAgfCAgMTYgKy0NCj4gIHRlc3RzL2ludGVsLWNpL3hlLWZhc3Qt
ZmVlZGJhY2sudGVzdGxpc3QgICAgICB8IDI3OCArLS0tLS0tLS0tLS0tLS0tLS0NCj4gIHRlc3Rz
L2ludGVsLWNpL3hlLXNyaW92LXZmLmJsb2NrbGlzdC50eHQgICAgICB8ICA2MCArLS0tDQo+ICB0
ZXN0cy9pbnRlbC1jaS94ZS1zcmlvdi12bS5ibG9ja2xpc3QudHh0ICAgICAgfCAgNjEgKy0tLQ0K
PiAgdGVzdHMvaW50ZWwtY2kveGUuY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QgICAgIHwgICAxICsN
Cj4gIC4uLi94ZS5mYXN0LWZlZWRiYWNrLWNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0ICB8ICAxNSAr
DQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS5mYXN0LWZlZWRiYWNrLnRlc3RsaXN0ICAgICAgfCAyNzcg
KysrKysrKysrKysrKysrKysNCj4gIHRlc3RzL2ludGVsLWNpL3hlLnNyaW92LXZmLmJsb2NrbGlz
dC50eHQgICAgICB8ICA1OSArKysrDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS5zcmlvdi12bS5ibG9j
a2xpc3QudHh0ICAgICAgfCAgNjAgKysrKw0KPiAgdGVzdHMvaW50ZWwva21zX3Rlc3RfY29uZmln
Lmpzb24gICAgICAgICAgICAgIHwgICA2ICstDQo+ICB0ZXN0cy9pbnRlbC94ZV90ZXN0X2NvbmZp
Zy5qc29uICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gIDE0IGZpbGVzIGNoYW5nZWQsIDQ5OCBp
bnNlcnRpb25zKCspLCA0OTAgZGVsZXRpb25zKC0pDQo+ICBtb2RlIGNoYW5nZSAxMjAwMDAgPT4g
MTAwNjQ0IHRlc3RzL2ludGVsLWNpL2NoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+ICBtb2RlIGNo
YW5nZSAxMDA2NDQgPT4gMTIwMDAwIHRlc3RzL2ludGVsLWNpL2k5MTUuY2hhbWVsaXVtLW9ubHku
dGVzdGxpc3QNCj4gIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMjAwMDAgdGVzdHMvaW50ZWwtY2kv
eGUtZmFzdC1mZWVkYmFjay1jaGFtZWxpdW0tb25seS50ZXN0bGlzdA0KPiAgbW9kZSBjaGFuZ2Ug
MTAwNjQ0ID0+IDEyMDAwMCB0ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLnRlc3RsaXN0
DQo+ICBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTIwMDAwIHRlc3RzL2ludGVsLWNpL3hlLXNyaW92
LXZmLmJsb2NrbGlzdC50eHQNCj4gIG1vZGUgY2hhbmdlIDEwMDY0NCA9PiAxMjAwMDAgdGVzdHMv
aW50ZWwtY2kveGUtc3Jpb3Ytdm0uYmxvY2tsaXN0LnR4dA0KPiAgY3JlYXRlIG1vZGUgMTIwMDAw
IHRlc3RzL2ludGVsLWNpL3hlLmNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0DQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdGVzdHMvaW50ZWwtY2kveGUuZmFzdC1mZWVkYmFjay1jaGFtZWxpdW0tb25seS50
ZXN0bGlzdA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsLWNpL3hlLmZhc3QtZmVl
ZGJhY2sudGVzdGxpc3QNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC1jaS94ZS5z
cmlvdi12Zi5ibG9ja2xpc3QudHh0DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwt
Y2kveGUuc3Jpb3Ytdm0uYmxvY2tsaXN0LnR4dA0K
