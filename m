Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BDECA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 19:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1110E203;
	Fri, 29 Aug 2025 19:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTOhn9AB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4825610E203
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756497317; x=1788033317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rAVwBM3uClvu+IKsBli7I2Rcpwm4ZT0T87zAl9uPtqs=;
 b=TTOhn9ABLBAnA/gdFPYufYpEUjafbdDNSqJ7nxOMlWRb3Hrt/WTnbZxy
 dsxLsuP7Isko12AXkvjzXPx/hIkCGBGPI5j3K/qduMcHy0Hdnz/SVLp69
 wcvu6tsNwC/+z1nJRP4Lm4Y/JUAOnbJ/hl8GgrFNSXsz9Us+v7FYCpfQp
 QzVAngw5+G5IJBKO/mAk2oFuNuxGgsTuisxIa9LzeJADpI82TRiCg5Vrx
 qpM9ceK7lzjOuWKrGZOpl6HZNqLXXFo5/3i8m8Wt/Dz7EovsAeFZb0gl0
 JrLJvsQIBrr08reB7AcGR3tsAEPjL2tZaI0XUpYCVzcC49BoLvc6x1SFt A==;
X-CSE-ConnectionGUID: Q7yEm+YbQVecid4aQQfqEQ==
X-CSE-MsgGUID: KEJjK9HpSi6usrHox4s0cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="84197408"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84197408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 12:55:17 -0700
X-CSE-ConnectionGUID: ezSPqO6aQXCG/kCtD5y3Qg==
X-CSE-MsgGUID: pYorCurBTBG4ESmMj7rxNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170848654"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 12:55:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 12:55:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 12:55:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 12:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rw19Lp+dI4ZoR4SpJxJUVMaqIHd5ITa89PjuEgJ6c/NqrYXeRpMGuPHrQ9YM0B4J3h3i97qnYHVv6o7FpisXt+oAGSW8srwpdNP5OAJrU8gUHKZs6jGWEqDjySFd8jjcrpYqhHtvFkOFXokUBm+ElMk/lWq+J7dMDpQrxIHDr1/yooeWlG1bneN21lys/oo1ebFHYl8XDfoY1EaNbc1+Bj2AnB/lWAla2TneVgfLoIBzMyv+Dm1l7YSHot7prK68mSG1o9RXyUpTcERGw1sIOGwWlzbJmgloi+m3KqOr3XUHREJGuM3yJiPqRpwcN5c7kZXjKs+xIVmEp6VEkfbIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0GCWsHlsNExMyujQafedsrI1qPP7+XzO+n8m1RaYnA=;
 b=dQqI/q/7o141tqmPsf1kVCkA1B9pyr4+uISRTpyDldbsnKaLTr7Mb/EGEbJit2w3zdthZ48zpTa2Ad38B9ETYmNVUMG8UWnnWcEcUdrvTUlsODd1hlQO2I6CYkdCcnfEGtMHWcvQZFf6acJJecVUhnxQUYAYoavs2QBIrr8DgU/7N3yIsYWpbUQOezxH2kTf6SKV9d7CCqo0LceYXBXafq+IXtnfFxoZhEsZt93VZ0f0Lol09WjGRpQhNq6RrAzbZV/XByZazXQ44keOmaRdC1yGtFhimEgU5i5kkp/NLT0mcQtIfXUXnBFNPJ/NcOUUBBpcB8AuYZN9pxS6PzTo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 19:55:08 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 19:55:08 +0000
Date: Fri, 29 Aug 2025 12:55:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pravalika.gurram@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Add
 preferred_loc_smem test
