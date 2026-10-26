Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A1606A31B
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4FBkmpd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAC910ED57;
	Mon, 26 Oct 2026 09:43:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6D10ED21
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793007724; x=1824543724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zqxaflahX8nOR/hK3lLTOjtNZH++gQpmxiFZsrcVLxE=;
 b=N4FBkmpdAFd9hiwdiRqYaqXskeXzuyv3nlXjsXD38TejUjEnRLGDMSVd
 IJApRpYUxi6fUsQ3AZCe8PaorYR+H+pcHbtZ7FK9X2aPICciAWTh1ljfI
 3TXo/eJbvRnm7scucrVGDi1vKecfCANYv1l1+xBuH7hU8BqRSRL0g639C
 tG03KqJwUzr5KIpSVCeKbHAQcbH1cQw+Gn7pgnR0F+2npnGQCmnDIVtj3
 1CgeG9+0KLV+ma3l2LO9cTU4Lbp4Hw98sS86hbFfOYYr4GA2i5WoxSDdD
 TUmvfd2OZAj/Vpg9fRI9wBYfDPJbk2twbAQWYAPTrFb60aGNpN7F57pxO g==;
X-CSE-ConnectionGUID: Tv+Nu2CeQU64bE2omuWBIA==
X-CSE-MsgGUID: eNzScuM7RqeJDohRni7+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1695034"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1695034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:42:04 -0700
X-CSE-ConnectionGUID: 80zaSJRHTfC/wFc4rsrPQg==
X-CSE-MsgGUID: peDB265ZQk6YY0i8x6iQ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4624977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:42:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 02:42:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 02:42:02 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 02:42:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UorlkGz9t3HUuLTR0f5V2Ssq6I2OZ6qHw7Y4oLq/O9S5io6hvpqKloouEN+DMAq6BzxVtw5HwNI0wdrzBaJI12d2aTjpPFIThL6fUqmzCb/WiZ7dI/F4Vuqr16SPzGogNuk6yilgdNTYO2tW/zMFVMSRBPV0LcWWV0k9J7Bbzhh4z+1KE1Xn+u7iipsC/yMc+thNScO4vRHPpZrJewCRJ53cRVxCkG4SRihZg3XjS/5YDiqFf2Xm/Y5gsQ/dAegyk8mQYMKgZ9XJDqEqTGBWtJmrOFtL1BD95PgNy1XmBMnvmai48mLaSBzh48RGEW7/m6dz3Fv8Fuld2xe4dfre8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqTO3lWe+ZvXmhr4UE7XqmObojuN70IqacygfRIINNA=;
 b=MjBqzMwMyyClJj6s+FnOmP7YuRwlzUrnSl2u2frLWiu3NaiOHna8GQp8eF0ezlpYDm1OKx/UDFO/HQ8NfVJTaqmJsLhUjq3/yMyybCy7nZLWsTacF2cMuUzRTNLpwAQiDCNy1YGLDOT0KjZ8J0lv2ZM7RtEokW4x5CSlFF0e0kTYM2DQpcdFNh1VVhIqrvPj3N1FSUEA5l9VTWr6yhpGa0MKzAKFtJRL2Uvlp900Yr/ittM58zA4K0O6HLUGCzpvtqchK1vtdAj7zSoz679VTDltUjLQ0/jWpAQ0FXlkDXiSiLAolIpy13ueUF+VIgezPRwl5Z3hb4HPRlQxuK+50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:41:55 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:41:55 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v2 1/3] lib/igt_hdcp: add shared HDCP helper library
Thread-Topic: [PATCH i-g-t v2 1/3] lib/igt_hdcp: add shared HDCP helper library
Thread-Index: AQHdYhPNBBFBBXafe0Of1JFH1JpAuLcPi55g
Date: Mon, 26 Oct 2026 09:41:54 +0000
Message-ID: <PH7PR11MB60537AB64BCDD2F397B1D435E7612@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261022105102.384486-1-sowmiya.s@intel.com>
 <20261022105102.384486-2-sowmiya.s@intel.com>
