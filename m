Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D957CC6B00
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 05:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68CB10F0E5;
	Thu,  2 Apr 2026 05:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ppkzrap1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1905C10F0E5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 05:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775107443; x=1806643443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+xCa/RzGEsO/8D1CXOjSybOD3/yx+klW3pvNtFzNmJA=;
 b=Ppkzrap1qZkDjOqjI4EtH4kGvPjlpsPkVUAGhgjL9e8fQtfECaa1CcUs
 9JS68j6725j97OPw8H/G2U5c/D9Z/lHq51xRhe8VZynWlxKOn3b9UVZW/
 I3xwtG5eaVgdIRa31eH0zumgYqCZRV+0O6poyVq1i34oksZS1H80lQ3aR
 Bjk8PJAqCdEzgH7ccifOn4PKzXMgm15J77JcEYKutnDz9Z0DYHSFEccmV
 z9uTOOmh8XWhtOO9xlU1oLec3KFRlGmes4w49GjQQnPG3etbt83DgpwJV
 N7FM5IKsC5qsJMDWC9zCScFB3tO5j1viReveMr+Sv5W7oKF9Sl+/VD2Rn g==;
X-CSE-ConnectionGUID: DPkaC08VTrml2Jwhy8C5dw==
X-CSE-MsgGUID: zVExggyLTPWaO6eZXfZ/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93741308"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93741308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:24:03 -0700
X-CSE-ConnectionGUID: hAYNddzZSgKtx2pUNBWJaA==
X-CSE-MsgGUID: tsPQo4HgTLG0R2G+RfDrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="223608622"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 22:24:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:24:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 22:24:01 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 22:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq/L+7eE7Ck6da9qhiKFU398M8V2ohv+PNRxO1qqn4LNulSoUTsYnCZXi/v2E7SbWVrGhc3PqEL6vSVCQTYtm6C6s602/KOCEXjgVeX0V09t9IMEJehA9hjRx5me6H4u/YMwRJlyyVWtt8r0Q/kp4wz++iaQaLMalm5ZCPFCNh3KONs4K/AgcROIF7FT616x/EzHCq+t/qoAYnLFV1P0sZlft+F4AiHvMa5rCGb9Drb2gFPs1EhiC5vnmJA3o+vuVjKPl6EELqcAPT3Kr+BKK0zpysJFLswwIdEO7Q53vtpD/Lijy3vxmu0hRRmDEB/Q4u4GUYwLjfKiUAXgjwz1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCvYUcEM8XzZX/ehfCJNJU0nj1v2myqW2VtIqHpl0cY=;
 b=UZUb5QjruQnCJ03NJm81DTHhy362Owm4r5ohHYluP2Hcn/HiSLP9Ak/KvH7APZr6RTjp4lLVnO6lF+QiN4DNCEKNkezdAe3An+9GXaUbv7LE+BAMhUijNXUCcs4QdGxuaXBy0c2ax5gqYlJuihZ/pPnbykBeJhy4Zwgh8CJX+z2EvwxhYANRCQpyqYwUuvm2VkbcjU3rvBFWKBjsiiFeV8BdT13VpAZ13darBYuLbxKyJekpyEx4Ye07WUon+IYeOtBo55aVTWxqs7oRr2F8LVf2DlcpNYx2uVPHxoX5k7dTaxHKJUlqC9ovrWFtAQ/gUCBIj8RDq7ZKd4wZ0AnGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) by SN7PR11MB6604.namprd11.prod.outlook.com
 (2603:10b6:806:270::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 05:23:59 +0000
Received: from SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22]) by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 ([fe80::a33:8af8:bf55:4a22%4]) with mapi id 15.20.9769.009; Thu, 2 Apr 2026
 05:23:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 5/7] tests/intel/kms_joiner_helper: Move
 max_non_joiner_mode_found
Thread-Topic: [PATCH i-g-t 5/7] tests/intel/kms_joiner_helper: Move
 max_non_joiner_mode_found
Thread-Index: AQHcwe6aBEQ/tAldAEah8tr17WtxD7XLPZVA
Date: Thu, 2 Apr 2026 05:23:59 +0000
Message-ID: <SJ5PPF1611BC49E08D5A94731AA60257DE3E351A@SJ5PPF1611BC49E.namprd11.prod.outlook.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
 <20260401160627.1338526-6-kunal1.joshi@intel.com>