Message-ID: <aLIFmXdUDPteUFW3@lstrano-desk.jf.intel.com>
References: <20250828165817.97661-1-nishit.sharma@intel.com>
 <20250828165817.97661-5-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250828165817.97661-5-nishit.sharma@intel.com>
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ef3710-6fd7-45c6-8f7e-08dde735f4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zRyzi/pwfPq6p352txk+mXOknsXc+bQeF8icXhZG/yf9v3N8ttyXfZg16tz8?=
 =?us-ascii?Q?t+W/Wb/2O0Sz4WLrP21+nzmw4F/XbF5gsOMfVGTAb1K7AhK4OKM+LOODDm+R?=
 =?us-ascii?Q?KVa2DUbvBiRBs8k/YMps95qSAsrjwykml2p+vniWaaoTBugwKMIbDOF0o3yO?=
 =?us-ascii?Q?HzreKEkDHY8Ce2KXY9E7pY2N9fNNkqYdnUoyFce5rrIW+Ql0r1ay7fOJYd6u?=
 =?us-ascii?Q?+GRh1J52KXKDgvYpj7mYJimuipoAugORgqgc6Z8PL4JVdoX5IOtjIqmVOf/w?=
 =?us-ascii?Q?vOg2zmCW5VVdSLClXsm8N84JbeNWC+zFWIkacsO1loFF24en9o9sEiP2XzAs?=
 =?us-ascii?Q?LPbcnM6TjNuA+yzcGmSGC/uho/Hvy1te1vTpAR8M3Glqo3CYr3VIQTcZqIxp?=
 =?us-ascii?Q?7cBrs7zep1f/1iX5b33CWuP+FYzQt6PMXtPrP/K5Av0nMsLUFudeuKggQWLG?=
 =?us-ascii?Q?rmrBhxdShZHUqJA10U3iZMmsa4+JNsFwhhny8s0tW8wM05O4CJRvQcvQhLSG?=
 =?us-ascii?Q?4tft59beicsgdfZe7ogX3IIzPIr3e7PJSObduUgZ+A+qP4WMTsgHkziV/z5x?=
 =?us-ascii?Q?OKa3wzellDVq+dtfncmo6ecvGQDpo2HCddNn7HIRCY3W9UBrXdOKVhFrPYix?=
 =?us-ascii?Q?8GTK5x6hulLINbGOTpru588f5+7SOtNsuGOwM/7hHpXb/UtUDoUB5dEJhoy9?=
 =?us-ascii?Q?Nc+6iTEq+qx/2TdhWwH5CBCRmIQp6Ms7uhfOF2pvEnoSQI6pLci7OnNz3sWz?=
 =?us-ascii?Q?DBZRtbjz5CdQoXOTzbCB/sLHWxPXaiKRT+WJ5QPDqIhZTJ4pt0bXmyM1YEhl?=
 =?us-ascii?Q?Jn/JzEbihFN04oL92Ix/SSYRgQteyi1Z38uXxAZ8AqhEML2o6zWAvdpFyLJR?=
 =?us-ascii?Q?NHvetQaBOJcfJ8fdIg6UWvbLCA4KNsSKAcMjll0gtMu5xinR42a/dImsKEYU?=
 =?us-ascii?Q?0Xfpjonvd1/JoJZ2ebUhRfpsji8qZ9Uj4JpVdF3bizJSpSHlE20NEBqA8jS7?=
 =?us-ascii?Q?7Z5TMnKIzLNQii30/mzlohkBVn7/I/qYSGXJ0P7zH/y6e755awmWm4F/MiHx?=
 =?us-ascii?Q?trX36PhkHv40/MnbU5vPrUpunZOc807SxQqFfYI6GvmFZADqlrAzESreFCgK?=
 =?us-ascii?Q?684mtiHyfWbhjYXpHpA/plt4OW7a62NWUWfQlZCGg031u/oqnvUauRSHci+V?=
 =?us-ascii?Q?jk5Nefjv999LhCHjvwh+mAbjVd1+gVwgoAEFGZek0sGkzx11cpbdFYcwCw6g?=
 =?us-ascii?Q?Pj+OFVEneuBGdSbyNWU0KjMV49Nm677qVWFQ0B98uvOOAGBm3z314pIaUIzY?=
 =?us-ascii?Q?pWP7WjiOCql19zhFeltYQQ86ytMD38ZyT2oeSNgM5AU1ciOcPSw1g881ZDgm?=
 =?us-ascii?Q?ArjVaIDSBHmBwfuamGNeQfnpeY6x+x6QJ+NHEtpdT3MiJDWjb8Tk3MDyIyPC?=
 =?us-ascii?Q?Ik8ugQviDRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n1AH249mBBW+riHoJzH/93/lpv3MBQoDSfTUROFuGCUUZ0kmUemZ3z4hM4BF?=
 =?us-ascii?Q?m4GNLFXXAp34GhgQGg8+TGo1HnsbboN0QL8khpyQPEa05m/LVsGlmAwbled+?=
 =?us-ascii?Q?07bGBbNoB5M+CrBBGp1GlTh8HIFOyouENrqSRhVCebiijEPmywb42PlE/c6P?=
 =?us-ascii?Q?ozGn1k8fYdnsFrUpmhnwDI4YwtqGn+dphpNykqV7mkiEZGa8ZZU0dYOPdz1w?=
 =?us-ascii?Q?mTykk7LiBO57rjV1Lsqi9s0Hl9zrtZhNoO7e9ewCo1pJRkvM30TsA9fzjsFB?=
 =?us-ascii?Q?Iy017g6KJyOKDbUuZfPrLTw+HjhJdGCZB7ijOqjFTiRVFY2kvQjVjEGIYqgz?=
 =?us-ascii?Q?g6RZFtJjbLHgk1dKkGESZCePGefy8BFiUthY8RDjEu2AuOU8leVRn99G2TIC?=
 =?us-ascii?Q?He2JolOD+NyqK2PEYMdrouE4NaYIxnYXLuOWcANDMO6BZyfBj0zNv+R3Ig8C?=
 =?us-ascii?Q?ja2fH7zgv5vLCWRDDI2hv7ATOCzaCkC+DIcOqaqLNOlhBqrgFx9eQdxu9Ilh?=
 =?us-ascii?Q?gFeuL/TBPEiBdYhE43C1b2os5mo8I+VsHrpvSg11wKh98MmOuuVfQQJGeDXB?=
 =?us-ascii?Q?m5qsOB1+kQqCDF9EjcoNM6UtyviYv4MYcmPUT5C05Uy3F2uBVQ61bJ1v30r/?=
 =?us-ascii?Q?jxL+F6uX0fmfk8h9bOTiJOE3FivmQMCkGYzk8hzhMyG8KcWJF69MsQ6A/ECY?=
 =?us-ascii?Q?z7AkGFyOWxb3m0xP85zYfOLqeCgwlkaPEIbiAGt3pqiMFoWrcVfGlKdZS3Aa?=
 =?us-ascii?Q?qL+AuA8mZeHKsfG5JSBCL6F3/3DmUxzbW8Ac4njPwtE1ZMPBZ/RBPib18xgR?=
 =?us-ascii?Q?OK06X05FrrMOqKMBH4bsiKKiMcoV1FuWsewOLHqV6jvK8ScBIKq69RIdqH70?=
 =?us-ascii?Q?T4Tz0EK0cVAF0kM/7c1nzLT9QMeLfWjuLbvcpPCFMg4d0hVwnNuPsk3s5vDX?=
 =?us-ascii?Q?+H0C0sw9Ul2J12bG6N8OaAa/5FRKcr42bwxXBRxmFRA8yMyN+lV66AHGYUoL?=
 =?us-ascii?Q?xHRELc27F9+HvJ4WiiLMcyCjYMyx9/mnz2PbxKwLBZMpgF6/46QLJHT5PJn/?=
 =?us-ascii?Q?sI2IU2EU2O5fT7qMwcOVZfodBuBrlyXpRFBM2mvp/vxvKIFAFuw/pmpfuD7+?=
 =?us-ascii?Q?lqh8vSgZtqs9AwZbOOk6nKSt+SaLONbWE8fQgifu14te7kHgdy30jerWwI1L?=
 =?us-ascii?Q?xJuFacAUjqynijl0UChY7s29poizzXioNB00N/Vyrs69vL+QeDu4Y0Cs+sY4?=
 =?us-ascii?Q?685/cCdt9nvEuZYZtzIMYksahxWobp4JkPxu/TILNfeiWfTSRHeGWQFEDv2k?=
 =?us-ascii?Q?AkG99DsuG1x/wLheH39l4GTGDb1ikSB/WVdb0MOWkzhpJ7BS6RhbJ3ifF4Lt?=
 =?us-ascii?Q?h2L2za+9FvYk0+S6JukyIJiZTZjzYJuYsvNWibyyUs16FlOR41seHtC0D54A?=
 =?us-ascii?Q?r4ToZW0MaWGeVjbmgJC8+PM0nRWpGjuP1njiB7duX4qWFXB883TBEnohuEk/?=
 =?us-ascii?Q?VPApCTbmFr82IXbQ+6IDCcvE+HyQmsIEDin3PZGOPaOvfTZuTorT/oD37J/I?=
 =?us-ascii?Q?MKpQOBfULmJLtIxnfVlN5zI4eGYJYoO72lMh+tHM56gF4/At/+DOFIAorU/G?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ef3710-6fd7-45c6-8f7e-08dde735f4cf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 19:55:08.5804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZzo2Qv0tw3o3yluO7RpUws12t2ATEyCXcWhaZyUvZ2E38T+YdZr8giNE3QiKJMGIa+VosLvDR+2qMk/lbHitg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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

