Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982BDFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 09:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9E10E3C9;
	Mon,  4 May 2026 09:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1i06lpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F73910E3C9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777886669; x=1809422669;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HibRS/6W4slwzIc8f5wQIxU84dDdMx9sgBaln4jFYmM=;
 b=V1i06lpw4JN7sgmaWOO5lyuzTRcVW/OGEbsBfdTlqSGg7GNFlUxxeR0m
 FWpsXWep3Xx0FDN8+cLaNpWV0Ak6ClVfnkhwYfN1RAf4yaJUwTdwkkRvl
 unNfYESAISgtIm14Y96+oGIUq9qgJHQDkSMzomwTglA6kJx25SStIZzdq
 EVIsAWRQ7t1i6THOBxMSILK0yl7TXcblvETFWuprl3UaZttOmS6Y8IkFt
 RmKxAvPwjJ+j6yN11MW4SrGA630vVxfTGcpPB/8GBtV67kzTSmI60/UsE
 GSG5R12lNoJ9ZP7PTc+Vt3o2udA3IHPCFwO6/yAvZ9TQL36uzsLkqipka w==;
X-CSE-ConnectionGUID: luVRmwOpTMyoCiIvGslCDA==
X-CSE-MsgGUID: RjVeKOWXR7+Yb1rgKet1DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96167214"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="96167214"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:24:29 -0700
X-CSE-ConnectionGUID: 9RjwZY9nRBG/8caZFD+vyg==
X-CSE-MsgGUID: ubPHD44STN+OIc7nmgekjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="228971533"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:24:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:24:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 02:24:28 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OagTsmMQZUOtp7/O1egnN4SBT76gG1O7WZVVJM3hiXQwDQE8TM9pnFZ9Cs6J2ymUyLYJoOkxceBAljghStpTXn6WapxAueN7VI3eRFtNVkoNIzs/Wsoo2fx+hf0tV/Q5QPFl870YiBEa8mUWwbNonUfOqXYm/hE2Z9dju6ycHbLkzCTf0A8X68ssVgcix8vmUON+wwEUrWiZt5nY00T9CRxdtnMzsnhS8NPLsSodDO/ScvQ6JlajANkcP9htNorCkDHFlL4qvt8KODvR3RP8bwOb4gTpSz1S0SLFj/uSknBNAjvOyzYMHVYU7IAFUGO6VBw7iurefqNQxrF3uBj9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1TBmpyZm1zcgF4rABAWrO8yf0fCXXXhBC2fh334BU0=;
 b=OkSxzXNqNkQ9hjxcYfhZlsrRl6m7LjARWUHxYGCBYZ3kT4mYzfKEVZV2RwNWYxGwAqEU0Ormm3gdp/lVymenSU2grwcYbJP47uxUqoZIX1yoitB9vdAZvcVD3/xHLCKduArjnCmf9xDlZEyVyNUkJ9um47zjeWESdNzLBYbAdchj1Ll11dEsF+jK6PDafpM6vWFzM5ciuhQm6FRdrGI2KgIpfpqWU+8gMC0KNpmYG9B4pYD1xegz3AMhPVrpWCTajuNla0Iw1uiRaSEqv6n8PIV2ahUxxsgZ2HBx1PKMYkCM2Lw81BAPjD1y0y0WsHZwtgnng66B3u0w8eZGh17dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:24:24 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:24:24 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t 2/3] tests/intel/kms_sharpness_filter: Add CRC
 comparison for positive tests
Thread-Topic: [PATCH i-g-t 2/3] tests/intel/kms_sharpness_filter: Add CRC
 comparison for positive tests
Thread-Index: AQHc2WZEe1pKP5L4akSotdHEaePRtrX9nGZg
Date: Mon, 4 May 2026 09:24:24 +0000
Message-ID: <IA1PR11MB646708CAD863E464C10E2D15E3312@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260501123738.2360414-1-swati2.sharma@intel.com>
 <20260501123738.2360414-3-swati2.sharma@intel.com>
