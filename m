Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A767E98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 03:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22F410E0DD;
	Thu,  9 Apr 2026 03:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvxF1pfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CEB10E0DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707012; x=1807243012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rx8rnGpqyd9ht2916iHLNN4QvU1knWFEwzIGBJaTBgI=;
 b=KvxF1pfwihbopA3G4XegiEOGOU3gHZKoR5yyrIYGhnepqw7RWbYU5EBU
 z0bIZJplWK1RsRDddh14YcQe82V691ckduIOa/znDr41c7Hg3pm/NIxY2
 gCzWwxkwb72igGP6umkpTPXjZBWtE0iThzEIxTuMjh7hoVrH7U9rzUirp
 1bLqFn9hHVyQaBl9a6B4rdn0abJEAT/Cl01JM4ryuXzoaLiKT3iA2ua5y
 h/WdRXSs/SQDRmTPfxbQJaDJumdQhwOzvvvzoyKxYORfYdoPbnXvn7AU2
 aF8ch8TB8h3nITAJBqZZiSVnFnI+SI/vNW5dk2iFOc4CdEwMIGey08AvX Q==;
X-CSE-ConnectionGUID: o5Pr/vGiQWGYPsrgvFN1Zw==
X-CSE-MsgGUID: sYGEhtFUR4ep8u99aKd8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80563047"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="80563047"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:56:51 -0700
X-CSE-ConnectionGUID: JNzZp1hXTCqJ8WsKR297nQ==
X-CSE-MsgGUID: /FjR46rIT3u0F9GwtKgjwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="228891554"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:56:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:56:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 20:56:50 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCtxMwN+xS+EfwmHGXdq4C2WbBQlOyaJLnrHmVXGPz7ngWgaiqvMBiCt8GKsrHfE7y7+hx9zl9OUkB4XRYi58MlmdcyqNDAzYPPTRpWEmmRqjxFP3Ss2lXZSUPfWhlQmFpEbGAf9aN6VJL1PQq8tEmgOQQnbfv/HpFCLpCIrX6yvY/e9KNtjecJPNWzQWlRaoGaMyQWpAYAhadUasDkLLrEbMEkWb+EHVFphiyNqDBPSIDfIx2EIrGtY5jVrSTrC3A5pXSH34bXzPGQ9XEDzuQ8beGKPCIIwi28ZDpPsk0AIuWrpFxdrBWAUdhJ/D+nuHYT1Yt/c+4kMZAFvbWrSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a4xkK4h1gQsCguiY4/2uiADAkqkqe1IBMbMuYNaWr8=;
 b=nQkn6jqDINqSn73pqY7oiDqA/QBlqUca7OrgmJbpY6ZjS6cXeeOp6LNi9tIyCLb2aiuAU//5PUWjyVO9TmYSSzm0z0ASJ1LCHienFcZNLw+xPBEzmsRrI2+scW9tC5XUN6VheJwBTL9TN7Q545uKBnyONBPj/Nx5OaTTmvCVNr2UrVRQllldYj6QLHjR+9UUPr7cBgOz7OCDaf5Ux18MBBm3fZsSOnnt0XK4XaeBdqFSNivGDAPtll46MHPBuQvqppZ1wxh2+kHyT4IjdRwuIngZM1uNSz22wSSn3lm6rshnWpKnNU8g16tcqirdj9mClaN+OgkSXjqUc6kCwbqNOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by LVUPR11MB9785.namprd11.prod.outlook.com (2603:10b6:408:39c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 03:56:48 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 03:56:47 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 7/7] tests/kms_writeback: use
 for_each_connector_mode()
Thread-Topic: [PATCH i-g-t 7/7] tests/kms_writeback: use
 for_each_connector_mode()
