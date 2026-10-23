Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0229606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eqt1UuW8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611A710E0E0;
	Fri, 23 Oct 2026 15:51:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9E010E670
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792770628; x=1824306628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R81ztwFaZ1VhbAI90jA8DQQNoLe3U5sCzFTv+VRCiS8=;
 b=eqt1UuW8wVuuz8j5Fd073HUQg8f7FOAqzowP2V/2n7TYOMzDksdMgrwN
 uvvkJZKlobT53ONcLIQeGYxLVoSknftip8jXUJHzjZODQzV6ktXMExVn8
 05ngVNX7xpODqW3ryZvMQQaw45KDuwcPJvup0BLYq6B/xbJHeZfAV9DEF
 8BqVQMubQyuURtJKO+27xvGR8Ih5bcztzsf6CkQI0cLo4mFbasNWHhEqg
 nnNw4r8+JBFpSG3/jmvu2zhFD8kX71VYT7t23aFDvTbtXijhLa8Q0JLt5
 lfkDhr47EY7KHKgbxqhOthcCyrxUcy1al5ifs2CJNuKcjXaD6feWqi2VZ Q==;
X-CSE-ConnectionGUID: YLmuGxo1TYmsrdGAFlEj5Q==
X-CSE-MsgGUID: 0wnVsbgDRvOEGqc508nKzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1638652"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1638652"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 08:50:28 -0700
X-CSE-ConnectionGUID: CG9wNcwPQuG5KmFj0OYehQ==
X-CSE-MsgGUID: RQZWUoNbSgugTTmHS57E5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="5524889"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 08:50:27 -0700
Date: Fri, 23 Oct 2026 17:50:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe: fix missing vm cleanups in
 several tests
Message-ID: <20261023155024.pm6otu27u2gjxd5p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
 <20261021050307.3268228-6-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021050307.3268228-6-priyanka.dandamudi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi priyanka.dandamudi,
On 2026-10-21 at 10:33:10 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Imho subject should not have 'several', there are two, so better:

[PATCH i-g-t 2/2] tests/intel/xe: fix missing vm cleanups in tests

> 
> Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy()
> calls:
> 
> xe_waitfence.c: waitfence(), invalid_flag(), invalid_ops() leaked
> vm/bo(s)/exec_queue entirely; exec_queue_reset_wait() leaked vm.
> xe_dma_buf_sync.c: test_export_dma_buf() never destroyed its two
> vm/exec_queue pairs.

Can you split this into two patches? Or at least remove above
paragraph or write only what was leaked and that you fixed that.

Regards,
Kamil


> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_dma_buf_sync.c |  6 +++++-
>  tests/intel/xe_waitfence.c    | 20 ++++++++++++++++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> index f214866a17..7291f17674 100644
> --- a/tests/intel/xe_dma_buf_sync.c
> +++ b/tests/intel/xe_dma_buf_sync.c
> @@ -219,11 +219,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>  	for (i = 0; i < n_bo; ++i) {
>  		munmap(data[i], bo_size);
>  		gem_close(fd[0], bo[i]);
> +		gem_close(fd[1], import_bo[i]);
>  		close(dma_buf_fd[i]);
>  	}
>  
> -	for (i = 0; i < N_FD; ++i)
> +	for (i = 0; i < N_FD; ++i) {
> +		xe_exec_queue_destroy(fd[i], exec_queue[i]);
> +		xe_vm_destroy(fd[i], vm[i]);
>  		drm_close_driver(fd[i]);
> +	}
>  }
>  
>  int igt_main()
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index ecdce9f93b..91172eea7c 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -136,6 +136,18 @@ waitfence(int fd, enum waittype wt)
>  			  ", elapsed: %" PRId64 "\n",
>  			  timeout, signalled, signalled - current);
>  	}
> +
> +	if (wt == ENGINE)
> +		xe_exec_queue_destroy(fd, exec_queue);
> +
> +	gem_close(fd, bo_1);
> +	gem_close(fd, bo_2);
> +	gem_close(fd, bo_3);
> +	gem_close(fd, bo_4);
> +	gem_close(fd, bo_5);
> +	gem_close(fd, bo_6);
> +	gem_close(fd, bo_7);
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  /**
> @@ -208,6 +220,9 @@ invalid_flag(int fd)
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  static void
> @@ -232,6 +247,9 @@ invalid_ops(int fd)
>  	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
>  
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  static void
> @@ -304,6 +322,8 @@ exec_queue_reset_wait(int fd)
>  		munmap(data, bb_size);
>  		gem_close(fd, bo);
>  	}
> +
> +	xe_vm_destroy(fd, vm);
>  }
>  
>  int igt_main()
> -- 
> 2.43.0
> 
