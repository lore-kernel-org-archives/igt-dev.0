Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B42E65D29
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 05:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF13E10EAC5;
	Fri, 22 Nov 2024 05:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4Q1YjWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0110E07E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 05:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732254689; x=1763790689;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B2PIEbfIKzwEAQPc2LloSlgewmKqjzewBOGwnIjev0I=;
 b=E4Q1YjWBn3MTjg6kcNH4aPFF25IhJJXr5xvMehHiQRRFZ0fjDed8fvRn
 kz310PGTVjLbq2DVxIhcdmTjfJ5NaJvxX0LOEk5MIIz1ltSAXigrT7zci
 dDc3kxMCtwIVPnbMXfopfuElzMN+a8NudCYq2s20WOQJYXyQGlHKegiRr
 2B+yJXBIgd2HS/3SLwVdv7YWKWxrozFxoJiPfSGOoybGxjGz45FmuOZBc
 Ow8EKPIxw2d1KlHcY/vqYHg2LNZnCMVyII7bCJgG7UNgVTkRbA5R9LUFr
 425aZJSJiIWTnMWpv9n/DVYC5Tuu7g0l2klHPYpRrWvKN2ZfRvRt7veri A==;
X-CSE-ConnectionGUID: w71ZpW8dS62cigfNE9WgMg==
X-CSE-MsgGUID: RCm5P0GISC6AOvETZD3DfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43461222"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43461222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 21:51:29 -0800
X-CSE-ConnectionGUID: 6WWKQPiBQ8C0/7KkG3OePw==
X-CSE-MsgGUID: l2GLCixpR36pxC3izVSEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90462703"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 21:51:29 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 21:51:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 21:51:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 21:51:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2ZF4+EeEujKKq2MUOko03vplAJzEm6d0Ro0W3hHaHaw18sCSAfIxTa/IQhazRGgI8XQFYtN7mypTe+42WYKdbFHpu/c9mxEGa9/0dP6VllSA5qY7MclieITEEELvTcbPnD/AzlTFu7IWbLLiFeoGG2ywcDePgoXMToDl+s1WUCjf15uOhxugqUI53b9NNqcbe6AfThDduoNO8HYYpQilhNKaSy0No0UjdT8DrGdEGw0c3Q0aRwsldqnhmbxNQ+1Kj9pL6etJFKeCH76/rtUpgGrD+ktl4bbaU3wxzeZgHQpP8aOWKfkhTPNXXtAzWtSmYjzWu+1jfjHfcC+0jMIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaaEjkiihBxnWcrrgKujWlJXRZvnQ0HqCDCyx0hZl8U=;
 b=dt9fKNEC1efTaV5SwHioIspPyxhc9+1hzM7n5XIXEG4kFhtAl8/2H6DgtVgFqEHDq/OXwnce7tcDKNI2yBsdbd36d1BP9FqGVwladYIic+ZVN7zoNMcjEMET04FWyXcgKGvo7ml03nBRpJi8aZ3GejVpZ6qvPJEnytLRgusiR2mhs1bE/7yDeItsFUE16YyoJqhCmPmTcvT5dytMEinZdPWCt3T7xGbAAj8iCfvxm+4+8forWU56VHZQAbjfZ8i6wUI2DUGu13C61Kb4LQWEnwSpcK/6uhmnuxNNUxDC+CoHFVI73lH8sejh96e+lB1TskrU/8HpBmJkJ4GnyYH5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Fri, 22 Nov
 2024 05:51:19 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 05:51:19 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane:Add more logs to skips/failure