In-Reply-To: <20261022105102.384486-2-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: 4ef36800-6d47-4a7f-fe33-08df33455eae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|11063799006|5023799004|56012099006|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 86CcPlYZk5t3NlLTXX9dRud3YPwg/nizlqW+yYs8nWBXRzJ+FHLnxCWPIkuvxPDZIQ8H/Km2BOhEvQ+VrwXpMfiLKj6hTTlvQkDETqj4h2ztI3LczozuqItRMzD/lsDAQ0JOZES12lMrFMkDeoAZeNNbTMgV6pTBG3aCiHcJFGa0BbakYNflFm+D14tS5dREgbZI6IAGr1mRkEq+HmokZc8f/BYYNBfuCxnXqP5FZg10GB4owXTtf8g4EbO5FuHdshHTv/M0EJ0nh2mhYT1edixlml86IkmgqJvt9rWXuCXLv3bTqqviXun77voFYUoZxhSJGrf0s9Tr1+FkyDn0kuM40bhjpkd7DcLve90r+zNIXAVIqaiWhMn0I3hpDxRyVljqmaYFPMFA8CmnvHMXguAcg+Xm9rA185Hqf55dtyKG558R00e+IWd+jx/JnGPRAYp6lHo80laL/7w2XngapLOA/igQecrSl750E14xafBtntJNy11V+4h5GqhshG1LMk22UQ+azNlR0jCZ5QUNIbUlE0lj9ExEvp2mAoPM3bPABscA7XkzWZ3SWJKWo9sjGTWKQOi3moesDkM2DznnYPCnTvLGTRm5TcgGwkPKa2wJUV1XITdtGgKg3kH/xht6RM5hPubRPE57yuAG6M5x1Phic6mxT9ifSV4Fu9XwQaZ1Z3dlYezSVfZiSzW8Nu9f1HDNuc0QCmj7fBhkniONswPX5/5b22i5tv9crt2UkHk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pCYLcRaZNlH5GwjrZUO/tSRiJlfHrxU4ra9c0GG9cHd0Z4NN9Icx4S0FKQ?=
 =?iso-8859-1?Q?WiZcBoBolpI/L/A2AsD9W4w6h7gGaE96/2mODO+VfjOLghPBEqHV5uuMil?=
 =?iso-8859-1?Q?yK7AkcwIdGA5/eohDgo3+HAVsgEo4ICCt37zlyvomx3ePSLzOU3jmcZ6rn?=
 =?iso-8859-1?Q?NWyuJRq1WuB8jtzsMSD0e8DbQHRkwH3h1gy069e5Jj+1M4y2gD5OXSiBBB?=
 =?iso-8859-1?Q?Pd7MaTDSl050sz/tuJdiSHNc/EO5UIwFY/k4wPKQjflWR4h3Njy2A/53pb?=
 =?iso-8859-1?Q?hlfQ4bDmVyGjI9DKRC2DCc2GZfGZwbUEkn+dzZRo1EzmWApkRrgvT4UyAV?=
 =?iso-8859-1?Q?u0BndJ6d42UPCwa7CWt4Y3mkoz8wW5SoZtFOSssmYLWmt0xTJ4iUSOLzqT?=
 =?iso-8859-1?Q?oc3hnycsMHrUg6gWxt7nXdJcpPchFFNjzTmPJ2kPw82YYyLshENU7BkFYu?=
 =?iso-8859-1?Q?vj/9lyRyptqnFDysBQXNCD/YEUny2HZMT8K4U4YjJu4suYKvSi6LVQ1nuq?=
 =?iso-8859-1?Q?PZEHq/QWFQ3g6vjiMrLu5dcwGPSvye3rcmeJFXy/7xgREDDfHu03mFDuib?=
 =?iso-8859-1?Q?/1p0aib4XOkvI3sgcm4VP0k5MR6ua3plZOxdbLCXpLen60ETyrWhIa+4Ab?=
 =?iso-8859-1?Q?gOk+LZLbmjH5mh1IRYYa5ADaTBYe9N7BG75q2dYE5/wE9CoWZwYl7FJTAM?=
 =?iso-8859-1?Q?jGA89+dFhUAhK4Gw0k/hTbSz12du+9woOCnvjSuPRken+K1U+UdVIJr2mP?=
 =?iso-8859-1?Q?28uvw7GStGCvBBK+FtQyTcFyfazB484V3mwldm88k4lAKQktJKRS28fsUi?=
 =?iso-8859-1?Q?C/WvrrDKVyMpIw1GN6rw8ci/t2YfHgEy1llfdaTtYKrNhg68nkA7IInt8y?=
 =?iso-8859-1?Q?QxuEIdvtIJbJIIGw3KYHuIrZfe4apRJPC0OyT5HniP61e7BZn2pTvkpXw9?=
 =?iso-8859-1?Q?K/iCZAaCg+O9NDhGqDlfTFgOiKTigMl5e0akJZ5MVdKgRP0V3T4w0Fybl7?=
 =?iso-8859-1?Q?J6f38yDf9QadNmRn8/x0opLa6EFQniPi/i4wwUB/JJBsuei56zl1OxvxuE?=
 =?iso-8859-1?Q?mk30x9TP4oFkaj1/WLKWHtva1L+e/riSMv9vjWm1MM6tH15ayxRqjTVDnx?=
 =?iso-8859-1?Q?AarEflaCGfSzM9fqlbWpoaFjJtxH16iPxL5CDoYrH/tz8/hh8pllZ3Vosx?=
 =?iso-8859-1?Q?m16GotfQydU/RzxbCyNedSnff3t/0CT3P6bzoEOjm4SnRQmxTEidlCOOll?=
 =?iso-8859-1?Q?PoikqzJVg1V5N/5Ibkf0IUFKGlxgGfewsSKs7y27ke7wJuX/nvycIhRpsF?=
 =?iso-8859-1?Q?ydeka4qHveY84g75qdaFneKjiL7bbghSuEkjPS1KXVbEoeqbMFH9AafjsQ?=
 =?iso-8859-1?Q?1gvBlTt+eHbUeGBeWMUFcBsnXqL3DLuGBoc113S7kzAffZsrM9f3l20/VK?=
 =?iso-8859-1?Q?yqfaG1Hi0eKlyPo1o6ACPbongvWHtR2OLVcYsb0ugS3p82+PoCdOaw76XR?=
 =?iso-8859-1?Q?ulTBkz9cl+ai8VyYuHOCFOyuzwbXXpsurf8wlpIs2Fpe40YwtG7ccDP837?=
 =?iso-8859-1?Q?mv5IbDkMP7QfCwDeNg+cvbmIb1XP1H2obPXpYxwTHv5gINKm42h/SrOpVR?=
 =?iso-8859-1?Q?P7En5uX2nSyeP4dwJlrVzUBG/u502XvtXXvpz1RVuHiQcaSC36Fyns0g6e?=
 =?iso-8859-1?Q?OHPkEmeq+wsHFzMrGxr1nviFcjD5jN7BDCqHEmbc+8gYAaoPiVodpSKoT9?=
 =?iso-8859-1?Q?/vFL28PNxD0BcJzMKWHcURUGZgiawWlEc4bL78nV/vGf3WabLMOMR+mwTE?=
 =?iso-8859-1?Q?5R2y6n+5ow=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: x6INmoJowe8I29Y9XUxMFKLavtg3c0KdeDYX6JENHf+qbLJr5XFh1TFURQCuVN1QhZZZXQJ4ItwlNgA5bj73qqmbjjrNkp/37RbsM0bTKNk1WZalNDiAuHZRnWt2AWHW/Q+BbVxXuK9D38IOigRFEo6LvRRIWpkSBbd2LSfEFmb+OhvmKkCbviumk8vR2gpjhSb/Q4vm2iZz+A5pzD0uSzN3pl4yoeD3wgiXjjq9i/j5WxqPcms1gqeFkYM3KpunyKb+2BkVgZuXTcpbfErfEk98TW/LtHxY+I5ePLQhBfgbsR4/6SL0BrwfWQKciOZl3qXwpH7bdYkZhNuvXDW8cg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef36800-6d47-4a7f-fe33-08df33455eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 09:41:54.3758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UBHbVX1YoyX9QUkWmhU7QPeUR2uSYwSSAAQvxw5Q67c7QN6WdwjPASo7SIMqr6NVnxfrwACKjmTUxDmYPnkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sowmiya,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Sowmiya S
