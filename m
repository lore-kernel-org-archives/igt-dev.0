Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DC606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hALkT7/v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1886510FA4C;
	Wed,  4 Nov 2026 08:19:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DB810E862
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793780305; x=1825316305;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zzoWCsVtafDlSDu9HRRCu3AQLVLkaw0ES9wtDfaRtNY=;
 b=hALkT7/vjDvxOw631RRaIFrw4jqVzEUI9DG+8bAoyQqBJvLQXVd8p1lJ
 tBlphZg8V1JhKEwEVvkiYXl6zXhg763UGLfHBwhL3gPsRqDcLQl5lM3M3
 kEWmCJ2by19mJE23v7qNiFAFGw+dO1iIanP7nArKEbIHfOqWm8nQ5f4wL
 aKnbjXJmPMsjxSSULhY75horEjn4c1JfyHgoLf+g9CgoA1a/R4lz5VK4V
 8M83wSzh1pRT3MFk1UCrP4zrOBjHNqFLs6PrazK4cq2u7PTWVYYzjQZ0P
 fHrWXQwXwra5/8UnAGAar0qO2oWdDlOS/Z+alWon5D6BtaCKrGF8lIMoB w==;
X-CSE-ConnectionGUID: PRNINEo3SO+V6M0msGEiSA==
X-CSE-MsgGUID: /pRN20O5RjGChH1mqlxxWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2422239"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2422239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:18:25 -0800
X-CSE-ConnectionGUID: HymusVojSnyW0TPYhXBq5Q==
X-CSE-MsgGUID: Pm6HAabkQA6JfjNsFAxm7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6793473"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:18:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:18:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 00:18:24 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:18:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPbbn9FQYEihxvyBZhqOfTyS6VqUW19ipwp2tOfG/uEilWWpxE24AE7z7KtBt81vYQkRYoSfhK1sutxbelPTKx3ezVRBNFitHvAFG/bxah4/9RhfMhXfyisq/sZLG0V4A1UKkbj5lQAZniBbogCSwU9Igt88CGn+1V4Pq09B0sITAtPesGo6Msy+A0VPJ/HXUc6bRfgsLLSR02c1M97+At8r+8rB/kBU8OVdCRKFN4xuhY6iEAvGJ0M1jezVo+OayJ8gPp3AvE4rY0NWw4S5HLHY2SNXaWZou3jBD2oWiOOiu6ydUOuLOi2HWHlS2vDI+4glTYYxKAxmmKi+EXfyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6CzPKlqO2l51GwvAsu+xh3KXeab6okAjXr39V4YRTE=;
 b=ltyGN6tUxfeQxBEFpKUCWdMMxW39v/h0BVd8oQIHf1cFUyNKKnsy+i4v0tf5b497z4gko14IGZhigj6ohQrQgiWxLgFdZKHjkZthR4WIT9zsw74PnueWgbWkRbH2LMD1mk6hqvLU4ciuRED2HidWf7Nhl7UccTuzTZf5spuc2KX9pgW7DjgK2KpWEcbkO5N2BBdlHYw4uiJQ6Brj2NGenHJkzfbrRNIYl7+mcnrOBpBAUrj0/njYvJ5b0o2f8SezeixDzellOXyuUHreq76PJfRSUFwdjBbY4fIM+wY8mg142VZTOfmD/XIwagespfVu+gz1HevDViC/SVNjQSJ5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 08:18:22 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 08:18:22 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] tests/kms_cursor_legacy: reduce CI debug output
Thread-Topic: [PATCH 1/3] tests/kms_cursor_legacy: reduce CI debug output
Thread-Index: AQHdZW4Jdc+MychYW06hrKaD3UC5fbcdnX4w
Date: Wed, 4 Nov 2026 08:18:22 +0000
Message-ID: <PH7PR11MB605383E2AA383851570A32F1E7682@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261026171836.1434992-1-jeevan.b@intel.com>
 <20261026171836.1434992-2-jeevan.b@intel.com>
