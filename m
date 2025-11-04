Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D7CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC5D10E60F;
	Tue,  4 Nov 2025 14:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VX4qf3iq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262CA10E60F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266959; x=1793802959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93Jbg+MKvEJ7niDaZR0lx0Z/oBa7C2x4mYPnDKyj+eA=;
 b=VX4qf3iq0La+1lgKhffVDNws61yC0j0KmgrqJFWRN34XDKWZMRyUNtVf
 c+LJ6vRSwobs+YEZKuRIamYNcw/9KLU+NsxY8+c9v2TwtehZfAGPK3sHb
 Flt5iqglWwRKYQyMBjAOcabML93H3SAHTMIVeTLu+icx70wKTGRm3n2fI
 MRdK6pydyRQyqPHt0gJZlpIhPH+hd1E3umHWKQjLXN7l1MAiqQ+dxK8tT
 FTHPIzWn1E0Ltgt+wQLvqJx3YpX59iYGA2GBrZquW9h/RSnBHZYvCFLz1
 38Ia9Xuceuf1SgIpXuPOwPDOF0derDG4wC+PDk5NwluwMQkUfaEXGYZfi w==;
X-CSE-ConnectionGUID: Dv3R+3p7TaC3DqFrYuOEUQ==
X-CSE-MsgGUID: 2PQcG77dSqiJtg7Q95gemw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89825492"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="89825492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:35:58 -0800
X-CSE-ConnectionGUID: gCf61bM8S4CSdkoUvY6IKQ==
X-CSE-MsgGUID: B0/Goj9ZRgiLOea84Rve3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192261656"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:35:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 06:35:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 06:35:58 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 06:35:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALCoDRNaYsY28jXzfnTJYRhFMHPO3rO1cO8nK9ojzhjKEq0u7oLN08hW+kfOF7pI8Bt/o0qj9w6nJIqvviBJOLyHaN8kP9450ztCEbZxLj3Iv3bhalsQzqM7Y4o6r8ao58eJDCcMkx7beX58ul2myZGG1UZkdi4MxZMMO76OStILr3rzmPKRQMg3sxyX3oHqtGeI2JDnm9lENSEsCCyhmEPYvwn9RNyLkG4ABW9Ep+EBTTcl3Z+mhrIWGYmRcfnebRHRAWqURVDzpVob+4QX3NLCpUT32cBcLyIQqsrI1WjKVVM71zAzPk0KnfuOsqmGo6yCaAmjUJf/D1VIuyQFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPBTmN2zh3EYo+4BFW4ZDU8NQRusnN6yRrS2npeM6u0=;
 b=COkmaCz6NEmn7+cVxx6KFApnVx+SzpEAo/6FE4clUkk+rIzBQm9vFLUeWlC4WF944tbidEoMbkTFO3Ldr3DHwu2k3X740LXFFqM4UcUWgOu3Pn29Np/7wKNyars9yCRhgBT/DpiJ5R7RikHRZ9qLr1laMMfDBCqnahD2vI2FDgNy3SbUqSl8KxfWPUdk35qv7Yvd2CpSC8ELZ2p51mlv0moaH5zqqtxDEh21bfPf/7ERN5uOFzYKTUkcKp0I67W7+8H9zIDUsOp3w74Vh5DwFUJERTP/fWz/ZCNKv6pOvDf4okMO2lmevfPUuo3G5VaOPubCMv/ECrhtVFcOTiXa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7406.namprd11.prod.outlook.com (2603:10b6:8:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 14:35:52 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 14:35:52 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH] tests/intel/xe_pat: Add subtest to validate
 NO_COMPRESSION flag
Thread-Topic: [PATCH] tests/intel/xe_pat: Add subtest to validate
 NO_COMPRESSION flag
