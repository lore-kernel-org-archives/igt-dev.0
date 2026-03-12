Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDE7105A591
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 12:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AF110E9E3;
	Thu, 12 Mar 2026 12:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NB/MlaGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B1D10E9E4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773320330; x=1804856330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t5eEgH/+Cj2ecpDyVbSIQPpxvXxW/Lt3/AXKF3VmoiA=;
 b=NB/MlaGOZ9aYuK82aP8X5EZrMND83ickwUhia785MMd4+WYVwjg6tXWv
 1ACav/wU6VZdetD1lrJxZ8xhBQfdmA0mlpuEMO/F2BIC/h3vDmGmVc2F3
 MepTFLpvt2CVYFbb1hkjw/aIJCXMWROzUOsqr1ZC//GtkBj8VmIvfI+Wm
 fLZqAEdRTwn00tTJaRD2xFil3ycMMjTZDON5sPX7/tRS3Ag72OXBgWNNx
 2suaChJuXwBEEWBxAyepnVv3Tu5JzFNXJVZC/jwOiQdd55BrTog8nDymB
 WBqyUHoZllmVEbLCLqQVXb8whE0npYFvZccnFW2HzlJCJXS8j3+kIcZYu A==;
X-CSE-ConnectionGUID: UDe5IdtuQbWY3mWcdlgoaQ==
X-CSE-MsgGUID: 5ZUSEn5RQgavXzy4Uc/HWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91981553"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="91981553"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:58:50 -0700
X-CSE-ConnectionGUID: D6N96fOsSIW0XKjFtzAKtw==
X-CSE-MsgGUID: 9h9tkRn+QYK/Equ8v6Gpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225512849"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 05:58:48 -0700
Date: Thu, 12 Mar 2026 13:58:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v3 i-g-t 2/2] intel-ci: Add NVL Display blocklist to
 meson.build
Message-ID: <20260312125833.vkqu7sqrhblk3r4s@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
References: <20260312102201.53909-1-aditya.chauhan@intel.com>
 <20260312102201.53909-3-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312102201.53909-3-aditya.chauhan@intel.com>
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

Hi Aditya,
On 2026-03-12 at 15:52:01 +0530, Aditya Chauhan wrote:
> Add NVL display blocklist to meson.build which was earlier missing.
> Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")

This fixes tag should be just before your s-o-b. This could be
fixed at merge time, no need for resend. With this

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> v2: Make commit message more descriptive(Swati Sharma)
> v3: Use correct subject(intel-ci) and take care of
> Alphabetical order while adding to meson.build(Swati Sharma)
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 3c7fa28b7..2b3266bbd 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -24,6 +24,7 @@ intelci_files = [
>    'xe.lnl.eudebug.blocklist.txt',
>    'xe.multigpu.blocklist.txt',
>    'xe.nvl.core.blocklist.txt',
> +  'xe.nvl.display.blocklist.txt',
>    'xe.ptl.core.blocklist.txt',
>    'xe.ptl.display.blocklist.txt',
>    'xe.sriov-vf.blocklist.txt',
> -- 
> 2.34.1
> 