In-Reply-To: <20261026171836.1434992-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA1PR11MB8576:EE_
x-ms-office365-filtering-correlation-id: fbf26e3d-d071-4ac2-a2b3-08df3a4c30f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|261021123027099003|261021121427099003|261009223027099003|38070700021;
x-microsoft-antispam-message-info: IFbJPOTDWx4/RWHXhjOAQ5u0XpsjfbYJPTyqSJTjjLdZeBliMWe0gDyr91cLtzcHOwawfrN535zOGbLMczfZ63uY08jb/K/vjOVdIZkL9IX/tKnA+thOje4HKDxzLqMNDFwTiZ6eQ/s850WnD22YQOKjWPHZvt/IRbHIdXuv/EHw6/oOV3cj+Ph/BieHsRyGsqpmHvButCsY8mQ2gqaNslIbQzvszT1iT8pfECacqEYtn+YUL06+HNzYsrIByXfCgIB0waIVcsVGn23WyBB27NLOIxe1Y3dEOBvidYMIJvRC5c4kYyuvB5Fqe30WBznBYD3/Qd544BrBEt8wEvoJ5bBpDyLFwisdXpq9umb18ePSeJiXmUOg1lRHzbG76SWxVHNoK4aTKv5DNe6wUy+1RXCs1sOztfD+jnCSONTh/10F/ZAnKJ7+53t9qon45aO/JEpGIQ/+wIFuKykuuCHtb1C4qZxwO5EoIHw1ImRQAYZqtp5ZD7E6ob40Nz1QXPReqO4CErF/0Pss3n1MtJCNLgIcx+ivSJhSsxprllfevz5serca4z3eKaNcpU/Dvvds/oG8m8JUEY4M1Gv82jS5IEdn8ttCus80+gfgeIOpJTBq4MFcPZYkzSmNCMhhce9jG6n5v6He4tA+Ge5WIEqzSnl78DxpGhzQXiy/WvqJw0c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JoyLZHcldWbOuuBHWclqOk2BXMAQGGESwuTQhkUsYZ3xEhfC3aw2nU4AUMx+?=
 =?us-ascii?Q?K+BpkDP4whbXuq1WWFXqfck36F/Z0TvRqsk0uj7UkVNZOuZ5kG4dlNCj6v1t?=
 =?us-ascii?Q?aWKLp2HYbAVME7WuQcCsQRdLtLy96eZsCqXVlWd/atVJ43HhakIiiiLO/iMo?=
 =?us-ascii?Q?bCgE7kg2Z1gvPNR1nEOePy1UUvrvyh3Max6bS9VBQ26GISKlVIUdJGn8FVwP?=
 =?us-ascii?Q?FbegA+aPv7Tzs4SiQN05NZVX5sAfrem/fsHhY7XV3JwKnCeN6xZukm2cXiH7?=
 =?us-ascii?Q?V12zPMkB4bPkFl46yKTPVevNnyRbg7rPr/fzSoTH5vNq9/mIISG5Bmk6RZbA?=
 =?us-ascii?Q?3ak+GI0JHkgxh8ZwQRwWCPwn73ucfKmyUnEKXNoorHHJWASYB4EJf4kLKbDL?=
 =?us-ascii?Q?ucmy4I1TZlzNbMtiq9btnyL/5xonCDsvmmX2e2QLpXUJV5jB02KoY5yTVbOz?=
 =?us-ascii?Q?d+2xLKTvU36Pljz7xMXikyNu7V0aOWSHjzF50WcO6A6vA/6UpK2M6odG7za1?=
 =?us-ascii?Q?kV0K83T6tIn7fhhGDcZfnsXMlf8rXuVyV77uH4Q8DgXPp3ZunzNxGB0R/1lv?=
 =?us-ascii?Q?r7eLzJpP2xcx4PJElLEx9tW1Jpv2lDvJomSRoGECi7X/MdbsqpH3SPLjvvzK?=
 =?us-ascii?Q?F8Gmul2+jMahXUloUUywC+8iiGowWEkBmSDlOT8vAxywRwDly4ovDbfRdL5h?=
 =?us-ascii?Q?Zh/B4OXoGf5FncgD8LQC9OwcyR+8C5ztEOyqV4ZK3JPNG3rMkhDVP2wvLwpy?=
 =?us-ascii?Q?T1696K49i9erNAtHdpdvBzA7I+tsPxxgu80s+i+H7cnDR/wQRNzwdBhwJV5B?=
 =?us-ascii?Q?XeRhooflmtphtQJxq2q7rzPJjmUhuzjsDnrH+dR8s3/tZEysiPLJn5IaLLaT?=
 =?us-ascii?Q?3KRpvs7tWYE/HQsd/XhbJCXMlrg7Aza+a1B7kjleYO1/VOQ7gEIZpC2WOCRC?=
 =?us-ascii?Q?U88vQif+VavJ4PdSLAaKLDOVbEDGNVW9vmskeji2rOGk0Tknm8y4Tj+cxcQY?=
 =?us-ascii?Q?P7xkOb1W5pGZyTltQx0GNHjitRG3lnTcj9waPT877TPxAid8vbustg0yRF9F?=
 =?us-ascii?Q?gV3o7WKifopCbldy50fa14ehBmHk6qKZv9ouVVf/iUy9aQ0f5mMH0Tka9iv3?=
 =?us-ascii?Q?2lwY4AvKvpvMXywPlfywraZpQyEq59zSYk3+PnC8mO4LyQh9xbuUhhm+pKVG?=
 =?us-ascii?Q?60/AEOdKg8FaaiupNRRzuCp5t1ZO2sR3OihZoEmeK/dA+LtuXcdZHzKkwPwW?=
 =?us-ascii?Q?XxnNuU4yqw8B4b9dkijd2IJedm6F3Az8Ewvwzoj80jZn08JAazMzkY+GhujU?=
 =?us-ascii?Q?zWd+M7aDkWvRw38Tx+CDVQvaC/yF44aI660ApSedCLtg7BN8Z5HAwlbYmBzk?=
 =?us-ascii?Q?PSr+u+zgy6LhydPvFDMPvKO4f008NroXMmas7XJ6uf7vaeJkUfmYekC25+oF?=
 =?us-ascii?Q?NxvKPQMKdCzSQ+MrVMXlrYz0CO8nmOzxRMZ1gQDjYE7Bn0zNl7oPajoESSEh?=
 =?us-ascii?Q?BgYLAxsIU7cum2xGJVl/4NfOKc42ptMSQWaGOivwO9dj8t1TmoFIK7H6Gx5m?=
 =?us-ascii?Q?Gu9iux+K2ZdwKJAmxuAvAgopufotxV4ERA/Yb69/U3XIO+BGz8DBF7Pl3De1?=
 =?us-ascii?Q?Q4ZMoqo0sKwCBTEH/LunoYg29IfHjUDqNRj2xKVeFUzqh14YKYb91QiNIEC2?=
 =?us-ascii?Q?EqAZ0lAv6F6dmrXJpxq+EZ0SFfjwOYLAknhxSHuE0bQvSeLvkzyi/BrJO7Gs?=
 =?us-ascii?Q?Ql5ZbY2YCQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 12SzAeg2gY5t5DYXVw4YXffhPVb98B2yJ+S2uikC++dJLeW0YIQeUvQL7juuEoB7dyHc+J+c2c+8/lbAZQGgIxe2/dIVcOdqEfimW/jY5kqp2obOJScefiQVkg9qgyiVRJ3eweWg0EscUyJXvbvOG60xuQ3t4HS2P8TXHnN5W1NK/mo/I7Puab7Coz2yFy2jzt0aTT9kV/FucmXDpV/IhHAzIongQgdywdixNQSzMdooA+5ZYpiCy835a9a9eAaW7GPeCjJqdKYayyTwamUPhbJq76mFLEjvR1CUqYnNYRXSGlYWig15z7WnUkfX6LQ4f4D631rfCw4MIltl3Anf8Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf26e3d-d071-4ac2-a2b3-08df3a4c30f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 08:18:22.2505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vt9qQEjhHAqRU/4CdBcJ6BjANjgUXGpLkCElhCp8Mne8fcRE+pZMUPeKdezzwoAgN2qFmbSSKCZUKXzUsaNTEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8576
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Monday, October 26, 2026 10:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH 1/3] tests/kms_cursor_legacy: reduce CI debug output
>=20
> Use DRM_UT_CORE instead of DRM_UT_KMS in CI to reduce log volume
> while retaining diagnostics. This applies to all subtests, including the =
reported
> cursorA-vs-flipA-atomic-transitions case.
>=20
> Log the actual debug mask instead of the hard-coded 0x4.
> Intel CI output-limit validation is still pending.