> Sent: Thursday, October 22, 2026 4:21 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v2 1/3] lib/igt_hdcp: add shared HDCP helper librar=
y
>=20
> Introduce lib/igt_hdcp.{c,h} providing shared HDCP helpers (content
> protection property get/set, sink/output capability checks,
> force-HDCP1.4 debugfs toggling, and DP-MST topology detection)
> parametrized over output arrays so single-output and DP-MST callers can
> share the same primitives. This is purely additive and not yet used by an=
y
> test.
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_hdcp.c  | 423
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_hdcp.h  |  67 ++++++++
>  lib/meson.build |   1 +
>  3 files changed, 491 insertions(+)
>  create mode 100644 lib/igt_hdcp.c
>  create mode 100644 lib/igt_hdcp.h
>=20
> diff --git a/lib/igt_hdcp.c b/lib/igt_hdcp.c new file mode 100644 index
> 000000000..bbf32cbae
> --- /dev/null
> +++ b/lib/igt_hdcp.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "drmtest.h"
> +#include "igt_debugfs.h"
> +#include "igt_edid.h"
> +#include "igt_hdcp.h"
> +#include "igt_panel.h"
> +#include "igt_sysfs.h"
> +
> +#define MAX_SINK_HDCP_CAP_BUF_LEN	5000
> +
> +static void __debugfs_read(int fd, const char *param, char *buf, int
> +len) {
> +	len =3D igt_debugfs_simple_read(fd, param, buf, len);
> +	igt_require(len !=3D -ENOENT);
> +	if (len < 0)
> +		igt_assert_eq(len, -ENODEV);
> +}
> +
> +#define debugfs_read(fd, p, arr) __debugfs_read(fd, p, arr,
> +sizeof(arr))
> +
> +/**
> + * igt_hdcp_set_content_protection_desired:
> + * @output: output to enable content protection on
> + * @content_type: IGT_HDCP_CONTENT_TYPE_0 or
> IGT_HDCP_CONTENT_TYPE_1
> + * @type_change: when false, also sets the "Content Protection"
> +property
> + * to DESIRED; when true, only updates the HDCP content type (used for
> + * type-change-while-enabled testing).
> + *
> + * Does not commit the display - the caller is responsible for that.
> + */
> +void igt_hdcp_set_content_protection_desired(igt_output_t *output,
> +					     int content_type,
> +					     bool type_change)
> +{
> +	if (!type_change)
> +		igt_output_set_prop_value(output,
> +
> IGT_CONNECTOR_CONTENT_PROTECTION,
> +					  IGT_HDCP_DESIRED);
> +
> +	if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
> +		igt_output_set_prop_value(output,
> +
> IGT_CONNECTOR_HDCP_CONTENT_TYPE,
> +					  content_type);
> +}
> +
> +/**
> + * igt_hdcp_set_content_protection_undesired:
> + * @output: output to disable content protection on
> + *
> + * Does not commit the display - the caller is responsible for that.
> + */
> +void igt_hdcp_set_content_protection_undesired(igt_output_t *output) {
> +	igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION,
> +				  IGT_HDCP_UNDESIRED);
> +}
> +
> +/**
> + * igt_hdcp_wait_for_prop_value:
> + * @output: output to poll
> + * @expected: expected "Content Protection" property value
> + * @timeout_mSec: timeout, in milliseconds
> + *
> + * Returns: true if @output's "Content Protection" property reached
> + * @expected within @timeout_mSec.
> + */
> +bool igt_hdcp_wait_for_prop_value(igt_output_t *output, uint64_t
> expected,
> +				  uint32_t timeout_mSec)
> +{
> +	uint64_t val;
> +	int i;
> +
> +	for (i =3D 0; i < timeout_mSec; i++) {
> +		val =3D igt_output_get_prop(output,
> +
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +		if (val =3D=3D expected)
> +			return true;
> +		usleep(1000);
> +	}
> +
> +	igt_info("prop_value mismatch %" PRId64 " !=3D %" PRId64 "\n",
> +		 val, expected);

Can this timeout_mSec be 0?=20
If yes, then the loop never runs and val is printed uninitialized.=20
Please initialize val before the loop.

> +
> +	return false;
> +}
> +
> +/**
> + * igt_hdcp_wait_for_prop_value_multi:
> + * @outputs: array of outputs to poll
> + * @count: number of outputs in @outputs
> + * @expected: expected "Content Protection" property value
> + * @first_timeout_mSec: timeout used while waiting on outputs[0]
> + * @additional_timeout_mSec: timeout used while waiting on
> +outputs[1..count)
> + *
> + * Generalizes igt_hdcp_wait_for_prop_value() to an array of outputs
> +that are
> + * expected to reach @expected together (e.g. a DP-MST topology). Pass
> + * @count =3D=3D 1 for a single output.
> + *
> + * Returns: true if all outputs reached @expected within their timeout.
> + */
> +bool igt_hdcp_wait_for_prop_value_multi(igt_output_t **outputs, int
> count,
> +					uint64_t expected,
> +					uint32_t first_timeout_mSec,
> +					uint32_t additional_timeout_mSec)
> +{
> +	bool ret;
> +	int i;
> +
> +	ret =3D igt_hdcp_wait_for_prop_value(outputs[0], expected,
> +					   first_timeout_mSec);
> +
> +	for (i =3D 1; i < count; i++)
> +		ret &=3D igt_hdcp_wait_for_prop_value(outputs[i], expected,
> +						    additional_timeout_mSec);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_hdcp_check_lic:
> + * @outputs: array of outputs that share a Link Integrity Check cycle
> + * @count: number of outputs in @outputs
> + * @first_output: index, within @outputs, of the output to actively
> +wait on
> + * @period_mSec: time to wait for a Link Integrity Check cycle
> + * @retry_once: if true, a single degrade-to-DESIRED is tolerated and a
> + * second @period_mSec window is given for reauthentication before
> failing.
> + * If false, any transition to DESIRED during @period_mSec is a hard fai=
lure.
> + * @failed_index: if non-NULL, set to the index (within @outputs) of
> +the
> + * output that failed the check. Only meaningful when the return value
> +is
> + * false.
> + *
> + * Waits up to @period_mSec for outputs[@first_output]'s "Content
> Protection"
> + * property to degrade to DESIRED, which signals a Link Integrity Check
> + * failure (the property is expected to stay at ENABLED for the whole
> + * window). Then checks that none of the outputs after it in @outputs
> +also
> + * degraded to DESIRED in the meantime.
> + *
> + * Returns: true if the Link Integrity Check held on all outputs.
> + */
> +bool igt_hdcp_check_lic(igt_output_t **outputs, int count, int first_out=
put,
> +			uint32_t period_mSec, bool retry_once,
> +			int *failed_index)
> +{
> +	bool became_desired, ret;
> +	int i;
> +	uint64_t val;
> +
> +	if (failed_index)
> +		*failed_index =3D first_output;
> +
> +	/* Wait for period_mSec (min 2 cycles of Link Integrity Check) */
> +	became_desired =3D
> igt_hdcp_wait_for_prop_value(outputs[first_output],
> +						      IGT_HDCP_DESIRED,
> +						      period_mSec);
> +	if (became_desired && retry_once) {
> +		igt_debug("Link Integrity Check failed, waiting for
> reauthentication\n");
> +		became_desired =3D
> igt_hdcp_wait_for_prop_value(outputs[first_output],
> +
> IGT_HDCP_DESIRED,
> +							      period_mSec);

retry_once has no effect here. When the first wait returns, the property is=
 already DESIRED,=20
and the kernel needs a few hundred ms to re-authenticate. The second wait r=
eads the property=20
before its first sleep, finds DESIRED and returns true immediately, so the =
check fails anyway.=20

The function never actually waits for re-authentication, despite what the d=
ebug message says.
To really tolerate one failure, wait for ENABLED first and then run a fresh=
 LIC window:

if (became_desired && retry_once) {
	igt_debug("Link Integrity Check failed, waiting for reauthentication\n");
	if (!igt_hdcp_wait_for_prop_value(outputs[first_output],
					  IGT_HDCP_ENABLED,
					  IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC))
		return false;
	became_desired =3D igt_hdcp_wait_for_prop_value(outputs[first_output],
						      IGT_HDCP_DESIRED,
						      period_mSec);
}

> +	}
> +
> +	ret =3D !became_desired;
> +
> +	for (i =3D first_output + 1; ret && i < count; i++) {
> +		val =3D igt_output_get_prop(outputs[i],
> +
> IGT_CONNECTOR_CONTENT_PROTECTION);
> +		ret =3D (val !=3D IGT_HDCP_DESIRED);
> +		if (!ret && failed_index)
> +			*failed_index =3D i;
> +	}
> +
> +	return ret;
> +}
> +
> +static bool debugfs_read_sink_capability(int drm_fd, igt_output_t *outpu=
t,
> +					 char *buf, int len)
> +{
> +	int fd;
> +
> +	fd =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	/*
> +	 * FIXME: As of now XE's debugfs is using i915 namespace. Once
> Kernel
> +	 * changes got landed, please update this logic to use XE specific
> +	 * debugfs.
> +	 */
> +	if (is_intel_device(drm_fd))
> +		__debugfs_read(fd, "i915_hdcp_sink_capability", buf, len);
> +	else if (is_mtk_device(drm_fd))
> +		__debugfs_read(fd, "mtk_hdcp_sink_capability", buf, len);
> +	else
> +		__debugfs_read(fd, "hdcp_sink_capability", buf, len);
> +
> +	close(fd);
> +
> +	igt_debug("Sink capability: %s\n", buf);
> +
> +	return true;
> +}
> +
> +/**
> + * igt_hdcp_sink_capable:
> + * @drm_fd: drm file descriptor
> + * @output: output whose sink should be checked
> + * @hdcp_version: 1 for HDCP1.4, 2 for HDCP2.2
> + *
> + * Returns: true if the connected sink advertises support for
> @hdcp_version.
> + */
> +bool igt_hdcp_sink_capable(int drm_fd, igt_output_t *output, int
> +hdcp_version) {
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	if (!debugfs_read_sink_capability(drm_fd, output, buf, sizeof(buf)))
> +		return false;
> +
> +	return strstr(buf, hdcp_version =3D=3D 2 ? "HDCP2.2" : "HDCP1.4"); }
> +
> +/**
> + * igt_hdcp_output_capable:
> + * @drm_fd: drm file descriptor
> + * @output: output to check
> + * @content_type: IGT_HDCP_CONTENT_TYPE_0 or
> IGT_HDCP_CONTENT_TYPE_1
> + *
> + * Returns: true if @output supports the required Content Protection
> + * properties and the connected sink supports the requested
> @content_type.
> + */
> +bool igt_hdcp_output_capable(int drm_fd, igt_output_t *output,
> +			     int content_type)
> +{
> +	if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
> +		return false;
> +
> +	if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
> content_type)
> +		return false;
> +
> +	if (content_type && !igt_hdcp_sink_capable(drm_fd, output, 2)) {
> +		igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
> +			 output->name);
> +		return false;
> +	} else if (!igt_hdcp_sink_capable(drm_fd, output, 1)) {
> +		igt_info("\tSkip %s (Sink has no HDCP support)\n",
> +			 output->name);
> +		return false;
> +	}

Type 1 only needs HDCP 2.2, but this code also checks for HDCP 1.4.=20
As a result, a sink that supports only HDCP 2.2 is skipped for Type 1.

Please check only the version that is needed. Something like below:

if (!igt_hdcp_sink_capable(drm_fd, output, content_type ? 2 : 1)) {
	igt_info("\tSkip %s (Sink has no %s support)\n", output->name,
		 content_type ? "HDCP2.2" : "HDCP");
	return false;
}

> +
> +	return true;
> +}
> +
> +/**
> + * igt_hdcp_is_output_test_exempt:
> + * @drm_fd: drm file descriptor
> + * @output: output to check
> + * @blocklist: array of sink names that should be excluded from HDCP
> +testing
> + * @blocklist_size: number of entries in @blocklist
> + *
> + * Returns: true if @output's connected sink is on @blocklist (or
> +doesn't
> + * report a sink name at all).
> + */
> +bool igt_hdcp_is_output_test_exempt(int drm_fd, igt_output_t *output,
> +				    const char *const blocklist[],
> +				    size_t blocklist_size)
> +{
> +	drmModePropertyBlobPtr edid_blob =3D NULL;
> +	uint64_t edid_blob_id;
> +	const struct edid *edid;
> +	char edid_vendor[4];
> +	char sink_name[20];
> +
> +	igt_assert(kmstest_get_property(drm_fd,
> +					output->config.connector-
> >connector_id,
> +					DRM_MODE_OBJECT_CONNECTOR,
> "EDID", NULL,
> +					&edid_blob_id, NULL));
> +
> +	igt_assert(edid_blob =3D drmModeGetPropertyBlob(drm_fd,
> edid_blob_id));
> +
> +	edid =3D (const struct edid *)edid_blob->data;
> +	edid_get_mfg(edid, edid_vendor);
> +	edid_vendor[3] =3D '\0';
> +
> +	edid_get_monitor_name(edid, sink_name, ARRAY_SIZE(sink_name));
> +
> +	drmModeFreePropertyBlob(edid_blob);
> +
> +	/* Not all monitors have sink names */
> +	if (sink_name[0] =3D=3D '\0') {
> +		igt_debug("no sink name\n");
> +		return true;
> +	}
> +
> +	return igt_is_panel_blocked(sink_name, blocklist, blocklist_size); }
> +
> +/**
> + * igt_hdcp_get_capable_outputs:
> + * @display: igt_display_t to iterate
> + * @drm_fd: drm file descriptor
> + * @content_type: IGT_HDCP_CONTENT_TYPE_0 or
> IGT_HDCP_CONTENT_TYPE_1
> + * @blocklist: array of sink names excluded from HDCP testing
> + * @blocklist_size: number of entries in @blocklist
> + * @hdcp_outputs: array to be filled with HDCP-capable, non-exempt
> +outputs
> + * @max_outputs: capacity of @hdcp_outputs
> + *
> + * Returns: the number of outputs written to @hdcp_outputs.
> + */
> +int igt_hdcp_get_capable_outputs(igt_display_t *display, int drm_fd,
> +				 int content_type,
> +				 const char *const blocklist[],
> +				 size_t blocklist_size,
> +				 igt_output_t **hdcp_outputs,
> +				 int max_outputs)
> +{
> +	igt_output_t *output;
> +	int count =3D 0;
> +
> +	for_each_connected_output(display, output) {
> +		if (!igt_hdcp_output_capable(drm_fd, output, content_type))
> +			continue;
> +
> +		if (igt_hdcp_is_output_test_exempt(drm_fd, output,
> blocklist,
> +						   blocklist_size)) {
> +			igt_info("Skipping HDCP test on %s, as the panel is
> blocklisted\n",
> +				 output->name);
> +			continue;
> +		}
> +
> +		if (count < max_outputs)
> +			hdcp_outputs[count++] =3D output;
> +	}
> +
> +	return count;
> +}
> +
> +/**
> + * igt_hdcp_force_hdcp14:
> + * @drm_fd: drm file descriptor
> + * @output: output to toggle
> + * @enable: true to force HDCP1.4, false to clear the override
> + *
> + * Toggles the "i915_force_hdcp14" debugfs knob for @output, if present.
> + */
> +void igt_hdcp_force_hdcp14(int drm_fd, igt_output_t *output, bool
> +enable) {
> +	int fd, ret;
> +	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
> +
> +	fd =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_require_f(fd >=3D 0, "Cannot open %s debugfs\n", output->name);
> +
> +	if (enable) {
> +		ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> +					      sizeof(buf));
> +		if (ret <=3D 0) {
> +			igt_info("i915_force_hdcp14 not supported\n");
> +			close(fd);
> +			return;
> +		}
> +
> +		ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
> +		igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
> +
> +		ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> +					      sizeof(buf));
> +		igt_assert_f(ret > 0 && strstr(buf, "yes"),
> +			     "i915_force_hdcp14 is not set to 'yes' on %s
> debugfs\n",
> +			     output->name);
> +	} else {
> +		ret =3D igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
> +		igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
> +
> +		ret =3D igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
> +					      sizeof(buf));
> +		igt_assert_f(ret > 0 && strstr(buf, "no"),
> +			     "i915_force_hdcp14 is not set to 'no' on %s
> debugfs\n",
> +			     output->name);
> +	}
> +
> +	close(fd);
> +}
> +
> +/**
> + * igt_hdcp_output_is_dp_mst:
> + * @output: output to check
> + * @index: index of @output within the set of outputs being iterated
> + * @prev_connector_id: in/out connector id of the DP-MST topology being
> + * tracked across calls; the caller owns this state (set to a sentinel
> +like
> + * -1 before iterating). Updated when @index =3D=3D 0.
> + *
> + * Returns: true if @output is a DP-MST connector belonging to the same
> + * topology as the one seen at @index =3D=3D 0.
> + */
> +bool igt_hdcp_output_is_dp_mst(igt_output_t *output, int index,
> +			       int *prev_connector_id)
> +{
> +	int connector_id;
> +
> +	connector_id =3D igt_get_dp_mst_connector_id(output);
> +	if (connector_id < 0)
> +		return false;
> +
> +	/*
> +	 * Discarding outputs of other DP MST topology.
> +	 * Testing only on outputs on the topology we got previously
> +	 */
> +	if (index =3D=3D 0)
> +		*prev_connector_id =3D connector_id;
> +	else if (connector_id !=3D *prev_connector_id)
> +		return false;
> +
> +	return true;
> +}
> diff --git a/lib/igt_hdcp.h b/lib/igt_hdcp.h new file mode 100644 index
> 000000000..0abaa9904
> --- /dev/null
> +++ b/lib/igt_hdcp.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_HDCP_H
> +#define IGT_HDCP_H
> +
> +#include <stdbool.h>
> +#include <linux/types.h>