Thread-Topic: [PATCH i-g-t] tests/kms_plane:Add more logs to skips/failure
Thread-Index: AQHbPBLLcY1CQmWcxkG/g+uusB3a9bLCy5eg
Date: Fri, 22 Nov 2024 05:51:19 +0000
Message-ID: <DM4PR11MB6312AD03F429D4C3D8FD1C1A90232@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241121124214.1929042-1-pranay.samala@intel.com>
In-Reply-To: <20241121124214.1929042-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV1PR11MB8790:EE_
x-ms-office365-filtering-correlation-id: 8a0f474b-994b-4b24-acdc-08dd0ab9afea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DKWc320ryxyLrKMQl2pgrHaEvVkfNQgwisG1hp4Exfm39WVx1xzUXeTdKHtP?=
 =?us-ascii?Q?/dK8/Y0/cS+wb0t7BXz76UCRwVm0ntYQDhzpDzgcF02tq1Ktn9SFDqEdS9jc?=
 =?us-ascii?Q?jSLLPZ2rt9tmGYQWEOqECk1oDX+ym8i7bEHvnaTjUqVFmHRkh4FIEpf7U/1r?=
 =?us-ascii?Q?EsZKiRY5CcJfVyyvZJSiAPvbbRrV2vy+5OApRLCSB3tR+T9JKYYXudprj6Lx?=
 =?us-ascii?Q?Jgt5LWDyK3AFuERuJTzi7xkSt/GG5PXvDxSqPETSbnITP3MqM03t9FUapRGe?=
 =?us-ascii?Q?6U7A2uy06qUF5UsZQtK0IVhiXhioxB36/agOCugo9I8mIBKnxL/8GzPTUmHf?=
 =?us-ascii?Q?FhXPFGFGjMVVN+sbhogTy5cQEiXX98dcUExUekbIFUbFxetJ19GVLSSXIGAG?=
 =?us-ascii?Q?Ts/9ma6ki00r3KWEniNx8X9yVkKu1FiyuraTZ/bvCnUxVzyMndo4bi5HPEjJ?=
 =?us-ascii?Q?jBLsG3IYtfpLD4Dk1h26aT9PFB210QQpeR6ECHNvp9E+60438AA7odRtlp8v?=
 =?us-ascii?Q?rXFkGQVZjJSxD5VtRH2DhXr/aebxRgm1h0MbmiNSGGw5s+yI4W39/0/bL0Ib?=
 =?us-ascii?Q?T7n02Tu7D4CdbYFsVHDVqrQLU4nLvLq1MxKMo5CSNOEI/J2duZB358Cw03p5?=
 =?us-ascii?Q?wPn+T5gZ7NkyiWCG+V6YmLiG0JCyVf0aNqWAbb+ZMp/TzkioRSCKSjIxvARE?=
 =?us-ascii?Q?DBkVvBReij3IHqSzIT8sIvuVvrZoImflDe1cgfMycr9KSvbFpxRMfpaLUdmN?=
 =?us-ascii?Q?xN+sRasZER8UkTuiPwKhqIyZlUVEV1ibD0aKnVd1vKiPHyxyFeMH+axWCO5k?=
 =?us-ascii?Q?7VYWvkF68UWsTDkgtDKHa0dxJl01Dqw4g1sWabb+2EGVFGOZPAlMcrX43eek?=
 =?us-ascii?Q?qC4rcFMTjJc9JGcGm40BF7PVr6awsyODHxyWTIzbWFmhfP3KiKTeSs4rUMxQ?=
 =?us-ascii?Q?pA+/qRFT7ToWiFa7qttteGx9qzFxXOVO1nAfBKy89ujCbleQkEX+5G7mj4N+?=
 =?us-ascii?Q?ZjWlJL20/BMNI7vhV6jDRbayS9Uxq4+zFqiSyX2rNwrsemSM8Ai1yggUOgYx?=
 =?us-ascii?Q?OQqQuWN/eg9KDLI9WWthaAHV6BYvDBtC7yi+4mOlmmcBIkyfxkc9HYH5CBLg?=
 =?us-ascii?Q?BA6oOrDWkJJIma6/xxyFakrY8LUYBRMyX2ZDkSuKf6bamjIs7Es97HWF1iuR?=
 =?us-ascii?Q?bi/3axEuUcuT8Vfs6UbDxe4OS8+i402VFGaIE3q49mw92zG8/WeRiY40nZEn?=
 =?us-ascii?Q?jOkpwl9qLbDjTlfHn/tbb3a7CBdek6bO09B1bkIFy/yBU3Ck+PzId0t8zXtW?=
 =?us-ascii?Q?ocji70pHvFyhLHSHQYCck7EoX3f4gMjonjszNgCPr7vTj+CUChllyg3+p3r/?=
 =?us-ascii?Q?4gkjHp8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OAtpLK9UKR5e0sZl6jRMnjkLJ3nQz9fQgdID/xkgAdU2xEFiTqENuo9rXAnO?=
 =?us-ascii?Q?uHCdJdDkBT7urtpxzav4pCfpaXmAytEqAGk/4AhRCP8SSDXl9+pY+NQKo7iC?=
 =?us-ascii?Q?CdgjTkOIbAMBYTtZGYifV44SKHNUC8IlnlaP1+vycRo7Q/5LrRu7ZfNduZm8?=
 =?us-ascii?Q?f4j7qgMsvl6259Yq1FolaTmkOZE7vW8gK+aQLNqG60RK+gQJSgdU+vcHROWq?=
 =?us-ascii?Q?Jp6L/PsrDy5WBk9GUvRrqGIcSKdk2L1GB1eLAxMDICQrrZeQ2WCtd3h3hGzq?=
 =?us-ascii?Q?OSunIZaBPhx4l3ReqGIu1rMqrz8qOa6IGF2Pn249F0dtQtRLNxTSZWcOH1iB?=
 =?us-ascii?Q?vc8rB2KupC0/hR0YH+YqXj3m+WkY38rkh1OQc6D04N/Xm5vAlwn0OPtm/VZU?=
 =?us-ascii?Q?bYRreynLp5PQstZyc7JWaqWcT1Kcgm8P/o0dA49nvJtl/hAeSrRlvcLJaSPr?=
 =?us-ascii?Q?lOhbJEECGrgTbOtQcWr1qTWBEHy3LCNjCQJVLYncPIz8d+/PoPtFzsNJep4F?=
 =?us-ascii?Q?hQgKg3OoCpfwUEoO6LgXbJBQa6xev+X9zDoLpWjIM8RNYo7yZAu1TMTBACVS?=
 =?us-ascii?Q?2sL/6AGcp2dKePy5N2HQQSq/MU0wNTvnlu1D116hc25dvIUX6LpV5ogB7zxV?=
 =?us-ascii?Q?FfeHJx6jZiYolv3xMHgSSXxaRJfFqLIRS0v95pLZ/6MRMH4VHVaNsOvur3Gk?=
 =?us-ascii?Q?/GxD41mOl1wS66ACnbKAkCYBZZObPkxB3LGImwTW08JD2Jpq33jN5pHZsISY?=
 =?us-ascii?Q?9U73uWJ8a9nNds6NOX9+8j6JnRs5eLBjfrW2X3uOglwzzMjLb2uQbjWGZz9E?=
 =?us-ascii?Q?atWSb4jzZikaLNTBVdyV0bR3twcGHfKtceULVdkSmtOCGFr0XZlQed1sQ1vb?=
 =?us-ascii?Q?NRjbxe3iiwmYaGDNeLZtkvwrHm98x7mf7VZYr2giHQTiJYjYDVrqMsdOwsg5?=
 =?us-ascii?Q?AqlNZiJp+C/o3nTFylDTCA0y+20Wd8trq0fdJgz4hlfquJSL+bHgabMk78P6?=
 =?us-ascii?Q?qN7LvFYHSob/F+yVtx5ex6RUllhsd55US/Z6HOyBD5tCQCjekagLOh6OUojQ?=
 =?us-ascii?Q?84yMPJa4E/9vQpz5YCj9n8ErAcpD/qCY2x54cMXvLDG+qvPDOKWSuEs52GIz?=
 =?us-ascii?Q?aWqW8xYARzfRmNcQYI9y1Nb1G6QAocAEy5ftc2ZmTWeAX8TlxJTfHN82oFxL?=
 =?us-ascii?Q?0g7/H+fMsInsTs8KGTXDpJGU5fjnUmoNWjjmyK2U5FOH52LJWT2dP8FM8Ksg?=
 =?us-ascii?Q?ZFD0/NW7hpQndTlOzPZo3FGh0kP3dQw7Y1aa9cjFagEtyFis0QX/kaJqZUjZ?=
 =?us-ascii?Q?hOXCh7oEeF+NBf4C/4naNQY4Os4PMhUm9RcWVOW3B/G3M1RJRBgVpoixvsWx?=
 =?us-ascii?Q?L2m+sfuwLwK8GsUpYUDumrYRqhz5vWzShTxTpilnoKevl2Xyb8wR/Bg7nEmH?=
 =?us-ascii?Q?BlzL8j+OxIAc0ptmlz1+Ylneduhw4FYRsPvQIJAmSkv3JkqROSA6r1wB0Lz7?=
 =?us-ascii?Q?fUgWy2xepHvuUu+5pWaB+mjQjMQu9ZeRH7c+bEouCy0dZ2K1xl6Excj4JLB5?=
 =?us-ascii?Q?x+pEnK2Dff3gYBa86FY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0f474b-994b-4b24-acdc-08dd0ab9afea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 05:51:19.2751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0My4V7X/yf3bxDCd2M812EjeSrwmciBZKqYa9Xid9MhKdqGO1LgpwCKhGHVoFI1th5oo8NqwftInmdjDQIktTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Thursday, November 21, 2024 6:12 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/kms_plane:Add more logs to skips/failure
