Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658CFC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 23:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54A710E3C6;
	Fri, 29 Mar 2024 23:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQKt+egG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BC010E3C6
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 23:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711755339; x=1743291339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MDf1OO56KhRXa6CYFwqqb6aHk8FPFrMjl0z/MwgdRas=;
 b=GQKt+egGStuYiwwnWivJU+Va3V4RZ33n634SFyCtzjGMkk7uYBwP10X6
 u/Vy15jH1GHRYrWDzh+HP9DS9Mq5PVo0G2OKjSXWVyKZjIWTKPv1UPAfJ
 qcgraDWO7qQ6dOv4cDqPWjTjefVh6JIQSO/cNmefKz7/B5HYFn9hBuMIs
 IY74ZdthXQ5MZVJzfog+llrA2rkjqSqlxCb/inX8kY6fOQq81yr/aKi1l
 5Dy2ZxP8hpdghUq3ORaKRW/XMF/rFr+rF6BvhsLDFuICBWT5AB50Pvlc5
 E5QKXZCkycRVBoLk3bJDVCmP4kOSm6zy/hvE6kiJYbszObHgcYY7BjLcU A==;
X-CSE-ConnectionGUID: jTtfy03eR22frKFPGf68+A==
X-CSE-MsgGUID: 7B/NdaQcSumlXOJTOlCM0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6890968"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="6890968"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 16:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; d="scan'208";a="17153922"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 16:35:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 16:35:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 16:35:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 16:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dahru4PUekilrJeFV+rno/Usgg8qnOPOM/Cux39PFIPPHIMG/AemHLsnDXTYsKm2ImW/fE2wNsP/y4b3E34nMHncM8a/Sr1wAt9UgOGs9671aVbFyvOzxU5AC6Ab8uhjwtmXLdo4l+W6OmTQx+eblKAc5AN1Rh3Y3RAfliK85Nds70qVuLwwYMGH+RbXg2uQfgGgwbBJja6+vSny1iPKreNt/fJ7pbiQuwT33MmoohrrC+supt6B8fqrgt0HklDDS5X6x7CfWeJkmvheD965ZiXPD2wG/kSPjys8ZoBM9SPQI8f35sicXSuY6eXmIRIkypyZy5SkoyBv/PoQ6tS6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnFDUloJDWe1E2yXdfT3Vqq6aWT2VCTMKm4pFCR5jM0=;
 b=OeLOATLfGPd+L6kTfD0CzTrKNtbxBqer2rcnA3zhRYW1/n/hDQbDmC2iBEmZCZtccwHBrSgR7tfXZJlHuUbpOJKlgbWNyCgaAdfV1Vph5XqMLzY7WfLh5SYNS3roPn7vNZsaKMKogqPujUmwN3ButLblc3JfIf9lGQkwMJ1JBgzkovDeSV/zPA2H6EtSwI+O0yBMcDGHTGmeVOLSuwAjXdOhHxurOgzPwcrWnieG6I0yhvJWhnQbhjalOt1r4j9E7gJl6xg450BUtYlQ55f536zdhClSe1aikT+x4QH9+5x1rs6l7CspXTPDyCB5dFa0vD02RdhzHmhqeYEhAsOnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 23:35:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 23:35:33 +0000
