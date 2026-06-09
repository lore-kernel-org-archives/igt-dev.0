Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F5CD8CA4
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5FA10E189;
	Tue,  9 Jun 2026 08:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSc8Kodr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB010E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780993182; x=1812529182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6B1ApKBSvlVIVSoTNOkqnOc+xPLPdp3HkQDDLBFEkzg=;
 b=SSc8KodrwCQmtHpTkYaW37Bh/QmYY0BPjMCvACFz1CfKB4GdObV6l4Ho
 nM9ecdgvANINRatUHiSv5VapGxXTwIx1HUtChvtNxQ6tcaurbDIo5PNH3
 noMcRlIrLGoR2G8hgQMKK8CN0OsQ4/rMzeTOKnmN17JPmHD2b75bgWCXD
 dHnrtpWO1GkSjhE1oaX0oQXDqNBodxCRyh30EED0kSfFy/LRW868mDWK2
 TXhwf0vYocRggUCzzNRbdkyKU6P2Bt+eq0dQYG8C7dTmU3+T9fBa/IAhk
 gSWBB7lrHH/XAFkYX0elAokx4R2i9WXjYEq/gdqjiY1ZL6eM8b7AVPJDH A==;
X-CSE-ConnectionGUID: Zx5pj7EISy6I3S1e3MiYjw==
X-CSE-MsgGUID: fvHboZ5OT+udzs0goAO+6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="104411613"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="104411613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:19:33 -0700
X-CSE-ConnectionGUID: bw3HmsIUQIC2VycdjOIngw==
X-CSE-MsgGUID: cA6wQ42QTIOUeTNPIoTwDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250708423"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:19:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:19:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:19:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0pkQJF9En6Ux4X8RV/PtVXq7gUgD/kB7WShr0kNiu5YBUfeiajnGr8IhCNc2Y0F2Qkxnit26jsOWEkwcZ8F2h6EM2aeSpWiI2xZOVc/UETsG2AxklCGL0MB8kqjGru8tqHv+Z3cm0E0Afd/CaDi2h4Dweh47qwll9Iv3opftXFMfgloeOXvdTaCXB/5Y5mMp9jaMMvOOMpB1EvoUhGPSR4Bqv0XylIK/xaD1e2d3FluVef9duyEsATJGiqezQ2yiOhbovdrd5xVt8BBbq68KM2UvfLNm8tOe9A8iDnROkq0B7E5Ep/Hh4C1xgNDd+mgZqzD5pfKkfePIDWi96WL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCL519ixEM4q5UBG1+GshUJW7jASyxtarZ/2/B7OGro=;
 b=WYjvuvQiuAdvgUjBYf9Bqnpg25jpYlZdoKMwAla1i6MaISX9wzVAB4mYkuEqj0uoJQhHriDBfBNZ/+3Z1b7nvsbXVdR3pX8CHHAyiL1oNHJX2D+lvfv45YRJ3HTryFLB/6ur9sAePU/AYZgMkL0UFgWkIuJoVezMaY+rxOiC01bi/KN+F5QM694x89O7tCAlXV6ql6eqCMAjhhiDW8xgnMiDJIzDpc2tY+1uqAT1UkZCbKYU7Nnxdhq7wBL81ZWfYRnboUvkMTIzcGUhNGrre4Okutj8VgjRUpSMaa+F0/NT0e33lQHAC01IvSHMUwgmzdLqDwTdfgHbnh9oO/9Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:19:29 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:19:29 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_cdclk: Fix stale pending_crtc
 causing false bigjoiner skips
Thread-Topic: [PATCH i-g-t] tests/intel/kms_cdclk: Fix stale pending_crtc
 causing false bigjoiner skips
