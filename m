Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134CEC44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 03:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BED10E2C1;
	Mon, 13 Jul 2026 03:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxrhdtwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4541E10E2C1
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783913736; x=1815449736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=phFNRDJefV5zjXYf667wJbe59RYqz5x+Y/TDs7NRT2g=;
 b=TxrhdtwXX7zMtGqRwfF2WKeOvHEuL6JESuHUPnKdQS6hgO9cyAFMRgZ9
 XccdzRkGhFtjOpzxECZ/olNGaN+iOyMsXrNu/CNk9Rs9w2GsC5Rl6krFy
 OXwKwYnkSIXkObDgCuVAl3rQWMIMuclztkbj+hP+D/j1dl5vtJYoHWBwF
 akfK/Fdg7ZFZ4Tav28GlVM2X2oHkz7nKL6CVeG6mBi2kmxuFT0rqNLrs0
 mI0aIslttGuIAHqq5ChiQCVOnCyG4wJv7Mt3EVsrgGlkwjcA8jXpQiRAa
 qRkQ6HQaQ1JUIrenQ0PGkZ2ztlG5Lp4i7bad/f3UwCR2HnsDqu3eYjRe4 w==;
X-CSE-ConnectionGUID: DFexwt/wQkeGWa9U88n/4A==
X-CSE-MsgGUID: mZdaLe/4RQilg2UUKB5row==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84397448"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84397448"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 20:35:35 -0700
X-CSE-ConnectionGUID: fxR0yjxRSmy5IOATpoKcFw==
X-CSE-MsgGUID: 3of5N743SXSOuf8+XDdu8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="252045501"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 20:35:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 20:35:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 12 Jul 2026 20:35:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 12 Jul 2026 20:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUOKwsWbBSjjKElTOIKdRaLWWMu18JbHwHgJOoqahM7bdu06PLs8GJFx4B2ZBw0e6BrdGZl+ku2dXMRhzY8vXFrE5y1fwZz89mEgHb895jiyRQ9ATlV31tPsdqU4TPBpvFrPRy26paIv881uTUSDCfPGIG36+PLwZAoxoMp0ZUbrx1ExvjlVvnutt6NiZzmNns5ezzLbmhtCDkMd0ZpH9ocO4QcrqZ+KERYZliliLVKMkquiZXdXTQLkTMkKddX269Z7qo5NSIe+7x65XSkXYgf/WJ4dq8XSsJPlBqqHRQeeJ7U8P4qsLiVn7LAKFB3dusJbI4YhEku4HV06ZJdDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF6NQUxJ/0J9827ZzweVrHW8JjSPQd24TnFQx4YRXtI=;
 b=SjrlF6vjm/i3ONQET/WWyKDqQ2UG9OqTV36ciaPTKT9SV3yAp3M/LR8iePgJ2Tso1VzfC0OSIvmO7Gg4ICDMAc0++CSZQ3cWSM2N6T7r6UunD3jQYtC59x04vkqn6Y6Pcsmh6Gh9BATX/4CYhIQPZ+VddKOZ9ke/FnahSvJbwXpwUj9Kyo4TPGUv8Ecfc/KyLNoR+CquiiweqCO3hlZE9NQsgDct3fZMo5BGs2oR3ZU8CZMR5LShytcAFqrNGM/6YFpOJ+QticNhdbTbtmavebr8UwE12lO33OyO3bfqi8kDU3qfxxxLOndl1D/MiYgaNKrnfirOlyRQkjZYW7CPbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SAWPR11MB9760.namprd11.prod.outlook.com (2603:10b6:806:4c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 03:35:33 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 03:35:32 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1] kms/vrr: Trigger modeset for non-preferred
 override mode
Thread-Topic: [PATCH i-g-t v1] kms/vrr: Trigger modeset for non-preferred
 override mode
