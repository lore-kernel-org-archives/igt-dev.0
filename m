Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EE7606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hx71BhPY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C3E10EF9A;
	Mon, 23 Nov 2026 16:34:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F0410EDCF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795451590; x=1826987590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=umbu1HhWo4GD633c6Ccun+Xf7UHtRPL3EkyQ8z/Kbv0=;
 b=Hx71BhPYMYQc3PEJdj7nw7MliDIbWOmA7KpqiKBCkdLAQ1xvnXHmLGym
 yZMG/rYfK6FY0iop6zHWGAwGYbPpklb9SMPp81TWDj7Gr+MdsrWWsDYAH
 9qAU6uJP0P5FOV5onOV7JTVBDCn3sK4s6IVZei04oiGtvELadESLVmWrS
 dQOwYkv6zWjubi/Lx3SYdPI+iHgkZ+x1WTtagR/DZJL+aU0+JCIp1Lrby
 PrkN2nJ6Be8veCa6GKd9ykEeGPN0kR+TC6eYL0oHkLlLSNUQ87fD0dzdL
 emL0eu2TgVh6a09Gt36uZhwPukLqu8KQQs63WjA7C8jbYlvN6ikpf0CdG Q==;
X-CSE-ConnectionGUID: egkRWhaxR7+qnjoEukUk+w==
X-CSE-MsgGUID: g4mgKkTrSDyz5c669j5SaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4158831"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4158831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 08:33:09 -0800
X-CSE-ConnectionGUID: nEGsRuNeQ4e3eBxGUcjsxg==
X-CSE-MsgGUID: 4mVZDKfzQNqXcXDzfVvYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11703081"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 08:33:07 -0800
Date: Mon, 23 Nov 2026 17:33:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, shuicheng.lin@intel.com
Subject: Re: [PATCH] lib/intel_batchbuffer: Destroy exec queue owned by
 intel_bb
Message-ID: <yak7k2kp4cvdtpq2rjvibm6mehuov7jf2bliz6rsbqwy74uawd@xgikut7okk6y>
References: <20261118234356.342335-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118234356.342335-1-zongyao.bai@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 03:43:56PM -0800, Zongyao Bai wrote:
> On Xe intel_bb creates an exec queue lazily at first submission (and
> re-creates it on engine/gt change), but only the previous queue was
> destroyed on a switch. The last queue was never destroyed by
> intel_bb_destroy(), so it stayed alive until the drm fd was closed.
> 
> Since the queue holds a reference to the VM and its LRC/BOs, the whole
> VM/LRC/GGTT teardown, including the GuC deregistrations and TLB
> invalidations, was deferred to fd close and executed as a burst after
> the test finished. For tests that create a lot of intel_bb (e.g.
> xe_pat@pat-index-auto) this kept the GT out of C6 for more than a
> second after the test, making a following xe_pm_residency@idle-residency
> fail intermittently.
> 
> ibb->engine_id is only ever assigned by intel_bb itself, a user supplied
> ctx is never stored there, so destroy it unconditionally (when set)
> before destroying the VM. i915 never sets it and is unaffected.
> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  lib/intel_batchbuffer.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 1dacfdc6c..05e6eaf35 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1368,6 +1368,17 @@ void intel_bb_destroy(struct intel_bb *ibb)
>  		close(ibb->fence);
>  	if (ibb->engine_syncobj)
>  		syncobj_destroy(ibb->fd, ibb->engine_syncobj);
> +	/*
> +	 * ibb->engine_id is only set when intel_bb created the exec queue
> +	 * itself (a user supplied ctx is never stored there). Destroy it
> +	 * together with the batch, otherwise the queue (and the VM and LRC
> +	 * it references) stay alive until the fd is closed and are torn down
> +	 * in a burst, keeping the GT busy for seconds after the test.
> +	 */
> +	if (ibb->engine_id) {
> +		xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
> +		ibb->engine_id = 0;
> +	}

Definitely there's a exec queue leak until exiting the process or closing
drm fd. But is xe_exec_queue_destroy() synchronous in this case? Otherwise
adding this only decreases race window.

Anyway, this definitely should be destroyed here so, no doubt about that:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	if (ibb->vm_id && !ibb->ctx)
>  		xe_vm_destroy(ibb->fd, ibb->vm_id);
>  
> -- 
> 2.43.0
> 
