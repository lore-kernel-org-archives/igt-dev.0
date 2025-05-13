Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF40C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 22:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203E410E5FA;
	Tue, 13 May 2025 22:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4r/6+ZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5CF10E5FB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 22:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176322; x=1778712322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xIbHzsYjlvLjPrJU42vz2uE50K9qtwC1cOpOmdGl8J0=;
 b=k4r/6+ZSF+mjYO9xMGLoOjnq/Y3ZAL9lFlkFN+vBvkMTUS8XU8IcdoZn
 Wq+lxdYTU5cFWDmObqqDsPcWS0uTPb9+cqo3NRszw+cNVM55mB17uDxet
 V6dA1pYhfnq+8YWpJivhYRvoEjtjBoVWSng3lkn68cdAX9OWfWHCayEtT
 rU0esumfjtbiabUWHfoZODDTZnULKz38u0nHzn23nL5OKpRIJP2477YAO
 SXVqa9WLG0qtsHlfm+qmUcRU4Tf+aRjgJQgUwIBRJKVEQwt4+KoAhObTy
 ML7jWjsqc3WnFmbV3BK3w4uQCeD/4oNCtW3V/euArKbtehCPKpl5Y7g+5 g==;
X-CSE-ConnectionGUID: 04xQFogvTHqOGS9X08CUwA==
X-CSE-MsgGUID: 0fUdohQMSp+Oor6IV2dY0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="36675896"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="36675896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:45:18 -0700
X-CSE-ConnectionGUID: wtztSNrTSh22+Kwlnawx/g==
X-CSE-MsgGUID: qJBLavddTk66Xhsle0R0/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="138363364"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:45:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 15:45:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 15:45:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 15:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhXF6/TbDX0dc2n0seqUsFdvnSzVNEiIH7/3k100C7Ly9+QiTJvA6PE/AXT0+tMClk/5uGZZz76FsRvbJDrSsyXB9BFHU3g5k4RJ6O9DeIXv64mMJrFFTvPeZ1bundxGuWVMBIz4IFAVsc2pfLGgJarrjec4Ym6CPKry5r0FI1xPdYqsNEReX/LBrQH4SyScgYBWpeoXXiU9rqUvGhbDn2snyr+YcQ+PKjB5TU8z9NdYfUPxJ24dd4tccMzy3c5q8Hb6wk5Lfp+vQ1CHDuaPfszJ1o6axfoUjh/IJCODLZQK+JoMu0dCO2wOI+YUEBgEWy4KaM/k+0dM7C/KLuKyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7sX9I4ZNWKu/S6c+8X4NuzVzpT7V7iDhCiTj3KxNa0=;
 b=FEe6Wl8nwiymVjOx9QCqXo6b0mEPEv+y0WkIQizX4JY5NCy1p2rhRYDipgaA6PR2xtCij6DYytjrcs4ApACGxPkc1JRmQq1OZ7aCr/7Iz7WFD99+Xk5yT/xbP+bfpRA2Kt2z6LkCRLhU2TVS/ABwe0ydg2y3OTxlwfqqmogel4xHG5Sezz73smCopdhlenvGxv2qXCtlaee2Ta55h8wIuWM9CiuGPi0EgKt6tfUya3oxZTK9crtIwGlgpQMGUEk5PaE7PE8AWvYQ5pde66jsG/WAkGdgdVh5xKCQUJmUlfB2xodrm7Yx2tcEllwEfNhVYdf9isWedN4vl9v/5h0+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7951.namprd11.prod.outlook.com (2603:10b6:8:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 22:44:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 22:44:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to
 validate basic SVM functionality
Thread-Topic: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to
 validate basic SVM functionality
Thread-Index: AQHbxCmMszXUaYyhb0a6umoaYN1EZrPRIiSQ
Date: Tue, 13 May 2025 22:44:31 +0000
Message-ID: <CH0PR11MB54448237AA56E9E424BEE56CE596A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20250513170711.14518-2-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7951:EE_
x-ms-office365-filtering-correlation-id: fb4fb85b-b781-48ab-13a1-08dd926fba02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MONv94Zkk9sJvLVvBI8ARSDZjHanItQ8LTRVz1qbAiAfylVHToT1cE9QSowU?=
 =?us-ascii?Q?QWGpi/zK9DRqNGujuoIw+SkiFF+GPrWTPqf2vc/xU4LHqSr0mTOSH5kRSIRw?=
 =?us-ascii?Q?+ZSzhOWUAgPDrh5iy9BhuzdzB6cTxbnW1iKAelyau23sesgl+sOIYlXNb6/d?=
 =?us-ascii?Q?I2G1zbLWOUjRGT5fYipqsBv8bmqC58heeJJFf8jM6SaAU0gFeMNbxy99UaZI?=
 =?us-ascii?Q?CxegO79VY3QO0uipdCw1BqWHKmNvMcaP37KVqz08xE8Hi1kF6SNQKASH0UsI?=
 =?us-ascii?Q?S0bktMeZobkS45VrHfXTW0rJaQP+LbFpIbaefE5EQKN/i8oE1tza6TpxjbDB?=
 =?us-ascii?Q?NUAHSwGO565hDK0Ezc1XPOl62qESDaB8DthgLrayYgwvWwD7fdYtlxFcxxwd?=
 =?us-ascii?Q?32PkKO6NTdZCAzZuI//oGUFoq1/8GsrOtvVDIWry5MT8MSgOhc62/Vs6h7il?=
 =?us-ascii?Q?krfT3B9a8MOVa3nc6EFCAbuXAAVaEFz3YSnCd/UHzuq56/YCYiaFj36vcf5g?=
 =?us-ascii?Q?vIhi2u23jKw6dZZyEzGJWNnWiiYAZdxcKCr1tRNCOCwdY+fjHFPk9B2KrLsk?=
 =?us-ascii?Q?fn+bYKBoPjvolI7jcRANURiTLvmjHeeLUkHRB1PQCS6XSUPTTSUDF/BZT7Nl?=
 =?us-ascii?Q?3RbSvkEv1UYg67PSqGfZEAN/rAjpZnJgWdu5Q1/zpr5kBHNAmFlx5JA07vHh?=
 =?us-ascii?Q?nO2dGbxJd93gxi+IYLdvZSBQ3PYMLP8HG0/EmCZFwEKhowgZz7s5jav7uap2?=
 =?us-ascii?Q?UQ4PXIKtgO67FwKdbCTNnNOsfUxfPjkSTcFL8ereogcCoJkODO2+TYNxDJB+?=
 =?us-ascii?Q?VgNNnKjeRR2Q5PpcuqvKKuol0fqGcUQGHtcLGLciM15MCkn2K9m5LkOC5UlG?=
 =?us-ascii?Q?cv+3HMMhgox99ytMlBzQe2s/vHRQJcXy0FNEoE8DYk+KCm2+zsxxbTDNcx/w?=
 =?us-ascii?Q?I8/78Vwvr3gh9FBRUwRUN6AYZlWovxtltx9WdPeuOiGvyGxB+roebaaTgURY?=
 =?us-ascii?Q?eIzAXrY2dXrgVClHzSLuQtyMJFd01NWl5Iwq4krmPDn0plcL+S9QcGdxRoym?=
 =?us-ascii?Q?nZJ5L6iQ+/0dTe99oLJsfUn+Zb4ST7DbWakqTO34EDPdJPSiiSAutIvpwDaq?=
 =?us-ascii?Q?OqIZGX8SgqEWTGgULtxC1a6pYDREREmgF0kO1SHYkCE1HFfvPd8uL1k7+ZA2?=
 =?us-ascii?Q?itOo96MeRDULfTRhLuqnpm5fn+jM3Cdod289baCBN8n12z9l1YeIkgup+XJ5?=
 =?us-ascii?Q?eNXcYaozhj+2rKrgPXAsnWaxvxk/dL1KIdjMc/ZYWl9yoMP0vleez+X1xFLr?=
 =?us-ascii?Q?DK9IPO94lOTyFe7RTyD6jzVd4DJwYelP60ulI5obqPXXGbGMteoTHL1o/PMC?=
 =?us-ascii?Q?zsO0rDLbDKsMt3COtQP5RszYWO7uvRRvLMJ6gM4nNajVjqLEJVgrVi/yM0/X?=
 =?us-ascii?Q?6oUuKtNUF/FZ2CwcA+RiDkXKbs0aZc+qIE/iSIRfMqN4n4TcVdZlBdXn1nhI?=
 =?us-ascii?Q?xkClh3FVAAuj/B8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oyogGf73mFABmjzPgg2LHwZpLzG2rRvxYr6VSiaFMp0tcw+cYSttEW4XxblZ?=
 =?us-ascii?Q?opAgM8qTF4yeH7EX85cL6safL79vSOiVB4LLqi/hHeX7/cI3DOkepnEadti1?=
 =?us-ascii?Q?xwnGZvDTUNXPc6u19ZhZN6Q/MWqhdGqzIc99qcGuG8CBkJ4ThwLgrm7Y3wvS?=
 =?us-ascii?Q?3CcrZZBGbOpkT312+pMo03nHDyRipoqJyjkwpwComphM5tBUOvaO+3+1gSc2?=
 =?us-ascii?Q?yI30S6vu7e9dNcN013qYL3evCSLHTNrtRpCicsHcN3CfdickDFS4vpTG9JzB?=
 =?us-ascii?Q?QsxHcTnCPcgM174jRywGiS6q8N8c5clWyAqTtbwt/0qKOvY2XhlPNIj04seu?=
 =?us-ascii?Q?03HUcrL+/xhKO7dszaRDh1figiYauXWODQm3BBPlMWyLEjJsvZstg7Ht5BmV?=
 =?us-ascii?Q?Mr/cA56S/T7xedj1hWO599UJhed1l23CF/Q096jltYvjg3KTN5/5vGz+40jp?=
 =?us-ascii?Q?QtVqbaDRsIVMrnuouBXEOaIaJiafs/9Rw7eyWJy+45D8bltRa3l3zWkbrpkT?=
 =?us-ascii?Q?bfHrhwx9xJLOFrZkVZ+NdNI6BISr2Gsl7jfKLVWxyLMyD/CuT/vSuqR5dADo?=
 =?us-ascii?Q?ArWNbId+Rr4hEyLoa4QBQ+DbPciYJPYti8/Xoxqrs1M2nMlybbx/MvxdmSx1?=
 =?us-ascii?Q?wpm0VOMOpTeIaXXl6vlKqUEnDwUxKZVK84xvtfy3u+doEnI0+awprTSul7cy?=
 =?us-ascii?Q?piG7k/1wDRIfaruBD3UDeafJ9jlwzQ9f/ueQHBFYtH4aPSE9u3nY9nI77odP?=
 =?us-ascii?Q?pabh3DycIAxZAOEbtqkH3USVPyKGzB+Ks/x+D9Fg0+LoG6OMyUg22GHuJgCW?=
 =?us-ascii?Q?Lo0oizXaJzycpkT9QZ445G2SzogDDihytqlS82bllXWiDstyV2iTP7mufN6p?=
 =?us-ascii?Q?SeNmVIIsqzRIZlX4Pg0zpw59TSV3bK3oajSJdnkMKDzuzHKCZVYM8TyvSRK2?=
 =?us-ascii?Q?sYcL5/uD0x2FnK4LpmBxJ9eKw/TeGDs8CKaQ9v1gSBpTLgZhL/0qRnCKDC1/?=
 =?us-ascii?Q?63hLJyf8u5ANMhzq8nBdTwa+XBH+DdyoY5dEn1HWpWiAhwlXNMQrqyVkivpb?=
 =?us-ascii?Q?Q4xHeqECPLElBZNisUCojf0Rxqt/La8L1ttuom1bPLUg+UweF0YgUNnPk7Hi?=
 =?us-ascii?Q?HRFoy0RazQ1vjgVIMiXt+JtvQZMsd9dPaYBIqJVA01iFP9YSea2NqqN91YwU?=
 =?us-ascii?Q?nwQpWUCFrTYKtWklmg1vKKImm5CcII+hzJeHy5bD9Rvm/59+q9Su8jD2nnJT?=
 =?us-ascii?Q?Jf6ldQGW6VSM62zODRqV/G3WVZA15z7EBuyFZAcaSt7E7xKcYkcKQUfzV6b5?=
 =?us-ascii?Q?2+iifhd5luuE4IiX1lgqG/e/xPV6wLUY+0jVrN3I9Eo1OROvMPu/dmQMN3UB?=
 =?us-ascii?Q?zmSHqWeAHtvK4MJfLejDcrfk0WxXcMv67TzKDJmPND9UTQutxCW95xHvSmFG?=
 =?us-ascii?Q?Guh6bas5w0N7NKiXQh97VhXfvlWS/eVU/Ac89d3inKTs2+XCzrbi2pCscWfa?=
 =?us-ascii?Q?qt7UR34FuoaRHmXAENzuXdlWY18uLFLITh3Bbo9yzf3M61KSMtXx9UkvmDCn?=
 =?us-ascii?Q?vf3CdmPPk3ngZDBx76xR6dVUF4oJyAQMme3ApIMY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4fb85b-b781-48ab-13a1-08dd926fba02
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 22:44:31.5857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPoxILzxJpel4cFv52jFV1yIVaIGe25AbaDgcULTGbjzN/NorvJg7ll62+dj1yg5UqkYNHQs6CoE632z0HLkxuh5IPOYkW8peRGtnYhqQ2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7951
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sai.gowt=
ham.ch@intel.com
Sent: Tuesday, May 13, 2025 10:07 AM
To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.co=
m>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>
Subject: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to validate=
 basic SVM functionality
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Basic test validates basic SVM functionlity.

s/functionlity/functionality

There's also a non-blocking comment below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec=
_system_allocator.c
> index 06daac8c2..ba11ed834 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -32,6 +32,8 @@
>  struct batch_data {
>  	uint32_t batch[16];
>  	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
>  	uint32_t data;
>  	uint32_t expected_data;
>  };
> @@ -405,6 +407,63 @@ static void __aligned_partial_free(struct aligned_al=
loc_type  *aligned_alloc_typ
>  		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_s=
ize);
>  }
> =20
> +/**
> + * SUBTEST: basic-svm
> + * Description: Test validates basic svm.
> + * Test category: functionality test
> + */
> +static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
> +		       size_t bo_size, int num_dwords)
> +{
> +	uint64_t addr;
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D DRM_XE_SYNC_FLAG_S=
IGNAL,
> +		  .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	struct batch_data *data;
> +	uint32_t exec_queues, vm;
> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREAT=
E_FLAG_FAULT_MODE, 0);
> +	data =3D aligned_alloc(aligned_size, bo_size);
> +	igt_assert(data !=3D NULL);
> +	memset(data, 0, bo_size);
> +
> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC)=
;
> +	data[0].vm_sync =3D 0;
> +
> +	addr =3D to_user_pointer(data);
> +	for (int i =3D 0; i <=3D num_dwords; i++) {
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&(data[i].data) - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +		int b =3D 0;
> +
> +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> +		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +		exec.exec_queue_id =3D exec_queues;
> +		exec.address =3D batch_addr;
> +		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> +		xe_exec(fd, &exec);
> +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, exec_queues, =
NSEC_PER_SEC);
> +		data[i].exec_sync =3D 0;
> +		igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +	}
> +	unbind_system_allocator();
> +	free(data);
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	xe_vm_destroy(fd, vm);
> +}
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory
> @@ -1597,6 +1656,7 @@ struct section {
> =20
>  igt_main
>  {
> +	struct drm_xe_engine *engine;
>  	struct drm_xe_engine_class_instance *hwe;
>  	const struct section sections[] =3D {
>  		{ "malloc", 0 },
> @@ -1695,11 +1755,15 @@ igt_main
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		igt_require(!xe_supports_faults(fd));
> =20
> +		engine =3D xe_engine(fd, 1);

Non-blocking:
If you just need to get "any" engine, then you might be able to "hijack" th=
e
pre-existing drm_xe_engine_class_instance *hwe above for that purpose.
Though, you'd need to declare it using a fixture beforehand.  Something lik=
e:

"""
igt_fixture {
	/* Get first engine */
	xe_for_each_engine(fd, hwe)
		break;
}
"""

We could also still use xe_engine, but it doesn't look quite as elegant:

"""
igt_fixture {
	/* Get first engine */
	hwe =3D &xe_engine(fd, 1)->instance;
}
"""

Then, the below subtest would look like:

"""
igt_subtest("basic_svm")
	test_basic(fd, hwe, SZ_64K, 1);
"""

Note that we'd also need to place the subtests in the next two patches
after this fixture and before the subtest below it (once-%s), lest we need =
to
repeat this fixture process again for those new subtests.

It's not particularly important we use the hwe in this way, so I won't bloc=
k on it.
But it would be nice to avoid any additional variables where we can.
-Jonathan Cavitt

>  		xe =3D xe_device_get(fd);
>  		va_bits =3D xe->va_bits;
>  		open_sync_file();
>  	}
> =20
> +	igt_subtest("basic-svm")
> +		test_basic(fd, &engine->instance, SZ_64K, 1);
> +
>  	for (const struct section *s =3D sections; s->name; s++) {
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> --=20
> 2.34.1
>=20
>=20