On Thu, Aug 28, 2025 at 04:58:16PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added preferred-loc-smem test which is called in combination with other
> tests as well. In this test the buffer object preferred location is
> system memory. MADVISE ioctl is called with preferred_loc attribute and
> default_system system memory as preferred location.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 225 ++++++++++++++++++++-----
>  1 file changed, 187 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 007d9bdc0..70ca5fc2e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -138,7 +138,6 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> -
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
>  			  unsigned int flags)
>  {
> @@ -406,6 +405,39 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>  		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
>  }
>  
> +#define MAX_N_EXEC_QUEUES       16
> +
> +#define MMAP                    (0x1 << 0)
> +#define NEW                     (0x1 << 1)
> +#define BO_UNMAP                (0x1 << 2)
> +#define FREE                    (0x1 << 3)
> +#define BUSY                    (0x1 << 4)
> +#define BO_MAP                  (0x1 << 5)
> +#define RACE                    (0x1 << 6)
> +#define SKIP_MEMSET             (0x1 << 7)
> +#define FAULT                   (0x1 << 8)
> +#define FILE_BACKED             (0x1 << 9)
> +#define LOCK                    (0x1 << 10)
> +#define MMAP_SHARED             (0x1 << 11)
> +#define HUGE_PAGE               (0x1 << 12)
> +#define SHARED_ALLOC            (0x1 << 13)
> +#define FORK_READ               (0x1 << 14)
> +#define FORK_READ_AFTER         (0x1 << 15)
> +#define MREMAP                  (0x1 << 16)
> +#define DONTUNMAP               (0x1 << 17)
> +#define READ_ONLY_REMAP         (0x1 << 18)
> +#define SYNC_EXEC               (0x1 << 19)
> +#define EVERY_OTHER_CHECK       (0x1 << 20)
> +#define MULTI_FAULT             (0x1 << 21)
> +#define PREFETCH                (0x1 << 22)
> +#define THREADS                 (0x1 << 23)
> +#define PROCESSES               (0x1 << 24)
> +#define PREFETCH_BENCHMARK      (0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define PREFERRED_LOC_SMEM      (0x1 << 27)
> +

