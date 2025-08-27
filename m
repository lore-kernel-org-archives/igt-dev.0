Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF095CA0EFF
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 13:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9802410E0DE;
	Wed, 27 Aug 2025 13:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiW+ONq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE70D10E0DE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756302740; x=1787838740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IY9YdIqmYu+TcrVrQlo+GP7lg42qFHCTA+B1WYmAegY=;
 b=UiW+ONq3zriNL3LDoWkUOjJmXwfMsb8gp1yX/dnfGdtlI8yxs9JDyaMM
 wz9bOD8YTqwtPxCI00nLxNJ32FTae60cKbqc0M2oDMPMJqCg0Qz1BHqcC
 8o3caNesTex4iafvVFIjZyyc35YWb0uarTLgMgITmcYOD9qNRKrOvzDp9
 lsAMqA9SgLHW0x8+7D/8hgcewdGwasO6FERCRhzP71kfemP9+dn0kU+gD
 n2eqdlP3nG3DGaZAECFFiCKBxKmwBFa/g7LNi4O0V5aDJ1ogM+jhBETqi
 fAY45qg8jgbyoFq6nvPYGzijX506Hf3Td/I/tL4/fptQvVjQIe48F2Gjl g==;
X-CSE-ConnectionGUID: V/sG8DhHQzWJnx06p97ydQ==
X-CSE-MsgGUID: JVJ899rwQKKyoYhtG8duAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58472361"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58472361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:52:20 -0700
X-CSE-ConnectionGUID: KsP0p1NrSrSREcHKV1ddwQ==
X-CSE-MsgGUID: QxT/E4ZxTwKwjTwd8pItRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200796992"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 06:52:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:52:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 06:52:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 06:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVZWbnuyeMKtLnR+3Oi03+BWtp8zjUswxke8PIMFmSvMXzsBzOdfQSUkcG8mc3Af0HL8NhT3UUZrv19dFBloZW/sFq3OeyQ3mqsa2HOub/yavXuxGeB0asidpU4MNeeKFHbFFYeAER2F+fJEpgIuDPnovHgaH96mOGl5nSxRq/8uSLn7cZ8LKxpQihxPVOMpr8vYNFta5/8WWEfPe7RYYyYOibT43s93x38Z5l4IFyfVeHds7yY/QY7FlnInrIdEeb/KlKL31btPG3aOXZm/AA4M0KMkYf4HtPN2jDZ+Q0DktB58kNDGB3Yytw+7KYJ4Oma0IBFRqUw7qQVd1PQMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy6NCNOLt/rRXKAej7rjAPR1TwF4UzpU7pxL1bZxzl0=;
 b=bw3zW8Tv2Q6nno09MRYpWy1aB6yWuX0zDfRRQWxS4qzABzhmj8U1irZl0Sd0jgidIgMjkgw1dvEHSAzTamsWp7n2QFIpNWz9G0Bcc9EE73JVjXOchUELaL2adGdR7XOp6jos+e4Gah2uz/k9WXYWISkGHvH3MgDvBZWt1rnMKbTy0HRNz6971yjjmGTOv5hCMmFjSl3M8lvH1NWHpxFL192Bcw+B2CHjlqXrdcnltYKhnZmOyzK4KEF4M2zxG7MDhWkvyiLMS7i1ahcbeyMmvLlwxNksDe5hwB9WRp6gj+wYKiUdrO0W7JFBWTMQ0SX/2Ox5eRB9KT3xwCKNHCKnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 13:52:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 13:52:15 +0000
