Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B1D0E6C6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 14:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55C210E41C;
	Tue, 25 Nov 2025 14:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgPBe3Ql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3710E41C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764082030; x=1795618030;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=78aTutsGv634BwU7JWsnBOaIROgv1ioIPEhd8uCGQHo=;
 b=kgPBe3QlvQbB61vQnjnC3A97JZLX/NIgWE//GqdxJ4MyZGeyH8c52NDv
 TpZaRcoTfOSjNCQlQ3zNO33tEFL6bMuh/hHgLS4Llvz9kuEyw+pOcOh+H
 mJrcMQ3PYC/If1Ff8ap45XcCbSQcDzO+coAkB0/IcGmT1VtCb37hMANCT
 GOeM7n40ivUMvy9j6BduL76LvSlEqA41sxfm1KsOCJ8GF0Xy3Mzi6lWAS
 S+7qa0D0J3cT3lplOICN7+su64LHmDRp4ur8n8n4BuTnigxd0FYzmVqhI
 aRJOlx6KCd4UN3Xwi0k53XLI8SzwKWfNbUu1HzJQfd7B3YLH3ncSOdeqY g==;
X-CSE-ConnectionGUID: XDOdHJxQQHKWPXGnMYGgNg==
X-CSE-MsgGUID: BLJzAXp6SOSDWx82kpbiAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65101491"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65101491"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:47:10 -0800
X-CSE-ConnectionGUID: /Pi+VyPbTg+hSnBrw7lJoQ==
X-CSE-MsgGUID: hNnNw2W+RQ+iQX+KnzqjSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192747139"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:47:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:47:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:47:08 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:47:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INOte8bU0zEyTHoe6S8hbWG1U6WIaxkxIJo+l5jAMpN7Bmnw5w9WTE8Tt5taYbRL9bM6p5FDMPQ8WABbsqlwghVaCGeirtoIajLWUsIeBn+sBA/OK0TyiVpZ5fFDxiD5KABsqXNVZ+pvIIo/4ClfBHPqnlAjKp8uevnCwSSSpFYh2JrJPkS7CupSu8SeeA5mXTi9n9Xdut3K3rAw0ZyBkDLO+0/Pgx0+wVKExyKBBCMdJgPDdEudtUO5m7I/2io5c0WdS4A0wEz5GiZcJ71INSZpQYSeTBnxot7cvO7nA64H3foZnabX3f6gDBhMWF/XzFWmiBwZvQwHto/ZA6DytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzDx+cjSxbWV9VW+nUUZBRwRJVIlDFwHoXowMevuBLg=;
 b=OCwNpWUPG+WEAKDL2iyd+4Il0lVeTfRmcjjUsH9LOnV7c1et44ruCUcE+7P6x7fdfxO+Om7nvwhjxCg8g6uCRqP06bwPV4u3m0ThxGhqKzWPSD7uQFIL4U4aRbRW8/DuM+KxPt5tLvNenWKUljKFxOBtGA3QLPa3r6mdNCXKjQXiqcKw7OwTRUnmUlLTY5ktw1g+0LZYOus/LGxzAelaxrk6odDOrlN7yfkjQSY8BBhVYe+s/ilUi84i2JXrfEa4VNygXWrX1GzgE2Paq6DtZWLwOhNZ+MOMXP4xPAm+5x2xuPHT0Hk8ZPbihTB3nmDXZwZLBM+OgzZcyBnBFaSrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:47:06 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:47:06 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>
Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcWwOLQ7w6QjlAPEuHQpM3HVNDgrUDefzwgAAB1gCAAAJLAA==
Date: Tue, 25 Nov 2025 14:47:06 +0000
Message-ID: <BL1PR11MB55259FAE7835DF03732BA45184D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-5-nishit.sharma@intel.com>
 <BL1PR11MB5525A52E3B7659CFCFBE017484D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <MW4PR11MB7151C095FCA48709BFA935D8E4D1A@MW4PR11MB7151.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7151C095FCA48709BFA935D8E4D1A@MW4PR11MB7151.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB7070:EE_
