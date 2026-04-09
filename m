Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B1AE98FA6
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 03:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E6510E0DD;
	Thu,  9 Apr 2026 03:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSDa5Ujo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B430B10E0DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 03:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707054; x=1807243054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Ax++2IkPywEUEkQyjIOrB4HZ41Fq9juIUusMnAYzxY=;
 b=QSDa5Ujo+IGq89Xdb4xT7dHsbXdHY2N5YrEaKyTXGJZqokYBaMohNv0U
 cVjUTp4LyCu4+SEHyAIZLGYCkFHaGbMdK6Aid5xrK++aW038apFM6YqzX
 hNZQsYvElG5mJrDu7aTZWVkHSipv17cCFbV1c98+OCjL9dS06AomsrT5a
 bmgsrMJ5Ot2cPCagjDCVy0xmOzQKRrE5M6rR09V+fLxS59aeJvsPWEJYw
 svpi3gV/QE5zIIc0MA5AtGolReVlX4ujFuGm6Ko0BifutBrijNOI3OMX8
 JhG2/wMi5GZvDRfDtmowfvu6BnUAVUJJ1+XrOfVS8SQzIWRuELvivnW/z Q==;
X-CSE-ConnectionGUID: PfrQClfUR32Jio6twNtN7A==
X-CSE-MsgGUID: TWOdQZy7TNuJY9CYMBb5qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="86992925"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="86992925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:57:30 -0700
X-CSE-ConnectionGUID: Z5iHy1qbR/agd27/4R/RhA==
X-CSE-MsgGUID: tLrKtjllTrqtDrHLG5lCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233032615"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:57:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:57:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 20:57:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:57:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op43QAjMPCQBW3cWjXarp0IzRFFAzEor6MnnhwmFesVQp9aYBxBaxrKcWMGho0U9Gpa6QIAle3E0gaA18Y5JI5WjEBG2rixL8nw+moXBRnlCIkd/wEAHL+KzDh8EyJNfSRsVpZHG8iwWrlfoPlfwu6mFJ7CksmKj2qah2yGKFy8bywJuJI/kKUhYbbaaRDVt5SJzFu/PB1cJtjelnCYUUv2oBWiDj66Kjn4jOI6uZZIgUIQWdxvIIx+Sw6VmHCP1Y2nKzhacqfXxYfTONnjLuc3K1b8+ob0U0Ow4raRachs1WLzKcro4yIzaYF1UBYmxL4X2mfDyG/eJkSa/cG0fHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHw4LllN+M/kfvUllhMsDzye0XAxM4GRDO2D8P1PSUU=;
 b=MOKfnsq+ukySCUpkT0+sGvvjWIGcbTiAuWtBWIJCz6xDTq0gA+SmS1lT3d25tqctxVHusEZTgRDeUI2Gjcam1HUBJbGlPmtMOF9MVMmrc5hRTB2cCvmd5vN3knVo098shDQGf1SRmarysyQ5FI51qznyyNXgeCigxt4/zJnkmzEQ8unBfClEKDfGPfa76/4nru+Op7HuSgNRRG/WOP1fLFBIBuNrwuHt7bOLesLifF0TufBehEGUerupRIutKFueG/INOJ9mzXDJIEPVZBCYs8v0LJG4yM6ISbkznqNd8Itb6vfDe/C4gcJbolpU+j+IYIFHxPBX5GND3/fx1A0W6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by LVUPR11MB9785.namprd11.prod.outlook.com (2603:10b6:408:39c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 03:57:23 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 03:57:23 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 6/7] tests/kms_plane_scaling: use
 for_each_connector_mode()
Thread-Topic: [PATCH i-g-t 6/7] tests/kms_plane_scaling: use
 for_each_connector_mode()
