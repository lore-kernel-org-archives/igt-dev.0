Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FAD262AD
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D010E1DB;
	Wed, 21 Jan 2026 02:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrwAZiqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F4710E1DB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768962073; x=1800498073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RFESeQ7kGvKsWcKAcoC6Og9hKq/vKXKk7ITzlMk9JPE=;
 b=IrwAZiqaQQpkmyIps8waU5s3bWVbhQtaAxAvqrhCho8Zl/H2OJp5k07H
 DxQ5hTD9sQylrAUhmpdRDAAr1R93/dauAUOJW67t/P8cKZP82pRlSZzeO
 qgCL09u2C2Jpb6aBMAG7wfnW/1RhpFOn9ZGrUacaUfzut6lirSFaghzyP
 Ii+WYQGN+dRtpkeVA6ZmPFJe0dmtHWcajqGl2WRD6C2rNYbswLsM5YXZ1
 Rrh3ch+DypEVEGnagvggBeTxCI54eMPO52oIYt4oEWmM9G/GSTfZYTi83
 9S4pcrPNgSj/H2fTsCXAq+J43Gd4DQYRuqSf65MFHOE4ku/KijHK0vW3s w==;
X-CSE-ConnectionGUID: kpURIc69SPqD0T28MF2TqA==
X-CSE-MsgGUID: 7FIARZp1SiifyzXYNkDdkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70089713"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70089713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:21:13 -0800
X-CSE-ConnectionGUID: rIE/+fABSgql/GJUlm71nw==
X-CSE-MsgGUID: plL+29/yTWGI18CRSNcC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206100371"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:21:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:21:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:21:11 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:21:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVlTbHcSMNFegMDDWXinWA9DBzO6nx2w3ttN4eoGTdRHgCu678sOEXEPJPLgFeCVMU+3bQIfcQc74cV+HBuC471A0BmDd9wSZgDrPqYpAgPSZiO+ENGplBO1Zn6Q0SRjX68h2b4j3rmB5cPGzJQR4SNXJk+6MnB2H8L2Rs4Gvart05Wt5UDA6yvnKEckb8H2NLpuJRTdOn2uM4NFXxz6PiK3XORCbGJ1B3Y0d5YpbTvlHg8+CsxRMoPhYT1Zlf7ya5/ArJKipN5oDOEqsnLXJOPJstY4vIflYsZ09IOpDdHLWxd6GtMna39HBEQOWVopruyeQEFWM74nS/hH6qc2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeeKcWPHng0XLenoAaNaLK11FiK+qZrEO4YSEK1uSFg=;
 b=FOomXmLTUeQQug0ZzvHPTlBvTaTr17WtLMcT9KDEPz1akgdv8CGkUyFgtCrxzAA19Vssrk+Ia0zLF/8399noVWGjGT+AkqvNFOau6RRQ0Z3hxmEycmyAaAliR1y1ZWVZr03ESTKKun6hPc2XYC2kspcqXFu17rFuJrL74xnEJkSUomBhpuX5Yas/2pFtPj7ZrBzdXLDd9ps2gFi4NbM+tinw5Am+qGE9l9sI0Rva71oNaMbQQ8zisSX9G238m15yJ6tzaz2AMG+G+qiq3t1XNbG+zGTWyYal1ja5phdljDDC20V5LZwzNmdDnKEAVYGR8srQkAkf4szNdXkyJhLUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 02:21:05 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:21:05 +0000
Date: Tue, 20 Jan 2026 18:21:02 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 5/9] tests/intel/xe_exec_threads: Add multi-queue
 basic test
