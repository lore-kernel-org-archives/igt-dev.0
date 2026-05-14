Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DED0CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 09:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57E510E394;
	Thu, 14 May 2026 09:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETfgF9nn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFDE10E394
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778749937; x=1810285937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JxHYfJlZ3DWh2JOoS6AsmxSgiYIQWCz733s/7DsC3iU=;
 b=ETfgF9nnSuaZrYO91a09Db4r5Mmhmjm8aFwFxqr8kUBg2wg7B3+2bh9q
 FoUspHwtR2vheLW7FQ6pOCerHg/1KQbVaEKMbfpKzt9371WXBjLspJM53
 iFwMuzOS5vBF7y4hwPGTZOOenAP415k9tXhPNMiRrFFEUORtJAtj5cxrN
 0/aL36doGs8QWnD3tOPjtZNGyMAimeYlBBc/Ql+x2JdiyeBYqT08+As23
 yAORSHZPav+qvLZuaSrt8IDMJCKYsHlK5INQrdlPwmOrg9N4ZCFpaMCFZ
 NsGmJQISqFkpEWECL2H9VsCXMPDFrzm9LeFS2LmpCV5FuHsa2mwY7J6O+ g==;
X-CSE-ConnectionGUID: 2zVYFHChTOCnr1t+S87B6w==
X-CSE-MsgGUID: quVRSkxeRWSHWoevyYW9fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79547360"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="79547360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:12:17 -0700
X-CSE-ConnectionGUID: SmsX2IYyTOeimeygR89vTQ==
X-CSE-MsgGUID: L7SSu780R8WR69nWr1bgvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="268682441"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.230])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:12:15 -0700
Date: Thu, 14 May 2026 11:12:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t] lib/xe: Retry xe_vm_bind on transient -EBUSY
Message-ID: <hncfso6a4aoruyhaoxlw74ezt4v6j4mknmbxp2r7hnwjwhpqm4@qk2umhgscvxd>
References: <20260512153919.3676059-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512153919.3676059-1-nishit.sharma@intel.com>
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

On Tue, May 12, 2026 at 03:39:19PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> __xe_vm_bind_assert() can intermittently fail with -EBUSY when the
> kernel rejects the bind because it detects in-flight work that has
> not yet completed. This is transient condition the call is expected
> to succeed once the competing work settles.

IMO this means test lack proper job fence-out checking. May you point
out the link to failing job?

--
Zbigniew

> 
> Add a retry loop (up to 5 attempts) that re-issues __xe_vm_bind()
> whenever -EBUSY is returned, before asserting success. All other
> error codes are treated as fatal and propagate immediately to
> igt_assert_eq() as before.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index e13195e16..3a307f95f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -242,9 +242,24 @@ void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
>  			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext)
>  {
> -	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
> -				   op, flags, sync, num_syncs, prefetch_region,
> -				   DEFAULT_PAT_INDEX, ext), 0);
> +	int ret, retries = 0;
> +
> +retry:
> +	ret = __xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
> +			   op, flags, sync, num_syncs, prefetch_region,
> +			   DEFAULT_PAT_INDEX, ext);
> +
> +	if (ret && retries < 5) {
> +		/*
> +		 * Retry on transient -EBUSY, which can occur when the
> +		 * kernel is contended by in-flight background work
> +		 */
> +		retries++;
> +		goto retry;
> +	}
> +
> +	igt_assert_eq(ret, 0);
> +	return;
>  }
>  
>  void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
> -- 
> 2.43.0
> 
