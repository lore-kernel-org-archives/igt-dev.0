Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFF7C3ABB6
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 11:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CF410E0C1;
	Mon,  5 May 2025 11:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7VoYc5m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7BB10E0C1
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746444643; x=1777980643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uC6uC1D+YbgiRlqW36tznTnqIZyUV7IEpZKJw6JWOyw=;
 b=G7VoYc5mMoc5SRaDNFk8RLuWnN5go/WIJqNOHX9Ds/RL7bwPj2zx3AGP
 MfZp/yz9T7pKXe2m8Ie4Qxbq6RESgQmx9sowmfv390/nrV4U7I2F7WnhJ
 L0l/XQ5zKyvwIGrTtA33VtXspNe2GUzzf8l9BdnhnL0cQLXoiVVa63Ygq
 bm23x/QuCrx89EephwARXkGe2c3+JVrQSie4L2agXqocA+iEJKAB7YyiS
 gIMi/JiN6vkZkh+aCFod60fInJDWB8xTSixuC5vm0X3jt5SdQIHkF4XWa
 9/KPz3H8ue/kELgSog4RZeZjOd+HJKBRY7L0wvLPJsNMM7wsDTanrvW/J A==;
X-CSE-ConnectionGUID: xHqQyXFHRamD+vF00+JlaA==
X-CSE-MsgGUID: A5IgPf8pQPCybtS9VBs3Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="48185915"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="48185915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 04:30:42 -0700
X-CSE-ConnectionGUID: o5b1V7rERWWxxpvOSSh9ow==
X-CSE-MsgGUID: ZuTsSbIcQfKc4Ucodx+2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135740538"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:30:40 -0700
Date: Mon, 5 May 2025 13:30:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 ramanaidu.naladala@intel.com, sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_plane_multiple: Add clear skip
 message for skips
Message-ID: <20250505113028.ayswyhrl6pmch7mi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 ramanaidu.naladala@intel.com, sameer.lattannavar@intel.com
References: <20250505033435.929953-1-pranay.samala@intel.com>
 <20250505033435.929953-2-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250505033435.929953-2-pranay.samala@intel.com>
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

Hi Pranay,
On 2025-05-05 at 09:04:34 +0530, Pranay Samala wrote:
> Add a check to skip the subtest when the required DRM modifier
> is not supported. This avoids unnecessary test skips and
> improves clarity by providing a proper skip message.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_plane_multiple.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Please squash both patches together.

Regards,
Kamil

> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index ebb026726..5767318e4 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -510,8 +510,8 @@ static void run_2_display_test(data_t *data, uint64_t modifier)
>  	igt_output_t *output1, *output2;
>  	igt_display_t *display = &data->display;
>  
> -	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
> -		return;
> +	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
> +		      "%s modifier is not supported\n", name);
>  
>  	igt_display_reset(display);
>  
> @@ -553,8 +553,8 @@ static void run_test(data_t *data, uint64_t modifier)
>  	igt_output_t *output;
>  	igt_display_t *display = &data->display;
>  
> -	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
> -		return;
> +	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
> +		      "%s modifier is not supported\n", name);
>  
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		igt_display_reset(display);
> -- 
> 2.34.1
> 
