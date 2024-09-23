Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616FFCF9C69
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 14:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0519B10E3FC;
	Mon, 23 Sep 2024 14:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWAyVO3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5004B10E3FC;
 Mon, 23 Sep 2024 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727101174; x=1758637174;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=870DC6Hz7hcjOZ88QU4lL9IRkr7ETeRwgVlN/qlLZ28=;
 b=OWAyVO3FQ99wA8lAnjGrs0iG1O8GTU8N/biSl41xUdqQi6PiTNdKTn+k
 7aoMwubCqGym97dgpj3kiohUVJIP91v5IV2WyqEawcDfv9WFdqfoM1hpi
 0qwV0kBaC5fudAL2U/vhfzx5aiLQnYfNR2Dmbb6wfLFgPCWW+d995Zy8W
 7mzEHPk/+oByVXoN5a/a3caVj6HXBb01MzZ1mYH8Ch1RHeMEJDXAi94nb
 dyLe5MZ7pkJek879jSl2BdqKXaIGIh8wTp2E5InD11EsPlYaUnHnOUXSn
 o34clxqe75Z7QEojt1enNywkiC96u4prNAMzyaxesh1uQMPOk8OZwHMTU w==;
X-CSE-ConnectionGUID: 0oEj5xReTa+shaEoj6ePdQ==
X-CSE-MsgGUID: iTGaf5k0TvCwKPWJdDjVXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25930775"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25930775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:19:33 -0700
X-CSE-ConnectionGUID: q5dtv181TTmasDdynUHQqA==
X-CSE-MsgGUID: 6y5SqOr8SVSXy3qOleOwBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75466352"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 07:19:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 07:19:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 07:19:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 07:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrPA0Y5PtIONBZBHPCWmDJwJQ6LfS4AQI4mp+yyXLhAUD/I+ygW+FutP61ay/A+8xgYoqnSYZQkABXG8StZ3y/rjLc1gDVIQQZ4J59GtsH9ZbDQj1aMJMhV5oWNEB9SZPMjbgVF1zKvOcBpwSeQxrY4kMVocju6bfXk08VBRQQ/LHF3G9ITWHMqQQE6ENXx/6o4BHsbOE1R7Jftl8XUKcZdK53o12P//7OxNYvKCZ+QgPIcLgPo+ZSWvPrjMac66un57uzuSwMTH9gzdTjNmCK8rldfmcHAxEJqI0ORZUf3QGfm7IohHgvnRSQMkoLb8QQIGRukVK8ZOlMT4xT2HpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=870DC6Hz7hcjOZ88QU4lL9IRkr7ETeRwgVlN/qlLZ28=;
 b=YA7Nv7LbwIN4NTOG/B/5jz/EDPYu85vlmLAmr4E57TH1+CR7UqF7clt3dQPJPuYZuek0SWnmyhAsCRdm26wwlR7f/lFqiHHKJn68G5BfAFGrUUFWX4A7SYruXqcW+NTZekz88plV9A2ITsJxpgOKlaE2GJ9/CNcXFY2fXDS8Ec1eMw+xOVWe4j+C/PVakf7e+MEZjek6ZF8J9s7udTVh5HJPU+MMSI34poOnbAem14SmVAC+s2ZQQDyn2tYE9zoHJUYB66FmQNQ7MeHsidSexgvwipfd0/bOC6bvBQUAfJeyqeCn3wTsyMTPk4y7PboPmGvvGlF3xNP7ojRkwBalcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 14:19:24 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%7]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 14:19:23 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: LGCI Ubuntu 24.04 Upgrade - It's Happening (Slowly)