This isn't needed. Drop it.

Regards,
Pranay

> +
> +#include "igt_kms.h"
> +
> +#define IGT_HDCP_UNDESIRED	0
> +#define IGT_HDCP_DESIRED	1
> +#define IGT_HDCP_ENABLED	2
> +
> +/*
> + * IGT_HDCP_CONTENT_TYPE_0 can be handled on both HDCP1.4 and
> HDCP2.2.
> +Where
> + * as IGT_HDCP_CONTENT_TYPE_1 can be handled only through HDCP2.2.
> + */
> +#define IGT_HDCP_CONTENT_TYPE_0	0
> +#define IGT_HDCP_CONTENT_TYPE_1	1
> +
> +#define IGT_HDCP_LIC_PERIOD_MSEC			(4 * 1000)
> +/* Kernel retry count=3D3, Max time per authentication allowed =3D 6Sec =
*/
> +#define IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6
> * 1000)
> +#define IGT_HDCP_KERNEL_AUTH_TIME_ADDITIONAL_MSEC	100
> +#define IGT_HDCP_KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
> +
> +void igt_hdcp_set_content_protection_desired(igt_output_t *output,
> +					     int content_type,
> +					     bool type_change);
> +void igt_hdcp_set_content_protection_undesired(igt_output_t *output);
> +
> +bool igt_hdcp_wait_for_prop_value(igt_output_t *output, uint64_t
> expected,
> +				  uint32_t timeout_mSec);
> +bool igt_hdcp_wait_for_prop_value_multi(igt_output_t **outputs, int
> count,
> +					uint64_t expected,
> +					uint32_t first_timeout_mSec,
> +					uint32_t additional_timeout_mSec);
> +
> +bool igt_hdcp_check_lic(igt_output_t **outputs, int count, int first_out=
put,
> +			uint32_t period_mSec, bool retry_once,
> +			int *failed_index);
> +
> +bool igt_hdcp_sink_capable(int drm_fd, igt_output_t *output,
> +			   int hdcp_version);
> +bool igt_hdcp_output_capable(int drm_fd, igt_output_t *output,
> +			     int content_type);
> +
> +bool igt_hdcp_is_output_test_exempt(int drm_fd, igt_output_t *output,
> +				    const char *const blocklist[],
> +				    size_t blocklist_size);
> +int igt_hdcp_get_capable_outputs(igt_display_t *display, int drm_fd,
> +				 int content_type,
> +				 const char *const blocklist[],
> +				 size_t blocklist_size,
> +				 igt_output_t **hdcp_outputs,
> +				 int max_outputs);
> +
> +void igt_hdcp_force_hdcp14(int drm_fd, igt_output_t *output, bool
> +enable);
> +
> +bool igt_hdcp_output_is_dp_mst(igt_output_t *output, int index,
> +			       int *prev_connector_id);
> +
> +#endif /* IGT_HDCP_H */
> diff --git a/lib/meson.build b/lib/meson.build index 911bf3550..c5e2d7ef6
> 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -105,6 +105,7 @@ lib_sources =3D [
>  	'igt_list.c',
>  	'igt_map.c',
>  	'igt_panel.c',
> +	'igt_hdcp.c',
>  	'igt_pm.c',
>  	'igt_dummyload.c',
>  	'igt_store.c',
> --
> 2.43.0

