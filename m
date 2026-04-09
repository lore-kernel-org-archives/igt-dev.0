Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75294E98FA8
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2972210E0DD;
	Thu,  9 Apr 2026 04:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2hJAB7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2898A10E0DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775707237; x=1807243237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iYRT2xZGr0ZPHpkgOHXTS8VDNapM3UChtdimaXew5gc=;
 b=V2hJAB7L4886vfM2P7OLO5/CX6gkSIt8Cqx7ZK7MerAGRUnF1oIbof9C
 iubzvBcQ8G1vdoHBMlnWesZoheRjUJuIx+tWOu5StGcvm6eK3S8rXAXie
 X9mFDXWYLyMK3e9eK/bSK6+/zgX9WUVXHOqpyvqCoVCVB0HblRY2YYAn4
 JqObydA4wzCBLUQaypSDvPVwC6Oj/D9eBjGxs9S/n0+/ZawJT+MQrQ2Yl
 qvWxady/Ymu/D3jAvsX53qB/5YS6bamR4c8C1bnws0eQKF+yWcoSQv1CD
 11AZKyOaVxMmb0RxxcBlyeaTGSq0dMC20c5o5u+8VTenstd13uz4nj3rj w==;
X-CSE-ConnectionGUID: AlcLrnq0SLO45XKkdCxAQA==
X-CSE-MsgGUID: BLGDBdCxTgyKMfTfKAX7mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102155689"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="102155689"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:00:36 -0700
X-CSE-ConnectionGUID: A1k11tLSR0CyYFR0KcIKBQ==
X-CSE-MsgGUID: +MA3kxmHQqGc3sW0lRuT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="225884122"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:00:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 21:00:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 21:00:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 21:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRDy6XjK1ViExis6C8FYzny9PX2bq6vW1/LLRPCfVDLzg7DV4dPhv40DeT6jD5TsOng4Eh/E1G9qwbAYgnWdlt04ofSjXfom6UEuYpDmELVl4SYpsJ0qu8pkC4giCzIjsuG77cCwuNf8U4NNRJ8zq3uKU3ZlQkpMtsXhh3fVtTmp0psEJfdKjLAcWFVdaTaiEXiLp48wuX1psROapOtG8YxcC2RrX3OuQSq47GrGdWM+tfk+IRoOgl9CD3Cu6dDIMojzeYC8ivVBmrzgSC3Ci1FWbErhK/8rGc9PX2SHY8vc3WVMSmBrGCEM9xA28NP+4QlNcSS0fzaC7DSiVQ2wNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G0R+sk9a2EBzIIL2iAvbVquVh77DKx3NSud4D/90YM=;
 b=b+1bNE0+a6oWRmvBP9DoO6EPepcHwp2jCBnjLvtv7VBJjIcUa28q3yGKNIJoIbPRJrv+zmFaiThAH8TEH3lZJ00gLACihYyjyZo44sMTJaUakHqMObnBJx5gk/R8Z4jmLaX93pV+PU2sRELE+4O/WmLh+SiXy3mB0u1WVzGxxBK9UfdXjS3wxkmT2RrGqVfD0q7HFkM/JABIEaGRXKgBAlWG8AEKN+U/g4buFmz71XkmsFOK/nODSgN9l62Nnfw4xPtaC75boM5tgdZTgNDvYP1YSl7I4K6ot09PXIvulJp6NMyW45NhVbD8pH8nO9wSsjyPqVWIas4j2wj8JrPYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 04:00:32 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%4]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 04:00:31 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH i-g-t 4/7] tests/intel/kms_pm_rpm: use
 for_each_connector_mode()
Thread-Topic: [PATCH i-g-t 4/7] tests/intel/kms_pm_rpm: use
 for_each_connector_mode()
Thread-Index: AQHcx5WS3CX2MyGd1USAITZkQFg2IbXWG4/g
Date: Thu, 9 Apr 2026 04:00:31 +0000
Message-ID: <IA1PR11MB646770E2146073FC053B4788E3582@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
 <fa6053941144b807ce8b5ec9fa392c5df8126414.1775679624.git.jani.nikula@intel.com>
