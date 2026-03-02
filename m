Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD11D58E47
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 02:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91EB10E348;
	Mon,  2 Mar 2026 02:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAs94hTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25F510E348
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 02:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772420105; x=1803956105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/yiyGt0CQdLy3Wf7r7SQsDOtcckvz5n2MYIo9EuPnMI=;
 b=aAs94hTANScT+mUiGVtjT9Iioozg4ypUnoX4PlTncKjfDo2dgNahemBv
 2LP+4c3fA+/1/0NjJBPG/aNw0B6SKJAou+QH/l4YDSLow7I0Za+1AaH98
 cihvQFoigEDOuDNEp+aceBdmNW4Zo99RZWeAV63t9S7I7dOh5ybKBFghF
 tFNH5frl/zI+Bb1sOwJM+GxvCDVVEln4A4xW0fkZTqcfYJIN0b79EMhNi
 9Gmllku0IxfJv7XFkwklLfXwU3KRcuLCShzBCcqJplbBYbQFluv/AFmoX
 UXmZAUDzJA9sFtlLdLoG5M1FoWil+ksdlrtfeY12Sh7QZL3gr7zttvg+Y Q==;
X-CSE-ConnectionGUID: D7uwA4iYRYaEimMXtvkt+w==
X-CSE-MsgGUID: VVwmOpuyT/2RPchWb965Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83756823"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83756823"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 18:55:04 -0800
X-CSE-ConnectionGUID: umF4SNoPRIGPt23hjgIp/Q==
X-CSE-MsgGUID: BuBC7N5aSomWIgq65MZfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217525928"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 18:55:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 18:55:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 18:55:03 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 18:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8qTDZrF7EoRnaiD0TdNPZbNInPEXmEnTlEi9Sk4ziwQdvXQCqCz7DCU6akLuApJEO+EE+IiJi891W8JL9oC64e9TxncZ0PqQFWHD3oAu0tFwM27aO0I28vOpMI4k46um0Uef87nPyiGr5ombL0A6/Qls3mun7ugFcE349dG9gPxcfa3YzHBls3kbsXL9Zqn1l0+b7/CRYAq1WVjvhOfGGF4mV6G6sNrUGukdLKJPwUG4ZFrsL9ItmV3X8ohXC9NNWe36Md1YZzC6jm1JYQYOL8tnzsz0cyZFv1SmwpBWu5PmoSfEbv3vFHynV0XLoADqU7ksctNLrjPgQdxjhFM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nM2OCYSO2JEzxXPlNvMW92c2IEKbSiBfwGhxYkbVcF8=;
 b=lAWO8zdP9f/XHJw8yeN9oK4BbB/qZ1ZLGQF823ln/pVXbioay04m3e+0BE5u+vNi+8Grf3Xih/uy3q40i5IfXUsgp4QZ90yV51J5hROuM8fH7GrM2DIFO22XpKTkEfnHPB1EqxJ/NuBlEUg73+tNcTZ8f+a/6faUEVXTiK+s/bAxA84ehLgA1nRf0no0Zkneum7l2EfRZ7k1jeG4PaBCIvx4EWr+nWb4oKDHbjSyz5dPgHYid0u9kKPdiWcmRH8iS/jVdSUtcv2X1sdDWrpEP44NBqvDefsCo1UN1xU3DWlRomHCMU6pLwttTbyvXEw7aFG1q64LnZT8mATs081k1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA0PR11MB4672.namprd11.prod.outlook.com
 (2603:10b6:806:96::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Mon, 2 Mar
 2026 02:54:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::21ae:7048:11eb:3faa%8]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 02:54:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_content_protection: check sink
 capability after modeset
Thread-Topic: [PATCH i-g-t v1] tests/kms_content_protection: check sink
 capability after modeset
