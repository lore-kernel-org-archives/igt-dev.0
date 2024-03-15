Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57920C54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 04:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5A510EBA7;
	Fri, 15 Mar 2024 04:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffGZNqhw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84C10EBA7
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 04:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710476422; x=1742012422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xS49atDDFD/h+7HOjntHEpydE9qadWRwwKFIWDn1mZs=;
 b=ffGZNqhwXWTn5W1BTiB+N5g4vEQr2tI5x1h5Dg9kj2tQBc86UayqM+Bm
 5MBQZVeRJ5NxNgImtZoH8+S4CxrPrgWHmp/imiNFT9jLPFCQ/wAC3Jog8
 EVHhQJgonFzqbvB/MLqASsjSdD0r8prMErkr2FhoezLXCQnY0AQS2nWW1
 +Xm80sgHLR0ocxcUskt/xsxLSmc/kIGUDPch43uQ3gBrRdlzHamIRc3me
 DAtV1Lc4nflg2mxe+6FbgraRU87yyZKUF+b/iCmP3uY36aAuT8a/X/1BM
 bEFaRWChfjTBCrVYNaD7eIWBMOwp1H9o7t129UFkfBJBk+utk0fJV5Pkm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5179643"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5179643"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 21:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12939558"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 21:20:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 21:20:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 21:20:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 21:20:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHHLUFikm2pTEaMAdlQIsnoy3jDI8hEjYpJfHeNAqqD39E6bqnhl+/pngi2g5fWfzF5XbJ7qSyLqSUKvmoVjpfTGiBukQVBXjYtNkc+oIcwIr73oZMl1c+CjsAYlbB2waHJP3Gb4M9BPcf6K/ENRJge/NsTEbKHIgZBJSQA0B22XK361I3B3IP+z3AX/iH7Sd41Ukm20FQwPOVMijAnh606r0Ywc5b4hOvi+EY68eYWNHc6zVWLvqhg0goZM1U1HZQYNEHwBAbHgh5IOXRY+Uu6Ttyf1I4I6QQs+WTPub3VqEYpOAgxOFSGs0iCzW+S3V3NIiSEDMZJoAMSajMKQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ira27zWnX1mK64kNVwnUxNz1PteNSw3QFBTTomyGTJI=;
 b=Q6vGHMoDWFxM0lc5umcN+fNBOZtV403j2bI+CyLmTH8u/LWIT22mGpseo/o0iSbVgfPMo5zooFs+rHwOBkk4Y8nsyIPnl3Y6kRgsrot/5o7zylOvEZ+ab7MeQn/677THIo/SoKQ3ZKws1DwcbtvqIXEpOkIoH0p4CGOHp5Y2gLZxNCB0JDgwwkDD/QfLkLBNxqm14GGI17ErwWPn7WD+lyxDl6B40DSkeZW9MSuTC8cgAexscXbtD/8OZy5mlAJDwDaeWEb3pHjhUOtIbsx1BxHoghunNMoesTs8luH3Ht8Yb5GAz68i8ahJeFoEgjuK0yCPcL6LwAg0HAp5STLOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 04:20:16 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7386.015; Fri, 15 Mar 2024
 04:20:16 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