x-ms-office365-filtering-correlation-id: 806e610d-2662-4fa8-a029-08de2c3180ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yXkuZvDhtOSEEtnDJFIPL+ZNe44ks281dDvKaDq/TNFosL0ZDuM6NI2w1In8?=
 =?us-ascii?Q?dcQPDKLGyekglQKKVCxFTIOOhxzpM+Zt32KJZTx5rOV+VnQnhJVCKyf7Rzff?=
 =?us-ascii?Q?ljRpuD5qNLd5RO+44ZoRHdLxPGx/G8Ym0u1wC8q6UxzCQ2p3Rey1O5wIXJ1H?=
 =?us-ascii?Q?/w6y7Zeg+/Xdr6njUV0mASrGnBPd3BhdiB7Jrj1P4Uuu5HwOpqvZ1mvey9hQ?=
 =?us-ascii?Q?W8VesvXCNstQiTBOwvMm20Gmh12yd8lUhJMaC0ENonC9WNCK2wl+cLRB1mFM?=
 =?us-ascii?Q?BIbC/ECjBZk4sKNsMqNjqoN2VhaT93PXXyLn6vj7pjft8igRoain1skfB3Mp?=
 =?us-ascii?Q?F2ThMhmk2twfrMcihd+h8eOGkr8oVGzZBxSRrQ13Qt80WIrK5vatTj1e1RQn?=
 =?us-ascii?Q?S6Xmpj1amBwFvRRrZP1qMr2LVeQHjWuQutA0KbdCz7CqCp0MGGnL+3ThxpAI?=
 =?us-ascii?Q?Y68etI3W11DRjny1PpbbEAZbus5woGszTyY48mIkKM7WZZxHgZScxaFlRV0v?=
 =?us-ascii?Q?qn4tV5r8BSAd5k4HV9OCSsoWrEXvndK6eMnqqJXfFPuUYpVC0gfZawKSvlxm?=
 =?us-ascii?Q?c8SJr/Fi3geki+02NS085CqluCFqYhJoZuAmux6HZ7ek4cw7m1GRuALAyuGE?=
 =?us-ascii?Q?7uGy6hb8zYmhyPuc4vlUJ/nNxwV/jZqAFPobpgE67b9enKinD8lxiJ/j31H0?=
 =?us-ascii?Q?TmJMj+mUK1+9V6iyu8RWQOAhYdLEPZWeoZiGoicgWpW8zlGCnBs9gTba12/U?=
 =?us-ascii?Q?6b7v1Yr2Cs3K/hZlFC6re2iOyzGxoUeUxDYwzqGSiNmcS3Iz0vQbdlfUEjgi?=
 =?us-ascii?Q?cw/rEYSdzjBnIN1rafGMhIhOqnMPk5gaJux2rMKP0pmzk2CN7RHw38QHcITN?=
 =?us-ascii?Q?rbm8rYLJ7QWWe7wkQ9X48+gsSp1TDZvdLvMrtjRa4XyJFbM25+eyUwvOSoHa?=
 =?us-ascii?Q?ILe+IJhi58FoPbBTmL0pgOuyGR5txsTCzL3/yrpSTKun+sQtyXrSQ4ge9vm3?=
 =?us-ascii?Q?a2EbfIC/HCzCQ9oFKAO+XJ7kk7znI+GZxmvgxtbIyQeXD3oCVyBX8wm6jPIh?=
 =?us-ascii?Q?n0yoIoKCw/hxU7QvinWQcNGaD78dSFpH2zPW9Cs0bv45PM0B4aJdss/a303+?=
 =?us-ascii?Q?IGglhORtH0TKXhYfFncqmzEiTJ3u1x9GVFvm8+YKyD3ZA7U6KK3VGdcD2u20?=
 =?us-ascii?Q?oEftsdvsRXCZqN70qS/O0BFUlVhpSQ990xYqaxHNR6D1ha9aRcenFnFCzdB2?=
 =?us-ascii?Q?7w0+NtoKsuIcEHB0tntFbOOMf0zNatmTk11yES2WQvEzyTuww8xjAu8rsKnp?=
 =?us-ascii?Q?bE0oUtwAGuMxxaydW07HgW+esdokyke2ALKZ2n2qFpBY8cXnk7RBCkMtp4Bs?=
 =?us-ascii?Q?kCbvCFR8wpC/Vl29o1v0E3Xzpg1/qCO0uESswqmrhjn65EY2TGW853HTJsSD?=
 =?us-ascii?Q?n8A5UETYMbqNemkqqmB3GQMSL07fCA72lxEKglW9uhwTeCdqoeiCGRcW1Vi8?=
 =?us-ascii?Q?e7rft2+Jibbdl4xc7rYvgAUCEcKmlG49zZYD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tf9t5q5hVAI0DHwCYPRqQ5xo2ThkAFjpR9If2R1kYoDUiwDY/etpvmtMKCrs?=
 =?us-ascii?Q?HNYNRUwKufTjykdYNPdpqw4ao2MgIk/DfGsyx3zcJhjVDcvIzmcrW7TGmfIE?=
 =?us-ascii?Q?FS8r+Axj8EULYcZLhLt+e1bdNUwpxKytYWQH/jStFLdqkiNhg3LzH+TboVVw?=
 =?us-ascii?Q?VMvclXpnVVhfg3/A9Yq6XSZt5rPUgVo5kWEE1X/pATYwvQYhoX6qXtpzbia6?=
 =?us-ascii?Q?6LWL7n/2BkrQGl0WFZLAkaKjGkW7uQoOcPk2XWaLxb9g6RWP3nRhvBiT0DIV?=
 =?us-ascii?Q?uFn1mufKOkIbYanaxwI+K1hjNrDe8o921LJU+NUsKk8FOKyOX7y8+FhLMHs6?=
 =?us-ascii?Q?EGlBZFJyodOgwyka7Kxj3jBZSqWR7b9KZNaa3qMRMfrL6IBtCFZkvQwLSDfO?=
 =?us-ascii?Q?XwFOCl7mjNoa2VvC490KT3MYaC5GNEFIyRNq5SIrCUnReiUueIWxlganvU+9?=
 =?us-ascii?Q?v/G9ICQ6V4wlZMeMXAyMXJHI/fSf6D8dHEmhhKhUv/Sgn61dsGPeChcnNtMQ?=
 =?us-ascii?Q?wzEZaK0U7zkg9YX++ParTIP9WRqQR0iHXd3HnkAX/UOQwvrMEC4MKA1bfWYg?=
 =?us-ascii?Q?qAx4VdIvjsuGaQP8lcwTHIUdeRs3z0saJbF7nhGuYVbBzIlQAny7BYVPpQRU?=
 =?us-ascii?Q?QnLgf6RuSboW+x5sRODK+vBsYaSsZllj2FaGtTe02ulYr7SnmJp890Li83GJ?=
 =?us-ascii?Q?XRaYOr0DO9eYPvEkAKsk1VHv5pRqxNBznW8hVb/Ne8BAi8PA2z5zGiipru0S?=
 =?us-ascii?Q?rlgVhqVboCMt+deXGWhRgoQ8Caw/lcnJqFJTC84FAXZbMlxN9TRvScjA0p2a?=
 =?us-ascii?Q?KeCmgSwovquouWq5eChiVVjEyQoWCcb1eZVwH4VePdxw/m500ui9VfMIdOkw?=
 =?us-ascii?Q?uCNCM5WbOOl0glo9SC8Qn2XEwCihg/OKst9OKPd3Mf2UKDD3stcnP/ta1M6/?=
 =?us-ascii?Q?oIWSYbZW1xa2UuxpbCbIHsKVNpDG3g459Q2EqgY7/mbUlVODmHzfsqWExBuD?=
 =?us-ascii?Q?tScssUZBfmLgDsg5Rd8kpZAVwQKfOtBa3C64WZ/xNtA2tvpHJhr0N+XFcr+O?=
 =?us-ascii?Q?ogL9fuFgHbbYYm95IvakUItIAtJVWthBE0ewtRrHJRDEbCV5+KpiaGNGhu4G?=
 =?us-ascii?Q?W/y8lZDf5irFhkgdjc7ooXzIyuKxpE2eSQVSNn9JxpGkB4zMoNIc7w15G6Kk?=
 =?us-ascii?Q?nc7WQM57iEsZnQMve6IrHEhEEcvTym4JWNaL86dnJem8xTXtKrHyiYkPemEW?=
 =?us-ascii?Q?d7DqIz1qPQCXTzzZP8Mx9s0VThBXdzO5afNTuPPShclZo3m95/fgNSgobnIR?=
 =?us-ascii?Q?fLALMokWGxzs0quiAvAPcdvjikNibjRNfBVYkRQlGCGsCrdy7lPkzwS160O1?=
 =?us-ascii?Q?qjteWiegBeexHlZseQLt8u1MHUqfah7ytYeZcDA7VnY8mD8QcTJcw+f+KtRV?=
 =?us-ascii?Q?IBbuq2oADR3L82YwKyFxGwNuZ2QgoTYnWpy0ZtCPB1WyheOx9lw4YMLVkqC8?=
 =?us-ascii?Q?AqFRRNouX5iQEIVJk0WWwMqp8Cm0TUlLSUAGp2yRSLjvAKO3olEi9Ysv6fXG?=
 =?us-ascii?Q?ZxvekCYzaO/lHOlE/98MGUe/MEgi5wcAXdoU9tHPL2Tph00tFJOYK2COikfc?=
 =?us-ascii?Q?kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806e610d-2662-4fa8-a029-08de2c3180ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 14:47:06.2263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bfk7t4TbVAE0kMwZRWITZwRcQXW1zWyAlDTzCpOhG2Dd026RGWMFmG/zg7f3rHuNTpFy6u2PCFMFpLEdlqsPU/4vWceMgNQSfxnvXfbDUMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Tuesday, November 25, 2025 8:07 PM
> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> dev@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>
> Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU atomic operations
>=20
> Can be done but we are checking atomic operation in multi-GPU scenarios,
> so idea was whether all GPUs performing atomic operation correctly and da=
ta
> can be read from CPU. GPU1 write - GPU2 read implemented in other
> subtests.
>=20
> Nishit
>=20
Okay, if that is the case, it will be good if we mention " testing GPU -> C=
PU coherency."

--Pravalika
> -----Original Message-----
> From: Gurram, Pravalika <pravalika.gurram@intel.com>
> Sent: Tuesday, November 25, 2025 8:01 PM
> To: Sharma, Nishit <nishit.sharma@intel.com>; igt-
> dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.com>;
> Hellstrom, Thomas <thomas.hellstrom@intel.com>
> Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
> multi-GPU atomic operations
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > nishit.sharma@intel.com
> > Sent: Friday, November 21, 2025 9:56 PM
> > To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> > <nishit.sharma@intel.com>; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>
> > Subject: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
> > multi-GPU atomic operations
> >
> > From: Nishit Sharma <nishit.sharma@intel.com>
> >
> > This test performs atomic increment operation on a shared SVM buffer
> > from both GPUs and the CPU in a multi-GPU environment. It uses madvise
> > and prefetch to control buffer placement and verifies correctness and
> > ordering of atomic updates across agents.
> >
> > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >  tests/intel/xe_multi_gpusvm.c | 162
> > +++++++++++++++++++++++++++++++++-
> >  1 file changed, 160 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/intel/xe_multi_gpusvm.c
> > b/tests/intel/xe_multi_gpusvm.c index 471be6449..4e817edf9 100644
> > --- a/tests/intel/xe_multi_gpusvm.c
> > +++ b/tests/intel/xe_multi_gpusvm.c
> > @@ -33,6 +33,17 @@
> >   * Description:
> >   *	Test cross-GPU memory access with prefetch in multi-GPU SVM
> > configuration
> >   *
> > + * SUBTEST: mgpu-atomic-op-basic
> > + * Description:
> > + *	Test basic cross-GPU atomic increment operations in multi-GPU SVM
> > configuration
> > + *	operation on GPU1 and then atomic operation on GPU2 using same
> > + *	address
> > + *
> > + * SUBTEST: mgpu-atomic-op-prefetch
> > + * Description:
> > + *	Tests cross-GPU atomic increment operations with explicit memory
> > prefetch
> > + *	to validate SVM atomic operations in multi-GPU config
> > + *
> >   */
> >
> >  #define MAX_XE_REGIONS	8
> > @@ -42,10 +53,12 @@
> >  #define BIND_SYNC_VAL 0x686868
> >  #define EXEC_SYNC_VAL 0x676767
> >  #define COPY_SIZE SZ_64M
> > +#define	ATOMIC_OP_VAL	56
> >
> >  #define MULTIGPU_BASIC			BIT(0)
> >  #define MULTIGPU_PREFETCH		BIT(1)
> >  #define MULTIGPU_XGPU_ACCESS		BIT(2)
> > +#define MULTIGPU_ATOMIC_OP		BIT(3)
> >
> >  struct xe_svm_gpu_info {
> >  	bool supports_faults;
> > @@ -60,6 +73,16 @@ typedef void (*gpu_pair_fn)(struct
> xe_svm_gpu_info
> > *src,
> >  			    struct drm_xe_engine_class_instance *eci,
> >  			    unsigned int flags);
> >
> > +struct test_exec_data {
> > +	uint32_t batch[32];
> > +	uint64_t pad;
> > +	uint64_t vm_sync;
> > +	uint64_t exec_sync;
> > +	uint32_t data;
> > +	uint32_t expected_data;
> > +	uint64_t batch_addr;
> > +};
> > +
> >  static void for_each_gpu_pair(int num_gpus,
> >  			      struct xe_svm_gpu_info *gpus,
> >  			      struct drm_xe_engine_class_instance *eci, @@ -
> > 71,7 +94,10 @@ static void gpu_mem_access_wrapper(struct
> > xe_svm_gpu_info *src,
> >  				   struct drm_xe_engine_class_instance *eci,
> >  				   unsigned int flags);
> >
> > -static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> > +static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> > +				   struct xe_svm_gpu_info *dst,
> > +				   struct drm_xe_engine_class_instance *eci,
> > +				   unsigned int flags);
> >
> >  static void
> >  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
> > drm_xe_engine_class_instance *eci, @@ -162,6 +188,35 @@ static void
> > for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
> >  	}
> >  }
> >
> > +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> > +
> > +static void
> > +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
> > +		  uint32_t *bo, uint64_t *addr)
> > +{
> > +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> > +	uint32_t batch_bo;
> > +	uint64_t batch_addr;
> > +	void *batch;
> > +	uint32_t *cmd;
> > +	int i =3D 0;
> > +
> > +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size,
> > vram_if_possible(fd, 0), 0);
> > +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> > +	cmd =3D (uint32_t *)batch;
> > +
> > +	cmd[i++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> > +	cmd[i++] =3D src_addr;
> > +	cmd[i++] =3D src_addr >> 32;
> > +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> > +
> > +	batch_addr =3D to_user_pointer(batch);
> > +	/* Punch a gap in the SVM map where we map the batch_bo */
> > +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
> > batch_bo_size, 0);
> > +	*bo =3D batch_bo;
> > +	*addr =3D batch_addr;
> > +}
> > +
> >  static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
> >  		       uint64_t dst_addr, uint64_t copy_size,
> >  		       uint32_t *bo, uint64_t *addr) @@ -318,6 +373,93 @@
> > copy_src_dst(struct xe_svm_gpu_info *gpu1,
> >  	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);  }
> >
> > +static void
> > +atomic_inc_op(struct xe_svm_gpu_info *gpu1,
> > +	      struct xe_svm_gpu_info *gpu2,
> > +	      struct drm_xe_engine_class_instance *eci,
> > +	      unsigned int flags)
> > +{
> > +	uint64_t addr;
> > +	uint32_t vm[2];
> > +	uint32_t exec_queue[2];
> > +	uint32_t batch_bo[2];
> > +	struct test_exec_data *data;
> > +	uint64_t batch_addr[2];
> > +	struct drm_xe_sync sync =3D {};
> > +	volatile uint64_t *sync_addr;
> > +
> > +	/* Skip if either GPU doesn't support faults */
> > +	if (mgpu_check_fault_support(gpu1, gpu2))
> > +		return;
> > +
> > +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> > +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> > +
> > +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> > +	igt_assert(data);
> > +	data[0].vm_sync =3D 0;
> > +	addr =3D to_user_pointer(data);
> > +
> > +	*(uint64_t *)addr =3D ATOMIC_OP_VAL - 1;
> > +
> > +	atomic_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0],
> > +&batch_addr[0]);
> > +
> > +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
> > +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> > +			    gpu1->fd, 0, gpu1->vram_regions[0],
> > exec_queue[0]);
> > +
> > +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> > +	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync,
> > +			     sync_addr, exec_queue[0], flags);
> > +	free((void *)sync_addr);
> > +
> > +	/* Executing ATOMIC_INC on GPU1 */
> > +	sync_addr =3D (void *)((char *)batch_addr[0] + SZ_4K);
> > +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> > +	sync.timeline_value =3D EXEC_SYNC_VAL;
> > +	*sync_addr =3D 0;
> > +
> > +	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync, 1);
> > +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> > +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
> > EXEC_SYNC_VAL, exec_queue[0],
> > +			       NSEC_PER_SEC * 10);
> > +
> > +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL);
> This test only doing
> GPU0 writes -> CPU reads
> GPU1 writes -> CPU reads
> GPUs NEVER communicate with each other
> Only tests GPU -> CPU coherency
> Missing GPU <-> GPU coherency
>=20
> am thinking if we do below operation it will be good.
> GPU0 writes -> GPU1 READS what GPU0 wrote -> (GPU-to-GPU)
> GPU1 writes -> GPU0 READS what GPU1 wrote -> (GPU-to-GPU) This test
> GPU-to-GPU shared memory
>=20
> -Pravalika
> @Hellstrom, Thomas is my understanding is correct?
> > +
> > +	atomic_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1],
> > +&batch_addr[1]);
> > +
> > +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
> > +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> > +			    gpu2->fd, 0, gpu2->vram_regions[0],
> > exec_queue[0]);
> > +
> > +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> > +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
> > +			     sync_addr, exec_queue[1], flags);
> > +	free((void *)sync_addr);
> > +
> > +	/* Execute ATOMIC_INC on GPU2 */
> > +	sync_addr =3D (void *)((char *)batch_addr[1] + SZ_4K);
> > +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> > +	sync.timeline_value =3D EXEC_SYNC_VAL;
> > +	*sync_addr =3D 0;
> > +
> > +	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
> > +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> > +		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr,
> > EXEC_SYNC_VAL, exec_queue[1],
> > +			       NSEC_PER_SEC * 10);
> > +
> > +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL + 1);
> > +
> > +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> > +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> > +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> > +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> > +	free(data);
> > +
> > +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> > +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> > +
> >  static void
> >  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
> >  		       struct xe_svm_gpu_info *dst, @@ -330,6 +472,18 @@
> > gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
> >  	copy_src_dst(src, dst, eci, flags);
> >  }
> >
> > +static void
> > +gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> > +		       struct xe_svm_gpu_info *dst,
> > +		       struct drm_xe_engine_class_instance *eci,
> > +		       unsigned int flags)
> > +{
> > +	igt_assert(src);
> > +	igt_assert(dst);
> > +
> > +	atomic_inc_op(src, dst, eci, flags); }
> > +
> >  static void
> >  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
> >  	       struct drm_xe_engine_class_instance *eci, @@ -337,6 +491,8
> @@
> > test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,  {
> >  	if (flags & MULTIGPU_XGPU_ACCESS)
> >  		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_mem_access_wrapper,
> > flags);
> > +	if (flags & MULTIGPU_ATOMIC_OP)
> > +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> > gpu_atomic_inc_wrapper, flags);
> >  }
> >
> >  struct section {
> > @@ -357,6 +513,8 @@ igt_main
> >  	const struct section msections[] =3D {
> >  		{ "xgpu-access-basic", MULTIGPU_BASIC |
> MULTIGPU_XGPU_ACCESS },
> >  		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_XGPU_ACCESS
> > },
> > +		{ "atomic-op-basic", MULTIGPU_BASIC |
> > MULTIGPU_ATOMIC_OP },
> > +		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
> > MULTIGPU_ATOMIC_OP },
> >  		{ NULL },
> >  	};
> >
> > @@ -380,7 +538,7 @@ igt_main
> >  		}
> >  	}
> >
> > -	igt_describe("gpu-gpu write-read");
> > +	igt_describe("multigpu svm operations");
> >  	for (const struct section *s =3D msections; s->name; s++) {
> >  		igt_subtest_f("mgpu-%s", s->name)
> >  			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
> > --
> > 2.48.1

