Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFF2C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04110E975;
	Mon, 25 Mar 2024 15:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="likITvzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B31410E976
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379195; x=1742915195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ReWsG7l7gyvqR6vK45OxDIiIyHv/rdJAwWwMWwnwaVQ=;
 b=likITvzfccgr/b518S5Ed6sZ3ZyIS+/AW6tFGQQDrsh4GgItssRK1hbu
 gWzoteTYH8x4MOAlVcE2RtrBJQXXktnVNZ80cTAUyrdPQhcVvm0ERUTzX
 7ctFccZf91zYZ0Sk1iq+PqD6qPYugzBkfPsE4qZw7X7eglSo+vBFzmzn2
 W7BQzj2XqALfh9xfxc+qoD79PvYmLy4CioI6ih10r1IaXRoGQJMa6dFle
 sJ0Vz9fFFuSUT0XkuQklUUmh7/5bJrvbh9xF5UjIHe3S8KvRKGewOoNhD
 Yvt1dwOq33DYIIClxzwWEFtu9FqTqbWNKtFEEpyWIvTGrFCKB4hg1PRzN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6246014"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6246014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20372474"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:06:33 -0700
Date: Mon, 25 Mar 2024 16:06:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 05/12] tests/intel: Move drm_fdinfo to driver
 subcategory
Message-ID: <20240325150630.fjevm5jkt6bo4caf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-7-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-7-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-22 at 12:41:01 +0000, Katarzyna Piecielska wrote:
> On Xe drm_fdinfo test is in
>      Sub-category: driver
>      Functionality: Per client memory statistics
> Let's use the same for drm_fdinfo in i915.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/drm_fdinfo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
> index a10c9fffc..61c66079e 100644
> --- a/tests/intel/drm_fdinfo.c
> +++ b/tests/intel/drm_fdinfo.c
> @@ -37,8 +37,8 @@
>   * TEST: drm fdinfo
>   * Description: Test the i915 drm fdinfo data
>   * Feature: client busyness
> - * Functionality: client_busyness
> - * Sub-category: FDinfo
> + * Functionality: Per client memory statistics
> + * Sub-category: driver
>   * Category: Desktop client
>   *
>   * SUBTEST: all-busy-check-all
> -- 
> 2.34.1
> 
