Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC54ED16268
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 14:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6DF10E45C;
	Mon, 14 Oct 2024 14:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cf9wqgf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5989310E45B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728915558; x=1760451558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c7quSDX1ddcwDRRxGmwgjuQ6e4TezwxLwodDrbp1QKo=;
 b=cf9wqgf+HKrPqj3M8JFD7smc6hqOBo6+M6+xyke2f/L6R5fHl2NcLiDJ
 DznJAkd5L3uOLC03ReQbD+SJ7L4N3fv5HJk1g/5x1GCbSr5WFx1I64Go+
 6u8nizBAGkli9IZeUbthz0gC26jYBEuQHNdLZcQM8Clv7TPFM+x5kio7p
 /QQXSxEcUOyEaeKlgyHk/bwx0PeuAp/13HZL4EeZTt02TuBKxASmpeYKY
 3mKUxW5T2dyIQbQ8LT23eSriftlT53ZYug0+s9HihOYJQSUUdRdG5KE7r
 CAizGGgA1pVrH5KP/+6ThLPiQinVKai2Ui4qzG8s/S6FX/kkp29v76Isj Q==;
X-CSE-ConnectionGUID: kDWC+MFqQmCS8wya6cDBvg==
X-CSE-MsgGUID: B8wlGtgXS5Kpi+4sitnNMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45736531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="45736531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:19:17 -0700
X-CSE-ConnectionGUID: OlyUyM8lS+i2CBra0fIimQ==
X-CSE-MsgGUID: 6yYjT8wpStO7PioAsTKo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77199315"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:19:15 -0700
Date: Mon, 14 Oct 2024 16:19:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/oa: Check exec_queue is usable after
 closing OA stream
Message-ID: <20241014141913.s3w5wf2xqwc7lkuu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240921004506.3280863-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921004506.3280863-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2024-09-20 at 17:45:06 -0700, Ashutosh Dixit wrote:

please fix subject:

tests/intel/oa: Check exec_queue is usable after closing OA stream

should be:

tests/intel/xe_oa: Check exec_queue is usable after closing OA stream

> Add a test case to verify that batch buffers submitted on an exec_queue,
  ^^^^^^^^^^^^^^^
imho here:
Add repeated verification for ...
or:
Repeat twice a verification for usablility of batch buffers....

> after closing the OA stream, do indeed complete. This test is in related to
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2821 where this was
> first noticed.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/intel/xe_oa.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 506646789c..eb19fdec97 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -3018,13 +3018,34 @@ test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
>  	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
>  	igt_assert_eq(report32[format_size_32], 0x80808080);
>  
> +	intel_buf_unmap(buf);
> +	__perf_close(stream_fd);
> +
> +	/*
> +	 * Re-do MI_RPC after closing perf stream, and check batch buffers
> +	 * submitted on exec_queue still complete
> +	 */

Instead of copy-paste, wouldn't it be better to write a function
and call it twice here?

Regards,
Kamil

> +	buf_map(drm_fd, buf, true);
> +	memset(buf->ptr, 0x80, 4096);
> +	intel_buf_unmap(buf);
> +
> +	intel_bb_flush_render(ibb);
> +	intel_bb_sync(ibb);
> +
> +	buf_map(drm_fd, buf, false);
> +	report32 = buf->ptr;
> +	format_size_32 = format.size >> 2;
> +	dump_report(report32, format_size_32, "mi-rpc");
> +
> +	igt_assert_eq(report32[0], 0x80808080);
> +	igt_assert_eq(oa_timestamp(report32, test_set->perf_oa_format), 0x80808080);
> +
>  	intel_buf_unmap(buf);
>  	intel_buf_destroy(buf);
>  	intel_bb_destroy(ibb);
>  	xe_exec_queue_destroy(drm_fd, ctx_id);
>  	xe_vm_destroy(drm_fd, vm);
>  	buf_ops_destroy(bops);
> -	__perf_close(stream_fd);
>  }
>  
>  static void
> -- 
> 2.41.0
> 
