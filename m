Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841E4C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C80010E11E;
	Mon, 14 Apr 2025 16:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLL7vqCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3C510E11E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648857; x=1776184857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cWFEwHRP1E4Zhyjz94dQ7KhizHEkSVfjkQry0tSy0VU=;
 b=MLL7vqClNIlFSb+uOajCm7+XuUL8wQInHiJK7LONvsnGDPaQM24JOIiv
 L5HCVOySa4ovOPqSwXtdDQpJC8GcfDuz6rLGd11Pi8LLkPkUQKD3myHEV
 XPI2PsZ/a0PzCxkLFADovAIBR/s9X+dhOvPU8DGvzRqzbyYT99p5X8Rnz
 hukGkmZYSO5+3Dvolp3T4se5Z76HNX+Q14VpN13MSezGcIXaO6oJ0KdIg
 1I/Ub5h9TzYCRqR+8Ce90r7K8fhHtYTRosWDCOeWMPBjfdjI+5dctRcOu
 jxApFBbLJlqhTrqTd+FNaNaE6HLmCoVNHiYlW5kRTixQ+lYapiFxG5pNK g==;
X-CSE-ConnectionGUID: GHkferzZSnKVNxCSQDvM+w==
X-CSE-MsgGUID: 78tfLSJgRry+KZ1EVqNreA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46040372"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="46040372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:56 -0700
X-CSE-ConnectionGUID: UpUqDH0BRZuUtx/etGfUCQ==
X-CSE-MsgGUID: 23BQkS6TRxOWWCQeKS9hqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134848382"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.217])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:56 -0700
Date: Mon, 14 Apr 2025 18:40:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/1] tests/xe_eudebug_online: Calculate bb_size
 from shader
Message-ID: <20250414164052.qxeupqesntxo77kj@zkempczy-mobl2>
References: <20250414101714.18581-1-dominik.karol.piatkowski@intel.com>
 <20250414101714.18581-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414101714.18581-2-dominik.karol.piatkowski@intel.com>
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

On Mon, Apr 14, 2025 at 12:17:14PM +0200, Dominik Karol Piątkowski wrote:
> Right now, bb_size is retrieved from get_bb_size, which returns one of
> two hardcoded values. This approach will fail, if shader turns out to be
> big enough to not fit into bb. Fix it by always calculating bb_size from
> shader.
> 
> v2: Improve bb size calculation (Zbigniew)

Drop this versioning info. Then:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 582a26dca..af90b9b70 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1020,12 +1020,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
>  	return ibb;
>  }
>  
> -static size_t get_bb_size(int flags)
> +static size_t get_bb_size(int fd, struct gpgpu_shader *shader)
>  {
> -	if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM))
> -		return 32768;
> +	size_t shader_size = shader->size * sizeof(uint32_t);
>  
> -	return 4096;
> +	return ALIGN(shader_size, PAGE_SIZE) + xe_cs_prefetch_size(fd);
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
> +	bb_size = get_bb_size(fd, shader);
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
