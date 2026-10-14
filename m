Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63ECC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 04:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DF10FABD;
	Wed, 14 Oct 2026 04:16:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AA610FABD
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 04:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791951313; x=1823487313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H8UEB+ry6bHCVwykXoyV+/XEIIxBhZAkp6Vy+mLZWdk=;
 b=ac8fNQohspC0ghaTS7NiyUbbacT0Jxsb7XEQn1gqtrE72z/7IpG2tr66
 tHFxJpzC0hv7RK2bRdjhAbeoGES5uPNJM550FMDijHRlvHq8mmJ1kU662
 04yO2SEfNDNH/DoK1IfDcOJxzZCgBhINS1N9Lw11wBOBB5EmSj5q9gnXf
 KdWGfwb0F4sBzJPMAXOud0WQ5aDoqfNBdZa4N3EK1XRODyLv2ILbzFwV3
 0a5xoq5z1GjJIx3aW9PKnbU5Nxy2L0mLNiU4zLgO4HCW6GvG4A2y2/JP9
 d8JudiWgHVgQrUTHPXsmgy9LOi9E6t0K4VglapwLgUABvOxyiX8z8ZCzl Q==;
X-CSE-ConnectionGUID: FX3e/n6PQjO2B1XX3uaobw==
X-CSE-MsgGUID: g5GEKeE0RDKY9+o7POC7zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="695544"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="695544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 21:15:12 -0700
X-CSE-ConnectionGUID: BFAV3EswS1qXuiaQPEDn0A==
X-CSE-MsgGUID: EkAqzt5xTLu8LkbU5xK5MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1404104"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 21:15:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 21:15:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 21:15:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 21:15:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xe53velILeuUgRDsjtp4o4AdQyxOs0k7jiY/eJd3uD87jSej/5oCzmBAgl7oRENlgmjvuz4EfbT0JOZZsccWIdQc08fiFy8UQ1pIbPE2dxaz3g+tZ1/RA/S5P+ZPglFAbe8j/3H6CBrI5UUdUMMLmaQkWJXZWi9A769TLjWRx5LesO0uQa1cq/ZkD9pusnjhST0Y13cKdzNMXY/fy+7ORNAGceIQEEGOI/zN+5pIeCXaJnsFo+4s89VhypcB82qf67HW3TV6Fxxb4/ZMiVFZMemJxWcAXRwuTz5iVKzKhGpiT1T+j5vjZ1aQdHRigaZ2IKFsavASsSbCVTbZBZO+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8UEB+ry6bHCVwykXoyV+/XEIIxBhZAkp6Vy+mLZWdk=;
 b=I2vJWSA95IyGtiubM2eXsQPKkNR5apfUnOVNGhdKUyE7s/07U8oGCDt6SN6+BTxXUnhtvh3oBlh6MrzsuuCb1unQg5cLbUmfn2mUgZ/3Div8/RQ+H0dDXvpnVMiJmmOU9mDLtN/4b1X6OBJe9DW2MtkqHyA8W7tlopjsVZmAf5H/pNRuYiOSs/FGjHWdRYpasw9Yu+K/68+01rs0uGe0f4IC3+YulV1lFj2pkvAYyZO48oDyceW5TBTX+AFl52AkZHKYYK3zLHqxiW/lUcfUM9Tg8/nytOttraECU0JbdArWeoaB8P+F3VWf7cG+Yg4Wm+ghOVcOhm6M5k24o+UZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB5158.namprd11.prod.outlook.com
 (2603:10b6:510:3b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 04:15:05 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 04:15:04 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/kms_vrr: Let the pipe go idle before
 reading the DC3CO counter
Thread-Topic: [PATCH i-g-t v3] tests/kms_vrr: Let the pipe go idle before
 reading the DC3CO counter
Thread-Index: AQHdWsvp/rCt6DfZP0GfK55LFVG0zrb7HGkAgAFTCMA=
Date: Wed, 14 Oct 2026 04:15:04 +0000
Message-ID: <DS4PPFE901A304F753CDFCFBA928A115346E39D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261012093308.731774-1-suraj.kandpal@intel.com>
 <20261013043228.804706-1-suraj.kandpal@intel.com>
 <d3fb2dc3-6200-4371-889e-68ea6e191c4a@intel.com>
In-Reply-To: <d3fb2dc3-6200-4371-889e-68ea6e191c4a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB5158:EE_
x-ms-office365-filtering-correlation-id: e28127c6-4907-415d-3797-08df29a9b97a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|10067099003|22082099003|260925021311599003|260925022911599003|260925021911599003|3023799007|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: RNlRAraLpwIPnAJA3S1F1jDlOGGTkFH7YXiwghidzvLYUeRhioRwF8En/ifjP/1OEJS+k+5HdeOoKM8JFWKjEDXhE59GYp3ZHoOnQBiSqUjlEigJn+m0n8+0g+bhxMTsCRfZRocUMJZP7uc119kZa/qgWS8lA3ukuttF47ejVLeVQQKuyUVSHYFLFtS+6T0z57NhX8ujEBK68pF6dy/1RBurSH6wRe4zp6W03GFmqd0pe8FhKDC3ZuwVM/KhypulOCW4zgN0HWz6RZQ2GReBY8mJ1tyqIDdQ7lhau0S+NJ+UwwNZmOrSc68A9XstJjn1Dq3h69CxW+XKaS9MsVktxWTBqY3xL+26AvfvI7TAa9x5tgO14L5Wq7MFnA9zmu1UJuNrrv0E6uqKBEIZy43ML8rdQUHWtAWVG9J6GAtwnUYtUykdiYI108WM6BKhayKdDmrjah9XgtMpPca36ibxhuFlW+EqHPBk4B0Ad1VKdo1OKbf3SGbjOyAclEVtJMNPyK3YWx86ZQYUVlBgv3v2nSTV+FFau1MNmT+ZfnjvAv7g+f+GHIc1sQiKu7ZnaPKbqzVDltrDT4yoNVALdLHeFkv42vAUn66hYLLcozzWku6R4FPH0KoZIkqCtreaUZLcmme7TnwwJXrrYFonO4U9cg1RAJSdRMS6c3Embihli9lZQXkNYUW8P0R0BcsvShWXrmiGzsK8y7Cw/YPFtUIVM3Zz8CPhfvDO1bEBut15KWo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(260925021311599003)(260925022911599003)(260925021911599003)(3023799007)(38070700021)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cytOc2dTcFVWTXNBRFlHQmNmN1VKOGwrZktjWUtPWlZNSW5GOStaZGQyUnI2?=
 =?utf-8?B?ZENQeDl0cXk2REo2enNlVWt3a1pmZHpGcHFwUUh3NjZkSWFOR29TNWRrQTdV?=
 =?utf-8?B?YTFEekhCY0RHZ1RGR2tHdUk4VDBsZ3hiNUtIejhHVXh6Ti9IdlB1OC9wRmVv?=
 =?utf-8?B?S01jRW03VmdHSWhNUys2SUp1TXFEcTV2QWJ1dUt6RkxrdjYrZ0ViZjFZSTRh?=
 =?utf-8?B?a1JDL0dpUzF2L3dLOUhEMnlYTkc2WEFXV0JxdTRWVU1RbkNEZEo3YzVuN3g2?=
 =?utf-8?B?aUszOUgvZVVQeG9qRFUxUkRNU1JQMHUwZjFibWZDcWdtS1ZXeEJnMkpPdjB4?=
 =?utf-8?B?SGpzdEduZmVNTng1ejVzdWhMZHdWQzhiS29HcmovNFBENVY4eFhweFYzbmVs?=
 =?utf-8?B?dlZvK3dQVndBaUNUUkc1UnFXMExkLy9lbGFXYk93WHlQYU83U0pkTklhWEdx?=
 =?utf-8?B?Z2FSTURMVXQ1TjhFbGluMzQrbFNuY0dWRThUOVVLazZuc2lyZ2lkQVRqeWRw?=
 =?utf-8?B?dnhMYTdlVmFBaDFnQTFBN29XWm9aTjVtSjJPZXpBWUhCRml6UjhuZHJ2QW9a?=
 =?utf-8?B?U2NlbXpnVVh6Rk85cTlHd0oyT1R4ekNJRHh6UzYya1paM05meWs1THN1Vmdl?=
 =?utf-8?B?NzNaSEVyZkhyQ2F4Z3g3SFdoNWZRczNMOGhEWVVkbzU5S0d0N3VEaGlZbkJm?=
 =?utf-8?B?OEUydUtKK3hDejRaN3A0VnB5YnRTZnUxQ2RvVlR6ZHRFSGtIcUZNSFgrcmha?=
 =?utf-8?B?akpSTmIxQzMxRE9xdW9FSmFqVi96RnBFbUdLdUdydlR3YTFKOEFhbjE1NStZ?=
 =?utf-8?B?VFRQWUZzcVpOZzFNZGJNS25pR1ppbGRiR2FvalFHMHRwM2x6ZHJIbUNLeXJE?=
 =?utf-8?B?QzhxK3JhZ002TkJmQ0FpYUtVbjErb0xmbnlOMHpJMXcwWDV4bEJDS0o5ZTY1?=
 =?utf-8?B?d3U1L3p2clRJbUM4UmVWcVVHdndtYys5cUhXeDBoRXMreVhJUmdOaUZXRHBm?=
 =?utf-8?B?djVUZm8zVWs0RkNvNENsWDN6c0lSYmF6R0VERlc2OXVxak5TYVg0Q2lJcGV4?=
 =?utf-8?B?aWlXZGJoNXZKN2lQdnhNQmswSkpKRTBrTktLRVIzUkNROTFlZnY1M2xRa1lT?=
 =?utf-8?B?WnYzSVJORDZOcndZSUxndzF4ODdzVmg3YkYxSUU0SkdnWjE2V1F6bHZRSk5V?=
 =?utf-8?B?R2VlTFJ3YkRXTzM2MEFwaVZSZ1hTak5KMk9SYm9Bcy9tWUpUZ0d0TDBJTzRD?=
 =?utf-8?B?ekV4SXZrZkQ5blFYay9KRWJQazBzSTU2cHBZT3IzbjZVaU1WYTVDY29SNHg5?=
 =?utf-8?B?OTR5a05DeWM1aWlianBBbkNrT0t4NlNia1NoZDlqNVFSWm1TNDdaVXdZSFg0?=
 =?utf-8?B?MEt6dlBYVXY0d3huOFgvZTRjRUFaNkNYb2xwSzB4ZXlQRDlOOU9OSytOZ3I2?=
 =?utf-8?B?SEwzMkhMcU9Ja2xaQmI2d2RPMCtwMElxZ1dDREc0WWFhaHlhdVhYd0JEVFU0?=
 =?utf-8?B?N0hHN1ZoeGZGd1RLcUczV05wbnFWcTAzQ0xOdm9LMFppdFhzUU4wdVBxR2xp?=
 =?utf-8?B?aW55MnoybVk3ajFha2ZYc1c4Yyt2a1I4RkROSEd6Y2pYV1dnY0J5UStuaUNF?=
 =?utf-8?B?ci9yQ0JoMFZtRU1oTnVLeGNzMmkzak1KZ1RSbGo3ZlcvSFljMnZJSlRIMysw?=
 =?utf-8?B?SWpGaEVYOVU3aXJUUWQzaTJtU0d4emdHS1Q1MEZCdWNpTjFTWGZSWFNsbzFh?=
 =?utf-8?B?QzlXZUJqS3VMYjl2YWMycmRrcE5Tc0ZKcnN2ZytBM1luTHJvVWREOGRFZ2lH?=
 =?utf-8?B?YkJGdzZIR001VUZ3bURnSFU0VVNMN1U1SGplUEFqNHhmdy9JOElVR2tzWmpp?=
 =?utf-8?B?ZkZ0WWVxSGRrMXNWMTgzMjh2a0Q0VzI5ZFpubWtNR0IvYjhlaGhaVUJUR0h0?=
 =?utf-8?B?VXpOUEFteHdwOTV0V1lWVnJ6dmZkT1RYMVEzTUc5QVRHNnRXeXNrdUxOU0V4?=
 =?utf-8?B?QnBnZDBMK293cnFaSEJLTmJ1M1JoWTV1YkhXQzBsYXJlam8xbWVLaUtxYlk0?=
 =?utf-8?B?Kzk1K3VGWjF4d0NncksrUVlCRTNNUTNIdXBRQVp3ai9qZ0hPR3VCTVBaMTRV?=
 =?utf-8?B?RWVhb0RiZSsraHRYMEphYlk3SnlabXpkcTFsWGhsUWE0RU1RTnE3WTFUMWhY?=
 =?utf-8?B?VW9ieFdOdDhHSFJvUkJIK1l5eUpuYTVFWmdVbkpiZWZrNE0xZmMzZmpPcWV5?=
 =?utf-8?B?dmE1ZnQ4RGFLb0NiTkNPR3BocVNWcWdzZEpBSnRhbGRtVTBxaTZxMjJ5L3JV?=
 =?utf-8?B?MWVxWG1XZk1iM2lWZTREZjNnLzhuc29Vb0NnY1VtWWU2RkJZY2J4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pxUolusUOboCsz0g4Dlz8O7pOs4h8a24kh36a9bX5PJ14dn2GeJNHY7mCAbqSUZZJEPo5M3QHWWUCd+YDnaUmB5POABQ2edZqrVihzpVspg61WYRFNvF2nze53taULODlcEgZzcSkdbO3Y3/eliUBtsWS7IM5vpnongMBlJR0+dGaRfSCPUp4NPbbod9OviDl4k+tikmPf0x/vyiSWkA4GvH1XGpEUdNKQRcFPdLO7OSNr9p/d9TXmluQcuOM2RP6D6V7Axrof0hTtxisa5pO5JqPYVTL315PZr2sS0MrErbCyZ1w7SL1JtjoRlA1XJKYUWAtQJBvKGyQtnLXzpBzA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28127c6-4907-415d-3797-08df29a9b97a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 04:15:04.6792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/DPnpgtYslkVHLiYUtxdqwkLJbNvhodjFLum+Lg2QwHYUv/zE4TTuMLKTsY+waq8iX4xPrxo/7qpoej+5wpxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmFsYWRhbGEsIFJhbWFu
YWlkdSA8cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gU2VudDogMTMgT2N0b2JlciAy
MDI2IDEzOjMxDQo+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTWFubmEsIEFuaW1lc2ggPGFu
aW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHYzXSB0
ZXN0cy9rbXNfdnJyOiBMZXQgdGhlIHBpcGUgZ28gaWRsZSBiZWZvcmUgcmVhZGluZw0KPiB0aGUg
REMzQ08gY291bnRlcg0KPiANCj4gSGkgU3VyYWosDQo+IA0KPiBPbiAxMC8xMy8yMDI2IDEwOjAy
IEFNLCBTdXJhaiBLYW5kcGFsIHdyb3RlOg0KPiA+IEV2ZXJ5IGF0b21pYyBjb21taXQgaG9sZHMg
RENfT0ZGIHVudGlsIGEgZnJhbWUgYWZ0ZXIgdGhlIGZsaXAsIHNvIHdpdGgNCj4gPiBmbGlwcyBh
cnJpdmluZyBldmVyeSB+MzNtcyBEQzNDTyBuZXZlciBnZXRzIGEgY2hhbmNlIHRvIGJlIGVudGVy
ZWQgYW5kDQo+ID4gdGhlIGNvdW50ZXIgc3RheXMgZmxhdCBmb3IgdGhlIHdob2xlIG1lYXN1cmVt
ZW50IHdpbmRvdy4NCj4gPg0KPiA+IEZsaXAgZmlyc3QgdG8gY29uZmlybSBMT0JGIGNvbWVzIHVw
IGFuZCBzdGF5cyB1cCwgdGhlbiBzYW1wbGUgdGhlDQo+ID4gY291bnRlciBhY3Jvc3MgYSBzZWNv
bmQgb2YgYW4gaWRsZSBwaXBlIGluc3RlYWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdXJh
aiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3Rz
L2ttc192cnIuYyB8IDQgKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc192cnIuYyBiL3Rlc3RzL2ttc192cnIu
YyBpbmRleA0KPiA+IGI0MWM1ODUzOS4uYTAyMTA2ZmE3IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3Rz
L2ttc192cnIuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc192cnIuYw0KPiA+IEBAIC0xMDYsNiArMTA2
LDggQEANCj4gPiAgICAqLw0KPiA+ICAgI2RlZmluZSBURVNUX0RVUkFUSU9OX05TICg1MDAwMDAw
MDAwdWxsKQ0KPiA+DQo+ID4gKyNkZWZpbmUgTE9CRl9JRExFX0RVUkFUSU9OX05TICgxMDAwMDAw
MDAwdWxsKQ0KPiA+ICsNCj4gPiAgIGVudW0gew0KPiA+ICAgCVRFU1RfQkFTSUMgPSAxIDw8IDAs
DQo+ID4gICAJVEVTVF9EUE1TID0gMSA8PCAxLA0KPiA+IEBAIC0xMTU4LDYgKzExNjAsOCBAQCBz
dGF0aWMgdm9pZCB0ZXN0X2xvYmZfZGMzY28oZGF0YV90ICpkYXRhLA0KPiA+IGlndF9jcnRjX3Qg
KmNydGMsDQo+ID4NCj4gPiAgIAl0ZXN0X2xvYmYoZGF0YSwgY3J0Yywgb3V0cHV0LCBmbGFncyk7
DQo+ID4NCj4gPiArCXVzbGVlcChMT0JGX0lETEVfRFVSQVRJT05fTlMgLyAxMDAwKTsNCj4gPiAr
DQo+ID4gICAJZGMzY29fY291bnRfYWZ0ZXIgPSBpZ3RfcmVhZF9kY19jb3VudGVyKGRhdGEtPmRl
YnVnZnNfZmQsDQo+ID4gICAJCQkJCQlJR1RfSU5URUxfQ0hFQ0tfREMzQ08pOw0KPiANCj4gTEdU
TSwNCj4gDQo+IFJldmlld2VkLWJ5OiBOYWxhZGFsYSBSYW1hbmFpZHUgPHJhbWFuYWlkdS5uYWxh
ZGFsYUBpbnRlbC5jb20+DQo+IA0KDQoNClRoYW5rcyBmb3IgcmV2aWV3DQpQdXNoZWQgdG8gaWd0
LWdwdS10b29scw0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ID4NCg==
