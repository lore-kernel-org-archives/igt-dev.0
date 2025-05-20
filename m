Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF2BC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 10:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F9310E41F;
	Tue, 20 May 2025 10:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVZVfNgC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2DE10E41F
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747738038; x=1779274038;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=brxyzfv1YV/5Z/Go4KKnNqev4sEbyh4gip2CwY2QNTM=;
 b=IVZVfNgCVoK9MFHJAPFEGN12oVU+yfPEfw16ZgDjyDZfIc9dmc6R36Z1
 LD1fq3Vi9SGNjsZ0VZoG3h1RiF0BRtyKfeMeCnIYBeGgTVOp3rbBdRS+G
 ekZWV3FIM7OrCMbwSxDMHx7l3tu/b/M9lL9izMVJGX84hImQj1ypOxNV+
 1iulP7L1+n2bnm9s22z0nPnR5OqED+/B9AM5L5JnS+oHaNFsgg1IllfdU
 IyhaJIkr9i5+AWJ66F7Ra8z0iheqmBhtxP1wDwiEmxbyfPGab1gWgWNjO
 kA/Hq7nr9zCm6JuZagGD2YJznW+Y7aqsFOKSvdAYbd/7sOTnYo9Xq7C/R Q==;
X-CSE-ConnectionGUID: ce/3FaFdSlyljHEMQPDJ/g==
X-CSE-MsgGUID: KG1aZFnGQQ+ueLJ3406obw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60703005"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60703005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:47:17 -0700
X-CSE-ConnectionGUID: lmG0yDA3Som7FXeMh/qGng==
X-CSE-MsgGUID: GJv7/IsPSD2HDwV52jaVoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144644791"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:47:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 03:47:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 03:47:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 03:47:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q747Zr01DP2RRQh5AD+wumeeLYaKP31YYRd45kDVGRYTbpt2NQtZnAerkmvm244PA6FctcQBp3K15II+XON5W97ZmDyWYSCuTQJKuX5Ix0CAOigvGE+nJZwGSQPAbT9GifIzcErtQ44iCDo220LooG4ueAzhYdRa2oAA6q50NcDworTXPhxN4MyMbrtyIpMFIr2rXIElwPkwhdI4jnUKg4zOr/dvp2KmG1x64+i3qMceMAR4Do1uLXZBo7F0CVNeT6oxbOjjjXYuzQq0+ziUsPsBrH0MhwJABI9PvqEPzUqEmqsCfv1aTkRH+QUMJ0ilPdVOR2mcjjEnUDcKT5Yx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlDsyqEkYT68de1vs6Rs6i8mPwsTAWbBrG1XfVOTJRc=;
 b=ZcN10L4+pae9dLsfCTYyYy5PHYoUYxEbz1ZddGzaW1BedynXbrYxzmdnXxcFoLqxLwrA+apRlVS/0mrwAzahJubTeRfNl253tJPAyLSfqvOdzCbWTorBKFfHrrNjEehyfB20yzE+WmVLnoHWKT+BZAtI9UmOjZivAl7afnUp6cJ8CamVyfSlr0GTQR+uwV5EuargrTsy4I30tO/VCMOxgV2gvRQ6j0WR0Cuu2/+Y4d/ZWHOl2JvDjODA8wzzNIyCdd8U3Qrs5x8oaRZc2XjpsLuZyuMQtKVbG3oc186fLgHybFegaG67Pi3aBxDv7trg//aqOtaWwkdF0iluWtRX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 by IA3PR11MB9275.namprd11.prod.outlook.com (2603:10b6:208:57e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 10:47:00 +0000
Received: from PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::1c5d:e556:f779:e861]) by PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::1c5d:e556:f779:e861%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 10:47:00 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Thread-Topic: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for
 Eudebug
Thread-Index: AQHbyW/xJfmk2lFRIkOVWQFKVr8Fs7PbTk5ggAAGgHA=
Date: Tue, 20 May 2025 10:47:00 +0000
Message-ID: <PH0PR11MB5949C0DC3767FB0852CC48C8859FA@PH0PR11MB5949.namprd11.prod.outlook.com>
References: <20250520101400.1522-1-himanshu.girotra@intel.com>
 <PH0PR11MB5949774F8E0628E2CEAC45BC859FA@PH0PR11MB5949.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5949774F8E0628E2CEAC45BC859FA@PH0PR11MB5949.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_|IA3PR11MB9275:EE_
