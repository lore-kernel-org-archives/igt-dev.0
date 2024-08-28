Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECC8C5472D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 05:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818F10E4A7;
	Wed, 28 Aug 2024 05:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qbk7V50d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3404E10E4A7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 05:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724824432; x=1756360432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IEb1wkKOVUE1Vnb3gptMUil+C3HWZbdefyV0rLn/eSQ=;
 b=Qbk7V50dvbqe2foZ6UslMCN3ThOkHzrbVt5MTm5SDCF/8+gG07tXnV4a
 2gFOJ2jjk/Ou57qzwYD2ymfJ43sjspgsp5zbtL5Q5Bt92E5zsI0s3KMzB
 4rULPEcxJRIAiP/QP6zXQIoShM4EhaPQTkHgFwhz5oe21r7ChKvY7U+nm
 xTKsO/6I6NfDH20LAFBWe9GVaEA/tkJ9F3zOPzL6IAn8Z0WDfajooErCi
 aXNj2QgDrpu5qhZ/aNIknR1cB+ZDGj0s5gbwBnbKnq/h7ligjG2EyXOqc
 HliVZlAaihgmDML871ALzcrzg8Dp5v7eqj0P2FKItU87OqMeOGp6Ai3hx g==;
X-CSE-ConnectionGUID: XtyZrZF0S6SxCq6FN/jROA==
X-CSE-MsgGUID: g3N3XXPdS6ydH4tHrvNRUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23514043"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23514043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 22:53:52 -0700
X-CSE-ConnectionGUID: BKVtfVh5RAGqHRrVCCeeRg==
X-CSE-MsgGUID: dvXe9Ln0QGmjEgfGPUU6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="63815159"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 22:53:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:53:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 22:53:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 22:53:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKySbEnUt/cU19lRIy0IVmBY9x2s96qUo6DQZWWnTjY2LqfJQZxB8u8IYSBxdPzRZ0YErXY2ts+0hZKl+ujFrQvA/RXO3ypNeeUgMH/IlnmzI2+rZJzVooJprck0HzAfeF5wR5HJTO4Z0R3GAS/fisVt/4yL0zQDk5/B6MMNm2/faZXp0Uxr3YDGU9RV6Ar/rhEk2hH/qaXD3ySQh2Mdixq8tQYWQsowQfG7yhhcmallCve4RmcNbZdMC61kyzKgP9vXv1Ory7HZAQJ1uDe2MdUWbfmBWJJn6K+0Kda6xc3QmvNG5M6ymY6R/0W1nJNezwoxgHuoWppwTY6+t9t1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3hX0SEULl5aMXkMKfWAXVKTmyyGRG2VFeo3ilRhsXM=;
 b=r1+1fM1v8D2BWYWDIITAJIlJeWQJ8Mqq+LH6bYXHB6nDqSkRCex+yKvB0AttjMlabqxZLGaOasnIsjE/VMCQgogay5TPYsip4Z4eAb8VKuj8P+GExLeRJNtS4dw0OpofrbzSR/9ynznspAgjAwYrh0ENFV4I699eklsCTXKDyUXZZpO6YZ7SyKC2a49KwD7t91mJdG7EXW6bx6KbLci6ycWGbRKeMk3wnhojkJgkOL7ZYAktq+A0p85eYkNnseP4chJ5E7qgqGWXIxtOEaOCmIZNPrZY8C9V+afnMovDtq0Tef7VF6xkgfLX/lWpIoB42omgS1MlZg/USsMugy1cmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 05:53:48 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:53:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v5 1/4] tests/intel/kms_pm_dc: Add time unit macros
 and update delay calculation
Thread-Topic: [PATCH i-g-t v5 1/4] tests/intel/kms_pm_dc: Add time unit macros
 and update delay calculation
Thread-Index: AQHa+H5qjaLNhC0/N0WCB8gPAZgLIrI8K/WA
Date: Wed, 28 Aug 2024 05:53:48 +0000
Message-ID: <SN7PR11MB67500A0318008D0B72BFD5D6E3952@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
 <20240827124018.1373304-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20240827124018.1373304-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CY8PR11MB6962:EE_
