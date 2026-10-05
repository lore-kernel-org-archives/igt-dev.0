Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9FFCA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9673910E0FB;
	Mon,  5 Oct 2026 06:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzEZTUJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F1D10E0FB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791181238; x=1822717238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wAT1Bc6myudX6Q2mf8n6It2K3bADgUIRqHdCs/8UMrA=;
 b=SzEZTUJ/fLnSqhGLjs/RuXz/6i1wGa+MpxN5e9m2sB6RigIQjj/85Gt0
 rRVVvVCRJORFwHklWOwHbJFfzn8jvhkZip5OcOjbwm69ctXYmytplZGMP
 9hPLhjeEXTRQ8nxhLB9iAcVM8xdN6emhtwPrPqf+iLqtyJo68I+rFAKS+
 gqurltVwhOhpBzFRfU45G6wJ6JO8uuq1aJd0rQXTw17eV4tIzjPb+7p9a
 Tq5BOJ8w+3IBNpDt5fzc6YMvbCKlLJx4RKLpR5MMiIuQmeWKqsULXCgIU
 r5Pl1P/ScL7MevhJ9P6USUgzMBxj8IcUKG/WgoHVsiSJK7MZfWANfxfx7 A==;
X-CSE-ConnectionGUID: veUrKyQRReS6wbfAJL6LMA==
X-CSE-MsgGUID: Llyx9NG4T/CM0ObNX9kSOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90900114"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="90900114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:20:38 -0700
X-CSE-ConnectionGUID: Snu63PinQTOfc5H6fCf5gw==
X-CSE-MsgGUID: eImv5Jk8SjC+rWe0CmXAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280479028"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:20:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:20:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:20:37 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:20:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDipD/PFMmeimLfBOtMpnCuVwAu/8Yt8Wol6LrM2BkLRhui4dkBrWn0M1wwb4SgCA+YVnLo8IBoFBiOckWSuqzx3nkxM38vi651hdfcE1HgPBELn1ypj/6ruaXGY8AxCQvG013yFJkcUTkazhLylwx0OwN1pSRb5jxB9xYX2sWfudkm6zezBj3bJkkPztSE+XaR3rZskRIwUwQkLujhFuMAqQ6YgrcRbeNvQUYB9dG9fxRvKn9yT9YLXkD7SuZF0IptsEqzeysZpyGARR/Ok8rcHqlhzCzWLEGuvPrafc9DNAKso4RdFjteia2LYcPUEReQHXc4dIs6Wucyd/gq8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/Tx/oOTCcMPO5swLNGqwKrPfT8aJSe9M5TQ/RnKKM0=;
 b=jvfssTAg2tft1+eD2mxhXVOHbKbj0CVMwKJz8mhr5+ubq4ZdSnBWuyJ3KETYxVh4iGpW6zgHY/m/l7CD11tEGL1Q5OvOTaeQz4NXhO/ulAC1V7c4INm2DD3gCf6qpldtf/vZ/hqD/7fIW4Q+YpVyIXxxiY2kkdOceAQAPW4vgjaAe2Oe5P50oQlr2g825DRN6PllQ+RJHOt4Y3pw72THV9aYxwySISvLY2xKr9DkMr79K6mxYPU4ZZUrJTny7m8FqPkvlKDJm1oSq2cMmw58fcafpgXg+5JSGHo9NDiim4vCQLv7glh4odQYSRoFmL1R65SEnb+pNsqTWCDxYD+sZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 5 Oct
 2026 06:20:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 06:20:33 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Thread-Topic: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-size
 allocation tests
