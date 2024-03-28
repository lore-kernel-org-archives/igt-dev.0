Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310BFC54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 10:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39F1123B0;
	Thu, 28 Mar 2024 10:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxIdvb3d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E53B1123B0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711620846; x=1743156846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pjikhHtVi88yWqE+sKpZ40LktQJDtXwcEUi63YpOXLA=;
 b=LxIdvb3dPXV5UWYeNiIRXQmSoEu9o4cKjWaH7RXZaSiokZPp5cjUwHav
 20U9D99KKlOc4IFonh3BUzQQ9uKY28vDMpDX+F+ABrs8fLgiUfkY2I9sh
 l4pwT/1WrYu7JZAOtmdsGNDqEIEVkBBJOKbLviA0GRMwbZ8Upx1jb+Qj2
 RYgbOLfEjBILb/gvelBWPKU3bF7BUc9GPQHueJhmjK4yBkhpc3MJ1ei9Z
 K3jUUNwpEd3DWPMaNqpwJdopR3bNdz2eYqIZTqa/rpYCjXdRsfJ+shpUr
 fHCaAJjAxDGT08FVkDuDgtmfYp9nHXkdGLGozRT9ukhXqRDjYLXIlxfbV w==;
X-CSE-ConnectionGUID: lW9N66OjTB2mEPDEadACFQ==
X-CSE-MsgGUID: YVR8Oj6iSayOFZhcQBiHiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="29246211"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="29246211"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16538273"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 03:14:03 -0700
Date: Thu, 28 Mar 2024 11:13:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci: Drop "xe_exec_threads" from XE BAT
Message-ID: <20240328101339.s5od4n66fv7idtkg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240328051139.819455-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328051139.819455-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-03-28 at 10:41:39 +0530, Bhanuprakash Modem wrote:
> Regession with "6.9.0-rc1-xe" is preventing to run KMS tests
> in BAT. Hence drop "xe_exec_threads" from XE BAT until we fix
> the regression.
> 
> Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1044
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw this looks like a temporary solution, such breaks can
happen for future rc1, then it will go back and forth...

Regards,
Kamil

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 17863b6b1..55339b8ca 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -80,12 +80,6 @@ igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
>  igt@xe_exec_store@basic-store
> -igt@xe_exec_threads@threads-basic
> -igt@xe_exec_threads@threads-mixed-basic
> -igt@xe_exec_threads@threads-mixed-shared-vm-basic
> -igt@xe_exec_threads@threads-mixed-fd-basic
> -igt@xe_exec_threads@threads-mixed-userptr-invalidate
> -igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
>  igt@xe_gpgpu_fill@basic
>  igt@xe_gt_freq@freq_basic_api
>  igt@xe_gt_freq@freq_fixed_idle
> -- 
> 2.43.2
> 
