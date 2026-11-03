Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03971606A32D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FHeNw0TK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967CE10F739;
	Tue,  3 Nov 2026 17:25:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2010F73F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793726679; x=1825262679;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2vGSFAPPkScODRwCCjAaKhzC2Aj7GKDNwmqpS7lCVac=;
 b=FHeNw0TKvs/RZzxkcFhXG+46bU+q7PYF1YxzZckoy5/7ELjWyn/qzqhY
 eYqWRl5w87T1bEgxAqEE0soiS580P2daYGMZu+tMqIqtCKV8oel/IgmpQ
 zE3TULr5AR8JI7s6lZAz93keq0AXxJLbCyXdaXePgHetXfkry4ffy/Zsh
 c0Vm+OPyHKMIUevjR9WwY9XphOxK6ecfta07yckXXr4vwWfbc6G2/Jr10
 gC8WMHOtP3kMrr3/chE6Np86ak8wKXB3CqKR6soKgTw/tnu+98DChfKRZ
 fKq7EUZuplTdC/7OzZkpMktPjIwvEv1AOJ3rIvmaH5MXXIeqEmIVNmacn g==;
X-CSE-ConnectionGUID: zDzn12ZtT1OH/UPrgWI4AA==
X-CSE-MsgGUID: rVZgjVQ6ReOJidxWQ1n8Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2370029"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2370029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 09:24:39 -0800
X-CSE-ConnectionGUID: l13e+VhbS/CGnF4NEbClzg==
X-CSE-MsgGUID: 1DTahSyyTMml7pw5846H7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6331650"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 09:24:38 -0800
Date: Tue, 3 Nov 2026 18:24:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe: fix missing bufops cleanups in
 test
Message-ID: <cnifcxd4ed737lijpfs45vdeltj6hpuf6pdqt4trtzms4os6vg@zo74xmhpdcm6>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
 <20261103045241.3367590-7-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103045241.3367590-7-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2026-11-03 at 10:22:44 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Xe rendercopy test functions created buf_ops context without releasing them.
> Add buf_ops_destroy() calls.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_render_copy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index c26c365c36..a2a0f652d4 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -634,6 +634,8 @@ static void render_stress_copy(int fd, struct igt_collection *set,
>  		 render_duration_total / render_count,
>  		 render_duration_min, render_duration_max);
>  
> +	buf_ops_destroy(bops);
> +
>  	/* End all mem copy threads */
>  	for (int i = 0; i < thread_copy_count; i++)
>  		xe_spin_end(data_mem_copy[i].spin);
> -- 
> 2.43.0
> 
