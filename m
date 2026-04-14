Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EAEED7B9C
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 10:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483110E34F;
	Tue, 14 Apr 2026 10:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIx269Px";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E6810E34F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776163897; x=1807699897;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KjnhUTSsqKs12m/zi5mxp8aK4SlGw9Ll4vkA7jXKASA=;
 b=FIx269PxYDOFvhoDcF3IAmhF1xeK8Tsia+dX/F8Lps20MtfvvlffVQt4
 4C8iDgys4affhmdSBdcPUsgN51NO3OBw8xflGXzF9b5iVmvXfbFqPXRtp
 BU7Y1Xjp0dh7G9zc1c1rI490+oCexnjd4Y2O+JadkkGH+i3mG/sKHB6YT
 pgA9tKzh45i5CsIZaGs0xM+aS9OX2utIWVv1+zeddNYOaOtEn4SlulW4D
 fm2CHFvdVjtEcJAjOZN9d9qNWCGCuphgBpB1zl9XkB0BmiZFq+X23MOB/
 chz0A5QsciLay37Lw6GW3LjHw3P0DTjWPwOIkpCSYxi/7+5wAme+NGsue g==;
X-CSE-ConnectionGUID: D96M5NdMS+yxTY33Hh6/Wg==
X-CSE-MsgGUID: ih13AqBWQJ2djnYcqL2Hvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77299241"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77299241"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 03:51:36 -0700
X-CSE-ConnectionGUID: t/NfF9XfTfmpkfjtF8dU6w==
X-CSE-MsgGUID: Ee/6djsbSoad0fSiiUi3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234458455"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 03:51:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2 1/4] tests/intel/kms_pm_dc: Replace require
 with proper assertion
In-Reply-To: <20260414095014.55950-2-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260414095014.55950-1-jeevan.b@intel.com>
 <20260414095014.55950-2-jeevan.b@intel.com>
Date: Tue, 14 Apr 2026 13:51:31 +0300
Message-ID: <e650ce83d43adb273031ff62f8722b091d2ff338@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 14 Apr 2026, Jeevan B <jeevan.b@intel.com> wrote:
> The DC3CO video playback simulation test was incorrectly using require at
> the end to check if DC3CO state was entered. This causes the test to be
> marked as SKIP instead of FAIL when DC3CO doesn't work properly, hiding
> real issues. So changing the call from require to assert.
>
> Fixes: b89efa8048e58 ("tests/i915/i915_pm_dc: Check dc3co count to skip the test")
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 8138933d4..f1380ea69 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -312,8 +312,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>  		usleep(delay);
>  	}
>  
> -	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO,
> -					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
> +	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);

Might rename these check_ functions to assert_ as a follow-up, because
"check" doesn't say what they actually do.

>  }
>  
>  static void setup_dc3co(data_t *data)

-- 
Jani Nikula, Intel
