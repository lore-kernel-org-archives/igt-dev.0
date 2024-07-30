Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1CDC49EA1
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 19:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E3D10E313;
	Tue, 30 Jul 2024 19:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyWBF/vq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F23D10E313
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722369119; x=1753905119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MZ+ggf8SNdVPukatWPbDiXA2gvPurfLrJJmyC8NqKsc=;
 b=fyWBF/vqU5Fzmhw+dwpftr7gihG5Tg0hJ7ygevTxVQkLlZf1UgcCUrYe
 4aCD7t9ZOihaZKc94XiqMKvLOaMlEGxHQRAf+JtyKvZl2FpJaFrXY9O/H
 9Hfp+rNtX18Jn533fK++zZvpNmiXdUlt0YfLsmVVhgyhRWeLbPxUmcs9J
 LcGBxcf8l2vAWD8GTFwO9qAfngcFpUg5qby3iK+A1FVM1fvKW0ei0VToc
 Tb0fCwiMhd/rcSe4NpQCa/qt2qcbh1SuIM2m8dTokeBFW6AKDdeveFp1B
 FhjDFxS5Xe3X6oUBZlkreYnZ0BeF9VzZEB0SzeDDp+wEn1OOQZExqetwd A==;
X-CSE-ConnectionGUID: MCgDoJjgQU6pFqJNcOIIgA==
X-CSE-MsgGUID: Zaz7/lo2QXa41Kguy+LPbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31604839"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="31604839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 12:51:59 -0700
X-CSE-ConnectionGUID: lCIBMrfuQzyICvM0FSoEHw==
X-CSE-MsgGUID: XV6QoLMFQ5eoOBVHuNwTAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58771073"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 12:51:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 12:51:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 12:51:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 12:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXB8+IT2eg78x3FC2m32mVgSJ30DzuDuX6ZfxHegKtpArb4SREraPbhdp2Mz4wkFrKZGizK6caXlp3pEfHUkqUYCGrzZGTcJssytfiFfraMoorOpc7MCZvAodOeNcSAGb3olHRboBFpO1uJPme4OM4bibE7WIWoy+lF2MbFjU/fkl1Rvq7HKILvEddkcZhsVGuEoialxzEsUaeMPT8I/jHSOE9SgEJT4ct20qt2IDqFzo+BHQq5JLW3T0ES0SMBQKKCzUGAGuAWut9g6ARKbGNNtdVaIE2woeHv4z6bQb8bkUKLGXRwVC7E6yyshh7Kz0FtVdOhoo2T4XRXCaRvd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5W93IHg2kJhZIpWmQK1+5NI5hOMfDoRjICsDdLp1A8=;
 b=AVvPa6OusOid+usvfrUxGHG0+jXpM6/Z05LawhZguIlIRn0TGzuo0Pn9y8sK3MuS+6ZhB8qCpSuIjmxE5WbS/tORd3JolzyJlVw10mWF5t7QlbX6xs10dMw/Ro0gls3GxISJ9phyTPWLoMViHcV9OCGzAhtFIvr93X7ElcIEzxvQWmF8wvgfUQYudykchV7DtPaYBU+DCZ4k1pHQzMp4Jqfn4kAyIgcyPiKyoVtEcdthD2NKvBMqbtenOYn/Oy/ikrWJnk4UoWOlpdOd3w+Tk0PMqbivTo8XaUmqFFwrpGXkMxnhax+N9Ni17NY6lr9jXWRpbgepvgUfoWN4KZ6YZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 19:51:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 19:51:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Laguna, Lukasz"
 <lukasz.laguna@intel.com>, "Kolakowski, Jakub1"
 <jakub1.kolakowski@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/intel/xe_gt_freq: Skip test if 'freq0'
 attribute is missing
Thread-Topic: [PATCH i-g-t 2/3] tests/intel/xe_gt_freq: Skip test if 'freq0'
 attribute is missing
