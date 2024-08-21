Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFAEC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 05:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3BD10E581;
	Wed, 21 Aug 2024 05:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEQ82++d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D79210E88E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 05:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724217894; x=1755753894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O4aVqTKvufmcsJoJYsuU9nb/1hqPlL5ld75xAW5xNPg=;
 b=OEQ82++dHPjvxz1NOEEOgnQDk+M6LnRacJJwyVDE5c8VV98MaOtlAdke
 vw4Pd1JlOi39cxkVX9drbavfh4BnPW7ukGNBRltv0HwQl0lFGJUxdo+xA
 49NFwF+8tRGVmZJE5yNLE+5jyw4Z5bJqX3aWeqYKNezCntkRACMx3A9fi
 bAw3nfv7nPC3CZKo/3o8AXf/5EaeGO4RnP+6Qk57wf55mMa+vQqfDRw8w
 XYrwqdXg6UglacvVVqqzxQs1+dZSsiP0mYl/PeuVi7KJmoGmg9PfSpSHO
 IKeyTfsVWcQ+kRmlLYjf67HkWAGzhM5jGlRGm1ERkC9VqEtFxgcZa9DWg w==;
X-CSE-ConnectionGUID: VPTlJnndQs6L0E7uRMtpNA==
X-CSE-MsgGUID: v5ox2YreSgyWp0P3u4fBkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13126332"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="13126332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 22:24:54 -0700
X-CSE-ConnectionGUID: gtrRjQmWQQuhEdFVj1qCFg==
X-CSE-MsgGUID: k8Bge7nJTD2VsamSH4n8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91719673"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 22:24:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 22:24:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 22:24:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 22:24:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 22:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJWKMqbs22vZPRsUbf90liVQ7hXjMqCOM1Vc/oMQ3QedkS1MIWmeyttYzb3HJqLX7mReMnq6snVMXIGWt2T6HRTjVJAyv70wJKz3e9z7SEGVOWgn1aTQ6koY4JVQe3GT2c9R/+8varsT5FnVNUqtaDulUO8uZmfvPvomSUpo2YgTELcizS5G1/EiYzo/4H9cp0WnzSMyc1BQLboCRnJupmK7h/IJ3aPJr4q8rkkiObM9zW7KGat8137KaOtVhWGH+CvfTroB0wAM4XqN/SvTrHmAfNdXZ+NoZEzQpCzNAEqfwb+MbsklqWSXp9gG6P9uneREQzW+K3FDnHrrYy79NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67jDgBqiWC5FNzYtM83i0LSceRawFf4kClNHozlWg3Y=;
 b=jrXLjCpAsslJSyyIUkIr75k/x3O5dH9TlWCxkvhYebLGLsZyUwNRh6Q1IeQxOhZADLmnoSYL8GG530dNIQTlh0RIJm/YV15QHA5ZbTIyI89xyfmTjzwIbQU/IdrX48Pa0MLKzWKtGY/S1zFKdredM7POlDbIdsic+e2iJdkYjuWsPHjp7YnzTIqtEoJFR0NoveSak7B/RHLOiRiUZieRWNL3vAmTi5stUYw1A9hAhdhFv8KxjMsfzHjdTf8tw3L0Ps3iUlmi6VuhpTnLDV3Z2B1MFpxkI6I+KBhDUbY6XTbZdFvs6EAuw/Jx3HqdSpwnbVpe/pfrqrNz+SVfxsQMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 05:24:50 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 05:24:50 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 2/4] tests/kms_dither: Add more logs to skips
Thread-Topic: [i-g-t 2/4] tests/kms_dither: Add more logs to skips
Thread-Index: AQHa7USqDCQBZkS+Ck+VNw66Yypg8LIxOikA
Date: Wed, 21 Aug 2024 05:24:50 +0000
Message-ID: <PH7PR11MB605381110BF830793870620CE78E2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
 <20240813053845.2567954-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20240813053845.2567954-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SA2PR11MB4826:EE_
