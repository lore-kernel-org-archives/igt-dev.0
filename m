Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0D9C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 20:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E3010E63E;
	Tue, 23 Jul 2024 20:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3kDx6Ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2868410E63E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721767281; x=1753303281;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YwM4MMxl8k6FdjXeCd04t2G37b3CSpav3dtYPpsXOqc=;
 b=F3kDx6Fff6SNHL70HgK7lcCiMb8UPGfw9CR6Cy52rvCJlPJyr/5mufdw
 8AkQelCDVyW1DeMiZUt7iPSgGWDDULQlGqKy9Ol6qDdaMyTu233bazfN2
 jNJ4NWQWkDYtJ5Jn77Ofuj275/Vx002l59vfNlVvRTBXepRp9PvD+/RR+
 7XE5O8TIwzu6lQo2JKUa2iqbUoodOv/Byjc/4ga3OHbg8qJuyCAWrpBVt
 3bnvZF9Z1AauNNLoC04oWA98gK7BmTWDx1O5479VrubrUGJCeLoFIPos6
 0W5T4mSUDvtmUunpPfN1R/K4MmswBYasbd2GTrSTqnwm0s+Cw0uPGqrWt w==;
X-CSE-ConnectionGUID: 9858knGST1KX6ssGR7Pu4A==
X-CSE-MsgGUID: 9V9/fk1ESImiEyhRB0zesQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="44839690"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="44839690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 13:41:21 -0700
X-CSE-ConnectionGUID: c00YafGsS+WqN5roR5VKRg==
X-CSE-MsgGUID: FprDbvx/RTCA0WKr9Q61nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="53128607"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 13:41:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 13:41:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 13:41:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 13:41:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 13:41:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkpwmfeTq3L91ZVdFeflygeV7nPfS+b8KTC1CWer14Y14hUTLq5gI5MniYHwxcG9CP7yeCyXkVw6DQLwkWZirCZhdTu34dgZlcix0ssJwEwdN2FIJc1DQeiQ6bjmnS9J5j1/uQIu4h2YJUedXV9G4qgJOXyfCZEixOtzlBdic37CYs9v63XQUl168cdyR8zhmzYNSkd6Y6NRuH1rxqU0x7CsAvIWn0JpygvOqNbYlBBx7g2XKCUGvCoV15aS9iJ++vMeS7y7ZmGbzsIGn8YhNqLkUE12uxDdL6ID4CMeEF/uYgiM9Io4csOUb8M16GRFQQjXgqSQ0Hir3Ni3amOl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDxevvOYbxYhmN328x/+eZ8RdKbBTfizFJDobmt0nxE=;
 b=zJJPT82UNqL5SBvAtnygUDPB++/0fdmk5QENAu/NAJxP9HKFMC2SJUrLQjeQTGTD1VfMdEke1ADm3CTxY/58LA3GY2wlKLxu4Y2pgEE8fqpZoq+JrHzsKrp4hCXnwW2bGjxvl3HY9sHtW/pnnfi8Ljt02IFbf/5fh7DtIjY1qNqF+PC+gTmthWcJqGVYTsmLDIniFRUoUB1eSNPtU6R5i3J8TSabUqx8KLaTvz//3J9rxaLUUIPFoQlsj1QVzqF/rh5OVsoc3kMbEv1yKNjHPGXnR1UOz4b24Kw6oWEh97AO2egI2FmIVhfj/rkOAKNZrnn3vKFzyOzJWsbTLtfGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Tue, 23 Jul
 2024 20:41:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 20:41:16 +0000
Date: Tue, 23 Jul 2024 20:40:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_compute_mode: Add userptr free /
 munmap sections
