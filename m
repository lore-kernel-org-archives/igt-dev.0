Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB29606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 05:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPX9+zn1;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=B234dj9R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F0310E431;
	Tue, 17 Nov 2026 05:18:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8713B10E431
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 05:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794892624; x=1826428624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9UMSdB3S0TuohhIVnjrbVtfrT9ThXvLoI7U2CEqrTpg=;
 b=jPX9+zn1YKlGEbnooAEPb8Mw548n8Q0umEHYKVSSRokC7x2LOv8Tqekw
 xwXtnejPA7x3beGyrAZWtZtG6LZghfwLe4b943NQ0GmX9pVq4oCUJ1jlg
 xL5MTo5kBP6RpKMoZlhl+UIYzJFO362bOqI2M9Yww0GpgdDPLGacgOcPO
 VKYNebP4NYM1PbmtN4q1o8SIeEKtmKDLqWiBFb0H01xXXRjxpy1k3tYVH
 eVtxICBv9QriSMtANrLzO74byfS2ll7n8ie1o8MHXSiuaDBVYfJJT4kaO
 nHhoa6C0XiG0zXSBzNQbbIRGU42tqvBz/VuJwoTOTU7bBMTlAaZ79FXbx A==;
X-CSE-ConnectionGUID: 6ZuOsjfoRNCQgn3hVlOEUQ==
X-CSE-MsgGUID: 2i20WLg3QCCnEZP3WS/SPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3525588"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3525588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 21:17:04 -0800
X-CSE-ConnectionGUID: cTKrHHEyQbaQ7WsiEclnpg==
X-CSE-MsgGUID: E3Wzaa1dQQiVMldwuNg6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9859809"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 21:17:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 21:17:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 21:17:02 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 21:17:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciI5UTWhl/DkYBySarVRw0/dWGNyXmUuuRyV9hD9Dq4Xja/Z864CWUykYZqkSYWUhEocL90FjEjf6cQzFjT69Js6/WPSwtTHU+inybLyJcVbAYZjODfUJkENNqVJjSAUbrhK8s/DAezXtboAT4NTMnm4R3EQcjnilO7ID//KTx+drMQsZkrcJTcXtVdZpIXviX/+y2cvk1smvqvESbTyC7hIHBIPH+rDvsQ/w7CVbbUGJ7a9R6mh5iKq7XVJJU4KFmb4CLbAmndIf04Vwk+jqA5tAUhznMPnjBwIoV6qJm2EA5rBawDhUHFtxtuIT90mwtC5VVZRDaSYm2nI/y1K8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zs+se+ZLyX6K1eLujmUTao0snmt4yjZ2mxeR7GzEZz4=;
 b=I4pmf2MzBl+zwTEiZf6zWbHq6wnDkz/OLaPivJwAsA43fpLbXlTd3McTg11j/m7hkdvF7/Xxd7/M0+jeWcY4PtMYjBOizF5ZtuoKl0ZcoGjDo86mdKNeXUeJjQjTj6etfwqGffqEv9DAhf28odwYVTsq/qnzPOU4EvhVcQjU5j6vEbbJrjjQO/71RFk4f9TVeYb02IgKhEgnNla1nXntwbaRH17EBodWGgF9ZHn0xGhGaidc+YwxW8Sy3Ljb3bCdVSD9c6s+w2Q7IseaUGV6gLxxo68ByP6YWpZ84ctOYPT+VNsLvYBhgc28zAZO4+3c4/l229iEPqQIOQhKS8dwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zs+se+ZLyX6K1eLujmUTao0snmt4yjZ2mxeR7GzEZz4=;
 b=B234dj9Rx23HPdct3O49p5AxfIzjkXMWZ+PXxA8X/yuEoGzttvCbm+MGK1NTK3qBW7VF8fhMzv6/2Rj6Quqt0lVGGRbgLb8RYe/cehNrL9gykEAbyGRQl8NVXwEDQoODavhydzLVxxwyz/3NY0qIAWqTpsr20yDOhnDbEE7ZDuU=
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 05:17:00 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 05:16:59 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "B S, Karthik" <karthik.b.s@intel.com>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
Thread-Topic: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock
 limit for non-joiner mode selection
