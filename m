Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35C4C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 05:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB5410E888;
	Wed, 21 Aug 2024 05:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D++3MBpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C22110E888
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 05:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724219410; x=1755755410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C6LQrJtgf/PnS35wK5dKll1SLlPac6kiWKpyEucpxOg=;
 b=D++3MBpvX5YEiIfb25q8o20rakS/2iUOIygU5OY465DsKZa9JxgZAqBM
 JJUAb/qzvRCCoGvS0Rc+W46uP+l/K6GgHNSF7fgRyFUD5+Yei3PbW+tYo
 iMvM2RKnwMm5H/MGZeNayM9bOZRf48MpTD3q/XHbOqSAXfF+UweCuOAl3
 daNkh2F/tK+SU0B0p4VESM34vpMoKnmxaX+grMr4kuzHGd4iECFFIBNVR
 YqgUTeWSAC5kM6kJjdVwMMGA5/KMllaocRJxKzd6QDNfztEt6gBNka01g
 IUgK19LAhXAYecnu9PWUrrLzmO6dx1/yEse6YZv9qxiTOtIFeFQ2AXkVu w==;
X-CSE-ConnectionGUID: FBqqy6l8SA+pZdc8kLfSrg==
X-CSE-MsgGUID: KvqRWVh0R1iCBme4DihwcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13127158"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="13127158"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 22:50:10 -0700
X-CSE-ConnectionGUID: tymuzZf7S+CKZM5RsQvmxQ==
X-CSE-MsgGUID: nsbC3tP/SFuqm5m1fTScdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60946843"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 22:50:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 22:50:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 22:50:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 22:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRkjO0boZ5Y6EOSHmAiEnKijjDhDt14cn8bIgdFodgsRIpc/X3342P41ldnGLUT1Z++qI5xmSF5Bpt+NKOM2/RYLvQY1DOGeCuqk7VOO346x+Xg10jTzjm6TxglX1GWRn2V8pEoU97gjaHD2mj9gmuofIrtEYePvvA02ECpCtCNScnmvcF+cTW708Xe5amAQd6tGtPGXsRVtg7/0K6F1RynxqPDcsCsj1v7kh3S4DwCLilQsR9dAspVfJtKKAtnt3F1BNkRxsXTJu/qRA7HhSBypmRttNlP4FCuYUTe5Z+/jIW7by8mS2WcBicU2cipY1Rq9nt7KqLeg5HDLM2Ew8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oESVCpG5xD67IglLisekSyvRyt0A1CF2w1GpbtJ76z0=;
 b=chlEpsk5DoqNlhyjx9Cm5Lctczg+68Q02usnnMZ52XTnoxmpu4AbDSVH6wTzruIAANSAxnpassqjVasfHUxl94+dZVn8fFmCOZ5Wn9vUitgdNHKmSlJ9i/OWCS4RqzZLis9UwU+IyIm8lS+FQyMYJMCqfu0sllqaCoFpm8OuVn1YBDaX6W2LX+SCghSi0loMNGIyzzA14B1QpaudgZtyNvdWbt0pL0WTtFqcU4QooG0Uffo1AsmSL+EQ7pvdkBMAYFhXga2GR3CEdpMcLnrbKtNl5FyZ+CPT3vrNHmP1psME/meJujYeRnargY5DTTTsuq9loh06XyZNcmEEiiBeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 05:50:06 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 05:50:06 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 3/4] tests/kms_vblank: Add more logs to skips
Thread-Topic: [i-g-t 3/4] tests/kms_vblank: Add more logs to skips
Thread-Index: AQHa7US1j3gHmHTTM0asC151qHpiUrIxP9FA
Date: Wed, 21 Aug 2024 05:50:06 +0000
Message-ID: <PH7PR11MB6053DAB3B8D920F5233D2C6CE78E2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
 <20240813053845.2567954-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20240813053845.2567954-4-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB6793:EE_
