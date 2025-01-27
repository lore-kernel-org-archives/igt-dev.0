Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F07C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 07:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F6610E11C;
	Mon, 27 Jan 2025 07:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPKo4gK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8DA10E11C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737964047; x=1769500047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XQs2QMeDZbwTEigN4OsP7IeBlM6inOzVvhGdJCleiis=;
 b=PPKo4gK2099OCUPaRJCKGaTuefZiMf/l7Rw2xTFTma1La5dPznRIEkpG
 k+IytLwnJnQoesccWD7AWlkab8IV+Z94No2Yd3P3G+F7fn5LpXNUuew/A
 gNH4QuPSmFteANZ4fKqgyjEmWzHVCfx0MXBkvsSKvnG3ll+LBMpQSjSwh
 9tK9lDbPI8oKKnHqFh5gIEW2UcQ+uxMY7RcZt5vCXucYQE7jXNhwiDJDu
 CC7RzeIXbMpec5xzDsczv7LMZKGn4eNYQHDbp+LZOIJzhbl71HD4qarnt
 bN4MiENU2Ztd1RAaI3FB/hxFqxnowYTUdGBbvJnMHq7PZTQu6uej36zuX Q==;
X-CSE-ConnectionGUID: ZfrbQaeqTimXWrVqq6D45w==
X-CSE-MsgGUID: lcEDxP1oSjSSlna9LKbEkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42346820"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="42346820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:47:26 -0800
X-CSE-ConnectionGUID: B5h2k1UzSNamsFH+updJJQ==
X-CSE-MsgGUID: JTbKVyUcSSKyQ74V9DEHBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145591633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 23:47:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 23:47:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 23:47:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 23:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNynBqa+PgGyQUvxJOFQfQWxfZRM/NrTsQFrjHSgzHoRvDIiARr7Ce9RkFrlEFTjkWATcGNpo/sAuqscd0ZVD5IV4X63B5qvcPbwqELqNE85LJxXNgD0m2mFuK/oQht/vxQdRJxi9s6OwShXBLIArjqbZQ8i4zCqjM5D7kMl/TiYSjnTY5Y7mEIcy6CgpbPHsXpc/SJ7qhjoxH+1BYrleHKmfTztZzWNZOY+lKqEb99yOGljxPCnI40p/zN6tUjjRn6XxjaOjqWodRAVAMTK7Oyh/YYJLSLTN4YWMBUXgfin75UVUbeg6tIPbDVxyKLrx8ckDuiTqgAlSKz1wDb6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxTrFhfNXeY3U4/Xdm3abwLoCMmU+iIvC9l0yCZKEjM=;
 b=jSs/+ypQLF83EfbEPuE8w/TkhV940ANba1PuBQ5+3WnN4Hx5ZO4LcJlEGYETh4sjo6Sczwi9V75/XP9KzKlBJ9tn8chiflFGoOEseGj3bznaQA8ht6tOq7eAnG4FEwWr8zR14p+gYrvgPBjZHmk4VUH1Z1geZUx75ZO4+cZfrfaIOjfAZB+HuyB5fC6fENRBJP+qvqC/nKb3S+q+1LYBplGQlVLlZzy7Se8FxHmed1bobc3lX4zunHBlQ693l4WP3JG2Qhcdo+jclPzI8uIE4PWLTSSSy/fhho/EOm9e/rbkP/zwtxj7VlP5c7HLyf1/dyqMeGXp/j93fWpifyqC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 07:47:23 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 07:47:23 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>, 
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "adam.miszczak@linux.intel.com" <adam.miszczak@linux.intel.com>, "Kolakowski, 
 Jakub1" <jakub1.kolakowski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v1 3/4] lib/igt_sriov_device: Add helper to iterate
 over VFs from starting number
Thread-Topic: [PATCH i-g-t v1 3/4] lib/igt_sriov_device: Add helper to iterate
 over VFs from starting number
