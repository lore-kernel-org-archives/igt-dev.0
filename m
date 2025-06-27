Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0EBC7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 16:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D427210EA70;
	Fri, 27 Jun 2025 16:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ju2pw9vz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6610EA6A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751042727; x=1782578727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R7I2KpNLQPjw9b7uvWziPZXTkG/M9bK1AqpMucKNpcM=;
 b=Ju2pw9vzAImSJxzaspHiAIYuUAYID/VWJrLJuNkOc2NxBdWQRjqygELA
 lYx0S4/FHnvuib/sYzcFEhDI26fOinQYtzVVsT4QcPTG66WZ4yTGLLLZ1
 +dU9kfrjwTUVe82l8CThcit0IHXTDqhnA7rhn7dQOoQ1K4eIHcDv/YRDQ
 D1OOnTt2mnZ5TwlKcZblXcof0BtwkWJTeuqjbl06Aq+APR7tkoo8ygbOU
 tErw8wWXdt7FBt5+u5QIgLWkaA65a62e99k+OfKRsPotN+ALLqr3PuMBx
 Qyqiv5QrOMh3f1KWJmb6no3BmGxQCDtqt3IePIxr42Fudg+MnER5g4IFz Q==;
X-CSE-ConnectionGUID: 5ytcA4xXQ2O6rE4nBU9YDQ==
X-CSE-MsgGUID: zoj7+2VgQ4e+UNLgZ9O8Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53485000"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53485000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:45:27 -0700
X-CSE-ConnectionGUID: 8c/hnDGbSFGswQqZGlByUg==
X-CSE-MsgGUID: 2rOvq1rpSN+YutajHrqDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="158582242"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:45:26 -0700
Date: Fri, 27 Jun 2025 18:45:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, animesh.manna@intel.com
Subject: Re: [i-g-t] kms_vrr: Add comment explaining PR and LOBF dependency
Message-ID: <aF7KpKgOQ9TPsR3N@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 animesh.manna@intel.com
References: <20250623052056.135083-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623052056.135083-1-jeevan.b@intel.com>
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

On 2025-06-23 at 10:50:56 +0530, Jeevan B wrote:

Small nit about subject, add "tests/" prefix, so it will be:

[i-g-t] tests/kms_vrr: Add comment explaining PR and LOBF dependency

> Add a comment to explain that LOBF requires PR support,
> which is only available on eDP 1.5 panels.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_vrr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 4919b7cb7..b7600ae2c 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1049,6 +1049,10 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>  				continue;
>  			}
>  
> +			/* Panel Replay is supported only with eDP 1.5 panels.
> +			 * LOBF and PR are mutually exclusive features.

I do not understand this, did you mean:

			 * LOBF is possible only when PR is present.

Regards,
Kamil

> +			 * Skip the test if PR is not supported, as LOBF cannot be enabled.
> +			 */
>  			if (flags == TEST_LINK_OFF)
>  				igt_require_f(psr_sink_support(data->drm_fd,
>  					      data->debugfs_fd, PR_MODE, output),
