Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A0CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 08:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B2510E3D8;
	Mon, 22 Sep 2025 08:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8DtCqYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A6610E3D8
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758529143; x=1790065143;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xx2sprVd7lAu3yNl5efXJDX0iyAcl1YZafR0bC/c6qc=;
 b=m8DtCqYDFKsrjaYcKiZcZTQZeBiyToxrvUV+nd1bk/OevlM/uUjcNqnp
 Vq1S5cxyJ6zLO+5vwcbXnHC29h7STAJ5fUNmXGBTEkHpSISeJXdeQcxun
 kynRHx92olLwOPjQouMmLdIL+m8MBYyciVDK1nqzr2GGYoa1qeAGCSArR
 Qf92+4lNXr/J0jBVWhR/l6H1feHBBZXJ7CmgtmMcBP34PPjY650ppF1u3
 mLLelYzvIlfYe6UxB3+QeWP67Waq9TIeqottf/Q7HgDKiH7xY7qoxjGHQ
 eAUP1r7wR/fJq7ar4tGgiRkSB+hAchsqRMhszXOtv7epU33oO3FfVQirw g==;
X-CSE-ConnectionGUID: a5z6LHJMRDSYsaiBMv/Lxg==
X-CSE-MsgGUID: zEojvjDRQQetGcB6G1IOPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60481300"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60481300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:19:03 -0700
X-CSE-ConnectionGUID: psrkG+pvSHizFwmHVTgpag==
X-CSE-MsgGUID: j+lftKeoQ3mGRCdXuW14Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="175549682"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 01:19:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 01:19:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 01:19:02 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 01:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUP0KYUh3ok7ftx9muPXO5+Kj81MPingA2xJRoBomfAYopA0egkum5HdBnrpNE8ANsKVJCYLobp4Q1RuUO08tz4Qu1KoZhM55GmkhRnEfBVD2ZHWuk8yAZrj7cdKfL9wqGrkMdH+hV16aZ8P3IRZ253yr3h7dOeslrnie58y3Cx48fnMj+AapLSNihZdfqYlblm+XCEthn6uzIMP/MpnFKtv2qNFUh1lO6ThEPoscpwg6aFkvfPcknGCSKm2Yzs7grSL9qQbJl0DhlCLb4lWENhhsqfTeG7GZ7tLbZ7T+AsZ40zeWJ/S++AlF0W/6O6BA6nJSZ5xybmr1mdH/sSbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pje3yXDpT77j6flaPw0NfeiSsHp6Y3M7ocr+Dlp8jog=;
 b=oz3/Q4k5Y9Y07xiTcKQD2zZ42bMXqcYJaUeEh663zKX3469PAPdrqZnkHGvOVgUjFKGsilKm0w8GK2jaOYUO3bWp3BTQ2o9ef3Wc6B7dq9fpoOKnYi+UT0dO+G9UIpASsmtp8JWlcHvjAhRPH6waPqTySVS98jQ+ExyF91WuCxb+KZys85Ra2+m/YaxF9e/avx1OyAHEoVPflbHZurD4zB9SLMYyKX3fcsYCQdJDAgn3A03xgTtuBBPucRUN4YxvIfE5yqGMkvAfu2mhwhJOZlK6gZsOLEwCeOsmt4I9f3TiN0Z/WFJWMtyO1Ye+AAtt2XfiNe5ICqf8MZqYV9gQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:148::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Mon, 22 Sep 2025 08:18:58 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 08:18:58 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
 connectors
Thread-Topic: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
 connectors
Thread-Index: AQHcK5J7+IkDJGzH/UKTgxKAh1ZlArSe280w
Date: Mon, 22 Sep 2025 08:18:58 +0000
Message-ID: <DM4PR11MB6312E141996841D9F162969F9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
 <20250922074401.2494339-3-kunal1.joshi@intel.com>