Thread-Index: AQHbbjeC8lBCA+U5r0+8qLZ6c0Gmf7MqQueQ
Date: Mon, 27 Jan 2025 07:47:23 +0000
Message-ID: <LV3PR11MB869502E647D73E7766EA387AF9EC2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
 <20250124081039.31201-4-lukasz.laguna@intel.com>
In-Reply-To: <20250124081039.31201-4-lukasz.laguna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 0fef3fb7-ccbd-49b1-99a8-08dd3ea6d61c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?CtfeRAewqvIAJNrn+Yl5GGvEXQqm2fklND/wwop6OycA9sMv3830KdGSJnZd?=
 =?us-ascii?Q?LWEytPpi7tk0S/iGuCCxwxC96eKRn/qNpy3qXtVlO6EkC1CI7ymRHwAD+Y78?=
 =?us-ascii?Q?0tIDh16m7K2RUWk86tXU0IiDGdmRQpXgtbbXJ7aoAA86oZZwxk/9xQdKzf8P?=
 =?us-ascii?Q?ISHOKivMMN5X+q5N+XomfYSSl1cxu/frj5TXFKky3xNbuP4fZbN1QvoBKJR/?=
 =?us-ascii?Q?Borymj+Pbeawe+1Nm7UzicQ79svOhzpN8i4BggsVj1VtBqWeOh4ttkTQhZq6?=
 =?us-ascii?Q?V0X7602yTh590jPaKNTV9sXT7sjqtfB4fQON/hebgWZa4rSWrBaLXeJv/0bg?=
 =?us-ascii?Q?nwDQSnef8DYogDYKsWpLAvvkTjpq8fZoOFxqyQGeqcb0+ReEe+9OciN52Fo6?=
 =?us-ascii?Q?QG9WsMDWp37kkuxxUCgHP5qcQCaoEg73CsPKUxd0zH55xQyyJ1aPzJafpcnj?=
 =?us-ascii?Q?nRBIpUDw3eQf9wCOrlGi77DMWhLrpuDE8VqLdfCW0LVc/HQF1OLulEXbEkao?=
 =?us-ascii?Q?WNisCci1lgPTRV4i7GL+NGF7KMIAUKhpId+gttc8SjG03x61Wl0a4i5xLiNv?=
 =?us-ascii?Q?t2vjwJGUU42g1kanrAo9N6Bd2qCKOEWFU38V/D9yNF5k0ceaqUKBUI41CjMh?=
 =?us-ascii?Q?eQxhX0yiDkM9rVBseXUBkr0DetNnOTK39gqbE+QxWYcV0clvgJpw6yB9jj/o?=
 =?us-ascii?Q?6NXkXR0E4F2o2E5D19cdNpAzQVWa6+Djfq373UlQ39ZHxzyoWFaB49KH7Snj?=
 =?us-ascii?Q?6TYQlxCPqiVQScLEeGgPSUUK8g2xxzO3u6O8zNK7rknkeJiY45bnICul1ECu?=
 =?us-ascii?Q?78UNEztVBvlYCfUJILGYKtso28R1BarJgvj8c8xcrNt6cqOWs/q31DFSt57z?=
 =?us-ascii?Q?xt444B4KxWTysO9uwRmkc91SfsgALgoqMdlKsOs8NNWQ6Q+UBMAQcC81jdZ8?=
 =?us-ascii?Q?/Y1+MIgaXpSenW6yEWMAn2Lyhw0dXCE6IAvsEDUvlQfwwq1P2cBTpHguK+ss?=
 =?us-ascii?Q?DRz1Y2KtuhVV3E5oHMJ84a425+crqZWS5GDa7F+Pmq4cAJuc34VahEmGrXfD?=
 =?us-ascii?Q?1DG9TlrBZ7OK9LZHoLMKK3B7xrb9CXtlTKOnnQBnVtLpwmyQPsxLsosujRzr?=
 =?us-ascii?Q?Kw29YAVjVxac0FgNgBdxaeTaWMqjh9o4GY480IlqtFyvTtNhLaZhj0e7FMze?=
 =?us-ascii?Q?2hXlFcBA/zpz4QfjEDown0MMALAVtKH3jN27snJMzUoZGGzNbB2oRvzb9g21?=
 =?us-ascii?Q?oAO1jGnIYRk7LKk/B/l8TxgUL5oGwu0JFVIB916rIfIkklwgSfDSOl2ZJbZN?=
 =?us-ascii?Q?CHpjjaEqhefSJQspPu5q3zr77lmbd5W+3uOOdSm62CMFCWPQTaDTP0T1aU7t?=
 =?us-ascii?Q?pDpGegiXn53J6iJ5pj7C9rmXb7P8a9f89N/Y+ZaXPVecFZWHI4/+iNztkRyI?=
 =?us-ascii?Q?J9iqZtebJQqLCUSa5KlAkCnSWUxUK4GV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VNw8rKoqmHekE0mZXXIZtc9vwZstr+OIAEehEqR24nNolDDNVtKC2/VPcV3W?=
 =?us-ascii?Q?uFmslmebuTMvVTk1n+inyLW7lnlG6Y7LmD77Nx/T+TOn5jENgswUYhP5GPib?=
 =?us-ascii?Q?iQFRyf9JMBCJH7RY4K9i50cuaqCApd87Fv/2lhGoxbtVrlf+TaMFD8zOXtCx?=
 =?us-ascii?Q?peEkPJsn5k6/JYSc1dFbFNg1mH2w251eEKG6ilwaghHnb9uZKH2wAdT56LTz?=
 =?us-ascii?Q?i7QzB8CJDaYxEuqa0iGKVnNBG87JNmYR49679Wna6JKiG39sW8hd1PorsdBB?=
 =?us-ascii?Q?0rRP6/imflcGkXxYwMJmR6KkSk0uyWoHsUb4aEQqBDg1Y3aBslj5id8B3j4g?=
 =?us-ascii?Q?uipT02jSo36Sb/MUgYPF4TQDaYJkfo16ugwg74Pn5mjV26SGIA5OiGOQ+KXg?=
 =?us-ascii?Q?wsoLX1rNFYvTQUEXqA8l2SNjFA7dD2wPcQVOJcydMMYhVNF+9G+xS/GvHNrp?=
 =?us-ascii?Q?+/oYZT5pI3LMSIx0DefTz2WQ3h2w1KUdWdsqxWTW18q3M4WflqxNrM5KoZ//?=
 =?us-ascii?Q?wcQGIFfjSxqBHAPpPTdQCT5/Fr1jTPBCmMcgwE9ft7R0Hq5GpzB0EbHa4LEt?=
 =?us-ascii?Q?xh5Z89Wck6MMdaLDff/fDF6MaWnvGoPsiTW6GsrgbN1XErA1kgGVXn2acGEG?=
 =?us-ascii?Q?BivCgqrJ+y1jQgk7hY3oG8YtbAHjmPI/IYM52iVYwc/Uc08ozfw/ujDUCZyY?=
 =?us-ascii?Q?JQBVP6GFA5tSwCQdImy6J7PGVFkcTVAnoN0NcVQj9WmTHi1j7ooNfFn/c+qV?=
 =?us-ascii?Q?YGjERJTJ8pxJ0/Hr0H+FEMSbNIHPYopEfNxT03gZ9IJ/dbwI0pLQqwQ9ZITq?=
 =?us-ascii?Q?C2nWt3Fs8YIzHjacV4wWmfv0iixtG6puvbhf9GlQ//xbKA3GxrllZe18FbtA?=
 =?us-ascii?Q?spNwlVVEzyzclATYcqCLmQqvJYYS/Nn5rXascsN3REj77ev0jih1apNjGz7c?=
 =?us-ascii?Q?eg4yrdnrRTGizUo0AZcD/IT+wXdx0lFr+1PdQd7zjT7dpkpBvJ7AOmD4IBqG?=
 =?us-ascii?Q?ujQaw7s6ffiTRV9csW/7RM4tH98xo5Vo2cRGNzIvYRe/Mp8AdlVH04kNjJsp?=
 =?us-ascii?Q?RN80jfV9bmx73N1gRnNkTeHGFZLKcn7bLoSEm/YZJvABT8ymrx9kcqAi2Ca9?=
 =?us-ascii?Q?fUT3ZVlNvQKiM+2OinPXCv1xd/G+QNGyAqK77N54fH0wWl/LLB3qid8Wa6Ga?=
 =?us-ascii?Q?Kym1hzChufWm1tBDXcUOtUOw2tMzmsuQmX2z8MwGtzdI444ZV6Jmw4rqXiG8?=
 =?us-ascii?Q?3A7IbijVaeDHYOjOTwx572LfrO7UnaBg1czcpRUK0xcPaqVQa3Qn0WExByJS?=
 =?us-ascii?Q?GZNaLPXmPzks8+b2dxJGaSnDuQvxMB3A+OWdd14ZDtA4KLeS18WU9deEKiiD?=
 =?us-ascii?Q?iYOyXHmzFcTmfs3HQOomM/YUQsdljorvFxXf7lf62Ue5r4LB0/utj+fz9Paa?=
 =?us-ascii?Q?cLIZNrR4J+s3lvfg4kdM24RDNbDf7UBeWU1eQMFxJGuIbWX0Rj3RiZaFvlwq?=
 =?us-ascii?Q?EdMq9FPM6HwdmvpzWi6mxu6fsDJYgRwu2PWPSUp8T3IPhkysweATolMsPRIw?=
 =?us-ascii?Q?X0LMp2RoNMXzHvlMcnRWLDz3fSHN6LLsn7JJWlIcmEvuvYWQ4jMsdu9HN1MO?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fef3fb7-ccbd-49b1-99a8-08dd3ea6d61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 07:47:23.4054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjcuzwQtah6aqF5e0P1uXNoOcM2igskxhWVWW3nwpxOhyUum4c/BMyChw840MLuOX6QGS6mHWTUoQ49mZnnogW7T9pYk+bFc/uL4wHtP/BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
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

