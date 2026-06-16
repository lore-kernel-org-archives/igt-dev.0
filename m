Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB07CD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 08:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F06310E8FB;
	Tue, 16 Jun 2026 08:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KA+IZX8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F100810E8F7
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598759; x=1813134759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hTYxktpIQ9VeOdWhah7ZgOJoMDzOjctPx8TyEGG1eCM=;
 b=KA+IZX8NXc1wrqfvPGzL1NbI2VXkyX0/cmED0C+eRT7uj2m2sX28+YoM
 T5EWf2o7vOHZ/lIZMG8EXzbdhmF5LQ9gCQJ31vZKUoLYA50Xb70C4+709
 rBbUtoE05dLHtxXQ4jI5UncPdaW3ITXP4dYYczZYvKfChxU5xnGMNLIeH
 ZTmtByrkgEtiNOl6UyBJCQDaHP111zMFqscNPlK/7Tc7aZBSUZEpwu9ur
 jh2CgLSacMM1JzozUn3y2tGjz6hXcaPoqc+vpeHjGJhjHKAiX1uuJkTBD
 hB/EibyAWlblz8eG7kCG0IL1WdZcc3uTgQj0cGtQ2WlswzHXpz9EhaoNa Q==;
X-CSE-ConnectionGUID: /jBwcnTWR6aUOQEYwLeH5g==
X-CSE-MsgGUID: vEfHXHCMSTKsdFr3bpACEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82401112"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82401112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:32:37 -0700
X-CSE-ConnectionGUID: m1Yn+Q85S9ujcQCpGQUF9Q==
X-CSE-MsgGUID: rHgvMn9oRhGJQDQab5zJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247768156"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:32:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 01:32:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 01:32:36 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 01:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK6SOs/LOQqwC+O3CEiPD6VJ7jFrt5VNxNQDEfiqZ53Ny6jboFER+gDTkLIIfEncvbEhGuFEaUwkY9js96Jxhotem1XZ9Ym8XQY9m1QWxoOmr02OO05OdI4Axwz/qbNrCKQAT620lu38DTc9i5DLmWNSnFkKlr+tsx+PcnGzGJpXoTYk8K5xTlsQ4egVeMU1jxxsDYb4GqFh67CAtsc9JO9G2ZiVQ0CG5xGM6B4opIVA/sZj45u7UeJD7dMSmur0hNugoA1CtIeKpVe9LttgJppnEHV1JR+UX/qumwumYIOvWC54lq2SGz3H911UeyLdnsho6OANuBoh/A7o4qPenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iYS06+8RA6YLaPgbYzLI5zhv+vxxdTenQGspF/PHnE=;
 b=Iq4Ao83OqDDxTxbTVcFZRhaV7NHMjvh8ILMjjr5PM/jWyPF63IqpoIOxWs0hfXwmzQc30DJbe9fCPBjuCJZZjUMV/AGiCTGmPlTD+tLNoNqd3eHTkWOaoUWxRzBgUgeAglL9MRic6NDT6ZEvTj6SgGunL6gZ2OUpSwlq4BgFMSBUyxiJ/oMBre0x8Kr/yGebNgKmN59fvE5i2VP8GvOUL6Sr7DIocf50aRqsdm26IpH79AFm7nb4h9XCUStv3ar2QjXf79gaorAvdtF9m2PB40fxfbhTOuICBz8bQVZhXclQOsiY8gyXsT6H4KUWkSWwpyg/NfD0BjXkhNw7yOWz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:32:28 +0000
