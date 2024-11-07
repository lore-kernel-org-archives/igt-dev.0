Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39510D59F5F
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 00:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5CE10E03C;
	Thu,  7 Nov 2024 00:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCWCPlTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1626A10E03C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 00:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730940424; x=1762476424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3wHr4LbxvPk9GXWQflHOvu8fzGRAH38TQbCB1UBU8nU=;
 b=aCWCPlTpCFOisboqFBIiAdl1EuQ77mFtQo8doVjMuFEn/epPTROxkxG6
 wciZIaK92+IQjF28dP6PLIhCkQ1z52U6PTNn+wVqNgJ/u92rfNXQAcbzk
 N3FZ65EaXopZCOWZAuelBo6/7AZCpQLcL45OBjrgOBplXJ88nBU45X6mT
 od5390s+bGRA/zPP3cphj1caz5dUys6ZZaHgXEdFLWI8sZ+2mdCKWJFK+
 aYDH5NZRq2v/6vCJZl0xavP0BpVVLGnaSE5w+giQszJHLIvr9E1PBNGeF
 7KFdrTUjCn1BRg3QYMdL6ezUCMAqjIXIrya+nlXvUDtgWbNfzds1mhMoH g==;
X-CSE-ConnectionGUID: gNHIhMJ2Soy/FiqPufEEeQ==
X-CSE-MsgGUID: 7ke9hQRzS0qkaEKXuyq3Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30867433"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="30867433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 16:47:04 -0800
X-CSE-ConnectionGUID: KZCYOuSbSKWtbF+92ayYNw==
X-CSE-MsgGUID: NjsSn5hWTtOERnI3WdKDdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="84475715"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 16:39:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 16:39:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 16:39:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 16:39:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mu/ViAxyGZGK9MrMqqG3AlwTuEBb7Gvrmwm3SoqTDXbtGSO5CmaUvp0vhP9LvupYU9EH1FRtZWnyyU8GhWHOz1xP75e4AmjrSL/iHqC3AVi27gvt8XV4x6PFH8I8FgQnLuFGQkkjRIBZW3+M0BdUdqnoQrMoQAGT77+CTnbmxmkwtVuzk4MY+Rwh+rIwBMWbDK7um5SpoupSgIcrilAR6FBVzuj1sBeZpsMI91XFV5XaflUyE9ZJ2Y/MvnY1erYHfQ3P7du2smU7DDy5eoiq9qcYzqoFPaDUm1I3SB+mKf1wGRkR6iOQkeRfzxYEup8sY/7lO32QhD6JpD7NHt5vtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdcRwyhiJf/qLFrS+8m/+a12rDQOlB7ggpnoAuZJk7M=;
 b=LGmYg6538e1J3Aq+4MiUe/hNy4kzNWq1xWCtxFTnhKW4e5xL3yxduNH3dCpX0V2ug2bA1DyxUvuAR3QOkf+H0uQSns/xiQzpoSfuXkWD65AV0RJqjv7eO70u65Z9GpGqvE73PZW0DEWmEy8Cd472nu+Ii+kkCymjge06NduUWcAdyBM8p5cNN6OrNMk0MjIZCamRUkbvxEOu08q68SGnvo9fXkvWLyQVpnGNyuFlrgc7T5FPSuO0lqeE7Sk5loDVqX9n783AfJIpuIukCPGudU/B6EJu5YYOcBR8+FAHHMpiUCC8zUqlfpV5t3tvACbeOb4/gvN/LnnkT+mquBjatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 00:39:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 00:39:01 +0000
