Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F9BC67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 18:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF10710E28F;
	Fri,  5 Apr 2024 18:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlajZ+7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C6410E28F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712343491; x=1743879491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G1uL/mUaCWVvE/dbotqTPi+zpIKFM9Uk1uEhxk2oi5I=;
 b=UlajZ+7V5MgSRSeDUtnlAveEG1HvRPA9YVYfgkWSITgAuIJqF2QSdoon
 Q66xutCxaJ8eRvIGhVrnRDaWXK7alnrNAwXkSLARlOyT2nEsleQnPd0Lw
 J/Wustr9D+lr9VrDgGupRDuRqWDx4fGLOWuS3w6SkYsQXMOogpNQopv+i
 yBhymr3jKCP2KnA9i7jRtdDws0A+NdgxMimobg3vL6J+47Fj5Ua4pnqUL
 2cPVhOOtzU/vtDImhBiQrkuRipap5723j5oExk/MUDff+7nPaAspVrtNx
 pY59SiZHH7OeJSA/Thli0ouGTxeQ7i4cCyFsXTIy0phOkIYaJx3ZqROr0 Q==;
X-CSE-ConnectionGUID: ybbcmH3DSrW/iqej8G/sQA==
X-CSE-MsgGUID: fB02dekfTeu9gpGJm9ZdpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25191975"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25191975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="827790990"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="827790990"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2024 11:58:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 21:58:07 +0300
Date: Fri, 5 Apr 2024 21:58:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_joiner: cleanup force joiner
 debugfs state
Message-ID: <ZhBJv1sqXOU78bGQ@intel.com>
References: <20240405111525.1748544-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405111525.1748544-1-kunal1.joshi@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Apr 05, 2024 at 04:45:25PM +0530, Kunal Joshi wrote:
> cleanup force joiner debugfs state

We have igt_reset_connectors(), which seems like the place
where *all* force knobs should be reset.

> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_big_joiner.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 078f76ac1..a507f524a 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -291,6 +291,7 @@ igt_main
>  	drmModeModeInfo mode;
>  	data_t data;
>  
> +
>  	igt_fixture {
>  		force_joiner_supported = false;
>  		data.big_joiner_output_count = 0;
> @@ -417,6 +418,7 @@ igt_main
>  	}
>  
>  	igt_fixture {
> +		toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
>  	}
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