x-ms-office365-filtering-correlation-id: 79985fa3-6b0f-47c0-5cb2-08dcc725c987
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MZS+g1faC0IfzMrD7cAQumGQnnChZ6pFQ+kDfkx8MGOC9AXFSVxOr6FYJkXr?=
 =?us-ascii?Q?9WUAj/xKgFAK3jPAuVnmMQLB9CaZNUDqjzc1cEOt1vZEufT8wRFat/IdweEI?=
 =?us-ascii?Q?K2afD3ctoOsr0kRh33E8oQWL+1nTXFPMjAdFziwezRVrX+1IHCKjXtLGP0Cc?=
 =?us-ascii?Q?vvmmebuPjrlPHljIDFYL2V6oill7UXoKvxHAWfWlVPwCD99MtmTkpyQTowpc?=
 =?us-ascii?Q?L8du+Tbj4bU6/y91YzzrGvsS/bmnV8Oh0MsTUyyVr0XReb0/ErJ2FMmXNlVg?=
 =?us-ascii?Q?08brjTV2SPlHyULA2Yp9Hz5vwEJ6WhnEmaxp0WYrcIaYqojuSrbiUUETP750?=
 =?us-ascii?Q?wFOYMCJpE6RVyOqlf2fIYi59OjVdaDq18bTHnlpYy92rFp50SBTUEOtWkrz+?=
 =?us-ascii?Q?jG1TcRUVS5uklrJ2THuWJiA84kLP+bw0TUCcDJbSwm6L5x3L/xF9r1OFJO18?=
 =?us-ascii?Q?akGgtXPgqzsVf1baXacuxDEqo1EV0oROgZxH1TcG/M+RvpPEI+HnV/1uQDsL?=
 =?us-ascii?Q?n9O5ydBj2BmCCSrskXP4YL69auC02AvUqgxB0hxFql05Ppnnx8ocuEoD+cq/?=
 =?us-ascii?Q?Ve2abbxHlwKkJlM+dK1ATRFwdjyWIsbbtoq4frjaCzzOSXNI0jkL9HgDcVZj?=
 =?us-ascii?Q?YhiNURp6AywpLm3i+opftzuMn58iiKxi1D9guecjLuD5nTEaiG8g4uBkSfs/?=
 =?us-ascii?Q?SG/M9xaVEpoWc5gtfMzdoZJLt6TLsbCEPIHntGBFDP+ydUZQs26uS4PGkdsX?=
 =?us-ascii?Q?fYN89gebvq5MoZtVKv2OmbeSBVsRu9aMFvrLw06gDSBiruEm48xNmi10PsMX?=
 =?us-ascii?Q?OvFQ6J2bbnIObNS5TB3PgIGLxCEcEZO/2fQ2hoL2bw1lRMBLXPiYI58ZmpAL?=
 =?us-ascii?Q?TfHvlo85afuBbbInxRthJihX2/WE+TKh/SGF+LEsFlDy2gpq7yOrbogoZkwx?=
 =?us-ascii?Q?/1vRMircqHZBZ6xvWQAHRKjNwvFLzWmsSuOSaO8IsThKwg39zbNt8uhYWc4z?=
 =?us-ascii?Q?kvOpkKLbttJe+5K9yH4Q68txOhXns/k0vbvkEuA1mPT76vq/wSnYlZCMLSrl?=
 =?us-ascii?Q?5h+OTHFyUT0DNhVhQdPG3U1ZwbJ9GwxZTsWUPniJsSYALJO12VPW/3dpa+yU?=
 =?us-ascii?Q?LwLMfIJCYUZ4QjmEWxD600IB7G6GPNQkxN/0O6sb0t+4biSkPzytJ51tqB7G?=
 =?us-ascii?Q?BasWo9SFK0ZZ3r+3yL1SWg3rZVUPqlgw5j3rUBAjeFqpiW+4746llb9uYflf?=
 =?us-ascii?Q?eOkEX8Ld/rve2Sy6mrJkTWGPYGfulb/fbZPEXLSDWASR61SztADle8/Mc0cq?=
 =?us-ascii?Q?YM1yiwaVV5z7e+S2ZQjNcdMgEangt6P4aOGc4bnpR9c/I/sEhM59UGlbBT+H?=
 =?us-ascii?Q?aizjKxgfQgAAYioSKKabvQtQaMdIjcRb8p4UjR8sUMiM1jjqcA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XMTPcV2WBF2b9gl3Riyny4jvaTmrOCOHHhaBr8TDlGMg3i2ZRQ+eyNUzfkbf?=
 =?us-ascii?Q?XLJ7BkP2DswwQ0+cwB4we1IVXpnKRHLKJSRQ4iksH6wfQSxuQhSnFQdBmz19?=
 =?us-ascii?Q?ao1q4n38P25TTcKoXcyPXuc4Ztd+Mv9GG/lh5rdjsr9LHEbBjbKM2V9y4oyw?=
 =?us-ascii?Q?Ru7XXCOJz0BTPDn6ptRK1/f5UJrHI8tLiYvjA+B5ae5uTy1wlis2929kUe4Z?=
 =?us-ascii?Q?6BvPf7Nk332XJzvLO0p5rClgKLgiQIvWyANOOSY6MjlRzDAbJpFNgjxgz2XD?=
 =?us-ascii?Q?DF1Tc8ExMT0NELwhH+3EYIM2nFG6P1nf7jkbNkSpLmWk3q2DtayHD0P84WWb?=
 =?us-ascii?Q?vAEUXxnVvdiokmlx/OA6P2twvxwh9XKMiguM8rek9ukFHG1gy3ZWcHe94qXa?=
 =?us-ascii?Q?3IecPOvndp7nDlo1pg381i/1C7l5c4pxBfuWw8a3hEuTRt4FykQyJ7XDLcWQ?=
 =?us-ascii?Q?ODs53drHaBb4RLkIRSjQwbmDz1D0p5iBwL7o2EZpxWE/J2vc4ncNvseAbh/u?=
 =?us-ascii?Q?KotSwNDfORbTpCDAoyJ/kLQOLW3aZYFN7BmzDrQAMJPfiL5sFDraYGVTVIQu?=
 =?us-ascii?Q?9gzcrUipnPoWAD5GnIuJ4ld0jCzZXhd3ZZg3fM2uJtHZaKCLLx5awN8oxsaj?=
 =?us-ascii?Q?g5gBvnS058/S/V7pAOTtfZciD8FLzTNqbCLOFqYaTYrcC9Z+oFno+EUZZTCw?=
 =?us-ascii?Q?lXoigdNm7n4umwSx5ryP2S8f0KUTpkK+RBGLT4TdC1ezQMWHHu1hK+mRWU0y?=
 =?us-ascii?Q?abr9yEJV0oTAf+QJKjHcl1wJ+E2Yq6YdMQm8f4vX89Bgd5e2bn1soPNeH3bO?=
 =?us-ascii?Q?ZNK/9TwEWeNzJNIydtbxqXqi2i+JqYsGSputcuxHcKQCH9627YuxpjxAPLVS?=
 =?us-ascii?Q?WGOYwJm5fckbFvJ29hwVqp234uhUtAfVkQiDaaDpKVtyLshLrh5CjrC1eWnM?=
 =?us-ascii?Q?CASnkVVKxf3xLUD8ewPJbLEF803t/X09yeMc2NDea9UqXy0eSQElLbYLkZyk?=
 =?us-ascii?Q?a1MeTx3r7ePpUl8Rmj5dLlERJMvLi5xB+D0H9O7ySLo1Q0sk9Ctw3ZziUBOT?=
 =?us-ascii?Q?LdElFRrMn/TQyTuyKh2mQgNMIBmBtVXW6M44wfyBqanszpCE/QloQ8CAydBu?=
 =?us-ascii?Q?ySimDTSy+RUTV20wFL74XbjdgZ/zYwnxL5hnP/gGeRKDmpAsqXk0YXWQ418r?=
 =?us-ascii?Q?R3XRJLzTfL8HXilDLGt03Plq5kRsdh8LxIkZefjBKEnNs0qKDdQ3CjiNLwjL?=
 =?us-ascii?Q?gF7n6yv6U1n+rMHixZ42ZpLyWgN6w/z9qA0tOTuPLVYGt3D2oqAphX2axLm7?=
 =?us-ascii?Q?ewG/0b0Ed+syBGHIjaWxKTHB0fjQ7SVeqOmuTd6mVyW8cvnW6UokgVl+kVjA?=
 =?us-ascii?Q?YtzwMiOQMrmPofl0O66Jumf+4XfHiOznYcSUlQ5o2Ao3K6/s3wHC+yaEqEIs?=
 =?us-ascii?Q?OGpI5eSvgWWHzCsGpXhs75WIy6Rz2a3E1K0PAUINVK8aR7YjIHoYjFBUp7ao?=
 =?us-ascii?Q?7k4GB//FJO8bWZPnnekhOW6HaQpX6whb3Mj7sDw75enVuFNBy3zWlZn+aO78?=
 =?us-ascii?Q?FRiBzaQaTTvCwvnDe22ixgMXXaD9fR95CagWBIqB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79985fa3-6b0f-47c0-5cb2-08dcc725c987
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:53:48.8137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKGJOroxWDILzNBNcN5kGUeRo7Rtk0Z+UFGSveOati+YJay/8SYNX1V9H357adzPf+waNJtfYAYMwigYwkBuXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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
> Sent: Tuesday, August 27, 2024 6:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v5 1/4] tests/intel/kms_pm_dc: Add time unit macros=
 and
> update delay calculation
>=20
> This change improves code readability and consistency in time unit
> conversions. Replace MSECS with more granular time units: SEC, MSEC, and
> USEC. Update the delay calculation in test_deep_pkgc_state to use the new
> MSEC macro.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 1aef1e02d..2ae9fd2a5 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -93,7 +93,9 @@
>  #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>  #define KMS_POLL_DISABLE 0
>  #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)
> || AT_LEAST_DISPLAY(devid, 14))) -#define MSECS (1000000ul)
> +#define SEC 1
> +#define MSEC (SEC * 1000)
> +#define USEC (MSEC * 1000)

I don't see you using USEC anywhere, no need to define it in that case remo=
ve it

Rest LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
>  IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
>=20
> @@ -623,7 +625,7 @@ static void test_deep_pkgc_state(data_t *data)
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
>  	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -	delay =3D 1 * (MSECS / (data->mode->vrefresh - 10));
> +	delay =3D (MSEC / (data->mode->vrefresh - 10));
>=20
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> --
> 2.43.0