In-Reply-To: <20260501123738.2360414-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA2PR11MB4905:EE_
x-ms-office365-filtering-correlation-id: 531b86a2-d62e-4078-249a-08dea9beeea6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: ef9ypV+UdX6SDX+46jTBt2xU9VsM64TPKLXh9qw4qKKydFa0jSXOJKci8edxxr9HvwnLSpPYV4qvheAoqg1TJ21jmVfEMyZ/3wEndkUgFQISbHM4YYAf3uTBhsb48drOkXUSyRohDuVW/ZrCAjYqrQRW2CRA/FZY5uo4vFFqo2RgDdux5yPMbMP97I8b4Fyu4acFzcXQtK/+qEd5b27nEKcM07HZMfQHDh7Dz5ZdKz0vL6r1H1aLr7foi05adTexFTs9UtDeCLAdtmIEx7E6ZBq4wxt5ZUX2RWviPXD2PN2gzu4kgYJV1sDReSXD3WTLupMOtLbVRrDf8IEfmfA9wen172woTemLcCL0f0qQinxf8zPe6KXYO7ny+PVidsEaTG9l+a0K+x1+V6A8P59bUgLa2mRD9s8ie9oXvH5wE5rETdEaQaheTXB4RA4eLxFRsTbLp2lW6nWDwT6EoE4am2AfcI5Og5aHsP4nQWGhQSAzhqhv+DDsKPSHZnKZlBWh6qH/KPn1jQsVPEpbCg63XGVDF7fIvnR7lbf9/rEPtz1x/teTUN7VVC/mabFdepwAgPBUO3jl8h2f9Wb+/Hm1pg52QROn3WVWV79+HQRCmKGgmaxdmVjFrUBLA7diQE2S8LsnNNKjkOTJ4BcaL9oqXjheTWTSqWs5TSftpJgwB1z6GMA745i5Zv/sp9JuD8A2WgD2dDBsFnVvd9TDD+lb234pe8tU6ADSlX8N1dd6qRURttmDLBl36gP9wmTI16Tp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mOTojsoJrS2hsowX0pJeGUkA32S9apMt7x0lbulRaUUELUaaH0Fxk6fQfw8I?=
 =?us-ascii?Q?UvJXlxXDpdRethmIK8u3NZWELTR1KvsCsoU9lRtvA1fIpFQKvEG+18j7X7Ya?=
 =?us-ascii?Q?tcHTGvmbII91WOxF6/TEorvyCWTBV2oAto2PQ5hZiM1+n/cBkQchRjkO+ZvU?=
 =?us-ascii?Q?Biv2/CI1T/JrdwsFI2Knt9RgL3WdWdSKlQCQkzK3d07/e0t69+AK72jyOlmQ?=
 =?us-ascii?Q?/Q2adbsjizQapapQx5YkF7xJErNIxpmW7JSPAz5GSGB1iDaASjadIO/HsC9G?=
 =?us-ascii?Q?ld9p2esDvWgLCiFIrakRN96JcZUt4rvX9ls3iVhJ73lga8XTan43h55xICkV?=
 =?us-ascii?Q?OQfndP61OfPZfLp/jGWqzePiEdba2fBXEOnlgL1m4/gCPGRGrJOfBmkLWXfP?=
 =?us-ascii?Q?Eit4J/2Ju1EdN5o3Rfkl5Z/RARIUrkw8xCJ0cWyRXMEamfdnVla20PeGmkGk?=
 =?us-ascii?Q?QHn01clj2vK8pqj7WMzQ3334l4UEGWqasz9xaCLPQdTLLukWWScIJ7mk+rYo?=
 =?us-ascii?Q?j9HbkBTfym9tpbG4t0K/hgeTHQHQc+40IBct8IPvaXi+m/8tvVjugNizcdTu?=
 =?us-ascii?Q?PN5N8KMq1GcbR3atQ4lTwpo4XWGUtr3KGwpPj8gJcEw3AoJUq+iFlTZOfqOy?=
 =?us-ascii?Q?PNuS/B95fAhzLS7PEbm2HAyi6S6MYN1FUa70UHBQqiYLqvXilJwdRQb0qqDT?=
 =?us-ascii?Q?yanBLYdZf1AtauWww6HyMXs8qasoq3u6PGxjbN0wZnni+hczd0jsw9XBvK5Q?=
 =?us-ascii?Q?njY4U1T+LxSod3wbP3+JrO4pGZJLmG2t25TPfCaZaahOXPfr/8c0bfxmPmzw?=
 =?us-ascii?Q?y+obHAUOaQS5gnI/VbBTwfbrsUsuRIsMQMzJqh8KWvnsMuA/YNLWlFVVdt8U?=
 =?us-ascii?Q?8uIecihNecYXsofjM+jEBGA1lCDPCngNSZnpLkW8vnIiHdGDrbEXBAzLkg92?=
 =?us-ascii?Q?hHltk3g3pzay2Hk+QgPBYm8Mox9Pft3HCGPouZoSlnggg/J8JYC5JsX9vLzO?=
 =?us-ascii?Q?fLPYCjpADBMPjp5ZRzA0phFLhLF+hbsX6iG+J0iaW6aFAkB+ss8QUDUSUtUN?=
 =?us-ascii?Q?NKIk3KOrUobmFfqee2mkrwQljiUg4MKD0tpv8cd4HxoVeyDzxplmBhc2RFLx?=
 =?us-ascii?Q?G07xrP9BXvEmWtYklFTuy05quoyeAAeCNDiSrtmaYPagRQ67xsD9y+kF0d1+?=
 =?us-ascii?Q?qO4+FMhrzloVUuxP943bxEHRlrXmkMTpTTPa39KSG5v/CJ0taeuRqDl9nm+i?=
 =?us-ascii?Q?6fNZWMtx1YKbqRd52ZK4I3BnxbDOpkh0U8Ac0LQlD3Yxrf0ehkgKiiTm9VJW?=
 =?us-ascii?Q?CLpq91WN0zXN9g0lyuETIt8tqFTbH6ybT1QAi39SAXGhPCG3rJCI59mry3KB?=
 =?us-ascii?Q?VwZBZ+zR8ZcANQPf4TvmXo1BZqqD07km8jvzFZldsLIYJTx1Qbim/99I9LXQ?=
 =?us-ascii?Q?sA8y8akk7oKrw4v1/mU92bDOy4e/73Re3birZvJ5xE1sd1q+2I545X2NgCmX?=
 =?us-ascii?Q?5mrCTKIWbrsg3TOqr0UPRFyWl/OqdwxpSJA9bXGk8D0/+5j7LCW5Lit5onQ8?=
 =?us-ascii?Q?1WGTNNeq+dZmlOmw7e1nmciMi6vk1NLaqCkooAUNEezCsSuHsgooO9UngZIK?=
 =?us-ascii?Q?X0rUeUzTrX8MbQLmaKio0po3zMvF4Bp3Ro61B8L+rWz+TZx0+JiBWAqsGd6z?=
 =?us-ascii?Q?JoxqMK8z9hcAbwUv2bigmWrsoU0oHMqMBOzCmoU7jqdPyhIP6IBeS/tdrcI2?=
 =?us-ascii?Q?V0EPI1QNIQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lh0Nf3Oik2s3fAkkM5jfZNIWw93hD6eak2c3YBxxtq/leYQlIYtzJELS3jGx40s0yfWsPJSkqngm9OG5af0bDrOMIE6n1oAjDD5n1yeDZO+NVbh60zDlLNym5Mb6SD28IpRYdNfGbcad2AGURwZdaYl9unswV8tD4ouSW2lrVIzxYdVLVq5/XfFLwQQ0Vuq6YLVfsZjs3la/CV1e+EJtZK7mzaUCYeWkLPavB1uk7B8FUTQuvvXy5E6wTbUthh5sVwywL3edSDdgmgLnHDAkUTSvhiwc+e3USvAxVhzfpK7DpqasEwt/oGLSfU5tVPjjjiNsdSFhef3ky1FfR2JNGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531b86a2-d62e-4078-249a-08dea9beeea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 09:24:24.5405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jv8H1wI95AiqgxxV6Tk8sZCX5L2cPIYiAJxKucBeqWuPyVaElXgq2DQ+UAqXxrBR+RuxBbIJ21V+HLf5stuu5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Friday, May 1, 2026 6:08 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; juhapekka.heikkila@gmail.com; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t 2/3] tests/intel/kms_sharpness_filter: Add CRC
