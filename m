Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4DCC7115D
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 07:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419A410E049;
	Tue, 17 Jun 2025 07:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C34LJegb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292210E049
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750145888; x=1781681888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ODH7OuoD0fNOMLbwHwFIhINwQaV6VU6yprS2rsfRaQ=;
 b=C34LJegb11QTD3gVdQBhpGQeZs81BqL8GYn1tJisYET8YMXk8c1U70vQ
 KR63qEEMII7eJXTbwO32qPDgt1voDPABA9ok7JcvaytQdE0U+RSZoCxZD
 tst4tYSAU279d2UDZ+M58syeVlhHtX1IOUmicyxKvAeZt0D4/xh/rvBCK
 QCrVkXvdOkr23JuGFkSX1Ph+3SevluVmT33Lmv7sUJcGs4piwbEgYZvCd
 JN7uMf/OX9LKwsppnLaQgHPKHLa5gQT+sNKLS48gTGx0CiLKMWYFTAowO
 hTxYcSI66i/nwCvNHF4o+5qT4g6nAinqhvjVShz4bUQfBmlDWYOXwBUXM g==;
X-CSE-ConnectionGUID: Sl5KwBDJR8adw4JiFkV1Fw==
X-CSE-MsgGUID: blWIZMWnQtK5BCgF+IYp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56112385"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="56112385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 00:38:08 -0700
X-CSE-ConnectionGUID: wDi7fwibTxWRhPmpvXJmNA==
X-CSE-MsgGUID: elL1KH+XQZW0ut8ODsUH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="153586985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 00:38:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 00:38:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 00:38:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 00:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVapGwg+4s0Dx2pnjL2WHDn/ZZahvGUuzb1r+c3mwEdZd+pjrHFOYkDaC5BZQNeXV+kApoeKdlrhSavIptIaCBWl+RfPBYROcVqgXLfumkAzcxDQ9lfLqP5I53/PTd5/0yXpze+uN17KAp1Q8I4w6DHW24DZ9fBno1MI7r9z4X+laCBTEZE/RE+ss1hnUI6T0ZaGL0sWYnkNHPNQ/Iw9rnJn4Cj2aGMphb+6iqtwodSJHGVlcNk+1m6OdZ1bGcFqJXpCSx9X6giLd0zmrn9v2iGDoIgdlcXm2iBtvSNEKU/xmPbhJkqJ7vX2dX4GBT9rP+zm/aP3JKdP4RzPFiYa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQixnysn3OERLSNIMcvnDtzFEV8VxXjY98/eyj6uu7k=;
 b=HBuoPBGdoWE9flTOGgeaC9PoitKYZD/59EGUjeIaDoyyWZwC/zII3p0+fES8TRmCilut5H6BxNlYnoiy0QJj9X9GMmNEx2e0/rMsQ7ftYhkBnIimyjpsEflOrtGKnmB+upGWFMdIluqmzVloVoI7xJWoGdiAbd8ij1VvdhTVc3a2dJVppLZgyUY/uKLg0krVos7YCiNEDDI7xtHn2wsQllyGOcmIvY9Olj++8C/n6aUg687GDP4I0zrXdJVZqhoijX9TZSOwsnJZCMdWoLTs7I6NWjHXdG1kcE9HLCHejSggGvmyHqZ+QvgInzGjHJ8huq7Q3AO3MBaFaXYGZ6P26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.23; Tue, 17 Jun 2025 07:38:01 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::d84a:3532:5337:1f7c%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:38:01 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_vrr: Skip LOBF test if PR is not
 supported on sink
Thread-Topic: [PATCH i-g-t] tests/kms_vrr: Skip LOBF test if PR is not
 supported on sink
