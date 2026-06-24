Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31335CDB47C
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 10:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F88710EE96;
	Wed, 24 Jun 2026 10:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N53hrPI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E031610EE8F
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782298209; x=1813834209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mddttqS2dhW94pR/DivSTbjUZY23Td8ltzUzBHNQpog=;
 b=N53hrPI9U9iV8esbF/D47CZitXnCoqjBY9nm6Fy5003BT/kXbcutdC/M
 9nvLGdifWABn5CjdpRKBw+qiio+7CPsWUjERYZMkvi90f+wyB76gyhuEL
 efVYAihDs9ttWrDgNTVwtK1fHRburrefYErlXQZRCCO8BP2wGw/2gkV8k
 b1lLVfBEdnoSgoeEb55T6UwzfiPCOxhJBFfvbMeVa0V6hQrASML3E04xu
 /9MEswfT5wG56liaQGDFWuuhWwlbCtFfFed7mRagCc7r2pN9DvOdAYxLS
 V9BHi6VgKXH7kXAlSclWTZDrxaWhvqftCQ/iyaWj/83zTFFCngGdq7EvS Q==;
X-CSE-ConnectionGUID: XodvuG9JQGyB/r3v8DnD/w==
X-CSE-MsgGUID: 3/7WIX8KQW2VeNELPDWs8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94171884"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="94171884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 03:50:09 -0700
X-CSE-ConnectionGUID: lT3AxPNLRkCVNTlus9FTSg==
X-CSE-MsgGUID: 07aAtfFtQG21Gwl8Q0OKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="273495993"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 03:50:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 03:50:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 03:50:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 03:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0gFy3sNlEWDRkHtxNERM8Mny2PdpYzX5+TUve5I73i0J1JGoMji+jbyXkn7bjEggy7neYKZnBuWE3OV/U2vbRPU7uzbST6n1ZRn/0mBpv7QIAGwMVRKk8v8wO6IQF1Eb6H4jxKpOFw+b3yje5oGKuKP4Jvnp0iscOnIc8MV5iU3SuyhZ5CwLMxUIpBUUjIk4NrZiZl0pmoJB5aIgbsB5pLz9wFAyPMwS0edAqEogv/eaKIbZC8XEdly2oYkdTvh8gkohpB/3XsDImC+QW9UO2GHK2Viab+ZArYIqwko3de3s14LHKgMlUwAfLj4/7BnrlK1JFXo09gVn6Nq6NlwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DJS/5AoyG8DR32ViieogTovOJEbbLhgklrw/AEShk0=;
 b=ljuhc7Vrlv0Dhu/nMAId8hovIaMdI038phkmLUNpvIpJFU/CpXUDJx5HSdGNNvxTTJ5CLEJA6GhhPVba3k2MilnCEK/nFYefr9tEoox3LC24KS1bFDnssn2EAE/3Zvi7A2gheAQw298V+ljpTOWze4eK0XNm2AA/o/LkOrp7YS/GdfQPr8nNZ6pBffbyAkqblV0i3Q28hv5NQkI/ZzbxPaJAMxe0FU0wSwbJfBoOnlo7hbjlMBAQFgT+Q5aYqwhj5/kx+nDbS1UvEs06hTucK+wXHFwwQMssA/aNYCUtmgMd5AnWtLJlEWdG+vVYgoTXEcro9wb7Yfaldu9iPn/Clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by DM3PPF341F90799.namprd11.prod.outlook.com (2603:10b6:f:fc00::f19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Wed, 24 Jun
 2026 10:50:05 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:50:05 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Ramadeva, Dwarakanath" <dwarakanath.ramadeva@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Revive atomic tests
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Revive atomic tests
Thread-Index: AQHdA6GznbwtctsDNEW9/OS5dbfVg7ZNgZwQ
Date: Wed, 24 Jun 2026 10:50:05 +0000
Message-ID: <SN7PR11MB748913DE425725FFC3C3539D85ED2@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20260624062022.34659-2-gajendra.uttamchand@intel.com>
In-Reply-To: <20260624062022.34659-2-gajendra.uttamchand@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|DM3PPF341F90799:EE_
x-ms-office365-filtering-correlation-id: c7eb09b8-72b8-43b4-e7ee-08ded1de59be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|10070799003|376014|11063799006|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: P6+o/gviD9/ihA4iGnkCYQ+KMYGOynMy6mKcclwU7FZkVgaCRVkr1V3r7NjHJTa1iHhajnLFQzTgeLTDurP6hpNHPRxwg7/Ad3Dp8odh5zBuPJnMSDOnwOKdthE+sPN7SvfTAhnsrFVOdvGXXOD/o22ciazbGP81AnQlY5V/mELkAb9+lHvPWcG6qt65TLbhYqy584m3K8N31qcAjnIGH1awVX1uggwUBKmA5Y3i/eIFWnyA+vReWvIO88aVjiYW9orpTq8lHlOb2598GcoFq7LFbqC0mKIVfBhsR7i2HPeHJCogbf03I9WchToFTgQx3KeqjkbxnY9QKSeZH1fdGzLmfnHjaSWyQL5FIZU+27zgqCOuY+NksId7gyZbZxVCMdknCWXX+z7TP6ssMJIwxJ+8mDNtSMJ+Kl/zHAGD3DgAhhLx5O9oiyaM58uR+vyognw8mBsFoBeOT/BASLL7aneb5Acv4kc8l5b8XQvR0YKva0wzOG0ZUX9+U4K+oCUX4ZYXz/72vankNQ9e9vAW4Yf5b5bIP0Q96n6FlFodXoc+nRSF3Lc0KpSFe/89tBpwjPTebrqgdqxFwwPetKRA/V9IaPRpbIdYFSBB8bvEYsdXbjBXva1SD2Ti8mwQO0ye7rAcQmhvMUKIwojNrc+LCaIaanE/RehPT1A1Vwzy/wSxs8nBFMNVX7DcTBM2gOiIiWxhTpw3FqvuxHch5j/FrW+4lgDwxbX04pHmqRqKq98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(376014)(11063799006)(56012099006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kJZBAKEM3XWyqsndel/az/AreBJYwVsEaDTYLhobVAaAr5HeGbu+b1S2ed+T?=
 =?us-ascii?Q?EVihxXPSFw8u07kT9NOzVBex5mV0+xlaVRS0ZxL2MszBMqMoGBg4GvhHKQVb?=
 =?us-ascii?Q?jDlETEYFChhIeAL5WFBEbnMHZWm17pmtmssjct3YdgBuu9ZFl6SvS001ed0i?=
 =?us-ascii?Q?6sFdhOebPGVSyxAhCZU2mMf6AhZpolkXGh8a0mJkPF/24rOJ2iIa/pzuR0Jo?=
 =?us-ascii?Q?zpa4YRPIz2E1yeHyABMi1ZpcPaiOLWMrpy5Q+UueNvPZ4zqXm7XylDo9c9/m?=
 =?us-ascii?Q?aDabknKi1c+aJz78Myotv8NdM+ONyrcAqp05kiA7XcGmTbEAQ/vkNQ5Ov6FJ?=
 =?us-ascii?Q?1AEDJHT6VnxL1JB+7OR+918X/pNxoti79251XctjC4FunESkYrFIblkFh7X5?=
 =?us-ascii?Q?7sbiM6qROurUBlBlhs2ZRmQA3P6R4/SA4F8A2UFCFbtb6hRZrJr/h8Keyp1R?=
 =?us-ascii?Q?VMlti+JfwiXaalc15ragDLZesrn5BCIgzSDXxgMdCJ3JuXuc0ai4ttkpsj+d?=
 =?us-ascii?Q?0CltIw63DlF1bYSeVfLWIInIoBYr5/eomwIN0WfYN7Rr7B7MfPra5F39VF1u?=
 =?us-ascii?Q?HyJrzkT3lBjBghEFkDtcGqCj+/ts2CjZKcX26zGRJel3Xl95vVauLS7dZWSV?=
 =?us-ascii?Q?9NYvqVtpCSXRV+yHrdVuXm4DFw6aMggnmyrvysT8A5Cybbx7+QYoR/uPXdIM?=
 =?us-ascii?Q?xJVmgBCIOSqNqJxNBXC89pPvTXIi2+rXI2/1s0kkmQWwDd1YGANXYhoTJGyF?=
 =?us-ascii?Q?RrLwYVsZim+PdYvCOo1TNDR6YHw4FIllJchAIOBrTFyOPgcuNhRWK2rBoGWR?=
 =?us-ascii?Q?otSxb9w34M6b6f2Sy2XYSP8HsMRi5riXg9xYSsTdJlZ8cu/7s+fxsxyYQOi0?=
 =?us-ascii?Q?wKM6XfrzweYOUnbGMT50oW6ILHG9Bl65CfJCOC5vYhzLjMXxrcaB+P6FKFFI?=
 =?us-ascii?Q?fhLVuDeI/R3l2HpAgtIvc/2l5p3w74EbCCNuo6wr4rcx9mBDu3wpfthyVPYx?=
 =?us-ascii?Q?LHmjgR9zn2tFWj8wsPLIL7eC4JJFn3VCvrzOBvTMwVRRi/sYVPEJ1bUW05TM?=
 =?us-ascii?Q?uv659W10b8R6R4FPN76pM5u5p6rvaErVYjPb/jxrtFvBQqL6DA70njsQOkOJ?=
 =?us-ascii?Q?CNT0oU9rkVjckTuIIgEgFRvNHvbgo7+9Y/AlBGpDpMBqZkyj2DkxOtramoTx?=
 =?us-ascii?Q?13eyce1TKp8BiIPv/lYZLYFBEnNeOEE07jU9UOcSdFgbSf/31C9xKLA0sg7G?=
 =?us-ascii?Q?v8h3x0NxbzpST3HZQgxKTu6Fcr0Ef1oGvf7udZBHLLZF5o39KGxelmHFAy7S?=
 =?us-ascii?Q?JBIJGQoEiLmHOSZc9wCdc3gr819J3Mkt9A/surlfa5zEVKbZsWdQDhkeeKyS?=
 =?us-ascii?Q?MOdnR+8md8a73hl4a4+uexMEewcdQb3O2gqP1GGTFeXe/zZN5DJFky3PzMwR?=
 =?us-ascii?Q?k37qGKu+s2TRXkJhMm2K23Z+m9D9XjSRAvP3yeDhssh1gsyIVocY81vOl9B1?=
 =?us-ascii?Q?vcVNfYy5W4Mr/ekhFBvrfItgn0LzoBpOrwXh8taBHT5k8AXl1DU6hZTtCqOd?=
 =?us-ascii?Q?qgzoj4PIa3Ygou1eveXMrQwRcivUF6tP5bxJWQYiICFc67cMQf/REIsyW00r?=
 =?us-ascii?Q?o7lvvhNis8XC1hkqW8D9MG0v7EyVRZ1FAHshfs6QcK6ZgIf7P2KEflPGXlWv?=
 =?us-ascii?Q?RJQGsy02FAezNq7Mivz3/uhmY4zVfPNC+pctA5qdwMHt/gYggEkkzCIo+YCk?=
 =?us-ascii?Q?02fL/VIzq98xZRPj733TGKCvAbiE4NuVucGQNTsPnIm1jCOlPQSlbyuhVLbs?=
x-ms-exchange-antispam-messagedata-1: Mrp99wTUIUFy8g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QgL6vK4G5reRUPeavqrY0Nt1d3J2stFQDiF8AYzDXu7lcEWivKVpj6NSq51ohuWn754W4kG3m7XcZwCUNREjGXydeRRlMw6MVBKs0tw/0W8FiFy5HcUGkFRBp8vfqTnpkRi+bcTQHhrrMfI+sqbiA4iRcX9817XebNYui9cIe8zqc4dSsZ2HshV/0Oq1B8yStLdTnPxJbXpT3Z6Vqvm7CKBLzRCxAMFBkMAplNvcy3Er864tbUrBkFO80eyi6b7mX1QWYzSV0VItyQwxvBTxT4OpgvIyMz5xPzHWUioAJA2yOd5k7FgST8QN9wNInuLy2uAri8P+PJibA/wBHjP2UQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eb09b8-72b8-43b4-e7ee-08ded1de59be
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 10:50:05.1470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGBvtALaKWKtvea7nzbaFIz4LbqD3Egz+yoDOFggLt62q+wmoY7j96+FINNL2XmNh9yZmd2fgvVDEzTrvZNSUoM71TbQav0wcuKTKZMfMEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF341F90799
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

Hi Gajendra

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Gajendra Uttamchand
> Sent: 24 June 2026 11:50
> To: igt-dev@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Ramadeva, Dwarakanath <dwarakanath.ramadeva@intel.com>; Oak Zeng
> <oak.zeng@intel.com>; Uttamchand, Gajendra
> <gajendra.uttamchand@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Revive atomic test=
s
>=20
> From: Oak Zeng <oak.zeng@intel.com>
>=20
> This partially reverts "drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic
> tests" ( commit 3557bb1215d5d57a4fbad50537272e96f37d71ce on
> upstream).
>=20
> We revive the atomic tests on igt with fixes
>     use xe_bb_size
>     calculate wait bo size separately
>     wait fences for none WAIT_ATOMIC cases.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 159 +++++++++++++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index 4649c67de..df836158a 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -36,6 +36,7 @@
>  #define INVALID_VA	(0x1 << 8)
>  #define ENABLE_SCRATCH  (0x1 << 9)
>  #define MULTI_QUEUE	(0x1 << 10)
> +#define WAIT_ATOMIC	(0x1 << 11)
>=20
>  /**
>   * SUBTEST: invalid-va
> @@ -438,6 +439,148 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> +#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
> +#define   MI_ATOMIC_ADD                 (0x7 << 8)
> +
> +/**
> + * SUBTEST: atomic-once
> + * Description: Run atomic fault mode test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-once-wait
> + * Description: Run atomic wait fault mode test once
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-many
> + * Description: Run atomic fault mode test many times
> + * Description: atomic many

This looks an extra description , this can be removed
=20
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-many-wait
> + * Description: Run atomic wait fault mode test many times
> + * Test category: functionality test
> + *
> + */
> +static void
> +test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
> +	    int n_atomic, unsigned int flags)
> +{
> +	uint32_t vm;
> +	uint64_t addr =3D 0x1a0000, addr_wait;
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +	          .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	uint32_t exec_queue;
> +	size_t bo_size, bo_wait_size;
> +	uint32_t bo, bo_wait;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +	} *data;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +	} *wait;
> +	uint32_t *ptr;
> +	int i, b, wait_idx =3D 0;
> +
> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	bo_size =3D sizeof(*data) * n_atomic;
> +	bo_size =3D xe_bb_size(fd, bo_size);
> +	bo_wait_size =3D sizeof(*wait) * (n_atomic > 4 ? n_atomic : 4);
> +	bo_wait_size =3D xe_bb_size(fd, bo_wait_size);
> +	addr_wait =3D addr + bo_size;
> +
> +	bo =3D xe_bo_create(fd, vm, bo_size,
> +			  all_memory_regions(fd),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo_wait =3D xe_bo_create(fd, vm, bo_wait_size,
> +			       vram_if_possible(fd, eci->gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +	wait =3D xe_bo_map(fd, bo_wait, bo_wait_size);
> +	ptr =3D &data[0].data;
> +	memset(data, 0, bo_size);
> +	memset(wait, 0, bo_wait_size);
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +
> +#define ONE_SEC 1000000000
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_wait_size,
> sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	for (i =3D 0; i < n_atomic; i++) {
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[0].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + sdi_offset;
> +
> +		b =3D 0;
> +		data[i].batch[b++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +		data[i].batch[b++] =3D sdi_addr;
> +		data[i].batch[b++] =3D sdi_addr >> 32;
> +		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +
> +		sync[0].addr =3D addr_wait +
> +			(char *)&wait[i].exec_sync - (char *)wait;
> +
> +		exec.exec_queue_id =3D exec_queue;
> +		exec.address =3D batch_addr;
> +		xe_exec(fd, &exec);
> +
> +		if (flags & WAIT_ATOMIC)
> +			xe_wait_ufence(fd, &wait[i].exec_sync,
> USER_FENCE_VALUE,
> +				       exec_queue, ONE_SEC);
> +		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
> +	}
> +
> +	if (!(flags & WAIT_ATOMIC)) {
> +		for (i =3D 0; i < n_atomic; i++) {
> +			xe_wait_ufence(fd, &wait[i].exec_sync,
> USER_FENCE_VALUE,
> +					exec_queue, ONE_SEC);
> +		}
> +	}
> +	igt_assert(*ptr =3D=3D n_atomic * 2);
> +
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	sync[0].addr =3D to_user_pointer(&wait[wait_idx].vm_sync);
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_wait_size, sync, 1);
> +	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE,
> 0,
> +		       ONE_SEC);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(data, bo_size);
> +	munmap(wait, bo_wait_size);
> +	gem_close(fd, bo);
> +	gem_close(fd, bo_wait);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  static void
>  test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flag=
s)  {
> @@ -589,6 +732,22 @@ int igt_main()
>  		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH |
> INVALID_VA);
>=20
> +	igt_subtest("atomic-once")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 1, 0);
> +
> +	igt_subtest("atomic-once-wait")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
> +
> +	igt_subtest("atomic-many")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 8, 0);
> +
> +	igt_subtest("atomic-many-wait")
> +		xe_for_each_engine(fd, hwe)
> +			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}

Rest, LGTM=20
Thanks
Nakshtra
> --
> 2.43.0

