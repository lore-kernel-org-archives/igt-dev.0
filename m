Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4B9CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 11:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160C710E2F8;
	Tue, 12 May 2026 11:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnoSNMhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6EF10E2F8
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778583764; x=1810119764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rgYj/o6TZ5IhKXxQnb0sRRDGkf768zXhy81PPfKKXTc=;
 b=XnoSNMhWlRaXBiPPHLFeSqMaezJ9d0HNzAAgQCMszljJSp6zpKiy/jDU
 IOxy460tk+PuueK/3zC4Sb4GG8DU0NmGZCM34MtKpLaFyzjwuLaz0BpwC
 YycScWQiJV7rUfU6OrevB2i5MbuYnozQX6bMJEVeZrzto2IamaqLWf1Em
 xzrxcRIQOjKbAyEBeX3Rl4SbfO0pjAQvWEJPW2EuPdnwAnibWp+8I5LhG
 LH2pdxJWUpjmwvnnAvKnE0o9tx7ll8o1VBki73k8iZ4zehSaMy2ltl/Ql
 6QjeG+357OUTAZA3CMWfNKR36WPQhqJiT8MFpiWgBWZzTJFRFAhNCYd6M g==;
X-CSE-ConnectionGUID: TyH3KnVjSZ2C1h2vGARPDg==
X-CSE-MsgGUID: a0QyQ9jdTy29d/Jh66hqiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79472961"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="79472961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:02:43 -0700
X-CSE-ConnectionGUID: 8q5mQS5YRZ+s7mHAkCjLyw==
X-CSE-MsgGUID: 6O10otomTCG1rfGunOcJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="237827172"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:02:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 04:02:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 04:02:41 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 04:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/47s5V+mi3EMVa5hg/RiDvBYpcyjVwOAOBPLp5DjOUmAAzSpxJuxDxPzkTkCnaX54aEKoOG6DSPJQpVJAaGNTcYj8geOl/ut9/7MIQPYL4EqfE82O/pc4tTCzdHCAqz/Y9dG8CgyHOLSHLv9w0Hqu8SukmNCyYaPB1LwTf9/wMcMqSDu9P08YSdKrah7nK2ZFYfQIw2qbL1PaRVh4DIiRfliDBejdcTjJ4oBNSxCix7ykh6gkZxp5NSMZKL1eFfAJHxSh5Dp9wJ8Wd7wMHPQz6WSAl8Ui1bk1fc15qOs+SGH94W+zJdsNM00089i2hI99TwaiOjxOyzWOwqG9ZKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgYj/o6TZ5IhKXxQnb0sRRDGkf768zXhy81PPfKKXTc=;
 b=biw4ZwEBOHrDgdvse3zeu9OjiYB82xzxcWSD0jlfrUINtAyD+esoJQXmH4pGgx6bqv8BAT7H2Pj2p6+ussx+FQiPTKY4BE1nJMpy/ZmZBb8hHsz8YUBMpzQLX/HL+8FQQxkuhssPgm4YNGHZRkl8AO6/4W7q1cpMZmp6sFWewyrMQ09Td2SL423dPnK+rVq9ZXzH8J/P6nQEZursaZkzYdm0TwyCRSlCtvPHeLsLVmOOl4NCRSw8QhpO4IlsXWYkfPTh/707QKF30TzIlg8FEq3MBkHPp6beHfQfJjWWunCdTXubePWN1Whe/krZlNVTWQTwDxPtcT5KyvYeCLkLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 11:02:36 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 11:02:36 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] tests/core_hotunplug: exercise fd-holding subtests with
 Xe workload
Thread-Topic: [PATCH] tests/core_hotunplug: exercise fd-holding subtests with
 Xe workload
Thread-Index: AQHc3VtuBfTFiRhYNUWEsJ4PH/QVg7YBC6MAgAACdWCAAsp5AIAGYXbA
Date: Tue, 12 May 2026 11:02:36 +0000
Message-ID: <SA3PR11MB81187304D00AFA41385E5024D0392@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260506135714.1819588-2-nitin.r.gote@intel.com>
 <20260506141814.nseva2m4zhywwqxy@kamilkon-DESK.igk.intel.com>
 <SA3PR11MB81181CA7FFDE5B350CDEBD51D03F2@SA3PR11MB8118.namprd11.prod.outlook.com>
 <a4fb5c49367356423c3c52e0dbd0da7f010723ea.camel@linux.intel.com>
