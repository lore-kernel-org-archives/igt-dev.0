Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3801606B24B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lnu0j2EM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A7E10E6DB;
	Tue,  3 Nov 2026 15:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A251410E6DB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793718908; x=1825254908;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xtE0CVsq8h4KoFcGbTQtGSyAQeHv3IMOQL26Z/wgi1Y=;
 b=Lnu0j2EMVIw/QEPJNtOBZss4iEzoYfQyFbSJZo1wDmbxLFYSkM9SaZLB
 9cM7lr7Ej2oMS6sUbTcLmeFVXf5QN+6qs0zgF/pk4Z+nC5jcZpW+q9xnm
 5+1wC2/hn/X5f52qXSGaIENH6VDfDvfP8L/FwSg0liHyTos6IJW1tvzrj
 LzalE8Jn0zYQOITDUB8+FTsT+EKjXQj8Or1kRSCNasth5vOF9Yn9KFPhN
 u5VT/bhJFmH3Z3Ks+54Lz9aApME3ilvlucHfWKkgbeoonJqLF5HFkboRf
 6eJAmaOClZr1YKdjURGQpLySF2oJk0hRkyY4xuVPYaVXil2vT3DpknII3 g==;
X-CSE-ConnectionGUID: Ak0AVasDTxKOLvfshdz9EQ==
X-CSE-MsgGUID: bGqlsdg4QnuT0FakSeYi3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2340510"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2340510"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 07:15:08 -0800
X-CSE-ConnectionGUID: Ye+AZRLoRjaVPNLBDWOhlQ==
X-CSE-MsgGUID: rmrREikGRSuwm3OVDxnryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6532458"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 07:15:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 07:15:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 07:15:06 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 07:15:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkY17j0M7r0Vh1ehZcafBB5oDqkJ3B0dhHF4tFEZa9vxx84nY0btCygRh01VLcLscVusAP3+v/mfd1xJFgJpsk0WKTl41E4vvgE/ZaAMJs3/85Kro9UfjlaS9ukSYTWFeM/GGZXjAeO1maP30bnDdZCW5E9C8BLG14Wkh626DgqEE2n2k04+/nN3PuERDApp6QcrmYvrgptvIvQ55flpC+oueHNfQ91wqS5WgC3m4TZ0YcKQfckrfAs2PcHonGcO0IzQklTQmDU5gsdM/jFWsWooTgJxi6RJl5+iJ70stQQMzSBUa83n0rxvZT3d2NzTklLDbUb3nVfyicVPhY5CHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnyE5U3YaO6+d//oxHeWY80bbjL1B954VPGjILuzfLM=;
 b=TuO+9dTzlkcFe4P9biXuDFmZWKiHzP5hLsCWuckOJCpV6bHh1HvFsqrXTAvKRAllfBs/GsEXoLA39AfsiP3LKgqZplIx6n9Lan9takBals8RdUzvTMI24KMrKxE4XvXyiZl3a8aHubpCPbz889T+r4DmTE3yvHJ3Ul0ojgGh9qrAjmsArjMWuh5iWPqwJXz0DLZXeySQOi9vCRd2fUVjnqb+wyHvNG9HcvnMNvItRgEJe+g1Z1qJvC1BtqXuOGNS0CashonUZaocAspNw8xL1lllBORCvId9yYfrHZBbB2LRrWohPINNhhbBBOmCHyvfvOt96DJtX6oH5y3GirnIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:14:58 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:14:58 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <arvind.yadav@intel.com>
CC: <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Skip reserved PAT
 madvise indices
