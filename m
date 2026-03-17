Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EFCFD8740
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 11:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3646310E5FE;
	Tue, 17 Mar 2026 11:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEY5+D9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72E110E5FE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773746963; x=1805282963;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=YSZWxj2k1pfVc2q/5r6aRFV1Ptg3tVS0tHA26xeteSY=;
 b=oEY5+D9CZO9KW1RfhqTWYb2QMXK+G+U7IMUZbz41uBwiQWj3ItK3bt+g
 MQLpHVovxXTgj7f8KhA1AWgq6feN46zbyaeNYFBsnhp7pn819SUaXN+mE
 Crm5n78q8+ZSX+ZIMdUxrzK1X0NKKISO+XqksfmAipxrNWDOVMGHi6BD5
 rJNdfYDRZfPliXZslLSt+ld+RI9yQNjGtNv3uHshIHbkMVr4w+Sba23oV
 5RrMxLb3kLMo/Su4DNimFGhDZipX4TAyZplu8bHVfaxMN+xW5NFAo5o2C
 jnD/RsMThVztK6d6d7o6K+yyij5qaTEiO0EiQZTPxF8L9Jej93Tlu0Orz Q==;
X-CSE-ConnectionGUID: ASbVml1WQJytlGhUsUjlNA==
X-CSE-MsgGUID: iyEb++tSSVaXQzx52KQxOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74664091"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74664091"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 04:29:23 -0700
X-CSE-ConnectionGUID: JMRT6FW6QEi/xnrIMDK9lw==
X-CSE-MsgGUID: IYZlXutkRdGF4fEJ9z0jMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="260145464"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 04:29:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 04:29:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 04:29:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 04:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPT4najRHTWJmlf+/+iVfpT/O2/L9O8FhUqyAhNEmJ1XS1ZGhpjxeXNbIBtVMg5CSsw2cqDpathXACxzo3ExvihL6Ta3FbErHM2qg0p0s4ztYGkPa3KwJRglVDgOIQuxqjJOGBW4MgYbLH6rpPOxC0zOL5pii5ATPnlq7rdTdaJosS79cDzdqgvixKIYVx8C9vkby3gA1IAnNgHhKm+9CFPI9phYX2N0V6vQGPZhYscT/VIqJqPAgtPUXFR3mmLWA6Avxx0TNu+YlUpGjL5PKXVZVIbCsQVUFYN06j8HyLk5N/j7vhdxufD3+C4Z36BLu1SoIUl6dAn+m7C5JxjLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSZWxj2k1pfVc2q/5r6aRFV1Ptg3tVS0tHA26xeteSY=;
 b=ae87I//DufNRuwF1nlwN1rnnyMXZwg9u4PRFGGEgmNUCaFX3FDDn+U+GdX0thBkLflobnYdllb5rVKUWGnATJRX+pYO1RTLr3Ga+5lhhc6GyCA5TCKsIFVRHsNRkX661hKqcC3YRa3ma/5SbEpGDbMg4zOrrKOH5VfcvLsWS1UQZ4inTglAmakFM0UpqqF2V9+XgHLeofCds6jFi6P23d1dQkaimRnY9MOUtvyb6mCvAATOcmx22BEE6dbDrXcWGNVezDSuTQhNT81kHcm38+0JVy7r1Tyri48pWCs6z49aY5Qa0uPNgkkxvdmNefLGKjVkJ+w88qjDzWmLbclMKrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 11:29:19 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 11:29:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Index: AQHctelSAP/xKOJp2EigCx2arTzCb7WylsGA