Thread-Index: AQHb2uV/ixbd63VmhUCwDBeuUcDi2rQG/nKQ
Date: Tue, 17 Jun 2025 07:38:01 +0000
Message-ID: <DS0PR11MB8049145C4A173A0EE5B3C0E1F973A@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20250611154404.3111025-1-jeevan.b@intel.com>
In-Reply-To: <20250611154404.3111025-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|PH7PR11MB7146:EE_
x-ms-office365-filtering-correlation-id: 7b060f82-57ce-4a92-0185-08ddad71e373
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Qe8nscYXIPD9oBlP5vJ+kAqCfaya5xT7vJx73geIcUKMXPxmWvQFkb6NdUMu?=
 =?us-ascii?Q?Pp6dava0oRzWFLqnSTS7PC/f4U3JPnkNgAK7ta7OFdB3rYpt/5+jodyjfw0U?=
 =?us-ascii?Q?kOs9MawPMLH3CVigR4NCYGDGlwKFUP/fCE7yyf5LmhwA7/9GA1GadUQt/SbS?=
 =?us-ascii?Q?KK6SfZ1LDKJxw4iUmGVgiU2XUE0utYcnxlWELUuM1+Qite0c4mFjlSUa+eWW?=
 =?us-ascii?Q?hlJ/9ETK4RtvNrVKwEcxde97491fw92NwvdmDpCrzCkEcaid5CjTGNPMWK7m?=
 =?us-ascii?Q?FnEyyiIp98+78bHj4PPiAcid9BXW3Dj+J+s52RopyyHCpROeh1BtbDjnkovq?=
 =?us-ascii?Q?w8hUaA4vgR2ztw4V4QEzWY6IQEbZR+1Uckow06mGc0Vvl1loa3xfOMIBKZjg?=
 =?us-ascii?Q?Tzi6l1uBBzKyMZWdqZuQKrBKNHBGU6Ny1Qmmfebg7ZJq+8tv0GSCdfZsEwVh?=
 =?us-ascii?Q?lwhVvu2iMy4FMu0SOkWOTQoa4N6i6n5LTMo7MZeMPsWTfmT96Y78l+nnSvxz?=
 =?us-ascii?Q?C2sBgvB8z8x9WsEIkIn+aN7xDIuIr5+HTbhwMa/Y/uiSOB6bi21vW1KpHZ5H?=
 =?us-ascii?Q?3kCLEXLscSCz+1RrZ9G7Ko3vnYvDJ8KCSQmgtqBH3m8X9tNettX4bHR8h3jc?=
 =?us-ascii?Q?UkjYQDVBzT3D+eyQxMIKPXbCZyhn/HwXZDMlHu00da3NrAkYGwDyc0SNMmae?=
 =?us-ascii?Q?r+MEmX188UpY+E88QmUsIZIgBypJOtX+fm65KZ56yU8dgV2gdhioxqInNnmG?=
 =?us-ascii?Q?esaONp+CFF+VNtQ/hNTlNxcTPJlGKJbxvuTeXvLi8Tf1dwed4HeY1t6nGoDW?=
 =?us-ascii?Q?12yCoOYpyAG20h70a14+U70d1D4aB8zDTh4g4JNXwV5lILG7tVxbUpL9zUkg?=
 =?us-ascii?Q?I/0/mb6PjPcHR06MC93fA26l0As56vBAK7vyOmFQrnjfUVmncTQtlXqX+BYP?=
 =?us-ascii?Q?ihuHbHaN4ziXGaDWYEsxbFlcKRh46tUET6nOL9WjuZojvDfl83F19tiGN7kb?=
 =?us-ascii?Q?voo61D/gT/HmURlAg1098Zp6FFB/+3lXKqVB6QtHalerlaP9R1XGoX/QpfZX?=
 =?us-ascii?Q?E708Ux+fTAikCqWQW1qC/oOmEmeTYJoxW9EbqGD69g8JjbbCoyPmc2JiVIHF?=
 =?us-ascii?Q?OvcypUNoNpyuShnPTDzhJc/PnpFYJcsnkbChSWLYKjtjUMYtc4zwrAlivc+J?=
 =?us-ascii?Q?G4zJmAi1tvuwnQnLoyFGKfh75usQRGza9phqSdBf7Zxdpbap5IZb8ErnkgxA?=
 =?us-ascii?Q?6bnc0TUBYIvo35FsuUHuRadbxtvd0bx8qVYG7i0XWd1iprOyEPfX6ljHGNoq?=
 =?us-ascii?Q?9jsokp3P7MSCSI/E6dyRWgo4JCvq/k8ebtUho32q68V+LrQM99ZiEpxCAsPM?=
 =?us-ascii?Q?v+DoGlJJNCTa+1SQOe/qeOLXg6Eh6u4ZmRetDRKFFIjqhqOPn4bHri5rnRDo?=
 =?us-ascii?Q?CnJe2Qg3r1hrucJO3dx8ZSjGXFkOAEyBA/O5DjR18HmM0v2hVIvCppBAQtYv?=
 =?us-ascii?Q?8mgAX4OJmq3zd58=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RhaWwm9uDYEBW3vJp9KOgfFhS+JNrZR8kKE/nYc+Ebu5SJr+da6Ll1rgWbFk?=
 =?us-ascii?Q?y5TOwPvszkx4ui1ecagBkYcHVKhpJ3xcbKXn+a399Cu+0Xj2SdBlCIv9WTMO?=
 =?us-ascii?Q?A6vqjnq/ZDfZT652/SaJ+rNhwuABy0F/TEOKvfFKhc6vOlwc09wEpWOaB5CZ?=
 =?us-ascii?Q?t6/s3E3xUTsKKp1WhjTD1MI+1/trpSencHgzVqLZvl6flcQLv5xznwgyOZy2?=
 =?us-ascii?Q?WYp6uarGpGR2GeIdVdL+zr24i990k+z0d3al8Kev6b+T3OjGXv2605oSmu4Q?=
 =?us-ascii?Q?QeSaMEpCZM+ukrtmI+4qZN8oRRfwG2QqCIku93sqYbbSKOMJIq5iNFIvpPi9?=
 =?us-ascii?Q?tzOgmPtdROJKBtAY5JvXYbtsebVblHgVc4HL68n4UoLdqqbvAguRH7anmpj7?=
 =?us-ascii?Q?TJ8Ggvv2J3gg8oO+PzgjFID3OT13IsAflK2NOwH7oIetuYnlk3+PbohrqnhV?=
 =?us-ascii?Q?JrKheqXBjIwDLH/3iBSXVuq5ymGNDdXXgiOuUoHAAaVc5gZefV3ek5OpmwXo?=
 =?us-ascii?Q?eJGL51xcrGbCA8OnxTAraZuTrH4Xns9FCF5jgWTX9GYDHTJkwLtwN0ZbttQr?=
 =?us-ascii?Q?lIk2F5ycXiNSDjaDF5iUQ3EIa4Plb7qQpjqvNJd0cIGyK245Q0dxRHQOEw2F?=
 =?us-ascii?Q?loEFYRqFco+/EFB5aF4pVHIhJxAXDYF5sjPxGOta1vytoKD0fBYWw66vvVmm?=
 =?us-ascii?Q?M8kBTsjiq6LKoFoIJnTt4r1657oXlmM6sDQ2EOwy+RKHfXTVPR5sSf4Fgoy5?=
 =?us-ascii?Q?aSVZsea4VbW0N3jpyR9hR2Qdw8qgwchtmmLdEEBKrNYLYdlFkFHq56FanBwz?=
 =?us-ascii?Q?rsYnBGF2PxtaZdNTBJ1G5nBGHw4hpdf8VrL4aby7KBYA/KYhuFqQw6vWVihT?=
 =?us-ascii?Q?MPZFMlnXTAeiR0VWTezHwOCOQbNR9BnjcBFWpt4AgNpiqj5w0QfuMasFUgv6?=
 =?us-ascii?Q?rOk7vsARWNs+NF8vrWFHXbOaR891bPQC8952zelDP518tUnLLqLsTqB5lSCO?=
 =?us-ascii?Q?qcUSYmfJfZtst5hK6NvyMZ0/2lH8xackL9Y9qpMcn+629NJA8sGxTsglFWFP?=
 =?us-ascii?Q?xIffOqCs1USyMqECmUhbsMMqKySTtZvNFJt2Czo51y2tov6Mr6MCyQq8OD0g?=
 =?us-ascii?Q?sHKPzNaNjG38lakL1j9Bj9WkFG5/QpItccO54mnjQEyp4ne2reX5nVOXVpJ0?=
 =?us-ascii?Q?3MMNf3O6XFwCHbQcezBhDtIKRLVI4dvS5ADn1DDSTczj9YZa5G8aNtH2RyvU?=
 =?us-ascii?Q?9lQGuxovmiiWCuB8Xsj1L7UC6tUBp/Ld+H77uWZhTUB/2NQnz/hOGGpCG7L9?=
 =?us-ascii?Q?KGWL3Q5KeUc3KkTXbaHIj6fXobNfk2cfBQHnNmsPmLyjqnrUdSu/NrU4aFfp?=
 =?us-ascii?Q?J4oRh0DFM/CVdvjaFRVCozAsC8Uz4Czb0pGOLJnnTAWt0h3oG+LTT1sInBqp?=
 =?us-ascii?Q?JuTQpZOIeXhSuiJVym4r73I+gRD5LGvJXtKyATHY+YduSd8Xok18xcOJIqD5?=
 =?us-ascii?Q?PSEHU+aO6l5QfxkjwLVJsjOUo4Af2PfZbbia9BEOLCdVlsinFnp1BMvOHYQq?=
 =?us-ascii?Q?IpnoGrknVGhGDZpdvlgWTbUbSm0EwAtMLMpVxzls?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b060f82-57ce-4a92-0185-08ddad71e373
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 07:38:01.4907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxlFX7OppdS6yXUD/GQTjav7bri426pw4YnBY+/d+FlFCHTKvqPl7wJX1hTdVB7WsAs16DQUs/vuiITsWeNswQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
> From: Jeevan B <jeevan.b@intel.com>
> Sent: Wednesday, June 11, 2025 9:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Manna, Animesh <animesh.manna@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/kms_vrr: Skip LOBF test if PR is not support=
ed on
> sink
>=20
> LOBF requires Panel Replay, which is only available on eDP 1.5 panel.
> If PR is not supported on the sink, skip the test early since LOBF cannot=
 be
> enabled without it.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_vrr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index d371d9d7f..4919b7cb7
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1049,6 +1049,11 @@ run_vrr_test(data_t *data, test_t test, uint32_t
> flags)
>  				continue;
>  			}
>=20
> +			if (flags =3D=3D TEST_LINK_OFF)
> +				igt_require_f(psr_sink_support(data-
> >drm_fd,
> +					      data->debugfs_fd, PR_MODE,
> output),
> +

Better to add a code comment to specify PR supported with EDP 1.5 and PR an=
d LOBF is mutual exclusive.
With the above fix other changes looks ok to me.

Reviewed-by: Animesh Manna <animesh.manna@intel.com>
=20
					      "LOBF not supported");
> +
>  			igt_dynamic_f("pipe-%s-%s",
>  				      kmstest_pipe_name(pipe), output-
> >name)
>  				test(data, pipe, output, flags);
> --
> 2.25.1

