Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B37FCD98CE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 04:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFA10E18F;
	Mon, 15 Jun 2026 04:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHIjrE7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0E010E18F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 04:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781499194; x=1813035194;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fmON+Jp55KoMornX6G72KK9i/9gdDuGwxnY/Bn7dTZ4=;
 b=CHIjrE7imyHNnZidhC5tLsv+OHZA4iiKR4yTIXJ3zMQa640p9a2JrPno
 9t8fk5CjLM4FCh/kcbrPCPfU5pZ4ZmpuFqqQJTMB3Cmknq9N92eyy0/uf
 4XGHpvE+IS1K/0vD6iPFrFQoSNAqPLKPAzN9AMDAXhZCQXFBKQq/fXRHl
 lMAaNAXW0uuhydbstq1HVNuaqRc9IXS4SEd3YwQla4iS1QzRb9WOMTxfX
 q2ANx8eW6gDrJ4seVX3Qj+SQffrK7ftWd7nmm6X5fhgri26Pk79iYlXCE
 HROZAP7bSl6ET2qC/SRmnpY+ex0QN1d183lfUFZVe9ksVCIVkMu+rXVru Q==;
X-CSE-ConnectionGUID: unedrOgWSb+Vip/n/uMvPw==
X-CSE-MsgGUID: BTC0My9jQnqtB4w6dYvQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82295794"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="82295794"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 21:53:14 -0700
X-CSE-ConnectionGUID: a9Ws+cbxQ9ScqgUWQcygCw==
X-CSE-MsgGUID: I8Yarg2FQbaePEFwffaZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="243000009"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 21:53:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 21:53:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 21:53:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 21:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjHAc0RUDqXTYPg+uTxNBWNzbb3Hkn4izkZo9YqSu+keu3Ffsipg5pk/dC//qvc8fKVaA/QGFW0bGSKm+12+FFQ6g87LPd5ezLs8nBk4j7+rE8+63eDeAbiZEp8mdIKCyWaezXjWxo/EgH8w4nv1z/+qy/IOMOw+cPFsPAgPaJPoyEjKU6zrYQYD0RGjTMXzwcT0daVhHz+XzpDLqvJryPvZhDEZbnyleR/CGu5flmNbUf1Sx4gqAjR+OHqs+6ALdL2RAMMaSE3l4FldGYFOjzvacskYBCiOn5uktMljzkh/TlSuNOEruW1CjSTuwBgQWt8vzxWdW/+drC+9Q4YxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Km+gXqQh+p5yo/WqU8wWHCLNvmK0BnKMedrR2e2Q/4=;
 b=u3uKXsEaV1/M8fJHZwmJQGWLUcf3cyabcIZXMwoMeUzhXi14k5xSlJNjYArGx4ULCwnDRIJYDzcjxq54pnWMamcd0u4WorQHpy7Ljz0/YP3p/xX7ng3MFXVW/M4YodB7a3TlqMRwU27t7f5F6HbUgF0EVPIAGKE0ix3bbaH6Eoqb80Mgu0iZNGhoYibvS92gRpT8/JZmY9XslTZmEUFGoPCIECN3AaxL6RLUPzKRQQD4abbXSwbTMqVimufQKbE2Rzn5gvYgbBlvOLhB1MS8xuTucPeXmHvg09dJRC4myeboJbzjFVe//5fJkSfPtx9UMc2CQ8d8dMhlzYWl6oQkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 04:53:09 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 04:53:09 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix tap filter
 test failures
Thread-Topic: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix tap filter
 test failures
