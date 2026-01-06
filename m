Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B19CD042D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 02:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BD810E050;
	Tue,  6 Jan 2026 02:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMs4lGZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D753110E050
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 02:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767665671; x=1799201671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1IPvbE65PXmOYr1YlyYKZohhmFfGebIr8nQhwj2WnVA=;
 b=GMs4lGZ2tQa8I0VjJwymb+4SmyJi0qNSeXcZMyiI5wzGkCbK9V1Wh3pj
 zfOEoBBSoUGNVnzxeOXG33Av7wS7hpz3D4RcdZ2CkEWvCxEzeOoue8JLr
 fbk74tGkUO4d8EtoP9WVwSVhLFr/2kUHpiRFjjc5AbLYXsCHT6JDkNSIW
 9Ld897LqW4LQhzUblwIaxJTuM9TkrN+Xk1zKnB5cmjOCaaMkWxlXRYn9F
 L9e5tDpxe4II6ReSrGPpGev+9wp9d/XrdkcDNr6fsiAnRASYJ+Ml2QzZ3
 CNADOREF44yoRd2FXQ2QwiYMmHwYr9e922YFa5VNuauZPRWGDzAJj+nVu w==;
X-CSE-ConnectionGUID: REtLhsDeQq6lALLKy7yXxw==
X-CSE-MsgGUID: Q2TuAmcRRsKnttbV2Sddiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69074608"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69074608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:14:30 -0800
X-CSE-ConnectionGUID: BO7SAH37SQqanewt+N5PgA==
X-CSE-MsgGUID: ce1hBYuQQQaC1PAsVfVHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202545126"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:14:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:14:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 18:14:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:14:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/+uk5zV4/rIACdQI6GG6yC+Z9eTKWXfvd+uAReGwRkiHA6Rv2nR+6eH/WA4h0RKnd/d0lwwcPUe6mFJjrBWeJwcnE8Qq0MXeonuHjfJFqNFvF4eQ/H3m0P895UcX8FxZjIC407v5dAYVjoC/b2KR/r7eBQkin40hjFx1+NR+072IOFmQiSPjDNzaUNkcfI5gwkDXlYh63XFLBYMA0TP19S6j2CJp2qFmpUxsIBRt7XcedGx38AswrrEOpDUutpd5x7zj7V0wcqnfCDnNyN1dNeyFZ7JmdXjIYr6XZ5hUC6rYoViygpJI4YkAENjsHF3ssdh5ITRG6Oi9gwJ2cgM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEhrTlDzHktxzo//i6cHw4cE1E5HLI8cC4+AXy0UZ14=;
 b=jw8x1QcDeB9I89WxMPFc8sTLAjRX47mmWEvzWY3leYPGEWizCIwNuGQq1k8qMs5uzkGmHExdyduW4vgG7hh+sMWbVyLPa1uSPoTfc3sTgeFn0bwDAi/bzkedn54WKUl5agAcHdI3sEE/FMcpMp69bKPTh2rVKe6LS63eJxwfPYP03KIzBNBYwx2Z1XmBNJmROe/9EHc1NqXTqvyT9MpKSICYqq6OjCGk7RkuHzsVYbBbEOoDnpsE5hwNCsVO6KHqcMO5Agvts79FxAYGTfAQwp1Y72UWLkz1qmQiaPaDuMRT+i2ApmhU67xsud4a7GvROvQdAgyDCTkeN2JARdG31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 02:14:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 02:14:28 +0000
