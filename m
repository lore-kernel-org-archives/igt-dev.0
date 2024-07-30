Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA73DC3DA61
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 04:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9852410E107;
	Tue, 30 Jul 2024 04:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVFschir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730C110E107
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 04:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722312720; x=1753848720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UT14t6Ht5pf8ESTaQxpA7MTAEZlMHwXqWFlvBwDEMNM=;
 b=FVFschirnpJIrLnE1mA1nsx4qEmBNvhdVu3M50xDCLTuKrOyDg9tjH8t
 QrXqHDaEAt1VOFCjS9n4gQrDL3Az7PDMht+I4fQn8BeYDl28WL7yGXl88
 zZM+y7AMyevc2TIRmJAvwVFooL/c7vtyrWUJXDv0pHakqsmZkSNsJxToU
 aPbLX8TrRQ/zDwV16KHcNTp/oxu+RLbLg9eyLIU/mi+5q8h0Cf0UxLwVk
 Iy6RbRhUHLkM3jTOwhFW6sgBYy/Xav77pDkw3eX1v2hOFRg6AxJIk/C9f
 Aq/2UuEkTvmBvzsXeT2dAXYBEJkm4+n352f7+i8W0N/zTgKc1Ep3bwkv7 A==;
X-CSE-ConnectionGUID: Kkyi/zRuRSCoKtiTffXnKQ==
X-CSE-MsgGUID: Z/7ls5ZfSFeqalD1dCdz9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23023300"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="23023300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 21:12:00 -0700
X-CSE-ConnectionGUID: IsdO/CzGQ8W92YVeEC5LQg==
X-CSE-MsgGUID: ZGbfkyU0RqC4sMuccM559w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="84839249"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 21:11:59 -0700
Date: Tue, 30 Jul 2024 06:11:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v1 3/4] tests/intel/xe_wedged: Inform runner about
 expected error
Message-ID: <20240730041154.bxwrzbbbflrg2mlp@zkempczy-mobl2>
References: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
 <20240725125006.30041-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725125006.30041-4-kamil.konieczny@linux.intel.com>
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

On Thu, Jul 25, 2024 at 02:50:05PM +0200, Kamil Konieczny wrote:
> Tests runs force wedged state and then driver emits an error.
> Standalone runs are succeeding but when run by igt runner it
> catch such errors and reports them in results.
> 
> Inform runner to ignore such triggered failure.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1760
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1958
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_wedged.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index a4fc53869..a3f7a697f 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -26,6 +26,12 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
>  
> +static void ignore_wedged_in_dmesg(void)
> +{
> +	/* this is needed for igt_runner so it will ignore it */
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
> +}
> +
>  static void force_wedged(int fd)
>  {
>  	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
> @@ -235,6 +241,8 @@ igt_main
>  					       O_RDWR));
>  
>  		igt_assert_eq(simple_ioctl(fd), 0);
> +		ignore_wedged_in_dmesg();
> +
>  		force_wedged(fd);
>  		igt_assert_neq(simple_ioctl(fd), 0);
>  		fd = rebind_xe(fd);
> @@ -245,6 +253,7 @@ igt_main
>  
>  	igt_subtest_f("wedged-at-any-timeout") {
>  		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
> +		ignore_wedged_in_dmesg();
>  
>  		igt_debugfs_write(fd, "wedged_mode", "2");
>  		simple_hang(fd);
> @@ -268,6 +277,7 @@ igt_main
>  		igt_debugfs_write(fd, "wedged_mode", "2");
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		igt_debugfs_write(fd, "wedged_mode", "1");
> +		ignore_wedged_in_dmesg();
>  		simple_hang(fd);
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  	}
> -- 
> 2.43.0
>

LGTM, unless will nack this.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
