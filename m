Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7221ED7B8A
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 08:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA8310E25F;
	Tue, 14 Apr 2026 08:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+paLl8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E83A10E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776155303; x=1807691303;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q6AnYxFC+h77LeFVGwCa0pz/q2BN4JfnJEcTkgbRYqM=;
 b=X+paLl8Jomu7VtoRQRZcSajGw7iH2GXvLm+6BJiIrss53iGLsrXQRioA
 dHRtZsX5s48joBKlBbGvPiLctSYyBNPiAJvRw3HbeeKpTzwfNcdqGUZf6
 /8YCTOmBcg7P5kSKRNTsVq+NWyWXpPlf8ASY/I9JGnN0ZbpiwlldX5yY0
 a0Yh2NMMIW94IAe8Ql7sEahH5kUh/tIKp1JmM9pBo6OddswJaRRdLEWNj
 BsDOX2yU40ZH4kougy81b3Fm/CV14/1orovjxv7jl7oMPKuls/7jbyZXX
 d5PcWXi/gOqBN9u0lri0s4hGYhiV8PGR0psls1Vn06BECGuPGOtJfU4TB g==;
X-CSE-ConnectionGUID: nkzwu2HJTOSMB6q6I7R9bw==
X-CSE-MsgGUID: Nu38k5jBRvCJ9b+fJvRq4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76812682"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76812682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:28:22 -0700
X-CSE-ConnectionGUID: dTnZM/KNTJGChTHIHfrjKg==
X-CSE-MsgGUID: 0lvn/cunTPKpddGQnVHRIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234073786"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:28:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:28:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 01:28:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvUnjaxIoEpRhnSdB9UKZ7c+9KeCHObe7X++6YanCoSBUb/3RmwamWHnRIcEt7XcnBzo6wGUYuNo2Sa0kwWzszBzCyfWGPkfaLFistiiRDr+98rssIO5HxYQ2e4jV64XgRP9Bd/YaEL+YpAS/g1NEyb9MrvIC++/eNkY0xBolPCd5YMx+tKCVFxmttcQ/fIaasv0mix/3mSb5JIYlTHdwhtOgSPLWfifcfdsFD32v6utLR5svy6i7MwfMSAXC5HmQVtvSC9WpAQOs+WeSYzBFZDrfaexK0k84q8wsyQIodzCtc0qP50n2SWgJKYd05+O403ogZadQDtpQwbtg64wyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsBy1EY/iPezMpXr8yPGIxUKXN9M0AWinhuL+ly6CFw=;
 b=A0DeZqpq23CrgepET0W6+vyuwo3/h+9fdkyRhQCz7xDDWqhKEIdv5I6dv8AUScawy8DwargjO35tzo2sdxqpQ1S/mzvmyUvXh6ov3Z+i/MAVmC0ItBsvP+IQ/S9o8zxbeLrGlMZ4/EvON7ktsTH2rzfUJmg2gTHvdK8nMFwJTql+SgyTEh88+bw4XiXQT7BhdF0od+U5/hLCWeeTADvLfVNYRUHXRd0QIULkefcn77yAKIp28ZiWlbZzk4RZvSJxkuXwfpde3TX5ZyjHHWQ88mP/f9U/9SCGvEeYO5mayckcxdGVMI7GYJf0ObwbA4S7e44cmx/DxFYdiclCBcQHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by LV0PR11MB9791.namprd11.prod.outlook.com (2603:10b6:408:382::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 08:28:18 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9769.017; Tue, 14 Apr 2026
 08:28:18 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 4/4] tests/intel/kms_pm_dc: Scope PSR handling to
 output
Thread-Topic: [PATCH i-g-t v2 4/4] tests/intel/kms_pm_dc: Scope PSR handling
 to output
Thread-Index: AQHcvHfntm+yLHhbmEapNX1RpShQgLXeWBAA
Date: Tue, 14 Apr 2026 08:28:18 +0000
Message-ID: <PH7PR11MB6053B2963985038E52E71028E7252@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260325165140.115520-1-jeevan.b@intel.com>
 <20260325165140.115520-5-jeevan.b@intel.com>
In-Reply-To: <20260325165140.115520-5-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|LV0PR11MB9791:EE_
x-ms-office365-filtering-correlation-id: c2f9e72b-b7f7-4ee3-cd31-08de99ffc7e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: aurxr9HjfOxQf/4cxocc/oUsnqkylnrr891futXvAlNcORjaCWIneTUupiM3UN4Qxr+NdjM8jk9pcK5lsV/l3WNun0vtjgbAkDPZynvSc+7PJVUP3bAfDfOdG3lRVE1gsn/iNxmy+JyMnNGDiRmk35aFNsaoSgkWpoIICGRtptr/T83I3YvQkJaMxzxC2UdMuLp/hcYv95wpwhUl6IGgYJrvX4LPotH40gndbbU26kSoywMrY2MhtSXOcwx43xBsBqGpcPOhx4tUeHFJeBldgCrlsXLcIaaGI6+2ynPoVueTreIe549Ojov8rszQjMosXLJ9xwTSWTygiCLVzTcn2yMLDHTQXk61nNFb20Rk2enV8PKf9QsdLMd1jhABFWt8c0meYDfXflD2JCsjs3VmsDZ0LWQYIDgJgUPcofCo9KNZxk9Cob99kXOuB14tSi9uIe2cnRmduroG6FvwG6YfeVN4slvEheXvvEGcvt3mer4Lbsj7vgO5zAa3KNutTn/XdJ/472GTlgfikx5DjgGxF75fPoqVUsEanz8u1LzBojqCp8Mpcoyl8XAdnbLdB9nFxgPhZ3Tm71aUbSeszceI70qsg4ytFqqNGnwxXABdnsvrpPwnmv+5jUXFchHFNkUrBamSKrKBZtnX5BdvXU0oGkc00bFlfk6RLca3IIzzRP/RMSz96qglz59t02e5gYEcE/pLOXDl+3PYsomAmIRZ6sN8zuNBKp7XkiyucVvoaluaOILgMSKQ8oPdUzUnG/cISBgYfgh5zjLb8Hk2AnMFkYh+U5RQ7tHe8LywsnbqFpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Iw0+jj1is7d6TF3DZqPf6VUNGSeqalaUORcZV2tn16QcogVGZ+39dd7xR/mB?=
 =?us-ascii?Q?R0jkYhK+3uynjH385mGcvFR8XdDoM/YIOJ9LgSngFqIJhhHb5VFdRjEogaCc?=
 =?us-ascii?Q?NO4eOajxSEmOycrk3WQsCOaxJ0nbLW/niJTfs0Vxxe+f7EgXlIojIgeGZOGP?=
 =?us-ascii?Q?SJeeYZvD0sBd9NdC0t58pe4SsnlISKN3cRDnCH/zs2fddk4GkYXRy9Wmgr08?=
 =?us-ascii?Q?DAZYjqdojFRFLnEQMF+nY5Ns97oIXRETtcutPcvCDRruAzu8JjTXwsS+Zld4?=
 =?us-ascii?Q?S5cHl0ocpPfihQkGYM+I5aMgJYfS+XCxQfcjFwbqWymOlva2itoeDaFD+R1R?=
 =?us-ascii?Q?T8/DNdNwthWbCbe+4LuhtL8qRRccn6oTR32fJsdzpBv/AokIxAV6iblixfH/?=
 =?us-ascii?Q?OgG6LhlxPXROU2zVL6roTbz3Rg6E6bwdnSFY8Y0tGzm3oagS0CGBu7/QP+Tj?=
 =?us-ascii?Q?hPiHo8hvpWhoIb4Jplzd+2NJ+CmumHVb0xpVKW0PHaWOoRwnBqHIKqpHF27w?=
 =?us-ascii?Q?7ymKLtXdfmd0btccoGsDSiH7zvftU1FPffXm4FQtB5GuyBZQrGu8xR6keqjH?=
 =?us-ascii?Q?snpotXQOllHqu8QeGYMEP6NaklYUQ+fIpW6FjHCQvcb93OXNW8C7XNFh4Ctt?=
 =?us-ascii?Q?ZPfGu2jUmn4k7ciLrlmY9FD9cA1L88fCWUStgYvcyRN9vGiOa1UwBMFXJRmi?=
 =?us-ascii?Q?IM3LGGN5L30dMpkhmiFb5Fj6NYb/rRzxpff1hu965pxb2luJyZxutNKU5msu?=
 =?us-ascii?Q?F3nWVAAZ9SxgAs4HHhWtHfNck65lQwBsHBdqOXkvo2YqhXEfDmuW6Mz/IsOr?=
 =?us-ascii?Q?QgfmPppc9lhMF2Jifd8vVFcpfHjtzuEcnCbfhPaXstnnIFlECSPBkmQQAWLZ?=
 =?us-ascii?Q?haDMOzKdbaVqFkeFTn8CVd2YreyCWAZbWFJYcCik321pn2HSnnA9oFxkLqFf?=
 =?us-ascii?Q?5jbXx6oN4NYvjMQMxK6vQvz4C749FefkUXZNRp80IccvPWKONp5zX/rHVtaf?=
 =?us-ascii?Q?uRylm/bMFXhUoafEeR6HtRmfYmuwt6hhSZa//0WJ/B5bv7fz60p2O+jQZ4Ru?=
 =?us-ascii?Q?xOCKzm8EUuk+uyKzFVZ4Rz3ZlWfyvHuLbumDepr64tV3WLwdog0hwmyBA7BL?=
 =?us-ascii?Q?uk7UIRfynRlImEly855bwgSOJM8+lIiL1QZ5ul1pcNM1UaMytdfq3S6o0HbS?=
 =?us-ascii?Q?PgNlBz9uOjXmq6YqDUj4MbEImRXtHuV/rl/+IZnVieQRhR5tDngxDm1YiRkS?=
 =?us-ascii?Q?4LJ7oLtQoXMXPsJT2okY1VZ3QTwXxF33dKin7F73IYHAMH8+HCpg4M/zCQEZ?=
 =?us-ascii?Q?ogQ3g3tQ2HAVz7Jf4azzjNMSTqakPWO6UtxNN/Z1D1qCI3IBdAhCFM9Smb9l?=
 =?us-ascii?Q?0MABWF1mkJzaNvoLuAtfHkqX0ARHqIF5SwKCwAXhd5E/WsjXRH5pBGX0Dp9D?=
 =?us-ascii?Q?Doob2+wS4OHuA6p6afG6ZHjQAJQ6qynsX7d34RIvORcWH/JVDte1r45Qm4P4?=
 =?us-ascii?Q?DcZueGBGDPUrULspxCYvthWyuVkrxbO2oWiXdOYJ7Q6StOVjPvSJ4GaqojGT?=
 =?us-ascii?Q?Kd+o3JIHp0z+h/d8ZonTQ/dgCV1U9x0LR0BS/4FQfs1Z9Z+XMO/Ig3ggRm0y?=
 =?us-ascii?Q?yRJ5ALdX8u6qPS2vpQDNlQt9uEI56smmH+nvtE6rj2jvE41qYvYZhNCDOc3S?=
 =?us-ascii?Q?TmbaIDq1KiZqSUHmxX1PgoE2vNoFzj1VlcrokYJCkcoLmZn7xr4k8KWmxA4y?=
 =?us-ascii?Q?pqy28BRijQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eM9ivJzvWjnJm8IkRR/6UQEsNbhfNrpb5e7ON1RZTJEldm2gc12XXU+FTQM4Gm1S9V9i3CiUEul25gJhGmzjHsVQSK+AzuV8OUp1PaYMPwM7qn8FXuTuuqVdiDFmW09FPN5whdNdBLJb3a29OYb/SkAFqRidARCACS8ZDzagBjCkzo6V3egL06IOgvS0i34oihO2uKL0PKM45JGzsOb6kVkAuttWdrLQpYTqZPitzn1DfdMBy38pldPBtbeTA9IMdIqSaCrkeTXKL2djpynAfPvHCJ6bsn7niO4wlHH8RHrFfOGRPl/dHk7uhmhkXSFq0iaCnYjimtvE69A4otzyag==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f9e72b-b7f7-4ee3-cd31-08de99ffc7e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 08:28:18.1980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQmCJ0KYD0uSrmp/BNFnLRLX2JeQs16t9DUB7+4f7Yw+AhEe7WMQiuioC0d0LQHdfgSMwN2SJJALaIAcn/wEMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9791
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
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Wednesday, March 25, 2026 10:22 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t v2 4/4] tests/intel/kms_pm_dc: Scope PSR handling t=
o
> output
>=20
> Stop using global PSR checks by passing NULL to PSR helpers.
> Select a PSR-capable eDP output and scope PSR enablement and verification
> to that output.
>=20
> This fixes incorrect behavior on multi-eDP systems where PSR capability
> differs across panels.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 39e94f36b..1a88c54bd 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -162,6 +162,10 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20
> +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				      data->op_psr_mode, output))
> +			continue;
> +
>  		igt_output_set_crtc(output, crtc);
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output); @@ -318,9
> +322,8 @@ static void check_dc3co_with_videoplayback_like_load(data_t
> *data)
>=20
>  static void setup_dc3co(data_t *data)
>  {
> -	data->op_psr_mode =3D PSR_MODE_2;
> -	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode,
> NULL);
> -	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL),
> +	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode,
> data->output);
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> +data->output),
>  		      "PSR2 is not enabled\n");
>  }
>=20
> @@ -342,7 +345,7 @@ static void test_dc5_retention_flops(data_t *data, in=
t
> dc_flag)
>  	dc_counter_before_psr =3D igt_read_dc_counter(data->debugfs_fd,
> dc_flag);
>  	set_output_on_pipe_b(data);
>  	setup_primary(data);
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL));
> +	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> +data->output));
>  	check_dc_counter(data, dc_flag, dc_counter_before_psr);
>  	cleanup_dc_psr(data);
>  }
> @@ -356,7 +359,7 @@ static void test_dc_state_psr(data_t *data, int
> dc_flag)
>  	setup_output(data);
>  	setup_primary(data);
>  	igt_require(!psr_disabled_check(data->debugfs_fd));
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> NULL));
> +	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode,
> +data->output));
>  	check_dc_counter(data, dc_flag, dc_counter_before_psr);
>  	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data-
> >output);
>  	cleanup_dc_psr(data);
> @@ -615,6 +618,7 @@ static void kms_poll_state_restore(int sig)  int
> igt_main()  {
>  	data_t data =3D {};
> +	data.op_psr_mode =3D PSR_MODE_1;

I think this will work when each subtest is executed explicitly. If full te=
st is executed,
with this below changes, some subtests rely on existing value of op_psr_mod=
e.
Imho, it would be better to keep the PSR mode assignment explicit within ea=
ch=20
subtest to avoid unintended dependencies.

And this looks like a cleanup/refactor rather than part of the functional f=
ix.
It would be better to split this into a separate patch so the current chang=
es=20
remains focused on PSR output handling.

Regards,
Pranay

>=20
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> DRIVER_XE); @@ -640,8 +644,9 @@ int igt_main()
>  	igt_describe("In this test we make sure that system enters DC3CO "
>  		     "when PSR2 is active and system is in SLEEP state");
>  	igt_subtest("dc3co-vpb-simulation") {
> +		data.op_psr_mode =3D PSR_MODE_2;
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_2, NULL));
> +					     data.op_psr_mode, NULL));
>  		test_dc3co_vpb_simulation(&data);
>  	}
>=20
> @@ -649,8 +654,7 @@ int igt_main()
>  		     "while PSR is active");
>  	igt_subtest("dc5-psr") {
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
> -		data.op_psr_mode =3D PSR_MODE_1;
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
>  	}
> @@ -659,8 +663,7 @@ int igt_main()
>  		     "while PSR is active");
>  	igt_subtest("dc6-psr") {
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
> -		data.op_psr_mode =3D PSR_MODE_1;
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>=20
> 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n"); @@ -688,8
> +691,7 @@ int igt_main()
>  		igt_require_f(intel_display_ver(data.devid) >=3D 30,
>  			      "Test not supported on this platform.\n");
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
> -		data.op_psr_mode =3D PSR_MODE_1;
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		igt_require(!psr_disabled_check(data.debugfs_fd));
>  		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
> --
> 2.43.0

