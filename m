Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B86C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673F710E7D3;
	Wed,  9 Apr 2025 07:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmYikjym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CC710E7D3
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744184207; x=1775720207;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PvomC7OckPB/6bxwRhEKS8vOPeGEpT6jazb0K1iMcjI=;
 b=PmYikjymKVBvs7mTJP+df1vgH5hrTZXr77fLdTdR2BXf3kE9wTaox/WD
 Qj7gP0T2nIa0G1KgGgocqLZ/Z1Is6MJyCZfUXP2N1WBKbwPgwf2Zm4inZ
 Tjr2CqktGd52UrqeNTBtCoMgdx0fzWRro+eNUCkQnGlG91cD2KH5FX/I4
 0lIjY1cG2x3vJWqqaQKSXgkcBJ2fuoE8gbfH7HLmwzbkz1HqwRONXBSXA
 rlW4DHFV31D7A9EM3l7w6ZO6AeK/iSBimdc1NpKzt5XbzAa1GsRF2VQPg
 7dIaaJTr9WCfYMrEEOpok6R2Ga4f5QnxFdN5pPNKTnc+8W3u/vZJtsslo Q==;
X-CSE-ConnectionGUID: jdh7Gi7KTnuCBnJV8+UnvQ==
X-CSE-MsgGUID: A9PwSPHYR5WFlhBg6fQLEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45766400"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45766400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 00:36:47 -0700
X-CSE-ConnectionGUID: b18d0yAXTJ2awM3FOfFDFQ==
X-CSE-MsgGUID: Uk7ZkbOuSVyIye+uIY5BdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128416173"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.235])
 ([10.245.244.235])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 00:36:46 -0700
Message-ID: <6b84d245-5626-4e89-9585-2e4eb25ee8db@linux.intel.com>
Date: Wed, 9 Apr 2025 09:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_universal_plane: Fix fb count mismatch
To: Nemesa Garg <nemesa.garg@intel.com>, igt-dev@lists.freedesktop.org
References: <20250408125327.1054433-1-nemesa.garg@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250408125327.1054433-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

On 2025-04-08 14:53, Nemesa Garg wrote:
> There is a mismatch in the count of fb before
> start and end of the test. This is because cursor
> fbs still not removed and we are counting the fbs.
> Add a 2 vblank wait before counting the fbs so that
> all cursors fbs gets removed.
> Since unpinning of cursor fb occurs during vblank in xe,
> we need to wait atleast 1 vblank for driver to remove
> cursor fb. We need 1 additional vblank because vblank
> event is scheduled before unpinning.
> 
> v2: Use is_xe_device[Chaitanya]
> v3: Add closes tag[Swati]
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4415
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

>  tests/kms_universal_plane.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8e0b4dda0..2d9716575 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,6 +703,16 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  			    COMMIT_ATOMIC : COMMIT_LEGACY);
>  	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>  
> +	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> +	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
> +	 * 1 additional vblank because vblank event is scheduled before
> +	 * unpinning. Therefore add 2 vblank wait to ensure that all
> +	 * cursor-related framebuffers can be removed before counting the
> +	 * framebuffer.
> +	 */
> +	if (is_xe_device(data->drm_fd))
> +		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 2);
> +
>  	/* We should be back to the same framebuffer count as when we started */
>  	count2 = intel_gem_fb_count(data);
>  

