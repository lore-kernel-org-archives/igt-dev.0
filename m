Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1487CD4F54
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 06:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC8E10EA5E;
	Tue, 19 May 2026 06:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJc7ezNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7996610EA5E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 06:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779170668; x=1810706668;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fJAOFzAu/qfyHqBOBvLpIjNw7fKZgY+s2OUA3DbwnU0=;
 b=AJc7ezNEmIsRLk3vqGewuw6jiOBVIHycqSmKbRT9WR+2S7hfZHf+Yhyo
 KAr9D4exMWrMa4sh6xO0qz+pPcRRFCNzPr3yTrNJZuRN9MFRdPVZSGfC1
 ucqS+BNMh6gBc51+NfFKielKD/FEo6SDkgzhYn0pzNoigqdALbFrcl4Lh
 VPi0tKkd5s5PymdFV+cRkjIM0Tvxc+eHMlEMoFWzYs+T/wwuVBl1ssMkz
 YuvGixdVSkaU8mg7sdgtqR/nR3KaSHvOvTTX/glQUU+4WvFlV2k790tA9
 5lVag//bGwSoy/R4FD8EUiWeWVp5Wx/sC2ESThfJjMTQL528WKmFHuScV A==;
X-CSE-ConnectionGUID: v+V9xv5jQbiEQwNYrbI0yg==
X-CSE-MsgGUID: pfg2eAg1RK2aiPAiB65clQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83916167"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83916167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 23:04:28 -0700
X-CSE-ConnectionGUID: KK8/mOXWS8uEjwKsBbv+OA==
X-CSE-MsgGUID: pxXvnJQySgWCGvuyHfx3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="243646194"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 23:04:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 23:04:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 23:04:26 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 23:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA7Jw0E/9Cxpkg/lv8gQWyimHR3bJgwY5CELz6LvnfkWrV4aq8ckB1Sm03FpwQOJ4p2iyG6SUWAIt+1EndvOIrT3lk+8elZsNUMUL4TJpX5BzjDXbOQ13+njKWXUbciYiGXSrLsglcqOB5lONz9OsY53YThx0R/ucVuj1f6lhdoC+2gJAREfd43UzYVyxYFrp85omoy7CdslGkYIxJRityD4zFAPjVsny/cVlb7evxVk7Hnyy63rekosu+hzydpY/+OQo4xYpFhFrCoSPvHsproAd3Qcg0Shy6QrVejzjSsMFBB8MEpueg8Say7Y6uGNfZkikQ0UDKUjhRxZLrtNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YABM4NnGtarKO8wuekilUOXbzAWp/wmLvUWWOk1a/CE=;
 b=AtHn88SytLRcDgGVgHv04JdZMwcDc02pgzZ67iviKDnbBT9d4ead6aEH5eBQ/pzTYT5hkXL4wrIaea8MJs+P/k2dqjPOM7cLBUMn5MMhmqK0P2xmexTtTlFdcqMrMsNf/RXtXN3vd5tjfnq2kkrt6SMCWKUHAwIDhSAvJVaKK356KvWzIht/Tz+cxZCQulTrBsGscWF/DGhs7nln3Zy6GyBtecOjwuKOGPCIPYbhLlr1cucVVn1biFZatcx4bVyamfnNs1ELuZ3GgkA3zE41K16VKOyM3A8sS0OYkMBVQXAJ/z7HArPege8J+N4J0WckSSxEx1L2GrKUJVowiLvZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 06:04:21 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 06:04:21 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t, v2 2/3] tests/intel/kms_sharpness_filter: Add CRC
 comparison for positive tests
Thread-Topic: [PATCH i-g-t, v2 2/3] tests/intel/kms_sharpness_filter: Add CRC
 comparison for positive tests
Thread-Index: AQHc4w11i6YErJHwQEWQ1tZjGrZG+7YU5H3A
Date: Tue, 19 May 2026 06:04:21 +0000
Message-ID: <IA1PR11MB6467702FCF0400A53AF9BCB8E3002@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260513191732.2420879-1-swati2.sharma@intel.com>
 <20260513191732.2420879-3-swati2.sharma@intel.com>
