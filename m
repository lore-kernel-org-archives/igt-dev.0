Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C07AC44500
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 14:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9374710E0BD;
	Mon, 29 Jun 2026 14:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkbSgU7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9533410E082
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782744737; x=1814280737;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k2Vw9c18tK6SulY0SkaaOJiVQeb8PIddzHhShPpaIrk=;
 b=fkbSgU7G6enXSR5WUyUa3SlfIowj6J37Zi7CFz+Txe46HWr6nkJ/lvaP
 vc0mCnhyZJ5q9e8jYkX5pJqJtJYwZvud8ueF//AvziX0EMgDEICtqZ6EH
 VtMgAmD+GPkW8jImOVT0K5wvsJpY3su54uwfvpRHhO5m+zhsZamrpNGUz
 crb89D7asjz+/j6Db6pjt9CxR0bhQbdMPexnbMb24o3DUocQe/6GadzWs
 5jHDS4sOnvHsxfa8dre0RNk1VtH9XsGb1K2U7immF330RqY4wGWkF15Xd
 eEEeJEtgRspDOpx3hYIRIx1xXv7f8BOy/CG51+oV3L27TWFIg24/FPEFF g==;
X-CSE-ConnectionGUID: KXDmJ9LqSsaKnqxU5DGHeQ==
X-CSE-MsgGUID: Ndibl1x4Q8uqj2QBvRjXOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82432202"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="82432202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 07:52:17 -0700
X-CSE-ConnectionGUID: VMnhbQWZTO+XB5BbeBdZzQ==
X-CSE-MsgGUID: loXZsutLQdmXbJsggkT8QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="250915454"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 07:52:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 07:52:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 07:52:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 07:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLPviwX0M48HCD2JL+iES1yrOk+XJdESIdpLdhtZk/0IWiIvJmvnTXUg6qpmbY4CEWqXWkH9ogqiiTUGNLCrVjq7SK3MGNrXxLSAnyrNDVG9E6GgRpSIFnnlLTf5C1HG5oxTeL8y9mwlqXQ4xTnCh5IgAcOpKq7LkNUHI8VLLNpUZsh9q095NNvoEyXMZTYCYjsabCDbxCzUUI3dqmy4aoByLSZSxOP2EX2CEl0peoiw+iKuHf9RlpfbbtJdllxtP19qX3PAtxPU/U1GL5jTC4/D5eRKYN7L+XFoy/MDLMQucPs0ry940KbeFzlFcDzdozhWaa7gm41PLE0m1MuhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+SCLoE2xnCktRgio7Ks7nhzXiieXAmr4qZ+KCu6Kz8=;
 b=IMdUKzvt5NshECz+CSSiTnKA+0dQrBBsHvDddMu2oqt31Z12hgwQDO/mqf5Zrk3/VpItil+pp98W8dbLuLt/HctbgXs2WJlj7RrO7pghc+wunWFFUdCtoy+fhLl5B0MzeWZNQcKi/SG29ExC5IQt+7SeEiw36MDBEv15K6ze7t+/PbiptUOiLXt/J4+eOruxhr1wz2vw3eUtvTo0YCcSwCmf1ViDWFTfVlqVp3zNv65kS+rAfuUytGJhVo12x2dSOHxVzNtUpnvtmzUqCsvUSfrz9yiRR05FaDD5ZA7owBMydkEuQO8FY8VJFBiJQmuQL7n7TdHqVUcnwFSJiLTXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:52:14 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%7]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:52:14 +0000
