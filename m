Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B03DCD4F26
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 06:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD13C10E957;
	Tue, 23 Jun 2026 06:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcRIkZG4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E807910E957
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 06:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782195092; x=1813731092;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ALLSQ4509UMhBGx4IKFdaQSY3IgFEgUu0MAjgcQCL3I=;
 b=dcRIkZG4kbgN5puaWUY6KRKc/DV2MN2EnsaV68yfyAQk9wWWIFhoMI2k
 GUrKTV5MpUVC5zzl/86K5EllzwtMpw5iysU34635Y6gWbfeIXaW8Ujk+J
 wB0GJFTgdJUye8DNqBlz5Nuqs6W9FIw/UG4BjTI9rrqJczw+u8A4g0qoQ
 RJoIzClYmAEUFJ/zpZWBHODjumV44viELSvgizeW/FGSwn5bQ3XWPb4vw
 QVayRT7eU99x+UfNHagoMZsFkQ82D0+BQ+iB6brnVMF79z9l2RYUyAWiB
 dEeKFbBNzwdJYEhfXLEVLERfxE/1UYp9wdPEhmo7sx6MM1Ts29NfWnz7v g==;
X-CSE-ConnectionGUID: IZwfLqOsROCEZzwzMbzgxw==
X-CSE-MsgGUID: muybSVZZR7C09tNwyZN7sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94319499"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="94319499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 23:11:31 -0700
X-CSE-ConnectionGUID: I4QZT2ruSMOufylp+LK3Dg==
X-CSE-MsgGUID: EBV8BA35QWGOYnW6LylBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="273120401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 23:11:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 23:11:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 23:11:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 23:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4DtciyBpnZBDHZ98RL+jqZYfZ70lcXIBDWatCjhmYQez9qfz5GlHxDRv4EqldnJsuERg7HwYz34j3oXjQJZH0IGOV3E6wfv78ULYlRKiRHdy7TtKiaB9Gj0j8WaG8DBg94f6yqTExlN29AGfJDZljOoR8GFg2XOXy7acZ57FPst+/qLPWn/pLJOA/aSkg3M5iQ1ppiB2BqLPrNUMkUj8NB5FQttoCJLqis9ZnrBJXtzQkMIERBraXJ0giaJbcNYsMO1cm2Y2MiMSpzBccvDAcbMX8evo+RHTrkekaAZwfLXh8aQUu7h1VqlI9zaVM+Bw9PavOmDFLih1reVnSCVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dibjtSRmu/QLP9WbNF0/orFyHZsfGogMlIXBFRnE/ZU=;
 b=oQDuCGeqPxGD/iMGNvwiRMABrQzTEJnPKAoDkDPh4NLXFcxLoidZ0JGAGb/gyCSPqPyRowyE+4K1tiQbqbt46dsqrQwN5FApg/BlEjdwi2wW0N3iKFnLUGLnsEH99v9L42Yb34V9b8/ucXK8WePh/eOJPmq5apAgXzATD9KV4sOUzPYVHJvivGjlxhhV+Ji3/jRHPDQAIUyegqzFOfGHJBbprUiW9SezV3XQJwEiSV1hvP42E/IQ1Sr0D766xpBy1Ss5jVUbA25IqiT3fSOioLV/xFN3cDUSDmLX4lLB+WTO7+pPfhYZD7HWUxFz7H3z5SFVzbWPVkJWqN1nBAp1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SJ5PPF1611BC49E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::812) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 23 Jun
 2026 06:11:28 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%4]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 06:11:22 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] intel-ci: Blocklist multi-queue subtests for PTL
