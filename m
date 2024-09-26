Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D918CDE032
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 18:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB6C10E089;
	Thu, 26 Sep 2024 18:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fk77naaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F47610E089
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 18:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727376639; x=1758912639;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OpS/k+jPZe56bekB5J/o9tQlxxMU3rADmzTU1VJIt2M=;
 b=Fk77naaNu3ywrueIt6b4Hb0STxPQn6KWcuQQYtRJaAOWkCC+EZdfuFhr
 zrw8Z9bZakLXDctuZrWyBZQ8r835/u569EjmiVR0sx94F9byltQwRkI7C
 KbxTZ6VoVl0Zl8Dc2oGBHOck4zIPehr75Q4HunRveBJbodMzTJm98+9nE
 N/MYAMKYEFKo8CU4bgAUTtF4wSEiWB01fxcZsJIs5iA+G39+TCYnweAm7
 9PY+Hi6Hp9GSJtN0fo54maUZwU0Naje2xka4atO7qJXB0nPLioHhnniz8
 jmH/bnsXx3sHlJnb34a+muk9+lIJ3NcnwdvP0xeGUbjPwsKnTePHXFTa4 g==;
X-CSE-ConnectionGUID: IjLw8e8NSSmPCtv/o9VR0w==
X-CSE-MsgGUID: mITdrc2CSemHfemsMD8H6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37860277"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="37860277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:50:38 -0700
X-CSE-ConnectionGUID: ctIleR4BS4eBeYqmnUhVew==
X-CSE-MsgGUID: hk34LmTiStOIgk7RKwo1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72698262"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 11:50:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:50:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:50:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 11:50:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 11:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWeCzNKzC7L4TQclrQkTx98QED/KpbmapCX9e9kFon2ug74/HPTwLQRKLc7xqcJIh0sPqYTUpU+nytagy3de6zxzlhXiSHPEsla4QS6A3URKEFRNXc1xjJywY+pGDfd+5C9ED8WyolE12U773Vq5L3ellRXq2u13AaGrTYrsdZpI9YnNiyGxm/2d/O35paZh8Cen4iVLb88RvMcuEvJcobkgLT/FM92bjjs1POerXVl33D9HRlXbaX5DVosxGRj/r7yl0rurQVbVsoHXYHRZMu7IJXF7jFq9Mq4kNTlT8Vquu2AygKv7xTqS7W1F/rh+ww6iVMCfGRSGMNcZbsZGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE1DPddlVvvY8PEhX17tVR+wB9AoAt1pBuLaQLKaVkU=;
 b=ORSSJazZqOy4KpRpy5gG1JeSnILcpyskqm/N3mneaoK5bJh9RSx9Uk/k9SgkTkIxqNmIWs8t9N1676dvVKxLTSEQuuKp75sHOOtRvlIzXzUSQy5USrCoSo5RL3WY8DAUS3+XEfv9ZcUITLVJAHXgguaim9crrDAm6g6J9Z+/VV3I1DCpDEXxKZx6zfJ5FXFIjw+6fYq/VSa65idb4OG3V17bRtZV8WtqaGomN+FBwJcLBTWnTgi516WyS4Rfnv4SUWIXRRN5XWm3kiQHuBi3PSY1dU4Rtig5rdOEh8pQlJhD6EbjoyR+7IrYjpBqHjVWQVu5jHU05qizFr0i1H1UVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.21; Thu, 26 Sep 2024 18:50:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 18:50:34 +0000
Date: Thu, 26 Sep 2024 14:50:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t, v3 2/2] tests/intel/xe_fault_injection: Add new
 test for fault injection
