Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953C8D3B7DE
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 10:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6C410E3FE;
	Mon,  8 Dec 2025 10:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOq0+jPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412C10E3FE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765189873; x=1796725873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VEMNvQSeJrQuJSHGtJnOn4AhqgbXkpNJjpjmvIWx54k=;
 b=cOq0+jPj4q8epMxGNsDbKqyv0fIb1ibfkDX0YKqwpUUVaA+JqEZhJnLV
 mPVGbgP/tG7qKCOKDLhV2IvU7+0NbzEcOsR4b1S4rIS8G0DP6vUz9d15T
 sX73/X1269OaSKCoNo3SdehYXvH9hMHgtohH1gZdCE8b24DKwwwBIrNoh
 ilIsXIuqZCpN1N5GJ1daShHrkaQa6rz2na0YmIKHoCiDBvEvR2sveQAUO
 1ZBtoyDTVVVSeTY95zyRrj4DSibxwoR3I5SDSw+DdoO41mF0Fm9cGrwty
 1owDKNBI/jjLeF9uwvascJUZJ4pKTxQuSKbKgbSPEkv+cE3ZLHS+VSXbe w==;
X-CSE-ConnectionGUID: kivgeV61S6GaLIOqMVbYgg==
X-CSE-MsgGUID: wPU/Kt+ARRazA0FTn+ICGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="92605310"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="92605310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 02:31:12 -0800
X-CSE-ConnectionGUID: zvSPCr61Qri5Z0cPYuoMLQ==
X-CSE-MsgGUID: Z1wC2FMzQW+bzE8j16EVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195180820"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 02:31:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 02:31:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 02:31:11 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 02:31:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJNk2G3EfMtHyMa+oYr5f5591E0FHo0g9aevIujanXXGiTZPATaMBnzP7RtA0puB1FFckQhpKKswNkopKOYw4fCm1Oie6sLkxUaZ/xNXYwdxa64uZetR0bgwD3xYF6LA2+IRqW3hvlHd8G0hSxtF95Sa2rrye8gcoaZCQYReXt8eETUyDHrk9NZIyQF45rYeJfTRBJknAMoRgnvmt6pc17PnmG6MBTb4yuCY0uolSI9+aBkbDQH3CPtsKKnFq6JBPlxT+yd3i9TFrWArH4tVGORffp6qP1aybYlk2a1aQKZ+/WCM4+viUfbtwu0soTyD+Q9rYhG92BTaXlzWV98TQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFLom798Om4sT7W3fQ/2fkGl0JBW9wMPRfUyMfiDmiA=;
 b=ciA61PQgbdf06Hrv+Yp6+hILOHmqvOWVXOdj6jt4v/a4e3XsYW30Ku2P/BoVZIr2CT6PExYoEQKoHN3F0xRiXk2ngk11nYylp1i734W8RAuyai4TEiIgZboyrk9oI5onarXcq+oVHQkpyRAuBAuv0PWdptwu2aw97Sh+Q+bkFSqV324+of2+UH1LgihtztPSm3YmHpDNNlXAGpbVe7M8/oIZcNyHxu54KwL2O52wpuINCmAAQvohvYPUGKpXV19UMuqZ1re4xcS+p7KyGFe+q6isZyzsusOog5qABDuPwch+ayi800fVbyhDCJBqc2pveAASuLpyLUWwlx1EQCm8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 10:31:08 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 10:31:08 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Thread-Topic: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Thread-Index: AQHcaB5EW7hU1ZFimkm2QOeKDuufhLUXis6Q