x-ms-office365-filtering-correlation-id: b815b4c4-3d3d-4eac-f203-08dd978ba647
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Jk7ze1hnVLV3PPs9YVIUxtkmpIpCwGRELGYctMdJAc8eJx5vegmH/dm7yUAM?=
 =?us-ascii?Q?blQlxm3MVt//cBG9WIMuH0cZPv8IEdkl1fMSmePMDE8PI0yc2RnSQdO8wMe1?=
 =?us-ascii?Q?s1T/ae3wCoWPeTaA6VH5oOGwoYhWZSLTe7/i82M46J73cafX7KwMvgF7LV02?=
 =?us-ascii?Q?/owXyyvaVIRkFjnPGIHTYAfIomX+vdrZsKfZSm20kfMZuF8POpt+Ms8jJcTa?=
 =?us-ascii?Q?ICGGLfZOylC9Ca2h8WmtPTushH3HhWYjyHG3Wjuju5ZfDcbQhO55ecG4UG98?=
 =?us-ascii?Q?x01fNz44uxG2DNQSZaHxZc6qzvAZRcFFNwjtNR8TcNXbUMPdPm8OxmMah7DU?=
 =?us-ascii?Q?RZrye1EjMIbAJ5BsH4HcnnPbi9N71LiPltXo7jd/qKp6TCMZqNcxBevwYOPa?=
 =?us-ascii?Q?8obOR14avRfIrH8Adr8IXO2n50bF+CSOsPESwwVRv72TRIe3nt2uHTljSU2p?=
 =?us-ascii?Q?bLQ21vS7oiCSq5rCLNzYgvKPfq2dIfmpp8yPEtsBWajShZ69DiSdIUre5tBN?=
 =?us-ascii?Q?sSJOyT+LIgBKZXkA/27SwMk2GdUl9guS7/TmJX+1ZF0g0KQ6GD7gcNm/ftUL?=
 =?us-ascii?Q?zryrHDpjsSo52onlcgEiKwGQMo5E/U7fcqroexQh+clsrUSKMsVjzPAzTVQ0?=
 =?us-ascii?Q?2lbKFjzYCGn9cTV5JF7lJrZ01FAl7MpweE5KJ0XX/DYP0p9vwjNnj4vFKEkI?=
 =?us-ascii?Q?HHLTGcXlCmwAoDb7v+tKvu03teH569yCQSTj9M73lavjN9yDeXZLFlxeI0Oc?=
 =?us-ascii?Q?hYQs4fD8VGaYdga+FPpzvTk2KrJH2iOt2P2cZ6OmiHwHSJeu+rOc2s157hzS?=
 =?us-ascii?Q?0CPD96TSVQugGwma4LIAi5PEvh1aPWbY9/UaTpO72kCgnKneTty8OesazCW6?=
 =?us-ascii?Q?Tted787JJ2STvkVl1wBCWjuBrjOsokxKZK7I9GuFNBYO5Pl+i9584uDOBRn6?=
 =?us-ascii?Q?HwYXkvqbMw5nHVWnaGTrL+3LlEumlC4wn0Ambled2FuGifz1yliKRJRf0N6R?=
 =?us-ascii?Q?ypNUoj/Jr81iF6z4lgBCQ8l+xj6GYfLBNDs9WHX7FQkQ/6o7Onpz67EZnxBb?=
 =?us-ascii?Q?VCeo4WU2AzY7Jb4URsxXLOSaUZi3VaLIEkTT+mfJJe0mm1sm8usgXn1/9pGn?=
 =?us-ascii?Q?iQbK7YA1Xv9z5O7A1gHuFPC6bn39MA5iCik/WEPYjI+p662dPigBUeWL0wtd?=
 =?us-ascii?Q?CnG3EphRqN2qs4Aw8UhQSWt0d0Zh6zdeOzID8DR2Vg5y8eFUG3MAD95njdqs?=
 =?us-ascii?Q?foOqNTZ05KRK8aVOdO5/KoNSO/pyc+BNvlVom2F74SXcLzduTUxpjIiVoS2s?=
 =?us-ascii?Q?LndWcBuxry4wvVvMSfMX1+CsLD62ilFY6n8GYb2wPzHbUWL7LbiNErKDystE?=
 =?us-ascii?Q?Tl5M2ntKyoOO7rnc5aMTkEzXek1zKmEMxDxEOKZvLyo8gBso1icWoAXU0T3R?=
 =?us-ascii?Q?wSw7+D66c4GmuvOhFqhWxjKl7OWq8yiY8gkQjGqeksxvOhHLgzPHNkpRwk74?=
 =?us-ascii?Q?Y2tQYJfR/Bo0lgQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5949.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lCWv4ragrAd8noMQmWW6hKJCdEjPwGYfPERJ+YNBu87taAf1SDFCG1by1+qS?=
 =?us-ascii?Q?H3Yj9hiPGZK/DcLR+qGgZkn1Iaveaa6+DCVwIsoJlskL7h+9gllt2T13iOBZ?=
 =?us-ascii?Q?BtleslXnifKtThrsyePfOLnUY0UR0lkVJ1aAZv5NrPjT0IfstJGorejaoRj5?=
 =?us-ascii?Q?Rnc82kZv+ab/+N9FdHcutIaUJD2DuRpoluTA+sA9+JHRnEvCTpNR4eGzz88/?=
 =?us-ascii?Q?NLhdmld25542RpJLWBPdkUJDNBYWOe/oyn/cyPvyT8sBHTo3w09pOEMipWDz?=
 =?us-ascii?Q?oPpebolYUyraFTaoAU3un27n+5HR9hRkcNfhqHSvyrn8q1IDP1VqoyYKplVs?=
 =?us-ascii?Q?CvUbv/S7nBjVcjp822zP4ZovKXW4AwVClqijUqhy4XWvb3QyBr4c+nWH7sKN?=
 =?us-ascii?Q?BVumNNS9leOqwTgv/4/EStCUSa47yizqGywezOxnk5JbZzs6GuHkVyuoW4Zt?=
 =?us-ascii?Q?5/WXQSNJn/wI5nbSMu06XKHuaiFGAyzOk62WeCdAxp812ebHlxBm320k3Kq5?=
 =?us-ascii?Q?/E+41hCbx+Vv37xxyfiuiRM42FqlVAHLkjN1Rpo5Eo336F6mH9Lt1yOTiWg6?=
 =?us-ascii?Q?8z/ry8XEKm0/RpBQoAIvkD1y8mNixTYXk8txXb6Xo1G6pQAs9tUE1epb1bwk?=
 =?us-ascii?Q?2DiofGJYbjP6s0GNt+pqga8Hlzl59kQ8kzByECTpFi1gMa3G7NwdlItlJdn3?=
 =?us-ascii?Q?ETB5lvntkHtFHa4oeXnaNAiKTSisu8dItA+ULO23/dPBtaDNmhg18BVr/MzA?=
 =?us-ascii?Q?mUAPHKsD2V+BC/oBfucuNwbjd93hK6tjp8wY3NVN33f7v2N5G0S3GUC2sOO4?=
 =?us-ascii?Q?AzmgK8oNp+0exuWnlF+q7Mia0KMQQXORtKgeLAzgXxkj3BIq+dYgxHE8hxdw?=
 =?us-ascii?Q?tvZ9yjpC07ms+EYbk0d5wGifPg00u/ba+3+CNN/a5YhGT61DLolCGGbPxaqc?=
 =?us-ascii?Q?EXSZ99NWDc0SHE4ybVs2jpY6bkwkhi3sEWnct4UXdy7ixAt02JuIHXwpDBaJ?=
 =?us-ascii?Q?/xVQahI2W3r1WkdpRcs3Hlpwm0ooBnBv3HkZoDag7HAWQrjogkBPaVLMhEVH?=
 =?us-ascii?Q?P4p+YQHwmsvK2+OHq+otkNBAPpKEhIvJT4vmLB8IWWJVqGncBESOWDlE7jwJ?=
 =?us-ascii?Q?nM/Bnw7VD528ohlHG09np31po8C3wk2HgYY7LSuvPyde36M1Khf8jMrdiGpa?=
 =?us-ascii?Q?9xS96GH5IilPMgI9DrUTtRqtmuNm8LJrjxHFUNBZnX6vmBuAmfgnGNR27/BS?=
 =?us-ascii?Q?uptNCacYrr6VcBS+I+xixRQcITYN9kvVCuKAE4uX1amI5/0DcUFi/68dTNiS?=
 =?us-ascii?Q?uEaUw0r3TVgQpTRnYxg7p9scvNewW2pGK2J09lXGpw+i3c+H6wFdcY4X7D6V?=
 =?us-ascii?Q?mQEWYiLcVzPbnW4tXf+DDfXVj8F+2D+DDOda27qtcep3td4blQeQsskKt/E2?=
 =?us-ascii?Q?REolLO41AqnUECUzuMPYZGXneR8evN6/eEppyKlcus8IZfAhsms4D8qDWRMQ?=
 =?us-ascii?Q?3BIKhNJmUxNExsj0ZOVi9n3vKpCKv4y1gsd/YU6VXQ6UGdL1g4JgTxZIiISk?=
 =?us-ascii?Q?/e2KCGa3R1dOwX04EcbPHxVqp7nwFB29pcFeh2KO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b815b4c4-3d3d-4eac-f203-08dd978ba647
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 10:47:00.2388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4RYBH9C+eZUxrtMEzibXt9/n7VOyxXmvCCwHT5Qa5+cJGFcIh6mK2KI65A9uZZEUgkpALlJOyC8PUJP40cNuqbWylkYiQGWqBxkI55+qtAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9275
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