> comparison for positive tests
>=20
> Add a CRC comparison that verifies the sharpness filter produces a differ=
ent
> CRC from a reference CRC captured with the filter disabled.
>=20
> Skip the comparison for negative (invalid-*) tests since the commit was
> expected to fail.
>=20
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index 96eec8919..062a9691c 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -418,7 +418,7 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)  {
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode =3D data->mode;
> -	igt_crc_t ref_crc, crc;
> +	igt_crc_t ref_crc, crc, no_sharp_crc, sharp_crc;
>  	igt_pipe_crc_t *pipe_crc =3D NULL;
>  	int ret;
>=20
> @@ -438,6 +438,18 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>  	if (needs_extra_planes(type))
>  		set_planes(data, type);
>=20
> +	/*
> +	 * For positive tests, capture a reference CRC with the sharpness
> +	 * filter still disabled before applying the filter. After the filter
> +	 * is enabled and committed, the resulting CRC must differ.
> +	 */
> +	if (!is_invalid_test(type)) {
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		pipe_crc =3D igt_crtc_crc_new(data->crtc,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(pipe_crc, &no_sharp_crc);
> +	}
> +
>  	set_filter_strength_on_pipe(data);
>=20
>  	if (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)
> @@ -460,9 +472,14 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>  		ret =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
>  	}
>=20
> +	if (!is_invalid_test(type)) {
> +		igt_pipe_crc_collect_crc(pipe_crc, &sharp_crc);
> +		igt_assert_f(!igt_check_crc_equal(&sharp_crc,
> &no_sharp_crc),
> +			     "Sharpness CRC matches reference CRC; filter had
> no effect on pipe %s\n",
> +			     igt_crtc_name(data->crtc));
> +	}
> +


Hi Swati,
Can we move this check after suspend test and remove crc part from suspend =
test so as to have common crc function.

Thanks and Regards,
Nemesa

>  	if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPEND) {
> -		pipe_crc =3D igt_crtc_crc_new(data->crtc,
> -					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
>=20
>  		if (type =3D=3D TEST_FILTER_DPMS) {
> @@ -479,9 +496,11 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>=20
>  		igt_pipe_crc_collect_crc(pipe_crc, &crc);
>  		igt_assert_crc_equal(&crc, &ref_crc);
> -		igt_pipe_crc_free(pipe_crc);
>  	}
>=20
> +	if (pipe_crc)
> +		igt_pipe_crc_free(pipe_crc);
> +
>  	if (is_invalid_test(type))
>  		igt_assert_eq(ret, -EINVAL);
>  	else
> --
> 2.25.1

