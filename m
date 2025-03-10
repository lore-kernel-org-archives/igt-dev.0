Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D86C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 17:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501DB10E4A9;
	Mon, 10 Mar 2025 17:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nj11FNjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F34410E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741628725; x=1773164725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lHDcRxBRWnMC3/v4goFkICiZCteeNinhn8sBAJ5Ka/w=;
 b=nj11FNjR6DOwyrQ+Jccz9IgaWIdJQohoNWPX8ArbjjEhPT6WXaqhRN4D
 uGIWlLm2YRbenrtsgUHbIHswe4QaG+aYm10PbZ/6bOpd+KoCgNP5wPgMg
 wm3QlXnJbv/A5NRLOgWLuWTJervQX63Ajx6kI2hPY4x74PQKscuXSvePx
 b7BPTAik0VqvxnZMlqhfNGBwue6+909N1z8pb7PeUyz5xYaeD8HXcHl00
 ziARXkYuFonCdcGzBqm4ggkEy7fTxbJPFv9+3aIemitmn15Z19udpkfEL
 Qlq/Y/JP7Y4q+Y80Imv1/SWs1jiaHEK8nYV1lBCSLe5XCFQQEFTEQi4FC w==;
X-CSE-ConnectionGUID: i0tJVsSgTFyeBU9gJS/QSA==
X-CSE-MsgGUID: AZSXoCHVTZe9I9+RLTbBMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="67995788"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="67995788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:45:25 -0700
X-CSE-ConnectionGUID: AEPbpmnZT/WuaQ69kDbHqQ==
X-CSE-MsgGUID: jTRHOTt+Se+fceYdNZfprA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120076740"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:45:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 10:45:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 10:45:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5E3o+UkYzXl5aEy7UAmhjCqmqmupdkl6Mp9RYEGBjvwEKdRh4A7pw+kk9xtiKkmYOzEYyuhNSx+Io+EtxVa1E7icpgnyAxRY/O9uMSln5v9d+IinS/oB+l4RFWAdC86KPkPg1kftWovzzIy9FqESfOjn/XVwqVr10mQq43USIMGE0I/fo0t15FnfH881u9I9UUJ0yJ+RL13VziOnaEVxRf+yVXsyXWuxM03lOtB5bRmd+ngjrr1iMMasTgDfArj+Dd1C+uoK70TfyHUucAstWf8UkPATbTu0q0mS1odUfihzanFIlM0AldU3B7MG4au/JqOjUNWXkEenJf8rGgXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGRx5oWtagvx8109nOVEjPVE6I8/rnR/6AbjJpL7Vlg=;
 b=HvP4mHFFnCJaqjNOxW5H3jkX9b1mHutTEqKO+ntbKwlWPdOKxvHuvWizG36nzva8M+h+IDe/AY0DOmzb/NRkKStXIGv5JuRWQxQfRnMuaxcdQnfF3KP+1KK/MXNexUA8H1hjG5ZKC4pRPck/3hrAr4hw8i+iJ5Uugo2Qq79ME+O2hOPEth++ay36w00FUbMkFQUskzq8JzeZzFpkySnnXSADpEkLI9WR1V0OQA+kbBdqaWtoHB1ht1Oqz0v+SeQWUt49FWElFcGOOQb7L//tFd0Lr5ZH5PKRVLL6jNFQb4E4l43CwzZTIMH43PHNuAf08GVefCq/afON5DxF1Ht79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 17:45:05 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:45:05 +0000
Date: Mon, 10 Mar 2025 13:45:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>, <jari.tahvanainen@intel.com>,
 <ramadevi.gandi@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel: Update sub-category of Xe power
 management tests
