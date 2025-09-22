Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AB3CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 05:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EF210E3AC;
	Mon, 22 Sep 2025 05:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6A9Smer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B9310E3AC
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758518819; x=1790054819;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h301TvMfYr+VdsPX41gj/j0Dq38XK7wLCI8N7wL/WIU=;
 b=B6A9SmerMfC9UfhluXVIzucJe67cnP/hfqMi2tNhI6sqC62b3ed7b6FL
 irzsf1OjJm7UpVucbodj1JZMQB4fHYWcQqTlukNWMmZUEhgfPy9Ft/Eur
 IkrT8J7hEGOLR6zrr7cLZs9b98jgZU9TNZmIKOQaaecqlwMgKgeAvqt6b
 iO5Q/RWDDL6F4LO6bH650BCruWAdFxFsN+GtkyC8XyLn/tdiPM6jl40DB
 RKg5dQILyftGX8CLjqoXFoIn6yesBZV4ZBaEs9v2mI6wsLptU1bydkql0
 tGQ/o6Xc+ukP8MFTQSNahj1mZctb1Imzs/IKYbx80egmuV9KkWx2ZYLD9 Q==;
X-CSE-ConnectionGUID: j/laUgtMQo+lV1T3QO1sBw==
X-CSE-MsgGUID: 0N5TVAzTTauwFaiGges6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="63404981"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="63404981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 22:26:59 -0700
X-CSE-ConnectionGUID: DRPOBS0UTs6q4JCb1rLVzw==
X-CSE-MsgGUID: TIsLGfC9SzS7erKFJ1MlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176454656"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 22:26:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 22:26:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 22:26:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 22:26:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouWxGeihUP/alkUwwEtTsDPcmRf7/JG0LeBbFhx6BDITRbhVulCIz38TzZUriCpb54P6dtR0FcXBHk895uiXwtJqOPwpaYV04lX8HVISGXvTS6C52287JUWRZTPeswuQpUk+OkqN1oBSxR/g3TjwZYSaQT2aKXsyIMGUO13JzAHbe/6XQeNd956xOQFWidnJkBtAB2uVM22sfDWmEAQiJomrDHwDZxVpAT9kDT7FagRYp6d9jBQqGP4R275I1ZqnmPCP+Lb6lP1vmxwfUf/xlhumhOmUxGPxzh2soTWIdNAHyQumnzlqIcrxa1beQmSkxjbh++GfMIIaPoY1xB6YFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/OxGiW88nWSOXHjEPyJHzSj3wFaW9nXPPXGSnBJ++Q=;
 b=ipJBy8ZLn585HbEeays22pWxfY6VrCujC8ju6qThygqxrhd30dvpdwJfEZ+mRXNYPDpWJK3HPvhOBoOSE/qPVm3UKBc84dukpyfuMc390fGL7Jci4AjC0P8qpbqGBKnLCRIfBMgNzptlJOqw0QaPZoxw9Xea7x9UHzX5Wrm6XvwhYjIiUleCAdzt8gf/SdqU1xEj2SwmlxfOg+ezRweUqdr426RqMz2V/9vBd+eNF8MOckFBZckwnWCvMSbOOXNLTn9k0Bqf04lOUF1WDgBbcCv5CtFWOluWR2sh/mt1zfWO0ldsZjEGOkW7+lAY9VSSQPeBetqm51yodC4rxfA7IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 05:26:55 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 05:26:55 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of
 lobf debugfs
Thread-Topic: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of
 lobf debugfs
Thread-Index: AQHcKHrOh8tLybhyvEOSJYxzlit/e7SeseNw
Date: Mon, 22 Sep 2025 05:26:54 +0000
Message-ID: <DM4PR11MB6312EEAF11DB77F4CFBE2BF49012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250918091702.2339227-1-kunal1.joshi@intel.com>
 <20250918091702.2339227-2-kunal1.joshi@intel.com>
