Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE55CA6015
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 22:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60AF10E963;
	Thu,  8 Oct 2026 22:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmKDxZ4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E45610E963
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 22:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791499798; x=1823035798;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ITjgpjpfJtLcuWV8wnmqTjgp/Bex+ZCcoGv5D4PRReQ=;
 b=QmKDxZ4GtGqg1gARD6dM7whRxXYPg0IptGnQtLYo72ff1EOKu6CMOGw5
 rqjOgOiq9BazNDzXL7U+UJNAABi58nLecAKiuZQfaHO5gjq+fbc91Vjn7
 iGNcvX0AmNBTf5SHXHqC+zjm0wkADlfkbBkWXyGo7lX3qkhaR+mml/Kw2
 hJoBY6OW4PWHFNI2EY84KCu31dKzBe9s2ZgTodOPC47psmLywl1Iojd4u
 QYblBt35XessBS/XHb8gqmCpOQxL9Fv1J0dHZoM3XDXQczjAB873tJC76
 UUS5kyM4ovq8jmoWxObuU1Vn8LxPZkrg/HSclqsJnc1kINWPa7Wzpzrnz Q==;
X-CSE-ConnectionGUID: sAfrvqyARYyMPyLMaVRstw==
X-CSE-MsgGUID: sn1b6ssKTfuOplV8HQ5mig==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="392492"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="392492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:49:57 -0700
X-CSE-ConnectionGUID: cFd8TY2dTzKPs1vp53VFDg==
X-CSE-MsgGUID: s3k9CNapQVugVngFBXnQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="491590"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 15:49:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:49:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 15:49:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 15:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXKAKmynq6tjaFkswHkPTrJ9Ww39IJREen5uQgcbTJmH08IzG96UqovNF18ftuT4nz7Cggf+rtnMBF+BCEoZrHHstU0rfOn72u6DaefonhJViLlSYwX1q86c0oLjgpoiXD61MrPmtY1upqgOI9htTjgUYNaxeNEDYQ1w7lZh0BqkvcLbWGdM2LZy4PLj0aKUEpmXemR+QfOcWyj95ath+VsfzjhIdFkEPyJZZhzgJVpoP0J1Y3CClA7btEq84aPPhkFE33efaG6jyjTjrVAjCtKEuTVoRD8Pee/VbmBnhMzNfz/ETwmlBXWK7p3ZMT8yTthdtQOEeayE3xy5CZnLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITjgpjpfJtLcuWV8wnmqTjgp/Bex+ZCcoGv5D4PRReQ=;
 b=hfVBWj1dR1ljaMJsAXMV7g8f7WJfCnyA9ugWxSrr9rFlm2v6GcAjAcWsUZkGJ9Jd9iIhxej4nRrUJLSMAwkNeth0RqELDkBzNOMrpaMpiP75MXxkKuThLiDepMjhmrJJPFTAaGEgVB5ZBI9AkphF2kMDNLKsGpkIRyAe90yzQmtT/RSJoONuSg/meBN7ACxzIrjAJr0DDHzKBrlt2iVhqxgxaStVdTLwhHCnnQ/wDSXfk62oLUi0HVLGDkZfTNnb4KsrE7rEqSo8DWPIiEblknR/FIrCAfw1u29C085trbfGiqWlDK61eFF2E7Sby/wFrsUd+jbu7UHDKFOe7/g+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS4PR11MB088116.namprd11.prod.outlook.com (2603:10b6:8:507::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:49:49 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 22:49:49 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH 2/4] tests/intel/xe_wedged: Fix wedged dmesg ignore regex
Thread-Topic: [PATCH 2/4] tests/intel/xe_wedged: Fix wedged dmesg ignore regex
Thread-Index: AQHdVp/CXm+YVgR3VU6b6aF5heexqLbztsKAgACCi5A=
Date: Thu, 8 Oct 2026 22:49:49 +0000
Message-ID: <DM4PR11MB5456E11569B1E467053B5D47EA932@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-3-shuicheng.lin@intel.com>
 <20261008143337.b334ysrpgrynmn55@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20261008143337.b334ysrpgrynmn55@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS4PR11MB088116:EE_
