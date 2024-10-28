Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E58D339A0
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 16:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F67710E515;
	Mon, 28 Oct 2024 16:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pib9gtbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1D710E515
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730134396; x=1761670396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KeUUf5SiDnEBD6yehOr7aLc/LRBuX1cZen1F7lmZluM=;
 b=Pib9gtbw3SR87fYmsE87EIfsQ1Bdeqv+QIwyxm/9/6A2fYhtgCE0NATh
 BkUHrGeSwCToOPqLKvm1DIlbEErl4sAnEM/3XL0QiGLllO9hZO4Qd9gUj
 XkEGuQ4RzxYhSHpO4OSaRKu5qHudO4unm3s6py3J/fPU1BCQhsEh0aOCw
 CR5Ymi7mtF1Bh7OClON/afXs5iY56Eas88apf0ezFHLB2ZjxkxiRkuzY/
 dgtzY0uJ9Jx7d0Rlba473O+u8urSxqZG0Houri7NdhLni0W/RG/iHm4f9
 CWuIc4eXIgPG9i63y9pQxxLPgdQs4bpTwx78BMzOzljVBqWl41DypNxJI Q==;
X-CSE-ConnectionGUID: yiGwn8UAQdSl8sY9sLSQFg==
X-CSE-MsgGUID: 6ISOnjCERSKWq818cjkWDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29950707"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="29950707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:53:16 -0700
X-CSE-ConnectionGUID: UdA3YqTiSeu5JNwwNOEbPA==
X-CSE-MsgGUID: oaWsmZdlR2ORzsbKgV2M8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81999365"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 09:53:14 -0700
Date: Mon, 28 Oct 2024 17:53:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 jonathan.cavitt@intel.com, alex.zuo@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH] [i-g-t] tests/intel/xe_vm:Reduce n_execs for
 bind-array-enobufs
Message-ID: <20241028165311.q7qlo65v5fo2xoz3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 jonathan.cavitt@intel.com, alex.zuo@intel.com,
 kamil.konieczny@intel.com
References: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022201130.5724-1-jagmeet.randhawa@intel.com>
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

Hi Jagmeet,
On 2024-10-22 at 20:11:30 +0000, Jagmeet Randhawa wrote:

small nit for subject, please place space after ':'
[i-g-t] tests/intel/xe_vm:Reduce n_execs for bind-array-enobufs

should be:

[i-g-t] tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs

> The bind-array-enobufs test in xe_vm.c is intended to trigger
> an -ENOBUFS error by submitting an oversized bind array.
> After encountering and handling the error, the test reduces
> n_execs by half and retries the operation. On some environments
> with stricter resource limits (e.g. simulator), halving
> n_execs isn't sufficient to prevent the ENOBUFS error on the retry.
> Reducing n_execs further to n_execs / 4 allows the test to pass
> successfully. This patch modifies the test to reduce n_execs
--------------- ^
Imho you repeat your argument again here, I will take only
what is up to 'This patch...' with Jonathan r-b.

Also please replay to CI failure reports, I will do this now
as to give you an example how to follow up with your next patches.

Regards,
Kamil

> to n_execs / 4 after an ENOBUFS error is handled. This ensures
> compatibility with environments that have tighter resource
> constraints while maintaining the test's integrity.
> 
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7a8740b69..e78ddd0e5 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -957,7 +957,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		xe_cork_end(&cork);
>  		xe_cork_wait_done(&cork);
>  		xe_cork_fini(&cork);
> -		n_execs = n_execs / 2;
> +		n_execs = n_execs / 4;
>  	}
>  
>  	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
> -- 
> 2.34.1
> 