Date: Wed, 6 Nov 2024 16:38:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_reset: Add mocs reset test
Message-ID: <20241107003858.GC5725@mdroper-desk1.amr.corp.intel.com>
References: <20241101154432.3679065-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241101154432.3679065-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f79aaae-587d-40ac-a84b-08dcfec492cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrkHo1yD9xQbAoI44b4hPf2Tu2trmifwZJ4FR4iSTgqEXVTnSW9PxMnKNPto?=
 =?us-ascii?Q?d2LqOsvLnHioXTcm8iUi7EQuAcqVY2lTUkosU3TqwPFvVXWcA2/hYLtaofBD?=
 =?us-ascii?Q?TbfBrQnCF4HwNi3vvQ+jmrLFphiwmAphuP2j4XWHQymzvpv7r45rMURTr+rv?=
 =?us-ascii?Q?Kfx1q1MoM3Q8eqCqiYE25VmObobF6thCkESUwQx88VdtafCuszb+EhmaMFd6?=
 =?us-ascii?Q?k3DmOP0I3GcNJrqCqFJ/m6K9X4zuc3xvxJ88Oxa1k27QbR14rhx4NRaCVg26?=
 =?us-ascii?Q?W15U11Bf6p5/hXrPbMpxKBvCZWq/yo1WTEwuKXXtNmLszvtXEdCxsSn1+6Ae?=
 =?us-ascii?Q?/NPpSWbHcf+qVSqwTJxKt+BzQ7VPVkJP1fObowWVKwpvn28Xt19cvTcRw4yg?=
 =?us-ascii?Q?a3r2R1Ywv+N257Ri6OlnJT1x7RpQgrIs99+8yoqlVs4JXvmUhcD8rPDy9A5Q?=
 =?us-ascii?Q?Y/x6CoSw6NdIdmCyfozedugjKsd+n9Z612y0WZ2fKQjewPJy+v45lIjF/SGo?=
 =?us-ascii?Q?s2LU+ft/U2qlg1MCsqoc0UdZK7tZuFlMdCuKf8jisPB2JjlYxz78cKdTnAIm?=
 =?us-ascii?Q?36DbPsJWQ2o+BieK0vmZB/TrmlpbYczRZq998Wtu/sMbMRMBFPiCRCeR1yg7?=
 =?us-ascii?Q?G+s4SgRn59tnWtu92G3IjpIscw+/YN1dIYjsfjTqG7oWXqJMEdujC9qmiA+R?=
 =?us-ascii?Q?SaeC2WO98IxKkvyS5PWccLoJjiByfUMI9y4UEsJqkYJjq1hkGHztQTAE4BeN?=
 =?us-ascii?Q?sut/RrAcl/hMFFP/ywppFhfFP76+ptwCARSUmo/wDeYLykztJvRWzwV7egAP?=
 =?us-ascii?Q?rJXXopSWsrU0rFzGADfgwzNqeIhUys8tIGPB/kTCw0rXiq8h1U0WKckv9dfV?=
 =?us-ascii?Q?m2wNrOjhb9kyPsiqiAV7IUyk5dzOdK8/QgLCoipIr47Rj9utli/6au7xZkoe?=
 =?us-ascii?Q?PMqgUiPBzoJ+yIYi9yn3dPQrxc3jpGRXPMKZK1Qr/A1X8W60F/C2LcKhz9IC?=
 =?us-ascii?Q?RMPBaelob4pwZPB0e9+YzipX1+UuJlTfTvtpbznnNyzjQ5ZgUyvjNWTG/QvQ?=
 =?us-ascii?Q?aV0I0v1hg1tUJkk9Gi3Dh9Tnlsd6SfY6JGI1Wc2oW9TY+zhuqP1lCM/287tu?=
 =?us-ascii?Q?Kzs7BL3pDDZL45NMulT/eQCnYUt0pswWCcDdNRgKgRpPnm7vx5rqszZDbCCN?=
 =?us-ascii?Q?FT02ncOK8FWv83bykjrzqu9zJ+fLlg2IVCfKOPwHvWe+xevPV9oxgnksQzQH?=
 =?us-ascii?Q?6Zo3aq+O/MAahrDXY9Ch94fyVkuyBAHDYQKLPXH71lCEtzOEgu9lwo979ufF?=
 =?us-ascii?Q?MZP4aX+lRYtwxkRa8N+6nUF5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?efmve9565kP3oZ/ugSRtaZ5ETZtJ0ljDhsyGUqdxFVMq7fY0UaJq3XWqyJxN?=
 =?us-ascii?Q?qsbbxr2o6WNldoA4fwC1/qJ7TtDPh8xkMuO7NxBwG78X3VVZgZEuOvXf8rsE?=
 =?us-ascii?Q?4rH1eD+6joI2u5yXtNDEU4QLbHxUNbnxPhSM+Q59C+OEQ2GeYdXX0E7F6o+M?=
 =?us-ascii?Q?PZMUOA775t49WFpg9JF4zDuR2D5+eHSnOqaPMxkxQRpxxH0VJzb9R2SG1hAY?=
 =?us-ascii?Q?Vnzd3qf6+2hCFYDfZs2haY+RFxBJ7tbWUv+7in03elsXQ3VaKjOoE4F8wOT/?=
 =?us-ascii?Q?v6HO1ZthMDBW+iIBd/6Y+08vzQhnteDKYXoEvb03jXyz7m2NMyNoDqi2FJNs?=
 =?us-ascii?Q?23XJaOeTpsUMOhH1qWVmxNIFjyeqK8g1S4jXDysG9HZKZ1cRf8ES/J+acaoy?=
 =?us-ascii?Q?FVoNiQsWTolU/9iXsyCs2W/E2UchofEOq8bFSNY+MtJRQ1eA08KkPmKfXMsQ?=
 =?us-ascii?Q?McCqTZf8lp+DTsV1UfMmsv3LgbwCoizFMJ3bo7b6snEfBV8+QE6UtladArpo?=
 =?us-ascii?Q?aaxYE97tA7DiI+6aFad03c03tKyhalc8j4jyOLwzRNtOBuqkkFUMNp9bJmEf?=
 =?us-ascii?Q?SimwJhD8Wde3dEt4dmA5p/B0Wir3uYFcYf0SIgh/A4tCAY5roTlf1EbvNTLG?=
 =?us-ascii?Q?mdLnXkeZO0lfOJfdvAXS4lNQR7MOgcHH+/WBp27l0g519VC4fh6TWW6HFh0n?=
 =?us-ascii?Q?xYuZ7UOQ8qazswrPcwBaEkMF1H9uUQ8nD7jhPgkjuNOAS+k4Y+huQno7JTwc?=
 =?us-ascii?Q?hhuIv7IXMqj+TBHiKRdxR71UN/8HHgYyveKEbab/qptSij86mzVMzAbdnFhl?=
 =?us-ascii?Q?mSwbdzprO6lob7danY1VZNBNFJMSnnZPStPDqlDF0s2T1isZ+8Y5XlW64j+Z?=
 =?us-ascii?Q?gE/7let/hPicwu3uFhAPIhq7JCJha1iN8fcPzvznJGj71ISY6UrI/YnTV80Y?=
 =?us-ascii?Q?AzmoXAuTroeeGCUC0ojaZya/dGGTwTVAprsLdROwqE78TG13OrldY2ffslR6?=
 =?us-ascii?Q?ZX+tF3QDBmah5QFprq9JstUN6hHohQOb9zOY7e7c0D5LFjFYZn+cwZxlp1W9?=
 =?us-ascii?Q?0j4BGFFy+sWUtWf/7QZ5ld3NAqkqQiBRobUJvhCE5TAtKU5nTJRBwxSeddWO?=
 =?us-ascii?Q?7F3KwGI4dZHQhuzUwiH9mdL6ed+/15/3VQ9Zqf9AWn+99oFN7Ael7vjDogOg?=
 =?us-ascii?Q?fzKJbOSi8LQ0R7LcZxCTrmscP2xegpOnyvcuy19Lf5xhQuwqMNTB78uoyn5z?=
 =?us-ascii?Q?1uax6bx9jeFUjs++7flTCPBH9kU7xK/2Jt2xv6UaEN98Vx4PqY4aRkOcNfuW?=
 =?us-ascii?Q?8d/iK4phrlFxjm0ywKFdF4VRNWtvFXah3N7aeOEvztGnMbvu2q0D86125c2u?=
 =?us-ascii?Q?PFI3pyuu0nUhPMVWjG9RzH5GSCDQu4xpqtl0hUZrVrLOEjB162wvqpeKcKjb?=
 =?us-ascii?Q?Ro8eSZSwsI0VaNbYPCXiFIkx1ccbW7N2vK2KjJYZaUxCunVsA39lEo07piUX?=
 =?us-ascii?Q?t7mwhjm6xYRBoV/eHdVUT2CI4CACX34AHkcF+gyxmpszvzR5nmClo/BGCFTd?=
 =?us-ascii?Q?klRqclcqK4S6loVbg7Rl2npD9MjlT85txiSBzZO/Q/tTSMj22NX8VulkO0y6?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f79aaae-587d-40ac-a84b-08dcfec492cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 00:39:01.1227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLgj9DK2Jsc+pY/wrAl+yECx6jB+zSh3wfQVUh8IbSQu816TXoRwt0FWGm4128xIiKfdO4bvFniKY7BXKZLLqkAEhcAxHtPoqUHPnLB3Ie8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On Fri, Nov 01, 2024 at 09:14:32PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Check mocs configuration over GT reset.
