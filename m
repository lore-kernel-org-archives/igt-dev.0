Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44F7109C02F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 15:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6401110E7C6;
	Wed, 25 Mar 2026 15:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvEw8aPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03BF10E7C2
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453147; x=1805989147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ok2xqep86QN45Tp4oEXnm/sTat1xbTlQL0Ih/Tzq4ic=;
 b=AvEw8aPZ3Po+PEk4Uq6g++vvi+nNJVv9rfb6Z6xVwfREM8p4Be0EwfRa
 IjAhzGhWdXqNDFBsPM7wMViEznjt7rZo6MdX4MlADnESBGnAqbSkvDqnx
 g4Hd7kFMUToaPt9fOFBhpiz9hIxdP/2rpDWYzJysXv1PvXdaDmS1LgAAl
 XQmgmA+YvX6ApYd3m3wAFQNqQ7VI7ZdEz3wY7olKy7c8af7e0xH9mMeJ2
 HWj0FphymuzGrWm96fbvgCYaUZ2stkbBjGSeJsTiJPmWeFeP0zp6H4aAN
 IDkCt6HlWU6F4je9pu6G7ELE0GUFUGeHnyibLYFPoDjscCkpbgKKbD7wu Q==;
X-CSE-ConnectionGUID: MlfWJTv0Su2qGYChrFe3pg==
X-CSE-MsgGUID: VWmlV/zfRmGCYe6li6Q+WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85804017"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="85804017"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:39:04 -0700
X-CSE-ConnectionGUID: /EaQc7bqSvCrc81WCKE8dA==
X-CSE-MsgGUID: bLOaeKIdTS6L/x2xy2JZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="220308570"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:39:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 08:39:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 08:39:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 08:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJIXhtdI5BGWww4TZtl46iruVvavETgDRfErZuLL+H5xxo+1g2JSlSyvtgGC/5aDGBk9r47To0+7V3v5f17hlmU5bDBPf+6zEb9YXQoRpbFzeyyeBzH9nkp6sY+9NCZjAtwZADCVrF/VCjIcw8EflxA3YIsW3Sv9q5yo8JoQlbL58KBz4eSYcC+ntyjaDXSJmwERTK9EwCRvCo0h0bmtt7oYY0QDYqa7hAVPHZB0uMcJUxwKhIuW0FaAnaOGKXk6yh8Yc/PIbGwXPv7VZzRzvURP748KbxzDX78DKMgoEDNZA3GrGfLAx6bO+19XF2UHYarqmlv0o9YY79dHdYKG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93Cj7YygLJBosiC4SJCCbcgycZx6IwzF5zxE+r9SeGM=;
 b=KXdgBBZv298P+OkUoMAArWOccWOJ+N9k3o3+9Bk7XtLQvjgPJEvwKAKQvzP6C5k+00DFodmmbnck7DBwI95VhMP3tm2fxDbfgl1RjRvoq4lnCg/sgLO5lZEzgfEsVztr1L2T0nnySNU28fxWPZRsiBYqA21onT0GRkWT3hngO37sQLUF0ezTpIuQuJKai651LT4xW8qqaDk/S8z30GBAmA/2TOw1c56rKT/96Ug3/Fz3Jj8dtkbZlyLRdq5otcG3RVXDOGLVT3t8Y7puijkUjluk6CfMLlvAjbAoKmEfZhcGU2pbM7rfw3+MocHXhk4PP+PJpuem1jSHrGhZKIFojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:38:56 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:38:56 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/intel/kms_psr_stress_test: Select
 PSR-capable output
Thread-Topic: [PATCH i-g-t 3/4] tests/intel/kms_psr_stress_test: Select
 PSR-capable output
Thread-Index: AQHcuqVxIGseLEdfQUuqPPWHQaYV9bW/YkIQ
Date: Wed, 25 Mar 2026 15:38:56 +0000
Message-ID: <PH7PR11MB60539579CA44BD47FFD36722E749A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
 <20260323091205.100585-4-jeevan.b@intel.com>
