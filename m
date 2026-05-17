Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99386CD4851
	for <igt-dev@archiver.kernel.org>; Sun, 17 May 2026 02:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DD110E05F;
	Sun, 17 May 2026 02:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOx62+gT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49F10E05F
 for <igt-dev@lists.freedesktop.org>; Sun, 17 May 2026 02:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778985793; x=1810521793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=617RndnhAVvFQ9hjrDw+z9ldDPNmzZi/xWsgu/MNlXg=;
 b=GOx62+gTQGxWgEyNX5FG3JRboCrkKDRaXkmfCfLBuqs57vetJ+4LYAdI
 5P8Ly4FA0SdT6CwJbK57IAvGw19kNG2goMZPTrV26vAT9sWGL8gVIr9hD
 LjEYN+ddNgZHrKlwWKx0BKWkBI7Odugzp4HnZPZCsF+V0r9uqpnMcSff4
 4o/26+dWhPVRMnwqhbQfeYY4wf3RSsya88jK8AAo09WHeOjxsWWlTLkPN
 hfG+G+9HvN5XL1S5z0U0YeN9mq+Jbus6g+/SUZqeo0r5jENh692gIPPPW
 JcwMr8ZDkLK+Zj3cGPGmHqRkKea4uZZ0V4bDlTx7UkZzW7sUX+oG7Uek8 Q==;
X-CSE-ConnectionGUID: owGhhEkCQ5+EwVxhElhe7Q==
X-CSE-MsgGUID: kICcCBLsTOOlrDDL8EOJKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83740784"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="83740784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 19:43:12 -0700
X-CSE-ConnectionGUID: mSScPyCbQHa8jX89C1NLDw==
X-CSE-MsgGUID: 6fePbCijTuCWX9EcBaPKYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="238090798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 19:43:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 16 May 2026 19:43:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 16 May 2026 19:43:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 16 May 2026 19:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHLgK7v4CSmlBZE2kJvHZeqHpMsIk/OUAGp2Uje6RPk4f8g4Lq87MJKenZd8wTnJwC5+lD+wJZevMYYG0i6o7+cmeUvf3rpcdVJ5VzOIstW6SdybhyC1CJpX2J8rav1s+G5MwZ9MwCKqNjtFRoWhxg5gX6JCJ6pSVUquTKdBylUm8nh0cpKS3ZtoYAdS5YNanbUxQbshjLzv4ykwbh/RztMQyTSJ7vm07ztWbMrD9WWFcBlfRirHQY4uG/MFkAWtsNJOXMrERW5w35xPIG+ezX4xKGZ6ciCcRdhV6xiV4aPnNul8Nclczl+jqmV/C8LqUE2vV3biqgqPscV3Y4SUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=617RndnhAVvFQ9hjrDw+z9ldDPNmzZi/xWsgu/MNlXg=;
 b=fn9lzOJO0e7Y3XM29YQ0PBYs6fv4kAhWY2e3LEjJ+72USYk4CSy/L8q+PY6AwzDOe67IwkO6PPucGp+a84N3zx4N7tPeXpq220di8WRmIX6mSfbfv0hxWo9I6crnYVTbQbPwzWjXXPIsqhKoVp9R6oIRkFmF/0HmOnxkWV4G/ZWPV78scGXHrr0QWSC2wfwQjpy4tJhOoGQeBzpvtXXweloo2fA+WvcOmyLnpl9UbxLH5WSqN9gZ5/UKUbRq1J5JK4NvFMQgagAddZTOTYLbTofFz5YUzQGI9TTqTk38T4EJN7w2iQWpkwy5/89u7NzE6rfYRnKHtlkQ8prfuIFmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 02:43:06 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Sun, 17 May 2026
 02:43:06 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
Subject: RE: [PATCH i-g-t] tests/kms_content_protection: clamp plane src/dst
 to output mode
Thread-Topic: [PATCH i-g-t] tests/kms_content_protection: clamp plane src/dst
 to output mode
Thread-Index: AQHc5ELhibPlpU5nVEuXcTVDoFolA7YRdyUAgAAN5tA=
Date: Sun, 17 May 2026 02:43:05 +0000
Message-ID: <DM3PPF208195D8DC73CAB82B11ACB3A4A18E3022@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260515081427.973496-1-suraj.kandpal@intel.com>
 <e45a3fdf-0aa9-4c7a-b619-e8972f05dc9b@intel.com>
