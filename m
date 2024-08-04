Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30559C3DA7F
	for <igt-dev@archiver.kernel.org>; Sun,  4 Aug 2024 17:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001C10E05F;
	Sun,  4 Aug 2024 17:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+tC4Hih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAED10E05F
 for <igt-dev@lists.freedesktop.org>; Sun,  4 Aug 2024 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722791807; x=1754327807;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EvVVPwBxvSVO3Hs0vWL3MYzIURFoFbDzqNk+7tuSZ6k=;
 b=m+tC4HihuUgFawzwPDiOv+NMKbrTZ1Ur9SHV1YLTavdwwc3+UCdiUYQJ
 q9ve+dHBp9bDUi50OQnsb+4Z/oN95dGEHiX4CDXbZzMW3o3hVmgaDgGty
 Ym3Lfse0QMiJmqfL278G4L3cfYIpSRbIiLAE+lbrC8PYEr3XFTinDE9RQ
 Deg6c6msfPV8bgEfnWNLWv7RQekZ7f/FEW9wLsqqufu80cc2pOQBa0EJW
 MlSE+mOtmyzkbeSjDt5F4WVDnpn7c0UV0jybzCh0UObDKMWjQv5cJJAjF
 iSM4GlE6iGwnwScpefKfuv30+NtHf1ijMrzj47tkw4nMA4r2OLC5OCO+Q w==;
X-CSE-ConnectionGUID: t7Tf0xO0Q4GA6r2+4sEhvA==
X-CSE-MsgGUID: H0XGw45PR+ufq6DyuTe9Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20870508"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; d="scan'208";a="20870508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 10:16:47 -0700
X-CSE-ConnectionGUID: ZRGpGtY9SGemTbRoFtyHxw==
X-CSE-MsgGUID: hC2qOmsSQL692LvzewJx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; d="scan'208";a="93467413"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Aug 2024 10:16:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 4 Aug 2024 10:16:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 4 Aug 2024 10:16:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 4 Aug 2024 10:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqUlb8mrJgJsY+boPLwMCLUYWkEpwhcHWCwFtFiEwA3HHp4/yn2RDvkeTJIk1ZKgLIWCVN8F6oExOKZlJ3L4m6hh/bX6SWVYCvoEDqhtF2zxoMrpOa0CK1IQio8SJ8rzkrj8+UXIL11AtgXtW2MPpXUwkeXpC1ONv/3j7z7EsFXZQPH151K60y+JHX7dmhju8Zi16hFra/dvKYarMEikiximOJX1UCvjYPBb2ZBJx0u1XEGQ30nOxfSNI69k86ZUDaXHM71pVMlBQUJU1CnnuTF8qhDtwPsdy1dIlmM2JzsUhVFlZ//gYM0sdPJBOYrTEHGWWHxxJOU13vbF2Xis2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBmXnqCtlOHfNpGtEkhTaZNiZD9EOjyCpuvYhEzUIcc=;
 b=hqSiuQLovLqpXCUPnj1MkFA6g3sIBnfuX+PQbB/gihE/cCdKkH2Qt+RQCo+zbVqrsu4DoJq0WLx6ctc9UaeBHh/uAgtjaSaiBpaLyhBU312U8LT+ITiDcn29FMBbMkWTMqOpWJFuT5EKpj5zNJi3HOzu76cXs82nwwy7zVuXN6zNcBKSSnJMbNo98Zh3t7f2DTachCCjw8xlK872mWNwHKTBD7fNRdOh/mtpZ9RnHm/AS5WQtsSk45Fo31xbnyH6mCLhdnVazNqfiA+t9PMotdxbK85F2m7pXZvQtnmgcoXrsVV9ZfuHW+1GyGzLhV6bj4tqCp4Zf0/EM9WKRgH0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Sun, 4 Aug
 2024 17:16:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Sun, 4 Aug 2024
 17:16:42 +0000
Date: Sun, 4 Aug 2024 17:15:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t,v2] tests/intel/xe_exec_mix_modes: Add new tests
 for parallel execution
