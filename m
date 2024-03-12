Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5149BC54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 10:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B0C10EF98;
	Tue, 12 Mar 2024 10:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6cIrTaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440910EF98
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710238365; x=1741774365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fq/6XQ/DbkQTf0f5EjEo6QHuyY9ajb0QRkNZk4iFHY4=;
 b=c6cIrTaQ5J4QjMc/d0fyL/YdYXmUr1GnuDF/2mKIoW5bMkFp8qZjW8jH
 TDoEg77UiGF0ZrPFls97t89BfZ3D64efrhORMUMiwTQgxxkoo4t61jP/d
 28P2tAl0dkOXIs0hHISkGJpwCj7U5jg/h7CBbCz5lz/T8eClWQhR3NX0s
 zAy996mTIPHeB5Lo2YmmVGFN3V4GfunfRDQZk/I+V6nsWXZUtCxa1JBPW
 XdmTVKyVBsWsmxjYJ3A4rJKb0NBwwS5JJ+RNDNA75CD5Z1eWFDw8WOcmj
 ioYPJ3tYfxCcytOZhZ3iPH2sabORRHgwwFzSuTWjtXx5e2gyhNPxTLJvn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5110623"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5110623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11564599"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 03:12:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 03:12:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 03:12:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 03:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ax25uu19I7Tyizijw846H3DUFhcHHzwmgLAhg0oFYQrF4p51niQgA3BWkTOUNnmkiSu3BkLgR82C+0QgklWnm8OEAI8hX3GSCl//65BogYqB9a9HxcHZsYxbj77qvoc/ixPgc9p0Vx4XusOiHA0HAlw3kSj1qARts/VS3uox5etoitLMVc/YaJN4ZTXodTFRAKTe+wcbcCPQoIT2oHHdYegDg0QtgngR6wMHP51T6oT+qDF6YYg9OFMltQO8ybFTgkU3r1ddPPeyULYdB6CXTpVJvzwq6TLyV/z1RbyaKVNDR+s2uZ+KIa/68Nwnsv5J7ODpU10r1brHwiA9q/Rn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGrXFRQ/BB+0BixEdXEhEHdUrftB+mY2p+aCSqj7B+Y=;
 b=N66ExRy/Cb7wkRv5Z9AKe7wGWMtkl7Ium3i1O/aGIFIm/qzww/9pYrsXQvOW7gLZRqmBaeu+TsPGeRSWkirn9YiwI6wyaQv0XtCjuCL/n1OgvojY0UvNrh3otFwmwSlQyl/WOHFFPO/lfbKIjkFnnoyVj83ZbEpQKwIltJsqkE/cjci4JLXHZKP4pTSBlfoLVUStum22ecenf/VSk3FORji6A1HCVDekkGXL7E060mn8i53AH9Uzc26aAhwkNhuow0yy4HkM8DPzdChKtswZhTlELapmJ5Qp5+JTUd1/kXZr36nkZ1I8F25G/WKUZfv+cGnwgDyYQwxfIu6m4sCVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 10:12:34 +0000