Message-ID: <33f9fba0-8a72-4256-a0dd-fa28a78add71@intel.com>
Date: Mon, 29 Jun 2026 20:22:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260601171848.10873-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260601171848.10873-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 56eac816-1601-49fc-ea45-08ded5ee017a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|3023799007|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dKE4SiPfZ91aYqmk3ssRnw3oBq7+low65Cfo84Wup7QImDgejHzUGq8YivLkvgMZd2VSN2fkJ47vfx+WZZnvGZMy9SOkEGv2tx+pGuQ1cl4E16La5XEgd7IRcp54IyxD4oPtQKe35KbA8tVO987pB84ptNqV3sgsr5KEsMZ+DR3HRaYtGBif9yd/0ZNfPTuk7KkGg7J/3YRXAcw7ZbFm2UWtyu1vFYc5kgxJ9YNN033mobUM3RIOBRv7D7n+wELD9Wq5e0LAC1GZdVB2TL2MkHvHCRu7HY0KN3I8fAexn6mMmY+jN24HTCj6Ac+eZsGaR3YjPkG3nDfCeSaTg/MHHzG86/482A6G31M6scXgP5VL9f/q9q+tCjPHrpW84GdIgp0n59Eqx2wcbTjtoZG93l9n6xR9F0ResPX+BBY/qxZ+nuht3J5bwArpV7hksRVVFB9B2tZnGWFijrtQpnl27BSc30MMx+DgkdjtHbH/5XXuSyjHYlWnBTymbA8aFjpynrQG8m41kljZPgj0e+ItXgxWlJzCYuXC9r3zTUlyURhW8p5p9Q874w+U80PTv56rmWLYveot6wCsQg031NKAGA0Y64srkwWvioQ/0uL+mPoMaw3tQJbLawDx4mSsA6Nvj6U7Sy/i6ouR4bz+I3nMPrj+Xd4Wh1fMhsmbof5dmYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(3023799007)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXRLQzA4VzZmNjhzVHZ1UmtlWmQrbEJFMEVTNHFLZlhMeTZoOWJIUnpUUjRk?=
 =?utf-8?B?eThHODNyOVZnc08zUzV1dEsyWjlBdkg0ZFg1SzhGTGRMMGUwMEJMMGxoTVcv?=
 =?utf-8?B?SzRhdGtqamxrZ1VJbm0wanhvbjZvTVF4ekdLK0xHM0RteGE0TzYvMG92U3Bv?=
 =?utf-8?B?Z2d6VHZsTDFseFNrR3g2a1JON3RnWUF5R2RJdkRYcnRTeVdhd29iVEtzd1ZU?=
 =?utf-8?B?d2NxOHpiODJ0WnlZRFQxenJDM3c5TFpFOUs0WWljZDc3OFVidVNXWWwxMVhq?=
 =?utf-8?B?MUVMZ3FWeUtVUTlENDBRWGs2NEV2M24xUGhZSjNramp4aGtIWHo2WUwrWWJP?=
 =?utf-8?B?K1pQaXJhQzcvZUVBeTVTYUdZcWQ1eFhoUHorWmRzc3J1VHN5MEdPQTNpMjVL?=
 =?utf-8?B?ai9wYncvU2d1cmZzdlVlb0pVS1U4ZmZtbG5YcnpLc3hxVkZzL2FNRkFvOE9p?=
 =?utf-8?B?cVVJS05Ib0IyWnRmcGZMZVN0Q0JmbG82d3RScWRqaVQxL3NQNjU4bTRhd0ZX?=
 =?utf-8?B?VGtCRjdYd05iblVQek4yRTkvNk41blNUQUpCYTIrajYvcDJiZDlmNktROXc5?=
 =?utf-8?B?bzZJSk9tcitwaDFLWkF1RTAvdDlXTkhmM2NDNlBMWGxNOHh0UUV2TWoxVEZq?=
 =?utf-8?B?cUcrQWNlWWg4ZVoxaURmbklZbCswSGN6TTIrVTEwOTArTm04QXV6T0xjMGFD?=
 =?utf-8?B?dGFXWWpoYVZ0cStsNUhlQ3JsaXVqeDJMVUhYOUI5aEdWQy9vUEYvNEV1Um9x?=
 =?utf-8?B?eUU2aVBOWXhWZ2JobG4zNCs1U2xHV21MUE9lcVRiTWkzQTJ1YU1kVHBpNzZr?=
 =?utf-8?B?eHZ0WHdSWHJQd1FlQXNXZ2ZicklTR3JRcE1IWUxRQ3hvZTBKV2djYXRxMDB3?=
 =?utf-8?B?M043ZEJScS9RTXF0QUJhckpsNkd0b2JZVVJlbFJNcVhDV1Q3T0Fmd0tlSHN4?=
 =?utf-8?B?SFdtZzNRdnBlWHdqdlIrSzgyclBmaXhBMUpZUERGNGsvLzhFdk5sUkJSL1BQ?=
 =?utf-8?B?dW53L01HaUJvdFhWZWo0TURDZnF4N2FCYUpOZVNtVW9ZWmEwRWNTdmpwU0R3?=
 =?utf-8?B?eEd6UDE2VGhnZkkrS2tnSUtCK3VuS2d0WmFZYTk3NWs1ajVWWjhZWFpmZ2VM?=
 =?utf-8?B?dTNEdUFIK0xXcmhhWmYvYzVRaE5FNFJyaTM5anlYWEVDdjlsLzVUdW1yQXFz?=
 =?utf-8?B?Ty9Ic3o3bUFjKzlHOFVKdE9iazVJNCtiUC9tRGpWMEJ2UUdnZ3RDZ2hlaHlF?=
 =?utf-8?B?Z2VrMjBWOTNIR3hqOE9wdlM0TkI4SVduczhQbi9LWHdNdDBCKzBOU1dNeFNh?=
 =?utf-8?B?Yi9qcFpOcTlsNFJST1FUb1V1STJBVkNSWjhhNndmNnk5WHpCNnBCL3YzbXFq?=
 =?utf-8?B?UTljWGkwK1gyOTdjdDhLNjROR2xTelQ5cDQ1ZlR6TVJHMmwxYTZ4TE9qN0Fa?=
 =?utf-8?B?aThQbnJ6VVg2SEZFYUZwNHBZaDBrbVBJS3QrZ3RzRkhUVXFrKzJGOXNCOCtW?=
 =?utf-8?B?bWxYTzJBZ1dXYXVhNUNsZE92UVU5VkNhdXE1MGJjc0lWb0ZWSVptVjg2Umhl?=
 =?utf-8?B?c0dvd0RGK0R5dlhpVHFuUGxRcGJGU0QxZmtIdFhjWHE5akdndFVtRUFyMjdr?=
 =?utf-8?B?ZG9PdFZKMUpNbFVCdDRsbHBTL1l4MHIxcVhkS1VwcmtsM1pLeTFsd2RDRkN3?=
 =?utf-8?B?Ti9UWU51WUZSdm9KbVJnbDJrOUZyNkE3Q2VRSkRrSW1VNzFJR0taR2lWcWNP?=
 =?utf-8?B?SmJOMFJORHNUelNZSUJjUnNVZTlzNmFEeHJxMWxmTEk0Y3NmRUN2M0xzZXF6?=
 =?utf-8?B?MEZxWWFPMmtoSEFGdDhXUjFrZ0l0dEdQVGFQYVd5bjFIc1lwUFJMc3JVM3U0?=
 =?utf-8?B?bUNFMjBOZk5UaW5YNVdidXJoaUNVWlBCSm82eG1aZ2ZwZlNXazJTbjlLV2Rr?=
 =?utf-8?B?RVVMK1lYY3lLalFzNkgySjBMTE1pTnRBdHh6cWhoenBpc2xpdksyeUZGNnZM?=
 =?utf-8?B?WWdKTXF5Um1JSHVLemhlamxGTzRwbWlObzBsR1RIa3F6MGp6aTNGV0xsUDYz?=
 =?utf-8?B?K00vMHVDYldwUStXZXZzcTV6MVlBOHV0b0tDZUJqTE4vRWZqcEJ6UGc3Tmlz?=
 =?utf-8?B?K3NFdHhsdFh0TmZGSXdjckZuTjEvRzJpTmtnWWx1WVlXa1BoWXhiVFV5aURO?=
 =?utf-8?B?NEJ0ZVBLbVpUZ0Z0dHQrRmQvS0RINDYvOEMyM21zMnlpeWZhTXpmVFM0cXZE?=
 =?utf-8?B?Yy9IeGJrOWZNd2RBay9GSFZtTlBPc2pvdUM3dEZla2JjVkVkM0ZieHg4bk5y?=
 =?utf-8?B?b3RmU05MVnpiZ1RMcWxYNndiS3I1TUJZbks5UHZ6cDRlcTc5VFVSUT09?=