These flags are for sections that call test_exec() only.

> +#define N_MULTI_FAULT           4
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory
> @@ -460,7 +492,7 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t *bos = NULL;
>  	struct timespec tv = {};
>  	uint64_t submit, read, elapsed;
> -	int i;
> +	int i, err;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -500,6 +532,15 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
>  			alloc.ptr = aligned_alloc(SZ_2M, alloc_size);
>  			igt_assert(alloc.ptr);
>  		}
> +
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err = xe_vm_madvise(fd, vm, to_user_pointer(alloc.ptr), alloc_size, 0,
> +					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size =%"PRIu64"\n",
> +						  strerror(errno), vm, to_user_pointer(alloc.ptr), alloc_size);
> +		}

I agree with Pravalika, this is never set at the caller.

Also see above PREFERRED_LOC_SMEM flags shouldn't be used here, the
flags for many_allocs are defined here.

 136 /* many_alloc flags */
 137 #define MIX_BO_ALLOC            (0x1 << 0)
 138 #define BENCHMARK               (0x1 << 1)
 139 #define CPU_FAULT_THREADS       (0x1 << 2)
 140 #define CPU_FAULT_PROCESS       (0x1 << 3)
 141 #define CPU_FAULT_SAME_PAGE     (0x1 << 4)