Message-ID: <ZqAVOja/wSKs6oEH@DUT025-TGLU.fm.intel.com>
References: <20240719190914.1535721-1-matthew.brost@intel.com>
 <MW3PR11MB4748AA06AA1FF4BAB7205C77AEA92@MW3PR11MB4748.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748AA06AA1FF4BAB7205C77AEA92@MW3PR11MB4748.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c42220c-5c39-46e4-fc98-08dcab57cca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KpHFRiLrCfnD4obKeJF7M3gCC+zz7ZBrzWKnM/6F7SFd6ZWKa7sHFnxNKtZE?=
 =?us-ascii?Q?L/XMfLNCx6G46rtsOtEK8k3bYA3ZuTGMvsu81XlMOzt4T/5EpOXgo6nZ76Sh?=
 =?us-ascii?Q?yS8uo5dSHhdTPBLbUZjFa5SQdeUxuut4xWN52x7pt6fpOtLPCxCwtArjFtxi?=
 =?us-ascii?Q?S0dxNiIIbhJ3Ig2V75vCrBPqSEiux2b9uS2UW+gp2sgEeIhROuWm0Fd+qlzq?=
 =?us-ascii?Q?bXJBjklRFfWFPd4P8OjXFPuq9ERGRzEEjyuf3mjSM7s1QS6gfu3zinoDqxp8?=
 =?us-ascii?Q?LhztBnK9ywj6l9bxeadVkWWliDWgN9Cl1Xtlbs/iDCC1KH5HwuYQ2ydlc+YH?=
 =?us-ascii?Q?gD+DMc1HkdgmdHvWMPyeVF6eojnSJClVpF5g60Hy8Gpctv/g8UdZgLT6ljXy?=
 =?us-ascii?Q?niNk1gHkx2zROztUf04fMraNJMPo9/kFHeEnwFFW3a+OR0VkwnSppTBHB7Vh?=
 =?us-ascii?Q?3I+XAgOLiWBmj+q8/EjkU1dwxiOCT5oV3PfU+lErpsBzXNUPXvPgAxr5k78o?=
 =?us-ascii?Q?MAl0YvW7RjFG8NK9wrczsaI8E6jsKLGyg2UVigB0C9/sQFIFC1Li7rRshbni?=
 =?us-ascii?Q?Ckbb4/dOaI66M9g2Gx0NomGkSqQYoDHDyrTeyrXUDfBJmrpkfCyky3yVjjb/?=
 =?us-ascii?Q?NAwwNNRizRj8u9dk8aF7ECZA5RFCIepQoumv1bUPT/Zcp3HT8sAOGqnHhsxU?=
 =?us-ascii?Q?Kn9NRwY6xf4DDQ2nBBt2j3zT+h2SmMr8Rs8IHQ4RQH8NKJCyNobCI5NihtRT?=
 =?us-ascii?Q?0TR8cizqZUYEwlASfjLlEHBFFDPAmpfwQ3IPIv4vT02IeUmiu1k+s1fJWMUz?=
 =?us-ascii?Q?DOdLo932I/vbCzmouYRFuXKkX9Eqp4IS+tWomhMdA3iHfrARItwjQU06h4Nn?=
 =?us-ascii?Q?orMjgkDJhk/mFthNHaVUBofzcppJT/lIFUxk9PFSHQqMVQtOGSEtLL9+qrUs?=
 =?us-ascii?Q?nYylluWZDRwZCKOiTR1Hj3Z1W5LYspIQvYGrqh/EkK+FOqU/vbG9dsLBVJkK?=
 =?us-ascii?Q?W59g37bxXd8Xygxp3xHLK/E8cOIN5q3H5HNESjVySfBvb8XbQIgG1eQxBtm0?=
 =?us-ascii?Q?NkAQUefZgThgyGNnOqXh2L66dQmE7JR9skQq/zcwvmLzgMez1qBS2x7ZDuO4?=
 =?us-ascii?Q?KzH2OqFPjRr9QXQwMTxbD2tUEWFYLWzVZZymyTdQcpVDWOVBoek9Kz+XsYkQ?=
 =?us-ascii?Q?nxfrLjX/H7rDtJBcrFSc+F2OzR6W1pb23KZOLF1hWWNNoVu9CpF8ODsfRc/+?=
 =?us-ascii?Q?Kqv0rvkmcE6i/Lf87j/qodnIowqFLHDdquNOIyVtpMSnTCcjzV2C2rih4gLf?=
 =?us-ascii?Q?44M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14vTq7JEy0sCxtORlIpxF79K6GuYEMcjscu07pDEbgZt3wKgFUH3Cl4hk9X5?=
 =?us-ascii?Q?5s8SFvcBA3s/tw++ivXDJPQoCEqu9jfKP38PH67JrIZ8uPrUNFj7yrKR3uPT?=
 =?us-ascii?Q?2XWthAT5AfN3tn0ldweMkVjw5d6vWWHYAfEGMG8XV7+ukFS0Lt0lu8RVarZL?=
 =?us-ascii?Q?3k4lyfusVD7kOUsHfPqB6dt48Wpk/dhBPVEdP+55aK0V+8OrIfRPL2C7szuA?=
 =?us-ascii?Q?+2BfDo3SBJ6MC2c0QxO66U1y7RRwKJD7LIV4+W/NOY2PGKdPJwzj16GyMylO?=
 =?us-ascii?Q?2HwYTCjn8j+mV6XGW4eM0Ow2nuvxuRvD54HIZGl79oJJWqtAECnx8vY6SDu8?=
 =?us-ascii?Q?ZBS2CeRtOCAwD8eIcBGZf0ahIorYrp98k3IXQzTWf3BQVhVFCdn8Z/6il5/6?=
 =?us-ascii?Q?ynDuOMeNWCPPP4+KUzbITz3M/QBt/6Ef5w6LxSOrPxCbzTvouPICvUctcUZ4?=
 =?us-ascii?Q?QpSUFgME3CeZ8bpDuOAdoiwb4Zz8697tAoSH94aRsUM4Ms0yVgaovxLVOKI4?=
 =?us-ascii?Q?N7rgoToP9pyzKoOk6ydgcfWUq1Cc2/4j/h/GzFcnZa9RK59sjtbiTbL4r5RH?=
 =?us-ascii?Q?hxmU2Xuspau/1rf9s0In2ne2VJIOqVeT4DJ0cuczYKqiVYvrdLRP/TpMobyt?=
 =?us-ascii?Q?HZv5KfyRjXzLT5HlSagHyBgpRz1ZDDkhhGfA4FG/1jQ4uZ+V1cqEaWvl+0zd?=
 =?us-ascii?Q?J9hsJ0UzhnhZYzqjoa73jk65X5U/U/NGc+r38RQXD3lMAIQKT3qQKPkmmRqq?=
 =?us-ascii?Q?yaaMblX+sy3nxKkmXonylP5FrjS+i86yWQFKxX9/RHotsCXeHOCJrBXzNXsi?=
 =?us-ascii?Q?v8+gONJJ2LIASGRmULPmYI90Ktlt/TOx/ZKZMxI0Cc3sIcirJQVu7MeHTCPy?=
 =?us-ascii?Q?wnn/4WLEuOYGyzq/NqK2q7FPYw4dnnvNMSC5mHhSSWAyV/4iLbp9JbgP1AQ0?=
 =?us-ascii?Q?qKqpTG4TJzOJHNx69eAdkb+XIrAk2mT75f76iicsld49lMZ2XR29+mb7fFNi?=
 =?us-ascii?Q?x0+v0ZvPIwkrglFDfzBWOuJSBkxAmunt5t38CJWKh1FgUfvHKy5OcRVgJvFv?=
 =?us-ascii?Q?SV/T0mRAuE9/deuZW0mJ7b7G+By7onQh7DBnhRlarfkOAMHQGzgw0hf+1xtH?=
 =?us-ascii?Q?FMi47iwsuO0RoSflKjHJQFAcBxNNXCaVj3drUvsWo+6yat11w9v1vJX1DvWy?=
 =?us-ascii?Q?aqLz4nvq5H651rrnuIztxA7uXFi1jbqGSA/tY7KZTMEW9zE4POwY8cecEWXu?=
 =?us-ascii?Q?/Kx28s41kCz/mYVBJym22minoJe0OA+1e2d42MXFBLMxBbHl90s82ZLLqWbf?=
 =?us-ascii?Q?r6AL+AvLBiNt52YfcsN3EQCDbqYNPw28Klw2crzZHEP8mEeDIq3RMi3Mv2vO?=
 =?us-ascii?Q?xcsd78Qshb/iIKA5sXhaxIytYRKXYK0X7oSjsEre4BRCyvlCQ8iqHlWUZdkE?=
 =?us-ascii?Q?blRwkrNRfVac/fmO0sGEEzf4pZGB2SkX05NuvEKPEqLr7WXI7uwETVEkQbxq?=
 =?us-ascii?Q?M/QicC4LEa0Ss43PD9zi5e8WTNQFWoEaV41ZuhXbDp2nGz0dNbqG13dD/74d?=
 =?us-ascii?Q?LqHaq+trjZge1bKFeOCKuyzlwSW9ZPAgY4iHkZIZqAIX2fqaQ4/obZVALH+P?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c42220c-5c39-46e4-fc98-08dcab57cca8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 20:41:16.5589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKK7T6eg+9hlkjwU+/D3tuQu0iv48D0LBP9ZSynAMpxUJ38JnqyiwbLJFvdI1puP5SvqOrwoqsvS94XT87rn5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5863
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