x-ms-office365-filtering-correlation-id: 3c29360b-78c7-4d9a-e749-08dcc1a51be2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bYeril0OC2WOrUyyogFi3rUUOt5EIOidiHux/kp+FlWdGx9UqBP3PyC80+Or?=
 =?us-ascii?Q?U2VgnsPPwxEExyQzcm4ISSxnRkgebLhakU1BtWPBqX53i9Qiw1g8tbltnIdv?=
 =?us-ascii?Q?73BSCDmohDud45uuP08xuX9xyuFgFVI//Pti0AohZVnQEyLwtphtBDgJVE2k?=
 =?us-ascii?Q?ZyGJh96nzH5oDF91CgAdvCB26YOD9j0xdSYxaEXYGeeEETBKcVD0Urfft6Je?=
 =?us-ascii?Q?ZfoNtet59mmwTE79B7PV4jTEgXDgrK9dKHXPrBdVYNm40Ut8Qeg/qNrRYicZ?=
 =?us-ascii?Q?1CJlNwwA55YeTsBdgt5JDwu+3d7FFyXkpLdQy8bLvf6uNXRHSRPIo744vmGS?=
 =?us-ascii?Q?DkWiy1QuFcDcT/bCxZZGlGuTh97WQ+r1T1qb4/1ux8U1RbSNHlKc8J3iMwPA?=
 =?us-ascii?Q?4Oc0DY0XIOX4e8VDRbdCEkl83NHMEOgdYUwDqbQAeJfCYt6RMmxRF6YTl/ia?=
 =?us-ascii?Q?T3EfhmZ8jhAKS0Ixm7OEOc2TpeF9e4+JiRR24S0r+rLHGk1OGe1c5jaW7HUX?=
 =?us-ascii?Q?eCQ8S7SIKRDEpUEZ/9eSMlsvYAaEriwe+6dcaR8HmjPJD1byVHh9kkfZwUu+?=
 =?us-ascii?Q?Y7WuOJ3bQMkycRJKr8Ti9/Aufq4SCIS5Jw3nQvt6Qr7hxTeCdzDNQiZYb8Sq?=
 =?us-ascii?Q?NY8nZXmctuF7IFqYEirDfAucNxPpa12LBy+41A6MZpX6Ps28aAL4EF608gky?=
 =?us-ascii?Q?X5FWqhQ9vX9DzrWB7+9tiXGBDadj82GGahk5WZLrDDXfaTFjblFyamJb1BcU?=
 =?us-ascii?Q?eA69NAWhkw6A0S6tnEuzX+IUDyYXtalsIqfyl4PFvGTWuU1k+4ONrF8Fc3eQ?=
 =?us-ascii?Q?TsqtAHhA90o6WLvn3OT43lTgA+UAaWNweIr6fKGpRgu2MDIae80CvZX1HIos?=
 =?us-ascii?Q?PCXLDJYK7X9LvBGXkKdOVCL4ZfKuCNdwkrURmN8rgtpv01+ZT89SkocWXiCO?=
 =?us-ascii?Q?iOKHhnY28R2ksmYgS+Bn/h7p3B0MQb1wwIDxJGtsXgfI0rzsJi9ITvvuvxu+?=
 =?us-ascii?Q?Ebtd2qpVMrs4VQCfMhE3HOhnLRYvLb0f+4wliAw7y8exsBYAJmUaHkdi6Q7M?=
 =?us-ascii?Q?SNcLIdsudiaV3EpAjP4kykxvSTe/3j/WpBqdsjfUziMMAwY6e0AJr6YSNl3c?=
 =?us-ascii?Q?/qrtU5gVkXpuzAXvMSSyorcvX5mmQtVXUi43xM0UBxvPJolRsKIPHPjTuw24?=
 =?us-ascii?Q?yQ/x8aWdSDv33LpXpx+70qbKqpdpoWd2Iu5+MR6LrTEkornpEatmCFIRTYy7?=
 =?us-ascii?Q?IRGlLJ+Lai4+yMTkRT9jrWaXpIB6kFTfMEs/EFeuA39ARP9vehoBPQqMNeOi?=
 =?us-ascii?Q?yGqsagTc8kf5MjdBnMW3VI4pykLWGe+3cNE2YQFuDSE3uYr8QNWOdOKMrO44?=
 =?us-ascii?Q?tEnN/7Lzt7RtMuGC1PkBHX7uwK1Bbp34GEcWB1JNqYprnFV37w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J8gAzvJO9CWPYwpD41l9poUh7+CO2rho18kaj9DnajeP6E/PjdQPcpNw9K4q?=
 =?us-ascii?Q?xFSX9CJiWQGvPwUcuxohNiXcGFUs6Y27qGTV3/TU1+NF1PD3qWjYvfaESWHM?=
 =?us-ascii?Q?3Zmz6CGYHB87lBcnUlnQNZE7qrH9nX9bBT+bjmHqb21493SDYfEQEyg1q/O/?=
 =?us-ascii?Q?cXYb+t9Vf5roVwg0CL8yD6ayBA6kZfmGnebbYhmwHNlIAhqvWgmfXXexb4jh?=
 =?us-ascii?Q?VPKgg1X1GKBJKtxJq2fBQNdJ7KKUiHJpcJlf/gqOYAvHHsckQiwhoQqNuGd7?=
 =?us-ascii?Q?/r2je5/5UEErBPhZd65dgozYVkadH7r/Utyd55OgHWyHsrm9aOhRp56VzIWv?=
 =?us-ascii?Q?2rGyL2Rpm7EvfFAKvPeuLW6gnpkerZ+8RGzAKW/bsejQivQ8v8WnCVE2/SbA?=
 =?us-ascii?Q?4Mo+zxk04ZKwheSkx8mZgTgF+DccGsvWkQpgH7OPcyW5WX4LhWo7LnP9F4pE?=
 =?us-ascii?Q?PMzV6FAyUeIuxegqdCm0hXywbXD3ylUwi/TgB5g2+9LAOdIxRwZll5lvnNNN?=
 =?us-ascii?Q?AC9VirZn6LOlXLpGrNMM/DTwiiQ7DIgL7tSW6rB1O10TKM8r7ttPOS2euL/x?=
 =?us-ascii?Q?oFtVjMKgHE5X9ospUlTrZuV9UoAG0Md2Lc1LaMAPQwhrpuM33XeKBSuZ40xa?=
 =?us-ascii?Q?zMqgUE66nT7OzBSPKBpnc/XlfDwn3zSz2wBa++8sfWz9LQgG8O8qMLTfBKiB?=
 =?us-ascii?Q?A+Ryr/AVCkbO6E5mUEVk4pFVLO0quZ4oAA0R/VNoeErzuNyXbGzxxlBcfrmM?=
 =?us-ascii?Q?QrT0PTP+O3K3nj2mO0WNavpQ+mZd962cWwsb8AGpKGEy6Yp8o4HfKDPc4tZh?=
 =?us-ascii?Q?lKwpggSPEDt0aFCw77I2hlfJrWqZlN+CDY88gk53e/fLMT4T1jDJJuH5Tcof?=
 =?us-ascii?Q?LAbo/fy2eiuk9XR64Xip0JOUAWN0dQ9mDO7On/m+qGY37vHIcuG8spiojY48?=
 =?us-ascii?Q?5mPJImPq0E7IMLusAbMdte2y5G2lEbgA/5c7ZLNHXK+syKJIeQPQwJBG59W9?=
 =?us-ascii?Q?8aKlmV08ZnIlu7n+0Go0pBSvbBhPjTJBhMNRGi2yC/24RQfSVa7mSRp37l2r?=
 =?us-ascii?Q?kl2+QM2Ba20QLDPoGb+doq2SmWf0EnFhz5EUMXeMwiA/oy+0cPD37jEzzZuM?=
 =?us-ascii?Q?+RBKK3jg81I3LTEjY9GoGfeUP5vD9ZmXJlcwKNOyb2bJFt4R2rnBMnMhTLL5?=
 =?us-ascii?Q?F857CulI0eT8CrWuhF2ZWhsWHxphzK/ujHzzvfmEI8T56FsS+ZFDojExyd8l?=
 =?us-ascii?Q?JYfJ62qVC/6OMI2QxruLUj7y1GUyyH9+UtpPGyMpVIPVv2VYwQVGDkpT/8qN?=
 =?us-ascii?Q?VS5N5+9Y0MImOQ+NwGqzpA3ifcETE1f7RTTXcqyYd/hZpJV/2Z4WlLT4L32m?=
 =?us-ascii?Q?E2mKUbeSHU9SFSRvwsjS9IAKtfgUtR5X55Z4fH/DKTByc/gJWLUbfx50TEJh?=
 =?us-ascii?Q?N/HIfXZco5MEEJ2ZS22hIkKY4ZJvg1Qg+adwqbyGhELvbq8TQKUW+2EGz8ZS?=
 =?us-ascii?Q?2GLYmbqOXi5a437ep2ftfu8xt/a1Zh1nmOw50YuHCsunTedKNtOp02Medut0?=
 =?us-ascii?Q?w5hF/fzE3ifS8NikPFUnA857tOv5sM5bi286y7hx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c29360b-78c7-4d9a-e749-08dcc1a51be2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 05:50:06.1292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8lgvzCbCop6SMXulY8m6C7un2wPYMDuYpV5ivUQQNjUGKDWjypRjOPdajnerOg6CydidLYrOqZJHTymXUdXdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, August 13, 2024 11:09 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 3/4] tests/kms_vblank: Add more logs to skips