X-Exchange-RoutingPolicyChecked: TbFG3BJcq4CsHqhiRZxxEuyJjHiPegsMJhjJVKMl4oRvD3GO7ZzAYgq2Yai6526Rk0HpR7R0GVtDU+Pq7SrnEmbE/0bPhAS7SLvkepxhAVpw19S7ibvciBhas+VQ7PMiolhHL/nzUSZIOvEc/ZpbzTSQoT9o8pWOOB8x6fa54pgbrTxuEPvGh636r40D8CAjGlBZAinTwGKzdX+Rq2K+UQct5y3aIyEWw+rOBvg1Dr6QM3hmPK6jU8iz1mLMjw6XDqo6Pdf7Ko4sqLtlVGbUG5eArQVEd0zosB+MRAUAf+d369q59xm1sAFuLOJDx5JHKws+qAIrXXCgvrKH43AC0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56eac816-1601-49fc-ea45-08ded5ee017a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:52:13.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1tcF8KuhLKvUfGHY+BUHkDL3A3aEmlpsTl/7ShBkDrXFXSjRGwyxrU3ue7H7BTbN/ZH6WkJXMr4PctkA6eW+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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


On 6/1/2026 10:48 PM, Sobin Thomas wrote:
> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
>
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
>
> v2: Removed helper APIs usage clock_nanosleep and commented
> code.(Nishit)
>
> v3: Refactored code to smaller functions.
>      Added check for available SRAM usage and keep the max process to 20.
>
> v4: Remove explicit macros definition
>      Replace Bind ioctl with library calls.(Thomas)
> v5: Remove unused query_mem_info
>      Fix xe_exec_with_retry (Thomas)
>      Rename align_to_page_size with ALIGN macro (kamil/Thomas)
> v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
>      Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
>      detection, since igt_ioctl returns -1 on failure. (Thomas)
> v7:  Save errno immediately in create_test_bos before it can be clobbered.
>       Handle non-ENOMEM/ENOSPC failures in create_test_bos.
>       Remove dead code (retries == 0 check) in xe_exec_with_retry.
>       Add igt_skip when both vram and sram n_bufs are 0.
>       Add MAP_FAILED check on result_bo.ptr after xe_bo_map. (Nishit)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 423 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 423 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 408bfdb71..33eb6cea7 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,7 @@
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>   
>   enum overcommit_stage {
>   	EXPECT_NONE,
> @@ -29,6 +30,69 @@ enum overcommit_stage {
>   	EXPECT_EXEC,
>   };
>   
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci = { 0 };
> +
> +	/* Use first available engine */
> +	xe_for_each_engine(fd, hwe) {
> +		eci = *hwe;
> +		break;
> +	}
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
> +}
> +
> +static uint64_t *
> +vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
> +{
> +	uint64_t *ufence;
> +	struct drm_xe_sync bind_sync;
> +	struct drm_xe_vm_bind_op binds[size];
> +	int i;
> +
> +	ufence = calloc(1, sizeof(uint64_t));
> +	igt_assert(ufence);
> +	*ufence = 0;
> +	bind_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.addr = to_user_pointer(ufence),
> +		.timeline_value = 1,
> +	};
> +
> +	for (i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.obj = bos[i].handle,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		};
> +	}
> +	xe_vm_bind_array(fd, ctx->vm_id, 0, binds, size, &bind_sync, 1);