Date: Mon, 8 Dec 2025 10:31:08 +0000
Message-ID: <PH0PR11MB480634D39748D5BC84AE2458E4A2A@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20251208083951.2279254-1-jeevan.b@intel.com>
In-Reply-To: <20251208083951.2279254-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|LV3PR11MB8742:EE_
x-ms-office365-filtering-correlation-id: 56fb3bc4-beec-4a00-413a-08de3644e6a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?21fi0c5ouEJj1UsgD1AsMvGIg8FEj7OvCrYWLjJaZuHi4yKAgWIu1E/AQO8i?=
 =?us-ascii?Q?BOJGvJ6yrtXyKHZwCd+2+ZYsoa6YGgal5qLTkiiI+nVm7AspGFPeanzgOBWE?=
 =?us-ascii?Q?YxWnR9DfcN7ZX4DqNopPKeEBjT6q7euTmDULt3AGlUeWVwREL8io6jEK2zQ4?=
 =?us-ascii?Q?S2TRv9T8Jeg+G46lCQzGdA3rxPYBe+OhyIeHYp4qAqVsbZfY7as0uVuwDueR?=
 =?us-ascii?Q?V3kYQg1P+xTOMkyda4R4bT5xgloZkwBCwCIV/GUTYOAXPgsUBJcFUqOr+fGn?=
 =?us-ascii?Q?llKPyz3k956UZz2Cv6pEu4xo4ph2boiyWMwBgmJXH49xJd0xXlY1qHqRbBER?=
 =?us-ascii?Q?EirvlJVd4bs+wZZJ4oSygDI7SeTKEUSGbbNChs6muMdCE3QFyeGBOaBR/WB0?=
 =?us-ascii?Q?/huPepPYMzlvobklvx2hBhVyEadIMwZUr8P2fn+YASAuslkGgvi5BhlUvP21?=
 =?us-ascii?Q?WI6XR1w2Gt2sDH2y5i7WKPdq2rihwipHJbtsHur02J61edwS8G9k8dzl5rzE?=
 =?us-ascii?Q?0gfNqV2VX0LZ7AEkH1xyZUD2TPbbktot2QUciRdF8fIK6dOBBdIEXkchBIwf?=
 =?us-ascii?Q?8Nzvsgf3sdRo4rsGlyyrFukfSwtYV2alYHlr/w6tZpD4jZb5M+taUYehXQFb?=
 =?us-ascii?Q?NARHqbT2yRdCRNgRJtVj7ZFG7LwW/6VqoGrZZ8es6m2PpVUjDoXtCTHgqBca?=
 =?us-ascii?Q?HY5Lh3HpP8f+diMQ9XrKHqyURaFM1U+F4Ds4BVamzL2O6ODYEAAE5eofdplk?=
 =?us-ascii?Q?MRm84PSQChINIvAA2uqrHhlu9YgWmJr3h0Kb061lSGf3dOJ7geHDfqJZRSOo?=
 =?us-ascii?Q?Zx2uJdoN6YuKC+phYHayF0q6EhjbeUxVsbpSixdAJ8N53mjz5mPnDZJW+uec?=
 =?us-ascii?Q?t8VtwQyg/1IG5NTl5txv2CizbpJgK6WbZ2JjMWZf1jfaFmoGtF8NTBi4cy2f?=
 =?us-ascii?Q?hb+QUetVFHo+JXf0VjTE67JctVdPNqg3azUgioVZQn7ogITbX1GKbABzwR/l?=
 =?us-ascii?Q?Eo7PKQ/3RlWyEEtkn1fbhW7LEspGDiGTZqZc+kcLUavlG0JcvyPyYbbBK1Aw?=
 =?us-ascii?Q?ZYCvJxVaIaAhS2uQO+p88lD6h98MHGP8foxpmYmY1+Gp8LW52zQ+ph1ruxcP?=
 =?us-ascii?Q?WXR9ar7DQwd1xS4YFYn+YOM+TGwU4Yvo1cJ6QLEzqJrtulmv+DeEVSZTxK7r?=
 =?us-ascii?Q?K20zDBH6dEafzpCEoSyruSCxJctzh8TxfS7pA0OmMHFLK4kY8+GSuorORORv?=
 =?us-ascii?Q?uo0Xb12EFd2Cx4Bel87BOiAn58TYOs1IaoGvgnwr21+1hN+LhvQ8Ui/9bHOw?=
 =?us-ascii?Q?cARyU7po3wgBGvQmb8E08e8YTBh/7vIw2cDvz9sjJ9yndTm/RCla+VaF4uPM?=
 =?us-ascii?Q?PN/y9+aLsLKLoZm5/rQ+DJ+lrnpChxrvbbtjc5DhpA1W3FJeLhGJia3oO+x6?=
 =?us-ascii?Q?hW/U6dYNnZM3uiUSwB4KGb2XfFQ4qsWUBwqG06tiKiYmcZu59ZSjHIoYOGJc?=
 =?us-ascii?Q?5x9s+YyjoQIsdxHggdq4cqqkB/oSVhDC8RSy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bysHpkpQnCnJZK4h4BIB0h5oLjOO5yEhD27urNuebK3sjz0TO4Cj1+biiFlt?=
 =?us-ascii?Q?hrzQBgr4SAa5t89UVan4iH31wVwHs5LDMtEi5HKMczMyVuvQ26MLoKZteLw1?=
 =?us-ascii?Q?iONk0HT7CBXQrRT0mhrF44ZwRiAmFDIrNIyo3rkqnPQP4wV8C4rlfWXGooTG?=
 =?us-ascii?Q?+IplofAmV62l17Xoc8X3d3iyMCn/kdHd/GbaVnHqTvrm/RF/H8Xh1emIK02L?=
 =?us-ascii?Q?R1owIR01c31h240jq9dVtmNmj6vZSkR26tJw+uFQhU9/+EqT+W1ssSw6rYLK?=
 =?us-ascii?Q?LFNvTDaGaFi5i4YXbQ+G7AWl9YNbA1Cv9L4VnWg6bBc1dSPRaVdGPQaGWU63?=
 =?us-ascii?Q?npoU822U7wvc0Qt2I4iTMp/qZ8SuyNz5RgntrgZ9QZItjoJufR6v/eLxZD96?=
 =?us-ascii?Q?h+r6Nn3aoBbisdMN0iv3JJbHuSLh8JRwhcyL/AZ5WBfwwR1nS3Fr1Q23yrEL?=
 =?us-ascii?Q?7Ye/y3Ax/C5kJHQj5DARP1wKRJBZElxb3gfQBwiWO2jzXfOWK8AHbGicPGfn?=
 =?us-ascii?Q?t6jfULVQjcSCIJxKeIpIN5yl53GTxbco/LkqsySrDuIUbSsK26FreJy+ROui?=
 =?us-ascii?Q?f5RKI4UEZcbnnVScAY9m8xaTb/pw2BM0Q4FgjBD4vs6NkxRcDOTFrnfu2AUK?=
 =?us-ascii?Q?ZY1xFBF2pFdYe0iccyC5+b4SBUbyfpwJziHDK9piubwXhvFv30RautQZojfl?=
 =?us-ascii?Q?qOHp77+cax+kPgjzRfGdE2sj45iiku3Is6DsFJdrW4JEqhbCblhDB/S9GAni?=
 =?us-ascii?Q?wCU6OgASycq5YKFPTy3kWkSaqfGyC33sUcxFd8tW1aaZYXvqKOtVjdUf5pem?=
 =?us-ascii?Q?Rr9o8KeRRZeTwzHwojQW4IjZYHYT0ib+bVtKCMFJrS8CpFukPO+RqmSJOsUC?=
 =?us-ascii?Q?lnwEv7mGormQjkKo4TuTfkESvs2O89FlYf/BVRpvw+cO3u7kh0VyrFNt+fvs?=
 =?us-ascii?Q?YrHgzmYMWjIZ8Yhr8/vR9O0CcHOEpc4LTohIcR8JtyblwdaddmQFjQCzTXMM?=
 =?us-ascii?Q?7vhiiP9Ws6r3NTKA4yE8BtGnG1hIJWVpcIr+avf8DlVTv/oK9wZxZKiBTIv8?=
 =?us-ascii?Q?ZneKWaGFLnFzlfjj7A78xkR+pb3mn2n0WNvZH6PixI04dVnWlAP7hd/3gcBw?=
 =?us-ascii?Q?dkK6PvKGQvjR1uM72EOyITH96nBGDhsPt8Ho7FfsUg3sAc9M45r4ORbxJ9lB?=
 =?us-ascii?Q?TLIAiz+vrZRZw5X8fyRjleDM4KwB0jBqXLR8wDUGFmYCpK6N8tNC8hL64pVV?=
 =?us-ascii?Q?W8UOR4OkylC72+95GfJauK6BivAXF9G4AcbckdvkqhqNAstT3bLkhqhqTJlq?=
 =?us-ascii?Q?PWWrbbwG3r6AC9g6JA0sowmlKrA6sMtgb+lKjbm2wT8MXT4Lo6vk4/DANsbt?=
 =?us-ascii?Q?axPH3ePnrX8us4Zp0jOdZ9XA46PRFr7upxmDj+9CuLfRx5g6TvveXl1FzDAO?=
 =?us-ascii?Q?hIO03rnX+3evMDTu6PdgDDo+Cvsk0Ucxv+Z8si9nsNRctWMB8vEluHzD5Vim?=
 =?us-ascii?Q?NH2kOFNEBEfpZOrXMMJ8Li/p9c/CbmNob3dbtv5gS5OMslCLNQYbYIaX/gbb?=
 =?us-ascii?Q?YlnvG3hZsPuTmyD0ccAvSeU8/fkymQUG+trwjfTwFMZFezuN0zqvBwHIGZZf?=
 =?us-ascii?Q?9FyW4plxWca/9z6EocQK7rQokxu80d1zvhhO4A8gkJzrkoPqlvO4OPbj/g2f?=
 =?us-ascii?Q?DMVlfA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fb3bc4-beec-4a00-413a-08de3644e6a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 10:31:08.7809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHyOyE5YfXXcsQT/Mv2P2hQXPRRzdw02FQ6bE1tBvGJ6mEg7nchQL4FCz4q/0hd7God5bhmVlpefGcrzAmjpcvVKW2e+MdDlSas7jc8kJj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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



