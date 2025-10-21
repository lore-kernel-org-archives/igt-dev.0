Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748FFCCD184
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 12:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C86E10E5DF;
	Tue, 21 Oct 2025 12:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHjxwXJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055C110E5DF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050480; x=1792586480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KxoRVzTK4SDPscbUuJkVNdk3RXBA92AZnGXdNdWnE3k=;
 b=JHjxwXJTB09+XM/AKISnhPQarzSV1inL9E91EWQp4fL7fsmxXjzcdlvb
 S6tyEUBVfbf6K6ANHn6clOYO5sbJ2HELLec2DvHpwsnsZnxTtiJR9uJu5
 921t/KKXzruoElYkDixfgXH3ldJ2lh+036sxzKY6UgLezLY464Ns/zjj8
 4jLedctFHpXfKSjsBbCJsJdeF2DN54ObcVYODql/nCF4Ehf5rTJCAPWNW
 MstKAmzz63i43mMQhiKXwHsdL9uGIh+1wQ3G2FgKAEPEauZWNNLZ0eJ1c
 6Le7Hit7tLq1vRhEhQrpH8f/GAEXSzGAyeJwQSfBr5rwWhRo19Z3Mty0O w==;
X-CSE-ConnectionGUID: NRFby5p3T326roeG/OXqog==
X-CSE-MsgGUID: be7IBynER4uBdNAuZhBCFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74515911"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="74515911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:41:20 -0700
X-CSE-ConnectionGUID: M4CBwH+BRaqwj7ERiKDVCQ==
X-CSE-MsgGUID: VbZozKD3QaW7iA/aBD7Vfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="184063338"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.111])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:41:18 -0700
Date: Tue, 21 Oct 2025 14:41:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com, 
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v6 1/2] lib/intel_allocator: Add SYSVIPC support
 check
Message-ID: <ops27gccapwj4yr2xkhc24fvzoibhw4vvakjoyt5ajidw6ywu7@lxltd2tkr3ck>
References: <20251016113816.3343875-1-s.sebinraj@intel.com>
 <20251016113816.3343875-2-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016113816.3343875-2-s.sebinraj@intel.com>
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

On Thu, Oct 16, 2025 at 05:08:15PM +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle
> targets that don't have SYSVIPC enabled in their kernel. Without this
> check, the test would fail with assertion errors when trying to use
> message queues.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/intel_allocator.c | 23 ++++++++++++++++++++++-
>  lib/intel_allocator.h |  2 +-
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index d22c70f1f..7508d1788 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -250,6 +250,20 @@ static struct allocator *__allocator_find(int fd, uint32_t ctx, uint32_t vm)
>  	return igt_map_search(map, &al);
>  }
>  
> +/**
> + * Checks if the current system supports SYSVIPC by verifying the existence and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +static bool system_supports_sysvipc(void)
> +{
> +	if (access("/proc/sysvipc", R_OK | W_OK) == 0)
> +		return true;
> +
> +	alloc_debug("SYSVIPC not supported, cannot access /proc/sysvipc\n");
> +	return false;
> +}

If you have interprocess communication you can add new channel for it.

> +
>  static struct allocator *__allocator_find_by_handle(uint64_t handle)
>  {
>  	struct handle_entry *h, he = { .handle = handle };
> @@ -839,14 +853,21 @@ void __intel_allocator_multiprocess_start(void)
>   *
>   * Note. This destroys all previously created allocators and theirs content.
>   */
> -void intel_allocator_multiprocess_start(void)
> +bool intel_allocator_multiprocess_start(void)
>  {
>  	alloc_info("allocator multiprocess start\n");
>  
> +	if (!system_supports_sysvipc()) {
> +		igt_warn("System does not support SYSVIPC, multiprocess not supported\n");
> +		return false;
> +	}
> +
>  	igt_assert_f(child_pid == -1,
>  		     "Allocator thread can be spawned only in main IGT process\n");
>  	__intel_allocator_multiprocess_prepare();
>  	__intel_allocator_multiprocess_start();

But if you need to block I would change void -> bool in
__intel_allocator_multiprocess_prepare() and return false if there's no
channel. Then propagate this to bool intel_allocator_multiprocess_start().
This requires changing intel_allocator_init() and set channel
to NULL when there's no SYSVIPC. This way you can easily skip
api_intel_allocator.c:fork_simple_stress() test as well.

--
Zbigniew

> +
> +	return true;
>  }
>  
>  /**
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index 4b6292f06..46e3429d9 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -166,7 +166,7 @@ struct intel_allocator {
>  void intel_allocator_init(void);
>  void __intel_allocator_multiprocess_prepare(void);
>  void __intel_allocator_multiprocess_start(void);
> -void intel_allocator_multiprocess_start(void);
> +bool intel_allocator_multiprocess_start(void);
>  void intel_allocator_multiprocess_stop(void);
>  
>  uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type);
> -- 
> 2.43.0
> 
