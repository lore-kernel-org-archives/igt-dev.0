Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BB1C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 10:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9EA10EB9D;
	Wed, 19 Jun 2024 10:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5iZnCTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410AF10EB9D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718791397; x=1750327397;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9yIsXExdaREbBmUL3Q/MxP7LTOg6sFklyYbGmBbb1yk=;
 b=k5iZnCTth0myLKSVF8MVuBttreYjv54YF0BsTx2FG5nQCq1mJNq7vRn2
 C3DN3tIZvibQvjgxXlQ6AhjDE5+Qd3pE+VVU5aNJsVin4YS3v5xkXLQeu
 /e/5gZb3WMzFP0skvUVkw9g9YTyTInv+E01B9ysc1uS1MdZkUMUYKMwym
 NebtSmJA1nNeoQyHQQwsiFVwpRF0MLTV6pMSGawfBQgCf/8su7xYeHaF8
 IM7njiqP7G33rPX3ETJFnyQxQeB3+g7YoXZ9iaXPwYJTdIROaVvfBXBWJ
 qv8r/JQuhLRQ2ItEWeQLoOQg2RK5IDx+XXChOqMI64tF6iciL1gwIowim A==;
X-CSE-ConnectionGUID: sUzGtDJbSPqO9Q9CBuvyWw==
X-CSE-MsgGUID: 8tLxS0vRSdiFpg1JtW8o/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19500594"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="19500594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:03:15 -0700
X-CSE-ConnectionGUID: 0xuON37KRIeTKC+zstEjig==
X-CSE-MsgGUID: /rCnMkLuS9WuFAoarhsOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46239253"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:03:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t] tests/intel-ci: Block unsupported KMS tests for i915
In-Reply-To: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
Date: Wed, 19 Jun 2024 13:03:10 +0300
Message-ID: <87frt9fdwh.fsf@intel.com>
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

On Wed, 19 Jun 2024, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> Block KMS tests those are specific to (display_ver > 14)
> are not applicable for i915.

Feels a bit wrong to list features like this in a block list. IMO the
tests themselves should be aware of what's supported and what's not. I
imagine the rationale is performance? What's the impact?

BR,
Jani.

>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index f6e9bb474..d01ef5e16 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -140,3 +140,6 @@ igt@device_reset@reset-bound
>  
>  # not working for i915
>  igt@kms_bw@.*
> +
> +# Tests specific to (Display_ver > 14) are not applicable for i915
> +igt@kms_vrr@cmrr

-- 
Jani Nikula, Intel
