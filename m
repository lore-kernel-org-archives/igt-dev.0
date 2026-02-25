Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F16DFD375F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 13:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482410E105;
	Wed, 25 Feb 2026 13:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNY+6Ylx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD12D10E105
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772027613; x=1803563613;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=sV0oLIN14u10Xxob9wWa/NooH5elAqE5FHChKkGOxt4=;
 b=KNY+6YlxB2PDoDHSP5JrKL8tP5qGGrHrGmI/6xFrlGbKZ29rjk60F24x
 JfvlFJ+m94J0k6/nRjGvZv50+VlyNv9AdahqSf9GiGBl6s2rxuKtrba/7
 pUCSWxyKwF6WZX6P8i5mqq5bCjM+ndNcuHUDh6Pma5xOFUVuaL2yKBnCu
 mnYjtvQhADQDJAb1LknfsPvBNlJxUOhKx9QVsOVuOGeY4i6gKJX6QHpxP
 T6hbWkA+Kb//yw4i+r5kM3zxlpweMIQP6eFujE6JbVVUBW7Sq9dWlGUIz
 smZVU+VNQzHO7k/S4A5SwBgKtZ9OqZXS/90k7ktI43WUNp6+J+NsxOuR+ Q==;
X-CSE-ConnectionGUID: nAkLKsCKSWypgHiFiSkXAQ==
X-CSE-MsgGUID: oP5kMl1qQb6985O5r8e4zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75671273"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="75671273"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:53:33 -0800
X-CSE-ConnectionGUID: I85IRhCtTzi9/Xo0J404Nw==
X-CSE-MsgGUID: SnEcyI8NRPmGgpZlkof/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213354077"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:53:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/19] tests/kms: Use for_each_plane_on_crtc()
In-Reply-To: <20260225125108.31119-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
 <20260225125108.31119-13-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 15:53:29 +0200
Message-ID: <8578893c693fdb566c2c551d0428bc4f978b70d8@intel.com>
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

On Wed, 25 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index b109766fc4f0..400174faef33 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -97,8 +97,9 @@ static void do_cleanup_display(igt_display_t *dpy)
>  	igt_plane_t *plane;
>  
>  	for_each_crtc(dpy, crtc)
> -		for_each_plane_on_pipe(dpy, crtc->pipe, plane)
> +	{for_each_plane_on_crtc(crtc, plane)
>  			igt_plane_set_fb(plane, NULL);
> +	}

There are a handful of places where cocci really screwed up with the
curly braces. With them fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel
