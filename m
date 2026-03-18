Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF27E10854DB
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6C10E782;
	Wed, 18 Mar 2026 09:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFhg+ktr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAB110E782
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773826110; x=1805362110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F6hxSM9eN6w955JakVJ8zkDdiOoCzXtW1pzHvSKi+ks=;
 b=NFhg+ktrA0EatS6sJR3fc0AjEPbERWoB3BMTdICFPK0S7tyK3uC6GX6n
 RActxjy7YgDkEp3VDl3gbMHroVWYSE/ZUTEN9zc0iAZAtZgYJG0w/4lUO
 mHxk8YvkB7EuOrFBN8+gASx783gYYqP7/xzYctBBNf+gm5CqsWQrmLA2X
 fDlhWcOpLfsVfnweWnKarQFOWICS+X62w74FaxljPIuptfbwoW6HzibKI
 T6kqO29LN3F9fg3JvUZpysVNK/G2HmwyZiky9RR2Vt1tXwt6tie7hy08U
 RMq4XtzA/nXNQrjfxeeB1/i2KZyGJKCoCk3u2A68kPg8oc+yE400a1rQ7 Q==;
X-CSE-ConnectionGUID: xatlq2VnSOiR1BnbWzw7DA==
X-CSE-MsgGUID: mVLUXCSkQoCAlJlLkzdwjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85954073"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85954073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:28:30 -0700
X-CSE-ConnectionGUID: B5DuxunXRZC0BdWth22Ebw==
X-CSE-MsgGUID: czfhxK5SSYaCIqXkx+Og/Q==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:28:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 02:28:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 02:28:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 02:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp/DhfocC+FkIIRzY+em1slpVmsHQV4NFeA4RL+9aVvADszA8agj6QghKCUyKBCiZ8u4WfG0YubjTemfRAdFZ6s4oEkS8jUp0x8FuwbZVQoluNx7rXmkzpUq6M0Su9N4FyScPWrX1tqZWmvpRVYAi8fe8yKgHkF8TrwZWXyfMheW/B38aESqKOj/aeRkojUt/oZRi0NzIM3/qiVwZObVBGEPkj86UJ8cj3bC1pleZYMY68iFscz7sI6Cq2O65v/HvvRAECSeM0tIBa4z14kI0HYzztLc1QQO5WvTzC46IVcrbibPFrTzLmsVDe1dVpyiyNB2WQPwyFgX8PGE1KPzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6hxSM9eN6w955JakVJ8zkDdiOoCzXtW1pzHvSKi+ks=;
 b=WDjsoY1wyjrDQ6A5QdzoghQgKBkEdJGV65312WZs1ciSLvcaEAxoU5P/l7ej8HzgxYjgfs2v1lV7fHliDrBOk0O/+2eKGsC24/6khwu9/jdc0D7yqbuJEC4DUyp3gGB9Gt19cy2Otmx0jleeNx+zwZVP9jelZHdnaT5F9b9fxH/ujkVl+gIjYiPhrkZZDMBKV5MINwaR3RyjdTIflgPN1WVi2vYVuvMYDXyIN3XAh2wnKvv2NgoIxV2AqXrz00k2yk5nD5TlmN0juZjxF/cuAtjKf1OJv/3etlwXjnOvELEaR+Bj8qrA1ACGU0pAnJvEdH5QnqKRAeV1ohbh2/ML1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 09:28:20 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 09:28:20 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Thread-Topic: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Thread-Index: AQHctkSe/o7XMh40VUyQFHdq9M+XfrWz8ywAgAAJ2ACAAAmPgA==
Date: Wed, 18 Mar 2026 09:28:20 +0000
Message-ID: <6b4f9517742b08833573ff5e2f86d5eff93a5918.camel@intel.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
 <20260317193058.722290-1-ramanaidu.naladala@intel.com>
 <645964eee31a4df3c4fb1cf844f07e8bd9352424.camel@intel.com>
 <80257ff3-e7de-4c04-bc97-bdd6b51147fd@intel.com>