Thread-Topic: LGCI Ubuntu 24.04 Upgrade - It's Happening (Slowly)
Thread-Index: AQHbDcOWrK+qle99f0ai1utiBIIKYA==
Date: Mon, 23 Sep 2024 14:19:22 +0000
Message-ID: <743918f5b3bd929d366eedde9d2a3c35ad12084b.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|BN9PR11MB5307:EE_
x-ms-office365-filtering-correlation-id: 69a049ba-f03b-4006-95d4-08dcdbdab8d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YmlwODVLSElUT0M1U2hMSGlBWUxRWks2NzZQK3hqeURjdkM5aW5lNGxnVlRw?=
 =?utf-8?B?NUMveE5qU29IQW0rcWxjSHNoRHF2c0o4eFlQSTFkQjZPc2dkWGJ1K2svNFVU?=
 =?utf-8?B?ZTQwWWYzYjVlL3BIa1VyZ3BwR0lDUi9WSDJJd2M0V2x6T2dORmVuNzBWTDFk?=
 =?utf-8?B?amFrMTdERWxlUHVqQjFIOGRXZGNuMHl6Nm5sMUdQUzk5aHVta0FHbERldnIw?=
 =?utf-8?B?MTZrMldFRmpHeXc2QWhvdUY2OFZaZHU4UkNvSXExRkxCVUhNYW5vczZqM1po?=
 =?utf-8?B?M1JnSDRmYUlNRUtDUVlrYTlpbC9IL0lZTzBoVW9xbG5pVDcyY0dwNVV6Q01j?=
 =?utf-8?B?REZvUDFKTE1CQjVEbjMrN2lUV1VNMkZtODMvWVpISUZRMFhsQm1DN3FmQzJw?=
 =?utf-8?B?UkhxSkMxQnFhTG9jV2l6NDZtckVZV1FOVnp6dS9GUTIzdnZDRW4rdWwySnpy?=
 =?utf-8?B?TzZCaFBQcURJNldNRjNXV3k0Z285NXZIQUZHb2FnWVlSSnhqbFFxYlZNQitW?=
 =?utf-8?B?OXpCeTB6Z0ErRUMxaUc1UTAzWkgzT0R2WUtGTnRrQXg2dEUvNk9hb25XT2Rw?=
 =?utf-8?B?VkNESmplenBCRUJvWmw4QzFLQWxESU5GblVLVytRTDFKWG53TW9mcXJjQmd0?=
 =?utf-8?B?WFlWRjZwZGc3RHBnS29IemRucnlDWmloSzZOemFyV2taL0pBbHFzVFV1aWpI?=
 =?utf-8?B?VVJ1Z0NYNWpPczg4dFYrUGtHLzJ5ajIrUkxYSkVpMlMwNm9XdnVJaE9peGk5?=
 =?utf-8?B?Mk1CK001amhIM0pBa1JDSVBFWFhSM1RmcHJhV3JraTRhY21Uc1BBM0s3VEtU?=
 =?utf-8?B?NnF0SUVjbGgxYkNURG9NMWNvMFQwWE1MQnY1ZXpDTG9FN0hmMDdjS1BTeGJ5?=
 =?utf-8?B?S0FmSzhtR1RsdHRHYW5QSE1nRHNZelQ3RFFWUWtIWUZMN245ZlRIdmxwbWd2?=
 =?utf-8?B?N1NMSllrN2tudHd3RHZYS05hc25Ia0tHbDBKVWJpWnliWXZmN0lSRE5qYnFR?=
 =?utf-8?B?MEsrTThGSnVvZjNoYUlJOFNNb2t5enZiS3Q3M1VWQkpYMEE4MjR0MzI4MGxq?=
 =?utf-8?B?Q2tpS3F1YTcrNk13cFE1bG9rcHlHaUd5OHY4ZnZwK0dTZjhqRzJsSG8vRHZt?=
 =?utf-8?B?TFpvSXVPRHR6OEFGTTZmZFl1SlVSa3p3N3NVMEs1ZzVBNTZDZStHbmhraFQ3?=
 =?utf-8?B?RzQ0eUhBeGxGajhWUjNjdERxZ1FtWkU3S2dDWDE1QzVxMHEvSjFlWHp6R2o2?=
 =?utf-8?B?bFJPWEU5WXU1VW9uK1NyR2FZd3Axd3g3Q05VVDgybXBPNWFPeWcvbnpJczh1?=
 =?utf-8?B?WTVHMG9QMnc2aVBZY25GMHpSMkNUeEFLQ0Zsa21GYndrYjZId2pNd2NtWTdr?=
 =?utf-8?B?aFQyQmF3Mlh2M0N4TWw0blBzbDBLUlpCWE1CRjBBa0RhTCtVRDdPb0k1bisz?=
 =?utf-8?B?TXZwWk93QXF3Z1dIK3ZweUdVcDk2eGozNCsyd3gxQkdhcjRMWVBpMzI0SC8w?=
 =?utf-8?B?T0VmdDBsN1QwMExhRXJWVGErZ2dmQXZRYWFBUmVzR2FSQVNLRldMbEh2SHBV?=
 =?utf-8?B?Ym0rVW1Na0M4N0VhV0N6L3B0aFhPQVUxRVNLUGdkbHk5dkEvcHRGWkFjU3No?=
 =?utf-8?B?eFE4ZzgxZW1NWVl1K1RyKzlod21QaDBRNGg1dllibFo2bVNqckpYNEVyUWsy?=
 =?utf-8?B?WjdkSTg2S0JVM1J6Nm1wL3N0d2NlSzBVd3FvTmVaczBoWWRGUUg4dlBwL2Zt?=
 =?utf-8?B?aGxMRktkRDg1OU03bnZ5NHhDeGgxNFl0Z2pYL1JVSHppYUY4N28wTWtTOGpO?=
 =?utf-8?B?VkZHbUF6RnUzZTVuUFE4dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2lmNHVGVWE1SEtiMjZyUkFBc0hxY2tOeC9CTXppWEVCOXZlV0liaXM2eGtF?=
 =?utf-8?B?ZnVoRCtVN2FDSTFtYkg0eWJjSGVIM244SjcydnVsSUhJR2YwZXdCMEVpR2JV?=
 =?utf-8?B?eTlLVXNWVlZ6Um90cDlxRXR3TXJPNXY5cEM0T0d2Ni9URlhMWUZzMVMyWWhv?=
 =?utf-8?B?THpJQmZKR0F4dWdjK2xRcTlxUE9IeFM5aHJHRENEUldwdHJQSVltZVB4M1pK?=
 =?utf-8?B?QzIyL3N1c0M4U2JwV1NqOFJHbG8zbFBXV1AxTWVjVDViTERnMEduelVjYjBQ?=
 =?utf-8?B?dW1LaWNTbXNpSEl3RlhQUDBIekZERU9lZTZoRGlqcjkxN1RZNWNIYTVOSk5u?=
 =?utf-8?B?Y1RjdUJBbkdGUHdLTlhwVlhVMGcxQzJoalhEOVY4a3prY0NRamYzVkN5T2RC?=
 =?utf-8?B?ZzNlRW13VTV3clRlWmZ5WnZzcG5XcTlXcmtPc2pnNm9xaW1kRERya2ttWnlT?=
 =?utf-8?B?ZnZwSDdxZGJrNW00ek9rb2dNbmhyQ0JVc210dW9GcTR1VTBHYXJXZW1IUnc0?=
 =?utf-8?B?QVo2Zk5zWm96dmVOVzBvK0tJNDVJWW0xQXRhc1Z3VEF2TzNJSXVRaW1Bdm90?=
 =?utf-8?B?ZjJ6UlEyUXVGb29wTXJ4QnBmRkhoa1c4QkF1VElpek5wSWlJTGtBdnlZZ3VY?=
 =?utf-8?B?WXZVRUllNitMTTVjQ1p4aFQ3TDBEYzJINGYzbEV2dllKVFBVNHVyVzV3YzZa?=
 =?utf-8?B?OGNOckhiTjdwNVUwZ01KNU9rVzh2S1BuUmpqZExZemY4cUFaU216VDhvL09i?=
 =?utf-8?B?OTZDNGNvcVM2eE4yQUVScHk1cFlHcXlXaWNseHNEdW5ndlEyeWhxLzZrdTNt?=
 =?utf-8?B?NHltTlpEK3J1MVRFZWQ0RVlqVmNIWmVmUW9hZTFNeCtlVW0rUDM5MUQ3Umo5?=
 =?utf-8?B?L1RTVGpVUUxrSVd0dEhsN3JqNTFlREtiZTBxSmdGbUV1aUJTZ0FNOXA4Y1VN?=
 =?utf-8?B?RnlpMnFWSmJJOUNucDdoeDV5UFU0cXZUbEpzTXQ3NE4vUnFZaDVNZGkyQlpI?=
 =?utf-8?B?SXVQVUNKVUNiMGkxKzB1T2d3WFphdzR4OFczY0xYaUJjVnNjeGIxSE04NUYr?=
 =?utf-8?B?YUxzKzd5cTVsVHpzMkQ3eGtGS1ZxajNQbWJXMCtzV0VYNTMySkUvdStya05I?=
 =?utf-8?B?akhPdUUzOU1jV0N3K1JnZzdMNjF6MS9vQzFyemVCMTZBalNEdXN1OHoyeTFO?=
 =?utf-8?B?YzFhVXVZQVlmNHpXd1pGNGhHbmdEeXc0OFdRdklmQlJQY2NSdjhZZlhUcEI1?=
 =?utf-8?B?VHl0QjhXUTZWV2NPMjZlZ1ZGSkZXcGNuaFhUOFNFdWk4WVl6TjhhNTdUd2Zk?=
 =?utf-8?B?OFhsRGx3MTVvcUpLMWY1dTkrVENReHZBWFRSbHVGc01CbG1CditUMkdpTHBv?=
 =?utf-8?B?YnVvMVBTcDhnVTRtWDg4ODBoMHd3ODhKaE9LUXF2WGphcVF1WG1JNE94RlBq?=
 =?utf-8?B?V2M1ZU05aTJJRm1veGVEclNWMWJnVWlLcjZxaHZ3Wlcza1c5eGZSSWRIUXpX?=
 =?utf-8?B?QlFhK1dKS05vM3NSRUl6QjlPZjB1NGU4MUtmWCsvQVJCcHRyV1ovd0FPV083?=
 =?utf-8?B?eWZBRWF5bVA3cWhLNEE3WVhBaGdtWTVWb2wrOE1PSnJyRlpHM3o3RXpnaW16?=
 =?utf-8?B?K2RYeUNqZnREQVVGM2hZRUlzeTBuNGI2RldUS241V3BDUHFGeE9BWXVJc21z?=
 =?utf-8?B?QmNSdXlOQ2dBS0FJNC91Mkl3T1h4V0VFb0p1RWUxc3Y2Ni8yc0cwR29zL0V5?=
 =?utf-8?B?RkZYZmExRC9kUlZ6eUZZaTdUODI4NTgrR21KWXVPdVlTUncwOThENjVMQ2s0?=
 =?utf-8?B?RG5RcnN3UVM2VGFVQmEzSUhVNFN5YTBML2I2QnUrMG9GRDZYWUdvUGs4dExz?=
 =?utf-8?B?R2srRjdqVFhCRFd5Y0hwZlNJMkg1N1ZOMTRaUXBBWEFpbmxadVBlUW5aUVk2?=
 =?utf-8?B?TkdDRUdKajEzZmllNWhUVXFCWmV2Um1rMmZGeC81d2NFV2hYZXNwbGczVVV4?=
 =?utf-8?B?cnV5Q2h5cXhEY0hxTUtCbEtCMkpwcWhSL2R0dWQ4Q0UrN3l4L2RUSkNxdmtB?=
 =?utf-8?B?M1dBWjdjT3VicEQvRXZmVVRuYXB4dnRheWVMZ0hFMnVQM01YVm4vaDEvWmh4?=
 =?utf-8?B?U1F1akx6YUtnNVovZTE0R3V0NnJtVkIrME9OSWV0eWRBenJhZXVwQ1FGVlpo?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF424F87C108234197FABCCA98416A22@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a049ba-f03b-4006-95d4-08dcdbdab8d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 14:19:22.9764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yb9JIZSDoseOYHwIr5k7gvCMjDxOngiTiF5BW/ULJ+fqI8RgSI10EsND9c4HbHDcN71F+b8EZKA2/Qzjnr4KpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
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