Date: Tue, 17 Mar 2026 11:29:18 +0000
Message-ID: <e9dfaab6f1205aadd857afb11572c178f6d8d33f.camel@intel.com>
References: <20260317083603.63589-1-jeevan.b@intel.com>
In-Reply-To: <20260317083603.63589-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|SN7PR11MB7066:EE_
x-ms-office365-filtering-correlation-id: 62037b7d-d775-45bd-258e-08de84186ddb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: ohzZc1qZXFN5CPutSlTqjztkDRABmkhiZ91ccp/lNkZhD541v/BpNweNhgYvP7/eC3UsJzeA7vLaIW6M0eB5wSot0kr1hPQ3aNAElZit2tTRn5ehfVdQ1UBo6I2Cba6Us70orcJRq3qztCueWSXmpSAw5kF3DcTMI9iCUt30vD365uXbIsxy2y2HA6YnB37i1E7t/n9vjsF3gHwma41fyY+IJRx4/BXUv0yf3DFxFwaXNZp5ShWwFEVKe8yueZLRI7eEaXf5FdfxUdTeLaZTr/Dyf0zkl69xr6JM6doC+un4nEL98A55W0tv9G2MAWcgwCwTDjqmTVDplREfnWqmO6Ug2prIednf6VnOFann/oNP187uIigOqGN+sfxWM0tT062li6N63CwA3CTgSZk7AJgmk/MOwvlVUaxs8Xf0s+/5GUo+hrYwV/FJQg1g6vBuSB7oBuku1b1oPqLgTcAKhpRdOczYtokknJsJxHBuRFSJ5OGXMmEZA6eP+GA0XyKQslKYUljJJmJFD9YtiWn33ttoT22kdN1rIXMkNjOl4tkkinOK2ubPeixlTbW7qBkiV8ji49hXvoZl1wRz7/ZC05fg4kH3BoCcRUcvHwbn1t5RNzk7mYSMZvhhpjCpPrXRE//MGybRpREyfrDMyO+9RACiXkQzxiAPW5E0+lESB6mmFNherpduA5eh7w2G5EDpK110DQcAJ+GKd3kdxmf6Bjj629Uxk7gWkryI7Zu8kWjBBp5IgQBZ0vmQaH35x/deggx+hRwUVIC9FR16QI22YwdU/qeWaCZBNp+J+KqX3ys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjhEK0s2Qk5IdmRoc0FQdXlVVmNzb2dqL1ZZOHhCNlEyczFmUDdsbUEzWEpn?=
 =?utf-8?B?TUJBQkdMTlc2RGJBUTU1dmZBenRZOW1TVlQyMHVpaEtJUkZlY3dXVDVVeEpi?=
 =?utf-8?B?VmJtNjJROGI5Z1I5UkdKU0lPL0xVdENObXh3N1U1WnQxK0h2aytOeHpuMlFk?=
 =?utf-8?B?bXQ1Z2RDeURiYzBFSDFCbFVrZ0Q2SzhaZFRzM2YyRHp2eE1lR0VIUVNFa0RY?=
 =?utf-8?B?SVhRdEZoUUZ2NHpiSUZpZ3VwZXNlK1JGTGQzRkJZYlpZSklSamJIRC9PcVY3?=
 =?utf-8?B?SWZVSWlaaU80TXVlejAvdlVaUGU4WXdSWUZjUVdkZ3owRHZDWlp5b2ZHMkFH?=
 =?utf-8?B?aUFaMmlyZys5TUZlMGF5N1RKYWRueFQ0a3BFdjJlM1BzaDRmWGVxaFN5ZnE2?=
 =?utf-8?B?RmR4WldUOC9kZGRJeldJK3FnUHcweTFySzRLamhKdzQ0aUtNa3NCTmZoUkVO?=
 =?utf-8?B?Y0tuNUVuN2xFS0l0VWR6UE82YmhlNEFKWG16cDFIWDlQUE1VYXF5WnIrMHVr?=
 =?utf-8?B?SUVLTGlOMUFYZ09ZRWk3dFoyZlRLeG4zSEJQdUg2RDEwZ3hHbUZBVFlIeVc1?=
 =?utf-8?B?K0xMTEoxanE5SUhHa2pqU3p0cGhWNzlCTWxOQlhHOXFROW1jVGIwUzY2Mlh6?=
 =?utf-8?B?R3FZd2N2M3lwa1lsM0pZOUgrcVdNREFnMVNRZElNSDFOdXZraFdieWRsRVQw?=
 =?utf-8?B?Z0haTDJrVW52UkI2dWY4N3QreklpcE9jemNzN054VzNzWHdNcVFxMUZUbHdO?=
 =?utf-8?B?VUtjeldwd21mV2d0Z2IxQ2lnRmc1MVNhQ1R1OXU0STR0T2xnVTM4Ym92amZL?=
 =?utf-8?B?dnhDdE81b1RxbUxqWjU2bFJEY2dsSUcwZ25NT2xRNlZZTEVTdXE1Ly9WdkRO?=
 =?utf-8?B?K2dGWElESmUxdVlneTZiWHkvRXBnTHdEWXdSenBaSXRkZmREdldKL0U0c0w3?=
 =?utf-8?B?eTlBVGQ3eFhkck5LTVUzc044RnlTZkpWYlBJR25paWU3QVUzSlNCWEFpb0Uz?=
 =?utf-8?B?MlVvT1lQaGtrQ0VVaHI1c1FzWnFZTkxtS0lIYWIyMW5EQml2VHRqR242VFE5?=
 =?utf-8?B?dFFPZWtLb0M3TFdxZ0JSYjMyZGc1Vi8rWjkwOEVQa1padnp3cWpQVzh0TVl2?=
 =?utf-8?B?Q0N5c1MvYUhPMzBKWFdMNUhPei8xMDRubS82RGlYbE03VElHYXM1MXdOQklW?=
 =?utf-8?B?clJDalhURHFiN2lkakRnc2RMMW96V3NUQjhIdXdleVVxZjB1ckhJcFp4OEFo?=
 =?utf-8?B?blAzdkRKUGVJQ0FaZGZEbjRGZ01FOTRSZDJudEQ2WG9XeXBrVlVlRklINm1t?=
 =?utf-8?B?K1p4VVlIMjhzMWREYTNOQldqc2k5SmlsLytWMWNTbUZTeDZrNzZEZldaSHpY?=
 =?utf-8?B?OGdiN1p6YWVzSUFkcTY2RVM5bUFublJrUXJPUDZzaUlMcVlFUDdFemVCZlJw?=
 =?utf-8?B?N1AzY1JlSm50TmkrUlllalZnTlQwTTNPalhidmlKeFdtSjVLSnFCM3p5cGM3?=
 =?utf-8?B?TnJzaXFMYkdiTFdmdHl0ZHNrL0ZzbDJiYlpoaU1YaHJsQzhkZmdnK3gxYkFD?=
 =?utf-8?B?OWhQK0lWWXgydTJ3Wm1lMkpZMEk3OGFCNmJyekxzSnBscTBQbkdaUEpQTUgx?=
 =?utf-8?B?UnpWdXF2bXJVVUlBRGI5UlhkSkQ3VEx4VTlCeUg1cDNTb0RaUVBTRytSbURv?=
 =?utf-8?B?NFBOMVIyaGNKSXJtS3FuWmJWUWF0aytFV1hObE53bG1JRU5kc09PNEFpaXMx?=
 =?utf-8?B?TWdFeWtJUzZUUVNrc3ZsSzhZYWNnS3BlSmlna1JZc0dyNGp5TjZ0NThEV1Fl?=
 =?utf-8?B?cTdpaUU3RCs5WEltM2Q5ai9GaktKWWVha2xscVRTWlFCamdjbFpyUXZsbk03?=
 =?utf-8?B?WHVqR1pCc1laNFBPOCtIemJPZVRIczJoc3QvekIwaUo1VFV4Qy92bVRpaDBv?=
 =?utf-8?B?R1VGbVBwWTEvakh0UHVZR3dsM2NSQlBPOHY4UStXK1UrNXFja29EWkw1ZVpx?=
 =?utf-8?B?YlhLUUJhMjM2Q2VkWS9jOVJKTU81c0JIa2tFbVZqNHIrbXlWaktvcWRqRlpl?=
 =?utf-8?B?ZWE5c3NleWtueCtnaHd6YXRMN1NueE43RC85TWZzT1M0aXNnSW9zWGo5dllx?=
 =?utf-8?B?TU5JWk1ObHk4M3dOWVRJWG9yNnZDNDRXZ2dQMW5vdzhYY2h1eko0Nk10WjRt?=
 =?utf-8?B?VmU4VUlvcjNkeHlDYlZ6c0dRUENTWHp4K2ZIQ3AveS8yT3d5dVJUYS9uSFRF?=
 =?utf-8?B?V3JYemd3WDE4Q2NBUFVLRGRhQmNWTjVndk4zeVpJS0p2cC9LQ2xxa3B1OGJD?=
 =?utf-8?B?c3cydFFibmdFNXlpWjVtK3hSTld5YURVUndaaDNYcjN6VzZpL1FQV2FnL1oz?=
 =?utf-8?Q?9ToPVdnJCP0n8r96wKfylfusyWUTUbWXbI+mMTrK/FEbi?=