>=20
> Debugging would be easier if we had logs available for test failures and =
skips. This
> patch adds print statements at crucial points to provide better insights.

Apart from the below changes the changes LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>=20
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vblank.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c index
> 696bc0b71..c53741b62 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -520,8 +520,10 @@ static void run_subtests(data_t *data)
>  						continue;
>=20
>  					if (!all_pipes && data->pipe !=3D
> active_pipes[0] &&
> -					    data->pipe !=3D
> active_pipes[last_pipe])
> +					    data->pipe !=3D
> active_pipes[last_pipe]) {
> +						igt_info("Skipping pipe %s\n",
> kmstest_pipe_name(data->pipe));

It exceeds 100-character limitation in a line. Otherwise, the changes look =
good to me
>  						continue;
> +					}
>=20
>  					igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(data->pipe), data->output->name) {
>  						data->flags =3D m->flags |
> NOHANG;
> @@ -544,8 +546,10 @@ static void run_subtests(data_t *data)
>  						continue;
>=20
>  					if (!all_pipes && data->pipe !=3D
> active_pipes[0] &&
> -					    data->pipe !=3D
> active_pipes[last_pipe])
> +					    data->pipe !=3D
> active_pipes[last_pipe]) {
> +						igt_info("Skipping pipe %s\n",
> kmstest_pipe_name(data->pipe));

Same as above comments.
>  						continue;
> +					}
>=20
>  					igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(data->pipe), data->output->name) {
>  						data->flags =3D m->flags;
> @@ -656,8 +660,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL=
)
>  				continue;
>=20
>  			if (!all_pipes && data.pipe !=3D active_pipes[0] &&
> -					  data.pipe !=3D active_pipes[last_pipe])
> +					  data.pipe !=3D active_pipes[last_pipe]) {
> +				igt_info("Skipping pipe %s\n",
> kmstest_pipe_name(data.pipe));
>  				continue;
> +			}
>=20
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(data.pipe), data.output->name)
>  				crtc_id_subtest(&data, fd);
> --
> 2.43.2