Message-ID: <aXA4Dou05ZN8ZYhn@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-6-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-6-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 365b2691-2356-4aed-ab51-08de5893bafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NfdBzGEDoGt+wTLViJ8VeiRdFkcCLm5HujSs7kUq46ygGxNdzZrPELI7+nM7?=
 =?us-ascii?Q?T2VQtTczdtx+7bsr7pK9TeqKyylGU1+KECfTcIW3MAAwOlAsTOaBvRheLywn?=
 =?us-ascii?Q?8SxIle+Sb/iz/CeVaiid/dnJA0RoEPSRa4w79ma9QUUM8eHwwHkVP4cnVApp?=
 =?us-ascii?Q?vM7Ryr9D9n/0VxbazctYVZsr7C6P0wxUsYbG1773+OjVfbGeLxa/DeEfo10P?=
 =?us-ascii?Q?WDhbtyXo0h+AKfj0BNFVXzzZiazhRNOoxStLp9gjbym3ahRyYqC4KJ7JusRB?=
 =?us-ascii?Q?N/tUkBpW0ETiUYVpKE4hIzoSje0sB6+QMZmhA6feWQSc9Vjkm6g3T3alHPab?=
 =?us-ascii?Q?YZ4mxCeUdfEuc1b7xVau4eFzwHk0TfkDmveuKPY4Y/YIBbYyJC6YZ7mxtaYy?=
 =?us-ascii?Q?0jrOXrV3d6T3tAJiOM53UbYWINCDHHdvOikeZCa9PMaUYmNPZlu4D/uUM0+u?=
 =?us-ascii?Q?ykWinvR66b/8Mcz7N67dNi1QXOmcSk2ubfvdwG9bq2FPhxfb8uso8sa1GAUR?=
 =?us-ascii?Q?ia9nd4ShVSlYS4YeLkN3QxwKbyRG43ERkhIHg/zGm9+ZSlLi2B2tqhOfzDt8?=
 =?us-ascii?Q?VIoeAOxExraAIK4LiVgFcPCVfh1llgjDRVYlMmMs/G/FQg8UAg9hDT37ZapG?=
 =?us-ascii?Q?I6AbqmsfJvc3VH3C6lfgdcsb21Fx67ibVo8QCGw3Hs56f3PWKPIpTa+NY5I0?=
 =?us-ascii?Q?b027Ci6IOXACaj+awc6ASCTpHHL2fCL2h0Sv3YuJMeqDYPFaWjGKNrPuDckf?=
 =?us-ascii?Q?UnfGACUEGnQkBaDohpCRETiaDK355nPE5BHfjQSFM51/ly80RhCX1X/xFWBq?=
 =?us-ascii?Q?XpdNM19YHmMPAOMVjA3tx8yg4UprXuym/ChEbj6+saEVrFHqwCOM4CsTFfWi?=
 =?us-ascii?Q?HXfL1CDDlBfAXg6j8n3QcnNA7qgNfcuittF6WWdOdcKyj/61261F8K0kOIHD?=
 =?us-ascii?Q?vUCcyAnruquvhj7rNCAv0Glp7cBO056qbXbhhZZZodMntBoeHpbwWf1+FyKW?=
 =?us-ascii?Q?JxPlRNNCeNDQWTnM0wZkyRY8EgOBDVcYEuVg0nFdp/IJCPisGIYjAEV+kHeh?=
 =?us-ascii?Q?IrLxrXHIrse3pafltRkZkAzRU4MLOnVeh1SWMWus8Hla74r0vaGe7MFeQQEZ?=
 =?us-ascii?Q?i5xkJg6+52Ix0zGiHbKSNyRjH/14prKOiKZhFYetjtY2OdEH+jKZ2ZyaOuPN?=
 =?us-ascii?Q?4yVq1CoEkRPYajeM4odWlvyvxoynX+g0b1/N94myYi6d70LecABlsNRpKrvQ?=
 =?us-ascii?Q?0oSMRVDI3vCHUWsCpQP2Pj1PFwRGRHEOPR7tJQXKo4CzESDxjCmZuFXVxhJg?=
 =?us-ascii?Q?gtHf+vUlLf6TN+qkLy3x+wo9h1zG9eBPWaE2qJEj2oonc1hoHJV9wuXNNy2R?=
 =?us-ascii?Q?Ohgqp/r+eT2+Y7mszG8yBZDtWgKw8ijE3JY2eMHzwE9LMpz40sOTmk9nr/2n?=
 =?us-ascii?Q?0V+f+fHJ5HMF7ogZarjEEMjKi+dsXCHq5Nwio+GOSG+g17A92q5ibZEFekNk?=
 =?us-ascii?Q?clNC+3mHX3TfZ7rruBCJmdoiW2/3oU6yD99WU2dPWInOViv0o1nwWwNcv6ia?=
 =?us-ascii?Q?4RS1GYMks3e5VPXAuvY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQzHEHHGpIvKDV71KQr3UimdfaDVtbcuamxIz3igw+IVcAm2nQVNM1zDoucj?=
 =?us-ascii?Q?WFfEObK0ebBfIDaC3JGwcXOu/GxSQl6CRo9kL2eIrfeByAmWzq3ly0BwMGxs?=
 =?us-ascii?Q?yO9K8XQ4M/8zm343n8EBPMiUYebaae1eEHtJsve1O2jfEyk6WTN9vW8Vg1ej?=
 =?us-ascii?Q?LemB6RmDfyqrdWcmVrzBA4MimZxSQ214cIMt+O91QPaSxPiAhNyNkFbVdPfc?=
 =?us-ascii?Q?jA3ItScA1AhcwVmuLhp/aspkRnBZ1kp7leRLaFNaHpGT72cOstmvUgtXcqzf?=
 =?us-ascii?Q?4yq/25vpTbOAXu+lSM1oBLcJ2vOQJ1TYqEePXxCly6sN9/d2bi8dxn51Unsp?=
 =?us-ascii?Q?I4ZsvWpGkPSFDh/+teuusoXu+f+Ac2SwTT987az501SH2XK/nHUamset+TzF?=
 =?us-ascii?Q?pp7gthnShxsqMYxPnf99dzl59Au35RX0QlJwzycyP7Un+b3bO2jJbEUv+IFL?=
 =?us-ascii?Q?SWKitF5lbqBckYGcBD0PmKSIhkdl+Osb8klAuVpDx3sgEAOuR/CWUm5Ftj2A?=
 =?us-ascii?Q?sFawYT63ehoCNe2CkY98lijP5Nr8GHs1OTwC4+PA6IzyGGEvfSO2tthNNTE9?=
 =?us-ascii?Q?7J9WMNBwpsoRZ2LAOubmwo3sH1y5OhZN/6Rj3umI/PHYIq/Ddjx7BWW4d4gi?=
 =?us-ascii?Q?Ef/VwbrdtsUp9zBoK0npGxkNxkiqZAXGoDuS9cs8Pg8Z8qlHOrkSoAuT8y7s?=
 =?us-ascii?Q?ijq1EhmSlTXm5Rjp0GLOBXfNGThkxEWrr+OWIRFLU7NyV46vyWTR+Cz2Jt4g?=
 =?us-ascii?Q?adoUzufo2abCDuW9z+IjBxV1zY0ZgxagR9CM+2nIY0QsDNL36semITKjmTRv?=
 =?us-ascii?Q?tD1JB32fInX+M1j97Olb0u7k+2goxjpunyZWv8dKuYBMH3XZ2bypglvgYvFh?=
 =?us-ascii?Q?iVfrIZ6+U3G3cvLQfoj0/Ho7Bv31NCKvtGyXgOyu6HeoRHu6hwm/LsKy89bD?=
 =?us-ascii?Q?nsHb3Q05VUpjVBhF1aIRth/XXBkBYq7MtyIaYvMVtMxvoGXqandML9ZaRDKV?=
 =?us-ascii?Q?DlfekQMN/GiXWniCH2D/gBaoV21wFXFsX6PKIV0F8Gaq3th7smoz9hyEx8LE?=
 =?us-ascii?Q?tIDWxAkiO1IMq95brqRVP6GShUn3LYqXaNOiXDgkb4NdNxpGjbWczjHS/AZ6?=
 =?us-ascii?Q?Npnvf3vs6X5PgklkvSxx6Ozq0US1oqJoadaGNJq+K9fcPSKcfvloJNOLjFG6?=
 =?us-ascii?Q?TjNZyxepXw2x7c0XO0gloDZnSFCvvp4xOHUbJhlLZ2Lz2L7KSZ8V+HH6kjuh?=
 =?us-ascii?Q?ejIrytvhWNJvSGjKblOm2UK5vfdsAhnjAR4BWp0mmhLTkVym6KttNsXaEoBi?=
 =?us-ascii?Q?j/Um7EwCbhR7gH1uGZMkJLKSnztUdSRcaPYAcigIDp5gGXGcbWE9oSZmF2uL?=
 =?us-ascii?Q?+Hf8RpVHjFzB0NkzROJO0+rc7A7BBzm8OdXbID02GUw1Bo2JcQJyjDK2GDOg?=
 =?us-ascii?Q?6EgiPqvPQ+SNzUZTrdNpcxO717SPo5tXc8PhM7M+yUr02Lkvx/xCGc15RO1m?=
 =?us-ascii?Q?De7tmwLWAiiPvDmOLyhfqkMoqhXd6oDrB622mq262QBuCAGlyHv5yYDtIAsn?=
 =?us-ascii?Q?GjQEF5JX/XvHkg9e2gAPXdtSyLf3CGy6hww1sAoFlqWf1VSiajnieYiNqPWD?=
 =?us-ascii?Q?8c2EDqOVQrmaibr7YHNuw89x+eM7UNt8drJWIzKIUiNBlwToJpPpaK0WiKjS?=
 =?us-ascii?Q?Bi6qAk4kJFy1EULOOxUWp+ZiVaf2LQFiA92AJyWT4xvhxTp0QUnVUobcs/hy?=
 =?us-ascii?Q?i/sgD8nKzU4M20WlJqo6nDV1uuB2s8e7BtrwYEQGmzfux9UToU+B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 365b2691-2356-4aed-ab51-08de5893bafe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:21:05.6079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6OWURwDDm05YslNAOGnMD5fIGiaLjJd3xDQF7vuA7ckUaEtQUZjgyKcqu3JZwCCLs+rZIDtm4I6w2ZG+znbRx35P7EsfysrG1KxiKa6g037cIxYmlFq63VSkE0wKNHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
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

