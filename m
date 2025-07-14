Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE389C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 22:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636910E4F2;
	Mon, 14 Jul 2025 22:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2NbPzVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3DC10E4F2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752531140; x=1784067140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G3eglxr6t9b2bqqdvikA0j6Kdi8aH4fMVhbesu+CQwk=;
 b=d2NbPzVTtIkCU8wi0pG2j/4B3wHEBdIuRY3DKqsZdJtbEav7x/oVi27H
 Em2QLZc0bar+pPjoQNPL3iAmaW5YUJ8sAi5NgnRSDLCIoX08J9FPkqiO6
 8ZN2K3eNxMcm0vfkDrWbAU1up+5EYQTt2p8sqIBws34bY0ARFCd3FYpDa
 ThWSKFBeDyx8mx/UuyFHtOXLsu68w3bZIeCed/guGIhNbazqOmRSr3GiT
 BWzFeR/PMDbOrINcn2u9WwO6VLTv26ymnKawzPGYC2fUbWFoMBNYEaDbZ
 DJiOTThz0f3uyX70/+f5xb3bcvkJJnnyxWS85gugi14dSzl6hiDa3n7Xa w==;
X-CSE-ConnectionGUID: xsOx9VBAQb2HX1DSEBzXwg==
X-CSE-MsgGUID: Qs31+wGkSg2sFmVV4EdHOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54707970"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54707970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 15:12:19 -0700
X-CSE-ConnectionGUID: jUw0NVy0RBOAlibOkjGFeA==
X-CSE-MsgGUID: KexJVvhgQMiOZuJhCBGAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="161587119"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 15:12:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 15:12:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 15:12:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 15:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbJGZL/+nSr2qzUBJcvRfmbz7RXhqhOT/ZUaB8Ht1aF29zBud4bZB3S+waRIORjUSWorOQWp4OUKdKeDSbgG9rt4krnakKC+t/Gop4mxbtXWHvaIz5EE2d5SNwPDTBHRDVXXsF8b+sRXrOymS73oB1OyKpcLQ8SYyybdhmRQdoezPA892tvunFjsa9Jc5H/t3tYZxj28u+CyzBsQ9w+vNfolzvJ0jY0fjigzqTxJBfCwV1OPhNHtOv7rx/Z+hxP+7gsEylYD4WFnbTeSJnm8RDPr7FN+k+UTuDcYBpqpLur1LEofaswVc3++oJGE03FaEyZpLZSZHHz7yem3frV/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qwb9kxho0rBc1awN4iIP/e9wR2SSWffzsYoGGpdZDkw=;
 b=vEzLybSA1rFEH2ZypBMYkDEbcrIQgQxQ8UvNPdx71Fg14TubRVFLNFptgSqG1mAoRF4PlLV2m5t1e5XAL1Mjq9LIqsC5fXgJsO647Obq8IEbz5wBycPjFdJfcZ8l8lP/ugOrpbTbFQ6ugP3ES8ocZKBjoGqmbmIfOr5uSwQzov+9ROZSFmG/9u9tbxN8+VWbi8mZbwtI4vorfhTPh3ymfOxDu+8tLjeSEM2hXk3CJL5b49D3iQYLREoRg+m29vbnC2nm9lkwGl2PK4y6rsC4X3G90pNvBI2Eyv2CTSL9lRmZtVRhOSPKWSiseIMpPkr5aTgth4WNvWv+jrE/DUt1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 22:11:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 22:11:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe-oa: Use subslice_mask in
 pec_sanity_check
Thread-Topic: [PATCH i-g-t] tests/intel/xe-oa: Use subslice_mask in
 pec_sanity_check