-----Original Message-----
From: B, Jeevan <jeevan.b@intel.com>=20
Sent: 08 December 2025 02:10 PM
To: igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; Thasleem, Mohammed <mohammed.thas=
leem@intel.com>; B, Jeevan <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to commo=
n library

Move DC counter utility functions from tests/intel/kms_pm_dc.c to lib/igt_p=
m.c for reuse across other tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_pm.c            | 169 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h            |  15 ++++
 tests/intel/kms_pm_dc.c | 121 ----------------------------
 3 files changed, 184 insertions(+), 121 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 1ffcdcef3..7873c68a4 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1543,3 +1543,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
 				   DRM_MODE_DPMS_ON);
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
+
+/**
+ * get_dc_counter:
+ * @dc_data: String containing DC counter data in format
+ *
+ * Returns the counter value as uint32_t  */ uint32_t=20
+get_dc_counter(char *dc_data) {
	-->Use "igt_" before all lib.c/h functions...
+	char *e;
+	long ret;
+	char *s =3D strchr(dc_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret =3D strtol(s, &e, 10);
+	igt_assert(((ret !=3D LONG_MIN && ret !=3D LONG_MAX) || errno !=3D ERANGE=
) &&
+		   e > s && *e =3D=3D '\n' && ret >=3D 0);
+	return ret;
+}
+
+/**
+ * support_dc6:
+ * @debugfs_fd: DRM file descriptor
+ *
+ * Returns true if DC6 is supported.
+ */
+bool support_dc6(int debugfs_fd)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+	return strstr(buf, "DC5 -> DC6 count"); }
+
+/**
+ * get_dc6_counter:Locate DC6 counter string in debugfs buffer
+ * @buf: Buffer containing i915_dmc_info debugfs output
+ *
+ * Searches for DC6 counter information in the DMC info buffer.
+ */
+char *get_dc6_counter(const char *buf)
+{
+	char *str;
+
+	str =3D strstr(buf, "DC5 -> DC6 count");
+	if (!str)
+		str =3D strstr(buf, "DC5 -> DC6 allowed count");
+
+	return str;
+}
+
+/**
+ * read_dc_counter:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag (CHECK_DC5, CHECK_DC6, or CHECK_DC3CO)
+ *
+ * Returns current counter value for the specified DC state  */=20
+uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) {
+	char buf[4096];
+	char *str;
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf,=20
+sizeof(buf));
+
+	if (dc_flag & CHECK_DC5) {
+		str =3D strstr(buf, "DC3 -> DC5 count");
+		igt_assert_f(str, "DC5 counter is not available\n");
+	} else if (dc_flag & CHECK_DC6) {
+		str =3D get_dc6_counter(buf);
+		igt_assert_f(str, "No DC6 counter available\n");
+	} else if (dc_flag & CHECK_DC3CO) {
+		str =3D strstr(buf, "DC3CO count");
+		igt_assert_f(str, "DC3CO counter is not available\n");
+	} else {
+		igt_assert(!"reached");
+		str =3D NULL;
+	}
+
+	return get_dc_counter(str);
+}
+
+/**
+ * dc_state_wait_entry:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag
+ * @prev_dc_count: Previous counter value to compare against
+ *
+ * Returns true if DC state entry detected within timeout, false=20
+otherwise  */ bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int=20
+prev_dc_count) {
+	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
+			prev_dc_count, 3000, 100);
+}
+
+/**
+ * dc_state_name:
+ * @dc_flag: DC state flag
+ *
+ * Converts DC state flag constants to readable string names  */ const=20
+char *dc_state_name(int dc_flag) {
+	if (dc_flag & CHECK_DC3CO)
+		return "DC3CO";
+	else if (dc_flag & CHECK_DC5)
+		return "DC5";
+	else
+		return "DC6";
+}
+
+/**
+ * require_dc_counter:
+ * @debugfs_fd: File descriptor for the debugfs
+ * @dc_flag: DC counter type to check (CHECK_DC3CO, CHECK_DC5,
+ * or CHECK_DC6)
+ *
+ * Skips the current test if the requested DC counter is not available
+ * on the system.
+ */
+void require_dc_counter(int debugfs_fd, int dc_flag) {
+	char *str;
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+
+	switch (dc_flag) {
+	case CHECK_DC3CO:
+		igt_skip_on_f(!strstr(buf, "DC3CO count"),
+			      "DC3CO counter is not available\n");
+		break;
+	case CHECK_DC5:
+		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
+			      "DC5 counter is not available\n");
+		break;
+	case CHECK_DC6:
+		str =3D get_dc6_counter(buf);
+		igt_skip_on_f(!str, "No DC6 counter available\n");
+		break;
+	default:
+		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
+	}
+}
+
+/**
+ * read_pkgc_counter:
+ * @debugfs_root_fd: File descriptor for the debugfs
+ *
+ * Returns PC10 counter value.
+ */
+unsigned int read_pkgc_counter(int debugfs_root_fd) {
+	char buf[4096];
+	char *str;
+	int len;
+
+	len =3D igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(=
buf) - 1);
+	igt_skip_on_f(len < 0, "PKGC state file not found\n");
+	buf[len] =3D '\0';
+	str =3D strstr(buf, "Package C10");
+	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
+
+	return get_dc_counter(str);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h index e931e51af..2db71e826 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -29,6 +29,13 @@
=20
 #include "igt_kms.h"
