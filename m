Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9855CD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 19:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F9110EDFB;
	Thu, 28 Mar 2024 19:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+BI1rJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF4310EDFB
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711654373; x=1743190373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GDZXHeuDv+Q1YF6tvgxfM7HrGbU6X1PX8mcHYXfqzp0=;
 b=P+BI1rJL3ym2PjyN84hyNsV53lTmj4seKbgvWQlEH/fUztB+t98hGbsy
 uTACqr1lohd14wslauZo/S97Xl0vO+RXYIZk2EkCOfYcl3j9yfmNEvtZV
 Xf80jcdWjJcKtS5hNfm0Kq5M/IDVmn/3dGIsQ6ZdMwnGuLBbeNnYdzerq
 uCtRO3JuqRETw5lXEZDQ3vGX37S2nidyVyvENd6vQYdsOOCy95P3D3OZa
 GHuAAw1xkeD3HNWAyo+SRUWJwAnNo9oACBpNRa7rIRwd4fV6yTkgBZAbx
 HRftSVWqW1346KItTILCYr6y2ZttKOXvbeTBYkOho9/vFcgfLgoAUJSMv Q==;
X-CSE-ConnectionGUID: P9kfqwUIRQWYt6FBBFpl6w==
X-CSE-MsgGUID: e80klCBJTnCWE9LaGAeSxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17557696"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17557696"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 12:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16625130"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 12:32:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 12:32:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 12:32:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 12:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUqu1TAEaLdLOVFoYuQ2ycGZYGAslizPBew2ViYv+rf49/p2jrSkquU3yURKjjj2k2pkWLdOWaYAK83vOYu4UC+Hk+nSYH3DjpHHjdVTDSJSqNMJvnWCh97lkVNrEUWzc3izUioomhfUCYfFh+5Np+PZkcc+NbXNpfcU49cCFDSn9+Posn+0LTJH+AAkdUqL7xfp1v1Qf+DhGZvsLzsxATtLREk8YoUZ+2a8N6ccAL+/CO23xK9xicycmC6c8o3nFhS9ExARu4ayqz4wRn0VdjPadtIWzk/Cv0CuWJNNT7xP/jPVudgbApwGZxjuW+O+uI5wBV3y/WkejPZ/hYYlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9bLxb0A8zN2lFQbjV5KRvqVDYqOURuC16pS0GHjEDA=;
 b=lEwmf8qAWGEnkY8TFLJE950D832/RFwYxrxbjkJsgcoAjLCiyqqJDU/foewq/IN0K7C5K0V6/4KsPadnkYz/P5e5iZMRBjwxTxWJ8YQRfXhix3+aFJsGerb99A0zixx9+eCFZSh3ag2YdaavSQRY6QzXrDZEzsqBoR3w7VzdButLUKnMZne3ca+jx/qo36gy88OHH/9xMzqUxwcLMtNFaHA/oJCNDVrPAVH1aS3OHvNIAQMcDzBC8UlvGMvkVaQH9uXTjMHkN/J90WhhscmY2dow8R3rayAp16OXkgjZAyw4hfdlhH9h1rog8Vtu9GxDPMlBxl43+2CB8qbivuPNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 19:32:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 19:32:49 +0000
