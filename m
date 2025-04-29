Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F10C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A910E096;
	Tue, 29 Apr 2025 20:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGranYzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBEC10E096
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959033; x=1777495033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ufQHmtRcNFCA/Qdr3IFDcMY35R/MNWKayntTsaZ+cpw=;
 b=LGranYzt/+sZGitf8uBiOz9vqrc4i9zsShjJrhKO/FuliOergY7fhvcH
 xMQQzEfZHOV1rp44/TCYmFpjcbf3Tv9qm99UK8KZGI67CbMW9oUhK9f45
 kM4PJtSexmlTTSe484tHVee1/vg9X2vkUKL6MMhLWeXa9eg/CvOeE2mMR
 jue/VCY1W3HZaLYqD0QjRBGE9P84MQgab7SqKH9tOPKfMMX3Xp4sPN23k
 6bJwJbtmrW1BwghsWiv3P47Rqky/BMc1vFv9Udfhq1rU3xFMhOtgQkyEa
 631PWyAnqgYY+BtCctmN8G/kldeDQt918zurY5pPIudYMr/4VtTDc/Xkn A==;
X-CSE-ConnectionGUID: y2Q8DVddS1yWLPNU6spzJA==
X-CSE-MsgGUID: p3T6Q4MKTj6aIbTw7kpZxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47484210"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47484210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:37:13 -0700
X-CSE-ConnectionGUID: 6nnYVQvETVWmBsIrCMyKjA==
X-CSE-MsgGUID: zgM0JwIkTxezgOSFWTouUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="134880302"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:37:10 -0700
Date: Tue, 29 Apr 2025 22:36:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH 2/2] xe_exec_system_allocator: Require huge pages
 reserved for huge page tests
Message-ID: <20250429203653.ncjhw6xz5uccydoq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, matthew.brost@intel.com
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
 <20250429192956.275280-3-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429192956.275280-3-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2025-04-29 at 19:29:56 +0000, Jonathan Cavitt wrote:

small nit about subject: use prefix, also avoid repetition,
so instead of

[PATCH 2/2] xe_exec_system_allocator: Require huge pages reserved for huge page tests

write for example:

[PATCH 2/2] tests/intel/xe_exec_system_allocator: Check for huge pages before thp tests

Btw this could be done at merge.

Regards,
Kamil

> Various subtests in xe_exec_system_allocator attempt to use the
> MAP_HUGETLB flag for mmap.  Doing so will result in an ENOMEM error if
> there are no available huge pages, which can occur if none are reserved
> before boot time.  So, skip the tests if no huge pages have been
> reserved by the kernel.
> 
> Fixes: 41ee4d698fd8 ("tests/xe: Add system_allocator test")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e1121a8627..8a55e0ff64 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -964,6 +964,12 @@ struct test_exec_data {
>  	uint32_t expected_data;
>  };
>  
> +static void igt_require_hugepages(void)
> +{
> +	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
> +		      "Huge pages not reserved by the kernel!\n");
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
> @@ -1005,6 +1011,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
>  		return;
>  
> +	if (flags & HUGE_PAGE)
> +		igt_require_hugepages();
> +
>  	if (flags & EVERY_OTHER_CHECK)
>  		igt_assert(flags & MREMAP);
>  
> @@ -1439,6 +1448,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	if ((FILE_BACKED | FORK_READ) & flags)
>  		return;
>  
> +	if (flags & HUGE_PAGE)
> +		igt_require_hugepages();
> +
>  	xe_for_each_engine(fd, hwe)
>  		++n_engines;
>  
> @@ -1550,6 +1562,9 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	if (flags & FORK_READ)
>  		return;
>  
> +	if (flags & HUGE_PAGE)
> +		igt_require_hugepages();
> +
>  	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
>  	posix_fallocate(map_fd, 0, sizeof(*pdata));
>  	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> -- 
> 2.43.0
> 