=20
+#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
+
+/* DC State Flags */
+#define CHECK_DC5       (1 << 0)
+#define CHECK_DC6       (1 << 1)
+#define CHECK_DC3CO     (1 << 2)
+
 void igt_pm_enable_audio_runtime_pm(void);
 void igt_pm_enable_sata_link_power_management(void);
 void igt_pm_restore_sata_link_power_management(void);
@@ -99,5 +106,13 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev=
);  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  =
bool igt_has_pci_pm_capability(struct pci_device *pci_dev);  void igt_pm_dp=
ms_toggle(igt_output_t *output);
+uint32_t get_dc_counter(char *dc_data); bool support_dc6(int=20
+debugfs_fd); char *get_dc6_counter(const char *buf); uint32_t=20
+read_dc_counter(uint32_t debugfs_fd, int dc_flag); bool=20
+dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);=20
+const char *dc_state_name(int dc_flag); void require_dc_counter(int=20
+debugfs_fd, int dc_flag); unsigned int read_pkgc_counter(int=20
+debugfs_root_fd);
=20
 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index 8cdf31=
2f6..226bb753d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -79,15 +79,9 @@
  * Description: This test validates display engine entry to DC5 state whil=
e PSR is active on Pipe B
  */
=20
-/* DC State Flags */
-#define CHECK_DC5	(1 << 0)
-#define CHECK_DC6	(1 << 1)
-#define CHECK_DC3CO	(1 << 2)
-
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
 #define RPM_STATUS "i915_runtime_pm_status"
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
-#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) ||=
 intel_display_ver(devid) >=3D 14))  #define SEC 1 @@ -116,7 +110,6 @@ type=
