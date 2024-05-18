Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA4FC04FFE
	for <igt-dev@archiver.kernel.org>; Sat, 18 May 2024 02:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3060810E182;
	Sat, 18 May 2024 02:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJyTNEYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F7710E165
 for <igt-dev@lists.freedesktop.org>; Sat, 18 May 2024 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715998583; x=1747534583;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PVjyniYfDJSIaOtljrBB5dMxaYWMrCRau4M1InsPNW0=;
 b=LJyTNEYOPOQ7iSzc5kaWIJp3Y2JAti2sCJehbFqIYx/lziDn6ojM4SPL
 o3rI99QWuyymbp5eQcld368Svn4YHdEZSLN2CvBXWDbQ0LDOBe+zYHsIn
 IiW5PIik7Rko98WX57GUKJQM9dCoHNqrowIHYk32bg05GSTeWrX7+zADC
 JD7IJ21xqrvPskkyZipuuOM4uSja1FOmH0/l8TzCyaqpOkQYB1YCyKMt6
 BEcnhMk7JLN2Ol1TFFy1yfzmY3jAQ3xlMgaJddbrRDV51nGQxLtH2mEVP
 cC3LCFzZmYBHcXDaX2J+QS2wM2P2B59UYSylWMeUN30/mq/ROYRPkIhqv g==;
X-CSE-ConnectionGUID: TBFbuwuyTSenlgI11dfi+A==
X-CSE-MsgGUID: hYoYfiDKR9WY/cvgwg4YyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22872342"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="22872342"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 19:16:22 -0700
X-CSE-ConnectionGUID: mJm15CBgSziooSsrNc3Xhw==
X-CSE-MsgGUID: eLkkZDX4QJmXbjoQMUGPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="32387273"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 19:16:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:16:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 19:16:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 19:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXONU0U1Tj6Pqe41GTzICE/t5IXoPwrCWSQtfmbceRZZCJzPOu3jZORItc/+c1iRiDM+QzG9mCd6AxOH5sommpf5s+moa2kZao0K4NZZ9qvqkXzBsAl6v8QoFkwzAW8s9rrDZ4QIoS4X6ABsb7oEjVWl6qigDfa1CYjA+DXVDbnqxUgzx5+UxjnfA+34yB/ZwFIsy4aMTFheKhtjzdgLDBYIM0l/yYut09rU1uYEkOX293+iYnQe889o5KXNKpaDAOd+1Ogkh+BhOzj3Ttt0zvqTD7W0Ag5eImaS4aHtLzeCoZ8eRWn2TI/zkoX6OhzEevzRHVunFhd+Rud9ySKIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxHTb19Y4j9TtwVU3nuwTNbj/YQ14ai/FEHK/aoTg9I=;
 b=PS6I4tHwuHOcKCAOxraxRiRr8oAmL0L1xpPrsSbgkV6N93UfqyLYZ2Nk23GVWQ+PnUq3IXXipFjUPHeibXmLKQevqiBcDB/+iuPiAYmt2oJyEh0P0F3frBF+3kANOn26IDB7FiamzYRgDjrbxhb3HqDfMTjyTw2xBVZ3eA/Q0O7AULIEsB6K4ztsnJVX687UPq+A6OaZEkHaPfEiM1q4t7LJ24UCGj38GQH6n6c4oqmIHaFq3kZsvgfJEM9h2twEL/h4KsQriOA8DBLFG/07yxvwS2Ri39USMSOZ+j/kuorFuC2jJSdsvTgWWSmb2iB8IQsum9cYY0wVk+Eae1FOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Sat, 18 May
 2024 02:16:18 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Sat, 18 May 2024
 02:16:18 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH i-g-t v3 06/10] tests/intel/xe_svm: Add support for GPU
 atomic access test for svm
Thread-Topic: [PATCH i-g-t v3 06/10] tests/intel/xe_svm: Add support for GPU
 atomic access test for svm
