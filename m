Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36D606A328
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1EAuZbT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BB510F78B;
	Tue,  3 Nov 2026 19:00:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD5610E817
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793732387; x=1825268387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FrNpM+r3NiJE3FpFHvHwNsNr3VOsMX0186qgJcnVuMo=;
 b=g1EAuZbTG6iD4O0jG9iBr1OaNQkZAkd1pzsg/FEKi5cqFPnkpTGPX6qw
 bnESlC9ubZziHE5HqN02pWMO+JE2CDsXjNE17qE9oncRjkU6YmTnlJJut
 LIXjhW/SCwBGyMqFCJMWwsMCmJEA34+Hfzrx8466jW+ketDpIl9JptpP4
 KgRSLesqtdGoWBiBnUUjZ8vVkE563unrM5po6ht3dlaQo11+iWbq0CjoN
 4ZkGlbxsfZtNlGdgteZAaG2hd0Y90Nj7pShmTX5GKA/FHtnGU6WcDf2Zg
 P0LansTW8l4tr43SoQQYwaqChUj5P10MmqnCLLsjTyT3Y4iYbFiMvbmEa A==;
X-CSE-ConnectionGUID: RBp3F8J0TV6GEyUbf5tiAA==
X-CSE-MsgGUID: VmfJ4uEuTy+0g2L/z7lxhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2352469"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2352469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 10:59:46 -0800
X-CSE-ConnectionGUID: 0V04khgdQ5mDpQS12PPh2Q==
X-CSE-MsgGUID: dhu//TtPS3ebCtz2XnAI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6854790"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 10:59:45 -0800
Date: Tue, 3 Nov 2026 19:59:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe: fix missing vm cleanups in tests
Message-ID: <bhu7rgubpwbo46eso3r4tpoy32b4suvootatypqz7bmfey2ez7@d7yw35v7zxqe>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
 <20261103045241.3367590-8-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103045241.3367590-8-priyanka.dandamudi@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
On 2026-11-03 at 10:22:45 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy()
> calls.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

See nit below.

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

Maybe this should be moved to an array of bo's, and a structure
with params for each bo[i]. As this is outside of scope for this
change, lets left that for later.

Regards,
Kamil

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
