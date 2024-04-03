Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8DBCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 18:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F32A11281E;
	Wed,  3 Apr 2024 18:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/8zDLja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6728112819
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712168344; x=1743704344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=//cwaTIpEmbvdH4xWfFtvuHgtdIw2iUnauVhHnDe/NM=;
 b=k/8zDLjaQAXqEd/iSalXKm4+leWw88aAoMCPALAcGqgNf8Yf7AJjJ9F/
 SklTGpNvEucgNqLt2ACWDbMIdNiirm1seDV3mYZgDimxMtZQyJcxVr1zD
 ipeoxCpp5R4WkCEBHQBmOzBJGuePoR4TJBA8GW0vkSQFC3fgsQQnRLC0I
 Mlioaec1fJkrSqFN/ABZFy0+9Rj8IAbYj/XbFR056aNzGAApQxVG+TYv+
 Ogwv45xeIyQzeigTdHEaPrc6UCDeQ0JFcy8FVx5KhrtorUxgLu3Ow7Gye
 tVkLaQ9qae9lGZbmGzMGK81ltHRiCql19zSNuzXd74bR0T9nFoZ2y+Usc w==;
X-CSE-ConnectionGUID: QxlGLBfjQiO6ExgJFKrg3w==
X-CSE-MsgGUID: Oda0ADqiSYKq/p5lGtbBgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7654928"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7654928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 11:19:02 -0700
X-CSE-ConnectionGUID: W2flD95BTzKDtFd4PllxPw==
X-CSE-MsgGUID: bufaFBAFRtacfXWIwqh8SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23205432"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 11:19:01 -0700
Date: Wed, 3 Apr 2024 20:18:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tools/gputop: Fix engine columns with amdgpu
Message-ID: <20240403181858.kqf2r53zj7l332nu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20240403150057.25765-1-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403150057.25765-1-tursulin@igalia.com>
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

Hi Tvrtko,
On 2024-04-03 at 16:00:57 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Amdgpu kernel driver skips output of fdinfo keys for unused engines. That
> is completely legal but corrupts the column formatting in the current
> code.
> 
> Fix it by simply treating change in detected engines used by a client
> as trigger to re-emit a new header. This ensures columns are always
> correctly aligned, albeit with a cost of potentially duplicating the
> header for the same DRM minor.
> 
> This is considered good enough for a reference implementation. The
> alternative would be to add some real per DRM minor state tracking which
> sounds like an overkill, at least until gputop gains a nicer (any) UI.

+Cc few amd devs:

Alex Deucher <alexander.deucher@amd.com>
Christian Koenig <christian.koenig@amd.com>
Vitaly Prosyak <vitaly.prosyak@amd.com>

Change looks ok so from me:
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  tools/gputop.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 71e28f43ee4c..76075c5dde8b 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -119,11 +119,36 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>  	return lines;
>  }
>  
> +static bool
> +engines_identical(const struct igt_drm_client *c,
> +		  const struct igt_drm_client *pc)
> +{
> +	unsigned int i;
> +
> +	if (c->engines->num_engines != pc->engines->num_engines ||
> +	    c->engines->max_engine_id != pc->engines->max_engine_id)
> +		return false;
> +
> +	for (i = 0; i <= c->engines->max_engine_id; i++)
> +		if (c->engines->capacity[i] != pc->engines->capacity[i] ||
> +		    !!c->engines->names[i] != !!pc->engines->names[i] ||
> +		    strcmp(c->engines->names[i], pc->engines->names[i]))
> +			return false;
> +
> +	return true;
> +}
>  
>  static bool
>  newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
>  {
> -	return !pc || c->drm_minor != pc->drm_minor;
> +	return !pc || c->drm_minor != pc->drm_minor ||
> +	       /*
> +		* Below is a a hack for drivers like amdgpu which omit listing
> +		* unused engines. Simply treat them as separate minors which
> +		* will ensure the per-engine columns are correctly sized in all
> +		* cases.
> +		*/
> +	       !engines_identical(c, pc);
>  }
>  
>  static int
> -- 
> 2.44.0
> 