Thread-Index: AQHc94RWCAT7/SqCZUCRXMO82lqPN7Y12+Kw
Date: Tue, 9 Jun 2026 08:19:29 +0000
Message-ID: <PH7PR11MB6053300F1076113819232617E71D2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260608202805.2617965-1-swati2.sharma@intel.com>
In-Reply-To: <20260608202805.2617965-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|LV8PR11MB8772:EE_
x-ms-office365-filtering-correlation-id: a901213e-36dd-4952-0c9a-08dec5ffd405
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|3023799007|18002099003|11063799006|22082099003|56012099006|5023799004;
x-microsoft-antispam-message-info: s4tkaHGAMBEMvavTXYjRNCe2ecelZX99FA6p/S1xNLW+i6Owv/jt7RPwOGzmBo92HfVzpCWP5W4jikjkhuk29E+DUIHf7NVHhs7e++9ZLWCR23i0oA3WrYOL6KPIuSSEmyMDWqsB0iFIXT0PWsikJY1uHbZWRDImwfnAmvscnUgtaMeD4heROa8k67XQyUqV+6h8t7JLIB1ME0+ni+d4CgGqKG1djUFSnKQeYSFq12ZPBITxEcyOxPD3H3na340Tnt19oPvoKrihUZ9oN6wpyJl/+WV4/D0Db6wrYFgSdUddlK1N81iyK3wfA1bowOnQNuMWKzWXPRE0e14vZ+vutk23ikwLItmAZw/EWOfk3ZUeK3EEk/+KViVzfJ+PiCJF68VdWeF5w42zmzIuKfovO4Hi/mRIXvrqNOGGTe3YP8V7s7i89waVrQabSSPfxNCDMLQjXYA/x277u8699WTeHTCRB/JKfY2+jqUfVbUeIY8d1KgV3GvDlJt3mAKEQ4AaT/BaQ2IybVlqekkSq8VV072+XwO3twKWmzGf7sJe9i21C6k8lHlpvSIIxcjCm74dYXtq5/T81EEsJxuSP8ny1d9QbwmVF73MNf3smzAk6U0XQ/4BVq9oV+UtcVqdQKpO5DiRkZPvgNrP+Jjo89UwrPM41/ozWSrr2T8i4jCpKI0kPJjvEhkdLjoVePu+3HGmMgf73advIJPOX3X7fLZaTCJ6XMpBcTL+hPvGt6yIBFXw9sJpqL3B/QlJqq2IW9Qd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(3023799007)(18002099003)(11063799006)(22082099003)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Aggo+bcRF0pH6p1tctp6j+9tO8ts6/dEgKjHNpxOu+bUhjYKL558WdQM8nLe?=
 =?us-ascii?Q?6eN1dMwVUMFTzBe8yHmPn3vgu+dr3qkcdY+lrcZ9LldXlkMMY0btuVe999Hy?=
 =?us-ascii?Q?8FrbXH4NiMoPxOaQ3tPQYHgrqYzyV+WFQvLYkbTtV+zQm+7VdaH5nSONxUA1?=
 =?us-ascii?Q?NirOe4YsKdgZJbCEcaJjJhFniXITDAla9gMrVhSKo5Kkgz1Sfzcsvq6SqwwU?=
 =?us-ascii?Q?eWPZN/AM00wh0M3GiQy7xhNtfhWKOw+nC55AIO7qjJXMwLBl/kUyvyLxcBCq?=
 =?us-ascii?Q?QA2/9B/C3vGkjws5mS+bvGJY8GoGG0xOlBTsH+Pf4yLVLX16y5r7Biz1yqnA?=
 =?us-ascii?Q?f81Xoiw3vOtDTZBlZGrw+zvPRWN/rbBufWUkfJDeK5TkJPRMsmEv7KHUCfI4?=
 =?us-ascii?Q?mXfcWl8w7rwUdZt5+WFFHnRAq1JYfwfCM4XFW5k+nsD7MGfNBLnBO9TGgT5k?=
 =?us-ascii?Q?E4087OgMSJzgKqDqkuUmc0du7Sqcx+xCi21yreZbcDlHzCh3fZOMNYf7ZpBS?=
 =?us-ascii?Q?DKPrxslqTR7k6teCHTaEvH9N+pIGa8YCEEBQkm1j6ZPMeDqVAFYg1lf0ZAgK?=
 =?us-ascii?Q?ktJk7adfZJrmfCH/9A2iVorAVFl99PTCMjrlGw/xkfqKHPyeQWUoxGt0TKcB?=
 =?us-ascii?Q?cr7oMfyQfIe6GUEx9Rgikfr7WdREM+FmdgTskR8s6O8j/SusB0KubnwRA/YM?=
 =?us-ascii?Q?icpfPs9eZrnoEhc/4LfUhq6wE0kBjz82E8Jbd5K0IrUw9yggXtL3pXYhTGNX?=
 =?us-ascii?Q?C1E+Ma32TzDrGw2DDaXeecGaM9oIJiFLrmFdWPLpnQ3HQ9QooxScafAq0DUq?=
 =?us-ascii?Q?kFMab+bhClT2VPaXMaCtvqCFqtyOijtMCf4jCpi3aC/HUu0rL0D7FLKKuMMW?=
 =?us-ascii?Q?Uv10wOOjR4jfXy3Wp25d9lMCpaDkHgUVEua2MyJwasQlSssFD8imFAAzR5n+?=
 =?us-ascii?Q?Wrw7xgDZeZKysgDHKMoAyD207kRobXJguRnY4ERNczmR344VOAYvUpSPWReG?=
 =?us-ascii?Q?Y2WtltmuYBDxrC9S/3bS1PyMifxZg+/hyOgcsTNIgowUD5gJIlK7VXlMk0eX?=
 =?us-ascii?Q?bpouXeZ7JoVa/1lP6IizFi7RdAkDcysxEXv/UNzUxdz3igairnY/JsFK1UDm?=
 =?us-ascii?Q?AP2txTVTJWuLavuGeSEht1qZVua3RvistpzM+sqTfvOsDWiY8hSkjfhESJ4J?=
 =?us-ascii?Q?ykpOGWtyOmAt4k6vCUrm/qe5WZa0ZR6HD86HKzgIcbrC2IX2eO4UGpw3HRZX?=
 =?us-ascii?Q?mRZEEaf1S1Uj59jOl8t+N/oVjSFQSrDi3kMTYf5jMd65ysqLKYhw0ZvJXNZc?=
 =?us-ascii?Q?U5JvpEGawqYStR9VVGwBm2DBHCrvk78uOWq/Yre3dOjOh2BF534uwmr8W1Sa?=
 =?us-ascii?Q?B0HnYqhzb4tkEC0lAQgn01g2Ru87KTSWl9GW9P2AiqDRlZLidmzVGGGbvMtR?=
 =?us-ascii?Q?DSQtdJ9gLQGcVhE2OclIa3UPpXfP9GlFCbgVmr/BBQsQLYofll7Kre87KK55?=
 =?us-ascii?Q?TGIhaTEsBrzOp0tAvLPLquH6RldPRYLRoBBfob0v35hsCdzpDPKPnq558gMl?=
 =?us-ascii?Q?W5i8KsENlX2wenphD+Xx/ni6tqoda5G6Bu/N9M0rSVKITbrNtAfqc/UE279y?=
 =?us-ascii?Q?1XjK4rq3g4YJnV8pjxHc3ZOtHS0nBfpz2sFy9ALM+vKn4R2RsK2j9L8qjor0?=
 =?us-ascii?Q?dCFUm2Ql5HEVk8OA5kN0xfg55rA9rRrVSgwQ1F1nCJKMFsBTZhBF/EuJV5Kl?=
 =?us-ascii?Q?F72wMXH7dQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GE1YAbLL/3x0MVAFQkoUHQFX3MTx/PqoqKyKznkepSoXl80KFLLFiulkIjSscPtYWkngwfxgVpsbOg93PZ5Wa7wKC+lksf8d+N1NoMxtvfbVomQ2frsrxVR54mSN5OsoaJe+gcs8zcIDqBQ/1Ed6XzRHCWHL9ttCDAb+qQSb51+tYxsfZbHkjKLEmX7SeD3aPHfi6TBpkWKJDbTjwTr+pssHMFAKBteUyka8j7qQ2JztWr4UzotCQ+LXDvH6GFreza2o+lWsllh70GO4gYxUNJxhLQobY90HilTYtVvj/vxA1UwOAaeeXYMECgVztYqOqVh4Iq0N67vZh7yuxPUJ5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a901213e-36dd-4952-0c9a-08dec5ffd405
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 08:19:29.7093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Swb5FcAonSxasAJRb2vA70KP2CQCZhbr8I0l9Nwtmy4iNytHOO9wZY15WbIK+MFaxq+PatecrAhv/l4mvSZiSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
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