Thread-Index: AQHcp0BvicHLYC2s6EK+H6X4TXAHZLWakFeA
Date: Mon, 2 Mar 2026 02:54:56 +0000
Message-ID: <DM3PPF208195D8DDE1FA1963B0F504861F8E37EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA0PR11MB4672:EE_
x-ms-office365-filtering-correlation-id: 20ab0768-d4e5-4886-1e02-08de780715f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: HmNKV2kv0imQ2FqaH7PZCO2w2WNLYvmt7eZCprNWAiWpO3+oyLt4jDc0s4dne9Cu0H8SbPadCSlYTPvuZnxjdlHglzElx8ITHDvZMCb+WNwx+xNFYqH5CTTmPdA8Jfe63BE7daz3k9IhJdEob+gQ83LE49KnZALdy5COqJeJwWZyLyynDfaP9080srUXoIh0qXTKz7sjVDTXy0ZM2DFLQausjAKh8JgdwTEP/i1wTMxEHg97820IMsf6kOKP4VYJsvM3VXoZbPL9dlvVwEqaroySVLAHqqG12Fw9nAXbHmXQ43jYU0d6X+dgMXmhyZv2SArp+UQhBP57Lcu0V7Ve2SV2l8K0EQPHRqSgXxisQD1lriLigql/A++GvdDD7Wqf/SywfRBFHJoyp8QasrDSTVcXorZLlTFJ0jnay8HW3J+fJinOX4EFJkyK+kGdFZKQqksoeZJekbrJfMjPuTeBVMrFf94B3vzLreKqM4q5JyNAAq5+kxjnAnthL0OsHEiIj0QdARTWsitKDtTXCdQjbEyErubzW2nXFkA7A1QLJwGEYBWiu0YZXL6/3LVKlUDD2WSG1/ejFoEHz393Iitp9Z/2u3EWnEzpx4TAY7GnPv7mHheINTMofUk3epr+esxhPJquG68k5we9eeJpbD2HLSygKIh14TxwGBIMuPF65P4kP6+oq/qjPetuNaTJApupwq/q1w3j0C1qidtLSDyPapxLyGM5J4QqIsD3hJ5oCbFw/ZRuvcqa4nKOqW1HvLI8QlSu/1kLkszlWKmWqPAlX/vdNMFwhoXAMC3yqmm14UQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GJOAKeoL08XfSf7k1ZX+nWfZe/23tgqaZD7DA+iUNgUtL9wId9DjLvOOpqob?=
 =?us-ascii?Q?wsYxoPV0S24OvBjqMAmj5b9bhCRnkYtRupyd1ublVglpSUFPe2CuuxgN/u0U?=
 =?us-ascii?Q?ipw4vfX2ea/FK+10Uqlc1XS/pgbupkvT6qivVDGXL98lnSfXq/JKqYYPmtn2?=
 =?us-ascii?Q?kZBuYg9v7KntlDO9Un9CZf2FsTWliPhYY4YFyqvGZQjKGLucjCnJKjAmh7QY?=
 =?us-ascii?Q?e0LkS6BXYp1ztUNdKj/9JNuY+P+H8WP6FkxUu1Jn1MOs6dz9SPn/NYBsHqwR?=
 =?us-ascii?Q?R24VABMTqeNdpNBLaRJJ46Rne5HJcEZykNyXViAhztq2YP1DEJAzCtr07WQB?=
 =?us-ascii?Q?w0gEnDWG5aNIid+0mg+bG4cElQLVeMG8J9j66RWU46HhBmVPUa15CKafKLsL?=
 =?us-ascii?Q?fWaC2KjeESow7IkdeH2K7cGgzEy+654DmzRbt6GLOB+eHSvB9Dh7hAVsOIuI?=
 =?us-ascii?Q?n7xTrzvdtlZE8DupuT7bLYohTv4DO3/K0y1QJcqaW5oG1QjAZbOhsixR1DcB?=
 =?us-ascii?Q?zsdFw3ju9RYGbulSRu3qzaWPHQuuLtRaw79/NJbd4ke0z8+qzgKWEna1wn+z?=
 =?us-ascii?Q?qDVyMwmiqZDbjvuOwVx1S/lRx0i8E4mgCAcT6okXU5+7RM7fMpR3W6wZLCcH?=
 =?us-ascii?Q?7gCWuNBu6aOIaQ8kpDQydYrOc67QDi3yuq5abI3dlnZImPZ7Br4iLjaQd9L1?=
 =?us-ascii?Q?iCZIfFIa67KpbrDHAU9LwPUhr/BYjin+hxGIZ7F5pcv7rGnAO+px1EXawGt1?=
 =?us-ascii?Q?M8pZrbtRzn3qDXLVv3E/F0s7oUh/sZRr/xIy8c4xjUKxE3FN7E64mkX8v0tg?=
 =?us-ascii?Q?vVOFcXJLCkYqfB3O9IjHlpAgmjmbiXgyyTGO21Zn9hhwYQVO7RBGWgHJdE/H?=
 =?us-ascii?Q?j7Q3q7N0E4quEsV/Rva6+jstd/CxNSpQybq75u77X4p0BUvJj31ros8X2aYC?=
 =?us-ascii?Q?lSE3L6yBs5lj3SugTJvse3mdNljSlJvUy5p2gg5zoTT295/jkKyAI4Wazn+A?=
 =?us-ascii?Q?TySSn5+gwsagRqswPOJC/lOVx6sA2OoMNMEDhfowaq6S5xSEMktpxo/1cIj5?=
 =?us-ascii?Q?BWKLpSnYyFBkkliu6Dlustaa5uTDbUQ1X68ALG7ZY6+LVygLzCjgghRCDHVh?=
 =?us-ascii?Q?9e0JfqPhCvw1fgAGd4AuyulF7FiOweL8uBywA+4l+3lEwIbX4ZsL8Pf4GXF3?=
 =?us-ascii?Q?NbAUobSd7Ww6ACSH1rG0lsIMisKO82uccmtcJy1A7v8SH41fJSdT1X/NRGdq?=
 =?us-ascii?Q?rBUGWwWdeNR05vaCYayoMZd9IkAyAQe4Hp4vpE3Bj1/WCqBILPHqnk7mmvOP?=
 =?us-ascii?Q?wukpmjwSlxwpPIJ7x7YUTFt+W+MT/C/qUOVEb9vHCwiQdG801PvIgTlw+W1Q?=
 =?us-ascii?Q?PwBhzYCQ1WZw7ecMnW4rquseAGuRzdFBVRwuteM0K5+HJPYhVq1M5Y7rAVx7?=
 =?us-ascii?Q?H/CKLL9oo/Im45u1/5t59SEduyqMTlhdGqYedsk58qRRurC5IPPFcOUm3mbw?=
 =?us-ascii?Q?rH9Defpj/Tj4sZjjySq9Wo4OkHTt+ie9GcdMpvc183PExoZzdIxnjDjpbFK+?=
 =?us-ascii?Q?VLJHy9a4GQOFNNale0hZXFHRop0VJy7lKddwyRvsSokVAkURNQ1+2I4ijjT+?=
 =?us-ascii?Q?77IwNqNrNm+FsP5odlumtta0MxtSdgP7vQ+9j13HMSYN72Po9kg0XmuFuXdR?=
 =?us-ascii?Q?zz/2d4ZkhBm2obfYYCkrypPFfUN6RPXA8FrXGiw0Yc5XOTPuGgPZnws0jP+V?=
 =?us-ascii?Q?a8aeQyXQLA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ab0768-d4e5-4886-1e02-08de780715f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 02:54:56.1535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCGYr0J6t7d6kTrtYBSuXe4I0YSbefi2YPc6lZE4XHMI2FUhrk2G6Z3wN3JUczCtRWnCp9nwIMZpfw1X6DOqUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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


