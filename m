Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46148C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 10:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E5C10E768;
	Thu, 12 Jun 2025 10:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U16ISJRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3DC10E768
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723989; x=1781259989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/x3+EPepn1wio9fpDKo2aY2BZksFTeyFqN91mvmcuTU=;
 b=U16ISJRMYTPyOVSWrD9Kegr7QkVbqEUTrFqo0XV+DbEjepbiMxAdrIFJ
 peXqNEet9HN7HDvby8afjm0I776g0DO3RKXsB95C466KRSjMij0IZY0kS
 Th7bl8bs2FAKMqyGBVo2x3ONGHSNE/JMQFnN02XoF+tVTz4RCY4FGGpt4
 MMaMf+DWS3i9HeLoCQF7Irw1AgsfgwaqH7Nn1GE2/0RJlA66DRMkT38cU
 Or2SRMJXB5A1Xpb3+Paf+y/SHgReOZqOZbJy4NDtisG25EaaTsyR+Azjv
 rYHmk36mYucAseZ5iOe16fUciHa3xQApEgRlhxvaR+bjjR1qy0UDBqe1V Q==;
X-CSE-ConnectionGUID: YLx97JzQSsK9s3hLkyWv+w==
X-CSE-MsgGUID: mkkjkpliRlKjkwWJZIBpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51608697"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51608697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:26:28 -0700
X-CSE-ConnectionGUID: IGHD1L7DSYS8gL4wDYJtuw==
X-CSE-MsgGUID: IcsCYKwGSFGrLE3OLcsSvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152383246"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 03:26:26 -0700
Date: Thu, 12 Jun 2025 12:26:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 CI/build: bump container images, OS and meson versions
Message-ID: <20250612102624.n4inlfsc55d3rnnj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
References: <20250611-bump_docker_distros-v2-0-90791ecb953d@intel.com>
 <174970217563.69723.36070268277139127@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174970217563.69723.36070268277139127@1538d3639d33>
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

Hi igt-dev,
On 2025-06-12 at 04:22:55 -0000, Patchwork wrote:

I added +cc Lin for example how to reply for CI failure.

> == Series Details ==
> 
> Series: CI/build: bump container images, OS and meson versions
> URL   : https://patchwork.freedesktop.org/series/150093/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8405_FULL -> XEIGTPW_13274_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13274_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13274_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13274_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8405/shard-dg2-435/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13274/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-dg2-set2:     [PASS][3] -> [TIMEOUT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8405/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13274/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-userptr.html
> 

Unrelated, these only touches gitlab-ci pipeline
and should not be visibile until merge.

Regards,
Kamil

>   
> Known issues
> ------------
> 

...cut...