Received: from IA1PR11MB7856.namprd11.prod.outlook.com
 ([fe80::eb12:aca:7501:3635]) by IA1PR11MB7856.namprd11.prod.outlook.com
 ([fe80::eb12:aca:7501:3635%3]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 10:12:34 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, "Wilson, Chris P" <chris.p.wilson@intel.com>
Subject: RE: [PATCH i-g-t v2 21/25] tests/intel: Add missing documentation
 fields in i915_selftest
Thread-Topic: [PATCH i-g-t v2 21/25] tests/intel: Add missing documentation
 fields in i915_selftest
Thread-Index: AQHacTRQn9GkUq5USEeU3uMaxAeqDrEz6GbA
Date: Tue, 12 Mar 2024 10:12:34 +0000
Message-ID: <IA1PR11MB78569177F1DC36AD7A240CBF982B2@IA1PR11MB7856.namprd11.prod.outlook.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-22-katarzyna.piecielska@intel.com>
In-Reply-To: <20240308083657.1092049-22-katarzyna.piecielska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7856:EE_|SJ1PR11MB6297:EE_
x-ms-office365-filtering-correlation-id: 2267f9f2-4631-4aed-85f8-08dc427cef96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iOJjEYQPqizaea/CXEkcS9H85cIsjTlyLsbvKId5XMyy5o3GqcPCNPuBkqxGWrdDBQ5MHV3YVfpSdH3bP4rgt7qtWTjOozSXFjNBxQZw/p3GusZ2N4loPizSWkaNS7LamHKUZIBsIdOu226kspBdRjmIC8uvqvfRQL2htgG+txw5sktHoEJ5KLD5bNLvo67bv9ThrPe++O/+/bAL+MpqQ01NoNcG059zmf+hW/K3Ox/rXBAUvtuBVNkWMgykGgmxITKCBavdXzIr//Vh67i+mhh2mFXYKGMRmFQxHCotCEOeUYw40bJWTfXNVkFPHG09HC/VhGoa0CE2RjZbRasUV4cBLsBlK+QxiwTrEIIzSudD4+HWoH7G7c4DJd38Dp0LwdMyA0ci4cDuFiQyadu5KsM+wMzgrU09Nrh0qIljWnGZmeZp3RprmjvgZG6qBgD5Rci00W4OPS6reK1kyYbBWKK3BqhRArl1RyWPXUiYYdKbqzEkXyKTB0/1oimVlCRVXn2HX5lRYswfWe6jbhaDdYbLLEB1Obor5sSkUWJdfKgBqtMyId22oxfX4NEkIJDGmBxNjV59NQvuiwAg8QA4BAHlXyAFRktolL6qubqWZ//+9Z+u+QZqYOWKSMe4RzF6bkEwW4eM0vFcKSxHfb244zbV6abZnL0mCQ6eyZ9/6XifX1xUbBKPwwHCRLac/t/42WlXG1efwpWafkdE6+Lxhcy2CxA2B7PpcdQUCNbT29U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FOtf0fRqhNQ1Aj9zNm5fTU1nqOwQgVTkPHmRIiXBpOUG7LJiNQQOPEuWtbOB?=
 =?us-ascii?Q?mYjzOzA/n34dp0jEyMIVhB4MjrPoFF4t1NOVOYdaE3e2rWm4gnF8FV13M+fc?=
 =?us-ascii?Q?hHS0KD3IgppZY30qOA0O7+FU/69oAK3Rzd2Cxqqz/lV4PB0dzQzlPBv1Ts3R?=
 =?us-ascii?Q?QRT7o6+5W3PNFP5ujbLfUtORhDoUX7To2kB3Nrr+b9mK5o3+NI/Zb0Xyg4O4?=
 =?us-ascii?Q?HM+fJ80zb9moU7YsPqi6d48q0afJcL8Wy+qPgswsBEPa94jYdoruDP5igcc6?=
 =?us-ascii?Q?gKDGVhh+kEMfXxh6Tc3raVZy74NTEeoEAAU5FBqCHferPRo5JmTqB29J1KrE?=
 =?us-ascii?Q?0XXwdR08q1UQBE3/SHNRa/INtdAafkmq/HEsBt6Z9NgthFiB7w6BJCMxYj8S?=
 =?us-ascii?Q?ppeBapSHwJSLJ9sbgZ73gZMNA0Q1cUldqYbGrPkkC8odon1mjFnrvD2IOTmw?=
 =?us-ascii?Q?lw9IWzI7CdxUjeydG3rtTQpdXwwpU8tPp6eFUMIqllIb9S9ySHKy4Dt+Txy4?=
 =?us-ascii?Q?yc7uVUD7gXjLJhUlu8OYiuZvy30Gp6IWIv6Q214JMh3YmZQDZL/j4oYxeOk3?=
 =?us-ascii?Q?zPFnrkJ3vDGO1EKzjR0SYMoZmfC+QMtGfDny0jQaS3OfUYLYvvOXuKZOujpd?=
 =?us-ascii?Q?W+x+MjqnU6Bi8kjAnysT+CZ8w/S++s1hzA2wqAZcypPX2cDjZvI/Y4ZytZib?=
 =?us-ascii?Q?NEk1ZFKxEs0Q80SSTwKr556gqDroEIfYih21Ctk3l4QGzFP5X2ieLySUSA+D?=
 =?us-ascii?Q?xF2vj7n24hG0KiO+EDtc/5EK5v5ErpMl9+cxLNgM8WaYjpjJbD9jOFeQpqYD?=
 =?us-ascii?Q?t5EjtTiR8YA+KGVt4o1bLFj6YHwuhvnuQAsVjKs9ZosCyKdyae5YhOMC3dCG?=
 =?us-ascii?Q?0BpmuQk4MBSDEu0esiJyf/Ix0g2+nwSR/xwVs+LY8rOtsEyiIWD8+yQVb4xw?=
 =?us-ascii?Q?DgmpjPI5laFoEvK5gGY4QcOz2u6VPEFhI4eGRBgyTTje392fbIzqUWC3DEjS?=
 =?us-ascii?Q?FyBaROW4g6Um8yVi3eFOlhPrUGrTLwQ88sAxOKSBRkEOCtjJPkgrqNVFXQgZ?=
 =?us-ascii?Q?BO61ixk1vi2eh6zyWLuZPjek5epRfjspFNMC39kD7CX4FLaA+7g40HrLNO59?=
 =?us-ascii?Q?JFlHytPxISZV/WauWD2Kqhf9fYV0L0AIhMqbAFL4FgWxGMBbQPfojKjeesik?=
 =?us-ascii?Q?lqjB1h3ykGmo+e36ZYveKF7LWH0lYSie5SidxQc86Cq/1bAb9GfVpiyOzUz9?=
 =?us-ascii?Q?UM+JAngC25W6Bcl91IzVerg4Da26PRF8vrYsK/nDb18LaAZnqHmjpvOTiU7o?=
 =?us-ascii?Q?yOABXWtCYpBUluAxVjjT9vpIYbCMVsCB2rXrt6d8nbEtFo0C4svI8de7grie?=
 =?us-ascii?Q?McQR1fuSeECuzzDmxf2sMG8spc0jW2mtld5w8MAJi//kNhvAJ+YRS1123S03?=
 =?us-ascii?Q?0JMZWu3SdiwZnoymoEiuee3YhYMdnYfgM/gRz2iJ3y70Qm6ym0xVm71FXJZw?=
 =?us-ascii?Q?5+ith+gh99xtkp+/3Hp3IGjADcIo4na58QaFkq7lXALJ1/nTomUK48C3TENB?=
 =?us-ascii?Q?ZbUTndIqlAZsUtbQtJwaY7BjNzAC3sn6qjSXIjGb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2267f9f2-4631-4aed-85f8-08dc427cef96
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 10:12:34.2309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnJROMYVZxc7OK3PdAuvr4ntF7jcaceVj9CyyR/7nlDrp/H7gS39XXhdkO/MSGlr9tx+2J42mIOlHnCB8ILXd5DU/K9wmcoDSSobo8Jk4G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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
> Katarzyna Piecielska
> Sent: Friday, March 8, 2024 2:07 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Kamil Koniecz=
ny
> <kamil.konieczny@linux.intel.com>; Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com>; Wilson, Chris P
> <chris.p.wilson@intel.com>
> Subject: [PATCH i-g-t v2 21/25] tests/intel: Add missing documentation fi=
elds
> in i915_selftest
>=20
> Add subcategories, functionalities for all selftests in i915_selftest.
> Change functionality for live@gem - s/command submission/execbuf/.
>=20
> v2: Make sure Sub-category and Functionality fields are not duplicated.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> ---
>  tests/intel/i915_selftest.c | 381 +++++++++++++++++++-----------------
>  1 file changed, 206 insertions(+), 175 deletions(-)
>=20
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c in=
dex
> 2c5f6bce2..9e254b33c 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -29,165 +29,171 @@
>   *
>   * SUBTEST: live
>   * Feature: gem_core
> + * Sub-category: Selftest
> + * Category: Selftest
> + * Functionality: live selftest
>   * Run type: BAT
>   *
>   * SUBTEST: live@active
>   * Category: Selftest
>   * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Synchronization
>   *
>   * SUBTEST: live@blt
>   * Category: Selftest
>   * Description: Blitter validation
>   * Functionality: command streamer
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Test category: i915 / HW
> + * Sub-category: Blitter
>   *
>   * SUBTEST: live@client
>   * Category: Selftest
>   * Description: Internal API over blitter
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: blitter api
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: live@coherency
>   * Category: Selftest
>   * Description: Cache management
> - * Functionality: memory management
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Functionality: cache
> + * Test category: i915 / HW
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@debugger
>   * Category: Selftest
>   * Functionality: device management
> - * Sub-category: debugger
> - * Test category: GEM_Legacy
> + * Test category: debugger
> + * Sub-category: Debugging
>   *
>   * SUBTEST: live@display
>   * Category: Selftest
>   * Functionality: display sanity
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Display
>   *
>   * SUBTEST: live@dmabuf
>   * Category: Selftest
>   * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@evict
>   * Category: Selftest
>   * Functionality: GTT eviction
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@execlists
>   * Category: Selftest
>   * Description: command submission backend
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: execlists
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gem
>   * Category: Selftest
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: execbuf
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gem_contexts
>   * Category: Selftest
>   * Description: User isolation and execution at the context level
> - * Functionality: context management
> - * Sub-category: i915 / HW
> + * Functionality: context
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> + * Test category: i915 / HW
>   *
>   * SUBTEST: live@gem_execbuf
>   * Category: Selftest
>   * Description: command submission support
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: execbuf
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gt_ccs_mode
>   * Category: Selftest
>   * Description: Multi-ccs internal validation
>   * Functionality: multii-ccs
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gt_contexts
>   * Category: Selftest
>   * Description: HW isolation and HW context validation
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: context
> + * Sub-category: CMD submission
> + * Test category: HW
>   *
>   * SUBTEST: live@gt_engines
>   * Category: Selftest
>   * Description: command submission topology validation
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: command submission topology
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@gt_gtt
>   * Category: Selftest
>   * Description: Validation of virtual address management and execution
> - * Functionality: memory management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: gtt
> + * Test category: HW
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@gt_heartbeat
>   * Category: Selftest
>   * Description: Stall detection interface validation
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: heartbeat
> + * Test category: i915
> + * Sub-category: Reset
>   *
>   * SUBTEST: live@gt_lrc
>   * Category: Selftest
>   * Description: HW isolation and HW context validation
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: context
> + * Sub-category: CMD submission
> + * Test category: HW
>   *
>   * SUBTEST: live@gt_mocs
>   * Category: Selftest
>   * Description: Verification of mocs registers
> - * Functionality: mocs
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Functionality: mocs registers
> + * Test category: i915 / HW
> + * Sub-category: Mocs
>   *
>   * SUBTEST: live@gt_pm
>   * Category: Selftest
>   * Description: Basic i915 driver module selftests
> - * Feature: rps, rc6
> - * Test category: rps, rc6
> + * Functionality: rps, rc6
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@gt_timelines
>   * Category: Selftest
>   * Description: semaphore tracking
>   * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Synchronization
>   *
>   * SUBTEST: live@gt_tlb
>   * Category: Selftest
>   * Test category: Memory Management
> + * Sub-category: Memory management
> + * Functionality: tlb
>   *
>   * SUBTEST: live@gtt
>   * Category: Selftest
>   * Description: Virtual address management interface validation
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: virtual address
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@gtt_l4wa
>   * Category: Selftest
>   * Description: Check the L4WA is enabled when it was required
> - * Functionality: workarounds
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: L4WA
> + * Test category: i915
> + * Sub-category: Workarounds
>   *
>   * SUBTEST: live@guc
>   * Category: Selftest
> @@ -220,313 +226,338 @@
>   * SUBTEST: live@hangcheck
>   * Category: Selftest
>   * Description: reset handling after stall detection
> - * Functionality: reset
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: hangcheck
> + * Test category: i915
> + * Sub-category: Reset
>   *
>   * SUBTEST: live@hugepages
>   * Category: Selftest
>   * Description: Large page support validation
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: large page
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@late_gt_pm
>   * Category: Selftest
>   * Feature: rc6
> - * Functionality: Basic i915 driver module selftests
> - * Test category: rc6
> + * Description: Basic i915 driver module selftests
> + * Functionality: rc6
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@lmem
>   * Category: Selftest
> + * Feature: local_memory
> + * Description: Basic i915 driver module selftests
> + * Functionality: local memory
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@memory_region
>   * Category: Selftest
>   * Description: memory topology validation and migration checks
> - * Functionality: memory management
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Functionality: memory topology
> + * Test category: i915 / HW
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@memory_region_cross_tile
>   * Category: Selftest
> - * Functionality: Multi-tile memory topology validation
> - * Test category: MultiTile
> + * Description: Multi-tile memory topology validation
> + * Functionality: memory topology
> + * Sub-category: MultiTile
>   *
>   * SUBTEST: live@mman
>   * Category: Selftest
>   * Description: memory management validation
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: mapping
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@obj_lock
>   * Category: Selftest
>   * Description: Validation of per-object locking patterns
> - * Functionality: per-object lockling
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: per-object locking
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: live@objects
>   * Category: Selftest
>   * Description: User object allocation and isolation checks
>   * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: live@perf
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: live@remote_tiles
>   * Category: Selftest
> - * Functionality: Tile meta data validation
> - * Test category: MultiTile
> + * Description: Tile meta data validation
> + * Functionality: meta data
> + * Sub-category: MultiTile
>   *
>   * SUBTEST: live@requests
>   * Category: Selftest
>   * Description: Validation of internal i915 command submission interface
> - * Functionality: command submission
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: command submission interface
> + * Test category: i915
> + * Sub-category: CMD submission
>   *
>   * SUBTEST: live@reset
>   * Category: Selftest
>   * Description: engine/GT resets
> - * Functionality: reset
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: engine/GT reset
> + * Test category: HW
> + * Sub-category: Reset
>   *
>   * SUBTEST: live@sanitycheck
>   * Category: Selftest
>   * Description: Checks the selftest infrastructure itself
> - * Functionality: selftests
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: selftest
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: live@scheduler
>   * Category: Selftest
> - * Test category: Cmd Submission
> + * Sub-category: CMD Submission
> + * Functionality: scheduler
>   *
>   * SUBTEST: live@semaphores
>   * Category: Selftest
>   * Description: GuC semaphore management
>   * Functionality: semaphore
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Test category: HW
> + * Sub-category: Synchronization
>   *
>   * SUBTEST: live@slpc
>   * Category: Selftest
>   * Feature: slpc / pm_rps
> - * Functionality: Basic i915 driver module selftests
> - * Test category: slpc / pm_rps
> + * Description: Basic i915 driver module selftests
> + * Functionality: slpc
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@uncore
>   * Category: Selftest
>   * Description: Basic i915 driver module selftests
>   * Feature: forcewake
> - * Test category: forcewake
> + * Functionality: forcewake
> + * Sub-category: Power management
>   *
>   * SUBTEST: live@vma
>   * Category: Selftest
>   * Description: Per-object virtual address management
> - * Functionality: memory management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: vma
> + * Test category: i915
> + * Sub-category: Memory management
>   *
>   * SUBTEST: live@win_blt_copy
>   * Category: Selftest
>   * Description: Validation of migration interface
>   * Functionality: migration interface
> - * Sub-category: i915 / HW
> - * Test category: GEM_Legacy
> + * Test category: i915 / HW
> + * Sub-category: Blitter
>   *
>   * SUBTEST: live@workarounds
>   * Category: Selftest
>   * Description: Check workarounds persist or are reapplied after resets =
and
> other power management events
> - * Functionality: workarounds
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> + * Functionality: driver workarounds
> + * Test category: HW
> + * Sub-category: Workarounds
>   *
>   * SUBTEST: mock
> + * Category: Selftest
>   * Feature: gem_core
> + * Sub-category: Selftest
> + * Functionality: mock selftest
>   * Run type: FULL
>   *
>   * SUBTEST: mock@buddy
>   * Category: Selftest
>   * Description: Buddy allocation
> - * Functionality: memory management
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
> + * Functionality: buddy allocation
> + * Test category: DRM
> + * Sub-category: Memory management
>   *
>   * SUBTEST: mock@contexts
>   * Category: Selftest
>   * Description: GEM context internal API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: context
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@dmabuf
>   * Category: Selftest
>   * Description: dma-buf (buffer management) API checks
> - * Functionality: API checks
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
> + * Functionality: buffer management
> + * Test category: DRM
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@engine
>   * Category: Selftest
>   * Description: Engine topology API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: engine topology
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@evict
>   * Category: Selftest
>   * Description: GTT eviction API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: gtt eviction
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@fence
>   * Category: Selftest
>   * Description: semaphore API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: semaphore
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@gtt
>   * Category: Selftest
>   * Description: Virtual address management API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: gtt
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@hugepages
>   * Category: Selftest
>   * Description: Hugepage API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: huge page
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@memory_region
>   * Category: Selftest
>   * Description: Memory region API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: memory region
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@objects
>   * Category: Selftest
>   * Description: Buffer object API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: buffer object
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@phys
>   * Category: Selftest
>   * Description: legacy physical object API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: physical object
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@requests
>   * Category: Selftest
>   * Description: Internal command submission API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: requests
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@ring
>   * Category: Selftest
>   * Description: Ringbuffer management API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: ringbuffer
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@sanitycheck
>   * Category: Selftest
>   * Description: Selftest for the selftest
> - * Functionality: selftests
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: selftest
> + * Test category: i915
> + * Sub-category: Core
>   *
>   * SUBTEST: mock@scatterlist
>   * Category: Selftest
>   * Description: Scatterlist API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: scatterlist
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@shmem
>   * Category: Selftest
>   * Description: SHM utils API checks
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: shm
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@syncmap
>   * Category: Selftest
>   * Description: API checks for the contracted radixtree
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: contracted radixtree
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@timelines
>   * Category: Selftest
>   * Description: API checks for semaphore tracking
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: semaphore
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: mock@tlb
>   * Category: Selftest
>   * Test category: Memory Management
> + * Sub-category: Memory management
> + * Functionality: tlb
>   *
>   * SUBTEST: mock@uncore
>   * Category: Selftest
>   * Description: Basic i915 driver module selftests
>   * Feature: forcewake
> - * Test category: forcewake
> + * Functionality: forcewake
> + * Sub-category: Power management
>   *
>   * SUBTEST: mock@vma
>   * Category: Selftest
>   * Description: API checks for virtual address management
> - * Functionality: API checks
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Functionality: vma
> + * Test category: i915
> + * Sub-category: uapi
>   *
>   * SUBTEST: perf
> + * Category: Selftest
>   * Feature: oa
> + * Functionality: oa
> + * Sub-category: Performance
>   * Run type: FULL
>   *
>   * SUBTEST: perf@blt
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@engine_cs
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@region
>   * Category: Selftest
>   * Feature: i915 perf selftests
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@request
>   * Category: Selftest
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   *
>   * SUBTEST: perf@scheduler
>   * Category: Selftest
> - * Functionality: Basic i915 module perf unit selftests
> - * Test category: Perf
> + * Description: Basic i915 module perf unit selftests
> + * Functionality: perf
> + * Sub-category: Performance
>   */
>=20
>  IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
> --
> 2.34.1

LGTM
Acked by : Himanshu Girotra <himanshu.girotra@intel.com>
