Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A0D78799
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07710E9FA;
	Thu, 21 Nov 2024 17:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewVst54M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5535910E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209237; x=1763745237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DCHeSD4Rhihwyq9ByIjlEpXRJBG0asZv7Y7eptrgUdw=;
 b=ewVst54MO9ScUIhwqSEWHRkDtKjxXsts93kCnfJIljShqIU20EXwZSvS
 XqnGoX4nbGt4kZWcMyBaUsRMTeQp+T/Q8i2aJAGHGUSDvwL9hF7uHw4ZE
 RpZGpaE1u6hA2qs08vrH4ubXXihVkwZ114qICt38KvCNZao2br3Yxubnb
 wt5KK0rrhLAlWNvGnYhEjfSowJ2y6vdt1wNjqJpmWBbthiSg5+fGlujJw
 pJ+I9puKZJUj5KXol+GrIoyviFi1q5t9+UO8i6FrTFgflxQEPejV4JVtW
 ehAVnw2ifili+qnafHqv8sWKRzM/vRhhbLj+CQy9l/e4bdJ0dvDyjwEa2 w==;
X-CSE-ConnectionGUID: iwzdyep7S5Kc229cFCfyRw==
X-CSE-MsgGUID: oJB+RL5eShyTEAK0wsgIsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42953442"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="42953442"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:57 -0800
X-CSE-ConnectionGUID: 3woxwlQTRkS+6Yb3GCNLkA==
X-CSE-MsgGUID: ImNABliRSHq2kg4+WUBGHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95365448"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.122])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:55 -0800
Date: Thu, 21 Nov 2024 18:13:52 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/intel_device_info: Use per-thread device info
 cache
Message-ID: <20241121171325.fqajqkaaq2n5jj7g@zkempczy-mobl2>
References: <20241120223546.145304-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241120223546.145304-1-matthew.d.roper@intel.com>
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

On Wed, Nov 20, 2024 at 02:35:46PM -0800, Matt Roper wrote:
> Relying on static variables to act as a cache inside the device info
> lookup function is racy for multi-threaded tests since there's only one
> copy of the static variables shared by all threads.  E.g.,
> 
>     Thread 1                Thread 2
>     ========                ========
>     cached_devid = devid;
>                             if (cached_devid == devid)
>                             return cache;
>     cache = ...
> 
> Indeed, running xe_exec_threads repeatedly turns up cases where the test
> fails with "Platform is missing PAT settings for uc/wt/wb" because a
> racing thread wound up getting 'intel_generic_info' rather than a proper
> device info structure (although it can take a couple thousand tries to
> hit this specific race condition).  CI also sees this from time to time,
> but the bugs often get closed as "cannot reproduce" because the failure
> rate is so low.
> 
> We're probably going to be reworking this code completely in the
> not-too-distant future since we really need to be looking things up from
> the GMD_ID query rather than using hardcoded device ID table lookups,
> but for now we can apply a quick fix of just making 'cached_devid' and
> 'cache' thread-local so that we're not racing on a  shared copy.  Simply
> swapping the order of the assignment of 'cache' and 'cached_devid'
> probably would have also worked around the specific race condition noted
> above, but it would have left tests susceptible to other race conditions
> in cases where a multi-threaded test is actually looking up different
> device IDs / GPUs in its multiple threads.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1600
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1535
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3236
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/intel_device_info.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 546b9c65a..d38dc415d 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -658,8 +658,8 @@ static const struct pci_id_match intel_device_match[] = {
>   */
>  const struct intel_device_info *intel_get_device_info(uint16_t devid)
>  {
> -	static const struct intel_device_info *cache = &intel_generic_info;
> -	static uint16_t cached_devid;
> +	static __thread const struct intel_device_info *cache = &intel_generic_info;
> +	static __thread uint16_t cached_devid;

Makes sense, parallel access to same area when more threads may
overwrite this while others are reading is racy:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	int i;
>  
>  	if (cached_devid == devid)
> -- 
> 2.47.0
> 
