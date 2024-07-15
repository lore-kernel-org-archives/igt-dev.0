Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6203C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 04:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79610E132;
	Mon, 15 Jul 2024 04:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwlNRdrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA6610E132
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 04:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721016188; x=1752552188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DoxWIWaNejh6CXfyZldgsVP4OAueuu0Tm14LUPGYXWM=;
 b=KwlNRdrIp8bTZdkeIp2B0T28e573xZBFkbGM4XL8NTlgREbmFmqdZDra
 17+4Yh1hdwvGBmzG2RHOenpV01f7DcSnXieBZp0vF2YmLIWb1vYNUod5k
 1bjBcrfHWoFlDg+2RB+8ckueffK0IvVYpJI42zNuBYwpJeBi2vQGrULKt
 Gjmc8uUH61PDu77wvVaCpOeSbg1lIE4YoYglC1jp5ppVf+s7mEoICxQgN
 GSs+o5gFRdqsql3FGyb+Rm3p0tfSGtE/2pynJ4TbH53cWaYs0ksmuGpuy
 qGZpNVUDeALJLL3a3919mG4/4PwtSB9NV1d5UFQPvUnaeYoHlDYY0m6+y A==;
X-CSE-ConnectionGUID: jSWNzVrsQEiDsufFEd4b8g==
X-CSE-MsgGUID: v9vNmO0SRseYlxCeQCScdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29529630"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="29529630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:03:08 -0700
X-CSE-ConnectionGUID: s/SD88oISlmwcL778f9fjg==
X-CSE-MsgGUID: vhzQKcfWQj2a6c3AltYgoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="50242824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:03:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:03:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:03:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veuyP5pL7DsNUAsFUbAQw5uudLRZHbTNQGsGxUefx2HwphwRhBDJl5C3KG79okn2dUsp86e3eoMDrCg8MetTu+FONzbF1Bkz4IgZNiuCtNQL6mgmyKLLlpac5CllvM5D36pqrEfFDHqENnLfIgVm/I8/Ux72mfzaWJEbSb1Qoz3QoK3CNDyAWg3nCcnQzjk9Z6724svzAulSuM1fyxZgaPMT+eQIiMbBTJm90Tsw5DrMFzXrJCU6gFwP4okPjcANHgWeEHvA9J+FnZ117meM0ksjwfscUwm3BPEbj4lRvJG29Mj3xkZggo3hSPAP3y840kjpNRgmUX4qlfYe7KnohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhNkec1ynF1bzqiTg9Va/zLhTLqCEMRIhboRdVKju9Q=;
 b=ehz9JhNqh+pBImTw0zcYNM7IytYPgIkYsQe3U5sP0P0dLMNJkMqP5JknBJwsY5UMEfefzYmIFeskf3uaRD3N9OQ0ZAod5e3Ew9nABWABKNB1rD5plN7/SI1cQ0Qc/y5UvuPb2oYJM8U6wlOpL9hggq/in6gRtwIGK0pvqBt54SsekqJdoQAfeyGp3reIJyOwWTb1CUUu4j/bsXKy2UmAGA1oEcs9i7B1/IjOBJ6ULfNNmIt7ZF9hBM/zgZtXqAdUmKDFbNE5LBYXvTxEdQ3nly/Gt4kWeRiv1n93QhMQuDbjPM4zMlt4DcJcoOr9XB7dN7t2UnJrrSZDn5GjDCzbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 04:03:05 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7762.024; Mon, 15 Jul 2024
 04:03:05 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive
 deep-pkgc
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive
 deep-pkgc
Thread-Index: AQHa1PV2kiwEIgmgkUSkoHsOAkn/v7H3K4Mg
Date: Mon, 15 Jul 2024 04:03:05 +0000
Message-ID: <SN7PR11MB67503F0AC598327203D18149E3A12@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
 <20240713072646.551590-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240713072646.551590-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV8PR11MB8745:EE_
