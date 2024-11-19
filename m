Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECDDD60D06
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 01:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD0E10E596;
	Tue, 19 Nov 2024 01:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFk69PeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F1810E596
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731979219; x=1763515219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JyckYC+ZEtPrIgj67QWhAxGc0pjjAqIztlcVuRTJYkY=;
 b=HFk69PeJEk3g2QbTQFoSO1aD3TcSAxdLog9/S6BDpzDVGGKOb1yg8Cfz
 7N1HxGuZjHhr0H91rkXqIdZz2EVYfXX+1Ge/Lge6GNw7JLExSRkg5ANAh
 DltcQrEggLQ5PN01S3P+jHmRz7uWipXIMg45sSQj/6pzn8BSc7mHwGy/m
 VvVvEs/4N14Ldl3IwLUVDulsr71Ec+k5yE6Otyo/sIKZq5jTsrmkNAxiH
 C1hefNdkh4mMzK9stNuF5wX3VR1O/+XD0bA5QwOMh7Bi9M4V3HZimFa1z
 UPm1U0bjWwsfYADsdlCCeY3uBOI94PPM+Khz+CYSfu8Y6MqHLM6aEagGP g==;
X-CSE-ConnectionGUID: VAonGflQQPqRSxV86nU/Mg==
X-CSE-MsgGUID: Y7nNCkITTpWXhHUaFblCXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31888120"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31888120"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:20:19 -0800
X-CSE-ConnectionGUID: I2ztQC+2TeGJkVSznO2S/g==
X-CSE-MsgGUID: v1I3F3//R0a2fSUwaQ1+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89820664"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 17:20:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 17:20:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 17:20:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 17:20:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdSZJs4jtKcCiENRVLCGW9bemfR/zEDP18emL25KQR47V4+28/2rSoRWbnc3sOleTJAGEvUub73vYJsVOmlbRh9I77A/3nWyd87X9PIIJORjgNmX4TxIgnBIi0lmM7NDVyq7nzXqPgQofK6/s04JpTJKZiATWL7V9X7j7XCPwbGqTW66V93gMJpZpEDzJQ0Fol3M3lb0vemonEyoY/sODmmOgxDGuRfZDjGottIBdLhVOAXaY1IchPTEUZRouSmTl6qipqQK1bAG8JbLMRfQalTKNOJMaJr1qLLzXUXJLHQ6Vm29RLeagI/GUPuECpwC5BRYKP570gEkTlz9r7+F9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lH01FGupdv61OdqWjAfrsu9ex53v7TouqygMhV7vNw=;
 b=IKtDxjeTPv6VpokJX6ImPMClOzsjMr49wfgUfWVR3WD39GfprAdaPPNLQGxanlgSH8yoI1eENoAe9ElSXMhpYnVb2BWfAyiNpx/oI3YP8lVgoDVTLYt0QZmA660E4eQL8/71I6Tl5KtbvxgI/GNeEcmoiNE2a2UyOrpVVBue+37lLXRprQKedj0M3dJI4jrI9i4h2K1xdS7AfMuk9NYpb+i+DZmXMuQ3w5CqY327LF48aXjAJ+PGZRd18b8TrGMjh7bq0qDvHfzozDLSxDrMV+kMZeF+5COQHwo5LJ/xcFFzL3ITlx+O6Ch+GuZa4kdE6e2otp2bpXwM7zlRlbOLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 01:20:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 01:20:15 +0000