Date: Thu, 28 Mar 2024 12:32:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <balasubramani.vivekanandan@intel.com>,
 <lucas.demarchi@intel.com>, <gustavo.sousa@intel.com>,
 <radhakrishna.sripada@intel.com>, <clinton.a.taylor@intel.com>,
 <matthew.s.atwood@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <haridhar.kalvala@intel.com>, <shekhar.chauhan@intel.com>
Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
Message-ID: <20240328193246.GH1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240327201232.3910334-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240327201232.3910334-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8598:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Ii7Tpb/rE+1X02tTS8H94FR8L4V+l7gxPlIjjmN8LR4ZbhNEvbGxEBb7HkU1A/dW853BA3qRYXfu3AYm8R0UF/dBiHBuWkDUEp49ox4lpV3RqyI1Wa4OTfGKo/E/toNG/FFFOAlgZRGJzyxeF4hqE5PgjTzUvEFHmTxVpwwouMmEL40zdBljUoSWu4nUmXMb0lEBBVvBtRFPFMki9uxRVoFRBvZAxF86AO3195H9PM8Sv6zImR7cgdowxM5rjDr6AevbxVsxFbnlyHmnumE3oXEjUCdRSX6TEwP3e6FLQQgNLUb/T4HUO03lb812ex6rYEUHd50Nac8rOe+xlS9QctT+9lzsIFvqPxCbtKNOq1xaxB6z/A0gwuZrgokvSZkbp5jKK0/RLgT5oTJbRGbUaFsNnhb//5BuXjYazyZpfCECJe4fsSW8GplewJHpkJlzMVkjIHV5ATwgs8XFXtvdKEjt6mrRPybZ4q/d9NVc4fCLdKRBZzgcwK55eRDzdHwW0UBPRw0dKmvwfur92rWyg1NO96O+Qx3AaXL/tzCOtCTODGVFbSX8y8oCSPXzSO0qjsP/bYCVVyEtE20c3EH6dKnnapQgRuiwklo2wUYTRKaWkffbdjyOV4WylLM3JMeA6lTbxamnpwe25KpG0NoSu7UNmWjX/Zthlk1ceszPiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ot/yPub1xc75UN/lb2HyJcq37S9PoEj7559+00PTUP3gkyzzw5m/ydRRGHKf?=
 =?us-ascii?Q?LgL8lAIe89A0gbJAXAfO5oLIBL3Tx25WaqaxGUJNGkRsFkxpxxTD/9eOHhRD?=
 =?us-ascii?Q?DjHJ8qW5gIpO0R9Qs2OvuZCASyLsMShWHL3u7aXr3+TaGNxepAeSO0Uja2tU?=
 =?us-ascii?Q?7uFZ0R5Q5MA9aQrCVqPgamk468016jS3QPrn86YXBTkUMWxJVBm1xwDVWbWJ?=
 =?us-ascii?Q?+lT824haFeGQDKkzmoLL+FZ9MkAXkm+nK7veezIljTypwtCrNUzN7Yuy0sO2?=
 =?us-ascii?Q?+f1HsWxyWup08CjzkqWbO9l/NDtifG6jwzji6zyEzw0cuXGc2yNHybBFxlol?=
 =?us-ascii?Q?eCajbYbHVlOWCVGxmIWx6ydACHA3HAsX7wqadBKLXAjcnRGN8iiII2ULmFKX?=
 =?us-ascii?Q?ffaXbJw0rLqIbb5aOLbLjN+F+GCuYRhM89SOJ1NWIMJSYH6gOUWdLMvStmfR?=
 =?us-ascii?Q?i/6P/eKRV1Ll/bnKIR9VIobcdr4hfLcFBHRVKr/Uh/Y55Y0K1+KRwI3Rs7p9?=
 =?us-ascii?Q?HUH94dtX67XMNnRJsLGMSWhvwTXtw7l2hyR56w1uNpnRo2lyDNwjpO5NeQFc?=
 =?us-ascii?Q?8kAQDJB8QmI5rFXmD0s/VVHD1bPLwlO6X9gmMf99jgKG82Okcs/WlDMNtpu3?=
 =?us-ascii?Q?fN4HDJ7JbAS56oWVYHw8hxvmOIrm1H9UxZHwBs/4IM9SB5pHrJZjo2ZxQvJT?=
 =?us-ascii?Q?nG5298BAUfaaPommMan3RDsrmzAcOd4AWRIl1e+fscqk0Oa/zf5NG4Qp5/hE?=
 =?us-ascii?Q?NpRx5LmfQXtDkcw+jmb2tqU4Xez7c3hFOs9/35lWCy51zYkooThq/o6rAR6l?=
 =?us-ascii?Q?tRaGWOA90oLHveihFKYBWjjt4SLuThM4/0IOGptY11TU63j+xMTtSm6L2Gb8?=
 =?us-ascii?Q?bKMHOVmzcbhpxW+HaLASez532IqRI/ZYDrfbXBx7msnQagsLaLiTfSrwMaq6?=
 =?us-ascii?Q?60jMMfYYsuxf6rve50UBVT1svgLlUHzBmogsn+hvIYUBXYcE2BnqKe2ClNfB?=
 =?us-ascii?Q?tkpluDSCaQPrxAI3ee2efauuZb3e9p/4fgW6pBqHkwfbqW5d7bI8FyqhfLdY?=
 =?us-ascii?Q?a2O62sahku9BijWFVZuuP37g18+Eyh7y7mnvx8YkYOp9qfAm3rB8Yl/9JuUN?=
 =?us-ascii?Q?cydt3s8SwCe2yRt2iJNiWS36gPfc7evRObHB1t+wvdw9E1sGcqzy57laaEBZ?=
 =?us-ascii?Q?rz1wo2Hfha26I5wL3L/tCzq/cUYEFMuJ+aozTAfb2wt3F3vqtpl2NuePAvfN?=
 =?us-ascii?Q?C6r+dEoHNvX92MYzJqWNq94Nr2kXPeGnufNiMeLoSQa5AXNqLAY2EKct4izq?=
 =?us-ascii?Q?+dBM5vporXZv2aJJV0A/4bOAoQTgzxahQdD3XW1NXz7TEcJOsdtQHRH9G4GG?=
 =?us-ascii?Q?b3trKXQLIFBqV/fwQi2zqlliAa6oy6FHtJRVflkWj9wTXrCmU0vFLU5Uqsa2?=
 =?us-ascii?Q?MRFf0SVL7zAwwb/S1UfbVnpXxE/5ZnQXiq5Z0VY1TVCQdEqpcbHU0u2Og1VL?=
 =?us-ascii?Q?9TShCjqivRWQgRMw2qpmmZWVCwSeJmbwWI8a31g8ItpDK3zLZ+b92HUaac11?=
 =?us-ascii?Q?xBp7ID+r04Pig9XaP7hj/AhseQWvFm3ib5Tt5IxKvrquVeoFMSvtyU2OxP29?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b88c37-f298-4359-c298-08dc4f5dda0d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 19:32:49.0080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbnDe6S8joW3MR1uQVJ8JI/FhByJfc/qjiTRHGfmaJBzFzWuYafMwyd2kVgaATbVUp/n8o0/qyVIsg6RdKrAmuXEErBpMtU98wIZ3IrEXxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8598
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

