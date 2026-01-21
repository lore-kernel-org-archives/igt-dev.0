Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D626D262AD
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDE610E67C;
	Wed, 21 Jan 2026 02:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEr1+T9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A35910E67C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768961784; x=1800497784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ChUV1Wg94cZXUP5nL7rsP1E4XM9wiaPnO3vR3WQ0l/A=;
 b=KEr1+T9WOxPJhno3BSnkMfzJH6pIFL9dHQAuxlKGgZJc6cP/HZNohidC
 82MzkdeQc0OrEod5PduvXgPYwFET9Ao41l/FE3aNYqklcVR1VV1iBzR/S
 VnU4s12GWhpcy2szQeA3kPqEouchpyQY7i8xDXBeXO7/KAOUyu1Au7D2S
 LvxJmhoOiAUulO6+LTR8hFeQJdPQRd+ZhQPAia8Pxml2Xm0OGQSTBtELl
 RJDxVH88xTQXpzPtYZldHpXWI5EDpkv8HaJQjpo/bYAdQ1Vx5fgIILrNq
 qxd+ib8dRuD/l8HSRNpWK6tkH8bxqjBDdrmtbZ64SnMDG3Ld1eB5iN13/ Q==;
X-CSE-ConnectionGUID: ldLuAIRgRMiewhQ2nxnKYg==
X-CSE-MsgGUID: 0ZZizEtoQtKAhyXBu1jF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81627636"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81627636"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:16:23 -0800
X-CSE-ConnectionGUID: V4L3Bw/cQx+/IuMC1gtX5Q==
X-CSE-MsgGUID: 0XaEW+uQQu6BDoqPydgHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="205538834"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:16:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:16:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:16:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:16:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0KYB3OlHUEVCKCNV1R/G1Lc/rWQsWIrZiGqX95qAQc7js1kImLYfCYTteZwt3znSQ+HKR2ujFDaZW4MSepokV7ImpC6EfnPcXraWxrEB1eEjCzS1AnVgbUVH60sqM5Tb3LVZuPgaUkNU6kDvh5CqOm4p8vKERhjBaHigD8MXD9bRFZ1ercv5hTf2KzD2fr2DkVlW0ZIsRvfZoB1LlqvMDgWbkDdjnLDWFIw5y804K4Ng8/H/2f292ELGIQU37GAuProMZ2PU+7cnTI8vUnYsT5fmN8eznwoZSzqYww+o+H3zXJd9AZhY9u5UZXMA3zuJYWK3WJ0Oa+nfVzTwHiNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rQzJ0VTVtrKZFUE/2M1uAbpB8Nm93vdaJP3CHu/Zjg=;
 b=efdClTlRQaIK+em063dalVjdLt5BL5OhSoyDfSPINM63cl/o8UbAxmkRhpClXkQe2df6I7PJJIsvuJ7HcvDpTjmqO/1QgmjT/9z7fEah8F1g+D0qydybheHtWYLAhjXjcuCnokgT0LCf8ZcG01iJaQU/8c90IEXi76Q3/aBy4UpPuAZU+vRhZVOMHGaNIp7oQTJBhA6A5PC44nrtl59VGUaxq6MWFJKtW8GrN3yZ+asiKzJ2OBTwh1PPaZTwkaQw0AclfyTQlFTlUP/Zdr6AoXhLgAmcS1v/zgsM1fpoJcaNy9sVhHmkSdMA13ycmO0kahZxP+OOjUnrpNQ2tSI5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 02:16:13 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:16:13 +0000
Date: Tue, 20 Jan 2026 18:16:10 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 4/9] tests/intel/xe_evict: Enhance testing of
 multi-queue functionality
