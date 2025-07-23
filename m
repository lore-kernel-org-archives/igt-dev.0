Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76DAC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 09:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631F810E787;
	Wed, 23 Jul 2025 09:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4p2dJVQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AC510E78A
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753264540; x=1784800540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YvHCpinevanCqWb7OENXK1JSgLv4XY13/cd2m1bd/qA=;
 b=V4p2dJVQsSDkMMosFo2iY8uoALefYDBz11JIMUzVwzo2aBkDa5hEpVwG
 ef7xosNufzKlJDxtrTmpFSAjvXngxyqPXWc//2tK7/rQM++RpBMcY0tCy
 0x1+4+npzfh+vo+Z5YjL3a7ywY7l3G2dH7j2ZTV/dZSbAxHhUrg+cisSo
 re+GhGr0fKxbx8yT3sOY6GGsJERO+TcqnnOEd74d/i8nvzGnktuJy2136
 7PWHeImxsVqbMbqLP36OXPtMHTIEboaF0C0DvO8bmZ7cDXb1PrgiFG0ae
 s2oeOdwT13XAhh5msplNW6JmUEofdthk5KjGro/jg/ppIBtYwqFuI0d9+ w==;
X-CSE-ConnectionGUID: 03Or51xPSS6NIYhuuIRSrw==
X-CSE-MsgGUID: brQpYDOEQ06+o0cCQU6IUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="72997532"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="72997532"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:55:40 -0700
X-CSE-ConnectionGUID: iKIyWCY0SLGlDpYT9lCIsA==
X-CSE-MsgGUID: Z0QrWys/SIe4xKeojmWzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164845288"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 02:55:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 02:55:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 02:55:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 02:55:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSjuC7tNpoiFx6nkose43kZ+enACpbcPVACXcdg0v9dzfEA5k0eSSTQQX/suksajhsot4E54TxKkmrtaW7mZhKu1uJOOUzncTW83hNqLEHpJmhVe2HhyAg/hVch2dFFablGyGL1cPEEt2J1f5TTjFaU3VuXyP1McBzcYlCnPy0jZehW8XXr0FGj5T5epwd7EEvarHEudcetOUEJsKIz6BESOipTz7SRqPrxaHh75MwUHAP8bKq4mDxRQDSLciGc5OhjEiU76PeHYRQkl9nUGSSj0GekyE8WmXN+pE2apfbVD3n64ic9W2F834JwTc6e6XVvisnKBXbW5lrfZ15tMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtrmFFQu7qBGthiE07Qkg+RoTYP9XywTo6ku10paljA=;
 b=ofaZ73zELZoNlXWOtZhO8zIwwzauulh3WE5KHDvZcxy2HR2gXrknT95wNcdpVDW5zZZ84fk+iaFrPeSNatvznZ2BkhRN+Lw93a+h0h8jSHuzr7ndHoOJdI5u3+Ent8UREmolxlo1gj/f6l+PMECdiYqIIOJvwSMWb5vAvln8XPeJPPoxS1Gk0ttlSRE+v2vNG0Jayy6DFxeus0pKKj3E53JTW7BDbLho8yYrfXKDE2ID4kzIOX1qEGYPBe5fQoC85UjoRrsTYqmw3td/90RcLRQeMf+vWNG8ZzVj12I7Urs+yk3XST8G4UCT5OeOTafUqaFOyIS5VL/QBCfR4auHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB5182.namprd11.prod.outlook.com (2603:10b6:a03:2ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 09:54:55 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 09:54:55 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Thread-Index: AQHb+Mq28Zub37GLeE6+S007IYOu5bQ8ZRAAgAElK4CAAIJ5AIAABXMAgAAN7dCAADEWAIABK1Lw
Date: Wed, 23 Jul 2025 09:54:55 +0000
Message-ID: <CY5PR11MB621187439DF281E64D1FC80E955FA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <aH4YMMLcvuiRS2l9@kuha.fi.intel.com> <aH8OHZquwBBvODfQ@black.fi.intel.com>
 <MN0PR11MB62070599B42A46DCAE1CC69B955CA@MN0PR11MB6207.namprd11.prod.outlook.com>
 <aH-AIouJAiWTVxV0@black.fi.intel.com>
 <CY5PR11MB6211F4211D129944C29DEF39955CA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <aH-0_lSffRlCzvX5@black.fi.intel.com>
In-Reply-To: <aH-0_lSffRlCzvX5@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ0PR11MB5182:EE_
x-ms-office365-filtering-correlation-id: d82b4feb-c03d-4d38-e95e-08ddc9cefa42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EeyqFRbKKIsnU1D0luOj75qVjZUdzZE0IeF3emgXGJP+AoMGxmRYFp8Ntetu?=
 =?us-ascii?Q?Rr4MqwmUxVDAnzxKISqQCW/zhJpV7lZPuG+BVxs++N7QqaNg3HT7SwkbPCyP?=
 =?us-ascii?Q?lFp4jcAilSsVByvdQMbdEWzEMTdCCnXPLBFot3ENAgFwFySQs9fcxy+Kmajd?=
 =?us-ascii?Q?l8wNlklA7HSWYDwG58jx0l0CYc6+B78B+4TPijhC/ZTs+Uan0FpaXVxzJ64N?=
 =?us-ascii?Q?a4Bgr26Dl17w4FN1Ev0l0+oy9AkMlOm5Xivcyj1zIO6ijBggUGgdZVnQLZKO?=
 =?us-ascii?Q?Mh+44cggt5ms/sCC9C21Jg7Zpsd0jop2/f+S4fQFO38Tfj7dxmcE3szT/5Ha?=
 =?us-ascii?Q?XP/9DPz2E9P38AowEjrq8m4V5r0SpaZt8jDZcB0aQWaR2j6jlrdlL/1PEZnR?=
 =?us-ascii?Q?mk+E7k3qphU1x9G7L8ZfqjZzpPBnyDuXlGxhUVD6G8+uovnuGR5UeHcvZrJg?=
 =?us-ascii?Q?TlgPvt/p0ENPj3McZVMF+dQES3HHPdIs6vPSKd1Uh1J1k23Q/2QOC9IUFCUw?=
 =?us-ascii?Q?skoM6j1EeFQpNzoGFQM2Hl+R2CEGAR/bNt9tO0emUIOgOuKsrkyaiLRWpt7a?=
 =?us-ascii?Q?dpU6ZMWe8kyp5dpJX5dghR096WBfbE25MQT5FoaPVPt/XfwwRg3dzwGUz88K?=
 =?us-ascii?Q?8xWCe0NLINhDi9vmAJ7g8XhVmPfiHtJDd7Q5O0tsRv6+GirRBa2LyYlNTxDu?=
 =?us-ascii?Q?96L65iwezUmOgiTXg9Q4lnC/jmomflWG9zO1nug90uM1yOxAahLkfPbmX6KN?=
 =?us-ascii?Q?EmxlwCZr50ZfyCP5Se3RqcIJiilpIHjKWIvE9fVtyzLK2Wl3j26jcvEwGpNf?=
 =?us-ascii?Q?4qTc7Lr0CisVgvVmT73qiRQuYx760/navLE3WPJflmkBnY10Uqut5g3Ffg4A?=
 =?us-ascii?Q?4AVKpwF9+zUr3E0Lj//N1bFRwK8FnZg6lVVVIMqJ4iGrkvI7ppRHpqsPIIxk?=
 =?us-ascii?Q?cdSv/3aK4NLf5S6bSGZ6De62t2LqZOcb6zVqNIcZC87UT1Q1iHWX3LDwLut/?=
 =?us-ascii?Q?qiLBaXPpMrIrDt5JM3CtUgMfZa23g05wSQevjNRG9Ymg2Nh+fhDzDlrpBnCa?=
 =?us-ascii?Q?NYMsjHw/6ORcUgTARG44BXQu0O1YC9b2q5Ep/BQlsknNDe35ko/oksoePC8s?=
 =?us-ascii?Q?krxnxVHIolsMcc328u1qM5hOJYOqRWkNjTz8qOBf8Ms1OWptCsIpo1UcYazQ?=
 =?us-ascii?Q?ByTT7Z4+IdElLstBTsj5WjLS7HR3NKZpYTPsmz/P6oEUpCIBjQttX8shvwFK?=
 =?us-ascii?Q?4fvZe/WcfEP1ZU8URSgCYiY+Zc80eqy1kHlNiUEVBcTYsmuzkbCJ00dPZu8N?=
 =?us-ascii?Q?fwNYn3AsCitgJfPekfuZUy70CQDP0cj6ng0PtjgUpQnPrhS7il/ih4yOdY18?=
 =?us-ascii?Q?D5C9go3WVbh+BeQKBVmsETfFwtrZ216OKJY4G+UhHxTCMlbG9RnmIT/QNqgP?=
 =?us-ascii?Q?W0mqgucDrs8bUit7QmDKiu2XCf/wFuamevQSXPE6phBJVw1LStxfrw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hx2e2Ou/YUjbNGqPiSeeKH11+w8ARkpVy4HhMeJQbLKshCbgdW+KdQl3TyLk?=
 =?us-ascii?Q?5exJeaoZEgPzl3CmJpqc5f+cMHkTwrNVj7lxD0mMqV4dPxgVGu2P+lIOF348?=
 =?us-ascii?Q?XOqA7ZRgQImJ9cJ16Yk+h2snSvsw2xRwsLkyV0BHI1BExm2B684cXE5iwS3s?=
 =?us-ascii?Q?AhoC0FOmWYgglCXL9OsxwJzj5S3BGhmDXHTS9S07SxKv60uVS5OYpAsbAojp?=
 =?us-ascii?Q?gj92LvHNJdR+xL55XLrR4xpVaOhTS2KV6XFaXwipgAQGuzzHuG50488fuvVZ?=
 =?us-ascii?Q?gq5QYbZeYlHdR5DNTtQ943wtUzoXkRv04fB+lo9G6792zUl3r0++fI8X7Nxm?=
 =?us-ascii?Q?/0TQhIKyuICNL3mBSzhiN2NwDu83jE+R37yDgAY0+xXUvizaklEP2XQjcXAj?=
 =?us-ascii?Q?QMTig5EkvtTX9q1bG8PH5/Lhvf4LJ5WZMIXYMa22NrGfwF7Z5tmvmC+Kzn/n?=
 =?us-ascii?Q?+G13PTscjSat0QX/0GQYL80DBJ4umhgAdk/bwPZ46P8qpM1WuatEsA0DwRzt?=
 =?us-ascii?Q?zAZtcJElW1k1pblAXH+tuMWFsvdhKQR7HMFl50xomocumyB7cbADzDsYYfSR?=
 =?us-ascii?Q?/qQB106LZsoVa08WSp9vN2h8saMtZfyklzGF8PIJ3FguAsUUHC0wMY0hapRI?=
 =?us-ascii?Q?QBAxYy18pRbDYkOA5TAKmL3NE1Y8+vocUPrqDsXxLwEj5DVEQotbKo/524+z?=
 =?us-ascii?Q?1JGWqZHt2Y8uJLg30iiQWdXSkMLdbQNja8FB1QV6vcfVmNJSopxCmMhZOqm2?=
 =?us-ascii?Q?gqSFBfoqSVqi5rQkQScPE/hWq4gNuA5QIOFbRpMD8UD7qmaDAzhShIZlh/0I?=
 =?us-ascii?Q?jXivOXfv5fkYaukaA95JfE5mHObRCwRRVLgdLMUr6MswG18dFmWego0UkJ6M?=
 =?us-ascii?Q?Yuwm1ixf08Z0u6h3QNct2DbuU4K0y7lCegAtjMKh+ZnLoReto6+VilJNGkSs?=
 =?us-ascii?Q?KaZaVuH5nS9GMeIGEghqXTc1zv+Bs7DzcrbEaZ5Qm43ziyf+0Rm/3vV8vDpo?=
 =?us-ascii?Q?fP/NYxdnw2eAuTY8M9mmwqNWbMQN9RYsCSV79HAJYufBH6r3oQh9xFcc6eTk?=
 =?us-ascii?Q?cQurDSSskuGSnZuPM4u50sMKHArotZZ6n4G3hdc2/MPOV8kpyE5JF8EOb3Fh?=
 =?us-ascii?Q?nNlCT8zoiYYL5rG9Jze1n8nS+gaw1g3moERWoH0YRlfrg6esGWSQdVNrVcOS?=
 =?us-ascii?Q?HB5zOv4EddU/SE8TDt9ZJmKVgSZ8q13Q1Fh9tiWgAYrhKx5isZnzKTY+Kp3v?=
 =?us-ascii?Q?9HHBszKA5VpuYjYNXmDRgwEXa7vD+bOuvC30lO4KzjGpsOjreUCrYUY/U1qR?=
 =?us-ascii?Q?YudObp48OXWThv4XBAU5GEVdH0DWRUOR2doIKE+/7KdXLe60B55EW67pgH8v?=
 =?us-ascii?Q?s2aw0rzBkJin1Ycz/df0TNb5pM3x7KYQz51Dp5RDTKuuRXduOvPlPRZlyfpd?=
 =?us-ascii?Q?9UNkU08N8jN/SraqNsc9pafgE09yg/dUiFcPLYcMiABYIdPFR3e6/evISIoV?=
 =?us-ascii?Q?v59NS/5DgE1DelTaiB6CZJ3Rvrz1ZHXS7O8aj6xSospUcZ/hrhpTpM53HDti?=
 =?us-ascii?Q?y0nKTrj7WyENOjuo/YZpWdos4fKhlJEHjG416bWL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82b4feb-c03d-4d38-e95e-08ddc9cefa42
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 09:54:55.5153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7IeavK5vzsVQVs9Mz1NQVFPhUL/FiLGGtkgvxoOwOKI9JV8fjGYXL8F+hfKSYaBmShhmlZWc2FZtXSRkRp/BEXYi0DLUIJw9CScnHgJhdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5182
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
> From: Jadav, Raag <raag.jadav@intel.com>
> Sent: Tuesday, July 22, 2025 9:28 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; igt-
> dev@lists.freedesktop.org; Nilawar, Badal <badal.nilawar@intel.com>; Taur=
o,
> Riana <riana.tauro@intel.com>
> Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
>=20
> On Tue, Jul 22, 2025 at 06:33:43PM +0530, Gupta, Anshuman wrote:
> > > From: Jadav, Raag <raag.jadav@intel.com> On Tue, Jul 22, 2025 at
> > > 05:27:35PM +0530, Gupta, Anshuman wrote:
> > > > > From: Jadav, Raag <raag.jadav@intel.com> On Mon, Jul 21, 2025 at
> > > > > 01:36:32PM +0300, Heikki Krogerus wrote:
> > > > > > On Sat, Jul 19, 2025 at 10:01:01PM +0530, Raag Jadav wrote:
> > > > > > > Introduce subtests for i2c adapter which is used to control
> > > > > > > on-board OEM sensors on selected devices. This will test
> > > > > > > D3hot/D3cold transition after i2c adapter access for the
> > > > > > > devices that
> > > support it.
> > > > > > >
> > > > > > > v2: Define macros for AMC constants (Lucas)
> > > > > > >     s/index/adapter (Lucas)
> > > > > > >
> > > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > >
> > > > > > Looks good to me. FWIW:
> > > > > >
> > > > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > >
> > > > > Thanks Heikki.
> > > > >
> > > > > The BAT failures seems unrelated to the patch. So anything I can
> > > > > do to move this forward?
> > > > >
> > > > > Raag
> > > > >
> > > > > > > ---
> > > > > > >  tests/intel/xe_pm.c | 98
> > > > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 98 insertions(+)
> > > > > > >
> > > > > > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> > > > > > > 16b5fc686..ca935d518 100644
> > > > > > > --- a/tests/intel/xe_pm.c
> > > > > > > +++ b/tests/intel/xe_pm.c
> > > > > > > @@ -11,12 +11,18 @@
> > > > > > >   * Test category: functionality test
> > > > > > >   */
> > > > > > >
> > > > > > > +#include <dirent.h>
> > > > > > >  #include <limits.h>
> > > > > > >  #include <fcntl.h>
> > > > > > >  #include <string.h>
> > > > > > > +#include <sys/ioctl.h>
> > > > > > > +
> > > > > > > +#include <linux/i2c-dev.h>
> > > > > > > +#include <linux/i2c.h>
> > > > > > >
> > > > > > >  #include "igt.h"
> > > > > > >  #include "lib/igt_device.h"
> > > > > > > +#include "lib/igt_kmod.h"
> > > > > > >  #include "lib/igt_pm.h"
> > > > > > >  #include "lib/igt_sysfs.h"
> > > > > > >  #include "lib/igt_syncobj.h"
> > > > > > > @@ -38,6 +44,10 @@
> > > > > > >  #define PREFETCH (0x1 << 1)  #define UNBIND_ALL (0x1 << 2)
> > > > > > >
> > > > > > > +/* AMC slave details */
> > > > > > > +#define I2C_AMC_ADDR	0x40
> > > > > > > +#define I2C_AMC_REG	0x00
> > > > > > > +
> > > > > > >  enum mem_op {
> > > > > > >  	READ,
> > > > > > >  	WRITE,
> > > > > > > @@ -779,6 +789,87 @@ static void
> > > > > > > test_mocs_suspend_resume(device_t
> > > > > device, enum igt_suspend_state s_s
> > > > > > >  	}
> > > > > > >  }
> > > > > > >
> > > > > > > +static int find_i2c_adapter(device_t device, int sysfs_fd) {
> > > > > > > +	int adapter_fd, i2c_adapter =3D -1;
> > > > > > > +	struct dirent *dirent;
> > > > > > > +	char adapter[32];
> > > > > > > +	DIR *dir;
> > > > > > > +
> > > > > > > +	/* Make sure the /dev/i2c-* files exist */
> > > > > > > +	igt_require(igt_kmod_load("i2c-dev", NULL) =3D=3D 0);
> > > > > > > +
> > > > > > > +	snprintf(adapter, sizeof(adapter), "%s.%hu",
> > > "device/i2c_designware",
> > > > > > > +		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
> > > > > > > +	adapter_fd =3D openat(sysfs_fd, adapter, O_RDONLY);
> > > > > > > +	igt_require_fd(adapter_fd);
> > > > > > > +
> > > > > > > +	dir =3D fdopendir(adapter_fd);
> > > > > > > +	igt_assert(dir);
> > > > > > > +
> > > > > > > +	/* Find the i2c adapter */
> > > > > > > +	while ((dirent =3D readdir(dir))) {
> > > > > > > +		if (strncmp(dirent->d_name, "i2c-", 4) =3D=3D 0) {
> > > > > > > +			sscanf(dirent->d_name, "i2c-%d",
> > > &i2c_adapter);
> > > > > > > +			break;
> > > > > > > +		}
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	closedir(dir);
> > > > > > > +	close(adapter_fd);
> > > > > > > +	return i2c_adapter;
> > > > > > > +}
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * SUBTEST: %s-i2c
> > > > > > > + * Description:
> > > > > > > + * 	Validate whether the device is able to suspend after i2c
> > > adapter
> > > > > access.
> > > > > > > + * Functionality: pm-d3
> > > > > > > + * GPU requirements: D3 feature should be supported
> > > > > > > + *
> > > > > > > + * arg[1]:
> > > > > > > + *
> > > > > > > + * @d3hot:	d3hot
> > > > > > > + * @d3cold:	d3cold
> > > > > > > + */
> > > > > > > +static bool i2c_test(device_t device, int sysfs_fd) {
> > > > > > > +	uint8_t addr =3D I2C_AMC_ADDR, reg =3D I2C_AMC_REG, buf;
> > > > > > > +	int i2c_adapter, i2c_fd;
> > > > > > > +	char i2c_dev[16];
> > > > > > > +	struct i2c_msg msgs[] =3D {
> > > > > > > +		{
> > > > > > > +			.addr =3D addr,
> > > > > > > +			.flags =3D 0,
> > > > > > > +			.len =3D sizeof(reg),
> > > > > > > +			.buf =3D &reg,
> > > > > > > +		}, {
> > > > > > > +			.addr =3D addr,
> > > > > > > +			.flags =3D I2C_M_RD,
> > > > > > > +			.len =3D sizeof(buf),
> > > > > > > +			.buf =3D &buf,
> > > > > > > +		}
> > > > > > > +	};
> > > > > > > +	struct i2c_rdwr_ioctl_data msgset =3D {
> > > > > > > +		.msgs =3D msgs,
> > > > > > > +		.nmsgs =3D ARRAY_SIZE(msgs),
> > > > > > > +	};
> > > > > > > +
> > > > > > > +	i2c_adapter =3D find_i2c_adapter(device, sysfs_fd);
> > > > > > > +	igt_assert_lte(0, i2c_adapter);
> > > > > > > +
> > > > > > > +	snprintf(i2c_dev, sizeof(i2c_dev), "/dev/i2c-%hd", i2c_adap=
ter);
> > > > > > > +	i2c_fd =3D open(i2c_dev, O_RDWR);
> > > > > > > +	igt_assert_fd(i2c_fd);
> > > > Can you wait for runtime suspend before triggering the transaction
> > > > to test
> > > gfx transition from d3 to d0?
> > >
> > > Isn't that something setup_d3() already does?
> > What if i2c_open cause a device ref count in driver?
>=20
> If so, how does it decrement before ioctl call to allow suspend?
That is the intention to catch bug by IGT test. Wait for runtime suspend wi=
ll assert.
Thanks,
Anshuman
>=20
> Raag
>=20
> > > > > > > +
> > > > > > > +	/* Perform an i2c transaction to trigger adapter wake */
> > > > > > > +	igt_info("Accessing slave 0x%hhx on %s\n", addr, i2c_dev);
> > > > > > > +	igt_assert_lte(0, igt_ioctl(i2c_fd, I2C_RDWR, &msgset));
> > > > > > > +
> > > > > > > +	close(i2c_fd);
> > > > > > > +	return true;
> > > > > > > +}
> > > > > > > +
> > > > > > >  igt_main
> > > > > > >  {
> > > > > > >  	device_t device;
> > > > > > > @@ -889,6 +980,13 @@ igt_main
> > > > > > >  			cleanup_d3(device);
> > > > > > >  		}
> > > > > > >
> > > > > > > +		igt_subtest_f("%s-i2c", d->name) {
> > > > > > > +			igt_assert(setup_d3(device, d->state));
> > > > > > > +			igt_assert(i2c_test(device, sysfs_fd));
> > > > > > > +			igt_assert(in_d3(device, d->state));
> > > > > > > +			cleanup_d3(device);
> > > > > > > +		}
> > > > > > > +
> > > > > > >  		igt_subtest_f("%s-multiple-execs", d->name) {
> > > > > > >  			igt_assert(setup_d3(device, d->state));
> > > > > > >  			test_exec(device, 16, 32, NO_SUSPEND, d-
> >state, 0);
> > > > > > > --
> > > > > > > 2.34.1
> > > > > >
> > > > > > --
> > > > > > heikki
