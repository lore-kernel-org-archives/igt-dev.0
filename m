Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD238606A324
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D+fgjNgu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A4112310;
	Thu, 19 Nov 2026 11:50:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7C911232F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795088987; x=1826624987;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f3xqSaTvp6n+Si7F5R/TWAEitiPJjFBJwqCxndtcsfI=;
 b=D+fgjNguflrZ+E/FcWlkeZlCupY8M4rqnUd5ZZi2HNfDQnD8l2zGMP6U
 +HVqswB1xlJLURB2+iPXe79YPaKWUDbovnxhmEucuZ+tvGoQ/x+QNCwOZ
 8BWX6uJo5A2NBVOQ7uiANmORC1N0hM1b7vrn3w6IRkbPrE/MpkMha/DEp
 YiNAEzGGMfOCZgMBzuTeyl2BIhELHt0roATT5nGluudpYuUvldXrx1vNB
 aRPHuc0fqkB/BZMda2sBZ84S1bL9ztc+EnxhPnip3t1Pn7AvdFAfDpBTJ
 8gEguV9OibiC7Nf97kGUV1prsl5JZJGkwPxTbT6Cgbw5C3dyCBqgIZVMF A==;
X-CSE-ConnectionGUID: sdVQD/i4Q7+2dix4JEWdgA==
X-CSE-MsgGUID: sNTHhMVBTkOl7ZB3Cdu7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3924703"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3924703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:49:46 -0800
X-CSE-ConnectionGUID: 3v8uWoi3RyCDO8kRpFwhZQ==
X-CSE-MsgGUID: B7KL5MrHRC6HTj2IcCtQew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10279615"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:49:45 -0800
Date: Thu, 19 Nov 2026 12:49:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, 
 shuicheng.lin@intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH] lib/intel_batchbuffer: Destroy exec queue owned by
 intel_bb
Message-ID: <hnsacopnju4moxuxftsots2llnbdpdpzxncrfkp6owq4sv7ywq@aacdiaxn7zkr>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 jia.yao@intel.com, 
 shuicheng.lin@intel.com, zbigniew.kempczynski@intel.com
References: <20261118234356.342335-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118234356.342335-1-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2026-11-18 at 15:43:56 -0800, Zongyao Bai wrote:
> On Xe intel_bb creates an exec queue lazily at first submission (and
> re-creates it on engine/gt change), but only the previous queue was
> destroyed on a switch. The last queue was never destroyed by
> intel_bb_destroy(), so it stayed alive until the drm fd was closed.
> 
> Since the queue holds a reference to the VM and its LRC/BOs, the whole
> VM/LRC/GGTT teardown, including the GuC deregistrations and TLB
> invalidations, was deferred to fd close and executed as a burst after
> the test finished. For tests that create a lot of intel_bb (e.g.
> xe_pat@pat-index-auto) this kept the GT out of C6 for more than a
> second after the test, making a following xe_pm_residency@idle-residency
> fail intermittently.
> 
> ibb->engine_id is only ever assigned by intel_bb itself, a user supplied
> ctx is never stored there, so destroy it unconditionally (when set)
> before destroying the VM. i915 never sets it and is unaffected.

+cc Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  lib/intel_batchbuffer.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 1dacfdc6c..05e6eaf35 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1368,6 +1368,17 @@ void intel_bb_destroy(struct intel_bb *ibb)
>  		close(ibb->fence);
>  	if (ibb->engine_syncobj)
>  		syncobj_destroy(ibb->fd, ibb->engine_syncobj);
> +	/*
> +	 * ibb->engine_id is only set when intel_bb created the exec queue
> +	 * itself (a user supplied ctx is never stored there). Destroy it
> +	 * together with the batch, otherwise the queue (and the VM and LRC
> +	 * it references) stay alive until the fd is closed and are torn down
> +	 * in a burst, keeping the GT busy for seconds after the test.
> +	 */
> +	if (ibb->engine_id) {
> +		xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
> +		ibb->engine_id = 0;
> +	}
>  	if (ibb->vm_id && !ibb->ctx)
>  		xe_vm_destroy(ibb->fd, ibb->vm_id);
>  
> -- 
> 2.43.0
> 
