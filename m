Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57EAC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 14:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FD6112AAF;
	Mon, 11 Mar 2024 14:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKqCGRj7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D219112AB0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165844; x=1741701844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xIhA4oj9UoxhwommspeqewO4tyCMxvVCpSqEf5utjPg=;
 b=ZKqCGRj7xy3vI8L+uPn2GBp3pWvzYuSrg2B9w0Zkv22/VHoM9Bi3FJae
 6gWWIq5DMuGIG8/sNmqWLs0du75Q6i6ZtavdayDnXg7Bzr3g8titMgzJE
 Kcxdth/tXNL8nuR3k5ebi9mrh1ZCgUeq+aW6Xwmptn9MObIrZ0/+RrwCM
 U0AQ7kn3dl8C5IPzcUu4avCgP+1eFHvp8CvJf3siT/g+qzO+4rOISS6Tz
 RNe9EtDogimrHscvUgzBBatLDL/+tLY3PhTVvPgIamFg+s0+z3FDvJWA2
 6zgUz+wjNdvOiO2HoM4yz8rWz0uKZTuRKRChXxEcSKxR/Vk7ZpOd1EbIR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30266549"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="30266549"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15781781"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 07:04:02 -0700
Date: Mon, 11 Mar 2024 15:03:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_queue_property: fix
 documentation output
Message-ID: <20240311140359.vlcsjfkormt2d4y4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240311130212.982578-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240311130212.982578-1-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-03-11 at 14:02:12 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The wildcard is wrong there, causing the ReST output to be:
> 
> 	``igt@xe_exec_queue_property@timeslice_duration_us-property-min-max``
> 
> 	:Description: Test to check if %s timeslice duration us schedule parameter checks for min max values.
> 
> After the change, the description is now correct:
> 
> 	``igt@xe_exec_queue_property@timeslice_duration_us-property-min-max``
> 
> 	:Description: Test to check if timeslice duration schedule parameter checks for min max values.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_queue_property.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 4e20cfd25f0e..b1cdc7ffefff 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -12,11 +12,11 @@
>   * SUBTEST: priority-set-property
>   * Description: tests basic priority property by setting invalid values and positive values.
>   * SUBTEST: %s-property-min-max
> - * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
> + * Description: Test to check if %arg[1] schedule parameter checks for min max values.
>   *
>   * arg[1]:
>   *
> - * @timeslice_duration_us:	timeslice duration us
> + * @timeslice_duration_us:	timeslice duration
>   */
>  
>  #include <dirent.h>
> -- 
> 2.43.2
> 
