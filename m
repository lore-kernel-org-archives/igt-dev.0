Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8A0CA5FE2
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6FB10E0FB;
	Mon,  5 Oct 2026 06:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i711ZdkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57810E0FB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791180385; x=1822716385;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lhnY8B5vOrdNefmCuUQsZZb0CtWfdfmbj9NBey390yg=;
 b=i711ZdkINfsNwtKs6JZ6jPLSs+oMLJQPYSq0OLYvALyi3/T8GXXIkIil
 gKs98zca6RA1MQtHxZnBQ45xOaR0UMR5q5LgCuSMQM0dXZ4IDs6Woa+BP
 +bePkjoCluuN1yno/km1eTVnpJpNafJoJ794HA93RN39wn/mMbbE+Yv3J
 vG5950tbQLDOBDm9+h/+7Jhqsf0CjJDdadIYUCOQIZpoFvhepGKsCsCCe
 M1qmhCnpG5qqTb10g4HsMn1BiHjP38wtBobRwBzhguBTlGRVViI6rKz0N
 bgt+gI8DXK0O5Ba2a0UAvvPG5FtrPGFbyDMf0cF6W8+sP4vehXx5x6CPK A==;
X-CSE-ConnectionGUID: x40haI1dRFS0SncH3OjPBQ==
X-CSE-MsgGUID: 4lkVu7X+TzOoqIrgQU7htw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90974302"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90974302"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:06:24 -0700
X-CSE-ConnectionGUID: VI7NWgngReumVeHbjjiGOA==
X-CSE-MsgGUID: KppzVTIVR7uQ7BrGk7PkoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="815540"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:06:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:06:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:06:23 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT1U/ojtgDquEzj2v5dtDcKYMBaG39sUtUT05ukqYX73ep+9rqBO1Dxc2k2vPY/ztY2rXkNTEIpdUK+mqBLtpISBTspAGO91AYfCbCdC4CeoBLAYERObYtvhmunFwWV4wxCXN3oFx5g7WKKPvGhf1/RlBt7+uLeQpESM+yE4cYrlRcgbcGICywbGAesFR0G8t3SkfsELbnO4nBBowCJf5eWBBU+cD/J1PzRqk/SPXwrvQgfsMPtD0+IcXpMD9fF8LJcj83RyEG/2J8Pqqj37lYkwy/jOP/NrR2/oMyjHQyWhPNgiNcKwgAUDyQIm0u4uTTKwobfzWNIa/irg1PH9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD6Fy0IZxlxqRhGK50GLIC7fyoB4unax0XF3axNHuMw=;
 b=LfZjcgbgyQNP7nbnXBOzY7h67isZYqEWR3alSICpud/+PFGS/IeYhvhIsYMvn2+h0KzXhz6yKVmyTkVgtMPygk+/QFLABVC8jSYm1qRQUNEkpG5JwtCpFKZswZX8MCqG/klqBrNhBS/oT6opuIp6SoNU2GNdUI0HYv/OjmAA8dFgqFtZr+kTwD0irtmKZ7IMVHxlj8/AIjRGg8lFAWpMF2LjHIhiXLki3txTqyFXTPpGjIDYtKBuOYw7eSHmygXVFiWvKdFd/RCmsnTbpfEZ4rHkiKml+hiKSbm6hKbOVg6fP49h9/X5Hak6oCC8GK4bkZMRv0peC3uVI0hPrQ3Fig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Mon, 5 Oct 2026 06:06:20 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 06:06:19 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms_color_pipeline: Skip CRC check for fixed
 matrix
Thread-Topic: [PATCH i-g-t] tests/kms_color_pipeline: Skip CRC check for fixed
 matrix
