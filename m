Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D49C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6363510E149;
	Wed, 17 Jul 2024 13:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJl8TIKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1AC10E149
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224116; x=1752760116;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tup0t3Kg2TGjwEBq/bu6/81XXUJQ26XxKnEtuO2VDdk=;
 b=LJl8TIKPCjxkMEiPEU8pmV7VUOxHcWW/RKUE0UesfqMrIcJIza3fhrol
 H5a3FtUMX4o2w9YCJa7kfaHtW/zbB9ysQV/wI/bST6XaM53vxi3kAw2nH
 nWO0g0uonN4ePiOtQ1bJuuqj7ALTWAtu4xicGMfLKu62RXGMdfD/vjmLU
 Ekx8mKy2alGkE4xxZw2oUntIbrFI387kLeZdJr5M9OIe372seiwhEpneS
 gjsGulV4P/uYaqHl1DgcatkGVHA/9iWb9P67dKxPajBUr1KjnsA8ME4T1
 2myUfgsU3ahC7ROF8EpDOn7C9s1lLoMjMlKoLjwEu10osNdYqAjcXAVya Q==;
X-CSE-ConnectionGUID: QejobxQtQh6iEAG/eDxqFA==
X-CSE-MsgGUID: /dfqZ1S1Qou6/FcQ3tE9Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29397955"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29397955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:48:35 -0700
X-CSE-ConnectionGUID: 76LiOo/RSEewx6HD9JekMg==
X-CSE-MsgGUID: /L8n+WqXS32gK/nw9lF61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50276395"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 06:48:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 06:48:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 06:48:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 06:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/LPdKU9MPYjpUGB0RuoVCLQ3K4okLU65sEdyypQfIDE/6loOCiyXr8jXAClSn4i19SqNVF+/yG7EmWXitv/FTO67sMThKsNt4hKstYn/TIwRWCqJioHeMEJZcqR6lV0zGcZtBKvyjdcNbkaA9aBK0mHD88jJuEsQrSuftO7VAuHwPa2g1YEpH+C88/d8fG/pIQh44BoRc9ivtQlk+D7OmkiRi+9mWhPlN+P7PscyybJJ6seKGQMEqeBy4N7gbjkG8mEvFTcjMJphPsScsUE3LPD8z8+pqblr82AiK59Mzal9+wajdIwTju3sEW1/wzbTyKRoe6qwSbinois1wLR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyaL6CDMfu6e7pHwrlQTCaap8GqCPHRGBnRu7kdBOB8=;
 b=C5Yh3whuyBsEdEPxeZnFezmnrR7OG7jWhCpT3br2AJ/en/p0xwogfAW2pBrDHwkEYcbFKxLDJylJiDe3MdSymj/MYbqt3j+KL0CA0ay9l14YoyCz18EduCyFsTrFyVwIItKh1mI32OJDPUfA/qljDllo7KmIuw0vUVftYDIPVmcT+R/Gpdm+KqG/sjp9P4oD7jEkAghiVhFXCtr9svVoBAaS2UlYhvsHu82qwK0aIKpq+0R4mPOQhE6JT9LFYvr5U/KzGHtPEcWxRFZq/4pEo6SbRSx5gcnGmBbFjhteIu0tBpMAeMWaquaqUnpDOe9+rdgWpWFrD+t9VvHAjz+gSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6352.namprd11.prod.outlook.com (2603:10b6:8:cb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.23; Wed, 17 Jul 2024 13:48:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 13:48:29 +0000
Date: Wed, 17 Jul 2024 13:47:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_exec_mix_modes: Add new tests
 for parallel execution
Message-ID: <ZpfLe93zxRyLZsa1@DUT025-TGLU.fm.intel.com>
References: <20240717123120.1065167-1-francois.dugast@intel.com>
 <20240717123120.1065167-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717123120.1065167-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 819174ea-40c1-4242-b066-08dca66723ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oybG/sdHzAmHujrh8CWCHGPJOdzY1+Kb3KbvPp0h2odIvvd+VZbJiKm+Cw?=
 =?iso-8859-1?Q?AS89K84a2565dl3ArYWcnYPLTa0jX+oCyy3pcFxw6FdeZb9WZvBfCLCm13?=
 =?iso-8859-1?Q?rfS9OBdPwjpUNoyDcAV4kmLApXMmiJ0mjTkd+q1C+P1+HxkVSNCHDgw3Qb?=
 =?iso-8859-1?Q?dtF/Y/HCOj2ChjbsvxixjrEDceKJvj021TfKNwdu7jNNOfMQ+FSxEiC56/?=
 =?iso-8859-1?Q?2FKRldvUj58iwfJX0B72mfo7I+Uc5EWw4HEZ4MWQqmZm9GhU5AN8CLzlrD?=
 =?iso-8859-1?Q?jrtbPZUIQMv3u7kE9fQyr+ovV8MPbGGwF6nkm47bx6Cqq8od54He+TjfKY?=
 =?iso-8859-1?Q?gpaCHcoeWsWFs072bEF9SIAyUQLSmW+s981nLzfffOGYm5ZJOWCWOV4bFN?=
 =?iso-8859-1?Q?spy8wMqWQzaLwqs7un7lq6IcAtvE2v1EY8o4Mkl3S/oPYNc1/f/6tFAc77?=
 =?iso-8859-1?Q?wf14PmRRhjdqREraYNEUyiD69XZH+kURQ+IXtJwD2od4WN//M8R3zo56Kf?=
 =?iso-8859-1?Q?GomnQRTbOrW/nGFghPHU+dmgCjOyoh4FZ8pqDMiwftLEI+IwOZuu+b8j9U?=
 =?iso-8859-1?Q?9RvrfP8HWU5E07bVL3FEVE4uugg5N6aD7wxBH7crzxTD6MyKZ/abfPqeSJ?=
 =?iso-8859-1?Q?0+AcB95fXN7mpuFZo0V9tSAdQhiAQXTaZG3BhsdVbfYxCaE5m5DxhahqvE?=
 =?iso-8859-1?Q?gjy2hvW74pj2yA0si1fW9ab7fN+0xL2qYPNWEHyio/E1yXa1+EIZIH3678?=
 =?iso-8859-1?Q?6NGvb9PTT0Q3Ow+r4cvvf+l8hvqMIsXYqjGU8W4sH2YNLroQ+ye4OmOO30?=
 =?iso-8859-1?Q?2mNZrRBjHLm4YoE39+FxeW9dA4p8sQZmZBDbr6hiad+LvZ9ncZb6jbmQ6p?=
 =?iso-8859-1?Q?e3rgnGhVUMDh7Ld6+VAZC+eBXiAFH+SqomjhH+uDd/r/lue389i2OHDGHK?=
 =?iso-8859-1?Q?osJ2ptEoYL1Y0aYszJ8dBdibtP0+d0NVzfO3MJeBkNj5nRW59ictxJ0yuM?=
 =?iso-8859-1?Q?UOdLzbLKn9d0f/Q8UliUtpwG7Z9cUUwatMs1XA7M9O3QBPEiCxauASIg67?=
 =?iso-8859-1?Q?H/zYXLJ+kIY17L4lcHGYCtk3RhuAyHRUBXWzI5NQhnM2a1SFm8Ph4+YY34?=
 =?iso-8859-1?Q?TyXg72aeYKmmmH/qGYjLeNCWEQF+KC2WCJ1ZQNwOTETeBAszDfkbhHJP9G?=
 =?iso-8859-1?Q?U0oFwsu94nnwPjJ0l4FpYIUAqMwqZ3yPW973ECIOjqOY9tPnDxkcqL/dsV?=
 =?iso-8859-1?Q?bB74bY5DUA4p7b4DBmBAUwxitWflRfbDWb/JCXk6j1znk8eTjvfnZ4z5g/?=
 =?iso-8859-1?Q?Lsv2GCa+sM2mMoRLQNrlM5kynpPcUOynBp3NGIJji0SfNwmcjLOzOZQBU9?=
 =?iso-8859-1?Q?AHCRjudLSpt0Flgez/Iaz/7soGhYqbPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iwfIbGCXTlma026AZk6A/mhcKLCA9NsJL2TxicVZFVKn3fB2FKBm5tpWSp?=
 =?iso-8859-1?Q?o0g1ApbY7BObrUEVa78KxcmHuo4MVrekH7yEgF+0ev+7D2rxh8ZSL3JgrY?=
 =?iso-8859-1?Q?Xb1aeDG6pdAd6PSkq1x6NzA2HyitX23svoyLporDrmVBvp0mxt4krg2T3/?=
 =?iso-8859-1?Q?WHO7D1jlJ+rqMg8bbDO3JiPge/6zaL8sURVevsEQghlJhltGHA4fIAnzeQ?=
 =?iso-8859-1?Q?6YaBxjILqnyaXXSxDLKKnV3lXEVxfgflES+ANyXkEtVHZqMXGdXfea0Lzn?=
 =?iso-8859-1?Q?Fk5jCK4XPKZ9pB8BU+yQlDvSYjRsPL8zxG+ZprasA31vX4AzecpqRtYIa6?=
 =?iso-8859-1?Q?NXN5+OvvO6WCJOXXz62rUpWD6S0Tz9gng35b8mIpXCqOABxa9dvtkxNqm7?=
 =?iso-8859-1?Q?gV8wrRhMUXOMzGtwzwxpku0e0cFzM1WZhgnZ/ZGFml574RsyVUa9A4K1EW?=
 =?iso-8859-1?Q?7IxrXudlzzinJDGdwvo6rPvCVWtSzLBASgS3cUIFp0whJcbvNFH4MxgeRJ?=
 =?iso-8859-1?Q?QqyZIZs305hPibA5+RE8H+JvkqNPPb9VJw07XBEz5Xt7U2fujxf3pQVK5A?=
 =?iso-8859-1?Q?qnlZlndQCQwjRGgt3AM1FMSWHrOh2OAaVcAj6atgEuSVQBtXd1D6E7Lytp?=
 =?iso-8859-1?Q?zVocgk5WPdymajE+mGiI3shOZmfSbPGonebaHqZk1OZIZjBU1gMzeq8gAT?=
 =?iso-8859-1?Q?ZJiDDRzo66/w8OLH3N9xY2ghs8PC9UJf3O1lNND6xGcwwwLboHH0w/7oyW?=
 =?iso-8859-1?Q?Q0rxkWJL/UwzWtsQH8Yd1B/Y9/gZFwjOwvdEVR6pMhsNQBHIQlcX4Qx0w1?=
 =?iso-8859-1?Q?s9tpfOdvSnStg/PJQ1kjD1lGdAwjPUJamfdPVMeQW9XFBdhPGkMgl7VmTk?=
 =?iso-8859-1?Q?d408g6h2RyRc3CZ1MEabhbX9eYE8NaJNPp/brTBSLHplPG3MetoT5xL93N?=
 =?iso-8859-1?Q?NF/YlOoU9gYovTm9R1RH+O4PAa9go1os/t3IEVrVPPRoW9CbeKAJYXNOu8?=
 =?iso-8859-1?Q?hJvYu8v8N65VHmanR4G5ZsakvEXO8j/FkC+igDvKBObQY3yBuyCzOTHyZR?=
 =?iso-8859-1?Q?SZ7h63RM9D0ySsje49YhB2oA7n3TBQdEr1MK8FWXQxqJpc2wmKzY/NWoS6?=
 =?iso-8859-1?Q?jBGeHtNjSqhTv88B+zCjDqA28fULTTesGzXZGtHTFlQ8dYEn7C4BReFtqf?=
 =?iso-8859-1?Q?Uxx3FfguevwPCwVEUFTWHop2WflVgtjoclLVa9FOHdpJUw2/umYNopsbwj?=
 =?iso-8859-1?Q?4MdRrQxwKwj/MRsJ0TVFWPUSEISE5yds7zRPrZ7YUTx9brYsAdHyOm/Usy?=
 =?iso-8859-1?Q?fg6sGXIlS2+KH91QfFyTEcQ3bPFMPKrT7VhAmq1o8TQ/DPMaHCPMGKFWGr?=
 =?iso-8859-1?Q?Sxbb38oesSecW/Hux0vpUW0gg1mK0ajzGvh31fjyrGy9jBh5LyqTC66fkb?=
 =?iso-8859-1?Q?XyXvdKSR6coA66c7HE9CLC9S03qfmveCtaQbgfyxhO10tTM0HemA8R9PNu?=
 =?iso-8859-1?Q?HLINQhTsog2Xx96uow+SLu4673njqD/sGF5sZkt5gQba60s/t/eH/qAxPe?=
 =?iso-8859-1?Q?k3rU/D+oKVVm7DcCikpFsqMk0kHw4Jo7q028oIAeQet8gVaZKWo3+jTMRM?=
 =?iso-8859-1?Q?IWIY9rbZOQ18EV7EI2rwXWSRHstAP/0r0RL/XkHehP3OmF/0TqYoaJbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 819174ea-40c1-4242-b066-08dca66723ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 13:48:29.8804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIvvAEaLo95eW3DE544gfBqhRzXOyhP1E/DIYBA61b57aZ5YLy5APCB2VmXHgabvihUDXxvl8DCsbzqSfYsoDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
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

On Wed, Jul 17, 2024 at 02:30:48PM +0200, Francois Dugast wrote:
> Test parallel execution of LR and dma fence jobs on the same device.
> 
> Add the following tests:
> * "exec-simple-batch-store-lr"
> * "exec-simple-batch-store-dma-fence"
> * "exec-spinner-interrupted-lr"
> * "exec-spinner-interrupted-dma-fence"
> 

Really good test, a couple of nits / questions.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_mix_modes.c | 277 ++++++++++++++++++++++++++++++++
>  tests/meson.build               |   1 +
>  2 files changed, 278 insertions(+)
>  create mode 100644 tests/intel/xe_exec_mix_modes.c
> 
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> new file mode 100644
> index 000000000..44265b220
> --- /dev/null
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test the parallel submission of jobs in LR and dma fence modecs
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: CMD submission
> + * Functionality: fault mode
> + * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
> + */
> +
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
> +#include <string.h>
> +
> +#define FLAG_EXEC_MODE_LR	(0x1 << 0)
> +#define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> +
> +#define NUM_INTERRUPTING_JOBS	5
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define ONE_SEC			MS_TO_NS(1000)
> +#define VM_DATA			0
> +#define SPIN_DATA		1
> +#define EXEC_DATA		2
> +#define DATA_COUNT		3
> +
> +struct data {
> +	struct xe_spin spin;
> +	uint32_t batch[16];
> +	uint64_t vm_sync;
> +	uint32_t data;
> +	uint64_t exec_sync;
> +	uint64_t addr;
> +};
> +
> +static void store_dword_batch(struct data *data, uint64_t addr, int value)
> +{
> +	int b;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = value;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	data->addr = batch_addr;
> +}
> +
> +enum engine_execution_mode {
> +	EXEC_MODE_LR,
> +	EXEC_MODE_DMA_FENCE,
> +};
> +
> +enum job_type {
> +	SIMPLE_BATCH_STORE,
> +	SPINNER_INTERRUPTED,
> +};
> +
> +static void
> +run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> +	enum engine_execution_mode engine_execution_mode,
> +	enum job_type job_type)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct drm_xe_ext_set_property ext = {
> +		.base.next_extension = 0,
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> +		.value = 2, /* High priority */
> +	};

