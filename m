Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1013BCD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 12:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0C310E49F;
	Thu, 21 May 2026 12:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyfDgvp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706BE10E4F5
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779367588; x=1810903588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LXSnFgYE+we2ax7oeiyO1cOZGGOxCWe1ExajY/EKWZI=;
 b=KyfDgvp+i924v6TUD1KtPusUqMpwXvlJFJxDJgMUwcdwV+I9/WmjPzIL
 /3PdzMLYbIa5h375lrZyb+ZqK2KLI//99mHJ1MREKQbz1NKQ4AGYo25jp
 7GRlS9U87HRjB9sr0E4JvqMLTXS2n3IOguWNC156HVSOOSEDPZMDBSUh6
 rJG4eo2yUVwQ61NrDyyLJGi0IRi8CesROJIO27o6MSbLjW021PTBKhjjR
 5HgIEi6gPzkYpIqjbKgkrnBiKgBpDCUtVf07gOM1aMwvim5KLhCJkH35e
 EeK26e6PmrCeB0iHBICeJS+Y+ZAKdavKUL6g+eFn4/pZz0rEvU418lyfj g==;
X-CSE-ConnectionGUID: N+jzgfguReKUoX+7Wv6LKw==
X-CSE-MsgGUID: 5zTOjTfARZizDa2beRHkkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91674967"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="91674967"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:46:27 -0700
X-CSE-ConnectionGUID: 6NLzupcyRi+lnC6/GoL6DQ==
X-CSE-MsgGUID: BjbjNBH2SmSGq9DaPyABJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236102775"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:46:25 -0700
Date: Thu, 21 May 2026 14:46:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, janusz.krzysztofik@linux.intel.com,
 matthew.auld@intel.com
Subject: Re: [PATCH] tests/core_hotunplug: add *-with-load subtests
 exercising GPU workload during hotplug
Message-ID: <20260521124623.dxgx6mxe2phdvbrh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 janusz.krzysztofik@linux.intel.com, matthew.auld@intel.com
References: <20260518154808.118134-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518154808.118134-2-nitin.r.gote@intel.com>
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

Hi Nitin,
On 2026-05-18 at 21:18:09 +0530, Nitin Gote wrote:
> The six fd-holding hot* subtests keep a DRM fd open across unbind/unplug
> but leave the GPU idle, so the kernel hotplug path is never exercised
> against an active workload.
> 
> Add six new dedicated *-with-load subtests that run a GPU spinner across
> the unbind/unplug sequence so the device is removed while a workload is
> actively using it.
> 
> The workload helpers use an explicit chipset dispatch block in
> workload_start()/stop() so that other vendors can contribute
> support by adding an else-if branch. New subtests are gated on
> workload_available(), which currently covers DRIVER_XE and DRIVER_INTEL,
> and returns false (SKIP) on any other driver.
> 
> igt_spin_free() is avoided in workload_stop() since the device may be
> gone by then -- igt_spin_end() writes the stop condition via a userspace
> mmap and lets the DRM fd close reclaim kernel-side resources.
> 
> Validated on BMG and DG2 with a KASAN-enabled kernel:
> all six new subtests pass with no KASAN reports.

Please reply to Xe.FULL CI failure with cc to CI-bug filling team.
There are few fails from these new ones. Also please cut reply
after 'Known failures' to keep mail short.

Regards,
Kamil

> 
> v3: Extend struct gpu_workload with a union of vendor-named members
>     to match the chipset dispatch in workload_start()/stop(). (Janusz)
> 
> v2: Pass the hotunplug priv struct to workload_start()/stop()
>     and dispatch via an explicit if/else-if chipset block to invite
>     other vendors to contribute. (Janusz)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Hi Janusz,
> 
> Extended the struct gpu_workload with a union of vendor-named members
> to make a room for other vendors data.
> 
> Thanks,
> Nitin
> 
>  tests/core_hotunplug.c | 294 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 294 insertions(+)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7c9dae1bf..2c54af628 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -80,6 +80,34 @@
>   * SUBTEST: unplug-rescan
>   * Description: Check if a device believed to be closed can be cleanly
>   *		unplugged, then restored
> + *
> + * SUBTEST: hotunbind-rebind-with-load
> + * Description: Check if the driver can be cleanly unbound from an open device
> + *		with a background GPU workload in flight, then released and
> + *		rebound
> + *
> + * SUBTEST: hotunplug-rescan-with-load
> + * Description: Check if an open device with a background GPU workload in
> + *		flight can be cleanly unplugged, then released and restored
> + *
> + * SUBTEST: hotrebind-with-load
> + * Description: Check if the driver can be cleanly rebound to a device with a
> + *		still open hot unbound driver instance while a background GPU
> + *		workload is in flight
> + *
> + * SUBTEST: hotreplug-with-load
> + * Description: Check if a hot unplugged and still open device can be cleanly
> + *		restored while a background GPU workload is in flight
> + *
> + * SUBTEST: hotrebind-lateclose-with-load
> + * Description: Check if a hot unbound driver instance still open after hot
> + *		rebind with a background GPU workload in flight can be cleanly
> + *		released
> + *
> + * SUBTEST: hotreplug-lateclose-with-load
> + * Description: Check if an instance of a still open while hot replugged
> + *		device with a background GPU workload in flight can be cleanly
> + *		released
>   */
>  
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
[cut]