Thread-Index: AQHa4qCEH5T5t+kCsk+GFx1PQx2JSrIProGg
Date: Tue, 30 Jul 2024 19:51:53 +0000
Message-ID: <CH0PR11MB544405B892B19EF8CD5679CFE5B02@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240730164232.286232-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240730164232.286232-3-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8254:EE_
x-ms-office365-filtering-correlation-id: b746ca86-d733-41e6-26c4-08dcb0d10fb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?izSlsI21qbSoRutGfQ5uesV9iXQBYls091COVQqknb63XgfGjFZF6CVydJr/?=
 =?us-ascii?Q?0t2B0XNbtflywVco3+7wdGu03ilHAZd7zyBCF3nCVKDGx6AmgY5yiToEOXOB?=
 =?us-ascii?Q?KpsD78AiHZN+EZzDvAZE5U68Zy0HIUhwVkReglRZp2OjiQksnYC09Gwn/Sdk?=
 =?us-ascii?Q?o+7t/tUt3Fimnegxf4J4hSiV+vp6ffHQc/KQDXTFGRD4QfmSJ4LIH4H6aUv0?=
 =?us-ascii?Q?0TtRaqWeTMsWzfTTHv8DMdMKTKg5jlkbRd2Q9ZRB6M4Ig8d7fPikObNUIV17?=
 =?us-ascii?Q?9RLV4g2hGXSd0VY+IzBxG3mBJr6+Oi/OOMjZoMwJirK/0OeW/i7lbyuAyAQq?=
 =?us-ascii?Q?4AwYkypYaEaesT/4Gh84fk3jgaPOXSEd7DhzUIYmAGnzoT5V7YaRPmBSs3TD?=
 =?us-ascii?Q?ULcbzp7UYb7iFgMMZc1Cm6JxnIQ3eaqhpnIzzdjXTp7JzUjdHx334d096aD3?=
 =?us-ascii?Q?Jvxbyrc2jBICnUJSAGBiAOwxtsBdHDsWFBYpuqP2AS9AisvMBm+pyWnq1lMR?=
 =?us-ascii?Q?DnKMa60zRfwLkzg8vsKY7aeqwdOt9nUHGdam0hRbR3xb9YQhUscplDPKn3a2?=
 =?us-ascii?Q?0dMZ0gmNbHekkU59I/PumleP77AOqkxhbJAjyNV0I4u0wH1gdMWf/UZzPFGs?=
 =?us-ascii?Q?xb5XissTusTLJiI7BBNkH8RsIutAGrN94B9dZQF8vopN1NbF8rDM5QBuZxG5?=
 =?us-ascii?Q?4ICi3+Yck7Ja4x5bK28zD+efJsZtphv0b2lGDQR3KfWlTONqV5Mqp4t9hKV1?=
 =?us-ascii?Q?6gMqzrSOr4J+O7rYmS1I7S5niInkvyzZBVXf5euFRMUoCNJszt+tPangqoap?=
 =?us-ascii?Q?ZcsKyXFtfpA+x7uC3rEt3D2Vqj5/KjK7PsG72for+KgxbmG+MDjHSIaERHXD?=
 =?us-ascii?Q?j93XMjJkoKNvwtbXpY4GplGA9DKDiG6/DT3OZltpfPAs9yStqH4KVSMFIJMr?=
 =?us-ascii?Q?NyMUhJX8ACLDCzRAOakQWrcDtQ6J3YUg53rqw3Q2EeXPPmaWm1jEpGqhxmwN?=
 =?us-ascii?Q?Ito+MXZHASlw/O2yC5k6eti6IGRcsFe192JW3k+mgKXvn/ZTNvUXN4L27G7r?=
 =?us-ascii?Q?UgYEa/SMsXGFZtFIZC+8hVHEUaP8tpVzijbMyLijGn8oST0N1nPort65Vv4E?=
 =?us-ascii?Q?sqBJweTj8VuFI2dkUJujnmOr5Dxz1w0PE4HRjF5WqvIp0C/BE5O2cq9qtroL?=
 =?us-ascii?Q?M2/dHHWYsBuEoZk+url+c2KbF59vbZKNWAm4uoHzWwzqvxEXX+pCCTzCa3Mo?=
 =?us-ascii?Q?TDb+0ex+3sZcBo5szwRbKUuFRVI4AN2d4MsrrPXNE0gNwtqcs8ZU76AfVopf?=
 =?us-ascii?Q?y3XlzIe0khcurUfuOkFi6TOCDqFbg1w02kYyG/KZGY0E7xPM1uwtQTz7WvAU?=
 =?us-ascii?Q?H44+6YFR4XZhLj8NtvbX3XTpJwhcBuPacRIgYw7e6urQDo/1sg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lg3ayI0USYGUyEu0/gE3tGZSHs4h38pQbZUgD67M6P83B8bWK52FD18Ejg99?=
 =?us-ascii?Q?3UqjfjShrWuAL+yRI4NbfWHPgk+MWvBXvbv0qyQWx13q8j9wWxaDMfXB+vOW?=
 =?us-ascii?Q?RqONdbFKMuJ6FFqleOMKmb9opB/75dVnlc38ys7Uw3fdGPxqc6OeqOnISvpm?=
 =?us-ascii?Q?Sj5okvK4cip+RYGkXI1LwZqWDIU4KnE934navhNAHcqGVU4m2GCpF+Tr/NOb?=
 =?us-ascii?Q?zhGgqWxyZk4jo5S4wfUH472OYQuaI/vV2qku4iqGWU4oL5Va3DlVwIgEJ3U4?=
 =?us-ascii?Q?RmFUBR1AfHhiZ9iFo8AXI8MqBAOltqHKTpzG6+pUMaD/YE/b/Qu3vV7HRpS/?=
 =?us-ascii?Q?dwgKApwK/5oBMg55q+7dRdjZgRfgPojSjQRlgiW+75z4iOn5S9JXJTetqFz/?=
 =?us-ascii?Q?yLOmMsCr/rBw2H/HIH+qXIUsqzEdpobWNoQOHCe5w7gKYIoYqn9Mf5FGif9g?=
 =?us-ascii?Q?2z4adYHD5QKkEgwLYpt0BYjAsD1apnEiZJSc3Ce3swWh2gHszAPfRcnKUuCt?=
 =?us-ascii?Q?Udd4HXDAN9YE8RICiPITPaqZEpOx48auBX3wYxme67g5GAFidKSzY9h94g31?=
 =?us-ascii?Q?r5E3pT4obEij2tQ1/nyepGMmJbK2jnAbPwhm66WmjWFLVXy04ytTEvHqXGUF?=
 =?us-ascii?Q?ewnKiZWNMjFa8EK2dJJ8vugVYDqcqa1FhuV/6jxIEI8z2ooUHFXX+57CBraZ?=
 =?us-ascii?Q?9XSPqsbj814zbma1kIaHkqkTzlg+Ezcp3yJfF557CupTrJlI6ZVr2BMCxGOv?=
 =?us-ascii?Q?r+bhi1CQRXXRkn1VwgLgM3V2Qc+r0r9Zl3iLUpMhdROrzUXtK4ZInwJk2S6b?=
 =?us-ascii?Q?VpWBC++xvw3a3OSoaRA6WA0XmrFN7b6AEc/LtoDMlc1HWTDQJeD8WM6hcRUv?=
 =?us-ascii?Q?mab+pE8c+TeDjJiA40qM4i75v6AZoilcaCXTYklZD+NuZPUHCRiHq9tmNmk3?=
 =?us-ascii?Q?ix4vUwxFEYRaiMGm/eqqh4wBOncmXZqRSmZPlnLN04qetXfzNPWGNCuKYVrp?=
 =?us-ascii?Q?06ZFw1C0BPnhV6UHGCushecOaVbIDaAgue7c1o/WuzKpNTtbWGwVZyL9PDV1?=
 =?us-ascii?Q?Yd/O/qGP5ykqdzdeHLZnlUIWawWlpI3hguhBte/GFWDJBA/Jk3aC+RM0j7nO?=
 =?us-ascii?Q?Fymz1L9/mYylubdPBHj54HUscetbvCe0Fe6NGHOAR8R+oqhZxYavaDkKZqGc?=
 =?us-ascii?Q?OEWfqnd02O/EC8NwK26gxce3ZmwVVEXkvuKZE5/OAOmz7HT0j91idNCaGSPk?=
 =?us-ascii?Q?rw2QALq83OXKUGxFLYD7FxH12oM4dKL6njy4d6ldL8zQmvsGuUWtLYnWpraU?=
 =?us-ascii?Q?mIv5lKJeWUHNbIrR8zlb6p1a2Xoo1Uc/x3Rt/qkLE+1nyVSoJmeOx5YYw1tL?=
 =?us-ascii?Q?qCe092D0qzCokG3qrBnMlhjZcufUv3PXkDa6jGF4J7dIMt34TqoSYRFkwhHR?=
 =?us-ascii?Q?ki95k6qtd4BQ3PizIqusoSKTnzp84I87vYebhCbCxkt+eYhZ/E0lhIh8T6y/?=
 =?us-ascii?Q?x3I97KdF0grEpVWuMVbAzkE+fDUa1J99OWe0WoolECN2MYACVPW4QXxTsi3t?=
 =?us-ascii?Q?RBJV8D5kPFQCPeAFVvJeZ0TUp2FbT9xNygxPVpxe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b746ca86-d733-41e6-26c4-08dcb0d10fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 19:51:53.7429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHUbynM4NuwjU4BtzMwKW9t4bDejpgFhIXu3Rwz28yh0ExGX8zks0rHhAfiBtjCNNzcU+2g0pbeVHBmQhD6DTbfwgXtBscSOJ7cqqgnjUBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Marcin B=
ernatowicz
Sent: Tuesday, July 30, 2024 9:43 AM
To: igt-dev@lists.freedesktop.org
Cc: Tauro, Riana <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel=
.com>; kamil.konieczny@linux.intel.com; Laguna, Lukasz <lukasz.laguna@intel=
.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_gt_freq: Skip test if 'freq0' att=
ribute is missing
>=20
> Add igt_require check for 'freq0' attribute to skip frequency tests
> on VF devices where this attribute is not present, preventing test
> failure.
>=20
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_gt_freq.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 93ebb5ed0..0a0efeff5 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -414,6 +414,7 @@ igt_main
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> =20
> +		igt_require(xe_sysfs_gt_has_attr(fd, 0, "freq0"));
>  		/* The defaults are the same. Stashing the gt0 is enough */
>  		stash_min =3D get_freq(fd, 0, "min");
>  		stash_max =3D get_freq(fd, 0, "max");
> --=20
> 2.31.1
>=20
>=20
