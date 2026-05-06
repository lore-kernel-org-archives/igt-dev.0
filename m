Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ACACD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 04:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C7010E127;
	Wed,  6 May 2026 04:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/p2rP12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE1010E127
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 04:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778042298; x=1809578298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=76bCLElBphPWfKhC7RbpkUZRzALVAdrUJpCytjNwwVQ=;
 b=B/p2rP12JYHty+H7ZVckpouk+aS2urMNqTzsIOOIBHOS2zceaeJs80w9
 PR/jGHIVVI11ALZUSDULl2nfFSpFLYbiOhBfeIMKVXJqgOdRh070VutBs
 nyoPEwT//lEgYoQFJDZYQ7uOe/Sw7na+oZ9+8aV9vcGnhzMqL8pj7kEjR
 +HwGPtV+TQvvMAAtnTi+9Gk6DqWz0mXOYaLrzHL1Zdk0A4PymQXqYoZNp
 XBZWwWrLj0cKdENoZRjAoqqN0IXaNG8mfV+u+QW8DETUEtL1Tg+Bv4Qem
 wlNW7JUsKyXWeaVe7D14cevGmqyzx2LiwIGWWU3zt0nFdykTdNhAk1mwR A==;
X-CSE-ConnectionGUID: NF4JioXtRPCsRGZ0eubzYQ==
X-CSE-MsgGUID: FDbhZcCWTTqv1JWcetrqUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78863127"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78863127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 21:38:17 -0700
X-CSE-ConnectionGUID: EpXKuPmoS3+AC64aZf1J+Q==
X-CSE-MsgGUID: gxn4yGNASUGYd9Dnc6Ru6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="259377960"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 21:38:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 21:38:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 21:38:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 21:38:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfYG3AmUnFC5b7Zto+O2ezNevvMa1FtuUQQ6KUU9QYrLjD95+1pYSIOPQST/vhMfDvpmJLJ2k94KC6m+amcj5VPy1a8WhrLN81UqisxLYcZ3CT5CsWdHi35Uy3DZaHfUT5w+4Ne8oOKytcxx2EN5fNRSr92meeI/b70a/kqiygdvROJV3fC20xxJ0vaEnlb7fY7Vy/lIXQIkb38JYFFjaV7FgYiGksr96PDpbMg1PUsn7ovezUHV9dM9efrynpUI997Wl0ynl8oo5InyO/fbrBIaB4o2AFsiVzyIS04BCCHdrb85tb8YWBn6bcPTwtOx40bVO0s/SexS/zUwJBgXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z79XosU8vQT3q2C8uZdc5UaPGwKRFH0sXLLI1Sb9/8=;
 b=flNGdrCpVMfOzCVr/Wy88g4WIQAd7LrvD6yx4TneHzRYG8NecvXyo+Jbc20vw6bGY5PN0qiygvQ5XUZq/k/7Z7IdYuBiMFy3gU8eJ17ZhxAlnxGNOffEeMef5wwlqJxFWwWyNRWYTSREyrLUGex392ZIpV1pb3rq9aMSESDYh+hy8f+Ih/VEFyW/8dQIWeomBMSQDa/evnUs89WJKGnrs7pPCEGFpIXH0Hb5HvCuMwGr3Xxlm/RfR6y5j8KntcBfoS3jlkS7ilnXmtNfOys5n+Q1nI4eKCZVeKHLn8//hHjzCgqAcQVrkqrxX0cutKrycYZhfZKHSYiQV1QkfxzigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 04:38:08 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 04:38:08 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sebinraj, S" <s.sebinraj@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