I don't understand why setting High priority here. Can you explain?

> +	struct data *data;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	size_t bo_size;
> +	int value = 0x123456;
> +	uint64_t addr = 0x100000;
> +	uint32_t bo = 0;
> +	unsigned int vm_flags = 0;
> +	struct xe_spin_opts spin_opts = { .preempt = true };
> +	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
> +	struct timespec tv;
> +
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> +		sync[0].timeline_value = USER_FENCE_VALUE;
> +		vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
> +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +		sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +		sync[0].handle = syncobj_create(fd, 0);
> +	}
> +
> +	vm = xe_vm_create(fd, vm_flags, 0);
> +	bo_size = sizeof(*data) * DATA_COUNT;
> +	bo_size = xe_bb_size(fd, bo_size);
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, hwe->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +	if (engine_execution_mode == EXEC_MODE_LR)
> +		sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync[0], 1);
> +
> +	store_dword_batch(data, addr, value);
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +		sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
> +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &sync[0].handle, 1);
> +		sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +	}
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
> +	exec.exec_queue_id = exec_queue;
> +
> +	if (job_type == SPINNER_INTERRUPTED) {
> +		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> +		spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
> +		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> +		if (engine_execution_mode == EXEC_MODE_LR)
> +		    sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;

Identation looks off here.

> +		exec.address = spin_opts.addr;
> +	} else if (job_type == SIMPLE_BATCH_STORE) {
> +		exec.address = data->addr;
> +	}
> +	xe_exec(fd, &exec);
> +
> +	if (job_type == SPINNER_INTERRUPTED) {
> +		enum engine_execution_mode interrupting_engine_execution_mode;
> +		if (engine_execution_mode == EXEC_MODE_LR)
> +			interrupting_engine_execution_mode = EXEC_MODE_DMA_FENCE;
> +		else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
> +			interrupting_engine_execution_mode = EXEC_MODE_LR;
> +		xe_spin_wait_started(&data[SPIN_DATA].spin);
> +		igt_gettime(&tv);
> +		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> +		{
> +			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE);
> +			/**
> +			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
> +			 * duration_ns.
> +			 * When a spinner is running in LR mode, the interrupting job preempts it
> +			 * in KMD and should complete fast, shortly after starting the spinner.
> +			 * When a spinner is running in dma fence mode, the interrupting job waits
> +			 * in KMD and should complete shortly after the spinner has ended.
> +			 * The checks below are to verify preempting/waiting happens as expected
> +			 * depending on the execution mode.
> +			 */
> +			if (engine_execution_mode == EXEC_MODE_LR)
> +				igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
> +			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
> +				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
> +		}
> +	}

