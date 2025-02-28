Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937BEC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 11:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93A210EC72;
	Fri, 28 Feb 2025 11:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNNftiEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF7810EC68;
 Fri, 28 Feb 2025 11:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740743645; x=1772279645;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=S623EmarW+bHvLXVEF1NtTHee9MP5FeXa+DZvZLOyXc=;
 b=LNNftiEkTabN64jjFfwVf4JQIUa+ptn87Ht/oPixG5f957NO8SWx7zQD
 gj+KYTWwvK5LY253s3duI19xVRF3/pX/m4Tgu6It4zZ9DVAEVGh5PoBzy
 KFc4VnT4iAj44LKhOe68p7H7z4cXXwUFM05Ec8GEVbiJsP91ww+fs8xWy
 MUYVUOip55BThcm+ypPHulA0Wukak6xly4XUNrEhIyH0+9I8b2x6x1mxw
 Yn7pNNgphTgbGcT4GXyxnKegHrPhJAIZB7Jp6hK4K72vV/YOjX8L3ygmb
 xL6wV6gy/wTdj26EMapxSfcUFqdAccz94f4h60DStAhCI7XVtXcxdpJA/ g==;
X-CSE-ConnectionGUID: 4m68lmEvQleJ9VZJxEdlTQ==
X-CSE-MsgGUID: hF8lbBXgRSemz7y1RwvwzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41797265"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="41797265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 03:54:02 -0800
X-CSE-ConnectionGUID: 7Ik4DUv7QqmLX5Bjptfxgg==
X-CSE-MsgGUID: 4E71I/ZfRwS4GagAYMfxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122551993"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 03:54:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 03:54:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 03:54:01 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 03:54:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=db+n3wiOesaBOwFbZZHatoUVRx9HVX6cys6iFjnTFAeDZisElmX0FzU9eyDx3dJOJhT+fOxvciX/EKNiCJtwVJL3JXVAqXjzwtzwip2CXKs1NgD4Xn+ExcmM3pNirzKKTfy8n5diEYar1eFTIigjSHnzh81uVRX5Or0wr6FtQ7svssMrSROT2ZnGx7SU2UmtAsPuwPwu8jHevvxnucR4KjLPlO6pCGEXgxHBlrnUmkg2YpWhhG5mdd/u6+jdfRsi1HxdkxMCfFwure/z9KmmzMaWFuZGkXtJOotoosYILgLJtCW/09TTt37F+cFaUsizeM9z78WCiTFb7rUUAlKIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S623EmarW+bHvLXVEF1NtTHee9MP5FeXa+DZvZLOyXc=;
 b=D5riD8yjZoPOKOqB2ou5v2WykBBlS2Cu9ewS6gApzIK9mZkHwDTyYaVh7OskFMRLXNDvzxh9nYPwfXozytNORfF/I2F9ciPkvtiwC3GL2plSFGbsjBzzUmssGwe60lhO2T3YQsEYpFM2arKvRc2e/98/GdFFSs+d1V4MIZvn7zpparjftoML7ux9yz/MPbLUVLfjJaEyPMouRajASI8PMDaQmKdZGFvi2J3cLHKbKkqX9AhRUr15WZuu6Tmd18iQ/PoQU9/y3HoO3eYnnY40VYKg52ClPOtRf3bG2llA9xnwwDeLOkwChifQJ+lO7ZkEItziQJT18GTOkDWWp5E3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 11:53:16 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 11:53:15 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBJbnRlZ3JhdGUga21l?=
 =?utf-8?Q?mleak_scans_in_igt=5Frunner_(rev5)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEludGVncmF0ZSBrbWVtbGVh?=
 =?utf-8?Q?k_scans_in_igt=5Frunner_(rev5)?=
Thread-Index: AQHbicAuLXy7ZwJMgESbG6HtBrdIf7Ncm+BQ
Date: Fri, 28 Feb 2025 11:53:15 +0000
Message-ID: <CH0PR11MB54912675C3ADF644F4AAD18AEFCC2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <174073185638.3133457.7448117036983986046@b555e5b46a47>
 <7c74dc20-592f-423d-8c9a-0e34c9926a65@linux.intel.com>
