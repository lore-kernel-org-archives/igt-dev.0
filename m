Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F0606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 11:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BTrmJ/j6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F0810ECDA;
	Mon,  2 Nov 2026 11:03:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501BA10ECDA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793617368; x=1825153368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x9liyYGEhH2VaaIiPAPuiw4+Ckhm0FHgfGhguQQctbk=;
 b=BTrmJ/j6IdBboXObschuVujSudJevWOx1x9mG99E/RntocMj5kjLZhs8
 PdBjODnPYH0slF/A7rdWAL3CEc5ZmK9BWg/m7o+2Hq75Qyh4mc1WWnouw
 luIdM3OLfMyPsdSbQowEHvEfNKanKOArcpHxfclZ12MN9XX4FALABlnHv
 +Io8kk5qNEWL8BjrHuX5ts0hhLdwgAhIusM2j6v/47wTrzun/RTvXeIsS
 vdhx2yF76yH72xr1bo46R5hWnOI1CobWiZ/JV9cg1RMz24R8VPYNXGZzz
 VsXGSxkEb6+Kn55B6DTOLr7CLvfdpIXE10WoZjNV/e+1p4Foi07t8qBNh g==;
X-CSE-ConnectionGUID: O/fi7zJXSdK6tHx+PpEujA==
X-CSE-MsgGUID: znCFw8TqRv674Ce1AAwfjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2306989"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2306989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 03:02:48 -0800
X-CSE-ConnectionGUID: dnmaxCX+S9+wwYOcU+Ve1g==
X-CSE-MsgGUID: HVpCYVeVT5WGe2jJdurQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6014784"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 03:02:47 -0800
Date: Mon, 2 Nov 2026 12:02:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe: fix missing bufops cleanups in
 test
Message-ID: <20261102110244.apbbjirxmlqnmgp5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org
References: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
 <20261102052534.3358553-7-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102052534.3358553-7-priyanka.dandamudi@intel.com>
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
On 2026-11-02 at 10:55:37 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Xe rendercopy test functions created buf_ops context without releasing them.
> Add buf_ops_destroy() calls.

Description do not match a change below.

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 4291db1ccc..a2a0f652d4 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -639,8 +639,10 @@ static void render_stress_copy(int fd, struct igt_collection *set,
>  	/* End all mem copy threads */
>  	for (int i = 0; i < thread_copy_count; i++)
>  		xe_spin_end(data_mem_copy[i].spin);
> -	for (int i = 0; i < thread_copy_count; i++)
> +	for (int i = 0; i < thread_copy_count; i++) {
>  		pthread_join(thread_mem_copy[i], NULL);
> +		pthread_mutex_destroy(&data_mem_copy[i].lock_init_spin);

This change should be in 1st patch.


Regards,
Kamil

> +	}
>  
>  	put_ahnd(ahnd);
>  	xe_vm_destroy(fd, vm);
> -- 
> 2.43.0
> 