Subject: RE: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Topic: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Index: AQHadhziAfctXGMWyUapJSqA4wiM0bE4MycQ
Date: Fri, 15 Mar 2024 04:20:16 +0000
Message-ID: <CH3PR11MB84347B67CC8A7AE42E1837D08D282@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-3-katarzyna.piecielska@intel.com>
In-Reply-To: <20240314143455.1436688-3-katarzyna.piecielska@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|BL1PR11MB5318:EE_
x-ms-office365-filtering-correlation-id: 3bdab172-9e92-469d-c480-08dc44a737b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ICRVpun9czmHQs5H0ys6BwTChYEYC5ERV6Axl5kezz9xZZz02GBnZoPFichmK9fTLkVz9X47ugAPeFM8yEhjT1ScjYtlhV6i7eT1CBKWXeSXREQN+m2vFa3n88qME/gamVZY3KBqV6pf2x/5I8Vrr1l+8NLUddpZAQOvH2YB9hBloWMxNVmF6PBFl56lzMgt0ODabpM023x2ROZrUHsIqU23CWrUQbx/cJ+GeuL+SNZJh9W8YTjWbrPhdKfyRkj4r/B05EE6Bm8umnGLKRJbkpRmHaELYTiZDtyo6FFZEfMSudL0iZCkauU1pOSfMipFRvId2HDC0Fw/yEGzT0oWpGmV1MQz0sOr4a49kLFqG/vkmUaBzhkKTnIaNlukyOI5lK85bjFzM8kX24J1Eog4LmIvDhu6zkGa99Pm/icCufR5t8YonrvgdhTilvuSwg/oc2IpDEII4fu/PE8hCMNbz4+oFf7Z1AUSyHO95RIHDORzEtJTqY9iHTudqeiwNIF4SB8A2d+AFHn/HC1nR6z5CfrJDuGBzYSt2OwPrVuRLrIFXvnyEqlquSBytSYzavti2kx4xVd+EV0Km1Eyg1bWNGHPn46BCmcFpLxOEIAvAxvQwvCxaXq718ZC/aFnXCkW1G18xv5vQ59SoemdRV7XmN8RA8tXkjuUcYTDCtPJXhCDqzowH3Xcy5vDC5AfgbUp5lEUhJ/5P5AJ4TCszkjbvezNtpTyEmr4IY9vUV1oGgk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gUzoKxVRLtO4Mk7ix9DWn9FLLPEzbUuw6qV5Py1BuVAyUsxazLsaIQ7wPwVm?=
 =?us-ascii?Q?blEc09FplMMRKRI4ybBZHYeXmPaubLU5ghLckW386SB1NDRS2Gpfc3+M1euK?=
 =?us-ascii?Q?Klj2M5cvAFcnc5O1AYOt5ASQXWmuyjhXFPB0iEQQrKyCigsF7B+4/kUimxWI?=
 =?us-ascii?Q?n0ndvjijyHI1W1X91dt0NZvn3lv5xFKBbfWj8rNwc4iVM7RazID+J1O77wRd?=
 =?us-ascii?Q?MYTwENprcmpp6ahFySUGm6UN6MwiPhtT8z/1TxQz5RMdhHGndCDbTADobvrO?=
 =?us-ascii?Q?UUv4P3HIiDqQdvMY/WReKXfcPOQWkAraBZ5WdIbI4uVlps1ZaCXrWRCHa/co?=
 =?us-ascii?Q?D9yGPMZls+2cnHyY5cCrPLwAT874XTkenmxPI/0Lj6q2taWVHkeflYLlMuvO?=
 =?us-ascii?Q?hiwldp2eE/iQD1t4djjCoJZeSZTpBGkxpH4JP6Q0fhyMmZLLgN5ogSYQ84Yf?=
 =?us-ascii?Q?VFIyyLEWEm2r6icbz2NzHE12+de2W7vHSpoVnYUm5teBTv1k99VZBxJqXmOD?=
 =?us-ascii?Q?W3FwibnBUzN9v+Il1142mtYW5zlZD3iIqhr1CXCgFW5xNzLdPaRsUF6La3Px?=
 =?us-ascii?Q?yHTA/fBIbFh6YGnumH9Ehm1GMlQU0VvRMO3KXw6q0cvBeG4ySwrkPNK6wGll?=
 =?us-ascii?Q?l0NG9+22f2ePiZ+HmxOxZ3AurLsiasMfrJY8Lmw8FvGatLEMEYYhOiafRC+I?=
 =?us-ascii?Q?hXQf3j4GS6AmfcheuBUX7SNhuDpSgO4Ro8BrM6ZRzLlue20UC9x1MO6VIWD3?=
 =?us-ascii?Q?jPD7T1rHmRk5RXfWRtlB6bzjA2UsIB4O+8vmBPER4FDSIIXIXU3zRcKRzHZq?=
 =?us-ascii?Q?QP/lj+sCc9fnmAxnL7krxYUfhSa4Rs7h1F8j+KPq5Ehrx/U9ycZlV2fV3L44?=
 =?us-ascii?Q?bCSH44PacR2EkQ/GUUMWJQlws1zfrWvvScJu23Oc8t7HKbdhnk+op/J3H315?=
 =?us-ascii?Q?pjIGi6derPJaJUmxIpDKLKRmu54TkT99GqvBKmwH1B272OABLbawXirOkS9t?=
 =?us-ascii?Q?eONzk5Ivf4qLX4IGG+kqG3GkBcY2Y0uDu8VBDicy5RPHsh3dvuAHPTRCKvoV?=
 =?us-ascii?Q?u/7QYQHcZuVxgcYt08t55oLtBsiJb8vR3JxXJL1m6WgCGvYl7TiGuoyjBG5p?=
 =?us-ascii?Q?0ECsizE6x5zWEERUVz0ownZAn/jQTr8cvv91bdoFkBbfa3cPqaU6p5xk/lIr?=
 =?us-ascii?Q?m/ZGvD8A3vRh5jkkQ6Jggxpb0dVNbD9ttZvKRT5a00fAIqSYgowg6u/aWPbh?=
 =?us-ascii?Q?IbsW9F2/hB9jk5tap3ATNbYn4jZm691cwq1KkGpNlCGmJ0KUBAeffeDR0euM?=
 =?us-ascii?Q?Vt6CZXrxjkjhxn30jdX5EAKKKbROoBQGbu/+qPFO+adqw0euWqwIImZHOOgW?=
 =?us-ascii?Q?G89UV38squPvVQ/gleVR33tT5IebedQL9UA4NVb9ra5rGdJ79Ck88adKSLeX?=
 =?us-ascii?Q?Qfb6dVesduNl5c+adQsRqgSW1pzEogj/Id8RcqC4i2JpjUe4WCQEJwy7bH0e?=
 =?us-ascii?Q?NOqT5DJFOxOoMlx5SVASY4+Tp9KwzRWYpIdloH5Dg+0wGjusnK6L1rNKk1cK?=
 =?us-ascii?Q?0J9iuerj6CHHWF+ShUElZ8f7o+gHAQj71qCof95Kp/RynMmryGIL2ic0fZWO?=
 =?us-ascii?Q?iA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdab172-9e92-469d-c480-08dc44a737b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 04:20:16.4265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBWwMIklO0QDW8OZfn/+tHYnc5TsJoYjn0Uudsectny3TvijtwhU5TVUY3xe4WX8q8ZQtDEQbGXbwDJjpdMphF+s4Tdy6bDi628Q6/N7RH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
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
> From: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
> Sent: Thursday, March 14, 2024 8:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Wilson, Chris=
 P