In-Reply-To: <a4fb5c49367356423c3c52e0dbd0da7f010723ea.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|BY1PR11MB8005:EE_
x-ms-office365-filtering-correlation-id: dca00cdd-da51-4b1f-3836-08deb015f9f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|11063799003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info: 3vYwJpGMN3XUnC4MBmRk7boGeQB65yNRloNht6unuw8AcDfYIjobujasdPhFSVeeGQqXxHl3zkswZij8gv13GCfkQzfzvbjWlUWprr4hp0oXw6ejiV7kZibPneSrPlMrdqnMweZJYkUsJY/zm35xKgj+G5Mb3eJQVeTDNUH165CnEDk//Zqeeptxcm8AIv/+2EmJ9h2/5+5q8518+kD6GSdKasuuU/0U4A+IE49XCBdqvsME0gGRE7v+VpwJ+R5ur47GInnWxlCsifDa01+yGg10RWnvIY95BnvBiJKi3xNa8Pn5arWmwrHvpWs2gO/1wCf+fF/WT9afiRVEs55/aQFDRxrgLjMDNpsudFBrBKMXm47XH/vAIug1jHcJw5joRor1GJgT/O77txDVYG4e0atiaZMD1xhYw90nwTK224qOY63b4v4L1L/BaowU2+7pwWwlqcLhF3WdqOv2jxU2uy+AS4b9akaWygxQ3+t0SfuRzfESsBryY67zcsRT77yA9o/z3c9nfax/FPi10lQ+QsMepzoIYUPIZfFMqLFqjJpzffwCOCAPBBJhif6C0QuQDycF9s1ytQwAc6R+dLdkR6ZU4+RjVJXTs04Ck26JntVrUCSuV53NxSZeO1FQ2nv74dNIHwv0ucvbVo3EF65kusnCP9PIZxSklPEOw+l08EBk5vUE/5WZ0Gi5qFg3S+xVZI2dRepTzwvPpTVZDpV1Uw2s1C+2Gz5fq8XlLZ7HWK7EIc73UO/4rSitjj665QPy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(11063799003)(38070700021)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3AvVzVhU0ZoMEdkNHVYS0dCcHhzSDkrazhkWGwrMnhvMzRXckoxRFN4a2g1?=
 =?utf-8?B?T1hWZFBXVVQ1bEpmRURrMjE2WUVhWjMzdllOSFNWdi9vU2lUUXBPVkFrNXds?=
 =?utf-8?B?TkR5QkF6UFRqbnhHT2Z0Vjk0UmRFVkZTQWl2anhpNkFyR0JaK2xUK3M2UGVh?=
 =?utf-8?B?dDdJZ05IdnhKUG5uaXIyRUIvQ05UT1J0UDY0SzR2MGhjZjJjOVVWUjFSbzFl?=
 =?utf-8?B?ODRrZDJMVnBUSUorYmZpUHFvZ2VxRFhKeVhCMnV1N1ZDZTJhUTRLYThwK2hW?=
 =?utf-8?B?aGYvTFhyQjJ5ZlVTWGtHVmtjeUd6eTNOSjc5dmIyQXBYS3Z0YUF4S3p4MWpN?=
 =?utf-8?B?MlFEbFJHZTdXMEdFeVVNd290V3V2VFlvWWlCdkpPV1AzdlBabDJtV1FoSFJt?=
 =?utf-8?B?Qzg5VnVvUFNwa1hJU3NSalV5ekpicG5sWXNRSjBvOStMQytOV0hYOWZYd1la?=
 =?utf-8?B?NERvYXJ5SWRkZ2V0K1RUODJPb1RhZEJjVGsrK1V6VDFqZE5JZzFjczE1Zkkr?=
 =?utf-8?B?Vk8yQkhKVndZMEpmbngwWkdLUExCclV1elBBTHA2L09qc0NKN2Y0QyszcVkv?=
 =?utf-8?B?enBHUEhKUUJUYlYwVlZ3S1BXaFJGYmN4Wlk3QXEzQ2VDNFQwVkZiajVER1J0?=
 =?utf-8?B?cEhxejllVGR4M1lXblBMMFRPdTJvSm1oWlRrVWZhWGxPWFQwK09KeTdrSGZE?=
 =?utf-8?B?UXBQK1ovcTJmUnBWVHRhOHpzbDhEWHd4ZHd2YmRteDF6bDg3VlFQb2pUZkhx?=
 =?utf-8?B?bjlDWnFmNit0Rmt1UDNKVWtTOFhWb3BOdDdOMjZwK3JRR0txeTVxTE51L2Nx?=
 =?utf-8?B?OGVuanl1KzBUcmdhM0N6QXpuZ3hzZ0NOeE1tNWtQcXVtWGdKelhWRVdFSS9O?=
 =?utf-8?B?Nkt6UnhmMXpqOVN3VHU0eTI4OTdTSnRpOGlCbHpSVVgzcTRSQzlLNzQ4aVlT?=
 =?utf-8?B?d3ExRDNFaVh6ZGlVRlpCSzJmdjByZFd4dFVaMDdlVnhDUTNQSDdwSWEyeFZY?=
 =?utf-8?B?UlZHeE9LM0ZZbGtaZ3BrdFl0RUNpbEE4TFpRdEZMOS93VE11QTFPOFJyNXkx?=
 =?utf-8?B?V3E0dnU5U2pHa1RHbVQyY1VjODdDMUdYdUtXeWFJUGJFWTdwdktOM2k0QU5a?=
 =?utf-8?B?QTJKV2lKM3dabGxmREplTDVDSVRSUUYzUWtyTTNEZFNIZ1c2TlBsZENoK2hU?=
 =?utf-8?B?U0RSRFlSdUtRSDVUTmtocElDY2o5VU05blM4a3ZLUGxqakZyYlpNMjcxYUw3?=
 =?utf-8?B?UVBIdzh3SlZCNnloeEs0VkFGOVJRL1VINnh4dnJCcDNjeldSbmF0TUxrdXlE?=
 =?utf-8?B?WXhJSTB0UzVENlJvTFQ0WElYV1IxbG9GUHMzMExrbU15ckRIaUpjWjhnZUZJ?=
 =?utf-8?B?SXFLdGxmblNhKzlPQWRjMlA3bFp1WHBOaXVwUEVhOGhBZFlvd1lsQWQybUc3?=
 =?utf-8?B?M3M0R0VmQVhiK3RSejRsZjFMeE1McHZqeHdhTlhPbUFqa0xMMmdzVyt4Smxm?=
 =?utf-8?B?a3Y2UG0rMWZ3ODNQZEV1YWhVYTA5VHFvZS91a09YM0VVZGo5UmdWN3c2R2NO?=
 =?utf-8?B?bWRsUDNZUzRhdEVLOGJNRnUxZ1pFaFdFVVhWdzBneWY2M0YyQnBxYXNpd3dk?=
 =?utf-8?B?VFk4cjlLcW5PS1duVlg0UjNGd0dmYkRRSlBYbzBna0JLblcrNzFIV243N1Nw?=
 =?utf-8?B?TXFiNnl1d1R4VGNMdDdOVDB0M2xsakJOT1hISXk5RnhKRTRselRNVHpUUFp3?=
 =?utf-8?B?ekFPNDNzY2lkSEx1TGZBRkpvd3phempra1I1SURkdjQyeWtPOFRSQ2FtMTJ0?=
 =?utf-8?B?bWVMV0w1eFNXczNVMXhrQWFEWFh4R3RzdzR0anZONFlzb25BajFtZ2dZS3Aw?=
 =?utf-8?B?Y0pKL3ltZGpwemNOTVRGcnRKYStzNEZRSDh3eUJSZlltNkFZUktPcmJjM0NP?=
 =?utf-8?B?bVdMSEQzN0R4ejlCK0ltT05UckhrRG5tZXZKOGx6MjBWNVZrNlk3bnEveXZ0?=
 =?utf-8?B?VXFGclJmWjZBNVBGQ3phaDlLZmtacExUVkxvZEwySkpPblhiWW1SZjB0TnlS?=
 =?utf-8?B?aFlHMHpLRHRUNWhybmUyMzdWeERMazl1L0NLWHg3alJVWmFmY2hINEZFY3hQ?=
 =?utf-8?B?YXBJMGQvcVRteTl6RWFzQU9GSFI0ZWgrMXFJQkg4MStEdVpZOE5BMU1YZzhk?=
 =?utf-8?B?YlljM0dRcWYwbjVYUkhnVnpQRy9SNG13clF5d2dibEVKSnduMUlJNFhzUFpE?=
 =?utf-8?B?MXVlSE44NUs3dkFyT2Nwcy8rb1Via25YaWVxY2tRb1VPVnFWWWZ5U2ZDWjlJ?=
 =?utf-8?B?N2YxMEw0QlZtSUo3cnc0N29UQTVLZU5XQmxETWNaTUhqWVp0eW5hUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LpW+Va2HBc0Tsd1+E+/SMFLX8VLY8BUTxpLfjpeu6vpgwrwDBLvikC3nblnlz6clLhAzplAjA+yjKOVWAMHwyK3w4MdGQAuKeavVCcajgrdMFtsRGM8WDEw1q/+W6a+IG64JhfHYcJ6FiWLJjdwrT/d8F5Gow0WenRhcubMBBHeWjqUkZ/0+K24SzbgmVokBvv9JlL5vdAw0qkaI59XMEQyOjbpLDRy3PYGuDvGeML8IQWmp8aAxjYgQNVl0Y5Eoc5gh+boHHQu9MQr2TDOKVXbyswQyQWCBsvglaA5vcbB99TKsKhg8t9gdDZQUxt+XONzqbeWKHnhw+9sHvqmJ1w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca00cdd-da51-4b1f-3836-08deb015f9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 11:02:36.6795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOByFb4oXrF8wXVHG57Wo8Fw2CvKmliMGedqPbuMI1vhCYtNrFABS5EvDHICs28aZucy7Fnc4o6af0hF0J23DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
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