Thread-Index: AQHaqE/pXjjZvFj1BkSznABVX8bu5LGcPtTA
Date: Sat, 18 May 2024 02:16:18 +0000
Message-ID: <SA1PR11MB69913C8ABC76F0948588488792EF2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <20240517114658.810283-7-krishnaiah.bommu@intel.com>
In-Reply-To: <20240517114658.810283-7-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB6871:EE_
x-ms-office365-filtering-correlation-id: e3db19ad-b7ff-46f0-fe75-08dc76e080fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?xGt9BSKBSxoGcYqb3/12UN3otNY6AVLXJHod5x+TDnBJSUUmXpnH3GYdbCFQ?=
 =?us-ascii?Q?ZmV7tv0ILrtVyyau4ij3nNnTdPA0Smu+V/H90g74qQbR4G2VLENpCx3bHsQM?=
 =?us-ascii?Q?bjv/O1RfLdkNSk8iaB5u7HZOv5X/RQWto3i5/SXiWhMdAprbEG0FJAD2exZd?=
 =?us-ascii?Q?qxGMKiwmwRGSzEgeWemjLDHhVR/9meaWJHvTsn3ElIm/P+bHLOASyAnz2EKd?=
 =?us-ascii?Q?uo5G9Rcdpsf96Mg7BPtNUzdzNE//uKw7/23BFI6e9A/1zMr3fNH3WCpzCEbc?=
 =?us-ascii?Q?pYI7kig/PKTiuLV8f5CYhyMx1MvT0dKpeY5GflyCPzCYJmCtqjEaXZ7Xau6Q?=
 =?us-ascii?Q?bMHZeLmpg1Rvvz3P1BDImZjhHkFUuCPUMFqFipHzyNlPNK7ePonGzMZqlAV5?=
 =?us-ascii?Q?q7g0l8mncD65vgHH9GBxbMlpsjPFALOPVOm+aLyW8XXGhO/xMioVX5yE/ccF?=
 =?us-ascii?Q?lytjvBxOVBGmdh+dCmzqq7TFUVFjtrUmnrZx0bbMBmQR1lkNTSPc7fFyPium?=
 =?us-ascii?Q?an1hgQJZITMOR7Ul1uohlAa59DbxVBZFj/u7n36puBSQ/8/014/uSEpkFQx/?=
 =?us-ascii?Q?uQInZQy35zpckT0kGhGKBrgQXUSDXhwEHUPKIWll3S+CY2KvQTaOnx5MEdff?=
 =?us-ascii?Q?lQTBufxNxCsNGFOd21M59iBr+w4Ja4CawEcUBbras9ijfr2T9QKS1RW3Exfd?=
 =?us-ascii?Q?tzR6zQjYo/18WMR2Ad4tsHQY1xOlA2CyBxUdreka10NKpNGYd+apcZr5uhrs?=
 =?us-ascii?Q?8FZG9Vp2V5td2QhUonBRZArJs4nCLFQjYzphlowHU+ArzKPkaEGas7z5MFKu?=
 =?us-ascii?Q?7DO+8o1p14ESkLgzjR/gJh+mJKm7ufwTDI6XVHcuiErQG14YTn8f0qa11oBM?=
 =?us-ascii?Q?N12D75rtqZVfoI84C6SpiHoVIzScjY2DORiP4+y7C5TSTmnwppwT9fzF29Hj?=
 =?us-ascii?Q?tEj+M410ydayEyuXV8XDZ29X3tU59W9ZCmyZYRcEYQxr6s/6/cKPzWrSP/Oc?=
 =?us-ascii?Q?8D9FgtNkXil2tLSFS33pgePDqtopxx72YjnXQM04YG0o8T1JTivnhzrPEorr?=
 =?us-ascii?Q?OzfgxtGEOz42oq6hpFMiwFouSGD6ex8m4F2dlA+Q3XBj7WgFfDpXsTFMBrVz?=
 =?us-ascii?Q?Y4g2iL5NsELNNDn6q1lkEMBOXoOOk7hPc5uihkCAIN8DptmJ3pscn673kYca?=
 =?us-ascii?Q?WeQlfKpnbv/LepGYICiXQKTt3h8QNi/w6KkiY0l5YJxTO/xxnVKK/muHbesD?=
 =?us-ascii?Q?QZLSRZ+leVT1OLIOlaGs4nqPI8xlhsK3PMIsHf+o1Wc3gXb4J2rYrtd7p50H?=
 =?us-ascii?Q?KINuKeVYQ1ye91ZOh6T3aolG8qCwUfdDCGanUSukKfRMaA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UC+Qgwzn2nclw9BVlbC9yIUI5gG8yZU46oi6j3kv9/SZYTXLs5PYGAlCKmVw?=
 =?us-ascii?Q?o50C+LMVeIuExy1F5QBeddtghTqv7mO2NqfOUviZqn+nKtw6JtktkWE4HSLO?=
 =?us-ascii?Q?GX4YBHBCasOx0UzW5j0Hc5k9ZuNAG+bGewTLXNsl1d3WBE4+n4E4lDmqwXK4?=
 =?us-ascii?Q?XDKSnwp0cTyL9oYZ2ixtvc7Sb6ybMqnP3/x26jkkdxRW3bscUKMCoz48Tvof?=
 =?us-ascii?Q?UjKpVS8MGoBIA0hIIFlEnW5aSnKz1fJ/hAZgbxvlTBtfU/f7DJTegLDOyjzm?=
 =?us-ascii?Q?fKbyJLy21AjP7tlO87YfCO6R72lpgCXMjcqDFQ7tE1iHVawWV4pZ4yNoDJjY?=
 =?us-ascii?Q?prr0CpAt/6tr+pD6Epxq8YNnUKj9vkGm2WcvfFx6KuDZDPedHG47DnGRJU29?=
 =?us-ascii?Q?kfHfh3nruvkb9cP+8xVfEKv4CXPxbPlo60RyqmKhRwMT5kMz8JqkiGkwsAIk?=
 =?us-ascii?Q?I45TcIiy9h1YQVlUCq2RolYFjayL/XUyxjkX7f6+Z9IMrm0M2y4NyqfteRmc?=
 =?us-ascii?Q?DlkEMVNeLViwqYG/LQ8Vt72nPMtA/Jq0+IqGqHDaUNk/RdNp/1N2ERDE+g6x?=
 =?us-ascii?Q?/7w5iPAr+56BB/e1TEhe7YwCKI+bgwj1k3l6eL3bbHhTdNWXQVtxY7siOPQg?=
 =?us-ascii?Q?t4UaB8igPMuL9D+mqr7wAe7jkh5wm5TdBfFZGrbroQRzbr2MXpB5i/Ps2Ft2?=
 =?us-ascii?Q?zClrwh2IFVC/1zTcYKkuw4GmhbHWhmIktLA+OCk1EBVakz+1AdZ7aeXIQ9gp?=
 =?us-ascii?Q?6g/44ClIah/9M7cfQBYz5pItajImKSy56FQZNSo3EK1qf2gDYoAAIkGRBOI9?=
 =?us-ascii?Q?vqcMBR4HZZViMV6letpP0swOuqTYVz7idPWtxRIB15LRv67W9M4rl/mmrTO1?=
 =?us-ascii?Q?Lc2aZbY4KBBYk30Mj6qzJnbYlIRu48/gfBonDLBeo5oE5V/Eu6uUGy1I9M+7?=
 =?us-ascii?Q?O3Y9r8Q5y+EtKCVmiki8Jrqw2cfZK48SRg7IzhCCTOr9LKDZfnCgIvLE1uD/?=
 =?us-ascii?Q?3ShJ2dVlJyctRZXq9dhyPz4zHhokXgc8Sdx7tWx0Ub9xbZIagqSrT5ZyhMtC?=
 =?us-ascii?Q?obvvws/sPnv92ljU8KcR3shUI+5fhfMYmot0hkZzEYSNRQGMUfRzdRw5fBZg?=
 =?us-ascii?Q?YCUsApGrxKUq/0mzaLQGDfolQiM2biLxdqQfu0+3roxkfviSQFQ89/S/Dmv9?=
 =?us-ascii?Q?VJRSB3MaxIoGJvLP69kW3SUTXRjEd7aWHnL7z6944C9ltC5TG7v9RfRpinQA?=
 =?us-ascii?Q?IkA3At5lqqcI9fuLmV+qH+c91ZHJPJH0LtL4Ow4VeJMBZBPBzjCjeN/O/M+c?=
 =?us-ascii?Q?JGdNO0vedfQFOwGcYYLt+5cilc92KLcuGi/FPCkNpM2ADqJ7YpXLnUQHq48/?=
 =?us-ascii?Q?+ai0Zz2Tl18WU+JLuDxNMW2p3YNVhX0LJiyVdOWb6FXhQ2itAhqWYghwcKLl?=
 =?us-ascii?Q?4KalGXWNmzS3XDC2j9k4IHquaFFVq3wfc2jM5Vwi9xEbn+dSJu6kLZYrEfqD?=
 =?us-ascii?Q?UCgXQrDyo1GvHBMq1kxh+3dSyd1+kvVIy5UYKCNQTxk67h4zcJ4NxQK78a72?=
 =?us-ascii?Q?rCdTLsBFp3SxxRwXgM03aoFFlmj6pctKcevVC57i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3db19ad-b7ff-46f0-fe75-08dc76e080fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 02:16:18.8364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0IxRFTEt/DL9vSgB7nGk1I74tPw6jrp7QwuBRfzbkngdXfGzotQhQ3hK3qdPwWDxrYEFsV7xsCJHA6jrn8mAfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
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
> Subject: [PATCH i-g-t v3 06/10] tests/intel/xe_svm: Add support for GPU a=
tomic
> access test for svm
>=20
> Verify GPU atomic access using multiple threads by performing operations =
on
> randomly allocated locations within malloc'ed memory in shared virtual me=
mory.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  lib/xe/xe_util.c     | 11 +++++++
>  lib/xe/xe_util.h     |  1 +
>  tests/intel/xe_svm.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
>=20
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index de848b8bc..672e9dcef 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -117,6 +117,17 @@ void insert_store(uint32_t *batch, uint64_t dst_va,
> uint32_t val)
>  	batch[++i] =3D MI_BATCH_BUFFER_END;
>  }
>=20
> +// Function to insert atomic increment command
> +void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val)
> +{
> +	int i =3D 0;

You can write:

(void)val;

To annotate the parameter val is not used.

> +
> +	batch[i] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +	batch[++i] =3D dst_va;
> +	batch[++i] =3D dst_va >> 32;
> +	batch[++i] =3D MI_BATCH_BUFFER_END;
> +}
> +
>  /**
>   * Creates a command buffer, fills it with commands using the provided f=
ill
>   * function, and sets up the execution queue for submission.
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index c38f79e60..46e1ccc9a 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -40,6 +40,7 @@ void xe_create_cmdbuf(struct xe_buffer *cmd_buf,
> cmdbuf_fill_func_t fill_func,
>  uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
>  uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
>  void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
> +void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val);
>  void xe_submit_cmd(struct xe_buffer *cmdbuf);
>  int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
>  void xe_destroy_buffer(struct xe_buffer *buffer);
> diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
> index d9629246c..f9e8eb2d9 100644
> --- a/tests/intel/xe_svm.c
> +++ b/tests/intel/xe_svm.c
> @@ -33,6 +33,9 @@
>   *
>   * SUBTEST: svm-huge-page
>   * Description: verify SVM basic functionality by using huge page access
> + *
> + * SUBTEST: svm-atomic-access
> + * Description: verify SVM basic functionality by using GPU atomic acces=
s any
> location in malloc'ed memory
>   */
>=20
>  #include <fcntl.h>
> @@ -47,6 +50,18 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +#define NUM_THREADS 10
> +
> +// Thread argument structure
> +typedef struct {
> +	int fd;
> +	uint32_t vm;
> +	void *gpu_va;
> +	uint64_t dst_va;
> +	uint32_t val;
> +	struct drm_xe_engine_class_instance *eci;
> +} thread_args_t;
> +
>  /**
>   *  @brief Verifies basic workload execution on the GPU.
>   *
> @@ -202,6 +217,58 @@ static void svm_thp(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *ec
>  	free(dst);
>  }
>=20
> +
> +// Thread function for submitting atomic increment commands
> +static void* thread_func(void* args)
> +{
> +	thread_args_t *thread_args =3D (thread_args_t *)args;
> +	struct xe_buffer cmd_buf =3D {
> +		.fd =3D thread_args->fd,
> +		.gpu_addr =3D (void *)(uintptr_t)thread_args->gpu_va,

So you are creating many cmd buffers, one per thread. But all those command=
 buffers are bind to the same gpu_va. This won't work.

You need to use different gpu va for each command buffer

> +		.vm =3D thread_args->vm,
> +		.size =3D xe_bb_size(thread_args->fd, PAGE_ALIGN_UFENCE),
> +		.placement =3D vram_if_possible(thread_args->fd, thread_args-
> >eci->gt_id),
> +		.flag =3D DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +	};
> +
> +	xe_create_cmdbuf(&cmd_buf, insert_atomic_inc, thread_args->dst_va,
> thread_args->val, thread_args->eci);
> +	xe_submit_cmd(&cmd_buf);
> +
> +	xe_destroy_cmdbuf(&cmd_buf);
> +
> +	return NULL;
> +}
> +
> +// Test GPU atomic access with multiple threads
> +static void svm_atomic_access(int fd, uint32_t vm, struct
> drm_xe_engine_class_instance *eci)
> +{
> +	uint64_t gpu_va =3D 0x1a0000;
> +	int val =3D 0xc0ffee;
> +	uint32_t *dst, *dst_to_access;
> +	uint32_t size =3D 1024 * 1024, sz_dw =3D size / 4;
> +	pthread_t threads[NUM_THREADS];
> +
> +	dst =3D aligned_alloc(xe_get_default_alignment(fd), size);
> +	dst_to_access =3D dst + (rand() % sz_dw);
> +	*dst_to_access =3D val;
> +
> +	thread_args_t thread_args =3D { fd, vm, (void *)(uintptr_t)gpu_va,
> (uint64_t)dst_to_access, val, eci };

Same question as before, why uintptr_t?

Oak
> +
> +	// Create and launch threads
> +	for (int i =3D 0; i < NUM_THREADS; i++) {
> +		pthread_create(&threads[i], NULL, thread_func, &thread_args);
> +	}
> +
> +	// Wait for all threads to finish
> +	for (int i =3D 0; i < NUM_THREADS; i++) {
> +		pthread_join(threads[i], NULL);
> +	}
> +
> +	igt_assert_eq(*dst_to_access, val + NUM_THREADS);
> +
> +	free(dst);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -234,6 +301,10 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			svm_thp(fd, vm, hwe);
>=20
> +	igt_subtest_f("svm-atomic-access")
> +		xe_for_each_engine(fd, hwe)
> +			svm_atomic_access(fd, vm, hwe);
> +
>  	igt_fixture {
>  		xe_vm_destroy(fd, vm);
>  		drm_close_driver(fd);
> --
> 2.25.1