Message-ID: <Z88lHbn6G8z67Qrd@intel.com>
References: <20250228050757.2081043-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250228050757.2081043-1-karthik.poosa@intel.com>
X-ClientProxiedBy: MW4PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:303:88::7) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|CO1PR11MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0ac66f-d61a-460e-5362-08dd5ffb4aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uOMwo6E2clGgXnnQV6nWcqdV1ABVqdtiqskd3a+egfspvLB1if3gNvRaiI+a?=
 =?us-ascii?Q?9Qvwu2Ha2X3u8cJIm1DkqShtlXn5p65mz4pqan97w8OirQcx7ICxzwB4tbfJ?=
 =?us-ascii?Q?E+VUlhqpz5wwNXp/1ymAaFZXqyy3UbhqSXTY8/sqd3mKs9lZQercoB22b2mI?=
 =?us-ascii?Q?7cFzlzbPAShbBpCnOCcBpqv+XlF2ryJIQTlu3km2Mk1SfC2MU28tUmn5MXq1?=
 =?us-ascii?Q?HcaPK2qlMXsPpYP+CyWv7MTCHEqWuksBHyD9T/psBqcuMvX6rAVrB0rvVKFB?=
 =?us-ascii?Q?xNMoZ0Aj2KB8CliBhqqJAo0Ayv02eZ09PEKg27nYvTdaZJb/rnYDGl+XmX1w?=
 =?us-ascii?Q?6v1NinFKcNo1HM6dHdM71MaAzaVzcuXiRBNfVjQ4eiNZRbOoWZ6nbkzvzHQS?=
 =?us-ascii?Q?ENY0THPpQnSh1c6+YBR99ZLSG4CNVmd8Dcsqr/xgMQQBXuOFu+dGf3znKsFQ?=
 =?us-ascii?Q?2wrcRrwPQGg/rIoAE2OuxNS9aMfZBo+BgcEXyRsAeQSkpqqckB3Eg6EH7g8G?=
 =?us-ascii?Q?v6Dn0OUrXNm8JkSsEx/ThUuZUTFTJp66qzIc6p2MWXowh3QB0hfyVSWpvZ6t?=
 =?us-ascii?Q?SRs7Jz+UeQSG6FoRdFHw1l6P16xiE8S+xd1x07ESUWX07MqgA3C/WKHq2hZw?=
 =?us-ascii?Q?qtN39P+1u1E/ha4eKztq2ybGaRmTAr0OWY2nebgfCUWZLtW7hQ7B0Nb6Rty6?=
 =?us-ascii?Q?s0HMPp9ReEKlk/QcSQhzuOIczVEnAjLtsa0FtOHG2R9+G8PsCtEKCcbY9I58?=
 =?us-ascii?Q?/6mF0ypFcV7flcu6iDDLHnwMNqpoO/L3WJ+5bdWR5HG4FA3TCEHHfQvp2b5X?=
 =?us-ascii?Q?e7SbzO1IoHLoZ+pVu4YNlaaxWpYy6ImPGk6VSkPbEdlVbU1dS6MfEPLg6iLA?=
 =?us-ascii?Q?0NH+1IHbflJO4zxEqojBY6uTrI3+QWZaMDLTQvoSoJZCT8lk47X4dQ/TTUCE?=
 =?us-ascii?Q?z54AyL5l74dEO5N+PH71QZTQeUoL/5MItAHVm4iHZJ8a+vFUOl758QvVhsOc?=
 =?us-ascii?Q?9aUdsmgG3l1zbaF90JOY+c0LbfFKrQPLKb9h3tswTjevTSWjQIZ3uV+lzkko?=
 =?us-ascii?Q?byu7KszmgOgr48tFrMYTQeVHThj9fdHhXA4pfLQlgh2JM3Mgr+x6wIKKYA0y?=
 =?us-ascii?Q?3JYbkOqL0ywLR112AnhgsTlzpamkdTipjXjXpG8mqrnHuMbA9ej6dRWxSkxM?=
 =?us-ascii?Q?bLRJtQJ5mPYT805wJDqdasR0dMGOoioKuvVTIUXqa/4R3ZOTdH0pn+QLEKS0?=
 =?us-ascii?Q?oJj3WedhHgI4pi2K+yo2qc77WwSver9WBTKsogYezbNQAF3ePV45QTdkOSAe?=
 =?us-ascii?Q?1ePlojg8oxqZBwCaIvknkrBiW3FEuaB5URTH+k3QT0y4CIvvl8sOTUT6F4TU?=
 =?us-ascii?Q?CAPj+FvYanN+u03gLOGRfq3bfUrG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yAbgekWRr0g0EV1wp4U8AxSPiZTVv8bBf56XfNSjaD7LHB55iNU6ajn/7rJS?=
 =?us-ascii?Q?he/xkrdzJ731Ev1CXiJ9b7jxJ9WOS5IoEcKFjGozYbSinrEm5U1hWSLAblj2?=
 =?us-ascii?Q?5OcdCInmxZiRC6rAJl1IYp0CUB/xU8VzTLko2Bjen2E3vgSEtU8QNb93Bdf6?=
 =?us-ascii?Q?rqXw+1Xkk0obxiAczs3ZXancKCQOneGSBx5jmOwiomDPYVnntdvzjiiT5Eqi?=
 =?us-ascii?Q?N8HaKKd8ZhORsGrYbwe1KxeJiR5NYx8dSTRfodXH8Aoq3LHXtik9di6gnQ2t?=
 =?us-ascii?Q?ZlcTs3uYHIzUgavigXYmHMYDyfFFoTCJIt9pEUUYtlMAb8IJEAycuZzlJqa5?=
 =?us-ascii?Q?Ilsnk9CcZqKX8pH9eW3LoOCy21cQUb6NRLS7LgjmPenYahaeGgnNTDlGdg0c?=
 =?us-ascii?Q?DpqsxsxwALDWmk1v1zgjS4gfq3syfZbgTQXv/V1pWjIrJxk778reYPtZaX3Q?=
 =?us-ascii?Q?JxLGNJbh3tLNVI69BgUkzUZWTcOlBdfkMJMr+HOyuzEDVhQEf0wvmm1kww8A?=
 =?us-ascii?Q?AxWjJVqYCxsLtZOdpdjMKjHAKGNhxCpYMAqYiSmYcrfkmgb5ROAnfc5cYjC6?=
 =?us-ascii?Q?+s3X2w4J5610v80f0HddwixOwEmn4RIBsv6thCW0KAPCfCRJac3ZFTHlXg73?=
 =?us-ascii?Q?KitEBUobSq1LVTQYbY7pfaijkgzGCUWIRNrLeqTBPQ/q1A4DpvZwYlkQltuY?=
 =?us-ascii?Q?AZvM8uPwA30DftTCXnys/ABVgKk0jALWMsee5gaGuW2xQDgzdghGgAFNy8uS?=
 =?us-ascii?Q?rQq2wTwBs50sAnNCg62oJrkkHfv4srBbVUIGtmMtakuhaxJCPbOIdhs00uwj?=
 =?us-ascii?Q?2hF+2u3Hrv+iZlcs5vY7+QeBdLQFrMSuwZpD6a69OP6Rs3rr32xYoHAKMWzE?=
 =?us-ascii?Q?66rlShA+2SJt6S8yyXVoaKvQz7XnTJGiVi5+/kMhnOPduG0V2446VOxEaUUk?=
 =?us-ascii?Q?mekPaqHrF4frmk/ieAZ06HOo+K0Gdzzkt9O3ENdoRY1XrzxVW83BbpWBCdmj?=
 =?us-ascii?Q?5uC1WFCmGml4Y78RZYQVFIYWnhiEfUqUMUqEccOwJuLWYDUNImi1cXZg2qtt?=
 =?us-ascii?Q?6SiLEgqbeGAeoX4e9puVGPzilj1Igjuy5Yz8KZQus0X7lAKDuIkQyfty9Cmi?=
 =?us-ascii?Q?ja9AVm07k9Yxii2uT7kK0795skdol0hAnN/QC99Y+5MV8hnIzSODX6fUdAqP?=
 =?us-ascii?Q?NNXibYkhb7R+SfHT3SCt7XYT3Gwq1OJafEKMNDR2HcBLmjzuv+JdZbh3rVna?=
 =?us-ascii?Q?Nw/8csmi5fP0uDzyR4i9AcybQSrApjseMUiafb38LvQ+aMT0ZPTX1KjIaG45?=
 =?us-ascii?Q?YBVEN/pLP933gBiQvudwWNuoW65Jdp68MtCcgTnYp8IudCtbtS1v02jrxAOI?=
 =?us-ascii?Q?/DeEcZcQPmJvpGkYdvkGCskmvTHXyFy1nyHAecUt2YfttLy7w1AkiI2v32qC?=
 =?us-ascii?Q?fB00sVe4vvpcOc7Njc5QmviGx16gA9XMO5jxzDDcoTjxV592/Dw3qkH3Ucbj?=
 =?us-ascii?Q?7iNwYEcayN83/zGqfDVFZ9ucg6m9KApGmyOWv7RFu724jFpFOdfs6ZM4cd3b?=
 =?us-ascii?Q?4e8/p1NSEh0pxomBDkearoV9L1pb3jO2Bzp5zMYkdAVCjEWxfgRhEqe9wmHy?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0ac66f-d61a-460e-5362-08dd5ffb4aeb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 17:45:05.7883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/KPT5pheAOjDAR8F5/Ljedh/P8qdW9Surs7HUTcNkW/rV4iIfgbFPu9+mqEHvHlgPQJZRedweCBW23OUMIK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
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