Date: Wed, 27 Aug 2025 09:52:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3] test/intel/xe_pmt: Add testing for BMG crashlog
Message-ID: <aK8Ni4mAojQwUuvE@intel.com>
References: <20250811210532.1023142-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811210532.1023142-1-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BYAPR01CA0023.prod.exchangelabs.com (2603:10b6:a02:80::36)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d07cf62-d1e7-49b7-4c9d-08dde570ee2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HbvQqQEisKkuk5BE4+/flP0oWXL1TB6bkcIIYx1AI3ncpaXjGlafb/yA+k?=
 =?iso-8859-1?Q?zqYYBCHx5zdcE2QzmkRYI3mQ9XQjV21Mji97GWzQnGPrIfeqc2CuYqEucL?=
 =?iso-8859-1?Q?cTY76My8LmGKrE+0F51hcfgb0vBMApYiPl7w8OOi/taoNpX8igVfkf3fVt?=
 =?iso-8859-1?Q?kUNf6fbomLCK1ctdIggFksM0qj5UY1eRA4u5o+3spxd42VDGcmz9nVo/tW?=
 =?iso-8859-1?Q?dNC1KGjUjLo7jsun8qaHs05VrHucfvS2ZvxTn6Fp4IgoxjHozpJIiQsdQk?=
 =?iso-8859-1?Q?s6plPbbD6RsAz9Q5Ai13VKKXTdv8jiQLkDeznBRYTtmzh6IsMqFPKmZkDz?=
 =?iso-8859-1?Q?MT3UDUGPt6MN2HHioAcPxqxTxC04Zu9la9AdpbLyklUBV8RLedsViWcDw/?=
 =?iso-8859-1?Q?/aSa90gKwHNvu/a7lyfliDwUikOMOdRjsixsYESL7IUtRcslHNguFrM8XB?=
 =?iso-8859-1?Q?BI4Ee2VQe1l7bzVEHRo0PN8O1x757Ec5m5yZcV+qV9kKLwexlrS+14AMkg?=
 =?iso-8859-1?Q?+icYsaj2T67IbpdMpkTgBNbvJYaSK6gbBTlTu/dvf+vyQJEb0r7/IRvpBb?=
 =?iso-8859-1?Q?PwvBHZZWr7nbIX7mLeV2DJ+vTMMXpMnF4XHSDTNQlqzDvR/leWD033bmRj?=
 =?iso-8859-1?Q?N/1In3fpRkHX/mqH7DwTH1ZIgAmQ26W7R656szmvOsvHq7YM5T3jNqlBGV?=
 =?iso-8859-1?Q?fSxA2yDqIxwSQt1XFLYcvYQqIacJUqS1d500G4svz9K2sXeZUYQoX4HA/6?=
 =?iso-8859-1?Q?Ex/MuaKnr3BNOxJ9YB0PPOxFUz+0lM5W8te29ezb8r4fYt1mYmBzJGj2Jq?=
 =?iso-8859-1?Q?71KvLNetKj9eTKkAhsAdLwQAL5CpWD9E+r9871skuR1zh8XQAeHLdowCyP?=
 =?iso-8859-1?Q?TrL4uc0sAYlldq0/Ozt8PdH3lYhrLqK3lyOkLCLHqmm+sqO60ZPFRU+7vq?=
 =?iso-8859-1?Q?uGHvCel154y6VXlNeHPUNSyLmhdOTLzbCYOwt5oPm+evdVh02GgqINlNCK?=
 =?iso-8859-1?Q?zIYf/DG7YSmi1hh/FckRvFS9j8I9PY8rye3mJVFadeNKehTrakBXS8uHl6?=
 =?iso-8859-1?Q?welVRQxdeMQBvLJy5F/S73FehzHU255fhW8COEZWIG0TRIquKo+zVm4NOJ?=
 =?iso-8859-1?Q?WLd93oEM3w4oAoujQbGNM22EGXwqr/UTHs14ntwoWyhyhuVcyZAd4b2PQa?=
 =?iso-8859-1?Q?eFs+1Q/zYq7ftyT64oZRfQUNdcDDjVKWofIkF9FwvvTYrsKy8GKp3HYJHN?=
 =?iso-8859-1?Q?k7/RE6KC5Qg4fU9uESV27/5OlDsvuUXDfvyWoDFG+DYDUTpZVIoiYLLrYc?=
 =?iso-8859-1?Q?aRbZ+Rlc5shMvWMay1OIR71XnBzj5BPxkn36+h7SBXGU7YqwfzgNvWq5iL?=
 =?iso-8859-1?Q?TwnYut3BFMQovXlvCDXM+kj1tLAdrl9aCE18L6ZejYe2OJUvF9BS1IrZLS?=
 =?iso-8859-1?Q?VclGVy1MX0YmkQq3JFIFYgmJSqJMJqIlMwCT1nwDqW8Xp3RIRqm50S74aJ?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xTYpt/xemgsZl2o7FWHBhCrbbk/1VPHcyJsiLPv7soCbyit05/zkVlSVD+?=
 =?iso-8859-1?Q?21wPINTaCXsYu1nmaxArQlcmuBxEL+QIK9wwvrv+HeBU42liu5uFEWyvQg?=
 =?iso-8859-1?Q?zN+snEzAa3vwybvyuTjypUpd1UlEdFiTTRhaeHZ58Q7jsYaCxh+BWd8G28?=
 =?iso-8859-1?Q?HHblwuB87RPZmbWnK2cwrw7GDy9ECBqmx3UZ4P1bBx8gFiXpR1mSXSzb7a?=
 =?iso-8859-1?Q?GOMxX3ZIpA5y7Ks5kaPb8bSbXutzuP7+3Ophg3qwTRhLUidKut5vzafhb0?=
 =?iso-8859-1?Q?noHteuoAi0GRE3rdMy1ZxaNyBUWJv0qBqedk1qMZXFhXZHvfhf4pCwhN3j?=
 =?iso-8859-1?Q?RNhnbtB5lb3ZZDGGY6T0MUwbFTsMbmxOfcpOYvk/z3jCc2stz81dbtlStP?=
 =?iso-8859-1?Q?TSNqSvuNONttgc22fvyU46omfGFtfgMNFY8utf1q2vyyyFEYHW1Zk83CyL?=
 =?iso-8859-1?Q?QAKr8dhyeVNDX9jwvfH87IpGHsbXOOENE6E6pI4R+bnDcS2kcuAtZGNSli?=
 =?iso-8859-1?Q?9HQTuvC4AVE7pdl7mxpetkx+SpD4bqg+GIbRVB7dOcYlYOrhDhkhkTEKE5?=
 =?iso-8859-1?Q?MJlGyD/VZLyl3D25KkGSDXTnNf1vnAvKSqsqcK3xPYRlQvSdDjrmu6XVHH?=
 =?iso-8859-1?Q?4TK2VKxeQhu/Oda77LKduI8GnFOt3aftC3cPmdC4vGnvhNQdaRbSJaMChl?=
 =?iso-8859-1?Q?a90rqy6Q2I4st4h2QgeXpwiu7kqJ6IdzylWV/dlg8NHYvfTByXGNSnIwTs?=
 =?iso-8859-1?Q?isGkuwxUdIFj96+F/QZMK8j5hfkAg9tVqYeM8CE88PRY4h0uPf3gjWOPaF?=
 =?iso-8859-1?Q?eE1HUQqKgGrqQJARCsmSlxw9vnhl5og6g3AoBSnpuqhCYrupFIxgmWdC6e?=
 =?iso-8859-1?Q?S0tK4swg4WC/h9hFtMa6BDBmt73UKBrQEx088j/G05+NwEBm3GPeWLgxNG?=
 =?iso-8859-1?Q?Qa2oy1DpKYAh6rNXNwNcY5GJIFkeq/UcEVlMXN3eRMlTK3njqFCjo3ZodR?=
 =?iso-8859-1?Q?ttsC1eT/lC/2F+3FDehHLL1NtCX6sZ/VKbhsbgTtxTnyEMOWCsgWuGulj0?=
 =?iso-8859-1?Q?X2O4YR9TDk7vO6yb6wLH3Xr5UNBFKGEPUv4s3I+RW/ZXLVjxTBgUYn7vQ6?=
 =?iso-8859-1?Q?gla+bcVPLw7O9o448F91vHTim4QSL3dzWAh++tgolTyX5tB8J8efttgACC?=
 =?iso-8859-1?Q?oGz8C7T1Eq9yjgOjeqziIEIzkWIZ+/Im4bOPHgudf0e4jchy1zA2PztYH/?=
 =?iso-8859-1?Q?cVMI+1pPg7+8TdN/nyRUgF+FZB5gv5K8cumB3Q3fOsktNkzbPLJAgfU0HI?=
 =?iso-8859-1?Q?yPKWDEZnYZ2Z7ta2sndvjLswXl0d5HuABljdBX/0hB/g81HK+HDhGzWERh?=
 =?iso-8859-1?Q?D+rXXtbxWS77W6mMtz5DAaYu5nAu6klqOZz9uyBvgr8ihLsrG5InecedHy?=
 =?iso-8859-1?Q?VnAPny4q+AWA/qKbCnPEDFG7C3U+nI4uldtikkLDYISgBOc8vYy3emZDc8?=
 =?iso-8859-1?Q?ZN5eiNu6tiZDbCDudtBzVUfoRkSxE2eazRaYOHdD8JAZU+8xs5bUJP9J8J?=
 =?iso-8859-1?Q?guS4kVPNEpT0yL53H7VsxXsh2381vZRTQ6Nuoe6AN8Rv/p252fVf/8LAtm?=
 =?iso-8859-1?Q?ITHI26P6/SKzBM56ZIlj9WTYkt0tVvnHODHyO2otYZgp82+R4TRsQfZw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d07cf62-d1e7-49b7-4c9d-08dde570ee2e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:52:15.5437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RDGdmE+8QCnWF+ZIvTHIDi5rrk460MXkSQj5RrGkBcv1bD+FquvbmkskIP505PT7jg5CRpiYSy82wnyskBssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9256
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