Message-ID: <aXA26t7w4n2rTy1r@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-5-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-5-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR06CA0036.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::49) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: e37e7871-18f2-441c-8b8f-08de58930ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4nDUumeCZoVd7aJtCb+pewIfCWGGBQ6MdvtFHMv6e2Rbb9iHxMOtMnqmI6fr?=
 =?us-ascii?Q?Mr4ya4Dsi+hRmyPE4usjTVzhvh79WfICkGW43kk+K6OPD+p/8d6gEe125sGK?=
 =?us-ascii?Q?RPuh5pjoDW8LPyGHGvvRyYke0575iCgatk5WKRTp5FiRt0A73UZDKp77wDk8?=
 =?us-ascii?Q?rcFSDN6koDIjbr/w4y0Gia+xYCWwtjUsELnilgWD9WArfPSTh3CMWUI5dmDZ?=
 =?us-ascii?Q?h8oAfloMDulHjahZ/PNarqPNfY9oFLL2SSxpRi+bi4ENLqAnfcOts5/ayhWk?=
 =?us-ascii?Q?vLbXQVhReVIVD1aDcHB1LgFeXR0goH0Np7e4qG6TqO1z/QfCPoyBj9TeWstW?=
 =?us-ascii?Q?ZLTGGTa9dLD3rG/MaC7PS05mT3rMu3l/8AdQXVO5HdeZ4wT255q+TEr7g7zH?=
 =?us-ascii?Q?M2bLh0ZWOuhyVZFkrLZUy89o0WTyLqSzDZEDelK0ykR6TIozrXYQe03R0Hyd?=
 =?us-ascii?Q?QmVZNhoC7rA+49ICfRvOGfTZupTWytC84kq+jC+8wTvxy8dMkRPTAe9wE3f9?=
 =?us-ascii?Q?sdM+TqMFZf8dEnv1DCOOJ0bOw75MrGz/3tRO8mYclJFz5B2yG4P13QKamS7V?=
 =?us-ascii?Q?LaM1mILqg0pIPjvk+GMPCAPu6UHVVDZ3hTp5odnzgPtGsfX4gd05FTmwGKb4?=
 =?us-ascii?Q?67Pb5C3n2T/mm6V8NdnFWjP4SLHbLIiuMCzLMxpgG+YH/NZ9STnHv+OJOj35?=
 =?us-ascii?Q?4uy6R3eFg0ACWPXxb7y+iHR9efWK3yXp6qYUlLLvzhKIak0hFMD/JYsQNEQJ?=
 =?us-ascii?Q?BUSx9KkOjZ5ACFdu4XgTZZ83uRMJFvGelf1TMGQGc4gpmSZfj9ZdlsNVePfK?=
 =?us-ascii?Q?/P1vruVP1SbSoa2TQp+zQYsktxpdlWn8t0NB0pmHx/43g3/mSndQjRBOoM3c?=
 =?us-ascii?Q?PzYj6X3+M6C7Q1OymMSdOIJySJ9tw4UaeqkoMpDRAOuaesM2V3VSQVISQvKK?=
 =?us-ascii?Q?cBo3q9SLNjAcGN8u1JdTj/SHxGEeIoJ57zWj9/Lp33FmfreJRmVIwtK56JzH?=
 =?us-ascii?Q?/EXl+y8YDiZf0Nf4X1gsEhKuAdP00pYvM6inZKzJp0MMycesmGEbQSpzPMHC?=
 =?us-ascii?Q?BrWp42QnpYx49DjxGLvUntrEJVkMLltZQXsBmDz6PYZh5XtnuN04NNDwc4PY?=
 =?us-ascii?Q?3co94j0/0vuSUDXM0Lv/hNFvxUrb9c9pIKdygPgjheYBWGky4FL0cTOWigIJ?=
 =?us-ascii?Q?moqg45yj4n6HLdCgNfIpPiGtYba35qWBBuzFjAu8kwsRstby3W4nqQBWH1Xa?=
 =?us-ascii?Q?nxC8skc0DwJ3HmWZpkeyY4j14C2w8pq82JuwUn1sOBGU6IKAXhjF4D0JoHNc?=
 =?us-ascii?Q?8ZjizfpyYJhjk3TrzhE5SNvT07Uh5HZP2RCCqzXzrLmURX0/APIvxGvHryt2?=
 =?us-ascii?Q?Xfe8sfy58DW+OhRJCPlpmPfpYf/Wj312yS/YpWD5dbGE3zngMOgFbx1cLhMF?=
 =?us-ascii?Q?zndzqppQpIKubh63DrA1nJOCFydRDNTIoFnt0Rj5h+Sezerk48btIWTFq5qX?=
 =?us-ascii?Q?Talt2dYIh+aFR9ZZp/9aHGqI5AyW48Zw/LBEH1GI+OHIWyDMjL0vsZPgQSrc?=
 =?us-ascii?Q?6AHGFizOy+X+Imfelog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TvxnQTWahZkGTfUDHhQ8sotTfyp1bsSq9Z4iUxKAE7n0GohyCC/PXDtChAZZ?=
 =?us-ascii?Q?ZhNU3xQYv0yZ/Y6FByVPUVmYTNsgzETlqnv9jx6lwiV1k30kI+hCoU9JZ7Cf?=
 =?us-ascii?Q?NCbxvbRpLl9iY3V8myMKoW25HWeq45AB1zAcFJ8xcc0Wx1mmnEBH39MkhPvG?=
 =?us-ascii?Q?Fj70SmiW7IqC16AcgqG/XDnlUckKlO/eysoOWIZA39YmZJQqoCQ3t6trBcQH?=
 =?us-ascii?Q?Tdf9F/mn+BTWjb691UOo4Jlowj+pV4B73+g8n5Ob0+fODzjTxMPE2lhkpNKM?=
 =?us-ascii?Q?G80NNMYztP+sIEzLgzYwZrF0+S4INvtTXuOFqaE8y5Sdww7RO7DGPCgVlaht?=
 =?us-ascii?Q?V62lqdxzmSAf2uxKSm238t620Vyb5ZrY3HrOixSpHwbeVcloNYl0pm9p+P5q?=
 =?us-ascii?Q?Yva0mA7S8Nb1j1jv2AXTHHbfVgMQrk6jbKBMZCpcYPEby1zzr1WbJCSkeXzC?=
 =?us-ascii?Q?pdj30u3WKu5jH5CNTr8O2fwAYbGmJF+GSTa/dduHWNbEV1uBSTXWMRdlA54S?=
 =?us-ascii?Q?a4YEQCVvBskUcmvfUr66iwuI5An+HiyRkQvA8YiDgi3eTWXtZ/g7XsgM5sjs?=
 =?us-ascii?Q?udCDYVduPCb7xNXO5MIPXzp5kMgLslaR1aWYnMKZVNVPjIJdL2Ua7Dwtczf4?=
 =?us-ascii?Q?9v6gLRrRSOoM+YrJ16omnzQaQXpo+vrN2/AshIEv1oWIM2NR50yVK5FetSD/?=
 =?us-ascii?Q?iSE76n4S6xX6gSFV2rJ1wnRS+UIxnu8b3aFzzBqax2QKuTTJ43NhPL9KUj+N?=
 =?us-ascii?Q?yoSZNKMHC/7YfmLrBmZqlCx9sLzOK8lsuxSQt+mNfeW2S06fuBunZkLEVsMf?=
 =?us-ascii?Q?AIT9kZjHMo5ALD8hpLgiAIxmOU4E9gY5kzSsMvqv6Q0HnJtmEXXtp4dWNoMr?=
 =?us-ascii?Q?Nthpu5aI3kFIADo2gnMC/M4TJiVfqKNrRBuxFvEE8+iD4ylgBzLuMH9iHNYJ?=
 =?us-ascii?Q?p+zZQtV012Qr0bEKLiNBARUpj8wo8Q5PdR7otgE+tpOzL+Jnlr5F3Z6rgiyc?=
 =?us-ascii?Q?M4b5a4/Wkn1LbdPtD12JmLeSwo2RN5WgFzeF5p96iLT1NuPWcBdcahUN6/iX?=
 =?us-ascii?Q?sJOQcxjHlWU1cM6YrDHsiNNjYxRZif/lLhCjw4qZB2pmRLh4gRKYXJ0vfDMF?=
 =?us-ascii?Q?Qeyr+a8/IJJlHOkiy7DVM7m+5QVxw51KHbyolcmqBXZs2NfuQZxvgCZvBc3s?=
 =?us-ascii?Q?olfag5GqUG6cfQEeuDZTGRfNZNSWqsC4EyIGxVljAZ27sp+iecw0KTfnGzi3?=
 =?us-ascii?Q?sNj4sPcKbhgY9Ce87wkMsuz8+y8dbUtqwxee7YBJOR2jugzWAldq/ea6AzPw?=
 =?us-ascii?Q?JTxN5KX3QLbJmEaw7MbCxiuE8V3zwJ2JNPwgE7BxaOYpPgzW2Uc7HFhIGSY/?=
 =?us-ascii?Q?DDpsl8bEyc4yimimFRZ/fcJT0RUrsDjNLleuNvV9cIlDyaobjjbxBvLaZwPd?=
 =?us-ascii?Q?+LtD3WdQmhD7ZJgS51uT/Qd+Pan1usHLcHsP1N6OmYF30sTFkLnRuUu5JDW7?=
 =?us-ascii?Q?k38wih0zJBCkO6HPs5hIS31BNdltFUbJPLmRS6SkbTDj/9ret+hADsHtaMZJ?=
 =?us-ascii?Q?vhAPmprgJqnAIhoeU++IKq9zZYGFhlaiVZXNHyGpHeqjU1Xm+ftVQ3F7fNbQ?=
 =?us-ascii?Q?7stJ7sIhl+nz/7Xl3WQQiC7iD9H2cbKi/Yz16uFhWB0A1PzrLwDIZ6zEZdh9?=
 =?us-ascii?Q?jvhl3p5mgKxXEhltPiU/dKN8EtzbE0KMEeEOTZDjhmFrPy+faS4sDK9xZkFb?=
 =?us-ascii?Q?p7NKqlxYm8cnHTY/1qABJ1Uxo5EfdEdqtlTuxKRgMczc09YbT/st?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e37e7871-18f2-441c-8b8f-08de58930ccb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:16:13.2828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Zi+nyJuyX++l2Xr1zcLNJI5b2aqLJrADPkf5LYZHwJOG1NFJyxSpOuV+8+M7QFDj64tbNrCQzEDUR63Nfl96Doag5IfZp8IEawzH0Yvm11Lvz69bZaR4EZhkdyNz5Ze
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