>=20
> Having some logs for test failures and skips would make debugging much
> easier.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_plane.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index
> 77a669dc5..383149564 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -293,8 +293,11 @@ test_plane_position_with_output(data_t *data,
>  	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
>  	igt_plane_set_fb(primary, &primary_fb);
>=20
> -	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR))
> +	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR)) {
> +		igt_info("plane-%d does not supports XRGB format and Linear
> modifier\n",
> +			 sprite->index);
>  		return;
> +	}
>=20
>  	igt_create_color_fb(data->drm_fd,
>  			    64, 64, /* width, height */
> @@ -493,7 +496,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
>  		mode_found =3D true;
>  		break;
>  	}
> -	igt_require(mode_found);
> +	igt_require_f(mode_found, "All connector modes are skipped due to
> low
> +memory\n");
>=20
>  	if (data->flags & TEST_PANNING_TOP_LEFT)
>  		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
> @@ -1263,13 +1266,14 @@ static void test_planar_settings(data_t *data)
>  	 * If here is added non-intel tests below require will need to be
>  	 * changed to if(..)
>  	 */
> -	igt_require(data->display.is_atomic);
> +	igt_require_f(data->display.is_atomic, "Atomic mode-set not
> +supported\n");
>  	igt_require_intel(data->drm_fd);
>  	devid =3D intel_get_drm_devid(data->drm_fd);
> -	igt_require(intel_display_ver(devid) >=3D 9);
> +	igt_require_f(intel_display_ver(devid) >=3D 9, "Requires Intel display
> +version 9 or above\n");
Is this really needed, Skip statement is pretty self-explanatory.=20
This might cause excessive logging.=20
>=20
>  	output =3D igt_get_single_output_for_pipe(&data->display, pipe);
> -	igt_require(output);
> +	igt_require_f(output, "Output-%s is not compatible with pipe-%s\n",
> +		      data->output->name, kmstest_pipe_name(pipe));
Same goes here.=20
>=20
>  	igt_output_set_pipe(output, pipe);
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> --
> 2.34.1