Should we also run the 'NUM_INTERRUPTING_JOBS' loop here? i.e.
simple-batch-store-lr / simple-batch-store-dma-fence test opening VMs in
both modes doing a simple store (no preemption)?

We'd have to protect again infinite recursion though but adding flag to
protect against that should be easy. e.g.
SIMPLE_BATCH_STORE_NO_RECURSION.
 
> +
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		if (job_type == SPINNER_INTERRUPTED)
> +			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC * 2);
> +		else if (job_type == SIMPLE_BATCH_STORE)
> +			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC * 2);
> +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_destroy(fd, sync[0].handle);
> +	}
> +
> +	if (job_type == SIMPLE_BATCH_STORE)
> +		igt_assert_eq(data->data, value);
> +
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: exec-simple-batch-store-lr
> + * Description: Execute a simple batch store job in long running mode
> + *
> + * SUBTEST: exec-simple-batch-store-dma-fence
> + * Description: Execute a simple batch store job in dma fence mode
> + *
> + * SUBTEST: exec-spinner-interrupted-lr
> + * Description: Spin in long running mode then get interrupted by a simple
> + *              batch store job in dma fence mode
> + *
> + * SUBTEST: exec-spinner-interrupted-dma-fence
> + * Description: Spin in dma fence mode then get interrupted by a simple
> + *              batch store job in long running mode
> + */
> +static void
> +test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
> +	  unsigned int flags)
> +{
> +	enum engine_execution_mode engine_execution_mode;
> +	enum job_type job_type;
> +
> +	if (flags & FLAG_EXEC_MODE_LR)
> +		engine_execution_mode = EXEC_MODE_LR;
> +	else
> +		engine_execution_mode = EXEC_MODE_DMA_FENCE;
> +
> +	if (flags & FLAG_JOB_TYPE_SIMPLE)
> +		job_type = SIMPLE_BATCH_STORE;
> +	else
> +		job_type = SPINNER_INTERRUPTED;
> +
> +	run_job(fd, hwe, engine_execution_mode, job_type);
> +}
> +
> +igt_main
> +
> +

