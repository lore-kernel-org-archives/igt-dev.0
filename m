Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A22C021A1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 09:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBF010E46C;
	Tue, 11 Feb 2025 09:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYO531Wr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF92510E46C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739265676; x=1770801676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QTLuD4XHzE7O+JxANHfcsIxInFIF1Io2L+RK8PYI44s=;
 b=VYO531Wr1ikHkMmSqzcKn17KGvuQ/S2QVLo6vk9tj32fUuOZIX9XczeX
 Tk8Ysi/362RrEjKmjh8jW1YxDcUs2m6GcT/7+sP8w8wqy4ZcHjZCfe0HV
 V+Anr7goePkDG4GedQL74lUD1wXWCjJTZfbmMgAnBXDQtbfF6bRaA4FsA
 DmQ/VPgNpGk51Z9EyZLgQA1ItKg6r79WUkv4pCuO+SOTu4Zm/lVurZCc1
 aJ5mpUJo+5bj9Zo95W0r3Y06e/5XeQHpF7mawj6oSKabmPMwOk03aL56K
 otiLFa9AqNbX2+XR9SUjkH6/KPajb09+O2CVW0z4MvKowPE0kG8TsfjoF Q==;
X-CSE-ConnectionGUID: o9io5eKjR0y4WQwfOF2bBQ==
X-CSE-MsgGUID: I/Mkw7wzSTO8My8Yfb40xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39760128"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="39760128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:21:12 -0800
X-CSE-ConnectionGUID: B3I47QNXQeSo6bNln5wISg==
X-CSE-MsgGUID: dhB76ZjGSmC0ZUNkUmPddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135705589"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 01:21:10 -0800
Date: Tue, 11 Feb 2025 10:21:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 juha-pekka.heikkila@intel.com, katarzyna.piecielska@intel.com,
 ryszard.knop@intel.com, ewelina.musial@intel.com,
 adrinael@adrinael.net, mateusz.grabski@intel.com,
 konrad.b.brodzik@intel.com
Subject: Re: [PATCH i-g-t] Bump aborting on network failure deadline to 40
 seconds
Message-ID: <20250211092108.enj3kzrlh3rzh6rk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 juha-pekka.heikkila@intel.com, katarzyna.piecielska@intel.com,
 ryszard.knop@intel.com, ewelina.musial@intel.com,
 adrinael@adrinael.net, mateusz.grabski@intel.com,
 konrad.b.brodzik@intel.com
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206152147.209277-1-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-02-06 at 16:21:47 +0100, Peter Senna Tschudin wrote:
> Commit ddfde25f16ba ("runner: Add support for aborting on network
> failure") introduced a 20 second deadline for the DUT’s network
> to recover after a suspend/resume cycle. If the network isn’t
> back up within that time, igt_runner aborts the test run to save logs
> and prevent potential log loss from an imminent power cycle.
> 
> This deadline was set to accommodate our internal CI system, which
> checks for DUT network connectivity every 5 seconds and retries up
> to 3 times at 20 second intervals. If it fails 3 consecutive checks,

This is a little confusing, you wrote in first paragraph about
20 second deadline and here it looks like 60 seconds (3*20).

> it triggers a power cycle on the DUT.
> 
> Although our internal CI system can be configured with a longer
-------------- ^^^^^^^^
Remove this.

> wait time, extending it further would unnecessarily prolong tests
> in cases of DUT hangs.
> 
> Bumping the deadline to 40 seconds keeps the abort mechanism safely

imho this should be option for igt-runner, I would prefer to not
adjust it later, let CI team tune it. Option could be either time
or retry counter or both.

> within our internal CI system retry window while improving chances
> of preventing a premature abort. For upstream testing on Jenkins,
> the deadlines vary from 16 and 25 minutes, and this change has
> no impact.
> 
> CC: juha-pekka.heikkila@intel.com
> CC: katarzyna.piecielska@intel.com
> CC: ryszard.knop@intel.com
> CC: ewelina.musial@intel.com
> CC: adrinael@adrinael.net
> CC: mateusz.grabski@intel.com
> CC: konrad.b.brodzik@intel.com

imho better here 'Cc:'

Regards,
Kamil

> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  runner/executor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 999e7f719..2abb18732 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -218,11 +218,11 @@ static bool load_ping_config_from_env(void)
>  
>  /*
>   * On some hosts, getting network back up after suspend takes
> - * upwards of 10 seconds. 20 seconds should be enough to see
> + * upwards of 10 seconds. 40 seconds should be enough to see
>   * if network comes back at all, and hopefully not too long to
>   * make external monitoring freak out.
>   */
> -#define PING_ABORT_DEADLINE 20
> +#define PING_ABORT_DEADLINE 40
>  
>  static bool can_ping(void)
>  {
> -- 
> 2.34.1
> 