On Mon, Aug 11, 2025 at 05:05:29PM -0400, Michael J. Ruhl wrote:
> The BMG devices has the PMT crashlog feature. If the devices present
> is a BMG, test PMT api.
> 
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.

I believe this should be a comment inside the bmg function instead of
a note in the commit message.

> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 543 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 544 insertions(+)
>  create mode 100644 tests/intel/xe_pmt.c
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..c2594730b
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,543 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Description: Verify that the available PMT files (crashlog and telemetry)
> + *   are created, are accessable, and respond as per design.
> + */
> +
> +#include <unistd.h>
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "linux_scaffold.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* base directory names */
> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> +#define CRASHLOG_DIR "crashlog"
> +#define TELEMETRY_DIR "telem"
> +
> +/* itemize the available instances for the specific device */
> +enum bmg_crashlog_instances {
> +	bmg_crashlog_punit = 0,
> +	bmg_crashlog_oobmsm,
> +	bmg_crashlog_max
> +};
> +
> +enum bmg_telemety_instances {
> +	bmg_telemetry_punit = 0,
> +	bmg_telemetry_oobmsm,
> +	bmg_telemetry_max
> +};
> +
> +static char dev_path[PATH_MAX];
> +static char work_path[PATH_MAX * 2];
> +
> +/*
> + * In most case there should be a single instance of the crashlog and telemetry
> + * directories. If DVSEC entries are not contiguos the structure will be different,
> + * and the code will need to reflect the structure.
> + */
> +static char crashlog_vsec_dir[32];
> +static char telemetry_vsec_dir[32];
> +
> +/* This needs to be specific for each supported device */
> +static char crashlog_dir[bmg_crashlog_max][32];
> +static char telemetry_dir[bmg_telemetry_max][32];
> +
> +/* telemetry file names */
> +static const char *telem = "telem";
> +
> +/* crashlog filenames and descriptors */
> +static const char *clear = "clear";
> +static const char *consumed = "consumed";
> +static const char *crashlog = "crashlog";
> +static const char *enable = "enable";
> +static const char *error = "error";
> +static const char *dev_guid = "guid";
> +static const char *rearm = "rearm";
> +static const char *trigger = "trigger";
> +
> +struct crashlog_v2_info {
> +	int clear_fd;
> +	int consumed_fd;
> +	int crashlog_fd;
> +	int enable_fd;
> +	int error_fd;
> +	int guid_fd;
> +	int rearm_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +} bmg_info[bmg_crashlog_max];
> +
> +#define DEV_PATH_LEN 80
> +
> +/*
> + * device_sysfs_path:
> + * @fd: opened device file descriptor
> + * @path: buffer to store sysfs path to device directory
> + *
> + * Returns:
> + * On successfull path resolution sysfs path to device directory,
> + * NULL otherwise
> + */
> +static char *device_sysfs_path(int fd, char *path)
> +{
> +        char sysfs[DEV_PATH_LEN];
> +
> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> +                return NULL;
> +
> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> +                return NULL;
> +
> +        strcat(sysfs, "/device");
> +
> +        return realpath(sysfs, path);
> +}
> +
> +/*
> + * SUBTEST: pmt-directories
> + * Description: PMT directory structure:
> + * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> + * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> + * If this is done for a different platform, this could be
> + * different.
> + *
> + */
> +static void test_pmt_directories(int dev_fd)
> +{
> +	struct dirent *ent;
> +	int index;
> +	DIR *dir;
> +
> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
> +
> +	/* verify top level PMT directories */
> +	dir = opendir(dev_path);
> +	igt_assert_f(dir, "no directories found\n");
> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
> +			strcpy(crashlog_vsec_dir, ent->d_name);
> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
> +			strcpy(telemetry_vsec_dir, ent->d_name);
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
> +
> +	/* verify crashlog directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	index = 0;
> +	/* find the crashlog<x> directory instances */
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> +			if (index < bmg_crashlog_max)
> +				strcpy(crashlog_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
> +
> +	/* verify telemetry directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
> +
> +	index = 0;
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> +			if (index < bmg_telemetry_max)
> +				strcpy(telemetry_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
> +
> +}
> +
> +static void find_pmt_file(const char *path, const char *file)
> +{
> +	struct dirent *ent;
> +	bool found;
> +	DIR *dir;
> +
> +	dir = opendir(path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	found = false;
> +	while ((ent = readdir(dir)) != NULL)
> +		if (strcmp(file, ent->d_name) == 0)
> +			found = true;
> +	closedir(dir);
> +
> +	igt_assert_f(found, "missing %s from %s\n", file, path);
> +}
> +
> +static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
> +{
> +	char file_path[PATH_MAX];
> +
> +	sprintf(file_path, "%s/%s", path, file);
> +
> +	*fd = open(file_path, flags);
> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
> +
> +	/* TODO: match flags to file attributes */

are we really doing this or should we remove this todo?

> +}
> +
> +/*
> + * SUBTEST: pmt-telemetry-files
> + * Description: validate the expected telemetry file(s)
> + * Test category: functionality test

We shouldn't use the SUBTEST documentation for the cases
that are not actual igt test case.
You can put some comment here on what this is aiming to
validate, but without the subtest documentation imho.

> + *
> + */
> +static void test_pmt_telemetry_files(int dev_fd)
> +{
> +	int i;
> +
> +	for (i = 0; i < bmg_telemetry_max; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		find_pmt_file(work_path, telem);
> +	}
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-files
> + * Description: validate the expected crashlog files
> + * Test category: functionality test

same

> + *
> + */
> +static void test_pmt_crashlog_files(int dev_fd)
> +{
> +	char buf[64] = {};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
> +			crashlog_dir[i]);
> +
> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +
> +		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		bmg_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +	}
> +}
> +
> +#define ENABLE_MSG "1\n"
> +#define DISABLE_MSG "0\n"
> +
> +static bool send_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	int ret;
> +
> +	errno = 0;
> +	ret = pwrite(fd, msg, len, 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
> +			 errno);
> +
> +	return ret == len;
> +}
> +
> +static bool verify_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	char buf[32] = {};
> +	int ret;
> +
> +	errno = 0;
> +	ret = pread(fd, buf, sizeof(buf), 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
> +
> +	return ret == len && strcmp(buf, msg) == 0;
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-enable
> + * Description: Set enable enable/disable bit and verify usage
> + * Test category: functionality test
> + *

same 

> + */
> +static void test_pmt_crashlog_enable(int dev_fd)
> +{
> +	u_int32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].enable_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* force enable so we are in a known state */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
> +
> +		/* disable */
> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
> +
> +		/* re-enable so we can do more testing */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
> +	}
> +
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-clear
> + * Description:
> + *   Test the clear crashlog bit. After setting the crashlog data buffer should be
> + *   set to 0xdeadbeef.
> + *   "0" (DISABLE_MSG) is written to the trigger file to set the clear bit.  BMG does
> + *   writing to the clear file, but once the bit is set it cannot be cleared with a
> + *   reboot.  "0" to trigger is the "standard" usage, so test it.
> + *
> + * Test category: functionality test
> + *
> + */