In-Reply-To: <20260513191732.2420879-3-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: 902e1b9b-92ff-493f-1c39-08deb56c7841
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|4143699003|11063799003|3023799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: oRfvgd8OozuaCDfUmkufLYapNyDsDovvEn/WiY2M7aQ3xcIOkQs9gn6zFTe79rupXr2FFs5z8uLWIz4NKlGJIB6b3uUZDuZe2tjHjumGm0oqUi/nyYB8PdngRlSCPh2D5rsird+X517c19tA0R7CQ0deRHgWVxx92HJIkOw8wPiCvKEeKcfv9UYWnyzJEdkwo02Bfe+C32B2o4GPA19eroGl/mB+Sg7djYsYuGS1dETCD+QMvkMB73u2BvMTam2Kd4fBw3s+QhtHCDMrPj57V2SGDmKNbnkAHOUQEeH6gdV+PbtMJPBB9pb2dm4txywSgd89JVf0vPhritwoFvcoEvguixUGm7JiP0yPgopmOBkJpByC6oohfaJVN6TXyXX5LWa+uVX6OJSA/bDfhqqwVZUwxzN99+AiwR6j9MUQZkaj/rx0gZ7D3cBGQ1bz+Yg/y9px3wPhuXEAKzYWcTBV9wDcLTXWQQbv1B1CeU0Ob3xthJcLrdwF13ZPf5v41mESKeuZAGEwjRjxCf35n3To0dW0A1NfObXqOFhBjf/l3UwOlJHRwQEiZ6CjGRVncnqPd7LWYy0BOxGnJkUEGbT0OoQfAsqF+JTAdmMf1TVhAcpABo4MXm/w5Y6EZNePvRh6j2uLO+qHSTlNTQBqupgrYk99grbQGIxU95NQVxtNPi7GsB3kxalES9VY6zwdsRcyjLBq0/wAT4Ne/QBnplehWvDT+TZXJP8A/rFh+4mG7L+zPHL5juzx9V4tcZ3CARfh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(4143699003)(11063799003)(3023799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k6l62rT3Prus9UMQ61R1Cos0p4HFfDbjakosdDYnwJL4/ulXCADKosxpQn4K?=
 =?us-ascii?Q?LaGeOV6UsdoPTJ93gJHtahDy1PLT0/TDNSbKz0MfErp8zx7nbttUEPYXBlcT?=
 =?us-ascii?Q?upZfTC8EhmihTW8BS2AEYX1/S/MrLnKZvNC+JYpqWyY9KiQ9C/6ewi6lYU33?=
 =?us-ascii?Q?yn9xya1jJoanWK5TEQSHg6Jzs3nM9QsxILZyY7yKCoNdbPBK/KRdTKuWB/UR?=
 =?us-ascii?Q?fOEtxoLZapv5g2YkGjfpM38x/rs960dt/OBaLEo0U7Hi/mFlRntSjd4V/6DQ?=
 =?us-ascii?Q?lOA7ChzGxBjX9CApvJog6yz/UcJwsP1FojNvSpNUmx8ieKXyA5Ut+Iydd4cS?=
 =?us-ascii?Q?syHM4VnWrH5/rHpcEfI8eNuWDufVyyccbMwauKsux0wlGzlry/HWYF2fd0vc?=
 =?us-ascii?Q?z6nfwMfs78d6NTm2/1wTYemfbJjqudqMyHYhXv+b3fHHxOadUEz4bxqZ1rzv?=
 =?us-ascii?Q?LMXv8i/F36pkItjJoRatMdqCKFQuyd9kNbaPEWoxc78Xdwma0zZRWdbfZ42z?=
 =?us-ascii?Q?DsLIyTUNO/gd8xDEfH0+8wSi1w+9cuxWVFgNrWZ6k+AzqJFBFf548iuOldrv?=
 =?us-ascii?Q?JvBJnEYGMEO1FG9u1Ij1p5yS4/WIIJTQtKIDHTDcKxdsrYR8kE/z9lkMTFEX?=
 =?us-ascii?Q?1OYkSHN6SQPKYudtjpFuIeGe/G+YASQwM1Ykcbpo+MrGk4jWU9aHLtyfmaxs?=
 =?us-ascii?Q?k4vFVomJYzsw8xULn8LCaPrR/yq0L9frBNRG3p+twU3QtHta5hOFcWNRC6yz?=
 =?us-ascii?Q?OTMYC2u3o4RyZV0GoI4SsNpvzj/vdP3QeqE4HM44l6+fD2VHeLRte2lepYNi?=
 =?us-ascii?Q?6Q+rT4M3XuyoJnf7CtBsGuw3zA++T6buYylXSjdkjHLHDr2SEW4LT3jZvdj3?=
 =?us-ascii?Q?Ex1kpck/rq5BxoObjfeLGrAwKBZxRBLkLc7E84pPYPn22g+SsusOoNKObFmf?=
 =?us-ascii?Q?0VKInt86X5aaL3v4gKmVd0ZhTDFYbUOhexxYzus0tXQ94TOeKAFUHe4hHbYs?=
 =?us-ascii?Q?dQ9J1mxn59KlvzNePzTVq21VH5M1FBJtN/8avRlSp/E1s+dlhoYbn+0eY8r9?=
 =?us-ascii?Q?tIG4IgZyK5wevgGz7XgnzxpZiQ5OZT3tLYJMjAmRLxfGXKqabeRp3RDwNw5m?=
 =?us-ascii?Q?Z1ZXnPHQtsyXYvyfpeSeEqs3F3ku56svIv+2xZkrB0Kdc3ElQTvRt6enFiWp?=
 =?us-ascii?Q?Ffav9JhEeUBBXzTgjkNpC1rhsVA/F9lMuSbT0WgqmJLKsH+smayn0zYFO4tD?=
 =?us-ascii?Q?kSloUFiMtb6plUBMJJRugg9/bD3OYjGxvuoviIfSfjNv672FdbOpsX3QSW8x?=
 =?us-ascii?Q?SN402YecbelDBnCrwddQpVDEqha6lPyaFNUBF4ob2LAuiDjZyBDlxSBLhhkU?=
 =?us-ascii?Q?SIpM5ECTGpmwJfgpqUE+0KxjZeONyb4LTE/uyzL3sJ6g/GeM27jS+eIxlveH?=
 =?us-ascii?Q?EVztroOMuM/HWnDdwXcUXFqQDEMVBI4+nYin4UHfjIqiwlUUody+EDNVQwyB?=
 =?us-ascii?Q?8dpJ+Ya8nyJCCm1B7EdullMqsGdKXAa5oeOH8tsoK6D1UQEznfffJowWGp5V?=
 =?us-ascii?Q?dlXRuSAfaKNkCD3PNA33Jjwy59b1oN9eI3HnAkvd4xbG5B0Ql7XVNuUPq4S0?=
 =?us-ascii?Q?hFV6WL/teSCJ+IgpTdaPMKAgK5dwkKFQjOAOU3CkhzPFkBkZ8OQT1cBLiO1x?=
 =?us-ascii?Q?gLqZQNEHxXKKnUetaKzN9VahHYyk16YUdXTWILpfiKdoSgc/QOR5tMb3nrJC?=
 =?us-ascii?Q?5QYH+dmGUQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hnu2L47gor0uKgMTmHPbKdulXqpEaVVp75Vqk7M8hl7YGUoDh0LvmnfXWRFDl5BpIp2zrDiQBnX7/Nb8GHy3pg5zrHXDU3KN43gEybNWYxqixnzRgWfnmtMFSBSuRVsdYirypeR3zR9cRu6lWfLcn9tEjm3I5A5ehqPVUC6HW10+y/ZcH3aOR1VBfCgWNnhCZLibqDOlBVhRLnS5MzXXs7BSvOz39q9z+apMCjHUxSej4okkdkD2cP+Fq6+O2gTAoFIiVjbVdjQ+u7oBbpuFjJ7RXAtiI1KxDijGMrOTQDehLX5NCNztPiztulKJwRNsZwXL5Rwip0SZV3t+peLq+Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902e1b9b-92ff-493f-1c39-08deb56c7841
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 06:04:21.1249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: isk8TB4vYxmzB92mklETS1Q59+cXfIXeky8Wijy6xt4IEHwyzW5xYHu6BKqIkjxC4CfDdWMv9YguY0l6hJUD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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
> Sent: Thursday, May 14, 2026 12:48 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t, v2 2/3] tests/intel/kms_sharpness_filter: Add CRC
> comparison for positive tests
>=20
> Restructure CRC logic so that the sharpness effect check (sharp_crc vs
> no_sharp_crc) is a common verification path shared by all positive tests
> including DPMS and suspend.
>=20
> For DPMS/suspend tests, reuse sharp_crc as the reference CRC instead of
> capturing a separate ref_crc. After the power cycle, verify the CRC still
> matches sharp_crc (persistence), then fall through to the common check th=
at
> verifies the filter actually had an effect.
>=20
> v2: Move CRC effect check after suspend/dpms block to have a common
>     CRC function for all positive tests (Nemesa).
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 34 ++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/kms_sharpness_filter.c
> b/tests/intel/kms_sharpness_filter.c
> index 96eec8919..4a7fd6c75 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -418,7 +418,7 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)  {
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode =3D data->mode;
> -	igt_crc_t ref_crc, crc;
> +	igt_crc_t crc, no_sharp_crc, sharp_crc;
>  	igt_pipe_crc_t *pipe_crc =3D NULL;
>  	int ret;
>=20
> @@ -438,6 +438,18 @@ static void test_sharpness_filter(data_t *data, enum
> test_type type)
>  	if (needs_extra_planes(type))
>  		set_planes(data, type);
>=20
> +	/*
> +	 * For positive tests, capture a reference CRC with the sharpness
> +	 * filter still disabled before applying the filter. After the filter
> +	 * is enabled and committed, the resulting CRC must differ.
> +	 */
> +	if (!is_invalid_test(type)) {
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		pipe_crc =3D igt_crtc_crc_new(data->crtc,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(pipe_crc, &no_sharp_crc);
> +	}
> +
>  	set_filter_strength_on_pipe(data);
>=20
>  	if (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)
> @@ -460,11 +472,11 @@ static void test_sharpness_filter(data_t *data,
> enum test_type type)
>  		ret =3D igt_display_try_commit2(&data->display,
> COMMIT_ATOMIC);
>  	}
>=20
> -	if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPEND) {
> -		pipe_crc =3D igt_crtc_crc_new(data->crtc,
> -					    IGT_PIPE_CRC_SOURCE_AUTO);
> -		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> +	if (!is_invalid_test(type)) {
> +		igt_pipe_crc_collect_crc(pipe_crc, &sharp_crc);
> +	}
>=20
> +	if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPEND) {
>  		if (type =3D=3D TEST_FILTER_DPMS) {
>  			kmstest_set_connector_dpms(data->drm_fd,
>  						   output->config.connector,
> @@ -478,10 +490,18 @@ static void test_sharpness_filter(data_t *data,
> enum test_type type)
>  		}
>=20
>  		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> -		igt_assert_crc_equal(&crc, &ref_crc);
> -		igt_pipe_crc_free(pipe_crc);
> +		igt_assert_crc_equal(&crc, &sharp_crc);
>  	}
>=20
> +	if (!is_invalid_test(type)) {
> +		igt_assert_f(!igt_check_crc_equal(&sharp_crc,
> &no_sharp_crc),
> +			     "Sharpness CRC matches reference CRC; filter had
> no effect on pipe %s\n",
> +			     igt_crtc_name(data->crtc));
> +	}
> +
> +	if (pipe_crc)
> +		igt_pipe_crc_free(pipe_crc);
> +
>  	if (is_invalid_test(type))
>  		igt_assert_eq(ret, -EINVAL);
>  	else
> --
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> 2.25.1