x-ms-exchange-antispam-messagedata-1: z4Bm7Ywsa9imeyfJj4I+SdYl9LAJPiHIa8k=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25FE81A9118C574F8C7B7346363B9F4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: txl5ZPvbQEox0AIog9KRtKo5VMt/8CU66kZ89pmwImIcnVxX8osrAFFyLOtORuW9byR3Ee1b702DEUoFLCYgbXEzIIxfl9+Au2qJJQBGuMp+ZUJFo3Pshn6WTMkyewxdvb4clfq3O7BVHkUXMZT1XbkqGZX+F0Lma+91qDogXgQByltI4B4thf5Likoqe8eUwvXPbUpLmV537MEkYPMJbHHx+3iW+rQQyoJS7WEjSOHBESGRq+/Hs7UgjHgA+Qmv/uWw3a1wKnwSj+ZCa64J7AeH9GSsUXibMjAbqB7SGkNvKxhzWGzhtN54osbHtP8TxFsqTTnprsnveU9LP1YeBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62037b7d-d775-45bd-258e-08de84186ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 11:29:18.9923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvPaKGQ3pGczLXvDwgK+94toWKJmj1wEHZICLwIxbQupbfTm27NbGFJcZf3YD2cWrjUECAdMQbOfFQTwmY8t0P9u2AWxBVi/eu4g/NaXHWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDE0OjA2ICswNTMwLCBKZWV2YW4gQiB3cm90ZToNCj4gUmVw
bGFjZSBOVUxMIHdpdGggZGF0YS0+b3V0cHV0IGluIFBTUiBmdW5jdGlvbiBjYWxscyBhbmQgdXBk
YXRlIHRoZQ0KPiBsb2cgdG8gaW5jbHVkZSB0aGUgb3V0cHV0IG5hbWUgd2hlbiBQU1IgaXMgbm90
IHN1cHBvcnRlZC4NCg0KTWF5YmUgeW91IGNvdWxkIGRlc2NyaWJlIGEgYml0IG1vcmUgd2h5IHlv
dSB3YW50IHRvIGRvIHRoZXNlIGNoYW5nZXMuDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQo+IA0K
PiB2MjogUmVwbGFjZSBOVUxMIHdpdGggZGF0YS0+b3V0cHV0IGluIGFsbCBQU1IgaGVscGVycy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQo+IC0t
LQ0KPiDCoHRlc3RzL2ludGVsL2ttc19kaXJ0eWZiLmMgfCAxMiArKysrKystLS0tLS0NCj4gwqAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19kaXJ0eWZiLmMgYi90ZXN0cy9pbnRlbC9rbXNfZGly
dHlmYi5jDQo+IGluZGV4IGI4NWUwOTM0Ni4uYjVkZTYzMzUwIDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9pbnRlbC9rbXNfZGlydHlmYi5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19kaXJ0eWZiLmMN
Cj4gQEAgLTEyMCw4ICsxMjAsOCBAQCBzdGF0aWMgYm9vbCBjaGVja19zdXBwb3J0KGRhdGFfdCAq
ZGF0YSkNCj4gwqAJCQlyZXR1cm4gZmFsc2U7DQo+IMKgCQl9DQo+IMKgCQlpZiAoIXBzcl9zaW5r
X3N1cHBvcnQoZGF0YS0+ZHJtX2ZkLCBkYXRhLQ0KPiA+ZGVidWdmc19mZCwNCj4gLQkJCQnCoMKg
wqDCoMKgIFBTUl9NT0RFXzEsIE5VTEwpKSB7DQo+IC0JCQlpZ3RfaW5mbygiT3V0cHV0IGRvZXNu
J3Qgc3VwcG9ydCBQU1JcbiIpOw0KPiArCQkJCcKgwqDCoMKgwqAgUFNSX01PREVfMSwgZGF0YS0+
b3V0cHV0KSkgew0KPiArCQkJaWd0X2luZm8oIk91dHB1dCAlcyBkb2Vzbid0IHN1cHBvcnQgUFNS
XG4iLA0KPiBpZ3Rfb3V0cHV0X25hbWUoZGF0YS0+b3V0cHV0KSk7DQo+IMKgCQkJcmV0dXJuIGZh
bHNlOw0KPiDCoAkJfQ0KPiDCoAkJcmV0dXJuIHRydWU7DQo+IEBAIC0xNTAsNyArMTUwLDcgQEAg
c3RhdGljIHZvaWQgZW5hYmxlX2ZlYXR1cmUoZGF0YV90ICpkYXRhKQ0KPiDCoAkJaW50ZWxfZmJj
X2VuYWJsZSgmZGF0YS0+ZGlzcGxheSk7DQo+IMKgCQlicmVhazsNCj4gwqAJY2FzZSBGRUFUVVJF
X1BTUjoNCj4gLQkJcHNyX2VuYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsDQo+
IFBTUl9NT0RFXzEsIE5VTEwpOw0KPiArCQlwc3JfZW5hYmxlKGRhdGEtPmRybV9mZCwgZGF0YS0+
ZGVidWdmc19mZCwNCj4gUFNSX01PREVfMSwgZGF0YS0+b3V0cHV0KTsNCj4gwqAJCWJyZWFrOw0K
PiDCoAljYXNlIEZFQVRVUkVfRFJSUzoNCj4gwqAJCWludGVsX2RycnNfZW5hYmxlKGRhdGEtPmNy
dGMpOw0KPiBAQCAtMTczLDcgKzE3Myw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX2ZlYXR1cmVfZW5h
YmxlZChkYXRhX3QgKmRhdGEpDQo+IMKgCQlicmVhazsNCj4gwqAJY2FzZSBGRUFUVVJFX1BTUjoN
Cj4gwqAJCWlndF9yZXF1aXJlKCFwc3JfZGlzYWJsZWRfY2hlY2soZGF0YS0+ZGVidWdmc19mZCkp
Ow0KPiAtCQlpZ3RfYXNzZXJ0X2YocHNyX3dhaXRfZW50cnkoZGF0YS0+ZGVidWdmc19mZCwNCj4g
UFNSX01PREVfMSwgTlVMTCksDQo+ICsJCWlndF9hc3NlcnRfZihwc3Jfd2FpdF9lbnRyeShkYXRh
LT5kZWJ1Z2ZzX2ZkLA0KPiBQU1JfTU9ERV8xLCBkYXRhLT5vdXRwdXQpLA0KPiDCoAkJCcKgwqDC
oMKgICJQU1Igc3RpbGwgZGlzYWJsZWRcbiIpOw0KPiDCoAkJYnJlYWs7DQo+IMKgCWNhc2UgRkVB
VFVSRV9EUlJTOg0KPiBAQCAtMjE3LDggKzIxNyw4IEBAIHN0YXRpYyB2b2lkIGRpc2FibGVfZmVh
dHVyZXMoZGF0YV90ICpkYXRhKQ0KPiDCoHsNCj4gwqAJaW50ZWxfZmJjX2Rpc2FibGUoJmRhdGEt
PmRpc3BsYXkpOw0KPiDCoA0KPiAtCWlmIChwc3Jfc2lua19zdXBwb3J0KGRhdGEtPmRybV9mZCwg
ZGF0YS0+ZGVidWdmc19mZCwNCj4gUFNSX01PREVfMSwgTlVMTCkpDQo+IC0JCXBzcl9kaXNhYmxl
KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwgTlVMTCk7DQo+ICsJaWYgKHBzcl9zaW5r
X3N1cHBvcnQoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiBQU1JfTU9ERV8xLCBk
YXRhLT5vdXRwdXQpKQ0KPiArCQlwc3JfZGlzYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVn
ZnNfZmQsIGRhdGEtDQo+ID5vdXRwdXQpOw0KPiDCoA0KPiDCoAlpbnRlbF9kcnJzX2Rpc2FibGUo
ZGF0YS0+Y3J0Yyk7DQo+IMKgfQ0KDQo=
