Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BECEC01BA
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 10:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF33E10E4BA;
	Mon, 23 Mar 2026 10:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6Y8duwm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6C710E4BA
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774260089; x=1805796089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=881FLnLh/Xc8nQVzlmbiI9VISi6Ab/80Gn1Lrukc46E=;
 b=h6Y8duwmbKPPkWPpNFHfy3Phv59PlGTk0pslaSH5Nx3ejANKLeuIEyeP
 zMm4KY6Up2mSfQY3kJ1h4jn+SyG1qHUbNQdW3y+7qkjmWTL0WHHrg1hJw
 4/pcrrMUI7SRwTIwdzz2xDsZsKRu5/JAX49bunDIttE17jwhJ0Yk/uJjf
 HG4zqBPGxvC0y0Z6acqpmZvz7MIvB2gK/giwjYxb86IyKTgbXb4Njh3cN
 e4o+mopccTqUtd45yOQIyZPdBhttprn8HOzV86J1QtbpLPbr1h5Vr/J1T
 T5lE09ezq5aLSe01opT1M+j6Uvepxdp/UinYX6ICRwoyZQUZesl4OGrTm w==;
X-CSE-ConnectionGUID: RoMLS6ZpQoOxMrH4ibHQ8w==
X-CSE-MsgGUID: FcUkOxfrQLKyrt9oFfY9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75159983"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75159983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 03:01:28 -0700
X-CSE-ConnectionGUID: /vtNRkAyQi2cPnJmwWHBSg==
X-CSE-MsgGUID: hbABnmn0Qu2up9u8+6zgIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223050338"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 03:01:25 -0700
Date: Mon, 23 Mar 2026 12:01:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 vinay.belgaumkar@intel.com
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
Message-ID: <acEPc8IixAYNuP5U@intel.com>
References: <20260323070228.1383377-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323070228.1383377-2-sk.anirban@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Mar 23, 2026 at 12:32:29PM +0530, Sk Anirban wrote:
> Fix the unit mismatch caused by interpreting seconds as milliseconds
> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
> to ensure correct unit handling.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 61b63ed4f..46718a444 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>  		 * elapsed time during suspend is approximately equal to autoresume delay
>  		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
>  		 */
> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
> +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;

Why doesn't the test actually measure this?

>  		residency_start = read_idle_residency(fd, gt);
>  		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>  		residency_end = read_idle_residency(fd, gt);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
