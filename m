Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022ADD358F5
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 10:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B6F10E32B;
	Thu, 29 Jan 2026 10:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOMHqLqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0B410E32A;
 Thu, 29 Jan 2026 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769682423; x=1801218423;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=s6q9bP49eNUNwIiwY677wrBacYrZoVncG6MLb4tJuxk=;
 b=HOMHqLqIHjXxK3UtAvLnLZ9PeWxiU1Vt9PE4osdy2RzLrZLDMfFX4VqM
 USnPkEwF+3i44c+O42xrv5BGBDNIFC/L2dmW+OTej1PN3uw94ZiGtksSB
 qYK/VJKSdqRAVoMNgRE3QQq1CART3NxwXpFPhYd3n0ZloaTwkWa9OP3pI
 cblAMsGXrLLeqYoZqx6Lk3Xb8tceoTtw7Mds4NA0RoItydmhGZpz6lbZV
 q5H8zLqYjPyr1cZNCbk9XLz7kzo3SZ96ywdz8o8tsT4ZFm1mTWkmEa5+A
 U2jmr9792l1sFZT0gNhNigedTINI0sOVC88AcmX7ne9xQxhFBBYLkfDPi g==;
X-CSE-ConnectionGUID: kHLSbnTiQqyEeJPqT9Bpew==
X-CSE-MsgGUID: FXjMn5F1QsiqD7WRzNqvjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74778522"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74778522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:27:03 -0800
X-CSE-ConnectionGUID: TLg7Ee5RTHy9JPVQC9hRLg==
X-CSE-MsgGUID: 8PfAWiasR/q8aiIeN1bRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213041715"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 02:27:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 02:27:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 02:27:02 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 02:27:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upD2hl+WWnvCEC6byYF72AYnYSRVRuKXHbtVflhuisE5zPSyEhsWnR8fYOpprp6aDcGGW5qfhaS1AILnndfzxRJYtHk1he0fROOVCwqsEFJDW+FyB063h4c5KunByuZio3ngou/3fhCv51TOl3P7mugcfiejEBFkNx7HDDDmXRe3caLq7waqWEKocw/HMrc3oFmvVV9EQ1TkE3Jz1Xfjg6YkDgNGRieVlCnFj9MRuyUfkqK8Nasa1ab26ptoOIYargQHoRKild5mMJ6mhl9I/bIwhOw8F15sBndyU794Xl90L26DhGDbP5lPwxVAI1mK0oXIE17huajBGcPMF+Mb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6q9bP49eNUNwIiwY677wrBacYrZoVncG6MLb4tJuxk=;
 b=GoITftabUw2F0pyn3jEx2VHb+rFBNEoP8QOTpZFBAOMSTdJNmOjFaVRopn8Af4gT2H1kuYfbMm8iFEYoOak743eDuD1/r5gceTQtTpF7AW7Uph+JYIUD1YNsbVaqkBbjrAjh8aJqjtVqSao5IOvcO9SlWUWuGufsPxaFkEDe2+GZtfbge02d8L7tDHy6M53RbkKxLXW+SdEjlCE0GHMIYy/kzErhZrtQW3zS24KZNzw04CauPbrHy2MAy8azn/F8YkLWttyI6Ko4G+T2vfRf2+OZ5W07XK+aDqy6/Yf29OrNmy+xGfyd+yBVO1edAXHc653uATZiB09sOdr3+xb1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by DS0PR11MB7999.namprd11.prod.outlook.com (2603:10b6:8:123::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:27:00 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%6]) with mapi id 15.20.9520.011; Thu, 29 Jan 2026
 10:26:59 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgUnVubmVyOiBVc2Ug?=
 =?utf-8?Q?Jansson_instead_of_json-c_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBSdW5uZXI6IFVzZSBKYW5z?=
 =?utf-8?Q?son_instead_of_json-c_(rev3)?=