As per requirement array of bind should fails gracefully if bind fails 
but there is no error checking regarding this.

Fail in array of bind should be considered as pass in case of 
over-subscription. To match requirement bind_array should be called in 
loop with increasing

memory pressure

> +	return ufence;
> +}
> +
>   static uint32_t
>   addr_low(uint64_t addr)
>   {
> @@ -3073,6 +3137,360 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
> +			   struct gem_bo *result_bo, int ints_to_add)
> +{
> +	int pos = 0;
> +	uint64_t tmp_addr;
> +	#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +
> +	batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +	for (int i = 1; i < ints_to_add; i++) {
> +		/* r1 = integers_bo[i] */
> +		batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		/* r0 = r0 + r1 */
> +		batch_bo->ptr[pos++] = MI_MATH(4);
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +	}
> +	/* result_bo[0] = r0 */
> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
> +	while (pos % 4 != 0)
> +		batch_bo->ptr[pos++] = MI_NOOP;
> +	return pos;
> +}
> +
> +static void create_test_bos(int fd, struct xe_test_ctx *ctx, struct mem_bind_sync *bind,
> +			    uint32_t  placement, uint64_t *addr)
> +{
> +	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
> +	uint32_t ret;
> +
> +	for (int i = 0; i < bind->n_bufs; i++) {
> +		struct gem_bo *bo = &bind->bufs[i];
> +
> +		bo->size = GB(1);
> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
> +					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
> +		if (ret) {
> +			int saved_errno = errno; /* capture before anything can clobber it */
> +
> +			bind->n_bufs = i;
> +			if (saved_errno == ENOMEM || saved_errno == ENOSPC)
> +				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
> +			else
> +				igt_assert_f(false, "%s allocation failed at buffer %d: %s",
> +					     mem_type, i, strerror(saved_errno));
> +			break;
> +		}
> +		bo->ptr = NULL;
> +		bo->addr = *addr;
> +		*addr += bo->size;
> +		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
> +	}
> +}
> +
> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
> +{
> +	uint32_t expected_result = 0;
> +
> +	for (int i = 0; i < ints_to_add; i++) {
> +		int random_int = rand() % 8;
> +
> +		int_bo->ptr[i] = random_int;
> +		expected_result += random_int;
> +
> +		igt_debug("%d", random_int);
> +		if (i + 1 != ints_to_add)
> +			igt_debug(" + ");
> +		else
> +			igt_debug(" = ");
> +	}
> +	igt_debug("%d\n", expected_result);
> +	return expected_result;
> +}
> +
> +/*
> + * In concurrent VM bind stress tests, multiple threads simultaneously bind
> + * buffers to GPU virtual address space and submit batch operations. This
> + * creates significant GPU memory pressure where the kernel may transiently
> + * fail batch submission when:
> + *   - GPU page tables are being updated across multiple bindings
> + *   - GPU memory is fragmented across many concurrent buffer mappings
> + *   - Multiple processes compete for finite GPU resources
> + *
> + * Without retries, transient ENOMEM/ENOSPC failures cause false test failures.
> + * Retrying lets us distinguish temporary resource exhaustion from actual
> + * driver bugs. Non ENOMEM/ENOSPC errors still fail immediately and are properly
> + * reported with full errno context for debugging.
> + */
> +static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
> +{
> +	int rc = 0, retries;
> +
> +	for (retries = 1; retries < max_retries; retries++) {
> +		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
> +
> +		if (!(rc && (errno == ENOMEM || errno == ENOSPC)))

This condition should be in bind arrays as per requirement. For the 
graceful-failure requirement, expected ENOMEM/ENOSPC

from bind path must be explicitly accepted and asserted, not retried 
away at exec

> +			break;
> +
> +		igt_warn("got %s, retrying (%d/%d)\n", strerror(errno), retries, max_retries);
> +		usleep(100 * retries);
> +	}
> +
> +	if (retries == max_retries)
> +		igt_warn("gave up after %d retries\n", retries);
> +
> +	if (rc)
> +		igt_warn("errno: %d (%s)\n", errno, strerror(errno));
> +
> +	return rc;
> +}
> +
> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
> +{
> +	if (bo->ptr) {
> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
> +		bo->ptr = NULL;
> +	}
> +	if (bo->handle)
> +		gem_close(fd, bo->handle);
> +}
> +
> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
> +				   struct mem_bind_sync *sram_bind)
> +{
> +	for (int i = 0; i < vram_bind->n_bufs; i++)
> +		gem_close(fd, vram_bind->bufs[i].handle);
> +	for (int i = 0; i < sram_bind->n_bufs; i++)
> +		gem_close(fd, sram_bind->bufs[i].handle);
> +	free(vram_bind->bufs);
> +	free(sram_bind->bufs);
> +	if (vram_bind->n_bufs)
> +		free(vram_bind->binds_ufence);
> +	if (sram_bind->n_bufs)
> +		free(sram_bind->binds_ufence);
> +}
> +
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple processes
> + * doing binds at the same time, and ensure they all complete successfully.
> + * Functionality: This check is for a specific bug where if multiple processes
> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	#define MIN_BUFS_PER_PROC 2
> +	#define MAX_THREADS 20
> +	/*
> +	 * Cap SRAM test usage on large-RAM platforms (e.g. PVC). On small-RAM
> +	 * platforms (e.g. BMG with ~32 GB RAM) 50% of RAM is ~16 GB which is
> +	 * below this cap, so behavior is unchanged. On large-RAM platforms
> +	 * 50% can be hundreds of GB; cap it to a bounded value that still
> +	 * provides meaningful memory pressure for the concurrent bind test.
> +	 */
> +	#define MAX_SRAM_TEST_SIZE GB(32)
Make macros as global for better readability.
> +	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
> +	uint32_t max_by_mem;
> +	uint64_t total_vram_demand = 0;
> +	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
> +	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	uint64_t target_vram = vram_size * 2;
> +	uint64_t target_sram, total_vram_bufs, total_sram_bufs;
> +	pthread_barrier_t *barrier;
> +	pthread_barrierattr_t attr;
> +	/*
> +	 * Dynamically cap VRAM oversubscription so the overflow into system
> +	 * RAM stays within 25% of available RAM. On small-VRAM platforms
> +	 * (e.g. BMG) the 2x target fits within the cap and behavior is
> +	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
> +	 */
> +	target_vram = min(target_vram, vram_size + sram_avail / 4);
> +	target_sram = min_t(uint64_t, sram_avail * 50 / 100,
> +			    MAX_SRAM_TEST_SIZE);
> +
> +	total_vram_bufs = target_vram / GB(1);
> +	total_sram_bufs = target_sram / GB(1);
> +
> +	/* determine concurrency from memory pressure */
> +
> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
> +	n_proc = min_t(uint32_t, max_by_mem, MAX_THREADS);
> +	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
> +
> +	n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
> +	n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
> +	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
> +
> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
> +		  vram_size >> 20, sram_avail >> 20);
> +
> +	igt_debug(" n_proc = %d\n", n_proc);
> +	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
> +		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
> +		  n_vram_bufs, n_sram_bufs);
> +
> +	barrier = mmap(NULL, sizeof(pthread_barrier_t),
> +		       PROT_READ | PROT_WRITE,
> +		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(barrier != MAP_FAILED);
> +	pthread_barrierattr_init(&attr);
> +	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);