Date: Mon, 18 Nov 2024 17:20:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/9] lib/igt_kmod: Share xe's unload logic with i915
Message-ID: <20241119012013.GW4891@mdroper-desk1.amr.corp.intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <20241105061845.2486557-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105061845.2486557-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 8705e47d-d29a-4e3d-ab0c-08dd083852b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ZLZRiywKqymaHu8LU8rY8K/otBQMidCIbpEyMGLt9S4VsCBSFrSXEOET8LA?=
 =?us-ascii?Q?fq5to4aKH1EGir3kFWmbJ5RDSBX8e62pe3J5hfWLZcnzkAEXoYCTTWwrfl9A?=
 =?us-ascii?Q?bQXiv0YPAsbygd21kC0AVnniQUzD8AVDdIBOAX9BWGCTx5c7I3r77P17XgQM?=
 =?us-ascii?Q?0FZu/tLmElDRLLgBwJiE05WHoM3UaDV8yJq93sn7xBbjzUBkCF5X6YmiZmyx?=
 =?us-ascii?Q?f74vUalar79eMBHcCIf45U6oF07AmXI6OpP+lHuk9DP5Gexu6tKXgihmbJf1?=
 =?us-ascii?Q?6UpQSsV+MyyHihCFWHQ6rx1Jx/JH0IKEZQS0T+LA10BVsJMv4/kKR+WtRXir?=
 =?us-ascii?Q?3bIvvPuk+Cj26tHZUXW68MqdykH6lhMfID13gn1SlB920gxvxoqxdTpuYLXQ?=
 =?us-ascii?Q?qPRv9A7dJnH8pozDWEMw74gThSc8GS2tw/BKtMYYk/HNOAxJmUzJedPLtnyc?=
 =?us-ascii?Q?xQrW1olGdrtRJVJ53uHtQqjqiN8DwcicVMwpu1NJe2f0lqSVZNjroXn8hv6/?=
 =?us-ascii?Q?IrNDGMhM+Uofx4E8aUVIwd5EFzG+zI5N+3XH3a/DGFDVr+liLlY62Fi8oQL5?=
 =?us-ascii?Q?9ptec1Ik26QKgK1bSXZMhjMiZN0RN4k5KEjEqzzR+TfYiXLkZcUxrFDm/B30?=
 =?us-ascii?Q?gMUQ1Hd9IMfeNlo8NALO9AK7svvLpVYH9lUQYWLfKSSrMRzmOi8sbWi559NZ?=
 =?us-ascii?Q?3rtiv+f6St/3T+lM5wtsQrc0unbFcQHlTLaA0b8ld4MRmmIflDn6sojp6eWc?=
 =?us-ascii?Q?SbTvAwQhUzt5LUg7wt5nF3ZnIgZzzn55R/Lc6QcQQ5i2p36nwx4R7NamugMm?=
 =?us-ascii?Q?TGeMwODse4Ovb7VTr4Xnfgcuq3mTmvU0g6QNlKRKSGRfp/2zd5KPu8N0PX05?=
 =?us-ascii?Q?r8sI5CIAXiVtyXYGOOa6tPQulZzTaChxn3985vDc+FQ5jr6PoR3HXIKMFMPD?=
 =?us-ascii?Q?NO5/nQYfAHrQKcz37Um+yjUz0ZgJW5Ekq2fgFnSUteavZZDfUojB3JJCXwyN?=
 =?us-ascii?Q?Y2gw8opSFDCTu7c7JiSt5eYEcJmzQ26l8a3jVYkGAKBeY39XOQ0Dw3eicjBy?=
 =?us-ascii?Q?TO79dU8ksjIjEKBQOByrTKGbDmnO4lSqp9ZfQboK0GSzqVQMGGIDojdeku6H?=
 =?us-ascii?Q?PE5ATt4sXaH8KDqAya/60ptTvTECy3uLLLtyxdrB0qGBHcq520FOQSdN1SKI?=
 =?us-ascii?Q?TorvN2X1Zlh4gwhJwAcSa32nOr0NOHXvuLhrLsHBmCH+AtTQvU+ust/lQGeh?=
 =?us-ascii?Q?oQvEpILTbbkdR7O5LqOP08VevyIJCk48yQCO0709uBuvrKdCMl0aXrar6Me1?=
 =?us-ascii?Q?vG4TqC7y4r7O+MatsRcTjRA9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MyfEmylJ3YDt4swknfle5zTWf2Ta2Ty2gj5BIzuNWaAOyFH24Z23eQm/QzXN?=
 =?us-ascii?Q?oYu2WAoZ3L4CvKQARI/l+o+MqKYjaR6iviQrr+aALSANOKrGdrLIdKQITTv4?=
 =?us-ascii?Q?W29PEbMWCqKfJHBC5GL3Kk57hjsQfP/oasSMeztLFodbninF1Am8SuviCY2m?=
 =?us-ascii?Q?dlxJQTXm4p/Tfj69RIp6hqfci1ShGPHEa0+F/N8kFYbe5HXzzBQZL7TjSuua?=
 =?us-ascii?Q?X3HekDSdgsYOroFDtadthF3MQyWlmDKQy+AZbqk5y240Qmc34UwVg3W3iTzr?=
 =?us-ascii?Q?+eUrYfq5NZsWAutmfOZQcdBekEni+5ZA28dtqHuK3ZfYVq5CNddYgVmIHz1S?=
 =?us-ascii?Q?XfOWxg7h+nDkzDLGTaOAZm1EskhnlyUorditfBBflL1y+cRlD1BTqdPQW+Tr?=
 =?us-ascii?Q?x5Yr/eaqikC+SzfKhiqfv0ODnrqk0Y8rLsr+NqyjB6yoMM0qdWuxT7X8OMEm?=
 =?us-ascii?Q?kO0nUUc5trMrXrCvFuZTDLLvNJ+fnbjOMGbu7GRPyaDOJWMrCTlzksdZX9TH?=
 =?us-ascii?Q?G4ZLCsAWnspE0KHt4b1zYgWHINSHohSabAoyUJxkNbSxZNHl8dwsuqPxkfM1?=
 =?us-ascii?Q?Z0Wuwq/rQvCSC4Ut3reAvZxjF6BUf8SVeuR5s17W2ntETri3SNDaBZYZhood?=
 =?us-ascii?Q?+wOBT4gXmQTcihqysU+2QAHMisFOVoi6XvsoA0y3bfLG6zYWjM6yR2VOu6mo?=
 =?us-ascii?Q?IunUOfvqJgnQ5sIH/QNTtzDFVp5J+WSDUSnzkdSPxSMZKz/8/UiWazpWerZ2?=
 =?us-ascii?Q?j/CWR1z2zX5F4k3GZhtS+g0i43wyVBkF78FGD2/YYxE2ei84iyOvb6yGrREa?=
 =?us-ascii?Q?NFxtKblRTNuLfvCYgZlowNNubLlblXrtsIieJZQ7mF6X3gz8ZAlk47kW2moy?=
 =?us-ascii?Q?fRQF/3u+an2TjopSj2YTABKrcvty6vHDnzj5dN98r3UMQJATLC3PdvUmpQm9?=
 =?us-ascii?Q?yCwVijurn+E0kVEWo5menk9b/0jisxy9g35rQKhb4Y6cStM8P+HSqtP3zlzt?=
 =?us-ascii?Q?/3JFE/kMVqQ4GGvDrH+9iCFBI2KfqxO5XnJPE3rSx0tV9uxFxvR3TUi1kBFR?=
 =?us-ascii?Q?ucRLIZy3xLXSggZDWvlf1grjF1LnCxO/VxebtXvy9Baw6cUL+uYDaSOCKL28?=
 =?us-ascii?Q?AMONnvTQhhYFVImjTXw8WNi1GNZgHy/v8nkBOtGa2KuPDAPycFZ6GYKPRLBJ?=
 =?us-ascii?Q?aJtH8pojy4K7DS+JecHya+Rkd8+4e32MOSJ2gckzyM4k/JHa6HuBxq5tqX2j?=
 =?us-ascii?Q?XVvq5UxOdcU9QQmfJY4b8c0/GxOWD/bp2ro2b41QWpts1yoPPA8/7ljQbIhY?=
 =?us-ascii?Q?2dJh2cwSPcATCEalFPXLYoIO8RArZZmXlDtJazjf4zAXR1SpkXHkjVUh8rU5?=
 =?us-ascii?Q?4DSQ2FlXfvJvhCGDn1zi4yA8KvJ/SN0mwMEFm+NUhft7dHFbF2ZIF5Ry4PAg?=
 =?us-ascii?Q?m5bP6809gDoWMVso5ZVUsKOA3o5WJiK0EZErRjAb6jKJnLXtGMPJQh+YXq6W?=
 =?us-ascii?Q?wE6laBNqT6chEcgnFCxX6Oh6lka/ZCAKT05z7zUD5PDuIuoDgIwJc2EUxfaz?=
 =?us-ascii?Q?YaRPwWzI52QbcRKUybXDRSo4ebnNxxjWAKGoYHPVVvrgQ5qVsfe7LIScZIWL?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8705e47d-d29a-4e3d-ab0c-08dd083852b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 01:20:15.6148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E11uAaZJtZTUYtf4xNP3q7r/mnqPt2bo7xztZzPg+j46pKCRfNgxO3nzUxQFFQkchdQnvzjlr3KRwnzExKHfsfMnon36UNkK/bp90LEpAGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
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

