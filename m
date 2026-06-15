Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4247FCD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 04:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D610E18D;
	Mon, 15 Jun 2026 04:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwkCQWXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195810E18D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 04:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781498538; x=1813034538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VPwN74bg4K9k+QsvRHt6Ujop/Ye5KGY7lStzhf8Tpt8=;
 b=fwkCQWXMraDqbjffspZGVyLcn4Ay+K0mxIIA+nl+6oAFK/E/Gc7gdbOA
 BLy1rgJVr4GKEXo1gkBSGgv59VPYo3zEtR/WzaC9HVUkA2YQfn4zcNRD6
 dfc3jSvDtm1Aj31MBvjYZkETNxq2vqCYL5ORDqNlE0ylCz4KKKT3WTRBC
 ePd9U/qQmO9qs7o6FY63G0dQ0IO/9dgZMW+EcRUMISYM21e7oDwjIHuru
 EsAuux/tVwhyafE/o2HRRKJWXaPOPdXxhXhsgKyM0dj8tm3kG3nZm7Wu7
 kvO4xYpmLgeOSwRZD89+li7oBrOBzeOmxO16FkFeARXGQ4Mg1C8P1+gzG w==;
X-CSE-ConnectionGUID: V5sS08ZRSuac8/xJ3riHtg==
X-CSE-MsgGUID: fxs9zKNmRFiuZRKrxSvVFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82215610"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="82215610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 21:42:17 -0700
X-CSE-ConnectionGUID: 0tra+mIwQu2F/s0z//1NSg==
X-CSE-MsgGUID: RfSahK5NSTGqwczOvg/hAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="249260023"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 21:42:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 21:42:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 14 Jun 2026 21:42:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 21:42:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm8rbM4dg2jbXmLHHa6UWUDBoSOb8/PI2UytDV1hh9xKdip1VW7zwhMzfbGKhfYvRx+vDByMnxhWCsYnUN/rniCSF+mhrulMHLrlF04leABiZQKcucZgDcoEa/tlvkb03XgdtKpRrSSQ0m0hOe5DO46nZV+3/G1yyNgtPrkYnsYsFBKmilDnd5j0CTgXzY/+1GWbLh2MRdT86aqrdYrmWMX8MfWI7oqDEp+HmA+mSkspIEwK14AsDfvIwAhBe4MYDfk6n/uYw4auG2q9Isama9ZCpPUPvTYS3nKIAiOGDEJSVGyNs0gQHT3hvZtsycfriunX/IhLjvrLHXZz/sJ3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIjniG7wnVTQjQbRyTix9B+1qllfU6bEFuKJ9Y4W9QA=;
 b=TrB+/ISeZYKMAal6tT1z1iXWLyrTyWiJdpQcEqKPPER1cmyrYh31PWL1+ki+26Qru5BCJxNgTf+rgG/oxwxosx1zLnS6IgJsAxUGxOWQoEC833QEJiJ1f8C3yMjXq1zPkFhsQV5LqjxjDK0cyDKbqJzNdudCkEBReuJ5dfpgOCvAt0YpH9FFnkl4kmqYaAretZWqC3AsKXXoADDqElKCQ17Q8Z8fpGDR0JDPsv1ECo5YdRkB3DIUiuf0tmLvZ9yI0foGuUT0BW1v7u3rMzb+ZW3AGhB6R+mQWv0ePGJLu1Uy+iyvPbFovUKz51ry0QrzwsKmDOjDO8Eivvx7kZsdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA3PR11MB7654.namprd11.prod.outlook.com (2603:10b6:806:305::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 04:42:14 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 04:42:14 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Skip downscale
 test on first commit failure
Thread-Topic: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Skip downscale
 test on first commit failure
Thread-Index: AQHc+mBxg+/lZv0aDE6lyrNdGFKAKLY/DdBw
Date: Mon, 15 Jun 2026 04:42:14 +0000
Message-ID: <IA1PR11MB646755C9615223A0C5AC2FCEE3E62@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260612114954.2668076-1-swati2.sharma@intel.com>
In-Reply-To: <20260612114954.2668076-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA3PR11MB7654:EE_
x-ms-office365-filtering-correlation-id: 17294177-a189-4d94-b521-08deca9878b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: sO/ewySUmRgNVjf3XbCnCIHhjFS7A3Sr3N2kl2aJGQ0pkBbrormtONchsRf+a3TOuX7Xr5i/aMmhRFsSk92xIwOWGWPSsMeWg7ipLeOhbyAqomnPBmiDnH8WHt+DnPWaIRDaapOpHG7HmAo25sa0tmZD8s8oqtaYgVTA3oRQWccSuHsAWMOHlMMpZSxxtx3FIqDwVZRkaxNLr202m/vZ9y8FkulVpCzr+YX8yL5SUg1UrFTHkMXZfYubb8DW85nkvSBs4w2zFC34dGb3wFfLubLF18N3TNJP1GbSLbAMCKBJ/q8N4gvenhT01MgE9fyBZ4BT9cdSL0GSvPwd1Ilt33ijj3YyRuVUvpke10DWiJBPcFZtl0M5Q4NUN5HoptI3ovL+i1TzXD0Em+2GvugP62IYoYSg6HPAHsEYbtj75cFwAa1W0yALqNbYpaLCwSb4SZVpDR1BuX3h5PP1+rCIcVS1jNeSW/dSIR4ZcNSz64w7jgaIN3xyKcO0o/C12llDvxEeeoZtHI7cRaUv653D20+RH1nH/+RsEVKwjHv5Jf8MEiRhlsYB5coB5hbhK8GsXDhvzVGWO/r2OBZqbizU30gzmPVVNQSOhcv3THOM0IyXt9PNv4qtxd8bfNSwFSk0BELeTX2+ZB8HbN4P82jliqLpLfbDlt5UI4HB/hGJFfYmcFsNbsTrDzQ/ewH1oRsGM447PuDmSaCq9kXOMtzqvM9UbtWNXtjk8xQmjkEdn2JknZxNzQx0/OrRZXsEDJm+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YfWcF3OjXzM7yr99nJtrmH7jzQxzHxC9wfw4WR5j7H1ouU2RmOSxBAARkMYb?=
 =?us-ascii?Q?9HiZdQGyt42pxDmtlR6RszEOJw1QakIbCPJrJqdFC7lfeseBdHFBC7r1C/mt?=
 =?us-ascii?Q?5MoF4UYT8uo7MvfxRQ/jnLuU87tSvGOLlgGg5QAj5Yk0VJ2v+6tvpMk5ijOx?=
 =?us-ascii?Q?/abJ9i/h4k9gzIUg4nQ+IfcytGcHK6ICcufLF7c68uPlKHxxKANf7j860UEj?=
 =?us-ascii?Q?6I7QpTx9sMAmjs7HYQ4cgf/DRmlAS42rEBNhXDacMWhzRtTUODvzQJhFjWjn?=
 =?us-ascii?Q?h3iFN6pcp6mziwbpFBwKfUulBJnC6Q5BeylvbgBzVJxsSvdwUAHoKUoFioqN?=
 =?us-ascii?Q?cTdniCBslUOGcri/ZNSjIayvP7ZbDCE9JE0JmW2AEEYCtNxm0+TxkrVpJtdK?=
 =?us-ascii?Q?Uba0RKaxJcJu1CFETJUxrdve/hVFZQH/l4J/eXhl3Uty/eX+WVZ2OPkxFENu?=
 =?us-ascii?Q?Po9Hk0WP847qI9LAo8/WPcem15Tnsv5joi/xf8BOdEjn5wKzqplBXRCu+z7E?=
 =?us-ascii?Q?4g7sFCeaEkiaDifAf55ys1YVkPd/xlvaniHbbtWCpNK/mZAqN+fAT1ajBfjQ?=
 =?us-ascii?Q?7T+G5OdXx/VKLBht/+mtzYYJ+YMyw22n8kq/4wcCShUeKeGtZsq2A9BUrNsb?=
 =?us-ascii?Q?kTmMI0HC58+ENepau/kt5C58cn8o4mXWe+XCMKuzlmo4pBgnbyOUllX3tcMk?=
 =?us-ascii?Q?ePuX6s6xFP54yTsjUVwPdvUvLUg7fK4NB1A64sn6mTNCvNXlObhh6ALEVN8D?=
 =?us-ascii?Q?1Ns+Phx3YNAEyyNAz3AQiDCZG3ydOIzSGIwx3gN/0pxLk0YJ0du9rbvCY+ar?=
 =?us-ascii?Q?IgRJ4fGAMj0gfW8dOH6dgw1O+qumcsw+/A2IN39SMkYb+kOMOvHPdjIOCgDT?=
 =?us-ascii?Q?T35xE7kyD9sJPkT5YsyBnfgxRhfgWv5p8i0EHYI6GZGvBuWPPELLK8lvXWIZ?=
 =?us-ascii?Q?XJuk85mU1KwxoKnVOA+OCV1vO2yIq1H2pgVVM34nYVMUsZAvZ5TE/TwDgRMR?=
 =?us-ascii?Q?uug8TA3C7EePw6rhScyGjRveE5Vl9tM2HOTPSSOaN4rTh5GUDTYS4H3GnPx2?=
 =?us-ascii?Q?5Ngfxi48HC+uW7LoMotdLQJm/cbDeTDlG8RfykbeY/PKEqs16F2UtTR2mdl7?=
 =?us-ascii?Q?dYwS32HG817pl9WxP0KhDqPo9AM5ukL4X7Yc/2l1y3xxBM05JVCvOqWYSeHn?=
 =?us-ascii?Q?qoGF4w2A4lo/VbfE75TOdJSNXvTTy6Bs2N3wdKG01BeoHJwyQ5za2wp/cuPN?=
 =?us-ascii?Q?kvpRberZw3OhVFS6wPJ0/CINQ3QLkTpFLUp17iD/juipHdzp4XQtdUgAYsXL?=
 =?us-ascii?Q?mobCy0kmjfZLCO3YVPzPcpGEG94v24ohW/Td/BvZ6gyklEmr+bvDJohsespA?=
 =?us-ascii?Q?CWj//GdVfM+/Zax6s79R/BYI8flqaDqjEDxjPcfzXJj/lS7mJ8R1bNCrPSa2?=
 =?us-ascii?Q?vTQX+W/UvagkdcIAyNTkSMCYeK7kgmGrcpEpNmPv/q4SUX5LiNsOj7JgxH2E?=
 =?us-ascii?Q?nTBYvVNt/QeDwwuRpEJpqS8QbE1e81wAa33wGWWp8XwzSvSh6dftUpdO/iDb?=
 =?us-ascii?Q?m5a0bxoNnvUv2lYSgjn1K93VPxIwj9YuwfLY4Q92qjHWCg9MxOkeMkaA4XE9?=
 =?us-ascii?Q?Ojq6e7h4kxACw70e5NGWYeS/hjVw1irg4iZx+e33y/kX1xZZ2ohYoAGi+DgQ?=
 =?us-ascii?Q?xUzrhPtDkVvwhkaXC0Io4zdSpw/7jb2WvMqiai4cdwQUOlTA0uTARKO15Iqg?=
 =?us-ascii?Q?dsE+tYSW8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xx6Hdu6aHVIF2K+Ow4hDdbjycbdw+jVAwDKd9TE5pv3mX4ZnJUquv1HBRYVXWkH+7iY7n8Yef+7G7CzyhGhk/9c9QQp643Y7c8mHGbIfCRxYlL/LemLKdZJnSVfwVdDF4IidSzljLCBwfdcI7B/TSfyNVtYphxdASnztiadtTVRyoCewreSpfrJSwdXRjVBGJztDMlhm+9w/0x6KtC+/8KzyZakvqOoTBNAQeLwjnBx7zELHyzdfhljn+/BJ2zt7Jvyx4CTgS4Lk5dcb2ITsvZusk8RC/FNkg0OZWrzQWQ6hM2h7zyk7IAokoIJKNH2nPdZDfxwCPDAtYpzuPI0VZg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17294177-a189-4d94-b521-08deca9878b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 04:42:14.1423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRRMDcGUXZCPPmDEpq0YFmwU3g41CHzDp3PWyz8a9GIZoKxq5LTdU/pFIqH/XxL0dAgebZNUbBNNDpsjzyeuRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7654
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
> Sent: Friday, June 12, 2026 5:20 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Skip downscale t=
est on
> first commit failure
>=20
> The first igt_display_commit2() in test_sharpness_filter() can fail with =
-
> ERANGE/-EINVAL for TEST_FILTER_DOWNSCALE because set_planes() already
> configured an overlay plane with a 75% downscale before this commit. On
> high-resolution panels (e.g. eDP-1 at 2560x1600), the kernel rejects the =
scaling
> operation due to cdclk/scaler limits.
>=20
> Use igt_display_try_commit2() for the initial commit in the downscale cas=
e
> and skip gracefully, matching the existing skip logic for the second comm=
it
> after the sharpness filter is applied.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index 353a9a292..ff7b4540c 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -464,7 +464,14 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>  	 * is enabled and committed, the resulting CRC must differ.
>  	 */
>  	if (!is_invalid_test(type)) {
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		if (type =3D=3D TEST_FILTER_DOWNSCALE) {
> +			ret =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
> +			igt_skip_on_f(ret =3D=3D -ERANGE || ret =3D=3D -EINVAL,
> +				      "Scaling op not supported, cdclk limits
> might be exceeded.\n");
> +			igt_assert_eq(ret, 0);
> +		} else {
> +			igt_display_commit2(&data->display,
> COMMIT_ATOMIC);
> +		}
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

>  		pipe_crc =3D igt_crtc_crc_new(data->crtc,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_collect_crc(pipe_crc, &no_sharp_crc);
> --
> 2.25.1

