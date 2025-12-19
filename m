Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ED7D74951
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 04:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8514510EB90;
	Fri, 19 Dec 2025 04:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0iNCue0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A0610EB11;
 Fri, 19 Dec 2025 04:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766117460; x=1797653460;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QJI9pCEb5zPvWFxF8igh80Rjv5Fq4MefEbiUomC0PoI=;
 b=W0iNCue0Putrvlq3UMA1ioCfSnyJDRvJUGEkRiqMgI4gSj+PnHtG9QN+
 nuFx29hhrB8TjzDXnI5y09iiR+Ibtfw7DYXN1am+Q9enTRVPn73Dzj8Ba
 SRpYFoT//7q2i5GF73xDAVCuQ2Au82pyQhJ10cq3AyWsFS9vpcM0ZbYSZ
 kEXTrH8og3K9Vlfp9d9vJrDA9Ws2KO2p0HHVWxTs63tfwjhO9tcRdfc1K
 kZI+3sVMlPxjltp0un4dvLlzGSUyCOJWaArND5oXsNYmdNr0wXGBGD0Fv
 Y4v5Mgf7/yTR4GYjU48eNt8cF5e8O5fAAXfo5tUGRBnTqg2OcSebFXG9o g==;
X-CSE-ConnectionGUID: TCEC4XepS+uJz7Ulb+/d1A==
X-CSE-MsgGUID: cWZvFlynTRaTr5PUefYjbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93553556"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93553556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 20:10:59 -0800
X-CSE-ConnectionGUID: fgXPCMpFQIu6PO+4XIsqxg==
X-CSE-MsgGUID: DWEjSuXuTNOesDkMuKJGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="229442043"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 20:10:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 20:10:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 20:10:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 20:10:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ0jCOWjW4/MqdTSJxbd4lVbQEkIPLH8DGV8YBLAuUj03FGYBwch56OB+tdeWJ91Nu36KFHtw5IkfVPIgh+SESC8+bQIi7j8E4gXWru4b19HAdfzJoLiVGz/CpnZ6kHrnxh7iUmc608axEo+P5IaI3aBLzLTcmzQ1DbSJmjOMd47Y5VwSb7W7jIF2jz32ZhWD33LkjJ69C5hIDW9nNoudH4ul/8zMiT+B2/sN+digPHfSUTFd6y597FYKDoj1vN8mSh3FCy24tqWQQcjWXzajI9V317m0mshrpwyrhUij3WRcRVj0cdRZNq6QQ53WTxYBTE2DRaKSndUnbudyIwh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJI9pCEb5zPvWFxF8igh80Rjv5Fq4MefEbiUomC0PoI=;
 b=E+PzaZO82qQX1bogGiKkNaR+ghOIjNH4iPqe3vHa1tjOGCARzW+kfZdrCnPm7J2RMhpFJyqnVP8kTF9ytubHx3aohkcUHmb9XZLqaYsURWcPxZ2Qny1nns/ujqc+O9a4yNCcdc6w7zjzEroTVb7rGOGBBB8BWCkXJzADt6kvrserz476ebRhMLNhpTkWzIaFfU7nBhjwHaCc/QK/2AeyxFZdJKH8twv7C2wkdlf+uiWRUiKFogP24HgdnFbqVRf4wXFAqeSLqoSPOCZEuWEp3ftlu6WfwG7TZRwDHvc5gHbXWLu7VIeHeHWLIFYBnSvyaOJheGqzneMaPZulnKX2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 04:10:55 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 04:10:55 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2dlbV9sbWVtX3N3YXBwaW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9t?=
 =?utf-8?Q?_oom-killer?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2Vt?=
 =?utf-8?B?X2xtZW1fc3dhcHBpbmc6IEF2b2lkIGZhbHNlIGZhaWx1cmVzIGZyb20gb29t?=
 =?utf-8?Q?-killer?=