Received: from LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf]) by LV3PR11MB8483.namprd11.prod.outlook.com
 ([fe80::1b9c:4b:c780:82bf%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:32:28 +0000
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to
 xe.fastfeedback.testlist.
Thread-Topic: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to
 xe.fastfeedback.testlist.
Thread-Index: AQHc+m5vNC2UAd74EEueqED51MonYbZA3rjg
Date: Tue, 16 Jun 2026 08:32:28 +0000
Message-ID: <LV3PR11MB84836A824BFF69BD4109B552DFE52@LV3PR11MB8483.namprd11.prod.outlook.com>
References: <20260612130659.5129-1-venkateswara.rao.muppidi@intel.com>
 <aiwH5qdwccT780lH@fdugast-desk>
In-Reply-To: <aiwH5qdwccT780lH@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: francois.dugast@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8483:EE_|DS4PPFCE18D981F:EE_
x-ms-office365-filtering-correlation-id: 8ffc9ae0-7117-42bc-775c-08decb81cd04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|38070700021|18002099003|22082099003|6133799003|11063799006|4143699003|3023799007|56012099006;
x-microsoft-antispam-message-info: pWwZQzUISv4VmZSq9j1XL2Fpu0UCLLtC5sX6Pj0Sr60uI4i8d6tz+tQ+gHSWVygB99//d6Hru56SHxzXh2bjV4WWOF4DHyovtK45gIWc5xGQlK5Tsl1sntdxyeIu7PwRqcxiQBVVYQZOXBQ1XjVHWW0BTqMlB/6rETckzU4rpUeEeE9m666u9hmJi3TkYGiN88/b5FsWuVsYLUHOaRACuO+3ZbMmhK4eT5NHcHvcWSLPtG+y05228BKTp51ge8r8BUBdmYdYKrX6tbgOmXYb4oFSI2duY1KnwDuWf9/MunhKYpclkSQddenral3m0/ZSELvzte6AAngiEMAMyrJb4uUS8Rqo6xDcfNryQDuctQ1MRenIMvIYFSh1PRADt7yP7Hs4kNrdWuB87lJ9AwqheMv1dpzq58vsjeGE4+IQpmR87fY7TQBew+hk0gnRWe7EvH48NLcTjWSi2QyL4+qykoqY8TZ6DTWZ4O1vOooFbfCqXHH3v3do+6qJZ4nab1xl1B7Smky+FYA41u/P3nEOZu2vfO0k8aWJ7+JMLbaItZnntU2syMgo4g3N+VJ+BlZ7zqE8EdeTT7+jOUKrbGs388sdmq35P4nglhuPrnoBL54fJYnNvBpRps1KeroCvDwF+p1gHULzcoR+zO4DA/+cWb1I824Hx87ohwLupeeiPQbH99LrGlg8scKHI6bwpRt1+GVMkgyUlWZZ+vfLlCWt1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8483.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d58foj8FBfEMrESgANmSjE7qax37gk4REW0EBWsXnoftpy8UDY6oe/rm7L8S?=
 =?us-ascii?Q?NpHux8R0NB1Im2OcP1x//h1kzPNxBWW/DPpkytRnSGKZzv7gD5G0dt/jb/l4?=
 =?us-ascii?Q?v9bubH5FUjt4iI3kyXi/tg03zOUEnHKRVcGhvyBEkeUMq6tT2i+mYeSwQw6g?=
 =?us-ascii?Q?aVi3pAnk7fKoSfplSz/GKeDg9DZQ2cNZt4esgDgWqMVlRDCgr4+cTgx2AwnL?=
 =?us-ascii?Q?1gNNGJuzPtjM2auLvrsPfy1mtNoIRi3raUiu8j1yP0iRA2jDmQIiycq5bczP?=
 =?us-ascii?Q?+diH0tJ6vj4VF7E0zmTYB1VQNEx3cM2RPUHrtZAQOFpybbZIeHDkc+l9ImTn?=
 =?us-ascii?Q?VReuBHoMOkXIaujeJ7wwR6MS9AlJhS3ygTWU4cnvAwnCMb+y9viOiitlgJaD?=
 =?us-ascii?Q?QtZB2fyERjNPvwKG3rhm6k6DELny2ucC+Hd9CoztM45ojc0A7fAoI2R7NAJi?=
 =?us-ascii?Q?QuXqRZ1aCD5Ik9w8UliptDvqNOeib2IJZY4qa+Aq7tXGNyD9rGs7Dg1NP5r4?=
 =?us-ascii?Q?Za1xayZK+cZtbWQVr4sBewokVRUsPqlp/CLo6d9av3Z54b6xufdmTaLQoWbN?=
 =?us-ascii?Q?pqaPcV+oQ0KGDqX8K5noxlQ1n+Ov8fQHBgfwIwcpO+LTThIPY4sryEBYFtbj?=
 =?us-ascii?Q?YivS9q5NGBT3e+uCRtdhJqqYq6zkknMLEBtfBs0rsFFbcgi+QqrFOEP8bJQc?=
 =?us-ascii?Q?YxYzoAHSH+4F1Ko3FFwJ9CjvmtOeIltp1XQCPwabJZ1FFzy8z+utJ0iNung3?=
 =?us-ascii?Q?7UdAfhyGwfTcZzNBgcRPm0rXtiiCb0Uv7yJLDl25YORksxqGN2LDFohAvZ3j?=
 =?us-ascii?Q?hPiTvHzA0qojj2UZEivfz/FVD8L9r5n4ldEh8W80dQqnWG0G+cxZ3dqqbo32?=
 =?us-ascii?Q?ghMli+8/EnzUwKJTmU4yYDvcp+QT9mU+4lwQi3VodJTuCIVtADOxAr0KN+IM?=
 =?us-ascii?Q?WOxo5gBNUyhfTzpMukPV3XaItXJKuDeEFDkzLirxxO5aek1owWOrJkMzbrIO?=
 =?us-ascii?Q?dE9HFlOaXe4CS8x+i7o5vSh7jqh1gnGuFAvD1E0tgHadKJO0cVd1xwGWuPay?=
 =?us-ascii?Q?EXVDBek4l3L3f+A9mQR6rKPJToL8tElYdh6iK+R+NYSNcbrYCeLbEOWJ9k8K?=
 =?us-ascii?Q?I4E7r78F8uACamOvgmg0CwkclHIhnPXiEuGBjrWXtdTF9i4QbTPkRYyri3Q4?=
 =?us-ascii?Q?GXE53LB7ZQAcd5qV2QS/twZLvv/nWWLb0n/4b5QQJmr4X+lJ5eLCk518pWe6?=
 =?us-ascii?Q?Ks/a0n3LJb/YQdHTMOU8Y5EC+hfn34f8uQfrPmKuv7TqQv1YEvjIvghRlhg9?=
 =?us-ascii?Q?rpr2AjijHTs/taY+dcjIrAiz26X0OPVM7wjIgP4+UilS04oMktpBDq/IgJ7n?=
 =?us-ascii?Q?+HdBKPe319dTbgTIsVbjrqPjM5sXZOWLgS7eP+0wdElVESgZCbmslrW94BnF?=
 =?us-ascii?Q?cKPSGVAQ4daMv1IS9gcrXt7H6QwO7nMX+v3y66ANXxBgqz0rhW4zzrrSiQH/?=
 =?us-ascii?Q?bTuJKeZxq00TPgY6pTcO58bysWGxMk4YLmtNE4Q7UsxCG03QcVFnGGwMz7vL?=
 =?us-ascii?Q?95aQu3eUkIDyzruxpo1rDkWZ/eq7+qlPOX5AvidyG7wxTYrvpXtUYxebBHAo?=
 =?us-ascii?Q?cdl2HYQZhv3GP+nxknVWmSpT6/QyIzSIqCpDS1iXigulNymLVfQvggMRWxjA?=
 =?us-ascii?Q?o3HblrMdZFl+4eBEkvlLD+GA06cA2RELxgH5pjGpGrsSzrOLu6qTm9mMUctk?=
 =?us-ascii?Q?az2+5ibQ21evHt/9F/M0F4DsVTb1Njk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ME0Figu2AOGHyIPhO21GLv9U+iGa1Ddlg953WGBBK8bFTRq5jua9N0XpuK8c6yHW2oeVUbL+hqAoMz/e9Co8IbQj7pZu3Aco5k3AQB4bMK7nIeQGJp3siGRTp2GgnzWbBFeCdoBFQvzRQwOgEJgf8apc61Tpgxn/UtfOk8qSEUEG7zb4o2BAd+l8rA1sangOUxOX/XSiFeU8/la3Iodb6U6RJVcJype4yAM6seVOhHZQE109MPpIi1L+BZ7at9YVGxqNKaPRdhuWxd4v7WW2wm5JbevxVQXvBx0v25ex78ghNtlpRZxeLZX18m5RvRVRx7lM4NMAz1LzYwwEbV9mwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8483.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffc9ae0-7117-42bc-775c-08decb81cd04
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 08:32:28.3732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxJ41OiBGw7WeSrs1xdxbZvznBLXomCD4P0YnSkhTqjf3n5Amj3cyfyaAOc6EBf5FtF1KJQxx5g2Wwy07olEoOtqfs1Du74vIjJT+NpQOZvogT9ia417bOghCKxGE818
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
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

Hi @Dugast, Francois,

I have added the eu-fault-2m-range-device-host test to the 'xe.fast-feedbac=
k.testlist' and generated the corresponding patch.
Could you please review the patch at the link below and let me know if any =
modifications are required?
https://patchwork.freedesktop.org/patch/733145/?series=3D168562&rev=3D2
Thanks in advance for your feedback.


Regards,
Venkat



-----Original Message-----
From: Dugast, Francois <francois.dugast@intel.com>=20
Sent: Friday, June 12, 2026 6:52 PM
To: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org; Kempczynski, Zbigniew <zbigniew.kempczyn=
ski@intel.com>; Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Vishwan=
athapura, Niranjana <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to xe.fastf=
eedback.testlist.

On Fri, Jun 12, 2026 at 06:36:59PM +0530, Muppidi, Venkateswara Rao wrote:
> Add SVM,render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter,fault_mode,multi_queue tests to=20
> xe.fastfeedback.testlist
>=20
> Signed-off-by: Muppidi, Venkateswara Rao=20
> <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 36=20
> ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist=20
> b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..de71cacef 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -215,6 +215,42 @@ igt@xe_waitfence@abstime  igt@xe_waitfence@engine =20
> igt@xe_waitfence@reltime
> =20
> +igt@xe_exec_system_allocator@twice-free
> +igt@xe_exec_system_allocator@twice-malloc-fork-read
> +igt@xe_exec_system_allocator@twice-malloc-mlock
> +igt@xe_exec_system_allocator@twice-malloc-prefetch
> +igt@xe_exec_system_allocator@twice-mmap-new-nomemset
> +igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck
> +igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eochec
> +k igt@xe_exec_system_allocator@twice-mmap-free-madvise
> +igt@xe_exec_system_allocator@twice-new-bo-map-nomemset
> +igt@xe_exec_system_allocator@many-execqueues-free

Could we include one of the eu-fault_* tests, such as eu-fault-2m-range-dev=
ice-host ?

Thanks,
Francois

> +igt@xe_render_copy@render-square
> +igt@xe_ccs@block-copy-compressed
> +igt@xe_ccs@ctrl-surf-copy
> +igt@xe_compute_preempt@compute-preempt
> +igt@xe_compute_preempt@compute-threadgroup-preempt
> +igt@xe_exercise_blt@fast-copy
> +igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
> +igt@xe_exec_mix_modes@exec-simple-batch-store-lr
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
> +igt@xe_exec_fault_mode@invalid-va
> +igt@xe_exec_multi_queue@sanity
> +igt@xe_exec_multi_queue@exec-sanity
> +igt@xe_exec_multi_queue@few-execs-dyn-priority
> +igt@xe_exec_multi_queue@many-queues-basic
> +igt@xe_exec_multi_queue@many-queues-basic-smem
> +igt@xe_exec_multi_queue@many-queues-userptr
> +igt@xe_exec_multi_queue@many-queues-userptr-invalidate
> +igt@xe_exec_multi_queue@many-queues-priority
> +igt@xe_exec_multi_queue@many-queues-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invali
> +date
> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the  #=20
> driver in a broken state that is not otherwise noticed in that test.
> --
> 2.43.0
>=20