On Wed, Jan 14, 2026 at 12:29:20PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Extend testing of multi queue functionality with flags
>like EXTERNAL_OBJ, THREADED, MIXED_THREADS and COMPUTE_THREAD.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> tests/intel/xe_evict.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 2f23538fc..f3c8b8eae 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -563,6 +563,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * @small-multi-queue-priority:
>  * 				small multi queue priority
>  * @small-external:		small external
>+ * @small-external-multi-queue: small external multi queue
>  * @small-multi-vm:		small multi VM
>  * @beng-small:			small bind exec_queue
>  * @beng-small-external:	small external bind exec_queue
>@@ -596,6 +597,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * @small-multi-queue-priority-cm:
>  * 				small multi queue priority compute machine
>  * @small-external-cm:		small external compute machine
>+ * @small-external-multi-queue-cm:
>+ * 				small external compute machine multi queue
>  * @small-multi-vm-cm:		small multi VM compute machine
>  * @beng-small-cm:		small bind exec_queue compute machine
>  * @beng-small-external-cm:	small external bind exec_queue compute machine
>@@ -626,6 +629,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  * arg[1]:
>  *
>  * @mixed-threads-small:	mixed threads small
>+ * @mixed-threads-small-multi-queue:
>+ * 				mixed threads small multi queue
>  * @mixed-many-threads-small:	mixed many threads small
>  * @mixed-threads-small-multi-vm:
>  * 				mixed threads small multi vm
>@@ -663,6 +668,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * arg[1]:
>  * @cm-threads-small:		compute mode threads small
>+ * @cm-threads-small-multi-queue:
>+ * 				compute mode threads small multi queue
>  * @cm-threads-small-multi-vm:	compute mode threads small multi vm
>  * @beng-cm-threads-small:	bind exec_queue compute mode threads small
>  * @beng-cm-threads-small-multi-vm:
>@@ -693,6 +700,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  *
>  * @threads-small:		threads small
>  * @beng-threads-small:		bind exec_queue threads small
>+ * @threads-small-multi-queue:	threads small multi queue
>  * @threads-small-multi-vm:	threads small multi vm
>  * @beng-threads-small-multi-vm:
>  *				bind exec_queue threads small multi vm
>@@ -740,6 +748,7 @@ int igt_main()
> 		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
> 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
>+		{ "small-external-multi-queue", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
> 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large", 4, 16, 1, 4, 0 },
> 		{ "large-external", 4, 16, 1, 4, EXTERNAL_OBJ },
>@@ -767,6 +776,7 @@ int igt_main()
> 		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
> 		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
> 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
>+		{ "small-external-multi-queue-cm", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
> 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
> 		{ "large-cm", 4, 16, 1, 4, 0 },
> 		{ "large-external-cm", 4, 16, 1, 4, EXTERNAL_OBJ },
>@@ -794,10 +804,16 @@ int igt_main()
> 	} sections_threads[] = {
> 		{ "threads-small", 2, 16, 128, 1, 128,
> 			THREADED },
>+		{ "threads-small-multi-queue", 2, 16, 128, 1, 128,
>+			THREADED | MULTI_QUEUE },
> 		{ "cm-threads-small", 2, 16, 128, 1, 128,
> 			COMPUTE_THREAD | THREADED },
>+		{ "cm-threads-small-multi-queue", 2, 16, 128, 1, 128,
>+			COMPUTE_THREAD | THREADED | MULTI_QUEUE },
> 		{ "mixed-threads-small", 2, 16, 128, 1, 128,
> 			MIXED_THREADS | THREADED },
>+		{ "mixed-threads-small-multi-queue", 2, 16, 128, 1, 128,
>+			MIXED_THREADS | THREADED | MULTI_QUEUE },
> 		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
> 			THREADED },
> 		{ "threads-large", 2, 2, 16, 3, 32,
>-- 
>2.43.0
>
