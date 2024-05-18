Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62670C04FFE
	for <igt-dev@archiver.kernel.org>; Sat, 18 May 2024 02:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C71C10E165;
	Sat, 18 May 2024 02:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YknCuaWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6474E10E165
 for <igt-dev@lists.freedesktop.org>; Sat, 18 May 2024 02:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715997670; x=1747533670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ue7ZCrkWF8gZ6/DxIS74NToINN/FqmRZeGT3LUqZpUc=;
 b=YknCuaWFdr15GU4j+ZnCfdYV9b7Shhp9qHKQa0OMiJ7bDqpjdvrf2WUn
 yh5Zm4sjkga1xVJEVDaMKce2X8vzeeS4SHAXvlSZi4JXP3y+Yc1kJk1dh
 3l3VWLmH9xsVcyz7Dk01t3W8tujWZqKtb2M49J97pHTM/mN4P3nOLXcXj
 QMKyezTga4R38gMSpPjrg87Eh5Alj1Rm/Zewmr/fzex7eAk7C8EjR9nOW
 X4MHI97UTgKhudDPr0UE+wgQ3GV5580GPJfy/CqLlE/YRXOyYiJz0pihR
 a9pa37Ip+v9xDvvTKQoiyAYt97KCVUMVCQ1Fn1Tp1IMctwIMB4M0uV84S w==;
X-CSE-ConnectionGUID: XBaQQKJGSFKXf7o67nFO3A==
X-CSE-MsgGUID: F/641j3GQYasUmRJCAXqDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15145609"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="15145609"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 19:01:10 -0700
X-CSE-ConnectionGUID: Kvspa6QJQVyTNlaeNXF1FQ==
X-CSE-MsgGUID: 2HWxcNzTSK+3adyJqVWOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="31988292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 19:01:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:01:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:01:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 19:01:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 19:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdNd1f6HiZ6F/9/bp/iXi5cFqNdE0TvlQtH6XuWEW7goXpa/Clo5ggKVkB3ajdIwB1KaPg3ekvb/9ch8IfYwZbxQtpDd1uu1klgssqSOPVoaxsDTOoGP1PFUXpILNxjXLOkiIALGwMrITqkOCzJU1Jj5TJ8tUW/XXH79ArL+MraA5Vd7VVm+6tiL5CklW6+dGVvs22c7YuFW5AGKuSQtpEQI3bOk45NORBSdErm4EfecgRYK60wTgmfaNkYVneYnmud8pkDnrPt13Qh1+jKGmGKSWLQ4JYDDQGLAdh5nnXpMw9WxxVD2pLqIX03Br5cGZfDBDsW3Ip/+xAUUTzV6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=787AChowk3SiAA7bB0Kt0KLkF0yWk7SR6+O9VM1esn0=;
 b=UJq4yeFgQ0oZpniIGWbXTeOvOo1kKnofkKmp8qI51X2kp6glgGAgraxlwkjrEfUHENPiFKAicJdfWVH1jhnQKb7eF9uGf4bUrnugSA8JWm7oEgW6Q1nAO2ynBLrfdgoSsnSakoZXkNZkEBRwlp+nvJsY6KR9YTloiOY5j6fueJfbXSIsCRYc9xkInP5sOOcH7ghuMqd4z3HF61qkFoS1M27HCeJkykcAbkwjkBWr0mbVdXpdt+Pu68P5wAS9PrC6FHC7iICuyLH+FN9YiwBkoNkvQNfPaiYnKWv1IJ0KuckZEGO16szrQDyx7+YtXouUc2CeRZN92XI3nUsLM7InnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Sat, 18 May
 2024 02:01:06 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Sat, 18 May 2024
 02:01:06 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 05/10] tests/intel/xe_svm: add huge page access
 test for SVM
Thread-Topic: [PATCH i-g-t v3 05/10] tests/intel/xe_svm: add huge page access
 test for SVM