Thread-Index: AQHdSoIuBKzB5K64gUCgPriUmL6SD7bujVcw
Date: Mon, 5 Oct 2026 06:20:33 +0000
Message-ID: <CH3PR11MB8434021E4D5CE8CF6236117E8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-4-sobin.thomas@intel.com>
In-Reply-To: <20260922110438.2402109-4-sobin.thomas@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ1PR11MB6276:EE_
x-ms-office365-filtering-correlation-id: 0049711d-e95b-4461-d2ce-08df22a8c313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|23010399003|366016|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info: hiymiuWIgr0FmOSjI1ZibmaNr6hZX7luqG8ZVTLrgoeU15db+mk0vRg5h3BM3CSZwrV/ZYACWiqYZGNdVcAu1rLJgXqjk4TGJhkiVYP9XO+ikj1H/PjNHRQhhZa+AFK0yd8DB2IdF+G1mKldvphHR18uSJWiSKI9dRT2s6DbE9kRFxofstugavz7GNBzhadC81SOc9dw1OyPPDqJHUIbhscjN+Rkuidkp+yVko4b2YCPLy7fD2bvun0OUyvSZ5SmGn1W91EzJX0GCNg4i6ofVw5PxK+OdxH9rGr514nZHQSvEvgt8FPXTvp7vmiHrg+E0kLh2galigQupPgcoELYMCNFxCT8csVTlWRTm9cCkoe1D8uSGv1ZDtD+ZS3EXka9GktIPiSIq7EvTIosw2+Puerhf70jRgcMF5yyIVCr6bqySkTOPn+ccft2AcRDGi/nxuiNZoLpRZWXEZVqw1fRLKQzwJHwqoeJmt6blj79n6CMnBpPwpyATOS8Bu8pnXn5fRZelRS1F5QTqWNSbkruB4c2vrv84fRZytEJGfXF9j9mlTiXq6qoirm4ho9qll+OsvErDQA1rVrt9q9v/yYV0X6OOixvwD6tuJeCzvky08S8r5gpnN0+UZMo3vAiNo2ZhWvff8VPyCNeIC4MUCrsLsWizELhCA17DUDx2KHfIWB6KNoDVG9tN5flyZoNh1xaqDXxk2GM/+6CemYDyxEgfxeoRUj/5C+jTTAvSIB73Ao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cohV5hQxTzxUeN0fyWQNZ2gAhcWJLCLkj/srQAfgTv+EhCO7d4JgRkvQPcSp?=
 =?us-ascii?Q?npt6LdVnPvuMhpbLaZRO/iVkflmPRt6QQbm5ue46zI4nSkDJwCYS/ih3O15z?=
 =?us-ascii?Q?lF78E9Nx1G/bFUM1ju4J2yg8tyOOWlCnoCf4ZuAukstJfOdKAFvcGHK2eW8S?=
 =?us-ascii?Q?P9md3q8qvy92X+vktFUYlTCZQHshrNs0pIUwOsCwPy+Fl71mdTCFrKtJNtZ2?=
 =?us-ascii?Q?uihwvUcahkISSK7h8Ly8j0jnrI7Zw/6Y3A7tneiz4/3OWgW+8udutHWBtJ+I?=
 =?us-ascii?Q?P/mMK3AB1o/CDfQN/yKC36bDAhVdF75S8errAxR2iB2jlghVbEsDWbiglSsM?=
 =?us-ascii?Q?NUe+UWIHE7DT4RikbfNz+QGrBlavwdvZUd1oh44Lo1wRik5i1Isgy2mGcUYw?=
 =?us-ascii?Q?qP6nTha2UoH5jxCz3AHGvaoVifR8IOxPMmeoamMMIlgW7Uo8OKUUmbJPUu0C?=
 =?us-ascii?Q?80CN0NjLUqPCinMNylatnY5GldGmb+cmL0CrsXGoRT/qQNMGv/DWNDiJHA8J?=
 =?us-ascii?Q?2vuZz4Crrj1bVTLPcKZOHfxXxB8VzN/YgFmgJ8lTHwjyjmHkv0OfxoLx85eo?=
 =?us-ascii?Q?KroGXsPeywvffml98/B1dSHt5isLtUZ9+++J1KJE/rg7t2GjtTtH+vjH5drz?=
 =?us-ascii?Q?xf56Q4KlnOomOCGx3/e2WBLCuIDnvq9JPzjfmVgFV/4O+nfMoCVJYU4QeNhN?=
 =?us-ascii?Q?LpuFCjghhbix4NDNIdexH6TAvvHdR4a2cvfOpLaWpLrnbk9V3jycSy+7RI8R?=
 =?us-ascii?Q?vhnYb5mO6pensFwFlQ7Mg/VcX1rsFzaRfm3XtmRmS9s0d59P52kZyDEZjhN7?=
 =?us-ascii?Q?BBiHAghRtCLRGCJuG67jjhg/vFcbUvsYMg5diNXYj+cEv5O4y1gXlFilWOx8?=
 =?us-ascii?Q?FSadKfAVpotID3aUCSHvqKaOqsvLEyKwFURY8LK1a+Ke5EhOnlo8a9dXQisi?=
 =?us-ascii?Q?xOD/BTCpxVvlbEoQ2ANsv4osAsnxIiNDKC0AEXwKMxnWZcoQvycYRkLX5bel?=
 =?us-ascii?Q?J9KnAhuwdlGWP0Cb+v4RIYQv6H7+FhM3gYS5V9AjM2qx5FG/tEpdQ17MgwAk?=
 =?us-ascii?Q?CBnuiFLhj53LKvvIRpgO7XYYsGv7AibgUl06UvAO03JsPNJh9HxAxxxm/vPm?=
 =?us-ascii?Q?QYKUGTsbFBnUIiU6dTVoTLsm7hphTCgs2Yt1BOpB0AStcOslAoOJxT/OcFib?=
 =?us-ascii?Q?z17TDD91ZQb2p8VpnAxQS+KoPWg/xDCtfiYRwXtf/OtUCJRnUsXdEcyZjy2o?=
 =?us-ascii?Q?II29LAJKNop6cNlqqdrL7BN2wQWC8HyYbIVJTZprhALr6RcZY/6jKgN24U53?=
 =?us-ascii?Q?5CaiXOP2hdS9wZOfukA+ijiKMuVQghZuvJB30L0IK9Ai9Ji3Ah6Qe27mzMao?=
 =?us-ascii?Q?g8i5tei4iBc53Iw1nZkp099cGsptcPnNJtxHlOnsc/xRf26szV+gpFn2K+iU?=
 =?us-ascii?Q?QSqFWY3Wbufh6WAOG3Uz2nnDNBX7qWVjlwECocKTOKHuzFo7MTAoUdnFZs2J?=
 =?us-ascii?Q?c+sdSKHlnGxCmaQiCJQgZ+KeajIJRfwMsw2yOuOdahiBjJ07Cldx0iR9ZXLq?=
 =?us-ascii?Q?KLxm91EmB1HAr4h5Lu0718/8bLxwq+3vKEW0P6ISjdHgtkp7moTkSVDIoOKN?=
 =?us-ascii?Q?JYuONMa/wgILByevdPNYm15XIFwk15vIsztqv6RrL5QPwDasCaLlxusjQllD?=
 =?us-ascii?Q?BwViEGeciiKEgU58MwMfw/CTgZ/IHIF3HnZYOIHD/iC4gIsSYLl6NhH3x/a1?=
 =?us-ascii?Q?BkZwtQ24maDYtquFijiis+Ox8OLo+nIrhgyJHa4pAfP38hF/PnywTj9aBUHZ?=