Extra whitespace.

> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct section {
> +		const char *name;
> +		unsigned int flags;
> +	} sections[] = {
> +		{ "simple-batch-store-lr", FLAG_JOB_TYPE_SIMPLE | FLAG_EXEC_MODE_LR },
> +		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
> +		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
> +		{ "spinner-interrupted-dma-fence", 0 },
> +		{ NULL },
> +	};
> +	int fd;
> +
> +	igt_fixture {
> +		struct timespec tv = {};
> +		bool supports_faults;
> +		int ret = 0;
> +		int timeout = igt_run_in_simulation() ? 20 : 2;
> +
> +		fd = drm_open_driver(DRIVER_XE);
> +		do {
> +			if (ret)
> +				usleep(5000);
> +			ret = xe_supports_faults(fd);
> +		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
> +
> +		supports_faults = !ret;
> +		igt_require(supports_faults);

I was unsure why this code was added in xe_exec_fault_mode, so had to
look:

git format-patch -1 8abb25ffe58

If you read the explaination for that it because we don't support mixing
faulting and non-faulting VMs being open at the same time + races
closing the VMs. With your KMD series we support having both a faulting
VM and non-faulting VM open so this loop is not required.

e.g. I think you can just do this:

igt_fixture {
	fd = drm_open_driver(DRIVER_XE);;
	igt_require(xe_supports_faults(fd));
}

Matt

> +	}
> +
> +	for (const struct section *s = sections; s->name; s++) {
> +		igt_subtest_f("exec-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +					test_exec(fd, hwe, s->flags);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 357db2723..e649466be 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -286,6 +286,7 @@ intel_xe_progs = [
>  	'xe_exec_basic',
>  	'xe_exec_compute_mode',
>  	'xe_exec_fault_mode',
> +	'xe_exec_mix_modes',
>  	'xe_exec_queue_property',
>  	'xe_exec_reset',
>  	'xe_exec_sip',
> -- 
> 2.43.0
> 