In-Reply-To: <80257ff3-e7de-4c04-bc97-bdd6b51147fd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS0PR11MB7629:EE_
x-ms-office365-filtering-correlation-id: bbd4435d-1cfd-4a97-fb27-08de84d0b1de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: zsJgt9rPZOgjbuKYGE1Z4RL9nbBwwDWhlhC2RV/YNK9yA5dR6NFEO5ONWSibfkuHXY4Zu8cesCT5/DP1bUcOQCp2+qUUHS0lbr31HnnPtWKNISWsfmcs+XnO1qhQ1QYXmCfcpukmn0JDeekBSt82TRASB9dw50XJuooXK0Va8XLNlBzFdrolNNIEsxVgoR4BYNNZK0sVaQNRgaSM3A7brPOYhRGY4WoTRCs6VDQSPfKpB0gJREC+zagVkf2G6lTm4HWYwLTqRrzf8HFelcRCJZ7De6Q9L0jVVdnqJM3MU5SAgi4TCOc4MZtumdomHAGgd3/7GGfMvRT9yaF/Xxg/x3AHNeonbAvlertjqPzMJW6MyE+T1s+UiBVDR0nwFRkQy0M9aDeiUnkdWzxD4nt5gh+DYvzpIZ1Q4LlcBDZLCZfg0oyrq/ipVOtFiPv5t6cDX/NxcjiWV9k4WuyYeN83azsoLspITw3CvplEBm1dYdgkgMW8KEUu0djL9fY5XzyrglPxOeJOFZ3JukmX7SS5KQaskCTM5E4k8H8xd1mVyoEjMstpAPJvM0DHVVEQBTD46dPFdSXUnafpMuqq0Od91W2fjo3oZhxa2prvSLXke8n/sL9hYEowofxVdN5JyEdf4gHiuhkpX1K3StPkt3t7+JQX3nCox3dIECEjGqfc4X3qApF37e3J1mPGU36bPsoqfZlgrwRZ56qc6uaKP1HXFgozYeruU9QYRbYJQ9qwim/3Iq9XxRNPW6qpTMRxY5Mo2HkNffVZCsfxikKtwK8GlxeFDV4qhRIqxtR49tms7Ug=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVBXZTMyRVEvbzBrVEwxVy9Cd2RzNUdxaW1HQk9RK1A0K2tiL3NySjRMdTVp?=
 =?utf-8?B?aVUybGROdjRLM1lQdVYwSGZvSGM2ajAyUnJDc0RwSVlwYlpBY0VzSmlsVjA0?=
 =?utf-8?B?TjFHZ2NSbVErV3Zycm8vMmErczdDdnVwc0FRMnlxNjl5YXU0YUluRWpoU0RC?=
 =?utf-8?B?eFVFdU12N08vajloVXYzMWFRRTJmUWZsZkRFYVIxMkhleXk1aG9KUkZxcmZ1?=
 =?utf-8?B?QXVJNGFGVDFqbDRJN21CNXdmRnM4V1F3aUtPNzUvTExyVDVtR1N5Mm9ucG8x?=
 =?utf-8?B?VXMxeHhjaENNY1gzcWJTNVFEa3VaRzNPN3EvSWc3Ulo3eGRrVkhWQWltY01j?=
 =?utf-8?B?UnlqdTAxa1dZZmR5U3NBemdjYjdISHRPVWVMeElOM2hCWGwyNzc5Y2ZySnhP?=
 =?utf-8?B?ZkIzbTlYYjJZVUR3Mjl1OTZWSTliSVBsRm1Jdy9OT2QvaFpQelV4YlFtZllo?=
 =?utf-8?B?UVpESVRGTUlZcFdFYi9abFY0VnpIUmFOQnJDVGdpZGFwaHVLczluaWgzMGZF?=
 =?utf-8?B?WXFXZ01UaEhyeUdqSldWQzhiTC9vRkdZVXlPWlhaNC8yN1ZyMEpoZ0NJRmln?=
 =?utf-8?B?WTB3QkJ2WDJpSzUwQXNkazN5MWhGRkxyZHY1TXFQQWJmbE90UVN5L0RISzZK?=
 =?utf-8?B?U2dKYzhmRGdYUUtZMWd0TmNxczdQVGRmMTNHeXo1UXB4M1VzTlVkenoxc3l4?=
 =?utf-8?B?Wm1Vb29nMVJmRlY5UVB4ejlkcGN3ek5EM3ZaSkFYZi9GUkRHM3JjQ2VXcmVM?=
 =?utf-8?B?MElIeEpSZDVzSzFJZ3Q4OHVFRys0WWdwYmdWbHVGZ0p4Wkp6ckVhWmxEWjg5?=
 =?utf-8?B?czM1Q3RLaERWcmNnVDFiZDljaXJFRWhSSHpWV1hPRE9SeDBpeGFvSXpGRDFp?=
 =?utf-8?B?MEcxNWllbks4VEN0NUhadEJneDQvZVZDbG94R2RKYzhkckhTNzVPM3hvVFJ1?=
 =?utf-8?B?cE1ETnQ2dkovd0JscE5CZWNDQytKNkNQRHNzWVd1QUpWWWJrdUpKNklZS0ds?=
 =?utf-8?B?by9CK0N1M0g1aUU2L1NvK1c0QndrKzlFeXArMS9nTzBZMnl5bFY4TTRrd3RG?=
 =?utf-8?B?d3V0Z0pBVGN4MGVoSGJuUXpROGxud1dKSlpiOXdpYlhTZ1FSZi9peDErN0ZW?=
 =?utf-8?B?VCtOWVBIL21BdGNMS04xOHowL2xPY3REVjJwYTRaV0M3aXM2V0JteHNCZm04?=
 =?utf-8?B?QkRobzN4bXVJcVo1MWFZVFNqeXFjR2pRdmoxUkpOck4wWExMUUhMRmR2NGhR?=
 =?utf-8?B?NGVWY2NGdUdLM3ROUW9tR1czSXJlelVkWjUwOGRUQ1BOMVY5MDhHVUY0QWV4?=
 =?utf-8?B?MnhZcmJGTEhENHpCNTA0ZnArWDVjdUxTZnhIMzNRNzMzRUxCczJKbHVSYXZv?=
 =?utf-8?B?RjREeDJja0dKakJaRER6bklnTXZnYVpINDJBYXFDdE9uYmdydnkzcmIrMjVC?=
 =?utf-8?B?anYxMUJTMlhXaHNzR1NGOGpzcXhURWs0Q0ZLRVBmZVpvZSthRWtjTmw3QWha?=
 =?utf-8?B?SVF2WXRzT2hmcjVqOWVzbWRyNE41cjZub0hFeXE5L1RBaFVPQ2x0YzM4Q05w?=
 =?utf-8?B?MEhjS0NTVTIycHY2T1JpNTNKcE1zbTFEaUZKWVVlTnE5b1hlSE5aMmYzQ0ZB?=
 =?utf-8?B?ejVzbzVQZEF6WHV6Q0c1NWVQR1pRZlRhVVdPYTZDN2J6b3J1SVVKeHZVeHA1?=
 =?utf-8?B?YWpVUEkvbE9Obmw2SFI3ZWt2RlhKVlpnVzlqUmQwc3ducDVzTXlLNURvOTJ5?=
 =?utf-8?B?VkFGSTJHTEJqRm9obzkrQnlKdERNVUFoODF5ZzRKYlJnU1Q1alVKZkRSRlJB?=
 =?utf-8?B?MjA5VXgrSjBSenZwSFloOHIvUDU3cUVPMWl0Skh2UTlGdUJ6dnBJUHZwN21s?=
 =?utf-8?B?ZG1nbEQrZUFmUWlTdzVOeVgwbWFZVEtpZWhKK2pLbXVpbXMvMS9CSDVTTmI1?=
 =?utf-8?B?UGI4THlLR0dqeWlaL3czUjgraEtyNkdxTk0yWFJxVVM1NnhxZ1o2a1prWW9P?=
 =?utf-8?B?ZWl3eVkxdmlTRWNIeDhITWs2dldIMkxockk4eEViRW1xTHp0YW1ZOERDaCtO?=
 =?utf-8?B?VjZyamtpMmY1Nno2QUo5VFRqU0FqVFFPZlk3QUh6cS9aQUQrZ216eDlSVGFj?=
 =?utf-8?B?a2VrUUlCR3dlcE9jWXNzbk81OEN3aUtIeHBTcG44L1dhOGx3YmovLzhOTmQw?=
 =?utf-8?B?OTY1eTRraFBXWVVSZm4zV0VveHhmYndGMytYcnJReGJGMGNrbnpkR09LTkR2?=
 =?utf-8?B?aTliUjdjMDEwazBCenZXSGd1b2xyTnpPYTN2ZmRJMzdncUdQdmgrZ1laLzlt?=
 =?utf-8?B?bzZ3S3NzYjJBdFNwWnFXTyt4ZXdDaG5oSUJKYzFWMHJTUXpPbldoNHBzMFE4?=
 =?utf-8?Q?n30TAFUADIruY7j5cXonInGW6RqcbNTCGj6K8LOHK3AY4?=