If you want call madvise in many_alloc(), define a flag there. I don't
think it actually makes sense set DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM in
many_allocs() though as these sections are focused on migration perf /
eviction.

>  		allocs[i] = alloc;
>  
>  		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> @@ -662,7 +703,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  	size_t bo_size = SZ_2M, unmap_offset = 0;
>  	uint32_t vm, exec_queue;
>  	u64 *exec_ufence = NULL;
> -	int i;
> +	int i, err;
>  	void *old, *new = NULL;
>  	struct aligned_alloc_type alloc;
>  
> @@ -688,6 +729,15 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  	data[0].vm_sync = 0;
>  
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
> +				  strerror(errno), vm, to_user_pointer(data), bo_size);
> +	}
> +

Same as above, partial flags are defined here;

 605 #define CPU_FAULT       (0x1 << 0)
 606 #define REMAP           (0x1 << 1)
 607 #define MIDDLE          (0x1 << 2)

Also this section really is only interesting if migrations happens, so
DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM doesn't make a ton of sense here.

>  	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
>  			   PROT_WRITE, MAP_SHARED |
>  			   MAP_ANONYMOUS, -1, 0);
> @@ -747,38 +797,6 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define MMAP			(0x1 << 0)
> -#define NEW			(0x1 << 1)
> -#define BO_UNMAP		(0x1 << 2)
> -#define FREE			(0x1 << 3)
> -#define BUSY			(0x1 << 4)
> -#define BO_MAP			(0x1 << 5)
> -#define RACE			(0x1 << 6)
> -#define SKIP_MEMSET		(0x1 << 7)
> -#define FAULT			(0x1 << 8)
> -#define FILE_BACKED		(0x1 << 9)
> -#define LOCK			(0x1 << 10)
> -#define MMAP_SHARED		(0x1 << 11)
> -#define HUGE_PAGE		(0x1 << 12)
> -#define SHARED_ALLOC		(0x1 << 13)
> -#define FORK_READ		(0x1 << 14)
> -#define FORK_READ_AFTER		(0x1 << 15)
> -#define MREMAP			(0x1 << 16)
> -#define DONTUNMAP		(0x1 << 17)
> -#define READ_ONLY_REMAP		(0x1 << 18)
> -#define SYNC_EXEC		(0x1 << 19)
> -#define EVERY_OTHER_CHECK	(0x1 << 20)
> -#define MULTI_FAULT		(0x1 << 21)
> -#define PREFETCH		(0x1 << 22)
> -#define THREADS			(0x1 << 23)
> -#define PROCESSES		(0x1 << 24)
> -#define PREFETCH_BENCHMARK	(0x1 << 25)
> -#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> -
> -#define N_MULTI_FAULT		4
> -