Thread-Index: AQHdC3S9wUmmqDvUuU+4bq9YPXjBOrZq2Slg
Date: Mon, 13 Jul 2026 03:35:32 +0000
Message-ID: <DM4PR11MB6312ED6EB582156C9FE9941790FA2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260704051925.2165079-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260704051925.2165079-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SAWPR11MB9760:EE_
x-ms-office365-filtering-correlation-id: 7b789d78-1dba-45af-0aca-08dee08fcb4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|6133799003|56012099006|11063799006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: GUreXRZmpQOtifF+xgQmNqUWTy0J1GGmKTA2XsQl5IlU5EzFaMtgGUWC0ftSbf3UIDnxVlAmxxm1PIXGudkBXikLplIPe8WUSt5CwbQxc/pkAdIsFtrToGPFIjfnOuKzmp0YCxb8V6FjZNn2hOCBhf5SHGQA4d/n+HDvNGmhxI8yaGs3LEDEtTaUle7EdFKGDT/eZNDc7EeIIFkj8AIryyTiYlT3CWgd+OL/A+yGQv+ZnOYC/rINAd2Pgg5ZHcvhVmTzY+IdFwsMASlQeVlm6mejavGxa3PeYMTWw6/GFF3hgDWWQqyhRp2n29QYuT4qfx5mSJu+SEiEt2xI6DY2mjwrQxrtmmuwKk2Eti/VoECAxV7e2GbbvXD3EIiXPbUuj8R/wvCwbMwZapCSD7QyTcBqBFxqYRIoBUucGT4tJsTC4bK97wdY2eT2s9wHO6YumMwQNhpG7DT1FT4XSFp66lep9S1oUWs+S3ALbzBy4Cs4ZQvjXQjOszckk63T8P6mT5Ga1HxDkV19d/FkE+WOO8XfIprx0nBF7uQ+DwKXSrDnOAyIIlrj+rMhGolxovaJR9d8sikGCZi2P8lNfkce4iBrPttYaTt4g8CiGLAISNovQPjHWz2nP/HQi7LwH60rU1OCEhWtuEyz0jkprr645sK++T+lo+9H9ppb2Lbnp54=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PUaKcIWD3gmDP0F3uwccHwuiVZ2T4kNOjxmBhnJPliHrvaIu0BbWgCX34R3W?=
 =?us-ascii?Q?yiD/CvA2802uMvEXz2ekF3jl/qaZQw1jW1VZHVDZZdQMoPeaMUq+iSbfl9bc?=
 =?us-ascii?Q?oL/uEymYHD9pIk688FxmKgbaPUBOmd92lUBm4iWipafKJCW/LeJ/eFhLla5U?=
 =?us-ascii?Q?6Vq8hl+/TBmgBeiTAAkM7EUVGlhCOOU5x0Dm+8uCT8otkpNAxB8bjRR7YUll?=
 =?us-ascii?Q?1z17AKmq1zsdC+ihpXyAwtCfdantuLNMCDZ2xAxKa5FcvslTrjXVk5vN3Ap/?=
 =?us-ascii?Q?cIBBrnQTYyW3fwYDWl8K4pq6L0905bfvAe2QRfTJTYSCSs1k2MNKnrwQJWzq?=
 =?us-ascii?Q?7xD1XtCDt6mlfHVo3L0BmvQWyvkYH+HfCtSiLZh8ua9ReXSdfPXuYK92ag/u?=
 =?us-ascii?Q?Rd2smzHo8pSsVuis350WKx2Th4J6o5O7XrD4VjzBDGvMFf5LlskjO0TLVp2U?=
 =?us-ascii?Q?OfQJM/sHuJW+gx7JKYrRkJYPtyoPPduZBSeh2LEm5Bnc+g7J1VE9tqpHUQ4Y?=
 =?us-ascii?Q?JSvBv/06Qayq/ET2BqIbxcuWuTM6Wz1P73Ljk7mvc4K5ljfzUE30kfFwhaDj?=
 =?us-ascii?Q?Edn4jsiDuxbgXoiWayR+njUM66C/ge6/E7zbll6TL1WGVch+yMJgerOxclyy?=
 =?us-ascii?Q?9zIbmGFBYdYffxsWMLTx2kmVkPMVE1atA1Txg4VD31ODoHPhe2Vb/ZziYd3g?=
 =?us-ascii?Q?qgiDyXMc/rjrbHUc1JpvR3H+OmVbR1CWNJbOqouGoj3PCQipoFqfLKP0oFrE?=
 =?us-ascii?Q?CYKqba3TVmfzAEdVkbwYxvp5YfqEnrMjJdHVx8Xg6QlwEapgdnIN9o3QG4co?=
 =?us-ascii?Q?fcXr0JCbDEQTem1RmNSbhE/wq24BdEEwVoFFi4Ze5tGjlWH0dw2LnnbXsOhF?=
 =?us-ascii?Q?X2vox1ibwkAmxHregV3BG3wE/KoSfSnSy/1mS6FnmrkNY5P7DuoHd27AFYR8?=
 =?us-ascii?Q?RKP14vcMmzvb+PoSag2FoTHexM2PWzmivRd4XZfgf3xtWg+At9InVvEID5sp?=
 =?us-ascii?Q?gMzVcBNP+CU82J3pT0Q35c6GgC+yvZKuyE4EgZzwS/fW4vNUseNRzjCWkF0v?=
 =?us-ascii?Q?V7onULNmJa6Fdm6EIQ+6HBGfZZqeFsdJETGoFcBqxqY0sIfznOmohgCjGD5K?=
 =?us-ascii?Q?m8AqEItRInie04VU5lL/t/QgCbN0SSz25RGYmQIOBC1Wz57qaIzgAqWUZpqo?=
 =?us-ascii?Q?G8tU17cPgKnKGso/orRXTetLLr0nLhyfCUt0IbyWMWg/Ib/ucwSkX8UA3+du?=
 =?us-ascii?Q?hDGx1lZJWWC4T/EMIGiTkS4xzxw6Z0fm3yKr/XWF7T8YWkixlKdlBEq1SeUD?=
 =?us-ascii?Q?GWytwmQo8zclmUqQuLvus2bQQw0qzY+SMrRxC27QtvsRgGaLCl5AoLPL7yTd?=
 =?us-ascii?Q?5AGv8o2M5k14Gz1P6ttlk0/S2xkFXUDMc1PV4mo2j9sfFKUkmwegDXyPA8Ur?=
 =?us-ascii?Q?0v9qkvXokntIhWW2MITepjfItatX2HXRWqEVgbXMgdLx+0HYBYGV23URXTnY?=
 =?us-ascii?Q?rCPnpcrbdWxjAhywZ3xWCz1l82SC8aPklRKNnd2INczn6UdVCf7EOXnXgaoy?=
 =?us-ascii?Q?Bhk9djEEqTt82KhXpzFPQyFJAaUNKqrdhwZHBL0knmS0HXDznHX1BJL56CmC?=
 =?us-ascii?Q?wOdvlFkfMpwrB5qGWzPEiyFgRsEcd1qN+FV3f7a2CEw672MwHBrtLlwyodm2?=
 =?us-ascii?Q?kAzRJrAgkmOUDFezwoe4MvwJdfn+OWByj76G52AT02SFR7LY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lK0f9mLplKgS2LCXrSOC5upc3Uvizzg6jhw1wAzxRoFg7QBvKnXK3Dxv8XLFGqNLZ6YyMpGCS/HusDCAkWwRjyIqSqyPGvdgq4c9wZCU8NdIR8DayT3H2Jc0atBXtl+Ywh1tF+tgWOJH9F/sTrwG3rMC0t1t8/5qeiCKckReNzbzKfeJKA/nWaxJFXJTZxv9t0gIz4T3ddj80oyOVdf56YsNJpVU8Zn11xOEQL7dgqCgGHl7okUuS04xIjO+tmaPIL/MOzyTa4guCcF+TxhGwE5Cx8dCMGbjWZkbcIBfNHowzjHDtP12O1EydTZbkeTgw6oL9/LSo+LsP9dZha3gZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b789d78-1dba-45af-0aca-08dee08fcb4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 03:35:32.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XPuZf4a+AxgimTEad2vwCQV4RgG2qOIs3LHF6db36Jnk0yVozhhcf9i6EHRbxjCBw4EuMFqf+GUJ0ySfBaUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9760
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Saturday, July 4, 2026 10:49 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1] kms/vrr: Trigger modeset for non-preferred over=
ride
> mode
Need to change kms/vrr to tests/kms_vrr
>=20
> Ensure a modeset is triggered when overriding to a mode that is not marke=
d as
> PREFERRED or DRIVER. This guarantees that the new refresh rate mode is
> properly programmed into hardware instead of relying on an existing state=
.
>=20
> Observed fastset failures when the preferred mode has a low clock and
> switching to a higher clock mode via fastset, which led to test failures.=
 Forcing
> an atomic commit in such cases avoids these issues.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7397
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 82eb8554a..d583d3cc3
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -948,6 +948,10 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	data->range.max =3D data->switch_modes[HIGH_RR_MODE].vrefresh;
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>=20
> +	if (!(data->switch_modes[HIGH_RR_MODE].type &
> +	    (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)))
> +			igt_display_commit2(&data->display,
> COMMIT_ATOMIC);
> +

Can the modeset enforcement be moved to the actual mode-switch/commit path =
instead of committing from output_constraint()?=20
That would avoid introducing side effects in what currently appears to be a=
 constraint-discovery helper. ??

>  	/* Search for a low refresh rate mode. */
>  	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> TEST_LINK_OFF)))
>  		return true;
> --
> 2.43.0

