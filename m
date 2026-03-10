Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCD3FD2D73
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 12:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181C210E2A8;
	Tue, 10 Mar 2026 12:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EObnmu6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DA910E2A8
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773147518; x=1804683518;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xAboxrW+eIcHY3Ah3TmIEGtvAKhV+RPyUfRLyfdV/pk=;
 b=EObnmu6VK9xhKLK4X2cW3tRn23wrpuGFLEflP04Hw9Ec/+j4W3lFmJnp
 m2nAMNg4MAvYeEFCkyhNsXS5qjkn5qnCUpYqLBGrN7GFiSQPSMJdiEnHn
 BLBMisQPGu6HW2Gjzlh6SvyGB+sqN/61d75a8BaI7VFxNaSXW3/S6vUB1
 j3Krspx4e3l+hL5aZa1KOmJkSZ1MpdO868jjen1/Fcp+lgu5A7hymtk7+
 dL9myVV/v1U1tVGNy1/gJikAmfbDUR3wjvJW+StyqmdM3noTqSSiGL3c9
 tc3k25Q2z7m8ZMfNKErsbjt2EQ4N93/Xe1MTgg28Fy4tO1VTKP0Fn7LY/ g==;
X-CSE-ConnectionGUID: oAU82aofQ0OozelK+B30PA==
X-CSE-MsgGUID: b1MXc6oHQfSslTQaUWVnHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74109727"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74109727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:58:38 -0700
X-CSE-ConnectionGUID: ESGtxT8hT2qEUSTprECFpw==
X-CSE-MsgGUID: U1M1N07ISXiX3A+//WpK9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="222702188"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:58:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:58:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 05:58:37 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 05:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHB+OHUEK3zl5i/0DrU/mjjfTl9YgpXPwh2pWuKKhAGZFIvKuaFkv0kmifcRvIa5Le9SKWPHixJbnewPBGPM2ABPpd91T2AEID2BrwMz5+w8ODIIFCa1F9kujeKC+L49GXfrnuVuZtF9uldyYi2Kojl8Hp4R0gtC0dlEad3l5+kF5aOmttCACCxh13Lr5lzX8WsfZO4phzGApRQo+tMdg7BgCd77NwAC2iJIn3x78KAQujQ78yEXANy65R2suHGHZ70uOsqNkmrt8h4rKXZpWNvDNigJk6EQlPgRuL/o4dChpDbvV0M4n1yEUWaWyFqG+9og3LaTL6ES5KwIpC/LzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ab17xH8CJwrwOtslT5fWW4KuZZs9RKqFLMTn4ySZyLw=;
 b=mO28bWrvFipim8/E2IwvH3ixvaqD1RkJc4d1KLhcG8TnFqi5ixmXeG0GKBQd5H+iHTDy2mKMIszBCueBKhX+9q6raBUvQ1BF5Ghv++GK1nFm8XPkO203SARMxqppdjqwYhGFRyYYzfeS524tALytKNvt51eIH3RMN/Y7gX2YJWc4fgDL+pO9NC2dw30qVcUloMl8CIGv3zitHhGnl6b9Asp+Eg/l3iIxuRavW/oeO51NH9pSG2CP4MpyqyB4i3rfuSbIxXCU54WI/5XBC5CR6C8XjnRCzIgm4a9aZigmVWfOYb2lK9zHHWCfmCZEZv7fcnzoU9zj/3EKQcZMJMBYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:58:34 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:58:34 +0000
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Sokolowski, Jan" <jan.sokolowski@intel.com>
Subject: RE: [PATCH i-g-t v4 3/5] xe/xe_eudebug: Add reattach function and
 make plain connect private
Thread-Topic: [PATCH i-g-t v4 3/5] xe/xe_eudebug: Add reattach function and
 make plain connect private
Thread-Index: AQHcon77BU2+wYm2EEudyn/ay4gJ7bWn1iHw
Date: Tue, 10 Mar 2026 12:58:34 +0000
Message-ID: <DM4PR11MB817942304623E309AB7EABD59446A@DM4PR11MB8179.namprd11.prod.outlook.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
 <20260220153748.210381-10-christoph.manszewski@intel.com>
