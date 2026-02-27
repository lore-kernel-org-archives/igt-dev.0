Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8D6FD9E2E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 02:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5052110EA23;
	Fri, 27 Feb 2026 02:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpFJpsSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1DD10EA23
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 02:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772161106; x=1803697106;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KaS2WxAyzsFESmdn8r2BfqfrdP5jhtJFhZXNflfIRtc=;
 b=GpFJpsSuaBCMd6Pmd0PDJdo3e8KhTGq/THXO0C7cH+CJAdBChYQTrFvS
 Hdq1E+kQ91xz+gPO9A+sG7syfMaLeI7S+PtLh9e6vut89042tFzlsUwkr
 Ng/y3N22VbneuMfLmX73SLuKyxR2fCNenTuQ1FjoxEADg2Lect0S2udoc
 +lUpCJqomAnEd5faMKQBvkJwPgAa2PSXLbIt7IJT4WXkXplarGV76SyrU
 GjwBQAlQEAMEttUuIbw9niY8v9NYzNDNg/D3a9kUzV5Rw7IINu6Hr0gzs
 cOxBqinfg/Yq5djw4lhDlEmAL5WmUQpZrymJW5Ufley0uFfDa/iTwP6Ek A==;
X-CSE-ConnectionGUID: fepzVw0wRlyTRLyyVwnnfQ==
X-CSE-MsgGUID: pT7KnqLoTs6pTR7NKevXSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83873363"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83873363"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:58:25 -0800
X-CSE-ConnectionGUID: 0rJ2ijqkSXqjG3C0XLiZPg==
X-CSE-MsgGUID: k+lvEMwzSD+xeOkRGk/bmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="239751583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:58:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 18:58:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 18:58:24 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 18:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMKTZPALd21c868pOZQHi2ZGYZxQcwcw/DJ+tql2ELVXnXR0nLt0YOpnK/WOr0iaWB3By1HUawqnxr/f+4o2SBZuYL78xcUIVI+/fY6Ol71FRB93vmGQrsqBfJc4csBLLaIPYi8/TQMbcdmWrzNZJjY4RrLYXd5zvDELEe8scBnxg8+lC1wNQeoQpUItiJN7ZhlXOggGbLKgHy2Rny4sLErFBx5Zb/LC+aeIWQYBdeLT54LADiFeP0E4Ft8oSGhp3kwBkmfT2UrLdDW+433gAGVHOcQ/YNC868NwIuSEJHwQtuLo+ZrtDUyGdGxGFGpJ49nPBUm2qy3cIPPtufIabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaS2WxAyzsFESmdn8r2BfqfrdP5jhtJFhZXNflfIRtc=;
 b=fkfBos/dTUa0vfgKt1NS5rbnGpgVXCljjcPbpYr7t0JUSr3veJysUiNafLyFkl6r5viHm8/3FQapq5p85jyxUjgPSmR3q9J5+93N4RI20vFkUV4FeNN6fPnPKtLdALouQ3J4VgHv8+svfwv4wGW6/HlwPxyLdZCwVc/G0AmifB//4aBcVt09AZ7EtHjZRLKXWwSsykFj8DWaidz6UBVo3mtovq2+t8vnA+3sfPEQsijAftD9Muni7ETnOzKViLg6xPEB+cljFlYew8xHXht5pgqRFh8V7Ewx32ox+A833vMJYuj/J8E7cXEQFi8VyPuNgDUXBWr89OV3e1Jfj6igBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 02:58:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 02:58:22 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1] lib/igt_psr: Fix Early Transport status handling
