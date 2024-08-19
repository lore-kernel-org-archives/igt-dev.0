Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD13C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403DD10E1A2;
	Mon, 19 Aug 2024 05:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bk54ToVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651BE10E1A2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724044971; x=1755580971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0PoNcMDZEDgINbOv1CLo7DW9vyqXYMOCtp6Jms5qWbI=;
 b=bk54ToVz2Th46NJzHvqW+KabKcSp1tsX1EL5tpVK8ilDVTI2wUkL0xC6
 lhp/NGw8owM4TmTKmGYpIAqNG94OR969U+z7i76gxVG9tz9Jv1+Y3lL8g
 EsSMpVL2+UPYylsj8Pk5oARfFkENtqEEXFD7MWUUwkADxIk/35bTcDHMB
 jWp6Jzof3dyYsreiuQo28+qGChyR8BlImBV5vkbF4AtwVFm6Its/CUI04
 IilPNE+PYGUQ12a9NyJdSsBDlRfUA+NdratNBHSCgSrIvZf17TSIbpIHA
 d8Wxl8LsLObBWcsY+QY13ztO6LHglPkEwzgWopXhUVfoUHsfbltw/0fD3 A==;
X-CSE-ConnectionGUID: l4P1j5lFTyyl9COSaiTIxg==
X-CSE-MsgGUID: 17ghKLi6SAOWk7mfdwTxuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44793758"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44793758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:22:50 -0700
X-CSE-ConnectionGUID: 3EcVnSnSSdqoyvzYEjWSfQ==
X-CSE-MsgGUID: JoQfn3jUQIyfS8JPW3BkdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="61024659"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:22:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:22:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:22:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:22:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkmBG/y3GL51q6YTv36iOaqPrptIVWwhXSzvSPJzKGuUqEEoRlyIACpwl022GdzUSuT2Twz3CUF5jCdFuYbHnvQbQ3+zJOs/yifYeHaB1nrfAyJ8g8e4MK8PD/XEUhBlFzuF/t5B3iaEWTXEj7N3g/Lytl2Se6mX8djRcOymvUjfsn0QQuJZgmzZTh7Iz8TSeAYes5XDmh6Px5pCocWnB7FuHtZ78ECIJ6zYX/YIEhRt79jKGfZqOth3frhyaVfFSzGP+rnvr8lsaJT9oL3xwEWdwfb64uFXaXI+wbQ6rMWN/nDcioBCabnJM86gsSiicbfUfzPunNgJRb7g+YZy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PhaG6J8uLcQ0fZ61hn5P0SkS50KmDfP52cGaBCIaLs=;
 b=MGbcZOTJp/9+muVe8bBBn0ea0hqnv/jwJqJh78Z69KEQakuNgTaXnVTCn26V/lfJ+vfJJKJpxP6bPZN8dKRBLfxrVgGq4jLvvWX14YBEbk7Mhoz/8JJYf+i0FiVhHkqNcnGWDZT6u8cIm/J9xjiSwa9R0w6YbDnPGTaYO2hvwYvixLkB4nUS59Sl7wk9yLQnJXtIuefh0/1Jc9SXd6HPKAG77IEDPuJzavVIGibFSg+sMg068/6L8DpPEu2XV9xIdh8rviO/HlyM9Sh+RMMHbVlS7k4FG/9MsMrVoxGIarEm5tEgJHFDdhnrCP1Yt2dvxRYpdoL7OBVGoiIWuCifmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL2SPRMB0001.namprd11.prod.outlook.com (2603:10b6:208:412::10)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 05:22:46 +0000
Received: from BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7]) by BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7%3]) with mapi id 15.20.7875.016; Mon, 19 Aug 2024
 05:22:46 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic
 for mst usecase
Thread-Index: AQHa7ThjmQOK0ZbM6USkMhhtX5fTLbIuE6sAgAAA0AA=
Date: Mon, 19 Aug 2024 05:22:46 +0000
Message-ID: <BL2SPRMB00017C6C592D5C5166073CE9E38C2@BL2SPRMB0001.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-4-suraj.kandpal@intel.com>
 <DM4PR11MB6312FCF5B625747F25228255908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312FCF5B625747F25228255908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL2SPRMB0001:EE_|DS0PR11MB8229:EE_