In-Reply-To: <20260220153748.210381-10-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5234:EE_
x-ms-office365-filtering-correlation-id: 6f2b738b-4137-4620-2226-08de7ea4bd19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099002|38070700021|7053199007|7142099003;
x-microsoft-antispam-message-info: YSFazB1iPZMnAacDO5bT3xvEKrDV5EJ+hrh3Dx383EcuwwLfgB8Q8PfN8dE9dgX6tHg1HHM0fgoHte3CyL0PbBUaTQRoS349ptqTfxUMoGnnlPmsALtzOuZ3Xt0h/RAw7cSRMXGgGGMhFGRWcGjFkT1X626TEBV2FG8o1Ht3+DhvBmWpgEe0aMM2Yvwm22et5yj/lyy90oUGODLxVDB4ueckitazsmDkUfp0kyG2vaDi4pzBQ9x7dSixl1Zc3IUQtTaq4zm9OB2bMObLS9DVfMw7ceF7ZogNjkQA2PS1YybcsQ0E9xb852rQp5rEMC3xG26CMocObyj6CcsNlUjRKuvAydEW/j2khD9bqetB3lpk27cltnee+r22K1wYHfWIYEHSHMY67GPQvI9qt67P0tiFopbiViOBilvOcy6kjJaIUaYmwnfQwwO2lgt78x75nlI9/sYGmQBUMSQqEWJO9P4XeLnBAxAoGTo9qD4eF5PJ3UR+VqvuOdySYbZtsIPr708WES4bTh0rnh+R/R+llSvLDKemPr/w41XIVA3XFAAvRMlz6Hpkyw6f2cXLvmh/LfnrHaqP6sZQwkqZjQfeeV3+I0nnyeM/6dgNwhpSKsOzITQJSKgIx3EvWXVyfu5KG4s/TUIvunYrxBqUNwlnybLt9a7UvOv69F0W6A+eTDcFu/LoVxcTFGoPCOjPAhImAbO300x0MLQmb67dxgN6hlq1teOftxV9TSAgG8md/gi34ym6tPvMFmFgFvl0LPi/qjKLxWpGai54Hj7IErYbKxu5Px95IpZwcDKucimVrqY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099002)(38070700021)(7053199007)(7142099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6h/T5suoQsy/42mQ16MrhZMNjjALiqohhIZt88UjAJl+tydwgYck5u67dUHL?=
 =?us-ascii?Q?pXYPCEWyUpY7Ry4oZWO1R5NLeeLTNSSR8qh7qCm7PT7Ww8r4GWcsvTt4sAmY?=
 =?us-ascii?Q?Ql6ARiD7EuM5oWd+k4eixMPDlmzDHbUAQvYSjjj/Mzdd8VmIYMSw2bStI2qC?=
 =?us-ascii?Q?bDrWUCNM9lgGB1+ydbny/LugNnny9Ie3RBLPekp7I+kO6UxvRGS6j24lNGXy?=
 =?us-ascii?Q?/QEV8NVyd9MFXXS5dcsgSuK7J8ge2QpjPmPugK5vpTrBmcmP1X7nXXVkbQic?=
 =?us-ascii?Q?Hghj/2c3uYP5L+sLPlq3DWeel/8yhEUADXlmyaroN4YKGTlmLc9vbnQGpwsI?=
 =?us-ascii?Q?JArt8kmAWuD9pqWq/FXSMBG3tPbfjJbDmeYoorF/tx2pFY4Z0Up27M1Q6ELa?=
 =?us-ascii?Q?L6kQp8CXonc8nFwNq9ilDA3JLYMNGesBBpHMftGUh/oPYFGo3XUWv/VKskcE?=
 =?us-ascii?Q?0eY+D/U8oh8AIBhE6MQ78rEpIwapxlLG72Vm/YV7T/d0A+ZO0FuZGIWFNmW2?=
 =?us-ascii?Q?hcvPYmGZUboCXrjZLLoe6E97Z7RK0qQ6VAkYKFqjqdILqGlpZc9rlHvsinKX?=
 =?us-ascii?Q?6rI7MDDoQ0d2q6xclHK+gxebsQn0Uqsy2/XEUZKcJzlUR5qmYN3WJz0vPiXq?=
 =?us-ascii?Q?IJu4NpilB8qGmVYYIMmgevXyMTnHx7LO8oHODXQO9voacnt1MQkQyvRC74Hb?=
 =?us-ascii?Q?Vo7JmO6Z+SsMPJqcfcoRFRYU9yMzBi/vpfVdvC4C+BDaTIwWXz2fqEgeAJ8I?=
 =?us-ascii?Q?jrvwwriV9I0LThJajXm4YNV3YMkjFQubp5JPJ65bL9c86IgMBWVWA0crqNLg?=
 =?us-ascii?Q?LI1OXwLlwSqNOMcjsIRFH/qN9+HdfJDo1dGEGKom5S8Vz2mrMcY99E2lbmVz?=
 =?us-ascii?Q?9TVHOZsA2nknOr7UN0NVNh/5Z9n26u7ZwY8uZQzpk9njAMXcDuawLzVk1VaP?=
 =?us-ascii?Q?Hb+i3ZcaS//zpay+Rw9AqgEmFPLI8LnzDysdjWqmH33DOQq2+fo4lb5YmBX2?=
 =?us-ascii?Q?70STfu8dD630wJpUZjXk+ninaG/VwwXwlWqKCnFnMDJAgpjAjhCVYdXpZem2?=
 =?us-ascii?Q?fTWfBWvrAyF6M37y2cd64lfRufG2gWBB3b29KCFHDpe1VbEFG/2yJV5VC+eB?=
 =?us-ascii?Q?i7+Qkj7STeqHOvidWSIQvYZmK6iMASwvOJ/cp531J7r6NLO6URau7TJeWDFr?=
 =?us-ascii?Q?vWczH/FvQ08A4U8Kar9qj7w5n+KGZk1Y2DFFtuHhwFLE3r52GEyxSSfQRK22?=
 =?us-ascii?Q?+lBf8YtoLBIFaYhFZ+Hnlat0Njv8YEK21IQqXGeh2KEdMPHJaCM4ldBbecA+?=
 =?us-ascii?Q?5TlwBx2yarPN4a4YAsSZ9hQktouLL9kAzUSvQoymcQrFdf3wbfu3WydZmqdW?=
 =?us-ascii?Q?1BWixeo5WqpcH6H5jCjp1VJOr9v2CTRRwvZ2hZmr8dWbiXss25P0FPYoEPD6?=
 =?us-ascii?Q?MVdRLa+ekz+Kr3sb5gANYBaDJg8rmlEIvv+3SOwIhZ+rh+4iVUAHbjHFBJov?=
 =?us-ascii?Q?ghbV1fU2+BBtbUR/vYfVs9XeChZMpGO7OQd7E12Fxml+glv8AGUMU1GbQCTJ?=
 =?us-ascii?Q?8SrtKg13qi1wtar7LJMWrNBBU0KK/t1iCtS0vdAV1g4o32rAfjn79kgpjbwf?=
 =?us-ascii?Q?AOVCC+rWTKdr8LPVL1I5Mn1z4MYpUhG5ULasdO6NBgFxkKPKDsK/mmc4Z0Oi?=
 =?us-ascii?Q?QJYV0D6yGdIQkhgXQ6Ysy9sX5SYbZexk55bVTx7h3HfQRxnYV1IAqNCMRany?=
 =?us-ascii?Q?4bvlMTwjqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lPvexx6JdlDDX2L0TGNVJx2RQCTFoK2ecQxlAZSBC9Ywh6R1QQnEsQbBiQ/fNfpb0f5a5QAmY/St8hvHSq32sdRTIQ+YNuQH1rvpEwA5T5VOBcpK2lM4Db/fMcSS4tafZHt2Y2WRBI3+abfZDKwhJfOoC6ByH0a7ynH9dpBMS5hMqRb3bxdpCQPbvHr1+OREaEuHML952U1F7AWIetNzQOLenZ/qOnNJ3IJnJqF31ZcyaPcq1DfSg5ZeWdqPDnCntL6/wMZrmnZ4MZoOXyB6NPe+WV5SotDczZNHL7jHl4Rx9sl41GVjZq7hQS6i24/gEQ1DhZZcAPWLE5AjKkpVHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2b738b-4137-4620-2226-08de7ea4bd19
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 12:58:34.5066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgtbOALOBYH/Vhp7XwB0rT99UhainOvAtLXEuCIdTvmU0pGv83Pkb+HTbyGRFhrZPvdDGwnX+jifTJKUgaxeUZfV0sSY7y0wGqjtPdw6zM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

LGTM,
Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Friday, February 20, 2026 4:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Rudnicki; Rudnicki, Piotr <piotr.rudnicki@intel.com>; Piatkowski; Pia=
tkowski,
> Dominik Karol <dominik.karol.piatkowski@intel.com>; Sokolowski, Jan
> <jan.sokolowski@intel.com>; Manszewski, Christoph
> <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t v4 3/5] xe/xe_eudebug: Add reattach function and ma=
ke
> plain connect private
>=20
> Convert xe_eudebug_connect (the raw connect ioctl wrapper) back into a
> library private function and introduce a dedicated
> xe_eudebug_debugger_reattach function that is documented accordingly.
>=20
> This ensures proper session management and awareness on the library level=
.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/xe/xe_eudebug.c             | 74 ++++++++++++++++++++-------------
>  lib/xe/xe_eudebug.h             |  2 +-
>  tests/intel/xe_eudebug_online.c |  6 +--
>  3 files changed, 48 insertions(+), 34 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c index
> 41eed7614..7a641d2bd 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -396,22 +396,6 @@ static void client_signal(struct xe_eudebug_client *=
c,
>  	token_signal(c->p_out, token, value);
>  }
>=20
> -static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint6=
4_t
> events) -{
> -	struct drm_xe_eudebug_connect param =3D {
> -		.pid =3D pid,
> -		.flags =3D flags,
> -	};
> -	int debugfd;
> -
> -	debugfd =3D igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
> -
> -	if (debugfd < 0)
> -		return -errno;
> -
> -	return debugfd;
> -}
> -
>  static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd=
)  {
>  	igt_assert_eq(write(fd, &l->head, sizeof(l->head)), @@ -905,14 +889,20
> @@ static void event_log_sort(struct xe_eudebug_event_log *l)
>   *
>   * Returns: 0 if the debugger was successfully attached, -errno otherwis=
e.
>   */
> -int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
> +static int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
>  {
> -	int ret;
> -	uint64_t events =3D 0; /* events filtering not supported yet! */
> +	struct drm_xe_eudebug_connect param =3D {
> +		.pid =3D pid,
> +		.flags =3D flags,
> +	};
> +	int debugfd;
>=20
> -	ret =3D __xe_eudebug_connect(fd, pid, flags, events);
> +	debugfd =3D igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
>=20
> -	return ret;
> +	if (debugfd < 0)
> +		return -errno;
> +
> +	return debugfd;
>  }
>=20
>  /**
> @@ -1266,6 +1256,39 @@ void xe_eudebug_debugger_destroy(struct
> xe_eudebug_debugger *d)
>  	free(d);
>  }
>=20
> +static int __xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
> +pid_t pid) {
> +	int ret;
> +
> +	igt_assert_eq(d->fd, -1);
> +	igt_assert_eq(d->target_pid, 0);
> +
> +	ret =3D xe_eudebug_connect(d->master_fd, pid, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	d->fd =3D ret;
> +	d->target_pid =3D pid;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_eudebug_debugger_reattach:
> + * @d: pointer to the debugger
> + * @pid: pid of the process to attach to
> + *
> + * Re-establishes debugger connection to a process. To be used only for
> + * reconnection scenarios where the debugger was previously attached
> +using
> + * xe_eudebug_debugger_attach() and detached with
> xe_eudebug_debugger_detach().
> + *
> + * Returns: 0 if the debugger was successfully reattached, -errno otherw=
ise.
> + */
> +int xe_eudebug_debugger_reattach(struct xe_eudebug_debugger *d, pid_t
> +pid) {
> +	return  __xe_eudebug_debugger_attach(d, pid); }
> +
>  /**
>   * xe_eudebug_debugger_attach:
>   * @d: pointer to the debugger
> @@ -1280,20 +1303,13 @@ int xe_eudebug_debugger_attach(struct
> xe_eudebug_debugger *d,  {
>  	int ret;
>=20
> -	igt_assert_eq(d->fd, -1);
> -	igt_assert_neq(c->pid, 0);
> -	ret =3D xe_eudebug_connect(d->master_fd, c->pid, 0);
> -
> +	ret =3D __xe_eudebug_debugger_attach(d, c->pid);
>  	if (ret < 0)
>  		return ret;
>=20
> -	d->fd =3D ret;
> -	d->target_pid =3D c->pid;
>  	d->p_client[0] =3D c->p_in[0];
>  	d->p_client[1] =3D c->p_in[1];
>=20
> -	igt_debug("debugger connected to %" PRIu64 "\n", d->target_pid);
> -
>  	return 0;
>  }
>=20
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h index
> f1a2da4d8..23f0d7e34 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -175,7 +175,6 @@ next_event(struct drm_xe_eudebug_event *e, struct
> xe_eudebug_event_log *l)
>  #define XE_EUDEBUG_FILTER_ALL
> 	GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
>  #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e))
> & (_f))
>=20
> -int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);  const char
> *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_=
t
> len);  struct drm_xe_eudebug_event *
> xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t
> seqno); @@ -193,6 +192,7 @@ struct xe_eudebug_debugger *
> xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);  void
> xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);  int
> xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct
> xe_eudebug_client *c);
> +int xe_eudebug_debugger_reattach(struct xe_eudebug_debugger *d, pid_t
> +pid);
>  void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
> void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d);
> void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d); diff --gi=
t
> a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c index
> 059f918a6..f5f7594e1 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -2225,10 +2225,8 @@ static void
> eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
>  	 */
>  	reset_debugger_log(d);
>=20
> -	ret =3D xe_eudebug_connect(d->master_fd, c_pid, 0);
> -	igt_assert(ret >=3D 0);
> -	d->fd =3D ret;
> -	d->target_pid =3D c_pid;
> +	ret =3D xe_eudebug_debugger_reattach(d, c_pid);
> +	igt_assert_eq(ret, 0);
>=20
>  	/* Discovery worker will replay events that have occurred, which leads
> to
>  	 * a vm event being sent and vm_open_trigger being re-run, which
> would lead
> --
> 2.47.1

