Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C621C02183
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 10:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6C910E050;
	Wed, 15 Jan 2025 10:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjOMp2JW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203410E050
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736937564; x=1768473564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dUyZfCvewDZpk/Ff2YMu1fy6a2qwXLWZfMSGzYq7jVQ=;
 b=cjOMp2JWlLwG/6gkoB44SthVl3gK2dTe/ts9fyZ997+RPFDt23xZFPGg
 ilBviZ+UjegcIi+tgMUzh29hSG4Yj2PKxSpe5WFtIsp5/iuw7TY9spGFm
 pF4wFU7u2plpzRxslGog+moaxbiMZBxN3sdCWTQRtqX7ILM1LLanjxkVs
 XW9JGoLnTDq/em5AJlJ34inZKKulQabrkhBv/wjBWZMldy2zNQbJY4mqn
 3KNOEUch0yMEKd38NAl7QJE+0Vt9I0Cur85wioN+Oj9G+OymezL6HoQ7z
 6zTyt5K9sXQY5DixbYTu0eWIEc6fqBo9mM0MBiVvs9h40EXWs1SkDy+Br A==;
X-CSE-ConnectionGUID: 6URk3kwLQL+NrXKBK4+mMA==
X-CSE-MsgGUID: 4IGblNaeQRug1ua2/zXNeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="54806185"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; d="scan'208";a="54806185"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 02:39:24 -0800
X-CSE-ConnectionGUID: m5FSWoR4TRq4pQUx41As6Q==
X-CSE-MsgGUID: ZaC0iBgCTnqD62OoANy0JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; d="scan'208";a="135944608"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:39:23 -0800
Date: Wed, 15 Jan 2025 11:39:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t v1 1/1] tests/xe_eudebug: check if driver is open
 before toggling enable
Message-ID: <20250115103911.hvluxuonp3it2biu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jan Sokolowski <jan.sokolowski@intel.com>
References: <20250110125201.59630-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110125201.59630-1-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-01-10 at 12:52:01 +0000, Jan Sokolowski wrote:

please improve subject, it should have 'intel' there:

[PATCH i-g-t v1 1/1] tests/intel/xe_eudebug: check if driver is open

> In some cases, ccs_mode_all_engines can fail,
> which will cause test fixture to not execute properly
> and skip drm_open_driver, thus putting the test
> in an unstable state.
> 
> Check if driver is open or not and reopen if necessary.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 22b0da658..6d06ed647 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2868,7 +2868,16 @@ igt_main
>  	}
>  
>  	igt_fixture {
> +		/* in previous subtest group, ccs_mode_all_engines can fail,
> +		 * which will cause test fixture to not execute properly
> +		 * and skip drm_open_driver, thus putting the test in an unstable state.
> +		 * Therefore, check if driver is open or not and reopen if necessary
> +		 */
> +		if (fcntl(fd, F_GETFD) < 0)
> +			fd = drm_open_driver(DRIVER_XE);

This looks strange, imho you should correct fixture and make
those opens for ccs in a test itself, not making corrections here.
imho also there should be a var to cleanup ccs mode after that
previous test so it will not affect other tests.

> +
>  		xe_eudebug_enable(fd, was_enabled);
> +

Please do not make unrelated code style changes in other places.

Regards,
Kamil

>  		drm_close_driver(fd);
>  	}
>  
> -- 
> 2.34.1
> 