x-ms-office365-filtering-correlation-id: b02ec45f-16c5-4631-79de-08df258e7532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: XMZ7VqxRFeHuIjB7+jVVLVdqNCTjlVn3g/icra48i0mdK6liYKXDxuOHXYP/mV4hsTroo8qz9J2gAZHWm/xlQ3KYW1npcd9bSWjQ9s0/gZw1Z7RIWqYhur4yOqHPkGlqLvxXk9mqDpHGSlZPpFVU0V84gxmxsdGUCPm/06ow8CL558YjmPbAidHYE+jksYXYdGWx/8EF/QhhuW+mz0TY38i0mqugG9wb6OHMQ9Qkdh5qSqsy7myDcGYBtPXJZMJ6vG8eIedAxXIMaRi/ZlO/d+Yulr70kX2RzL2IySRIPpfWb9jcU2dmriFaQebhPW1mbRiYol0heUuF9+72mlHYKmFwMiGUIE6gSAIqfehSujr4/YPyhMePQVX2VstjgbSTHzU3PRY8v1ENtv6PVwZB1UNsncE0KFL0JHaRf/jnO2UKj+b6tEclYJJCrH0Qrf3npJtfjmHgMhRMM8XDdqiR5xPx1BE7rDK52N2D8fiHFHMf31tkpHcP91kgIyzjmSwz0NFLxOndBdXIeHCLGl5h9Ivi/+h0Hpu/ofCTgsv5q2RBWRZZRHJu8UUhpoaOf1IvrQWx7YTChA/KuUZbCqyJmcQy7llUZspCKbTF0mY9Z0Uf8ZMVcYRV7gFTU9Wd6PrzRWBWlmX6nhtAU7Q4tOISjc+BfDBb7J75PCZr4WdYz8QlNKR6Fk2PampobqoeL55+k9NRh9OJ3UMNqgbDzD9hEGxqadsALr1ko1PZYNfWZI4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUxxT3lFVUd3cDlqSjNZTlROZUJsVGxPMWwvR1NmVXh1OEhBUEJ4eldhNUZT?=
 =?utf-8?B?UWJzSXRoVGw3bEl1SEZ0MGUyQ0UxcjUrN0RvbG80M2NhellFOUp6a3hxcUdn?=
 =?utf-8?B?TUh4d053NDBEZXUwRGoxTFVSSm1tT3p5WEZ2Qk5QcnowNEJianlSNk8wN0RM?=
 =?utf-8?B?QTE4RW9ra0k4THpsRVpJUHI3YTVla2RZYmlPeXV3aFBwenE4NWplRisyMDkr?=
 =?utf-8?B?UDVnK3UrdERQMERWMS9NWUc3RWc5NkdmUTlsdmhYbmVxcG9KOU9CWGFsOGsz?=
 =?utf-8?B?bUkvWUdQVjQxY2JUUlFLTHlLVTRubW9kcUpVRGFLMUtwa0V0MkNWYWdrL1g0?=
 =?utf-8?B?OHBGU3ZHK3NoN0VTZjBoVU1BL1BiZ2hWVzlHVHZmL0U2ZXVYUm9XTnNqZ2JZ?=
 =?utf-8?B?dlR1MUxPbzFIaVQrdnR3c1hPblJJZGFCWWlEQ2tIU1BnTnBqQ0FGblRWbXpz?=
 =?utf-8?B?MnpGRUZoOHpGZjFvT2wxMUIzWHJBZlRYSVMxeGNUeDRmTGJXY2NubmMwTDJm?=
 =?utf-8?B?cjBvdURHblIrR3RxNEVqWUs1MFZ5Y1o4QUVVSjAzaFY1R2w3OWVvZ0dOTW1Z?=
 =?utf-8?B?Rks0REo0MHhibisxNjgxZHI5VVU4aFozT3cwOW9VMGI2YmoxamkrQk9wclMx?=
 =?utf-8?B?REdJRlJhdnN4VElwRWQ3NXBCVEozNGNaUFJDTjFBQkVNclpabkdpTEEzeStQ?=
 =?utf-8?B?YXhqczBnenhST21GeWZ2MnprOFdIQTJRK3AzRzdQR0Z4WXJHeGdnVEU4Qlhw?=
 =?utf-8?B?OWREZ01VbG1JbnlRYmtYWVpIci9vTzJTbU9pbUdZY1Z6c2JGQ29OcXhPYitW?=
 =?utf-8?B?K3paTU9TYUJtaE1RcjdkVDFBRGc1SGpKQnNKOS9QMlhQa0NFV3ZIQnQ1a2x1?=
 =?utf-8?B?ajJueW5tUmVDTm1sc3J6WjVqT0hsbmhNTFZkOEFqcXVMaEZXcGR3ejZwQ3dN?=
 =?utf-8?B?MkhQbjdlckI0alJjSGY0T083dUtnc0J6Z3BjdWE1OXptS291V011Q1JpVHp4?=
 =?utf-8?B?eThqdnlDeEZ0bHVaUGxuZ0JPK1RTbkJnYTZhMnJNZlRCVGROTHZxWHlmc2s1?=
 =?utf-8?B?SFlzUVNpYTBWTDhxT3RsTXJJakhwaHZEaCtxaDhFY1NUL3IvTFpHOTJtTFpH?=
 =?utf-8?B?VmREb0tZaTVBNHJ5Smg1Rk9tS1FVQ05keGxtV3haZUFsRXZRbUNEcEJxbjla?=
 =?utf-8?B?S1dXVzNtellOak4yUmwvR2Z3YXVQVUthdElUdUszeUE3T1l1MEFaSWszSVBP?=
 =?utf-8?B?TmxKZGgya2ZCQjVyS3BjWFV5emtFTFhsQmNkbkRnUlBRMG1UYXViZm1ZZ0ZE?=
 =?utf-8?B?bVp1dFhicS9nZ1FXM2daYmdwZlR3SHZ0cmRJcUxCYlhQbURQV0JCSWlCb2Ir?=
 =?utf-8?B?dW1CODBGRWlmZjEvWkowMmYzUHNhZmVaZEtId09WSWNzc2g4L3lWeEtOZ3hL?=
 =?utf-8?B?TVF6N0pLd1VjMHYxb2J0TUFkR1N5WGtWM0RRSmVNSW5obDc2ZWczcmgzOExw?=
 =?utf-8?B?cDBlZzVUVXRLU29jNVptbnRpWm1NdGFncWhFck14cEh5N3QwWk9hdm44cjR3?=
 =?utf-8?B?dDB5VklVRVFyQW45TXhZOWQyNzU4Y1JNR2xwcXVidjJPT0xnRGpRWUtDZkU4?=
 =?utf-8?B?emF4VWU1Y0hHdURzaGthSHhKKy8wditnbGVwVTlXa1cyNWQxQkx2SU9QZTNG?=
 =?utf-8?B?RFlxZGd4anVDUmtoQ0F6ZFNSeU1uYkxJTXBSSHFpWWZpS3JzZ3c1cWtUYWFq?=
 =?utf-8?B?YUlocnVHL1JIV0Y1U3hVUHVWdTdYeWpjWlZZRDBzdlMyemNvMmJ6N1NZRm9X?=
 =?utf-8?B?R2h3eVFTS1hyMkJ4eFJ3R3JpeldKS0NwK2szS2wzMm1uMXBSR3pCb2xqMjlL?=
 =?utf-8?B?M29iWmhEL0hJbkpNKytVc0hEWlpoR1BmazRJdFJDNE5EQVFzbDhqeWVmRDhL?=
 =?utf-8?B?cGJqL3JhMy94L2NxQm1OYXVZWlpkUkRyTFJrQVFEaGh5eHhKRThJRVVoRFZG?=
 =?utf-8?B?WlB3VlFMdlJtWFZsZVRUdUJDN2hTbnpZQWRlS1VCNTdSWUh1UmpRUlhET21o?=
 =?utf-8?B?RjlqYnFncURwOVVVN0pTWDBvSllKdlBRTHdNUTBPaHhCZVRXUmZ0MGZNS1J4?=
 =?utf-8?B?WE42c1hGU0Jhclpqdmt3YU1SRHRjbi9vbVEyUFV2YXZWaDVsZTAwK05hRlZ1?=
 =?utf-8?B?Z2xXNEVQWGhqOHdrOXVYR0VVN0dpTG1CWklMaG45aDJIQk9acVJNRFVhR3o5?=
 =?utf-8?B?WkZ3TTNGQXN6dFVFMjV6UVBlZDJDdXJ2aEo5UWdiYjRKZnAvaTUvSUpLbWFM?=
 =?utf-8?B?NmZ1dDFmQjZXSWVvaVZWT0lSTlJhNkFKOEJrVXpnbXpWYU80cWNQUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pjdfqyXBHtBfg4htZmMnJrVBY/ubIhj0CQsqwj9WLLMn7Ma6safUSeAUUto9lVgilqrdFLXroiiWyv56Nrn7AfcFJ7ips3gdA9LGFxdtzq4d6f1Rsh8gdRAu4AUgH4zjjbEX6v5QJNglbtSbaC9eMvqUOxURrZUXhDAGuipjtw3j11OmI8XAG7rHMMXvGeTKtwVJf7wHoy2Idhi8M45PvbUad4bIJewL7Gc1XeaOam6nNaC/OOAdK9JRHuu0xTsi2OsXNWN2s8yAw3DP5DP+jfvhumVE/86CNGZK1b3MB4LPfACuPG2WQ8Heec/ukGJroBTL1L7ag3qHCGQ9bRO+hQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02ec45f-16c5-4631-79de-08df258e7532
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:49:49.1605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXE8HnPhNpR/W8IEFebPvq11p52rze1Y/kd34FK8Zu6qQbd0vjWCEu7Iq+rJbjCxtcIOQnEn1ts4pLDamvI6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB088116
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

