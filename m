Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0708CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 04:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5A510E2AD;
	Wed, 10 Sep 2025 04:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrU4wmzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B444C10E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 04:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757479333; x=1789015333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CnB+jYeMbHG4geYIGVGkgnEnr43i8faSVIDc53fJ17A=;
 b=HrU4wmzGuKn86u0QsIvCxhcT7TzunN4A/vKYikqNcZQ7RDl4Qz8nBDUY
 DpnatyVSu56Oj/Tv0V37UOjCRKYOlCjnj9Btw8sy4v9kvAuEp5nuaYY/t
 r8Mi5e1acfbDgvnwHcj3Y+0pz6oNplk6MUIMpqu/MNZEkG5zkzqgHNC22
 WKuNKbOpI64572Q2WTkJFtSHyFGl3GfKizklKsil2Kvvm7pHXLkYQDtnR
 ntmU0zWnaTCGkXNU7AromO3onkgo3riXNBuR9Yt9beW80WqBKEtdewmSk
 EDHn2DmK/bLD2UShLsUL9r8IOkb7lBLXz23LC8J4KSyBM3PB0vLJpdQ2W A==;
X-CSE-ConnectionGUID: YD1wgVpHT+a3mSMpsNGbJg==
X-CSE-MsgGUID: M8PBcYXPTo+vTcTV9k98sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70395790"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="70395790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:42:12 -0700
X-CSE-ConnectionGUID: KQGPJ5F0T9Sm2gQP+hDEjw==
X-CSE-MsgGUID: cjr06V6TTCaJIXgGQVXwKQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:42:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:42:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 21:42:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiWloEBCfPYRLRvXgxqcvtr83gREZpww514czD0tkpgG4R+GWHq+J+pudA2hIg32IK6n66Km8fD17alJzqaKA2+cYIwFzknursLhMecrHcPJnKLwOHPsw+rKcRkKJHHO1nkwaan7rWcKT7ie/h0OELDa37ifEzvRpjehIDzsSfOKPFiNha0irHSGYQVWemVO8+dT3DqInvOPbtlwRBmX8JKFs6B2sUIYl7s/HMbnE5c9VJMusK2QcjIvUYW4XRjCnB2vspPt/Wvm2DU85aMAgOBKGGMwwii8AqyUYqj8vGTApGixudW7NU+BsNScRH/ais3Bo9Dyfjj4UezLkvWnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnB+jYeMbHG4geYIGVGkgnEnr43i8faSVIDc53fJ17A=;
 b=fHhbL2ux9FXQ/bBWxC6sf8YI3aBwGuDH6BPL85XFIdmiwwsRaMvkpmsnOz9/woK57bXL3R1C5P5XQlHfUsSfSS1ja/XWyRjJMmjFqv34Lri4d6H/1jlVbsmxR8TczLISViJgiT7w+1tXpPGbw2SOR0rKQVu3+3vjCqMFmkmHxY9z7deDgD4ligAbL+aRNh6Wo46tUY98LpVR3OPU54PJJ7XWeB7Pkd+wKbt707czxijC79F1uw6MDs9dlpbtXAz0s6yd/PjpfNTGyXv6AHBwGKOmmHcBH1dDoEUqeeYGmaOzAzg/pREl72Eor/yet+caBUmGwrvAKVGMD3aqyg41BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:42:03 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 04:42:03 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ramadeva, Dwarakanath" <dwarakanath.ramadeva@intel.com>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>, "Uttamchand, Gajendra"
 <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH v3 i-g-t 5/7] benchmarks/latency: Add xe_bo_create_destroy
 latency test
Thread-Topic: [PATCH v3 i-g-t 5/7] benchmarks/latency: Add
 xe_bo_create_destroy latency test