Thread-Topic: [PATCH i-g-t] intel-ci: Blocklist multi-queue subtests for PTL
Thread-Index: AQHdAs3rTa0gc6OD+0++YvfKHEGMxrZLqJEA
Date: Tue, 23 Jun 2026 06:11:22 +0000
Message-ID: <IA3PR11MB901369CE7FE16BCA0D8CBE2385EE2@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260623050633.9620-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20260623050633.9620-1-venkateswara.rao.muppidi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SJ5PPF1611BC49E:EE_
x-ms-office365-filtering-correlation-id: d9eae76a-d1b4-4113-6b53-08ded0ee3f95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: ELfdhG7O9/AocIShMto2d+5DGYTJVDtOsGUVvcRnE1oNe6/EnCOfimB263J1Em1PIVS0rzB9mXvfqM0cUrJ3IipjXKgCI05o7GcHyCs0mC5w4UCZXZoJiOghsbNYtrgaozwNVJ+gHdJkbY7d1MLC7A6paPM2Ebx2sEfQRbHyrl3ClyIKMzDQnzPLXgnngY6hc4HOWR8gBQJTawU7SIxOfOO2ZhXQ+MeQ25NGWHqlJrG0HwyNtp9P70JSoRe9w0gLAsT5nHvAW5kHbNbjACBs+nAVUqv4uf4G/jr+/tw+8qLZjzQggL02LuGhpGk4OJkmLZ+UGWiKtUEHxcILoF9gp0wVNKX+q/YuKM7FS8Hp47BZ37qGIFFVTJOwghfDEED3bTuHr8jS6ur5KasT4IGpqCi48m7RprD8rI9Qoo0FCGjbQEJi+SD9+jPDxzxu2MU20W9u0gZ6DR5WGkjGwWNjUjAVxQAUfT0+5tTVKIgVP4dVqk8IO7isFlF3U5vEecS/mD49WZ0Ix6b6X0hA901cEcXmvmZ+b07MCg9/9hFijrlo4l3Cbpln5RFLUMipoTSgebHhG5gVFXC5/8KWFxdrb4Y4BFDKNgzTVrX+xI+96hegOf5fvKC+qerqEJ4D+Hff6H2vEZHcZocGa0UUtwINS6FJtRVmx+DVIx2IbRWZ1A5iq8WjfEDXMdaqDKvLJUVck6+/0TdGaZhv7WVP0zSJZGANn9578IRc01vI3ROXSmk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?50qcsaGBQ7KDU+NDF7XUihbHyZtq3iYnLpze/4bO2uEf1ZNUiNzb4f+zbdqd?=
 =?us-ascii?Q?Bkug5GjREPO3BzSp73RnncijhdxaLPocW66SuzNj0BPHZv5ctbKjhzNrTnfU?=
 =?us-ascii?Q?LkgjxQrVJCWCXRWWp82nL6S7AVGoa4Tj6PiJdVhKd8m5jIz4aqVDEETg/4ju?=
 =?us-ascii?Q?0mEoXqJAPhATHSwnQKuDg/+LC5jF8reF1S2CCtYbYbOmYCKJ5Y27d7eISE+H?=
 =?us-ascii?Q?XOjyd49K3DywpaGlE4mXQZ88KCeE5knO0IyWTyeTDhX1DpHi1vJQlUua1oHn?=
 =?us-ascii?Q?duhGIHpYpmLfqX9QuDqgoe8zeSMPROLESzT4YLTP2R5QOxfJgr/Y/dQJCkeI?=
 =?us-ascii?Q?eDkB6mG8IeUpImaGtjQKT1m/68YLxMI4MvsQjor1npT4fzaTojD4jmvF/SKv?=
 =?us-ascii?Q?ShX/sg5Vnmc7cY94lAxHq/UoRX1rWJt69zxphNqeUpYs2ugaqwRwbBySGY5i?=
 =?us-ascii?Q?BUKvbV4V/7K82EtLQU1iMDqp7p0xRZGwWG5XhBvOia5tQbE0Cj0ufbdcG62x?=
 =?us-ascii?Q?DQSNb1kJTtPLJR6wcE4BKSeT/8KvddSORKLz9u98qjtSFrnE1LjUq/NP6Pus?=
 =?us-ascii?Q?ww3R92wui4QnNjunMo+Hi1iLb/TsZEXNDiIwTqZ5Xzx9QSz3o8jnwlgfKfX9?=
 =?us-ascii?Q?oKpu8UxPy6xO1leq0h2v2rQOqbvbW3DDkIgaPQEjos0EEzLGVchBqoHmZjY2?=
 =?us-ascii?Q?jyP2bC2qCCEPWUa/wacHfmFuHLH+126c8SBy3o0h9OnYmjATKwxDtEQOSWWY?=
 =?us-ascii?Q?sKMLnXojyQAZpX+j4xXk4ZC2SnpzuZGlBTNpwmD/OhCudA135IoClZz1SbXB?=
 =?us-ascii?Q?op9U5iwKXWd5Ipu/ooik+awMplrq92v0JmyPHMPvGZ7HYdkVmVRqoULdp5bg?=
 =?us-ascii?Q?8dfIVkHlqfJ+QmAC5/zTyaXT6LZOZWJwOupZN864bNiG4nL2QWVl1z7ggT8+?=
 =?us-ascii?Q?FiSeq8CLPkj82/+irJNQsHFmGYByuzyEDnIXneYNS8ZTlYzoD+1jVzmuqVVr?=
 =?us-ascii?Q?dky+/tihRGN3G1rGWbPnT4v17TfhtUQDude6JSq6dUBaUkPmKW2PTYcQl3hG?=
 =?us-ascii?Q?2j/pemAaEtfjE166Tdai+QEPig9Lf3kXhuRUf6XOGe7W1PFof0/SQkv6+rRU?=
 =?us-ascii?Q?YCVXVlnInkQ305VTkMC6VDqtjVD1CHEsy8aCH9KEqFpemyR8+ilZvO3/E3B3?=
 =?us-ascii?Q?bDgSozJH0hlzDpAaY1HdWxk+6GHc7kqTOpLzC4KJu2bFiqx93wWX//s9Fmvx?=
 =?us-ascii?Q?0To3pipui1nQ9uQlfULu3+SeeHSPk88ffZU/GTalh30657icS5ha0zF2uClU?=
 =?us-ascii?Q?LVRq0MduJH7/zV6ZkiH88I5IzCiBlwWY8POmtlKFii8xbZGoTjwkgS8/q+yD?=
 =?us-ascii?Q?3IgG6zg+yl4wszFxwbWs/NCzFmjwdAneEWx9wAKB46lyDXzBaKt7puGWACYA?=
 =?us-ascii?Q?jlmkauD3317Whby530zYsMNDpeFsXTgHZdOh3nwz7KaMY2bJ1VwgrXX+WaPt?=
 =?us-ascii?Q?gQivMl+ecEjLGn9giTQHEs3mKJ85rHsRgUyy9lVYfKl8Csx5AZuslyQqIXy9?=
 =?us-ascii?Q?faSPDy42GS6wRGf+tYE1MGgewoDszjaw4ablhn85AhiHXOwtgnofvB1E6w09?=
 =?us-ascii?Q?+vCoDgwITeMnqPpPCnH+oM4gwoxtD0Qd0bTQZekqDsn9XCc1ghZ4URFZ1Bg9?=
 =?us-ascii?Q?Iwvj2rZ2bcU3Nt3pEMEoJAJIuWrAsz5/640sBYSJot+lYrFJXCkej8pYzilB?=
 =?us-ascii?Q?wYBuUD/7mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: M7xXhHS4Ak6slZn9BV2VKZ0OfqJazdquJa/jykGY1U9HH/PxFMZRjh4jn2GUFngi55nifoZ0zPVqQ3YHhdfGg1aORqVOE35fmNyKnmhH+a3M55XHKbFgzj7yGgaDpL8Rn22N12lSTg63hKXWI2cQvNYs0TAlIsfMWreqYzt2JUwCgA9QM4Ab14436hXf7MJiBstGWLP4+cMpkJdUx/XLue+wE8YsN/4uGkwsAtGslQ+VvAbrOdt7WF5m77NjO8LwahW7HeRSaY71VWZ8jCiF7fmyf/GT7NPUNXzDTNqsFmM31oP2SWHB7DP/DY3BHxd9VkIfGLvK0zV/X9IPOgU/cQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eae76a-d1b4-4113-6b53-08ded0ee3f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 06:11:22.0367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4aQDNUBoAJgQcJMPkkr/gP6JLrDINP6cP17kCEfXMkvf+UFoE/3AnyQL5h5DoaLX2XkS0S1WCUHTtLMqPTzDqVQPYYyN8M216nQ5ZuGFso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1611BC49E
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

LGTM
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
> Sent: Tuesday, June 23, 2026 10:37 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Blocklist multi-queue subtests for PTL
>=20
> Blocklist multi-queue subtests in xe.ptl.core.blocklist since multi-queue=
 tests
> are not supported on PTL
>=20
> Signed-off-by: Venkateswara Rao Muppidi
> <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-
> ci/xe.ptl.core.blocklist.txt
> index abaa1284f..8752e92cd 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -53,6 +53,11 @@ igt@xe_pm@d3hot-i2c
>  ##################################################################
>  igt@xe_compute@ccs-mode-basic
>  igt@xe_compute@ccs-mode-compute-kernel
> +#################################################################
> +# Tests not applicable for the platform
> +##################################################################
> +igt@xe_exec_multi_queue@.*
> +igt@.*@.*multi-queue.*
>  ##################################################################
>  # Expected skips as the tests are not supported on PTL
> ##################################################################
> --
> 2.43.0