In-Reply-To: <20260401160627.1338526-6-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF1611BC49E:EE_|SN7PR11MB6604:EE_
x-ms-office365-filtering-correlation-id: 33e8e559-1dbf-4653-fb99-08de90780b3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: +4dmR/BzWUPsX9UgvtIn3uIIxYsrTq1y1bNo7ak6MM7fGtkwg1+S2NdE3IUWqWWQFPJLpGNxF0zIXnRVHaogguv/hfyHqonpupSUFTOkLpko9bujs1mo1DxNLIRvN92RIS0reUiwWtDKwuJ2ggd2w24x/sUolR8He41NgQM9DlHW25L5H7MmjFft2sR8J8b4XdM1Rc/dcCgFETFUdmaVFQ1Hw4pmCG44XOJbz118BpbeOgLPWex55oaEc8T16hwaQ4qkp2k816/Vp5vXJuEZ3HmgPyTLU+F0RDWBUg26I6sgPYtoppxX3Auz2f+dLkIIt9nSiOHrVyM/xn1YNYUnC9X9GRFgVHeiWf/2VEv3coTCSg5bdzXj7Y5+hBDdXOxo9pytGjFTb/VteBLBsXG4gIXbgF7eKQFG3fZHurEffoLR/Em77b3F+8+91kEZAfRhPIu/lo1HQfixYsIQEOXN+yT2HW+sp6k1d59g9b2HPZiKjKOVduTJn13KoMI4e5ZboCWECM5cjPMJ2b8iNw45gjWrfjEOPYZn/XtGct+eozSRBQB+ZRYEBX5zrWjpojA+IgIdnCowsgc3gapccqnSeoWDNXFTxqkAy6COoZeQ2Kx+3IiqBhLvudHZAtGIqJYMjQX35w4gVq11zUjtQ/W8KJJONBYr/ZIdBpgA+Pjcw5EaPqpBdBdJfDz7OLnm9nYnt0OdHpOWwWPkd+iDQW9N+tBNL1ddVvGRDl0RF+g7bI8HwOb7Vd+mypEPL024lmDUITVigY7pQyNSObGF++e6yE/4737It8TwJ51FnDWgvpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF1611BC49E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?POQziLiJIhpCRbsO/taLoM7JbWc5bO/uTBsctPzlyYkk0EKUTnbik30sujxX?=
 =?us-ascii?Q?4gEDVbS6cB3Sf0t6bXcJU/gkl90uABL9TJT7tWcDFpQx6PE8TtQTtqJlkhXq?=
 =?us-ascii?Q?zADL34pLOtecuhJvW0HsK46Igf1n/nh8WAV/q40gX45G0RevqzKdDHHcsSFc?=
 =?us-ascii?Q?YK/Nhy4m/1mOYREXfpKiGxIm8vj2QwSQd7dKDvSmqEq4F/AMyfYBbkkozVQG?=
 =?us-ascii?Q?55PUeR8W7MnAkcTasqqLVSRnybD9YPr1Is/BeryQko7hrqCS1wgdREqCpkuf?=
 =?us-ascii?Q?iHo7+HaJLBdJEdd7U8zNkCSTLNka6exQ1GnQQqALy4yTvDzKKAiUQQBTU99U?=
 =?us-ascii?Q?6LK6wfGz95X4r/4WBFw/1PyNdXKEMqf3IEf9lBpenBtl1QsOTF/slSJFqPzr?=
 =?us-ascii?Q?QzIm9Pt3FKOtwdw55L9RaTULHCo5JcU7G150jVcutn7dyDZOirjOroW6wy3w?=
 =?us-ascii?Q?5JTvtrL8wv+I00gyqq1P28EBxOHd7Nc92pakmgMhbmA46fLAejr6RUYUNIrS?=
 =?us-ascii?Q?1uco0BJKDBzttOBmiyQS3u5jYDxr0rWLh9PrcRJLD397he9aNqqEOJMFWijL?=
 =?us-ascii?Q?74Bj5oSItIQXpEfjdVu8gZarK4EIJAepf/RGHuu4oxKBJimtvjea0k7dGeko?=
 =?us-ascii?Q?/DdqkuQoa48d+Imr5mfY21QzjaoMXDPMYkmbthVFl2kMuqKMy/OmaQcgtn0Q?=
 =?us-ascii?Q?uGM7oZtR3d56///XLT+0SWWDWTQY34llm7CILtltiqfD/yY/nbHtgb6EcGZ+?=
 =?us-ascii?Q?2mPkAF6oqzAnlCQnaJ17gjBymb6xmrMn1x7Lu1xmLoqd2NRhGIo4lqa9T20J?=
 =?us-ascii?Q?4UEgb+WcVkqyTiRp8+83KGJQQCtqr28zY+z3sV9j3bwV0NNTU3V2rtBOZJIX?=
 =?us-ascii?Q?rMTDBwZZ1vnuQ1yEVJ18z75ut9XT9XShhMsoRM0ysaLLweo7yxc/kataxz+A?=
 =?us-ascii?Q?k319LZ2Bc6h5muoBSR8hAvlMDii5VfOqkM4TgRVdE09klNlWIDFXbZGTcbng?=
 =?us-ascii?Q?xrzQ7DaqYS0gnh2LIf5BF8nlmGlTb+f0iqBIZJwCCLHSJ/fDDbSRcQtvp3pJ?=
 =?us-ascii?Q?qR5OubOHSmxgx/FsQUQQmQnUDuy2Q9OaspqA7UbQpJRFR5cfUMAFlZskjoBZ?=
 =?us-ascii?Q?Lv61kxQqzn4RXrIOmjIne1ZZ4HLl9/XhDZ8z2HK8GSRExEUbdmBELP5e8ez5?=
 =?us-ascii?Q?Hc6E0zBP6tdCorzok0IDIO143OXJc3+lLoJJfZ2fg4jiN+EvOeWp86yB3BaQ?=
 =?us-ascii?Q?5OG1fbEj1UZRdkBxbR2o3+cLJ6u4XSVm4luiCfIF/oAG3HmhUxfUQeRNGckp?=
 =?us-ascii?Q?gQHDcUJgnnZ533Vv0fYOv+KJ0z+xzhpHFAvJE68A/ldLrM51ZTEATwiuSLOC?=
 =?us-ascii?Q?6K27qi6ShoavxpEl7/egBkDkjpb1t/hXAD9LTo5/af0nxXHX/sUmFIlPBtTB?=
 =?us-ascii?Q?EgF4j0ld/bKSCwiW/gI/rIVW8CSWze3AS54PMhRTl7fa/ukz0Koi0k9tgFwc?=
 =?us-ascii?Q?8uxop/FSlbDlI6Vv+mUays8OstfHTZaBKrTQeKs28wikeBkFK+xE1i+zHX4c?=
 =?us-ascii?Q?WmU4iD4me/NEzLQv9l5J/hNuPyeUl42o+eYHklJd6UH4O213vS2h6ZwAk7f8?=
 =?us-ascii?Q?NOQalI0JFhv1Slo9ACP5bDvWFbbg8hy9i0fC9y+QRkr0Ni3kj2c4Xucnjvc+?=
 =?us-ascii?Q?DaSUBZWdBWPPmDJBOWW5TViu2D1RV5m67iHTZNTOxw0xNWBA+b5jCnUdVEn/?=
 =?us-ascii?Q?41e8YrnmOA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ta82cU/k0gajnafZrFAZg//pxuU+0lYXcyfqlU/NbF3vunffQFintVNg5DSSBGtf6Q3Sybl17tCl9SiK9T0wccx/L5XuexGXRnqfEfpFq+1mT9qSJvW6ykf8w1pinAJ/Vw3P6cEOC7S40o7u4wMEYEgsWsFd9QJy0QNLo2c+lS6vmzrRHOnMRn5GlSvd4cG6iAJVCVupiIPlwi+AtKKFOdWQQBVSh9FpvvWXF/Gonah1Z3OBkCHo78xgBzlWGzytOuMp9/7cOy2XX7sMItJrVce+HTr51Wsh5zluCwFyQakSIxJ8kSRCaWKaS8GsWUBMBYsk7wTmgO8FBegoq1jSVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF1611BC49E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e8e559-1dbf-4653-fb99-08de90780b3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 05:23:59.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjEdyT05a6SOLmO8wJfxqKt+POC7dpmsjW0ilMm+TDZfWzX8U2bnw+MQsP+EjG6d+teWF+574s751HGsEODy1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
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