SGkgS2FtaWwsDQpPbiBUaHUsIE9jdCA4LCAyMDI2IDc6MzQgQU0gS2FtaWwgS29uaWVjem55IHdy
b3RlOg0KPiBIaSBTaHVpY2hlbmcsDQo+IE9uIDIwMjYtMTAtMDcgYXQgMjE6MDY6MDEgKzAwMDAs
IFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gVGhlIGtlcm5lbCBub3cgcmVwb3J0cyB0aGUgZmFp
bGVkIEdUIHJlc2V0IGFuZCB0aGUgZGV2aWNlIHdlZGdlDQo+ID4gdGhyb3VnaCBTSUdJRC1iYXNl
ZCBsb2dnaW5nOg0KPiA+DQo+ID4gICBTSUdJRD0xMDYgRkFUQUwgKC1FQ0FOQ0VMRUQpIFRpbGUw
OiBHVDA6IEdUOiByZXNldCBmYWlsZWQNCj4gPiAgIFNJR0lEPTEwMiBGQVRBTCAoLUVJTykgV0VE
R0VEOiBEZXZpY2UgZGVjbGFyZWQgd2VkZ2VkIQ0KPiA+DQo+ID4gd2hpY2ggdGhlIGV4aXN0aW5n
ICJyZXNldCBmYWlsZWQgLi1FQ0FOQ0VMRUQiIGFuZCAiZGVjbGFyZWQgZGV2aWNlIC4uLg0KPiA+
IGFzIHdlZGdlZCIgcGF0dGVybnMgbm8gbG9uZ2VyIG1hdGNoLCBzbyB0aGVzZSBleHBlY3RlZCBl
cnJvcnMgYXJlDQo+ID4gcmVwb3J0ZWQgYXMgZG1lc2ctd2Fybi4gQWRkIHBhdHRlcm5zIGZvciB0
aGUgbmV3IG1lc3NhZ2VzLg0KPiA+DQo+ID4gQWxzbyBmaXggdGhlIENBVCBlcnJvciBwYXR0ZXJu
LiBpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVnZXgoKSBwYXNzZXMNCj4gPiB0aGUNCj4gDQo+IFBs
ZWFzZSBnaXZlIG9uZSBvciBmZXcgZXhhbXBsZXMgb2Ygc3VjaCBDQVQgZXJyb3JzLg0KDQpTdXJl
LCBJIHdpbGwgYWRkIGl0IGluIHYyLg0KDQo+IA0KPiA+IHJlZ2V4IHRvIGlndF9ydW5uZXIgdGhy
b3VnaCAvZGV2L2ttc2csIHdoaWNoIGVzY2FwZXMgJ1wnIGFzICJceDVjIiwgc28NCj4gPiAiXFsi
IG5vIGxvbmdlciBtYXRjaGVzIGEgbGl0ZXJhbCAnWycuIFRoZSBwYXR0ZXJuIGFsc28gbGFja2Vk
IHRoZQ0KPiA+IHNwYWNlIGJlZm9yZSAiY2xhc3M9Ii4gVXNlIGJyYWNrZXQgZXhwcmVzc2lvbnMg
YW5kIGFkZCB0aGUgbWlzc2luZyBzcGFjZS4NCj4gDQo+IFlvdSBkaWRuJ3QgdG91Y2ggcmVnZXgg
bGluZSB3aXRoICdjbGFzcyc/DQoNClRoZSBzcGFjZSB3YXMgYWRkZWQgYXQgdGhlIGVuZCBvZiB0
aGUgcHJldmlvdXMgbGluZSwgd2hpY2ggaXMNCmNvbmNhdGVuYXRlZCB3aXRoIHRoZSAiY2xhc3M9
IiBsaW5lLCBzbyB0aGF0IGxpbmUgaXRzZWxmIGRpZG4ndCBjaGFuZ2UuDQpXaXRoIHlvdXIgc3Vn
Z2VzdGlvbiBiZWxvdyB0aGUgImNsYXNzPSIgcGFydCBnb2VzIGF3YXkgYW55d2F5Lg0KDQo+IA0K
PiA+DQo+ID4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVs
LmNvbT4NCj4gPiBDYzogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX3dlZGdlZC5jIHwgNiArKysrKy0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3dlZGdlZC5jIGIvdGVzdHMvaW50ZWwveGVfd2Vk
Z2VkLmMgaW5kZXgNCj4gPiA4YzNjOGJkMzYuLjBjZDg4NDQ1MCAxMDA2NDQNCj4gPiAtLS0gYS90
ZXN0cy9pbnRlbC94ZV93ZWRnZWQuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3dlZGdlZC5j
DQo+ID4gQEAgLTQxLDYgKzQxLDEwIEBAIHN0YXRpYyB2b2lkIGlnbm9yZV93ZWRnZWRfaW5fZG1l
c2codm9pZCkNCj4gPiAgCQkJCSAgICAifEdUWzAtOUEtRmEtZl0qOiBGYWlsZWQgdG8gc3VibWl0
Ig0KPiA+ICAJCQkJICAgICJ8TW9kdWxlcyBsaW5rZWQgaW46Ig0KPiA+ICAJCQkJICAgICJ8X19w
ZnhfX19kcm1fIg0KPiA+ICsJCQkJICAgIC8qIFNJR0lELWJhc2VkIGxvZ2dpbmcgKG5ld2VyIGtl
cm5lbHMpICovDQo+ID4gKwkJCQkgICAgInxbKF0tRUNBTkNFTEVEWyldIC4qIEdUOiByZXNldCBm
YWlsZWQiDQo+ID4gKwkJCQkgICAgInxbKF0tRUlPWyldIFdFREdFRDogRGV2aWNlIGRlY2xhcmVk
DQo+IHdlZGdlZCINCj4gDQo+IENhbiB5b3Ugc2ltcGxpZnkgdGhpcyBpbnRvOg0KPiAJCQkJICAg
ICJ8LUVDQU5DRUxFRC4qIEdUOiByZXNldCBmYWlsZWQiDQo+IAkJCQkgICAgInwtRUlPLiBXRURH
RUQ6IERldmljZSBkZWNsYXJlZCB3ZWRnZWQiDQoNClllcywgd2lsbCBkbyBpbiB2Mi4NCg0KPiAN
Cj4gPiArCQkJCSAgICAifElPQ1RMcyBhbmQgZXhlY3V0aW9ucyBhcmUgbm93IGJsb2NrZWQiDQo+
ID4gIAkJCQkgICAgInxUaWxlWzAtOV0rOiBHVFswLTlBLUZhLWZdKjokIg0KPiA+ICAJCQkJICAg
ICJ8QVNJRDogWzAtOV0rIg0KPiA+ICAJCQkJICAgICJ8RmF1bHRlZCBBZGRyZXNzOiAweFswLTlB
LUZhLWZdKyINCj4gPiBAQCAtNTAsNyArNTQsNyBAQCBzdGF0aWMgdm9pZCBpZ25vcmVfd2VkZ2Vk
X2luX2RtZXNnKHZvaWQpDQo+ID4gIAkJCQkgICAgInxFbmdpbmVDbGFzczogWzAtOV0rIFthLXpd
KyINCj4gPiAgCQkJCSAgICAifEVuZ2luZUluc3RhbmNlOiBbMC05XSsiDQo+ID4gIAkJCQkgICAg
InxUaWxlWzAtOV0rOiBHVFswLTlBLUZhLWZdKjogRmF1bHQNCj4gcmVzcG9uc2U6IFVuc3VjY2Vz
c2Z1bCAtRUlOVkFMIg0KPiA+IC0JCQkJICAgICJ8VGlsZVswLTldKzogR1RbMC05QS1GYS1mXSo6
IEVuZ2luZQ0KPiBtZW1vcnkgQ0FUIGVycm9yIFxcW1swLTldK1xcXToiDQo+ID4gKwkJCQkgICAg
InxUaWxlWzAtOV0rOiBHVFswLTlBLUZhLWZdKjogRW5naW5lDQo+IG1lbW9yeSBDQVQgZXJyb3Ig
W1tdWzAtOV0rW11dOiAiDQo+IA0KPiBUaGlzIGFsc28gbG9va3MgY29tcGxpY2F0ZWQsIHdoYXQg
YWJvdXQ6DQo+IA0KPiAJCQkJICAgICJ8VGlsZVswLTldKzogR1RbMC05QS1GYS1mXSo6IEVuZ2lu
ZQ0KPiBtZW1vcnkgQ0FUIGVycm9yIC5bMC05XSsuOiAiDQo+IA0KPiBvciBkcm9wIGRpZ2l0cyBm
cm9tIGVuZDoNCj4gDQo+IAkJCQkgICAgInxUaWxlWzAtOV0rOiBHVFswLTlBLUZhLWZdKjogRW5n
aW5lDQo+IG1lbW9yeSBDQVQgZXJyb3IiDQoNCkknbGwgdGFrZSB0aGUgc2Vjb25kIG9uZSwgYXMg
aXQgYWxzbyBjb3ZlcnMgdGhlIGZvcm0gd2l0aG91dCB0aGUgIltOXSIgaW5kZXggc2hvd24gYWJv
dmUuDQoNCkJUVywgYm90aCBmb3JtcyBhcmUgbG9nZ2VkIGF0IGluZm8gbGV2ZWwsIHNvIHRoaXMg
cGF0dGVybiBkb2Vzbid0IGNoYW5nZSB0aGUgdGVzdCByZXN1bHQgdG9kYXkuDQpNYXliZSB3ZSBj
b3VsZCBkcm9wIHRoZW0gYWxzby4NCg0KVGhhbmtzLA0KU2h1aWNoZW5nDQoNCj4gDQo+IA0KPiBS
ZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiAgCQkJCSAgICAiY2xhc3M9W2Etel0rLCBsb2dpY2Fs
X21hc2s6IDB4WzAtOUEtRmEtZl0rLA0KPiBndWNfaWQ9WzAtOV0rIik7DQo+ID4gfQ0KPiA+DQo+
ID4gLS0NCj4gPiAyLjQzLjANCj4gPg0K