SGV5IGV2ZXJ5b25lLA0KDQpTdGF0dXMgdXBkYXRlIG9uIHRoZSB1cGdyYWRlOiBJdCdzIGluIHBy
b2dyZXNzLCBidXQgdGhlIENJIHN5c3RlbSBpcw0KbW9zdCBsaWtlbHkgbm90IGdvaW5nIHRvIGNv
bWUgYmFjayB1cCB0b2RheS4gV2UgYXJlIHdhaXRpbmcgZm9yIGFuDQp1bmV4cGVjdGVkbHkgbG9u
ZyBkYXRhYmFzZSBiYWNrdXAgKyByZXN0b3JlIGFuZCBjYW5ub3QgYnJpbmcgc29tZQ0KY29tcG9u
ZW50cyB1cCB3aXRob3V0IHRoYXQuIFdlIHdpbGwgbm90aWZ5IHlvdSBvbmNlIGl0J3MgZG9uZSBh
bmQgdGhlDQpzeXN0ZW0gaXMgYmFjayBvbmxpbmUuDQoNCk9uIHRoZSBwb3NpdGl2ZSBzaWRlLCB0
aGUgc2NhcnkgcGFydHMgYXJlIGVpdGhlciBkb25lIG9yIGFsbW9zdCBkb25lDQoobW9zdCBvZiB0
aGUgRFVUIHVwZ3JhZGVzLCBhbmNpZW50IGluZnJhIGhvc3RzKSwgc28gdGhpbmdzIGFyZSB0cmVu
ZGluZw0KdG93YXJkcyAidG9tb3Jyb3cgbW9ybmluZyIgcmF0aGVyIHRoYW4gIm5leHQgd2Vlaywg
c3BvbnNvcmVkIGJ5IHlvdXINCmVuZXJneSBkcmlua3Mgb2YgY2hvaWNlIi4gRmluZ2VycyBjcm9z
c2VkLg0KDQpSeXN6YXJkDQo=