Thread-Index: AQHaqE/qlMtaHdlbIkmhiHPEIStIN7GcPLqQ
Date: Sat, 18 May 2024 02:01:06 +0000
Message-ID: <SA1PR11MB6991A935FBF78B7A763D7E3D92EF2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-6-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-6-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA2PR11MB5019:EE_
x-ms-office365-filtering-correlation-id: 26933460-e54d-49c2-ab1f-08dc76de6125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?/akulqgeNr8hgTKZi1hTeddR05dVMSepObu9b7SBmxAGJ8fpXpvjsU6QiDxH?=
 =?us-ascii?Q?mCk7QHr+wGpo20sRdX8LoePq6NbUCAatdTUG6NC+wxhFCDb7uPskxyvA6HU5?=
 =?us-ascii?Q?TfsnDts7oGR6XN/nXeEmTFcSNpdJlfe5VzWQA9I4CYdkG9hTCWL4CUi092E+?=
 =?us-ascii?Q?9bdYcglNMtMTQZWc2vGsw00yjMP/3kKyi46dHVJvkPhhQUNfoVPimcM8oS8c?=
 =?us-ascii?Q?OjyvwBaOHcc/Bi78F8JdE2hiUyCUhpJgdb+InD1yGiDcGpeqe+XU2D/VyBWU?=
 =?us-ascii?Q?PnhG/CiJqTIWcORxoIL6WcciJ0xIERurISd6CsQMQmFA7/PhITfmFvQyxntZ?=
 =?us-ascii?Q?S39O5vjSpBGFh1iFOzDoCL3ldf2W9ymn5z3qk+TV6XkwVWj3OpvBdQ3Eo7Y4?=
 =?us-ascii?Q?3sUg5CGkAyRdE6XYrjh1oaUH4+Xp8TE3DQTlMwD85yx4unbs5S9UH7ppNd8q?=
 =?us-ascii?Q?VA2f5LppLYbayAp5/wmIGxyAVPOAeaF0WxK/7loy3fNKwVJqIRnKCwCD5lTx?=
 =?us-ascii?Q?NH09PI4ILPpwaH3NbsfAfvDoFz2ooxalWZDg36iSa6n9uBCb9Z5FPIaRTcY9?=
 =?us-ascii?Q?835NCRgAVYjmHUHFjuAl0QxlTYmJ6RwQUY8P33lsZl0WXZlx2RuBS/Y+100k?=
 =?us-ascii?Q?e143TKedQLu7jmx9QhLO2iDHIpUeUtbmUxoWxA6s1N3/jS8jAy/9sT2Plt9H?=
 =?us-ascii?Q?5KXktq9hqPWFnvM9Av0Epl91EFLYhOJ1iMD5kFB+icfyEcm0m/aQdV6gcjmu?=
 =?us-ascii?Q?bePMlYNBCgvxJdSGu2rsVGTZFkn1LuMSz7JT/PNB+pXgfETpl5sM56fMx3fd?=
 =?us-ascii?Q?JORaEJigijwNawfSYYJDIuLgIdIJSIjRLEMOct3as1w8JwcWXGECid9pUsZQ?=
 =?us-ascii?Q?i94rOrF72LF8QYmH4NlViQRZhYRmIFXmL0iiofHptrHUgAFSxeg6UgWf5j+7?=
 =?us-ascii?Q?+bHPbavrGb6eqzIGRwdg4BV2O7GfD8cIpQh6NCRhaDuj9RgqDxla+efbXc2Q?=
 =?us-ascii?Q?nzhLmL9rze0ekVmZvKMnyvqCKfBHb5N3KAe5H6wLXvK9BP0gx0p9OhUpc1e4?=
 =?us-ascii?Q?uayfj4YGyaFSX3Wv8QLg4kn97zq7UPpZhBbX8d7DmDWjhLaqSCN1V6x9HYj3?=
 =?us-ascii?Q?GnkC21eZhKH1WHwcFtZG6qhrBKgXVoLs6Fkm9CTAzgvoUBZDzXVOZEDrow3S?=
 =?us-ascii?Q?mh/mEJeo6MREpRxQiqN6Wngy5gMbsTu/p1xVRETXlF62SZvoi6JeLq2Kn72r?=
 =?us-ascii?Q?x4bqrh36n/mfGwUCSVkZpFyMdT03jNmgGdg5FdnAtF5b54SHNUNbXUVGMYUf?=
 =?us-ascii?Q?ilUNZB1T/4Nrjwe5j6wuyQCnL5bJK01Bf3toJ9n9JBjQsw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HOEjev5X/W4cOPCx6PdOqYefZB2dgifVLzhjCErMFqTb+c+NcsAMSjGcRkl7?=
 =?us-ascii?Q?g1UB5SL6oqJJVcdZY+FJRZsBtTaMlw3OZyrVG1eL4rx+Ac7a+tbTef/tWcb/?=
 =?us-ascii?Q?QTRKMB/rhsQZB8vpvlzngetkFGZZyM9Fp96AlwFyqGaTB4r2EnIC3KQNHxov?=
 =?us-ascii?Q?sRMdwtRJIRkYUIe/peL1VE+4lHosdVMammVpc2dEWIoFDBY1V/yIDonwqYpg?=
 =?us-ascii?Q?qguKGRQu75npwXsYFC2Geoj4B1mVaq0buKs5u35kOaC6YrcboG3ScTrZyYNm?=
 =?us-ascii?Q?wZP4Mz8o4DPPz7npr4h6uv7lfVjv1ijLfh4Nys2oI2vodwme2dqO9FtDHsID?=
 =?us-ascii?Q?bQiymnxtXL8iTBncRVo/0ZZyLW5TJWV17gDFBg7AL0VSkHwCVZUlKnwrumIn?=
 =?us-ascii?Q?9Dbd1OvoMNdhQnAUGxlcTDrHidyX8lHMgjb/ig5xDEVTdKPDqcWqd6U4B5wz?=
 =?us-ascii?Q?a+gDH4qTAgQjE2OwyeVEUC3pF/HlyFNLw3nZavHuwuhL0s++LlJ0fphNe8cH?=
 =?us-ascii?Q?o5/BpsyKmJvYy7rRoKyhI1VVoLoWQrMJpKmO0pgnYR1gxoOq3Iea23bcvMNh?=
 =?us-ascii?Q?yidoB8dW+Dd+oaKK6c+DO0wiuBj/t9jz0QmnyQwFHlftGax3u5L+Uwh//JEA?=
 =?us-ascii?Q?XM3+G4Xc2arLEKJfcxO/t5hDEHRbWUC+ZwjAIATNOZJWJtJ/wo0BuxdAiX0d?=
 =?us-ascii?Q?Zs0g3jj5Cjtg8aFkS7gC53TzpiGHyOwp+qtiCRnoOSUKP7Q8wGYjv5uSIUb8?=
 =?us-ascii?Q?OOd5ZpsQi6GpouFxzPcFva7Oks68dBDqEPHiMqVz41uxjuvUCOqeZtE+X5zI?=
 =?us-ascii?Q?OVrjulp0t8cPDuIuaDWmpaJHzfAQFQhKAb6S0w539ikK+waCWJBN2BsHVPmN?=
 =?us-ascii?Q?G1jEJYH5fi+lQV7kqFQNiww+F56Sv86eWK23joljQOh3wxctUK+P101i7oxD?=
 =?us-ascii?Q?g3LOuiUwA+89THXhSNBmv0xdSaK0JJKMbpAVLL2rvrGuvZ2gdUdfDSLD7+Ix?=
 =?us-ascii?Q?QDtYKczyVB/fve/SF8r72FCdh30Tm3xMLkMtMZvw8hivJv7xHq8Vx6Pbjuhg?=
 =?us-ascii?Q?eJMmHn68/zgrVUkEwfWs0vHu3IRREiipp0eTsEvV0D0MRtKV6c/76hYQqCUe?=
 =?us-ascii?Q?fZ2leA0qTD48q+Xx5rt/nSUVtUwDMIOo2GOrWIfv/lMmuSOsjDrI2iN3Io99?=
 =?us-ascii?Q?oFwl/GA8KQb/phSVti8cWAG6JV9bQvR1A/lYfWaKh1O5Iq9ouvymSDC8YUC6?=
 =?us-ascii?Q?Z4wFw2hVy+7jslS05waJ36ouMn0an7gdhbvpXXX3c4/ieadC+XIH2h0qbUeO?=
 =?us-ascii?Q?h9TO+iBPJ+IQLS5CoHLx+a0VVWsnZBQzKKqgYHXPTuxKwk7Ed8uVmJQNLf8L?=
 =?us-ascii?Q?HRXe+yk/VGlz+EbBnIvLm9bLfkrF07xB1B2QcTcSoMvM9E7v1tjz3cWKUMze?=
 =?us-ascii?Q?Nwt2puKkCCJSwiqb2xULtqIIiCrinZk4ZOR2OEe0Z3ARe+uWHCvc8V6VXEb8?=
 =?us-ascii?Q?RiiaOLr4sNOYquwl2vdhhpJhY2yN5AW8S2bjba86hi90Cgymcj1vAFGlajI9?=
 =?us-ascii?Q?DfCeWCKRs52dNTe2NNePPxqfwwM6xxNhuTr3iSEB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26933460-e54d-49c2-ab1f-08dc76de6125
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 02:01:06.3898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OMOQ6L4u2XUjdEyqoFOwPgZ4LoElixl8GcNY2PXgotIILXda61MDZsSXft2nf9TSSPpiSxnOWqAjnwnBJp2SKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Friday, May 17, 2024 7:47 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH i-g-t v3 05/10] tests/intel/xe_svm: add huge page access =
test
> for SVM
>=20
> svm-huge-page verifies the Shared Virtual Memory (SVM) functionality
> by using huge page access. The test allocates 2MB of aligned memory
> to utilize huge pages and verifies GPU access to this memory.
>=20
> Subtest:
> - svm-huge-page: Verifies that the GPU can correctly access memory alloca=
ted
>   as huge pages (2MB aligned).
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/intel/xe_svm.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index 73a232c47..d9629246c 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -30,6 +30,9 @@
>   *
>   * SUBTEST: svm-random-access
>   * Description: Verifies that the GPU can randomly access and correctly =
store
> values in malloc'ed memory.
> + *
> + * SUBTEST: svm-huge-page
> + * Description: verify SVM basic functionality by using huge page access
>   */
>=20
>  #include <fcntl.h>
> @@ -156,6 +159,49 @@ static void svm_random_access(int fd, uint32_t vm,
> struct drm_xe_engine_class_in
>  	free(dst);
>  }
>=20
> +/**
> + * Test the behavior of transparent huge page.
> + * Allocate 2MB of aligned memory so huge page
> + * is used. What happens if driver only migrate
> + * 1 4k page of that buffer to GPU?

On i915, we only migrate 1 4k page on gpu page fault. On xekmd, we changed =
this behavior. We migrate whole cpu vma for now. With the migration granula=
rity work Himal is doing, we will migrate with migration granularity. The d=
efault granularity is 2MiB.

> + *
> + * Test result shows that the huge page is splitted
> + * into small pages and only one 4k page is
> + * migrated.
> + */
> +static void svm_thp(int fd, uint32_t vm, struct drm_xe_engine_class_inst=
ance
> *eci)
> +{
> +	uint64_t gpu_va =3D 0x1a0000;
> +	size_t bo_size =3D xe_bb_size(fd, PAGE_ALIGN_UFENCE);
> +	uint32_t size =3D 1<<21; //2MB
> +	uint32_t *dst;
> +	int ret;
> +
> +	struct xe_buffer cmd_buf =3D {
> +		.fd =3D fd,
> +		.gpu_addr =3D (void *)(uintptr_t)gpu_va,
> +		.vm =3D vm,
> +		.size =3D bo_size,
> +		.placement =3D vram_if_possible(fd, eci->gt_id),
> +		.flag =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	ret =3D posix_memalign((void **)&dst, size, size);
> +	igt_assert_eq(ret, 0);
> +	/** TODO huge page advice cause the system hang
> +	* when process exit...Very possible a hmm bug
> +	**/

Not sure whether we still this issue or not. We will have to test to see.

Oak
> +	memset(dst, 0xbe, size);
> +
> +	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
> +	xe_submit_cmd(&cmd_buf);
> +
> +	igt_assert_eq(*dst, 0xc0ffee);
> +
> +	xe_destroy_cmdbuf(&cmd_buf);
> +	free(dst);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -184,6 +230,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			svm_random_access(fd, vm, hwe);
>=20
> +	igt_subtest_f("svm-huge-page")
> +		xe_for_each_engine(fd, hwe)
> +			svm_thp(fd, vm, hwe);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> --
> 2.25.1

