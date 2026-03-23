Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CD8EC01AF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E6A10E33D;
	Mon, 23 Mar 2026 09:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6chSp4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEE310E349
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258210; x=1805794210;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ix4suICB1ND8ThvIKj4NWIWptsRWbik5kaug77FjBcs=;
 b=k6chSp4GA71PuBjd5/etIzDQTfXtOtkYCK6JKoS64xeec03O0Y4UgpAb
 dwYQv5XvtcBZlinE7jqsr5CRW5tRyLOw6hBWsT6H1xcx2BftQPwWnarTO
 GNrebf23gFpc+4OcTuwHsAPU6opeOBIhJ8woQkDGyVwV1MyrS0+bq1tqH
 2StiBL4kJZYH+KL+6wbCtqIZrtLoMUZPL1QtGEgiRBypn3fZ2kg1tJ5Z+
 k09mU0mfWhXyMP5I8UjckLAsIbLuj1BKExo+9yjN9Bqde1BETZfTBnrNE
 3JewW1WkJKDXQOeZeoFwdR+GCbosCZtctVbsztd6Q7/S0orppII7hGhza w==;
X-CSE-ConnectionGUID: Qrfv6lquRxecGexnwimohg==
X-CSE-MsgGUID: 40H93flhS6eszND1RVLDXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74960063"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="74960063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:30:10 -0700
X-CSE-ConnectionGUID: l2Ia1vn8QW+mE6FDLwGsXA==
X-CSE-MsgGUID: BA+aLL4VQquT9xLalC3WRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224186638"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:30:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 vinay.belgaumkar@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
In-Reply-To: <20260323070228.1383377-2-sk.anirban@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260323070228.1383377-2-sk.anirban@intel.com>
Date: Mon, 23 Mar 2026 11:30:02 +0200
Message-ID: <a59e6c3b70eccfa43a5902bb089f9e799b1df68a@intel.com>
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

On Mon, 23 Mar 2026, Sk Anirban <sk.anirban@intel.com> wrote:
> Fix the unit mismatch caused by interpreting seconds as milliseconds
> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
> to ensure correct unit handling.
>

Fixes: ?

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
>  		residency_start = read_idle_residency(fd, gt);
>  		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>  		residency_end = read_idle_residency(fd, gt);

-- 
Jani Nikula, Intel
