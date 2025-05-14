Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB148C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 07:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3924E10E1B6;
	Wed, 14 May 2025 07:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAvoXwG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC90110E1B6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 07:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747206051; x=1778742051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gyVXGKaPTu2ALk0PD57/mV8FpKlA8nuIkrLNcWDmzz8=;
 b=JAvoXwG5P2JOqk6G0it6rIbPIV4pQ6MbaFF4Jpsu/MqTu7BNIA/kGFkC
 sXs6UtHDucIuL1UGcS/k4a+A0n18oP6pulyQBq/NFKZtEfDqdFNxAXZKd
 C9yvk++z4cPrIxzJrcwEHm5J4df83xSp1OeuFUuqFflP6gn3swKZnuRqe
 epFeUBDHvdyOVWqLKkf78YjR8MbdMag5kwV2BooTbPw28on4lItD5rXTg
 KPXXkYrO9GZny9z0+SW7m3tjW8WuTNMULkrF6dqK6jeREwxQi18E7SoKj
 JKZjFDy1sNz1+ydEX2k6KTMkCqFYJffuDSLkr69gKswZTrBsdpytK9Ipn Q==;
X-CSE-ConnectionGUID: l56Qfx9qTqO/ziUb5/2DSg==
X-CSE-MsgGUID: OT/jni2FTWGvC/gA6Tx8DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66633721"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="66633721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 00:00:50 -0700
X-CSE-ConnectionGUID: YcpoF+HwR1mtvc2IEays5w==
X-CSE-MsgGUID: ysRb3iS4TIe66QYbuf05PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142892692"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 00:00:48 -0700
Date: Wed, 14 May 2025 09:00:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: Re: [PATCH i-g-t] Revert "tests/intel/xe_fault_injection: Suppress
 GuC CT dumps"
Message-ID: <20250514070036.gd2fmqeo4pfq2acq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
References: <20250514044651.14898-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514044651.14898-1-satyanarayana.k.v.p@intel.com>
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

Hi Satyanarayana,
On 2025-05-14 at 10:16:51 +0530, Satyanarayana K V P wrote:
> This commit has dependency on a commit from XE. The commit from XE is
> still in review. So, reverting this commit to avoid CI test failures.

I will re-word a little above description.

> 
> This reverts commit dfe2c08db120d49e8b0ea92f20d09d6b60343da8.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> --
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>

Sorry for premature merge, so lets revert it and wait
for kernel side to be ready,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 10374d23e..f9bd5c761 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -123,22 +123,6 @@ static void injection_list_add(const char function_name[])
>  	close(dir);
>  }
>  
> -static void injection_list_append(const char function_name[])
> -{
> -	int dir, fd, ret;
> -
> -	dir = fail_function_open();
> -	igt_assert_lte(0, dir);
> -
> -	fd = openat(dir, "inject", O_WRONLY | O_APPEND);
> -	ret = write(fd, function_name, strlen(function_name));
> -
> -	close(fd);
> -	close(dir);
> -
> -	igt_assert_lte(0, ret);
> -}
> -
>  static void injection_list_remove(const char function_name[])
>  {
>  	int dir;
> @@ -252,10 +236,6 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  
>  	ignore_faults_in_dmesg(function_name);
>  	injection_list_add(function_name);
> -	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
> -	    !strcmp(function_name, "xe_guc_mmio_send_recv"))
> -		injection_list_append("xe_should_fail_ct_dead_capture");
> -
>  	set_retval(function_name, INJECT_ERRNO);
>  
>  	igt_kmod_bind("xe", pci_slot);
> @@ -293,8 +273,6 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
>  	for (int i = iter_start; i < iter_end; i++) {
>  		fault_params->space = i;
>  		setup_injection_fault(fault_params);
> -		/* Clear the injection list  */
> -		injection_list_clear();
>  		inject_fault_probe(fd, pci_slot, function_name);
>  		igt_kmod_unbind("xe", pci_slot);
>  	}
> -- 
> 2.43.0
> 
