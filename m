Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9AAD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F7C10E3D8;
	Mon,  1 Dec 2025 13:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdCcxyI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD97B10E3D8
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595162; x=1796131162;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WXL++O8ebqDJfvo2pBq5Q9Fz9uxYoO0ZRHiicrjm1/M=;
 b=PdCcxyI84DsDhQ/p+u9IM+bsmHDAPPmV2XMVcI+amsy40412PNbTtsdp
 SJzRecyByliZPrhViXroPhr9qoAnDy1BaT6be97DVGr92+7gAXyf5DWrF
 UF2jS4XBPH0SsFW+WWjKnn0O0Tejkwm99Xrzq/ESDO1ljk6UZNITf+MwW
 Bi42htSAdONJjc7FiK9wDgLcXaxHeAFs0AE8dMvYYBAz0k8fMQ0EPYOYn
 isZzbir5R0Iz5MWqaxu9IThWi3OV+7jOTAkOqlKmMS9J5dDObirHVpv+a
 USSfWkWwilBkWTK2OTBRkkgk+pKF6EHymX+WxWxOOleO51mZAkdinEE/B g==;
X-CSE-ConnectionGUID: a0Z+cRQdRX2Md7m+uGL8wA==
X-CSE-MsgGUID: k+YDeQu5TE6uTYHIkApMyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83923598"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="83923598"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:19:21 -0800
X-CSE-ConnectionGUID: 4lT7IXuSSOiDL+Sl/BQScg==
X-CSE-MsgGUID: UPqwR9FLQ/GrcUblikWoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193730970"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:19:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:19:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:19:20 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr3qyT/Drc3QZI3RhLDjru1KFQhUrqYbfon2wxKudj88YoUBviRiNNMzrlhj8O7Bs5Xri7hx3Qaa7tS/oIxSC+oFBhubBwnh4fXtZk4drelKCq9mbqPg3fqLgO8IB3ahzGma/BSNatx+6iDKnZ25juAr3rVF2MeNUEY8tKl9sSZ5wOm/lbfyUNiKgzxIOvtNL/3Dpqm1QTp5MrmvuOYe2+D3WHhIy/obAmEXmQ61uTVtDAM/7ajtsvaiJQZVuLmVHTOa0fIRVmJocHmGZKHdyp5e6Qghji43mA5nRn77ZFg0wJvCw864xuc7mUXtdDiM6jjd4rgWzwNnVuWKZ/JqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXL++O8ebqDJfvo2pBq5Q9Fz9uxYoO0ZRHiicrjm1/M=;
 b=ArbGJNZjzKQzZOAP+ZPV3/IggKhw6WVHqEfwtOy++ePRKiRePP+bfsPWEtEUeJGtxIDTZXCzA5MwQas3Ov/pSZDZnEWcgd5Fu4A+mpGeW/suqQq7QgC70+xDVDVbSFkHrRnIIby4QSqiQ6d80HLd0rEe05LP7JPG5oHKTnUP//aRHp1HNercYvPYlXcsM0Lqsjip2TBZ9KgI4nokdDd9WtmpMKUVLYekjGt25GxDmFq5Z3xK4ugCkngvapvMK1Kfj0BRgnkH52afi3W5Wz5qQ9Ogofs30u5vQu3UDaGMrWC8/4gn1CR5rbNbWAgFV+t/GjOI1lNmbrnojFrpcvIqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7964.namprd11.prod.outlook.com (2603:10b6:510:247::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 1 Dec
 2025 13:19:17 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:19:17 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM
 multi-GPU migration test
Thread-Topic: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM
 multi-GPU migration test
