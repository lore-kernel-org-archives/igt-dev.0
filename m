Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4081CD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 20:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6759910F233;
	Thu,  7 May 2026 20:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhJDhUU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8C10F209
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 20:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778184323; x=1809720323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bjD3IrkqCEpsYdDpblfdvSFGoCjWD0WyqGFhSv2/iuE=;
 b=RhJDhUU3b5w4YH2Hr7ax6wQmCbI23X8lfsHjLbNgaIHWxtph4izgt5dJ
 Xz3Tj3vkiFrkf7K//C1ymZFjFaocr8oG5fwrlDAk8TjfhIySwOOmH+iuE
 texfrzwm5Q1jlsT9RqXJx8gzNkm/XrTN/vChhcLPBb74Ke+2of2rS8zVU
 DII4P0IYYZuT9O3netkXSTx/1+9jGz54+VMGrG2WIFmq3bXB0Fbm0syk9
 2y17ZpReyVhQBqVL95zNcW5T/NsNTZoFKRUhPAkE8W/AiSa5WYTYJm8ej
 zv/I2VxxDQHnCr/oaHgK+OH/U/hxPgNifr1jOYyL9W73TmlYNxhiPOxUB A==;
X-CSE-ConnectionGUID: IP7JaW5TSpSttgik4ouPhw==
X-CSE-MsgGUID: LbiV6E45Q/mQsgJrKnAX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="81713501"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="81713501"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:05:22 -0700
X-CSE-ConnectionGUID: UAoTRc8sRiytkuXBCkXsmQ==
X-CSE-MsgGUID: ss6lK+CvTe60gFBlpopkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="236663785"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 13:05:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:05:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 13:05:22 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 13:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMH9kVODochMrhaPE/n2CfCfvIHSRe7bl02fso9eEhUpfz8LmhidHjHYvnUaJgzvur+1lhYCcVlTBnW8lHg74uI77LjSW4G7h2vs7lDOoQE4jANhevYbPTq4rSNDq8ybG/V6/991EIsBYO+SHrF634KyhRyVOI/iLLcrQgKvdcU9zpHoO44Ug2DX/I0h4czM6rpUJY44i4JNxpFsRD+d23unGQ6FUHT99OJ+74/YSB9ldokA2eJ8aN5jovg15bluls21oXUA/6JG+4c0275aiOEt5L2npjZ1IxD7OI5TquNg5zfEH2HAF4sH23bwCi0B0tFjWXkISNdCYaGV+h9JmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjD3IrkqCEpsYdDpblfdvSFGoCjWD0WyqGFhSv2/iuE=;
 b=DmtzCYGcX9HzBW25sssd2Yc1TNjfzvJ5yW/2aaHoY3cQYxvT/SxxiSM521+rgG6fFibHbNlKUW+4dUW80W26/16jvtXXqKbUVV0Z3lMxzpuQS92V7lMGfWFVf/GIO/XMiy4DjMcBzvVhgNj0qYlIzJZ5m1+ZyPZGCU2LPcz55Ja+9PmS8IWhlolB2TpWODJBohfOOep29CH/RCkIamKQe+pvCY5lrxehR5JG2vuYfPc3YVB2BL4Uw6ck9eGt5yfv2fUz4Ya+oeNxSBrVJCk1H6jzX5V0E4w83gNm8Elcpr/oMrJ21SX+qsug2JKKF+5yPbO/3Cbt0eTtFMiSqKhghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.16; Thu, 7 May 2026 20:05:13 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 20:05:13 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Thread-Topic: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Thread-Index: AQHc3YbMQLbB7NuTykqfpH4X8FCvRrYC8usAgAAFEICAAAaUAA==
Date: Thu, 7 May 2026 20:05:13 +0000
Message-ID: <faa42e2cad3b5945323d999d7f9d9a1cb45c98a9.camel@intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
 <20260506183137.51479-7-niranjana.vishwanathapura@intel.com>
 <81b70498fab2a302ad8c131ef9d589dd7e39c230.camel@intel.com>
 <afzq8QUcfKLm7jiT@soc-5CG1426VCC.clients.intel.com>