Thread-Index: AQHckGAyBEUnCSgIbEK23UloxYk/7bVo79Vg
Date: Thu, 29 Jan 2026 10:26:59 +0000
Message-ID: <CH0PR11MB5491F60E440FCC08AEEA1EBBEF9EA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
 <176960467447.200099.2821899461965491566@a3b018990fe9>
 <20260128141219.rl2vjqbwag3zkmvu@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260128141219.rl2vjqbwag3zkmvu@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|DS0PR11MB7999:EE_
x-ms-office365-filtering-correlation-id: 60eaeeae-b148-470f-3788-08de5f20efb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?T2VuZllab1hEVEhvWVRtMTdLdEJXd0dFMlo1SUtoMUpoWGdFMmhFdUx5UGFP?=
 =?utf-8?B?UnZRdm9kNlhidlRVLzlGMFI3Q2txcXR3NjkyM2N3RFVaVlVwNTBIMUo0VU9y?=
 =?utf-8?B?RC83VFNLY29GRk41VzJlWWlwMlBIRG82K3hvYlFTNDBtNU9QNHdSMUZMUlMy?=
 =?utf-8?B?RUlFTyt2c0VoYTVZLytLSjQxaDJneGs5UHpaclQ3amszVG5pd3UvcE1pNkNo?=
 =?utf-8?B?Y3U5RHpnczJYYkI4cWpRd3dTRGkyRExVVzBCR1huSEgzZlVqa1lWc2hDdG9L?=
 =?utf-8?B?TjFKcmhFWHNyQzNWVVNDTTJ5VjZDNFYvanhpbk8zOTBuQVFYSjZzUjJIc3Rx?=
 =?utf-8?B?ZlE4M21TOHFkTnFNemh6SzgwbkFVSE1wR09QVFp2M0x3UTBSWktNd0xnMitT?=
 =?utf-8?B?MUhOUXE4bUVMc0YzUElLdU45d0NqczVUR3dBMWRKOU1lbi9tZE9UenJsbWdK?=
 =?utf-8?B?c29BQWJ5MjJsVTV2ck16QWlHeWR0L2dFL3FtSzU3QjVKZjlHL0ZJWkdkb1pN?=
 =?utf-8?B?czI1aHltVGJrbXhELzk4b2krcVJpcHI2emdyVDNqSTlOdFV2bldMRXlMLzB4?=
 =?utf-8?B?OFlQUlJZVVhldnlYQUJudjc1akZXNzZ3bXk4U0QvQXMrYzJnV0xXMW0rWThZ?=
 =?utf-8?B?WVdTMHRqZE5vU3lBc09sV0t5YTRlWlZaQ01Fb1h6Y3RBbTJuL3FyUnlhK0lF?=
 =?utf-8?B?d1ZKSk0vRng2ZnpmSDlXaFNvbDRoOStWdmhXNTBKN0dGeWF5RHZoNit3dFRo?=
 =?utf-8?B?b3M1b01WNFY4MmlvL2M0QXRTbTVLeU85RTQwT2xLZldBdWlsU3VFRnEyY1dU?=
 =?utf-8?B?bHpTQU1DdkdTRkZROE8vUXhrbUI5R0dSaW5iVDR4Ui9oK2tSTzVrcXhnSkpq?=
 =?utf-8?B?YTMrQXk3cGlBQ0MzSUpkRXlzM2NWdkhxUHI5VmticWhEUDVoa1J5S2I1VU9N?=
 =?utf-8?B?WFZDa3NxeFJXT1NVcUFoWVZZNEQ0b0tESkNBcENIcEIzODQrbUxHckdEYm9x?=
 =?utf-8?B?d0JJeElNU2FFYnhLbTNURngyZC9JVVlrVGRoN20ydVNSZVRvd1JtMzJvN2RN?=
 =?utf-8?B?K0dVa0pGOC9oeTNFQnFueU0reWliSmxVZFZTSmJFNWNLYUxsSHgyUXZHYm94?=
 =?utf-8?B?SVpYbmNXR1hqcXBnRUxlVnNtcEJaaExKWFptZndqb054Q0Rvdk8xbjVPdm00?=
 =?utf-8?B?THdWUjU1WDllc29hdnYzdm9iSGFKdk9wd0ZJSWtyNnl4RzVFa0VhRm5FU3ZY?=
 =?utf-8?B?VlBFSzhtOWZ2OElmenk2b3I2RnJWVTdReUxhTU1jMlEzN1lGYmY0ZzVxOEts?=
 =?utf-8?B?Z1lsTGp2NmRXWGRIRUpUNS9RSjF4ZlRTTjBERVJaNVBSNlYrSlIzUzIzMHE2?=
 =?utf-8?B?SHhvNUVPU0VSY2RFelU3V24xb3ZZSW5vMDM1VytlRHBpQTdlWk5Gei85V24v?=
 =?utf-8?B?NkNkdHRWVUlrVk1kUEN5eGFFS2xTTUZNZWx0RHJlUm4zb3NVU0tueGVPUjN2?=
 =?utf-8?B?cFUvVVBWalF0dFozS295eldKVC9tUjFNM0RRcmhheXFCUG96cVY0enJxTkw0?=
 =?utf-8?B?c2x6ZEJRN3VxMTRxWWZ4bzVva1dtRTVoMmdIWHB2ZE9CRjc1RkY3bHJnODVV?=
 =?utf-8?B?MzR1c3loNWpsRHcySVNjeUpucDRHbDBJZnFiUWpidUhRU3hyMGgvRHlKeWdN?=
 =?utf-8?B?ZHY5TUhzYnpGemcvejlHbnJIUkRVMHM0QXk0ckZ4ZlBvRFJ3UldtSGdSMVVX?=
 =?utf-8?B?UlpUQ01oOElEbDQ3OXBkL0dVTXBxNEhzTHBjZTkzbVB3QlBiS3puY0lLOWVW?=
 =?utf-8?B?S1ZhVWkvVHVUcURpck41aHZXQ21FNDBoTEdhYVpKaEZGeW1tNW5aSjJrVUVK?=
 =?utf-8?B?NDVqVjR0dDhCN1BBcEMxUVlnTXJzcjYvNHlJK3ZlbHB6aWRqTUx0ZDFnTUw1?=
 =?utf-8?B?RWhJODQ0SUZydTY3M3N1c1VmTkFxUUlqODRnUEt2aDRUQjJDM3dKSHdGQ2hE?=
 =?utf-8?B?RXFpWE1LaG5PbWY1SEFkWVFPZGd2OVRvanYyOXFXYVJLUWEvbFZLUmtQeVp0?=
 =?utf-8?B?Ui9ZZG1UeFE0UHlrMEkzODN6ZFJETVdGT3BoUFl4Z240TE1ERmlXTEhKU3lZ?=
 =?utf-8?Q?b+84=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1NRQjcveFdVaXpwRi90ZWd2bEFoaTNOUk04SkR4QTJqd1FjaHNjUDc3N0cy?=
 =?utf-8?B?dUgwZUpHNmltcHJSaFJxRWVLZ29kMGNlRnpweWRCREMrZUNDMWhnUmU2Z1lh?=
 =?utf-8?B?Q080Z3E2SG1vbENQVCtFT3Nra1hPVmRxZk5EbkVPQjJVMklpU3dudlZrY2Rs?=
 =?utf-8?B?QmlMbXJtQzZybldiMHdtQ2xYcDFXeGtqV3BpNmpMMWxNSHBaUnJFWTRKSGg4?=
 =?utf-8?B?L0NjYTlsQVR6OGRUSitqUGhud1h6NUlpTGs3TFYrcGh0Ym5UbXVlVWRhY1RB?=
 =?utf-8?B?dnJBYVE3a2JoSzBHRkpiYVU1c0lQUnRRdm9qTmxRWU5XNU9PU3VpWVdOaWlD?=
 =?utf-8?B?eHI0WC8yL2VRMmVIaHZpSzhoNklLSEE3UHZtUFlGL3FBYWN3RnZVaUFNUmRB?=
 =?utf-8?B?SWo2WU5iK1cvZ3doczc2SWRBazZOajFzeTNCUWJ4clYyMm5ZZjVKY0Q5Zm51?=
 =?utf-8?B?YW5YTnRoblFFNHJRUDBKdjNMc2ZsaklJSWp0bjByMWxLYlB1VElVMTJlNXpS?=
 =?utf-8?B?WFE3Zy8rRVFrQ1Rsdld3MmRmbVFPNTBjTXlwZm8rd3UwanRDV2x2ajVpd0pI?=
 =?utf-8?B?UUR3NnJDUDJuYVFXS0hRZWpYcG1BcG1EUEdrSUh6bFl0WFFiZGl2enFrUmwy?=
 =?utf-8?B?ZlFpb0ViWk14OWhsSkZyWTBlV0hhOC9JMDhtSVZNbEt1aEw1NU56RHdhVGFo?=
 =?utf-8?B?YmFkaUtTbUdENnBWcS96dklIVy9BaFFiWlcxQzA3bVpYdDVpTHRHWXNQcE9Q?=
 =?utf-8?B?bmdQWFBQcCtUdWl3NEZrVmdQQkwyMGpKQkRKVnd2MlNSRDFUQTdkazFOblE0?=
 =?utf-8?B?bmRkaVlqUWZ5Y25OOXFVVWdKUTdSNWZoeEdtTGFNeWtmd3J6c0wzczBTMkUv?=
 =?utf-8?B?WnFQVUhLdVo4MFdjR0pQMTVjVHNyTUpiWVd2MElQc2VwVUVEMVlyejBnR3Rw?=
 =?utf-8?B?b1lsTXAvNjRORXNOVGllVVNkc0VNYzk5Z1hNaG9Fb1JGdkNqVmppU0UxQ0pU?=
 =?utf-8?B?RzBWMHY1Zm9qWWtQUUU5SUc5NFFicHNicW9NZGM4L3hqZW9Ha09YUkNIcG14?=
 =?utf-8?B?UWFLR1VYTS96bXlGaU9iTzZqVlRGNjVTMG5maTB0V1JXTWNZaDYycyt0NTFO?=
 =?utf-8?B?aG9DYVJTNVdDcHMvTFdOdTF2L3BEWGlOdGdvMk1qTXBvcmpQanl0UkMyc05z?=
 =?utf-8?B?cUNnZERtcUdYaTNmcDhKZUZqVTNIYlN2MWh6cDR3dzZPTjhmR09sN1ArUHNS?=
 =?utf-8?B?UFdIQUlVRXp0dnJIR3dleGgvVVBpR0RabnZ4anhTMVBqa1YxMVROWmZBL2Rt?=
 =?utf-8?B?REYyVEZJYVJHQzMrWlh6WjJpZ0pjellWTkt5cUJJU3RUKzlYY2t2N0lwVEpz?=
 =?utf-8?B?KzhPYXpIaTU2WW1oNWlZekZ4V1ZVQUV2RkNNdm5LeW9DSi9OdjFDMk9IMWxL?=
 =?utf-8?B?QmlJMm9aVDViMFQ4ZGU4cW5ZYnFjYmlDcnFVWDZQMGdVM2pMQzBZeTRLTzlE?=
 =?utf-8?B?UndId3pqZThHd1ZBdWRQWk1MVTA4VXJUODQzUUtPallWN0taUWR6YmVCSzVk?=
 =?utf-8?B?bXNPYUxISzNmUTE2Rm9aMGdUeHltZUVHdXlXOXJrRVhRTzVuZFhuQ3dsa0RM?=
 =?utf-8?B?ZzRWMDVQclJreXlJMTNQazV4TGVaemhuYjh1WU1xdHFNM0N2MkNuZGdmVFph?=
 =?utf-8?B?OGt1eUoxKzIwd0M5UFlQaGF0SHpydGFNeUZCdVpoOU16ejBGWjdQUDN1emlj?=
 =?utf-8?B?TjIvalhMWUkzQmlsMXVqK2tWc1A3QlFHMDEwUU5xRjMzakNoV1U5N0tzVDBD?=
 =?utf-8?B?TlBxZ2FiYitwdThwVVdhL3U0YVZ3WWt2M2NLNDM4WGxxVzNlL0E3UXhwbG5w?=
 =?utf-8?B?NjVjR09QRDdnbzFsRXdjeW5JMElpNnlwaUEyTk95VXRoYnhkaVovTk4vMHVp?=
 =?utf-8?B?cmNwR2NzQTZ5QmJZcVI0aUJtRnBNYkdRUHZ0V3kwUnIxL28yMkxlS21VeUJY?=
 =?utf-8?B?VHZvRzlHZE9vdmdQNU5ra2VMWkdndTVIbXo4bFhmTTRIZWRVa2tRS05EOGJ1?=
 =?utf-8?B?TFVmcUNuc1k3TVZ2bFV0dHd3enNUdlNJaEowVkFQdjdReWEvSUZNWDlHQzNQ?=
 =?utf-8?B?Smlhb0FKTWFRUGxWblN0V0U2SG02MTdTZlZQTE5sRVlGc2RmSllVQzdkWXds?=
 =?utf-8?B?V2RaTDUyb0hUbzdZM2hjZUZUdnl3OXEyTHBLQ2ozQ1ZzdGltcEI4b2phbFhm?=
 =?utf-8?B?T2NzaHJtbFZZRTB3N2VEZzFPeWd6N0FLbUs2b0h4TENZaE45T0VoV3JwUXBN?=
 =?utf-8?B?eUVFd3ROZDJleWlrMUxPMWtGbjdRaGMzRUpiOW8vUC9xTStZRVpJeDk5TzRO?=
 =?utf-8?Q?q3CEqYKp/f3U3zFVITneHOoLFjtr3fPMs0KYxygRM86pA?=
