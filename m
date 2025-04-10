Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D97C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 12:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07710E99C;
	Thu, 10 Apr 2025 12:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keR1omYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291C110E99D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744289963; x=1775825963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rjrYm/5H//S1oHv0+M5sW7/to/VATAJ/NP3tiID5Vf8=;
 b=keR1omYqSZPqLfJ84iRc9mDcBRpN9LzyxaTSxnXne38pVr60WyEwBX2Y
 71fl9brT1TeT8HuH4imTUYPIdyov5dIKoK7vY+FrURs5ejf34mcc2mVCb
 0AViu+QimsCfk642wnd24+4uGs2aP85K0wEYZhyXPe1Ad049vp6DAo+HK
 MQZCCKDWUXjgxlWiy2QxLwdCzYAZhKdH7q8SvwvaMlm4BTpiEilPCwpcS
 bD6+dYlUOiwM2FE155Fzo48uu7e/T9Uz3snM1dSSCeWzyNapjTGObCubW
 DUnq5XmBFZsEC3PAvKStj0DEIoJbXLMIK/n704xmlZUQ1aD3+Ri1Y/gKY g==;
X-CSE-ConnectionGUID: xlTG6Io7SuyuDJokoELz5w==
X-CSE-MsgGUID: Eq4EFiEcRiWxFK0GhM/aZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="33417267"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="33417267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:59:16 -0700
X-CSE-ConnectionGUID: jwQJiAqgSxS+znn7m87nuw==
X-CSE-MsgGUID: nV7//rBoSCKOiG+fMigqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128813857"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:59:14 -0700
Date: Thu, 10 Apr 2025 14:59:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Calculate bb_size
 from shader
Message-ID: <20250410125911.dwn4vbqfk54wwnxt@zkempczy-mobl2>
References: <20250403125525.31573-1-dominik.karol.piatkowski@intel.com>
 <20250403125525.31573-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403125525.31573-2-dominik.karol.piatkowski@intel.com>
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

On Thu, Apr 03, 2025 at 02:55:25PM +0200, Dominik Karol Piątkowski wrote:
> Right now, bb_size is retrieved from get_bb_size, which returns one of
> two hardcoded values. This approach will fail, if shader turns out to be
> big enough to not fit into bb. Fix it by always calculating bb_size from
> shader.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 84ba748c1..629a0ec16 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1020,12 +1020,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
>  	return ibb;
>  }
>  
> -static size_t get_bb_size(int flags)
> +static size_t get_bb_size(struct gpgpu_shader *shader)
>  {
> -	if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM))
> -		return 32768;
> +	size_t shader_size = shader->size * sizeof(uint32_t);
>  
> -	return 4096;
> +	return (shader_size / PAGE_SIZE + !!(shader_size % PAGE_SIZE) + 1) * PAGE_SIZE;

Shouldn't this be:

ALIGN(shader_size, PAGE_SIZE) + xe_cs_prefetch_size(fd);

?

--
Zbigniew

>  }
>  
>  static uint64_t get_memory_region(int fd, int flags, int region_bitmask)
> @@ -1044,7 +1043,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	int threads = get_number_of_threads(c->flags);
>  	const uint64_t target_offset = 0x1a000000;
>  	const uint64_t bb_offset = 0x1b000000;
> -	const size_t bb_size = get_bb_size(c->flags);
> +	size_t bb_size;
>  	struct online_debug_data *data = c->ptr;
>  	struct drm_xe_engine_class_instance hwe = data->hwe;
>  	struct drm_xe_ext_set_property ext = {
> @@ -1076,6 +1075,9 @@ static void run_online_client(struct xe_eudebug_client *c)
>  
>  	fd = xe_eudebug_client_open_driver(c);
>  
> +	shader = get_shader(fd, c->flags);
> +	bb_size = get_bb_size(shader);
> +
>  	/* Additional memory for steering control */
>  	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
>  		s_dim.y++;
> @@ -1109,7 +1111,6 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	intel_bb_set_lr_mode(ibb, true);
>  
>  	sip = get_sip(fd, c->flags);
> -	shader = get_shader(fd, c->flags);
>  
>  	igt_nsec_elapsed(&ts);
>  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);
> -- 
> 2.34.1
> 