On Tue, Jul 23, 2024 at 02:00:40AM -0600, Kumar, Janga Rahul wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Saturday, July 20, 2024 12:39 AM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [PATCH] tests/intel/xe_exec_compute_mode: Add userptr free /
> > munmap sections
> > 
> > Add userptr free / munmap sections which does the aforementioned while the
> > userptr still has a mapping. The userptr will be invalidated triggering a rebind
> Which will trigger the userptr invalidation in this test.free and munmap ?
> or do we have to refer this addr in batch buffer so that the addr will be invalidated
> during exec buff submission.
> 

Before this patch [1] if we failed to pin a userptr in exec IOCTL or
preempt rebind worker we errord out. Apartently UMDs call free or unmap
on a userptr before unbinding. This verifies this doesn't cause
problems if free or unmap occurs.

[1] https://patchwork.freedesktop.org/patch/582642/?series=130935&rev=4

> > which will faill pinning pages as the userptr is no longer valid. This is allowed and
> 	       ^fail
> 
> > should not corrupt the VM or future submissions.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  tests/intel/xe_exec_compute_mode.c | 43 +++++++++++++++++++++++++-----
> >  1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_compute_mode.c
> > b/tests/intel/xe_exec_compute_mode.c
> > index 389de7ca40..704d975178 100644
> > --- a/tests/intel/xe_exec_compute_mode.c
> > +++ b/tests/intel/xe_exec_compute_mode.c
> > @@ -29,9 +29,11 @@
> >  #define REBIND				(0x1 << 1)
> >  #define INVALIDATE			(0x1 << 2)
> >  #define RACE				(0x1 << 3)
> > -#define BIND_EXECQUEUE		(0x1 << 4)
> > +#define BIND_EXECQUEUE			(0x1 << 4)
> >  #define VM_FOR_BO			(0x1 << 5)
> > -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> > +#define EXEC_QUEUE_EARLY		(0x1 << 6)
> > +#define FREE_MAPPPING			(0x1 << 7)
> > +#define UNMAP_MAPPPING			(0x1 << 8)
> > 
> >  /**
> >   * SUBTEST: twice-%s
> > @@ -51,6 +53,8 @@
> >   * @basic:				basic
> >   * @preempt-fence-early:		preempt fence early
> >   * @userptr:				userptr
> > + * @userptr-free:			userptr free
> > + * @userptr-unmap:			userptr unmap
> >   * @rebind:				rebind
> >   * @userptr-rebind:			userptr rebind
> >   * @userptr-invalidate:			userptr invalidate
> > @@ -74,6 +78,8 @@
> >   * @basic:				basic
> >   * @preempt-fence-early:		preempt fence early
> >   * @userptr:				userptr
> > + * @userptr-free:			userptr free
> > + * @userptr-unmap:			userptr unmap
> >   * @rebind:				rebind
> >   * @userptr-rebind:			userptr rebind
> >   * @userptr-invalidate:			userptr invalidate
> > @@ -88,7 +94,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> >  	  int n_exec_queues, int n_execs, unsigned int flags)  {
> >  	uint32_t vm;
> > -	uint64_t addr = 0x1a0000;
> > +	uint64_t addr = 0x1a0000, dummy_addr = 0x10001a0000;
> >  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> >  	struct drm_xe_sync sync[1] = {
> >  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, @@ -114,6
> > +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> >  	int i, j, b;
> >  	int map_fd = -1;
> >  	int64_t fence_timeout;
> > +	void *dummy;
> > 
> >  	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> > 
> > @@ -142,6 +149,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> >  					     bo_size);
> >  			igt_assert(data);
> >  		}
> > +		if (flags & UNMAP_MAPPPING) {
> > +			dummy = mmap((void *)MAP_ADDRESS, bo_size,
> > PROT_READ |
> > +				     PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > +				     MAP_ANONYMOUS, -1, 0);
> > +			igt_assert(data != MAP_FAILED);
> Check  dummy here. ->igt_assert(dummy != MAP_FAILED);
> 

Yes, will fix.

Matt

> Thanks,
> Rahul
> 
> > +		}
> > +		if (flags & FREE_MAPPPING) {
> > +			dummy = aligned_alloc(xe_get_default_alignment(fd),
> > +					      bo_size);
> > +			igt_assert(dummy);
> > +		}
> >  	} else {
> >  		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> >  				  bo_size, vram_if_possible(fd, eci->gt_id), @@
> > -157,16 +175,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> >  				xe_bind_exec_queue_create(fd, vm, 0);
> >  		else
> >  			bind_exec_queues[i] = 0;
> > -	};
> > +	}
> > 
> >  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > -	if (bo)
> > +	if (bo) {
> >  		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> >  				 bo_size, sync, 1);
> > -	else
> > +	} else {
> > +		if (flags & (FREE_MAPPPING | UNMAP_MAPPPING))
> > +			xe_vm_bind_userptr_async(fd, vm,
> > bind_exec_queues[0],
> > +						 to_user_pointer(dummy),
> > +						 dummy_addr, bo_size, 0, 0);
> >  		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> >  					 to_user_pointer(data), addr,
> >  					 bo_size, sync, 1);
> > +	}
> >  #define ONE_SEC	MS_TO_NS(1000)
> >  #define HUNDRED_SEC	MS_TO_NS(100000)
> > 
> > @@ -197,6 +220,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> >  		exec.address = batch_addr;
> >  		xe_exec(fd, &exec);
> > 
> > +		if (flags & FREE_MAPPPING && !i)
> > +			free(dummy);
> > +
> > +		if (flags & UNMAP_MAPPPING && !i)
> > +			munmap(dummy, bo_size);
> > +
> >  		if (flags & REBIND && i + 1 != n_execs) {
> >  			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> >  				       exec_queues[e], fence_timeout); @@ -
> > 489,6 +518,8 @@ igt_main
> >  		{ "basic", 0 },
> >  		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
> >  		{ "userptr", USERPTR },
> > +		{ "userptr-free", USERPTR | FREE_MAPPPING },
> > +		{ "userptr-unmap", USERPTR | UNMAP_MAPPPING },
> >  		{ "rebind", REBIND },
> >  		{ "userptr-rebind", USERPTR | REBIND },
> >  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > --
> > 2.34.1
> 