> 
> v2: Address review comments. (Matt Roper)

Not a blocker, but in the future, it's better to say what actually
changed in the new version of the patch.  Quite often no one (including
the original reviewer) remembers exactly what the previous review
comments were so this vague statement doesn't really tell us anything
useful.  Changelogs like this also leave the question of whether _all_
the review comments were addressed or whether some were omitted.

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 43 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 43ef1e334..953b5be28 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -715,6 +715,45 @@ gt_reset(int fd, int n_threads, int n_sec)
>  	free(threads);
>  }
>  
> +/**
> + * SUBTEST: gt-mocs-reset
> + * Description: Validate mocs register contents over GT reset
> + * Test category: mocs
> + * Functionality: mocs

I don't know if there are firm rules on how this IGT documentation is
supposed to work, but in my mind, "Functionality: reset" seems like it
would be more appropriate than "Functionality: mocs."  We're not really
testing whether the driver's MOCS settings are correct, just that the
driver's reset flows successfully perform the same MOCS setup that
happened during driver init.  Do we need to even specify a
"Functionality:" for subtests when they're the same as the encompassing
test?

> + *
> + */
> +static void
> +gt_mocs_reset(int fd, int gt)
> +{
> +	char path[256];
> +
> +	/* Mocs debugfs contents before and after suspend-resume.

This isn't a suspend-resume, it's a GT reset.

Aside from the comment fix here, the test logic looks fine, so with that
corrected,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +	 * Allocate memory to store 10k characters sufficient enough
> +	 * to store global mocs and lncf mocs data.
> +	 */
> +	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
> +	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
> +
> +	igt_assert(mocs_content_pre);
> +	igt_assert(mocs_contents_post);
> +
> +	sprintf(path, "gt%d/mocs", gt);
> +	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
> +	igt_debugfs_dump(fd, path);
> +	igt_debugfs_read(fd, path, mocs_content_pre);
> +
> +	xe_force_gt_reset_sync(fd, gt);
> +
> +	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
> +	igt_debugfs_dump(fd, path);
> +	igt_debugfs_read(fd, path, mocs_contents_post);
> +
> +	igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
> +
> +	free(mocs_content_pre);
> +	free(mocs_contents_post);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -820,6 +859,10 @@ igt_main
>  	igt_subtest("gt-reset-stress")
>  		gt_reset(fd, 4, 1);
>  
> +	igt_subtest("gt-mocs-reset")
> +		xe_for_each_gt(fd, gt)
> +			gt_mocs_reset(fd, gt);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
