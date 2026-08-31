Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA6C624D0
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 17:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63F810EA0C;
	Mon, 31 Aug 2026 17:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T58DoGfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7BA10E31E
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 17:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788196341; x=1819732341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qWR08hpdc8wGdE7Jb3wrrDSLd44LHIAXF+SA1qGd7g0=;
 b=T58DoGflWp+GwAK8kJOL/aVHd+J7C3T+KboHVknmsWSwl7peuIyoD88w
 Zi6tPkCfvxZlublM4P5MU3SARSGN/4l/p7TgmgjQ0no3+XP7s8WwE3MWp
 OajCe1OCZPII3rwcogwW3OYTsdbLE9fh7jd/VDt0D8IdjfhkmMaSdD+4E
 hEOaa4y2ExBAVs7LWQEC5uFAECB08MjlBzK6G/ecDRPp0T2nNGfRyD4bC
 PbvcoNWZvwVAJXELCK6lh2VbnpuRoq9N6ldbwgFiaG+vPwpZR60esiFg2
 gn4znFXB88HTHi9qwxO0gV+isDqWBqmV9fPw+UPa9LKBWEjIdSHH8K7al w==;
X-CSE-ConnectionGUID: zYc5/cP0SPeqebDwZT4cJQ==
X-CSE-MsgGUID: cXOroK7wRZaWdHenZTYQtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92296622"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="92296622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:12:20 -0700
X-CSE-ConnectionGUID: H4DxybnFSo+ZByBGNHeQ0Q==
X-CSE-MsgGUID: vrQX8jyiTdSixu33f8Ywbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="264567621"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 10:12:19 -0700
Date: Mon, 31 Aug 2026 19:12:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_vm: fix double munmap of first mapping
Message-ID: <20260831171200.ijd3jkbsh3jawnoh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260831162928.201586-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831162928.201586-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-08-31 at 16:29:28 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> In the cleanup path of the bind-array conflict test, when a second buffer
> object mapping (map2) exists, the code called munmap() on the first
> mapping (map) a second time instead of unmapping map2:
> 
> This double-unmaps the map region while leaking the map2 mapping entirely.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 1d109e783..a0a6616c3 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1278,7 +1278,7 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	munmap(map, bo_size);
>  	if (map2)
> -		munmap(map, bo_size);
> +		munmap(map2, bo_size);
>  	gem_close(fd, bo);
>  	if (bo2)
>  		gem_close(fd, bo2);
> -- 
> 2.43.0
> 