> From: Laguna, Lukasz <lukasz.laguna@intel.com>
> Sent: Friday, January 24, 2025 1:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: marcin.bernatowicz@linux.intel.com; Laguna, Lukasz
> <lukasz.laguna@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; adam.miszczak@linux.intel.com; Kolakowski,
> Jakub1 <jakub1.kolakowski@intel.com>
> Subject: [PATCH i-g-t v1 3/4] lib/igt_sriov_device: Add helper to iterate=
 over
> VFs from starting number
>=20
> Helper allows to iterate over VFs associated with given PF, starting
> from a specified VF number.
>=20
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  lib/igt_sriov_device.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index de25a7d98..741b1bcec 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -86,6 +86,21 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int
> start, unsigned int end)
>  	     ++__vf_num)
>  #define for_each_sriov_num_vfs for_each_sriov_vf
>=20
> +/**
> + * for_each_sriov_vf_starting_from - Iterate over VFs starting from a
> specified VF
> + * @__pf_fd: PF device file descriptor
> + * @__start: Starting VF number
> + * @__vf_num: VFs iterator
> + *
> + * For loop that iterates over VFs associated with given PF @__pf_fd,
> + * starting from a specified VF number @__start.
> + */
> +#define for_each_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
> +	for (unsigned int __vf_num =3D __start, __total_vfs =3D
> igt_sriov_get_total_vfs(__pf_fd); \
> +	     __vf_num <=3D __total_vfs; \
> +	     ++__vf_num)
> +#define for_each_sriov_num_vfs_starting_from
> for_each_sriov_vf_starting_from
> +
>  /**
>   * for_random_sriov_vf_in_range - Iterate over a random VF in a specifie=
d
> range
>   * @__pf_fd: PF device file descriptor
> --
> 2.40.0