x-ms-office365-filtering-correlation-id: 1ae9312e-0317-4504-7c98-08dca4830787
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?uGv2Xwz9wFU2kY3M4r92v5eVCqFQzXLkrX5rXc4aHXavYIBXAABYbnUBfK6o?=
 =?us-ascii?Q?3K48Q90blrXZDd72qRkYP5dE3d3VLlVnChB9sMkXjJorkxyrtiGZ/57qm0dL?=
 =?us-ascii?Q?ZjkuxM9qarcPmPeAb39ENJHORZJQ2YkUAxYl/Eakb/CRZo1iieq5HbsShkf/?=
 =?us-ascii?Q?h1hnmbx4G4wsZ0hw+f0ca6dJgCKOcR7J3ijGdIf4TSpAX8NVoq43peKLWVoV?=
 =?us-ascii?Q?8cCLD9c2fFmV60TXU9eJabd2/39ZX+iv31Jyjhn1ABVx4658GNzKkrD0reH6?=
 =?us-ascii?Q?63P+z/IeJ6enAnFfuvg4jjkJagO0pbufvYvTsS97THurcyLFx7+AD2vb7LZ9?=
 =?us-ascii?Q?OWwBgD6O3ZEJwGHmtFM7AadWH8Ka2duWN5kI86o60U12aHXie2kBCclOGUle?=
 =?us-ascii?Q?KG/qgqwTol/FDsutPEDZHcJmFKGlI9bxwkkEGaxWvE/HEv3vCumJxqG4iSWK?=
 =?us-ascii?Q?jcsrCBrEMh7wrVVc0oEPUn19rHnALqDCGjXiqy2FCLP74RrOjUO/G04Vf5fl?=
 =?us-ascii?Q?3nrdc3wwrbox67CLjGsftZKOJYMGmaELS/khWq8FQ6wsNPtGeDsEkmi2Riw1?=
 =?us-ascii?Q?ShAGKpR+l90bwq8XVoVjTzV/SSH0ibx7C+KhoFO3IWCM7Kib76fX0ZSZ5Kjf?=
 =?us-ascii?Q?YiK4nASleNBoIv0SqTtoybjm9dlPZlTegfkN6+jSNn41cz+5DSEGFS+PRNZS?=
 =?us-ascii?Q?LHRCXYy1Kqi2+urOoSZ+AHcKXKFsLG5u3Xna2QnITfbNZL5Vq9W+OFGCpKQx?=
 =?us-ascii?Q?kiWtAOFy5aBDLyb8aS30eNaFL7ds7awsgEjQZ6TOuaXu3u4fSFX/Tl6Or1Gy?=
 =?us-ascii?Q?8LskCLRLX2MiuEXcdIbWuwN5oTICKtvkFC8KKisHNQcU991h8zwdLibxkAah?=
 =?us-ascii?Q?voGAvf7sxWx8WcYE7d5JmPMXCus/45O6WPc7ubmXTjJ4mGlLAGD4v2yZfpPO?=
 =?us-ascii?Q?M4jSCb/FObhs6aJH4S7g6BtRipaNpP3iOFYy2Gf42wQ25r/qlqGKY7AM8bUy?=
 =?us-ascii?Q?et6JIZ1eZ35SzFoZpCpdiLOKSrRGW+1zyUIk1kYDGdwJjcJ+AmaaQL9c67Jk?=
 =?us-ascii?Q?Zl1WL3dcrpGr/kJpNxHuvC6z6JTxM+sDLC5F/Hvzl5lyB7qfFmoK0yZUiwRS?=
 =?us-ascii?Q?J4Z7ToUbwdunLwNNPItYuKudBVakp+YD3X0dYk8JIYL6e9L3V61GJFtibZSx?=
 =?us-ascii?Q?F+8mTDaQmdLsorvXcgqJSc5ccsaYsZJsnZQKnCIyCCdx/toAXpZWNHukjB/3?=
 =?us-ascii?Q?mTIdUiY/GfozgfzyeKzrP/jQUdZmzJ5UHmM+x0xYEKE5QLusKnXl6dnCsHiE?=
 =?us-ascii?Q?OBfZfRQrAJatYHTnzpARRBglm5DHq0GUf4GHGGsrGDnyiJINiegdSzRLsI5e?=
 =?us-ascii?Q?bZUD99Lrtv79K5QOHgryr/6CpcB06GqUHxa07nUSwpFanQJtIQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BrIXYBpb5YMZBoy6Bqnmf3jtBGrcWLAuYTRHLpLdkG9RzlhXEIJnGylXQpEM?=
 =?us-ascii?Q?lWxc5T6tmTfc1L/tQb5QFcHGcHEF70S5gPGSpF/tgyHCh0p96NKNbMOaC31I?=
 =?us-ascii?Q?4YjIXEEDQoYQjqABLEE/B9K6cRwJqLmkhF/5FYOk6u7ya9qfGc1nMLFFzm0j?=
 =?us-ascii?Q?+OOxmAYgaQctiM/KKxv8gYSiZvv+aWdp+cOaC8DVuykf6dvb2gbIcySWV067?=
 =?us-ascii?Q?J48w0OVzUZE9CD5V/Pan7n8aG67JjEbNztsGBQuTMt46wyFAZzOlsFklRvaK?=
 =?us-ascii?Q?LM9zzwTYz2M+XYC4TxV0pfWH7CcfutQZYpCcJ6QkM+yahHJ4UCx/Z21zqLef?=
 =?us-ascii?Q?KWsCZW11wV+y3uV6+8WKd7YR0UlLGnG79sYfIszK70dZL2h/atACY8vM61fa?=
 =?us-ascii?Q?/YDjf2DKIczNAwMEJ+osnJtl7RktgZHaycAX6WDjmcq8rW2jHxVcQJ5BXfwz?=
 =?us-ascii?Q?2wssysPfSsQhp+uoC+PYC3uryAsDEB6izLBYHUaiIRAKadLgjHa5cbrFHNt1?=
 =?us-ascii?Q?1h+8vY4kErK3guROiFVcj9qKa462/3VfeGiSRruWv52gp4kWtGhLii/+z/Tq?=
 =?us-ascii?Q?EK5cK0bcr7qneEBtm0Uv7jXShcWnZHmNObRXzeocoqB2Lg62xPYXfj+MFPcc?=
 =?us-ascii?Q?kFl18O9cTHIGl4+7P9C2EBOUHsjF296UKM5nEIvJp+9dmI20HuYD1rb+wEpF?=
 =?us-ascii?Q?mKciBRsxiMmJZFJD+ptWsTyyeGyknhqXm5bMMJ1ip8uxfdYswejk5j+ADwP+?=
 =?us-ascii?Q?DEYw2787C7qyVLpXx/VfbXNZcjnrdWTLD3DbFUDE+FYUZGCcEOC9LFqpo+Do?=
 =?us-ascii?Q?9444v4oL8em+TdBJZ0UJ1KalipYCUKmt1JtkAXMn/L5EOPoxm61SCdbQgRMU?=
 =?us-ascii?Q?0/MfmzPg3dwO96/CS16YCB6U/T8jZK/s1Q82nx8OdpLzyUdWX9KNDB2Cj4Sl?=
 =?us-ascii?Q?omMgdureKiZeyfwc7zyKBrf206sdIlfb/nWEYV/bcNzAhCgvsTA2A5+6VnxK?=
 =?us-ascii?Q?SBD49VEh0Xe//hxXBQLu6ICyz0Qja0518uQy6alXI+CsElbTS7NYwfTX5o/l?=
 =?us-ascii?Q?JKMFuVgMuZiQXEbRtwDDPtsRGw+5HxVXtku7VIUklCqtsrl9YNGzeEdvXS8a?=
 =?us-ascii?Q?zYQrsoPtaHFZtKme4BUcSbgHA/6kZze7yIF6Ax7Twgo85hcjC5rXzMv9Qwl9?=
 =?us-ascii?Q?ZjMJxaIBjoKm3JFhM77GWu9wLwfkpDfIrLjUlKMd3C5jc035KfW4IA1y9u6B?=
 =?us-ascii?Q?uR6P/Nb5lsYBPw3gW0CxlliCifjNLcpucw5rB62eFuul8+N/L5saPxxjHd0W?=
 =?us-ascii?Q?A91JEBLfqSsr0/u2vxNgBc1pGRelBs4y0rj6npPqWlPnGnYD2hvnDtd7ohrF?=
 =?us-ascii?Q?24aDxGNsWH34UpXYNEi3FhFToPb1+IgYK8BfG2WZCW3s6UbZDvUxh7NAEMkr?=
 =?us-ascii?Q?jmYt1YmWSoiJk+FFZ21lnDHZpDmu98K46Z0VIrpD5KUghuYFuqV69I07lqne?=
 =?us-ascii?Q?z8DBRB7xu9yuwmWrMEfaonXlln4b179p/KKISX+Snxr9L8ZrdDy7ghiiRvlK?=
 =?us-ascii?Q?8gLtPWmOkQE7hjJQlzwocrgW8BcAaPqP+99CYtmv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae9312e-0317-4504-7c98-08dca4830787
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 04:03:05.3628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+3H9OYCoV/HbCroUv5n0733WLf3MsrxHVdkJjW2Rhd+RiTfsaEALyI2nyz09m+YxqT2V67GfTBGdlJsTjW6bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Saturday, July 13, 2024 12:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc:Add basic checks achive
> deep-pkgc
>=20
> This patch will add the connector checks and test requirement checks for
> deep-pkgc
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> e1318bfa6..bca5bfa58 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,31 +592,46 @@ static unsigned int read_pkgc_counter(int
> debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
>  	unsigned int pre_val =3D 0, cur_val =3D 0;
> -	time_t start =3D time(NULL), duration =3D 2, delay;
> +	time_t start =3D time(NULL), duration =3D 2, vb_delay, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag =3D false;
> -	bool vrr_supported =3D false, flip =3D true;
> +	bool flip =3D true;
>=20
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> -		/* Check VRR capabilities before setting up */
> +		/* Deep-Pkgc is a power feature it will support only on eDP
> +		 * and low power pipes so add a check for the eDP connector
> +		 */


Start the multiline comments in the next line as shown below
/*
  * Deep-Pkgc is a power
Also can you fix the comment to say "it will be supported on ..."
no need to mention so add a check as it is understood by your code.

> +		if (output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +			igt_skip("No eDP output found, skipping the test.\n");
> +		/* DEEP PKG_C_LATENCY can be configured only for fixed
> refresh rates.
> +		 * It will be support NON-VRR or VRR with
> Vmax=3DVmin=3DFlipline.
> +		 * Disable the VRR if panel supports VRR.
> +		 */

Same thing here for multiline comment=20
Also fix "it will support ..."
Remove Disable VRR panel comment as its understood from your code.

>  		if (igt_output_has_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output,
> IGT_CONNECTOR_VRR_CAPABLE)) {
> -			vrr_supported =3D true;
> -			break;
> +			igt_pipe_set_prop_value(display, pipe,
> +					IGT_CRTC_VRR_ENABLED, false);

Shouldn't this be aligned with the opening brackets for readability

> +			igt_assert(igt_display_try_commit_atomic(display,
> +
> 	DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						NULL) =3D=3D 0);
>  		}

Same here

>  	}
>=20
> -	/* Skip the test if no VRR capable output is found */
> -	if (!vrr_supported)
> -		igt_skip("No VRR capable output found, skipping the
> test.\n");
> -
>  	igt_display_reset(display);
> -
>  	igt_output_set_pipe(output, pipe);
> +	for_each_connector_mode(output) {
> +		data->mode =3D &output->config.connector->modes[j__];
> +		vb_delay =3D 1 * (MSECS / (data->mode->vrefresh));
> +		/* At least 5ms vblank time required to program higher
> +		 * watermark levels
> +		 */

Fix multiline comment as mentioned above

> +		if (vb_delay >  5000)
> +			break;
> +	}

If it is at least 5ms shouldn't the condition be >=3D 5000 also 5 * MSEC wo=
uld be more readable

Regards,
Suraj Kandpal
>=20
>  	data->output =3D output;
>  	data->mode =3D igt_output_get_mode(output);
> --
> 2.43.0