In-Reply-To: <20250918091702.2339227-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV2PR11MB6021:EE_
x-ms-office365-filtering-correlation-id: 42c6d232-db0e-4b42-b975-08ddf998a4b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?34YQzyovIhL4UobbfhtgxM18eFqkwKWu/w6zfah3EyrRXHwq9tuN1zZWkbqe?=
 =?us-ascii?Q?fS4uc0+U8kIPTtKSH3BBoRJ6CMPUQzHiNyDSCvekqUyMlff9yRTk/6LzfLU7?=
 =?us-ascii?Q?FnaM3ffH+CvqsPuHOKkpgswTwPGLqFofUpqKsFc204yvoSAgGybCmLtYgWiv?=
 =?us-ascii?Q?unYIUZahkOKm3X8HKIQidkoaHHoPGH1vFkLnYtp2wsfDl8i9bjsKs9snnWmn?=
 =?us-ascii?Q?2eJT5Ud7oxSXiRA2m1XmkG0XR68/M/gv7uyTj87HcTkLC/3m8ReJCsWGHwV0?=
 =?us-ascii?Q?A7rv353oOTKCYCKnMByC1Yo6jzJvAZR6G/RR/tNBzhmtsph4WOZ1gNiSG3TJ?=
 =?us-ascii?Q?VanKn3icigXpRFYXjmJmJggfZ8oidz3KzE8kCzFn86oL+PwupJ4URm2qwERa?=
 =?us-ascii?Q?/DLX4vaGONSOes+cE5mEbfCJscPU9DhNviR1Z8PsbIjrlGxse32GEmPiixzS?=
 =?us-ascii?Q?6BLOCHX4TxEz9SydzfGssvxNZ7u7N0IBExLOda1O6r197FUuk3je18PR/HF6?=
 =?us-ascii?Q?dJurOW/KkLg90CePeTjoKTFa22zl+Nqo0/PKEsETbGeWPPZRJBeP97ryoXaL?=
 =?us-ascii?Q?gPfBf5zQnduTTcll0Q/R1T2YH85v5+BauobSK7dsc67ZQSctcIHkWpNXi0z9?=
 =?us-ascii?Q?W4kQh6wEjxetDTzbRfeAOnVkdlBBFrG5yX5MSAczc31pvacuKmv4AtWhFe2z?=
 =?us-ascii?Q?08mJCp/6Ws3CwqUKw3M1bsUSM/G+5+NTVcH4HzGQtTCChCc+5x4A2IeHC/hx?=
 =?us-ascii?Q?4F6k07VSAFEAhfUnuO+hS2Luv9pTEV6SxEPnGhsJXkdahbl3RvyKm1yoYxCV?=
 =?us-ascii?Q?Q/O640ra3zxweL8FNSVCo9/+oNlLYybKEE3Y0NAmQt/MP8y1QdOLJV67k7eE?=
 =?us-ascii?Q?bFwNMmKOu13+5fJ7nF7RYwDZzroyrJK//CbQJad8mIKjpFdUzKpZDtKWdYsT?=
 =?us-ascii?Q?zYLUoZJC4+CO193+w63BBRl5+gumQoiubvzhE453Gygn/drv+1DFliyNZ5So?=
 =?us-ascii?Q?wXYJaVvOwK/4tlri2wNPdDeZNGp3626o9Y/KQ8hMRfK7d3PmokCY1kv7j8qv?=
 =?us-ascii?Q?/gS3l5eEImnfp/xNusSk9LAe9c6gzkl17tS537yNsT5VSn+W3M0mQK/SaAfs?=
 =?us-ascii?Q?o4z5IE4NxnF8SsrWvQrSLBOHbpZFUgeAjHwNn0yxU4IwiWF6s1Qd2mzUCAhT?=
 =?us-ascii?Q?LUtnc4ktv/POStR16rQ9RQLe1Hw56Ycfi/qqPwyt8cNAiMx7iC+LDhySWeB+?=
 =?us-ascii?Q?b/s7yDKvq1lYKOxADdMhWIMbvUS8q87wEMyCKIFa5y3BBb22xq2bp4f4c1yu?=
 =?us-ascii?Q?Vdx+ercoWS5Wj5hywhakk8v4Jovsg03PmSrZ5XfXoB2gu2exNEvx/Or9Am/P?=
 =?us-ascii?Q?DrlufrEGRanaRKgKP39cpWJDcehtUpZO/1hNya9ZRxIXFme2T+is/G4pX0Aq?=
 =?us-ascii?Q?xpkduEPax6/m9Uwsok1ggOB6aM1cLkct73DofN5PCk0zYIxTQhDNOQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cmWYPZJUvSbHSEj0i9VKLIadH6LRQvmobe040UJi90zeyCfyfe2hlwJVRUEL?=
 =?us-ascii?Q?Z3c8vKPxq8qgkfn7OPJh+xKWDmlbtK+iBp6wPZBPrr6sXgomE9nIy8Cjfepl?=
 =?us-ascii?Q?51oW5Pihs/EWyTEJz8H97QdSYy0B7xdwoE9z5KZ72XmIneueKGE8ZKhrIt6o?=
 =?us-ascii?Q?EmzjfH9ASuLTqwR6GFIjl5n+o306x0BrFWRAvPJbqrZ5LYn+OV/accU4euyd?=
 =?us-ascii?Q?n+DvxBpgezB1TY339cZLvFz8GNyiLObCNTtAhk6SF9GoFecuTDZV14rBESUQ?=
 =?us-ascii?Q?fF9zmmcfm3cjukOq9IcZ6p517j8FC3QSaLA1u4aMjzl2PgTRlosLGLnplwK3?=
 =?us-ascii?Q?B6XcDTk7+icobBPxhlaiiK+22w7t+2q6q2evpbEzHOQFDv9e0sxmLDcmogpn?=
 =?us-ascii?Q?CbylO/tPy6o9Ammi2sJFJgwIbP43U0gHBde5cvjEvkzrfnRU6xVdtQrRNUn+?=
 =?us-ascii?Q?nKdZmRI4x+WBoIB9w4xnZupZUnbZ3Lwvd9AFDWwrco2fhJRw57cOCDwc+91o?=
 =?us-ascii?Q?4Y0u6Av6RmDWDKTbyzxMjzEbrF8Mtpxns17Gbx8QzU67kFY4l51jCwiAbtEF?=
 =?us-ascii?Q?w+f4Wz/+a1JElF38tfcBHFx+upFTPGEvswsewcpb21gqqlEZ6X2YzXDzIFhR?=
 =?us-ascii?Q?3Vzz208PH9L2POEBAXASRzjM7yWhzWokCs3TzannHakTX9izRfqJ5VKhbHbe?=
 =?us-ascii?Q?A5Pexc5T8yJPrm+kRVmcjap1IZjyHOhNiVtnL3xpEa/HcWKCxx5Fcbwa1teg?=
 =?us-ascii?Q?0UHTjXOv3EXR0NZsx+0GeZpnVFRTiNcm82NhpAgFRIHfn7W1YahRTcTD9rBa?=
 =?us-ascii?Q?s8GuR4AxlbtW+nEV1ysCyA2KQH38D4Os2kXNf6kjrGVM8FLjQoY3wr9sXKtO?=
 =?us-ascii?Q?JY1sG2xPKSzuq1xzU9t4FKAMlGjIVTHnK63FAu70TOxEHT2BrQPxGb8S9gBw?=
 =?us-ascii?Q?ak55fkoL4Aio8IAgWc/2eJiXIt/6y2DZcFLhS5fVYopNM3tGu4HhRKKOZGkH?=
 =?us-ascii?Q?5w6A2V91mCdYXUaObBXlV3XWMKQWXN35xJ0hrGlRHE/pnGW7/TbvgIRcmBMz?=
 =?us-ascii?Q?FbTqmYcmg4fLenNfaJEjQgaidfigqDmriBkf9Y7rGXmHK4+o/ku6IFlOBDKp?=
 =?us-ascii?Q?oDLGJCMJYfvATXDf8qxYCl3cIZ9J7vZeWnoFL8QhLzFVhFePnc2g7nRuhVVK?=
 =?us-ascii?Q?ooc4wtECzqHoRJsKLwF7lkDJlj4l5SRP/cEN+rDc2jwf6qbBKpp+HVYGpGtU?=
 =?us-ascii?Q?uxuBnf1HgftoZ9j+Y3ytezTwUW68WQE+60spzA4Oem2quJoIWXp3hhKl2nLB?=
 =?us-ascii?Q?bQQd05+or5qOE6qd0zy2SnikWD1x7IymwYw4ZkSKqQGmIG9U2dHRYgk0hfFP?=
 =?us-ascii?Q?kRkSCYIJlm9dABZ9y94l5HAZCqAc8/ufWQHfVIqPMUHBKWpCMzLFZDJc8ea8?=
 =?us-ascii?Q?oMLDdEZdKouYTkqglrOETvLRfyeg9YCRoyiOmewiftjZbXcZVzUkpt43E7fG?=
 =?us-ascii?Q?ZUi5gwZtB+HDjwSoKBfow5jL727vzRcQ9jMi3bfOfU/TUeyevhrxgh0rXNWO?=
 =?us-ascii?Q?sdssicuzcAxjk109Pa0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c6d232-db0e-4b42-b975-08ddf998a4b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 05:26:54.9597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIuWzDgbyoLY0GHaZdI23ecK05LbBaO8yQJgprz+rmv0qjT0YPsoJq+sZ3HuWK9OmGTnCfcz/EvkCRBwr/s8Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Thursday, September 18, 2025 2:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>