same

> +static void test_pmt_crashlog_clear(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		clear_fd = bmg_info[i].clear_fd;
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> +
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		/* wa punit issue for first crashlog (NOTE: this is fixed)*/
> +		if (i == 0)
> +			val = (int *) &buf[32];
> +		else
> +			val = (int *)buf;
> +
> +		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +	}
> +
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-consumed
> + * Description:
> + *   After a crashlog has been "consumed" (read), setting this bit can be done.
> + *   Verify that it is set correctly.
> + * Test category: functionality test
> + *
> + */

same

> +static void test_pmt_crashlog_consumed(int dev_fd)
> +{
> +	uint32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].consumed_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> +	}
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-error
> + * Description:
> + *    The error bit is set when a crashlog fails in HW.  It is read only so only
> + *    need to verify that it is "0".
> + * Test category: functionality test
> + *
> + */

same

> +static void test_pmt_crashlog_error(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-rearm
> + * Description:
> + *    The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + *    occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + * Test category: functionality test
> + *
> + */

same

> +static void test_pmt_crashlog_rearm(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +/*
> + * SUBTEST: pmt-crashlog-trigger
> + * Description:
> + *    Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + * Test category: functionality test
> + *
> + */

same

> +static void test_pmt_crashlog_trigger(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
> +		sleep(1);
> +
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +/**
> + * SUBTEST: pmt-bmg-tests
> + * Description:
> + *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
> + *   individually unless you understand the underlying HW behavior.  Because of this behavior,
> + *   all of the test will be done in order in one step.
> + *   NOTE
> + *     o Testing MUST be done after a cold reset
> + *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset.
> + *  Test category: functionality test
> + */

Then you just keep this one that is the actual sub-test.


> +static void test_pmt_bmg(int fd)
> +{
> +	test_pmt_directories(fd);
> +	test_pmt_telemetry_files(fd);
> +	test_pmt_crashlog_files(fd);
> +	test_pmt_crashlog_error(fd);
> +	test_pmt_crashlog_enable(fd);
> +	test_pmt_crashlog_rearm(fd);
> +	test_pmt_crashlog_trigger(fd);
> +	test_pmt_crashlog_consumed(fd);
> +	test_pmt_crashlog_clear(fd);
> +}
> +
> +igt_main
> +{
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] = {
> +		{ "pmt-bmg-tests", test_pmt_bmg },
> +		{ }
> +	}, *f;
> +	int dev_fd;
> +
> +	igt_fixture {
> +		uint16_t dev_id;
> +
> +		dev_fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(dev_fd);
> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT currently suppot only for BMG GPU\n");
> +	}
> +
> +	for (f = funcs; f->name; f++) {
> +		igt_subtest_f("%s", f->name)
> +			f->func(dev_fd);
> +	}
> +
> +	igt_fixture
> +		drm_close_driver(dev_fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..46d36962e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,7 @@ intel_xe_progs = [
>  	'xe_peer2peer',
>  	'xe_pm',
>  	'xe_pm_residency',
> +	'xe_pmt',
>  	'xe_pmu',
>  	'xe_prime_self_import',
>  	'xe_pxp',
> -- 
> 2.50.1
> 