In-Reply-To: <e45a3fdf-0aa9-4c7a-b619-e8972f05dc9b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB6714:EE_
x-ms-office365-filtering-correlation-id: 0bf10a14-2b00-4330-ef86-08deb3be0606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|3023799003|38070700021|4143699003|11063799003;
x-microsoft-antispam-message-info: jp83IMpNmG/1g/YebKig78CYQlJwIEHZleZ+KG2ttlRisxnRCHJi9+L9c+KtSNoqHcrQeB0lh+dOCMm4Ov9to7wf9mwrZ3X+i8k3fKhXDcqsoiqichHBhdkv54Ot97dh57QKDcbcaS+HEg7ZdhP/p8h0aFAYJvutnXdW8ONM1eev4YuudDC0o5DNskH6UZhpiZ85D1QGt/MRfHSvtLmA7hSVMfgNlbv+T5MuIUcsjlXrq14Z7ZLGUZiCnfdrYr2O+3ftzXXLItw0iUDe6Z9H5/ShdqK8SYUOavjBoyHelfBPvnsbyEDtryU7bGySZyyaVWFQdvswHl8f/5a5FL/C0hOUxHhcVIuZauGaMs1ubK7VXRgn4m75KooV4G7HqZohoEZ1HLPm2nk7FPLq0x5+opo4K47xiiXElpWGuFyLvhFdKBqArIkSfdNsrBKPF3F7jDC2LfVjSP9qKh7pJulYobdiJXJVIE0YUFvs8oWNGpKrVzzdJfpGfpldvwcDfTESmjxrxkm+RaEplLCq7mrjkEkV62NYy35OH9cLE/KhPE6uubinVT7vd6ArmqqZw4R7JCkioQ6mP4/XhsqiUk5CyR1CDe4kYzwWuA68Y7UX136x9LN5IdJ+q3uqqr7+UE5BDCDeyE1LsLWe21Ko3e86YOZ3GB4XuWqvMYTQEIIMNoVVrl4t9/4Wq+j8zElJP7Py
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003)(38070700021)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzA4UzZKZ24wVGd6VFFIbmdFMDhUczVSMzVubEdlTys4aEdTTnNoUHVSUHZ2?=
 =?utf-8?B?Y3dUOWpsSDZ2ak9RT2VlTE9BUXNCVWcvWXRPNERnQTBiSFpKSVo3R2lNV1dH?=
 =?utf-8?B?NyszTXByQzd1aFFaU3BZUzM0aUlXK0JvTi9nelFHVzByOUtlNXdCa3VUaXp5?=
 =?utf-8?B?RCt1WWFzcVN2eEdWQ0M4d3QwTDNQTldWbmtoLzNKa0hpRG91YktjR1pqVWFI?=
 =?utf-8?B?K093b3MxZHJBTWFXU2VOZ1Bma01UUlJZMGVEN3NXNVllY2s0bWtUYWR6TjBx?=
 =?utf-8?B?V3NkcDI1MVRuZGg1OW5XU1ErVC8xRUtydkk0THJSNUtzWFdQZ0xsVEw1V2hB?=
 =?utf-8?B?ZlhFeGpPSkR5NVVab3Ywb1RrR0JucHk4bkZIOWI4Q3FvOWtQbmhEdFMyUEVx?=
 =?utf-8?B?MWUzUnJHRG1uUUsvWXV4aW9sWWFCNjg2bjQvcnE4WkhYZHZXakFXbm9TY0Yv?=
 =?utf-8?B?ckxadVBCbUJCNG0zOStGbmZBQXRzZnEwanQ0WmwrV3ltVFlNWTBrRDRYSisv?=
 =?utf-8?B?MUNUMTFVZVBGbkV2M3pDL28xdlpnankyRldqZi8zbXdzMkpqaHpxQVA3c2ha?=
 =?utf-8?B?bDkxcFVXRmtieG96QlZickZUQWN6S3l3R0gwOGx1bjhpSmJ5dld2SGlkT3cv?=
 =?utf-8?B?c2ord2wrZWxNZjdsZFk0SVJWVElFMTViUnVJVWx4NHdlWS9GVWwvMEVoT1FN?=
 =?utf-8?B?S3F2R1NVZWthNXU4RmdXcTJjSGsrUUtTNzh1S0NUNXZ3U3NmVmRWTTRIYXdR?=
 =?utf-8?B?UUlkUU96RWpTQzNsd29ER0RxM1lpak5jZ2phN0dFUEo0eEJhbTBXSGczM3kx?=
 =?utf-8?B?b1B0QWlRclBRTWNiWE44ZFRBb0RWUUpIZlgxODZGLzdZQlN0SHRBWDJRZlE2?=
 =?utf-8?B?cVNsS1BjM2wzOFFFMWdlZU9aaTZXVm9KWHQrcDlyL0tuaXB3L1UwZmNKZmE3?=
 =?utf-8?B?UnVRcmhXc2ZnbzVJQlNtL0ZYS0EvRVRjQzRIdUJmRXVoaE9KZkROZ0lKTkxz?=
 =?utf-8?B?aEo1Tnk0Ym55OFFxaWtQTitpUkluYnZtWCtLUjhuMUZCOEx4QXNMeUdWUjFp?=
 =?utf-8?B?OGs2dGJ1UUtQV0g3eXdRUEVCaG1PYlRwV2ttemNnemJUZWh3NU11V2JHY2k1?=
 =?utf-8?B?NEI5ZkF5cXhuWCtJUzFjN1NTVWdOdGNFUVdiN2dFaDNRY3FGc2tkazE2cXUz?=
 =?utf-8?B?ZnQ1UEt2KzkvUnFqN3Vya0NFQkxWaXN4WXJyQThhVUJ1aTRXaUpFb1FmV21G?=
 =?utf-8?B?T2JoWFpDamFTZDRVRnhzSU00SDcvbVp0czdVRldxOEZzTWcyODNySzZPOXJX?=
 =?utf-8?B?YzUxdldlcGczRWFIK2R3L1pFY0Ywd3UydnYzR0VHSjBIdkVnQ0J4TzNnWmxT?=
 =?utf-8?B?Wm9namRLQWltSjdSZ2d1WlBIVEtlMFVGRkxrVlkvdnBabmlLSXRZZFF6S3VP?=
 =?utf-8?B?Njh6M01ZRVVadi90TlpKQlNyaHlEaVlQMnBXWmNidkZKclc3OFBObmcySzFz?=
 =?utf-8?B?cVN6VVhNRHRidHU5ODNjV1Y4UTc3U1E3aWlKRFNJTnNyVkNPaWZsSFRRb3hH?=
 =?utf-8?B?TlBOSytVNVBaN2ZwS1hBTzdJL1pnVXpVTGw2Y09QREJXZS9PYjd5T21sNHBF?=
 =?utf-8?B?UjNtNHpYVUNPNU5lcU1pR281ME1aR1hDWHRPUW9VdnVRTDdKL0hIVHg0Ykhy?=
 =?utf-8?B?d1ZlU3J2N3VBcitWVGpLaEpLSkxzMENRWjJ1a1RwVFJkUWpqWElJMWswSnNa?=
 =?utf-8?B?dnFtdFF2Y25oclpPcmJVREhlbWFVY283QWxidUUyV3BNYml5Mkw3WFM1QW44?=
 =?utf-8?B?aTFSWm1MNC9ra0tRNk9aU3lJTlZMM0w0RVJtcy9HdlVPQm4yVlVkdFoxUkR3?=
 =?utf-8?B?dWZEWEpBcmlaY2tRUmhjMUNWeHZxZmlOUnMvUFVnV2E0NGlwbVdSSStrRXpj?=
 =?utf-8?B?aFh2ZEdwY2szQklCS0hvcnN6WjJ0ZVhSbDRLT3FhSmlSWmI5b1RLUngwbGkr?=
 =?utf-8?B?K1FTZCtIemVDWUd2enY2NmVGbTBjdnY0bjRZZnpxdzdQZHA3TWsram1aSFFr?=
 =?utf-8?B?R3p1c1d1akZmZGtoUmlYVG02VGc3eEkxUHpGYzEvNU8zZWl3bm80bEV1ckMv?=
 =?utf-8?B?SXQ0TXVRSllzR3gzYnJucEx1aGduUmtZTm94KzkvRUhKalNnYWdjSHlscUZq?=
 =?utf-8?B?blRUN0lUenFkd2E0Z0czMXlVNkYzbHdoeWVLWlBiZ0wwTlJBL2lFOWR0WDlX?=
 =?utf-8?B?bjZwVXJ1NHlDK3pNYW55OG9oTGEvYXZPN3lKbFlPWmxETCtwdk52S2ZMVXkw?=
 =?utf-8?B?TU9yYUxacytCL1FZK3RVVWFIc3poK1BzcWZ6SUFxc2tZWTZhVHJFdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fV0ytfmCXkw2KBF3A9skylPU/MomWaDOGbgn9Q++TSAaF1Tk70+BPMaUSOEWoHe2mzro1Yp9nZ+7FXLDhtA32+4SW8a950wcwbXAatKn5FUOzrcIimYI4KIpQlIcB26XL9sz6ugdLkG3zgpO6fAQ8e9ArgtPlBPfS+6Jk5hbYYB8aCapgphAGfWdQdEPx13RlMxLMQ8crF/ysPuM4ZOl+jPGI7amQyv3XNJ5T4YI+hN5b+fWIELVkXcZVHJp0Fhe6XTw16IhtBflxkiQZyDxRMUf0jhG1iWy/YjMBvckA7Pt/F8fbxgRmepVIdheKTYTXz/bhQTkyfOK57mlc1muqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf10a14-2b00-4330-ef86-08deb3be0606
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2026 02:43:05.9106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JV5l1n4dNYCvPYa/3BlToEtM12NEGxvKYVvui89xWL8D/ZxQsW/q9Z1Sr82fzbHNPt+42y9vtEc7RdO2Sa4kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9u
OiBjbGFtcCBwbGFuZSBzcmMvZHN0IHRvDQo+IG91dHB1dCBtb2RlDQo+IA0KPiBIaSBTdXJhaiwN
Cj4gDQo+IE9uIDE1LTA1LTIwMjYgMTM6NDQsIFN1cmFqIEthbmRwYWwgd3JvdGU6DQo+ID4gY3Jl
YXRlX2ZicygpIHNpemVzIHRoZSBzaGFyZWQgcmVkL2dyZWVuIEZCcyB0byB0aGUgbWF4IHdpZHRo
IGFuZA0KPiA+IGhlaWdodCBhY3Jvc3MgYWxsIGNvbm5lY3RlZCBvdXRwdXRzLiBXaXRoIHBhbmVs
cyBvZiBkaWZmZXJpbmcgbmF0aXZlDQo+ID4gcmVzb2x1dGlvbnMgKGUuZy4gMzUwNHgyMTkwIGFu
ZCAzODQweDIxNjApLCB0aGUgRkIgZW5kcyB1cCBsYXJnZXIgdGhhbg0KPiA+IGF0IGxlYXN0IG9u
ZSBwYW5lbCBpbiBzb21lIGRpbWVuc2lvbi4gaWd0X3BsYW5lX3NldF9mYigpIHJlc2V0cyB0aGUN
Cj4gPiBwbGFuZSBzcmMgYW5kIGRzdCByZWN0YW5nbGVzIHRvIHRoZSBmdWxsIEZCIHNpemUsIHNv
IHN1YnNlcXVlbnQNCj4gPiBjb21taXRzIHN1Ym1pdCBhIHNvdXJjZSByZWN0IHRoYXQgZXhjZWVk
cyB0aGUgQ1JUQyBhY3RpdmUgYXJlYSBhbmQNCj4gPiBhdG9taWMgY2hlY2sgcmVqZWN0cyB0aGVt
IHdpdGggLUVJTlZBTCBiZWZvcmUgSERDUCBhdXRoZW50aWNhdGlvbiBjYW4NCj4gPiBzdGFydC4N
Cj4gPg0KPiA+IENsYW1wIHRoZSBwbGFuZSBzb3VyY2UgKGlndF9mYl9zZXRfc2l6ZSkgYW5kIGRl
c3RpbmF0aW9uDQo+ID4gKGlndF9wbGFuZV9zZXRfc2l6ZSkgdG8gdGhlIG91dHB1dCdzIGN1cnJl
bnQgbW9kZSBhZnRlciBldmVyeQ0KPiA+IGlndF9wbGFuZV9zZXRfZmIoKSBpbiBtb2Rlc2V0X3dp
dGhfZmIoKSwgdGVzdF9jcF9lbmFibGUoKSwNCj4gPiB0ZXN0X2NwX2Rpc2FibGUoKSBhbmQgdGVz
dF9tc3RfY3BfZGlzYWJsZSgpLg0KPiA+DQo+ID4gVGVzdGVkLWJ5OiBKYXNvbi1KSCBMaW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3VyYWogS2FuZHBh
bCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+IFRoZSBjaGFuZ2VzIExHVE0u
IFRoaXMgcGF0Y2ggbmVlZHMgYSByZWJhc2UgYWZ0ZXIgdGhlIGJlbG93IHNlcmllcyBpcyBtZXJn
ZWQuDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTY2NTY2Lw0K
DQpIaSBTYW50aG9zaCB5b3UgY2FuIG1lcmdlIHRoaXMgd2hpbGUgeW91IGFyZSBtZXJnaW5nIHRo
aXMgc2VyaWVzDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gDQo+IFJlZ2FyZHMsDQo+
IFNhbnRob3NoPiAgIHRlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyB8IDI5DQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19j
b250ZW50X3Byb3RlY3Rpb24uYw0KPiA+IGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5j
IGluZGV4IGM1OTQ0MWYxMS4uZDFiN2M1ODYzIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19j
b250ZW50X3Byb3RlY3Rpb24uYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rp
b24uYw0KPiA+IEBAIC0yNjQsMTYgKzI2NCwyMiBAQCBzdGF0aWMgdm9pZCBtb2Rlc2V0X3dpdGhf
ZmIoaWd0X291dHB1dF90ICpvdXRwdXQsDQo+ID4gICAJaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9
ICZkYXRhLmRpc3BsYXk7DQo+ID4gICAJZHJtTW9kZU1vZGVJbmZvICptb2RlOw0KPiA+ICAgCWln
dF9wbGFuZV90ICpwcmltYXJ5Ow0KPiA+ICsJaW50IHdpZHRoLCBoZWlnaHQ7DQo+ID4NCj4gPiAg
IAltb2RlID0gaWd0X291dHB1dF9nZXRfbW9kZShvdXRwdXQpOw0KPiA+ICsJd2lkdGggPSBtb2Rl
LT5oZGlzcGxheTsNCj4gPiArCWhlaWdodCA9IG1vZGUtPnZkaXNwbGF5Ow0KPiA+DQo+ID4gICAJ
cHJpbWFyeSA9IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5cGUob3V0cHV0LA0KPiBEUk1fUExBTkVf
VFlQRV9QUklNQVJZKTsNCj4gPiAgIAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksICZkYXRhLnJl
ZCk7DQo+ID4gLQlpZ3RfZmJfc2V0X3NpemUoJmRhdGEucmVkLCBwcmltYXJ5LCBtb2RlLT5oZGlz
cGxheSwgbW9kZS0+dmRpc3BsYXkpOw0KPiA+ICsJaWd0X2ZiX3NldF9zaXplKCZkYXRhLnJlZCwg
cHJpbWFyeSwgd2lkdGgsIGhlaWdodCk7DQo+ID4gKwlpZ3RfcGxhbmVfc2V0X3NpemUocHJpbWFy
eSwgd2lkdGgsIGhlaWdodCk7DQo+ID4NCj4gPiAgIAlpZ3RfZGlzcGxheV9jb21taXQyKGRpc3Bs
YXksIGNvbW1pdF9zdHlsZSk7DQo+ID4NCj4gPiAgIAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnks
ICZkYXRhLmdyZWVuKTsNCj4gPiArCWlndF9mYl9zZXRfc2l6ZSgmZGF0YS5ncmVlbiwgcHJpbWFy
eSwgd2lkdGgsIGhlaWdodCk7DQo+ID4gKwlpZ3RfcGxhbmVfc2V0X3NpemUocHJpbWFyeSwgd2lk
dGgsIGhlaWdodCk7DQo+ID4NCj4gPiAgIAkvKiBXYWl0IGZvciBGbGlwIGNvbXBsZXRpb24gYmVm
b3JlIHN0YXJ0aW5nIHRoZSBIRENQIGF1dGhlbnRpY2F0aW9uICovDQo+ID4gICAJY29tbWl0X2Rp
c3BsYXlfYW5kX3dhaXRfZm9yX2ZsaXAoY29tbWl0X3N0eWxlKTsNCj4gPiBAQCAtMjg0LDYgKzI5
MCw4IEBAIHN0YXRpYyBib29sIHRlc3RfY3BfZW5hYmxlKGlndF9vdXRwdXRfdCAqb3V0cHV0LA0K
PiBlbnVtIGlndF9jb21taXRfc3R5bGUgY29tbWl0X3N0DQo+ID4gICB7DQo+ID4gICAJaWd0X2Rp
c3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLmRpc3BsYXk7DQo+ID4gICAJaWd0X3BsYW5lX3QgKnBy
aW1hcnk7DQo+ID4gKwlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7DQo+ID4gKwlpbnQgd2lkdGgsIGhl
aWdodDsNCj4gPiAgIAlib29sIHJldDsNCj4gPg0KPiA+ICAgCXByaW1hcnkgPSBpZ3Rfb3V0cHV0
X2dldF9wbGFuZV90eXBlKG91dHB1dCwNCj4gPiBEUk1fUExBTkVfVFlQRV9QUklNQVJZKTsgQEAg
LTMwMiw3ICszMTAsMTIgQEAgc3RhdGljIGJvb2wNCj4gdGVzdF9jcF9lbmFibGUoaWd0X291dHB1
dF90ICpvdXRwdXQsIGVudW0gaWd0X2NvbW1pdF9zdHlsZSBjb21taXRfc3QNCj4gPiAgIAlyZXQg
PSB3YWl0X2Zvcl9wcm9wX3ZhbHVlKG91dHB1dCwgQ1BfRU5BQkxFRCwNCj4gPiAgIAkJCQkgIEtF
Uk5FTF9BVVRIX1RJTUVfQUxMT1dFRF9NU0VDKTsNCj4gPiAgIAlpZiAocmV0KSB7DQo+ID4gKwkJ
bW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0KTsNCj4gPiArCQl3aWR0aCA9IG1vZGUt
PmhkaXNwbGF5Ow0KPiA+ICsJCWhlaWdodCA9IG1vZGUtPnZkaXNwbGF5Ow0KPiA+ICAgCQlpZ3Rf
cGxhbmVfc2V0X2ZiKHByaW1hcnksICZkYXRhLmdyZWVuKTsNCj4gPiArCQlpZ3RfcGxhbmVfc2V0
X3NpemUocHJpbWFyeSwgd2lkdGgsIGhlaWdodCk7DQo+ID4gKwkJaWd0X2ZiX3NldF9zaXplKCZk
YXRhLmdyZWVuLCBwcmltYXJ5LCB3aWR0aCwgaGVpZ2h0KTsNCj4gPiAgIAkJaWd0X2Rpc3BsYXlf
Y29tbWl0MihkaXNwbGF5LCBjb21taXRfc3R5bGUpOw0KPiA+ICAgCX0NCj4gPg0KPiA+IEBAIC0z
MTUsMTMgKzMyOCwyMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X21zdF9jcF9kaXNhYmxlKGlndF9vdXRw
dXRfdA0KPiAqaGRjcF9tc3Rfb3V0cHV0W10sDQo+ID4gICB7DQo+ID4gICAJaWd0X2Rpc3BsYXlf
dCAqZGlzcGxheSA9ICZkYXRhLmRpc3BsYXk7DQo+ID4gICAJaWd0X3BsYW5lX3QgKnByaW1hcnk7
DQo+ID4gKwlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7DQo+ID4gKwlpbnQgd2lkdGgsIGhlaWdodDsN
Cj4gPiAgIAlib29sIHJldDsNCj4gPiAgIAlpbnQgY291bnQ7DQo+ID4gICAJdTY0IHZhbDsNCj4g
Pg0KPiA+ICAgCWZvciAoY291bnQgPSAwOyBjb3VudCA8IHZhbGlkX291dHB1dHM7IGNvdW50Kysp
IHsNCj4gPiAgIAkJcHJpbWFyeSA9DQo+IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5cGUoaGRjcF9t
c3Rfb3V0cHV0W2NvdW50XSwNCj4gPiBEUk1fUExBTkVfVFlQRV9QUklNQVJZKTsNCj4gPiArCQlt
b2RlID0gaWd0X291dHB1dF9nZXRfbW9kZShoZGNwX21zdF9vdXRwdXRbY291bnRdKTsNCj4gPiAr
CQl3aWR0aCA9IG1vZGUtPmhkaXNwbGF5Ow0KPiA+ICsJCWhlaWdodCA9IG1vZGUtPnZkaXNwbGF5
Ow0KPiA+ICAgCQlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksICZkYXRhLnJlZCk7DQo+ID4gKwkJ
aWd0X2ZiX3NldF9zaXplKCZkYXRhLnJlZCwgcHJpbWFyeSwgd2lkdGgsIGhlaWdodCk7DQo+ID4g
KwkJaWd0X3BsYW5lX3NldF9zaXplKHByaW1hcnksIHdpZHRoLCBoZWlnaHQpOw0KPiA+ICAgCQlp
Z3Rfb3V0cHV0X3NldF9wcm9wX3ZhbHVlKGhkY3BfbXN0X291dHB1dFtjb3VudF0sDQo+IElHVF9D
T05ORUNUT1JfQ09OVEVOVF9QUk9URUNUSU9OLA0KPiA+ICAgCQkJCQkgIENQX1VOREVTSVJFRCk7
DQo+ID4gICAJfQ0KPiA+IEBAIC0zNDMsMTAgKzM2MywxNSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2Nw
X2Rpc2FibGUoaWd0X291dHB1dF90ICpvdXRwdXQsDQo+IGVudW0gaWd0X2NvbW1pdF9zdHlsZSBj
b21taXRfcw0KPiA+ICAgew0KPiA+ICAgCWlndF9kaXNwbGF5X3QgKmRpc3BsYXkgPSAmZGF0YS5k
aXNwbGF5Ow0KPiA+ICAgCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiA+ICsJZHJtTW9kZU1vZGVJ
bmZvICptb2RlOw0KPiA+ICsJaW50IHdpZHRoLCBoZWlnaHQ7DQo+ID4gICAJYm9vbCByZXQ7DQo+
ID4NCj4gPiAgIAlwcmltYXJ5ID0gaWd0X291dHB1dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsDQo+
ID4gRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4NCj4gPiArCW1vZGUgPSBpZ3Rfb3V0cHV0
X2dldF9tb2RlKG91dHB1dCk7DQo+ID4gKwl3aWR0aCA9IG1vZGUtPmhkaXNwbGF5Ow0KPiA+ICsJ
aGVpZ2h0ID0gbW9kZS0+dmRpc3BsYXk7DQo+ID4gICAJLyoNCj4gPiAgIAkgKiBFdmVuIG9uIEhE
Q1AgZW5hYmxlIGZhaWxlZCBzY2VuYXJpbywgSUdUIHNob3VsZCBleGl0IGxlYXZpbmcgdGhlDQo+
ID4gICAJICogImNvbnRlbnQgcHJvdGVjdGlvbiIgYXQgIlVOREVTSVJFRCIuDQo+ID4gQEAgLTM1
NCw2ICszNzksOCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NwX2Rpc2FibGUoaWd0X291dHB1dF90ICpv
dXRwdXQsDQo+IGVudW0gaWd0X2NvbW1pdF9zdHlsZSBjb21taXRfcw0KPiA+ICAgCWlndF9vdXRw
dXRfc2V0X3Byb3BfdmFsdWUob3V0cHV0LA0KPiBJR1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVD
VElPTiwNCj4gPiAgIAkJCQkgIENQX1VOREVTSVJFRCk7DQo+ID4gICAJaWd0X3BsYW5lX3NldF9m
YihwcmltYXJ5LCAmZGF0YS5yZWQpOw0KPiA+ICsJaWd0X3BsYW5lX3NldF9zaXplKHByaW1hcnks
IHdpZHRoLCBoZWlnaHQpOw0KPiA+ICsJaWd0X2ZiX3NldF9zaXplKCZkYXRhLnJlZCwgcHJpbWFy
eSwgd2lkdGgsIGhlaWdodCk7DQo+ID4gICAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBj
b21taXRfc3R5bGUpOw0KPiA+DQo+ID4gICAJLyogV2FpdCBmb3IgSERDUCB0byBiZSBkaXNhYmxl
ZCwgYmVmb3JlIGNydGMgb2ZmICovDQoNCg==