Thread-Index: AQHcTM9ACUWSboZGGkO7/+mzrqsoObTilVdg
Date: Tue, 4 Nov 2025 14:35:52 +0000
Message-ID: <CH3PR11MB8434E6ADBD3922747C35006E8DC4A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251103143027.2882191-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251103143027.2882191-2-sanjay.kumar.yadav@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7406:EE_
x-ms-office365-filtering-correlation-id: 14c61fb3-6e0d-4bf9-da20-08de1baf74d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tMJFdZbsoIy4i8SJ8PGEm77nPga0+I7CmScc6v6YSijZef8AF8Njz2s+kHcG?=
 =?us-ascii?Q?6tCDab/IiFTr4r8TWlEuuwLkCerzI2nf6yXeyDZjvpwXaflL+sTuxFXaGOsI?=
 =?us-ascii?Q?U+mpMqx30sVIhjLvjWy3rwQEU5p4DWTmQdu5gZb3joMtv7Y/mdvp/W1pzr2u?=
 =?us-ascii?Q?Llnj6t9+JILFNYM0HgegML6BYc+Wv4lsmGr9EDrkuEPKeQRifW1qcckiVib7?=
 =?us-ascii?Q?AWjqQTCJVvzL0X4tz+1Ah7DYxntsfe/vybbdTaEYdtSJYLR5lZ0qo95o8Q9i?=
 =?us-ascii?Q?563bUxaMcWERilAp3kVfp9XCqw2PljvNberKorf7Gb86yuHK/+CkYg9csfcE?=
 =?us-ascii?Q?8dNASA7FD/PbK51ebadQ+aL1CRbth6LLqxKFmEr0zU+7eHyKwiyYRqiRPb+U?=
 =?us-ascii?Q?p4ZhxTJ0Zux2MHi0HOM3a10aw1SCf3yzlEKN7SnWIgRF4QwbdyGxxuQgpvlY?=
 =?us-ascii?Q?h/ypcpthyz3X8fGQZeqTFQanNDjAeAzIUOe6Fmc6rVkf+PrdtOnwVcGsfMlV?=
 =?us-ascii?Q?9h1BblTDQbYtPT+X1+wcD74FBeJLiycVjaLbmMX15giLRjXZ1YQel1Uw1l6F?=
 =?us-ascii?Q?PZjkbFB0Pw1nFp5U+HFcXhwUSiHRtLw5KCGBqK3yjG/IKgS58H8ebYjn8Zsu?=
 =?us-ascii?Q?Qs/8006LrAsGo0rRIDLWyK23mYrEsINnihB9gRuRTY+mJbJFB7YorlPEogMD?=
 =?us-ascii?Q?BltlpIuihpAmOrsf0zCGgAXa7Vxx1k+Lf94pZHM23ywByZpXmsuavB+NhpX/?=
 =?us-ascii?Q?hXfb2xUaEH4vtJgB7FhTrdARdI7XZyOdPdVuHumSTueAgxrJWG7QbTxFYZH3?=
 =?us-ascii?Q?GoTwFmAhef2E1gt9PMUPliTJBT1SBHLn3nm1+d1qrdAtLDJWs5h+pc8hmlsW?=
 =?us-ascii?Q?U7pzMTLVEG2J9DPX2pG4IPanWctcOa1p66nNh4a4vecKF5SvWFb7bINYz7mB?=
 =?us-ascii?Q?KtH6FXgslXN6/nJI7hY8cUYpy4TyMPU4kv3b9Lu1k/KAU1xuMKyDUgrH62Bo?=
 =?us-ascii?Q?cDNYTCH1b5A1ahmEkXStHtTvbOKbNy/nhzWsdkDyWNVC1/Ezas8nq7jOPG6v?=
 =?us-ascii?Q?7xcKs8DjNrkzUDCyohQP+AdJag5DxRSR2s0/LHLWMOifj2lrMC1o9GPcfjyr?=
 =?us-ascii?Q?sPUkdvbmECuCAGPqeIu+676n/8v8yeCPoFlf4zUuOtqk4e0DVS/dtf9YnRZA?=
 =?us-ascii?Q?spL4n4N9DYkftou9Ln271DV5SY0Z2GHr/zWozl9jRrrlULmJefo3hYrFaeps?=
 =?us-ascii?Q?KqSETcC0B2lsjD0lbebhgAzhT28FwNASkpncgLR9pJVkFMaLIIajuVla1BDe?=
 =?us-ascii?Q?LjKfhAQe4Y2d+lj83dhZILDpMLHKFmLGsV8b+FZ+V3rwI/HzWKMbLsxS50Sc?=
 =?us-ascii?Q?/ZB7t+URyPAwmPwizPYoiSp25zexEqW9eJ2t6WpRXMAtSPsnJTSU0zsHrsQN?=
 =?us-ascii?Q?exPck0GdElmjMml/YHqoz2VfJORWJldhnHMmRQpHr6cXWxHnuEhz+ZuCg10g?=
 =?us-ascii?Q?89FxV3NsziUXDPXieqZ4V9HKnMfZuWonCHTX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FhuY9Cfd7lAexKBa1S5AaoyRlV9XtIOpdr76S6T7UkH/slulh1aWmPj/BF/4?=
 =?us-ascii?Q?s91yYnC3F5uM/LANT75i+VjMIqVz1+l1/2icAa9YsYGYPYQJQHpJCqrFM1d0?=
 =?us-ascii?Q?Cga18gid7V2nJD/pPU1UtZjfVzsM6z13pqbRYkY9/Iix3d5GWus+Q9VUiEYp?=
 =?us-ascii?Q?Pfy3a9r8i6zVg7hV2P7Vy2UKJVeEyROAaZydBsceAPJymVKiknDHRU3dHMIc?=
 =?us-ascii?Q?voeUx2qw20qckKgCm84oTUM4JHcO5sdBZP3r55WhDdz5stsmZncZEJhLI3Dd?=
 =?us-ascii?Q?ZLVfTicI4is+8ycfk6KMUHoGhO8kEK5bzoh8zN0TAJMVzXY+HfijvCOUi5UC?=
 =?us-ascii?Q?0qnyBdVYcKiYbH2z+Nt32hJfoTFM5VU6WLd3UJecpth8csJ+6h7/FkL9ZTzX?=
 =?us-ascii?Q?U3ik2NIfcs9CgzRFkcwdv5aoqROGpguxxeGSq8IzzRsO3kZ5IoAAHTeFwgIs?=
 =?us-ascii?Q?agtuN4yyy/dYLfu4wx+/U0Gz9x8p5iV3UQrxy1Yoq9sFaIBRIG8uj7yuLtMA?=
 =?us-ascii?Q?VPRXwtN2j9Pzy6iEWUl6xqvYDRxgl4tZabwx1O4DZOO0NOyNuDM6nNxh7iuK?=
 =?us-ascii?Q?T6RPgO33DbePB0afCPHnM1uNVj7zWGW0AajtsEfvmlbV2IrX5w7feLJZY2Bu?=
 =?us-ascii?Q?5K6p8o84WivVpLDN+K9bVzNnr8V1yM86MDyROyLIGlVMon4/zoiGax4S1wFB?=
 =?us-ascii?Q?DOftnwQef5gFkQChC+yx7i3LnFtA7Sj6pnH4x/HR3VyBnWXl9XyVSA5fWVRV?=
 =?us-ascii?Q?MaLk4LJlFvZxoq3UkU0Du8PXh7RUrBylaBAqNOocZpQnY9yeaK+OSWCY/dFv?=
 =?us-ascii?Q?Mk6gsGQt8xQj1LqTur+CXIMsB/Tn8ZFAP3Rd/kbrOQvCDYA22000te40Pt0Q?=
 =?us-ascii?Q?0RVOknQXHwl4QvNts+R+JXNStEZ7e969tc7GUCgPChDhvDaW+l4n0DYL0QfW?=
 =?us-ascii?Q?G5uD8+84gZPEU6ho65SrzV7neH4SaI1OXvKOKmWRvX69DhU06k4krX5o/U0i?=
 =?us-ascii?Q?2z2pOGpbp24bXPn+p9jxXeX2/rQgfSWx/fqpekFcZEfvjsVI4qzfGXUWdyjn?=
 =?us-ascii?Q?+MaFGE0RnaJqIPRxp2c+W9j/PqxT5OtZc3EW9iil4SeX+Y+MsZpHFvRzHEll?=
 =?us-ascii?Q?IEjNBop4pcBsb+JbFpo/hMajbF1aY6WlXC9uqOOOidG81Hj34AWrF+rdlKaP?=
 =?us-ascii?Q?W5QDzXFDTT/qpF7O3Jxlr7el7rgys13E+xsUSN2cBMP/FspnwMB4GYdZVGMH?=
 =?us-ascii?Q?N24B5/kPiCtCVbwqrK4mpdo8t7WeMce7HWTk6jq/E8p6MVnmx68ozNU6f/r2?=
 =?us-ascii?Q?FdLMpyrcTrq7pSpveaLVTJS83zzhK394g63XYDXoUVmdxqXllhOMOTKMvESx?=
 =?us-ascii?Q?o7izgtInZGpg3tqGohq1AGUj5PR0Pw2uTmx2pDiQvpF7FSVBRq53JKCZhdpO?=
 =?us-ascii?Q?W5etrIhvecUwNBRg8Nn4B77EksQGw/zqIVRtFrDrkcKvsu/TN+6cYlgTNYAn?=
 =?us-ascii?Q?RsZsqim7dUCpp906bj0msr3c0leRQVzBk1Otp25qqbHmQWYsgHO4sMsHCOqY?=
 =?us-ascii?Q?nNdXxEngkyZQ6UdK7asQcFlAWglNtiMTn7lW0bN5uVnJZLawaVY9be87Yxwm?=
 =?us-ascii?Q?ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c61fb3-6e0d-4bf9-da20-08de1baf74d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 14:35:52.6180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGRRW3j4C6W707YRf5g8USkJ8EeAg2lZINmk+la0QGQFgNTmvbbEKMgaCxKlq8zkMMBemC/s0jMyLjhK7F90ZS/cencZU9x634HrZBGZFtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sanjay