Message-ID: <ZvWs97UaUD7Q8O8-@intel.com>
References: <20240924195754.102650-1-francois.dugast@intel.com>
 <20240924195754.102650-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924195754.102650-3-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:303:86::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: e44b6863-fb0e-462c-3a6e-08dcde5c1a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Pplaq+Jglq9vIVSmPUmDTnQx6S7QagXNnUu76ZwQFBS7ugzKHC2Y/grbY+?=
 =?iso-8859-1?Q?IFIceaVZlTUnn5qFl43AAR6BXS9H0oLKdoOp+X7KUvvTTXIFL1EaYoeunt?=
 =?iso-8859-1?Q?Yl2Zu4ZbcvXuaOuaPM5rzN5n28FTE6j+hPnGhFiiY1pmVuFb78ayQLU+7Q?=
 =?iso-8859-1?Q?nHeN3JWY4O7FD3FN4SCvA4PH7lutvLM8M0cDCPenp5uRoQTmvClXbsu+Ma?=
 =?iso-8859-1?Q?QC0aJyyz4RJd8QE0u2ad0TKiaN4ldtuGcG58aYqygA+FdF7TpLSv3RWQgU?=
 =?iso-8859-1?Q?Mex8C1nw2PEf0pPr6vN6lXCg92ZatZ8qgXM7PitNaymy4FtLF5p4ZmIYVi?=
 =?iso-8859-1?Q?9F/dq+/IWF1c9Myi6eCMRbhdqC/ac5EVAUsWbLx2YkFPE307bVZAL9wifM?=
 =?iso-8859-1?Q?jaJNuW1rGPsND2SkfyuYTgHy+Sr1nieP9exnqGtWndYK6L3nFdLqILARy9?=
 =?iso-8859-1?Q?WseSbRo8NNdRWqrDzxhYCRZj9JSc4OA+D7tC+CYLo1nfyiuUbc/pNorXt7?=
 =?iso-8859-1?Q?7bHd6DWqGOllxK5dKx6NtsSfiU+g6LTx8MB01r3OuH1n+GvGYkmYEyG/sU?=
 =?iso-8859-1?Q?Hizz/XsADkN5QsekVQ4XVAVzYj5jt+40IkgM9DEIMy5BLU7bt8D5/mJxLd?=
 =?iso-8859-1?Q?HG9uxG08Xrvn+Jr4PgwQl8pORSUUrhYq3Cy9Uyu9gqPYKAUXLI5DRYDFXD?=
 =?iso-8859-1?Q?At7XUJRtuXCs7K06Teqe76hyngOm9rVGqB62Htc91UGbhHynvDV2dJGMGm?=
 =?iso-8859-1?Q?R1ZeK+CFdDsdL49xdBBf7TzXEcRFMqblE89QHy4O0+VFuyXaRYH0LZ+lkc?=
 =?iso-8859-1?Q?NWaUg+QZjODCZwYqNcqoexKW25YwWdYBgNVuprcRhDYkhAFluX+JvLWNlL?=
 =?iso-8859-1?Q?HasK5BdJBwmLeysYoLBFKyD1kcUBkCzLEsLkasJ0bmPvuBoA+yXpq2eSJV?=
 =?iso-8859-1?Q?0t8gsaXceUQH3Qvh7JvdW+jBxWhoqdG1qb1QaHjNTKC9l8g6M7d5GZTfg3?=
 =?iso-8859-1?Q?Xcn3vnCGHY/4Mdbj7tTTUpwYoTJzfHmoYvjdsq/kGTB1B544WbnoG2M/er?=
 =?iso-8859-1?Q?WLOndXbPX9hqyjJGQlWSk3PHrDlYUGinDouWdvwKPAzvrIzuiu1uza2y/9?=
 =?iso-8859-1?Q?MJsUZWjAUiHRafRUqVnKF4K4noDt8WIxN/2LskUUDXLlpXQGGeSgu+dAQ0?=
 =?iso-8859-1?Q?5aKBR+wAz12wvm5BLSSJ24MEutzfrIAK8aeTFuP4UhGkdbG0AATLMrd3qK?=
 =?iso-8859-1?Q?wDWof8lZazFNhowZ06KinasyNXekHidD6gcrZlpTUWX3LHyi3D3yuCPDet?=
 =?iso-8859-1?Q?MeqMg6PsSf5gC/rfvP53VI3MCJ3UpNCq4obAUczTGV7+dBXygnt/aYCApH?=
 =?iso-8859-1?Q?8YxjKwS7FmBAEhEWz57McVxH1inTpAD4kl6xF5dIhOvH/knky8p0k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EKzJwto9S9nrQJs5OfWSFTxaZVYK4YgPVvXaVHIpN0K2RGyDqcTLFmaeca?=
 =?iso-8859-1?Q?cLFXxqNMu5jGQsfVhd/WdqgXHM4uti7GNlrZZOFmOLLtwuq1YQTANtFXs6?=
 =?iso-8859-1?Q?d4mEQ51F8Bj5JDFa3GLUeJOfnqQ8+OCNqpGddKmwMk0hXikBN8k89t0A5I?=
 =?iso-8859-1?Q?fy5J+1C+yvhSow9FyVNptJGGzfginPk9h/VlGLMJvhXrErqtRD0V6F/0ZI?=
 =?iso-8859-1?Q?WM9sYRRVYvKNXlio8yPiuVC757tDilrV+AemyjUfLpQnfzyG89wP7LyrYk?=
 =?iso-8859-1?Q?HNV2cjq8tzzPfKZuWZmPmOBSWIEc68Wzw0ecSZ/XOibQPq7M4Mii4052W7?=
 =?iso-8859-1?Q?08aa7ObAKEjMMIpteRJup6a6SJuOcq9pH+myOEZmRyk+0hJ9jWRG9Ib+t0?=
 =?iso-8859-1?Q?Q2YGe8tP+g5FtXUr0OKjSvQy0aQmflJAoXOcRtgCbvheGrnAg+dFdvsJTa?=
 =?iso-8859-1?Q?1xMoq1SHnADALtBnZ0ukN5xjSb7lJ7W/lIdookvv00jcTZmLt44CzlqzQ7?=
 =?iso-8859-1?Q?OEAFA0YkzFfkzmNpNXL+aiwQl/tezax3GIjDDyOQdZAuSQt6DmA0jmCP+N?=
 =?iso-8859-1?Q?m1Oa9v9HimKvcbqT0YtHDXQIwu+P6YfK4O7EQWYv6DadefO9+e1R7cBeSX?=
 =?iso-8859-1?Q?InxT8C5epQFISlNx4mg0WydRKnbscwGWBKdylJ3omkyQFeDwEVIMJkcEFR?=
 =?iso-8859-1?Q?x+ey/aJsWDRzv1zfCHZEYAdNtafCkKH28p+RQWOc5s/mf3HgvXJeNA6/yS?=
 =?iso-8859-1?Q?bhzaOfYTWjB2KiKB67pQ9P2KvQz2YXhub7zpo1VBnmrQOblcUs5cZEdgpU?=
 =?iso-8859-1?Q?VB1/CQoUwRUXKzL7j0jVZlXgZaabrSdj+QbcHxcDY6x0eli3q8CqkfitKd?=
 =?iso-8859-1?Q?JVaxs5R9Cp3+T2P5gxHXfpdPcGqzkWxkqZvielAPubnNZA1fmHDIIk10NH?=
 =?iso-8859-1?Q?aBIix+SJNIqKS13RPyCUHdyv7tur/VIrUEKdUIGBR/UCtXISUP3rGAjeR5?=
 =?iso-8859-1?Q?nJDQNQUxnzOtNjF9Y7TyDbAKfjJ+76LMdv5RNe+ehDLUnto7pX9e6GzAes?=
 =?iso-8859-1?Q?8hxrdi4K2dOWdoV+3jRz+PCfBrqz6mi10AzFChDexM05zb36c12hFhjqp6?=
 =?iso-8859-1?Q?0BhZXYgTpo9UMPsYR+SkGvjC6pHYKRbFCPnqDhwMGLsEJw3rFP2jaZ192H?=
 =?iso-8859-1?Q?jU3Hbsh7cbHZYnHllSfJrlVEqrhqJNycgPEadwCL49YHfIX2xSNNvM4Hi7?=
 =?iso-8859-1?Q?IhPDBTu0r48AjpyP7XihYM27peCXO83sdalvNQmtIftsi7g0Nspp3wUACn?=
 =?iso-8859-1?Q?D5fyd2TNlfK7QM+PKqIpxxrMm7ubMcwzlyKF8AIK5SEZ/H5ZGfQqY5KzsQ?=
 =?iso-8859-1?Q?bLBapKsNw5dz84dQieFWHRR4aSegEcR/4dyfvIR4+UCezOOxq79iDsDWCo?=
 =?iso-8859-1?Q?SGGs5a9i8za0NeJKH9aYxxPyCiIasTUiedz+fxTgWE2ICj8VXNmIZgoqc8?=
 =?iso-8859-1?Q?pQYvIuqYP0QoNmunBIRxnmc7RfVDe6kUIzeN52YT17iFeRff/dW5e7hU6d?=
 =?iso-8859-1?Q?FSBOfFVwyDDDcIpo0z31JcuIWEpLG7cY0/kV0xeplSqYF0rHjop4oz6GTq?=
 =?iso-8859-1?Q?AEeHlL1/hIdpLFFyWeBBAMQf8Unkxy3uH6ffo+rN75bMKtVT6cEvnGaA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e44b6863-fb0e-462c-3a6e-08dcde5c1a99
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 18:50:34.8361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JoKgeIdJ9LrrVb3Trx8/AX5QsP9EN5c6Q0DSJIFKIO520sSEY9+ZLGpQ7p6Y5Sb4LCnQvvfqvlFD5NorY2OHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