In-Reply-To: <fa6053941144b807ce8b5ec9fa392c5df8126414.1775679624.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH8PR11MB6658:EE_
x-ms-office365-filtering-correlation-id: e2871a1b-dcb9-4b85-9503-08de95ec8b8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: LmnCEv4d0ifju6rOibue7zF+lUaaSCN5aLF3ID3g8l4uyrvO9pGF/mJmIDMPT/89pMJcggT1HI8KxyF/kS+s67DLBHpLlJTiAREcK3DwgpSSjJyzUAuEMLi9AIjZjR67wRw4zr6TkMU46phVOjplQZSjcPsHg1XO0T45JkNtOeTbVXH7mJxxjewiQHMaEFefVg7cDedF3TTeXkzaBlhpk65lQ7K1HSadX2qvTAp4VHflmTFgfka4NHfNI54pYtsrLoePTuth/JCOMRt+bH0F2GWkS20eLOCUjyk/D4IcV8x82fwNQUCb0LgSBZCL8zYIFZpi1Z0GdBKN7iaVRroWNrDoyd9v6LPtwSyppushMcp4zXejO/YIPWOcLLSC6S/8/gdIHYdt4WyuCIASmaVcfFAQWKkrlZJowBGBxvXNV+JRHQBvgcyiZ1bFzQffJTgPLeC/CLT3/dqxzYOkNftz/Qf3Wl3TtrooKTw8UZY9s9xXOQrGnB55CQMpLpQGwPcYdFKqnchNNgD+RM8QpgRD6nO663Ph+grF1wFv6jFit7PPhiWjrcnklgvK3I5WjmztBYLsMqlO0T/yeVow+lCgKCLkPPKwVw6BXOPLmCQalDbD0pCwLRNHCUl16FHBOoetkSAkZjWC1pkG6pdc+LpYTY19bp5FPrqclvc62PCzLIr4GXLS/zIc8cbQRi+D+N8MnF8Bm44yiwdxJYYWquzKk85Ys9D1PrAqDUPfVdxjFnMiwQe3ysH8qDdXK8Ta4/TeNJhhbG1+5rH3VzJeSsDtS+jOIyHEXbcIQR9nMsvHwFM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rEXoEInwj+ov0JAGhIWHzX+J5YDu3z0JsZI2Kpldsqd9/V52Zb8FsYvGYg1x?=
 =?us-ascii?Q?P5WzjYSsK63SHo/Qb/gguV5BCito40jb+l5gRaPcOv5D78JTse+TyGcsRLub?=
 =?us-ascii?Q?8GLHPVdbHi+VxVFpQxhvmEHPcTZMyfvXUK/dIEwT90utc7KzFBB5k8N9XVkd?=
 =?us-ascii?Q?RtfeMa4QYN1QcHdJyh1iIpVAeINFylwkOfXV+RgkN/xYr0aK5x5AckUts595?=
 =?us-ascii?Q?IRKRTwemQKA7k2mDyJn02JK7SBGg5S9+jxk5kv9EcK6D6Mv1UIVJYWDjBQt6?=
 =?us-ascii?Q?guna2UBaKRnKTNxej8QjtYBgy1zJF4H4mtdzY8t853/1pIaq2MK27zAVrhLy?=
 =?us-ascii?Q?X4/FzkSG2vHSJr5ouM8+K1nhXMwO5TKmKfOzb1VIhBOh0GIvCAfnZHSSC2sp?=
 =?us-ascii?Q?IBfp3rig5E9OYZJFy6eRTrVUCa2ea9pKWy6rhl/4/pHLqyZ2Ku8dL9ID3pQz?=
 =?us-ascii?Q?J1CwldDXG9QRNU5paZR09epLUoQS+syPl7fjd7b91Yf2nfSfHqbUCDalo9kn?=
 =?us-ascii?Q?AZgPL/V9jEN6RgJt1cAIFeGan5tsBcPOay7xQ70VLz56JhchV1d7C+Gq6S18?=
 =?us-ascii?Q?c7YZpRdnriYsfcffONjm1qA1c5uuMZDfqd1wPPRF6Zbqau1p30xB1CWlNCc3?=
 =?us-ascii?Q?uVXnET3NUNcYxIFzhEtYyY7uOQx9faMGB340JtepOkR5yD1eAk7ThqrJhkF6?=
 =?us-ascii?Q?TG+StYQhLdPHGZY+MUPB+UxW12k92g/hyWtOkx85eLa5FbYjxkNoCvunzMLS?=
 =?us-ascii?Q?eh5qAK6pWqS5LhcLb7N5oPKWIBmxytq6QSDp6lYUv6IIcHDILdOrb1Q75jzm?=
 =?us-ascii?Q?QmsXaK0z2W9ysOvbMj/6UX04Ok+E4MvCwQ0+qFPR/Oz0L/4ZhP88tg294lB4?=
 =?us-ascii?Q?fA+9Te0XtYOX+sLLXFBNJaAFJCLMxwbG17FxhrnxQiCIPXlyjBW/ekCGvaH5?=
 =?us-ascii?Q?o6wV5CQviCij70hirjdyN0Cr60oqJnLkA1I4L2R0rAYiPfuoWUrjeYfnfUlL?=
 =?us-ascii?Q?Kf3Rpe8gKkNXOFQAZ0xBfuykOogp4+XjKVXH863RJau8dx0Vr6NNwnocmXRI?=
 =?us-ascii?Q?a8xM0ylQmWSTu2cidkxYe5r3jciWJIBg9zvGPqJMSzYYkIm6vzu5r5tY+DiU?=
 =?us-ascii?Q?oh2f8+NCLwVJwI8xqgper/lbAJ9dOhSR9RWYWBSDkfZHaWF64qyak8eThSMt?=
 =?us-ascii?Q?gJHuF9iEdxIWLHQsWi7+ZpDGG8oxZSPgEg9f7Xez6uN/jyohN+05xaT2GY+7?=
 =?us-ascii?Q?2kaQO6G2Sg6Abg2xmoj9J7a7BOVho51YVEWCfhEXrgEB/CtEXMDC0MSGUfA0?=
 =?us-ascii?Q?qtA41YnUFXHLHOO+z7ExgCcI/OXYeXuUIGBnK+pO9mlUNmT79946gkPb6MVy?=
 =?us-ascii?Q?i7pvKHDcaWnZjOARoM3HdhTW7BLkTawOuPyKGILhaUmXzDBGqkuworqdb2F+?=
 =?us-ascii?Q?3MMj+xpkMN0IXGUO4P4Whyfy29vlj/EvyoeW8JEmaivA4upV4xK8wSGsprbN?=
 =?us-ascii?Q?+WEXNt8szrkDaFo4N666RKXcYn/Y2+u1TMmIE32cTZoE3LDq7DS2+6uR3EJk?=
 =?us-ascii?Q?lmEQ6lAhKsIqCcfo9p3A271sz/KlqoWeUfWLWEGza3itdspson7RvPdCPf2s?=
 =?us-ascii?Q?dYkmqplaJjqjO70Z4aDIu8CZIeUoHxOgpavZF7OS/xgDWAJ1BIKyDTpyjgKG?=
 =?us-ascii?Q?Who5KZFez760975d4CobmPuW033uCXKoGGcGh8oPJg9An1tvDpKUlPHY0KF7?=
 =?us-ascii?Q?OBt3L4t0Jg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c/4vA3DXz5yhK9kNu4CFQHNgE+XNyTOHOyZUEjBi2qXkSpOIU9OMOohM1MYaXlqBGwioUIdHrBiBvc8aoXG3FPjhYri0kDh+wLlRGXBK848m9jy9JaXjXQKxR36k7qHrPjyV6v3jo0W82o0Cty+vX6nu6msSaJ8o5k0RCAgeEKMWebgyvl8PqYHnEmX5zPAdVXtiwCPkoAruCoyurHb0HgwCgZVUFgWeEYf5pxB9Hlv9y8A/56ggTH1rgn6rCKVNvqVwrzxogi9oWunGexc/ggLbsLLT7CqeQSPY0wAXAiTrPf+iudc8Ots5Y0i5fo79gfJDFSg1T0jbX+bUykkl0w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2871a1b-dcb9-4b85-9503-08de95ec8b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 04:00:31.9265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3zcJ12fwS6GUBUlHjkoJugcCZAJ8YB3Jwi413DlOhRxbvcs+Igmeh3Xk447mH9KMFyYrSpGokiwqeew2UKvsQ==
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
> Subject: [PATCH i-g-t 4/7] tests/intel/kms_pm_rpm: use
> for_each_connector_mode()
>=20
> We have	a helper for looping the output	modes. Use it.
>=20
Same. With this,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> 5f24fd49b13a..60d0b27929a2 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1595,11 +1595,9 @@ static void pm_test_caching(void)  static bool
> is_preferred_mode_present(igt_output_t *output,
>  				      igt_display_t *display)
>  {
> -	drmModeModeInfo *mode =3D NULL;
> -
> -	for (int i =3D 0; i < output->config.connector->count_modes; i++) {
> -		mode =3D &output->config.connector->modes[i];
> +	drmModeModeInfo *mode;
>=20
> +	for_each_connector_mode(output, mode) {
>  		for (int j =3D 0; j < ARRAY_SIZE(prefers_mode); j++) {
>  			if (mode->hdisplay =3D=3D prefers_mode[j].w &&
>  				mode->vdisplay =3D=3D prefers_mode[j].h &&
> --
> 2.47.3