In-Reply-To: <20261102035218.1579371-1-nishit.sharma@intel.com>
References: <20261102035218.1579371-1-nishit.sharma@intel.com>
Date: Tue, 3 Nov 2026 12:14:54 -0300
Message-ID: <87wlquosk1.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 81561988-155e-4d88-482d-08df39bd397c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261021121427099003|261009223327099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261009221227099003|261009223027099003|261009221727099003|261009220027099003|261028144727099003|261022105027099003|261022075727099003|261102123227099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: ln7/T0j9aoJ37m5tObZ0ytpmNTn1NZDg9v+ZCyS2rtEE1XxFd63TXZFDmp8XqcKqfydsXfytfugAvC4Mt8by8aeAt0LG6Wec5y8gfX7chJNV9oc+g18z5Bz4o0Az76fiuEc4TXcFhZwb7amcy72rr19rxhw5gpIoeBlgx1ZtObsOm4Ec6CoFQMzF8/0xm5ahBDPVWQ44PcD7FdUGqCV5rToLnjTJhctBGNlwL2AFa4SgYBRP1O+nQ58OFvzbsvgAXMWJ+X2hNK3bwAu35CPlBAnUZWaAezuMYFZ2Vb0B9nQ3FFYoF+UYCOJwDRekZVaMHpc0mS9Zku9BKCSnGmb5LdLSvG3KjFffQ/wDZB5X9tW1taLgI7W0YTPVilh1C+TwsslsVHOHS0us3N/BBBpkpB2xujjwL3L7CI8WU4M/vRWSLUeLl1xulYN6PeE5uW+zINAD9pfFwi9VZfZISfUWpksmd9FrEcjjMmMEcj/ZK7oLefzqOZ8oMODe/Dr8Zjm1MVbUAgx6IYLGnjkuU0xgU/EZ2CDZyb0yfEwp+NmWMJADjZLOG1WL0ro5AzhsWo7BQ55EcTrgpCB40iFTdsGVfnTJN8gOp/qMtBXsbXE+Dmm9SzZKCJgOdYMazCo3hZrWhDyyd7p/6vF/fUlPQkX/aRqeUQY0kzvgpMTAcFVq+6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(261009223327099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261009221227099003)(261009223027099003)(261009221727099003)(261009220027099003)(261028144727099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUjdISR2u9wWCblmaXJ16CDASq2rAtYyz2aE0N4i0xFZNlOX6vbwtjtT0PTR?=
 =?us-ascii?Q?5Wav1qVZHK3cRNK/sbnqQxbYbV57EY4y7h50Atcn+PHtEdndxFFqwhq1UVlB?=
 =?us-ascii?Q?BYDZ0x7sQ7+1e4N9zoDetq66KWx8Fu0cTtaGQWwgHJ/lcEhvo2MGZlR7lt6A?=
 =?us-ascii?Q?/yXUsAobmN2RsqKtjyNDdpAd5pjLpoAxMi8SzAADNOqztcylnnUxhSn6H/Gj?=
 =?us-ascii?Q?4aIAARmFlGecFQgo/8cpb6HFDO/IiyvEHPSVZiHUbJ5nYhqH8uzEra5nix2N?=
 =?us-ascii?Q?OXDaEXqHy+5CNtiU1Q0s6pS+MRWl6HHqtLzHx2Hspmw++jFWKAlF4HcMGoIF?=
 =?us-ascii?Q?Qt85A5vagEAK4oUq4ffqOtAPtK9aqSQ2rKIpRU+RNPDkOBiNkqIui/Dg0Go9?=
 =?us-ascii?Q?VvIjwq/hJyJ6DNTVsDOi3wWHZ6XfbqIu8i9/AnWcaBzmAWyDbVQcumKQrBVg?=
 =?us-ascii?Q?YNEBQNVIXrGx+vgcENlTUkUBd+N/qPoZEyRf1xGjTnBb7HgQ7gfK7biCU/XZ?=
 =?us-ascii?Q?n9nkmak0rkFv6nr68cyhVmwCE9EXReO709T5hxJEztDg7NRsyKqX/jjjX9o8?=
 =?us-ascii?Q?hzDV5C813080hJVZ4J5KkVsWxIOgFph4RsLGMLueG+DCvoGD/IHK124I/Nw0?=
 =?us-ascii?Q?VVMceRBXIjmXARKgG/l/gwqQl7uGU/8/MIH+i1O6Dd9nXiXk6NUBSSyTHoJk?=
 =?us-ascii?Q?PMpgCUvtgGOD+DCCFL53gwc9je3T+L+NDgQii50Xi8z37FsTbGRk1JCkNCSa?=
 =?us-ascii?Q?VNtmaaloHcVr4aRz4gaHTKGd1LsH48i/lm1mQiRrD4IIODiReU4Hjidmgp51?=
 =?us-ascii?Q?tKjQDPDYPSET/yDqeNyqcXdwulEsD3oI8bUZ8IP3CM3SXPpiRzNc3DU/d86C?=
 =?us-ascii?Q?sSJflWTrmwUHpMNWt91nuad6Tgq226t6vTVvkWtPrEi+6Wpu13Qsz+xYfLrb?=
 =?us-ascii?Q?RrUykkJIYBHm0PnRGI3lXxfCpVYkgViuV32j9caRKr8Vt1nOiDkquu0IoBwF?=
 =?us-ascii?Q?CUYyvXZNtQ4bZ2OsxCgQfFJGwPm2jTdEcP8gXqfEkKj6bRvzaMaIQAYuFk6O?=
 =?us-ascii?Q?BWzDkaNl1nGvu4ZKFANFljd9gvJD4iXFI/i4TPitxtAlD16gaERNNlc33AX7?=
 =?us-ascii?Q?GPKJ0+ysVJlUXNgtqj6ZrW3rI3wOqk/nbD+u08JR7Md7EmTRHWspp+SQebZG?=
 =?us-ascii?Q?g8bSiUZCRmuWdaw4wmbqvImEZofj1QqLOZ9dvYlPxF3Mt8t3EIhbgG5wQ46k?=
 =?us-ascii?Q?NUnr7aPnM29Qwe+gFdWk186Szz/rWS9KwvmLE/XmXhNx7YcOk/l2P2QQ3NqB?=
 =?us-ascii?Q?IZZbBkcd7sBIzk5ZfHmksLGWsPDtUscX3xU88zdSlWiumKpCNWkWNETc3wxu?=
 =?us-ascii?Q?/8GExJUHTjlQlc5YH/+LK99PTGOKVqkohODdMzz9ob+iFhaIiAwOQLPAC5Cg?=
 =?us-ascii?Q?4HWrvHLe/phkM1LOenYNd6gyatVjeIG2JRrqrNOzrgQLyeNkZ84y2QXJspZ1?=
 =?us-ascii?Q?2W/xICXJUKdZOE+cgpOw13PGxPljF8OaPd46a/VLe8fDOhcI4niPGqcusUZL?=
 =?us-ascii?Q?XtYegsCQw+chyNG+OjwbmG0qVP4DxyNE3FyAOvsPL9a5JomtcMhONWBTWnLE?=
 =?us-ascii?Q?aLniLnVBTEY+yI1okQnYMHolBDwsXyYX2YsTU5x9jNP9DfBbDXJqYMjuCBTl?=
 =?us-ascii?Q?ZnzLbQ1E4OZI1QUhfuRa+5Q0RWzOFfh4cM2o1Eu2+b1fvddo4otRQeTIWx80?=
 =?us-ascii?Q?cxNs+kumMQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: EZLGgPlvR16Xa5ZLAVichMN9YFdVl5f3oXce+MTR8Wjdj1B3XU1KoqvqtlkepalSWktXxMm6uW/hstFBINLSa/PozADbr11zlIDQ9WkJV4/2RT9pFTH6JC5MJMdFsvImMFMTssx57Rvs2b7zEw5Ve1X18/jcImscxXaApzyGhTHlpkWoY0j9qd64vXjSEhuFLH0XL4qk+y3wqdzzQh18eLnhuFfSeFZjCi8y/qMw7IhzmRcbee1G3FiAOGHKFpa07ETbzwTgzQmNHWX5AkalSI2/6moBvKZZbSGIgKzQsV0ymYftBHqikCayDJnH6kBgRUu8a7fetD30qQU3Rtzezw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81561988-155e-4d88-482d-08df39bd397c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:14:58.7089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v10n6jThsa0zFKhAKbak3rHX8LUJK7AFFOYKvN/zM8AUd+fZkHczDE5dmFSq3G/xsQ133vTUluHPUc+vnTxhcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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
> index 45ec62813..2a0b89f7a 100644
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
> @@ -1216,6 +1217,16 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>  
> +static bool pat_idx_is_reserved(const struct intel_pat_cache *pat_sw_config,
> +				int32_t num_pat_entries,
> +				uint8_t pat_idx)
> +{
> +	if (pat_idx >= num_pat_entries)
> +		return false;
> +
> +	return pat_sw_config->entries[pat_idx].rsvd;
> +}
> +
>  static void
>  xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  			  int mem_attr)
> @@ -2647,6 +2658,8 @@ int igt_main()
>  
>  	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
>  	uint16_t dev_id;
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t num_pat_entries = 0;
>  
>  	igt_fixture() {
>  		struct xe_device *xe;
> @@ -2658,6 +2671,11 @@ int igt_main()
>  		va_bits = xe->va_bits;
>  		open_sync_file();
>  		dev_id = intel_get_drm_devid(fd);
> +		if (xe_wa(fd, "14026539277")) {
> +			num_pat_entries = xe_get_pat_sw_config(fd, &pat_sw_config, 0);
> +			igt_assert_f(num_pat_entries > 0,
> +				     "Couldn't get Xe PAT software configuration\n");
> +		}

I was thinking: maybe we could always read the PAT sw config,
irrespective to the workaround being enabled or not.  This would
future-proof the code for new workarounds (or other types of
restrictions) that could get added later.

>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> @@ -2887,6 +2905,10 @@ int igt_main()
>  			if (IS_PONTEVECCHIO(dev_id) &&
>  			    strstr(s->name, "madvise-pat-idx-uc-comp-"))
>  				igt_skip("Skipping compression-related PAT index on PVC\n");
> +
> +			igt_skip_on_f(pat_idx_is_reserved(&pat_sw_config, num_pat_entries,
> +							  s->fn(fd)),
> +				      "PAT index reserved by Wa_14026539277\n");

While Wa_14026539277 marks some PAT indices as reserved, this is not a
one-to-one relationship, meaning that a PAT index could theoretically be
reserved for a different reason.  As such, I think we should avoid
mentioning Wa_14026539277 here.

--
Gustavo Sousa

>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>  		}
> -- 
> 2.43.0