Thread-Index: AQHdUY+ky9171bnKP0+YO15hTIB1FLbufAMw
Date: Mon, 5 Oct 2026 06:06:19 +0000
Message-ID: <DM4PR11MB636013D3F850FA68CAB1ACC7F4962@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20261001103748.1161693-1-swati2.sharma@intel.com>
In-Reply-To: <20261001103748.1161693-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY8PR11MB7747:EE_
x-ms-office365-filtering-correlation-id: cbb573af-fc14-4613-2ad7-08df22a6c656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|10067099003|11063799006|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: OkgT0KWOdyMizs3yC6WXYDiz7sXVhjvU0AbstUFM45J2H0B9N7/B/6PDBAhOXCn1hXj1a9m6CCzLseiNxtxWEOg36DsnnKfIjN1sN0TGkdfyE56M5/K+5FHM47f3KkFJa+dAUio5ciqpzlb4yEAvmD754ZrH6bHF5GXgEn0arseX3NIWTC/yuBGqJnb+ZMMxg/bNLoIPWx9Rtk62x6+WyX+uRO5H+FMzqCcrrqz8oW3TI7fOXY/fcGVELw+sg92h87zOqya1bGTS0venz3K/ORhCLD0jy5gpqntSm6UfIQE1F2SGRq1FPnUQQ62z3Xg6eXf4dwS+uN1LO4awxvtk1AxvyjP6d26KkJoskgV2KKUapxwXAtog1hyjcnrOu+dYq82QP5356kOfncT3laQxzq2Q8awFB5/hS5S5yW+wJdMRsm4X7zYYTOHJT7o7JG7EMhocOXsRyLHlFAYAK+eTYsMQ8JR70idBk5iKCB16a2zzuavHLipVIRivhFkazZna5JPfIgIbv6PM/UbCIrWzDPO/zfuE9fsHSrXbyg+0QO9ZAFwRYmhve8KGfSUcIKyCbLgqF2QQYKQ9p5kXcfETmE01f9Ii/SvPWK86SkUukSYZ4PBU/ODcH19kJN49+Z6HOJQbZMN0ILhvNsCxSbEk+FdBOS3Qcml27lMblRg0K24p9qCwj0ef+xTXfds3Q6pSSLXI0awkMKwEz0FbeOgXNluUslc5JpzkopCnbcTOcIE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uML0Tj1Arm6XZeKgbAG4fhJ5ORTZP5P2BM9kpTV1GZ8+1+nsigkihk4ICVsZ?=
 =?us-ascii?Q?q21hgxLq3dWni5i5v+VEQKVgaL92stttFFDZgICELLAtmqshNvmzutuf5PVa?=
 =?us-ascii?Q?nANw6/rXq69E3escjYO6t1KfEB8DuDABgTJi/RoMiBLZ3ehqh+I+BOmSLNx7?=
 =?us-ascii?Q?gfv/1dbfUpxG0EGAci+jCXByycFcR6b+sbKMZnYFnAM+QXkGvbh8twDlG4hi?=
 =?us-ascii?Q?R1ogvLi4oE0hv1ojyzOjdVcTJoSTtGDj9Usi9QOyQ3tZlzNGpK5ydlKTw+op?=
 =?us-ascii?Q?D26HeWaXgzgwtC1EQVCA5akB0vFyzmmul+zx3DxpQ1NHAjZGRVk4DAqWNdUt?=
 =?us-ascii?Q?kY+P1NIiagQI1X1/G1a6hQI0CFuObOkeJzwa8syrBejA/Fl/rXgHcQJa0xEI?=
 =?us-ascii?Q?M3vNNicOauAI8caow4JxT4dNPJPBBKojm299aq8TOvifdsC68yHtLefH3av6?=
 =?us-ascii?Q?DO87ebEkSAH6EXmKafDI3r/vUY0oHSic3Sa/6+eWlWAAOUkdPE1U74O25VpZ?=
 =?us-ascii?Q?21fijkKFT9ROb1Er7vOwvD6NwY/XUIl2KQUZ65eFwly9sRJuOPA/2846nkTO?=
 =?us-ascii?Q?7cS/Lmxx54Lsi+55tPdV+CHumyLxeWMIw0YAqXiDLajeOyfvMGtWLHr0MN4M?=
 =?us-ascii?Q?CYVDsVVYSrHNay0gd3pJCKw2uQsLfxpBl7t5YKUa+t2aNt7RRj7WDY5JEZn4?=
 =?us-ascii?Q?lg/Rt61F3o7A/MiKB3xoAT6HF4wN7rQDGPPPoN7Fl361aw5vH24lWYUv1otf?=
 =?us-ascii?Q?wQbCq10myCqIvj24hYX//74EamS+e7YrkdCm7f1uvNDKdSJV7ECyLzpHzrHi?=
 =?us-ascii?Q?i6I/wkY4x+0mtcYbbqM40mRuk9+a2mY2mkLUEnzdABwnV1j+iOgO5V0falVM?=
 =?us-ascii?Q?T9gg5UBy9tP3xS+jcZuSFStBGDsKQxw4YeWDsGpgk/AO+f+08OMNKcDJy2Ng?=
 =?us-ascii?Q?RglkRaPBwh4wqED3DIP1e0L++/AQjWDz0kUF65VqneHdIIbYb8aezQSzSdaj?=
 =?us-ascii?Q?5RXpeVxeKdU5p+iqKLCHxGQL1LNyI6PIbFKbEhyrwtREjauv+/S4q73aVqQe?=
 =?us-ascii?Q?qJD1zgEzIrJlOo7kjIlOf0yVUKbU5rTEz487vVCIWDwuE0MhlCA0cr6yQYqO?=
 =?us-ascii?Q?FuBdSFBfUoYoiRO99fvykA3P6pFDzEOrhto/2XsJx6qunghBUJLydVrGLJzo?=
 =?us-ascii?Q?IaFJPRqsEzzbf+zmSynxLIonP366MunuTjSKKgYwLCD26xQX/fkbSZ6y5cRo?=
 =?us-ascii?Q?zaorAvmCynXoCp2MjAN+PBt0tGRQ1vqmx+p70jmwv3r1saYfxr+fhlDI0pJH?=
 =?us-ascii?Q?62dzQ6dUUWB8YC2VRKskhKrvniIhJiBlOKis4mgeDIq1szt6g3CEJKtSvwCy?=
 =?us-ascii?Q?qulK0qayK2y1Je8dsOLXNAemUJgazeWXNmGLF6nl7p4CawNGkXPPe003c8LN?=
 =?us-ascii?Q?kk4389d1EPqyROAyq3dHapeIH2G7iKOM5YoZq81yUWwFwPwszxkTjF1jPoNI?=
 =?us-ascii?Q?Q7qQuQX1Up/55hG7zBS03v1U1fi1aHvFXadNy4f9abmTTpeCcJr0o8k/7ss1?=
 =?us-ascii?Q?hcCvh5xRFjaJfw/i62et7oXuKS0YVZF4SkNviKO2/UYBNlWbvzL4KSqG5ZV0?=
 =?us-ascii?Q?Wh22969B+WRp43YiHHfrrPt1tNu5tz0WcTzOR4R7ClEaGtLzkL2IyawXxqXz?=
 =?us-ascii?Q?ZmRfO2fbP8TyZICe+TVHYmWWf9pb/yOuTLx4oFgS5l96R3a1ieX00d6fFwtc?=
 =?us-ascii?Q?t64tAmBX9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oDk7+tVWSwFSt2vBsrjaKB0HehamD+wfK8GgCUfktZCxNNoSNHpAs6M+DcQ3ucDxtT9uDMhGIp+AKjhkie6jehrN9Bh7FUkU71gjC2q2tO9SlUAHYyWJpRDgpxiLqOi0ZsonW4jrNkXtAzT3libpsQ5hDQmK+86dofgR80710h7E7iYEIDIQji90v5GYrOqKQc1Gqxfvkn/wjyqMWLK0EGk4SLcgiDswrhVC/oeBJOW6Q1Gth2djbM06lT5MyEM3jf8g7U6ZXbH/80RlaxXBzTsFAn0pWWVjwfAqbb/DcFAliuRGQZzK8W7qwVNxndqWxbMKd0+0RZFO088ibqcdwA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb573af-fc14-4613-2ad7-08df22a6c656
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 06:06:19.6834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bqk5A9/kbLY8GXC/MpsEYS07jUoWoimh+gu4ZhE5bX42w/CE2bP9rnNdiW7ubfjY0wwgF2PRthnxjP5pSL9eeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Thursday, October 1, 2026 4:08 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/kms_color_pipeline: Skip CRC check for fixed=
 matrix
>=20
> CRC mismatches are expected for fixed matrix conversions due to rounding
> errors, so drop the CRC comparison for these tests.
>=20
> Driver state checks continue to validate the flows. Frame-capture compari=
son will
> be covered by kms_chamelium_color_pipeline, whose tolerance accommodates
> the small differences between the software color model and the hardware f=
ixed-
> point matrix that a bit-exact pipe CRC cannot.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_color_pipeline.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c inde=
x
> 2b4e8c82a..bf4781796 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -187,7 +187,14 @@ static void _test_plane_colorops(data_t *data,
>  	igt_display_commit_atomic(&data->display, 0, NULL);
>  	igt_remove_fb(data->drm_fd, &fb);
>=20
> -	igt_assert_crc_equal(crc_ref, &crc_pipe);
> +	/*
> +	 * YUV conversion can produce CRC mismatches due to rounding errors.
> +	 * Driver state validates this flow; kms_chamelium_color_pipeline cover=
s
> +	 * frame-capture comparison with tolerance for small differences betwee=
n
> +	 * the software color model and the hardware fixed-point matrix.
> +	 */
> +	if (!is_yuv)
> +		igt_assert_crc_equal(crc_ref, &crc_pipe);
>  }
>=20
>  static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
> --
> 2.25.1