x-ms-exchange-antispam-messagedata-1: p0hT/WrwqZdg9g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60eaeeae-b148-470f-3788-08de5f20efb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 10:26:59.8269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4OtLgrDSWgrRZyxjWXJmUzcBO0cJscUZMozX8WgtwSDDCcMLA4jhgCAnGOzt8LjZIbHLv92uCy1DgjPzwffoDEJRyrmfQUur804Kuqc2gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7999
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTYwMTU0Lw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NClRoYW5rcywNClJhdmFsaS4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLYW1pbCBLb25pZWN6bnkN
ClNlbnQ6IDI4IEphbnVhcnkgMjAyNiAxOTo0Mg0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpDYzogSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6
IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIFJ1bm5lcjogVXNlIEphbnNzb24gaW5z
dGVhZCBvZiBqc29uLWMgKHJldjMpDQoNCkhpIGlndC1kZXYsDQpPbiAyMDI2LTAxLTI4IGF0IDEy
OjUxOjE0IC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+
IA0KPiBTZXJpZXM6IFJ1bm5lcjogVXNlIEphbnNzb24gaW5zdGVhZCBvZiBqc29uLWMgKHJldjMp
DQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjAx
NTQvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVn
IExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfODcyMSAtPiBJR1RQV18xNDQzNiANCj4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFy
eQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93
biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzE0NDM2IGFic29sdXRlbHkgbmVlZCB0byBiZQ0K
PiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0
ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJv
ZHVjZWQgaW4gSUdUUFdfMTQ0MzYsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1j
aS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1
bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0
aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDQzNi9pbmRleC5odG1sDQo+IA0KPiBQYXJ0
aWNpcGF0aW5nIGhvc3RzICg0MiAtPiA0MSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+IA0KPiAgIEFkZGl0aW9uYWwgKDEpOiBiYXQtYWRscy02IA0KPiAgIE1pc3NpbmcgICAg
KDIpOiBiYXQtZGcyLTEzIGZpLXNuYi0yNTIwbSANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMN
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFu
Z2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzE0NDM2Og0KPiANCj4g
IyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMj
DQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBnZW1fbWlncmF0ZToNCj4gICAgIC0g
YmF0LWFybGgtMzogICAgICAgICBbUEFTU11bMV0gLT4gW0lOQ09NUExFVEVdWzJdDQo+ICAgIFsx
XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODcyMS9iYXQt
YXJsaC0zL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAZ2VtX21pZ3JhdGUuaHRtbA0KPiAgICBbMl06
IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDM2
L2JhdC1hcmxoLTMvaWd0QGk5DQo+IDE1X3NlbGZ0ZXN0QGxpdmVAZ2VtX21pZ3JhdGUuaHRtbA0K
PiANCg0KVW5yZWxhdGVkLCBwbGVhc2UgdXBkYXRlIGFuZCBydW4gaTkxNSBGVUxMLg0KDQpSZWdh
cmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0K
PiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzE0NDM2IHRoYXQgY29tZSBm
cm9tIGtub3duIGlzc3VlczoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMg
SXNzdWVzIGhpdCAjIyMjDQo+IA0KPiAgICogaWd0QGdlbV9sbWVtX3N3YXBwaW5nQHBhcmFsbGVs
LXJhbmRvbS1lbmdpbmVzOg0KPiAgICAgLSBiYXQtYWRscy02OiAgICAgICAgIE5PVFJVTiAtPiBb
U0tJUF1bM10gKFtpOTE1IzQ2MTNdKSArMyBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFszXTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ0MzYvYmF0
LWFkbHMtNi9pZ3RAZ2UNCj4gbV9sbWVtX3N3YXBwaW5nQHBhcmFsbGVsLXJhbmRvbS1lbmdpbmVz
Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAZ2VtX3RpbGVkX3ByZWFkX2Jhc2ljOg0KPiAgICAgLSBiYXQt
YWRscy02OiAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bNF0gKFtpOTE1IzMyODJdKQ0KPiAgICBb
NF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0
NDM2L2JhdC1hZGxzLTYvaWd0QGdlDQo+IG1fdGlsZWRfcHJlYWRfYmFzaWMuaHRtbA0KPiANCj4g
ICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+ICAgICAtIGJhdC1hcmxoLTM6ICAgICAgICAg
W1BBU1NdWzVdIC0+IFtJTkNPTVBMRVRFXVs2XSAoW2k5MTUjMTU2MjJdKQ0KPiAgICBbNV06IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzg3MjEvYmF0LWFybGgt
My9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gICAgWzZdOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDQzNi9iYXQtYXJsaC0zL2lndEBp
OQ0KPiAxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBs
aXZlQHdvcmthcm91bmRzOg0KPiAgICAgLSBiYXQtYXJsaC0yOiAgICAgICAgIFtQQVNTXVs3XSAt
PiBbRE1FU0ctRkFJTF1bOF0gKFtpOTE1IzEyMDYxXSkgKzEgb3RoZXIgdGVzdCBkbWVzZy1mYWls
DQo+ICAgIFs3XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1Rf
ODcyMS9iYXQtYXJsaC0yL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0K
PiAgICBbOF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VFBXXzE0NDM2L2JhdC1hcmxoLTIvaWd0QGk5DQo+IDE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3Vu
ZHMuaHRtbA0KPiANCj4gICAqIGlndEBpbnRlbF9od21vbkBod21vbi1yZWFkOg0KPiAgICAgLSBi
YXQtYWRscy02OiAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bOV0gKFtpOTE1Izc3MDddKSArMSBv
dGhlciB0ZXN0IHNraXANCj4gICAgWzldOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xNDQzNi9iYXQtYWRscy02L2lndEBpbg0KPiB0ZWxfaHdtb25A
aHdtb24tcmVhZC5odG1sDQo+IA0KPiAgICogaWd0QGttc19jdXJzb3JfbGVnYWN5QGJhc2ljLWJ1
c3ktZmxpcC1iZWZvcmUtY3Vyc29yLWxlZ2FjeToNCj4gICAgIC0gYmF0LWFkbHMtNjogICAgICAg
ICBOT1RSVU4gLT4gW1NLSVBdWzEwXSAoW2k5MTUjNDEwM10pICsxIG90aGVyIHRlc3Qgc2tpcA0K
PiAgICBbMTBdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RQV18xNDQzNi9iYXQtYWRscy02L2lndEBrbQ0KPiBzX2N1cnNvcl9sZWdhY3lAYmFzaWMtYnVz
eS1mbGlwLWJlZm9yZS1jdXJzb3ItbGVnYWN5Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2RzY0Bk
c2MtYmFzaWM6DQo+ICAgICAtIGJhdC1hZGxzLTY6ICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVsx
MV0gKFtpOTE1IzM1NTVdIC8gW2k5MTUjMzg0MF0pDQo+ICAgIFsxMV06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDM2L2JhdC1hZGxzLTYvaWd0
QGttDQo+IHNfZHNjQGRzYy1iYXNpYy5odG1sDQo+IA0KPiAgICogaWd0QGttc19mb3JjZV9jb25u
ZWN0b3JfYmFzaWNAZm9yY2UtbG9hZC1kZXRlY3Q6DQo+ICAgICAtIGJhdC1hZGxzLTY6ICAgICAg
ICAgTk9UUlVOIC0+IFtTS0lQXVsxMl0NCj4gICAgWzEyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4
LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ0MzYvYmF0LWFkbHMtNi9pZ3RAa20NCj4g
c19mb3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtbG9hZC1kZXRlY3QuaHRtbA0KPiANCj4gICAq
IGlndEBrbXNfaGRtaV9pbmplY3RAaW5qZWN0LWF1ZGlvOg0KPiAgICAgLSBmaS10Z2wtMTExNWc0
OiAgICAgIFtQQVNTXVsxM10gLT4gW0ZBSUxdWzE0XSAoW2k5MTUjMTQ4NjddKQ0KPiAgICBbMTNd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84NzIxL2ZpLXRn
bC0xMTE1ZzQvaWd0QGttc19oZG1pX2luamVjdEBpbmplY3QtYXVkaW8uaHRtbA0KPiAgICBbMTRd
OiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDQz
Ni9maS10Z2wtMTExNWc0L2lndA0KPiBAa21zX2hkbWlfaW5qZWN0QGluamVjdC1hdWRpby5odG1s
DQo+IA0KPiAgICogaWd0QGttc19wbV9iYWNrbGlnaHRAYmFzaWMtYnJpZ2h0bmVzczoNCj4gICAg
IC0gYmF0LWFkbHMtNjogICAgICAgICBOT1RSVU4gLT4gW1NLSVBdWzE1XSAoW2k5MTUjNTM1NF0p
DQo+ICAgIFsxNV06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzE0NDM2L2JhdC1hZGxzLTYvaWd0QGttDQo+IHNfcG1fYmFja2xpZ2h0QGJhc2ljLWJy
aWdodG5lc3MuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfcHNyQHBzci1wcmltYXJ5LW1tYXAtZ3R0
Og0KPiAgICAgLSBiYXQtYWRscy02OiAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1bMTZdIChbaTkx
NSMxMDcyXSAvIFtpOTE1Izk3MzJdKSArMyBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFsxNl06IA0K
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDM2L2Jh
dC1hZGxzLTYvaWd0QGttDQo+IHNfcHNyQHBzci1wcmltYXJ5LW1tYXAtZ3R0Lmh0bWwNCj4gDQo+
ICAgKiBpZ3RAa21zX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xlLWNydGM6DQo+ICAgICAtIGJh
dC1hZGxzLTY6ICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVsxN10gKFtpOTE1IzM1NTVdKQ0KPiAg
ICBbMTddOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQ
V18xNDQzNi9iYXQtYWRscy02L2lndEBrbQ0KPiBzX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xl
LWNydGMuaHRtbA0KPiANCj4gICAqIGlndEBwcmltZV92Z2VtQGJhc2ljLWZlbmNlLXJlYWQ6DQo+
ICAgICAtIGJhdC1hZGxzLTY6ICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVsxOF0gKFtpOTE1IzMy
OTFdKSArMiBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFsxOF06IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0NDM2L2JhdC1hZGxzLTYvaWd0QHByDQo+
IGltZV92Z2VtQGJhc2ljLWZlbmNlLXJlYWQuaHRtbA0KPiANCj4gICANCj4gICBbaTkxNSMxMDcy
XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vl
cy8xMDcyDQo+ICAgW2k5MTUjMTIwNjFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEyMDYxDQo+ICAgW2k5MTUjMTQ4NjddOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzE0ODY3DQo+
ICAgW2k5MTUjMTU2MjJdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUv
a2VybmVsLy0vaXNzdWVzLzE1NjIyDQo+ICAgW2k5MTUjMzI4Ml06IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMzI4Mg0KPiAgIFtpOTE1IzMy
OTFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNz
dWVzLzMyOTENCj4gICBbaTkxNSMzNTU1XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8zNTU1DQo+ICAgW2k5MTUjMzg0MF06IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMzg0MA0KPiAg
IFtpOTE1IzQxMDNdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2Vy
bmVsLy0vaXNzdWVzLzQxMDMNCj4gICBbaTkxNSM0NjEzXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy80NjEzDQo+ICAgW2k5MTUjNTM1NF06
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMv
NTM1NA0KPiAgIFtpOTE1Izc3MDddOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2k5MTUva2VybmVsLy0vaXNzdWVzLzc3MDcNCj4gICBbaTkxNSM5NzMyXTogDQo+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvOTczMg0KPiAN
Cj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4gICAqIENJOiBDSS0y
MDE5MDUyOSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF84NzIxIC0+IElHVFBXXzE0NDM2DQo+ICAg
KiBMaW51eDogQ0lfRFJNXzE3ODk3IC0+IENJX0RSTV8xNzkwMA0KPiANCj4gICBDSS0yMDE5MDUy
OTogMjAxOTA1MjkNCj4gICBDSV9EUk1fMTc4OTc6IGJhMDVmMjJkNjk0NTU5NmZhYzY5MWU5NTJj
OThmNTY2Njk2YzI0YWQgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGlu
dXgNCj4gICBDSV9EUk1fMTc5MDA6IDgwNTlmMDk3ZTI1ZjczNmJiM2RhMDlhZjZhOWIyODMwNzlh
YmZkNGYgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBJ
R1RQV18xNDQzNjogOWQ3Njc0MWU1NmMwYTgwYTM4OGY2OWQ1ODlkNzQ5NzA2YjM3YmMxNSBAIGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gICBJ
R1RfODcyMTogMzcwN2JiNDI2N2RlMjJhMThkNjFiMjMyYzRhYjVmYmFmNjFkYjkwYyBAIA0KPiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+IA0K
PiA9PSBMb2dzID09DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQ0MzYvaW5kZXguaHRtbA0K