Date: Mon, 5 Jan 2026 18:14:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <sai.gowtham.ch@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH 3/3] drm-uapi/xe: Remove multi-queue KEEP_ACTIVE flag
Message-ID: <aVxwAi+VxQN1ckwU@lstrano-desk.jf.intel.com>
References: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
 <20260106013018.2851521-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106013018.2851521-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR07CA0068.namprd07.prod.outlook.com
 (2603:10b6:a03:60::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: c135630c-3073-4b92-7458-08de4cc9520b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ICBeMYr3bx2XlK6rGvvehUeDYuBuae2PEXwv2w9b3QjGpJckAJsMZO3hPUfD?=
 =?us-ascii?Q?frqFvea8iy/VkyuW1Zxfdhuy4INXgaeisyoKXhD+xlTLAyLLXmogNYHTBzXW?=
 =?us-ascii?Q?ls9Dq4HrMZSOvZC211NR+k6ZLI0CI26tnpLh60WmBEPPDMdZvAWgRTYchX0y?=
 =?us-ascii?Q?N5YoEk0+PEAXesD3L9KttMoNO3T76PGXAghYSQnqGOTP9q+PHDWUtp8P7fJa?=
 =?us-ascii?Q?jromGyzskEOujpdMddqx2vWJE0FRNAcf6cLOkOcgv+Mg5DXs0QqVaHDOyZqx?=
 =?us-ascii?Q?GQXeWilmwuuBqY4XNCpM+WK2q9OVohiqvWQxPCOzG3/BJvJQ8etiYWZGxZ4a?=
 =?us-ascii?Q?HfssYfxo/bfKmq0KnOY+Coly0e10d7uxKAm2L0vT5AJKas8bePzAPO9dScYU?=
 =?us-ascii?Q?qqXPfjeP8HGZDLP9XcAjQtnG9BaMxheP6acQRctJVIUOgknV6WMTtnToNRTN?=
 =?us-ascii?Q?j7aowSObF1xml+NY9WRMwL7owJnvNUT+DrRBNDHEbKce+SJM36RizcUQ45a5?=
 =?us-ascii?Q?QAouldMhdwX9OP7dtg90fZcONmmbOaxVe3tym14sYHU1QWCZmg/GFj68K8ig?=
 =?us-ascii?Q?R3VxjpZ2YWxJyNh8MNVi9WRlRvirZRq2/kdsEahh31mi3ufvvoigXrGzuag4?=
 =?us-ascii?Q?j+K8nBhaLU/BO9dM97enYFyy9WKJ4WiDoJ6XvZS5m6YLBcmRQJf9Y3/YXHF4?=
 =?us-ascii?Q?3rJ3ZzE86raqQ5z5ZPjAhwbQfziDK0iMBN3h0lkCG8Fnb3QzxHe6RuiHVMBb?=
 =?us-ascii?Q?bwW8VoaZVC7lVwdq2DT0UxMfL2Qeq8OFAnkr9vYNmB6DyJDFSQcSM9YKU+xR?=
 =?us-ascii?Q?P2GqvAfrbDQhjc50cfzGmLjBkPQWb/Iuw0yrKQIlJlzsFDZYV/DfeDeb1zQF?=
 =?us-ascii?Q?AwRj4PeTIt76C2UH4Fg2WRvCUmumh3aQh1j5uj/8veLzDdQc/ug5sQQxFBtK?=
 =?us-ascii?Q?pG3GeyGrdQ3cwkxv5bc10NCE3X5lVQsZbRY44+pmEUKPUEBD3K+3+62HdaU8?=
 =?us-ascii?Q?tm4KoHT/Zq7C+XyMPt1iHMkfcWSxg5Ji/6MMmbjTo9M23MPVkz5VoDwTMzl+?=
 =?us-ascii?Q?5D9PAvLi+YXJHiTMQiO4+4M5U+4PeO3+N3lmKn5rCDM/rf4+8b9JvXmaQ7Dc?=
 =?us-ascii?Q?nZ9984jNsUBEGsCsqaTo1juZahrR3VbAS9QUiCyWg9SnKD+APOSTKdI2TPnZ?=
 =?us-ascii?Q?hs921kA1m4mRKl/CIRPsFGFKgra83e3gtYVsapAGyVdD4lEaQ8QSyW/NGtqt?=
 =?us-ascii?Q?pnUIqObGUpNZGy0nK1/sYuGzBuVzQLpkHYQGcOXJDEF9k6BbkUfn8bF1MbfD?=
 =?us-ascii?Q?hzS79wqQporbGBfhyg1WUVElxf7ptgxM4z+igYRj1Z8jwmrrIcpyk9Ec9xMl?=
 =?us-ascii?Q?ps7w+oDWFnTQpg2feIEBRn2zUBGxnlRt9GqWapOdHnrlzz7iguPmq4Gu3Iea?=
 =?us-ascii?Q?ZaiONXS+K0stECi58IOx3bQIgJMMZYrh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?13tgMc4J//U/CkRw3J7YnSIpcEA2Q0Lr8v4RfBE/st6XuTEDuSQjApzRbVI6?=
 =?us-ascii?Q?vfcacQhAYfHkuWrfHN+wk15NZL5VtEm16Ecy66qGNqQxI6m3ATIVcH7kHETn?=
 =?us-ascii?Q?rwPhgyYYT+NFxPGJeJfn258/f5REahOvVpYfqz805S6XB50hF2j41nKttQt4?=
 =?us-ascii?Q?YDhdUxddbeTpVwrFt6VDkNf6qC0NutIxiy0x4Hf/PRibADRb7ixn81BWxuhO?=
 =?us-ascii?Q?krSsZgclumjMA5fdYs0UFSzT4CrA/cUBO8zLpfwEz9Ne+uNbxzXkjeaKD1HG?=
 =?us-ascii?Q?l3kMKXcDFpbIaITGLm2pdkXm0o8W+C+O7QhO4yN3Af5Py9raYNWuD8d2EHaJ?=
 =?us-ascii?Q?bgxtrY0H4jXTePqy4GvQIl6cfhw8L1X4/MAZ0EoeuscTgdjvPlBscSUvwVDD?=
 =?us-ascii?Q?hnGx17os32BQ7aDuCJieeL8aNRuAEbLfy6uxAgRx+9C6h7U5i/lSm2+dZyfo?=
 =?us-ascii?Q?E0Xhf/VOMLK+A1VDzMWTZbGbLPOxfVk5FMRnTiW5kvCVy3pt2O/JfcOI3s+6?=
 =?us-ascii?Q?HhJp52cPEkdGhGQqNHa3ErDMzvRBOIzfYi2CK9ecDkVdYkn/gSa7qgQKSiNr?=
 =?us-ascii?Q?n19ia1VApY4xRCMj2+2HEb8Nuwd2BXBnKtjFyXDJuqKFbICYaL9KIZrR1RxA?=
 =?us-ascii?Q?6cU88pdq8lzjv4xTuCSR1YbBp9L1LZrSyDxjsdMqDu4jgcZi+bj3So11DPK7?=
 =?us-ascii?Q?6L2tJGGQPzIC+ucT1R0AT9pr1zqsOmsjGj4GNIccUUCSjKMpDs9sxmFNL7W2?=
 =?us-ascii?Q?dIL2fOmD5U4urpPQjf/cL2bRjdZiFVpm1IPiW5iu9FJEFP+6WR6b5BPY5H9x?=
 =?us-ascii?Q?jHCv6V1ql0GFAlcxYXRPTHEzr6CGkY59qCZhZeW6J/r7omq8lKYiOCfbWvQ6?=
 =?us-ascii?Q?xNQUYzCHafS3feVC010C63S1zVrG6TW1iZzriPOVrRCOFmNHePoQZqieT+c0?=
 =?us-ascii?Q?glh8Vjx1Bxy7qaiFzwLGkLMGZ9bi3TxY5JIwPWHBaKr/sMjWnCgARurvwKus?=
 =?us-ascii?Q?AWzW++YIfA+PB6sTIxHxdBd8gHXOz2tUGtf+LjPfdq+ETWb7AWN/dcf+cDbH?=
 =?us-ascii?Q?qmxkpWyZBqgwIG6Vb8q6J2RMQ0qmU5odU5hSsMQbxodEH+6ZntTJ0b+YnFDw?=
 =?us-ascii?Q?s8XxG5BiPKRQ7B7mH68vmg5DWifwPTLBni9OTsXjl58Te2+wVWA6oxTEJRRY?=
 =?us-ascii?Q?6fSEe8wg+pS0FA/TkW7ya3T68H3KyvIsnat2fSBjTUWyAeg4tYz6CclBHQLw?=
 =?us-ascii?Q?LE8O2M/YongK7LRPJf86fPuB6boSWaOePdlmjLd5bjuIglnAjz9P5uqV/DNf?=
 =?us-ascii?Q?EIjoe9/sykXQm5XmoWfCT3yLsykIDy9Qme/E9NRVp2Sn696Nfnk4aa5ChOAZ?=
 =?us-ascii?Q?GZGmZLC3xGaJoZqWWuG+0rOK5gTG5cfrnSvv71rHCDo7BuU+pvGbqo/ttQc8?=
 =?us-ascii?Q?ntwvF9sklmqVMs3LIZITRjttJsEsdQfku0o9jEtgD5l97P/7vE4/WfkuAquL?=
 =?us-ascii?Q?gBpPSWTWGppsZar7AXyBGroY3XY6LbJwM2bQ3NudWrXkA9p7RsBEEsI3gklR?=
 =?us-ascii?Q?LdD/M1M680IFhKUf/M+mF5M26L186nWaITmKVxZnZkXuyxjGx2ttn4OJB259?=
 =?us-ascii?Q?G/RdgqeVwGLXOsxF/0/VI96WvbcOzkqTQM43xovhvEJgcToGEa8xSFJwmT8S?=
 =?us-ascii?Q?pogOI1gcs9Oh27GmnfuJGiMJF6WRLtCQKo1P371Q0Svwra2Va/IBJ3iDU6Oj?=
 =?us-ascii?Q?x8Bk+9xlr/CkcJnlz7qNXkEV2bBZlk8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c135630c-3073-4b92-7458-08de4cc9520b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:14:28.2878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Z6KQDNaeb4ALwTFdt9/1f09VOTo4Af30hW1JeEy+ZznlLGTU9MbYMUSJ4UTQqwmuM26e98bzm9k1sy0Bwi7dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
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

On Mon, Jan 05, 2026 at 05:30:20PM -0800, Niranjana Vishwanathapura wrote:
> The KEEP_ACTIVE feature is being reverted, update uapi.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bb69f9b30c..077e66a682 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1280,9 +1280,6 @@ struct drm_xe_vm_bind {
>   *    then a new multi-queue group is created with this queue as the primary queue
>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
> - *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
> - *    set, then the multi-queue group is kept active after the primary queue is
> - *    destroyed.
>   *    All the other non-relevant bits of extension's 'value' field while adding the
>   *    primary or the secondary queues of the group must be set to 0.
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> @@ -1331,7 +1328,6 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> -#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.43.0
> 