Date: Fri, 29 Mar 2024 23:36:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Reduce copy & paste
Message-ID: <ZgdQh5aHZV4KIw0H@DUT025-TGLU.fm.intel.com>
References: <20240329211449.924460-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240329211449.924460-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8583:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euC+tcKurYUIPFeN4zk+ZxsmHoAcAZsB/dpwPeszVgovS0H/wICs5ihCjfbBVFRCy826JBHKIc37Ml8UtayQqEY4b+wE6/F9prkJ0BZTgVUwif53h1Z9tcGlqyFppHIe8yISFs2nyQgTp6hbc/vL8PtVyqNUmz1cpIWSH5VkxMZt7G5qwE/x5iZAdzyKcA+0Xp4ZEYz7zGj1Xs3tjMknWhymI3ZGI4BdhV/5A/ln6EQC4tZN6e1Q5gPDQVxJNDnxhbPoD3obTlwI2ediz67uTMqh+po9sWbWaLj/bOP/i3qMlKejxpDYnoWjsNvnR6aO+0q3rJoUhF8u/Esab7UwlSQ2ZCXBHCcooWRbq7Gckot/v4fdkgwuSZk4qpDBi+nNwYy2+dQbBv5FYqqEMCOt8m4jm8kXqudF7qvrRu5KKB67tgDww+Ct3BJjE9mukSmobtwYC/GH3uI7rNDRNdId9TOaqhnlyzCBP/jD7MlYwToMRl6nE3OQ4jtCqStCHEPZDcusokFVdLscIJDVxVm9up0J7sRIeH2EM3QvCgBQ3rqH43tbe00IZPE0YBfnjYf+jec1XMiFq9iS0MLek7lmDBbLegnicsrZVPS+42mhC/T3pxuaXeXUNlq8V4KWq+ves/daob2UOd+kkGegVUIjvQ41AfvutZdx4WR56MknjnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tzjS4TJzKNUG7z1LblcpdmeYHhWChLNGezkL9BeKmJg6VJkkHdGin2+MEnqc?=
 =?us-ascii?Q?fMdTgiyG3sC65XF8BVOc+AI7zPPWDmlr9r8oUCKtSyrqrhVSoPiaNKQdohoz?=
 =?us-ascii?Q?f8i16mAoB2FGWp4CuH4zAy79knMJv/sr341wJIUe8eHzJ+ZOnE5rzWxqZnkO?=
 =?us-ascii?Q?VHxbI375ED4zOH/RzRnbQD+y4T++I5RKrJBGBaqlfrsSolpHnvYuHZ73ENEG?=
 =?us-ascii?Q?MGsUfAD43xrqw0sOnUmkHXXcjfHdeasrknglWFBu3J4bahjinqDxszPEI8z8?=
 =?us-ascii?Q?aluw7404wA40G6h/55gRXmPDZNwqHLyi+RiS8uUaRZOyhp5KWfpeZkOBDnO/?=
 =?us-ascii?Q?OgxNWP1o2VXhOq558Vnq7U0dUqxS4OPq7D7HLkUbocT0MQVyAbPiD1QOIxwG?=
 =?us-ascii?Q?lOs85+Sm3HFli1JPfBo2aG71hM62MiknDtfXeKQm5nVXlE162IkVGJyvLaAp?=
 =?us-ascii?Q?PCc7mrJGDkjGqiUEF1NMRr9Pnkn8xDoSsxgDXXyg/LrY4eef5BFj7qES06Pb?=
 =?us-ascii?Q?zCf7EPrqjfGfpqgd89nuzH/HQHOzKYbAcl/0mYCe/7KujT8IxyG6Vy7Nk4aS?=
 =?us-ascii?Q?d/JMhJUFI8BpiwsIBRe3KKckzrGrLnS98PqwF+sAoiXxkC0J8ZhNpKUFxSWE?=
 =?us-ascii?Q?gQy0dizKE/VffiEMpJan40XZl+A60LCjmDF4OKYgSzQgoyK2PsZX5CXK38ta?=
 =?us-ascii?Q?2O+tM04F97CCnX6asvXYQ0S0d+SK9ITznVC4Bsyiy14qiRl+pokjfPSFSdz5?=
 =?us-ascii?Q?hGtJcG8tKY4eTtVmH9nssvecUjsgQokIlP9jdZBL7cDOqPGArZwx71U2+v+N?=
 =?us-ascii?Q?9DkwLIgxVgbECy6VRvLDke7s/jAxVVQiGv6hFwsFqgr3HlzyiMTY+aipSs/T?=
 =?us-ascii?Q?2Fu5bb1S/Tm/XbNna1kH0xc4ECmUPCaN2ENOkQNiSaGwv6V+A7BtzgxUVZHa?=
 =?us-ascii?Q?SLtfzRBqVCswWE3erZQqVCPE9vpALwJ6NxyMQirmdhKXvJny3QImiZHJHwTZ?=
 =?us-ascii?Q?o8wNd3I6yxGl6Bw9bjTF4xnw8ken9pbKosv3WX6ILpNUM6UJsSNzbyOO601U?=
 =?us-ascii?Q?FohW/b9PFvXCO+yF1NH8IRCHUoLKBztDF3WHXMNaAk4tInBj5IGkRYi3COph?=
 =?us-ascii?Q?aq1aBbK32007kf6Ixn/6ANfRBLu46uh4Qbq2QQ9wPV3liWnB6XjLERPDAcDX?=
 =?us-ascii?Q?vjuBtb29Na01Rqvfk0wJXn2ts5W3T+MMgrfBTg+G5NBXC4AUn5owDpPa9Dcj?=
 =?us-ascii?Q?aTPZV2kYHWQG9+J9PwVMFvSKDnw8vS+Mup9o0k5ChBSMfh7Nf1XUXCtuXgb2?=
 =?us-ascii?Q?KekcnLuVzvH48w2qT7ALRYW9h97FkgMJ5xoaqjfTNnHfFuz3o11U6COgFMEe?=
 =?us-ascii?Q?ZSidWWB0twgQqAZaNNGOkDynNLz+pJaHoxs/MYXjkMBw/dj6g8HsLg1DI8nr?=
 =?us-ascii?Q?kciIK8ciQwMwR1v7tp0MIcx/9KBu63UEq+MRUNHC+Znej8nqZNZ2ZmrXDbZa?=
 =?us-ascii?Q?cK4VswhTj8AfOssBX42kN/uxubcAXryvEdkMUryo1HKYLhg0qNRP/nizS7RY?=
 =?us-ascii?Q?PRp/JZvnP0eg1Fs/RkCisW2/X3fBjmrwgvffdKabeWOUMMbgpnbcqgFTeOLD?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3d1f52-acbc-4b52-e0ff-08dc5048ed90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 23:35:33.4627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1vLkEWsvtHYYzn+RHKhkakVHvspbUxw+zuBtPGElIKusu9dRUXGlQNj2MyzOYbl4RqI2D3o/UBy+V1jjD6TYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
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