Why mmap is required to get address? Simple  pthread_barrier_t barrier 
and pthread_barrier_init(&barrier, Arg2, Arg3); can serve

The requirement is allocation in VRAM memory and oversubscribing VRAM, 
why SRAM?

> +	pthread_barrier_init(barrier, &attr, n_proc);
> +
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx = {0};
> +		int rc;
> +		uint64_t addr = 0x40000000;
> +		int expected_result = 0, ints_to_add = 4;
> +		int max_retries = 1024;
> +		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
> +		int pos = 0;
> +		struct mem_bind_sync vram_bind = {0};
> +		struct mem_bind_sync sram_bind = {0};
> +		struct drm_xe_sync batch_syncs[1];
> +		struct drm_xe_exec exec;
> +		struct gem_bo ufence_bo = {0};
> +
> +		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
> +		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
> +		srand(child);
> +
> +		igt_assert(vram_bufs && sram_bufs);
> +
> +		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		create_exec_queue(fd, &ctx);
> +		vram_bind.bufs = vram_bufs;
> +		vram_bind.n_bufs = n_vram_bufs;
> +		sram_bind.bufs = sram_bufs;
> +		sram_bind.n_bufs = n_sram_bufs;
> +
> +		create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
> +		create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
> +
> +		if (!vram_bind.n_bufs && !sram_bind.n_bufs)
> +			igt_skip("No BOs allocated; VRAM/SRAM unavailable, skipping\n");

