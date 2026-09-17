Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A557C982D2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 16:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E6D10E990;
	Thu, 17 Sep 2026 16:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsDsT3LN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D954210E990;
 Thu, 17 Sep 2026 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789664338; x=1821200338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZgPBZvnpt14vb3nd+cg34WxIz3lKilgjpD+5iLHkyD8=;
 b=UsDsT3LNzNAO+G/KttykgHQqp5JqGT6voO8sonDeSVtdd2UylHS35Cbj
 weqyc+5VfGo/NW/XOu7hEYKa5lxr+tyslaaZEzs/GDIARUjQ4gMfvcSH1
 Q9IoHke1RHxW24oJ01jrmTf6/mtuvrgMy3oTEj3c1WVd/l3WihxUlh83z
 M8ahF2XICJJNMgx/l/0k9KCF5jU/FQwEWmoQt3zl4nx74DsRQ/2J5uxJM
 hOMF9WOPG1W5RdRUyGPS031OS9qKFIlRZx06i/ZWTbZbqL+bQDx3sFjCz
 VjcYbWHXu0eU+Mvn2Xz9L5Y/bq9EUFnu9m3O3KuNOMO1K8KaGrAnFvLFa w==;
X-CSE-ConnectionGUID: AO4Aj9MuTKSOls7AD607qw==
X-CSE-MsgGUID: cm6M4JKuSn+AHJcRoicG+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89245079"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89245079"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 09:58:56 -0700
X-CSE-ConnectionGUID: uYB2KHg0SeOSdb2qxqwq2A==
X-CSE-MsgGUID: i1gFICF7RkyTQC8LDG/vcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2105011"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 09:58:56 -0700
Date: Thu, 17 Sep 2026 18:58:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible (rev3)
Message-ID: <20260917165830.jolkvav6poqrj6ci@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
 <178965977238.177999.8520856257940730140@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178965977238.177999.8520856257940730140@61270ab9df2a>
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
On 2026-09-17 at 15:42:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible (rev3)
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9099 -> IGTPW_15858
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15858 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15858, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15858/index.html
> 
> Participating hosts (38 -> 38)
> ------------------------------
> 
>   Additional (1): fi-tgl-1115g4 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15858:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_3d@basic:
>     - bat-adlp-11:        NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15858/bat-adlp-11/igt@kms_3d@basic.html
>     - bat-atsm-1:         NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15858/bat-atsm-1/igt@kms_3d@basic.html
>     - bat-rplp-1:         NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15858/bat-rplp-1/igt@kms_3d@basic.html
> 

These are expected, so please ignore those. I will send series
without HAX soon.


Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15858 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][4] ([i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15858/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html
> 
...cut...
