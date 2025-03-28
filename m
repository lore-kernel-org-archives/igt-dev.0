Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0536C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 11:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8774310E9F4;
	Fri, 28 Mar 2025 11:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoCY1DHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A809010E9F4
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743163031; x=1774699031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HgbLulKkaC54qtgmgnsTzGeTEWzmwfrPKa9WL1RXI3g=;
 b=QoCY1DHidz/7YiouBgkPLgHAOuTUxNuRkxc6PXcnf6Zfr9lG90NFtxFY
 yg51lk1SHH1giWjJpZSj7g7YKDPEEDcDNJphB+eKkuF2EPDJrQOCh0CRC
 2nrCQ+X12xL9T7Cbp7dj7q1qHpeAxpxcmj5FDuIayX1X6Xgn3GU9Q91eD
 NIoVom9FgVgQMxi+uKYYS3KpDyWIJXSdBry4HV4y1B1drE3ABiyJXPU41
 eJEZMka0pZV8WvPln2M5GvawKYOFo+zhIKdjwpt8Tl+MHm4MFtNc5+GTw
 ePPxvKk8BmzBKbVrtE0jNGYU8RjFeRfyhKOZVsONR86wOqEpYEzd5eGnW A==;
X-CSE-ConnectionGUID: kPAMII56SwGTm9vmwNxYCQ==
X-CSE-MsgGUID: EYw8QOoARbS4fz2tkIA6ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43676172"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="43676172"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:57:10 -0700
X-CSE-ConnectionGUID: LRF4PuYhT2KRNcSlPGM5RQ==
X-CSE-MsgGUID: MfeRhbcpQ02LPkgGDYSIgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="156415248"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:57:09 -0700
Date: Fri, 28 Mar 2025 12:56:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci/meson.build: Add missing
 xe-sriov-vm.blocklist.txt
Message-ID: <20250328115653.5pkshfstekdqbekk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327170925.705874-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-03-27 at 18:09:25 +0100, Marcin Bernatowicz wrote:
> Add the missing blocklist file so it can be used in CI.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 59323eda9..b6f1357cb 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -12,6 +12,7 @@ intelci_files = [
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
>    'xe-sriov-vf.blocklist.txt',
> +  'xe-sriov-vm.blocklist.txt',
>  ]
>  
>  install_data(sources : intelci_files, install_dir : datadir)
> -- 
> 2.31.1
> 
