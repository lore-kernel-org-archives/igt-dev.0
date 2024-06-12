Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C1C27C7B
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 11:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E4510E035;
	Wed, 12 Jun 2024 11:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgMpeqVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC03610E035
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718191853; x=1749727853;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pHvWDSsZr/SuhGxUGKqmC8c86i+XLueJ+UHRZdM9Bgs=;
 b=WgMpeqVaWjtIE6XKlvWMBQp6r09Me3ziIrfZQmlh96qspHrZMSwZc6qO
 pBnPDT22O9a51uEp13UoJ3oAHh1Elw89I26E70FRWnbShcBwIyGQkKIUQ
 mCRyLDEQjoIntGtfwYczCQeU/cIrdWx5ZLfRE/tCFQzFjnPKAmSyVTc9n
 0VpRXKKtUNcFdEtHFqDa3S2YY+1RqisVMfCIzjruNecl/zEksVD6QpLh2
 KbrZWtIEpmeBpvH7cdBHE86jjH8wZ2sWmLwmtDYCHsh1ibOO7NOTnKJzF
 LYnWaWNJQz3lHAQCMjqjZRI8Q5PLAgJRak2ssmaos4Jw3Ck0D2AG2D37h g==;
X-CSE-ConnectionGUID: s5YoSFT0RzmzmzhVX/S9mg==
X-CSE-MsgGUID: D/XN96QISM2JUUgSXT/1oA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18778357"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="18778357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 04:30:52 -0700
X-CSE-ConnectionGUID: 61Cw4ziAR82qLOA9FRi45Q==
X-CSE-MsgGUID: B/LoZHzETPSDPEeUPBYccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39723438"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 04:30:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:30:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:30:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVtUHGbTUlaAVMrrkBT7aQVyE3i738RY/Z26XB9fgdkCyfwNxzdZ6D5kMqpp9MvZ6bgOzl5jCTPFLTPlB7oQvNdsB2dgJFv6u2FX5gLJwQO4jhDM5ePdX7+Ej8bnUCpgK/WST2qHTs/Ees3ygG8zKXU4A22tG3WaU2eX3gDY1VJyzH0JGCgqoEEOPcP5FonGcEP1TZymsKHjS9A4JNQ+8ecf36xWCCcv1BBbzjBmqV5LsfyQSkvxN+iCTaOO3XJ7+S7q1t9KVSuYCDQCnWv/78UcpvYn/A+lolSitGGjShdoIA8eWh1OOPGhWDjKzWWWc+kuU9D6R9EB0P+ljJp3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKhcZDo6ktTp0ESrWxD/8v67OH785UImCZpdlAqZm+0=;
 b=IbbIYbI0sv+F5/vpc3JhQ2ezgPdnMegenuziQBN874jT9AE2vfZzAR1LEqT4SkBOsHcwndJ5rJigZ1Pn4SdFBq8ALjKyQ8Yizd8XiKnoGC6yily+pROAfZk9E0cqOB88hrvfuy9RhDZ/qyi2gZmrSctbF+j7D6bRIutHjdnPfw2HO7idDnIcfbOtFv0LwnOe6gGBE852ndtghMPaqAKtCX8nbFjudD5omfa27tWcc4U1CsLH2Qs3wqPDV2Eyl9AXSUxIzLt+293tOe4j95oQjIVmvmQLgz4s/sGTOxFh+Un2J+hfdeGokPbA6jKMt/OX5RuG0KsuP5Zkdb43+6GonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:30:49 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:30:49 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