Thread-Topic: [PATCH i-g-t v1] lib/igt_psr: Fix Early Transport status handling
Thread-Index: AQHcpwQxKOfnikUAoEmfdycaQn+jm7WV23DA
Date: Fri, 27 Feb 2026 02:58:21 +0000
Message-ID: <DM4PR11MB631290227882F74D47C8F7EA9073A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB6848:EE_
x-ms-office365-filtering-correlation-id: c2a96a8a-acf3-43a2-21d8-08de75ac1166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: lkZ9wqEpSrfSitCJzeJCZUat+UZwq82XhOu7VLdFOCM/eysixwehg0lAEAInwG10Bbn0gT+lHVM5m2BbxjyvRjqeOMaEPcG8z/xLcDEWxEfmswl5K9XiO6UPPf1AwYEHAm8mVyv5NbMbBUH1yPEL9caXIm4pcSpzex+MDdV9lCvh4xoUsDplLaOzsXGTFtttFKri7L2FA8umLLd6ZgNk1pPfo9DDnT+FhQpuFz9LnMZgedaUcyZd7lHZa/yi6zLzHINz05dFv8Z+sc8WeheAGhMtHYT8ZNGfGxh1iiF7aPNwsVT8JsfMQoP9XdrsgUi/oW1s2Qxv0HADJD5oZzJacRVLLDEiaTQ3frGAU2FRRqMMkRmnYutVyd8wXpiZRu0f9Kie/fT//8li4k3MJrGpBBo2Gvk7HNFbyn8znz/mOUEh0ASMOelitXc+WBCSAwKya7kAkXlhjKAUWiTWxiZyTYFQoHaEG0lhqmmlqDCS9PsusNs4p6GzAGt34kJq72UHQOdGY1GadfFLefw0cgomvqUc9nk2RbGt6zddwXrU3U38sG7kONu/au+KJEDCMDhvWifRen60PeBfAtOFmXCxzAyuyJYwyZ1Uh9Ub0XbDnESZ5jdE73Z9qUaZemOmWuKp+OnNs2Ru4si/evlUaRI/1OjO+QnPNSi9XUVqne0zXGGEkkZYy4OBHbraH2sKCDALjbgghm2n4LgofZqLTQ71kq/xp46gQybkCRTVgFO6E0hrALKKpsPAw5ec0ijQO/H3BCF/Wt0ffWxlUrH6SbxjnnkcBuLL/nHmIxGMP3PjxqI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVgxNjFiSTRQeGpITTFya1pOY3pJVlRlWUJsZW9aV2FyRnZrMk43K1NDaHVN?=
 =?utf-8?B?dmdJRzJlc1I1WThFWWdvemR5R2dTOGpYR1lHMWR3UnN6V25BYU1ZY1Y0clQ4?=
 =?utf-8?B?R0RVa2FLUS9WTjRMK0tnTmxnenRpVGJXL0RrMzRJYXl3TDg3UjdXTlBmeGE0?=
 =?utf-8?B?U2VVVjdxMTJLZm9LWmZCMjNtaVFKWFBiQ3BJVk1WWndCQ2ZHdVpNYWt0cnRi?=
 =?utf-8?B?emc0SXpOdlJFbmlBb3ljaDhJRzVaeE5VSWZUaHlSRUVoRzRONThJM1dSVHI5?=
 =?utf-8?B?SHo5VU1GUXlNcnc4aUQ3Y2JQSmVwbi8vNVczeWZiK1V5MURpaUpGdS8zNTJL?=
 =?utf-8?B?VzYrbzVqVHJIQ0hqbkVWS2tUTTNsSWNvakxnQ3ErdFRTR09OWGI5b1liRk1L?=
 =?utf-8?B?b0tQUDd6aXNWcWlTSWxodElwL21EalY4Zy9uSDluMVpMVUlYWWtFRE9hQ0Jx?=
 =?utf-8?B?ZUtPS3JaMWVyRUNKeWRwbE9PNVk5bFFxZ3BpcFBwNjUzdjROZDV1WndDaDBH?=
 =?utf-8?B?c0pnTDJ5WnNmb2dVWFNLbVFUeGd1Vm0wSmp1akZpeU1qZGZ4RkkwWUdlVTgw?=
 =?utf-8?B?dURzMlNRVzFjV0FhL2hpYTZidHBHMGtXRk9xSDJ5LzRmcDJFRmF0dUtuWjNa?=
 =?utf-8?B?WGdmY1ZvZDJiTG94TXdycmhwMTJHemNmUXVVRmJpWTdEbTVadUYzUkRYSlA0?=
 =?utf-8?B?WXp1dldsc2hmNThwbXdKSTg1V2VBY1NscTdzWi85UE5wMytrLzdoR1VINDg2?=
 =?utf-8?B?UlZwMVNKTit3dFJIUXhVL01QdGJpbXVwRDJxdVJ2bVNvL09CZEJRcGdOdEpK?=
 =?utf-8?B?NnIvMkxHYW9JcnI5MHFMOGg2UXVVdERaYmxWSjhjbXIrb2JNQVBGQWZiR2RP?=
 =?utf-8?B?VEFwNWtCdVFONUxPaTZ6UGxnK2c3ZzZSa3FzdnZSVm5XMTFpMnVpcVAvM2lh?=
 =?utf-8?B?dVliS2NEbTIvcFBRSUVRaGZnQ0l0aEZtdVAxUDdseUY4N0dPWDc2VFlSWG4v?=
 =?utf-8?B?TWJ5VEswSXRJS0Q2UjRCSTkvYzNzYTl6QWIvcm1KWllRZ2VneFUrRzc2dnZ3?=
 =?utf-8?B?MmZYYXFqVHJVRnd0cnpvcjBSdjVBUlhEWEtoUjdxaWpHSG0rUHNQWkVXWHpE?=
 =?utf-8?B?dy9lZCsxMmE1bEVPcFZLeEtFYzBPNlVVUDFpZU5SWGR3aElFVGxPaHNXWWRF?=
 =?utf-8?B?VjhUMXRHdm5qOG0rRkg4ZitkS0VINW4rY1BQcGRLTGU3cjh6V3NXb2ZvclhW?=
 =?utf-8?B?UmVraHVsN0FhQXcvWm9QT1kyUUZQdXRFbkdIemc3UkFMWEJ3OXRJMzd4c0sz?=
 =?utf-8?B?eCt1aFlPL1JEdCtWQjRQRm9UUi9aWFB3WGxzRE40bzNOV2JGeXB1WlhWSjRN?=
 =?utf-8?B?VnlTS09FYmdoN015MzVDZWNpU1dnRFdFRkxMMTBidXhFaWRBc2M3cXBTU3hM?=
 =?utf-8?B?U0JrZFp0TmtIS1pmWTZaOHJ1a1U2Z3FhYkhGSUJyS01jRHREUURqU2JKVE1E?=
 =?utf-8?B?ZWxTUGtLSmZ0b0c4Z0ZRRjRUeXhhMDdMOWtTY1RmMDcva1VWQnZhRTUvU2FY?=
 =?utf-8?B?MmRGS3dZU3JGQzYwRWd5T3FNdmN2UUVwbFlHN09sV3FwYWsybHhGR0xRcURr?=
 =?utf-8?B?cmJmdFpkbS8rempDRW5DSGZoaUxJYlBUR2pNU0tNdnNSSlpFYThvSlBiaWhO?=
 =?utf-8?B?K2dFQ3lOYmFGcmoweTEwRnVRSDVDWklEMkNIQjlCZFllWGhOcWUvMjFReGxp?=
 =?utf-8?B?QndkUGdJcndkejMzcjR2RnhzZndUWTBYbTgwMVRiUGJNckI3VGttVjcvb2JU?=
 =?utf-8?B?TWdhYXZROWhEVHBucjBObzdaSWU0TmpDaC8vQ3pzZi9lbXlPZEpwdk1xZTEv?=
 =?utf-8?B?eXovd2U5SXc0bFVVZWFjbWZjeUtBYUFOeTdVYnhtNndsT2tUeERQbDNqbjVn?=
 =?utf-8?B?WFBXOWJwSUUwQ3Q4OUNHNUZGclV1VmNMWG8zSExPenh6WkRlSEtwVUVaL3FH?=
 =?utf-8?B?dEpjdVpnTEVsN1FRZ2Ywajk3SktQRW96WVo0c0pEb2pjcG5vY1N0b1c5cy81?=
 =?utf-8?B?V3o4RG9BODJhY25Kb05kR3BVTFY3TXJVREc0VW9oQ0tNV3lZUDZ0bEVUQllS?=
 =?utf-8?B?UzhqUGs1L0cyTk9YMFVoTW9WS3dpcFViMVYxWFMrVXJNSVZLL01tOTd1YmdH?=
 =?utf-8?B?ZE5vRTE4bG5mRmlsVVZ3WFd3UmRPNmdWcXg2OFRFZmI3NTc2QWF0eTlWTEh3?=
 =?utf-8?B?VUwydjFkRmhjYmV1NzFHM0JYMTdHcldJZDlTNHZWQU5KUGJtMlVWeWdScUNp?=
 =?utf-8?Q?xrQu5o5oAaXUCYnmS0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a96a8a-acf3-43a2-21d8-08de75ac1166
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 02:58:21.9840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6CU4meB+nR5iwSnzf52AcEkR1EywWX2RYxG96JP2gur7Sh3QdEqE+WCEJ3UoNsxbXDcAfh861ilxdDxutE2MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOYWxhZGFsYSwgUmFtYW5haWR1
IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgMjYsIDIwMjYgMzoxMyBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPjsgTmFsYWRhbGEsIFJhbWFuYWlk
dQ0KPiA8cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGkt
Zy10IHYxXSBsaWIvaWd0X3BzcjogRml4IEVhcmx5IFRyYW5zcG9ydCBzdGF0dXMgaGFuZGxpbmcN
Cj4gDQo+IE1ha2UgRWFybHkgVHJhbnNwb3J0IGNoZWNrIG91dHB1dOKAkWF3YXJlIGFuZCBhbGln
biB3aXRoIHVwZGF0ZWQgUFNSIHN0YXR1cw0KPiB0ZXh0Lg0KDQpDYW4gd2UgYWRkIGNvbW1pdCBp
ZCBvZiBrZXJuZWwgd2hlcmUgaXQgY2hhbmdlZCBhbmQgYWRkIG1vcmUgaW5mbyB0byBkZXNjcmli
ZSB0aGlzLiANCg0KVGhhbmtzIA0KSmVldmFuIEIgDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYWxh
ZGFsYSBSYW1hbmFpZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
bGliL2lndF9wc3IuYyAgICAgICAgICAgICB8IDggKysrKystLS0NCj4gIGxpYi9pZ3RfcHNyLmgg
ICAgICAgICAgICAgfCAyICstDQo+ICB0ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jIHwgMiArLQ0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMgaW5kZXggN2U1MGMz
ZGM2Li4yMGYzZDliMDAgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gKysrIGIvbGli
L2lndF9wc3IuYw0KPiBAQCAtNjksMTQgKzY5LDE2IEBAIHN0YXRpYyBib29sIHBzcl9hY3RpdmVf
c2lua19jaGVjayhpbnQgZGVidWdmc19mZCwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ICAv
Kg0KPiAgICogQ2hlY2tzIGlmIEVhcmx5IFRyYW5zcG9ydCBpcyBlbmFibGVkIGluIFBTUiBzdGF0
dXMgYnkgcmVhZGluZyB0aGUgZGVidWdmcy4NCj4gICAqLw0KPiAtYm9vbCBlYXJseV90cmFuc3Bv
cnRfY2hlY2soaW50IGRlYnVnZnNfZmQpDQo+ICtib29sIGVhcmx5X3RyYW5zcG9ydF9jaGVjayhp
bnQgZGVidWdmc19mZCwgaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ICB7DQo+ICAJY2hhciBidWZb
UFNSX1NUQVRVU19NQVhfTEVOXTsNCj4gKwljaGFyIGRlYnVnZnNfZmlsZVsxMjhdID0gezB9Ow0K
PiANCj4gLQlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCAiaTkxNV9lZHBfcHNy
X3N0YXR1cyIsIGJ1ZiwNCj4gKwlTRVRfREVCVUdGU19QQVRIKG91dHB1dCwgZGVidWdmc19maWxl
KTsNCj4gKwlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCBkZWJ1Z2ZzX2ZpbGUs
IGJ1ZiwNCj4gIAkJCQlzaXplb2YoYnVmKSk7DQo+IA0KPiAtCXJldHVybiBzdHJzdHIoYnVmLCAi
ZW5hYmxlZCAoRWFybHkgVHJhbnNwb3J0KSIpOw0KPiArCXJldHVybiBzdHJzdHIoYnVmLCAic2Vs
ZWN0aXZlIHVwZGF0ZSAoRWFybHkgVHJhbnNwb3J0KSIpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBi
b29sIHNpbmtfc3RhdHVzX2NoZWNrcyh2b2lkKQ0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3Iu
aCBiL2xpYi9pZ3RfcHNyLmggaW5kZXggNzYzOWY4ZDQ2Li41M2FiMDQ0ODMgMTAwNjQ0DQo+IC0t
LSBhL2xpYi9pZ3RfcHNyLmgNCj4gKysrIGIvbGliL2lndF9wc3IuaA0KPiBAQCAtNDksNyArNDks
NyBAQCBlbnVtIGZiY19tb2RlIHsNCj4gDQo+ICBib29sIHBzcl9kaXNhYmxlZF9jaGVjayhpbnQg
ZGVidWdmc19mZCk7ICBib29sIHNlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQNCj4gZGVidWdmc19m
ZCwgaWd0X291dHB1dF90ICpvdXRwdXQpOyAtYm9vbCBlYXJseV90cmFuc3BvcnRfY2hlY2soaW50
DQo+IGRlYnVnZnNfZmQpOw0KPiArYm9vbCBlYXJseV90cmFuc3BvcnRfY2hlY2soaW50IGRlYnVn
ZnNfZmQsIGlndF9vdXRwdXRfdCAqb3V0cHV0KTsNCj4gIGJvb2wgcHNyX3dhaXRfZW50cnkoaW50
IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90DQo+ICpvdXRwdXQp
OyAgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9k
ZSwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpOyAgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0ZShp
bnQgZGVidWdmc19mZCwgZW51bQ0KPiBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm91dHB1
dCk7IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jDQo+IGIvdGVzdHMvaW50
ZWwva21zX3BzcjJfc2YuYyBpbmRleCA1YmNiYzhkZjQuLjAwMjgzMTY5YiAxMDA2NDQNCj4gLS0t
IGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfcHNy
Ml9zZi5jDQo+IEBAIC05NjIsNyArOTYyLDcgQEAgc3RhdGljIHZvaWQgcnVuKGRhdGFfdCAqZGF0
YSkNCj4gIAkJCQkJCQkgICJGQkMgc3RpbGwNCj4gZGlzYWJsZWRcbiIpOw0KPiANCj4gIAlpZiAo
aXNfZXRfY2hlY2tfbmVlZGVkKGRhdGEpKQ0KPiAtCQlpZ3RfYXNzZXJ0X2YoZWFybHlfdHJhbnNw
b3J0X2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQpLA0KPiArCQlpZ3RfYXNzZXJ0X2YoZWFybHlfdHJh
bnNwb3J0X2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQsIGRhdGEtDQo+ID5vdXRwdXQpLA0KPiAgCQkJ
ICAgICAiRWFybHkgVHJhbnNwb3J0IERpc2FibGVkXG4iKTsNCj4gDQo+ICAJZGF0YS0+c2NyZWVu
X2NoYW5nZXMgPSAwOw0KPiAtLQ0KPiAyLjQzLjANCg0K