Thread-Index: AQHcIM8N4wuENbsMfEGYYGSHfPZY3LSL1+zQ
Date: Wed, 10 Sep 2025 04:42:03 +0000
Message-ID: <CH3PR11MB8434C97178BEC68DF6E4743A8D0EA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250908144314.42275-14-gajendra.uttamchand@intel.com>
In-Reply-To: <20250908144314.42275-14-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW3PR11MB4554:EE_
x-ms-office365-filtering-correlation-id: 86eb1967-61b0-42a1-8be4-08ddf0246396
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ay9iVWlCOWErYVUyelplSHVXODdGTUhaekU1ZGxHalRaSlllVUlIak9nRzBT?=
 =?utf-8?B?d2wwRkZONi9rMWNkaTBDQXIvdzczbjRYOWsxbEFjajJ5cldXTUw4dDY5bDJy?=
 =?utf-8?B?UFd2MG9nMVlvVlBwWnovQ2thSDR1N1FXU3B3LzZUWmV4ZnFoZUIycmhUNXpl?=
 =?utf-8?B?WFBhRU5mLzVVdGowTS9taXFNZVlFd1NSaExURzYrQmdDam4wU1VUcVFTYk1n?=
 =?utf-8?B?ZGxhV3NtQzJNMzAyNEROamh2b3dtam5rekdtVmczOHE4Y2ZydWtHQllHS2h6?=
 =?utf-8?B?YStRVUhGVWdUVEQvd1A4MmdSdzlRbUEzUXJaR1NxZ3JYNTFoeTZsNEVSM1FE?=
 =?utf-8?B?WjNzdnE2aWFmcUdQSktSSnozUHd6TFViTS9aTkRhZnJPRCtBZDU3RkgybmRX?=
 =?utf-8?B?S0taUWhObmMyME1VVjBxT3dTam5CSEpVNDhxNXgwRWpoYWx1YVQ2ZmpQTlFK?=
 =?utf-8?B?SE4zUHJyTlBEYStkZlZnZ0VyN09RbGJqeDM1SVN2SG9PZjFjalE5SWQxVW9S?=
 =?utf-8?B?NDE0QUo5eDNwVnhCMVI1a3kvYjg1Sk5MNEhxUHJ4azZqZ1pmaysyVFhWQXVn?=
 =?utf-8?B?c21LRUdBcFI5ejRnd2V3d3MxVEcwL21jV0xXMGkyUnZOSlhMTXFhNUpPYWZz?=
 =?utf-8?B?TndrZGpLSU5icWNDNzJFOXVTeVF0d1R5Y0ZaaXJDK01LeUdZdHhJcGhjTzdj?=
 =?utf-8?B?WS94OUF2OER0SjVvZFZMSmpORy90N2xUcWFZNUxpaGFvNDdnNUpPR1VCYnNj?=
 =?utf-8?B?T1RZbHFEZnlnL1hyRWptelBnOGRhOU9EODdWbDBhb2VYbEdYODdheU1UUjd0?=
 =?utf-8?B?QklLYjdyamluRmsyL1NvS3NpQXluVDNHWnpCMHZEVDF3ajlEeC9uRjFWUEJH?=
 =?utf-8?B?MUl6bTh6eFYrUWFkTEI2YXpIMmlnYUxYTTg2NWl3TEg5ZzZTOHFNYVJrQ2ti?=
 =?utf-8?B?aVU4Wm5HYmNtMWk1MHZwVW0yQ01BcHBMcWtFK25rbDVjaGttMXlXcit5eEtM?=
 =?utf-8?B?a3ZwNjlVV0JpVkJkQkdzd1ZRME9zZERZL29pT2lMS3JWejNsWGJvSEtVK0lZ?=
 =?utf-8?B?azRpU1RobnNDK3pVOW83clJzbDdIaHhRQkxNMWVJUDlGNVR0QXBHQStwN0Nn?=
 =?utf-8?B?b3dsWnJYWWlTbis2OWthYWJaSEJ3UTI0SUZHbGNkckwzQ3hBT1lrN2VFU3lM?=
 =?utf-8?B?dmZjTi9WSHczYUVlRnlYakoreExBaEZKTlpEWStFMHNwekRIa2UxUjllOEcx?=
 =?utf-8?B?NlpLeFE0VnNJWGxVTXhEb2pYU2lNUmlvaW45Z0NBdldkWkVHQzAzMEJuYWl3?=
 =?utf-8?B?UzZiU0ZwZTloUSt4NDRTYzVaRFhFdTRYYjRvVDZZOE42Ky9RbGZXYzhJbWlq?=
 =?utf-8?B?OTlGWktXVVpLVlRubVE2TCsyWFl4U0UvdU1sMHAxSFF1N3VZVWRuNysxTVNF?=
 =?utf-8?B?Y1QyZyt4Z09obFdnV1NILytXVTdFN1NpQjdnSmlabzJHU3AxVVZNVkw0aWJJ?=
 =?utf-8?B?cFh1bG1ZaE5GNzV2UUhCeDZ0L0lxdGsxSTJjaWdKR3I0Q0E2ZUtpUDQ0WkJm?=
 =?utf-8?B?Smh0c214dDF1SE5VTGRmZlBuTnhBZlV4NVJkd2svdVA0TTdGd09SeHJCQjB5?=
 =?utf-8?B?aDNBQVJCMDd2Z3lLOFlXaWhkNGFOTnA1azJUYVhOUkxzR2M3aXAxcUtJRU5Z?=
 =?utf-8?B?UkVERytxdXpKWUJ0b1FmME9rUWJtaVdIdWJ6Q0t4MnNtTXlqZW9rT1B1VzZ4?=
 =?utf-8?B?SXZ1TWt0a1JMbjRGT0JCeUFNSGdlaWFLajk2b0pKTzNzUnR4OUsxMTQ2c05Y?=
 =?utf-8?B?eldFcW42QWQxSmdYTkRKd0cwYWJwTEhtTkgwUHptU2JONnNSKzZMRG1oamlE?=
 =?utf-8?B?S0R3OTNMcWxkMGJUeWs1Y25XM09YS3NoeHZTUC9KOVJWY2xPNDIwWmdKRlg2?=
 =?utf-8?B?d2FSeTh4SGRuaEthWEFicEtMMVhxQzlWY2h3bmFsbFUxZlp4Q1BzQUV3R2FT?=
 =?utf-8?Q?Ay2e3Yj/weARHMevoxKWDhiUbfnGm0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnVneVpvZUZjRjRXdEJDNGhzUzdkVXRrcmJrU0dYOXF5N2NBTGtGSWFUUmVG?=
 =?utf-8?B?VitFaGNjUUY0OWRMODMrNGdUcnEyS3JZZmNkL0dLMXlTRnBoY1JFSDJlL2xh?=
 =?utf-8?B?WlVzQkRBZlhuTWNwUWRER0FVODJHZnc3aWxUdTF0K2xIcHZVaDZGM0d0WHhI?=
 =?utf-8?B?czZxc0dWQlgzTzg3eUJYQVNXN3FsSDFwMWtoUTZhWmZ5QTNvaE9ycUNpR2pN?=
 =?utf-8?B?SDNXZDkrZ2dXdlNidFBSU1NMYXlZQkdiZkZvYi9UbHNpYnZjUXVyczNLMGxu?=
 =?utf-8?B?QWlyUVhTTVJHbWVyR1pUUkVESDBsM1hiTzUycEJPbmR0UjZ0a2NTRTBBd0ht?=
 =?utf-8?B?RXZwdDZIYnM2Q0VMNW1rSDdTeGt3YmlMODZlemJLUVpoaFZhaXFBN1Rsd1M5?=
 =?utf-8?B?T2Q1a3BvUklKOTBPTktFWFN3REoxVmxxeU9ScXdoZUd6bVdLcGVpK3U2Z3oz?=
 =?utf-8?B?cUNjOHBvSUJXVThrNEdZTE1lenA4c0lncWlWb05GbEpSclAwWWlFeVBkL0ps?=
 =?utf-8?B?WGlraVpGeDNIaU0zdEJBK05WVm9wMFRFNHIrcWE1ZUl5UE9RWnB3TExQc3Ay?=
 =?utf-8?B?eDczbExCRWRTcEtoR1l2MllacmdGck55REF3bjlUS2dGb01OMTZvajYrbGQw?=
 =?utf-8?B?czdOb0F6SEdsUTZvYlhZQlBSVU5YWis3bjJTYUI4WlhxL0wvd1lObHZWTVVQ?=
 =?utf-8?B?QjhTcmU2alRLUnFMZGxVSHV3eFRRMk5Dc1ZjZ2tWa0V1Qnk0RmF4U3hZZFlU?=
 =?utf-8?B?WEk4c1FMZDhRYmdWWkVsd0ZyTFh5dWR6eUNibWg0Qjl5Q2owM0twekJpYWFO?=
 =?utf-8?B?TzVCbTRKZkZ3cTg2Zk1jNXI3VUNhRVI1TkNKdURhdXlRQ3Ayd1Vhd01wOG1j?=
 =?utf-8?B?WFYwQUtnSnlScGpQZEdWSTNXa2wzU1RIL29hd2N0R3FnbS8rTHNNOHlIQ0V5?=
 =?utf-8?B?ZkdsZ3BjV0FpdG9JdFUvVVdQeS9yMGY4cDNYZkJGYkNRYmdVV3g3N3pKdUsw?=
 =?utf-8?B?Y1M3aEc0YjE0UnpmQlVOdlFOTXg0WVAyNFBLRXdaNVRRL1lWUlFVZXc1aDZn?=
 =?utf-8?B?akt2RGNscUI4ekcxVVdOVmpodi9ubXdEN1lQQklWVERtclJnb1lVV0ZBbEJM?=
 =?utf-8?B?ZVFJYnFwZ1BYelJCdTBWSFZsd0M5T3VCbTZOcHlJVVNGZm16S0kvNzkydjhZ?=
 =?utf-8?B?L05kRTJVaG9wOWpDendYR1BNK1grUGhCZGsxRUN6NzEyOFhiclVUODB0OVdJ?=
 =?utf-8?B?RWNaeEVIUXVBdXBYb2lIcTlPaFJJMTZMemhDRm5xMkxZK3ZDS3JZSWZpYlFV?=
 =?utf-8?B?UWUvZ3MzbTNaWHZ6YndxTFRKMGdzdC9vekRaa2g4SFBwSzhGQkdoaE5veTA3?=
 =?utf-8?B?NXdESktkbWViL3ZyeXdTOGptUzVZbng3Tk85Y1hSVTluclRMcGtQZVVKbWVs?=
 =?utf-8?B?UDJsZDA4MEl5UjUvaFpNN0tFR0tITUZlSC9UZjIrTnJ5ekVSWGRNd3BETnNr?=
 =?utf-8?B?L0d4NXJkZ1NycUplZGZ2U2hIZWZscFIrREswRnUxSEJJV2s4RXdQYTRVY2l5?=
 =?utf-8?B?L1ZrTk5Zalp0YlpTQVF0YmFZT2ljVG5IUEQ5a1ZYY0t6K2cvanlHUlBaQUNP?=
 =?utf-8?B?KzBoTHZ3ZkJQOVFUQ0RNNDRaV2Z4SHR3MmtwUEk1L1ZLd3VNQ2VxNnBRcWVP?=
 =?utf-8?B?a2w2VXRWRzNFOEJxUFZuY2VhbGZaY3FJZGFESVRYUnpyZmJBS0RpcmdVQnBX?=
 =?utf-8?B?NmNVV3F0M2FVRmlRVVBmNmFTNWhrR0FZWHMzUlNBN1dVOXZlTzF2NlppN2Vh?=
 =?utf-8?B?OGZlMDVQSS9IU05Wak9STG84RzFHS2hRc1JGSWl5RjJRL2ZPTnlIbFJzcEdj?=
 =?utf-8?B?cExLQWdkQnZyaWEyMm9mNUEyVkdwZ1RDcnRiUFp0SmxianZrem94ZmNjUk41?=
 =?utf-8?B?VGF3YlNreDJjUmtUZmVYSDJ6RjFoRWxTL3ZMbDNiM1d6VFJnZ01JTmFGMFBa?=
 =?utf-8?B?aXljczJpeEpaRlZTcWhobDExT3ljbVVoYWNVQ2FEWjZnaDBOVU5yVkpxQ1lu?=
 =?utf-8?B?aEpJT0k1T3JHc2EzdEo3SUJUZC9LWGlLcVk3UmJ1a3R4RTJUSCtHdkFoVzRB?=
 =?utf-8?B?eXNNRVlSNVpvQ2REa2szZkxraEJjSFg2SVpxT093UEFwajN0K1dVYkJGU1pY?=
 =?utf-8?B?TjlYQ3pYanNtY2ZXMjVDZGxhWTlnV0thUWQzS1dTUnpJbUYvM2VORGppbDVL?=
 =?utf-8?B?Qm5ZVVJNa0pyOWpoREZQdU1Ybm9nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86eb1967-61b0-42a1-8be4-08ddf0246396
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 04:42:03.6200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xho3JPwOnUmp5fHUmD6RzYBQNDkSpVbm5vN37mZbzV50zLhe5TJcZ3pANeKcsSrUz1wYXOsrNhismzjqYsvTTLqsOLd1+f36JHCRglpv99U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEdhamVuZHJh
IFV0dGFtY2hhbmQNCj4gU2VudDogMDggU2VwdGVtYmVyIDIwMjUgMDg6MTMgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBSYW1hZGV2YSwgRHdhcmFrYW5hdGgg
PGR3YXJha2FuYXRoLnJhbWFkZXZhQGludGVsLmNvbT47IEd1cnJhbSwNCj4gUHJhdmFsaWthIDxw
cmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT47IFV0dGFtY2hhbmQsIEdhamVuZHJhDQo+IDxnYWpl
bmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYzIGktZy10IDUv
N10gYmVuY2htYXJrcy9sYXRlbmN5OiBBZGQgeGVfYm9fY3JlYXRlX2Rlc3Ryb3kNCj4gbGF0ZW5j
eSB0ZXN0DQo+IA0KPiBBZGQgYnVmZmVyIG9iamVjdCBsaWZlY3ljbGUgbGF0ZW5jeSB0ZXN0IGZv
ciB0aGUgWEUgZHJpdmVyLg0KPiBNZWFzdXJlcyBhbGxvY2F0aW9uIGFuZCBkZWFsbG9jYXRpb24g
dGltaW5nIGZvciBidWZmZXIgb2JqZWN0cyBhY3Jvc3MgZGlmZmVyZW50DQo+IHNpemVzIGFuZCB1
c2FnZSBwYXR0ZXJucy4NCj4gDQo+IERlZmF1bHRzOiBidWZmZXIgc2l6ZXMgZnJvbSA0S0IgdG8g
OE1CLCAxMyByZXBldGl0aW9ucywgMTAwMCBpdGVyYXRpb25zIHBlcg0KPiByZXBldGl0aW9uLCAy
IHNlY29uZHMgcGVyIHNhbXBsZSwgc2luZ2xlIENQVS4NCj4gUGFyYWxsZWxpc20gaXMgY29uZmln
dXJhYmxlIHZpYSBjb21tYW5kLWxpbmUgb3B0aW9ucy4NCj4gDQo+IEltcG9ydGFudCBmb3IgYXBw
bGljYXRpb25zIHdpdGggZHluYW1pYyBidWZmZXIgbWFuYWdlbWVudCBhbmQgaGVscHMNCj4gaWRl
bnRpZnkgbWVtb3J5IGFsbG9jYXRpb24gYm90dGxlbmVja3MgaW4gZ3JhcGhpY3Mgd29ya2xvYWRz
Lg0KPiANCj4gVjI6IEZpeGVkIHRyYWlsaW5nIHdoaXRlc3BhY2UgYW5kIGNvZGUgZm9ybWF0dGlu
Zy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdhamVuZHJhIFV0dGFtY2hhbmQgPGdhamVuZHJhLnV0
dGFtY2hhbmRAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGJlbmNobWFya3MvbGF0ZW5jeS94ZV9ib19j
cmVhdGVfZGVzdHJveS5jIHwgMTMwDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJlbmNo
bWFya3MvbGF0ZW5jeS94ZV9ib19jcmVhdGVfZGVzdHJveS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YmVuY2htYXJrcy9sYXRlbmN5L3hlX2JvX2NyZWF0ZV9kZXN0cm95LmMNCj4gYi9iZW5jaG1hcmtz
L2xhdGVuY3kveGVfYm9fY3JlYXRlX2Rlc3Ryb3kuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAuLjE4YzlhZWJlZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2Jl
bmNobWFya3MvbGF0ZW5jeS94ZV9ib19jcmVhdGVfZGVzdHJveS5jDQo+IEBAIC0wLDAgKzEsMTMw
IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29w
eXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVk
ZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5bmNvYmouaCINCj4gKyNpbmNsdWRlICJ4ZS94
ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ICsNCj4gKyNkZWZpbmUg
T0JKRUNUX1NJWkUgKDEgPDwgMjMpDQo+ICsNCj4gK3N0YXRpYyBkb3VibGUgZWxhcHNlZChjb25z
dCBzdHJ1Y3QgdGltZXNwZWMgKnN0YXJ0LA0KPiArCQkgICAgICBjb25zdCBzdHJ1Y3QgdGltZXNw
ZWMgKmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVuZC0+dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykg
KyAxZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+ICtzdGFydC0+dHZfbnNlYyk7IH0NCj4gKw0KPiAr
c3RhdGljIHZvaWQgdGVzdF9ib19jcmVhdGUoaW50IGZkLCB1aW50MzJfdCB2bSwgaW50IHNpemUp
IHsNCj4gKwl1aW50MzJfdCBibzsNCj4gKwl1aW50NjRfdCBib19zaXplID0geGVfYmJfc2l6ZShm
ZCwgc2l6ZSk7DQo+ICsNCj4gKwkvL2JvID0geGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwg
c3lzdGVtX21lbW9yeShmZCksIDApOw0KPiArCWJvID0geGVfYm9fY3JlYXRlKGZkLCAwLCBib19z
aXplLCB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwNCj4gRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19O
RUVEU19WSVNJQkxFX1ZSQU0pOw0KPiArCWdlbV9jbG9zZShmZCwgYm8pOw0KPiArDQo+ICt9DQo+
ICsNCj4gK2ludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gK3sNCj4gKwlpbnQgZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwlpbnQgc2l6ZSA9IDA7DQo+ICsJaW50
IGJ1c3kgPSAwOw0KPiArCWludCByZXBzID0gMTM7DQo+ICsJaW50IG5jcHVzID0gMTsNCj4gKwlp
bnQgYywgbiwgczsNCj4gKwl1aW50MzJfdCB2bTsNCj4gKw0KPiArCXdoaWxlICgoYyA9IGdldG9w
dChhcmdjLCBhcmd2LCAiczpiOnI6ZiIpKSAhPSAtMSkgew0KPiArCQlzd2l0Y2ggKGMpIHsNCj4g
KwkJY2FzZSAncyc6DQo+ICsJCQlzaXplID0gYXRvaShvcHRhcmcpOw0KPiArCQkJYnJlYWs7DQo+
ICsNCj4gKwkJY2FzZSAncic6DQo+ICsJCQlyZXBzID0gYXRvaShvcHRhcmcpOw0KPiArCQkJaWYg
KHJlcHMgPCAxKQ0KPiArCQkJCXJlcHMgPSAxOw0KPiArCQkJYnJlYWs7DQo+ICsNCj4gKwkJY2Fz
ZSAnZic6DQo+ICsJCQluY3B1cyA9IHN5c2NvbmYoX1NDX05QUk9DRVNTT1JTX09OTE4pOw0KPiAr
CQkJYnJlYWs7DQo+ICsNCj4gKwkJY2FzZSAnYic6DQo+ICsJCQlidXN5ID0gdHJ1ZTsNCj4gKwkJ
CWJyZWFrOw0KPiArDQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0N
Cj4gKw0KPiArDQo+ICsJaWYgKHNpemUgPT0gMCkgew0KPiArCQlmb3IgKHMgPSA0MDk2OyBzIDw9
ICBPQkpFQ1RfU0laRTsgcyA8PD0gMSkgew0KPiArCQkJaWd0X3N0YXRzX3Qgc3RhdHM7DQo+ICsN
Cj4gKwkJCWlndF9zdGF0c19pbml0X3dpdGhfc2l6ZSgmc3RhdHMsIHJlcHMpOw0KPiArDQo+ICsJ
CQlmb3IgKG4gPSAwOyBuIDwgcmVwczsgbisrKSB7DQo+ICsgICAgICAgICAgICAgICAgdm0gPSB4
ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KSSBzZWUgbWlzYWxpZ25tZW50IG92ZXIgaGVyZSBhbmQg
aW4gdGhlIGVuZCBhcyB3ZWxsIGF0IHJldHVybiAwLCBwbGVhc2UgY2hlY2sgYWxpZ25tZW50IG92
ZXIgaGVyZS4NCk9uZSBtb3JlIHRoaW5nIGlzIHRoYXQgdGhlcmUgaXMgc2FtZSBpZiBhbmQgZWxz
ZSBhY3Jvc3MgYWxsIGJlbmNobWFyayB0ZXN0cy4gSSB0aGluayB3ZSBjYW4gY3JlYXRlIGEgc3Ry
dWN0dXJlIGFuZCByZXVzZSB0aGUgc2FtZSBjb2RlIHdpdGggZmxhZ3MsICBzZWUgZm9yIGV4YW1w
bGUgeGVfZXhlY19mYXVsdF9tb2RlIGFuZCBsb3Qgb3RoZXIgdGVzdHMuIFRoaXMgd291bGQgaW1w
cm92ZSBjb2RlIHJlYWRhYmlsaXR5Lg0KLS1Qcml5YW5rYQ0KPiArCQkJCXN0cnVjdCB0aW1lc3Bl
YyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNs
b2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJ
CQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJCXRlc3RfYm9fY3JlYXRlKGZk
LCB2bSwgcyk7DQo+ICsNCj4gKwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tfZ2V0dGlt
ZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMg
LSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArICAgICAgICAgICAgICAgIHhlX3ZtX2Rlc3Ry
b3koZmQsIHZtKTsNCj4gKwkJCQlpZ3Rfc3RhdHNfcHVzaF9mbG9hdCgmc3RhdHMsIGNvdW50IC8N
Cj4gZWxhcHNlZCgmc3RhcnQsICZlbmQpKTsNCj4gKwkJCX0NCj4gKwkJCXByaW50ZigiJWZcbiIs
IGlndF9zdGF0c19nZXRfdHJpbWVhbigmc3RhdHMpKTsNCj4gKwkJCWlndF9zdGF0c19maW5pKCZz
dGF0cyk7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlkb3VibGUgKnNoYXJlZDsNCj4gKwkJ
c2hhcmVkID0gbW1hcCgwLCA0MDk2LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwNCj4gTUFQX0FO
T04sIC0xLCAwKTsNCj4gKw0KPiArICAgICAgICB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7
DQo+ICsNCj4gKwkJZm9yIChuID0gMDsgbiA8IHJlcHM7IG4rKykgew0KPiArCQkJbWVtc2V0KHNo
YXJlZCwgMCwgNDA5Nik7DQo+ICsNCj4gKwkJCWlndF9mb3JrKGNoaWxkLCBuY3B1cykgew0KPiAr
CQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0g
MDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0K
PiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJ
CXRlc3RfYm9fY3JlYXRlKGZkLCBidXN5LCBzaXplKTsNCj4gKw0KPiArCQkJCQljb3VudCArPSBj
Ow0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywNCj4gJmVuZCk7DQo+ICsJ
CQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3NlYyA8IDIpOw0KPiArDQo+ICsNCj4g
KwkJCQlzaGFyZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZzdGFydCwgJmVuZCk7DQo+ICsJ
CQl9DQo+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsNCj4gKwkJCWZvciAoaW50IGNoaWxk
ID0gMDsgY2hpbGQgPCBuY3B1czsgY2hpbGQrKykNCj4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNo
YXJlZFtjaGlsZF07DQo+ICsNCj4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10p
Ow0KPiArCQl9DQo+ICsgICAgICAgIHhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gKyAgICAgICAg
bXVubWFwKHNoYXJlZCwgNDA5Nik7DQo+ICsJfQ0KPiArDQo+ICsgICAgY2xvc2UoZmQpOw0KPiAr
CXJldHVybiAwOw0KPiArfQ0KPiAtLQ0KPiAyLjQzLjANCg0K