In-Reply-To: <20250922074401.2494339-3-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB7761:EE_
x-ms-office365-filtering-correlation-id: 331687fd-9c75-45c3-c86b-08ddf9b0ae3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ifu/K73OoAWQcuqMvfv0UQVwon4Qs4ojdvgsBHJfC/sDM2f41aGj9U9y4PuK?=
 =?us-ascii?Q?UmFTpPN3q4wli4OzMqY17ejqJktLhNGAPVqG45Kp/c0x1DUkzjG1wNGdV3Bh?=
 =?us-ascii?Q?YQiLl0t2591THxtLoF0KAYXjJ08G/E7z8dmOLw8XhSeXtm4l1IENuVYn7lR8?=
 =?us-ascii?Q?MmOv4BcZw3Js7SzCXBrP9zJuz981SWv3VRa/uimXSvtkNumVoTIbc2Bo8yAl?=
 =?us-ascii?Q?kNPoMhZX3QF9SsWmWh9l43C4K0gz/rwzZ4x3zhI9Pgbsguk2v8V31RdCXLYf?=
 =?us-ascii?Q?0r5us+mZgnNJ1qzsmSCjt+BX/JA7bp2b+h/pP15gn/Ps0QYzCKWIoFgUxKaj?=
 =?us-ascii?Q?goNpcn/ov3vdvA4New/GceNNkAXzp3WFJnf4tSspxSFM6OSJ19eCH9pZQRJv?=
 =?us-ascii?Q?dp1ptuVPe4qeqq5BR6tiaoqoRJGaivKf+gpcb2BaC1ek60xdO/B1yfsZOX1t?=
 =?us-ascii?Q?nW3BhhFfnJBPcDAqX041bKx06okrtaQRz4iUQZMlsZLD1V4h8akXImMhbqxV?=
 =?us-ascii?Q?flMbi5G71hEwm2qxar6zCqE2U1QxuUcQOwLe4A5Ddmcf5OLJ9oq9Meg/7xuT?=
 =?us-ascii?Q?cyrs+CH8Z4abUr+7nQTXDo3FfkCPiP4xXjEqWA4FSuvEeCGSCv/zSwoLVqOG?=
 =?us-ascii?Q?PAdZ73gJVchD7iDKcWQo9jNPn7WHr0Agm5uDGLT10DqrFf5fFkVAtZih/hhK?=
 =?us-ascii?Q?SdJHFaALOVPrUdwdY+yowZdD03/BkYBtIDhqQggJXte999U2pG1+UxPp41q5?=
 =?us-ascii?Q?6Yr9F59XP22qz+E51zEQKlLZG3Uhttdkx0rTMbrTGpqtbR1Q3PdYEDRCTqBp?=
 =?us-ascii?Q?eUb7dkZyUgbeD9xqm3YLZkf+Qyn4zuBsRieVooJzKzbixuoe6BK92kr+iEK9?=
 =?us-ascii?Q?teY+eKOEi8Jq+7qPRnm8dBdXZu23zyHMY+tAmOXNmugNHJqMYdq4N+FRmIvb?=
 =?us-ascii?Q?jlhYwIt2QCFnlkuQNGc7a+vHTagwmkm2polMhfMl2cUa3wpoBGNINrEMTNcn?=
 =?us-ascii?Q?9zuk2tBgSHVZMajV94BMjCsgYvTeQopLBgHOsMBdVL9tD6MOgAmGKD/kqNOs?=
 =?us-ascii?Q?5erLyM0lJ4nntvBLpivKSN5ik1F/cFZfLxdEj9XzZQSuQgCkiXnp6j5rASoM?=
 =?us-ascii?Q?bWqwENWm8KUchHdZo2V9HpB8z/DcXv540WM9v0hX5+gNKam47HVF4YwQgack?=
 =?us-ascii?Q?Ko2BdJBOMPS0sOFF7/wSAS5MkoPZsJ3W/81fe0QGaekMTBVJ82OtZSYJKK2R?=
 =?us-ascii?Q?ljR93/n9tLfL02sWx569Yhq8Ck3WRTAYbJ/MFxv4alj1/WhEseIIZLKBriJv?=
 =?us-ascii?Q?TlzsT/0YcW1YSFeappPbcdspeMJ6bUzj8fuU3pcdw3r2Xmoe8Vgy7xIbQjEL?=
 =?us-ascii?Q?OujYI4JwMYIJiw2PRXaKKKFWkLaHvCI7B7hW/sb0aS3/4Ur4M931Y/2XvEk1?=
 =?us-ascii?Q?uCcdbkL6cKBpAXcPK5TEoPQtnXsK/a6TdFUQ8XcrpMl8b7l/nHZcWQKr71fx?=
 =?us-ascii?Q?fU7wtp4CLwT0srM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4bignNn9EFXDVvdFCe4Ph6aJ+g//248HcY7r+IC6qnQWj7D94c7+xo0KEf3w?=
 =?us-ascii?Q?X1Ejqy7GNxjh28DnBOR1BmMzvqoNcA+kbnlqbdS4Pw8WSh16vgS9ZIO19Cd8?=
 =?us-ascii?Q?JpHhJ5Wk9/z78LC0sPDuegYDK28JhtH+Kpj4A95ipFeBqefq9F1dfJrUUtbo?=
 =?us-ascii?Q?QZzH+CIIipJwHbD8B9OJjhULf8eUNSj57DT1j8qYUVWCEhHTZxDXjmdgnhJt?=
 =?us-ascii?Q?6aPLVxoiVzqAokvLBvcxyLo8eIZkOKaqpGds8K5YR+jKkzMK6g+Ui/tnKG5+?=
 =?us-ascii?Q?mPM99iToCSUvkgfa5Wd0mZf0PRGBlGaid3rfZwWwErj8Uxbi3NwE7O3koO1R?=
 =?us-ascii?Q?0TDpCGAWlWPIG/yH2oiL+cGl3qN9s8Fkv1CtczgfqH/bEHXRRkB3V9nhZUed?=
 =?us-ascii?Q?JKHMdHbricKcTAulgFZq+4f+iDpjiGDEzjFYyJzk0wCQH4OPfCQUxMuWzfRd?=
 =?us-ascii?Q?8tRIgfP2yFILci7HLC45/XgIkjnm50UM1B/mesctONZCFLFcyQLxlTJfxlbm?=
 =?us-ascii?Q?ozZ9mwHEavXPu97XyToW/hioB6TP5xNpBRB43wxV+EDKrOhdDvRW9obLCF/5?=
 =?us-ascii?Q?ey3WVD3V9s/K8iaBph6QlPQaLduE9SMAJhsLa9eaWnpeVcz44EVTE8Y1GD/j?=
 =?us-ascii?Q?hkFVGUP2rtShdaPA3+bahbGFpFGBU9J5jzwAPxvnmwIqHuk+4U1NLnC1VRLV?=
 =?us-ascii?Q?5txQULGjAwXXQyrZO4583G//5GVrbFI0ZC4UyIUn3PV94uzkNJrrSan3sScX?=
 =?us-ascii?Q?7HNHpykwyJwkaAdSr69LY76hdSuoKjIiHzg8OPTHk9Sqo7e18xnf/6lpONWf?=
 =?us-ascii?Q?bagjYyCEW0xw6pgiFUbwdzMCZMgZrDbYGCY4B85Md/PxasdWV3vcvfp/y5ur?=
 =?us-ascii?Q?AhLieMl9Qi0TUCwjuJJ9fIstuv7D7F9V5qSFWzLLIHUzMKABSSduASFBZm5B?=
 =?us-ascii?Q?WaRxey+U8DDg3J67Vd6mVb62Ahq76yYwr34+99wpX0HXWXc2H06xfeSwWbdr?=
 =?us-ascii?Q?xXSNibADRrP4yKzmrYcIaVmDSFgrH0S+x76VKRFVbS6+TFSBGgLmFSjIrxp3?=
 =?us-ascii?Q?xPIfJ47WdEEKvOH0YQqbydi76srp+t7LRAzJg+2OvossYUwO6b+fW07rjNVn?=
 =?us-ascii?Q?ZqyMiLj1PGUiroGLDIsuwodrZ1qymYEQAVV2zYcG4jvgO3EfM3E+gIlQhTAH?=
 =?us-ascii?Q?2ZdBvkptCK7AVZ6xtvlth6MHCd4kXLPwqr6KeyU1L3CeTIBCrL50+vLW07HK?=
 =?us-ascii?Q?2DHbMFCQMjNkTccr6Iut3yD9N423wF4lxnEaXcXHqhpgHKP8j8Ihy2jL8p63?=
 =?us-ascii?Q?WZ1qBw2B/8Wq+1y6JwEOdCMRhmjVPb1sH1247GJb3xOBMZgeFET3xBR67p3t?=
 =?us-ascii?Q?shz22JLEp695ew2N3nxxD/PWOqElkBOmMEPVxGkAqgmbvtt/fImZKP7ij/1z?=
 =?us-ascii?Q?54WcynIF00MWqTyCm3bXOExR/1E3zAiwlBgzYfS8Ct6nI6zpPnr8h5V/Nspu?=
 =?us-ascii?Q?CANcrrOiyWJrQfkR2nscJRkouijf/OyHEZZZ7mGIY+HRtgoMeemAtZkakRwO?=
 =?us-ascii?Q?Z7zyxvsXYTUrwENmv1Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331687fd-9c75-45c3-c86b-08ddf9b0ae3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 08:18:58.8799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EE12WEzzhLpoxyeCSPdO4o11HZmfXDVPjTk8ofPiyZq9qdzMa987guHoubjNzRbDkQsFJAh6vNuf8aWX20/ePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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