> Subject: [PATCH i-g-t 5/7] tests/intel/kms_joiner_helper: Move
> max_non_joiner_mode_found
>=20
> max_non_joiner_mode_found() is Intel-specific since it relies on
> igt_bigjoiner_possible() which checks Intel platform pipe limits.
> Move it out of the generic lib/igt_kms.[ch] into the Intel-specific
> tests/intel/kms_joiner_helper.[ch] where it belongs.
>=20
> v2: Move the function out from lib/igt_kms.[ch] (Jani)
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c                   | 36 ---------------------------------
>  lib/igt_kms.h                   |  2 --
>  tests/intel/kms_joiner_helper.c | 36
> +++++++++++++++++++++++++++++++++  tests/intel/kms_joiner_helper.h |  2
> ++
>  4 files changed, 38 insertions(+), 38 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 323446780..afea8598b 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6965,42 +6965,6 @@ bool bigjoiner_mode_found(int drm_fd,
> drmModeConnector *connector,
>  	return found;
>  }
>=20
> -/**
> - * max_non_joiner_mode_found:
> - * @drm_fd: drm file descriptor
> - * @connector: libdrm connector
> - * @max_dot_clock: max dot clock frequency
> - * @mode: libdrm mode to be filled
> - *
> - * Finds the highest possible display mode that does
> - * not require a big joiner.
> - *
> - * Returns: True if a valid non-joiner mode is found,
> - * false otherwise.
> - */
> -bool max_non_joiner_mode_found(int drm_fd, drmModeConnector
> *connector,
> -			       int max_dotclock, drmModeModeInfo *mode)
> -{
> -	bool found =3D false;
> -
> -	for (int i =3D 0; i < connector->count_modes; i++) {
> -		drmModeModeInfo *current_mode =3D &connector->modes[i];
> -
> -		if (igt_bigjoiner_possible(drm_fd, current_mode,
> max_dotclock))
> -			continue;
> -
> -		if (!found ||
> -		    current_mode->hdisplay > mode->hdisplay ||
> -		    (current_mode->hdisplay =3D=3D mode->hdisplay &&
> -		     current_mode->clock > mode->clock)) {
> -			*mode =3D *current_mode;
> -			found =3D true;
> -		}
> -	}
> -
> -	return found;
> -}
> -
>  /* TODO: Move these lib functions to the joiner-specific library file
>   *	 once those patches are merged.
>   */
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index a9f02a10a..2ada64fc8 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1242,8 +1242,6 @@ int igt_get_current_cdclk(int fd);  bool
> igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
> max_dotclock);  bool bigjoiner_mode_found(int drm_fd, drmModeConnector
> *connector,
>  			  int max_dotclock, drmModeModeInfo *mode); -bool
> max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> -			       int max_dotclock, drmModeModeInfo *mode);
>  bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);  bool
> igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int
> max_dotclock);  bool ultrajoiner_mode_found(int drm_fd, drmModeConnector
> *connector, diff --git a/tests/intel/kms_joiner_helper.c
> b/tests/intel/kms_joiner_helper.c index e24d7ce94..ac1bef2e3 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -183,3 +183,39 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  	}
>  	return true;
>  }
> +
> +/**
> + * max_non_joiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode to be filled
> + *
> + * Finds the highest possible display mode that does
> + * not require a big joiner.
> + *
> + * Returns: True if a valid non-joiner mode is found,
> + * false otherwise.
> + */
> +bool max_non_joiner_mode_found(int drm_fd, drmModeConnector
> *connector,

This can now be renamed with intel_ prefix now

According to me do this change first then change done in patch 3

Regards,
Suraj Kandpal

> +			       int max_dotclock, drmModeModeInfo *mode) {
> +	bool found =3D false;
> +
> +	for (int i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode =3D &connector->modes[i];
> +
> +		if (igt_bigjoiner_possible(drm_fd, current_mode,
> max_dotclock))
> +			continue;
> +
> +		if (!found ||
> +		    current_mode->hdisplay > mode->hdisplay ||
> +		    (current_mode->hdisplay =3D=3D mode->hdisplay &&
> +		     current_mode->clock > mode->clock)) {
> +			*mode =3D *current_mode;
> +			found =3D true;
> +		}
> +	}
> +
> +	return found;
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_hel=
per.h
> index 6d21e7eb0..3fef18f67 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -17,6 +17,8 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  				  uint32_t *used_pipes_mask,
>  				  uint32_t master_pipes_mask,
>  				  uint32_t valid_pipes_mask);
> +bool max_non_joiner_mode_found(int drm_fd, drmModeConnector
> *connector,
> +			       int max_dotclock, drmModeModeInfo *mode);
>=20
>  enum force_joiner_mode {
>  	FORCE_JOINER_ENABLE =3D 0,
> --
> 2.25.1

