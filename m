Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC8FC021A6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529FC10EC4B;
	Fri, 14 Feb 2025 10:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYUVadf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FAD10EC4A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739529947; x=1771065947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5dHmiWdVKAxkaUepxCCRLcV9jiN1RhVT4AYj7vFaEgI=;
 b=LYUVadf/TPKW1qa7Kl0XkbVsIR7uQihmITlxlB+Q5wEiJZDOT48joyc8
 ddqcwcL1JHn8Cw4DoQEddAd5zP2Jtwi/g/jAMgYmmskUexcfAZ/61ZLh+
 O7fDOh3HYRDz5TdHewiS1NEHnFKyyviqhv/kE5FQnF4Xko+7Z0NndjfaE
 yri0tlqMGnljs54brTggw9Kw+1GG8DA32hCIBf0BX/csTykIQjHa2HCrC
 8PzxYdZqgS8GCPyxagz6RZbqc/1plkJ1SJUdBmGZILfOL8QdSGyhoyAte
 e3mzBPziBgB1JagAejKvxrURxgv0vsRkvtlguyUw7U1I61jom+jHsI8AD Q==;
X-CSE-ConnectionGUID: BFL+e+v3QziaPfjwaWf9ng==
X-CSE-MsgGUID: XoDg6XjdSUmA4Q0ee2VmFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40138766"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40138766"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:45:47 -0800
X-CSE-ConnectionGUID: whEuy7ubRLS+kROhF9cF2Q==
X-CSE-MsgGUID: P3TAU3lrTnaHSn1nzd85yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113403940"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:45:46 -0800
Date: Fri, 14 Feb 2025 11:45:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add kms_sysfs_edid_timing to
 blocklist
Message-ID: <20250214104530.gsqrch2pg6h6owdg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250213132802.357921-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213132802.357921-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2025-02-13 at 18:58:02 +0530, Swati Sharma wrote:
> Add kms_sysfs_edid_timing to blocklist. Test was written with the
> idea that edid read shouldn't take an unreasonable amount of time.
> The timeout is an arbitrary value because it depends on when the
> display responds and, in some cases, especially when the display
> is coming back from sleep, it can take quite a while. This test
> has sporadic behavior across various platforms connected to
> different displays.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Could such measurements be moved to tools into some generic one,
like display_wakeup or display_response?

Regards,
Kamil

> ---
>  tests/intel-ci/blacklist.txt    | 10 ++++++++++
>  tests/intel-ci/xe.blocklist.txt |  9 +++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 1236b8280..9917bf46a 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -151,3 +151,13 @@ igt@kms_ccs@.*-4-tiled-xe2-ccs
>  igt@kms_frontbuffer_tracking@plane-fbc-rte
>  igt@kms_pm_dc@deep-pkgc
>  igt@kms_vrr@cmrr
> +
> +###############################################
> +# Test was written with the idea that edid read shouldn't take an
> +# unreasonable amount of time. The timeout is an arbitrary value
> +# because it depends on when the display responds and, in some cases,
> +# especially when the display is coming back from sleep, it can take
> +# quite a while. This test has sporadic behavior across various
> +# platforms connected to different displays.
> +###############################################
> +igt@kms_sysfs_edid_timing
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 6964628f1..80ceba9a5 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -80,6 +80,15 @@ igt@kms_pm_rpm@cursor.*
>  ##################################################################
>  igt@kms_prime@.*
>  ##################################################################
> +# KMS: Test was written with the idea that edid read shouldn't take an
> +# unreasonable amount of time. The timeout is an arbitrary value
> +# because it depends on when the display responds and, in some cases,
> +# especially when the display is coming back from sleep, it can take
> +# quite a while. This test has sporadic behavior across various
> +# platforms connected to different displays.
> +##################################################################
> +igt@kms_sysfs_edid_timing
> +##################################################################
>  # KMS: Non-Intel tests
>  ##################################################################
>  igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
> -- 
> 2.25.1
> 
