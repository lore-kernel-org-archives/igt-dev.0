Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11508CD6E69
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 09:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86083113C9A;
	Wed,  3 Jun 2026 09:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNvnNeCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753EF113C94
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780478045; x=1812014045;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=56m9SW+ZCc2v2VgNuRlSHGIUuJ8y3kzw3ezUsfByes4=;
 b=XNvnNeCJxOhim3T8LeXum1UVgftUJWuDI2TmTZkl/cG8eQMhpi+oAoGH
 88KExUeW0cFBEZ5Gk0WrViU6M/sgUba/3vCDHZfiPo1oK18V4/P+Xeien
 cPf3bUwNla4uX5X7y4w95wr6fOx49r84OLCLkdUjAqVKS9gKuwPS1u66c
 Zgt+Dt0sM0OmTncTBIPXpbKXWx44I+0+Fe2J/EFpnXnowIX3eYzYXJqc4
 QbWiIaGnai68XTdNJNNyu7Ej6UDbFSHgEQ3z4VnpcjOoHn8oSUhYrmYLT
 yTklOUUwlDJi9y3kkZYMDQOEBSaYqSC6HCHwrf5ri+wwbKbL15EwkYHgz A==;
X-CSE-ConnectionGUID: lFOHzXe/Q0eIxsBxfa73fg==
X-CSE-MsgGUID: 2Oa9wFEASjuuXqyWTIKwoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657869"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="92657869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:14:05 -0700
X-CSE-ConnectionGUID: s1wiOnElQBujL4Wtk/PPeg==
X-CSE-MsgGUID: VjjxVB6CTZ2j9JT6IS5W6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="239706035"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:14:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
In-Reply-To: <20260603073606.2168574-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260603073606.2168574-1-jeevan.b@intel.com>
Date: Wed, 03 Jun 2026 12:14:01 +0300
Message-ID: <1c24b284f0559a5ae985ddedc833c0db086f59b4@intel.com>
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

On Wed, 03 Jun 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Use '>=' instead of '>' so modes equal to max hdisplay or dotclock
> are considered for bigjoiner.

I can see that from the code changes.

Why?

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0f1ce03a9..e5ffaeac1 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6946,8 +6946,8 @@ static int get_max_pipe_hdisplay(int drm_fd)
>   */
>  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>  {
> -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
> -		mode->clock > max_dotclock);
> +	return (mode->hdisplay >= get_max_pipe_hdisplay(drm_fd) ||
> +		mode->clock >= max_dotclock);
>  }
>  
>  /**

-- 
Jani Nikula, Intel