Thread-Index: AQHcx5WDxCeUpF7WbEOn3HPlQOaa87XWGmEw
Date: Thu, 9 Apr 2026 03:56:47 +0000
Message-ID: <IA1PR11MB6467BB397635AC8B4F62B494E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <a29343913a5cc0b9f20017719f75b91eae3fe603.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <a29343913a5cc0b9f20017719f75b91eae3fe603.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|LVUPR11MB9785:EE_
x-ms-office365-filtering-correlation-id: 011694bc-bcbd-4c4f-d9b2-08de95ec0604
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: ZXtQRUv3hy0kUZq4PizYVCf9DDGn2DPtNI5EdtIRpUzqk6F8d5q7TrTN4Jv+AN5dgoQA+bkZQ1TiKeL+9nTK9y2ZLV520YlNZyi3MOpQjZwJFLj207Z6E/TLFVqAtsWR1rqctjmO257W5yCSQtqhCE7VBwNiA4kAhAHpy4QjfwX5k2Nz13fCskGpW9A/tPIAl2lomGAAuCT1nuWTomI+U6MeBpCp0eL4kvgz2eUVvgNrk3r15NcpqaNEAxgOtpdIhWvP9bXwNUKY7oVPcROmj0r5oZSgDKqoptcxjxnTazFvyYplHyVR8CA5fTpdfPcnH+LiZi5Yt+VlCGZurL3wcbuRMberIrAr2iNYENXNAOhvvutERIrzSimi2oFIsEShseXn2XI93cAS+xPE9FmpVIgCTUBHB9adrJDMAkr4SNuBxpSF9o5mL1cGTDdReLqg5HWllJ6StvJuwkQM+kQAeuDOB5Qy9r43lzN/EghjuLXepe8wQGCvNqpv0QmPlXZaw7jWu6DmM7bI5I1UvG+yfMvpjRAHlVF+DB2y5KhQs1RiOzHrlCLYedNHRTGKVDGJdK/tjJARWlgJhOuHOLNdk4ZQSPsiIO83pr4MdfVD3ls+GWB7vbjNrq+yYWf5I6EfqsBqg3hFjABWAWXPrjB4zZrU4C5PvpGLn3tsBrhVdHzKKW9vSxzhJDC9GW2C88fAL+mtKJpWZA4J8KRSCeqHxUiFBtgKw6uOMgn2C8Ahpb/bqtfxAeUPvG2ccYpxH8QgO2EUz+mdvK8NDFvl0lUFKc56RUJgkDUrRfePHCojN50=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nHLXlKV3+oI2itUeaiY362VwM1kE42JgPjiXXJ2TTvVKzSVse5UdTYMcFNaJ?=
 =?us-ascii?Q?FPeTt1IElzOvNhLoFw2AsGkIiotDalKql3N3+2w9sqFiMnqQjQmxaf3sY6dP?=
 =?us-ascii?Q?nog8HzE7bFZ6rW7ylzt/jNs7x6nbNWUOUiqD+RVDFb1tLnivchjwiyehxJpa?=
 =?us-ascii?Q?EYi5/CeSRoRAeF49TT/atAp8JDSjN7kAV+mB7hR5XIzB25yYJh2RuS6BUu1j?=
 =?us-ascii?Q?8DQLyYfvwLy176IvUjxAezJe7HHHT/Gkwx/zr6jv2uGH/pi+/sBvADfv9v77?=
 =?us-ascii?Q?mYXBNuSknMx3pnImfhT8S90JnHUMaX1Yh+7jj5VWx0fCva04YT5O6DHI68Im?=
 =?us-ascii?Q?PoaHgXluixhIz5Z6RtSxmynWwhaIkTa2szOJV2oK2CTmCFiG0h+yfLho9UxT?=
 =?us-ascii?Q?BaBU1zAmVNe9McqzHW6qEr5hnNQJWSXnccIhrs2inuv0KVVjwr2mVRWJVsDf?=
 =?us-ascii?Q?VCEM2mzhEE/gHqJutC0grUSCHVWWTXeYE2Y2nVljlUI2xDc6gBY5N728UFxY?=
 =?us-ascii?Q?JTALSNnz8S7xxEiy5FhLthqEb08q3k97VWyxWlGecYE2f8l8u3Nf3d4pjtF+?=
 =?us-ascii?Q?gSHUSWl2voOyAMpIXzeYWcWwwGBz5fo22ZfHBNIRQtKa0z/Xtp3bQAURTqP2?=
 =?us-ascii?Q?wA8TrapD02xPZF44FXiXPLNmFvBSesC1F05/b+PehiQHeq4EH3b24SxOSddj?=
 =?us-ascii?Q?r8q7U8jkaJmI8MyZtwl2aCUi7Ti00YRIskcikeLezXSIM8nMF85++lZaWfvm?=
 =?us-ascii?Q?R8irwSQoYfIOv++4Hz3xbMNyqcjL8dNWwstHEyJ8ADJqir5Mie6ox5FwgloK?=
 =?us-ascii?Q?bDaapmBdP39lvkMbvmDIo1jWvCqDFQ3WV9ottnaGD2DpY2KNIbtsLMYQoRM2?=
 =?us-ascii?Q?FUfNnENJV6ZyURc/LfQbFCXjL+gCMKuMzwsBaFMZ3lgVE7aKGM07cXpK6yLc?=
 =?us-ascii?Q?bmjE6uAsOc6ZW0mkdDecEq5LOiwDreIMpzCBxli7RvglsTg3HnZ/1SetsRrQ?=
 =?us-ascii?Q?UdsibTAGZx2a3cg2ptuG3K0GjeJ35P+X7S29DQP5MOnwd+he9C2XDkym7XAt?=
 =?us-ascii?Q?JAfXYJFvq5aqQo/ECp0JHzOO6nuXvVFacCjjEU1TtR+PRRRtux1KChuLJpTr?=
 =?us-ascii?Q?5a0d2UsEM0FzhW2TmhpXGlJkvt7MJw8Dniq/rYciMrxdXv2E3fFGbpwqHCD1?=
 =?us-ascii?Q?t3lhyk2w0QKyIhHbsyBcuIEJu2E6R6kAMiIlKgVgLarYf9yNhyuNPY0IGF4W?=
 =?us-ascii?Q?iQsYlPpyMhwPDf2zj3tPibomWR44TY0qYo0ktV1pNzwYNwLxtSUSnFQLv2iD?=
 =?us-ascii?Q?fgPZtBPtXW6itOzGXqP2SsGD3Qb8h63cXmY41oTRReKOKzINVJ/Xok9SprgU?=
 =?us-ascii?Q?LWfY1+heanLnN9lXIDLdHvwwNV2g0g+VzARHQi9hoiyRJsPTdumaANgE7HmI?=
 =?us-ascii?Q?lX3p5OMUs8+4g0+NwcZqNnTuQ2YJ9vI/P1ComA0w0Tnot9EoYHQLBFOqS7H4?=
 =?us-ascii?Q?XggV3AeKMIsQVQcXul4CWDtv2eKv0nH3sKEZyu7Qs81Ua5zzX1KJZwyICgbR?=
 =?us-ascii?Q?vdusCjGtak3sacblso5qq+5Npcy3b/J3318F/nIEuL1yJz//SocVGaqEvsZM?=
 =?us-ascii?Q?GEocey5MhVu7jv8alUGWwDh3lR+sCraFBh2Fk08DhAh0f/0rA0jDkV5LtR4H?=
 =?us-ascii?Q?S1Lav0xQXJytyHMNqsgMmVj0oE88OxQ0Riy/ZOYi7FJ1Zq7g4QLzn2CyYnZf?=
 =?us-ascii?Q?tgvnfGXKPA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hm+NDClz0YB/lyTNJWmCUuX1lj9xAVMA6Zra77O3LpIv0qttX2m1qIMVYWpcdU3VRKq0oldCQkvqXkxTE7NuJq0iCGU6ipKrlRo2Trmx6IrT7Z53+y1/JgKN68+TJXS2IQM03tBmpTYqIvQ3HOK94feHFh3svTg+5BEK/5KrIyI5A59Bzb6HT+dK4p3X+2zYc7iKTyKU796GksLJI5XTP36tpdW6sP1nQs38/bnYtsaYf+6qY98Da0iAQ9w5J9J2x0FtoO7ogmLnzMMFbmKP3jx4kMjNKIeXVPcwH7p60pVSpMErRRHD1/CGkm8ZhtrafADOO24Lf4f2OksBCaBVkA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011694bc-bcbd-4c4f-d9b2-08de95ec0604
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 03:56:47.8586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2vq4zxWgF+OMm6UHYHZgCJ0j/8mPUEiHnsCTiDKpq7DoMewLYt8LV7gMFNsLmYpAOKfG+0bLD7rgwX/DrvaBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9785
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jani
> Nikula
> Sent: Thursday, April 9, 2026 1:51 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH i-g-t 7/7] tests/kms_writeback: use
> for_each_connector_mode()
>=20
> We have	a helper for looping the output	modes. Use it.
>=20
Nit: Please remove extra space. With this
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_writeback.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> f15abba96765..d189f2f04657 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -468,10 +468,14 @@ static igt_output_t
> *list_writeback_modes(igt_display_t *display)
>  		igt_output_t *output =3D &display->outputs[i];
>=20
>  		if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_WRITEBACK) {
> +			drmModeModeInfo *mode;
> +			int j =3D 0;
> +
>  			igt_info("\tname  vref hdis hss hse htot vdis vss vse
> vtot flags type clock\n");
> -			for (int j =3D 0; j < output->config.connector-
> >count_modes; j++) {
> -				igt_info("[%d]", j);
> -				kmstest_dump_mode(&output-
> >config.connector->modes[j]);
> +
> +			for_each_connector_mode(output, mode) {
> +				igt_info("[%d]", j++);
> +				kmstest_dump_mode(mode);
>  			}
>  			break;
>  		}
> --
> 2.47.3