x-ms-office365-filtering-correlation-id: 80678719-3f21-4f50-13f4-08dcc00ef5b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Q9adNXobpVGL5lSpGxOJtwdNxc/Ig6fHhnzx6L3jsfIOsXDDFX/yvscaLnBs?=
 =?us-ascii?Q?9xC2xRcGM+yvooEEJ8gHFxn8BA3k8JjzKIeqlyFTIktr40caxRNP0joUBGc8?=
 =?us-ascii?Q?phJumsjrLedRQKN9jcFJCM1B8MWrLjR/xcUl4suB3Xm/lrBkrYv8Ec7Ti0SQ?=
 =?us-ascii?Q?K3/Jp+DFpOc3FRqmlFDAAUnQ5t0Kr6a+GOhCw2zSMKnwizEBvSEsTRzHtzZn?=
 =?us-ascii?Q?5pkG0vSqgZF/uUWkxJLiBiGeA9+ky/VpHgwkA+tErN3RGYBIr1js7fNFQA01?=
 =?us-ascii?Q?3n9e9k6eYoH8PiLRYyRJIzK4Xkx5wU+gci/V278+ZkIehJVFDtqsjjMFwyl/?=
 =?us-ascii?Q?+BUruOYUTnFQ1azD5nmZqu9ftSbBUBaGDIno4ed33xycc6zg/qC7dw1AxHf8?=
 =?us-ascii?Q?+2PtuaT6i6DBz/vlY15GaPIF/U+xmBlLQMZZRTBIYStFXJmPtrfU2BSyjDe+?=
 =?us-ascii?Q?KRVfjHzR07nUPLrnlUi5/PD6n6ie+hM82ABVhgKI61/IS78k3+bEVgFrwhNM?=
 =?us-ascii?Q?MgIfY2bhgH31nWAEil778l4ZbtZPTz03sdIMjChektmQV0jPvFY3XN0LBqf2?=
 =?us-ascii?Q?hQ/+Br0EpXlsBLz39UzfskZWVkWztxTKkdM+bIlOnFpJfzlHGwg/vsG6Dlov?=
 =?us-ascii?Q?SeecEiTm2cfHqnenBn7SVbft67ZZZz3f3jQosYSMPdAp7XBRl1Aqiak+fsTo?=
 =?us-ascii?Q?eafrdxh0F4Cr+WVUsPiiW6BazqGkqjOpmL/cp2ecantteB9h5hmaJquPkQjT?=
 =?us-ascii?Q?YsMdSejn0eQWhE3En8sksNUXa70XUesj/Rg7O4m8S0X8Fis19bGGcL7ISrAS?=
 =?us-ascii?Q?HVncXelGbyMQMoPgN5P5fZrjYOC8INWQ45DjHXQVUwkeWJYAootRwRZCQNKH?=
 =?us-ascii?Q?X0DQCIQG0TMNdqV5qEG0/mr6ClmFaTa5aM1xEGuTOWFxfxjAerI5GUT3oYPj?=
 =?us-ascii?Q?J5L6VcuBp76u8GwAAsSdlZI817Cn7EFZgg8yd6ddcyCMsdGvjFedStrdB6yY?=
 =?us-ascii?Q?p2Lvtk8Ta5bAnbo0dVOB/At2HDJtIjQ02j/DCXbAxew/5hglyb/P2pi3UPPW?=
 =?us-ascii?Q?wxvggU98Vwqp/g9cL7fV1QGxJ23+P4aNPmCyrBBw1zv8YLAreNHy5ZyXBPs2?=
 =?us-ascii?Q?5x+cDy6GjdNfLPwMKV9ZzZ9zId0QECSnFKvlXPOzxjWypyw2z6R9/0Jod2l0?=
 =?us-ascii?Q?c3mkwH8Iftl9E4JNchq3WkkK18Ei/M11zmp30PCebO/Cf3RcskbdVKXgYvGD?=
 =?us-ascii?Q?LejbFM96PNAlLw5cTY5S14eOb9rB1KxsaAV4SUYwE0q8JsM7rKBIJrJZXB/q?=
 =?us-ascii?Q?/IXqzg9c9nDVxWn/EuPIFrrMcxawwiIlur+HW/eVi9/hEKhdauPT/WGI3D0C?=
 =?us-ascii?Q?gpvsG/KNSzHLvxoXSZ+KppXmdrgww89sbitIhqUcDxfLUzJR2Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL2SPRMB0001.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eThBxxy5CJm6DDAJ8qOk9Z36umx+lsfKUddVnBlTxenwPAGmgnRZjH2BEcL6?=
 =?us-ascii?Q?BwgMtc6t0rqo+ZLlok3IhGes9tmR43yqKgALDLM7j/bMMitxS3mqko8b/e4Z?=
 =?us-ascii?Q?05gDjZq7YYj87c+C34zTsPNe2UepNvz10WYeAHwu40rsmmxS/R1FpvKgSFYl?=
 =?us-ascii?Q?WjWSnttHARszuvUIY/nzrSEpmBDCK3rZBS3LN6ywBlDWm1+RBGxqva0GfEil?=
 =?us-ascii?Q?kiOi2esYfJHklajkxG6i8XsNG18VB3H8jrwPZSlvDnUXtqsWoXHFOW9Ctesd?=
 =?us-ascii?Q?5D6Uw2aBI00WmRYttghnk9exvf9Jd7Y2AeYxGWFQI0vZHAebNoSJnXgE30xS?=
 =?us-ascii?Q?O9enzspDJEij2kmuLde1Y9gWOf/3NkvW9fKPdANhK80gZANZGIlFP+xHKVY/?=
 =?us-ascii?Q?36zr/LV0k1T70YDe78XS2HutK6m3TmuyT1XmudypppX3Dl+Qb2wiLw+Nqhqv?=
 =?us-ascii?Q?Dw8P+1vEiFq/Gwzz0ue1oB6h8+guoM1EVvBVr69DDgtv/QE7KZcXF3EsY439?=
 =?us-ascii?Q?11ju0FdNDJqvk6fD1JlprhjfaPOsVp3uvMGc/YhIl9uaR2/ewKV/E+HmX8Dx?=
 =?us-ascii?Q?bcxV8fA0y1VgWsnHH/ZGJNgtE+Xtx8FAEWUiyMRZhFE4btakrv1qUZGtJJaE?=
 =?us-ascii?Q?T+vxOfzaJhjErG41QuYJqd6R60PAPD/CT+5RCzDCQ9KZCkUjpLdCoWAM01jT?=
 =?us-ascii?Q?YTdvfGyCpCeZZ8ZY93ucAh/185+xRx1gnJTvnFKtCvJFPaEhsuKfdG/Luev+?=
 =?us-ascii?Q?ECPXIE5wXRWrIEmE6tlKTa90lBhA64QzEzDatfGUFluTkCd5y3wS/KsIXHBj?=
 =?us-ascii?Q?qsW9c5qXksOavP04pZvX0f0+AKwXHKBHLT7uKvyfcsIX4mUvNIvNlOeZ8R8C?=
 =?us-ascii?Q?JLK1zQknsY6bZh3LFy11/vzVfhxfHI4lNYVWAvakCldUXAHoIOtT5GiM2Gkt?=
 =?us-ascii?Q?0Yogm3wN3xMs0ppat8IlAXhKnruDPHx87Kzpe3pwh/YqNPysVpD6r167dBts?=
 =?us-ascii?Q?FafdW0kXrsgYPs3WAUAZkOUeopwHXjNF3J7ZigOLLtE7gV69BvDQeToRaSnn?=
 =?us-ascii?Q?nVDGkASnUC2tXxK2QZUHpjvPIr/VGtLrAlQFUqCpLNvl66DRsGKLnuJSgJ/P?=
 =?us-ascii?Q?zLhd6Qfg0aqCvnAao8A35nvB6DQ5u+o3/y2d12dubZOASyBt6p2a9R//2suv?=
 =?us-ascii?Q?2wDshLNFLx1HibaJMmUXju2C9BjWYgHPfVRJIsJ8QF7jmC3YrjgyNKUVkGO3?=
 =?us-ascii?Q?Ayj5nlyxmnLbqA6hCoru2U/tSgA3kY0PtmdEvgbsuJo8hEdkcvMngjGFWVJF?=
 =?us-ascii?Q?6qKraF62FrzKltey1SulUSpViR0MCLDAxGJBw3Rx7AcUzVuQYsHp3BSOnp7P?=
 =?us-ascii?Q?B91Ac4m49hht1dEpK24M9dZ79elXps+G9QaXPFuqAHDa0M6KJSS7R4n1Heub?=
 =?us-ascii?Q?h14OzhiLnDkN/Lybaqlo05giLy3pU8F2kzoUeBthxdMW+xEczjLwchwbE5aq?=
 =?us-ascii?Q?19xq0jaUI4W24nB3ld/nV5BSGges2tI9LcyEh6WenymCn4uhhnVlcma60i5Y?=
 =?us-ascii?Q?gftSXB5j2MeJ8dNk7akrr9q7saJPKQeuhJDWmxl5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL2SPRMB0001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80678719-3f21-4f50-13f4-08dcc00ef5b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:22:46.3396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3M/WGWY7sYuhMNHXQQzJAVXIq897G6Zu/JaxCCZmNwFGXIn/FwDzxWQGZCRzUT/V6YwXK2sD3Q7A2RBEwkaAqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
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



> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Monday, August 19, 2024 10:47 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry lo=
gic
> for mst usecase
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Tuesday, August 13, 2024 9:50 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> > <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry
> > logic for mst usecase
> >
> > Add mst retry logic where it retries 3 times before failing the test.
> > After every retry mst setup needs to be disabled so we need to add a
> > function which disables mst in one commit.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  tests/kms_content_protection.c | 84
> > +++++++++++++++++++++++++++++-----
> >  1 file changed, 73 insertions(+), 11 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c
> > b/tests/kms_content_protection.c index db6dc17b1..82a56167b 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -278,6 +278,35 @@ static bool test_cp_enable(igt_output_t *output,
> > enum igt_commit_style s,
> >  	return ret;
> >  }
> >
> > +static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[], enum
> > igt_commit_style s,
> Update enum from s to some proper name instead of a char.

Will do but I was following the naming precedent already set in this file.
Would this perhaps then mean that we need to rename all igt_commit_style s =
to have=20
A proper variable name otherwise having it just in this function would end =
up looking very inconsistent

Regards,
Suraj Kandpal

> > +				int valid_outputs)
> > +{
> > +	igt_display_t *display =3D &data.display;
> > +	igt_plane_t *primary;
> > +	bool ret;
> > +	int count;
> > +	u64 val;
> > +
> > +	for (count =3D 0; count < valid_outputs; count++) {
> > +		primary =3D
> igt_output_get_plane_type(hdcp_mst_output[count],
> > DRM_PLANE_TYPE_PRIMARY);
> > +		igt_plane_set_fb(primary, &data.red);
> > +		igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_CONTENT_PROTECTION,
> > +					  CP_UNDESIRED);
> > +	}
> > +
> > +	igt_display_commit2(display, s);
> > +
> > +	ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
> > +				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> > +	for (count =3D 1; count < valid_outputs; count++) {
> > +		val =3D igt_output_get_prop(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_CONTENT_PROTECTION);
> > +		ret &=3D (val =3D=3D CP_UNDESIRED);
> > +	}
> > +
> > +	igt_assert_f(ret, "Content Protection not cleared\n"); }
> Suggest to update string to "Content Protection not cleared on all output=
s"
> > +
> >  static void test_cp_disable(igt_output_t *output, enum igt_commit_styl=
e s)
> {
> >  	igt_display_t *display =3D &data.display; @@ -630,6 +659,49 @@ static
> > void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs,=
 b
> >  	}
> >  }
> >
> > +static bool
> > +test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int
> Here we are trying to enable mst with cp,  "test" should be removed.
> > valid_outputs,
> > +			      int retries, int content_type) {
> > +	igt_display_t *display =3D &data.display;
> > +	int retry_orig =3D retries, count;
> > +	bool ret;
> > +	u64 val;
> > +
> > +	do {
> > +		if (retry_orig !=3D retries)
> > +			test_mst_cp_disable(hdcp_mst_output,
> > COMMIT_ATOMIC, valid_outputs);
> > +
> > +		for (count =3D 0; count < valid_outputs; count++) {
> > +			igt_output_set_prop_value(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> > +
> > +			if (hdcp_mst_output[count]-
> > >props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> > +
> > 	igt_output_set_prop_value(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_HDCP_CONTENT_TYPE,
> > +							  content_type);
> > +		}
> > +
> > +		igt_display_commit2(display, COMMIT_ATOMIC);
> > +
> > +		ret =3D wait_for_prop_value(hdcp_mst_output[0], CP_ENABLED,
> > +
> > KERNEL_AUTH_TIME_ALLOWED_MSEC);
> > +		for (count =3D 1; count < valid_outputs; count++) {
> > +			val =3D igt_output_get_prop(hdcp_mst_output[count],
> > +
> > IGT_CONNECTOR_CONTENT_PROTECTION);
> > +			ret &=3D (val =3D=3D CP_ENABLED);
> > +		}
> > +
> > +		retries -=3D 1;
> > +		if (!ret || retries)
> > +			igt_debug("Retry %d/3\n", 3 - retries);
> > +	} while (retries && !ret);
> > +
> > +	igt_assert_f(ret, "Content Protection not enabled on MST output\n");
> > +
> > +	return ret;
> > +}
> > +
> >  static void
> >  test_content_protection_mst(int content_type)  { @@ -684,19 +756,9 @@
> > test_content_protection_mst(int content_type)
> >  		igt_require_f(ret =3D=3D 0, "Commit failure during MST
> modeset\n");
> >  	}
> >
> > -	for (count =3D 0; count < valid_outputs; count++) {
> > -		igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
> > -
> > -		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> > -			igt_output_set_prop_value(hdcp_mst_output[count],
> > IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
> > -	}
> > -
> >  	igt_display_commit2(display, COMMIT_ATOMIC);
> >
> > -	for (count =3D 0; count < valid_outputs; count++) {
> > -		ret =3D wait_for_prop_value(hdcp_mst_output[count],
> > CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
> > -		igt_assert_f(ret, "Content Protection not enabled on %s\n",
> > hdcp_mst_output[count]->name);
> > -	}
> > +	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output,
> valid_outputs,
> > 2,
> > +content_type);
> >
> >  	if (data.cp_tests & CP_LIC)
> >  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> > --
> > 2.43.2