In-Reply-To: <7c74dc20-592f-423d-8c9a-0e34c9926a65@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH8PR11MB6974:EE_
x-ms-office365-filtering-correlation-id: 1c8fbba3-f23c-4082-ffa7-08dd57ee7c68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VDRPYWpBS243aXR1U0NWdk5wWWl6YnhsQ3A2NStOK2VlR3RLTE5yL1ZYTzlT?=
 =?utf-8?B?NEd6bE5lRTZoelh3RGJla05RQ0lkd2hrYmZsZzArbFVhYkJNZzg0TEhjcklD?=
 =?utf-8?B?U2syVHRTcGR4VnFITWlIZ2Uzckp4TzlHWW9CdWl2RnFJb1paMWNIbDcxNmZF?=
 =?utf-8?B?akVXc21KMVlXdytLMjVLWnVkSlQ3MnZyTTdkbHNkK1V6aW9pZU5ORCtzalUr?=
 =?utf-8?B?QnlldUlNV3dWS3Y4K0l0OVlDcVJlM1k4Uk5LNjY1bmFEbzBRSG93Ym56RFA4?=
 =?utf-8?B?THdWbDVKSkJxWDRGOSttd01odW5Jb1NESVV4Zk1HUE5wcDl0QW1Ock52WVB0?=
 =?utf-8?B?VkRYWksrbGVNNGFIc3Z6TlE3UEIrK3FGS1BqVUhGYXdtQTBQems3cUsvbUlx?=
 =?utf-8?B?RGNQMjNIcTRnMm4xcjJ3Z0lnWkY0TGlCUFo2T043RS90UVUycnJha3gyZHo0?=
 =?utf-8?B?dldOS0dtZHppNlpJNVFxQTdrNEhFZ2dFT21tZVQvSXYydjF1WVhrVFExSWRR?=
 =?utf-8?B?aWE4Yit0a3ZtTWZZNU9vZ3Z2WXQxSlUzS1ZBcDBWMkd3RkwzcnBrVFZNTmZQ?=
 =?utf-8?B?TXVrK09oMGVnTHRnR0t2WkpQSWUvVTA1dGdyUkFMdWxSL3dnVVZiZG4xWEE2?=
 =?utf-8?B?WDZqcjJINC96MVhVejU4emZhZlV1YWlhRDRneVhDRU5sWE96M2dhSWs4OEpC?=
 =?utf-8?B?OVdJeXRoWlJNTzh5SmFCaW93ZlRUeHpoaE9CZGVmQVo0VlN3TU9ORGwrMy9z?=
 =?utf-8?B?VWhxVWFKTlU0NGhHWUtvUlNEWXJHMjEvc2EzN1FNRFlZaTljZUIzRkl4UGta?=
 =?utf-8?B?M2pCYXJ5aFZYd29waWRZa0ZvNFBldEplUHZjRW9TYUFBWjQ0NVJqUjFSSGR3?=
 =?utf-8?B?czJHbFBpQzU5K3BoUzMrUk1vWlRDK21BSDZkNmxSbWNKNk9rV0tYWVZzOUpN?=
 =?utf-8?B?TUY3eEpLWmpYNUVQbi9rSGllOGlOVlJKK2JPYTBlZ0pOM3o3dVZLbGtKTkZm?=
 =?utf-8?B?dFdsU0wwOGxQbFFsblM5Z0cwZ2d3eGZyY2FtUUR4dHRIeXc1Tm1mNDlDVUl3?=
 =?utf-8?B?dlJiQVpWanErS2pOd0tyZVdlUWVVZktwMVFvQy85Z0U1Ymlabmp1YUgxOFlO?=
 =?utf-8?B?OWhzdHRNNFg0WEF5SFlTOFMvUHYzSHR4eExkODdDWDJDTk80SGNlR2R1ZjBB?=
 =?utf-8?B?Q3FZMlJVOHRHSWl3UjBvVjAvY3Q0aloyUEpKbyttdHhTTDNzY0x5RWhJV1Y4?=
 =?utf-8?B?QjZTWHA2TUdzNEh5dHUwLzhoNWxuR3FkRkhPd1dXQUQwZ01XQklaZ0VtcFFV?=
 =?utf-8?B?NTYxNUJHWVdkeDdBWlhkSmdnaENNNngzbjlSVTcwSWNjRVNTMVdJRlRTSFc3?=
 =?utf-8?B?RGRCbERoS2p2bVh6NkFod2FwM3RSQ0NzYjJoWTJ3UlFhODQxenpDNDRLTUF4?=
 =?utf-8?B?T2o0TXNYUzV5cW9LL0ZKKzV2UHJTbExUNDdNa0l2MGxwS2lKelpLYzF4OVc3?=
 =?utf-8?B?U003ZTQ3bGYySEhXUkJSYW5LTkFnbWpDQ2Q2d1FTU0ZhN1VLb011eWIvdmg1?=
 =?utf-8?B?UUlVVC9qU3FrcHd6OVB5eE5sMWpBTTlsY1FyV01BbjZPb3ZLV2liVGZ4OXY0?=
 =?utf-8?B?YU9UdXFsaDQvVmtNV0U0aDZBSk9hdDB4TjIrUkd3dURPM1o3MW82SDVGQlZX?=
 =?utf-8?B?WjdidW9TOFY0TmhHbDE1bjhjZ3ViVmdkTmx3aEpTK2xRY1g3bCtsUE5LUkNm?=
 =?utf-8?B?VzlRVFVuTEVLcXAya2dqY0x1TkpZSGdQQk01NnIybDNmUzdhMVRFQmpSUHpo?=
 =?utf-8?B?MXFQcnd2eUNiMVVxT2kwK2ZrbUJYNmNmWE00R0k2TGtWMFlodFRRQUxrc0Rq?=
 =?utf-8?B?RWN2a1lPY1BmRUwwajJtZVJLY1Q0MjRucHpWRWY2aGQwTUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGpZVHZqT1R1STBPQWhCbkJRREczWTdGRStGSlJJaTBhQmoyVlpUWHVjblQx?=
 =?utf-8?B?T0Qzc2MxcEMyYzdIdFR1T0QycWFORkNsNlR3N1NjSURoNE1zL1dTT2RuQjl6?=
 =?utf-8?B?MjhyRVdmY3d6Z1BMVW93TTFzVnlSRFZtZlg5MzRXZXlqNi9HV09iZTkzZUJQ?=
 =?utf-8?B?VGs5NjV4ZG4zR3dlQjN2bXNFOCtZT2FHbnpGRTRacW1EdzBBajNPWHV0eThy?=
 =?utf-8?B?MWpHSGZWMUVrMHgxOWpLaHVVWU5kcWhRKy8wZktsbUk0ZEt3VURYZS90NXl4?=
 =?utf-8?B?YjZrbC9ORXltSXpWVUFmSXlyaVVlQXhYaW9KdGJKR2RGU1JVKzBMTUQ0V0hK?=
 =?utf-8?B?QkNZS0tSaDA2SmRXSTlybDU0eEJEMTE4ZUluUlFNalYvWmpMalB2YkZLQUJ2?=
 =?utf-8?B?VGVwZXpjVFlnYXg3L3QwWXQ4Y2JJeDZFVlZLclF3eE9nTnBvaUlUeGJBUHFu?=
 =?utf-8?B?dm5DYzRjYVFTdjZLYzJCZzhYWHVwRlRXZWsyYzNqaGVmS0gvK3JIREVKMWlX?=
 =?utf-8?B?QndHN3oxYzUvYWJSWU9LRWJJWHU5cHk5cmJEN1FNblhOcUt1WlFPaytZRGpv?=
 =?utf-8?B?QmlZYnZlS1VqT2R5NnpOWnBzZUJEaHViV2RzTFBuMkxhOHByMHV0d0Nkb1kv?=
 =?utf-8?B?bWVUZ2taMlZ4MU43NDFUUDh5dFZvN1RWNDBCcDgrZEw3VURqZkRxbDV2djNl?=
 =?utf-8?B?UUIwTEhKV3E0UnkzZjFQOC9VS1JFQjNYeTlRREhZYWZNc3lrSnc4U2pXdklT?=
 =?utf-8?B?TFVnSy8rQXhnaHdaV290RFN5QzlrTWZGOUZQNllRYzVSbDBxL0VhclBDQ01N?=
 =?utf-8?B?MC9MY3FhQkZLUkprUm9FTU1UZ1RzOUU5TTJ3Yko5OGpPODJ0bk9rUThTUW5s?=
 =?utf-8?B?UU90N3RCV1lIWWFuMXpQSmtxaDh2RUhKRFM0US9oZlBRYWNnWmlyT3pPQm1l?=
 =?utf-8?B?RmN1SlF6aER6dzU4d0lEQ3VUbjRGNzRTcHdrYnF1ZVpsL2lQWXRySldqUHdh?=
 =?utf-8?B?YnMxRUVWY0szMlppMG1jeVF2S2VYUnU3Vlc3Yk13L3BseGlDSnhLa1RlWXpn?=
 =?utf-8?B?dVptYWs5THduRyttZEs3eVBrdjh5RmFHY044R2hGWDVUM3FLRGFjQkFEc2Ro?=
 =?utf-8?B?anM3SEZnaGdWRGFFV25oRUVMWjQzUFBEY2h5OFU4UDR6b3grNlZSeE93MmJP?=
 =?utf-8?B?YncvcE1PemppWmQrYnUzaXpPZjRDWHdxRklVNUlBNHdRY21oMnEvMG1NRXVP?=
 =?utf-8?B?L0JSam5CNHphNjBsYkZZZWUrUWxyTUhBL2ZYdkd6SUg0NGlpQXN0VWw4azVn?=
 =?utf-8?B?Q3hiQk1yYjdQRENEZ3p2THlMQmtkaHBOc2FoZHhveGhZSmVhQWYzbVdqSHJ3?=
 =?utf-8?B?bVdDQ3VyY1R4bEtGMXBhc29vYXpMbkFiaFNHSWEwNGlUU1NNalZaT0dFTVJC?=
 =?utf-8?B?d09WWlBpYWFGZlpGb2hRNk9NYzQ0MmxYQi9jSkRXekxoaDV2a3p4ZmJWZEJC?=
 =?utf-8?B?djdZekdVQ3JkbGdybUZlYkpRaENkenRKWXBUZDFFR2Z2YXBUZS8zbHZZNCtD?=
 =?utf-8?B?eTd4YUk4V0l4WWZSLzh4MFhQOCtMdFJNamg4allud1I3Y2psNkY3Z2ptMlF0?=
 =?utf-8?B?ajdhR2d1NUh3MHJOS05nNHhTcEx5eW1nMUZtd3Z5WW56SDI5WjlsRG9LOFdC?=
 =?utf-8?B?L1BZNkpkcExJUklTOWs1MytiQ2NGNE8xN0FYN2FiRWNacnJtTSt3UjUyUjEy?=
 =?utf-8?B?UEpRc3B6Z1NXUkN3aTd1bUI1RjF5MDV4YkkwZ0g4T3Q3K1Mrd0pHenFiNXR5?=
 =?utf-8?B?UkR0Qk5ENGxnMTZ1OWNtRHJtaWR6RWNlL0VVdWwxenpzaVhtcENXdDFPakh2?=
 =?utf-8?B?NkxmSXltanJheWtXMEkxUjRjcGdTV0kvVHppRGlOMkVLM0tRY3NQWlZhSGUw?=
 =?utf-8?B?WkFXMFpQQmozWmdnSm1RQUFDWXlialBMS0t3Mi95bndRQ1RJN3dqL3VIY3Fm?=
 =?utf-8?B?c0R1N0djUWNoY0tEVG5BTkI1dGowTk5GVW5qa1I5MDZVdFZ6UUYwTmUvRVJH?=
 =?utf-8?B?N0hDaUVuaHdaWDFPTi93UmFXZzBPYnZMTGR1S0swR2FUM2VnNnI1S244M0wz?=
 =?utf-8?B?a1ZCb2Z5SVlFYTFJRFZRblJNNHh2dm81UlNlRERUYTY1VTRYVVU4cVpsak1r?=
 =?utf-8?Q?2BwwLWfcG/oOuccz0LUSfBiZxpLjPyR5r2zv92i4H/cU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8fbba3-f23c-4082-ffa7-08dd57ee7c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 11:53:15.7542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKkXZconnOaeuUyRwGgl80wCtG54MTAFAXv304DnIDobjVXrquTUIwLV/SPRQaOMZYh11GaKjIxAb+WmLsPYn0j2vOhBE7LSNJ0ges7GB6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6974
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzOTk2LyAt
IFJlLXJlcG9ydGVkLg0KWGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90
IGJlIHJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNl
bnQ6IDI4IEZlYnJ1YXJ5IDIwMjUgMTQ6MzcNClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDi
nJcgWGUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgSW50ZWdyYXRlIGttZW1sZWFrIHNjYW5zIGluIGln
dF9ydW5uZXIgKHJldjUpDQoNCkRlYXIgSTkxNSwNCg0KT24gMjguMDIuMjAyNSAwOTozNywgUGF0
Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBJbnRl
Z3JhdGUga21lbWxlYWsgc2NhbnMgaW4gaWd0X3J1bm5lciAocmV2NSkNCj4gVVJMICAgOiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0Mzk5Ni8NCj4gU3RhdGUgOiBm
YWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBm
cm9tIFhFSUdUXzgyNTFfZnVsbCAtPiBYRUlHVFBXXzEyNjc3X2Z1bGwgDQo+ID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkN
Cj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24g
Y2hhbmdlcyBjb21pbmcgd2l0aCBYRUlHVFBXXzEyNjc3X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRv
IGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSBy
ZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAg
aW50cm9kdWNlZCBpbiBYRUlHVFBXXzEyNjc3X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcg
dGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0N
Cj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNl
IGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhv
c3RzICg0IC0+IDQpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBO
byBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1
ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBj
aGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTI2NzdfZnVs
bDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVz
c2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfY2RjbGtAbW9kZS10cmFuc2l0aW9uLWFsbC1v
dXRwdXRzOg0KPiAgICAgLSBzaGFyZC1kZzItc2V0MjogICAgIE5PVFJVTiAtPiBbU0tJUF1bMV0N
Cj4gICAgWzFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUv
SUdUUFdfMTI2Nzcvc2hhcmQtZGcyLTQ2NC9pZw0KPiB0QGttc19jZGNsa0Btb2RlLXRyYW5zaXRp
b24tYWxsLW91dHB1dHMuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfcGxhbmVfbG93cmVzQHRpbGlu
Zy1ub25lOg0KPiAgICAgLSBzaGFyZC1kZzItc2V0MjogICAgIE5PVFJVTiAtPiBbRE1FU0ctV0FS
Tl1bMl0NCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50
ZWwteGUvSUdUUFdfMTI2Nzcvc2hhcmQtZGcyLTQzNi9pZw0KPiB0QGttc19wbGFuZV9sb3dyZXNA
dGlsaW5nLW5vbmUuaHRtbA0KPiANCj4gICAqIGlndEB4ZV92bUBsYXJnZS1iaW5kcy0yMTQ3NDgz
NjQ4Og0KPiAgICAgLSBzaGFyZC1kZzItc2V0MjogICAgIFtQQVNTXVszXSAtPiBbRE1FU0ctV0FS
Tl1bNF0NCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14
ZS9JR1RfODI1MS9zaGFyZC1kZzItNDMyL2lndEB4ZV92bUBsYXJnZS1iaW5kcy0yMTQ3NDgzNjQ4
Lmh0bWwNCj4gICAgWzRdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50
ZWwteGUvSUdUUFdfMTI2Nzcvc2hhcmQtZGcyLTQzNC9pZw0KPiB0QHhlX3ZtQGxhcmdlLWJpbmRz
LTIxNDc0ODM2NDguaHRtbA0KPiANCg0KVGhlc2UgYXJlIHVucmVsYXRlZCB0byBteSBjaGFuZ2Uu
IFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4NCg0KVGhhbmsgeW91LA0KDQpQZXRlcg0KDQpbLi4uXQ0K