On Thu, Mar 28, 2024 at 01:42:32AM +0530, Ravi Kumar Vodapalli wrote:
> This synchronizes with kernel commit
> 	2bcf0f9bb33d ("drm/i915: Add new PCI IDs to DG2 platform in driver")
> 
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to master.  Thanks for the patch.


Matt

> ---
>  lib/i915_pciids.h | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index fcf1849aa..85ce33ad6 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -672,7 +672,9 @@
>  #define INTEL_ADLN_IDS(info) \
>  	INTEL_VGA_DEVICE(0x46D0, info), \
>  	INTEL_VGA_DEVICE(0x46D1, info), \
> -	INTEL_VGA_DEVICE(0x46D2, info)
> +	INTEL_VGA_DEVICE(0x46D2, info), \
> +	INTEL_VGA_DEVICE(0x46D3, info), \
> +	INTEL_VGA_DEVICE(0x46D4, info)
>  
>  /* RPL-S */
>  #define INTEL_RPLS_IDS(info) \
> @@ -709,7 +711,9 @@
>  	INTEL_VGA_DEVICE(0x5692, info), \
>  	INTEL_VGA_DEVICE(0x56A0, info), \
>  	INTEL_VGA_DEVICE(0x56A1, info), \
> -	INTEL_VGA_DEVICE(0x56A2, info)
> +	INTEL_VGA_DEVICE(0x56A2, info), \
> +	INTEL_VGA_DEVICE(0x56BE, info), \
> +	INTEL_VGA_DEVICE(0x56BF, info)
>  
>  #define INTEL_DG2_G11_IDS(info) \
>  	INTEL_VGA_DEVICE(0x5693, info), \
> @@ -751,10 +755,13 @@
>  /* MTL */
>  #define INTEL_MTL_IDS(info) \
>  	INTEL_VGA_DEVICE(0x7D40, info), \
> +	INTEL_VGA_DEVICE(0x7D41, info), \
>  	INTEL_VGA_DEVICE(0x7D45, info), \
> +	INTEL_VGA_DEVICE(0x7D51, info), \
>  	INTEL_VGA_DEVICE(0x7D55, info), \
>  	INTEL_VGA_DEVICE(0x7D60, info), \
>  	INTEL_VGA_DEVICE(0x7D67, info), \
> +	INTEL_VGA_DEVICE(0x7DD1, info), \
>  	INTEL_VGA_DEVICE(0x7DD5, info)
>  
>  #endif /* _I915_PCIIDS_H */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
