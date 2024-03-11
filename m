Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677C3C54E60
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 14:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26100112AB3;
	Mon, 11 Mar 2024 14:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAArZFA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A447112AB6
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165983; x=1741701983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pg7m1DUZ8vEgdKBfSnyZmDFUhIyJ6dVwIoed53jgaao=;
 b=EAArZFA/YKhJ8/qNw2qVyipshnuuBqFOTp55S/WA/lxbqmNEKR+ZCMYB
 g2Uaaeh/jqAC62aj66nBuWdBRZmFzp64AjmP/2MxJjiM2Veyo3+JYgFRU
 6eLKPpRfHxuL7VjIQsIJeTnfYGghjHk0siRybhsLycYxC85Fl3/0ULJ+D
 VQiyo0PRV1ccbApm8BAQP94qwVDalwtGgu9AVBwXER4KxxKUl2ATvLuTV
 43eLmqJIByZ29PpyBM0mZV507XXlGHuiy7FY93WOakytuTPgRGIvwsr37
 DxL/U/quPmfV31cln4SG5su5KoHWNYE6F0E2Gs3fWG5e7Uc4Ieb8IJOmv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15390965"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15390965"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15816363"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 07:06:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 07:06:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 07:06:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 07:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC4E1IXfhSgmkjutOI5OomFPkMZVEBWtdtG2wUuJphF5yl3jX5Z9KLyZscSup0duWkU4u7VtEDn9urZsMzVgvRDIV75ANM56NLl/UGvZL/bRQOLNMdv0LSTnmBLOSwBLYOr5nCoQttXhQiIHOEe2LKTSCJ8DW48lXp59WFQYCWwiuV76sJ3yS4fqvSq96RswkC5/Ww2JUQ+SVq4NLkdtBKoTOY9LqxVEXjFo3N7dUMgRvVg/+eYWldXC7jrtjc/F2JCLXp8rXoWim3KlfgMK/iqpHOIiYeWjYTa5W33/4qMRc9ZQwuvoAVPLYjW4YLUWCru9WHIcDI5VqGRvUWadCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWPnkiV+fN2funsKsImd3tj7y33xSjuM0U3LsBjGPpM=;
 b=G+/r9yTG/dNsrkfI5gV5V9FgvDpeeIs/xUGFkuqQGSwBbgKurEzJTNgz1Fl93Lj9nBPBX9kQvNSsdl5ol2/2VRPXAs/vAqaFXtDulkRljEe8GxBOd2Amjwhy+Nnspwzk/jBNdCkjrQKofuPDb9m/VfJQJAUbHiLqWw23+C32sTFSSTfl7p05/gqMCfUqW8A0CJA22pq/qmTcFT5JShDGpK+Ayz+dFkQzvm8GY4yHPR4593lQTw0BPl1zYHXK/uNHFavv3kKlvr+puwzLCag1AmbIJmy/bpPhNrrCPY3EtyRZeSh/wwYhK/ZHJ8ma6yjVs55SpA4TPZUUJ9oAAe+yxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 14:06:09 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::d6b:6160:8399:11d1]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::d6b:6160:8399:11d1%3]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 14:06:08 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Topic: [PATCH i-g-t v2 02/25] tests/intel: Introduce Memory management
 subcategory
