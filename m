Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B23C282C1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 15:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FD110E035;
	Fri, 28 Feb 2025 15:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVAJjVzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD1A10E035
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740758128; x=1772294128;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dkfLO3Ab/Gt0raKG8BKv0o4Jt7ohoT2xuhRnmLYvitU=;
 b=aVAJjVzToI9GToeLz8Q5Ge5/zM0svRCcwUvyQmrQPryrbHxgxtH55Jce
 sYDB6f4qPmZPpEfhKwYDUM0QjXJxhvF2sCbKzGPEpdG3YnmCmwy28MTE8
 2GpHK1YEPZokGi3hVUA0f4MNxMBIAJ1QSkZwpXopv5KwBF7LeUbXwkFms
 xgpUUt4f6K6oT+23NxaBDARHF3KQRA4CJLt4qLrUUyc74pgCBDlPL2OgJ
 bQtLiWdpJQykgQaevEztWkMiKji3ZO+SyoAlyuKxcXcOLga13QJ9xMy7K
 WPMJdCo01yVhXbC4W6RL1ZEGnozzv2B5UC0zFwzfhqVLwGat3iKDvf0uA g==;
X-CSE-ConnectionGUID: SZXmaijvROeBVilFyZotog==
X-CSE-MsgGUID: EEDeEMflQme/ZQTCSOla5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="40931242"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="40931242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:55:28 -0800
X-CSE-ConnectionGUID: Nsz7mUBCTIWfZXSHyf2miQ==
X-CSE-MsgGUID: N/4Dy81iSWKKKCG/ouPh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117868435"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 07:55:27 -0800
Date: Fri, 28 Feb 2025 16:55:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/syncobj: Make running under Valgrind quiet
Message-ID: <20250228155525.vz7inqh3rytnvtwe@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 igt-dev@lists.freedesktop.org
References: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,
On 2025-02-25 at 12:44:53 +0000, Tvrtko Ursulin wrote:
> Explicitly initialise ioctl arguments so Valgrind can know we are not
> passing in uninitialised memory to the kernel.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_syncobj.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)

Both applied, thanks!

Regards,
Kamil

> 
> diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
> index a53393bd7245..5a1226b6e19d 100644
> --- a/lib/igt_syncobj.c
> +++ b/lib/igt_syncobj.c
> @@ -197,14 +197,12 @@ int
>  syncobj_wait_err(int fd, uint32_t *handles, uint32_t count,
>  		 uint64_t abs_timeout_nsec, uint32_t flags)
>  {
> -	struct drm_syncobj_wait wait;
> +	struct drm_syncobj_wait wait = { };
>  
>  	wait.handles = to_user_pointer(handles);
>  	wait.timeout_nsec = abs_timeout_nsec;
>  	wait.count_handles = count;
>  	wait.flags = flags;
> -	wait.first_signaled = 0;
> -	wait.pad = 0;
>  
>  	return __syncobj_wait(fd, &wait);
>  }
> @@ -227,15 +225,13 @@ syncobj_wait(int fd, uint32_t *handles, uint32_t count,
>  	     uint64_t abs_timeout_nsec, uint32_t flags,
>  	     uint32_t *first_signaled)
>  {
> -	struct drm_syncobj_wait wait;
> +	struct drm_syncobj_wait wait = { };
>  	int ret;
>  
>  	wait.handles = to_user_pointer(handles);
>  	wait.timeout_nsec = abs_timeout_nsec;
>  	wait.count_handles = count;
>  	wait.flags = flags;
> -	wait.first_signaled = 0;
> -	wait.pad = 0;
>  
>  	ret = __syncobj_wait(fd, &wait);
>  	if (ret == -ETIME)
> @@ -356,7 +352,7 @@ __syncobj_timeline_wait(int fd, uint32_t *handles, uint64_t *points,
>  			int64_t timeout_nsec, unsigned flags,
>  			uint32_t *first_signaled)
>  {
> -	struct drm_syncobj_timeline_wait args;
> +	struct drm_syncobj_timeline_wait args = { };
>  	int ret;
>  
>  	args.handles = to_user_pointer(handles);
> @@ -364,8 +360,6 @@ __syncobj_timeline_wait(int fd, uint32_t *handles, uint64_t *points,
>  	args.timeout_nsec = timeout_nsec;
>  	args.count_handles = num_handles;
>  	args.flags = flags;
> -	args.first_signaled = 0;
> -	args.pad = 0;
>  
>  	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, &args);
>  	if (ret < 0) {
> @@ -424,13 +418,12 @@ static int
>  __syncobj_timeline_query(int fd, uint32_t *handles, uint64_t *points,
>  			 uint32_t handle_count)
>  {
> -	struct drm_syncobj_timeline_array args;
> +	struct drm_syncobj_timeline_array args = { };
>  	int ret;
>  
>  	args.handles = to_user_pointer(handles);
>  	args.points = to_user_pointer(points);
>  	args.count_handles = handle_count;
> -	args.flags = 0;
>  
>  	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_QUERY, &args);
>  	if (ret) {
> @@ -464,7 +457,7 @@ __syncobj_transfer(int fd,
>  		   uint32_t handle_src, uint64_t point_src,
>  		   uint32_t flags)
>  {
> -	struct drm_syncobj_transfer args;
> +	struct drm_syncobj_transfer args = { };
>  	int ret;
>  
>  	args.src_handle = handle_src;
> @@ -472,7 +465,6 @@ __syncobj_transfer(int fd,
>  	args.src_point = point_src;
>  	args.dst_point = point_dst;
>  	args.flags = flags;
> -	args.pad = 0;
>  	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_TRANSFER, &args);
>  	if (ret) {
>  		ret = -errno;
> @@ -548,14 +540,13 @@ int
>  __syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
>  		  int ev_fd)
>  {
> -	struct drm_syncobj_eventfd args;
> +	struct drm_syncobj_eventfd args = { };
>  	int ret;
>  
>  	args.handle = handle;
>  	args.flags = flags;
>  	args.point = point;
>  	args.fd = ev_fd;
> -	args.pad = 0;
>  
>  	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_EVENTFD, &args);
>  	if (ret) {
> -- 
> 2.48.0
> 