Thread-Index: AQHb9QW2W4g89TfUm0ym6aEOEjOBX7QyJegg
Date: Mon, 14 Jul 2025 22:11:48 +0000
Message-ID: <CH0PR11MB5444057306AF87FA30CF1172E554A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250714212411.2325726-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250714212411.2325726-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4623:EE_
x-ms-office365-filtering-correlation-id: eae6918d-c08d-460a-cd1f-08ddc3236d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+X8BtAw7oV3utUO6az2gBLGoATfS/pUnA79CfCPdhKbv2c6ksmTVcJUitDTG?=
 =?us-ascii?Q?zOKD+8gC4cRBux1AzfRNanzSpWbqnKkNRUWyXoWzXDreoMnowT4HEIlfAMNE?=
 =?us-ascii?Q?8qpS2FPv70K7PCWbJLHHrjMzP2ub00aJNsljaXht92o+JTifT/4f/eVfyYWa?=
 =?us-ascii?Q?SPv6Pvy2eQy6j/EsUWO/VHBTOw/Xf+Ig6+0zn+5kkb+P3EU0v4UrmfFMQ5h0?=
 =?us-ascii?Q?uFqdhst7pUQBuVV4pHJlQU+Bj16P8sDOb0QkHydiTXBpUeJD/tWjDI8qKWF1?=
 =?us-ascii?Q?hakaCWqD6ewry4RcoztTovH5uGZ9m5NKVFax8O/M/BfoK8t2vxdTRyVUH/+0?=
 =?us-ascii?Q?8o+VNBCQZrezO7jp8DA8xcqbbflEbbWvNGNJ3ZRTcTixgn/bEoQvT06yttRt?=
 =?us-ascii?Q?GeTWZzKrcG1n5LI2nEkrfK7eEMZEXFQ4ti1NulFgl3bkpNesozogQedJMS4C?=
 =?us-ascii?Q?NHCTvvZJNKZ7lNosBnVIlppO6PUzDvF+yrRGg4XYIh0ovH5VbXW8/OZoWIql?=
 =?us-ascii?Q?abj71fowdvaox6F7bS8b4+GcYMNwmmUVEzLVBffL47jtvcu8daes1qI6U0M3?=
 =?us-ascii?Q?F9DxltIe62GRv0ejiPI2I9g0LzKegEWX75RPd5DqiypiZ5takI5E8Yjvzhgx?=
 =?us-ascii?Q?m/KQ8i5btOmcoFWWhMGoYgRMJmx850PECQ8jyE28fstTsc0rkIAYphDhzpRy?=
 =?us-ascii?Q?vQqTfjysdWcH9LxAQCKi0iTHbqQC2Y3i3rtYKZBXOO6MlAuxEsZF7TYteFU5?=
 =?us-ascii?Q?uq7RyoH/R63yQDxUOnSao7mxhCBc74FGDIq/KZU9Mst2PjcLhaWqzcUCrPYV?=
 =?us-ascii?Q?cGIvAG1C6q16PbuMzWFh+y71PaTLv72qiHweVdM6u4nR7NmSMGxcuAW+R6we?=
 =?us-ascii?Q?cyom1W2Ph1QEyDR9vz3cRub7F/MBiC5Xix1qlvh7eAIo5K1wQG4fCXgd4bnY?=
 =?us-ascii?Q?EGrVKt+/cFHTBptn9XG+0Uii/M0bIPs14PZsRZql0u1B6gp9EeUSt9ZVl80B?=
 =?us-ascii?Q?XQJOUW1Uvrb0yuhf4nDk19a/YEos6Pb9cK8wM13jVIfQoX3Bhw57ixtbZNGx?=
 =?us-ascii?Q?XgaR7GwpT/vweMWRc+CH+LzJqFqiiGLIAWDOZQwYAcIIeG8kYCN+JlefMxm8?=
 =?us-ascii?Q?6WkvPRmSqNC8/3UTz8H0opvHVdpAaR7Oh1CLlz3+SEqf3+3hJvrKMO/GudMO?=
 =?us-ascii?Q?1y5rmOQAmGkJ2kJUkC+/1gyzUff0ULO+w+bjnTntceXzswI2cGsX4S2QFBG9?=
 =?us-ascii?Q?9jZjkguNnjSchp+GpgKRzKLImT/vkf3//a9aA5Fo+XjRszN53/3XaFx4pCg9?=
 =?us-ascii?Q?4QF8S6cPuIXp1WJV4gMcH2SaH0YYDiE7HzoTAhH/wbtolpnjPcNuueAPfj//?=
 =?us-ascii?Q?GUlnUlFqkp9LHSfzvho3CFKJROlq/0a4RrEvXq+DLNjdqVaiBA8TxVd1Yuic?=
 =?us-ascii?Q?THohHVgEBudh4GYshqGNAJhHZnDeutrVusVHs8DqaLiVTSW1y1cAlA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zROTCbQym68S/HaI+/63DciWME4ycVgitywkOWhiH5Ncygx4Gsick6haFyTa?=
 =?us-ascii?Q?QqHXtdj7iLxmqIqW7j1ibTeGfzju2L7FObmqpoM0t9Mlx6+q044FAiEogw54?=
 =?us-ascii?Q?fx3OX6gOsgaLTsPvrWw5o/0twED/R1PLvv4txO+gwVEvGFtkjGJIySY+CYQt?=
 =?us-ascii?Q?7+95iL9u0jcFrisJWSh36JsBulAXQuHanjgP/o7AtAHy7J+CAA7GuMBArxHC?=
 =?us-ascii?Q?wwe/U2CJ1dwgL4gaPN2iXMFjEtVDd/BiDLl7482IH9usHeXAwXM9YNjugkGy?=
 =?us-ascii?Q?YqLNymbMXaBT9/l8XzTTwQp4H432yuldvlf4RDHZeKEw+5r/z+PbqfMq+/Lw?=
 =?us-ascii?Q?2mFO5Z0IBT2ulhrqv9J+y9EP2MZbNloHfvOawax7HR77n8vMFQZyOqcU7Efn?=
 =?us-ascii?Q?M+GS7Bkz3XL334mV/1Dp2fPcs4dOiMHTVGaUxLJW9Qf5XV4D92foF6zNeiWV?=
 =?us-ascii?Q?P3V39D6yrso6+QJKOk5E5wn4CopOXtlweWJ4dLQj9uQFEL5ZqBecMc5oD6jq?=
 =?us-ascii?Q?OJG1hBeNRJCOvkHXVqx3Fzg2uQI0A7cxXqlRiiDQdNmI7E2Yufae524qAmq2?=
 =?us-ascii?Q?aDQt2DOXy8g2cQpPvBnMpuUU7DHIZWlXMocTF9f5lOB/8z36FL6+OkJuaQ4P?=
 =?us-ascii?Q?J+Evf7ZvGqTbIJjEYWONstJxZf2NTm+Pa5pA9ZgpH3AUfY5AxeMkT0QBBlBf?=
 =?us-ascii?Q?1XiHYkutMZJDKmeuxsgoTGiFIKasPYOe8ciYFEkDxQbwNH0ab8iO5StCeS4T?=
 =?us-ascii?Q?/Xhw9XvPXWHw9Wmj9BXZcPZpknT79lTryLhKkcJPhCt940a+93nWovAEhPGj?=
 =?us-ascii?Q?Jye7gjsKfNws673LS7NY1xTqrnRSeEiDycPj4ShrI6HwtouXNwe+v5lNjntr?=
 =?us-ascii?Q?7GG9OnvknMsRG+5BlTvdY/em9F1+w4Y6DzIZTK31F9lRT2/TXJdgHHGtK4YT?=
 =?us-ascii?Q?IWzgNXeRSvc4umrpmMGszkUGgTBk/FkH3tqybg+Xj17sjW1wN3LapLJglgoP?=
 =?us-ascii?Q?tSqlStVQYx+giysycAMgqeVI899MtA0oSXse9RCWdi86bpLeVxZ/n0i4trgy?=
 =?us-ascii?Q?4kldxHyjBa8DlBwKqAvQ89W1QGoEuShxXz0Q7ao/0nm17TbzPQco/WjLgoHR?=
 =?us-ascii?Q?ZnM3BF4J00jskurzAAM8l7cVne2ZpEa9zDCLF9eHwVW4N3ySKUUNfyN1q21k?=
 =?us-ascii?Q?8kFT4Yra7uKhQ1YviCEIg7x4lwhGMB1PpHTgnTsWihewrsNU0LbbTNR97WVq?=
 =?us-ascii?Q?yvIfwlE/4ozhH2iI899tkRj0l4jm3FwStCBOEh3YBZ3Cq0RXhpP0CKqhN0sO?=
 =?us-ascii?Q?fZVcYSRP8x29SaoyJiTVgenfylCOMOAX43AfQayR8VJ086eJdJD6nZIbtl3F?=
 =?us-ascii?Q?bRuUPDypbYMMn3IOgU4LMWtybt2hvfF0CJYQQqEooS0yk5ZQJi53X8fw2JLY?=
 =?us-ascii?Q?htDIeo5+K3yvpE49bucbb9A2QbHME68vgBrKvh2JJ7UGz2RyRGGJeB6U13JG?=
 =?us-ascii?Q?ciBMtdH5a6/zX95PxncE57s6ddq4WKFY0i96g/UqVQSJZbJOKVeg+XpzImBd?=
 =?us-ascii?Q?dmXWIsAA9vpwyw1Br+S+ktuUwsHZgZuMwg4Pzeli?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae6918d-c08d-460a-cd1f-08ddc3236d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 22:11:48.4655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G028l8K1mdsoW8DQvJOAd+uaDJajjpXz4P1AN4ysp56CBQ/jk+4nATvcVXRTOa4HZsL5EVK0aL7MMvKMQk2e59H66hhP3GahoxpIPvl8RDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