In-Reply-To: <20260323091205.100585-4-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB7349:EE_
x-ms-office365-filtering-correlation-id: 099a5393-7419-4585-2b03-08de8a84a068
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003|7053199007;
x-microsoft-antispam-message-info: OB4q82rvUuZXasPo/StR5iD+9jUHgmEEoCKU/41ErHa1YB9Ht3DnxOlovwRhL0ngA7nNPhvIJS9e3PaNyRr6bhHXpOzQ4pwiObQDFHU5WNZpcENhDq8Pt5dihynTGrLdzATFwE6xaP4MpwlyGWaMS/Ns2EwCRqQGqr7Z8b/ip9WWs+qKqcLMCuANVsNTg7RCkdl2OkvuQJFDX+siQBRgrMPbOMFEGGr0xDeCEzMQBzNVxGQcyZMi8F+2PjFlBh3TutqqvKIdb0JQi2R9hJriRtt7T3vqNIC0pGWCD+pL/XrBiP50JJBBVrmWOWeAArd6wglGM6SAHmVeQiIDKjfZJNW10jEk2m/cKjht2VF296M/gH2C2pFrDPCcmiuiYIDewkWvWU8JFliAEwXChsWKUPJl2tRxN/1GiFx5vw0cc4OgfFd3ZyHrmT4wsqb//uuSp0uXqP9Lj5D2u8LVqf7qphdkK0WuwG2CbRw9Ng3uSa8kumMgF6ydejxJFUIqMbZ1c5t6VYgQhN/MxnnlE69B1K/W0VoeGPUPUzcjYpTHtS08yWz6K4v1EsW9AykqGUEsmxN0EbYPz+2z5x7KW/cN1j8qJ7Q8u7i1nAax7ctRamKm+dtDmgx8V+y8JmGeHC5/T02tuidKrbHFyIhNzerG0TgRnxn1AMPcFHNwm5I1qlfnC1/x07n9/ibARQjPNVfesHKIlvaa4dcWpi9LuaBkmZL//eTa1FozSgua9YlVqeezbougxmk+MRxzkhiFFJ9828KdQFPuPmruLZq2DR7J9ZkikZXvWOu4E1js89oyclc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hjq05+Lq4SHnLWR2iWb+U4Hi+szlMCh34oaqXQbS8MI4lwSHo5g1WFiV3r/o?=
 =?us-ascii?Q?cTNyiNZZIQy5vxRcvv89Np16WHAH+Yx3XS3giXa9upQlA9bpYSyYtbrpFcj6?=
 =?us-ascii?Q?04IPULIOthZegD4yYtnkBNaTi/qkEwGMSkk9OypQjZttroeALq3IGYoWaA/V?=
 =?us-ascii?Q?9d/aoze/5towPGhLcAnNgu1lZlTHlgXhTTX/fI7xj1IbAtGyRBpn6apASj2B?=
 =?us-ascii?Q?UyrzCCZjhSSqqltsQA4QgmKLRhTMSwIp57hwxHFmVAnCXx+ak4f7w5BhkRZb?=
 =?us-ascii?Q?F7aRYRwtn4Uqh7fTMTISSFHgnka1Siu06IZxqsYQxW5mIpquIir2Prc0a8CO?=
 =?us-ascii?Q?amE0fwgxmJ+fkzOzlQY3UkmalBh6743UChsj4+7aOTu1BQyH0fJKZorlRxmO?=
 =?us-ascii?Q?V/gxj1Ep16kY20Q041ekPYBQGWTBZFdKXY7msv/iiPAzIzwzumh/ANh1z2mP?=
 =?us-ascii?Q?+SJWO19FpSqsFl61MY2QqCpkYsUVSUcBrQs9QdwSv7pFoKT4izrGGUYQP2L2?=
 =?us-ascii?Q?S7f9aZlcOBaCIguTqCgYk6wLgHFEqVPPE0nY9ZS+zXAslOELCpwZfT8vnzOO?=
 =?us-ascii?Q?RGn25wH7ma5PPicdUD7eSvRYrgHOG9DDO+IDgtFQXk3Z9puF6C2lFRlAiBuy?=
 =?us-ascii?Q?VKzjSlkJt2ZIyQHAPxxRAzlmQZvePcfWfzERMu3wwFEsJHaA7YbuuJR2NJ6n?=
 =?us-ascii?Q?WcR+hn/f9VMnTddKRSlNDl+06f+J4qop7r20MBWUOvhKUDigATNnpIBGvFD8?=
 =?us-ascii?Q?Z5iF64kNhXtjP72hqgK69jDzepoLTuJSHe+4cvk7zf0s/+4RQ8F3xAifyHQS?=
 =?us-ascii?Q?P4zMQ6eKjRONZ45cOUeNynZloy8o9/cIqWvIjFCabUCVaE0aGb4bbimGf9Vq?=
 =?us-ascii?Q?7MPDwaPjHUpSZhm7eOnijs6ufrrQLb4uupldYVw/adcPLsZW9xmgEKEQkUJb?=
 =?us-ascii?Q?0t38LKpD0CyBa4BsIYPDdDjhi73w4c6TPOUVZFkwjSYQfHXd2IIhFu/BEaIW?=
 =?us-ascii?Q?6jQFup9voyw/HnReVmJRi2NDXxRAZdpgxDkRl1b6ZwbqSIUHYSTUpfMJje1v?=
 =?us-ascii?Q?26EGCNlfoLGcFTGEaY1yNt4ox7k3rIWF/K5M+zodNOUmHVocnlp5djtz7DpE?=
 =?us-ascii?Q?LkilK4u23U9c3dGFL+Bw45vkzEBXDBP18ZcnflHkV3kO2U6p8iLhuFhXmWb5?=
 =?us-ascii?Q?8xorHuubfgNaFPA6DRU3EDYqnzXErDnFRX+oUO75Rkt+G+kpMvJ/KMymkto4?=
 =?us-ascii?Q?GvJucbMR6gMoY8NE/yjP30gIYx78j38TowxmtVj0Bb7jAnZ/wYQfq8mBzMfx?=
 =?us-ascii?Q?kh+ISqWQWOe4dJ0My4BiQSMcvPUAXNd+MsgEHVDHZ47JyFZvElWRor+hY6AV?=
 =?us-ascii?Q?X9u2sOMIJRdUOp0OQZuslVqovFNG8gN8gJ9Xh2gkLO06/YqOdlNf3fgbbAPE?=
 =?us-ascii?Q?0AQjvJ9hkBfS1ovGT4x8iPw1fBrJSPUeKm3DPLPLmv6crYJtqbf6VfHq5Jpt?=
 =?us-ascii?Q?Azz8O3QFrtoG6bHY+rPEUHqNNmRukqfkwopyJN4Nb3BrBGceNC5riEKnP3fl?=
 =?us-ascii?Q?6u0g5wrC1eus1e3lYvrjywuIiCCqmlUfM262LETLFNbs5AdW0zUWlwtaJOyF?=
 =?us-ascii?Q?EnEHLlDI9Rb0AtAG9IJjAdet8jcdijGQaItpppAPhnoFUBQOmMl864v5q+ND?=
 =?us-ascii?Q?uqc496Bhgg9A7otPRcVPCHjHj5CXTnwSEwaCIQoKW5b1YB+tP8pV+q0s3l4r?=
 =?us-ascii?Q?56Ors91f6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: i5P0B/hFfkOEtrL7L4b+BB2rCC+XSsNJppwBlCN277SIThRJvJJbsJP0Gayh/uxp9ZiQt1ZwuJi4P/Nubwx10DZ8xxeP7GkOkpfhNjoIFnYSOzLH2b/4ljG/3+eBOT+mb24CBgaDp+yQe9SQAP2tYFZugy6Ui42Kiej6whmmX+xpKOEj/ph2vG9B4+UcSolazFWDTlggCbZlrWfr6CsZjt4FnDbpogQGebYrnh2ak9/hYwXi7EOAu3LPyO7Lj2jTR/kA4p6GCYv+Ibb2fR0tphyGKnhziiXieCmyK25N0tIVwzACBhatHllVRg1Tr0zH2moVnCjVVxHhbnRW2wi9eA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099a5393-7419-4585-2b03-08de8a84a068
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 15:38:56.4634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiQyqXg2veXMsjX/7KwpimWyz+xZ7D22zNYSJTBha45A3h3KWUpMXPf1PynGnRZKehM8C/lyXon2kyRvaGssoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
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

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan
> B
> Sent: Monday, March 23, 2026 2:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Hogander, Jouni <jouni.hogander@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t 3/4] tests/intel/kms_psr_stress_test: Select PSR-ca=
pable
> output
>=20
> Iterate over all eDP outputs and select one that supports PSR instead of
> picking the first available eDP. Skip the test only if no PSR-capable out=
put is
> found.
>=20
> Previously, the test relied on a global PSR capability check and could se=
lect an
> eDP panel without PSR support on systems with multiple eDPs. This could
> lead to incorrect behavior. this ensures the test runs only on a valid PS=
R sink