SGkgSmFudXN6IGFuZCBLYW1pbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBKYW51c3ogS3J6eXN6dG9maWsgPGphbnVzei5rcnp5c3p0b2Zpa0BsaW51eC5pbnRlbC5j
b20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDgsIDIwMjYgMjozNCBQTQ0KPiBUbzogR290ZSwgTml0
aW4gUiA8bml0aW4uci5nb3RlQGludGVsLmNvbT47IEthbWlsIEtvbmllY3pueQ0KPiA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSB0ZXN0cy9jb3JlX2hvdHVucGx1ZzogZXhlcmNpc2UgZmQtaG9sZGluZyBz
dWJ0ZXN0cyB3aXRoIFhlDQo+IHdvcmtsb2FkDQo+IA0KPiBIaSBOaXRpbiwNCj4gDQo+IE9uIFdl
ZCwgMjAyNi0wNS0wNiBhdCAxNDozNyArMDAwMCwgR290ZSwgTml0aW4gUiB3cm90ZToNCj4gPiBI
aSBLYW1pbCwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZy
b206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4g
PiA+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDYsIDIwMjYgNzo0OCBQTQ0KPiA+ID4gVG86IEdvdGUs
IE5pdGluIFIgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gPiBDYzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IEF1bGQsIE1hdHRoZXcNCj4gPiA+IDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPjsgSmFudXN6IEtyenlzenRvZmlrDQo+ID4gPiA8amFudXN6LmtyenlzenRvZmlrQGxp
bnV4LmludGVsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3RzL2NvcmVfaG90
dW5wbHVnOiBleGVyY2lzZSBmZC1ob2xkaW5nDQo+ID4gPiBzdWJ0ZXN0cyB3aXRoIFhlIHdvcmts
b2FkDQo+ID4gPg0KPiA+ID4gSGkgTml0aW4sDQo+ID4gPiBPbiAyMDI2LTA1LTA2IGF0IDE5OjI3
OjE1ICswNTMwLCBOaXRpbiBHb3RlIHdyb3RlOg0KPiA+ID4gPiBUaGUgc2l4IGZkLWhvbGRpbmcg
c3VidGVzdHMgKGhvdHVuYmluZC1yZWJpbmQsIGhvdHVucGx1Zy1yZXNjYW4sDQo+ID4gPiA+IGhv
dHJlYmluZCwgaG90cmVwbHVnLCBob3RyZWJpbmQtbGF0ZWNsb3NlLCBob3RyZXBsdWctbGF0ZWNs
b3NlKQ0KPiA+ID4gPiBrZWVwIGEgRFJNIGZkIG9wZW4gYWNyb3NzIHVuYmluZC91bnBsdWcgYnV0
IGxlYXZlIHRoZSBHUFUgaWRsZSwgc28NCj4gPiA+ID4gb24gWGUgdGhlIHVuYmluZC91bnBsdWcg
cGF0aCBpcyBuZXZlciBleGVyY2lzZWQgYWdhaW5zdCBhbiBhY3RpdmUNCj4gPiA+ID4gVk0sIGV4
ZWMgcXVldWUgYW5kIEJPcy4NCj4gPiA+ID4NCj4gPiA+ID4gQWRkIHhlX3dvcmtsb2FkX3N0YXJ0
KCkveGVfd29ya2xvYWRfc3RvcCgpIGhlbHBlcnMsIGdhdGVkIG9uDQo+ID4gPiA+IGlzX3hlX2Rl
dmljZSgpLCB0aGF0IHJ1biBhIHNwaW5uZXIgb24gdGhlIEdQVSBhY3Jvc3MgdGhlDQo+ID4gPiA+
IHVuYmluZC91bnBsdWcgc2VxdWVuY2UsIHNvIHRoZSBkZXZpY2UgaXMgcmVtb3ZlZCB3aGlsZSBh
IHdvcmtsb2FkDQo+ID4gPiA+IGlzIHVzaW5nIGl0LiBpOTE1IGFscmVhZHkgaGFzIGVxdWl2YWxl
bnQgY292ZXJhZ2UgdmlhDQo+IGxvY2FsX2k5MTVfaGVhbHRoY2hlY2soKS4NCj4gPiA+ID4NCj4g
PiA+ID4gVmFsaWRhdGVkIG9uIEJNRyB3aXRoIGEgS0FTQU4tZW5hYmxlZCBrZXJuZWw6IGFsbCBz
dWJ0ZXN0cyBwYXNzDQo+ID4gPiA+IHdpdGggbm8gS0FTQU4gcmVwb3J0cy4NCj4gPiA+ID4NCj4g
PiA+ID4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPiA+ID4g
QXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNC43DQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE5pdGluIEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiAgdGVzdHMvY29yZV9ob3R1bnBsdWcuYyB8IDc0DQo+ID4gPiA+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDc0
IGluc2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmVf
aG90dW5wbHVnLmMgYi90ZXN0cy9jb3JlX2hvdHVucGx1Zy5jIGluZGV4DQo+ID4gPiA+IDdjOWRh
ZTFiZi4uODhhMjEzM2FmIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS90ZXN0cy9jb3JlX2hvdHVucGx1
Zy5jDQo+ID4gPiA+ICsrKyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMNCj4gPiA+ID4gQEAgLTU2
NSw2ICs1NjUsNDQgQEAgc3RhdGljIHZvaWQgc2V0X2ZpbHRlcl9mcm9tX2RldmljZShpbnQgZmQp
DQo+ID4gPiA+ICAJaWd0X2Fzc2VydF9lcShpZ3RfZGV2aWNlX2ZpbHRlcl9hZGQoZmlsdGVyKSwg
MSk7ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICsvKiBYZSBHUFUgd29ya2xvYWQgaGVscGVycyAqLw0K
PiA+ID4gPiArDQo+ID4gPiA+ICtzdHJ1Y3QgeGVfd29ya2xvYWQgew0KPiA+ID4gPiArCWlndF9z
cGluX3QgKnhlX3NwaW47DQo+ID4gPiA+ICsJdWludDY0X3QgeGVfYWhuZDsNCj4gPiA+ID4gK307
DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHhlX3dvcmtsb2FkX3N0YXJ0KHN0cnVj
dCBob3R1bnBsdWcgKnByaXYsIGludCBmZCwNCj4gPiA+ID4gKwkJCSAgICAgIHN0cnVjdCB4ZV93
b3JrbG9hZCAqdykNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwlpZiAoIWlzX3hlX2RldmljZShmZCkp
DQo+ID4gPiA+ICsJCXJldHVybjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWxvY2FsX2RlYnVnKCIl
c1xuIiwgInN0YXJ0aW5nIFhlIEdQVSBzcGlubmVyIik7DQo+ID4gPiA+ICsJcHJpdi0+ZmFpbHVy
ZSA9ICJYZSB3b3JrbG9hZCBzdGFydCBmYWlsdXJlISI7DQo+ID4gPiA+ICsJdy0+eGVfYWhuZCA9
IGludGVsX2FsbG9jYXRvcl9vcGVuKGZkLCAwLCBJTlRFTF9BTExPQ0FUT1JfUkVMT0MpOw0KPiA+
ID4gPiArCXctPnhlX3NwaW4gPSBpZ3Rfc3Bpbl9uZXcoZmQsIC5haG5kID0gdy0+eGVfYWhuZCk7
DQo+ID4gPiA+ICsJcHJpdi0+ZmFpbHVyZSA9IE5VTEw7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK3N0YXRpYyB2b2lkIHhlX3dvcmtsb2FkX3N0b3Aoc3RydWN0IHhlX3dvcmtsb2Fk
ICp3KSB7DQo+ID4gPiA+ICsJaWYgKCF3LT54ZV9zcGluKQ0KPiA+ID4gPiArCQlyZXR1cm47DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwkvKg0KPiA+ID4gPiArCSAqIFRoZSBkZXZpY2UgbWF5IGJlIGdv
bmUgKHVuYmluZC91bnBsdWcpLCBzbyBhdm9pZCBpZ3Rfc3Bpbl9mcmVlKCk6DQo+ID4gPiA+ICsJ
ICogb24gWGUgaXQgYXNzZXJ0cyBpbiB4ZV9zcGluX3N5bmNfd2FpdCgpIGJlY2F1c2UgdGhlIHN5
bmNvYmogd2lsbA0KPiA+ID4gPiArCSAqIG5ldmVyIHNpZ25hbC4gU3RvcCB0aGUgc3Bpbm5lciB2
aWEgYSB1c2Vyc3BhY2UgbW1hcCB3cml0ZSBhbmQgbGV0DQo+ID4gPiA+ICsJICogdGhlIERSTSBm
ZCBjbG9zZSByZWNsYWltIHRoZSBrZXJuZWwtc2lkZSByZXNvdXJjZXMuDQo+ID4gPiA+ICsJICov
DQo+ID4gPiA+ICsJbG9jYWxfZGVidWcoIiVzXG4iLCAic3RvcHBpbmcgWGUgR1BVIHNwaW5uZXIi
KTsNCj4gPiA+ID4gKwlpZ3Rfc3Bpbl9lbmQody0+eGVfc3Bpbik7DQo+ID4gPiA+ICsJcHV0X2Fo
bmQody0+eGVfYWhuZCk7DQo+ID4gPiA+ICsJdy0+eGVfc3BpbiA9IE5VTEw7DQo+ID4gPiA+ICsJ
dy0+eGVfYWhuZCA9IDA7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gIC8qIFN1YnRl
c3RzICovDQo+ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMgdm9pZCB1bmJpbmRfcmViaW5kKHN0cnVj
dCBob3R1bnBsdWcgKnByaXYpIEBAIC01OTEsMTINCj4gPiA+ID4gKzYyOSwxOCBAQCBzdGF0aWMg
dm9pZCB1bnBsdWdfcmVzY2FuKHN0cnVjdCBob3R1bnBsdWcgKnByaXYpDQo+ID4gPiA+DQo+ID4g
PiA+ICBzdGF0aWMgdm9pZCBob3R1bmJpbmRfcmViaW5kKHN0cnVjdCBob3R1bnBsdWcgKnByaXYp
ICB7DQo+ID4gPiA+ICsJc3RydWN0IHhlX3dvcmtsb2FkIHcgPSB7IDAgfTsNCj4gPiA+ID4gKw0K
PiA+ID4gPiAgCXByZV9jaGVjayhwcml2KTsNCj4gPiA+ID4NCj4gPiA+ID4gIAlwcml2LT5mZC5k
cm0gPSBsb2NhbF9kcm1fb3Blbl9kcml2ZXIoZmFsc2UsICIiLCAiIGZvciBob3QNCj4gPiA+ID4g
dW5iaW5kIik7DQo+ID4gPiA+DQo+ID4gPiA+ICsJeGVfd29ya2xvYWRfc3RhcnQocHJpdiwgcHJp
di0+ZmQuZHJtLCAmdyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gIAlkcml2ZXJfdW5iaW5kKHByaXYs
ICJob3QgIiwgMCk7DQo+ID4gPiA+DQo+ID4gPiA+ICsJeGVfd29ya2xvYWRfc3RvcCgmdyk7DQo+
ID4gPiA+ICsNCj4gPiA+DQo+ID4gPiBUaGlzIG1ha2VzIHRoZXNlIGhvdCogdGVzdHMgWGUgZHJp
dmVyIG9ubHkgd2hpY2ggaXMgbm90IGEgd2F5IHRvIGdvLg0KPiA+ID4gK0NjOiBKYW51c3ogS3J6
eXN6dG9maWsgPGphbnVzei5rcnp5c3p0b2Zpa0BsaW51eC5pbnRlbC5jb20+DQo+ID4gPg0KPiA+
DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LCBidXQgaXQgaXMgbm90IHRoZSBjYXNlLg0K
PiA+IHhlX3dvcmtsb2FkX3N0YXJ0KCkgY2hlY2tzIGlzX3hlX2RldmljZShmZCkgYW5kIHJldHVy
bnMgaW1tZWRpYXRlbHkgb24NCj4gPiBub24tWGUgZHJpdmVycywgbGVhdmluZyB3LT54ZV9zcGlu
IE5VTEw7IGFuZCB4ZV93b3JrbG9hZF9zdG9wKCkgdGhlbiByZXR1cm5zDQo+IGVhcmx5IGF0IHRo
ZSAhdy0+eGVfc3BpbiBjaGVjay4NCj4gPiBTbywgb24gaTkxNSB0aGUgaG90KiB0ZXN0cyB3b3Jr
IGV4YWN0bHkgYXMgYmVmb3JlLg0KPiANCj4gMS4gUGxlYXNlIGRvbid0IGNoYW5nZSBzY29wZSBv
ZiBleGlzdGluZyBzdWJ0ZXN0cy4gIElmIHlvdSBuZWVkDQo+ICAgIHRvwqB0ZXN0wqBob3QgdW5w
bHVnIHdpdGggYSBiYWNrZ3JvdW5kIHdvcmtsb2FkIHRoZW4gcGxlYXNlIGFkZCBhIG5ldw0KPiAg
ICBkZWRpY2F0ZWQgc3VidGVzdC4NCj4gDQo+IDIuIFBsZWFzZSBrZWVwIHRoZSB0ZXN0IGhhcmR3
YXJlIGFnbm9zdGljLiAgVGhhdCBhbHNvIG1lYW5zLCBkb24ndCBjYWxsDQo+ICAgIHVuY29uZGl0
aW9uYWxseSBmdW5jdGlvbnMgd2hpY2ggbmFtZXMgc3VnZ2VzdCBhcHBsaWNhYmlsaXR5IHRvIGEN
Cj4gICAgc3BlY2lmaWMgcGxhdGZvcm0uICBUaGF0J3MgbWlzbGVhZGluZy4gIFlvdSBtYXkgZS5n
LiBmb2xsb3cgYSBjb2RlDQo+ICAgIHBhdHRlcm7CoG5vdyB1c2VkIHdoZW4gYSBwbGF0Zm9ybSBz
cGVjaWZpYyBoZWFsdGNoZWNrIGlzIGNhbGxlZC4NCj4gDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNs
YXJpZmljYXRpb24uIEFncmVlZCBvbiBib3RoIGNvbW1lbnRzLg0KVGhlIGluaXRpYWwgdGhvdWdo
dCB3YXMgdGhhdCByZXVzaW5nIGV4aXN0aW5nIHN1YnRlc3RzIHdvdWxkIGF2b2lkIGNvZGUgZHVw
bGljYXRpb24sIA0Kc2luY2UgdGhlIGhvdHBsdWcgc2VxdWVuY2UgaXMgdGhlIHNhbWUgd2l0aCBh
IGJhY2tncm91bmQgd29ya2xvYWQgYXMgd2VsbC4gDQpCdXQgeWVzLCBpdCBjaGFuZ2VzIHRoZSBz
dWJ0ZXN0J3Mgb3JpZ2luYWwgaW50ZW50Lg0KDQpJJ2xsIGFkZCBuZXcgZGVkaWNhdGVkICotd2l0
aC1sb2FkIHN1YnRlc3RzIGluc3RlYWQsIHdpdGggZHJpdmVyLWFnbm9zdGljIGhlbHBlciBuYW1l
cyB0aHJvdWdob3V0Lg0KDQpSZWdhcmRzLA0KTml0aW4NCg0KPiBUaGFua3MsDQo+IEphbnVzeg0K
PiANCj4gPg0KPiA+IC0gTml0aW4NCj4gPg0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IEthbWlsDQpb
Li4uXQ0K