Please fix the missing .txt and then proceed.

> -----Original Message-----
> From: Gandi, Ramadevi
> Sent: Tuesday, May 20, 2025 3:49 PM
> To: Girotra, Himanshu <himanshu.girotra@intel.com>; Piecielska, Katarzyna
> <katarzyna.piecielska@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH v2 i-g-t] tests/intel-ci: Add platform Blocklist for =
Eudebug
>=20
> LGTM
> Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
>=20
> > -----Original Message-----
> > From: Girotra, Himanshu <himanshu.girotra@intel.com>
> > Sent: Tuesday, May 20, 2025 3:44 PM
> > To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Piecielska, Katarzyna
> > <katarzyna.piecielska@intel.com>; Konieczny, Kamil
> > <kamil.konieczny@intel.com>; igt-dev@lists.freedesktop.org
> > Subject: [PATCH v2 i-g-t] tests/intel-ci: Add platform Blocklist for
> > Eudebug
> >
> > From: Himanshu Girotra <himanshu.girotra@intel.com>
> >
> > Add blocklist file for LNL/BMG and core blocklist for debugger
> > functionality
> >
> > v2: Add files to meson.build (Rama)
> >
> > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
> > ---
> >  tests/intel-ci/meson.build                  | 3 +++
> >  tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
> >  tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
> >  tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
> >  4 files changed, 18 insertions(+)
> >  create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> >  create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
> >  create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> >
> > diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> > index
> > cb775e2f1..84bbdabc6 100644
> > --- a/tests/intel-ci/meson.build
> > +++ b/tests/intel-ci/meson.build
> > @@ -9,9 +9,12 @@ intelci_files =3D [
> >    'fast-feedback-chamelium-only.testlist',
> >    'meta.testlist',
> >    'xe.blocklist.txt',
> > +  'xe.eudebug.blocklist',
[Gandi, Ramadevi]missing '.txt'
> >    'xe.bmg.core.blocklist.txt',
> > +  'xe.bmg.eudebug.blocklist',
[Gandi, Ramadevi] Same as above
> >    'xe.bmg.display.blocklist.txt',
> >    'xe.lnl.core.blocklist.txt',
> > +  'xe.lnl.eudebug.blocklist',
[Gandi, Ramadevi] Same as above
> >    'xe.lnl.display.blocklist.txt',
> >    'xe-fast-feedback.testlist',
> >    'xe-fast-feedback-chamelium-only.testlist',
> > diff --git a/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> > b/tests/intel- ci/xe.bmg.eudebug.blocklist.txt new file mode 100644
> > index 000000000..661e3122a
> > --- /dev/null
> > +++ b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
> > @@ -0,0 +1,5 @@
> > +#####################################################
> > +# BMG specific blocklist for Xe EUdebugger tests
> > +#####################################################
> > +igt@.*@.*tiles
> > +igt@.*@*multigpu.*
> > diff --git a/tests/intel-ci/xe.eudebug.blocklist.txt b/tests/intel-
> > ci/xe.eudebug.blocklist.txt new file mode 100644 index
> > 000000000..e13a5cc2b
> > --- /dev/null
> > +++ b/tests/intel-ci/xe.eudebug.blocklist.txt
> > @@ -0,0 +1,4 @@
> > +#####################################################
> > +# Core Blocklist for Xe EUdebugger tests
> > +#####################################################
> > +igt@(?!.*xe.*eudebug.*|xe_exec_sip.*).*
> > diff --git a/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> > b/tests/intel- ci/xe.lnl.eudebug.blocklist.txt new file mode 100644
> > index 000000000..cabac8858
> > --- /dev/null
> > +++ b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
> > @@ -0,0 +1,6 @@
> > +#####################################################
> > +# LNL specific blocklist for Xe EUdebugger tests
> > +#####################################################
> > +igt@.*@.*tiles
> > +igt@.*@*multigpu.*
> > +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> > --
> > 2.40.0