if vram_bind.n_bufs = 0 and sram_bind.n_bufs = 1 then igt_skip() will 
not be called which is not expected, right? If either of them is 0

then igt_skip() should be called. if (!vram_bind.n_bufs || 
!sram_bind.n_bufs) should be checked, If either is 0 igt_skip() will be 
called

> +
> +		pthread_barrier_wait(barrier);
> +
> +		if (vram_bind.n_bufs)
> +			vram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, vram_bufs,
> +								  vram_bind.n_bufs);
> +
> +		if (sram_bind.n_bufs)
> +			sram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, sram_bufs,
> +								  sram_bind.n_bufs);

xe_wait_ufence()?? ufence is called below after igt_assert(pos * 
sizeof(int) <= batch_bo.size); What is bind fails before ufence()? The 
instructions

executed after failed bind_bo_batch() will waste cycles. So 
wait_ufence() should be called after bind().

Execution shouldn't reach here if above n_bufs condition is not satisfied.
> +
> +		integers_bo.size = ALIGN(sizeof(int) * ints_to_add, 4096);

What's the significance of ints_to_add here? If it's required then it 
should be in MACRO. Otherwise

#define INT_SIZE 16

ALIGN(INT_SIZE, 4096) can serve.

> +		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
> +		integers_bo.addr = 0x100000;
> +
> +		expected_result = fill_random_integers(&integers_bo, ints_to_add);
> +		igt_debug("%d\n", expected_result);
> +
> +		result_bo.size = ALIGN(sizeof(int), 4096);
> +		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
> +							 system_memory(fd), 0,
> +							 DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr = NULL;
> +		result_bo.addr = 0x200000;
> +
> +		batch_bo.size = 4096;
> +		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
> +						       system_memory(fd), 0,
> +						       DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
> +		batch_bo.addr = 0x300000;
> +
> +		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, ints_to_add);
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		/* Wait for large bind operations to complete before binding small BOs */
> +		if (vram_bind.n_bufs)
> +			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, INT64_MAX);
> +		if (sram_bind.n_bufs)
> +			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, INT64_MAX);
> +
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
> +				   integers_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
> +				   result_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
> +				   batch_bo.size, 0);
> +
> +		ufence_bo.size = 4096;
> +		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
> +							system_memory(fd), 0,
> +							DRM_XE_GEM_CPU_CACHING_WB);
> +		ufence_bo.ptr = (int *)xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
> +		ufence_bo.addr = 0x400000;
> +		memset(ufence_bo.ptr, 0, ufence_bo.size);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
> +				   ufence_bo.size, 0);
> +
> +		batch_syncs[0] = (struct drm_xe_sync){
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.addr = ufence_bo.addr,
> +			.timeline_value = 1,
> +		};
> +
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = 1,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +
> +		rc = xe_exec_with_retry(fd, &exec, max_retries);
> +		igt_assert_eq(rc, 0);
> +		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 1, ctx.exec_queue_id, INT64_MAX);
> +		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
> +		igt_assert(result_bo.ptr != MAP_FAILED);
> +		igt_assert_eq(result_bo.ptr[0], expected_result);
> +		cleanup_bo_resources(fd, &ufence_bo);
> +		cleanup_bo_resources(fd, &result_bo);
> +		cleanup_bo_resources(fd, &batch_bo);
> +		cleanup_bo_resources(fd, &integers_bo);
> +		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
> +		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();
> +	pthread_barrier_destroy(barrier);
> +	pthread_barrierattr_destroy(&attr);
> +	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)), 0);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -3486,6 +3904,11 @@ int igt_main()
>   		igt_assert(xe_visible_vram_size(fd, 0));
>   		test_oom(fd);
>   	}
Need one enter/space and then call subtest
> +	igt_subtest("oversubscribe-concurrent-bind")
> +	{
> +		igt_require(xe_has_vram(fd));
> +		test_vm_oversubscribe_concurrent_bind(fd);
> +	}
>   
>   	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
>   		igt_subtest_f("vm-get-property-%s", f->name)
