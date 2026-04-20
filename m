Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26CEF99C86
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 05:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4696910E421;
	Mon, 20 Apr 2026 05:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hwk0br6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C7710E421
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 05:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776663631; x=1808199631;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=luxSOUWJFi/K+8pxKX/AjV/er0gVVNld31K6apPnsCI=;
 b=Hwk0br6sAHZl1AmaTdC7ievWCtoUvj1mfB2XOvsSZjemT75c8eNab0GP
 ti8UU9KRyWcd5ct3hDXpSrJvPKFN5qjenT1IkywAT81fXGx8/ihIt7Ctn
 Sg3h8Gg818EfRZdPOMeCSQfs4LZtGuAXC/kGLjUjSW3T7x85rPTE/VIIP
 SmMgnCA5PyibRkhSesH6jAFQMzU1ikX9Vuow3bIPyG0b2X1Vlfio6+g0N
 91LsdTRgdXJQ8MidQAZfWnqUfKq34GWdMnAvDE0q31eSpXnP+EaRagvrR
 cAvXT7JWhtIf8rmnkhLr7GEubGd8k53ZFG9Yu8uGCQyfVt9jKkyBTBBJ/ A==;
X-CSE-ConnectionGUID: Dkb6ZujtTeCiyobX4Z+SLQ==
X-CSE-MsgGUID: wYuDjQX4RkGL6Pcay+irzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88268959"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="88268959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 22:40:31 -0700
X-CSE-ConnectionGUID: IwLFVyoMStWXACWOFMJNGg==
X-CSE-MsgGUID: eQSIzN11S9CTOPu75xuiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228470824"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 22:40:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 22:40:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 22:40:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 22:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgpsLbc+enOItyQY9/1eYBz+6S85idj47fKLncuNSQRmmBIFOD7YkKFh12ECU+QvUVZe6hFwNsXZv7lb/plYYOhqpWR462K4voR707aGc18qW9DBWcgrsvVxs0PyaWbEGaj18vO3TSTDYJUdya8rodPhekaUTW9MgwiPVrc6Wci8N8+ZwAB7alcNbnwl6tB4wVDH801B1Mq6D4qGMVhj5iGMeh7m93WOEc5ItkruBWCPKmfGHvZdhS22bzS/6w3Cly777oFd64m6qqU76cbjMXvCZL9MITyUfCp+5lMSV3w8Os03dpMcfA3DCTLKfuTXh8jLNUEPp/F4QCh6NoSYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdXxQ5aTFgL4OfalzRDxK+idWnGS7GCZmslGcE2Hgp0=;
 b=gA7m6lwmjejuGbmgiobG7MLytoUBJr9zh3XxhQzU2nVn48RaRT5yrs3hKbP4gFCI99AuQ2VUpMcHhUmpReY8Dd3rwEipJVEXa5IkPm+3TiZNGW6tUqsBwRcS1RHKvnoDCswKGCk3v878I8piEslDVb1bRIjPvhuLq6Nk2wlubUSu4oaAUq+MTm2UZwQhhNnW/KEJqRlZWrCGcrnB+h9KP4I/JqUZuhK0MsHw8oWpAHs6muMOnilWxSWCZFIg8dyuZXelYuncaVM009oRCTWFSqBP+As2F2odA5QrQy1VWIbhesCul5qobM0dWPWSPCnJ3p8dNGEkNSuzu0cWtNRIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 05:40:22 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9846.012; Mon, 20 Apr 2026
 05:40:22 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3 4/4] tests/intel/kms_pm_dc: Scope PSR handling to
 output
Thread-Topic: [PATCH i-g-t v3 4/4] tests/intel/kms_pm_dc: Scope PSR handling
 to output
Thread-Index: AQHczVToosJAu6hfiUuB8qiErgTKH7XndJ7A
Date: Mon, 20 Apr 2026 05:40:22 +0000
Message-ID: <PH7PR11MB60532A99FBB7D6D5DA397FD3E72F2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260416035333.69004-1-jeevan.b@intel.com>
 <20260416035333.69004-5-jeevan.b@intel.com>