Hi Swati,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Tuesday, June 9, 2026 1:58 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Fix stale pending_crtc caus=
ing
> false bigjoiner skips
>=20
> When a dynamic subtest SKIPs via longjmp, pending_crtc remains set from
> the combo validation. Subsequent iterations then incorrectly see the pipe=
 as
> occupied, causing valid combos to be skipped.
>=20
> Fix by using a wrapper that clears pending_crtc before returning.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_cdclk.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c index
> 070fba400..2c5949ff2 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -327,6 +327,22 @@ static void
> test_mode_transition_on_all_outputs(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>=20
> +static bool
> +crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
> +			igt_output_t *output)
> +{
> +	bool ret =3D true;
> +
> +	igt_display_reset(display);

Could we consider avoiding igt_display_reset(display) here?

My understanding is that the stale pending_crtc state would be cleared=20
by igt_output_set_crtc(output, NULL) before returning. Is there any additio=
nal=20
stale state that requires a full display reset?

> +
> +	igt_output_set_crtc(output, crtc);
> +	if (!intel_pipe_output_combo_valid(display))
> +		ret =3D false;
> +	igt_output_set_crtc(output, NULL);
> +
> +	return ret;
> +}
> +
>  static void run_cdclk_test(data_t *data, uint32_t flags)  {
>  	igt_display_t *display =3D &data->display; @@ -334,12 +350,8 @@
> static void run_cdclk_test(data_t *data, uint32_t flags)
>  	igt_crtc_t *crtc;
>=20
>  	for_each_crtc_with_valid_output(display, crtc, output) {
> -		igt_output_set_crtc(output,
> -				    crtc);
> -		if (!intel_pipe_output_combo_valid(display)) {
> -			igt_output_set_crtc(output, NULL);
> +		if (!crtc_output_combo_valid(display, crtc, output))

Imho, as a suggestion, since this helper is only used in one place, conside=
r inlining the=20
check in run_cdclk_test() to keep the flow simpler and easier to follow.

Regards,
Pranay

>  			continue;
> -		}
>=20
>  		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output-
> >name) {
>  			if (flags & TEST_PLANESCALING)
> --
> 2.25.1