Thread-Index: AQHc+k2rJ3l64BlGFkGU3QRZBCvQIbY/EOyQ
Date: Mon, 15 Jun 2026 04:53:09 +0000
Message-ID: <IA1PR11MB646740884662D716E1707B7EE3E62@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260612093518.2657433-1-swati2.sharma@intel.com>
In-Reply-To: <20260612093518.2657433-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SJ0PR11MB4864:EE_
x-ms-office365-filtering-correlation-id: 99cae5c2-e23c-4428-2d5d-08deca99ff47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|3023799007|18002099003|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info: YdHd8kntlokUGsEXWXt3qjcl1MAOuuGMOzgHAjWWZYF8VHcRj0LjQvR4O7ppiSqNB9c9KzVMjjtjxwEKNTGdZT5lrMYGalJD6PqagwsL/7cgXGRgHwm1O9qMWbf+TTWOHh92kPNDeATUOol66aE4x1otoeA4PIc8FGMmgT5VQyXLbGctCAG4cJfFDE94XMSBzLWIzJafy5N9+PHSkeap0NTvQjvxN0qqJAYUglS8jWzEiVXbCB2YusbB4Zu+4p59RUapdlA5fL5JBT0yOpYcDYMSeXUVfZPHWR/VXxY0N6pKRicjIshMQ24iCgZvoZ3bFdNzaa9XsMZgeNLV3eKCepU59/3ii/GE3H/ahSj73t0IA3OOLoe25zmVS/xgdHJa3ZJd2gd0PF/whLiU7vekPf4uKnNdzZwhT49QDqREJp9iKne+g+wmozKPHP9EWp9Rkv5KPB2cUfhza5pGsBRPCBZE+N2DL1xgvzrqgsfvrjIM17dOxa2pWORWsd68abSMUWN8Pe5n98tQ1b4zRqrqPtCDJJb07TSK6if8uRbyaTvdHsxT6jKxI8pV+LKTCgNjXar3dcmzs1gQnG+e8tPeLxVcCguLJDORWq+KJpIJ8lchoUTUZxtQpY7uzgzP7NXvho9b7SlX5idP0+HckdiwkRPQXtpvkr5dVwUiokuZBavjEzQ3ocVMY4WjfjhXKSaXME07FjR1uh/lnlKTEYJSOpXEEmWsAyc2vqI8uCSsfNMAwwJOF+mCUrUEYQXlukIy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eZ2liuY0kl0NcHgZkt2SvGDsuZLbMk0uuqd68sIPnXgZiPhFasJ9m5aedgm4?=
 =?us-ascii?Q?cFlPwlgS7gskVLp/i8ZZeQfswWwkP2MliKVXK3/qKR2+nc5xBZyfgTj3eAw9?=
 =?us-ascii?Q?PwoyY7KtfN1ZSMgMy38la9tcPd4izyv+8TyAlR6hA5mMwxf1JXvBA3IfJ6la?=
 =?us-ascii?Q?+UhOieHa9KFfGa3l/kVxNl0a9+fbEi3Q6boA365ilbujKKRae85+D26cZ16N?=
 =?us-ascii?Q?vPcjXpuuJWmUUnNmnzyA/ilg587n3CTqllj+siH3+YE7NiUgHywz48g2jIpm?=
 =?us-ascii?Q?A05EUgdknjR7inVcwCMJ3lP03O85/loh2bbkVZYFOdmWKUGpmvwZcoI0d4yQ?=
 =?us-ascii?Q?FK/Yg7wq7opzHsP6EOrw0dR8Kamukz+XPwUarRoNuM8+/f1Xnuii9YVo2iy+?=
 =?us-ascii?Q?9yRW0rCg77nISaMq6Dza0RNJe+6+7RA3XOKWgURqgv992ODh2o2kf+gi8Awe?=
 =?us-ascii?Q?JuNWjIVzV/wkE0IE/xGxXnGen0ZQw7MuqLf9DqC9rbiSMpRSQcD3BgM5T5kb?=
 =?us-ascii?Q?8AcJYGg8B1ss1LfdtRM6qHKG1vijX0XKLB60jMB3XuVCvM/170f0FAssld77?=
 =?us-ascii?Q?9WPP6qSJ6rcmweeVKcPwOk1j2bDtz/TmqzB4AlZuXVtqfcJ7xopDn7ZAT90t?=
 =?us-ascii?Q?/CXG6gtR6x2gsQcI9I6FQNxyQo/n1NyUjYN7pI7iqHhKSt0q/XBwm/D4BT48?=
 =?us-ascii?Q?LzSURFTTn0NaW+Odb5aYxuc1VBYExu5dSUx5hq0eTKypQnYJqbCiB0NxMaAC?=
 =?us-ascii?Q?7zWC5Jl43UcYPPSDTnWVtfv649AnfF2wzjPcBpK++b5fweMYZ6UNNNSYxmEn?=
 =?us-ascii?Q?idMbGvfHVYqdTd2b4usC77oq7Dvp485j7iphwYa0khFrARrC7/QhU/xdlKvJ?=
 =?us-ascii?Q?a7E8yM3wVpxJEHb6oB0N4Iat5iLXz53YA2jOM8VQUzqlSbkn2UU/Y6u3xdUu?=
 =?us-ascii?Q?1sCSJnviwfwtRHS2SSpJOi0jXXXBQrULiu33yJXVwJdACgToTtp8CtmMgaX4?=
 =?us-ascii?Q?o6V+GtC3PQvbvdBstRqv2KIzKJZzrYZbQLnM79R8Pt/nE2QRvRBRH76hcT+Y?=
 =?us-ascii?Q?f3/+0DBhUTSULk0BUIHzAUmXjXzzUthBDuCo7euk1lO4ejYyp9OJXw1qQmar?=
 =?us-ascii?Q?5swElXlnFzDzYnDxmRrjDcZlPbwQFaO2xYu8G+98Zrdw+wHgsHS+B0v4a/TT?=
 =?us-ascii?Q?QEcVRanD7+47MdNDFJ5+n7Royv3ezWf9kgvN8+LoQa7KYbhwPBp/NWnyp3vy?=
 =?us-ascii?Q?CFnOtV0eSUW7d3K6xcXZtcbghEbspbwkJrQbiXqn+AQnXLS+sGa5H+E/JV7B?=
 =?us-ascii?Q?LL9HLj5rQNcVrJDWkGN4HxvsNWDj2twO4Pkg5kSEnUJgZpLGR4wUb9aSCtMx?=
 =?us-ascii?Q?jyW95phCGXsVTWY73UrrMI8w5qOb+RffvM+AP8WwgVl/VujbIH2ZuHyjtQuB?=
 =?us-ascii?Q?bBW9nXiYgRcyqfNBX0iyQVWYQ51NVrDqRsj8hj6kxErNmjzm17DwNgYR/75d?=
 =?us-ascii?Q?NQ3e6QyXpZzMXJ1yad6WFkQ7CpgYVc+CZ/SPIkgjB7tDlaWA4bohmRDjGC/+?=
 =?us-ascii?Q?+bDy5FJ13sNdcOZEbuWFUJv9xdyjqpSc1wNEsRuIdktlFYWt3+VYEtIOEkDf?=
 =?us-ascii?Q?+3mfdNVXJFDMBNHMCtL16r4SVjv7+o4cbSLAXsQQ61mHku4b/Jd9HV0FGbni?=
 =?us-ascii?Q?jEuvejGSiAabK5kEgIH6elQLSP8ICtRLGHTCXyTs+TpIctzw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OnHf5SPThaxPmpNuiM8EXvNbwY6YvrTW/uS6qn+4Xj12aRq7VfRczHKNadcAXSENXinnil5kekC6cnS/gOc2Iysw+HVaFwvqSmNkdk/t57us5uKurGdYwkJhgJ2x6SpXztweTNZik7UqP2ogj4vqOJeuJjw8o6bnIap2/EP2gfqS9atQPs2t23ONrhM1s3Xm1ewdWC7nCBUrXEt9X+tct0KaneYWPP9WIImXvKn8tCDO1CJzw0Cma1soHbXiQ2rqZRB0QZegsSPyLm5cTO9Pb2M6QWQFxc4EJFOkfVo+iraOpOm2IYomKGA6CbKd8KUf6AWX781wqrcKOVlu6DpBTA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cae5c2-e23c-4428-2d5d-08deca99ff47
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 04:53:09.4469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DbRg2EmrpMLGIjQcnL4AWvPMCMWU9wH9+RtmjnKOnXdEXBcE6DuxmkGIz24cf/i3EGByFhDoIysFzdftO7WDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
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
> Sent: Friday, June 12, 2026 3:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix tap filter t=
est
> failures
>=20
> Fix two issues in the filter-tap subtest:
>=20
> 1. get_modes_for_filter_taps() could select modes requiring bigjoiner (e.=
g.
> 7680x2160@60) for tap filter testing, but joiner + CASF is currently
> unsupported. Filter out such modes using
> igt_bigjoiner_possible() against the platform's max dotclock.
>=20
> 2. After each tap iteration, cleanup() calls igt_display_reset() which cl=
ears the
> output's pending_crtc binding. Subsequent tap iterations (e.g. tap-5 afte=
r tap-
> 3) then fail with EIO during pipe CRC collection because the output has n=
o
> CRTC assigned. Fix by conditionally restoring the CRTC binding via
> igt_output_set_crtc() when pending_crtc is NULL.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index 353a9a292..63848dd49 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -358,9 +358,11 @@ static void cleanup(data_t *data)
>  	cleanup_fbs(data);
>  }
>=20
> -static void get_modes_for_filter_taps(igt_output_t *output,
> drmModeModeInfo *mode[3])
> +static void get_modes_for_filter_taps(int drm_fd, igt_output_t *output,
> +				      drmModeModeInfo *mode[3])
>  {
>  	drmModeConnector *connector =3D output->config.connector;
> +	int max_dotclock =3D igt_get_max_dotclock(drm_fd);
>  	int total_pixels =3D 0;
>=20
>  	/*
> @@ -368,8 +370,14 @@ static void get_modes_for_filter_taps(igt_output_t
> *output, drmModeModeInfo *mod
>  	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
>  	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
>  	 * TAP 7: mode->hdisplay >=3D 3840 && mode->vdisplay >=3D 2160
> +	 *
> +	 * Skip modes requiring joiner since joiner + CASF is unsupported.
>  	 */
>  	for (int i =3D 0; i < connector->count_modes; i++) {
> +		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i],
> +					   max_dotclock))
> +			continue;
> +
>  		total_pixels =3D connector->modes[i].hdisplay * connector-
> >modes[i].vdisplay;
>=20
>  		if (total_pixels <=3D MAX_PIXELS_FOR_3_TAP_FILTER) @@ -
> 663,11 +671,15 @@ run_sharpness_filter_test(data_t *data, enum test_type
> type)
>  			if (type =3D=3D TEST_FILTER_TAP) {
>  				drmModeModeInfo *modes[3] =3D { NULL,
> NULL, NULL };
>=20
> -				get_modes_for_filter_taps(output, modes);
> +				get_modes_for_filter_taps(data->drm_fd,
> output, modes);
>  				for (int i =3D 0; i < 3; i++) {
>  					data->filter_tap =3D filter_tap_list[i];
> -					if (!modes[i])
> +					if (!modes[i]) {
> +						igt_info("No valid non-joiner
> mode for tap-%d on %s\n",
> +							 data->filter_tap,
> +
> igt_output_name(data->output));
>  						continue;
> +					}
>  					data->mode =3D modes[i];
>  					igt_info("Mode %dx%d@%d on
> output %s\n",
>  						 data->mode->hdisplay,
> @@ -676,6 +688,9 @@ run_sharpness_filter_test(data_t *data, enum
> test_type type)
>  						 igt_output_name(data-
> >output));
>  					igt_output_override_mode(data-
> >output,
>  								 data->mode);
> +					if (!data->output->pending_crtc)
> +						igt_output_set_crtc(data-
> >output,
> +								    data->crtc);
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

>  					snprintf(name, sizeof(name), "-tap-
> %d",
>  						 data->filter_tap);
> --
> 2.25.1