x-ms-office365-filtering-correlation-id: aa9e6804-64ef-465a-9e2b-08dcc1a194a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HjGDw3081grhWCV4afDctO35xJ6jrPd42AcbPjjmEGJ78SDwitW/CH5V4V4F?=
 =?us-ascii?Q?P0cKjPqEuQfTIkx0d6HvTYiAYKy8GJiy3J7ad5qkhHWqzUgWuG2Q+3TVid4h?=
 =?us-ascii?Q?v5ZfTiUwOM2/LYYa/q54HSGhZXOtq/u0LkxlKgKoHtlGItAjhQFvMhpS9Iw/?=
 =?us-ascii?Q?RYgncqU8noURhvsFa8crYKl+pDnS/ZgLyFhIrA7NungpMnzzAck03qxMmi8n?=
 =?us-ascii?Q?smfaKIK4O1a+J5GrrYuzBORZoCOAv23BrnWDsZPBW48ZrZ2pGL1NjKD5JYNj?=
 =?us-ascii?Q?KDn6G0/uS1K1LuwrX77zb+XGTdvWhlA9Wsi4r9VL4beuRa53PFAWaHSzLb0V?=
 =?us-ascii?Q?xiM/e0A15ILRmZj4kamfgwfXWpqJZ4ZU+f7N5yG3WwY+xuSLjJOOPdF0w00l?=
 =?us-ascii?Q?VRfqFFqF++XS3DISTeQZwzfK5zMAHgvRmjaMHBN94bN76zP181sDD6Q87Fly?=
 =?us-ascii?Q?T7+xcvxxNgNHvWZm2fPdpwhvLVwcrA1U5SbfKurym5NhjnraZcH4mQ6uYhN8?=
 =?us-ascii?Q?ySh/5m3JPIcfulkTnaUfnpyKrVUYZ4/Z9VlW70WCb1AYYyGwwN40wFOk47fP?=
 =?us-ascii?Q?8bKBebaMA3NH7raa7u+ZmuZ9DVQv3u9tNzLWjoU4VoA0WNQOY+/Qh/aldv1m?=
 =?us-ascii?Q?stzHVQu/ofyB5KLjPt88hUmi/sFm36NxV25jzjNmoAF012M64Rd5AKeZ0Tof?=
 =?us-ascii?Q?VsEPuNMzrprZ4HD3KojLkt25jh9daUiKDv4nknEs8yPFVIkgxU9LZnABzfKD?=
 =?us-ascii?Q?/Ybl90YAkJqqvLXROzmdmrqVCBh0H6IRVJAjpuijbyjRSRiI+QqD1l2Newrv?=
 =?us-ascii?Q?H0/e3d7ehADKKyQKyyr0fwaLNf5aGgvgwpPCC0ygB0skwl0xYFAXvdLUvJic?=
 =?us-ascii?Q?J41juLxf8wSew+WI21CpbZ3C134OqTiKJU59xp64pjd4EQyyTVxq5CGR5yjX?=
 =?us-ascii?Q?VMd696aFOYZeFg3C2p5dO+2J0QywysGaZNJIYJ2uTPceM5wMsHcc6/13tdYf?=
 =?us-ascii?Q?tjn/s5OzEjRGeJa/bI3j4jy9+Qg1ZgYxfLPEY+OAplxWiIovcIdOP3XNv7o9?=
 =?us-ascii?Q?Ac9QvM/buJVxbIF24nqApeESInYHq81m0j3wXkf2B07X56u95qtY/wk4+V7t?=
 =?us-ascii?Q?fiS1HrVUw1xy88mGN8sdWNgMU47YXOr7I407lUV6CzCOxo5wAGN0XZ6i5x1F?=
 =?us-ascii?Q?JdzYTxXsFk9kkZQF36v1lGe8tbqE8EmA+S88z/X49Wb/ADnozCLHNjUxii1/?=
 =?us-ascii?Q?lM8oEQO2vBNy5HKGciSxLtJhA/bIaJ6E7+zRBTuPm6ZcpUqtVCPFriSgFVJt?=
 =?us-ascii?Q?160cCHV89bAkko3fo1t2NLY1TrcghW6aCuT+uJ6hFmyMr7CwBnmQcPafdNIw?=
 =?us-ascii?Q?j/ZhsLg54+m9H9F9Ul2gauGVfJJQ97d1cu4TPeFYo03kfoSQ8A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OlrUahE1aGywtnV9GV9QMsQsGE87Kx4E47o1KWmgKHPlTvNXk9iyZCskCcrP?=
 =?us-ascii?Q?WZ6xqvXDGYVN3hK3WlsFnQAPbLjEqwA4s4wpovvDdwjnTsAxMBbPZy5toEqe?=
 =?us-ascii?Q?eWJE4crWIvLhzwFsE6gXo2fEghI9+DxKbvO0MtEP0my5ITeUiZU6NTJZa2WA?=
 =?us-ascii?Q?fs+xQ/HaZrQgs3+XRn0kd7ruE2YQUrxxZ76Z5j3sDv0/uGGhgbyhW12NWuoR?=
 =?us-ascii?Q?NXzOZOqRsrw2HR7SlQSgwaQEVR6zVPkDPORSpVH/KsyQHjgbQRMbGf0f/KYa?=
 =?us-ascii?Q?yYfhSQqx7wClUwtnQ0jyvP0nj5gHLbxFF33lW8Scl1rbRzIgPAZ5tkDkSfIw?=
 =?us-ascii?Q?9z0NK80AnSYpUFQ65eUKmBVYhAP6VVHcaiUHK62RmH12MvJi0y0sQoH0waDU?=
 =?us-ascii?Q?O69JXHNSKRyWFluv3q42K9zhkDT41EQTbiHockQQRipxwtzAfPBThvtysWia?=
 =?us-ascii?Q?ZxNpYeiVrff775I2IY9jmMGBzTiCHUwcCRG8cc/nU3s+rZb+EpQm3wl29YQL?=
 =?us-ascii?Q?NLyv3nz+zWAlwNN2h1S1XFWmQVl2HROqyzFIxJ4CY+LvEeKjMM7O7cAD2PD0?=
 =?us-ascii?Q?L3AXUz1hVR31t6KAEJnGL8d/4NbaxuvhahsFPxzB9pCZ/dQOQVA2/kPunDxl?=
 =?us-ascii?Q?VJtcJe9+YLujDTgP2h8Jr3wvTDPCGnfcW4Hj+KsyWukQvVuvBbIYdfU/Wikw?=
 =?us-ascii?Q?oWTSzyfjJ0zczTmsYpM37OoX79nmoUPJIIFemg/pmj6uomwfyhcJUR1FdFZN?=
 =?us-ascii?Q?c6d8ysQPsX03cYJSjPVxkpwUH7GFHHwUyzia0yuudI5N9PVBtabDJ3vRSPJ7?=
 =?us-ascii?Q?uiijVCD/KeToHieDLlxiwfU835t8pG8N7b4KzAE8Q3dOemd071VMdViu/2BZ?=
 =?us-ascii?Q?1eKbnpp7ikiGs+1MC+BMxn1RCeqlr0X10XrwNrCTcZJ5RCtGXCZgb1JmA6qK?=
 =?us-ascii?Q?rncHnBiE9VFkgoN2gY/X2k8Hk2pPiO9cv06dzbZyuL/ZLq6nHsoN86Y5ehnY?=
 =?us-ascii?Q?uMoHAiNA6zYf1QYCiETbnGXYautHN4IS2TrprkJZc0x+Gz6O9ooVLg+V09wR?=
 =?us-ascii?Q?jq7Z+iV/y9h7YptTvtB5Yo4ciMfwJ0xcMJIgNmnXzDdwr8S4tUFsQyec3E6a?=
 =?us-ascii?Q?BLA+898vvduqKcV3oD+cRhxYFxNhQ/DdlzWav8wLb26sGWST1k9wsT1xICsV?=
 =?us-ascii?Q?tbppIjya2xgzdxveqCcX/i8z9fYvjwlN62uYHsYGYy8/Xrsi5FEnL1nVpW3L?=
 =?us-ascii?Q?dRPPh8SrMz0ZWr+CZ1V1eV1b89S+YjD7+AEl9APe7J0+bAYKbytaL5y2Avdt?=
 =?us-ascii?Q?Un1IkwuRkjhntTnjAgO7PeqreopYMF515nIqYc+M1RaLr+u5JvDKagDoFhXO?=
 =?us-ascii?Q?aqNVO4ItzEF/wttcb7XgQ6GVxgIpmzGkV1CZtNfFmcXaVRDxdP/7tfO4S258?=
 =?us-ascii?Q?hPU0ke74wLwf+nMO0oA9KeSg5IusF312PH6tkOqNcTd/eSFeA8bluIidH1Q0?=
 =?us-ascii?Q?OVse5IRDZUgFduTFZG/qVksNRCF5o8Fv6V/l7iUH3GtGAouTIBaT0mqutx8F?=
 =?us-ascii?Q?QF4/wu52pwsPCFUZ/36V0A4BCkFu/g1lcsVhALSF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9e6804-64ef-465a-9e2b-08dcc1a194a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 05:24:50.7350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1SBfCaXF27aJdsw62ei5HQ1ZgQvyHtMBElu7WRyKuu5DmjXcHModny9jU01WfSPwu7+W1AwRzE7ThmjkJfTg/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, August 13, 2024 11:09 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 2/4] tests/kms_dither: Add more logs to skips
>=20
> Debugging would be easier if we had logs available for test failures and =
skips. This
> patch adds print statements at crucial points to provide better insights.

This patch LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_dither.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c index d8255f190..ce4=
172117
> 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -207,11 +207,17 @@ run_dither_test(data_t *data, int fb_bpc, int
> fb_format, int output_bpc)
>  	for_each_connected_output(display, output) {
>  		enum pipe pipe;
>=20
> -		if (!is_supported(output))
> +		if (!is_supported(output)) {
> +			igt_info("Output %s: Doesn't support \"max bpc\"
> property.\n",
> +				 igt_output_name(output));
>  			continue;
> +		}
>=20
> -		if (igt_get_output_max_bpc(data->drm_fd, output->name) <
> output_bpc)
> +		if (igt_get_output_max_bpc(data->drm_fd, output->name) <
> output_bpc) {
> +			igt_info("Output %s: Doesn't support %d-bpc.\n",
> +				 igt_output_name(output), output_bpc);
>  			continue;
> +		}
>=20
>  		for_each_pipe(display, pipe) {
>  			igt_output_set_pipe(output, pipe);
> --
> 2.43.2

