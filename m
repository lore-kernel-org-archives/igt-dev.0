Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420C8606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHlyRL+m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B301110E793;
	Tue,  3 Nov 2026 05:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525CD10E793
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 05:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793682227; x=1825218227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YWg5dUG3t8yMPIAMebpXlncaLXz4GFU3Rtip/nnppkA=;
 b=BHlyRL+mei14njIwAvc4pJSCruBao/OREEXSL8tjYRKxGQlbo/oOJELm
 b7qzTdg53MVAy8q8ScmHwT69fLLmAv2gMjwFXSrcsLnAwcCsZg4GanMMl
 XYjSkqfuNa+P4rUsu69exOCE5k3EKuPk0K2qAYbIQGVb8dLHYgXotPnqQ
 +jDKzG08rjUOF9ZwREvwAVl4GvkyiaKgTs9wdPFBn+jD9bENumSSmb51h
 6lWA+kj5enq9DrcsQtJVlpXJARXNgwZk9+fd57uQf99aJZYsXxFFtJ948
 pfwS/8zioRu/byqS0IjjmxbDW98B1Sva5VpeON6ut21bInS3pqMwj0XpM g==;
X-CSE-ConnectionGUID: zVkDW+GgQA+OKLMnyDjAsw==
X-CSE-MsgGUID: alfIypZGQwes2U3vCk1Xqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2386689"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2386689"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 21:03:47 -0800
X-CSE-ConnectionGUID: p7V9Px6YT3q8L1MsYJTI1w==
X-CSE-MsgGUID: SLVJHh1aSJOMFh8dG3hTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6640776"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 21:03:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 21:03:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 21:03:46 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 21:03:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjpImm/CORhTA83tmn6daWfeFBrdaELZRGqVfEUtU6SZnMCWqJhrsRq1zAqs6vcx+TjvDhe1KCfmpJbSQlYcaibnRvi6rRPTGZDCElenveGL7vgRjUao+acno2rAi1YXePlwZN8CC+gCvn5M/ziBIC26A9RnI3CEbON91uM6c8CLN8zIPtmij9nmS2NkRPvw0nJ3Q3D91Avk+2KR6DwrxcIUsoAsUXxdBBQa4GSNBrpxldtxDpPRb8eFGpH3P+p645LSWTJuNZyFsCQi8nYbPop8SicaDhJ6SwdRt7T/GnB/3R5lrrtPa3I/hn5tTOF4gGGYWCKmBhvqbZFZ/3WURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL05rmBR1Za7oesAaXA4+PGH0+PmA/HytyKu9LGOw2Y=;
 b=xVWbumExHNYTSLr0eA6FoXxLSGG+7orpdIskAQHKvaA+hWTUEkIU161cLfq2NJ2PlZPI8z15Rh8nGd1UV/DEGl6sR+XL95YwgAftdR76xNPbiF+PAOYWw7csunwXdMxulejPN5GcMayDaI3sf8cO8P4kW4YOAQ/Y4VgsC6UKMERvY/nTM5wZlgoYFwrA4q+JsGBqpezdDwu5NDNUhOy+pAoUnyN2tbkWJ4iG7QaFOE2nSGfLcoEjeLR/gzD+yRDKcMQwbhGgLP2zuxRTrk/0to/4SkHuzy+vRj9HI3KyJrI7r8lZheQsIpbVaZ2xklNYBpIBywlYpW1fJLOXFDklwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by SJ5PPFC4905B1D0.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::855) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 05:03:39 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 05:03:39 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>