> Sent: Monday, July 14, 2025 2:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe-oa: Use subslice_mask in pec_sanity=
_check
> >=20
> > pec_sanity_check previously relied on pec counter values being 0 to ign=
ore
> > missing xecores's. However we are now running into situations where pec
> > counters are non-zero even when xecores are missing. To get past this, =
use
> > subslice_mask (i.e. mask of present xecore's) to ignore missing xecore'=
s.
> >=20
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/intel/xe_oa.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> > index 724fea73f0..2de5802876 100644
> > --- a/tests/intel/xe_oa.c
> > +++ b/tests/intel/xe_oa.c
> > @@ -1023,12 +1023,12 @@ static void pec_sanity_check(const u32 *report0=
, const u32 *report1,
> > =20
> >  		igt_debug("n %d: pec1[n] - pec0[n] %#" PRIx64 ", tick delta %#" PRIx=
64 "\n",
> >  			  n, pec1[n] - pec0[n], tick_delta);
> > -		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
> > -		if (pec1[n] && pec0[n])
> > +
> > +		/* Skip missing xecore's */
> > +		if (intel_xe_perf->devinfo.subslice_mask & BIT(i)) {
> > +			igt_assert(pec1[n] && pec0[n]);

On one hand, I don't think the check written here lines up with what we wer=
e checking for
previously, as I don't see where we were previously asserting that both pec=
1[n] and pec0[n]
had to exist.  On the other hand, the closest equivalent check we had, as s=
een below
(asserting pec0[n] exists if pec1[n] exists), didn't make much sense in iso=
lation either, so it's
probably for the best we corrected that here if that was wrong and made the=
 assertion far
stricter than before.

I wouldn't mind a short explanation of what's going on here, but I won't bl=
ock on it.  Either
way, I agree with the change:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> >  			assert_within_epsilon(pec1[n] - pec0[n], tick_delta, 0.1);
> > -		/* Same test_event1_cycles_xecore* should be present in all reports =
*/
> > -		if (pec1[n])
> > -			igt_assert(pec0[n]);
> > +		}
> >  	}
> > =20
> >  	igt_debug("pec1[2] - pec0[2] %#" PRIx64 ", tick_delta * num_xecores: =
%#" PRIx64 "\n",
> > @@ -1201,6 +1201,7 @@ init_sys_info(void)
> >  	igt_debug("n_eu_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_sli=
ces);
> >  	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu=
_sub_slices);
> >  	igt_debug("n_eus: %"PRIu64"\n", intel_xe_perf->devinfo.n_eus);
> > +	igt_debug("subslice_mask: %#"PRIx64"\n", intel_xe_perf->devinfo.subsl=
ice_mask);
> >  	igt_debug("timestamp_frequency =3D %"PRIu64"\n",
> >  		  intel_xe_perf->devinfo.timestamp_frequency);
> >  	igt_assert_neq(intel_xe_perf->devinfo.timestamp_frequency, 0);
> > --=20
> > 2.48.1
> >=20
> >=20
>=20