x-ms-exchange-antispam-messagedata-1: CfTIikUPATYGre7C06MDquNBUn7tdj8dOw4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Tm9wBs+IUDf9DLJq5Hg9w8J/fOg3FDZLwX18OQaRDSUjj4v1GIaMOImdwnRgCjaZDwBYkDlxp03K2B/G4DavQ/jaIT9oU/bxQdffc2A/iaBFhFc22fZuzK59sy8rijRyIEoI+oYj8LW938Xx40VFa8iGYXJZqm8drrc6pPWUWv706Oq0EsbLm9YdJ0tbXdCuSGHLyv4pRJgg1QR0z/rQj5MomvIqVuTOqwNuVCj1Wny0AQdBM122LsPCnGDl5MFR0r2OzDBsm5Y3LPF3LKL+GtCOXGxL9vNR0ifAG2i6mdCjy+jWeU4FePT5icbZPuksG0ESgIwAntTbQTXfRrqeuA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0049711d-e95b-4461-d2ce-08df22a8c313
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 06:20:33.2045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EaVLKBgA6avcNapNzmOoytsPQ33TBO2yww6qIR6q/UZ2wFH+XKtb48MlmUjLoqF4pYpsEqd0pmR+E9ni7H+IztM/WFwok+sdx+K5GdH34Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 22 September 2026 16:35
> To: igt-dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.co=
m>
> Cc: Sharma, Nishit <nishit.sharma@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t v5 3/5] tests/intel: Add array-of-binds random-size
> allocation tests
>=20
> Add new array-binds-rand-sizes-* subtests that allocate batches of random=
-sized
> BOs and bind them using a single array-of-binds operation.
>=20
> The new tests allocate 10 BOs per batch and exercise both aligned and una=
ligned
> bind addresses. This extends existing eviction coverage by verifying that=
 BOs with
