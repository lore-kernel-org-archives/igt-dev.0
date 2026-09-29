Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0397ACA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E3410E9C5;
	Tue, 29 Sep 2026 10:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqjKRFaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C04110E9C5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790677125; x=1822213125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2EMNR2cNhJvPhZ/AnbCgZkAhAFwIeh801L1ha11x3KM=;
 b=MqjKRFaHH1MMYBhVClRSTCOZpd7V2HNLoLrmunLY7Me1YFr0kWmPO1EY
 e7Z4bmjgYLJLF1kMR+9ssvxnMxIoTsZxUWxYeWnRm0fM6QlSiBp7uDj66
 IYRmWul1gKLXzZutrRUZKduTpGxhfW7/IGJjFaTlTyCPQ15ZqhXGG/pL9
 uTFWse9guA4WYA3o9q84qKXkk2+ZPW2kWehrZ/xKw9Zxwve+x5cs6CNmS
 WvKBYHFmd2ystzxcDwYodEy0EiYBCEmjZq0z5St1uXwPhpDhhk8zckn9f
 yx0IZd/gpSHXcXyYN5XVAGhb12NwtYm2uSfWJCdWc7Y+7jL1Syhi/fo+v A==;
X-CSE-ConnectionGUID: HlQqS5neS3CIIofpKa43xA==
X-CSE-MsgGUID: i0OgOuZlRVyIw7lWFVtNbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116922711"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116922711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:18:45 -0700
X-CSE-ConnectionGUID: gsj5X1wPS5WgmgJtkv5FAg==
X-CSE-MsgGUID: UoFCSxKnSdmk6o9sgzE1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="278546293"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:18:44 -0700
Date: Tue, 29 Sep 2026 12:18:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors in
 amd_fuzzing
Message-ID: <20260929101841.siuqpxiubj7tcts4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
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

Hi Jesse,
On 2026-09-29 at 11:00:46 +0800, Jesse Zhang wrote:

please do not mension a tool in subject, rather write what you did,
for example:

[PATCH i-g-t 1/2] tests/amdgpu/amd_fuzzing: fix codestyle

Regards,
Kamil

> Fix all checkpatch ERROR-level issues in amd_fuzzing.c:
> - CODE_INDENT: use tabs for igt_assert_f() continuation-line indentation
> - OPEN_BRACE: put the if-statement opening brace on the same line
> 
> No functional change.
> 
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_fuzzing.c | 103 ++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 52 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> index 36dd5d388..bcd3d66e0 100644
> --- a/tests/amdgpu/amd_fuzzing.c
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -291,8 +291,8 @@ run_drm_ioctl_field_cases(int fd, const char *ioctl_name, unsigned long request,
>  		errno = 0;
>  		ret = drmIoctl(fd, request, buf);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     ioctl_name, cases[i].case_name, buf);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     ioctl_name, cases[i].case_name, buf);
>  	}
>  
>  	free(buf);
> @@ -452,8 +452,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
>  		}
>  
>  		/* bo_info_size cannot be zero. */
> @@ -466,8 +466,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
>  		}
>  
>  		/* DESTROY should not require bo_info payload fields for a valid handle. */
> @@ -747,8 +747,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
>  		}
>  
>  		/* fence_count=0 must be rejected regardless of wait_all selector. */
> @@ -758,8 +758,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
>  		}
>  
>  		/* Non-zero fence_count with NULL fences pointer must fault copy-from-user. */
> @@ -770,8 +770,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
>  		}
>  	}
>  
> @@ -924,24 +924,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.bo_read_handles = 0x1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.bo_write_handles = 0x1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
>  
>  		/* non-zero count + NULL user pointer must fail in copy-from-user path */
>  		memset(&arg, 0, sizeof(arg));
> @@ -949,24 +949,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_read_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_write_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
>  
>  		/* queue lookup path: invalid queue_id with no dependency arrays */
>  		memset(&arg, 0, sizeof(arg));
> @@ -974,8 +974,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
>  	}
>  
>  	/*
> @@ -997,8 +997,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
>  
>  		/* syncobj_timeline_handles: non-NULL + zero timeline count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1006,8 +1006,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
>  
>  		/* syncobj_timeline_points: non-NULL + zero timeline count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1015,8 +1015,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
>  
>  		/* bo_read_handles: non-NULL + zero count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1024,8 +1024,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
>  
>  		/* bo_write_handles: non-NULL + zero count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1033,8 +1033,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
>  
>  		/* out_fences: non-NULL + zero fence count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1042,8 +1042,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
>  
>  		/* non-zero count + NULL user pointer must fail in copy-from-user path */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1051,16 +1051,16 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_syncobj_timeline_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_syncobj_timeline_handles = 1;
> @@ -1068,24 +1068,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_read_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_write_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
>  
>  		/* wait queue lookup path: invalid waitq_id when out_fences requested */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1095,8 +1095,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
>  	}
>  	/*
>  	 * USERQ_WAIT timeline points are 64-bit in UAPI.  Verify that the
> @@ -2209,8 +2209,7 @@ amd_test_try_create_userq(int fd, amdgpu_device_handle amdgpu_dev, uint32_t ip_t
>  
>  	(void)fd;
>  
> -	if (!amdgpu_dev || !userq)
> -	{
> +	if (!amdgpu_dev || !userq) {
>  		igt_info("userq create failed: invalid args dev=%p userq=%p ip=%u\n",
>  			 amdgpu_dev, userq, ip_type);
>  		return false;
> -- 
> 2.50.1
> 