Thread-Index: AQHddaw81LOP/v2gp0aFy5ZSlBaKBbcxuhng
Date: Tue, 17 Nov 2026 05:16:59 +0000
Message-ID: <PH7PR11MB6796E5A086E9CCAEBEBE1A22E57B2@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261116091832.1312335-1-karthik.b.s@intel.com>
 <20261116091832.1312335-2-karthik.b.s@intel.com>
In-Reply-To: <20261116091832.1312335-2-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: karthik.b.s@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DM6PR11MB4625:EE_
x-ms-office365-filtering-correlation-id: c8bf63fb-e415-4a56-f651-08df446a0194
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|10070799003|1800799024|38070700021|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info: Ol6FN3v6ON7p82TMC+ANpt40u5i/8zhxXExtJYEy2wbq4Wi2DUeTQ0dAsLEm4Q6xxn/jLSlz+/pvwMrq1Y7/6YlqddHnjpz1IBcIZnZjgqRD+RMqwfbv60cL/Cm73NL7j8n0OFs1yBnEUZHYogm/Dy2Pr2h328NQSV+rM5yK0GteXr4YTsVPdMTkh+4NoGXSv2W8OEBJr7mvjHR+0Ut3sT22FK/mKkBruDpZNS1u1P2yxVyAj/FB6AeO10/xgNMBCEe10RyTXDzhkZIzOQ2k7GtXdDFLERmGbv2zb857GAtc0w8GfYehYnA+yyaM2mBKb0xAukQtH+zP/3o5ArbwTbqvh1qgo4LV4yyc7XLkZmu8C80E12VVygP4nhEu/viCh9TPfcvvMr+fgaOW1GoRnRbSJonyyGfH1ZzBDmszukJgbsqJ3rLAeGbAAuhhQs6JxC8cLTb0UkJ9g+WpROOT4hniuqEXqGBITTQaJu6paH/B/3oNvIdvQEzOesw00b+MvPDhb3UdxoPJVXlx4GWvtEBRIrpkHSp2nRgxBlB/citQjCT5924TuLTYw8qDkKHc5wObest0Ysq4Rgo6TV24aNrBI4+JFm75cpW+ETn1diE+4eBL0tXwGnsnGEBn2n2+ECBFgBfATzl+BCJgr94uwDlhnsqC69o49btAo9gv9fPGJoE2TTHSTnxjHblkSmOOpr/n149WmCPdDe/H6Q663miTdxgIR2aPDQ4jQjuTkns=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UVnz/AI7O9piGoL+T/znQ4gCRGiEOoiOrJvc7IDBfNz6ql8q4XEsAUdnEXa5?=
 =?us-ascii?Q?MhvkLymgqzZ4rQOpdEZSwQWhLLlVZoambIekurtUc/cQsoYzYuE9YFfphghQ?=
 =?us-ascii?Q?8i1S9pkQ/hyhZeTCZ9NJNJdro9MyZJeiDqdT/U20x6YhbBkQNKUnIC15UOE3?=
 =?us-ascii?Q?1Q5G+7rIBzynbBsln8kk00QWqCryzbiFMTf9oOXNLmmhNVzS+44bdYACuqCd?=
 =?us-ascii?Q?ewrdjdGSNhIT/O5Mu7H48RIRXQu8FxeaBWL1/IaiGqhRt4tZhiltzQwj2mEz?=
 =?us-ascii?Q?LgH6wJ5SGcTAkQuHXgfQRlwTq98cPv7i4UoesrpONh3nzCJ7f5x2bXQhOWlN?=
 =?us-ascii?Q?wK4zdXt852ipgmwZQXgBKhXoPuDI+YjXFXDKcj6MzOsNNTnopBFPHK7prB62?=
 =?us-ascii?Q?niWbEAsBfGxiYP0Rkauu0aqt1CXEPSo1aq4TXVcfldoXQ6e5U1E4ZuJydxI0?=
 =?us-ascii?Q?zVF3v7gtRvyV3GRJYMHuUd0RAMGqdHJCbu8QYKsPZIKC0pHLm+CegnPfNLHY?=
 =?us-ascii?Q?tS0lCaPhZG7X8y83h/w18nCvxnwqgEXreVMYko80I12Iud3+4V3PLU42FcJ7?=
 =?us-ascii?Q?yeUGmVrIhb6wpaML3Ldq2Ry+IXT32paapADwIQtjv7gf2HUrceto/Y1gmA7l?=
 =?us-ascii?Q?FIdog/UY8JZDh+aJEmkEFdlehYZ8EEkOJGUHTO5Ced85h/stKZ6NTLbrfjC5?=
 =?us-ascii?Q?er1vnjgmrhMQUuiSiwPS8m7R8/NWomHI67WYiqoBx29AaqKbnzkSgWvM47S0?=
 =?us-ascii?Q?cw4pn+FhW99pzQpMY+xOHtvaVp7wNkPNzI4mPfDAcnuDIlTRsz/PiJvTvjiI?=
 =?us-ascii?Q?z1lPOhWV8fVv1rs9cmivV7AVy26WGHeFNPtTgIZarJG4Wb63Hlonh7xMye6J?=
 =?us-ascii?Q?064x1s3k/x+nGaiS6cl8nzbd6JX7BQUqE/cbvXtUu/ipYRGlfSE059dTIW8a?=
 =?us-ascii?Q?BKtpULkWoMhLw2b4q6xQRrs7ck3moSWWR5gTADI1yrKeH6+xvUwHkqv0UV02?=
 =?us-ascii?Q?QlvPYeaDgboKzY97oDXaC/wpawYkU9Z+d+P5TjlIkL90bJjktREZS/a9ZHyI?=
 =?us-ascii?Q?/WtW414uqVmvCSMF3MYSNh+hXPnq9u3ZQfFxSsRbfSzN+JDddiJZ7pY8tF3u?=
 =?us-ascii?Q?Mu/lD+U9laXVxQlIQN8BD3sDxIRlKk6uITeU+frxmlonG8k46k1DK7OctJoH?=
 =?us-ascii?Q?eWOxerC0M7CDSNOf/ODtK1xSFHnU/6UngYVu6NdMj0OsFbLk40P7S2yY0kFi?=
 =?us-ascii?Q?zinyxGWNwdZvDR4t/amPDZChHEFPOVWzZ1R7kt10BixvhmqE+if2/3CbEnPn?=
 =?us-ascii?Q?QQ571SZPIsaw5M7phRisO0vU5Jj/yl2Ql/cXz+tTvvV9ZH5IKhxqpNvcgJ6Q?=
 =?us-ascii?Q?3gNFxGNXl8cUZKOz2U55A6vugSqzRpMjou5sZAKlxtV26+80TNvYmJUtPCFk?=
 =?us-ascii?Q?JpLw/KyEIwPIgOQNuBXh/J3IJajvzFeOYUweC9IdC2WqBsr1/P9BxhoXRqzx?=
 =?us-ascii?Q?p1ixVKsdzG+YrLsZR07QcXZn/RpjqUdvJ2xzNIuxSlMdYM3oQXluRpTZvm3j?=
 =?us-ascii?Q?0lH2gU5Z+2gqeneX7aRVsZPLK7/BllkHncyko+rigdpCXYptLGHwtc3AjQX1?=
 =?us-ascii?Q?hiuhR5WV9tIt+LkIj59opAmcu4BBmKumuKeBHo1DwIpl27UPjnygSU1nF32L?=
 =?us-ascii?Q?wvk7KP3dTcCokag1TMPL4fyabdGnse+ABBZzJEUxkeDUSV0ofIHVyG02dxTY?=
 =?us-ascii?Q?8uOCdSKeNXeYXx7s7RIbmR+urwqfu4IG3w5jaGOo0wCjxKrRaitv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LfUEYqHotrwZ0h/43RIvL3KMnUMsXyrbCyMuP/7PFhbjBhQHnpg5O8KLow0XPWgYdx0yjaue40pf3wrAaUaUORoSd37QoO1Hoz8rg4ezVhat6JSoBskzskh53VR9Ar/Et8onnG7aGJHE2xniJ3HQAFE7dPFlnoU698+xqhBnGDHomacAPYCrs1wRlHMU7qFp8p7E0MG0WBmckz3qKHhfdp/SO2S/SkXCsDSQWmQn/y1MUxRHdjekkmyWzGnqoIjkcSztxXF7u2EOLImqNGs4ve8DkMInElsKLg4kl+/ubf6GtukQ98aH4xTNu+OJDp6nFB5LPNyWr0lvSJ+2L3FXTA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bf63fb-e415-4a56-f651-08df446a0194
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 05:16:59.3545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwJzfBPqR4OBqjORL9puo/kHmyA3UCprdUol7YRkn4FZfmq3z3eg3QxKXJLCYRO0OjaIMCdtETT19eyFeoSAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi @B S, Karthik,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: 16 November 2026 14:49
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Nautiyal,
> Ankit K <ankit.k.nautiyal@intel.com>; B S, Karthik <karthik.b.s@intel.com=
>
> Subject: [PATCH i-g-t 2/2] lib/igt_kms: Add max uncompressed dotclock lim=
it for
> non-joiner mode selection
>=20
> From display 30 the kernel limits the single pipe pixel rate without DSC =
to the
> maximum validated frequency, which is below the max dotclock derived from
> CDCLK and reported in debugfs (see intel_max_uncompressed_dotclock()).
> Above this limit an uncompressed mode can't be driven by a single pipe.
>=20
> intel_boundary_non_joiner_mode_found() only checks against the max
> dotclock, so on a sink without DSC support it can select a boundary mode
> which the kernel drives with joiner.
>=20
> Add intel_get_max_uncompressed_dotclock() mirroring the kernel limits and
> use it in intel_boundary_non_joiner_mode_found(), so that the selected
> boundary mode stays on a single pipe irrespective of DSC support in the s=
ink.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++--  lib/igt_kms.h |  1=
 +