As stated above, please don't move these flags.

>  /**
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] system allocator test only once
> @@ -951,6 +969,80 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap-new-nomemset:			mmap a new buffer for each exec, skip memset of buffers
>   * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
>   * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
> + * @free-nomemset-preferred-loc-smem:	malloc and free buffer for each exec and perform preferred loc madvise operation
> + * @free-preferred-loc-smem:		free buffer for each exec and perform preferred loc madvise operation
> + * @free-race-nomemset-preferred-loc-smem:	free buffer for each exec with race between cpu and gpu access and perform madvise operation skipping memset
> + * @free-race-preferred-loc-smem:	free buffer for each exec with race between cpu and gpu access and perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem:	malloc single buffer for all execs, bind and unbind a BO to same address, skip memset and perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer for all execs, try to unbind while buffer valid, skip memset of buffers and perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all execs, try to unbind while buffer valid and perform madvise operation
> + * @malloc-fork-read-after-preferred-loc-smem:	malloc single buffer for all execs, fork a process to read test output, perform madvise operation
> + * @malloc-fork-read-preferred-loc-smem:	malloc single buffer for all execs, fork a process to read test output, perform madvise operation
> + * @malloc-mlock-nomemset-preferred-loc-smem:	malloc and mlock single buffer for all execs, skip memset of buffers, perform madvise operation
> + * @malloc-mlock-preferred-loc-smem:	malloc and mlock single buffer for all execs, perform madvise operation
> + * @malloc-multi-fault-preferred-loc-smem:	malloc single buffer for all execs and perform madvise operation
> + * @malloc-nomemset-preferred-loc-smem:	malloc single buffer for all execs, skip memset of buffers and perform madvise operation
> + * @malloc-preferred-loc-smem:	malloc single buffer for all execs, issue a command which will trigger multiple faults, perform madvise operation
> + * @malloc-prefetch-preferred-loc-smem:	malloc single buffer for all execs, prefetch buffer before each exec, perform madvise operation
> + * @malloc-prefetch-race-preferred-loc-smem:	malloc single buffer for all execs, prefetch buffer before each exec, perform madvise operation
> + * @malloc-race-nomemset-preferred-loc-smem:	malloc single buffer for all execs with race between cpu and gpu access, perform madvise operation
> + * @malloc-race-preferred-loc-smem:	malloc single buffer for all execs with race between cpu and gpu access, perform madvise operation
> + * @free-race-nomemset-preferred-loc-smem: malloc and free buffer for each exec with race between cpu and gpu access, perform madvise operation
> + * @free-race-preferred-loc-smem:	malloc and free buffer for each exec with race between cpu and gpu access, perform madvise operation
> + * @malloc-bo-unmap-nomemset-preferred-loc-smem: malloc single buffer for all execs, bind and unbind a BO to same address before execs, perform madvise operation
> + * @malloc-bo-unmap-preferred-loc-smem:	malloc single buffer for all execs and perform madvise operation
> + * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer for all execs and perform madvise operation
> + * @malloc-busy-preferred-loc-smem:	malloc single buffer for all execs and perform madvise
> + * @mmap-file-mlock-nomemset-preferred-loc-smem:	 mmap and mlock single buffer, with file backing, perform madvise
> + * @mmap-file-mlock-preferred-loc-smem:	mmap and mlock single buffer, with file backing, perform madvise
> + * @mmap-file-nomemset-preferred-loc-smem:	mmap single buffer, with file backing and perform madvise
> + * @mmap-file-preferred-loc-smem:	mmap single buffer, with file backing and perform madvise
> + * @mmap-free-huge-nomemset-preferred-loc-smem:	mmap huge page and free buffer for each exec and perform madvise
> + * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free buffer for each exec and perform madvise
> + * @mmap-free-nomemset-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
> + * @mmap-free-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
> + * @mmap-free-race-nomemset-preferred-loc-smem:
> + * @mmap-free-race-preferred-loc-smem:
> + * @mmap-huge-nomemset-preferred-loc-smem:
> + * @mmap-huge-preferred-loc-smem:
> + * @mmap-mlock-nomemset-preferred-loc-smem:
> + * @mmap-mlock-preferred-loc-smem:
> + * @mmap-new-huge-nomemset-preferred-loc-smem:
> + * @mmap-new-huge-preferred-loc-smem:
> + * @mmap-new-nomemset-preferred-loc-smem:
> + * @mmap-new-preferred-loc-smem:
> + * @mmap-new-race-nomemset-preferred-loc-smem:
> + * @mmap-new-race-preferred-loc-smem:
> + * @mmap-nomemset-preferred-loc-smem:
> + * @mmap-preferred-loc-smem:
> + * @mmap-prefetch-preferred-loc-smem:
> + * @mmap-prefetch-shared-preferred-loc-smem:
> + * @mmap-race-nomemset-preferred-loc-smem:
> + * @mmap-race-preferred-loc-smem:
> + * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-dontunmap-preferred-loc-smem:
> + * @mmap-remap-eocheck-preferred-loc-smem:
> + * @mmap-remap-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-dontunmap-preferred-loc-smem:
> + * @mmap-remap-ro-eocheck-preferred-loc-smem:
> + * @mmap-remap-ro-preferred-loc-smem:
> + * @mmap-shared-nomemset-preferred-loc-smem:
> + * @mmap-shared-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-dontunmap-preferred-loc-smem:
> + * @mmap-shared-remap-eocheck-preferred-loc-smem:
> + * @mmap-shared-remap-preferred-loc-smem:
> + * @new-bo-map-nomemset-preferred-loc-smem:
> + * @new-bo-map-preferred-loc-smem:
> + * @new-busy-nomemset-preferred-loc-smem:
> + * @new-busy-preferred-loc-smem:
> + * @new-nomemset-preferred-loc-smem:
> + * @new-preferred-loc-smem:
> + * @new-prefetch-preferred-loc-smem:
> + * @new-race-nomemset-preferred-loc-smem:
> + * @new-race-preferred-loc-smem:
> + * @prefetch-benchmark:
>   *
>   * SUBTEST: prefetch-benchmark
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
> @@ -1020,7 +1112,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t bo = 0, bind_sync = 0;
>  	void **pending_free;
>  	u64 *exec_ufence = NULL, *bind_ufence = NULL;
> -	int i, j, b, file_fd = -1, prev_idx, pf_count;
> +	int i, j, b, file_fd = -1, prev_idx, pf_count, err;
>  	bool free_vm = false;
>  	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
>  	size_t orig_size = bo_size;
> @@ -1133,6 +1225,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	addr = to_user_pointer(data);
>  
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data), bo_size);
> +	}

What I would here, rather than have PREFERRED_LOC_SMEM, maybe flag like
MADVISE_SWIZZLE. On each pass of the main loop, switch between
DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and
DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE. I think that should create pretty
good coverage.

> +
>  	if (flags & BO_UNMAP) {
>  		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  		bo = xe_bo_create(fd, vm, bo_size,
> @@ -1202,7 +1303,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		uint64_t batch_addr = addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
>  		uint64_t sdi_addr = addr + sdi_offset;
> -		int e = i % n_exec_queues, err;
> +		int e = i % n_exec_queues;
>  		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
>  		bool fault_injected = (FAULT & flags) && i > n_execs;
>  
> @@ -1232,6 +1333,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
>  			next_data = aligned_alloc_type.ptr;
>  			igt_assert(next_data);
> +
> +			if (flags & PREFERRED_LOC_SMEM) {
> +				err = xe_vm_madvise(fd, vm, to_user_pointer(next_data), bo_size, 0,
> +							DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +							DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +				if (err)
> +					igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
> +						  strerror(errno), vm, to_user_pointer(next_data), bo_size);
> +			}
> +
>  			__aligned_partial_free(&aligned_alloc_type);
>  
>  			b = 0;
> @@ -1253,6 +1364,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			sync[0].addr = to_user_pointer(bind_ufence);
>  
>  			start = igt_nsec_elapsed(&tv);
> +
>  			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>  					     1, region);
>  			end = igt_nsec_elapsed(&tv);
> @@ -1355,6 +1467,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				} else {
>  					igt_assert_eq(data[idx].data,
>  						      READ_VALUE(&data[idx]));
> +
>  					if (flags & PREFETCH_SYS_BENCHMARK) {
>  						struct timespec tv = {};
>  						u64 start, end;
> @@ -1429,6 +1542,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
>  				data = aligned_alloc_type.ptr;
>  				igt_assert(data);
> +
>  				__aligned_partial_free(&aligned_alloc_type);
>  
>  				bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1450,6 +1564,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				}
>  				bo = 0;
>  				data = aligned_alloc(aligned_size, bo_size);
> +
>  				igt_assert(data);
>  			}
>  			addr = to_user_pointer(data);
> @@ -1460,6 +1575,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		prev_idx = idx;
>  	}
>  
> +	if (flags & PREFERRED_LOC_SMEM) {
> +		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +		if (err)
> +			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
> +				 strerror(errno), vm, to_user_pointer(data), bo_size);
> +	}
> +
>  	if (flags & PREFETCH_BENCHMARK) {
>  		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
>  			 1e-6 * prefetch_ns,
> @@ -1587,6 +1711,7 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	uint32_t vm = 0;
>  	bool go = false;
>  	void *alloc = NULL;
> +	int err;
>  
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
> @@ -1614,6 +1739,15 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  		alloc = aligned_alloc(SZ_2M, alloc_size);
>  		igt_assert(alloc);
>  
> +		if (flags & PREFERRED_LOC_SMEM) {
> +			err = xe_vm_madvise(fd, vm, to_user_pointer(alloc), alloc_size, 0,
> +					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
> +			if (err)
> +				igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
> +					  strerror(errno), vm, to_user_pointer(alloc), alloc_size);
> +		}
> +
>  		memset(alloc, 5, alloc_size);
>  		flags &= ~SHARED_ALLOC;
>  	}
> @@ -1831,6 +1965,7 @@ igt_main
>  		{ NULL },
>  	};
>  	int fd;
> +	int num_sections;
>  
>  	igt_fixture {
>  		struct xe_device *xe;
> @@ -1843,7 +1978,21 @@ igt_main
>  		open_sync_file();
>  	}
>  
> -	for (const struct section *s = sections; s->name; s++) {
> +
> +	num_sections = 0;
> +	for (const struct section *s = sections; s[num_sections].name; num_sections++)
> +		;
> +
> +	for (int i = 0; i < num_sections * 2; i++) {
> +		struct section *s = &sections[i % num_sections];
> +
> +		if (i/num_sections == 0) {

You are adding too many sections. I'd pick a interesting combination of
flags and add table entries for them.

I'd suggest:

malloc-madvise
malloc-prefetch-madvise
mmap-remap-madvise
new-madvise
free-madvise
mmap-free-madvise

If isn't clear copy the existing flags in those sections and add the
suggested MADVISE_SWIZZLE.

Matt

> +			static char modified_name[256];
> +			snprintf(modified_name, sizeof(modified_name), "%s-preferred-loc-smem", s->name);
> +			s->name = modified_name;
> +			s->flags |= PREFERRED_LOC_SMEM;
> +		}
> +
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
>  				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> -- 
> 2.43.0
> 