Subject: RE: [PATCH] intel-ci: Block more render tests on CRI
Thread-Topic: [PATCH] intel-ci: Block more render tests on CRI
Thread-Index: AQHdax8rg+O5jGhLeE6kaUpfF7hMM7cbyokg
Date: Tue, 3 Nov 2026 05:03:39 +0000
Message-ID: <IA3PR11MB901328EDDA5E9809F407A0F285692@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20261102230854.89148-1-jonathan.cavitt@intel.com>
In-Reply-To: <20261102230854.89148-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|SJ5PPFC4905B1D0:EE_
x-ms-office365-filtering-correlation-id: 3330bb3c-0644-4079-53be-08df3967d2df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|22082099003|18002099003|261102123227099003|38070700021|56012099006|11063799006|261026121527099003|261009223027099003|261021121427099003;
x-microsoft-antispam-message-info: o9wIAzs1qGSIkREP8b11r04lhSr9lXhAJ8xnsHaf75wHWtbEdSvtbxIY4IYktRFM/8jMxEox0w88x4jIib4eGUaO4gd8jFpA3/b13poKln96sopLtA9qu/4+5rxbYmlKtomye1Lc++F/2swc3ADlhNDmt/OSsxcew03W7hpolg3AnEd2A5BES0//5Ih9oiQSNech8Bi3Wdkl0vnHZ+BgnvsGFYV3YmFpr/sGv9CLT0eDxrFC2BCS50IVeDxINHPuMb+ilxBfQyUpMWhgEZt2LI3aD2L/LrmmM2AyzqiaSE4ItyH9+yyNvOUXY1UoxPd7rQkSafopPXMVm645dRBZHCvUwG8DStN4UOYbc/hE5ZQXFpByeNIkvv+1+eGoEJsSrbMnwImcZpQZuhOU4ieHR6PQnLUSqJMMKWml0t7ZIUNXkvTM5OgUBz0MiAM59iflbV82NuWAkfEh+jPDsuWy2lsVB4fEg4ZTLg4p+L6KXz00Ha1eeok1h1G2EwlhUENHxkjRA+NCHL3F/7uw2lugo31IO2LJ9IG3VxVtgc2HGDYQjRVGXvbZ0hM8pj9sTYrxegCi5Ugir1wpdyxwnKHtkao/9vCYWgowMn7Nz1n6lNCGG5tjnj146chNsOYPd9+2aUoS07AlBEzP/LCvwdNPT+Jz6VxM+5wStFk+sFwRt8A8KeubAwHwI309Gu1VKhYhaMQJs56+Yz84ueexe+AR5oPEGLNlLJ/U7EhDWpu8UgM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(38070700021)(56012099006)(11063799006)(261026121527099003)(261009223027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nm3XXYPojAkUf+0qPS0IAW2orgH7jCgw5+wbJh8qeGv0EV9gK4JoYYjPTQ8T?=
 =?us-ascii?Q?29GPIdPq6K/XTPTmk8D6+rfZVvDE7Zx+dVrhJbT4MZxtreE9najCtbSVzXY9?=
 =?us-ascii?Q?jZAfGaR3O7N2cIyGhP1cGI/4wRHqTYIWqXe1RDozsnJ7BHxVP24MIN6A4eNQ?=
 =?us-ascii?Q?V8veE8boqEUFcrCHdtZoDSDkL2urBqUoCgV8CBZzRRc0nRlgi2BvIvMP1RIw?=
 =?us-ascii?Q?dnUVj3oDViTWKLsUgq+fjOhmUyU2i7MTU4zJiGvrb3KsfyT66f9eu0Sk0SR8?=
 =?us-ascii?Q?L5/dbM4dVSgwUGVzG9x6wTYMVbl9LYFDtjHAq9VZaOFvqHHYVWH4k75V9o1o?=
 =?us-ascii?Q?FoK816cYvSdXdXMlFrNVKVqsCSS/aYx8+g6B48L6wgbdGXX25hjC9aZCySWC?=
 =?us-ascii?Q?mbVC5uGBUR5XGEjce7q+EpRykxJSYJHWjPh+Ev+nXp/bJwiLfcqtMDNeYkpr?=
 =?us-ascii?Q?55c9UmOmJdblXxLwlniOj2zWhrUK1QmxzeKB1PBPc+7jMLCr08lxBnTgc9yK?=
 =?us-ascii?Q?Raq3wUI8l3DdHGMciZWmyiaj2IzUfWDx7cxmHxobgsQU4gJbFdFdX8LN/v6T?=
 =?us-ascii?Q?1pfkc5QxvptZ1uKB+r+GfVOQeYlQdaF0qeUnbLrSbCCjAJLdtfMMkJEmMjB8?=
 =?us-ascii?Q?odS/Z8N5xHJaIrjPJFfKwX5X5qBvyOqwnxWwLRxEHnnGnvcprlbz3TH26pVe?=
 =?us-ascii?Q?cwP3Ufs7KdcjDOWgATv1OjPfUMRCJMfAgUFMnwrm1uqSZoPLCX+X9DgHBDxi?=
 =?us-ascii?Q?mGwjmGoJDHovkoz++gbClwJwZps0x9ZRNdavIyjE3SxS0uC1ufaLzFMf7tUO?=
 =?us-ascii?Q?g1NDs8jbxnLAnno3oAaMzrftxLTYrB4FETKcwyunPTvjsnyHYwUJpBwPqYr/?=
 =?us-ascii?Q?PxUmT0bbwx4TcpcY3DmzbT7dpWf0eWEDatDd2LrSjEYkr7sm/JEMClFUh8v7?=
 =?us-ascii?Q?EQNduF2Dn6vFYrRiEmE2PEVCHmfGiUimQvKCPkV++vmW0lJtOA/JIBMjJYRh?=
 =?us-ascii?Q?Nrzb2KhmJx5nk8SsDO3w9Tbm7nQNsyIRGOw2is6nRE1EMImRSDT/gdgDNsJG?=
 =?us-ascii?Q?Gdq61YQA8iB+SFagMZDq7VMntqO7dmPUGOlHOlshaYmb4DzxJxd05otlh2MS?=
 =?us-ascii?Q?ynjjpweyeKayO3AxRatvUQR36Ipwbbu9UcYHQkEpvLpnOd0fApAv1GONsikd?=
 =?us-ascii?Q?JHb7Vsy6vv4UeMGYMGWS3AvpHItW6rWxCeSXB8DOnthItepWXCGOZU1XVAJI?=
 =?us-ascii?Q?6owBOO3jo9r7VzGTXaxh94gEmpLT6EIAWBngkuLITXxm3JiEi5POMhcujkEx?=
 =?us-ascii?Q?SWYEDQ+HveNQ/1dFA62YYtVVq05sRPwsa9zs9gDfK8LxpRvRGPh1+7yJ2Rqp?=
 =?us-ascii?Q?8KMqOv/JQWskhzHmgq2edDJ6siQKkl+YvE/8W3OjzY0Kj22OBli2ZNJHNDUC?=
 =?us-ascii?Q?PZlqcpi914dQyDLiMF3TuSmvzV0z9KSaxob8XI2aX7Ouv/bzZ6bLpc2mqXi3?=
 =?us-ascii?Q?jcJm3uMXLThbH89Y1UUkecwN5lx9xEwIYuLVYEO9dWRZ/efg0oYnK2QdC5ZI?=
 =?us-ascii?Q?D/53/CKXjkLtzcAaJoK7nQ/Fzl/c5hiBuZDsgdjrXUlh96X79n/RwYUiX+Rt?=
 =?us-ascii?Q?XKibbeGHWvM6CJhNgk6NlUP7uRjlu40BhnIEIM9e+4HostI+K5BWvjPxek5A?=
 =?us-ascii?Q?D28HUwj6YUNT9ibWJJWycw97G98RtWdA3GQ4yncPF0bikvW5Q6javFtm//Y+?=
 =?us-ascii?Q?h3d+9qqP2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tjKMzx9vjUGqpdSHcHAYX7p+6UyyEsuupZuVx9zZnyIqv1IQAkHf+IM5Rm5sa9LyyhtTIzlUy3l1KFxMEJoC7x5EvYwOsgy1rFttqf6w2kmuOc7z17hXRWTJKL5YmiTQ9mQJQoF7DqbZw3edYGYNTWyvdnlZMuynVHdHwFBfpqP5xjBX8DO2bOx9oVAAd5Ub574bhy5BYNyNkbCzEgnHy5z6I1++N1vN5C6BBhicSQGxYYXCQDmilIJeP4ouvmXUDkAHMU+f52SI+rp57CZb2eG8dIFvoaHYGL1/k3CL50wtg5Xymld5rt5TVC/V8xopD5gpg20RLoKB4/gSlvr5RQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3330bb3c-0644-4079-53be-08df3967d2df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 05:03:39.1603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vw6KhaRQlpv32eoGym+QamJ5xwYZpbfx9W2jODo+wuB0LA3/Ql0HtN0x3gDrj3WwMgqWpVq3PcVHRl7LfEcIou8KsmpO5BYbxUfnFsjIbSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC4905B1D0
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



> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Tuesday, November 3, 2026 4:39 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>; Girotra, Himanshu <himanshu.girotra@intel.com>;
> Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Subject: [PATCH] intel-ci: Block more render tests on CRI
>=20
> CRI does not expose a render engine, so the tests xe_pat@pat-index-
> auto@render and xe_oa@unprivileged-single-ctx-counters
> should be blocklisted, as they will hit their skip conditions regardless.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-
> ci/xe.cri.core.blocklist.txt
> index 41328186cc..254654422f 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -23,6 +23,8 @@ igt@xe_peer2peer@.*
>  # Valid skip: No render engine support on CRI
> ##################################################################
>  igt@.*render.*
> +igt@xe_pat@pat-index-auto@render
[Gandi, Ramadevi] Please remove this entry as dynamic subtest entry is not =
affective, to exclude from execution.
> +igt@xe_oa@unprivileged-single-ctx-counters
[Gandi, Ramadevi] This is Ok.
>  ##################################################################
>  # Valid skip: PAT index tests targeting older/different platforms
> ##################################################################
> --
> 2.43.0