Thread-Index: AQHcYqFzWOUAEJoxoki+VYYqQrcMcbUMxN+w
Date: Mon, 1 Dec 2025 13:19:17 +0000
Message-ID: <BL1PR11MB55257E5691538DF0D34AD1C684DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-11-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-11-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7964:EE_
x-ms-office365-filtering-correlation-id: 16de036f-e665-4d6b-bafd-08de30dc3b0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?RUpLRTR0bHhDaVNyUklOOG9xa2pNV3FaVFh6WWFuR3dTUm9lMkVQcXRpb2pz?=
 =?utf-8?B?NFRkLzlsTi85R3pEUEczSlFZUkVxMmhFdDJ2MmZvdExLNEU4dmZIYXFJM0lz?=
 =?utf-8?B?UVF6RVBWN1hrVHBJSU13RUdyRmRqWVBtK2tLLzAxN2VEdnBRcVRPOGlnQm81?=
 =?utf-8?B?bVhqTytJRVJJTUZ5aGpjMlNndVY3SDRhU0llRkMxaGJOVm5CS2Fsd3RXWHV5?=
 =?utf-8?B?NGhicWhpSVY2c1ZlRVBsTnNnNWVYaXdZOFVBY1NucU9yenVndm5LbGpoYkhP?=
 =?utf-8?B?ZEFpVm05eEpiZ0k0MXc4bW5TSWJRNnBlQ3FhbHIrczZzTjRRVUZZTVNHdGFi?=
 =?utf-8?B?LzZBWmxlK1NrcjlheFhMLzJIbE1IR3ZIZUYva0tVdlF0SjJqQjEzcTNjUlha?=
 =?utf-8?B?TU81QUtrOGpmdzNzcjdoZkpncFZMYXBVUTZTT3FKaXN4WjdpemVzSXBtNEYz?=
 =?utf-8?B?WE51UFVmbkZEOWkxWmYrTC8vNnVNNXNtZ0EwMWNXZ1N5dDl5eEdoRHdEZXBW?=
 =?utf-8?B?VThTbkdxd0J1ODdOeFZuWHpTVFREQkgvMGhITmgzSFh0S0RFdWJpamtKRkZS?=
 =?utf-8?B?Z3JldzhzdGh2TjNmOFBaQ0pBNEVGOTh4N2o4VExzVVpvRHVKd0lEMFVzMnhu?=
 =?utf-8?B?b2N3eVMwK25BZ0RtK05VaEUvNWozNUJqSktiNGkwTzcwL3FXU3V4SFZ6WEh1?=
 =?utf-8?B?b0ZGTVFmaXY1dks4NytHM0ppM3lWM3lBUGI5MWZ6WFVNNkFqTm9MbXdGQ09C?=
 =?utf-8?B?L1oxQW9sazZheU1UVFFjeWp0QjZVS1BxVlFHdDRrMjNnSDVCajhXdnBTaVVD?=
 =?utf-8?B?dDVYTyt2d2lZOTVhb0NPOTNVYkZjRDQyUWdLdlRiVk5YS1NXK25QRkFRSnNI?=
 =?utf-8?B?elM0SWNadnh4eGp6Q2pwVUZISVJLNFJjK09sRzZ5MEJldHdlMFF5UzlrdnNJ?=
 =?utf-8?B?dVFqc0ZISXg1VWZhNDRXU0FuOUZYeGwwbVlhaFBoRDFrQVVkTm8yK1ZIUFpL?=
 =?utf-8?B?c09VNDFjc25Sc3ZaTEduWDBHM1NsZVJpNGhvb0g1TUJhWG5hemhtbnltcElz?=
 =?utf-8?B?QlFGNlM5anZRREt4THpOZG9KWUVKSGtCeGFRMnp1eVUva2o0dGRRSmlLVE9j?=
 =?utf-8?B?dzlCWE9ubS91WFI0U0c0YmR5eE8vbVdqT3REMmVhVU96RVJhUnphTW5YV1Ri?=
 =?utf-8?B?ejh2cmJ2SzU3di9KSFZxbGhVQk1TNXJMZkZYQVR3R2EraENaQWRVMndGNUR0?=
 =?utf-8?B?SXpkdWUyQ0NVdFJuWUtJOWhMTlByK2hmL0gwMjQ3ODNiUTV2NXRWTWl6Zkhi?=
 =?utf-8?B?RzF5eEltSE5hVFBZUEN3ZGI4RThobGtVSTNWeUp0UjNIQ1Yrb0txQWhLMzcv?=
 =?utf-8?B?UlczaTIrUHdmUGVoL3BVcVdRam9la2ZFK1NDNzdxSy9Uek1EdzVJMW5PTC9K?=
 =?utf-8?B?OGZnRTdmRTNpaUhHWGlWK1BkZlBhMFg0cTNqdU1CUzNZNjZMZ2k3YzJNYWVV?=
 =?utf-8?B?N0t4WWMrMWRMbVRadGxiVnQ5NGc3SmlIWElkR1g0ZlVtRXVoYlE3RjdtdU9T?=
 =?utf-8?B?WVNBZzdoVy9VRXJFaVJTL1U4eldjb3NYTVVqWXU3aE1lRTQ0ajQvTVR1cmky?=
 =?utf-8?B?NVBRekdsbUFHT1RTMHhDT2k5aWxLTHdPUlBwUkV6dFBkOUY1RjZqQjhwYy91?=
 =?utf-8?B?bitNWWhtYzFPeXFZbUhKRVVrb09vMGM3RVdrUjQxeEI4aXVIR1BzOW5FQ2da?=
 =?utf-8?B?U3MwaG1VS1FVZW5rS1pkU3BqMjJab2oxUUpsYkswaWN1cEZWcFVXUW11eUsw?=
 =?utf-8?B?dFdlMUo0emVqUnduUkdyQVBHTWpYZjM3V1pwOGVJR00vQVFFTGZvY2hHbXNh?=
 =?utf-8?B?a2wzQ1c3RStNZWNxa2NITHVGNURqQXdWQ3I0YnhyQ1BocUYrcGg0L0EyMmtX?=
 =?utf-8?B?SHJ3MlJYbDZTS0dKZ1MyNHpzTFIrTWZpVkxBS1I4UFBVWEo4bWNRNW5wem5L?=
 =?utf-8?B?WXpGLzNLOHJIaGhFekFpZll1YVdEY1BubzBLMEpZQUdCL3AwSVNmcEVTbWFO?=
 =?utf-8?Q?zQv7X/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWR1NlNvakRWVHVNSGxhaHBiQ2l5c3laRUdrdnlMc0k1MERzQ2ZIT09DbkFl?=
 =?utf-8?B?NzZZY2ROVWFkK0FOWEl2MUlHQzFqU3d2V0RuZzNWK3gzcWFia0hkeEFFc2cw?=
 =?utf-8?B?L2NPMHBSWlhhdy80TW4yendNVUFhV29ZQ0p2Rk92ZitxM1d3VjRYRGY5YXdS?=
 =?utf-8?B?cWJTdDg5cnhYN3lHTytYM2xWbEVoVUl3MUsxQUcwRGY5UFhndG5SVW1Vd1RN?=
 =?utf-8?B?QVFRbWlTeVd2NWxSUkNWekhYdUhmeFpON2Yybi9hWVoxTWlIZVoxS1BSd1dK?=
 =?utf-8?B?Unh0OG81OEcrZEU3VmQ0TUN5Y21rdlNXeGVlQWZkZCtIUUY0ZzZXb2I3NFlq?=
 =?utf-8?B?OVc4ZEtQL296TFc5NytkYUUrbmNpL1UrSzFWUyswa3RnVWZtaVptSjk1SVUr?=
 =?utf-8?B?VW5RRjdJSVBpOTRETVFhWlRuYTVUOE9wYWtjTDJBSjFoeWZja21aNkdIcXVh?=
 =?utf-8?B?M3UydDMyd0JUcHpyQk9WeEdXTmM0WkgrTG8wMTNTSWxWaXZXTDB6R2p1SUM2?=
 =?utf-8?B?TlFSd2l6VXo4a0c5U1F3K0g0OXREeFFRY3BNM3oxV2ZFMXJxcUlZZGdTWUJ1?=
 =?utf-8?B?UEFSVTVYTjQ1UG0wSDlZQk9ZMHF6cThPOEQ0M0h3VjRSeDBIbjRqSTVMRnRr?=
 =?utf-8?B?S0FvbnFOVTZaV204Z0hlSFBSMGlHMS9UN2NuZ3BVUnArMTU3ZGFDVUdRMDVl?=
 =?utf-8?B?QUF0UERlb1RaNG9EV25WM05wSVNDckE5dVpBbXc3VVVRcnBrYmVlbEVJdXpx?=
 =?utf-8?B?SzVUalM0UENGN1dTSWFFQ1pTQlI4OWhxUk80SVQ3QzVsdENmM3lsOEhXcjVB?=
 =?utf-8?B?S3UrUlloQk95YVIzZ3p1aG5id2Q4Rkw3aGRnYWo4NDVRZzRuVWhRS1hBdHdq?=
 =?utf-8?B?WGJONDRkMnpMcmxVOHJ4UXAwN3IvQjN0eDVsRmNJUGdoNnJ2NDF2Ry9XRFFm?=
 =?utf-8?B?MHRlZjZBbGNtN0lZSkd0VEcrdDZvc3FEanZNWm45NFhoMEFWeWdnY1FkOEpj?=
 =?utf-8?B?d2JMalpuM2I0NTM4b2k3cUdiVGxNWDNJeWVCOVFGT0U5TVljcStBSUU1OCtU?=
 =?utf-8?B?Y3BKLysrS0xNeFpJank2T0FkZnhQbU9oaGwvbDBma0xzVTFoOGMrTk0xRm5o?=
 =?utf-8?B?VTB2VC9lV1RHWm9rVnIvMjJlUFpYL2NlREZMaTlBSG16dTVpLzFleHV0eWFG?=
 =?utf-8?B?ejVuY2hlV0lLd2ltREd4M0E5VUF1LzMrQ3dIK3lSbVh0cStub2ZySTB5eHBL?=
 =?utf-8?B?dUlVVGlnajRaZ3JITDF3MnpWczFXM2E3ME1aQ21kbHVUZHYzcGRpc0ZNMmtL?=
 =?utf-8?B?cWZDRlJHVXRiS0doSXZ3NWpub2E1V3pEVmxCeUJlN2czaXZVOCtHQThGNit4?=
 =?utf-8?B?Q0E0VzA3K083RmF5QmFmejdTL01HMy9ObGtBdnpPeTB5WG0ydG1FbXZWRVFv?=
 =?utf-8?B?NXFTeGRTNFNFREtzSEtxNVdNdWFMejdCdFNCc2czOHo1NzdFUkhiRFljVG9z?=
 =?utf-8?B?VFo4ZGdMWTRXcHR0Q1YycFFueUVyQytmR3ovM3NWTHZycU5qaDU0bWF4UDJt?=
 =?utf-8?B?bkxkd3dVbjZUZ2VJZVo1WnZTUHNGd0VKSGlSZDIrNndyb3ZYYndSeFBWRjJG?=
 =?utf-8?B?ZGhzT21iRFpHTTdjbXh3bWVLb1VhbUFDU0ZYempuWjdMRWFmNGNaU2tIRXZl?=
 =?utf-8?B?NzBGTkU2ZktMNW12bWRmY2s3U1dZVE12anlXaWxWalJZdVZoTmlCRWRPSzQ4?=
 =?utf-8?B?R0oybzI1YXdCOGtqeEZucjl2OVdpZmhwdkJnVkpKV1c0aG5WRW5kQ1RaMTBO?=
 =?utf-8?B?QkRIVnB0WFh2c1c2bzFLZVFTUjh6RTdkMmJHNGpkdUFMZjZ3V2QvNk42ZUEr?=
 =?utf-8?B?cGV4S0x1ViszekttUGVyYVQ0KzVxMHBzS0RGV3RNOGVlZkVDZkoweGFXWDVE?=
 =?utf-8?B?NGlYMXdIa0ZnWVdqcFI3SVJRRVNRemxoRjBtNFBVWlN3Vkk2M0xueHViR3Uv?=
 =?utf-8?B?bFRxaVNEOVlPM0tDMU1OUnJMN1VXN3FQVHRlRFYzZGJqeGlCUk9UajJ6dm4y?=
 =?utf-8?B?ejhreGRtZXZ5cTNxRkNWNW1TVXJhZ2pZVDRKZ2tGdkk2L1lvUnNCendaUmdw?=
 =?utf-8?B?M3JuM2JMZ2J4TklxUEFaRWFXNXhkRjU5NnhaVXNIbFpvbTlneTZRQmZIbVFR?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16de036f-e665-4d6b-bafd-08de30dc3b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:19:17.4409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lyeENM9RNJLBX7P7/+nARDjjDPsADzPJDXTCTPovOX0j6+2exzqYh8oNya9IBXCZAmey69D9BCMjTSxqMshSi601KOEWxhR6/SrkIe9IW7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7964
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBOaXNoaXQg
PG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDEsIDIw
MjUgMjozNCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFNoYXJtYSwg
TmlzaGl0DQo+IDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+
IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHY5
IDEwLzEwXSB0ZXN0cy9pbnRlbC94ZV9tdWx0aS1ncHVzdm06IEFkZCBTVk0gbXVsdGktDQo+IEdQ
VSBtaWdyYXRpb24gdGVzdA0KPiANCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJt
YUBpbnRlbC5jb20+DQo+IA0KPiBUaGlzIHRlc3QgYWxsb2NhdGVzIGEgYnVmZmVyIGluIFNWTSwg
YWNjZXNzZXMgaXQgZnJvbSBHUFUgMSwgdGhlbiBHUFUgMiBhbmQNCj4gdGhlbiB0aGUgQ1BVLiBJ
dCB2ZXJpZmllcyB0aGF0IHRoZSBidWZmZXIgbWlncmF0ZXMgY29ycmVjdGx5IGJldHdlZW4gZGV2
aWNlcw0KPiBhbmQgcmVtYWlucyBhY2Nlc3NpYmxlIGFjcm9zcyBhbGwgYWdlbnRzIGluIGEgbXVs
dGktR1BVIGVudmlyb25tZW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8
bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfbXVsdGlf
Z3B1c3ZtLmMgfCAxMjINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEyMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMgYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0u
Yw0KPiBpbmRleCA2ODhlZTA3NTcuLmQ3ZDZhYjExNiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50
ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3Zt
LmMNCj4gQEAgLTEyNyw2ICsxMjcsMTggQEANCj4gICAqIERlc2NyaXB0aW9uOg0KPiAgICoJTXVs
dGktR1BVIHBhZ2UgZmF1bHQgdGVzdCB3aXRoIGNvbmZsaWN0aW5nIG1hZHZpc2UgcmVnaW9ucw0K
PiAgICoNCj4gKyAqIFNVQlRFU1Q6IG1ncHUtbWlncmF0aW9uLWJhc2ljDQo+ICsgKiBEZXNjcmlw
dGlvbjoNCj4gKyAqCVRlc3QgYnVmZmVyIG1pZ3JhdGlvbiBhY3Jvc3MgbXVsdGlwbGUgR1BVcyBh
bmQgbWVtb3J5IGRvbWFpbnMNCj4gKyAqCVZhbGlkYXRlcyB0aGF0IGEgc2hhcmVkIGJ1ZmZlciBj
YW4gbWlncmF0ZSBiZXR3ZWVuIHN5c3RlbSBtZW1vcnksDQo+ICsgKglHUFUxIFZSQU0sIGFuZCBH
UFUyIFZSQU0gd2hpbGUgbWFpbnRhaW5pbmcgZGF0YSBjb2hlcmVuY3kuDQo+ICsgKg0KPiArICog
U1VCVEVTVDogbWdwdS1taWdyYXRpb24tcHJlZmV0Y2gNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiAr
ICoJVGVzdCBidWZmZXIgbWlncmF0aW9uIGFjcm9zcyBtdWx0aXBsZSBHUFVzIHdpdGggZXhwbGlj
aXQgcHJlZmV0Y2gNCj4gb3BlcmF0aW9ucw0KPiArICoJU2ltaWxhciB0byBtZ3B1LW1pZ3JhdGlv
bi1iYXNpYyBidXQgdXNlcyBYRV9WTV9QUkVGRVRDSF9BU1lOQw0KPiB0byBleHBsaWNpdGx5DQo+
ICsgKgl0cmlnZ2VyIHBhZ2UgbWlncmF0aW9uIGJlZm9yZSBHUFUgYWNjZXNzDQo+ICsgKg0KPiAg
ICovDQo+IA0KPiAgI2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC0xNTMsNiArMTY1LDcg
QEANCj4gICNkZWZpbmUgTVVMVElHUFVfUEZBVUxUX09QCQlCSVQoOCkNCj4gICNkZWZpbmUgTVVM
VElHUFVfQ09OQ19BQ0NFU1MJCUJJVCg5KQ0KPiAgI2RlZmluZSBNVUxUSUdQVV9DT05GTElDVAkJ
QklUKDEwKQ0KPiArI2RlZmluZSBNVUxUSUdQVV9NSUdSQVRFCQlCSVQoMTEpDQo+IA0KPiAgI2Rl
ZmluZSBJTklUCTINCj4gICNkZWZpbmUgU1RPUkUJMw0KPiBAQCAtMjIwLDYgKzIzMywxMCBAQCBz
dGF0aWMgdm9pZCBncHVfc2ltdWx0X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QNCj4geGVfc3ZtX2dwdV9p
bmZvICpzcmMsDQo+ICAJCQkJICAgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNl
ICplY2ksDQo+ICAJCQkJICAgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+IA0KPiArc3RhdGljIHZv
aWQgZ3B1X21pZ3JhdGlvbl90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqc3Jj
LA0KPiArCQkJCSAgICAgICBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+ICsJCQkJICAg
ICAgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlDQo+ICplY2ksDQo+ICsJCQkJ
ICAgICAgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+ICBzdGF0aWMgdm9pZA0KPiAgY29uZmxpY3Rp
bmdfbWFkdmlzZShzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUxLA0KPiAgCQkgICAgc3RydWN0
IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MiwNCj4gQEAgLTEzNzQsNiArMTM5MSw5NSBAQCBjb25mbGlj
dGluZ19tYWR2aXNlKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8NCj4gKmdwdTEsDQo+ICAJY2xlYW51
cF92bV9hbmRfcXVldWUoZ3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOyAgfQ0KPiANCj4gK3N0
YXRpYyB2b2lkDQo+ICttdWx0aWdwdV9taWdyYXRlX3Rlc3Qoc3RydWN0IHhlX3N2bV9ncHVfaW5m
byAqZ3B1MSwNCj4gKwkJICAgICAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MiwNCj4gKwkJ
ICAgICAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gKwkJICAg
ICAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0KPiArCXVpbnQ2NF90IGFkZHI7DQo+ICsJdWlu
dDMyX3Qgdm1bMl0sIGV4ZWNfcXVldWVbMl0sIGJhdGNoMV9ib1syXTsNCj4gKwl1aW50NjRfdCBi
YXRjaDFfYWRkclsyXTsNCj4gKwl1aW50NjRfdCAqZGF0YTsNCj4gKwl1aW50MzJfdCB0ZXN0X3Bh
dHRlcm5fc3lzLCB0ZXN0X3BhdHRlcm5fZ3B1MSwgdGVzdF9wYXR0ZXJuX2dwdTI7DQo+ICsJdm9p
ZCAqY29weV9kc3Q7DQo+ICsJdWludDMyX3QgZmluYWxfdmFsdWU7DQo+ICsNCj4gKwl0ZXN0X3Bh
dHRlcm5fc3lzID0gMHgxMjM0NTY3ODsNCj4gKwl0ZXN0X3BhdHRlcm5fZ3B1MSA9IDB4REVBREJF
RUY7DQo+ICsJdGVzdF9wYXR0ZXJuX2dwdTIgPSAweENBRkVCQUJFOw0KPiArDQo+ICsJLyogU2tp
cCBpZiBlaXRoZXIgR1BVIGRvZXNuJ3Qgc3VwcG9ydCBmYXVsdHMgKi8NCj4gKwlpZiAoIWdwdTEt
PnN1cHBvcnRzX2ZhdWx0cyB8fCAhZ3B1Mi0+c3VwcG9ydHNfZmF1bHRzKSB7DQo+ICsJCWlndF9k
ZWJ1ZygiQm90aCBHUFVzIG11c3Qgc3VwcG9ydCBwYWdlIGZhdWx0cyBmb3IgdGhpcw0KPiB0ZXN0
XG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiArCWNyZWF0ZV92bV9hbmRfcXVldWUo
Z3B1MSwgZWNpLCAmdm1bMF0sICZleGVjX3F1ZXVlWzBdKTsNCj4gKwljcmVhdGVfdm1fYW5kX3F1
ZXVlKGdwdTIsIGVjaSwgJnZtWzFdLCAmZXhlY19xdWV1ZVsxXSk7DQo+ICsNCj4gKwlkYXRhID0g
YWxpZ25lZF9hbGxvYyhTWl8yTSwgU1pfNEspOw0KPiArCWlndF9hc3NlcnQoZGF0YSk7DQo+ICsJ
bWVtc2V0KGRhdGEsIDAsIFNaXzRLKTsNCj4gKwlhZGRyID0gdG9fdXNlcl9wb2ludGVyKGRhdGEp
Ow0KPiArDQo+ICsJY29weV9kc3QgPSBhbGlnbmVkX2FsbG9jKFNaXzJNLCBTWl80Syk7DQo+ICsJ
aWd0X2Fzc2VydChjb3B5X2RzdCk7DQo+ICsNCj4gKwlpZ3RfaW5mbygiPT09IFBoYXNlIDE6IFN5
c3RlbSBNZW1vcnkg4oaSIEdQVTEgVlJBTSA9PT1cbiIpOw0KPiArDQo+ICsJLyogQ1BVIHdyaXRl
cyBpbml0aWFsIHBhdHRlcm4gaW4gc3lzdGVtIG1lbW9yeSAqLw0KPiArCVdSSVRFX09OQ0UoKih1
aW50MzJfdCAqKWRhdGEsIHRlc3RfcGF0dGVybl9zeXMpOw0KPiArCWlndF9pbmZvKCJDUFUgd3Jv
dGUgMHgleCB0byBzeXN0ZW0gbWVtb3J5XG4iLCB0ZXN0X3BhdHRlcm5fc3lzKTsNCj4gKw0KPiAr
CS8qIEdQVTEgd3JpdGVzIG5ldyBwYXR0ZXJuIC0gc2hvdWxkIGhhcHBlbiBpbiBHUFUxIFZSQU0g
Ki8NCj4gKwlzdG9yZV9kd29yZF9iYXRjaF9pbml0KGdwdTEtPmZkLCB2bVswXSwgYWRkciwgJmJh
dGNoMV9ib1swXSwNCj4gJmJhdGNoMV9hZGRyWzBdLA0KPiArCQkJICAgICAgIHRlc3RfcGF0dGVy
bl9ncHUxKTsNCj4gKw0KPiArCS8qR1BVMTogTWFkdmlzZSBhbmQgUHJlZmV0Y2ggT3BzIHdpdGgg
cHJlZmVycmVkIGxvY2F0aW9uIEdQVTENCj4gVlJBTSAqLw0KPiArCWdwdV9tYWR2aXNlX3N5bmMo
Z3B1MSwgdm1bMF0sIGV4ZWNfcXVldWVbMF0sIGFkZHIsDQo+ICZiYXRjaDFfYWRkclswXSwNCj4g
K2ZsYWdzKTsNCj4gKw0KPiArCWlndF9pbmZvKCI9PT0gUGhhc2UgMjogR1BVMSBWUkFNIOKGkiBH
UFUyIFZSQU0gPT09XG4iKTsNCj4gKw0KPiArCS8qIEdQVTI6IGNvcHkgR1BVMSdzIHZhbHVlICov
DQo+ICsJZ3B1X2JhdGNoX2NyZWF0ZShncHUyLCB2bVsxXSwgZXhlY19xdWV1ZVsxXSwgYWRkciwN
Cj4gdG9fdXNlcl9wb2ludGVyKGNvcHlfZHN0KSwNCj4gKwkJCSAmYmF0Y2gxX2JvWzFdLCAmYmF0
Y2gxX2FkZHJbMV0sIGZsYWdzLCBJTklUKTsNCj4gKw0KPiArCS8qR1BVMjogTWFkdmlzZSBhbmQg
UHJlZmV0Y2ggT3BzIHdpdGggcHJlZmVycmVkIGxvY2F0aW9uIEdQVTINCj4gVlJBTSAqLw0KPiAr
CWdwdV9tYWR2aXNlX3N5bmMoZ3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0sDQo+IHRvX3VzZXJf
cG9pbnRlcihjb3B5X2RzdCksDQo+ICsJCQkgJmJhdGNoMV9hZGRyWzFdLCBmbGFncyk7DQo+ICsN
Cj4gKwkvKiBWZXJpZnkgR1BVMSB3cm90ZSBjb3JyZWN0bHkgKi8NCj4gKwlmaW5hbF92YWx1ZSA9
ICoodWludDMyX3QgKiljb3B5X2RzdDsNCj4gKwkvL2lndF9hc3NlcnRfZXFfdTMyKFJFQURfT05D
RSgqKHVpbnQzMl90ICopY29weV9kc3QpLA0KPiB0ZXN0X3BhdHRlcm5fZ3B1MSk7DQo+ICsJaWd0
X2Fzc2VydF9lcV91MzIoZmluYWxfdmFsdWUsIHRlc3RfcGF0dGVybl9ncHUxKTsNCj4gKw0KPiAr
CWlndF9pbmZvKCI9PT0gUGhhc2UgMzogR1BVMiBWUkFNIOKGkiBTeXN0ZW0gTWVtb3J5ID09PVxu
Iik7DQo+ICsNCj4gKwkvKiBHUFUxIHdyaXRlcyBuZXcgcGF0dGVybiAtIHNob3VsZCBoYXBwZW4g
aW4gR1BVMSBWUkFNICovDQo+ICsJc3RvcmVfZHdvcmRfYmF0Y2hfaW5pdChncHUyLT5mZCwgdm1b
MV0sDQo+IHRvX3VzZXJfcG9pbnRlcihjb3B5X2RzdCksDQo+ICsJCQkgICAgICAgJmJhdGNoMV9i
b1sxXSwgJmJhdGNoMV9hZGRyWzFdLA0KPiB0ZXN0X3BhdHRlcm5fZ3B1Mik7DQo+ICsNCj4gKwkv
KkdQVTI6IE1hZHZpc2UgYW5kIFByZWZldGNoIE9wcyB3aXRoIHByZWZlcnJlZCBsb2NhdGlvbiBH
UFUyDQo+IFZSQU0gKi8NCj4gKwlncHVfbWFkdmlzZV9zeW5jKGdwdTIsIHZtWzFdLCBleGVjX3F1
ZXVlWzFdLA0KPiB0b191c2VyX3BvaW50ZXIoY29weV9kc3QpLA0KPiArCQkJICZiYXRjaDFfYWRk
clsxXSwgZmxhZ3MpOw0KPiArDQo+ICsJLyogQ1BVIGFjY2VzcyBzaG91bGQgbWlncmF0ZSBiYWNr
IHRvIHN5c3RlbSBtZW1vcnkgKi8NCj4gKwlpZ3RfYXNzZXJ0X2VxX3UzMihSRUFEX09OQ0UoKih1
aW50MzJfdCAqKWNvcHlfZHN0KSwNCj4gK3Rlc3RfcGF0dGVybl9ncHUyKTsNCj4gKw0KPiArCWln
dF9pbmZvKCJNaWdyYXRpb24gdGVzdCBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5XG4iKTsNCj4gKw0K
PiArCW11bm1hcCgodm9pZCAqKWJhdGNoMV9hZGRyWzBdLCBCQVRDSF9TSVpFKGdwdTEtPmZkKSk7
DQo+ICsJbXVubWFwKCh2b2lkICopYmF0Y2gxX2FkZHJbMV0sIEJBVENIX1NJWkUoZ3B1Mi0+ZmQp
KTsNCj4gKwliYXRjaF9maW5pKGdwdTEtPmZkLCB2bVswXSwgYmF0Y2gxX2JvWzBdLCBiYXRjaDFf
YWRkclswXSk7DQo+ICsJYmF0Y2hfZmluaShncHUyLT5mZCwgdm1bMV0sIGJhdGNoMV9ib1sxXSwg
YmF0Y2gxX2FkZHJbMV0pOw0KPiArCWZyZWUoZGF0YSk7DQo+ICsJZnJlZShjb3B5X2RzdCk7DQo+
ICsNCj4gKwljbGVhbnVwX3ZtX2FuZF9xdWV1ZShncHUxLCB2bVswXSwgZXhlY19xdWV1ZVswXSk7
DQo+ICsJY2xlYW51cF92bV9hbmRfcXVldWUoZ3B1Miwgdm1bMV0sIGV4ZWNfcXVldWVbMV0pOyB9
DQo+ICsNCj4gIHN0YXRpYyB2b2lkDQo+ICBncHVfbWVtX2FjY2Vzc193cmFwcGVyKHN0cnVjdCB4
ZV9zdm1fZ3B1X2luZm8gKnNyYywNCj4gIAkJICAgICAgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8g
KmRzdCwNCj4gQEAgLTE0NDYsNiArMTU1MiwxOCBAQCBncHVfc2ltdWx0X3Rlc3Rfd3JhcHBlcihz
dHJ1Y3QNCj4geGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+ICAJbXVsdGlncHVfYWNjZXNzX3Rlc3Qo
c3JjLCBkc3QsIGVjaSwgZmxhZ3MpOyAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkDQo+ICtncHVfbWln
cmF0aW9uX3Rlc3Rfd3JhcHBlcihzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpzcmMsDQo+ICsJCQkg
ICBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+ICsJCQkgICBzdHJ1Y3QgZHJtX3hlX2Vu
Z2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiArCQkJICAgdW5zaWduZWQgaW50IGZsYWdzKQ0K
PiArew0KPiArCWlndF9hc3NlcnQoc3JjKTsNCj4gKwlpZ3RfYXNzZXJ0KGRzdCk7DQo+ICsNCj4g
KwltdWx0aWdwdV9taWdyYXRlX3Rlc3Qoc3JjLCBkc3QsIGVjaSwgZmxhZ3MpOyB9DQo+ICsNCj4g
IHN0YXRpYyB2b2lkDQo+ICB0ZXN0X21ncHVfZXhlYyhpbnQgZ3B1X2NudCwgc3RydWN0IHhlX3N2
bV9ncHVfaW5mbyAqZ3B1cywNCj4gIAkgICAgICAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwgQEAgLTE0NjMsNiArMTU4MSw4DQo+IEBAIHRlc3RfbWdwdV9leGVjKGlu
dCBncHVfY250LCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHVzLA0KPiAgCQlmb3JfZWFjaF9n
cHVfcGFpcihncHVfY250LCBncHVzLCBlY2ksDQo+IGdwdV9mYXVsdF90ZXN0X3dyYXBwZXIsIGZs
YWdzKTsNCj4gIAlpZiAoZmxhZ3MgJiBNVUxUSUdQVV9DT05DX0FDQ0VTUykNCj4gIAkJZm9yX2Vh
Y2hfZ3B1X3BhaXIoZ3B1X2NudCwgZ3B1cywgZWNpLA0KPiBncHVfc2ltdWx0X3Rlc3Rfd3JhcHBl
ciwgZmxhZ3MpOw0KPiArCWlmIChmbGFncyAmIE1VTFRJR1BVX01JR1JBVEUpDQo+ICsJCWZvcl9l
YWNoX2dwdV9wYWlyKGdwdV9jbnQsIGdwdXMsIGVjaSwNCj4gZ3B1X21pZ3JhdGlvbl90ZXN0X3dy
YXBwZXIsDQo+ICtmbGFncyk7DQo+ICB9DQo+IA0KPiAgc3RydWN0IHNlY3Rpb24gew0KPiBAQCAt
MTUwNCw2ICsxNjI0LDggQEAgaWd0X21haW4NCj4gIAkJeyAiY29uY3VycmVudC1hY2Nlc3MtYmFz
aWMiLCBNVUxUSUdQVV9DT05DX0FDQ0VTUyB9LA0KPiAgCQl7ICJjb25jdXJyZW50LWFjY2Vzcy1w
cmVmZXRjaCIsIE1VTFRJR1BVX1BSRUZFVENIIHwNCj4gTVVMVElHUFVfQ09OQ19BQ0NFU1MgfSwN
Cj4gIAkJeyAiY29uY3VycmVudC1hY2Nlc3MtY29uZmxpY3QiLCBNVUxUSUdQVV9DT05GTElDVCB8
DQo+IE1VTFRJR1BVX0NPTkNfQUNDRVNTIH0sDQo+ICsJCXsgIm1pZ3JhdGlvbi1iYXNpYyIsIE1V
TFRJR1BVX01JR1JBVEUgfSwNCj4gKwkJeyAibWlncmF0aW9uLXByZWZldGNoIiwgTVVMVElHUFVf
UFJFRkVUQ0ggfA0KPiBNVUxUSUdQVV9NSUdSQVRFIH0sDQo+ICAJCXsgTlVMTCB9LA0KPiAgCX07
DQo+IA0KUmV2aWV3ZWQtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50
ZWwuY29tPg0KPiAtLQ0KPiAyLjQ4LjENCg0K