Thread-Index: AQHacTPm/vAgbSsf3k2NmbxqXnnP/rEyl/Fw
Date: Mon, 11 Mar 2024 14:06:08 +0000
Message-ID: <SA1PR11MB8428D7D83449B9C0A0B3A0008D242@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-3-katarzyna.piecielska@intel.com>
In-Reply-To: <20240308083657.1092049-3-katarzyna.piecielska@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|SN7PR11MB6725:EE_
x-ms-office365-filtering-correlation-id: 65cc167e-037f-4cb9-273a-08dc41d4668c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLg8aXiOqv6ayt+huFGTYyOg5YFp0wtEffRYCE4lmnm1LzjgwUE9L3x84/fyQUKcb6CRD7bFLyK8UIucVkaGInLMb5Qu8OLid4uqCbcY4mOnJ+aH4f1xNNVG4AsS9yBxbVPCYYdSifQjar/o1c9mPiTH7fcNpkTnWBD9r5HAno98YJtXOqTQjTx0iIUGmTC6ifTyykjC2UhQ3lsIe4ngAGNVsWoQ48Z9s00+fdLzpP54lqXE9YtUzNBpjMP+X5TGZAGPRd7VehfnlYUKNXmPaqoLiM/bZGEGOdI/iljygN2uRMl0GbzxtUbLjnJoQILIKL44lxCGdgmsex8K4+47Ge8p6p4bBQ15VNL8XaSPqEfvf/+z4ukGaQWkt+hVDzGlG/b+WZoVu9ihuGvtJViUETlXf178+GXIZ4SMwx9nUETTsjx+Lga8eq/CfMiqsI26l1IQKAQtA2Coj52+fWjyxppBvhwgcKSpNBwBSpu5iqKn8jdMZunxaT3n4VoL86MBNA2VXMvPwv6P5Cpv/xtGyaXekxr4/yYE7zqA1CfZZhwPbmcKtdBMK2bZk5pma/PFIZVYsKI8zebGJOwmALyaIjQvZy/1nNEg7tvyz2yOP+C89P3tetGKOxZT6MK0eBjr6cOn/1PwugHyniuXvMntW+GzeRo4ebpnoGVmsRsXKe3ns9st0l4NzioX303kP7jIlFSUKNg5C2N6p3DWfHOsqBzn6qudGWdXDae+6b16YH8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RuOkzufW+aUHRR062CQxDbvfSzFZg9QXDK8TYtjF+Q8cMKepFyO4vaIyqlvp?=
 =?us-ascii?Q?aoUuFWRPGWaUUkQ264/v+MqRuIhhgSvrVQuTq9CX2IopLCi8eidLN/25oMSQ?=
 =?us-ascii?Q?5aX9e6vVSVIG43C6y+5dgexwjNdKyQQB7txH3JFQbkfW0kRkngzjZSUEb9Iz?=
 =?us-ascii?Q?/r/nAthZzvyr2zjXdqdim1M0XnyS1hOAENphpi1wn/Mb+aApjW6m2yC/uOqY?=
 =?us-ascii?Q?7Pt0FzjWQGkAytU88WWMaTiXLRmR5nrBBPFlfIEKg0xtsJG8KpsyikT19Ebr?=
 =?us-ascii?Q?fYKu79tNjVlQl3pTTdfvdplDDZM5cRhv5rE0B0KjPpK+o+zDOh5AlLmIBgGq?=
 =?us-ascii?Q?cXK/V3Oo2eogXpax3DEYblT0qr3p0kSC15txOnV076mN0pCr4MLkI8GxJeWW?=
 =?us-ascii?Q?Fr7ZUL+XZuTGYZBslAjQOWcjB+u+HunJnpBwL1AyciBejajBLKW7Zlo/xCKV?=
 =?us-ascii?Q?TnkBbSLvT/CC5P9aE1KEPzhDHRQVZaCI1lDxbZUsRJM0mlm771qSLvutQUaw?=
 =?us-ascii?Q?91O4HRfcBUrJUzKMTu16LJfkHeVE5Dn5B1R1CPn6qSnFTjIRnSg+gxfJPJbA?=
 =?us-ascii?Q?uC4Joes7NQ45GumUuIzZMIQJYaBPQIw4/hhBJJbNHa881JnJ8rBMcADtyKMj?=
 =?us-ascii?Q?6OIPGvsNlrDd2dc2blLF1crNM0+yZtVCOUBoYSuCzvofvc/BNTNWT3m7K0Wr?=
 =?us-ascii?Q?Oy6Ad/Q2yp99CBix4EsWrCLSW1Ci2m3Vsd8rAtF9MdUnrt3bA4cG2CF3kvJx?=
 =?us-ascii?Q?+/8Vyyw1bx3NYd2X3iJgUnmIS+UHiEX9dvJj9Cwc3uN4A55QzOOW1PykGsEa?=
 =?us-ascii?Q?pUpOiNfx63FxDa61nKI6tjI8OPBQRAaQXU3SM11AiE5Q70bqSz6Qfpd6edFk?=
 =?us-ascii?Q?v+UQcRC2hI4r/LxTSmqshU4BBDInEG6tDB14VVOMJZ8QJ+cZi1A80QNsiVCG?=
 =?us-ascii?Q?GKqSJwUa3nDfJbK1TBl384dCyO3vgn1QqWdBUZxonKRhRVcpoLwrVak1MEKr?=
 =?us-ascii?Q?xKG9ZgfrynSwcnStNOoIEUSmDttTiJ17MtG6WySL64bip4TtHuLT19t/wngt?=
 =?us-ascii?Q?NDJtFn7wVW2KGtY+bew08rS7pLCys37y+rmbPuAXJgTlmSwJxhGfloCKeqs0?=
 =?us-ascii?Q?woZKPf4jgLdVa240YeR7GkOQLGc4EPZlIP8SW1nkGIJ388VD8raDxSUHQQpy?=
 =?us-ascii?Q?k7nHgz5DnAcxFiJ3zOffrXv40PMYVEe7hSqhjHFevsQQ18dgUlT6/c5U87ls?=
 =?us-ascii?Q?d6TGUyVbjWRhAwQZC1GhWPqnViy7qoBUssi27op5odZ+GgsJYFiJ0SzbraTO?=
 =?us-ascii?Q?Qx9tIicotfiVLr9EnKxpIKa+546+9V9YhL6RnxLbaJuQhxO+Hyn/+ICUKBQE?=
 =?us-ascii?Q?JiFn7ncIjqcbvqbMBuOhjhNVoemFCE+clhJGD2qJgdOnzN30Q9QTXQhuB3I1?=
 =?us-ascii?Q?pu9cczmPtbRn+cbjnsaRHGUC+P7hOEQ6Lk9+Tqet5gSy5j1QUiKAViQfoez2?=
 =?us-ascii?Q?6CRziaVxakqpHN2IqukkkzbiGuRM9BPpFg80hMpOoOllUfXkADarmq8DRIsp?=
 =?us-ascii?Q?LQbGnOiihOiHcQcz4DZ1q2/d7cJ3vmeoHGIAeoZF5+dRiT/PiEMHMxZTPs5k?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cc167e-037f-4cb9-273a-08dc41d4668c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 14:06:08.8504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rOqW2hbinCHxXi2qrw/wTit3l6Qv7jR5Pi6R5BTFCfTepnriU89T9j7rRSNVESV/7rF7/VAVnfSAIoJLdPfOO6xEvMA2fc32WehmK/m5Y6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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