On Fri, Feb 28, 2025 at 10:37:57AM +0530, Karthik Poosa wrote:
> Change sub-category of below tests from Power management tests to below:
>  * tests/intel/xe_gt_freq.c to Frequency management tests.
>  * tests/intel/xe_pm.c to Suspend-resume tests.
>  * tests/intel/xe_pm_residency.c to GT C-states and idle residency tests.
> 
> v2: Modify sub-category as per review comments. (Rodrigo)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_gt_freq.c      | 2 +-
>  tests/intel/xe_pm.c           | 2 +-
>  tests/intel/xe_pm_residency.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 1fb6d2b53..843144ad2 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -7,7 +7,7 @@
>   * TEST: Test Xe GT frequency request functionality
>   * Category: Core
>   * Mega feature: Power management
> - * Sub-category: Power management tests
> + * Sub-category: Frequency management tests
>   * Functionality: frequency request
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..19b0d5ef7 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -7,7 +7,7 @@
>   * TEST: Check Power Management functionality
>   * Category: Core
>   * Mega feature: Power management
> - * Sub-category: Power management tests
> + * Sub-category: Suspend-resume tests
>   * Test category: functionality test
>   */
>  
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 3432077cc..d1c25e944 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -7,7 +7,7 @@
>   * TEST: Test gtidle properties
>   * Category: Core
>   * Mega feature: Power management
> - * Sub-category: Power management tests
> + * Sub-category: GT C-states and idle residency tests
>   * Functionality: GT C States
>   * Test category: functionality test
>   */
> -- 
> 2.25.1
> 