On Mon, Nov 04, 2024 at 10:18:39PM -0800, Lucas De Marchi wrote:
> Now that xe unbind+unload logic is working, extend it to i915.
> Note that there was a buggy call igt_kmod_is_loaded("driver") that would
> never trigger: no point fixing that if we are dropping it though.
> 
> Another note that we can't still completely drop the old logic since a
> few tests rely on it. Example: tests/intel/perf_pmu.c checks for trying
> to remove the module with a perf event open and that being blocked by
> the module refcount. Doing unbind() first would succeed the module
> unload, but also crash the machine since perf doesn't work (yet) with
> unplugging the device. That will need to be fixed in the kernel first.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_kmod.c | 36 +++---------------------------------
>  lib/igt_kmod.h |  6 ++++--
>  2 files changed, 7 insertions(+), 35 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index d031bfe18..0c093ec62 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -703,40 +703,10 @@ int igt_kmod_unbind(const char *mod_name)
>  int
>  igt_intel_driver_unload(const char *driver)
>  {
> -	char *who = NULL;
> -	int ret;
> -
> -	ret = __igt_intel_driver_unload(&who, driver);
> -	if (ret) {
> -		igt_warn("Could not unload %s\n", who);
> -		igt_kmod_list_loaded();
> -		igt_lsof("/dev/dri");
> -		igt_lsof("/dev/snd");
> -		free(who);
> -		return ret;
> -	}
> -	free(who);
> -
> -	if (igt_kmod_is_loaded("intel-gtt"))
> -		igt_kmod_unload("intel-gtt");
> -
> -	igt_kmod_unload("drm_kms_helper");
> -	igt_kmod_unload("drm");
> -
> -	if (igt_kmod_is_loaded("driver")) {
> -		igt_warn("%s.ko still loaded!\n", driver);
> -		return -EBUSY;
> -	}
> -
> -	return 0;
> -}
> -
> -int igt_xe_driver_unload(void)
> -{
> -	igt_kmod_unbind("xe");
> +	igt_kmod_unbind(driver);
>  
> -	igt_kmod_unload("xe");
> -	if (igt_kmod_is_loaded("xe"))
> +	igt_kmod_unload(driver);
> +	if (igt_kmod_is_loaded(driver))
>  		return IGT_EXIT_FAILURE;
>  
>  	return IGT_EXIT_SUCCESS;
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 193b95627..88d4a51e6 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -64,8 +64,10 @@ static inline int igt_xe_driver_load(const char *opts)
>  	return igt_intel_driver_load(opts, "xe");
>  }
>  
> -
> -int igt_xe_driver_unload(void);
> +static inline int igt_xe_driver_unload(void)
> +{
> +	return igt_intel_driver_unload("xe");
> +}
>  
>  int igt_amdgpu_driver_load(const char *opts);
>  int igt_amdgpu_driver_unload(void);
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
