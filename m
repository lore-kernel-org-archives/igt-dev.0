Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55310CD8CB2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 05:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E477010ECBD;
	Thu, 11 Jun 2026 05:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DG6u4WKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818B710ECBA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 05:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781156519; x=1812692519;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hmY9JVoh3vUV5gBiuV29L8pekfGX1bjivU0593udBq4=;
 b=DG6u4WKk5CdmbLev04miKuaEURH54EBXpX4e10+jXXsMPJThGEGVvFEC
 JJWyrey1tOeAj4NYgn8/SmfF+dGofOr2nMP1CL4P9qTqNKC83u8dqDkX8
 Vc5EXjSST57GVDalzoEKDGzqpRF5wMvajBUfjrMm53jSQRCxClBThDfTe
 9ZD+livc1X0eapmjtEE/uOar+sB/28O93mEGqq9gsKC9agkFDOR8iZ9/9
 hEIRGwbW9MfgOrGAq4GwWZdobR1WQ/pSIYHvlwIc4C6keBhYag/zMEvg6
 PoFhsPjWhxlaXC7Hn+qWFhOHjuJ/l3yetwMipWRtd6FYYSjGJayhLPGwx Q==;
X-CSE-ConnectionGUID: Ey0ZXUWEQlOv40X5aADCoQ==
X-CSE-MsgGUID: DnK8pFTcQUOlXpKZv5LDSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81966543"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="81966543"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 22:41:58 -0700
X-CSE-ConnectionGUID: YevgW8U4QJeBJxTdnQD5gA==
X-CSE-MsgGUID: WxHSrQnpQvSlGAEzm2YV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250658564"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 22:41:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 22:41:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 22:41:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 22:41:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOfOXgpW/y2rwU5ofB2ImZyKUteL4A2SpnR2pTnKqVtiy3/ZMNAVtYsU2xcB2JxII8XI55hZ/zxt51gidcICwrbd7bysMI7eoc97oHGhUftmDOhQbGVqwAldLpXzZz7Wm+SY8vGktFkRTUa1ndyRn6H/dSaf9+zSYCzy0B9CUuhQIRSBW2QX0HPT/J1jtqcgaKMfdVK1wFBWx6UV2qx0MpgQuX4kq/STyx9kOwo8r3fRQQbSd/bMZ3gxl4pzdid4NNTb2xL56UEBK9wvOniqb9voZieKBTPsHSMwFmjkkaM+O6f69UHS8s4maa6g7VTR9i3VXZvD93wDg7ulAYpRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKx1iFFuQGcD6RunWolsN9K6KT6gj2mApcyLSTaGcGM=;
 b=PrcLLpMuw8JN36/zxOW6beMULqKOAJrm9dd1PfNxXl5TwATpp4+VxCloPqwzyFBSwg0wz0y0yfvYzhYdna5N5JFZYrq0HglzLd/6sFq6GZFmlmE5b7SU3+cwx9GTFNk7rVs8ehMBnIO2r7aPB9p7rz2ITSATZ0mUXTBLNnILT1PLx2fEgM0nF4gZfnQu5DWxtYe23J2sMrvLdZqx5su5/Zv6PKiK2KIWP2HCCEncspK4FKds5uz8Qzoq3OSrQvRThSo8GC61Yqae3XDf6KnICZo2/QFaB/yZCPE1H9PL+I/Uz6wVaZyCGFZ8WEoZIPZ5dE/+WqOtZnNRK1PDNG0hVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB8761.namprd11.prod.outlook.com (2603:10b6:8:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 05:41:42 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 05:41:42 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable
 calls in DC tests
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable
 calls in DC tests
Thread-Index: AQHc9xyBGhE3svCao0eQleMi1t9RprY3jeKAgAFELGA=
Date: Thu, 11 Jun 2026 05:41:42 +0000
Message-ID: <PH7PR11MB60537C6AD1332D1D2E8E6263E71B2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260608074722.9216-1-mohammed.thasleem@intel.com>
 <20260610094647.32373-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260610094647.32373-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB8761:EE_
x-ms-office365-filtering-correlation-id: 21e8611f-9a04-4a19-4aa8-08dec77c1dea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|18002099003|22082099003|6133799003|4143699003|38070700021;
x-microsoft-antispam-message-info: YO06viGyVoRPmPelknZnO+EhCZfSJKkzC6xZ9pjxvQKOecebfFGXnbYrQBatyu949KezJtqH2uiQqUcnFQ9DPxYJJJdXHOHen0mOLHK/tT6xIgjQVs6JWIpo9cYTGpRyth2pSjlIBawTd/ALv3jDWnayIZ9oXgFpTdwVRpX7cWnM/CQj9dlBFRKrqNqizRntyzR72X900vc2EzyRIwBSQzC5xt7w2PyVif8xezJWLC4LyB/cjAr2KrJeEyNHAWfn/0w8RJB63TnFT8F4cvdyv8ji2JLm56dOjEw1GGENAuFnC/KXSTWDJIqw9jXZB43FAklcuZ47gXSlMlPf1JCqDJ8PDSJdJCYhH4KGh1BcKnum+JgLP+t/tzzDKWvrr1w9Cptc+gdsogd0bN00qVC+R59UwZdPXCTGSv8vefs43LvhwAgyymWns/SBDeTN/ZLLsHsubze+w2Vw/XQtZUXxTt91Gg3iu5pXI9UuTT9ThfB+GLuDzxRHjpH4VvrADmvGC6ZC8FYyooX1sM+ZsZNdlMpa8es6gpF+Hugotahc5Yixz2bfZShLTbzbDOqi2aaYuR5nrCwFEqwIXz2JePEkqvhPtSEXZ4lQhcRX5MLFr0WHcQNBWrvch2bDoidMosHw04/4MLCtsAhCiWX1chbboK2rzs4uxK95Pr0mhrrioUCITdDUMno0aVEDknXFVtx9yuysoRCFnwQ+PQnF7G/NP5kkal8zMw9TIlprM+dqJUKQq2v7CbroTg3B6AKh2R15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xnMGlPdkxjVZMMer0dS58eiUPksebtFteiCvWyGiV8rpbYZoxY3y8jhOCPd6?=
 =?us-ascii?Q?e28XJXQxEC//NPoV8vvcQED6exlXajN4SiAUvV1Se3lMWu9aqcrmPZtoHevE?=
 =?us-ascii?Q?aFx+l/296n19SXCT8Q7WDlL51fAm2iCCcvYpVsblWiw4HMtbDFSa144F2XOS?=
 =?us-ascii?Q?KAoE/3YsggzOLSQ+wpoU/Ll0wYkZMacpQVw99UW79cEME4QDi0YkF0HA0N7r?=
 =?us-ascii?Q?w6uaVZZPHaDnj8UXdOyfv3tWNmBUHxwAApWQt4xwZDQQnbXDHO/dezgujRDn?=
 =?us-ascii?Q?4xs7gnDzJo+e4OY7jWMckKJ/zkNqDncC5kiAGG+ZSQCR1VKlRIV51S4Eu/2S?=
 =?us-ascii?Q?29Lm29NuPkeEQG1h8YGo0xJHhFEbI51/yUWOcT7hAoCezDPRx6k3YZ20wkFC?=
 =?us-ascii?Q?HiPuMjELOEinAE34XZH4GTyqBwbIRw8iZlmvmsNPyt2FkY7if8ENkyX+Vwsv?=
 =?us-ascii?Q?GZboAbuP1fPgTvtg7DUrBjKujnhDKLD94RF/JucW2EdiiGLZPUsL7tsCfpvV?=
 =?us-ascii?Q?OH2CmNPZzJqGvT5UK44B9VFXFbfOYQ2y77BhGxS44Gc6eM5EHFz/DguAff0l?=
 =?us-ascii?Q?xbAv02TU+vpWqW7PuJ/FCNeFazo085K4n5wRHMgaNXQLisGe5UnZ5G2kbHz/?=
 =?us-ascii?Q?e58e24OpkN9N1OF4Mgd8BRJkFk5av9zst1yYuSsz5AL5RQyvCtkuwbQjBi5I?=
 =?us-ascii?Q?rxJ+e+jiyKnynXGEiTa7wEd3tOjotDbhmJWAqXElhqeuefLDazaKm0sqG3+0?=
 =?us-ascii?Q?Qp7Ini2UT+T/iOtEWS/QblEqFOqzIxVLaf9RiHT3aNsxz6wqXZNo6GKXy7OJ?=
 =?us-ascii?Q?G73DvAUok0ljaBo+0+YJcNmL5+XxUtXc16trZsDXzJgWrJRw2hoLxPe4igFJ?=
 =?us-ascii?Q?xkOFuVz/NZEp+zSBRe2wjOhue+B5AkXRO4D3uQDinzXpHWiL5YEA2t+sYFmI?=
 =?us-ascii?Q?i0aeqIdxLQU9TVNBZXgVrlMr4OqA09WQVe5gJnrjPonY7t+ov+uFu7dNhSNQ?=
 =?us-ascii?Q?sEUdmRdMtPbjQ7uuhQWm7OIANn1M7hAo69QMfe2JUJsW/3WfUuI19fMFdIdD?=
 =?us-ascii?Q?cLuU74Hw6YPoDH8OR9x+OTU03s51Wz30wKfwV9uUq2wdOTz2o0F+Qd1prRoE?=
 =?us-ascii?Q?AJIDbtUwrLVtXsgJAgWd9KERuB0YVaHHBy8aIr60u/gL5QgUoujtzA4SbN7/?=
 =?us-ascii?Q?GMsFv7Y1emoc45Ia8pDki/+2o8PDqtr1/WLzFX8Y1GxgGuUBlxXsGIlGDE/E?=
 =?us-ascii?Q?IYYwnsCvcO2roj/VL1UhRq0Bqy3TI3IuftOOs8kurG7aaYp3pAzYIhzGxAe4?=
 =?us-ascii?Q?snl6ojljnozo+RtUxRkNxvvEq0LqQni5H+5mLX8bKY5EkSzFomhrsfva9wtm?=
 =?us-ascii?Q?luT+Oa+15o4PWWvyK8u5JIiD3uo1rYDoIE1jiodexlkwQu5i6tnOIlViKWzt?=
 =?us-ascii?Q?cIh6ww/OS8a63YX4k8gt2pYxqySjxzunDSnFhMmPWiflXDgnB9LAYChRvG+0?=
 =?us-ascii?Q?8OHrZ10JHP8YHCnI89ULMaHfad+QbMWc3CMPx+C1PLfB3Y9IVCRKEsu2ET13?=
 =?us-ascii?Q?6x8lK4vtBhsSOPsFNHzMZh/zNE0y++KrNi/fvrfmAtMvxctilGqkYvyo1mB2?=
 =?us-ascii?Q?E/20/L+095ga5k0WNzsDLqU0oPGq7yxYPRU8e2OSFFf8sgczJnAnp2q2gblo?=
 =?us-ascii?Q?83VBToSXVdkl9gm5++KdoekpWypoOXBOm/1wUTqJ661Nus3EfluX9xmy0BHD?=
 =?us-ascii?Q?K6UVsFFtSw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Bm5XqStEJv34TU42LGbi0d1MNCWqa/6Ry6VHdEHwSQvfqsMdxivn0ujricKQjiwfJnvXqZ3i+IQpk6z++XoE+rS8gDmvNUm+QxgLxvTCr+FTVeRXogFPIbrEtyYOmuSwNjVJEsMZ6PlZBdRizk/GGNHOHGbtSAzBRcvt5EXcOpH3W622H099tqVtcXP/tlachxf8+bZBSaEvfZg8CK8YXXRIa6npmLiLTEddDt2Na/Pk/jKGX1gS1lUqKW+sqh+TqeHR2U/C7yYaqtMKNL6OTMVE2R3a5F0xnSndyfFp13kNRkq1P6TPgaIIC1CFGAZ/I3qVgMSWGDAr/DgAH4dtdQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e8611f-9a04-4a19-4aa8-08dec77c1dea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 05:41:42.4059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u6ul2jLLp89RHTRaIQNkrMl5OCcWRmSFotGWcTk2sFe58BKc51bETr3y0xg2XvaFkpZDrELdC7JJCKLLgi6yMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8761
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

Hi Thasleem,

> -----Original Message-----
> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Sent: Wednesday, June 10, 2026 3:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable
> calls in DC tests

The title feels a bit vague to me. This patch is not just "balancing" PSR e=
nable/disable calls,=20
it is about cleaning up PSR state after PSR-enabled DC test paths.

>=20
> Add psr_disable() calls to properly cleanup PSR state after DC5/DC6 PSR t=
ests
> complete.

Commit message still says cleanup after only DC5/DC6 PSR tests.
But this version also changes helper behavior and affects additional paths.
Please update the commit message to match the actual scope of the changes.

>=20
> v2: Add psr_disable call to psr & dc3co cleanup functions. (Pranay)
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 90df8ee37..2eed70f9a 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -191,6 +191,7 @@ static void cleanup_dc_psr(data_t *data)
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &data->fb_white);
> +	psr_disable(data->drm_fd, data->debugfs_fd, NULL);

Let's avoid mixing helper responsibilities. Keep plane/FB cleanup helper pu=
re.
It would be cleaner to centralize PSR teardown separately, instead of embed=
ding=20
PSR disable inside FB cleanup helpers.

>  }
>=20
>  static void cleanup_dc3co_fbs(data_t *data) @@ -204,6 +205,7 @@ static
> void cleanup_dc3co_fbs(data_t *data)
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &data->fb_rgb);
>  	igt_remove_fb(data->drm_fd, &data->fb_rgr);
> +	psr_disable(data->drm_fd, data->debugfs_fd, NULL);

Same as above.

>  }
>=20
>  static void paint_rectangles(data_t *data, @@ -772,7 +774,6 @@ int
> igt_main()
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		igt_require(!psr_disabled_check(data.debugfs_fd));
>  		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
> -		psr_disable(data.drm_fd, data.debugfs_fd, NULL);

Please add a fixes tag for the recently merged change where explicit psr_di=
sable()=20
handling in this path was altered.

Regards,
Pranay.

>  	}
>=20
>  	igt_describe("This test validates negative scenario of DC5 display "
> --
> 2.43.0