With ack on patch 1. This change also LGTM.=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>=20

> -----Original Message-----
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Monday, September 22, 2025 1:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>
> Subject: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
> connectors
>=20
> Extend lobf test for all connectors that exposes i915_edp_lobf_status deb=
ugfs
>=20
> v2: add new line (Jeevan)
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_vrr.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 233143770..d47a148c5
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -948,7 +948,7 @@ static bool output_constraint(data_t *data, igt_outpu=
t_t
> *output, uint32_t flags  {
>  	data->debugfs_fd =3D igt_debugfs_dir(data->drm_fd);
>=20
> -	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR
> | TEST_LINK_OFF)) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> TEST_CMRR)) &&
>  	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP) {
>  		igt_info("%s: Connected panel is not eDP.\n",
> igt_output_name(output));
>  		return false;
> @@ -961,6 +961,12 @@ static bool output_constraint(data_t *data, igt_outp=
ut_t
> *output, uint32_t flags
>  	}
>=20
>  	if (flags & TEST_LINK_OFF) {
> +		if (igt_has_lobf_debugfs(data->drm_fd, output)) {
> +			igt_info("i915_edp_lobf_status not present for %s\n",
> +				 igt_output_name(output));
> +			return false;
> +		}
> +
>  		if (!psr_sink_support(data->drm_fd,
>  				      data->debugfs_fd, PR_MODE, NULL)) {
>  			igt_info("LOBF not supported\n");
> --
> 2.25.1