> <chris.p.wilson@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com>
> Subject: [PATCH i-g-t v4 02/25] tests/intel: Introduce Memory management
> subcategory
>=20
> Let's add Memory management subcategory for tests that are validating
> memory.
>=20
> Change subcategory s/i915/Memory management/ for tests:
>  - gem_lmem_swapping.c
>  - gem_madvise.c
>=20
> v2: Make Sub-category/Functionality/Feature unique (Kamil)
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/drm_mm.c                               | 2 +-
>  tests/intel/gem_close.c                      | 2 +-
>  tests/intel/gem_cs_tlb.c                     | 4 ++--
>  tests/intel/gem_gtt_cpu_tlb.c                | 3 +++
>  tests/intel/gem_gtt_hog.c                    | 3 +++
>  tests/intel/gem_gtt_speed.c                  | 3 +++
>  tests/intel/gem_lmem_evict.c                 | 3 +++
>  tests/intel/gem_lmem_swapping.c              | 2 +-
>  tests/intel/gem_madvise.c                    | 2 +-
>  tests/intel/gem_mmap.c                       | 3 +++
>  tests/intel/gem_mmap_gtt.c                   | 3 +++
>  tests/intel/gem_mmap_offset.c                | 2 +-
>  tests/intel/gem_mmap_wc.c                    | 3 +++
>  tests/intel/gem_read_read_speed.c            | 3 +++
>  tests/intel/gem_readwrite.c                  | 3 +++
>  tests/intel/gem_set_tiling_vs_gtt.c          | 3 +++
>  tests/intel/gem_set_tiling_vs_pwrite.c       | 3 +++
>  tests/intel/gem_streaming_writes.c           | 3 +++
>  tests/intel/gem_tiled_blits.c                | 3 +++
>  tests/intel/gem_tiled_fence_blits.c          | 3 +++
>  tests/intel/gem_tiled_partial_pwrite_pread.c | 3 +++
>  tests/intel/gem_tiled_pread_basic.c          | 3 +++
>  tests/intel/gem_tiled_pread_pwrite.c         | 3 +++
>  tests/intel/gem_tiled_swapping.c             | 3 +++
>  tests/intel/gem_tiled_wb.c                   | 3 +++
>  tests/intel/gem_tiled_wc.c                   | 3 +++
>  tests/intel/gem_tiling_max_stride.c          | 3 +++
>  tests/intel/gem_unfence_active_buffers.c     | 3 +++
>  tests/intel/i915_fb_tiling.c                 | 3 +++
>  tests/intel/prime_busy.c                     | 2 +-
>  tests/intel/prime_mmap.c                     | 4 ++--
>  tests/intel/prime_mmap_coherency.c           | 4 ++--
>  tests/intel/prime_self_import.c              | 9 ++-------
>  33 files changed, 83 insertions(+), 19 deletions(-)
>=20
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c index f2e6c6cd1..9319558db
> 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -28,7 +28,7 @@
>   * Description: Basic sanity check of DRM's range manager (struct drm_mm=
)
>   * Feature: mapping
>   * Category: Infrastructure
> - * Functionality: DRM memory mangemnt
> + * Functionality: DRM
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   * Run type: FULL
> diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c index
> 20aff600d..91cda5bdc 100644
> --- a/tests/intel/gem_close.c
> +++ b/tests/intel/gem_close.c
> @@ -31,7 +31,7 @@
>   * Feature: mapping
>   * Functionality: driver handler
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c index
> 2c7781d06..f9bd86785 100644
> --- a/tests/intel/gem_cs_tlb.c
> +++ b/tests/intel/gem_cs_tlb.c
> @@ -57,9 +57,9 @@
>   * Category: Infrastructure
>   * Description: Check whether we correctly invalidate the cs tlb.
>   * Feature: mapping
> - * Functionality: command submission
> + * Functionality: tlb
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.=
c index
> 155aa6516..760e0a4ac 100644
> --- a/tests/intel/gem_gtt_cpu_tlb.c
> +++ b/tests/intel/gem_gtt_cpu_tlb.c
> @@ -47,6 +47,9 @@
>   * TEST: gem gtt cpu tlb
>   * Description: Check whether gtt tlbs for cpu access are correctly inva=
lidated.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: mmap
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c index
> 1227c7633..247b31da5 100644
> --- a/tests/intel/gem_gtt_hog.c
> +++ b/tests/intel/gem_gtt_hog.c
> @@ -44,6 +44,9 @@
>  #include "igt.h"
>  /**
>   * TEST: gem gtt hog
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: gtt
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c in=
dex
> c85c359a0..6cc34ce87 100644
> --- a/tests/intel/gem_gtt_speed.c
> +++ b/tests/intel/gem_gtt_speed.c
> @@ -44,6 +44,9 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem gtt speed
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: gtt
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
> index a3ca2c861..1574bbb9f 100644
> --- a/tests/intel/gem_lmem_evict.c
> +++ b/tests/intel/gem_lmem_evict.c
> @@ -11,6 +11,9 @@
>   * TEST: gem lmem evict
>   * Description: Force tiny lmem size for easily testing eviction scenari=
os.
>   * Feature: local_memory
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: local memory eviction
>   * Run type: FULL
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_lmem_swapping.c
> b/tests/intel/gem_lmem_swapping.c index 451d55423..d38a04673 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -30,7 +30,7 @@
>   * Description: Exercise local memory swapping.
>   * Feature: local_memory
>   * Functionality: buffer management
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c index
> b443d16ae..c8aa71c1b 100644
> --- a/tests/intel/gem_madvise.c
> +++ b/tests/intel/gem_madvise.c
> @@ -44,7 +44,7 @@
>   * Description: Checks that the kernel reports EFAULT when trying to use
> purged bo.
>   * Feature: caching, mapping
>   * Functionality: buffer management
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c index
> a7c5f0bce..c64c8f52a 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -42,6 +42,9 @@
>   * TEST: gem mmap
>   * Description: Basic MMAP IOCTL tests for memory regions.
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: mmap
>   * Run type: FULL
>   *
>   * SUBTEST: bad-object
> diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c inde=
x
> 9aecd08ce..8d04188f7 100644
> --- a/tests/intel/gem_mmap_gtt.c
> +++ b/tests/intel/gem_mmap_gtt.c
> @@ -50,6 +50,9 @@
>   * TEST: gem mmap gtt
>   * Description: Ensure that all operations around MMAP_GTT ioctl works.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: map gtt
>   * Run type: FULL
>   *
>   * SUBTEST: bad-object
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.=
c
> index b069b80f6..b1134afb4 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -42,7 +42,7 @@
>   * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
>   * Category: Infrastructure
>   * Feature: mapping
> - * Functionality: mapping
> + * Functionality: mmap
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   * Run type: FULL
> diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c index
> a82d779f9..766ee61fc 100644
> --- a/tests/intel/gem_mmap_wc.c
> +++ b/tests/intel/gem_mmap_wc.c
> @@ -42,6 +42,9 @@
>  /**
>   * TEST: gem mmap wc
>   * Feature: caching, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST: bad-object
> diff --git a/tests/intel/gem_read_read_speed.c
> b/tests/intel/gem_read_read_speed.c
> index 95ef47da6..dde021f22 100644
> --- a/tests/intel/gem_read_read_speed.c
> +++ b/tests/intel/gem_read_read_speed.c
> @@ -45,6 +45,9 @@
>  /**
>   * TEST: gem read read speed
>   * Description: Test speed of concurrent reads between engines.
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: read/write memory
>   * Run type: FULL
>   *
>   * SUBTEST: read-read-1024x1024
> diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c in=
dex
> 864a2d8d8..545e97f17 100644
> --- a/tests/intel/gem_readwrite.c
> +++ b/tests/intel/gem_readwrite.c
> @@ -41,6 +41,9 @@
>  /**
>   * TEST: gem readwrite
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: read/write memory
>   * Run type: FULL
>   *
>   * SUBTEST: beyond-EOB
> diff --git a/tests/intel/gem_set_tiling_vs_gtt.c
> b/tests/intel/gem_set_tiling_vs_gtt.c
> index 4a7ecdc88..7e5dab1fa 100644
> --- a/tests/intel/gem_set_tiling_vs_gtt.c
> +++ b/tests/intel/gem_set_tiling_vs_gtt.c
> @@ -42,6 +42,9 @@
>   * TEST: gem set tiling vs gtt
>   * Description: Check set_tiling vs gtt mmap coherency.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling vs gtt coherency
>   * Run type: FULL

For some tests, there is a Test category and for some it is not present is =
that expected?
For Example, see above it doesn't have the Test category. Can you please lo=
ok into it?
--Priyanka

>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c
> b/tests/intel/gem_set_tiling_vs_pwrite.c
> index ede0c58b6..a358ddba6 100644
> --- a/tests/intel/gem_set_tiling_vs_pwrite.c
> +++ b/tests/intel/gem_set_tiling_vs_pwrite.c
> @@ -42,6 +42,9 @@
>   * TEST: gem set tiling vs pwrite
>   * Description: Check set_tiling vs pwrite coherency.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling vs pwrite coherency
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_streaming_writes.c
> b/tests/intel/gem_streaming_writes.c
> index fc2d3d89f..dd2f28331 100644
> --- a/tests/intel/gem_streaming_writes.c
> +++ b/tests/intel/gem_streaming_writes.c
> @@ -43,6 +43,9 @@
>  /**
>   * TEST: gem streaming writes
>   * Description: Test of streaming writes into active GPU sources
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: barrier
>   * Run type: FULL
>   *
>   * SUBTEST: batch-cpu
> diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.=
c index
> 27971a2b9..ec6e88477 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -58,6 +58,9 @@
>   * TEST: gem tiled blits
>   * Description: Test doing many tiled blits, with a working set larger t=
han the
> aperture size.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled blits
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_tiled_fence_blits.c
> b/tests/intel/gem_tiled_fence_blits.c
> index c536c3699..920eeb42d 100644
> --- a/tests/intel/gem_tiled_fence_blits.c
> +++ b/tests/intel/gem_tiled_fence_blits.c
> @@ -51,6 +51,9 @@
>   *   Tests fence management problems related to tiled blits by performin=
g
> many blits on tiled
>   *   buffer objects with fences enabled and with working set larger than=
 the
> aperture size.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled blits
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c
> b/tests/intel/gem_tiled_partial_pwrite_pread.c
> index d4f66d51e..c4686739e 100644
> --- a/tests/intel/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
> @@ -42,6 +42,9 @@
>   * TEST: gem tiled partial pwrite pread
>   * Description: Test pwrite/pread consistency when touching partial
> cachelines.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST: reads
> diff --git a/tests/intel/gem_tiled_pread_basic.c
> b/tests/intel/gem_tiled_pread_basic.c
> index a2253b51e..13181d86c 100644
> --- a/tests/intel/gem_tiled_pread_basic.c
> +++ b/tests/intel/gem_tiled_pread_basic.c
> @@ -52,6 +52,9 @@
>   * TEST: gem tiled pread basic
>   * Description: Test pread behavior on tiled objects with respect to the
> reported swizzling value.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: BAT
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_pread_pwrite.c
> b/tests/intel/gem_tiled_pread_pwrite.c
> index 2f0f6f547..f8bc79731 100644
> --- a/tests/intel/gem_tiled_pread_pwrite.c
> +++ b/tests/intel/gem_tiled_pread_pwrite.c
> @@ -62,6 +62,9 @@
>   * TEST: gem tiled pread pwrite
>   * Description: Test swizzling by testing pwrite does the inverse of pre=
ad.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_swapping.c
> b/tests/intel/gem_tiled_swapping.c
> index 90ce70bdb..13f9fb41f 100644
> --- a/tests/intel/gem_tiled_swapping.c
> +++ b/tests/intel/gem_tiled_swapping.c
> @@ -62,6 +62,9 @@
>   * TEST: gem tiled swapping
>   * Description: Exercise swizzle code for swapping.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: swapping
>   * Run type: FULL
>   *
>   * SUBTEST: non-threaded
> diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c inde=
x
> 6a8b79ecc..ee17b587d 100644
> --- a/tests/intel/gem_tiled_wb.c
> +++ b/tests/intel/gem_tiled_wb.c
> @@ -51,6 +51,9 @@
>   *   This is a test of write-combining mmap's behavior on tiled objects =
with
> respect to the reported
>   *   swizzling value.
>   * Feature: caching, gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c inde=
x
> 1994453b3..356b48829 100644
> --- a/tests/intel/gem_tiled_wc.c
> +++ b/tests/intel/gem_tiled_wc.c
> @@ -48,6 +48,9 @@
>  /**
>   * TEST: gem tiled wc
>   * Feature: caching, gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiling_max_stride.c
> b/tests/intel/gem_tiling_max_stride.c
> index 5943ed93f..93b89b00e 100644
> --- a/tests/intel/gem_tiling_max_stride.c
> +++ b/tests/intel/gem_tiling_max_stride.c
> @@ -43,6 +43,9 @@
>   * TEST: gem tiling max stride
>   * Description: Check that max fence stride works.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_unfence_active_buffers.c
> b/tests/intel/gem_unfence_active_buffers.c
> index d3bc1cee6..aaa841f46 100644
> --- a/tests/intel/gem_unfence_active_buffers.c
> +++ b/tests/intel/gem_unfence_active_buffers.c
> @@ -56,6 +56,9 @@
>   * TEST: gem unfence active buffers
>   * Description: Check for use-after-free in the fence stealing code.
>   * Feature: synchronization
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c =
index
> 14c17b030..e1dc54cc5 100644
> --- a/tests/intel/i915_fb_tiling.c
> +++ b/tests/intel/i915_fb_tiling.c
> @@ -27,6 +27,9 @@
>   * TEST: i915 fb tiling
>   * Description: Object tiling must be fixed after framebuffer creation.
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c index
> 90d79864f..79f5922a9 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -33,7 +33,7 @@
>   * Feature: prime
>   * Functionality: buffer management
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: after
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c index
> 25b2939e9..e0735496a 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -54,9 +54,9 @@
>   * TEST: prime mmap
>   * Category: Infrastructure
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime mmap
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: test_aperture_limit
> diff --git a/tests/intel/prime_mmap_coherency.c
> b/tests/intel/prime_mmap_coherency.c
> index 01eb2002d..61bc5d312 100644
> --- a/tests/intel/prime_mmap_coherency.c
> +++ b/tests/intel/prime_mmap_coherency.c
> @@ -38,9 +38,9 @@
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bu=
gs
> so we know for sure where
>   *   we need the sync ioctls.
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime mmap
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: ioctl-errors
> diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_imp=
ort.c
> index 2dbf4e20f..e1dcebfd8 100644
> --- a/tests/intel/prime_self_import.c
> +++ b/tests/intel/prime_self_import.c
> @@ -51,32 +51,27 @@
>   * Description: Check whether prime import/export works on the same
> device... but with different fds.
>   * Feature: prime
>   * Functionality: buffer management
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
> + * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-bad
>   * Description: Check dmabuf llseek support with invalid values.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-size
>   * Description: Check dmabuf llseek support.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_fd_dup
>   * Description: Check prime export with duplicate fd.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo
>   * Description: Check prime import/export with one buffer object.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo_two_files
>   * Description: Check prime/flink with one buffer object.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_two_bos
>   * Description: Check prime import/export with two buffer objects.
> - * Run type: BAT
>   *
>   * SUBTEST: export-vs-gem_close-race
>   * Description: Check race of gem close against prime export.
> --
> 2.34.1