Thread-Topic: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
Thread-Index: AQHau7x+fckaRsM+i0KLYbCZXJ3uxrHEAGPw
Date: Wed, 12 Jun 2024 11:30:49 +0000
Message-ID: <DM4PR11MB63121A1851109AE394C871E290C02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20240611045348.3727239-4-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: 91606ded-37b1-4eda-b4fc-08dc8ad31bf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?UdisJdL7udfYftDHg9KHHlkQknVzMWPAusuSe8Q/1HDXHL0bFqfX5KpaKHwt?=
 =?us-ascii?Q?F08E8qRJbjP4IUF2E5aL+hOAbGnElKsklKdBjvtu6uwCcJML+bjLHIwHve+9?=
 =?us-ascii?Q?bkTCu6wiRNZ7sGo8OeSRV3dXY8jv6WldUpDigW6FTQ4IHDDCHEUcozrAN2e+?=
 =?us-ascii?Q?4pvoz9khpI6EAmLZe+hgfk/UshmwU4cWdJLtYn6q/y3lem0cUgdPEZBOxE5j?=
 =?us-ascii?Q?sVw/i62wqOwQ6xZzmuU5S4ICLPp2ryBLs4OR3hEXkHhA0wFejtWgdvP7LjrE?=
 =?us-ascii?Q?Jz99HfWpgtVaLJqkrrlqKSk6HK84qUjRGd+8W4h1U2FTsNJeLcsC6U5L073G?=
 =?us-ascii?Q?wEKIpP9/LGnPDpP33/lzJASj/W4m/ZKAH+MN7z9JaXxTF9ZwbPV6l4In3ly+?=
 =?us-ascii?Q?/vK2xd8IdI/oeeo9TztKxfcO2jHigi1v6+VR2ti5yNauC/CV4J5j40lTuFRK?=
 =?us-ascii?Q?jzbLJueOjY6+yiS625W2y/K/A3fUf3efKe+/mZIse8jYBy2D1YrHwS3hnu1W?=
 =?us-ascii?Q?oBuNxaeXQIDUlTt/iBHl6xf3SiPYHxgOhpW6PB42QAP6OMrbUzjxZrlXPKzI?=
 =?us-ascii?Q?WDXJHBIMsUcbeo/MLK83yR0Zi2q8iv3DpZ92UUsfifW1DjNObc2I0X++SunK?=
 =?us-ascii?Q?vgHjK7d+zCBLlFckpBQzmqEwwVV+AbGeX9r/Zm5Odlah8dVO1STtpyg817Cd?=
 =?us-ascii?Q?epNOwUeWhbX+A2m32Xdj2Bw8YxeNVpWh5xY/EMThcFIeRzCyI+RV6s3rf5AO?=
 =?us-ascii?Q?aTvd/URBg9FKVzohLkQZEbG/xNhBl0Z7I7MsAdyRNd4X3NfHA69xMK/uk68t?=
 =?us-ascii?Q?UeNjDX0kpuF6pea68Gw6oE75N2URf7Hq2fhy1jgWIR66wbm7QdocnttLNP1B?=
 =?us-ascii?Q?vaCwu3G5DU2yA8STwxhXP8UAx1hNbBcsirf5S+PgZmN8W/TcCane74fGNE0u?=
 =?us-ascii?Q?OCiV12CEKcNON+uYyxrdV+SdQL32mnQcO33N2/r+hEJ/hlVr1w1hz52xVrBf?=
 =?us-ascii?Q?5TnY5gIVPMkf7SNpv60Ghvr10astWniGsJmuJaEKQxncBMpAGDYdKVr5GXwx?=
 =?us-ascii?Q?qosVB+9wvI5Xan6GbiUg+cSBFvORGZ62q+prPBFQ6HvTRpRHlEWb9HYkYjM/?=
 =?us-ascii?Q?Nw8tiftkBE3UXvgbUtRjvXnJLIlVjmZuyoTgFp9jBMlYr0s/L6UGR8ujT5ud?=
 =?us-ascii?Q?QjIqATKKbr7F4LP5jyIQswYl4PdeY3YV14UIbyZJG/FPjOZn4pJEoShtVZHY?=
 =?us-ascii?Q?IJOeAsbrPBmKUXvXTkKxR4PrTCtb0xyzlbUArZlgT+aUYtOennzx94qP9F1G?=
 =?us-ascii?Q?iO9Zx8nR6850tdU5OE8/0X4uMPMvcCVRimaiF321C01di2I35T2HLvXU6/oZ?=
 =?us-ascii?Q?cojXdHQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DGCWCOIVreoWqW0dHTpBbPEYeR3GOQndxNqXAhwdTngU5xIJwEJr3BgCC+Bn?=
 =?us-ascii?Q?WoariTnWF9b2rCz88YGL6bsWXLPD1R6Me42zyIaQZlQmrtZtat8KTZ+s5ZeX?=
 =?us-ascii?Q?nqx1RrcI4GwUThj8Q4tIHnByeUbWSQhIEYAu8jVs+s6JlfR5saX0hY6XsZ+o?=
 =?us-ascii?Q?nrIyzzqkKsGaOvxSCdacH2/FLjaYKTmZFoWGPFNADpsON25roitmk0RGxrjo?=
 =?us-ascii?Q?Xw/UTw3QA0+Wfxnr4Uo0d7aAf8y5oKPiQH+UxUjl8DA6E6IQroF4xvruPefS?=
 =?us-ascii?Q?udSUpAAleGpbH4c9VgGvTS8GblXQ2/AvyTRTWPVywXVe+Lfuv/cajQz7Wy4x?=
 =?us-ascii?Q?aj4o7W90ja1Th0MOigqJ9jy/Ry/yffLjj0ClYRbUxUeczo9pSDsAMtmd5F69?=
 =?us-ascii?Q?vA0X8HssHLlqHENgI5v7y+sYUNRIEv3mhiB2vDgpbUkvOTeGfGEIWlqrmJ89?=
 =?us-ascii?Q?gXB1FhofvfhWJGRcZ5IbwDcMjnsG5CuFgKR5AWeSujm2JlNCdUF2Yliw91KA?=
 =?us-ascii?Q?QiFA9kHgeuM7TE8b89+kFCOuSfj23E3SYgOHmpTou4/DZs/K/nDrLjOlEQcr?=
 =?us-ascii?Q?IYM3QLlHp/kHHeuh9tbKgoIjmLOyzHtS4kO84r2nriAvBWy31uxMEBWmLavp?=
 =?us-ascii?Q?Jobc2tK4mnNzw8lj5jHB6nrf1Dc1YgLtVxiPQ76ZsO1wCBF0gDbpjF2D5exp?=
 =?us-ascii?Q?aYs5ySwIbzdwzPrThZ+KsEuMD/OxWY7AzS1AOFs2baLxVXVar9iyaI2RDpvp?=
 =?us-ascii?Q?7Rmb856n/tz6ifY1McoSSw4A3RO6pDBVetvtaxNyavEAp+1/i87l4EV4/kdc?=
 =?us-ascii?Q?snp0HrfhSA5ReiWl3lDEgAajebwlxNTm+B1iTn9M+D0ThcKemZkCrHOmAFwE?=
 =?us-ascii?Q?kIlZR/b3ecDuGb9XLgQDZWrPBkWZhdiRTWvGXOlrQUUUHG4croTY2JJPj0Ay?=
 =?us-ascii?Q?egO1fKw9M+figk2wluDHbHiGMaOzxroYIZB3iqZIqYrRazbe9CrJcAEgxRNF?=
 =?us-ascii?Q?vmRrWK+mL+s/47hXhY4jvN4U+WrU83QKFCIoACcYHkhspcnTEnbgnOP2aDXZ?=
 =?us-ascii?Q?G/Ov4ScRZwTNUw1U8OkLU3SgUxjEDvxVQaqb7yvXEyh3IuOc6jC+F/m9bm8M?=
 =?us-ascii?Q?qTW6zvZI/lYLArn07FcbRFwKN6RBHdiTznw/1GhVDsULdmXw5mMsCnWfVRMm?=
 =?us-ascii?Q?ro1XWRul8SmHH61saxP3RsiT8U8EJ1G7oUntiQb3dzaox3x616wc/pG35Gr4?=
 =?us-ascii?Q?ptMWhptDp8yBqSCp/2eeb+WOB8NA8IxZwHN3wHsnw9hSzEU8924JdZWDW28i?=
 =?us-ascii?Q?7m/cS+AhHnmvmQeDGGXQhsDAtPRWFQqa6afsCbhJM7TbGfZ9s70GgcZt+8c3?=
 =?us-ascii?Q?S7TeARl1jRoI3jyWfrw4jRfT3PLtheGLjJfRvXCJzfAp/5+sV4jmo4s39x7L?=
 =?us-ascii?Q?yBW+xGmgvTDT5mLBvGMSeaeZ+fG/NDp7I8ncx0hClup1OUjoK7uCHzIbft/g?=
 =?us-ascii?Q?2UhrcdTmeqLySBfU5uhbG/GUtd+yNJXS5PbmDLFauSlKUzOHH4F8zY2Wv8Cq?=
 =?us-ascii?Q?dNpHaKud1EqEHS1zqBI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91606ded-37b1-4eda-b4fc-08dc8ad31bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:30:49.1405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IL71a2GECLy8g+GP4HFYtM4vLiAb+2No0qnlRva4Hm5IQk6tLiD2qyMUufaIuD4n0TU9XEo+qyAGgwIntuh6Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