No need to mention this in commit message.

>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16961
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_sysfs.c           | 3 ++-
>  tests/kms_cursor_legacy.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index 9952c1c0d..873015bdc
> 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -537,7 +537,8 @@ void update_debug_mask_if_ci(unsigned int
> debug_mask_if_ci)
>  	const char *ci_run =3D getenv("IGT_CI_RUN");
>=20
>  	if (ci_run && ci_run[0] =3D=3D '1') {
> -		igt_debug("Currently under CI execution, reducing the DRM
> debug mask to 0x4\n");
> +		igt_debug("Currently under CI execution, reducing the DRM
> debug mask to 0x%x\n",
> +			  debug_mask_if_ci);
>  		igt_drm_debug_mask_update(debug_mask_if_ci);
>  	}
>  }
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c index
> 62339855e..5d8bcae9e 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1888,7 +1888,8 @@ int igt_main()
>  	};
>=20
>  	igt_fixture() {
> -		unsigned int debug_mask_if_ci =3D DRM_UT_KMS;
> +		/* Keep CORE diagnostics without the high-volume KMS
> debug logs. */
> +		unsigned int debug_mask_if_ci =3D DRM_UT_CORE;

Since you have mentioned CI output-limit validation pending, please confirm=
=20
once whether done or not.
Apart from this, Changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>  		display.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>=20
> --
> 2.43.0

