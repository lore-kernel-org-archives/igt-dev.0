Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C135CD5BA4
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 12:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06A10EC8A;
	Tue, 19 May 2026 12:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjpPyuj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA1A10EC87
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779192427; x=1810728427;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=a4m+HkZmEFq7i3o9/Uae3GQaNQvf45Q8Y53YnqfyJrA=;
 b=AjpPyuj9qavNm9OwBjmxnCE8137P/SBZnJ5nMgz/BH1ko7kSa6wZZbCE
 Wy/+88bqk9VSOTrYpxkLyEDYpUjKOrLNyEbBkKlZFbuToCaDQmObIrnFE
 dwVlhQE+3hQ3LI0UtWw/nsBzb1Jkuv+uoG0k/Pt69kzsqnE42EvSespN5
 +FXx8oOZ2C6eLdne2l56vjJ/DOnvzRrnwpUOa923S1kw/odMQTn0ISBV2
 pJCtqqKxRnqIpOVhOU8homTHh88jJH+dSe1Ry4pnl/LGC/iSml2Gcj043
 f0pDUDRfODFwoRNI/2Eb2V5x8c6gpErHQDOxHRXdZIhcOgMi0IUZbH+dL w==;
X-CSE-ConnectionGUID: 2701tUqwT+qQasZ8E2iKXA==
X-CSE-MsgGUID: jnZjjAWaSGCEGlPOHsIg6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91461016"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91461016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:07:07 -0700
X-CSE-ConnectionGUID: mI9L+bAjTZSacXjLUDfPqw==
X-CSE-MsgGUID: Ux0lPImbRcO9jnsCARUIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263255827"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:07:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 05:07:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 05:07:06 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 05:07:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrbfkPok0/LqjeoEEsMe9DCBxyvz0Ovsu6jMAkG9xtDkjHDFwQY4GhfBEsTRJ5eDlmvnYymc74Q/DuCFeeeRqXzaLn25/Jg6mh5ofuI1YlVbUWV45zO/DXKONL2m7KZVvtXR51YE6sO/4D4IwE84FQn1piuSx1/8MjFjfjTLV5yRhPzSsbEfH1YQ5j+NGGrH7GTN9LlGur8WF0ezfe/jas5xtDhgQzbZ81BZrVe1qQ4xK06BPU5yIIVtjeK83QWPEssPgzu2JmDaHAsdek+YIeh8ONVFcPHbBeDetUgevNO9BLjX0dw59HNNgSAQ36FQNySTg0QB+JE31T/H1k0tpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHBepHElEAHzC8L1TxkgB1GjsVXvJ7UGX8FIOmLExo4=;
 b=R+ev3C0g0JKyZCkWqnH1v8dy46/fb3Qys8L5oEX3JJHE/oQG23qvEIj3FhQ3YlSMEf04vXfoPWeLhG1EP3bXLf9qjCU12R1d1OO6NV336WldadsbLmlA0ZyTuE9hurmtu9jEDcXHFZqx3ewtpTW8b3jc6V72t4IrTIoE47Tn/mT0UGYXkTauh3RgczJNR16+54+4+SyThMG7NYJssspNSVMLtQgDD3iK5EwUYOB2ZVFO7TcGs+aKjWo1PJ8bbRGdTgT8GHYtYndANjhJ0Pe6dI0zTWtQfOGueW38RYK5/+673R9RaYe8R/a7ptluPZrJELm92wVzc5e7/QSxTin2Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH3PPFB9A266170.namprd11.prod.outlook.com (2603:10b6:518:1::d45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 12:07:02 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 12:07:02 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
Thread-Topic: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
Thread-Index: AQHc3MenUJyEyFa87UqjAV6RBlB4ubYVUhUA
Date: Tue, 19 May 2026 12:07:02 +0000
Message-ID: <PH7PR11MB60537336D612475147EEC667E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260505194419.500600-5-dev@lankhorst.se>
In-Reply-To: <20260505194419.500600-5-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH3PPFB9A266170:EE_
x-ms-office365-filtering-correlation-id: 6d7bf919-1715-4691-83c8-08deb59f232e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|11063799006;
x-microsoft-antispam-message-info: jfMOlgiVpmePaH1KjYRAYN9Oxf7n7idyKljolhLzbZUbLGEqB3/DTloJSQImJ01O9Y8xdxW3Vf3w7S91C4DoFv3qGaUorI8UBY+sKlKdiMg/nXOYxePxfcav4pfx7aMYDZZIXSts2WLv59tzp0KCHLB6jrjcVX2fYZsOFyb7ueUg3RIYzdOHH7Lbq1YJ2Burk9yfESG/2eTCMqxcm+cvHU3J4sU7CJLbWBWZD7nHp3P2P8YBlsb+95GEWrg7g51WSn3bL6zA1L+goth5rU7KrL/J+gPYbmSnSo31lI/An32HqrYE8bBftkz8UP8cTygAK2nhYWNRpP6BxR8Oq9MhpUv3hgYiP7BjxBgnUX/JmhIuLl9qzBmMrj3oowkvoC5dLU4AhORt1V+8eg/mUIXFnjA2EwWkA6Z7kXQGyIWiw/7uwZKLGVwA/LIR46b2onyFhTC7doSx8kkCysftgDjY9yzl8KXOa/xSUbMKTbpW0dvYgxCwa0uv81YMOfIJ8Dm42JBZf9QN5jxKMpKQGlbCAepXUV0exZmHTkcFEbG5UHLHtVmv5CL91pQwjp4BSf4BLq5Vg9iFtrwbE5cGJyzcu9zF5J0AnBiICjIbNZUIuUOgJyJ9cqW2OyOsB70V7PzHqxbRzKL0ZtYmFHWI19n0h6QMKi4XNdnfKdDWdnpmA38U8yTmPYjDmrO5O06BtAFzxs5ze9jkJjL46WBlUwxkBijNJEHh5ZJ6tlrDvmw9Kzo3Low05vvHHp56PfuHRdqb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KXrPYdpGrNv1uixMZk+S2XIvDi3OrW2DznAbGo+JwRKMz1aOrR8AVm+aFEcj?=
 =?us-ascii?Q?DnJJSIQ3w/q9dwKXecM+L2jzTFe2ni9JIm35dkgKlu+9SLayZvbffEKY5ihh?=
 =?us-ascii?Q?Bye5/ljfUh+5ymq+1kX6RC+qD46P5zKIWy/AgGHDNsZZVQiuicJdq90TV6gC?=
 =?us-ascii?Q?NfnwDBfTETgUIct7Vp/Zk5jN2UZN82J6rtpDsL+vBZzXvJiwDIQ+wn9ngfau?=
 =?us-ascii?Q?yRY50/uXQbBopUuusAH7wK4Lj0E6i8mvn2bx4L8DVgxz3kfXe9jvtIrPzS5g?=
 =?us-ascii?Q?JHdtZMYFAblhCvQBiLtSF56ewHQDB8+fMShtWCMVBUDt89af6Ccj33DGFWVf?=
 =?us-ascii?Q?r2piOV5FIvnZw60OB/QxvVXCZx/E4fvXzea8XWLqXALNPops0333v5dZde7B?=
 =?us-ascii?Q?smuqVEJeg/B1m0aysx650diJyrLkRMI3MztPvXnkVCXA/faoZ4lXxlnQj/5R?=
 =?us-ascii?Q?UFkyxyuowyJq9MJIYNWKvEEHmH334chMkui+rhkkzndz/kEeuKej+OYIK2uG?=
 =?us-ascii?Q?mB8k93UUuK8NrNzoGFdEASL7YX5GKvvcLp2AEwlB/YV+NW0ga76pVbU/k3sG?=
 =?us-ascii?Q?vddaD+k2cg7SI0ZqPvPz/xfLBav7cU8g/Sj+nxXudwtz0Ke8ojNv85V9XFCp?=
 =?us-ascii?Q?/Cpre89PC6Lj4LVlrLsWkggoBnrijfbviYRArNvATx6KzyRsmrpK7cy5ruKx?=
 =?us-ascii?Q?cq1F/YQZVmXSP+nf520u4Z193Qg+ivyLrqxBLA3BGiydDH0Ovky6Zsod7NKS?=
 =?us-ascii?Q?2zEktWnam58PaQ9YcA8BcM6TTcUfnWSXJ+Gt4MOn97IwUnEH6TBbvB9N6myj?=
 =?us-ascii?Q?Fr/bqaAxwy3z2uKcm2RurN/8p+vOkaZ127ONnTsTgBY4qUy40/sBYnWpmyZT?=
 =?us-ascii?Q?TsFnj3rPL4HdVgM+Wd93XKfZ6rJioASwv3wqBiTEC1TmPcQprYBr6cBp+5Ag?=
 =?us-ascii?Q?kWQGCY9O9e+yieaFn0diQftEB0bamgSDOLQ2VFgcCYmFdn6OVwberr0EGOTo?=
 =?us-ascii?Q?ekAyOHIp1NZihaiyE3vWPGS+hkwrUwYIJIyA07gHqRBSIUcqJOd/ncJWwgr3?=
 =?us-ascii?Q?fcE2fC4UTttckAfyP4dM2a3gNbt0nQo2o14O/U7mz0Np9Qu4dUaze6GdGwYD?=
 =?us-ascii?Q?j9JlZsXkUuP0wU71yy+rP8GHGq7PokuX8GsnZvTxK15ze2qyRqy46ZTzWEI4?=
 =?us-ascii?Q?h+y3tjSPPkle0Y9JTcf6fAmnk8PTQJLZ76dVpYRkLHwzijVFoJg1YWTUJBB3?=
 =?us-ascii?Q?Gfv/8a3GyDK0V7vWi4vIvhkf/SE/TExdmCrtR0z0ZkFyHX7Ofqd8Tst6lLGe?=
 =?us-ascii?Q?9UkGqZV4p3tbpdLwhEfo8TpDMOmjspwcTMYebhL7pXFVyBKtqOx7o0KJkwkO?=
 =?us-ascii?Q?yctbZEqD3StRP52MY/deQhSuwBdTXIttQWdiZ0n7AfQOHbJnDlrWC812STKK?=
 =?us-ascii?Q?IQFtSUdvPQemBg9dz43dIU7TQKRrhe2KZm0pcdtzcu8Y+b0VC90x9rbPBLVE?=
 =?us-ascii?Q?Lf44waCdO1EzmrUVbf3M3M1tYjAAelq/wmhXPCIIyYEwP4gmdnXl6+N/j7qL?=
 =?us-ascii?Q?rj+cyhUF0aYFuppu1T1cwK+gIPkLhojYdGMCQB/IPF42uoNWnh2Kw0Q/BAR6?=
 =?us-ascii?Q?FOumlO03Pp6kseWRYVs3Ra32YUFJeKLIejp8yRnR0Mkqcb2bRDGDIbvAg601?=
 =?us-ascii?Q?DyI5HOngX9HMhtVbztlCdnkAto9LvEagMsxSHfQIm9bar256nwllLEgczQ5h?=
 =?us-ascii?Q?YmUvf1gqag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eLCXK/wLjLLgzXAT1R/YfwMLSzxeCYj7NSOK2HsOHfcpdLu60bGKANQGDvu+Uuab/u12CcYJJUPPLkQhvJ95GrpIEB32fJyeXOvAznFYqVOB4HrL2g7YJ/fyUIpfSPZsNkvTGujHq1t0nHn6eX4BQvmNExO64/tiNuiZfI6pInYYePDCe8PhnCV2urFN0EytRFM5ngYaa/gj8y7Fsb4NxvMUxSmnbkwvhXReohiA3BkGkjnrgcDco7Zs+kJDZzaDQkAH25VL8LIbeplIeQ3/n/QwFPxYcc/IUna0gS8YlElx+4AMiRgJq4V04GKhsAVtcndXjaCyxa+nJjuplvyLJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7bf919-1715-4691-83c8-08deb59f232e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 12:07:02.7621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZ94QzV34SB2PQvf7L0ltnJmmfIHBdOSsmSoHP5Te5TuA670iieVIX8/xR46yzDZiUOiIDi2j30bGjpAWAvA4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB9A266170
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

Hi Maarten,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Maarten Lankhorst
> Sent: Wednesday, May 6, 2026 1:14 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Subject: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
> BACKGROUND_COLOR property.
>=20
> The background color is a 64-bits property that contains the ARGB values =
of
> the background with 16 bits for each component.
>=20
> Add support for the BACKGROUND_COLOR property, and set to pitch black as
> the default.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  lib/igt_kms.c | 4 ++++
>  lib/igt_kms.h | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99fc9fa05c..b70aefe697 1=
00644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -731,6 +731,7 @@ const char * const
> igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D {
>  	[IGT_CRTC_VRR_ENABLED] =3D "VRR_ENABLED",
>  	[IGT_CRTC_SCALING_FILTER] =3D "SCALING_FILTER",
>  	[IGT_CRTC_SHARPNESS_STRENGTH] =3D "SHARPNESS_STRENGTH",
> +	[IGT_CRTC_BACKGROUND_COLOR] =3D "BACKGROUND_COLOR",
>  };
>=20
>  const char * const
> igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] =3D { @@ -2737,6
> +2738,9 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
>  	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
>  		igt_crtc_set_prop_value(crtc,
> IGT_CRTC_SHARPNESS_STRENGTH, 0);
>=20
> +	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
> +		igt_crtc_set_prop_value(crtc,
> IGT_CRTC_BACKGROUND_COLOR,
> +0xffff000000000000ULL);

Imho, add a short inline comment to clarify the channel packing.
/* BACKGROUND_COLOR is ARGB16161616; set opaque black (A=3D0xffff, RGB=3D0)=
 */

> +
>  	crtc->out_fence_fd =3D -1;
>  }
>=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index a58cb5cd34..71f908d4f5
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
>         IGT_CRTC_VRR_ENABLED,
>         IGT_CRTC_SCALING_FILTER,
>         IGT_CRTC_SHARPNESS_STRENGTH,
> +       IGT_CRTC_BACKGROUND_COLOR,

Please use tab for indentation.
Along with Kamil's suggestion, changes LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>         IGT_NUM_CRTC_PROPS
>  };
>=20
> --
> 2.53.0

