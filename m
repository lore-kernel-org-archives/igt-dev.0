Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F123C71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 09:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB1E10E305;
	Mon, 16 Jun 2025 09:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5lIQF5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ED910E305
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750066329; x=1781602329;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Co5WcKz/ffRRr6HHeTEcGwHPkJEaynUdM1DFoQhWEJY=;
 b=J5lIQF5rstF7imnjpl134pqWLdi9trkUl5eAbTW1MC3DUbTtTXSuSXG8
 6gQLgmfnHkEzentHqBHoWF2kEjNVrFchE4JY185XlaMda+Eh1GpxRn1dB
 u3LFZquN4MlqbJ23tCbmpuZn6AGHQ9o0bH5V/qEaaCbonEmtCi2beNg3y
 IucFIZAwbVlS3ljj20twxtHXCL+4AFqsBXFU/baNRNBnu1/65pPnr5GAR
 k+0BtXFnqRh8yOXuuIonB0vCSMYZl/S/nS6cnvn+7T1JjHS42QkA6TJ4Y
 t/lCmyphOfrkR8rd8/lJEbQgV+Yk4N+s/E429UU5egl0ZCq+e2l+0z/hm g==;
X-CSE-ConnectionGUID: uhBsomP5SN6uMLF7+OFrvg==
X-CSE-MsgGUID: x7F7FBJfShqB3OXPCbD1jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62811714"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62811714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:32:09 -0700
X-CSE-ConnectionGUID: lmN+IuqeQVStoI5pTDt6/g==
X-CSE-MsgGUID: 4ileL2zDQXCkfjGZrEpo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="152253020"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.159])
 ([10.245.244.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:32:08 -0700
Message-ID: <77548cb1-08f5-49d8-aca8-dad36547fa18@intel.com>
Date: Mon, 16 Jun 2025 10:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_exec_atomic: Fix incorrect
 GEM create flag
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com
References: <20250616085417.20178-1-lukasz.laguna@intel.com>
 <20250616085417.20178-3-lukasz.laguna@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250616085417.20178-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16/06/2025 09:54, Lukasz Laguna wrote:
> Replace I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS with the correct
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_exec_atomic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index 825d7d190..39c739b64 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -85,7 +85,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>   	bo_size = xe_bb_size(fd, bo_size);
>   
>   	bo = xe_bo_create(fd, vm, bo_size, placement,
> -			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>   	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);