> Subject: [PATCH i-g-t v1] tests/kms_content_protection: check sink capabi=
lity
> after modeset
>=20
> The loop checks HDCP sink capability too early, this makes test skips on =
multi
> display panels with "Sink has no HDCP support"
> on valid connectors.
>=20
> Fix this by validating output/crtc combo, do modeset and then check for s=
ink
> capability.
>=20
> Fixes: a85208a45759 ("tests/kms: Use igt_crtc_t instead of enum pipe, par=
t
> 4")
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 2c2ffa150..1f1f45fe6 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -725,21 +725,22 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>=20
>  	for_each_connected_output(display, output) {
>  		for_each_crtc(display, crtc) {
> -			if (!output_hdcp_capable(output, content_type))

This is weird that after a modeset that the sink starts showing HDCP capabl=
e.
Does output_hdcp_capable belong in the outer loop instead of the inner loop
Which iterates over crtc. Why keep checking output_hdcp_capable for each cr=
tc if the
Output remains same.
I think optimization in that line could fix this issue with lot less code m=
ovement

Regards,
Suraj Kandpal

> +			igt_display_reset(display);
> +			igt_output_set_crtc(output, crtc);
> +			if (!intel_pipe_output_combo_valid(display))
>  				continue;
> +
> +			modeset_with_fb(output, commit_style);
> +
>  			if (is_output_hdcp_test_exempt(output)) {
>  				igt_info("Skipping HDCP test on %s, as the
> panel is blocklisted\n",
>  					  output->name);
>  				continue;
>  			}
>=20
> -			igt_display_reset(display);
> -			igt_output_set_crtc(output,
> -				            crtc);
> -			if (!intel_pipe_output_combo_valid(display))
> +			if (!output_hdcp_capable(output, content_type))
>  				continue;
>=20
> -			modeset_with_fb(output, commit_style);
>  			if (data.is_force_hdcp14)
>  				set_i915_force_hdcp14(output);
>=20
> --
> 2.34.1