*This

> and avoids unnecessary failures on multi-eDP systems.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_psr_stress_test.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_psr_stress_test.c
> b/tests/intel/kms_psr_stress_test.c
> index 09e73bd49..7ef076e1c 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -84,6 +84,7 @@ static void setup_output(data_t *data)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> +	bool found =3D false;

I think this variable is not needed, data->output is already NULL from init=
 and=20
get sets only on psr support success. Just check the data->output at the di=
rectly.

>=20
>  	igt_display_require(&data->display, data->drm_fd);
>=20
> @@ -93,6 +94,10 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20
> +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				      PSR_MODE_1, output))
> +			continue;
> +
>  		igt_display_reset(display);
>  		igt_output_set_crtc(output,
>  				    crtc);
> @@ -103,11 +108,12 @@ static void setup_output(data_t *data)
>=20
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output);
> +		found =3D true;
>=20
>  		return;
>  	}
>=20
> -	igt_require(data->output);
> +	igt_require_f(found, "No eDP output with PSR support found\n");

With found removed, update it with data->output.

Regards,
Pranay.

>  }
>=20
>  static void primary_draw(data_t *data, struct igt_fb *fb, uint8_t i) @@ =
-
> 232,7 +238,7 @@ static void prepare(data_t *data)
>  	r =3D timerfd_settime(data->completed_timerfd, 0, &interval, NULL);
>  	igt_require_f(r !=3D -1, "Error setting completed_timerfd\n");
>=20
> -	data->initial_state =3D psr_get_mode(data->debugfs_fd, NULL);
> +	data->initial_state =3D psr_get_mode(data->debugfs_fd, data->output);
>  	igt_require(data->initial_state !=3D PSR_DISABLED);
>  	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state,
> data->output));  } @@ -345,7 +351,7 @@ static void run(data_t *data)
>  	}
>=20
>  	/* Check if after all this stress the PSR is still in the same state */
> -	igt_assert(psr_get_mode(data->debugfs_fd, NULL) =3D=3D data-
> >initial_state);
> +	igt_assert(psr_get_mode(data->debugfs_fd, data->output) =3D=3D
> +data->initial_state);
>  	psr_sink_error_check(data->debugfs_fd, data->initial_state, data-
> >output);  }
>=20
> @@ -359,10 +365,6 @@ int igt_main()
>  		data.bops =3D buf_ops_create(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>=20
> -		igt_require_f(psr_sink_support(data.drm_fd,
> data.debugfs_fd,
> -					       PSR_MODE_1, NULL),
> -			      "Sink does not support PSR\n");
> -
>  		setup_output(&data);
>=20
>  		data.invalidate_timerfd =3D
> timerfd_create(CLOCK_MONOTONIC, 0);
> --
> 2.43.0