In-Reply-To: <20260416035333.69004-5-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB7297:EE_
x-ms-office365-filtering-correlation-id: c0b42760-1527-4a6b-26cf-08de9e9f50d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: IDFitPj5YnQ/Zkt4vldLzM/3MyPDLJbvMx1sda2lsD+p2U09meNVb14MPzUbQWtUopO4yBfnIoUkz+Z1Ckawm4A207vBa+G1aeAifLiCAdt1X++/iPvVIngidZ9qY5lgil0JZy02UTHqup4XsEY8iUqaDuUCWpf89VieeYO0ldZCvD4CQm+dR3/MmzrCC78gR0NPqEKYa6Fv3escJPIlNXz3bLn0CnlO/cBA2Abuq+5GYeubalpT/2ncxnZIq/EVb6vsE13FfwW2U8nXo3UJZF5lyVGWlq2Nk8gK5TtHoM1de3i4jUZU0cmWr11rhFDvEoppz0f8dlwvS3hcHY0OmQ67uvbLu7Ik+x1YyrJfk+ph/XRQAnqVnwqGzTtPJY7wp85p3py93gCI6+vfTz0VSBen96nFt7J6pNk/X1e+OeCSgSDOcKACQtZF7JylN2cs8tE4rwhDjCks/q6lZf9rmpdS+DwnZsd2QuWc+FmCYC36ECPqyNTB/BH83TFwg6QuXSKd9J6jpS4z+1f97njZU206svd/UWP74hjy9RLDcTQioujzQWwAffOUUwIy1pBTWHpnsBs0/gINlXIFKu9UdWwJSlHTn5l6UDJr0nkkmaJuvhrpgx4iFHu6F0UmNfLrpk3nTfwY3Pk3NJxnWBBDQ/VdqQIY1gSt/HgsOONCKCJDnKy+77Q/o9Pe6zr2WZ11Iw2HSC9NGFseo7lgBkX/UwkCWGKYZyqQak5B6wTMZo5/K7r25HvAjao5ebeFBeEbfttjYwelEpioVpeynHgaTXmWctQ9PlaNmEvaBG3UGGc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jtNX3pIzbICpLePjKUbjl+3rSZek+/jVNbY/dRZTFgpSbKSWhfUfnaNZD/X8?=
 =?us-ascii?Q?p3Pae3RYVTs2iv5JXvJrhoxLe747AiCWhoh8P4D+bI6rL5SY9THdqFDyev8O?=
 =?us-ascii?Q?uS2pt93B6fHmG/1HmBtzCiuIRQ55VhW5j/b40G0j/RHAkgUQm8FR+amdw6jE?=
 =?us-ascii?Q?OHxvdR9PgaykDNBEm0GnFefPD2wIGYtGb4RieALOL1EKI6XGmH+X4kbpgt56?=
 =?us-ascii?Q?0Ul9YngBuemVCzwHE3d+f8TErQZdTsjCWERmFy5Zq+Q1z2j0P95JOfKqqz1X?=
 =?us-ascii?Q?cmANj8oinZ+eiy/JJdqD7XY4nlsKoLgaNlsykft52GpbZutm00VhGc8BnF9T?=
 =?us-ascii?Q?gb0DoB1YjmCqJzs+blVvz36Bj6yH3OHauoDJKXl9q7Fzvs88gqRgTBksou5m?=
 =?us-ascii?Q?ZM6g27ZM+ec6KU15Iay00Zh/2k67Stsd3Wxd6VCruCdfB3aE1/lxMtaFIJto?=
 =?us-ascii?Q?kaJFteOsdarrnBUjAmfhNqmh8aODfLRjBd8qE7Ff0mDI5nyVEOZbQWuwsJns?=
 =?us-ascii?Q?KwHUEBZydeUU1Kr0UVN0PXKI3vuvSdl1n9Zxz1hDEN9v0V0A4s5OBYTrg+4T?=
 =?us-ascii?Q?e5gZlDl8sU4Ee651b3ne2XWfdEG571sZYCR5BeuV48NmiO5DIczqv2asyQ8G?=
 =?us-ascii?Q?X0OQexJ2hWdG7T3v6umiryKb2cwJKEGRuPMJR6c/IzD2Hi9T5ZhyS50VMNR3?=
 =?us-ascii?Q?pXw7f+TRWQPNJB47pEUzzXS8my18N85Xv2kNAcZLgA2KebpaWpz4+sKfELqc?=
 =?us-ascii?Q?I1haJkkDN7R6k3Es56VXnbLMZIJW2TmtMszaidWWdEeItWjcSyWvzVpK64lG?=
 =?us-ascii?Q?Tt5dCbJuEzyWV8m97Suzcid2Cy8IO2dn6IeI9PzrNiTc/jbulNG7QGJDpqPn?=
 =?us-ascii?Q?whFNb3Nrr1xvAcRM49X2+1irSmz4aT3I0N/iggSdHWgdLRm53ONDk6gWTXaA?=
 =?us-ascii?Q?CmtW6pSLaZqisF9ZajZ9Ahug//Pr5Rfna589Wjid39j0l+SKZ2ZjfMTqV3Er?=
 =?us-ascii?Q?nvcLcqnd5IKeoTlH3VEP9IG49UlnCEuXHM0dOegXxKfBEIAlnXeqOI6Zd0N+?=
 =?us-ascii?Q?XGRqyMB39bG32G+DVvwpfHLn+ya+//QYBY0+IAmQP1ro0t3saxpq0YV/xNil?=
 =?us-ascii?Q?ibwDuhLFKIpveKPZVLWjQQfTd5xbco4VBm7BZlOrywpPXsALNw6A0EkFHyhS?=
 =?us-ascii?Q?X2LdbDHw43S+ZMV5vNS/Kc9cbhHU8ctgVTxyDPkwCPOcuJEgiSIhT+5NZiKx?=
 =?us-ascii?Q?KebDgfmlHPgdddqzoUm4m7y/BlZycZRyqteg1uIPkjHT1UgMVSszXEtSvJ2E?=
 =?us-ascii?Q?3YAREPNALmzdv70sLG7Nxt0Sc2kCE+3v34zhiAyjlyuiB9pSDQj0O9/VV3PW?=
 =?us-ascii?Q?0DJtaoNeFYg0b32GYNPWRHyhjV1QSKRJLuCtuyS896YvD1vl4CJ5prdlKzot?=
 =?us-ascii?Q?SxdrVPrgPwBLv0HfN8dI+0/a2ZSjG3cmYsFgzH3YrYL2vjAJ7dC2AxUSj4kH?=
 =?us-ascii?Q?3rXuRHZYcqKAUENcSbQnGFt9D/ZxTmp9koH1zOpW5l+N4GiEHnNlJqu3BVQF?=
 =?us-ascii?Q?YeGASACw7P/UqZrk0NPQ8cNjEI/Yo0OYCj/01vKdEd+ig7Pybp/SX7EvE1yQ?=
 =?us-ascii?Q?fChdAQesVvV+V/2G6VKjENufK/eoexODEGSz3QeSYA2SuDZXCDn33Ht340cw?=
 =?us-ascii?Q?DQeN5a24OMtwczinAvwRpV00aPOEGJ+tnfX+HjEAaqkXSUE+vVH0MDdttspf?=
 =?us-ascii?Q?5YBME4jPKQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f0RUiop5BHV1oYmr3Uyf9SjTVTlcSk6WasImG2iY+9yrIUyDflKzqBv3bFA8BZ2JiXqrN96Y9haY9bvwEfzdS1cgnBkZE4cuTgKvpdg9N1b4YevJyVFYAvbO3XL2g6fSNCuECX3hQUNFAODUl4/kHhjjEHyZNmeGF7lOVkxoWpnZYWS9axBom7N4bX7+IYBVX3GNUuabpAH+Zq/MVFDBmPadZamt3gYzAoJtwx5gdStxJWugzFT2RMOwpw7XsJdURMWTwRdtIruCci9ZlioFbs7B/BNGv8IyeyXzmPMSEl74/0+y28yvfYHfizFbqvnuCH/MBjCsaDDg1jxUh5v5YQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b42760-1527-4a6b-26cf-08de9e9f50d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 05:40:22.5874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zqa7GkHC3fPfP+zABn6zj5d6svUxlMPSacUv1pevN5iyxuu2CQb70Ydn63NHirfhGqvnZzBJSK3EmDZNHSnWfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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