On Fri, Mar 29, 2024 at 02:14:49PM -0700, Lucas De Marchi wrote:
> Replace copy & paste by a loop, so we avoid issues like the one fixed by
> commit 27c06a4106e1 ("tests/xe_exec_threads: Fill in GT field for second
> balancer thread").
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_threads.c | 36 ++++++-----------------------------
>  1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 05ea1d35a..e9588f9b9 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1030,6 +1030,7 @@ static void threads(int fd, int flags)
>  		xe_for_each_gt(fd, gt)
>  			xe_for_each_engine_class(class) {
>  				int num_placements = 0;
> +				int *data_flags = (int[]){ VIRTUAL, PARALLEL, -1 };
>  
>  				xe_for_each_engine(fd, hwe) {
>  					if (hwe->engine_class != class ||
> @@ -1038,36 +1039,10 @@ static void threads(int fd, int flags)
>  					++num_placements;
>  				}
>  
> -				if (num_placements > 1) {
> -					threads_data[i].mutex = &mutex;
> -					threads_data[i].cond = &cond;
> -					if (flags & SHARED_VM)
> -						threads_data[i].addr = addr |
> -							(i << ADDRESS_SHIFT);
> -					else
> -						threads_data[i].addr = addr;
> -					threads_data[i].userptr = userptr |
> -						(i << ADDRESS_SHIFT);
> -					if (flags & FD)
> -						threads_data[i].fd = 0;
> -					else
> -						threads_data[i].fd = fd;
> -					threads_data[i].gt = gt;
> -					threads_data[i].vm_legacy_mode =
> -						vm_legacy_mode;
> -					threads_data[i].class = class;
> -					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
> -					threads_data[i].n_exec = N_EXEC;
> -					threads_data[i].flags = flags;
> -					threads_data[i].flags &= ~BALANCER;
> -					threads_data[i].flags |= VIRTUAL;
> -					threads_data[i].go = &go;
> -
> -					++n_threads;
> -					pthread_create(&threads_data[i].thread, 0,
> -						       thread, &threads_data[i]);
> -					++i;
> +				if (num_placements <= 1)
> +					continue;
>  
> +				while (*data_flags >= 0) {
>  					threads_data[i].mutex = &mutex;
>  					threads_data[i].cond = &cond;
>  					if (flags & SHARED_VM)
> @@ -1089,13 +1064,14 @@ static void threads(int fd, int flags)
>  					threads_data[i].n_exec = N_EXEC;
>  					threads_data[i].flags = flags;
>  					threads_data[i].flags &= ~BALANCER;
> -					threads_data[i].flags |= PARALLEL;
> +					threads_data[i].flags |= *data_flags;
>  					threads_data[i].go = &go;
>  
>  					++n_threads;
>  					pthread_create(&threads_data[i].thread, 0,
>  						       thread, &threads_data[i]);
>  					++i;
> +					data_flags++;
>  				}
>  			}
>  	}
> -- 
> 2.43.0
> 
