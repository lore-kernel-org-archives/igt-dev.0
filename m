Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B56E98FA8
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 03:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712D410E0DD;
	Thu,  9 Apr 2026 03:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaIYmY/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D9C10E0FF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 03:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707080; x=1807243080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BvF5jQOf10jS2nZrlxGpDKNK73dKczTOnP6W7s4I4a4=;
 b=KaIYmY/isjLVGoQb9a83MQWhwqfKMqi58Oa6dY3UChiVt7e93qsaNn2x
 aKQuH/bPTlncZySTGz6EikP08mLehF6LDi4gCQp74tsnp1E0YbwhMjL4N
 rHdbzm/XLosBJio2E1XkEKpX0QZxOPiUldEyXf8zrJ+ny0dnDO2bWD7fU
 1wFireOXPSPZnN7Mr36EZm3kt2XCPyFwH8XeR/sKmDBiriE569kQAJusT
 YX3NXqMj1K2Vjq4qxhfyisklbSPT/oJ+Tl6KaVDmhTHAsoDAIwuVeZ93d
 0ZBkmHdJ23WHiAKcSgu7pT3A5Fo2Bg7R8PPeuFle5uHiVMguegidVRGPv Q==;
X-CSE-ConnectionGUID: h35dKcPPTTOLuXIs6kZ+Hg==
X-CSE-MsgGUID: Kxh2DrMJQmyFydDbto0TaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="86993002"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="86993002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:58:00 -0700
X-CSE-ConnectionGUID: dRRnyCMwQ5y2j4XpgL8Eqg==
X-CSE-MsgGUID: JHBHvmviTXiyn1KBuvLCqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="233032697"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 20:58:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:57:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 20:57:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 20:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3ebuMzv0E6p0oyAewwIqdIwsUxXiQRWaEjO3gJs18ve+pAnggMaDz9CXcHzQO32+e2vgjS6d95iCn5TTjV8QxZFrUzZ5/u1gB2cFgFD9YE63Ort40SGPdW8tLOH/hoWhB5kqvS6gRalXAHegrkdYZ8XRfaWxjKAc48HxgZC+bES692gO0jHIXZrNmw1rMAnrSDUkta8i9jkvxHlq08UOu0q473dVes53+nbN7ztedf0e+jRWf/SgaYISzmvL3/VQt6BaQqOfEcnp8RXfLMAQUNaKtzey+a9RU3blQ7WnKHbh/OgaU1wtwWiopidbU8lOqT2r83tnHRA2Z4VymodKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSxnBRFDkrLoGxLPfQbWt9QBGK/JfnuV99O5DmpruNc=;
 b=bxYXJoadHdxqhLdSWd7Pir0UoQlRXGfcrfrrKkxNbHvZiPrhydUyGWMNCrxtN8atCxrq5n/HS4/Fi/XBt/Cf8XUARiVxCIoq+3uMzmBnPPsl3U7PlYrHwx73m6sD2XcaMqyZMU3dlLC41YINdCCa02iYr7kHckfTw3aNH/cCc+Ovb5Cm7vLNXcJMsxdNhUm2Rbd2nVABZLjaPA0o78CunIQtHjaJEgqbdY/H0h6QHMHPB9+Qi94sQ91g9u4+Qk1QjWl1FCBRN2R1cWzrdmmKckhMnIqP+bgrp8tExTqdykh24bq/Ex2RtoO5ZkOdB3ngIwOhpwW43hRbmlPTf3UNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 03:57:56 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 03:57:56 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 5/7] tests/kms_plane_lowres: use
 for_each_connector_mode()
Thread-Topic: [PATCH i-g-t 5/7] tests/kms_plane_lowres: use
 for_each_connector_mode()
