Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475BECD6E74
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 09:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39711A691;
	Fri,  5 Jun 2026 09:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTL2zlp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC4A11A68D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652575; x=1812188575;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=atyb3sNjOT+UaS2OpIJKRM/XJPi7nbfno6+j26D/mUM=;
 b=LTL2zlp+raticDUKnXrcoiNMtGKswkzClC/KtXws7UXtcuQ80/oBgo8c
 8VNc93w7uHSu68kOuUw2bvLbuskKwruT08OgHERAen8gF06sgE5r9X0I2
 9kFIkohTqinRdCSmP9VjD4C3eSRLr1YDdiz3u17Q6cJMP3c3yPmPgALbR
 pIMhB+SbLuxRQ21bHnIDC68PpCOyvAME4mIcbVXLDGEnvW3Ba2RliUYP3
 LHxQM33L+Jcn6x6Uvn0XmPbl/hJWbrT/nOMLzGCHewrYxsbHZPnYvtpjv
 GTLpoMlb0At7A6QCMSn9V24zJrC05yU4K4zWt4HiUtPxLEFa3DIGjshlh w==;
X-CSE-ConnectionGUID: dy9mVxYFRca9LlbrB7n2nQ==
X-CSE-MsgGUID: bvn2ebLpSB+N9XLjr5it7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92169864"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="92169864"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:42:55 -0700
X-CSE-ConnectionGUID: DA20gTgjSQquZTXeHL4JUg==
X-CSE-MsgGUID: sTezbsjvRKKZtyZmqJlX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240611826"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:42:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 02:42:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 02:42:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 02:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWrDvU79adjwUiul98YFcRPF2kUYbBgt59M9FxRew/qbDSdmF4y3jJRyC1rHKddnaiJcnPbS+Sote7ZiUDG65yxeeqPJcVesrgAY1Pug+ms76TyHT5/j2MgJos14iViMGtN+iIXPtX8cwIg6a7DV1r2Lzgz1IYr8CIqzr67J9BJ+gxrhvvPjdXrLz+I53KIYH7F39kU9uSECU5hLFiAVmUZRnvDSl1Kbz/RanEOPbNaWx7cWK7izljg0hKL7XYl64soVcHcQGRE08VLsHtcGYRdI+DFRBhq6msGJ+HATfcdoOGR96VHJ6A9/qzL9+S1XvKKCAfoi3goQOYA7zk+EYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IEdaoDn+QVCTz31wdEE+g1u3sG64PoRZE6HraxI6DY=;
 b=IcaoKz97rZqeDTk/ExQUJ4epzRndpy6pZpb0LANVHWzohZCAuSyvoPbET4BCvlCDEFhQRYvjLu2gIYPYxPDb4fWvujcrC4GK14gi1e7uN9qYT2JUyCdP4eo1xyMf+HneIw062nlB8qKbU89jlt2OA39MBKTvLaoTTe5/VONvfbdlPE9LFqb6jjUvKDJt6+ycJAkEJaZ1pmVrVKn8fbros/uzIVhM1Tg28NayTlQH+8hRQxR3dnvfk+hGcCxzmcdFUXUwVW5XjOUOFadMTnOttR4Gn5tgsMRAlbL4fJlMyNsGL/oueE2YUxOyTz12N7DtHWp32+2jROJv312FAbG2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA3PR11MB8966.namprd11.prod.outlook.com (2603:10b6:208:572::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 09:42:48 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 09:42:48 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
 continuous page-flip activity
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
 continuous page-flip activity
Thread-Index: AQHctTZGSOQjtq0Z/k+FAERM0xaaIrYwMZdw
Date: Fri, 5 Jun 2026 09:42:48 +0000
Message-ID: <DM4PR11MB6360B64C75FDEDDEC3BDE853F4112@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260316111517.24452-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260316111517.24452-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA3PR11MB8966:EE_
x-ms-office365-filtering-correlation-id: 13d8cbf1-0f09-45d6-d115-08dec2e6cdc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|6133799003|38070700021|11063799006|56012099006|3023799007;
x-microsoft-antispam-message-info: OlH1sG33XnVVdAh00g70TjjKk4I1DC745sZEK6pzk6XSQI2oGIkDqrkOw9/3PBvIfF/9VLsJwWhiZ3++EqpgRk7sAw6/akEziJ7gOGtyG+mwn1gBJMnxOc8Id12lMBeAKXQf/UVxbYkKoTlPat8gOrx+QCdHriTW3Bx0t7xC2ZbP/PszLC0ZTx2TBsffryr1NXrCcyoKaeoP3omkaUtRwlZjLVIr4JRVmZXWl1EkGoGYivmffHdF+enxYxMWnc3I4gsqsRhb1j8VZLd1TU2gGy5XDmvoUI9jbPYCe0Gnth06TOBa9I8PZuU03FMf7DEPAKJv+i2h/bVY3hqkdMEZC2mq6iygParHxBBP5W7SuzV8xJPXdWb0XKZnrC3Q3K8GQyocOg9AdH1+X55jUCf07qCuEEvq2NPMxelDJUtxNx6ZRcyRklRAvf2AWrnul4dChBdLsaeS24QOin/crkO6uuZBg16QgtEP6xT4HGerkNSgGMJoJnI2EiH1UX014h39FxhipNCnBCLhyEFCIkH7b8ct/VkFHlimosQcqDe1zGYNSDyFItrwAe4Kgwd1m1dW8Dh+mw2EcMiraHhT9UMe0jwVSyPkfgzscgBksyUNw7EGl5SFb0VuOhstyR13DuiUhOIrIR//7Np4cBeNc9LEGN41PNAJeU8Uh4pS+DqKAlkGWK3auq00Di7as9xwcQ7rYwKjtSWryeRHnMbTF38mF3BD6MGzTi6Lp2HvR7/26Xk03eMp1OcYHEuIiwspy9QD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(38070700021)(11063799006)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f6I4vJxp1Xvu6pJOHVgPf9WfWduDLuQHMegiKtOxBOFYLoNeGgzT6MUzI/O6?=
 =?us-ascii?Q?7illgjLZq7Q5sYnub0VercesxYVIKOr1LEN/oc7BgcOj6TxSj4TK32l0gtfn?=
 =?us-ascii?Q?lt5G3kn3PlQL0zI7CpeFwSktG761pEzu7wHhJiH0oBKbvB+/eH4AP9K+kUP5?=
 =?us-ascii?Q?ZzrM+0F5ESUqdOM7YMiFDqTkIdOaRXq5ytWsBh3F0nRM4PQDq22IanGIEuBL?=
 =?us-ascii?Q?DEjMwFMkMgG8AOw2U2n22kGxQdSaQ+NWCilkI2vA6bW4rYldwTUHyN7XepLc?=
 =?us-ascii?Q?oVSiTWxQibOkXkndeXBMPMumCOh6t+rP1YrmwZNsvFTXqyQPEp91xa95E7p0?=
 =?us-ascii?Q?v/JZz0nfX7DthezANKuFYkOg9toCV9HWZqCfW+NCuUkYMPdUxoT4tI4btwsE?=
 =?us-ascii?Q?alj24bsHpWvgZT0WI0n9NRJhawG7sUtUiS77Ewm+GHUSjt7WlTBh8R3+my5f?=
 =?us-ascii?Q?WIAr4rHOtIWtMmwKwqfO9tZbeELApaPImBbYKKb/kew5gjxEY75sdfiWleQt?=
 =?us-ascii?Q?e5OOEB7iMWz12cqhT8yqB+hC/wVVqlfBbdFBHqdNmPlRAg9c29YOcU+0kN+6?=
 =?us-ascii?Q?w4XmwUk1zmJ2f/wBuQZZgkx6/Qd1yoffD8z3isY12ux576QsR5ZZgAPrV0sX?=
 =?us-ascii?Q?gj8TZJIqKGvUdHp0R9cyj1dEOChENwcNcrxOxjtFbrjF5q4lH5Q1rcFZE5x5?=
 =?us-ascii?Q?VvqitK7QG9pJQ373HM7W9lqNIA9NvA1HV3rMFigrNJnLldZRdKwsV+KXu5DR?=
 =?us-ascii?Q?RfRG/113h9hKBZIy+QlHdZBGg4kkC1X4WUhc5tBb2hnYv+GF5Nl1IrCEHzSX?=
 =?us-ascii?Q?Paszajd8UTJzsQEPL9Nd1y6y1vpYzMyAJHjnEiC6pm2tUeSeF0LOtFGhvCG0?=
 =?us-ascii?Q?SRZaoFFGETqXWyrEDniIwVP2PXI+GSo2KGfmSxrdai+S5XFSuFQgHZggtJgc?=
 =?us-ascii?Q?qm/clK6LTfQu/cVYubkBCZgvGahp7PPoH5WdQ/HnYLWWSt6T05jViZkZJH+0?=
 =?us-ascii?Q?CAb2WHZlEpcIgshG0am1ubIY55OqN1wM03MwDRQGL7mqV51Y1KyeRMOfcyiv?=
 =?us-ascii?Q?Wh82sapiTcFKsLUkjIIDxTIoshkIfIV5DMuGz8sE1yf85VZ6jtPkt7U2B29L?=
 =?us-ascii?Q?6P56et3jrrxrcQ/wZP/SpohNMH/R5+JJKjoAGKKM+CXURkkmwyEoFBauAeQ9?=
 =?us-ascii?Q?azMUeNqT9PPbjJttbRHIFclJvqy+OFx7/jlp2/hufFSr2ydXEH5I3AJQWByx?=
 =?us-ascii?Q?qr1p3jSq8SWrkToSCn9zq2k5P8lAetrpg0Omv4HEHpMEV7HBr8phAQzSWziH?=
 =?us-ascii?Q?xOnKX2x664MDslH0JHE3V7/q6/O0f65ayF6a/c+YwzyX/TlchPg68Gk0wuid?=
 =?us-ascii?Q?+i2IC2Qe8Goy9uCAGshOFyee4WhQv5+q+ThoTYzhNrtVHugLlcuyu8t7ZfRl?=
 =?us-ascii?Q?9g+HcJEGTwmBMZjMNIrKobqHUyvE5If5JlE1d8Bu3h1aEIl02+eqRMBbHv7k?=
 =?us-ascii?Q?t/vgo2AV4XeAhsCt6PbtmiHsl5UDTeacp5bqNGu+tkhsN5ePIVtvH0inmF2y?=
 =?us-ascii?Q?i29TNHBfQA2QzN1UoPcy41xVXclkh4BtNHeSOFqRINGyDFYpCJtln7iiieBt?=
 =?us-ascii?Q?g/AxAql9DoAb0kOfbWxs+Lg1FjKUGayf2LplPJryWxOs33rcXrbHxjS/69Q5?=
 =?us-ascii?Q?MpxPbNaw5I9YZSfQy7/hY66FR5Wa/pUZ+FuclUXGLp3i11nNMuCdznZ+z61Y?=
 =?us-ascii?Q?elhGE4Ad0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o4yq3USW3K4Srz6hYaa0vXGoZYYvTfolp6JplZsC9A9pkK7ZPS/VwKM01qZCRlNfws9M4fJqFVcrLqeEC3cLuFHLnGjJyFgZoLTsYV2fDiQERCUb7nkYG463gFZE3Kyk8Gnm9SGPrwRmiQwcKqXZSqJFzbeJx3m/69/kS3/UqkjyeB8x0rs9l3RDnSimjWjtdsgKwfGjwABeu0HjQAWFbP7FQelTYyhzQuj9gK6JGuEp+AMd+USlMcmHOjUGfjJp41qQD2DDyJwNBzyINn/BULvjvDqo+p1iPyqQZHDBuGKRMNOt1eQm4KpQLn1OAa7ueOUl0VNDktLbm0SJsjFADQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d8cbf1-0f09-45d6-d115-08dec2e6cdc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 09:42:48.3606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mfi4nF4A4MGPaS0+TLfZH2xHz+yEETcxkQIA0NK/9D32/Vd4u4JXT4BXPL1B4RyR+/hup0nFb/S0mgb5WFnBvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Monday, March 16, 2026 4:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add DC5 negative test for
> continuous page-flip activity
>=20
> This test validates that DC5 entry that shouldn't entered when the displa=
y engine

Nit: Fix sentence grammar

> is kept continuously busy with back-to-back page-flips. The test performs=
 a tight
> flip loop for 10 seconds, alternating between two fb's with no delays bet=
ween flips.
>=20
> It monitors the DC5 counter to ensure no state transitions occur during a=
ctive
> display operations, validating proper power management behavior.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 57
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 39e94f36b..0d0e09780 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -77,6 +77,9 @@
>   *
>   * SUBTEST: dc5-retention-flops
>   * Description: This test validates display engine entry to DC5 state wh=
ile PSR is
> active on Pipe B
> + *
> + * SUBTEST: dc5-negative-tight-flip
> + * Description: This test validates that DC5 state is not entered
> + during continuous tight page-flips

Tight is redundant

>   */
>=20
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
> @@ -601,6 +604,49 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");  }
>=20
> +static void test_dc5_negative_tight_flip(data_t *data, int dc_flag) {

Function name can be changes, something to test_dc5_pageflip_negative

> +	igt_plane_t *primary;
> +	uint32_t dc5_prev_counter;
> +	time_t duration =3D 10;
> +	bool flip =3D false;
> +	time_t start;
> +
> +	igt_require_dc_counter(data->debugfs_fd, dc_flag);
> +
> +	setup_output(data);
> +	setup_videoplayback(data);
> +
> +	primary =3D igt_output_get_plane_type(data->output,
> +					     DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(primary, &data->fb_rgb);
> +	igt_display_commit(&data->display);
> +
> +	dc5_prev_counter =3D igt_read_dc_counter(data->debugfs_fd, dc_flag);
> +
> +	/*
> +	 * Tight flip loop for 10 seconds.
> +	 * no delay in between flips - here display engine remains continuously

Nit: Make N capital in "no"

> busy.
> +	 */
> +	start =3D time(NULL);
> +	while (time(NULL) - start < duration) {
> +		flip =3D !flip;
> +
> +		igt_plane_set_fb(primary,
> +				 flip ? &data->fb_rgb : &data->fb_rgr);
> +
> +		igt_display_commit(&data->display);
> +	}
> +
> +	igt_assert_f(igt_read_dc_counter(data->debugfs_fd, dc_flag) =3D=3D
> dc5_prev_counter,
> +		     "DC5 state not achived during tight flip loop\n%s:\n%s\n",

Nit: Typo in achieved
Also error message seems wrong. This is negative test so DC5 actually
happened when it should not. Update it.


> +		     PWR_DOMAIN_INFO, data->debugfs_dump =3D
> igt_sysfs_get(data->debugfs_fd,
> +		     PWR_DOMAIN_INFO));
> +
> +	cleanup_dc3co_fbs(data);
> +}
> +
>  static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> @@ -695,6 +741,17 @@ int igt_main()
>  		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
>  	}
>=20
> +	igt_describe("This test validates that DC5 state is not entered during =
"
> +		     "continuous tight page-flips");
> +	igt_subtest("dc5-negative-tight-flip") {

Tight flip doesn't sound a good name for test, dc5-pageflip-negative maybe

> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     PSR_MODE_1, NULL));
> +		data.op_psr_mode =3D PSR_MODE_1;
> +		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode,
> NULL);
> +		igt_require(!psr_disabled_check(data.debugfs_fd));
> +		test_dc5_negative_tight_flip(&data, IGT_INTEL_CHECK_DC5);
> +	}
> +
>  	igt_describe("This test validates negative scenario of DC5 display "
>  		     "engine entry to DC5 state while all connectors's DPMS "
>  		     "property set to ON");
> --
> 2.25.1