> Yadav
> Sent: 03 November 2025 08:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Auld, Matthew <matthew.auld@intel.com>
> Subject: [PATCH] tests/intel/xe_pat: Add subtest to validate
> NO_COMPRESSION flag
>=20
> Add bo-comp-disable-bind subtest to verify that a BO created with
> DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION cannot be bind with a
> compressed PAT index on Xe2+ (bind should fail with -EINVAL).
>=20
> This ensures the flag works as intended to skip CCS operations and relate=
d
> state management for such BOs.
>=20
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  .../drm-uapi-experimental/intel_drm_local.h   |  2 +
>  tests/intel/xe_pat.c                          | 53 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>=20
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/dr=
m-
> uapi-experimental/intel_drm_local.h
> index b48c9e219..fc2aaa462 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,6 +20,8 @@ extern "C" {
>   * clean these up when kernel uapi headers are sync'd.
>   */
>=20
> +#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
> 169405799..5179c63fd 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -785,6 +785,56 @@ static void prime_external_import_coh(void)
>  	drm_close_driver(fd2);
>  }
>=20
> +/**
> + * SUBTEST: bo-comp-disable-bind
> + * Test category: functionality test
> + * Description: Validates that binding a BO created with
> + * the NO_COMPRESSION flag using a compressed PAT index fails
> + * with -EINVAL on Xe2+ platforms.
> + */
> +
> +static void bo_comp_disable_bind(int fd) {
> +	size_t size =3D xe_get_default_alignment(fd);
> +	uint32_t devid =3D intel_get_drm_devid(fd);
> +	uint8_t comp_pat_index, uncomp_pat_index;
> +	uint32_t vm, bo;
> +	int ret;
> +
> +	ret =3D __xe_bo_create_caching(fd, 0, size, vram_if_possible(fd, 0),
> +
> DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION,
> +				     DRM_XE_GEM_CPU_CACHING_WC, &bo);
> +
> +	if (ret) {
> +		igt_assert(intel_graphics_ver(devid) < IP_VER(20, 0));
> +		igt_assert_eq(ret, -EOPNOTSUPP);
> +		return;
> +	}
> +
> +	igt_assert(intel_graphics_ver(devid) >=3D IP_VER(20, 0));
Code from ret condition and the above assert line can be removed as it can =
be just checked with igt_require which I mentioned below.
> +	vm =3D xe_vm_create(fd, 0, 0);
> +
> +	comp_pat_index =3D intel_get_pat_idx_uc_comp(fd);
> +	uncomp_pat_index =3D intel_get_pat_idx_uc(fd);
> +
> +	/* Expect failure when binding with compressed PAT index */
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +				   size, 0, 0, NULL, 0,
> +				   0, comp_pat_index, 0),
> +		      -EINVAL);
> +
> +	/* Expect success when binding with uncompressed PAT index */
> +	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +				   size, 0, 0, NULL, 0,
> +				   0, uncomp_pat_index, 0),
> +		      0);
> +	xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
> +
> +	gem_close(fd, bo);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: display-vs-wb-transient
>   * Test category: functionality test
> @@ -1451,6 +1501,9 @@ igt_main_args("V", NULL, help_str, opt_handler,
> NULL)
>  	igt_subtest("prime-external-import-coh")
>  		prime_external_import_coh();
>=20
> +	igt_subtest("bo-comp-disable-bind")
The below condition is enough; test will work for xe2+ platforms else it wi=
ll skip. No need to write the condition in the function.
igt_require(intel_graphics_ver(dev_id) >=3D IP_VER(20,0));

> +		bo_comp_disable_bind(fd);
> +
>  	igt_subtest_with_dynamic("pat-index-xelp") {
>  		igt_require(intel_graphics_ver(dev_id) <=3D IP_VER(12, 55));
>  		subtest_pat_index_modes_with_regions(fd,
> xelp_pat_index_modes,
> --
> 2.43.0