LGTM.=20

ACK RB already present.=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, June 11, 2024 10:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
>=20
> Make sure the below points in IGT cleanup:
>=20
>  - Sanitize the state before starting the subtest.
>  - Clear the states before exiting the subtest.
>  - Update existing libdrm APIs with IGT kms APIs.
>  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)
>=20
> V2:
>  - Drop igt_fixture form igt_simple_main
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_pwrite_crc.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c =
index
> 12add5da6..338c92c3a 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -125,7 +125,6 @@ static void prepare_crtc(data_t *data)
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode;
>=20
> -	igt_display_reset(display);
>  	/* select the pipe we want to use */
>  	igt_output_set_pipe(output, data->pipe);
>=20
> @@ -161,7 +160,7 @@ static void cleanup_crtc(data_t *data)
>=20
>  	igt_plane_set_fb(data->primary, NULL);
>=20
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_display_commit(display);
>=20
>  	igt_remove_fb(data->drm_fd, &data->fb[0]); @@ -196,14 +195,14
> @@ static data_t data;  igt_simple_main  {
>  	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> -
> -	data.devid =3D intel_get_drm_devid(data.drm_fd);
> -
>  	kmstest_set_vt_graphics_mode();
>=20
> +	igt_display_require(&data.display, data.drm_fd);
> +	igt_display_require_output(&data.display);
>  	igt_require_pipe_crc(data.drm_fd);
>=20
> -	igt_display_require(&data.display, data.drm_fd);
> +	data.devid =3D intel_get_drm_devid(data.drm_fd);
> +	data.pipe_crc =3D NULL;
>=20
>  	run_test(&data);
>=20
> --
> 2.43.2