On Wed, Jan 14, 2026 at 12:29:21PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Check multiq functionality in parallel execution scenario.

Do not use term 'multiq', instead use 'multi-queue' or 'multi queue'

>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/intel/xe_exec_threads.c | 191 ++++++++++++++++++++++++++++++++--
> 1 file changed, 184 insertions(+), 7 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index e8d56a3ef..d63d81552 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -41,6 +41,7 @@
> #define REBIND_ERROR	(0x1 << 12)
> #define BIND_EXEC_QUEUE	(0x1 << 13)
> #define MANY_QUEUES	(0x1 << 14)
>+#define MULTI_QUEUE		(0x1 << 15)
>
> pthread_barrier_t barrier;
>
>@@ -311,9 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	igt_assert(exec_sync != MAP_FAILED);
> 	memset(exec_sync, 0, sync_size);
>
>-	for (i = 0; i < n_exec_queues; i++)
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>-
>+	for (i = 0; i < n_exec_queues; i++) {
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
>+	}

It doesn't look good to add compute mode multi-queue support in this patch and
add compute mode multi-queue tests in next patch. Move the above change to next
patch so that compute mode multi-queue support and tests are in the same patch.

Niranjana

> 	pthread_barrier_wait(&barrier);
>
> 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>@@ -540,8 +553,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 	memset(sync_all, 0, sizeof(sync_all));
> 	for (i = 0; i < n_exec_queues; i++) {
>-		if (!(flags & MANY_QUEUES))
>-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			if (!(flags & MANY_QUEUES))
>+				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
>+
> 		if (flags & BIND_EXEC_QUEUE)
> 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
> 									0);
>@@ -979,6 +1006,86 @@ static void *thread(void *data)
>  *	balancer mixed fd userptr invalidate
>  * @bal-mixed-fd-userptr-invalidate-race:
>  *	balancer mixed fd userptr invalidate race
>+ * @multi-queue-basic:
>+ *	multi-queue basic
>+ * @multi-queue-userptr:
>+ *	multi-queue userptr
>+ * @multi-queue-rebind:
>+ *	multi-queue rebind
>+ * @multi-queue-userptr-rebind:
>+ *	multi-queue userptr rebind
>+ * @multi-queue-userptr-invalidate:
>+ *	multi-queue userptr invalidate
>+ * @multi-queue-userptr-invalidate-race:
>+ *	multi-queue userptr invalidate race
>+ * @multi-queue-shared-vm-basic:
>+ *	multi-queue shared vm basic
>+ * @multi-queue-shared-vm-userptr:
>+ *	multi-queue shared vm userptr
>+ * @multi-queue-shared-vm-rebind:
>+ *	multi-queue shared vm rebind
>+ * @multi-queue-shared-vm-userptr-rebind:
>+ *	multi-queue shared vm userptr rebind
>+ * @multi-queue-rebind-err:
>+ *	multi-queue rebind err
>+ * @multi-queue-userptr-rebind-err:
>+ *	multi-queue userptr rebind err
>+ * @multi-queue-shared-vm-userptr-invalidate:
>+ *	multi-queue shared vm userptr invalidate
>+ * @multi-queue-shared-vm-userptr-invalidate-race:
>+ *	multi-queue shared vm userptr invalidate race
>+ * @multi-queue-fd-basic:
>+ *	multi-queue fd basic
>+ * @multi-queue-fd-userptr:
>+ *	multi-queue fd userptr
>+ * @multi-queue-fd-rebind:
>+ *	multi-queue fd rebind
>+ * @multi-queue-fd-userptr-rebind:
>+ *	multi-queue fd userptr rebind
>+ * @multi-queue-fd-userptr-invalidate:
>+ *	multi-queue fd userptr invalidate
>+ * @multi-queue-fd-userptr-invalidate-race:
>+ *	multi-queue fd userptr invalidate race
>+ * @multi-queue-hang-basic:
>+ *     multi-queue hang basic
>+ * @multi-queue-hang-fd-userptr-invalidate-race:
>+ *	multi-queue hang fd userptr invalidate race
>+ * @multi-queue-mixed-basic:
>+ *	multi-queue mixed basic
>+ * @multi-queue-mixed-userptr:
>+ *	multi-queue-mixed userptr
>+ * @multi-queue-mixed-rebind:
>+ *	multi-queue-mixed rebind
>+ * @multi-queue-mixed-userptr-rebind:
>+ *	multi-queue-mixed userptr rebind
>+ * @multi-queue-mixed-userptr-invalidate:
>+ *	multi-queue-mixed userptr invalidate
>+ * @multi-queue-mixed-userptr-invalidate-race:
>+ *	multi-queue-mixed userptr invalidate race
>+ * @multi-queue-mixed-shared-vm-basic:
>+ *	multi-queue mixed shared vm basic
>+ * @multi-queue-mixed-shared-vm-userptr:
>+ *	multi-queue-mixed shared vm userptr
>+ * @multi-queue-mixed-shared-vm-rebind:
>+ *	multi-queue-mixed shared vm rebind
>+ * @multi-queue-mixed-shared-vm-userptr-rebind:
>+ *	multi-queue-mixed shared vm userptr rebind
>+ * @multi-queue-mixed-shared-vm-userptr-invalidate:
>+ *	multi-queue-mixed shared vm userptr invalidate
>+ * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
>+ *	multi-queue-mixed shared vm userptr invalidate race
>+ * @multi-queue-mixed-fd-basic:
>+ *	multi-queue mixed fd basic
>+ * @multi-queue-mixed-fd-userptr:
>+ *	multi-queue-mixed fd userptr
>+ * @multi-queue-mixed-fd-rebind:
>+ *	multi-queue-mixed fd rebind
>+ * @multi-queue-mixed-fd-userptr-rebind:
>+ *	multi-queue-mixed fd userptr rebind
>+ * @multi-queue-mixed-fd-userptr-invalidate:
>+ *	multi-queue-mixed fd userptr invalidate
>+ * @multi-queue-mixed-fd-userptr-invalidate-race:
>+ *	multi-queue-mixed fd userptr invalidate race
>  */
>
> static void threads(int fd, int flags)
>@@ -996,8 +1103,11 @@ static void threads(int fd, int flags)
> 	int n_threads = 0;
> 	int gt;
>
>-	xe_for_each_engine(fd, hwe)
>+	xe_for_each_engine(fd, hwe) {
>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>+			continue;
> 		++n_engines;
>+	}
>
> 	if (flags & BALANCER) {
> 		xe_for_each_gt(fd, gt)
>@@ -1023,6 +1133,8 @@ static void threads(int fd, int flags)
> 	}
>
> 	xe_for_each_engine(fd, hwe) {
>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>+			continue;
> 		threads_data[i].mutex = &mutex;
> 		threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>@@ -1277,6 +1389,63 @@ int igt_main()
> 			FD | USERPTR | INVALIDATE },
> 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
> 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-basic", MULTI_QUEUE | 0 },
>+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
>+		{ "multi-queue-rebind", MULTI_QUEUE | REBIND },
>+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR | REBIND },
>+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR | INVALIDATE },
>+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE | USERPTR | INVALIDATE |
>+			RACE },
>+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
>+		{ "multi-queue-shared-vm-userptr", MULTI_QUEUE | SHARED_VM | USERPTR },
>+		{ "multi-queue-shared-vm-rebind", MULTI_QUEUE | SHARED_VM | REBIND },
>+		{ "multi-queue-shared-vm-userptr-rebind", MULTI_QUEUE | SHARED_VM | USERPTR |
>+			REBIND },
>+		{ "multi-queue-rebind-err", MULTI_QUEUE | REBIND | REBIND_ERROR },
>+		{ "multi-queue-userptr-rebind-err", MULTI_QUEUE | USERPTR | REBIND |
>+			REBIND_ERROR },
>+		{ "multi-queue-shared-vm-userptr-invalidate", MULTI_QUEUE | SHARED_VM |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-shared-vm-userptr-invalidate-race", MULTI_QUEUE | SHARED_VM |
>+			USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-fd-basic", MULTI_QUEUE | FD },
>+		{ "multi-queue-fd-userptr", MULTI_QUEUE | FD | USERPTR },
>+		{ "multi-queue-fd-rebind", MULTI_QUEUE | FD | REBIND },
>+		{ "multi-queue-fd-userptr-rebind", MULTI_QUEUE | FD | USERPTR | REBIND },
>+		{ "multi-queue-fd-userptr-invalidate", MULTI_QUEUE | FD | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-fd-userptr-invalidate-race", MULTI_QUEUE | FD | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-hang-basic", MULTI_QUEUE | HANG },
>+		{ "multi-queue-hang-fd-userptr-invalidate-race", MULTI_QUEUE | HANG | FD | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-mixed-basic", MULTI_QUEUE | MIXED_MODE },
>+		{ "multi-queue-mixed-userptr", MULTI_QUEUE | MIXED_MODE | USERPTR },
>+		{ "multi-queue-mixed-rebind", MULTI_QUEUE | MIXED_MODE | REBIND },
>+		{ "multi-queue-mixed-userptr-rebind", MULTI_QUEUE | MIXED_MODE | USERPTR | REBIND },
>+		{ "multi-queue-mixed-userptr-invalidate", MULTI_QUEUE | MIXED_MODE | USERPTR |
>+			INVALIDATE },
>+		{ "multi-queue-mixed-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | USERPTR |
>+			INVALIDATE | RACE },
>+		{ "multi-queue-mixed-shared-vm-basic", MULTI_QUEUE | MIXED_MODE | SHARED_VM },
>+		{ "multi-queue-mixed-shared-vm-userptr", MULTI_QUEUE | MIXED_MODE | SHARED_VM |
>+			USERPTR },
>+		{ "multi-queue-mixed-shared-vm-rebind", MULTI_QUEUE | MIXED_MODE | SHARED_VM | REBIND },
>+		{ "multi-queue-mixed-shared-vm-userptr-rebind", MULTI_QUEUE | MIXED_MODE | SHARED_VM |
>+			USERPTR | REBIND },
>+		{ "multi-queue-mixed-shared-vm-userptr-invalidate", MULTI_QUEUE | MIXED_MODE |
>+			SHARED_VM | USERPTR | INVALIDATE },
>+		{ "multi-queue-mixed-shared-vm-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE |
>+			SHARED_VM | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-mixed-fd-basic", MULTI_QUEUE | MIXED_MODE | FD },
>+		{ "multi-queue-mixed-fd-userptr", MULTI_QUEUE | MIXED_MODE | FD | USERPTR },
>+		{ "multi-queue-mixed-fd-rebind", MULTI_QUEUE | MIXED_MODE | FD | REBIND },
>+		{ "multi-queue-mixed-fd-userptr-rebind", MULTI_QUEUE | MIXED_MODE | FD | USERPTR |
>+			REBIND },
>+		{ "multi-queue-mixed-fd-userptr-invalidate", MULTI_QUEUE | MIXED_MODE | FD |
>+			USERPTR | INVALIDATE },
>+		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
>+			USERPTR | INVALIDATE | RACE },
> 		{ NULL },
> 	};
> 	int fd;
>@@ -1285,8 +1454,16 @@ int igt_main()
> 		fd = drm_open_driver(DRIVER_XE);
>
> 	for (const struct section *s = sections; s->name; s++) {
>-		igt_subtest_f("threads-%s", s->name)
>+		igt_subtest_f("threads-%s", s->name) {
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
>+						"multi_queue is supported on graphics version 35 and above");
>+				/* Balancer can't be set with multi-queue at the same time */
>+				igt_assert(!(s->flags & BALANCER));
>+			}
>+
> 			threads(fd, s->flags);
>+		}
> 	}
>
> 	igt_fixture()
>-- 
>2.43.0
>
