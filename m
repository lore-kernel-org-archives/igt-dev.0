Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77BE606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RlqCOyov
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572D510E1B0;
	Fri, 30 Oct 2026 23:05:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F5410E1B0
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793401474; x=1824937474;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uSNkt7Xqq0MqNwaFK7hvPq6BMxbwPojfkDiRf9btI3o=;
 b=RlqCOyovL6gaPyp33FJ9JP+HEwXTGRmRR9otju+7q5Rg0HpOZfD82z8x
 TF7YKfL/3zAGfRXg1X6JubY2LxlZadfovW0ZrLFYHZF3tHOZLcsk2+eFu
 tFUtnIx0JotglZGzuiqjrrLPd8ZrUng/ULVdGNpT1uA6I5u4F9jwTwQmk
 loc970UGZfExxowYagZzSDMkTbeUrdR2idDYHpEWhwAUFFy02eh3XD7vM
 DuLKahlHBm8v43Cvgt8NxUuPw4VCuy46r9CQBzU0d0nf+RUyzLAdKlesW
 Q5qWEJWxN2BMgX3QRzjbZ2RQRMmV9/PQfCSWIJTDgQvd/yQsu8cltJxFj Q==;
X-CSE-ConnectionGUID: 8qdUoerPSsKwBGCAKquAYg==
X-CSE-MsgGUID: M2N42/trTGqSGuanVYaxyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2066450"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2066450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:04:28 -0700
X-CSE-ConnectionGUID: GauseE8GRoOU3KUn9//MSA==
X-CSE-MsgGUID: cMh2YXVNRTKcH85U08SgtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5878012"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:04:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 16:04:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 16:04:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 16:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+Bvn7GeybjyrusBjWYiuxn6w/5vb6zPe6ZlVqsHojvpVfzq0O6xeiY8Rz3XkZ4Z33Y0VBuzjJmLEuRqmHs8H9tICBRH/L+6xgmqiGcyUrML55qARzN208b8G0pHnx5M7Tma1EryrYrauIq3BvGAu+SwG90lr5rBNM5uWG8ayJlCuPZoZnbBJVuZGJW4u80j0hAWP2lP1OuQgVUrQKwjS0/nTprfw+DybkExckyEStpLQJRrsaP5ubTDLAHOLEqs74XB7Dc0W/VOFqrw6bBRuiM8CMHFxpgXrMRK9uxzzUCLGk576vrB+DdHV12mfcPdoEJ3+FpHxnChjzLosP0jvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfHupvXCHVWRzFlkfZiRLXY2rPs9RKHHZ+9HAQgnWnw=;
 b=d7AwXFnbJzWKvJlB092W/C20SMYogm1Kzn6Dwt7UpnmpHJH1hhIPIH9nt7lioq8HyWJVaqkkUl85e9L+HLs5XDQfsE9mzexUVRlzsPM5rCh1tmyx6qMFbh95yry9IKhXYfh2OWF9HSgSzhuJt057YPlceBWXBIAZFiUzCqCez3BKO+NJYP29b+3EkAtnx0T2r2yJwmQ6/q1+pTsamidAtKMoHXomLT8xoRtHeRiy9pey9kQP7MHlKg/KFMUpyEqegTqgs9Cz6bBRkaM5QmWgB8jzWGWZgxiQJw/DP1xztCP0ssMkQy+qPSwKO23iVIJuJAQKY42Fo3ixov6ztv/KDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 23:04:24 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 23:04:24 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <arvind.yadav@intel.com>
CC: <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Skip reserved PAT
 madvise indices