Thread-Topic: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
Thread-Index: AQHc24m80yAag+hKck+kmCxbCjH+frYAascw
Date: Wed, 6 May 2026 04:38:07 +0000
Message-ID: <PH7PR11MB60536B8BEC7BF3E2556A3E30E73F2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260504054512.2192437-1-karthik.b.s@intel.com>
In-Reply-To: <20260504054512.2192437-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|MN2PR11MB4663:EE_
x-ms-office365-filtering-correlation-id: 84802d3b-075b-4145-8c58-08deab294577
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: b3aQdWQLX4fZqAeo9A0fHjLgMyI5OSOwLHR4wIjmCnShMRgQhUbxp0eQbkoic8oBNCC4DdCNQcTbW+QAikoSuFvT1Bodz2D9hwW8vJ4aK8rAWPoq+IrRICNhTFH9WXgefnqQlGx7CYk5Kmgv9nNfx7lqlbtnvc+DT3wz8om+mXs3n9j8pJ/j/MgQ2QYfKDVRUDMC0GxXTwVF0mLSDIeOUgJEUUI8IX+PayVQioXBE/rdoMB/vbqqYS/p8vVGbmYGrPMQjsNflAH3AypyEteVh4Ef6fesAEY1g9JHtxvaItf6tPnlDnqH9FC9sZkLrHURCXfL/YbWtnGs8JzfC5Nr6JM6mTAqQfOgmFx0v5J1/CscldPn//TWz90bgsU/JDMbQTTROcukLJGy3Bu3lMdQ3qJ9m2CGrNr0o18F86C1uhIKfRk1dHJiC0BycPV/9KK0P/ZV/FoOj3SABCPHaFD6vK124naalOptp0MTInJpwRtlNCMlELUFqWa5Aqh/H98GIQIoYifcogP9U79HgR1qypdzqeiQugljW2P7q0nCHGBTrCmA+XlFUw9Wq+DOBEuaeHkaHfQ03C2t3R3iHDaCw5hwxY97D6gMy2+zDSolMigwPM57yNxO/0kF3wOxmbrnxgLgCbg9XKPIr6uiRJirJ0V3KklI/mxs/rj+jVy1DIBYsX8hw/r8wUnKaOBTlXilRM9nEDadSCJggUsjrykAeaPmbayiQe0OfZQ2aLUiSCQnKLUHR4wXqrOn+ea53iuD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1cRfXOjtcunZ/DP0PIYaGTRMyi7MlACcd5E6NWOLpY4/NzcHFWgNtSsKBDvu?=
 =?us-ascii?Q?aZBpdtD9OOh8pEBuTOelrjL1k7L64R1EeT3YrKVGDKM0SDias1SCy4CSgOl7?=
 =?us-ascii?Q?NYhvZod6cUNXGiTMRY/ebpmn+FYmKKljNbofeUOc5cdKiOxBsY8aIjc0vU/C?=
 =?us-ascii?Q?omjs6meVq8g87/BuSIv50AK8roejFhq58qE6u0UJSEG0rtZZc9q+tMKI2ypw?=
 =?us-ascii?Q?5TD3NMv8LHZslunD0LIIXVfIIvqumeEjcaGbKIStqqsjTd5Aohq1k8/bl/Fh?=
 =?us-ascii?Q?ofj5AjKIsbnf5hLrDtVMbOFmOL+bGyS0tXK5Em7NSSH3hUYw333JBGBEV94w?=
 =?us-ascii?Q?WclYBEfHq6yfHbahFrh2iSmvKBNIsjWm4cc40uzEVDBYTDQPdzh7KqoYwD2I?=
 =?us-ascii?Q?wSB07Kk3jfjksyXUa9XJD+IvnjDlQqzmqhqzuyr/J6SBuZH6t1C5NOh57ujj?=
 =?us-ascii?Q?RKNVgp3fhKB/kwk+O97xT5k783Y+7guHjhd+ON+q2DIpAyHtB7PB2JPeAnUz?=
 =?us-ascii?Q?oiHvTUS4bar1kCwW0dOkgSaUxEjGXbMoXEMWr+xrqMz1L9k9BurTH+Vj6cnF?=
 =?us-ascii?Q?GKpQT4+tMrJTQsweV1Upkb+BhpamJT0i4ARqSrHRD55W6xNiGyepf4RGiO9B?=
 =?us-ascii?Q?C2RSAPWsmPFOTyvB5ImhLGB6F1/6EovTQDgwgNKkkGiYOpjq2ocIf6x+afv4?=
 =?us-ascii?Q?N9KTTXb8eqH6qIDeP2KKCQjKtwAzKKAjW4J0dGLpJz35PmLT/xXZZkOjJZpz?=
 =?us-ascii?Q?7eWN+xqYuaGcai4Rzexyjl3s+VMr9xAWH5VIEsW10E0EZ0fWiu8s0Wsf/PEQ?=
 =?us-ascii?Q?DhVI1xIg5xcl1e4AImaPme1LrUM6Gy73jfAQWjkI6GgmjNsZQHTec2hbcV18?=
 =?us-ascii?Q?Lr33tXOBsZ0F0teAMzJDQ8E5SA1K5odZ9w8fDwqIxJWLGc3K0Q6hJ5FZLFmN?=
 =?us-ascii?Q?yyUiVK2HxgbXFtx/dL6ruZwS5VP09BgY/3JWbqMLPrH7sUSFhyf8HU4OJwIs?=
 =?us-ascii?Q?JKZT48LWwn2l2NcMBXvI4el3ApDA0BuVfMi2ZAFkH7S4IgFlgO6ajQM6knP9?=
 =?us-ascii?Q?WDeVyyE2R3yux0ndqOqY52JkMLz5VXkN+neSi2//8quJWoXxzs6CINf9HhJk?=
 =?us-ascii?Q?0MF7wwuKQeY+oicaZz26I9dflP+kxL73SslvivrAqFoWcq4NR+H8advy4f5J?=
 =?us-ascii?Q?pYh1S3E3T2GpQbY6clX8DWEqH7W/XlP3SYLU/13Te4FX+WIiitdfIS/f7ExZ?=
 =?us-ascii?Q?xt8raMghHD+oZkG4+YZz1GHlqaa0TW1d1GpHEyr8dgIPALKRLTAZ60N6Kp6C?=
 =?us-ascii?Q?VmigKfnOAfVxXCg7hRvBkUz+ePFtvzQrQM1l/MVDdfX67to/FV5fOHJzmzdB?=
 =?us-ascii?Q?SFYyxc5tUrUsUGYGUxjHMg5gxiylgMHvyptcsXktFu3RiA8StjLrwwn0KXN5?=
 =?us-ascii?Q?7p50wBVfX0cj5KVbmXyP7i9mk3k5yuyRRl3SGw4qEY9UIuehxsANnfD5Jy36?=
 =?us-ascii?Q?BFXRZssjWPhmfntwhFV46lAbbeNW8Pn8WDBiW4yQFWasy2zzlm614brYxxzJ?=
 =?us-ascii?Q?MgQHNs8u7OUITVteC4Sw+HQib7JnpIGlz8Nsov8FLBPWWofra7tj3wZoVjdA?=
 =?us-ascii?Q?eTBDsCliyV68wLh99nS8hWddDDiKswsOW1m2tI6I7ogRERh2UPgN/3ZUKlMw?=
 =?us-ascii?Q?uIjjL+sYs8MUKN/mHFUKdls1g5YSqavfGbmMAYGxrQHB6qEBZ68OoXgTeW1K?=
 =?us-ascii?Q?g590J1iTXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mhi7xZfZSXRoGUZdu87MDffQAPSEmFe+VY3s0+GozoWwMVPhe2u48upFvf34h4nja3TLyUxqECeMeUs6x0sXmD+oJtBRTdni75wN8YfeUmNhAoQbBotH06OgywRzmPB8Wu7PKkCd7e6XIJrslbucF+B/nujCh1C8qBHpBovt1rekirE4v5sVJkR5+mT5mYuKxTV8HblFcYW9Nu6JP8+JeQlQIR15uJW6v+BkLYFg1pPUADRBqH/NVP6MnoODlvkmP+K1EFEBkh/YxMaR0BpkFdGnQnyKScQdTT0KmdTdjwK3kMjGn+830Brth1xzz0TmoCo2queyjxju1U6+ZSZWDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84802d3b-075b-4145-8c58-08deab294577
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 04:38:08.0110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 05KwS3stSYFJD5EmbYi3mAMCV84ygrqvJwg9bEluuW4XYMVB/3/M4ehmiDzgDlFyN3of7dyvtet7e0x7323paA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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

Hi Karthik,

> -----Original Message-----
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Monday, May 4, 2026 11:15 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Sebinraj, S <s.sebinraj@intel.com>; Karas, Krzys=
ztof
> <krzysztof.karas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
> waits on test failures
>=20
> Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
> commit and install an exit handler to signal any still-unsignaled fences.
> This prevents cleanup hangs when an assertion fires after commit submissi=
on
> but before the test signals the blocking fence.
>=20
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_explicit_fence.c | 58
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c inde=
x
> 2ec9bf39d..7ffdcb285 100644
> --- a/tests/kms_explicit_fence.c
> +++ b/tests/kms_explicit_fence.c
> @@ -68,6 +68,42 @@ typedef struct {
>  	igt_pipe_crc_t *pipe_crc;
>  } data_t;
>=20
> +/*
> + * State tracked across the lifetime of an in-flight atomic commit that
> +has
> + * IN_FENCEs attached. The exit handler uses this to unblock any
> +pending
> + * commit if an assert hits between the commit and the point where
> + * the test would otherwise signal the unsignaled fence(s).
> + */
> +static struct {
> +	int timelines[NUM_PLANES];
> +	bool needs_signal[NUM_PLANES];
> +	bool active;
> +} pending_fence_state =3D {
> +	.timelines =3D { -1, -1, -1 },
> +};
> +
> +static void signal_pending_fences(int sig) {
> +	if (!pending_fence_state.active)
> +		return;
> +
> +	for (int i =3D 0; i < NUM_PLANES; i++) {
> +		if (pending_fence_state.timelines[i] < 0)
> +			continue;
> +
> +		if (pending_fence_state.needs_signal[i]) {
> +			/*
> +			 * Best-effort: advance the timeline so the kernel
> +			 * stops waiting on this IN_FENCE.
> +			 */
> +
> 	sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
> +			pending_fence_state.needs_signal[i] =3D false;
> +		}
> +	}
> +
> +	pending_fence_state.active =3D false;
> +}
> +
>  static void setup_output(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display; @@ -242,8 +278,14 @@
> static void multiplane_atomic_fence_wait(data_t *data)
>=20
>  		/* Attach IN_FENCE_FD to plane */
>  		igt_plane_set_fence_fd(planes[i], fences[i]);
> +
> +		pending_fence_state.timelines[i] =3D timelines[i];
> +		pending_fence_state.needs_signal[i] =3D !should_signal[i];
>  	}
>=20
> +	/* Arm the exit handler before the NONBLOCK commit goes out. */
> +	pending_fence_state.active =3D true;
> +
>  	/* Swap overlay colors to detect scanout changes via CRC */
>  	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
>  	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X,
> OVERLAY1_POS_Y); @@ -299,6 +341,7 @@ static void
> multiplane_atomic_fence_wait(data_t *data)
>  	igt_assert_crc_equal(&crc_before, &crc_after);
>=20
>  	/* Now signal the blocking fence (overlay2) */
> +	pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] =3D false;
>  	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
>=20
>  	/* Wait for overlay2 fence to be signaled */ @@ -311,6 +354,12 @@
> static void multiplane_atomic_fence_wait(data_t *data)
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(sync_fence_status(out_fence), 1);
>=20
> +	/*
> +	 * The pending atomic commit has now completed, so the exit
> handler
> +	 * no longer needs to rescue it.
> +	 */
> +	pending_fence_state.active =3D false;
> +

pending_fence_state.timelines[] retains stale fds after use. Consider reset=
ting them to -1 in signal_pending_fences() after signaling, to avoid accide=
ntally operating on a reused fd in edge cases.

Regards,
Pranay

>  	/* Verify display has now updated (CRC should differ from baseline)
> */
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
>=20
> @@ -353,6 +402,13 @@ int igt_main()
>=20
>  		data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.crtc-
> >crtc_index,
>=20
> IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +		/*
> +		 * Make sure that on any failure mid-test, any unsignaled
> +		 * IN_FENCE that the kernel is still waiting on gets
> +		 * signaled so cleanup can complete instead of hanging.
> +		 */
> +		igt_install_exit_handler(signal_pending_fences);
>  	}
>=20
>  	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay)
> "
> @@ -363,6 +419,8 @@ int igt_main()
>  		multiplane_atomic_fence_wait(&data);
>=20
>  	igt_fixture() {
> +		signal_pending_fences(0);
> +
>  		reset_display_state(&data);
>  		igt_pipe_crc_free(data.pipe_crc);
>  		cleanup_crtc(&data);
> --
> 2.43.0

