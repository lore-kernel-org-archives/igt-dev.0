Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D953EF8FE7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 14:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D4910E9FB;
	Wed,  4 Mar 2026 14:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwxK6lwQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE8910E9FB
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772633700; x=1804169700;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PAT16nLu8JPFziHyUWjMsg4VVLqTyJ4B8KIpA9Bd/Is=;
 b=GwxK6lwQOe9GsQo8nVYCInA+rUMUZpZYyCA/TWoxfyCrOFGxOIwM2X/w
 V1KBHviGtqUwBmDhpGCBA9lU/Y15lH9BJg/dMQtjEpMh7RooTxFKexqLY
 qQBzoM3glGuWN8WXPKooVObxvrWL51GAvUp8I++YdZwugYkllPGW8qVYT
 A9lqtltRD40/tH2i/INdmMN4444Ih9EfPntvDFD3Y/4h/UVEo56p6ggp9
 TJsNqVe2QyY+M3FetgFUO+7QHvhCLTzjkRb/CHKBzcKKmBwOBxVlLbvfB
 5tGPFf89k7MpsFLNVKEmsHJ1/4jAAN1tjRih4MORqGYaSdKuayhmobtME Q==;
X-CSE-ConnectionGUID: g6jalRoRTWOaiZo/dVwX+g==
X-CSE-MsgGUID: Hpcuv7apRqebEcJ8dt4yPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72890702"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72890702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:14:59 -0800
X-CSE-ConnectionGUID: 2jWrsqmQRj+Cxs4uo4xwkA==
X-CSE-MsgGUID: oeUeMOjOS9GtNORd8uc7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="223017626"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:14:57 -0800
Date: Wed, 4 Mar 2026 15:14:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: sumit kishore <sumit.kishore@intel.com>
Cc: igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t v1] tests/kms_plane_alpha_blend : print reason for
 test skips
Message-ID: <20260304141454.irvwxxvnv2qiabt5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 sumit kishore <sumit.kishore@intel.com>,
 igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com
References: <20260303132313.225994-1-sumit.kishore@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303132313.225994-1-sumit.kishore@intel.com>
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

Hi Sumit,
On 2026-03-03 at 18:53:13 +0530, sumit kishore wrote:

please no space before ':' in subject, this should be:

[PATCH i-g-t v1] tests/kms_plane_alpha_blend: print reason for test skips

Btw, better subject:

[PATCH i-g-t v1] tests/kms_plane_alpha_blend: Add skip on headless machines

> Print debug message when tests are skipping on headless display systems

Add dot at the end of sentence. Also, you added a skip, so also mension it
in description. Above could be fixed at merge, LGTM

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 41a3b71c3..82d8eac62 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -753,9 +753,11 @@ const char *help_str =
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	data_t data = {};
> +	bool active_display = false;
>  
>  	igt_fixture() {
>  		igt_crtc_t *crtc;
> +		igt_output_t *output;
>  
>  		last_pipe = 0;
>  
> @@ -764,6 +766,13 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		igt_display_require(&data.display, data.gfx_fd);
>  		igt_require(data.display.is_atomic);
>  
> +		/* Check if at least one active display connected */
> +		for_each_connected_output(&data.display, output) {
> +			active_display = true;
> +			break;
> +		}
> +		igt_require_f(active_display, "No active display connected, skipping test\n");
> +
>  		/* Get active pipes. */
>  		for_each_crtc(&data.display, crtc)
>  			active_pipes[last_pipe++] = crtc->pipe;
> -- 
> 2.43.0
> 
