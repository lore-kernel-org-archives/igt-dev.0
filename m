Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2831DC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 11:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F0510E263;
	Wed, 19 Feb 2025 11:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtFOL/tW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF74E10E263;
 Wed, 19 Feb 2025 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739965828; x=1771501828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mz25yhYQFQ4OvcZjWfrtMw09NiPpxPldxPHSOBOVpZY=;
 b=YtFOL/tWRE44ztY8FqSnEPke9qyUrWRGpTiLc8nVlYL2A5S0QPnFjG1r
 Oad08wSbXqdyVdH49lkRak6LPcJ+6zFyf0jjPiZi5zoNq2dPXON6Rollm
 zx+sIg7vJvfzPHBPqUYQ0a++v9leeEW5EU/CVS64orfK25F/nQJiWmemU
 Q4VA++motQ8pvbdZHOuh5AvSh4r96kcrarbV3XOfxUOGBI8SxQspcPYDl
 NlaiYvxsljeXpTeTkVe5iWZHleOe9x6JzSRr5wMgSAAxHIWNivDko3ltQ
 QRDnhxUANV0Q/hMEq05AapxJczDyRb0fiHvgdO0YeUceOnoqEWafxrF+M w==;
X-CSE-ConnectionGUID: EMlh7nvBQdOrL+FnLAbgAA==
X-CSE-MsgGUID: uac6susOTHWftdrUCtDEmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40821922"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40821922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:50:27 -0800
X-CSE-ConnectionGUID: NZwVJCVCRciKtc6iTH3qVg==
X-CSE-MsgGUID: QGIyc0n/QFCbY69L6un1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119899241"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2025 03:50:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Feb 2025 03:50:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 03:50:26 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 03:50:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLVJo/zQzI6Fso1lRftmBA9aarHdPh3sZlZEbSzksTT6ofOoVdiCL+qhbDLDxaq8v0Bp7owZiA1GSnl3S39YCdTqfy+GGYSQOl07ZYgRlmZ7sOFUkEAdjH3CzpzlsjWvZRsW5OeBXC9k7liochyL6RW425qLcUX0PQYp6T3N2TJu/KI4XDelABWULp0p8Y5ZlGQdJLZGgckjB11n/EYRibNqzruMC3JwdbCgRcoS4n/2jvuLxy9h6WkW1FHx+JwhVzVQbguwgCZWT5SUQ4wl8D5ZESQtNKsa9LcC93ljJBll8Pi+X9qdBa+7Zn6KblH87r78zdlV8Vjp4Nwo/hYBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz25yhYQFQ4OvcZjWfrtMw09NiPpxPldxPHSOBOVpZY=;
 b=GYnJn0Yb4+1Sx6h8/912T1bSGdxIH2NiMo0F9VQtZoiOHd/HUi6pxiRChuKv8UBvxJUxMUuqT/UyKiN+movMz9A49AfGmLTCrl5jjSvClV9suUngkK2cneshviGiBzc4uQzr+94QXK3rMGXB86r8PCvexXjW5wZ7VW8XiBhE26Qmkgkf2qsrSVZ45kE1vYMhIh9kM5fc2OXu9g0aAIgL8WTm5Vo78DATw0r00vQtXJDUsGcOKnkvD8/bs8Sa/R13mHGBdkZxYAXXlMrL6JeOdlkrefu5AuHmHkAD80WNj8D8SaZQYxfZ8F+3roIbHsrETJ+7Dv+jU4Ll3OvEyoebqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 11:50:24 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 11:50:24 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMva21zX2Fz?=
 =?utf-8?B?eW5jX2ZsaXBzOiBDcmVhdGUgc3VidGVzdCBmb3Igb3ZlcmxheSBwbGFuZXMg?=
 =?utf-8?Q?(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfYXN5bmNf?=
 =?utf-8?Q?flips:_Create_subtest_for_overlay_planes_(rev3)?=
Thread-Index: AQHbgrW2fkbXYnL0ckuF+Yb2/VhQZLNOgSXg
Date: Wed, 19 Feb 2025 11:50:23 +0000
Message-ID: <CH0PR11MB5491C762BDDFB1FDF1F30C75EFC52@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <173989727220.3614484.14738115741904567291@b555e5b46a47>
 <20250219100434.ovtpq232n34z7mce@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250219100434.ovtpq232n34z7mce@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|BL3PR11MB6340:EE_
x-ms-office365-filtering-correlation-id: 84e11679-9f41-4172-8082-08dd50db9854
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|13003099007|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dWpaWDh1TGdMbmY4U0lmWUE4UzV1NXhZdXhreGROSjZzTHVGc2xIaUdlQWtv?=
 =?utf-8?B?dUdHTUR2cWFFc0h6eXBYaW5lNnJxMHZzYkdrZUViQkNwYWZ0YUUrWENheGdC?=
 =?utf-8?B?bWZ0NXFBekJJVFBpaXVRdjRiQjRqZTl1cUdjUnVHRmVZUkxUQ2EzMUpzamtt?=
 =?utf-8?B?MjQ4MEtWYk1WTGpmenY2d0tFMnJUckNLR0VpSDMydkRHcU1UcG44SEFtUGoy?=
 =?utf-8?B?R20wZWlKVlBUTlRiK1pKS2l4U0dWbDlnWSszclQ5M1FuTGM1YTBrWFlNQnUx?=
 =?utf-8?B?d2ZLY3NCWlNSUHMwc05jWW1vb254cXN4SVNKZEMvRTBzMjRjN2w3UlhFZERI?=
 =?utf-8?B?emp6S1pOQ3pNcEh0S1RoY2lRVWxCcW9iWTZTRWszQnZaQW91aE1IazZiYlBy?=
 =?utf-8?B?ZitGYU5CUS92TFRQcVNINzVBTEo1blF5UGtxRFRVbzhTczdhSWRVZDhwR0dy?=
 =?utf-8?B?RFhYdVF3Qzkxa2FTQzVIWXE2QzkrTTZJWDRJM1BHejFkdzdYNWVkY0l0UWFo?=
 =?utf-8?B?UlJwcEgwU1RjWisxY3o4endLZ01wRTE5V0tSVkx4UGFJY243NE9WZmtma3pk?=
 =?utf-8?B?WDd4NGdsUjIwcVNUREhrZHEzZngzVFpoRUd1aVo4Z2NpVkVaWVp6eElDZlRK?=
 =?utf-8?B?S0lKMW5McUNlOFhIT1krSEFORmdvcVlHdWlaRGxRUlFXRTRMQXd6N0licm5H?=
 =?utf-8?B?QXV2MFNYb0txbXNRU0lTR016dHd5cVo3eFIrZTh2VzNGTjUxNFlZK09IN0lB?=
 =?utf-8?B?Y3JLN2JxS29Iem5OMFdodGR3bWdmeDd1MzNBVHl0V2FmV0tOOHRmS0pSamQr?=
 =?utf-8?B?U1ZsUmgwYU40MURHa1pjSXMzaVVQZFJJRDdyUnBTd1kzS3o1dXQ0Yk5KbnIr?=
 =?utf-8?B?NVpkb0N1N25CMmNDdkdoL3ZQNXZyZzQ5ZW84VGl0U0o0cDlYdHZ2emFKQSt6?=
 =?utf-8?B?OGNaVTJYY24vb3NTVlh2MlNaaUgzcjFtcmhHQi95WnZzVElnM2djbzdrL2xW?=
 =?utf-8?B?MUpFUk5wdWw1YXlLMGNEa1gvMjY5bE1OeFdNYjA4eE1GVFd6dUg4c3FWeW10?=
 =?utf-8?B?RHhmSk9aTG5uZTZxa3d5TGtkT3NqUDAvUFVDdlhydU9pajhjSU1GY3RSc1E0?=
 =?utf-8?B?RzFic0VZZm50T3drYUhzZitIU3RnRC9vSXVQUjFnUXl6aktSQ3g2dG9HVDRs?=
 =?utf-8?B?NUJNcCs1cmxmbk1FNisvc1R0YjU2ZFFIcnVPaXA5TW5nUEpGOXRTd1VYeXNV?=
 =?utf-8?B?a29RZUs1K3E2RDdlaER4QWxUOXFjTGdhTFhJcnJSYjh5aDFLcHI4OUNNemcr?=
 =?utf-8?B?MTBhZUJ3czZSYVNNZlQzQ0FGL0ZzYnZzeWQyRXpmNk95c2VVR0hNcmdyZ25r?=
 =?utf-8?B?UTNiTkQ0ZTJETFU4VlRLb2RReXdoTFNHUzQySjFpR0kvQWdqeCt6Z21GUGdw?=
 =?utf-8?B?Y09PM3pieTlMUkJzNk94Q0Y3UFIwMHBKUDRTZVB4N08vSWhiR3QvZUs4Ymxn?=
 =?utf-8?B?TWQrUUNCN25aNisxMXVhS1pSSkIvYVdlSnJzWGc4SFc5N1grN0Fjb2llbDBZ?=
 =?utf-8?B?V3N1Vm82blRCNjFkWUxrZ3YwQkhzeHBqVEoxcEtiR0dUMXBKQnhxcFNDWWY2?=
 =?utf-8?B?WFUxYzdiZHJWbW5PZ2QvaGwvUk5GbXBXd3lySTAvL3RuNk1ONUF4RE1mWGt3?=
 =?utf-8?B?ZUVzOHR4MDN6VmVOZlRYeGowczFCNTFKcjZqbFJkeUpvZ25XcDB1dFpZbHBM?=
 =?utf-8?B?a2Ftd3ZYVGN2d0lHbnVTWDRvMFpjV1NQNWtURlZzSGM0dmRUYnVGemNmU0t0?=
 =?utf-8?B?STZKeWJ4U3N6SVdOTzhtQWxmRTN0UnY2aEd1V2tPeTQ1R0o1blJoc01FcjFQ?=
 =?utf-8?Q?NUDpRNWhH+VcQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWxnS3FzdWJWZ3M0bmtnSGJUS3FRQlUwV1JKdi9Ybjl6UVNQUy9JV0RiclhS?=
 =?utf-8?B?UHBqclVRM2pZRTE5SkhuZ0tXT1pjQ2N5Um5wVkVFZkwrZWNnV3YvNjcvazJr?=
 =?utf-8?B?cWJLYlNvbU9STVJiOE5QN1FoZ0R2ODJLUCsrUmJJNHF1WExYNTlWNDU2cEVj?=
 =?utf-8?B?RW1ENnhKWE81T05DVDRON1RtNERjUTg4eTJMVFlPV3lkK3RBOXl6THZwMlUw?=
 =?utf-8?B?TnBzOFBxWVVFc0NMT3VvQjkzTUNSREZEZDVhN0JKbEpQbHY1R2JwRXYzdEtq?=
 =?utf-8?B?UmRBK3FGT1ZxY2x2UGlwMW5nZm1lS1BmRC92eVdWN3VrSHgzY0VqY3R5b1BX?=
 =?utf-8?B?cVFSNzhIWHFiQUtCN3pyZzB4WW11a05NclMzS0RQM2dyUzA2MmozZkYrU2Qv?=
 =?utf-8?B?S3dFT2NDMUg5aE5WSVFUSG1nUUdiV21URmNQMEdoQlJDdStEazkxSVZXUzZU?=
 =?utf-8?B?bElubk5pUEkzei9wTXpTTkw4RnpPcThGb2Nva003aEtVdE82RjB2SE5sdHk2?=
 =?utf-8?B?NmdCdW14QURwWXNtcFg4cUR4UHpCMHlYV0IwcWtGN04xVFdsNitnNWI2NmMw?=
 =?utf-8?B?NGZuUDdDTXdVWjVNVVVrT2d1L2JXWWVSbVlxY3pZK0V2Tk56L0JOeUhCdGV3?=
 =?utf-8?B?MjFrVFY4YnRrODRHbmJodjRudVVIbG5uQmtsTmt0SVBKbWlXWjB5bkVQdnZq?=
 =?utf-8?B?V1ZNb3BCeTRCaUdpaVhMaU1YUENPc21oSldpelJ5TzFpbUYyKzA1REl2T0lC?=
 =?utf-8?B?bzNkYkJDelVWUlRsYlZJbi9UMWc5WmNEWmJIWXFNcDQ3Y0N0MTJBQ0tIZVQ1?=
 =?utf-8?B?V0NoYUIxZmpnRjNkY3BYWW90elB0TGZIQ21BQ25SdmdmK20vWjdwWFB2TWJV?=
 =?utf-8?B?Z3I4YjhjODRMbmFtV1JRNzkzaUgvS3NtM0xWT2hXVDA2djBRZkhrWGQ3Vlo1?=
 =?utf-8?B?bDVQU3VxRDFCaSt4dk9hb3g1NTIwSU9oL25kMDZiMTV2Z1dJVFNvL0ZZZS8r?=
 =?utf-8?B?WmprSURZVm54ejFGTWR3QTFzVzFUb2w3enpoakl2d0pOSVNVbHdkTUZTRzVY?=
 =?utf-8?B?UFRBNmZRdnRRNjFZZUU1K0o3N05SV1QxZmoxVnovU1prditFVktqL0MrendU?=
 =?utf-8?B?OVFnK1BBRzRhNmNsZkdCMUM4bmVieGN4Tlc0elVYRGZURDhlS0tsMzdPSTRO?=
 =?utf-8?B?WTJZK05GZ2NuZjRCQ2ljZ1lhcHMrTHF6azRaMUdjVEVJcWJHTGppNWFkVkNm?=
 =?utf-8?B?RTVDbHk4emcxODNVekduNFF0UVBDc1BrZnZUdGFuTGY5RUFxSHJ3TkJxZmZP?=
 =?utf-8?B?VXZPd3VlYkROdDZKVTJOR1N3emFkWXBueE10VG1hK21nN3pZMTh0allNVFBQ?=
 =?utf-8?B?NEdwY2ZnTFVzR25rWHE4SUJmMzZNWjg4UWxXK0UraFdXQWpCMy9wR1BZc0pV?=
 =?utf-8?B?MFBBWWNmWUlMbFkrdFBraWhZaTl1RWFHTGdCeHREM1B2Z3FnZ3VYRC9LR1po?=
 =?utf-8?B?TjRkSVNINVR4M0htaE1uN2ZoTm12UHNVVVd2SU9qVlBzUDNHSHBSSDk4MXcx?=
 =?utf-8?B?emdlSWtuTDc1MThsUG1NL3c5MXpFMStacUlnN053bkUrYUg0Tnk4cHJsR0Vj?=
 =?utf-8?B?ZUF3bzRsVzloNnp2c1NEaHd4ekV5V28wbWRsNDhDMmV5Qjl4WEdIQTNDd0tL?=
 =?utf-8?B?TXNEVFBEbCtGdGtSR0JiNjhMOE1YVUh4U1Roa041b1ZMbHVpSk1hczFwSWxG?=
 =?utf-8?B?YjFicjZKU3BLZlRXeGlWRnZLc1k1V3FSNUl0ekkrMXBhay9xSU5VNldkT3Fj?=
 =?utf-8?B?ZEtHNy9DZDdCVmYzanJsWjE1NUdLL0Fqb2k5WHQ1L1k1WmlOSVM0bC9VTkJy?=
 =?utf-8?B?ZHM3cVhaT2UzaTk2ZlgwM2Z2YkR3clkyWGhFNDJRejlsUmtvOE1EQm1IYW1N?=
 =?utf-8?B?dWdRMWszeFczYWZsWDlWVFdZN2hvSlIvWnJDZ28wblZmK1dBY2ZNRmt5c0ZL?=
 =?utf-8?B?a21tY0NnSnhEWVhPSkxORVR1dnJrSWJuT25wbFdjQWF3V1FjbFJOMk9kbkts?=
 =?utf-8?B?bW9uT1hoVG9hTmhVd3VmZkhpQlVndnk1VnYvL3N4UkF2M3RCOEtCTk1hSUpu?=
 =?utf-8?Q?hq/aWJFGi/pnEys4yA6rXQXnp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e11679-9f41-4172-8082-08dd50db9854
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 11:50:23.9957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClqHOK6GY66qLAsNnqXBntHKOo76QXX4Vp1P6Wc7tlNL13QZPrM7R/m6jnA7lWPAlNtF3QNWOIsLbSSSIG9xy6aB4hMT3FLxZ+uufR7qQnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQyMzg2LyAt
IFJlLXJlcG9ydGVkLg0KDQppOTE1LkNJLkJBVCAtIFJlLXJlcG9ydGVkLg0KWGUuQ0kuRnVsbCAt
IEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVkLg0KDQpUaGFua3Ms
DQpSYXZhbGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWlu
ZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgS2FtaWwgS29uaWVjem55DQpTZW50OiAxOSBGZWJydWFyeSAyMDI1IDE1OjM1DQpUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBBbmRyw6kgQWxtZWlkYSA8YW5kcmVh
bG1laWRAaWdhbGlhLmNvbT47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpT
dWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfYXN5bmNf
ZmxpcHM6IENyZWF0ZSBzdWJ0ZXN0IGZvciBvdmVybGF5IHBsYW5lcyAocmV2MykNCg0KSGkgaWd0
LWRldiwNCk9uIDIwMjUtMDItMTggYXQgMTY6NDc6NTIgLTAwMDAsIFBhdGNod29yayB3cm90ZToN
Cj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMva21zX2FzeW5jX2Zs
aXBzOiBDcmVhdGUgc3VidGVzdCBmb3Igb3ZlcmxheSBwbGFuZXMgKHJldjMpDQo+IFVSTCAgIDog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDIzODYvDQo+IFN0YXRl
IDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5n
ZXMgZnJvbSBJR1RfODIzNiAtPiBJR1RQV18xMjYyNSANCj4gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0t
DQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNv
bWluZyB3aXRoIElHVFBXXzEyNjI1IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVk
IG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBo
YXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdU
UFdfMTI2MjUsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5l
dyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4N
Cj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMjYyNS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhv
c3RzICg0MiAtPiA0MSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAg
IEFkZGl0aW9uYWwgKDEpOiBmaS1rYmwtNzU2N3UgDQo+ICAgTWlzc2luZyAgICAoMik6IGZpLWds
ay1qNDAwNSBmaS1zbmItMjUyMG0gDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdlcyB0aGF0
IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjYyNToNCj4gDQo+ICMjIyBJR1Qg
Y2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4g
ICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+ICAgICAtIGJhdC10d2wtMTogICAgICAgICAg
Tk9UUlVOIC0+IFtBQk9SVF1bMV0gKzEgb3RoZXIgdGVzdCBhYm9ydA0KPiAgICBbMV06IA0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjI1L2JhdC10
d2wtMS9pZ3RAaTkxDQo+IDVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+IA0KDQpUaGlzIGlzIHVucmVs
YXRlZCwgcGxlYXNlIGZpbGUgYSBidWcgYW5kIHJlLXJ1bi4NCg0KUmVnYXJkcywNCkthbWlsDQoN
Cj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0
aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xMjYyNSB0aGF0IGNvbWUgZnJvbSBrbm93biBpc3N1
ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIElzc3VlcyBoaXQgIyMj
Iw0KPiANCj4gICAqIGlndEBnZW1faHVjX2NvcHlAaHVjLWNvcHk6DQo+ICAgICAtIGZpLWtibC03
NTY3dTogICAgICAgTk9UUlVOIC0+IFtTS0lQXVsyXSAoW2k5MTUjMjE5MF0pDQo+ICAgIFsyXTog
DQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2MjUv
Zmkta2JsLTc1Njd1L2lndEANCj4gZ2VtX2h1Y19jb3B5QGh1Yy1jb3B5Lmh0bWwNCj4gDQo+ICAg
KiBpZ3RAZ2VtX2xtZW1fc3dhcHBpbmdAcGFyYWxsZWwtcmFuZG9tLWVuZ2luZXM6DQo+ICAgICAt
IGZpLWtibC03NTY3dTogICAgICAgTk9UUlVOIC0+IFtTS0lQXVszXSAoW2k5MTUjNDYxM10pICsz
IG90aGVyIHRlc3RzIHNraXANCj4gICAgWzNdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjYyNS9maS1rYmwtNzU2N3UvaWd0QA0KPiBnZW1fbG1l
bV9zd2FwcGluZ0BwYXJhbGxlbC1yYW5kb20tZW5naW5lcy5odG1sDQo+IA0KPiAgICogaWd0QGk5
MTVfc2VsZnRlc3RAbGl2ZToNCj4gICAgIC0gYmF0LXR3bC0yOiAgICAgICAgICBOT1RSVU4gLT4g
W0FCT1JUXVs0XSAoW2k5MTUjMTI5MTldIC8gW2k5MTUjMTM1MDNdKQ0KPiAgICBbNF06IA0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjI1L2JhdC10
d2wtMi9pZ3RAaTkxDQo+IDVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVf
c2VsZnRlc3RAbGl2ZUBndF9lbmdpbmVzOg0KPiAgICAgLSBiYXQtdHdsLTI6ICAgICAgICAgIE5P
VFJVTiAtPiBbQUJPUlRdWzVdIChbaTkxNSMxMjkxOV0pDQo+ICAgIFs1XTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2MjUvYmF0LXR3bC0yL2ln
dEBpOTENCj4gNV9zZWxmdGVzdEBsaXZlQGd0X2VuZ2luZXMuaHRtbA0KPiANCj4gICAqIGlndEBr
bXNfZHNjQGRzYy1iYXNpYzoNCj4gICAgIC0gZmkta2JsLTc1Njd1OiAgICAgICBOT1RSVU4gLT4g
W1NLSVBdWzZdICsxMSBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFs2XTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2MjUvZmkta2JsLTc1Njd1L2ln
dEANCj4ga21zX2RzY0Bkc2MtYmFzaWMuaHRtbA0KPiANCj4gICANCj4gIyMjIyBQb3NzaWJsZSBm
aXhlcyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZToNCj4gICAgIC0gYmF0
LWFkbHAtOTogICAgICAgICBbQUJPUlRdWzddIC0+IFtQQVNTXVs4XQ0KPiAgICBbN106IGh0dHBz
Oi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgyMzYvYmF0LWFkbHAtOS9p
Z3RAaTkxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gICAgWzhdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjI1L2JhdC1hZGxwLTkvaWd0QGk5MTVfc2Vs
ZnRlc3RAbGl2ZS5odG1sDQo+ICAgICAtIGJhdC1qc2wtMzogICAgICAgICAgW0lOQ09NUExFVEVd
WzldIChbaTkxNSMxMjQ0NV0gLyBbaTkxNSMxMzI0MV0pIC0+IFtQQVNTXVsxMF0NCj4gICAgWzld
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MjM2L2JhdC1q
c2wtMy9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gICAgWzEwXTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2MjUvYmF0LWpzbC0zL2ln
dEBpOTENCj4gNV9zZWxmdGVzdEBsaXZlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVz
dEBsaXZlQGd1YzoNCj4gICAgIC0gYmF0LWFkbHAtOTogICAgICAgICBbQUJPUlRdWzExXSAoW2k5
MTUjMTM2OTZdKSAtPiBbUEFTU11bMTJdDQo+ICAgIFsxMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgyMzYvYmF0LWFkbHAtOS9pZ3RAaTkxNV9zZWxmdGVz
dEBsaXZlQGd1Yy5odG1sDQo+ICAgIFsxMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjI1L2JhdC1hZGxwLTkvaWd0QGk5DQo+IDE1X3NlbGZ0
ZXN0QGxpdmVAZ3VjLmh0bWwNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmth
cm91bmRzOg0KPiAgICAgLSBiYXQtYXJsaC0yOiAgICAgICAgIFtETUVTRy1GQUlMXVsxM10gKFtp
OTE1IzEyMDYxXSkgLT4gW1BBU1NdWzE0XSArMSBvdGhlciB0ZXN0IHBhc3MNCj4gICAgWzEzXTog
aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODIzNi9iYXQtYXJs
aC0yL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbA0KPiAgICBbMTRdOiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyNjI1L2JhdC1h
cmxoLTIvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+ICAgICAtIGJh
dC1tdGxwLTY6ICAgICAgICAgW0RNRVNHLUZBSUxdWzE1XSAoW2k5MTUjMTIwNjFdKSAtPiBbUEFT
U11bMTZdICsxIG90aGVyIHRlc3QgcGFzcw0KPiAgICBbMTVdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MjM2L2JhdC1tdGxwLTYvaWd0QGk5MTVfc2VsZnRl
c3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+ICAgIFsxNl06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2MjUvYmF0LW10bHAtNi9pZ3RAaTkxNV9zZWxm
dGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwNCj4gICAgIC0gYmF0LWFybHMtNjogICAgICAgICBb
RE1FU0ctRkFJTF1bMTddIChbaTkxNSMxMjA2MV0pIC0+IFtQQVNTXVsxOF0gKzEgb3RoZXIgdGVz
dCBwYXNzDQo+ICAgIFsxN106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUXzgyMzYvYmF0LWFybHMtNi9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRz
Lmh0bWwNCj4gICAgWzE4XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2Ry
bS10aXAvSUdUUFdfMTI2MjUvYmF0LWFybHMtNi9pZ3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUB3
b3JrYXJvdW5kcy5odG1sDQo+IA0KPiAgIA0KPiAgIFtpOTE1IzEyMDYxXTogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjA2MQ0KPiAgIFtp
OTE1IzEyNDQ1XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5l
bC8tL2lzc3Vlcy8xMjQ0NQ0KPiAgIFtpOTE1IzEyOTE5XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjkxOQ0KPiAgIFtpOTE1IzEzMjQx
XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vl
cy8xMzI0MQ0KPiAgIFtpOTE1IzEzNTAzXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMzUwMw0KPiAgIFtpOTE1IzEzNjk2XTogaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMzY5Ng0K
PiAgIFtpOTE1IzIxOTBdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUv
a2VybmVsLy0vaXNzdWVzLzIxOTANCj4gICBbaTkxNSM0NjEzXTogDQo+IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvNDYxMw0KPiANCj4gDQo+
IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4gICAqIENJOiBDSS0yMDE5MDUy
OSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF84MjM2IC0+IElHVFBXXzEyNjI1DQo+IA0KPiAgIENJ
LTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xNjE0OTogNDU4N2MwNTk5NjY2NmE5MmFm
NjNmODZiYTQxMGJhZTFkYzk0MDc5NCBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dm
eC1jaS9saW51eA0KPiAgIElHVFBXXzEyNjI1OiAxMjYyNQ0KPiAgIElHVF84MjM2OiA4MjM2DQo+
IA0KPiA9PSBMb2dzID09DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTI2MjUvaW5kZXguaHRtbA0K