def struct {
 	bool runtime_suspend_disabled;
 } data_t;
=20
-static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count=
);  static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_d=
c_count);
=20
 static void set_output_on_pipe_b(data_t *data) @@ -260,70 +253,6 @@ static=
 void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	paint_rectangles(data, data->mode, fb_color, fb);  }
=20
-static uint32_t get_dc_counter(char *dc_data) -{
-	char *e;
-	long ret;
-	char *s =3D strchr(dc_data, ':');
-
-	igt_assert(s);
-	s++;
-	ret =3D strtol(s, &e, 10);
-	igt_assert(((ret !=3D LONG_MIN && ret !=3D LONG_MAX) || errno !=3D ERANGE=
) && e > s && *e =3D=3D '\n' && ret >=3D 0);
-	return ret;
-}
-
-static char *get_dc6_counter(const char *buf) -{
-	char *str;
-
-	str =3D strstr(buf, "DC5 -> DC6 count");
-	if (!str)
-		str =3D strstr(buf, "DC5 -> DC6 allowed count");
-
-	return str;
-}
-
-static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) -{
-	char buf[4096];
-	char *str;
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
-
-	if (dc_flag & CHECK_DC5) {
-		str =3D strstr(buf, "DC3 -> DC5 count");
-		igt_assert_f(str, "DC5 counter is not available\n");
-	} else if (dc_flag & CHECK_DC6) {
-		str =3D get_dc6_counter(buf);
-		igt_assert_f(str, "No DC6 counter available\n");
-	} else if (dc_flag & CHECK_DC3CO) {
-		str =3D strstr(buf, "DC3CO count");
-		igt_assert_f(str, "DC3CO counter is not available\n");
-	} else {
-		igt_assert(!"reached");
-		str =3D NULL;
-	}
-
-	return get_dc_counter(str);
-}
-
-static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_c=
ount) -{
-	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
-			prev_dc_count, 3000, 100);
-}
-
-static const char *dc_state_name(int dc_flag) -{
-	if (dc_flag & CHECK_DC3CO)
-		return "DC3CO";
-	else if (dc_flag & CHECK_DC5)
-		return "DC5";
-	else
-		return "DC6";
-}
-
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_c=
ount)  {
 	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count=
), @@ -385,32 +314,6 @@ static void check_dc3co_with_videoplayback_like_loa=
d(data_t *data)
 		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n"=
);  }
=20
-static void require_dc_counter(int debugfs_fd, int dc_flag) -{
-	char *str;
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-				buf, sizeof(buf));
-
-	switch (dc_flag) {
-	case CHECK_DC3CO:
-		igt_skip_on_f(!strstr(buf, "DC3CO count"),
-			      "DC3CO counter is not available\n");
-		break;
-	case CHECK_DC5:
-		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
-			      "DC5 counter is not available\n");
-		break;
-	case CHECK_DC6:
-		str =3D get_dc6_counter(buf);
-		igt_skip_on_f(!str, "No DC6 counter available\n");
-		break;
-	default:
-		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
-	}
-}
-
 static void setup_dc3co(data_t *data)
 {
 	data->op_psr_mode =3D PSR_MODE_2;
@@ -531,15 +434,6 @@ static void test_dc_state_dpms_negative(data_t *data, =
int dc_flag)
 	cleanup_dc_dpms(data);
 }
=20
-static bool support_dc6(int debugfs_fd) -{
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-				buf, sizeof(buf));
-	return strstr(buf, "DC5 -> DC6 count");
-}
-
 static uint64_t read_runtime_suspended_time(int drm_fd)  {
 	struct pci_device *i915;
@@ -621,21 +515,6 @@ static int has_panels_without_dc_support(igt_display_t=
 *display)
 	return external_panel;
 }
=20
-static unsigned int read_pkgc_counter(int debugfs_root_fd) -{
-	char buf[4096];
-	char *str;
-	int len;
-
-	len =3D igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(=
buf) - 1);
-	igt_skip_on_f(len < 0, "PKGC state file not found\n");
-	buf[len] =3D '\0';
-	str =3D strstr(buf, "Package C10");
-	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
-
-	return get_dc_counter(str);
-}
-
 static void test_deep_pkgc_state(data_t *data)  {
 	unsigned int pre_val =3D 0, cur_val =3D 0;
--
2.43.0