Thread-Index: AQHccARKNguIKplT+UuyoPyjij1rkbUoWn+Q
Date: Fri, 19 Dec 2025 04:10:55 +0000
Message-ID: <CH0PR11MB54917A235B5D649C7666745BEFA9A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251217145110.131121-2-janusz.krzysztofik@linux.intel.com>
 <176601860648.97606.18400949079259535367@a3b018990fe9>
 <6112761.MhkbZ0Pkbq@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <6112761.MhkbZ0Pkbq@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH7PR11MB8456:EE_
x-ms-office365-filtering-correlation-id: a6741021-d1e4-485c-d4c1-08de3eb49b55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?SnZpWTB3SzJyQmx2YzQwZUdkNkNQbkVJTkd4L2VkbUdMYXFjVFpFaUZIdWN2?=
 =?utf-8?B?ZlU0RmdRN0dWa3Jia21TY3VZOTZ5Q21jWXNKSVA2a0NaVXE4OVA5aTJrd2dI?=
 =?utf-8?B?cER0SmpFYS9jb3ErMlJwVjljMHA5YU1UbitDVUxZWFFlS0doT1BqTnFHSUtR?=
 =?utf-8?B?THlFaWdHN1A2TG9uNDRweUdKelpiK1kwZkxhMGc1OTErMUIwc1IvUTNCZWRa?=
 =?utf-8?B?QVpaWW1vUjZ0dWhaZ3RlQUVvUkF0Y1JlNTFhM2xJTjRYejRkbjZ5Qnh0WUdC?=
 =?utf-8?B?UXl1VktNb3ZxN0pLRDUwY2pIb05OaENyNnMrYk5CMGwvbnMyWDd5WjRSV2ky?=
 =?utf-8?B?TVo5REFuZHp6d0JBaGFXWjlodndCZFdmV1ZhbjdoRnlUWU1kQW95VXNaU0tq?=
 =?utf-8?B?eEVoSXMzWFFCREx5YVJjSEZCQTErNmF3MTRPS24rQkhaZDgya2wxRElzYmFH?=
 =?utf-8?B?MlRHdG9GYnNibmZONlE1RTFuWXJ4SVdvOXpxWDJHNG5wOUxrcHVtb1pQY1Y5?=
 =?utf-8?B?YWtFa3czdHRLN2xXTnVXRWxoQ0JGYzJsSnluQk1IQm9RR3MxRFZ3MnhvRWs1?=
 =?utf-8?B?RGVjSWpUWFFRMCt0ZW0xT0xTMWZtRFJsSHRMNDJoQXdld0JFWDg2aUM3U0ha?=
 =?utf-8?B?anM3U1J4Rkd2OEg1cVlEUlEyVlM2OTJQelJ1eEdXenUvaFRkZFBHMTgzS2dU?=
 =?utf-8?B?aC9LRFNUMENqeGpTYXJFaHJCQkRKS1dGMExLWnc2b2JSZFpsTUE0cElRUlI3?=
 =?utf-8?B?SGx0YUQ2THZUYVoxZVlKaTBLMituazJBaVZPNmJwYlhHK05QZG05R3EwRXkx?=
 =?utf-8?B?NE5TaXUyQ0tkamZaVDZZeHVrUU5mWXBOR2Zma1h0bVFFZTV4emFFZWhwOHht?=
 =?utf-8?B?NG03SVlBNUpPSUVGZUdIdDhnS1VDYkxlZ256Z2VPMDNJa3JjeTZyR3RHWjJZ?=
 =?utf-8?B?TkFHeDROTUp2Vk54MjdpQnZ2L244OGI5cmNkVTVEL0hsVDVsUENhVnFjMjRZ?=
 =?utf-8?B?NWZHTjJBSFVCMUs2TTFNVzVsWmNOSHRvTlFSZEJhVGlNRmlpTm1TYkwzakxx?=
 =?utf-8?B?dXlyL0l6Ym94a0NvZEx1empkRklJMm5jd3ZuSmJBUktSVHZMTjBxSERjYk9s?=
 =?utf-8?B?enJKS2pmQ3FRVjNwTDg1QUs5Z3JtdHV2MWhWRWswMXVqVFF4eGRLMlZhSWlD?=
 =?utf-8?B?TXg5b0ZqbG1KSmFpL3RtdFJKYVRzZ2t0TzVOeDFhS0tWK1VoTWw4L21KMnR6?=
 =?utf-8?B?TWtCNkZId0tkTTZlZVdOK1UxZFhSUjIwNmF1QkQvZUo1c0JLemRXT3BBYWpj?=
 =?utf-8?B?Y1VVd0ZIQkRYeXgyMHc4dnlzUEFYLzI4SUk2NnZxbnUzTzdKSjNrMTVmbjRl?=
 =?utf-8?B?QVR4WGcrZjhqbnVVSUE4bEpKeGZJZjBYTWsvWGRTV3pDV0VLMmp5OVpOd2hN?=
 =?utf-8?B?czR2WGRlcmFMaWlMdXJUdDUyVHFPWTdxN29pWVNTajZDcEk2LzBwckV4U3Rq?=
 =?utf-8?B?TzZ2TjBveUFzRkc1K3pQWVJFTTJCRzNPL2MraGtnelBrMDIwMDFaTzJEOWxC?=
 =?utf-8?B?cHJvZWRWVUhMdTBLejVhaU9hVk5DTFhaYWNMVHNPd24vdmNYWFFWQ1hMUCtO?=
 =?utf-8?B?TjQzd0h6MSt6RnhEZ3FWU2xEd280eXl2WU1QbmlGQ1dDY3lVU05VSFBtVC9P?=
 =?utf-8?B?bWZVMzdwcFhDVFErRnFscXNxUmhJQ0lrNTY4U3k3TnNta3QxdnlIWWJzTmhv?=
 =?utf-8?B?b1JOTFJVYndqTW9FTk1PeUVuV1V1aW8yekFxTnF4dGpMQllDbTJKQktTWkt3?=
 =?utf-8?B?VEhQZnRpUWRsMlIzZk9OVkVwTG0wVjFSeDRnWHNFT3NIRDI4Z2p2eDdtRUpl?=
 =?utf-8?B?MDFKQ3FpM2ZEcDhZUVBSYnhsT0hzWXBaMU5USklESkVOek8wdjlsM1FWZE9Y?=
 =?utf-8?B?TVlrTVhkVUtUMzBjOHpzQXVKNzgwK3pJZHZBbWkyTmZIKzIweklBdkt5WWkv?=
 =?utf-8?B?K3NGN2JkOStRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEFOdkZLT3VtVVpyV3N6MzdjMitzalZTQmdmLytuMzJTdEs3azhVMm0xdDBH?=
 =?utf-8?B?Z1dPUTNQSXkvKzQ1WXRFYVQveTJEL0F2QytNZzJKTVZibmZKNWhDUTA4T3Fy?=
 =?utf-8?B?cFBvMmp4MUdITUEzMXkwL09jRjM2SnRDUXVyajBhd2hlanMzbmN0dmtCRnhu?=
 =?utf-8?B?ekJHTWJxY0h2VHBkenMvazJzbzFQWTRENzhNSU9GS3p1MENRYW1NNmpXUmhO?=
 =?utf-8?B?L2FiaExzQmhPdUlpcFM5L2pGa203ODY3N29mdjB4cUtzYzNZb3dBcE9zc1Yw?=
 =?utf-8?B?aVFPR0tkN0NkM05VS1RmelBxcXVoNTFldmkzUGJUNVRuNnFuZGRkcElDV2ZK?=
 =?utf-8?B?Y1R4RTB5ZFpvcTN0KzlUbE1icDdWaVNCT1JIRWd4T2VucmxqYmZiMUZTbGlS?=
 =?utf-8?B?TUpiSU1EZ292aTNlYVdVLzJ6YjFyNnZ6VVZPb1BoOTFGUXlITTRSWHJVbUcv?=
 =?utf-8?B?b2ZNQ1lrWlpqVWwzNkxQOE8zSmZlOGlhdGFJZFkwd2t6ek9nanJPWk4zMm44?=
 =?utf-8?B?T1FOVjZ5YytaT2tGc1VXM1pseFVVaFJOV092L2xyQW1TVTNCSXBUek5rRzJ4?=
 =?utf-8?B?bi9tNVM1aWVDVExjdlI5QS9ReDJ2eTJYckxFMThvUFJYcTVoenI2NW9WRytr?=
 =?utf-8?B?d2JKZDVXMjltUkNwYTNrV0x4dk5wTS9ydm1NQWhkM3ZNdGhvWGI5M2pteGFa?=
 =?utf-8?B?ZGMzSzFWZUxkY3ZMeVNVc1Fmd2drM2RkVjF6QURWcnF4WkRrajBtcXkycStk?=
 =?utf-8?B?d2RReDFyMi94NmRGMDJWZ1ZrdGgzZWdkUUVRQ2Foa3hWN0d4eGk3UmhQdWxy?=
 =?utf-8?B?cHBmQWFxTmF6NzloVEFGWGN2ZjJYRnBoNU1KS0s2TllTaklyWGoyN3MyalNP?=
 =?utf-8?B?b0NUTlVJWmRkUFBTRXFxenpsY2RjUkpmYWh1TmpxWEk4Zk83VEQxMXJIWTNY?=
 =?utf-8?B?TkZUK3RLTlNSRSs4d0pXV0hDVkxHWk90ZGxoeG91OUVzZVdUNC9wTFpaMnJT?=
 =?utf-8?B?Z1F2TXNxSHduOUhZdks0WTRNNzBWenVZM3JxcFhjVTNMeDJYV25iaVVmYmNa?=
 =?utf-8?B?KzlMRE5QcWZsUVdBWGdEVmhtUDhPUk1GMi9uRXJrVExVZmE4ci8rd2JTTkN4?=
 =?utf-8?B?M0NoajJpQXUxWGhyZTJKWGZ1emI0S0tFcnczR1dCQnczUE5Oc20wNE9Ed0h6?=
 =?utf-8?B?U0F1TmNMbEVFZXJTcThOZGhvZmQybUZIa0cvN2xmaW5ZTnlORDF4ZGh0eGZO?=
 =?utf-8?B?MlA1cFlubXM4Qnk2dEhMemJuTjJxV1BzRnFPV1E1cnB4aTFWMURIcFNlUUpk?=
 =?utf-8?B?aFVWY0ppaGxMK09ybkxwUHZjUzF4Tm9iOTVJVDZUTk9hU3JBa0RFaEVUdklY?=
 =?utf-8?B?eXJXUEQzc0hxSGtKWUxaU1VRcjJvZ1FSa1ZPdnFBVk1nSi9BSi9uRTJwVk9k?=
 =?utf-8?B?eSs1MElKY0dESHM5WDh3QzZXQzd3Y1FQbmVJdmhXWXRJWDZ5UWZHQ2R4RE1C?=
 =?utf-8?B?aVIvMXFtQXpyNWtuSVZLVEdHLzUycC9TcDF5cXJ5STBmT2xSUkwxQ0xDZnFW?=
 =?utf-8?B?WmR6MUppUlBvRVR3eCs1UjRlSXRCN2Fyd1NUZWMvTkNUcnliVTN1SlhpSUNK?=
 =?utf-8?B?L0wrRzU5WVhUNHZNL1dUZnpyd2p2enhHWU5Ca3lYcWU0MzQyei9GWk5VY1Mz?=
 =?utf-8?B?bkVyK05XVW1FSUN6amdIMDJwd2xsUmhla0p5VmpaM0Z5bWVoRVprSkk4M1hY?=
 =?utf-8?B?cXdnT3E4TGdITVIyNmNWVmtQRENKUUgrZkFVemExSHN1eTRGdFN6K0lVWkJB?=
 =?utf-8?B?cTZtTXBKb3hFL1BvTnBZSHFmT1M2QXJzRm5XUnFlV2lic0F4SWFDcituc0RG?=
 =?utf-8?B?S0FQWEdvSHlIRkUwZnNVamdCMXlDRHZERjhkN0t5elltc3h3Nk96bjZaSzZK?=
 =?utf-8?B?RTJIWENEajdLMHJ4SEZTT2x2d0QzNXFFQTZRSUFQdTJBTmNLZURMOERya1Y0?=
 =?utf-8?B?OXJ4T1VvbDE2elk3UjJxS3FCSE52R0ExU2xyd0w0YXNlRUpuM2pSZXE5WFlV?=
 =?utf-8?B?R29FSmdGcmwwM0dsUUZLZDlFbDdLNzBmRWFYZklEaVNHbnQ4NnNoZTRSc2Yy?=
 =?utf-8?B?M2tkVGRyVm16RXNKVExpN0JBOGtGcW9UUVhWenpxMTc4MFF4TVJXM1pyNEZr?=
 =?utf-8?Q?7OtdTEFKolqI0Xc7KdESL8E/XGcY1OCalqeMX9S0PnzI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6741021-d1e4-485c-d4c1-08de3eb49b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 04:10:55.4274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUI7C/JIvl5ZdTlMXe/PXQkCOa0akFwLwhlEq6Rf1tl4ilqpIqU8QzXzLkTc3n4wmoeTjzFTZmE4wByYCCxnQnTawzSRhKbkLGjaXkXDrSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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

SGksDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1OTE2MC8NCmk5
MTUuQ0kuRlVMTCAtIFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFudXN6IEtyenlzenRv
ZmlrDQpTZW50OiAxOCBEZWNlbWJlciAyMDI1IDE1OjI0DQpUbzogSTkxNS1jaS1pbmZyYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3Vi
amVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL2dlbV9s
bWVtX3N3YXBwaW5nOiBBdm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9tIG9vbS1raWxsZXINCg0KSGkg
STkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcsDQoNCk9uIFRodXJzZGF5LCAxOCBE
ZWNlbWJlciAyMDI1IDAxOjQzOjI2IENFVCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBE
ZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVsL2dlbV9sbWVtX3N3YXBwaW5nOiBB
dm9pZCBmYWxzZSBmYWlsdXJlcyBmcm9tIG9vbS1raWxsZXINCj4gVVJMICAgOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1OTE2MC8NCj4gU3RhdGUgOiBmYWlsdXJl
DQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElH
VF84NjcwX2Z1bGwgLT4gSUdUUFdfMTQyMjhfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0t
DQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNv
bWluZyB3aXRoIElHVFBXXzE0MjI4X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVy
aWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFu
Z2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBp
biBJR1RQV18xNDIyOF9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2kt
aW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1l
bnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2
ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQyMjgvaW5kZXguaHRtbA0KPiANCj4gUGFydGlj
aXBhdGluZyBob3N0cyAoOSAtPiA5KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJs
ZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhl
IHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18x
NDIyOF9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJs
ZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGdlbV9leGVjX2JpZ0BzaW5nbGU6DQo+
ICAgICAtIHNoYXJkLW10bHA6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtETUVTRy1GQUlMXVsyXQ0K
PiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzg2
NzAvc2hhcmQtbXRscC0zL2lndEBnZW1fZXhlY19iaWdAc2luZ2xlLmh0bWwNCj4gICAgWzJdOiAN
Cj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDIyOC9z
aGFyZC1tdGxwLTQvaWd0QA0KPiBnZW1fZXhlY19iaWdAc2luZ2xlLmh0bWwNCg0KVGhlIGNoYW5n
ZSB1bmRlciB0aGlzIHByZS1tZXJnZSB0ZXN0aW5nIG1vZGlmaWVzIG9ubHkgZ2VtX2xtZW1fc3dh
cHBpbmcsIG5vdCBvdGhlciB0ZXN0cy4gIFRoZSBhYm92ZSBmYWlsdXJlIGlzIG5vdCByZWxhdGVk
LiAgUGxlYXNlIHVwZGF0ZSBmaWx0ZXJzIGFuZCByZS0gcmVwb3J0Lg0KDQpUaGFua3MsDQpKYW51
c3oNCg0KPiANCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KLi4uDQoNCg0K
DQo=