x-ms-exchange-antispam-messagedata-1: 5dPNF9lDgWLhPvTMIBGFTzxqvegUt0f9LLg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DA931A0F066234395D095D89AA31138@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CWbY3/zVIF2aLrU+6bJLAllA8JKajVQ88cQvoKyw4UyrrUXEbVcrWjJ+mnXy97CD69eiE6e4sPal9/5BJ0MB4SgQEXwCoZN4PaK2pz/L3krQYOxrP+16fW2ZilrKWmQhGCYGz7Hdvs9n3MCOLr2gviUie7EomYzri3vrnXfGUbi2oYzUIaCSleQfiCrjkOgSSLRVj3p33Glz0Kofz2iua8vRVFHI4/iNrNbST3bU/XLctKj3py1LTrMHEwsNYdx6I07nnNdyzZ8U9yw9Q8EXRPJrVAb427f+GUb4RNr2uca21pKIcpO+d58kDPUxRiocHPEGo7CwY61kI2MwG77fvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd4435d-1cfd-4a97-fb27-08de84d0b1de
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 09:28:20.5353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzOr7LoabtZi0g3N2LLoa6ts57Tu39SAJma3I8fequYFEksM+qK4DvnojTwpEhfAuLpRj8TFE0ZJANU38K9FhovwcZYuOGpsmHYlRF/Pcx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDE0OjI0ICswNTMwLCBOYWxhZGFsYSwgUmFtYW5haWR1IHdy
b3RlOg0KPiANCj4gT24gMy8xOC8yMDI2IDE6NDggUE0sIEhvZ2FuZGVyLCBKb3VuaSB3cm90ZToN
Cj4gPiBPbiBXZWQsIDIwMjYtMDMtMTggYXQgMDE6MDAgKzA1MzAsIE5hbGFkYWxhIFJhbWFuYWlk
dSB3cm90ZToNCj4gPiA+IFN3aXRjaCBQU1Igc3RhdHVzIHJlYWRzIHRvIHRoZSBjb25uZWN0b3Li
gJFzcGVjaWZpYyBkZWJ1Z2ZzIHBhdGgNCj4gPiA+IHRvIGF2b2lkIGFtYmlndWl0eSBvbiBkdWFs
IGVEUCBvciBtdWx0aeKAkW91dHB1dCBzeXN0ZW1zLiBUaGlzDQo+ID4gPiBlbnN1cmVzIHRoZSBF
YXJseSBUcmFuc3BvcnQgc3RhdGUgaXMgY2hlY2tlZCBmb3IgdGhlIGNvcnJlY3QNCj4gPiA+IGNv
bm5lY3Rvci4NCj4gPiA+IA0KPiA+ID4gVXBkYXRlIHRoZSBFYXJseSBUcmFuc3BvcnQgZGVidWdm
cyBoYW5kbGluZyBpbiBsaW5lIHdpdGggY2hhbmdlcw0KPiA+ID4gaW50cm9kdWNlZCBpbiBLTUQg
KGNvbW1pdCBjMzkwYmYwNzk2MWIsICJkcm0vaTkxNS9kcDogRml4IHBhbmVsDQo+ID4gPiByZXBs
YXkgd2hlbiBEU0MgaXMgZW5hYmxlZCIpLg0KPiA+ID4gDQo+ID4gPiB2MjogQWRkcmVzc2VkIHJl
dmlldyBjb21tZW50cy4gKGplZXZhbikNCj4gPiA+IA0KPiA+ID4gTGluazoNCj4gPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAxNTE2MTkzNC4yNjIxMDgtOC1pbXJlLmRlYWtA
aW50ZWwuY29tLw0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOYWxhZGFsYSBSYW1hbmFp
ZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgwqBs
aWIvaWd0X3Bzci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgOCArKysrKy0tLQ0KPiA+ID4g
wqDCoGxpYi9pZ3RfcHNyLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstDQo+ID4gPiDC
oMKgdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyB8IDIgKy0NCj4gPiA+IMKgwqAzIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jDQo+ID4gPiBpbmRleCA3ZTUw
YzNkYzYuLjA5YzM0Yzk3ZCAxMDA2NDQNCj4gPiA+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gPiA+
ICsrKyBiL2xpYi9pZ3RfcHNyLmMNCj4gPiA+IEBAIC02OSwxNCArNjksMTYgQEAgc3RhdGljIGJv
b2wgcHNyX2FjdGl2ZV9zaW5rX2NoZWNrKGludA0KPiA+ID4gZGVidWdmc19mZCwNCj4gPiA+IGln
dF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiA+ID4gwqDCoC8qDQo+ID4gPiDCoMKgICogQ2hlY2tzIGlm
IEVhcmx5IFRyYW5zcG9ydCBpcyBlbmFibGVkIGluIFBTUiBzdGF0dXMgYnkNCj4gPiA+IHJlYWRp
bmcgdGhlDQo+ID4gPiBkZWJ1Z2ZzLg0KPiA+ID4gwqDCoCAqLw0KPiA+ID4gLWJvb2wgZWFybHlf
dHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKQ0KPiA+ID4gK2Jvb2wgZWFybHlfdHJhbnNw
b3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gPiA+IMKg
wqB7DQo+ID4gPiDCoMKgCWNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07DQo+ID4gPiArCWNo
YXIgZGVidWdmc19maWxlWzEyOF0gPSB7MH07DQo+ID4gPiDCoCANCj4gPiA+IC0JaWd0X2RlYnVn
ZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwNCj4gPiA+ICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwN
Cj4gPiA+IGJ1ZiwNCj4gPiA+ICsJU0VUX0RFQlVHRlNfUEFUSChvdXRwdXQsIGRlYnVnZnNfZmls
ZSk7DQo+ID4gPiArCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQsIGRlYnVnZnNf
ZmlsZSwgYnVmLA0KPiA+ID4gwqDCoAkJwqAJCXNpemVvZihidWYpKTsNCj4gPiA+IMKgIA0KPiA+
ID4gLQlyZXR1cm4gc3Ryc3RyKGJ1ZiwgImVuYWJsZWQgKEVhcmx5IFRyYW5zcG9ydCkiKTsNCj4g
PiA+ICsJcmV0dXJuIHN0cnN0cihidWYsICJFYXJseSBUcmFuc3BvcnQiKTsNCj4gPiBDaGVja2Vk
IHRoaXMgYW5kIHRvIG1lIGl0IGxvb2tzIGxpa2UgaXQgbWF5IGluZGljYXRlIGltcHJvcGVybHkg
RVQNCj4gPiBiZWluZyBlbmFibGVkLiBUaGlzIGlzIHdoYXQgSSdtIHNlZWluZyBpbiBkZWJ1Z2Zz
IGVudHJ5Og0KPiA+IA0KPiA+IFNpbmsgc3VwcG9ydDogUFNSID0geWVzIFsweDA0XSAoRWFybHkg
VHJhbnNwb3J0KSwgUGFuZWwgUmVwbGF5ID0NCj4gPiB5ZXMsDQo+ID4gUGFuZWwgUmVwbGF5IFNl
bGVjdGl2ZSBVcGRhdGUgPSB5ZXMgKEVhcmx5IFRyYW5zcG9ydCkNCj4gPiBQU1IgbW9kZTogUGFu
ZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUgZW5hYmxlZCAoRWFybHkgVHJhbnNwb3J0KQ0KPiA+
IFNvdXJjZSBQU1IvUGFuZWxSZXBsYXkgY3RsOiBlbmFibGVkIFsweDQwMDAwMDAwXQ0KPiA+IFBT
UjJfQ1RMOiAweDA4MDAwMDAwDQo+ID4gU291cmNlIFBTUi9QYW5lbFJlcGxheSBzdGF0dXM6IFNM
RUVQIFsweDMwMjAwMDExXQ0KPiA+IEJ1c3kgZnJvbnRidWZmZXIgYml0czogMHgwMDAwMDAwMA0K
PiA+IFBlcmZvcm1hbmNlIGNvdW50ZXI6IDANCj4gPiBGcmFtZToJUFNSMiBTVSBibG9ja3M6DQo+
ID4gMAkzMw0KPiA+IDEJMjU2DQo+ID4gMgk1MTINCj4gPiAzCTANCj4gPiA0CTANCj4gPiA1CTAN
Cj4gPiA2CTANCj4gPiA3CTANCj4gPiBQU1IyIHNlbGVjdGl2ZSBmZXRjaDogZW5hYmxlZA0KPiA+
IA0KPiA+IFNvIEkgdGhpbmsgcGFuZWwgc3RhdGluZyBFVCBzdXBwb3J0IGFscmVhZHkgcmV0dXJu
cyB0cnVlIGlmIHVzaW5nDQo+ID4gdGhpcw0KPiA+IGNoZWNrPw0KPiA+IA0KPiA+IEJSLA0KPiA+
IEpvdW5pIEjDtmdhbmRlcg0KPiBIaSBKb3VuaSwNCj4gDQo+IEluIG15IHN5c3RlbSBpIGhhdmUg
bm90IHNlZW4gRWFybHkgVHJhbnNwb3J0IHN0aW5nIHByaW50ZWQgdGhhdCBtYW55IA0KPiB0aW1l
cy4gT24gV2hhdCBjb25maWcgeW91IHRoaXMgZGVidWdmcy7CoCBBcyBwZXIgdGhlIExpbmsgcGF0
Y2ggaWYNCj4gRWFybHkgDQo+IHRyYW5zcG9ydCBpcyBzdXBwb3J0ZWQgaXQgd2lsbCBwcmludCAo
RWFybHkgVHJhbnNwb3J0KSBhbmQgaWYgbm90IA0KPiBzdXBwb3J0ZWQgaXQgd2lsbCBub3QgcHJp
bnQgdGhlIHN0cmluZy4NCj4gIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvRFAtMS9pOTE1
X3Bzcl9zdGF0dXMNCj4gU2luayBzdXBwb3J0OiBQU1IgPSBubywgUGFuZWwgUmVwbGF5ID0geWVz
LCBQYW5lbCBSZXBsYXkgU2VsZWN0aXZlIA0KPiBVcGRhdGUgPSB5ZXMsIFBhbmVsIFJlcGxheSBE
U0Mgc3VwcG9ydCA9IHNlbGVjdGl2ZSB1cGRhdGUgKEVhcmx5DQo+IFRyYW5zcG9ydCkNCj4gUFNS
IG1vZGU6IFBhbmVsIFJlcGxheSBTZWxlY3RpdmUgVXBkYXRlIGVuYWJsZWQNCj4gU291cmNlIFBT
Ui9QYW5lbFJlcGxheSBjdGw6IGVuYWJsZWQgWzB4NDAwMDAwMDBdDQo+IFNvdXJjZSBQU1IvUGFu
ZWxSZXBsYXkgc3RhdHVzOiBTVV9TVEFOREJZIFsweDY0MjAwMDEwXQ0KPiBCdXN5IGZyb250YnVm
ZmVyIGJpdHM6IDB4MDAwMDAwMDANCj4gUGVyZm9ybWFuY2UgY291bnRlcjogMA0KPiBQU1IyIHNl
bGVjdGl2ZSBmZXRjaDogZW5hYmxlZA0KDQpUaGlzIG9uZSBpcyBleGFjdGx5IHRoZSBzY2VuYXJp
byBJIHBvaW50ZWQgb3V0IGFib3ZlLiBZb3VyIG1vbml0b3IgaXMNCnN1cHBvcnRpbmcgRWFybHkg
VHJhbnNwb3J0IGJ1dCBpdCBpcyBub3QgZW5hYmxlZC4gVGhpcyBpcyBhIG5vcm1hbA0KUGFuZWwg
UmVwbGF5IExpbmsgb24gY2FzZSB3aGVyZSBFYXJseSBUcmFuc3BvcnQgaXMgbm90IGVuYWJsZWQu
DQoNCk15IGk5MTVfcHNyX3N0YXR1cyB3YXMgZHVtcGVkIG9uIGVEUCBwYW5lbC4NCg0KQlIsDQpK
b3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gUmVnYXJkcywNCj4gUmFtYW5haWR1IE4uDQo+ID4gDQo+
ID4gPiDCoMKgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgc3RhdGljIGJvb2wgc2lua19zdGF0dXNf
Y2hlY2tzKHZvaWQpDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuaCBiL2xpYi9pZ3Rf
cHNyLmgNCj4gPiA+IGluZGV4IDc2MzlmOGQ0Ni4uNTNhYjA0NDgzIDEwMDY0NA0KPiA+ID4gLS0t
IGEvbGliL2lndF9wc3IuaA0KPiA+ID4gKysrIGIvbGliL2lndF9wc3IuaA0KPiA+ID4gQEAgLTQ5
LDcgKzQ5LDcgQEAgZW51bSBmYmNfbW9kZSB7DQo+ID4gPiDCoCANCj4gPiA+IMKgwqBib29sIHBz
cl9kaXNhYmxlZF9jaGVjayhpbnQgZGVidWdmc19mZCk7DQo+ID4gPiDCoMKgYm9vbCBzZWxlY3Rp
dmVfZmV0Y2hfY2hlY2soaW50IGRlYnVnZnNfZmQsIGlndF9vdXRwdXRfdA0KPiA+ID4gKm91dHB1
dCk7DQo+ID4gPiAtYm9vbCBlYXJseV90cmFuc3BvcnRfY2hlY2soaW50IGRlYnVnZnNfZmQpOw0K
PiA+ID4gK2Jvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0
cHV0X3QNCj4gPiA+ICpvdXRwdXQpOw0KPiA+ID4gwqDCoGJvb2wgcHNyX3dhaXRfZW50cnkoaW50
IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gPiA+IGlndF9vdXRwdXRfdA0KPiA+
ID4gKm91dHB1dCk7DQo+ID4gPiDCoMKgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNf
ZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gPiA+IGlndF9vdXRwdXRfdCAqb3V0cHV0KTsNCj4g
PiA+IMKgwqBib29sIHBzcl9sb25nX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBz
cl9tb2RlIG1vZGUsDQo+ID4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYw0KPiA+ID4gYi90ZXN0cy9pbnRlbC9rbXNf
cHNyMl9zZi5jDQo+ID4gPiBpbmRleCAxY2M1N2FkMzUuLjc1MDNjNzY4MiAxMDA2NDQNCj4gPiA+
IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMNCj4gPiA+ICsrKyBiL3Rlc3RzL2ludGVs
L2ttc19wc3IyX3NmLmMNCj4gPiA+IEBAIC05NjEsNyArOTYxLDcgQEAgc3RhdGljIHZvaWQgcnVu
KGRhdGFfdCAqZGF0YSkNCj4gPiA+IMKgwqAJCQnCoMKgwqDCoCAiRkJDIHN0aWxsIGRpc2FibGVk
XG4iKTsNCj4gPiA+IMKgIA0KPiA+ID4gwqDCoAlpZiAoaXNfZXRfY2hlY2tfbmVlZGVkKGRhdGEp
KQ0KPiA+ID4gLQkJaWd0X2Fzc2VydF9mKGVhcmx5X3RyYW5zcG9ydF9jaGVjayhkYXRhLQ0KPiA+
ID4gPiBkZWJ1Z2ZzX2ZkKSwNCj4gPiA+ICsJCWlndF9hc3NlcnRfZihlYXJseV90cmFuc3BvcnRf
Y2hlY2soZGF0YS0NCj4gPiA+ID5kZWJ1Z2ZzX2ZkLA0KPiA+ID4gZGF0YS0+b3V0cHV0KSwNCj4g
PiA+IMKgwqAJCQnCoMKgwqDCoCAiRWFybHkgVHJhbnNwb3J0IERpc2FibGVkXG4iKTsNCj4gPiA+
IMKgIA0KPiA+ID4gwqDCoAlkYXRhLT5zY3JlZW5fY2hhbmdlcyA9IDA7DQoNCg==