> varying sizes can be bound, managed and evicted correctly when submitted =
as a
> single bind array rather than individual bind operations.
>=20
> Introduce alloc_random_size_bos_array_bind(), which mirrors the existing
> random-size allocation flow while grouping multiple BOs into a single arr=
ay bind
> submission. This is particularly useful for eviction testing where a set =
of BOs
> needs to be resident or evicted as a unit.
>=20
> The tests are intended to provide additional coverage for array-of-binds =
handling
> under random allocation patterns and VRAM pressure scenarios.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 177 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
> bd5bf5a33..343d07626 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -47,7 +47,15 @@
>   * Description: Test 100 random BO allocation sizes in test table, unali=
gned bind
> addresses
>   * Test category: functionality test
>   *
> + * SUBTEST: array-binds-rand-sizes-10
> + * Description: Test 10 batches of 10 random BO allocation sizes each
> + bound together as a
> + * single array of binds
> + * Test category: functionality test
>   *
> + * SUBTEST: array-binds-rand-sizes-10-unaligned
> + * Description: Test 10 batches of 10 random BO allocation sizes bound
> + together as a single
> + * array of binds, unaligned bind addresses
> + * Test category: functionality test
>   */
>=20
>  #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) @@ -74,6 +82,7 @@ stat=
ic
> uint64_t *alloc_sizes;  enum test_type {
>  	TYPE_ALL_SIZES,
>  	TYPE_RANDOM_SIZE,
> +	TYPE_ARRAY_BIND
>  };
>=20
>  struct test_case {
> @@ -178,6 +187,28 @@ static void bo_alloc_reserve_va(struct bo_alloc *b,
> uint32_t flags, uint64_t va_
>  	igt_assert_eq_u64(b->gpu_va % align, 0);  }
>=20
> +static int __xe_vm_bind_array(int fd, uint32_t vm,
> +			      struct drm_xe_vm_bind_op *bind_ops,
> +			      uint32_t num_bind, struct drm_xe_sync *sync,
> +			      uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind =3D {
> +		.vm_id =3D vm,
> +		.num_binds =3D num_bind,
> +		.vector_of_binds =3D (uintptr_t)bind_ops,
> +		.num_syncs =3D num_syncs,
> +		.syncs =3D (uintptr_t)sync,
> +		.exec_queue_id =3D 0,
> +	};
> +
> +	igt_assert(num_bind > 0);
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> +		return -errno;
> +
> +	return 0;
> +}
> +
>  static void alloc_sizes_init(void)
>  {
>  	int i;
> @@ -254,6 +285,7 @@ static void create_bo_arr(int fd, uint32_t vm, struct
> bo_alloc *bos,  int n_bos,
>  	}
>  }
>=20
> +
>  /*
>   * BIND step: bind one or more BOs as a single array-of-binds ioctl call
>   * (see __xe_vm_bind_array() above), replacing the previous open-coded @=
@ -
> 308,8 +340,72 @@ static int test_bind_individual(int fd, uint32_t vm, str=
uct
> bo_alloc *bos, int n
>  	return 0;
>  }
>=20
> +static int test_bind_array(int fd, uint32_t vm,
> +			   struct bo_alloc *bos, int n_bos)
> +{
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle =3D syncobj_create(fd, 0),
> +	};
> +	int i, ret;
> +
> +	igt_assert(n_bos > 0);
> +
> +	bind_ops =3D calloc(n_bos, sizeof(*bind_ops));
> +	igt_assert(bind_ops);
> +
> +	for (i =3D 0; i < n_bos; i++) {
> +		igt_assert_f(bos[i].bo,
> +			     "BO[%d] was not created before bind\n", i);
> +
> +		igt_assert_f(bos[i].bo_size,
> +			     "BO[%d] has zero size\n", i);
> +
> +		bind_ops[i] =3D (struct drm_xe_vm_bind_op) {
> +			.obj =3D bos[i].bo,
> +			.obj_offset =3D 0,
> +			.range =3D bos[i].bo_size,
> +			.addr =3D bos[i].gpu_va,
> +			.op =3D DRM_XE_VM_BIND_OP_MAP,
> +			.flags =3D 0,
> +		};
> +
> +		igt_debug("Bind op[%d]: bo=3D%u size=3D%#llx addr=3D%#llx\n",
> +			  i,
> +			  bos[i].bo,
> +			  (unsigned long long)bos[i].bo_size,
> +			  (unsigned long long)bos[i].gpu_va);
> +	}
> +
> +	ret =3D __xe_vm_bind_array(fd, vm, bind_ops, n_bos, &sync, 1);
> +	if (ret) {
> +		if (ret =3D=3D -ENOMEM || ret =3D=3D -ENOSPC) {
> +			syncobj_destroy(fd, sync.handle);
> +			free(bind_ops);
> +			return ret;
> +		}
> +
> +		igt_assert_f(false, "Array VM_BIND failed: ret=3D%d errno=3D%d
> (%s)\n",
> +			     ret, errno, strerror(errno));
> +	}
> +
> +	igt_assert_f(syncobj_wait(fd, &sync.handle, 1,
> +				  INT64_MAX, 0, NULL),
> +		     "Timed out waiting for array VM_BIND\n");
> +
> +	syncobj_destroy(fd, sync.handle);
> +	free(bind_ops);
> +
> +	return 0;
> +}
> +
>  static int test_bind(int fd, uint32_t vm, struct bo_alloc *bos, int n_bo=
s, uint32_t
> flags)  {
> +	if (flags & ARRAY_BIND)
> +		return test_bind_array(fd, vm, bos, n_bos);
> +	else
>  		return test_bind_individual(fd, vm, bos, n_bos);  }
>=20
> @@ -600,6 +696,76 @@ static void all_sizes_once(int fd, struct
> drm_xe_engine_class_instance *hwe)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +/*
> + * Same idea as alloc_rand_size_bos(), but each iteration binds
> +N_BOS_PER_BIND BOs
> + * together via a single array-of-binds call instead of one at a time.
> + * Used by the array-binds-* subtests, in particular the eviction
> +stress
> + * test where several BOs need to be resident (or evicted) as a unit.
> + */
> +#define N_BOS_PER_BIND	10
> +
> +static void alloc_random_size_bos_array_bind(int fd, struct
> drm_xe_engine_class_instance *hwe,
> +					     int count, uint64_t
> vram_per_process,
> +					     pthread_barrier_t *barrier, uint32_t
> flags,
> +					     unsigned int *seed)
> +{
> +	struct bo_group **leaks =3D NULL;
> +	uint32_t vm, exec_queue;
> +	uint64_t vram_used =3D 0;
> +	int i, max_batches =3D (count =3D=3D -1) ? MAX_ALLOCATIONS : count;
> +	int n_batches =3D 0;
> +
> +	igt_debug("count=3D%d max_batches=3D%d vram_per_process=3D%llu
> flags=3D%x\n",
> +		  count, max_batches, (unsigned long long)vram_per_process,
> flags);
> +
> +	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
> +
> +	leaks =3D malloc(sizeof(*leaks) * max_batches);
> +	igt_assert(leaks);
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	exec_queue =3D  xe_exec_queue_create(fd, vm, hwe, 0);
> +
> +	for (i =3D 0; i < count || vram_used < vram_per_process; ++i) {
> +		uint64_t sizes[N_BOS_PER_BIND];
> +		struct bo_alloc *bos;
> +		int j;
> +
> +		for (j =3D 0; j < N_BOS_PER_BIND; ++j)
> +			sizes[j] =3D alloc_sizes[rand_r(seed) % N_ALLOC_SIZES];
> +
> +		igt_assert_f(i < max_batches, "Failed to reach %llu bytes of
> VRAM pressure "
> +			     " after %d batches (currently reached %llu bytes)\n",
> +			     (unsigned long long)vram_per_process, max_batches,
> +			     (unsigned long long)vram_used);
> +
> +		bos =3D test_alloc_sizes(fd, vm, exec_queue, hwe->gt_id, sizes,
> +				       N_BOS_PER_BIND, flags,
> BO_BIND_BASE_ADDR);
> +		if (bos) {
> +			leaks[i] =3D malloc(sizeof(*leaks[i]));
> +			igt_assert(leaks[i]);
> +
> +			leaks[i]->bos =3D bos;
> +			leaks[i]->n_bos =3D N_BOS_PER_BIND;
> +			n_batches++;
> +
> +			for (j =3D 0; j < N_BOS_PER_BIND; ++j)
> +				vram_used +=3D bos[j].bo_size;
> +		} else {
> +			leaks[i] =3D NULL;
> +		}
> +	}
> +
> +	if (barrier)
> +		pthread_barrier_wait(barrier);
> +
> +	check_leak_multi_group(fd, vm, leaks, n_batches, flags);

It should be i instead of n_batches as if it goes else case in one of the c=
ase then that is not counted.
check_leak_multi_group(fd, vm, leaks, i, flags);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +	free(leaks);
> +}
> +
>  static void run_gt_dynamic_subtests(int fd, const struct test_case *t)  =
{
>  	struct drm_xe_engine_class_instance *hwe; @@ -644,6 +810,13 @@
> static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
>  			case TYPE_RANDOM_SIZE:
>  				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL,
> t->flags);
>  				break;
> +			case TYPE_ARRAY_BIND: {
> +				unsigned int seed =3D hwe->gt_id + 1;
> +
> +				alloc_random_size_bos_array_bind(fd, hwe, t-
> >count, 0, NULL,
> +								 t->flags,
> &seed);
> +				break;
> +			}
>  			default:
>  				break;
>=20
> @@ -673,6 +846,9 @@ static const struct test_case test_matrix[] =3D {
>  	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
>  	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
>  	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE,
> false },
> +	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true
> },
> +	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED,
> TYPE_ARRAY_BIND,
> +	  true },
>  };
>=20
>  int igt_main()
> @@ -690,6 +866,7 @@ int igt_main()
>  		switch (t->type) {
>  		case TYPE_ALL_SIZES:
>  		case TYPE_RANDOM_SIZE:
> +		case TYPE_ARRAY_BIND:
>  			igt_subtest_with_dynamic_f("%s", t->name)
>  				run_gt_dynamic_subtests(fd, t);
>  		}
> --
> 2.52.0