In-Reply-To: <afzq8QUcfKLm7jiT@soc-5CG1426VCC.clients.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7196:EE_
x-ms-office365-filtering-correlation-id: e9399d73-e222-41d1-74c9-08deac73f32c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: X5YLKLhy8dNtF6Gb9tqLfmGB3IQN/FOHZadZDB4MhJ430iSj0v2r5C2xxEh2XdFakEJOCdk7+ZV7MDPEyZqHiuM+hnQCDzdAARlDfjv3p7Hs/ZmDPBgXrXcnUj0oh45aT84j6u6FEhKWkwQFoOfpv3aN/q8j1Hms3lxmY6G21i5mDCRCyx8YNHw3ff29A3QuCqABeOYFl9IUKoQKj+fknQqdBWRT6liik3AcUGzusG9WtnQ4G1fgwgtDpVrLUrve8yyS5kpMelexiWXHw9aHpH1Gf85R9uAr7DNgPSx5aujrZIFuOrJfbibeFXMMoa0xl8N4iSSHVzjNW/dTrF3lBD6fXORPwQe68Rsct5PUVLOPjzTFQcDxg5kaCgWxJIdNBMGwfJZXYmfvWBCACIFFZAlFrVhTFh15pwlsaPmicch2nLMuvpW08k8AGDJXnMf/V2cIgZCx8gTL17iItG8lgYTGjnRLEe51PkcyEGn2HcBsNHRJvzn5HDoWOrMvYPEqWXEMMLnSouAEGgfTyHcv1eRufLAqCFhmNNPdw8rfREeMm2am9UHAHaP2QOu++Se74OiRL8t2XdOGWEoZ402n9vMSgUvUBjPJk0w10umAcYaQKfYrS/Z5kChkCJ9f0OAjnGuQCIkofC1eWTJNPu4q7KSjomyqvkJ9DbwnrA4HCthvibDKG/Rki7amCbi3556v1qPhbYj8632fixcCZp7W8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG9CcTlva3BiQ0gwM1EzSmxVQWxQd00rS0hnaW5xYWlwWE1NSm1URVVTOHhD?=
 =?utf-8?B?VE5mNm5ZODNYRnNxWnZTYitWK1FmOTRiYm1md1ZYWkRlZStzd0d2N2YwbHNw?=
 =?utf-8?B?WjJsak9nZmZLLzlaeEVhYlhQZFU0Y2E4cmRJZi9GZXFoYXNGa1BBUGpHaDA4?=
 =?utf-8?B?Vk9ybWVwdzFKVFZOUUkvMnVzQnZ0Z21QTVdYY1JwZHJZNmx0NmlYYUFaQzYv?=
 =?utf-8?B?RHRDU040TzBPTG9tUURBWnRqZDF6NjlwZUdFb3EwV08vZHFNTFQyRzJ6cXV0?=
 =?utf-8?B?cnNoTHhERkI4RkcxNEdiM25oVkhhQzhZeTc4MERTKyszOC9hdHg2dHZkZkZ0?=
 =?utf-8?B?S2VFUmFFU1FzL1JwYlNFWElNcWp6SXZtS09kck5pTUlKYWkraUxxcFF2Y0lW?=
 =?utf-8?B?STNhSnA1MkVrNUVwbmlTZlN1ZE9hVFF1Q2xqbk9OTzVCalNBa0JKRVVwellS?=
 =?utf-8?B?Und0MGs3ZHpUQXhsL2twZDBZU2NKRlUyZ0t1NG9mQWdVY0c5NW1kekEwbGFV?=
 =?utf-8?B?TnJWSWs4VXZ3ZW1MT0RpeFpDNnRRY1hvalBvdmtmMElEWTNEZmI1NlJOWVVB?=
 =?utf-8?B?YzVVRFJVVFdpQ0dOajI3cmkwVzJFUU9oZ055L0JydkVTdTZndHQ1eUhHcGla?=
 =?utf-8?B?aUJvSXg1bDBVUkhmRG8vWHYxVCtlWnY2cnBYdzJVUFlLaE5jVnFZYlRiYXlw?=
 =?utf-8?B?RTRSV0tmbWNNUnEyaDdhT0NoRlI4bnNjeVNHb1lNekJ3QUNLVUNNK29XNHF6?=
 =?utf-8?B?cWtUY200Qzc3VGliOHpaamgxTDlXRTNmalJFdXJ1WHRFMG10cjVFWENyeDRP?=
 =?utf-8?B?b3lJdUk5Z2lkTW0vdnNHQkxvZm8xMWlhWm1nbHUxTk0xNEt0SmpXNHBicHR2?=
 =?utf-8?B?YTN6ZTlLa0Y2RVhpd0pDT2ZyK0ZBN1lwV3BjQXVLVkEyL2ZJTjZSc1F0TFFE?=
 =?utf-8?B?VmtuYnZiWlNCbzlPaTBxSnFNT01FMDBCVGx2azE0WHkwMmQxR210Ukl2RUhx?=
 =?utf-8?B?OTE4QkNlQ3BEWU5kMTRGTWRJd1RjNUo4d0tlaW8wWVZ1WldsQWZvNmd6bW9F?=
 =?utf-8?B?N2xTN0ZpVzN2WldmZ1E3dWkvMDZoZjNPYms4Z1NBWjZwRnM1NVg4V0NWeXVm?=
 =?utf-8?B?eXJlT2hIVUpJQmR0NHMwSnVRNFNlTldyQU8zVm03bjc1SVM3U1dMTUVLQmQv?=
 =?utf-8?B?Mk1US1o3cWhSMGJ0K1FXY1VlZHExS0pOUDcvR2FFV2pFSlRGV0puQTVoQnd6?=
 =?utf-8?B?dUU0M3hiSDBwb2RlSVUxUGZ4S2J0UC9vR1dnS3lnSUppR1JIWkh4YlN3Vm9X?=
 =?utf-8?B?K0VIcXNreVBRWTZQRy96Z0h0MHBHOStjb2tsci9DcnIzbk9rTTBwZ1hHQlZ0?=
 =?utf-8?B?YmIvM2RHZURCUmUzblZhclZKOUdTeDJrMUI0REorazJxa1RMaUZRRWdZNEdP?=
 =?utf-8?B?Rk13Q09HbDBvMnlUbm5JbjdJeUswbmVTcE9oa1ZvSmNTcUdMUU51R3d5b2Zq?=
 =?utf-8?B?dEgwNDNRazRycTNpdnplY0pobnpxaC9DMHdGUzJzUDZuOXRTV3I2NlpaNDdx?=
 =?utf-8?B?MW9yNXBtMVJKSnI2eHg0TXcrVDFSTVdXelF0b1hlRE5VWkJDT213cGJONGpl?=
 =?utf-8?B?VVVDMU9DUHpvWlJpZ1htTm8vSDE0ZG1PQ1pNOUVwN3NsbEVxQVJBd3lMS2Ez?=
 =?utf-8?B?R1ZRa0pVWG5mc20xdmUvL2pYajVMOUFhYU1EdHNrZ1U2Tk1yaFdMdC9aYVFp?=
 =?utf-8?B?TjQwb2x6ZHlSUjh3TVVwVll4UUJyYmF6UG1RMGp6V3lXc1Y0c2x6YndPdVZk?=
 =?utf-8?B?QWN2Ui92L3ZWVmpkZXlsVnhrVHZBR1h1dmc3RGZ6ODZnZy8zUlZ0RHNHK2R2?=
 =?utf-8?B?b1FLRU85UUxLaWdkcjhTZEpxcWNxSjRGQW8rV09vMmdxMDZ3YTB1L1pYQkN4?=
 =?utf-8?B?ZWdmQWpvZEtLRjdPRUh5a2NTM1JadzQ4UUFhdmNGNUpVMHVEN1A4Ky80bE8r?=
 =?utf-8?B?L25Zdkx6NGdkUE1DbU1MTmdvYmlKcnVvOVh6ek1TMUxXK2o2UnBDV1ozdjJn?=
 =?utf-8?B?TG5LSnQzSUxvYWFUZE9nTHpkQ1pQMldsaW9nSXV6VFJMYmoyTnlMVjM4ZnpF?=
 =?utf-8?B?b1BHK1ovRS9EWmREVGorVk4rT2RFTFRJQlB4OEZQRHpZSkVSYmV1LzJ2dDA4?=
 =?utf-8?B?T3VzU0hQQVk3V1JFOGFVclljT2dmWHJzc2FCdE12NThTaStuVXB2SHVweEVJ?=
 =?utf-8?B?OXFzYTJMYjBzcTlOT3M0a2N3bWdoVko2Y2NFazA2azZhSEhsVzFyVnppc24z?=
 =?utf-8?B?cmEyWnJucXByaEl3MXozM3RuRnQ0L2ZwL3RQVGt3Nmg3QVRjM2NaV0hwT2d1?=
 =?utf-8?Q?mbl2f3Wwyz0civew=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D631C570127814A96FA6DF182B90A1C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ku+hEZUd+hUrRFAc7HcmMihEPTx/+4MI8PGdajyPJ8Il1dVDjmpkIZ5/Mr9hqfp2KcESnN2a9byJXexhUW27YcLfDh9XzjTPZtX4SPiNgHa1ddOKSl3q7fa0fkZTNHs5z9UnTyPNApwROICsob2vpdm/2q6Q1dkOtFMysR2rrPbwZTOVz12Zl9YCCCqlWF8Mr6yHlShh0VOSlYo99/STAx1pbL8X1iabSWJT5U95llauzaRESLf6pz0MBEnd96OxxSni/3nyWuNq8H5AxtkhWDQ2+6giHh75LTh2sAZXjV+tvZuy2dNcFMlvEF3Cb4OiSAfMjdAUQ89loXOdYmJKZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9399d73-e222-41d1-74c9-08deac73f32c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 20:05:13.3837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxfsxvZB78fDPrHhMCZKMUL8gX39uAeWKVtcNdrNO6xr+XME3COm6byO2KHCgahtQiPQjiaQwEsaUvt/8Lawq5vMyGoEdcyI8zGZmffBZYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