Thread-Index: AQHcx5VvaqPD/fCKPkCjh6BvieekSLXWGt6g
Date: Thu, 9 Apr 2026 03:57:56 +0000
Message-ID: <IA1PR11MB6467CC60DBD71206C298BD59E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <294c6b14cb098cb18dccd8291c832276aabd6d3f.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <294c6b14cb098cb18dccd8291c832276aabd6d3f.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH8PR11MB6658:EE_
x-ms-office365-filtering-correlation-id: 3d2b8a23-b827-4f7c-9b1f-08de95ec2ec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: NvTxFT8l8o+Ghlqhuz29B0w1NdXhlbKKCaAcPuuHWJHHBsllKIAMOKXIFdhQOIuuwQJGr7IEmJ9mHr0cj+D+CIyNC3ptUXKc3BAs/X62qzMbnSAPasU/ZT1RYylEgwFB1Szu07qmd+jZJqfswSApse0uU1YZF+5FBNqLFnyiJ2SHasuneeZzxbXCF8fkYQAlDbaR76MlQuJuOhp6YumZEdq1eFppUeW9HvyIfVZhNiMgltLmPMbwaTpbqwfJrr0DmEXCRoL4bmT4U5xaQN5RfNZZ2A9AZpjDne4JJvRwiHjJLvjtYlzw6i3LnqluI9F5ReEv1qhKvEKKcFljfcxbX05rzDB8zDkFrLh8FKR6pkdiqU+xCc1n1Dg3YOQhT32ixhosg4Cg+fafXuGdoEItcX9Z9oodSNtDuf8tHbdFiNlL8oVyi9VSZMlICMm2GV+qYJjRAKpC13MxpWquPyqnpKZ4wxAQhz6/PYoX/O2nosKU5t9SOG+bORju4Blk1X7XW8OmUSko6JTJ67r6AOAtONBmByQMDYQkLTBOP7zgeZKJ87W4eou9AHdA7eIqguSkXKr6VY1iiyDL67TywTevFjzudmmWh3IxSQl8Vz+Cf2q4EhSO0phQ6AVXjgTdrfuMzD6VwGS7TmTftssCCaCwbfgJVrkcinQB7QIejVP/MyMkB6m71G5wB0f/3nFCWHXAm+ucU94NLtJ1QER1Auwikzz5Z9nuFTJ/mArSxtcMuIgBfScywgqsg69YFKgmzpfgJQJfFFDGgrP+vtXKgne92VQWCAjyAT+UOj+2OWB5MfM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?682sstkgIeX5yfVRiidRclOiQYHj9jLt2wzuDgwPCSwoWXL9t+Yy2mIt7Z0J?=
 =?us-ascii?Q?oSH2onFaobOCQ+Y/4APmuFAVTME4hnK7gnI4tXs54frO7b2XF/y5cXcjQDXh?=
 =?us-ascii?Q?vrV5LXKzMyyUrPa0Tag3sr3ZvQzv2v0OAnuNU6bgpoXedEWIx/3heZRwpW6W?=
 =?us-ascii?Q?8XS04l79AmQjNRmLNNpktHIdCfYBsrR3pJp/Izb6BDtmrZ+Wb3ZXioO2LF8k?=
 =?us-ascii?Q?hIj6yZjQjQD94yhxmYY6R5r5IrerhkD77caQjwRVr+OKvGxsdl4H3/j0g1JM?=
 =?us-ascii?Q?fYrlb3nLkexyxI0n2LDVKeE0QQyRPGcpLcvC7Uhr76vDQVdl7CO9cWorgWtk?=
 =?us-ascii?Q?8RRpjCR3TKB7KJ5JgcvViLvo3/xIMrgoi+iYMdwE2D6gQI0xNB6MODjLsw0y?=
 =?us-ascii?Q?HbOK8x/4dStonqYtiKc4/HOpQfzw3S1gT1XovvtiOjqPptkeUoO/XWsIsaBh?=
 =?us-ascii?Q?PyYOBcrlIpEw5hMxSck1O0lcaKyQzqmxIVf0GZpNNVk/VUPI1VXPvzATAyYa?=
 =?us-ascii?Q?//jNfCn00AIp+OhDiNrlBJEYmBB5pfTDwQUSFYoF4XnAitnpRaICiKgJsnUM?=
 =?us-ascii?Q?Vp99YjNO+pnJerG5dLrGUqKnE6l5ZYMmuZva2vyLhTG97W4Zx4g/HEN9mK3t?=
 =?us-ascii?Q?Ryq43gQ9LC0+zcyHzpkAX5PjTQy4LJsmWOIF/efc42bLbaWrJ6JC5cJOiwoH?=
 =?us-ascii?Q?yE5O7bd/Pim4L4rvgDFn+a68gKtJy9kYLTcHcg2GqPSgjIkkvO0w5MpYZ0R+?=
 =?us-ascii?Q?Ir0y8/OzA284KA70Lhvl9P/npvnUB1FEriU1nT1uB6z9obHL/Hbk+g4fiaKh?=
 =?us-ascii?Q?eTMr5B6vAh6Aelk7J6QdhhMd88F8XG5BZpF7NvvwlkxFIBECXpObYBENGLjp?=
 =?us-ascii?Q?PcmWtiMmSgWrFp5m2GOXqG9nqVpfuYlxXSk3AQNI3kd8t+M1fImxXP0DUf/x?=
 =?us-ascii?Q?NglvcWS5RqcqTcSaKF6x3jwim4YseAVpV8Xkn6gKKDsZc7yJ8m8Ly93cI4NE?=
 =?us-ascii?Q?4Dmc13YJOEhk++euP95RevOZNh8o1CXC2n6EZjPFxsalxqCQ9L0bBNCTxoZ4?=
 =?us-ascii?Q?OQaQwHLELcvIv3PfO4xDJZ1vYBGDbyIWAhIZbMVby+v/dC7MlVd6GZGpUoyc?=
 =?us-ascii?Q?JtxXshKiD4airfoteCo/Am2Cnvs5Dl8mi+v59tVu1AOG/l/hQMgbsX505h1x?=
 =?us-ascii?Q?mVqHw6YojzHMBnuYeVcHOcqyXpuOn99UP12+dvBUXk4z2VgSFR3GocrUa6+S?=
 =?us-ascii?Q?SMsrkWweqxzqL+U9qja/VBuQwMqNBjOWfEmbBCz60SJkmWfw4VrIp6xabdb/?=
 =?us-ascii?Q?xESZu9cDW02Mq8zTkhFLqK7Mz5Pr8o/DyT3wIBDxtMnttHZ61gRLo1ge3gk4?=
 =?us-ascii?Q?Ue6pWNes61XzDt7uB690U02pnF7VEKwuxumuHCcbSyBCSMXz8C7kgib1DHgP?=
 =?us-ascii?Q?Xc26yqEitvNubBwve6YrlynyMXGf+ncKXNkS1kACWSLFSUXAQZqgbylr+z3K?=
 =?us-ascii?Q?BWchMST3nVWBUtWHJ6EQBDrwe6b7Rk/99f/ZmWH4r2X71xO3rZ7lpvnxYpEb?=
 =?us-ascii?Q?Ls/Utrs3j64OIkGaTutjyZ8pxlthkAj9z3/HwCFxXU6Spvu1Mz2XBtgEWtDX?=
 =?us-ascii?Q?1kc9e3tZ+YCWK0Xs7bORqjaV8qphgMEhzQpNC1CM2QioW5eE0bWUNFL8eBG8?=
 =?us-ascii?Q?DmiNMBjF8cGrojhLM9LvOqCEmO+qcEesZl+/rDOOPWrxHNvCDEhBqUYDVzFx?=
 =?us-ascii?Q?XMnHp0zJBg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hm+l4E/JSt6O0k5gJSzpjme7HfamsB7SjtY4OJqvezpHvA3LjJV9iP0RDP1rlyMw6Su2kYU6ViJeL3cl8XEWrz01IYzeeSRy8zdUH/typx1BHh7XvbTPAygvsJyxi8yRh7uQDnEhLfm/jKfkczsclLnXX1/FlVhnXSv8MTFPbj35F5Bp2KUXHuEDqhWz73TfLfJc1UkfCgwzPiMDnpudR3mWmACjuvGMyBcXLz+oeuZ4lvgvPYHDoeOyMGYb4L/Skq9yI2IlWO9d2pq4ZSrYaY8optltFms9iZhx4UhPiBOwpydtzYAwZf+8lKuEU06yLjnWEn9kmVm5puinBJSbiQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2b8a23-b827-4f7c-9b1f-08de95ec2ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 03:57:56.2362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Ai8E0GVkY60OXJSHVtas0PPWP/CVfN1dQu+yXbekL10UoMJFQk+SxfNVHWgxdV0dWZ6Xw2q5p0m9W7w76ahKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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
> Subject: [PATCH i-g-t 5/7] tests/kms_plane_lowres: use
> for_each_connector_mode()
>=20
> We have	a helper for looping the output	modes. Use it.
>=20
Same. With this
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_plane_lowres.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c index
> 79e0d7a20c2a..83b8f6b173d4 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -87,12 +87,10 @@ get_lowres_mode(int drmfd, igt_output_t *output,  {
>  	const drmModeModeInfo *mode;
>  	const drmModeModeInfo *min;
> -	int j;
>=20
>          /* search for lowest mode */
>          min =3D mode_default;
> -	for (j =3D 0; j < output->config.connector->count_modes; j++) {
> -		mode =3D &output->config.connector->modes[j];
> +	for_each_connector_mode(output, mode) {
>  		if (mode->vdisplay < min->vdisplay)
>  			min =3D mode;
>  	}
> --
> 2.47.3