Message-ID: <Zq+3OVCW+WmcTWyO@DUT025-TGLU.fm.intel.com>
References: <20240717163520.1145834-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717163520.1145834-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: d2219cb7-4729-43ef-a2fd-08dcb4a93594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oUP4H2eu2x+SgjjZ0NqUyGxOmRTyHet4lP5ReRUCtew5W0cTXuCyO5VKFt?=
 =?iso-8859-1?Q?jTRqV0aESWUZuJmh/Gti8kTkgDVYGCJlgyit/IVBdA0zyWpJJCVxCo5vAP?=
 =?iso-8859-1?Q?GbpvQxoymvZ1SJidfKKiJojoBfLczP9qv6NL1ib+V7BSGsxoUt48mjPGzw?=
 =?iso-8859-1?Q?qIa0KbM2+/16MfI21vePTHiOUiPfIPbhLEneYcs/DOxlEFCJ1V/2CvXAn9?=
 =?iso-8859-1?Q?ufcPJrTLa1gMpb16d+Yg3lCHcrShauQwGpphJfuPOLyRf+C+5m1cMlhUob?=
 =?iso-8859-1?Q?MP0aGl0NZf6ticD+tpyA4Z4ym81qjxYNWoG4oVuuowzqZBsWhC4o0b9cJ6?=
 =?iso-8859-1?Q?R68hYNBUWOmtSaG+IIC2nv/ChfSPxfPEMvQDEiEdg2iNCyyZPigk9FwXBN?=
 =?iso-8859-1?Q?JiPIEV5OPQbjiiGOGxxdCBteZRap59Wmj1lktKhZpvQ4+tQhiGI50ku2GE?=
 =?iso-8859-1?Q?lB8wM99dlyESxUervVwZ6l98qTJnXN/oGMH6nTDOBcpe0jyoy8/p9/PKIu?=
 =?iso-8859-1?Q?0npq87hWRSOB+m0sSk4WXmJxgxNTeq5vaxmA55Nt85sigBIbNg58q8n0M1?=
 =?iso-8859-1?Q?aC8PUa1oOYCGsK8tblGYTn9p3PsizHi503gsbooHtSCz305A+yxALB3mMG?=
 =?iso-8859-1?Q?iiasY9/+atd7lt0KqajczY+fwRPhhb4lob7YCmElL4vP33DX5ylyri89gR?=
 =?iso-8859-1?Q?9IUso9Ggk/nspsNzMX13YB5ehTQL4PqZEdG1wDbDmYJo51dTLvsBFvaG7F?=
 =?iso-8859-1?Q?u+RMlkDyhHNgGrYQln3UmGW4xN0WZZcWOtsxFDHJfMV8Xqqgv5sgJWsih9?=
 =?iso-8859-1?Q?sKaFfHXScJoBFog4gBJy6cI2+Y6n2gt+M1uKvvIflkmthf9ocrgTGEbBA5?=
 =?iso-8859-1?Q?2xVU3H9e/y9ZFRws7AGcTR8RjNVgHxJ3a+gE0yZXW07LWiFSkvratbqN55?=
 =?iso-8859-1?Q?rbP6xYZineetvi+Iy5gk/vRwWAS8WDCgRz+91kG/I1V9O/VxoypqYG9JC1?=
 =?iso-8859-1?Q?tUAnacecsBJsyzodu5yghbIQDk39c5QzswTctKs8Quy+f+mLw2xtpByEbD?=
 =?iso-8859-1?Q?pHZLoaOkezrH4LnYJAIrBOKi0IFjf9GsoN1SeWkDzVLNMccztFe8K2KNmS?=
 =?iso-8859-1?Q?YEuI4DbuC6xHS7gb3Q01doPhiX+V2fB3ijosa7IslUmQx67t98giqzGjcT?=
 =?iso-8859-1?Q?OunA5JmsB6FTRoQNtCLtRBcqupOPV3x62D9n7vYtrwQMAAAQk+wRvevTWp?=
 =?iso-8859-1?Q?m7LtUc4/5T96BXNvYnb1hhkOX8YCdKmoCbAmOT+pwvzZb43kOJZU8j174k?=
 =?iso-8859-1?Q?c3xmmj2jfpsVMQRDxh8pWqgvTh2UU+QlSqUP0/oV/YieR0b0dzE45PEKOy?=
 =?iso-8859-1?Q?gK7g0pSmCs3aOX3Ky33gx6bJc1oFbCEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rkRwpaQOX8AzM0Lu6MkqXvSF688TVPE5cG1wHpcxdkfaLs/SYbce+OnCWk?=
 =?iso-8859-1?Q?OjCLqPBftV0OvkVAjc3S6ViGNgJiTtZtorvYB6TiW6rj5KUCiDMtYWaZpT?=
 =?iso-8859-1?Q?iD2UpolyEgAFkONScW1oLjAFU3DngEVkVZgv3mPCeESWe5AVkgF9w+xbvf?=
 =?iso-8859-1?Q?FFmo6kof5OzT9hDNddgbf+KurNwrsFzZjGxk7j9KDECJkWQRN2UmC5CzmG?=
 =?iso-8859-1?Q?bF12FMqa4I+oQGCa3p3wMJz50iheafIsLVIQBP68Gh0w/w3LFzcC6FLGDV?=
 =?iso-8859-1?Q?TtNpLC/lYhzEGGDzRV7AsDb5l4uxrOJ7hoLDGzx0ouSuv+2uVHEHM7MZcR?=
 =?iso-8859-1?Q?0AGrc5bBgSH1VCj29nkJVa9aZoyWV7N+cXnHW9IVqZe3t0fkqRnoZxSXf9?=
 =?iso-8859-1?Q?0236Vae5r+7DD03ehkvAi35ZFiAGnDIiItXUcu+oJgbKVtDZZG6Yz6KuVS?=
 =?iso-8859-1?Q?zyarz3I0q3qnSAVvuMwQauMy0PBYEBT/DP0Rpt6qTu8ctXnB996s53gLTU?=
 =?iso-8859-1?Q?ti4ST39qZj9/svmZJriivfcVnQtKXSwbD+EiqRpl5B+4W/u/5omsc5EDh3?=
 =?iso-8859-1?Q?uUJT3VJhjc9OMs8WYdSwvAznyRvaCMiCqQckyFCx7Lk/hEBooLV4mTzHkF?=
 =?iso-8859-1?Q?x2iPHF0Zd27dbbSETSVIDMwTQhRMiL0s00ZJqMd0X7Qg2h51OUDfmeCOTd?=
 =?iso-8859-1?Q?8TPxQ+WRL68+xDTdzd42DfXTp/JBjCghagmWgJuWjc0yeDgbB5TogbQm/2?=
 =?iso-8859-1?Q?mvSjeUCnqTDLfydWmQuplUBbRMb9fo0wAdpUNUS27s+X8R9QxyifCidBzl?=
 =?iso-8859-1?Q?jT9RFjXS5t5FwE4Mdecwv19357UgAbHWGXid9td896JAehaErw1W2v38kg?=
 =?iso-8859-1?Q?V+q2Blsz28J477LRNegVSBCu77Ra6LkImI3UxwEoQoo7OWvQtWvrbqi/Xq?=
 =?iso-8859-1?Q?r9V7PJD93fJAE8M4y6Qp/aQRA1u9yTcJg5FFhPrlH3FnBm3KCgQHtznPOI?=
 =?iso-8859-1?Q?l6OqASUXcJwAt8WRO//TmMSyOptK+uaevhjL8p6rJTAhE4oZdmLCC6nEDG?=
 =?iso-8859-1?Q?VOYuJj85/MPArH4qt6LzVR/f9kd9Nc4DGhGKdz1D//vpGaDzLMsxEGjqnB?=
 =?iso-8859-1?Q?y7HB0M46J6PqaPJnb9bAWq85puYXZcqXiNH+74mJ/ODX95mUSy1pBnwT2V?=
 =?iso-8859-1?Q?NI1n1HQLAnWd+oauv8fJKgTjkawS62z3KVmdGYXZ5IZzeVI6/Yvfeese9b?=
 =?iso-8859-1?Q?qijJ7QOZwf866PVNr43x3ZcBT23VjTiJdkJU9OsOW6qGCrl8pTAsnaOKWC?=
 =?iso-8859-1?Q?9BcbPt0xmNZoAF6v2HiVvqB44OeBHqY6yXcap59oGsTYiT6ntE+JxygYdQ?=
 =?iso-8859-1?Q?l2qNX6ZZhGfr8qdiVunH+aimba8CCVm1nIf+XBKaF1kCby4mfT0zc4Jyy3?=
 =?iso-8859-1?Q?qk5XlSCgo56sAfmuFfDZqZX06r6OlmiMcPYL7QJX3d/4uv+ICpF/kB6yHB?=
 =?iso-8859-1?Q?jWSpwEPAvNGxOA/74uggjYRnrIlkSXzPiglwf3OsExQtbZd2mx8lmh/6Uu?=
 =?iso-8859-1?Q?vcrw3oNppzMSfo1shUWJPPVMZhFqYoE6OQgmSPrauNKA/bFKeYPzemhGM2?=
 =?iso-8859-1?Q?HMd7xw4aqjD4Tr+JU8DpSigkUn5Gzlm91z82w95ubDpfzblxV5TiBdgw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2219cb7-4729-43ef-a2fd-08dcb4a93594
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2024 17:16:42.2838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9B6o1WMwPY/qnEgQkHP7VupTa0Zgsg6mTL3zMDyeruD/TQgQBxpVpgHMUBmoD14bdZ0/DuvVqFhMNWspCFklZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
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

