Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF71AC61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 14:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D8B10F25B;
	Wed,  2 Sep 2026 14:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4NEwqEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BD110F22C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360320; x=1819896320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=882SkEkTJMo6QurSNVYT6NEvK/XG+wSra9UTXCWepyQ=;
 b=j4NEwqEq7OB5C0dVIGXoeQoUoBuWhGLL/JPQr6gRRgOrUWQZOME0+oMZ
 ZETlSKP6BiVlG/Ri/0gvIPRsnbjHTjEGRgxrcwyWIJ5b9UtBhPlGqgVfA
 Je0hbnO4DJsZvuNvgRCrAiBqsXegMJJhQ2HWeKhPBnMZjZwwk8Dq78Cyo
 Clez7vMtJNb+bMT5KzV7lpjI/o8NGiUWlRkujBWn16/5IWPGShedfvBMy
 99aJRgfkTEA9PrJysHAKW+imrTKvTbif30iDZNsT+0vbeE+m+Znrq2ZSC
 iE+KowWIlplMQdrXcNB0ngQDYOtRPiItAKhWBLOuxiPwzW2zXL2wXnVBW A==;
X-CSE-ConnectionGUID: mcP666z4R6yxt6M6JgfImA==
X-CSE-MsgGUID: Qb1gybLLQQ+ZqERH9ec9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87757912"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="87757912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:45:20 -0700
X-CSE-ConnectionGUID: wgru6PClRnmeZJkXZAKTYg==
X-CSE-MsgGUID: WiCe2B/FQ+mgkE0EtLV/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266190430"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 07:45:19 -0700
Date: Wed, 2 Sep 2026 16:45:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_joiner_helper: iterate CRTCs
 instead of pipes
Message-ID: <20260902144516.2zpativ7ii32zsdv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <cover.1788252273.git.jani.nikula@intel.com>
 <a9a1b7c524e682ec6e1a8a7dd12534f661ac598a.1788252273.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9a1b7c524e682ec6e1a8a7dd12534f661ac598a.1788252273.git.jani.nikula@intel.com>
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

Hi Jani,
On 2026-09-01 at 11:46:38 +0300, Jani Nikula wrote:
> Reduce the direct pipe usage.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/intel/kms_joiner_helper.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index da0ac7f624f3..5bacf6cb9e27 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -101,13 +101,14 @@ static enum pipe get_next_master_pipe(uint32_t pipe_mask)
>   */
>  void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  
>  	*master_pipes = 0;
> -	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> -		if (igt_crtc_for_pipe(display, pipe) && igt_crtc_for_pipe(display, pipe + 1)) {
> -			*master_pipes |= BIT(pipe);
> -			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> +
> +	for_each_crtc(display, crtc) {
> +		if (igt_crtc_for_pipe(display, crtc->pipe + 1)) {

I am not sure here as this is not 1:1, original code has two
conditions. +cc Swati and Karthik.


Regards,
Kamil

> +			*master_pipes |= BIT(crtc->pipe);
> +			igt_info("Found master pipe %s\n", igt_crtc_name(crtc));
>  		}
>  	}
>  }
> -- 
> 2.47.3
> 