> Sent: Thursday, April 16, 2026 9:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t v3 4/4] tests/intel/kms_pm_dc: Scope PSR handling t=
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
> v2: Keep op_psr_mode assignment explicit per subtest.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 8138933d4..423a5c4a4 100644
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
> @@ -658,17 +661,18 @@ int igt_main()
>  	igt_describe("In this test we make sure that system enters DC3CO "
>  		     "when PSR2 is active and system is in SLEEP state");
>  	igt_subtest("dc3co-vpb-simulation") {

Please add the below changes intent to commit message also.
Apart from this, changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

Regards,
Pranay

> +		data.op_psr_mode =3D PSR_MODE_2;
>  		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_2, NULL));
> +					     data.op_psr_mode, NULL));
>  		test_dc3co_vpb_simulation(&data);
>  	}
>=20
>  	igt_describe("This test validates display engine entry to DC5 state "
>  		     "while PSR is active");
>  	igt_subtest("dc5-psr") {
> -		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
>  		data.op_psr_mode =3D PSR_MODE_1;
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>  		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
>  	}
> @@ -676,9 +680,9 @@ int igt_main()
>  	igt_describe("This test validates display engine entry to DC6 state "
>  		     "while PSR is active");
>  	igt_subtest("dc6-psr") {
> -		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     PSR_MODE_1, NULL));
>  		data.op_psr_mode =3D PSR_MODE_1;
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     data.op_psr_mode, NULL));
>  		psr_enable(data.drm_fd, data.debugfs_fd,
> data.op_psr_mode, NULL);
>=20
> 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n"); @@ -703,11
> +707,11 @@ int igt_main()
>  	igt_describe("This test validates display engine entry to DC5 state "
>  		     "while PSR is active on Pipe B");
>  	igt_subtest("dc5-retention-flops") {
> +		data.op_psr_mode =3D PSR_MODE_1;
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

