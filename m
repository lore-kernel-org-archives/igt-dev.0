Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B45CD98F3
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A627810F278;
	Thu, 18 Jun 2026 11:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUn+M2dG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC7910F275
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 11:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781780969; x=1813316969;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sbWAPD4VsT9csQMR4W764gQSFzIuckmOR3ULnf1SMZE=;
 b=IUn+M2dGcIO7UGIjNfdvztGuRvNPw/+XoPcDGtp3mxUZHosTsy44MMqB
 2kacWZZUMSq195TIxYIjkHeINWI/yVeh7crpWUwJ6QeP/xG6sZJColZgy
 ekBwkKgK2dpqiysn9YcOcRXbj0NHSTVTcSvEzfk497KhS7H3XP1rl5pfR
 ILIjEBYCXhh6hEU82prs84I+Y/2xlKa+0D/hWpTWpvCYqRQ9JlIVOhYCM
 xdhedic2BpyXbfFUJoSpDzWSGZUuCF040B/mCLz5MRKI5X/VRHipvAtAF
 mCaPVxhSgrQL0c7fVubypIAgkoE0OKVu5Y7BiYZn+lgmtS9Eo6UYXcyDg Q==;
X-CSE-ConnectionGUID: tr6D0AT9S3uJrlQ2xh4YOw==
X-CSE-MsgGUID: xwVsEJ1TRUKv+995/vN9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="108157551"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="108157551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:09:28 -0700
X-CSE-ConnectionGUID: r+I2agWcQi2/tSA8bbqgNA==
X-CSE-MsgGUID: gWYKjMOMR+W6tbwaH418Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="241961913"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:09:27 -0700
Date: Thu, 18 Jun 2026 13:09:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_debugfs: Add checks for
 existing root dir entries
Message-ID: <20260618110925.kc6vverhmq2vbqtd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, piotr.piorkowski@intel.com,
 kamil.konieczny@intel.com
References: <20260616051348.610849-1-sobin.thomas@intel.com>
 <20260616051348.610849-3-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616051348.610849-3-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-06-16 at 05:13:46 +0000, Sobin Thomas wrote:
> Add non-empty validation for existing root-dir debugfs entries
> 
> Validate:
> - clients: entry is non empty
> - gtt_mm: entry is non empty
> - info: entry is non empty
> - name: entry is non empty
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index d7a204a09..3697d481d 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -401,14 +401,14 @@ out:
>  static void test_root_dir(struct xe_device *xe_dev)
>  {
>  	const struct check_entry expected_files[] = {
> -		{ "clients", O_RDONLY },
> +		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
>  		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
>  		{ "forcewake_all", O_WRONLY },
>  		{ "gem_names", O_RDONLY },
>  		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> -		{ "gtt_mm", O_RDONLY },
> -		{ "info", O_RDONLY },
> -		{ "name", O_RDONLY },
> +		{ "gtt_mm", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
>  		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
>  		{ "poor_man_system_atomic_support", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
>  		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> -- 
> 2.52.0
> 