On Wed, Jul 17, 2024 at 06:35:19PM +0200, Francois Dugast wrote:
> Test parallel execution of LR and dma fence jobs on the same device.
> 
> Add the following tests:
> * "exec-simple-batch-store-lr"
> * "exec-simple-batch-store-dma-fence"
> * "exec-spinner-interrupted-lr"
> * "exec-spinner-interrupted-dma-fence"
> 
> v2: Remove useless exec queue priority, multiple job submissions
>     even when running without preemption, nits (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_mix_modes.c | 268 ++++++++++++++++++++++++++++++++
>  tests/meson.build               |   1 +
>  2 files changed, 269 insertions(+)
>  create mode 100644 tests/intel/xe_exec_mix_modes.c
> 
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> new file mode 100644
> index 000000000..f7bb96255
> --- /dev/null
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test the parallel submission of jobs in LR and dma fence modes
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
> +	enum job_type job_type, bool allow_recursion)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
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
> +	enum engine_execution_mode interrupting_engine_execution_mode;
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
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	exec.exec_queue_id = exec_queue;
> +
> +	if (job_type == SPINNER_INTERRUPTED) {
> +		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> +		spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
> +		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> +		if (engine_execution_mode == EXEC_MODE_LR)
> +			sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
> +		exec.address = spin_opts.addr;
> +	} else if (job_type == SIMPLE_BATCH_STORE) {
> +		exec.address = data->addr;
> +	}
> +	xe_exec(fd, &exec);
> +
> +	if (job_type == SPINNER_INTERRUPTED) {
> +		if (engine_execution_mode == EXEC_MODE_LR)
> +			interrupting_engine_execution_mode = EXEC_MODE_DMA_FENCE;
> +		else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
> +			interrupting_engine_execution_mode = EXEC_MODE_LR;
> +		xe_spin_wait_started(&data[SPIN_DATA].spin);
> +	} else if (job_type == SIMPLE_BATCH_STORE) {
> +		interrupting_engine_execution_mode = engine_execution_mode;
> +	}
> +
> +	if (allow_recursion) {
> +		igt_gettime(&tv);
> +		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> +		{
> +			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE, false);
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
> +			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> +				 job_type == SPINNER_INTERRUPTED)
> +				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
> +		}
> +	}
> +
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		if (job_type == SPINNER_INTERRUPTED)
> +			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +		else if (job_type == SIMPLE_BATCH_STORE)
> +			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
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
> +	run_job(fd, hwe, engine_execution_mode, job_type, true);
> +}
> +
> +igt_main
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
> +		bool supports_faults;
> +		int ret = 0;
> +
> +		fd = drm_open_driver(DRIVER_XE);
> +		ret = xe_supports_faults(fd);
> +		supports_faults = !ret;
> +		igt_require(supports_faults);

Noticed while running this test, this check is inverted.

Should be:
igt_require(xe_supports_faults(fd));

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
