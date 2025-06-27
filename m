Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA1C83013
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 16:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802410E27A;
	Fri, 27 Jun 2025 16:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grvT3g7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C1810E9EA
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751042339; x=1782578339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2oPyEEKvwpS18g4EQfOBgyD+WSWtA2By7Ig0uJoRB2w=;
 b=grvT3g7qAf2G2Ok1hjb0hJpv3gM0tc+TLl6YrYj8zU8feejeOAETxUnL
 Pz0ByV1HsON0wBtuUik36QjTuKkvyks4HQ+3Nix9UW5VkWsl8indmxsZO
 Nb/7ap2rvwg+ifjRrTmExIF/axift0dIdXE9BO7NGE03SunyMkCWfI5if
 NXoK9gD7jbBvjlA5J9yWIBYNxqMGH2JFhcvdaqtdNx5AJXAZFj+RxZRnX
 /oFkb9yR39qkour9DN5G5YNtW8ZaRvV7k/ckof+FLl+3chf6TwnttizCY
 coOKqTvFB6c5ohw3wWDClxYtM2oJE6S33w5w5DNVDvNiOc7lSM7bBZ0xw A==;
X-CSE-ConnectionGUID: gCPJ36XAS2GUlVnD0Mgvcg==
X-CSE-MsgGUID: qAPXbWOlRa+0y/kNLVMpMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53080135"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53080135"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:38:58 -0700
X-CSE-ConnectionGUID: sIyuuva8R/a559SkatAz3g==
X-CSE-MsgGUID: DWSbbmvzT7uin58Zpsmukg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152238572"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:38:57 -0700
Date: Fri, 27 Jun 2025 18:38:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 brian3.nguyen@intel.com
Subject: Re: [i-g-t] tests/intel/xe_dma_buf_sync.c: Ensure spinner completion
Message-ID: <aF7JHvwjfOvPHjLV@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 brian3.nguyen@intel.com
References: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
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

On 2025-06-27 at 03:00:02 +0800, Jagmeet Randhawa wrote:

One small nit, please remove ".c" from subject, so it will
read:

[i-g-t] tests/intel/xe_dma_buf_sync: Ensure spinner completion

This could be done at merge time, no need for resend.

Regards,
Kamil

> Add syncobj_wait() to verify that the spinner operation on fd[0]
> has completely finished before proceeding to clean up.
> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> Cc: Brian Nguyen <brian3.nguyen@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_dma_buf_sync.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index 3e8d89e95..1c0e7c670 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -203,6 +203,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  		xe_spin_end(&data[i]->spin);
>  		igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
>  					0, NULL));
> +		igt_assert(syncobj_wait(fd[0], &syncobj_signal, 1, INT64_MAX,
> +					0, NULL));
>  		igt_assert_eq(data[i]->data, 0xc0ffee);
>  
>  		/* Clean up */