Thread-Index: AQHcx5V9GfD3ubRHb0aJQVHpJGL9zbXWGp9Q
Date: Thu, 9 Apr 2026 03:57:23 +0000
Message-ID: <IA1PR11MB64671E4C9526F15B80DE2DE6E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <8341a13bfb1ac085c80d3c0398fc43035256e706.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <8341a13bfb1ac085c80d3c0398fc43035256e706.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|LVUPR11MB9785:EE_
x-ms-office365-filtering-correlation-id: 80b87808-bef8-43e5-6c7f-08de95ec1b01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: ZKjeEJOmQ9S/laMwae0aA54in2Q4WtW7satSg9nIvS+XbxUG43owObsa4iY4xDGAy43amDmL6R7yVMFRFY4XlEwvkFP7E4f6jRzNexZ3h54JFSZDD2QgKG+zlpkjmZairnPSjEh+45ubJ8zbVD+fS9/OATWY+afWhnKoa6kTtB1GmtZ8HppFR3MIsC0nx2StQoVJAaXwXuycCsb4vQjnrxSCUD0GDzm6w4njWVaaKG0YtI8YvAPzMHnw/UhU+ObO89iFnynLmTuxwgqtpuD8sR4+Q5O4+HamOo44C8m5gB4tWwb0hYqDAgw2OgW025I3RYLDNCSFhGZ7dwVefIxuKVC6nxvKkm8p3U3o5GFIdekl37Y/G9yIDWpHqQyHD2iDnWNNePBDFRtpebCevoI/NtMyCGD8opLybS01RlaMQQNWl3sGDLwsPiR/MmAFSA182XdQNz6VsRL8LknYzeNcb2vN1OCQLHnNRbO26LuBMlh0otk2jbKjZZiIqY+ZTuWaflx4z1Q4C52oQ6E/g5nvoC/7shIcjF+QdDq5a5Tg4LmMrAZqHqIaEVRVXAq8pLfw2z7U2vNvQdLoJz8bDmP6mNpz5SGZ8UDJcg46hZh0d4yUhi9kqHKWDxl2zivYahRTVWivOpo2oYFywIyLEUePXYRBUmweQUh2gNBwrWZMAAEjdmQK0xSAntKWr6LEmrai8BPko6Zb7tJRFCfZQzIWw29LORXDayQtUpC7POxv7YPDZKiG/6mNbVyX8A2g08i5NamAeXCMRE42kdz6mT1QK6VfI82yebcqFsGMIvLUAeE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dq9SbTVfkPZFGnOCTV5LND2p6J6JjYIEXHY0WbeU177ChRTV2qZo/YoqDDP/?=
 =?us-ascii?Q?/1fo5/rin/GeBskhVGBJffiYucZldhjmBTixkqwPdMXsYxaM/IGbOBIgcjwL?=
 =?us-ascii?Q?iZusJCIVO1wJG91B7dNdoXJ7iVM/hH898pwC0jUm1jaI4v2uuazoxsbpsUWg?=
 =?us-ascii?Q?olmxlCEEmw0E0/CviJVd3KbGatKZotlUZ2YlO5qee7dGelOoCdz6h9gOpwRw?=
 =?us-ascii?Q?+JhmaMIJpGi5850LEK3n5gTVqHstwCpllS7JIghnyv/j9aR8qNxU2yPyOTdd?=
 =?us-ascii?Q?xA4wmsyRU11dxA2sC4KnV2IynGbUxQLew6qdhCEcx1u+jBTg4VCPNTqT4Igu?=
 =?us-ascii?Q?DOXk5fgvF1BHFNFxUiZkcGxLYGiXF0T6TCdRHYVZ+DHM3Ko6zEB19yD31z6A?=
 =?us-ascii?Q?6/2gGbY2gZWJCaOsySh1LuHsW2aUjFxVnAx3+yLnHb4B+hmIusDWpPjvKSJD?=
 =?us-ascii?Q?umwBg9wSAUBcPXyTNedhwFKCqmzChJl0pVBWUhoyQzKULxw1+xtKvaQ+9lLy?=
 =?us-ascii?Q?m+sTO3ldGKSPPeMqm3RDXg/3TzHIxWTjPztx+3EzqcM3RZeFslAt7eDMRzu+?=
 =?us-ascii?Q?s7iCUQ1oFooInZHThRCoheLWmR9SsB+43scMH9FARV3dQJERuzOH/u5vQpUU?=
 =?us-ascii?Q?7JNtiZvVo2TkDVeiTtkRQ6rK/CT/8PtP/xSBk1GNttgU8suCodF4BnZ8tlac?=
 =?us-ascii?Q?I1SgtHEYCyBtsq8ScjuimcLrsrYxT7mFAu/qnLN4MHOmcucUm8St+l0h/ftf?=
 =?us-ascii?Q?mL7ZD2XEoCH40BQyUrkLSMXeoBoPuWg77IN4Evq+P8V6VpB/AEbwXLkH6X//?=
 =?us-ascii?Q?VsYDfKBPeIVVRVgJbkBCmJwBwlelNFBkqj8lh/GdQp60JE9MC0w8D+MOXknI?=
 =?us-ascii?Q?kdaxQ59i2j9D4bxRjBlIqdAEstfLKIb+UW/esb/J2a/aWRTGg1MiqzRqRx2i?=
 =?us-ascii?Q?60LE29c33LXp7OPSnJe+vSeJq6wvuLYdc/boVXgngPxvsRO9/l+zq6I4FeXb?=
 =?us-ascii?Q?q1rKPyDBeq+YjO5vdRBwxIQt/teJKDIcyVjOg21k7M4LNU4kZtwbW1Hyg+YX?=
 =?us-ascii?Q?lIihumjXbys6apC8+JpChuyttqoiDV8cuhKbTQNAFeesQl9mqVv+JxSwd4rM?=
 =?us-ascii?Q?nW3nG55OcnX6tzAp8vvXzyYhz7AWdg84vNhzyKV/xVuxKio9QEzAVmgjBgRm?=
 =?us-ascii?Q?LiZeNdEnjSAs1++GksDPmm1/O6Zi7WSG1fFXNfJ21gDzb2mqfYy+P6HlwPA0?=
 =?us-ascii?Q?zPokVtROBhgEv2SJ7IIULDBCrTQjlxHSxpxeMpRBcGjfGrTk2ZpXqHv3kNdz?=
 =?us-ascii?Q?vSiLNxkPaNJiqtcVh77WnMEQI13VXHLqTp8+9zMYWXAIQuzUcq1KwzEABdtL?=
 =?us-ascii?Q?wh1ig1tcXGDtjmxdIRNEm1Th5mO13OHovrW+dueYWXQFUlKlhX9sLsr1Siba?=
 =?us-ascii?Q?Jbbr/QRu7mVCBA2aRAUjtolfsimH5uBUDjN0u2ti41NkfNl/LqPqixCHnNeB?=
 =?us-ascii?Q?N6D3wzRBwhi6F5tNPowBxwQjGDXpwaYEx0UFpQtx/ZvpIBDCFm0E94pxqm+V?=
 =?us-ascii?Q?cNmpZUMVzQs0lWzA3QVX6hgm0bghkeQwRoa0wxCiQj9vUoMUBuxldfADZnaf?=
 =?us-ascii?Q?JTDCqFQjbbfmP10OjjedKEnxK2JPOd3AEnZlz9ar41BbqcV22YIQtfcQ1WTK?=
 =?us-ascii?Q?OSGvyd9Orb5B8UHcyoS20d/ovPPJ2VS4nUCfKeBgqIRoWoPxaA1kp7bsto/e?=
 =?us-ascii?Q?H7hLyQTK1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ly9dwbdjNjFu/Q8rPRKMFAu6Re1PloTGYN/W7EA9aSVqBjGKbQrUeDvdO0rc/HhPC5OcOv9RsIVYtMxwwsoxctiIheC1QvAGX8eHYdhEy58CpZ97byvzwQsUz7v++nN89H4idvfpzgkak8aGVo86SzTob3Ngw9qYRc8atedADR8A9hCoVFdXnV63xuoDWIP2b/ZwqAIRVM7QtR7qwO1ssk/RREbjmpvQFeBUMmbLGmYHHv1yzn5v6OH8SOuNl688gndQJ7BEO9FQj5V/lK5kFQMaRM8RPtogcYfFNIJ8swBrxunbta+MOaUKMhIe6I2DPTbBHf7IGg9xMZiEfHJ9bA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b87808-bef8-43e5-6c7f-08de95ec1b01
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 03:57:23.0778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNzoMkWVCUXaXMnrIaPn/1FVNbFnmJTQ1nqXW24ZYNW+9C9lqCpQNdUrgg+uZoCXRERDd0HyyVM4F6fLfpK59g==
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
> Subject: [PATCH i-g-t 6/7] tests/kms_plane_scaling: use
> for_each_connector_mode()
>=20
> We have	a helper for looping the output	modes. Use it.
>=20
Same. With this
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Use the mode local variable for the loop, and rename the one indicating t=
he
> found mode.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_plane_scaling.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> 0941dcb4eb05..fde8b8370c9f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1221,21 +1221,20 @@ static void invalid_parameter_tests(data_t *d)
>=20
>  static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output,
> const struct invalid_paramtests *test)  {
> -	drmModeModeInfo *mode =3D NULL;
> +	drmModeModeInfo *found =3D NULL, *mode;
>=20
> -	for (int i =3D 0; i < output->config.connector->count_modes; i++) {
> -		if (output->config.connector->modes[i].hdisplay =3D=3D test-
> >planesize[0] &&
> -		    output->config.connector->modes[i].vdisplay =3D=3D test-
> >planesize[1] &&
> -		    output->config.connector->modes[i].vrefresh >=3D test-
> >vrefresh) {
> -			if (mode &&
> -			    mode->vrefresh < output->config.connector-
> >modes[i].vrefresh)
> +	for_each_connector_mode(output, mode) {
> +		if (mode->hdisplay =3D=3D test->planesize[0] &&
> +		    mode->vdisplay =3D=3D test->planesize[1] &&
> +		    mode->vrefresh >=3D test->vrefresh) {
> +			if (found && found->vrefresh < mode->vrefresh)
>  				continue;
>=20
> -			mode =3D &output->config.connector->modes[i];
> +			found =3D mode;
>  		}
>  	}
>=20
> -	return mode;
> +	return found;
>  }
>=20
>  /*
> --
> 2.47.3