T24gVGh1LCAyMDI2LTA1LTA3IGF0IDEyOjQxIC0wNzAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+IE9uIFRodSwgTWF5IDA3LCAyMDI2IGF0IDA3OjIzOjUwUE0gKzAwMDAsIFN1bW1l
cnMsIFN0dWFydCB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjYtMDUtMDYgYXQgMTE6MzEgLTA3MDAs
IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgd3JvdGU6DQo+ID4gPiBGcm9tOiBndGEgPGd0YUBE
VVQ0NjM3TlZMUC5mbS5pbnRlbC5jb20+DQo+ID4gPiANCj4gPiA+IEluIG11bHRpLXF1ZXVlIGNh
c2UsIENUWF9USU1FU1RBTVAgcmVnaXN0ZXIgZG9lcyBub3QNCj4gPiA+IHByb3ZpZGUgdGhlIHJ1
bm5pbmcgdGltZSBvZiBpbmRpdmlkdWFsIHF1ZXVlcyBvZiBhIGdyb3VwLg0KPiA+ID4gUHJvdmlk
ZSB0aGUgb3B0aW9uIGZvciBzcGlubmVyIHRvIHJlYWQgdGltZXN0YW1wIGZyb20gdGhlDQo+ID4g
PiBRVUVVRV9USU1FU1RBTVAgcmVnaXN0ZXJzIGluc3RlYWQgd2hpY2ggaXMgdXNlZnVsIGluIHRo
ZQ0KPiA+ID4gbXVsdGktcXVldWUgc2NlbmFyaW9zLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+ID4gPiA8bmlyYW5qYW5hLnZpc2h3YW5h
dGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgbGliL3hlL3hlX3NwaW4uYyB8
IDkgKysrKystLS0tDQo+ID4gPiDCoGxpYi94ZS94ZV9zcGluLmggfCAyICsrDQo+ID4gPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+
ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3NwaW4uYyBiL2xpYi94ZS94ZV9zcGluLmMNCj4g
PiA+IGluZGV4IDE0OTUyY2E5MGUuLjg3NDMxMDc4OTggMTAwNjQ0DQo+ID4gPiAtLS0gYS9saWIv
eGUveGVfc3Bpbi5jDQo+ID4gPiArKysgYi9saWIveGUveGVfc3Bpbi5jDQo+ID4gPiBAQCAtMjUs
NyArMjUsOCBAQA0KPiA+ID4gwqAjZGVmaW5lIE1JX0xSSV9DU19NTUlPwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMSA8PCAxOSkNCj4gPiA+IMKgI2Rl
ZmluZSBNSV9MUlJfRFNUX0NTX01NSU/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAoMSA8PCAxOSkNCj4gPiA+IMKgI2RlZmluZSBNSV9MUlJfU1JDX0NTX01NSU/CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMSA8PCAxOCkNCj4gPiA+IC0j
ZGVmaW5lIENUWF9USU1FU1RBTVAgMHgzYTgNCj4gPiA+ICsjZGVmaW5lIENUWF9USU1FU1RBTVDC
oMKgwqDCoMKgwqDCoMKgwqDCoDB4M2E4DQo+ID4gPiArI2RlZmluZSBRVUVVRV9USU1FU1RBTVDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4NGMwDQo+ID4gPiDCoCNkZWZpbmUgQ1Nf
R1BSKHgpICgweDYwMCArIDggKiAoeCkpDQo+ID4gPiDCoA0KPiA+ID4gwqBlbnVtIHsgU1RBUlRf
VFMsIE5PV19UUyB9Ow0KPiA+ID4gQEAgLTY3LDcgKzY4LDcgQEAgdm9pZCB4ZV9zcGluX2luaXQo
c3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdA0KPiA+ID4geGVfc3Bpbl9vcHRzICpvcHRzKQ0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0g
Q1NfR1BSKFNUQVJUX1RTKSArIDQ7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNwaW4tPmJhdGNoW2IrK10gPSAwOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gTUlfTE9BRF9SRUdJU1RFUl9SRUcgfA0KPiA+ID4g
TUlfTFJSX0RTVF9DU19NTUlPIHwgTUlfTFJSX1NSQ19DU19NTUlPOw0KPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSBDVFhfVElNRVNUQU1QOw0K
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW4tPmJhdGNoW2IrK10gPSBv
cHRzLT51c2VfcXVldWVfdGltZXN0YW1wID8NCj4gPiA+IFFVRVVFX1RJTUVTVEFNUCA6IENUWF9U
SU1FU1RBTVA7DQo+ID4gDQo+ID4gSSBzZWUgaW4gWzFdIHdlIGFyZSBwcm9ncmFtbWluZyB0aGlz
IHJlZ2lzdGVyIGluIHRoZSByaW5nIGFsc28uDQo+ID4gV2lsbA0KPiA+IHRoaXMgY2F1c2UgaXNz
dWVzIGlmIHdlIG92ZXJ3cml0ZSB0aGlzIGhlcmU/IEkgc2VlIHdlIGRvIHRoZSBzYW1lDQo+ID4g
dGhpbmcNCj4gPiBmb3IgdGhlIGNvbnRleHQgdGltZXN0YW1wLCBzbyBwcm9iYWJseSBubyBpc3N1
ZSBoZXJlLiBCdXQgaXQgd291bGQNCj4gPiBiZQ0KPiA+IG5pY2UgdG8gZG9jdW1lbnQgc29tZWhv
dyB0aGUgZXhwZWN0ZWQgaW50ZXJhY3Rpb24gYmV0d2VlbiB0aGUNCj4gPiBrZXJuZWwNCj4gPiBy
aW5nIHByb2dyYW1taW5nIGFuZCB0aGUgdXNlciBiYXRjaCBwcm9ncmFtbWluZyBpZiBhbnkuDQo+
ID4gDQo+ID4gWzFdOg0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC83MjM1MDIvP3Nlcmllcz0xNjQ2NTQmcmV2PTUNCj4gDQo+IFRoZSBNSV9MT0FEX1JFR0lTVEVS
X1JFRyBzb3VyY2UgaXMgVElNRVNUQU1QIHJlZ2lzdGVyIGFuZCBkZXN0aW5hdGlvbg0KPiBpcyAN
Cj4gdGhlIEdQUiByZWcsIHNvIHdlIHNob3VsZCBiZSBmaW5lLiBJZiB3ZSB3ZXJlIHdyaXRpbmcg
dG8gdGhlDQo+IFRJTUVTVEFNUCANCj4gcmVnaXN0ZXJzLCB0aGVuIHRoYXQncyBnb2luZyB0byBt
ZXNzIHVwIGNvdW50cy4NCg0KT2sgZ290IGl0LiBTbyBiYXNpY2FsbHkgd2UncmUgb25seSBldmVy
IHJlYWRpbmcgdGhlIHRpbWVzdGFtcCBhbmQgdXNpbmcNCnRoZSBHUFIgdG8gdXBkYXRlIGZvciB0
aGUgdGVzdCBzcGVjaWZpY2FsbHkuIFllYWggbWFrZXMgc2Vuc2UuDQoNClJldmlld2VkLWJ5OiBT
dHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQpPbmUgb3RoZXIgdGhv
dWdodCBJIGhhdmUgaXMgaWYgd2UgY291bGQgbWFrZSB1c2Ugb2YgYm90aCB0aGUgY29udGV4dA0K
YW5kIG11bHRpIHF1ZXVlIHRpbWVzdGFtcHMgdG9nZXRoZXIgaW4gc29tZSBjYXNlcyAtIGxpa2Ug
aWYgd2Ugd2FudCB0bw0KdGVzdCBpbnRlcmFjdGlvbiBiZXR3ZWVuIGNvbnRleHQgc3dpdGNoIGFu
ZCBsaXRlIHJlc3RvcmUuIFJpZ2h0IG5vdyB3ZQ0KbGVhdmUgdGhhdCBraW5kIG9mIHRlc3Rpbmcg
dG8gdGhlIFVNRCBzaWRlIGFuZCBkb24ndCBjb3ZlciBpbiBJR1QuIFNvDQp3ZSBkb24ndCByZWFs
bHkgaGF2ZSBhbnkgbmVlZCB0byBkbyB0aGF0IGluIHRoZSBJR1QgbGlicmFyeS4gQW5kIGFueXdh
eQ0KaXQgd291bGQgdGFrZSBtb3JlIHRoYW4ganVzdCB0aGlzIG9uZSBjaGFuZ2UgdG8gaW1wbGVt
ZW50IHNvbWV0aGluZw0KbGlrZSB0aGF0LiBCdXQgc29tZXRoaW5nIHRoYXQgbWlnaHQgYmUgaW50
ZXJlc3RpbmcgdG8gY29uc2lkZXIgZm9yIHRoZQ0KZnV0dXJlLi4uDQoNCi1TdHVhcnQNCg0KPiAN
Cj4gUmVnYXJkcywNCj4gVW1lc2gNCj4gDQo+IA0KPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gQ1NfR1BSKFNUQVJUX1RTKTsNCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiDCoA0KPiA+ID4gQEAgLTgzLDcgKzg0LDcgQEAg
dm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdA0KPiA+ID4geGVf
c3Bpbl9vcHRzICpvcHRzKQ0KPiA+ID4gwqANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAob3B0
cy0+d3JpdGVfdGltZXN0YW1wKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNwaW4tPmJhdGNoW2IrK10gPSBNSV9MT0FEX1JFR0lTVEVSX1JFRyB8DQo+ID4gPiBNSV9M
UlJfRFNUX0NTX01NSU8gfCBNSV9MUlJfU1JDX0NTX01NSU87DQo+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IENUWF9USU1FU1RBTVA7DQo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IG9wdHMt
PnVzZV9xdWV1ZV90aW1lc3RhbXAgPw0KPiA+ID4gUVVFVUVfVElNRVNUQU1QIDogQ1RYX1RJTUVT
VEFNUDsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hb
YisrXSA9IENTX0dQUihOT1dfVFMpOw0KPiA+ID4gwqANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX1NUT1JFX1JFR0lTVEVSX01FTV9H
RU44IHwNCj4gPiA+IE1JX1NSTV9DU19NTUlPOw0KPiA+ID4gQEAgLTk3LDcgKzk4LDcgQEAgdm9p
ZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdA0KPiA+ID4geGVfc3Bp
bl9vcHRzICpvcHRzKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGlu
LT5iYXRjaFtiKytdID0gQ1NfR1BSKE5PV19UUykgKyA0Ow0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gMDsNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0xPQURfUkVHSVNURVJf
UkVHIHwNCj4gPiA+IE1JX0xSUl9EU1RfQ1NfTU1JTyB8IE1JX0xSUl9TUkNfQ1NfTU1JTzsNCj4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5iYXRjaFtiKytdID0gQ1RY
X1RJTUVTVEFNUDsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluLT5i
YXRjaFtiKytdID0gb3B0cy0+dXNlX3F1ZXVlX3RpbWVzdGFtcCA/DQo+ID4gPiBRVUVVRV9USU1F
U1RBTVAgOiBDVFhfVElNRVNUQU1QOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzcGluLT5iYXRjaFtiKytdID0gQ1NfR1BSKE5PV19UUyk7DQo+ID4gPiDCoA0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBkZWx0YSA9IG5vdyAtIHN0YXJ0OyBp
bnZlcnRlZCB0byBtYXRjaA0KPiA+ID4gQ09ORF9CQkUgKi8NCj4gPiA+IGRpZmYgLS1naXQgYS9s
aWIveGUveGVfc3Bpbi5oIGIvbGliL3hlL3hlX3NwaW4uaA0KPiA+ID4gaW5kZXggZGIwZmViZDhh
Yi4uNzVhNmFkYTQyMCAxMDA2NDQNCj4gPiA+IC0tLSBhL2xpYi94ZS94ZV9zcGluLmgNCj4gPiA+
ICsrKyBiL2xpYi94ZS94ZV9zcGluLmgNCj4gPiA+IEBAIC01MSw2ICs1MSw3IEBAIHN0cnVjdCB4
ZV9zcGluX21lbV9jb3B5IHsNCj4gPiA+IMKgICogQG11bHRpX3F1ZXVlX3N3aXRjaF9vbl93YWl0
OiBBZGQgYSBTRU1BUEhPUkVfV0FJVCBtdWx0aS1xdWV1ZQ0KPiA+ID4gc3dpdGNoIHBvaW50DQo+
ID4gPiDCoCAqIGFuZCBoYXZlIHRoZSBxdWV1ZSBzd2l0Y2ggb25seSBoYXBwZW4gaWYgd2FpdGlu
ZyBvbiB0aGUNCj4gPiA+IHNlbWFwaG9yZS4NCj4gPiA+IMKgICogQGN0eF90aWNrczogbnVtYmVy
IG9mIHRpY2tzIGFmdGVyIHdoaWNoIHNwaW5uZXIgaXMgc3RvcHBlZCwNCj4gPiA+IGFwcGxpZWQg
aWYgPiAwDQo+ID4gPiArICogQHVzZV9xdWV1ZV90aW1lc3RhbXA6IFVzZSBRVUVVRV9USU1FU1RB
TVAgcmVnaXN0ZXIgaW5zdGVhZCBvZg0KPiA+ID4gQ1RYX1RJTUVTVEFNUA0KPiA+ID4gwqAgKiBA
bWVtX2NvcHk6IGNvbnRhaW5lciBvZiBvYmplY3RzIHVzZWQgZm9yIG1lbW9yeSBjb3B5DQo+ID4g
PiAob3B0aW9uYWwpDQo+ID4gPiDCoCAqDQo+ID4gPiDCoCAqIFVzZWQgdG8gaW5pdGlhbGl6ZSBz
dHJ1Y3QgeGVfc3BpbiBzcGlubmVyIGJlaGF2aW9yLg0KPiA+ID4gQEAgLTYyLDYgKzYzLDcgQEAg
c3RydWN0IHhlX3NwaW5fb3B0cyB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBtdWx0aV9x
dWV1ZV9zd2l0Y2hfb25fd2FpdDsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBjdHhf
dGlja3M7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCB3cml0ZV90aW1lc3RhbXA7DQo+ID4g
PiArwqDCoMKgwqDCoMKgwqBib29sIHVzZV9xdWV1ZV90aW1lc3RhbXA7DQo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IHhlX3NwaW5fbWVtX2NvcHkgKm1lbV9jb3B5Ow0KPiA+ID4gwqB9Ow0K
PiA+ID4gwqANCj4gPiANCg0K