>  2 files changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 915c6a8a2..b28647696 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7207,6 +7207,32 @@ int igt_get_current_cdclk(int fd)
>  	return read_and_parse_cdclk_debugfs(fd, "Current CD clock
> frequency:");  }
>=20
> +/**
> + * intel_get_max_uncompressed_dotclock:
> + * @drm_fd: drm file descriptor
> + * @max_dotclock: Max pixel clock frequency
> + *
> + * Get the maximum pixel clock a single pipe supports without DSC. This
> + * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
> + * limit an uncompressed mode can't be driven by a single pipe, so only
> + * modes below it are guaranteed to use a single pipe irrespective of
> + * DSC support in the sink.
> + *
> + * Returns: The maximum uncompressed pixel clock for a single pipe.
> + */
> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock) {
> +	int dev_id =3D intel_get_drm_devid(drm_fd);
> +	int limit =3D max_dotclock;
> +
> +	if (IS_WILDCATLAKE(dev_id))
> +		limit =3D 937500;
> +	else if (intel_display_ver(dev_id) >=3D 30)
> +		limit =3D 1350000;
> +
> +	return min(max_dotclock, limit);
> +}
> +
>  /**
>   * intel_get_max_pipe_hdisplay:
>   * @drm_fd: drm file descriptor
> @@ -7340,7 +7366,9 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,
>   * @mode: libdrm mode to be filled
>   *
>   * Check if connector supports a mode at the platform's maximum single-p=
ipe
> - * hdisplay boundary.
> + * hdisplay boundary. The mode clock must be below the uncompressed
> + single
> + * pipe limit, so that the kernel doesn't fall back to joiner when the
> + sink
> + * doesn't support DSC.
>   *
>   * Returns: True if a valid non-joiner mode at the boundary is found,
>   * false otherwise.
> @@ -7349,12 +7377,13 @@ bool intel_boundary_non_joiner_mode_found(int
> drm_fd, drmModeConnector *connecto
>  					  int max_dotclock,
> drmModeModeInfo *mode)  {
>  	int max_hdisplay =3D intel_get_max_pipe_hdisplay(drm_fd);
> +	int max_clock =3D intel_get_max_uncompressed_dotclock(drm_fd,
> +max_dotclock);
>=20
>  	for (int i =3D 0; i < connector->count_modes; i++) {
>  		drmModeModeInfo *current_mode =3D &connector->modes[i];
>=20
>  		if (current_mode->hdisplay =3D=3D max_hdisplay &&
Nit: Something like max_uncompressed_dotclock would read more clearly next =
to
        the max_dotclock parameter it's derived from.
Regards,
Sowmiya S.
> -		    current_mode->clock < max_dotclock &&
> +		    current_mode->clock < max_clock &&
>  		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
>  			*mode =3D *current_mode;
>  			return true;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index dfcb91e02..c0565479f 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1381,6 +1381,7 @@ void
> igt_sort_connector_modes(drmModeConnector *connector,  bool
> igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
>  			    igt_output_t *output, int bpc);
>  int igt_get_max_dotclock(int fd);
> +int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
>  int intel_get_max_pipe_hdisplay(int drm_fd);  int igt_get_max_cdclk(int =
fd);
> int igt_get_current_cdclk(int fd);
> --
> 2.43.0