> Sent: Friday, March 8, 2024 2:07 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Wilson, Chris=
 P
> <chris.p.wilson@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>; Mauro Carvalho Chehab
> <mauro.chehab@linux.intel.com>
> Subject: [PATCH i-g-t v2 02/25] tests/intel: Introduce Memory management
> subcategory
>=20
> Let's add Memory management subcategory for tests that are validating
> memory.
>=20
> Change subcategory s/i915/Memory management/ for tests:
>  - gem_lmem_swapping.c
>  - gem_madvise.c
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
>  32 files changed, 82 insertions(+), 18 deletions(-)
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
> 155aa6516..9d9068d31 100644
> --- a/tests/intel/gem_gtt_cpu_tlb.c
> +++ b/tests/intel/gem_gtt_cpu_tlb.c
> @@ -47,6 +47,9 @@
>   * TEST: gem gtt cpu tlb
>   * Description: Check whether gtt tlbs for cpu access are correctly inva=
lidated.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: mapping
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
> a7c5f0bce..5cb8282b0 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -42,6 +42,9 @@
>   * TEST: gem mmap
>   * Description: Basic MMAP IOCTL tests for memory regions.
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: mapping
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
> 25b2939e9..aee90ca23 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -54,9 +54,9 @@
>   * TEST: prime mmap
>   * Category: Infrastructure
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: test_aperture_limit
> diff --git a/tests/intel/prime_mmap_coherency.c
> b/tests/intel/prime_mmap_coherency.c
> index 01eb2002d..bca46d9e8 100644
> --- a/tests/intel/prime_mmap_coherency.c
> +++ b/tests/intel/prime_mmap_coherency.c
> @@ -38,9 +38,9 @@
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bu=
gs
> so we know for sure where
>   *   we need the sync ioctls.
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime
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
LGTM
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