In-Reply-To: <20261029063620.1540187-1-nishit.sharma@intel.com>
References: <20261029063620.1540187-1-nishit.sharma@intel.com>
Date: Fri, 30 Oct 2026 20:04:19 -0300
Message-ID: <877biyu6x8.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DS4PR11MB131308:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cab8a6c-f3ea-4ea9-f0d2-08df36da23c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261009221227099003|261009221727099003|10067099003|261009220027099003|261009223027099003|261009223327099003|261028144727099003|261022105027099003|261026140227099003|261022075727099003|261021121427099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: PzXI3CAxhGN2B+o53k9BHAxCLLJ3NBo9rDCmjUcay7wCnMsc/2DnwRm2+415rgOtWJ8fP+FHFBDt36qquxduYPxF2jESkerU85tSZK+1Oj7Iuj4AC/uTfWCGUUvRkf3pr+oCD4+rAZ7EPRdLiYmWsRDkUZsz44a6opoKMhlrdqUfE3t6nTxu70pzsYjyR4NDH7+PDbrDJQEWU+pchLKBYYTzi359p26CNQ7TEiRVQmw98vWFCkhqawzh/pPg6rrhoI+IPIW/BL8RkubLXozI50A3SH+Li/618dM/eBBCr+gOr5NgrjcnWwCC4pkWeTCcRg6tnOZbgHsvru/A8K6d4ZgwntgUiPU1JKFPB4gj2QFNb5h7uQHlinqZQvido/5I7Ca9+2ieLQAmzNbRuN7qEyRhHb/vfxb3ZvXZGAAAyRT+zK08BH5PCZp9H6npjjYJq/siRUClp8CdDVSoqRdbVzAPc7kW+CWW3rWbLcdNAzKUqVSdLWLnzAFrSKe/o9OWRuX1elJ0bzN7gs2fDBGTF/w83Kek3BwC9ZWcs9jyhwk1qW5wUjO/QNaK+2NbYvw5x4lpcbsOYxpt4+A/VeB9bKPthCeO32quJYEroI+ijFQflzW8OLJQWDB54aeXSlRmBfRcpP6ijbZ14Kg6L5Igg/80yMZ9nQ8Nz3WaCh97tXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261009221227099003)(261009221727099003)(10067099003)(261009220027099003)(261009223027099003)(261009223327099003)(261028144727099003)(261022105027099003)(261026140227099003)(261022075727099003)(261021121427099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VGxLcl7Kq0rR0W/tgYq4/Ifb+zT3WynLL9DzuRxkEhoXWzwaoYxf540K7j8T?=
 =?us-ascii?Q?D2hNfkRp03iwi6t9geG1JPM9vlEgkMHpHFfCYBNkoIQevFPH6+LgRF8dyKAm?=
 =?us-ascii?Q?qXmdxdRAGWAdti59xJlBToNx7OiGDfoE/cuhYcw3mRn7RhEK7vOpzI3Vr1Q4?=
 =?us-ascii?Q?Ue+ZRebgw6ZXf+q+1PrnmI/Tt1LV0e3tMPinynIXpa9/bH/rVyGQ1u78Y1M/?=
 =?us-ascii?Q?5ox9WXr2VuKfrdsh//zEtRcAXsZvUeBYEi2dOTQOVM3uLd6tlz4iijNccLGs?=
 =?us-ascii?Q?go7wfVvCrcD/+GPjHrBwhCTlrsFrgpLnAgh8yl0HrVwQjxARyeMWvxHmPDeC?=
 =?us-ascii?Q?zHQiJl0ex/DuqpZR1G+pLTzVhxX02Taz+ZyGM6tDgUfuGAyefcjE3m0+s7r2?=
 =?us-ascii?Q?UGGT4BSKH9897qRhLiIEDKVIOO5NsDAFokw+WKbdgSWQHr9S0x6VVFOa/1/g?=
 =?us-ascii?Q?tMwuaqSjYD72hPRhp04NtkmCi9b0WjkX8ZvVjlOqFJnoIGFLO1X8IPiRaatu?=
 =?us-ascii?Q?JRUcZKwvasODG2p0O50Nxh/3dQLaeIpltyx4em5Eau/D94FYuPDRubacy2ry?=
 =?us-ascii?Q?W43hhOiuptfDbyp4QHA+/zSEPbjhPif7LXpqGNO/1ztR8Kob9DIc38p0vM+U?=
 =?us-ascii?Q?uwlH7WtUcTHC1VqztNUJPxc6cb6tkOETpouDZpesf8dvfOko10vj3rArW3vt?=
 =?us-ascii?Q?mHZyJWzzEdY5YrVhog2u8GX92GHr8kf9yDrQ/ysH6oPN0U66eu7QcS5woM0d?=
 =?us-ascii?Q?tOdet9ELqdbyxgKD2ICD1bhn/TxOTazvJyXkeOipTZ6oNITAwtiAOTVZGv5/?=
 =?us-ascii?Q?fK10Z6FEOcvO4eJ4kAbMUXgFAg5hIvkSjmNpshw1xQKW20g8GrJvx9bFW8nU?=
 =?us-ascii?Q?dEvEECRkXrggwMmi5Hl2cLXzoGCI09LrYeIsOyUsL2T3kqGSqGIQe3ocFqTJ?=
 =?us-ascii?Q?rUFspaqrO9HDm76+Wtg5D+0XyaQPTr6rw+XkrIdFoYOGAJO2xzo8vLquMhov?=
 =?us-ascii?Q?GmhGknbcz6SdOnDFf3XoVYQxsDLoZrbqd7oFa9bWmrZ9DPzSwdLmAuZTQflJ?=
 =?us-ascii?Q?1d3hKt3KVyThyjrJwoQGsitcZb/WiIHwm3aVeu/aYSZQgzwdG6/WCiqgnVdP?=
 =?us-ascii?Q?nNYKP4LiIc9ZJRFtappz7YW8oYE6/VmlZfvGHV28ood5zVis5N+ZpsU4O5N9?=
 =?us-ascii?Q?vwMSaUCPDc70Ub+LIpXnKm1HvDkV92pjlgp7OgTpR6KlRdUiqixIoU2kXyTU?=
 =?us-ascii?Q?DMdqBd4jqjPOkqrgU31JIKRmlxp9QkdPT85GYHR7AekQnV4QyjejDP+RnU3f?=
 =?us-ascii?Q?p4H5nP0yf2yx8bsEQ82XN28gjXHdJ0yXwq3to48izVvaZeMzHWcNHWYXE0q1?=
 =?us-ascii?Q?fSbvwXjAnA1kZsr/pgJ+Huc7zcpA3xlFSu4CpfgaaaGhlha6HdU0cLBu6aft?=
 =?us-ascii?Q?bxfZqPWbIiXFnXR9qCneQuEadAVAeNqNnqeBg9HdUqTMZgGIBmuKanxtcR+4?=
 =?us-ascii?Q?E0YMKwpNCcKJZHTjKYnNge5OerL88oCg0vMouEnnpa2jlh0NvgAgiJKs1V17?=
 =?us-ascii?Q?papNLfPR796pSFxfPTnNTEYPxBve9PJu1l28sOWoU3A33m7rjypAuDq7BDRG?=
 =?us-ascii?Q?/AWwg0eT0auersOvISj3dGGV/PnQYy/uFxYJe7o3rTF1QUCZ837lWR0TX/S4?=
 =?us-ascii?Q?QbebbZmIPpyAmqjZwDJSMwSWvpSGheZu5EjLSDA/aefI2quiwyNaUdrcUPup?=
 =?us-ascii?Q?3Ab1rcnviA=3D=3D?=
X-Exchange-RoutingPolicyChecked: f8jID61XxA4uFk7q5jh2lQRRaJHJbT5B/4B3i5WAv+70iIYvao5w+iRLd8EiDdV7q02paLOlOp+uDcj68kpKyfxBZS2JRZX9oyusfn9tkPdh1e3WxtVxGfSz/9BEACJf3sMTAFbAoFOUoYl+Sgh1d63O7DSAl2gj6AjAaH3Bg8W9eUl6YibJXcPM1aopOLTIV5fWEq4WGiuiYhLA9F0wH4v8YhMMxYPGymmViZcUMcgc1tD05ESk+u4OxCmB0+jj/zkWIUx9j5WezAmlXpzSuJ9720AnDKHn0CTSDUjNF8GMf7j2c0yB46abXxhCTScb5WRqgLbDev098dtmxgmwXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cab8a6c-f3ea-4ea9-f0d2-08df36da23c0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 23:04:24.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7OErESxC7OZb4kInZ9x0JrxgtPFwqOeJR4rw7AHwmdgNipEDWTuaC+MJLHawWmt15xlb07agwivVjE0cid2Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB131308
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

<nishit.sharma@intel.com> writes:

> From: Nishit Sharma <nishit.sharma@intel.com>
>
> With Wa_14026539277 active, KMD marks the 2-way-coherent PAT entries as
> reserved in the debugfs pat_sw_config dump and they must not be used.
> Skip the PAT-index madvise subtests when the selected PAT index is
> reserved instead of decoding the coherency bits of the PAT entry.
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 45ec62813..38e550896 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -26,6 +26,7 @@
>  #include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_wa.h"
>  #include <string.h>
>  
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> @@ -1216,6 +1217,24 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>  
> +static bool pat_idx_is_reserved(int fd, uint8_t pat_idx)
> +{
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t num_pat_entries;
> +
> +	if (!xe_wa(fd, "14026539277"))
> +		return false;
> +
> +	num_pat_entries = xe_get_pat_sw_config(fd, &pat_sw_config, 0);

We are parsing the PAT sw config debugfs node on each call to this
function here.

Maybe it would be better to parse just once?  We could call
xe_get_pat_sw_config() once outside this function and pass the pointer
to the struct intel_pat_cache as argument to pat_idx_is_reserved().

--
Gustavo Sousa

> +	igt_assert_f(num_pat_entries > 0,
> +		     "Couldn't get Xe PAT software configuration\n");
> +
> +	if (pat_idx >= num_pat_entries)
> +		return false;
> +
> +	return pat_sw_config.entries[pat_idx].rsvd;
> +}
> +
>  static void
>  xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  			  int mem_attr)
> @@ -2887,6 +2906,9 @@ int igt_main()
>  			if (IS_PONTEVECCHIO(dev_id) &&
>  			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
>  				igt_skip("Skipping compression-related PAT index on PVC\n");
> +
> +			igt_skip_on_f(pat_idx_is_reserved(fd, s->fn(fd)),
> +				      "PAT index reserved by Wa_14026539277\n");
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>  		}
> -- 
> 2.43.0