On Tue, Sep 24, 2024 at 09:54:58PM +0200, Francois Dugast wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at probe time.
> 
> Add the following test:
>     * "function-fault-injection"
> 
> v2: Fix mismatch between test name and documentation
> 
> v3: Use promoted function for bind, rework structure
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 200 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 201 insertions(+)
>  create mode 100644 tests/intel/xe_fault_injection.c
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> new file mode 100644
> index 000000000..987056a43
> --- /dev/null
> +++ b/tests/intel/xe_fault_injection.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check fault injection
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: driver
> + * Test category: fault injection
> + */
> +
> +#include <regex.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +#define MAX_LINE_SIZE			1024
> +#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
> +#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
> +#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
> +#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
> +#define INJECT_ERRNO			-ENOMEM
> +
> +enum injection_list_action {
> +	INJECTION_LIST_ADD,
> +	INJECTION_LIST_REMOVE,
> +};
> +
> +/*
> + * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
> + */
> +static bool function_error_injection_enabled(void)
> +{
> +	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
> +
> +	if (file) {
> +		fclose(file);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void injection_list_do(enum injection_list_action action, char function_name[])
> +{
> +	FILE *file_inject;
> +
> +	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
> +	igt_assert(file_inject);
> +
> +	switch(action) {
> +	case INJECTION_LIST_ADD:
> +		fprintf(file_inject, "%s", function_name);
> +		break;
> +	case INJECTION_LIST_REMOVE:
> +		fprintf(file_inject, "!%s", function_name);
> +		break;
> +	default:
> +		igt_assert(!"missing");
> +	}
> +
> +	fclose(file_inject);
> +}
> +
> +/*
> + * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
> + */
> +static void setup_injection_fault(void)
> +{
> +	FILE *file;
> +
> +	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
> +	igt_assert(file);
> +	fprintf(file, "N");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
> +	igt_assert(file);
> +	fprintf(file, "100");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
> +	igt_assert(file);
> +	fprintf(file, "0");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/times", "w");
> +	igt_assert(file);
> +	fprintf(file, "-1");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/space", "w");
> +	igt_assert(file);
> +	fprintf(file, "0");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
> +	igt_assert(file);
> +	fprintf(file, "1");
> +	fclose(file);
> +}
> +
> +static void cleanup_injection_fault(void)
> +{
> +	FILE *file;
> +
> +	file = fopen(PATH_FUNCTIONS_INJECT, "w");
> +	igt_assert(file);
> +	fprintf(file, "\n");
> +	fclose(file);
> +}
> +
> +static void set_retval(char function_name[], long long retval)
> +{
> +	FILE *file_retval;
> +	char file_path[MAX_LINE_SIZE];
> +
> +	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
> +
> +	file_retval = fopen(file_path, "w");
> +	igt_assert(file_retval);
> +
> +	fprintf(file_retval, "%#016llx", retval);
> +	fclose(file_retval);
> +}
> +
> +static void inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
> +{
> +	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> +		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> +
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +}
> +
> +/**
> + * SUBTEST: function-fault-injection-during-probe
> + * Description: inject an error in each injectable function then reprobe driver
> + * Functionality: fault
> + */
> +static void
> +function_fault_injection_during_probe(int fd, char pci_slot[])
> +{
> +	FILE *file_injectable;
> +	char line[MAX_LINE_SIZE];
> +	char function_name[MAX_LINE_SIZE];
> +	regex_t regex;
> +	regmatch_t pmatch[2];
> +
> +	igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
> +
> +	file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
> +	igt_assert(file_injectable);
> +
> +	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
> +
> +	/*
> +	 * Iterate over each error injectable function of the xe module
> +	 */
> +	while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
> +		if (regexec(&regex, line, 2, pmatch, 0) == 0) {
> +			strcpy(function_name, line);
> +			function_name[pmatch[1].rm_eo - 1] = '\0';
> +			inject_fault_try_bind(fd, pci_slot, function_name);
> +		}
> +	}
> +
> +	fclose(file_injectable);
> +	regfree(&regex);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	char pci_slot[MAX_LINE_SIZE];
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_device_get_pci_slot_name(fd, pci_slot);
> +		igt_require(function_error_injection_enabled());
> +		setup_injection_fault();
> +	}
> +
> +	igt_subtest("function-fault-injection-during-probe") {
> +		function_fault_injection_during_probe(fd, pci_slot);

Sorry for not having noticed this before, but I now see a big issue with
this approach of single test.

We will get only 1 bucket of CI issues, regardless of which case is
causing the failing.

Let's do the while(read) in here and then create dynamically the
subtests so we can have 1 single subtest for each fault-inject and then
CI won't try to put everything in the same bucket.


> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +		cleanup_injection_fault();
> +		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e5d8852f3..118a7afb9 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -293,6 +293,7 @@ intel_xe_progs = [
>  	'xe_exec_store',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
> +	'xe_fault_injection',
>  	'xe_gpgpu_fill',
>  	'xe_gt_freq',
>  	'xe_huc_copy',
> -- 
> 2.43.0
> 