> Subject: [PATCH i-g-t 1/3] lib/igt_kms: add helper to check presence of l=
obf
> debugfs
>=20
> Added helper to check if i915_edp_lobf_info debugfs exists for given outp=
ut.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 20 ++++++++++++++++++++  lib/igt_kms.h |  1 +
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index df4a96a17..699562810
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6210,6 +6210,26 @@ void igt_dump_crtcs_fd(int drmfd)
>  	drmModeFreeResources(mode_resources);
>  }
>=20
> +/**
> + * Checks if the lobf debugfs
> + * is available for a specific output.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output) {
> +        char buf[512];
> +        int res;
> +
> +        res =3D igt_debugfs_read_connector_file(drmfd, output->name,
> +                                              "i915_edp_lobf_info",
> +                                              buf, sizeof(buf));
> +        return res =3D=3D 0;
> +}
> +
>  /**
>   * igt_get_i915_edp_lobf_status
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 6ef6871d5..7121ab985
> 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1232,6 +1232,7 @@ void igt_dump_connectors_fd(int drmfd);  void
> igt_dump_crtcs_fd(int drmfd);  bool
> igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> bool igt_fit_modes_in_bw(igt_display_t *display);
> +bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>  bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
> unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
> unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);

Change looks ok, But build failure seen please check.=20

> --
> 2.25.1

