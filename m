Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3649EC369A2
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 05:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED5F10EAD2;
	Fri, 11 Apr 2025 05:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izH9ksX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485AD10EAD2;
 Fri, 11 Apr 2025 05:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744350269; x=1775886269;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Jl0LnOkYxNYyiqaqm5qckEHxJ/EwR9sAqN+KjSA0Nj0=;
 b=izH9ksX05cHf5zpBhwELmVH0JhxTB/I/nA2rsU1hzMuX3PtJZjgKceXG
 Ym+y7RTWme/Bu0KgAdnPn7OJ4xgAA5A1HGTKjQ4fTwDHmcbh8ESpNbaIH
 zSp4R+MF6Ym8e1B7Z4ghzZ95fl9wK/kFdHu3e4Bnw8GB4zpQQjIhoVRqp
 F4oFo5M/dA0UXe7kf1yNsAEg32YS9ysw3GIvgfMrkeq2dN+rALbMV+3X3
 GWVAysbKnFXoUr815KPXVHiTWDvCZNk1OGTrOWfY5j7+RQIQLp+ERs7kQ
 d4fGLKqslI5SxwOCbnRugIe3a/6+sOaTPCaiI5XHGx7BLtgzIR59NuFMC g==;
X-CSE-ConnectionGUID: LJTA7XiKRCuLlNHOZA2scA==
X-CSE-MsgGUID: 3vZwd+tISwGHQAjiybBggg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45904741"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45904741"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 22:44:22 -0700
X-CSE-ConnectionGUID: TjnGxQyVScieR37OUO3f1w==
X-CSE-MsgGUID: 3y4OoP54QMK9+PXl9fcZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129657130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 22:44:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 22:44:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 22:44:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 22:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPrrJupLk7gCdxH2yp2FCS03qksGQzHovRA4FlFVkW/ZfGd4owRemsTS2nrL1N/eR/yxvSj67QhGQCtddJu/eswh5GBc1GSd4vTojcFrqiRIMKqeLXhQFuxsVwsTOytVsY+h65kcl/GR1NGUtMO7yNDjLqgmV/g+sSrAKxu5IfimWyXJrNRzB6Hs8OasanOzJ3tY5svfjucFSgHGspYEQtTwkH9B5QU1QU6/LqxWdn2o+c0OCVPTXrHIPXvIOW11B3lOSJduMzB9L08x2FQNzeTFq4zbW9CUMa1uEDI8rqTE8hGt4VDoPRZ0u8D4SV7VllH2zaW4VgZC1jldS1WH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl0LnOkYxNYyiqaqm5qckEHxJ/EwR9sAqN+KjSA0Nj0=;
 b=Yud8osrMfsXlyB3ssq8hNKwjmBTROg/XAOTutaWP6ENgUoCtlXMtFxwxbBi8sS9mISRFevhKLpWh4r+C152RujfvGj8pwvlbvS3riKDkUBay/AK/yS7DyuNjWAAgJlfd3HVzO5FU/it7Z3YWNsbNtOiiE9d3qrT50dwAq4y5FLnmCcFdpjbNhrbRgGVtUJe5nMtvMIL07q0umNXphgucpf57g2tguvvB/8rm557dBqu1KQfj7QR1Cnojs4o+fr69HPi+ffoyFlrN8r1SfgYTWN7HYXaqdLg4dyhZmwXDBbov6HFeYOmPI6Kxid2GfwmLa2W5lBj5L+QOOavzEqQEcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH7PR11MB8057.namprd11.prod.outlook.com (2603:10b6:510:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 05:43:50 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 05:43:50 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVs?=
 =?utf-8?B?L2ludGVsX3N5c2ZzX2RlYnVnZnM6IFJlbW92ZSB4ZS1ndA==?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvaW50?=
 =?utf-8?B?ZWxfc3lzZnNfZGVidWdmczogUmVtb3ZlIHhlLWd0?=
Thread-Index: AQHbqj0nnJHrxC5gkkO60T8u0h/vsbOd9hEQ
Date: Fri, 11 Apr 2025 05:43:50 +0000
Message-ID: <CH0PR11MB5491491313EC505D9AE7DC43EFB62@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250410090315.4201-1-peter.senna@linux.intel.com>
 <174430499416.366.9106120670242612616@32c37dd7f93d>
 <15c15db2-ba8e-4862-86bf-2ba1b607cd47@linux.intel.com>
In-Reply-To: <15c15db2-ba8e-4862-86bf-2ba1b607cd47@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH7PR11MB8057:EE_
x-ms-office365-filtering-correlation-id: 7cd3c9a6-f99d-44e0-5f7b-08dd78bbd63f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?OFZUam9nU3pCNDRoT3JlUTBpcjNJb0p2Z1dReEdTU1hMbHVkOWtFaUxQR3FH?=
 =?utf-8?B?a3dLb3c0YnhzNEpZdUFiemJmOUpsUlJERmY0dGRUZlp6dnZ6TWpKbUUvbEV5?=
 =?utf-8?B?YlRBSlZHMWJ0bkEwQTZ5N1NpKzUzdW9Nc09adVFmQVJvTkZJS1ZQZ3M4TWxJ?=
 =?utf-8?B?WHFiREZHa0Z2TEh4bUVndnZTWlo4R1ErVmtqOTJVMnYwNURqZnovL3ZmcG9I?=
 =?utf-8?B?V3ZCR3lIL2FuZjNhVFBOSE42SkxiVFRMRkFlWmhtNnVrNzJDM3VJVmpEUlBK?=
 =?utf-8?B?VkpCdXoyS05UUmU1ZFYwTU5DUjR1UW5zNkxXbmYrUWZuSWYwTDFJNkZBUWUv?=
 =?utf-8?B?c0thd1VKMWg1UDFyb2k5eXErZlhSTGRvL2hKOTVEM3N2NnluMTAwRHR4cDRD?=
 =?utf-8?B?anp0RjhZeVp4TXhPdW5HZUZ4L085aFd4TG1UbEJmb0RQLzdFekpJbXNpZWFX?=
 =?utf-8?B?bWVrOWRaQmRiK1o2QnRqNjZGbytOMVpheUtyYXZCSVJndmc2SVhKVU9hZnNt?=
 =?utf-8?B?eTVUT3J1UFVkNzZjSUJKYld3ZHcwUHZmcGE1RHBXRUJIZlJzQlZ6L1dKUGFz?=
 =?utf-8?B?M211RlFxUzMvRFcwRkZ1WE1YaFplWHhya1pONVVoZUV4dHhXMDVYaUJJSldp?=
 =?utf-8?B?S3g0STJiZU1nTjBtUnMzYlVsdVhWK1FObjA2UHVxeElzT3NYQmNZZ210dFVk?=
 =?utf-8?B?QjNiTFhRSWFtQmp6K3QzT0Z5NEVkclBpMXJ4R28rZFpRcmh0UzNxYUltOEd3?=
 =?utf-8?B?ME5OWUkzL2lRRFpWTWxtRit0OEtmdy9IakpQdWhQQ0lvYmpTUXZNUlYxN1cz?=
 =?utf-8?B?K0J0ZW1MazhCL0c5VmZzTXpLaG5NakFJSGwxRFNIMFE0b2R1TkdSQXBrN3Fr?=
 =?utf-8?B?c0JSUS9hYW9yV0hZL2hkakpWanFhR1BXa2tQbmZCNGp4UmFRbGFqM29nclo1?=
 =?utf-8?B?RTM5OUR3WU5jWE9ucjBic1NIR3FMN2VEcXhyRStid3JQS2xrczB3MEVmTjR1?=
 =?utf-8?B?QUplZXpEVFg3WU8xWU1jUUxxWWpRRDNXZ2xHWDhSRXJDcnFrcXRBbG5CU0VZ?=
 =?utf-8?B?YjdCU2FKUUc3Ym9SRVUzdWU5QU1ibXRBNVplVjRDU3IxbmRRMHg0TEpEYXBC?=
 =?utf-8?B?QkdFcEZranA4UnQyT1hXdW5FS0VocW5taHNIeFRyUE14dmROdlFWYVJiVGNq?=
 =?utf-8?B?cjV4V3FjdmtlUXFGQ3YvWE9VV013WTI4eHcxT0piM1RacGdpd0IxS1ZONTZL?=
 =?utf-8?B?a21QaGs5Z0xKMkdVNWRjRGRqeE5iUzZxUW12anVTVGVFbTVoQVY4SU8vT08z?=
 =?utf-8?B?SStBN2Y5SnJKU29jWDNmSSszMWxodHAzcEtqYTNYOGhrUnZLbWFrSkV3d0pk?=
 =?utf-8?B?bUtDK2JOUUh1cHdCbXg4ZmpVZS8rTHlWK2NPMkdhajdsQmRwd2xOWnc0QWhI?=
 =?utf-8?B?WDhyd3Ria1JXV2poSWZTVG1PdVV5TWpkdjF4Sk9lTDhPWHJScGprNzMzOUdu?=
 =?utf-8?B?SXpTVmVNNVlIMGhxSUlyajJJcHd6eTBzNHR4S0tLTkVsb3lsQlQ0MHJMd0tE?=
 =?utf-8?B?byt0SktDMFhrVWdPR1B2dkFpaXh5M3U5NFAzMmhmSHZ5T0lJVDVYQ2FkdmtC?=
 =?utf-8?B?RHVHRmg2ejlMQ3FrNzJCQm8vWDhBa3ZtbEJLMy96b0owanA0UGdvVDcwaTlk?=
 =?utf-8?B?a2NTbGZyd05DRFIxSWl6S3NwMHo2TkFzaFhpdEIrVUJlalpianZ1czFwTXlG?=
 =?utf-8?B?SFFGemhWaWhja3VVV2k4Ti9GZUlsUnphTFAxSHM0RTZJcGpyZWprcXBRdThG?=
 =?utf-8?B?b3BCRkMxdjFVVlJIa2Q2MWFTSW11eUw0QjNNQmNjczNYZ2UvY3duU0FPSCts?=
 =?utf-8?B?c2o3NVZ0WnNvd2RUVzNBckIxakp0V2N5ZlZ2NWRSY3JDSnUreHo0ekU2U1pz?=
 =?utf-8?Q?rKj7oDO2DE0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2R1V2xYUmNNQWtCcmVkQmtrMjhDRCs0V1JwQ0tTNGtrNUZFWFdZUjhtQko0?=
 =?utf-8?B?OTQ4TUZZWGcrdkVsWGxVTEtwVjlvWlMzRnRnZnljWUhJb3N2TEtzY1BNRG9I?=
 =?utf-8?B?NklYTkJoTUlVeFU2anZ6Wm02NXJkU1p2RGJuOHVobmh3QzczQ0Y4S1VLTElr?=
 =?utf-8?B?T2hyeHcyMXh1RjBVczdwZm81TWtBbTV2cXhpeFdJVW0wQytmeTd4NTRVNklM?=
 =?utf-8?B?TnAydFNqRW1LdlVTNmxPZ21oYm5IdXliSFJXWnlXMTNYNXNSOXhmclR2N2dN?=
 =?utf-8?B?ZGR0Nnp4aEYzNnpuK01nYzAxVGMxZHpVVGs3Sjk1dE1OWW1rMTVwYnJOamRy?=
 =?utf-8?B?alMyT0VrUVVVYmZqYmJ1VzRvQzRXSEpyMFJBb0wvbmpLQkc4dmZZOGtpRThR?=
 =?utf-8?B?NG1SV0IxMHJnVzAvenNYRkx1TVF0VXRlVE9VY0VBL2lwUG9WajNvNThIS2lm?=
 =?utf-8?B?b3M5NVpaZUdDOGFUTDA3MEdwVnlSMm1vNXBKRlJXalFVOE8xZ1ZWSVBEZ2ta?=
 =?utf-8?B?NU5QcmlsSFN5UWVoYXNQblVxY0lnRnZNMU11TjZ1UHJhUVpMWDFGeVYrN084?=
 =?utf-8?B?Y01kZjhlaHpCVmlnM091ampXRjVBVUFxVWxuaCs3OXRHcGxPUTk4MlF2Tk9S?=
 =?utf-8?B?Rm5XQWIzQ3VkYVFJSXR1b0pSVllva01pUVFuYzRtcjkxSzZQQkU4WU55cjhx?=
 =?utf-8?B?WTdHUmJ5VVNDeHFhMFBoZ1N0ZXVCR3ZqZEFKR1VUOUU3cVJsSm0rTVlNQmVI?=
 =?utf-8?B?MC92bFpBaXBhY2k3amNGVFo2cTU5WFkvVnRMck1LOW1TZTJQcHNNNnRMWk1R?=
 =?utf-8?B?VUVwM3dlRmJCV00vN08yejJrWGJ1K1M0S1NPQ25mMzZJcklxMkY3WjhLRlhr?=
 =?utf-8?B?VXNWU2dRQnpIODNPbTMvT3ZCdlFrWjIrVEZEWGdKdFpOSGlwb0hzcTRzMGdT?=
 =?utf-8?B?bFFOS0E2c0ZrZmtZUlpnNjlvazExWjZWVkV4N2VpNUJ3KzN2TlliUzNZRjBT?=
 =?utf-8?B?UGVMeHFML1Z1a0ZkNkttNWY5T21RR0FORldYYVVWOSttU3hkZWx3Y2dkamFI?=
 =?utf-8?B?dGhlRFJaeFZ1dldBMU4yTko5WGtORzYvN3RRbEZlRjJTODFWc3U5TmVKV2Ni?=
 =?utf-8?B?a2FYdXk1MldTYzVSSCtBalAvVHVIbXBqVkdxcWY2OHdsbzljakZ6VjUwQURH?=
 =?utf-8?B?QnFFRlZpUjZ6TktzY3Exc1VxSWpyTzgvTWsxVTl6MlJIMkdjL3ZESHo5cWNw?=
 =?utf-8?B?RllGOXp6dEEvTTVYSVF2NzFEWmxkdm5BUFpkSWRuZ0ozcGJLbVB0aEs2RGJt?=
 =?utf-8?B?OXRHYkN4d0syTmVkNjZja0MxaU9MZlBJV2ZVcVE2TmFiUlhNNUt1RTlDZjlj?=
 =?utf-8?B?dlZpQS9QY3NnNWhpOE4wQXdRLy9LOExnOEJUcGc0THRSMjAyeEJZRE9YQlVu?=
 =?utf-8?B?bmN4YlBHR1ZoSWo5aVN6ZFJCVnN0bzhFU3dwTDVva2htU0tVbktiVGcwcTZ0?=
 =?utf-8?B?SUhSeXVWZ1dHdjhEejRJOVZ5d2JYamMxaXZySEl1NzZXaEZTNWMrSzRoVHlr?=
 =?utf-8?B?OVI2TVJ0UmVlNEd3N3RmNzNEdGVhVTlzbloybUh1a1Q0RlNNcDc1V28reElI?=
 =?utf-8?B?YkFEWGlVNEdWTGhzUG9SWEhUNDlJdGFWME11ZVI0UUlsdEQzejhwVlpiZmVa?=
 =?utf-8?B?aFplNzV2d3hBazExd2dkQVRGUFUxM2s0V3VVMk1iUkhlN01sR2RRdVNyajNJ?=
 =?utf-8?B?RFY0THlORFZiaFpkQXdrT3lpTEZGbHpPcEpjMys3dWhaVFgxWWZkZGpYZVZ1?=
 =?utf-8?B?RkRNcU9xRlBldnE4TWl1S0FVMVVBR0o4a3h0VXNXOFdXUitrQUpMYXE1bDVi?=
 =?utf-8?B?MGp3MVZTdTFXbTdaMDI3Y2hDQkJHTGFkY01JUnlQMnNtWklzTHFDN1pzMEdX?=
 =?utf-8?B?SkpjMHNLS0UzYWp4THgxamw3ZHJmbWtzSHRRNFVXL2tOelAxMUY3dEdMRWZO?=
 =?utf-8?B?a2hxSlJ4QjJMK25TM0RlT2luNnVSL1I4bDkxRmFpN3ZiUTlTOEV3MVYvenJY?=
 =?utf-8?B?Znh2SDlQM3JKU01YajZPd2dZZ3ZlV3JLVGdwbDVKeFZnME1qclZRNDBzUWJk?=
 =?utf-8?B?Q2Z3TTdjMGc1VnhGbG40S005endTRzlLb3pZczZWYVVFNm4yeFpyUFk2SGFU?=
 =?utf-8?Q?5+sGCtTBwJSQdlXfRq3+sCOOo4kn3qrc2wKSglyWxKdQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd3c9a6-f99d-44e0-5f7b-08dd78bbd63f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 05:43:50.4687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibTalr/TBccdwWZf2L1TapyeFIsg4kmzLBiwNz4CAl5CACNOio9PkPX0H2s43wkNuaqeJNIpZinqxOsIGWJre/qtizP4/2oZ4zuK5qrAQX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ3NTEzLyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJh
dmFsaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEg
PGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogMTAgQXByaWwgMjAyNSAyMjo1Mg0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3Rz
L2ludGVsL2ludGVsX3N5c2ZzX2RlYnVnZnM6IFJlbW92ZSB4ZS1ndA0KDQpEZWFyIEk5MTUsDQoN
Ck9uIDQvMTAvMjAyNSA3OjA5IFBNLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRh
aWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVsL2ludGVsX3N5c2ZzX2RlYnVnZnM6IFJl
bW92ZSB4ZS1ndA0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTQ3NTEzLw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4g
DQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gQ0lfRFJNXzE2Mzk1X2Z1bGwgLT4gSUdUUFdf
MTI5NTVfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoq
DQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEyOTU1
X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAg
DQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBk
byB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjk1NV9mdWxsLCBw
bGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBt
b2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4
dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTI5NTUvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMTAgLT4g
MTApDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBObyBjaGFuZ2Vz
IGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRo
YXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyOTU1X2Z1bGw6DQo+IA0KPiAj
IyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMN
Cj4gDQo+ICAgKiBpZ3RAa21zX2FzeW5jX2ZsaXBzQG92ZXJsYXktYXRvbWljOg0KPiAgICAgLSBz
aGFyZC1ya2w6ICAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bMV0NCj4gICAgWzFdOiANCj4gaHR0
cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjk1NS9zaGFyZC1y
a2wtMS9pZ3RAaw0KPiBtc19hc3luY19mbGlwc0BvdmVybGF5LWF0b21pYy5odG1sDQo+IA0KDQpU
aGlzIGlzIHVucmVsYXRlZCB0byBteSBjaGFuZ2UuIFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4NCg0K
Wy4uLl0NCg0K
