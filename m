Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF92CC6B10
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 14:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BAF10E8C3;
	Tue, 13 Oct 2026 14:10:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B4C10E819
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791900547; x=1823436547;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yBwA4b/eeY1mjMI0SyC6/bwkSYTv5RY4Lycu4DqnSiE=;
 b=oAZzqDdJRt6pNrhAPAaArmPfFvzB8Fo53JIOP7BI+ouSmUqG26LaJI50
 NNDUHFCxhfE8tqOkRm9Jx7hqEza1Wl91jmI3MpauPtQ45piL1Yb10hgj4
 wpD3TGh5QjLcWuf7HRdUXpJP3MlGa2A0qN9lAwl+pMKR4FSzDtQ3TZHUp
 SWjjGE8sGfTrO4mVtt21PxLmhpd+ThTHIOJZhvHWomMI1ttVkpMqMaYNi
 GTIw7D3AJTMRfH51HwJdp2BMw+9CkTHct+zK+K+q47ErADzeMkQWUw7mB
 Uu2uFq8lpV3+aEX3Hx1cIytdffEyJtISxteVR/K1DofIhnUlWOIjueyI1 g==;
X-CSE-ConnectionGUID: R4kxdppvRN6ryi1esBxzhQ==
X-CSE-MsgGUID: WbDYvKy7QveDXD/DXlsssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513460"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="513460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:08:46 -0700
X-CSE-ConnectionGUID: +miYpP75TyGMRrNEbgOk0A==
X-CSE-MsgGUID: /5xEqejzSieMi27VGVsxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1502270"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:08:45 -0700
Date: Tue, 13 Oct 2026 16:08:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, alex.zuo@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: Re: [PATCH] tests/intel/xe_exec_queue_property: Free eq and vm after
 test
Message-ID: <20261013140842.27qtagzzyrb4lmd6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, alex.zuo@intel.com,
 dnyaneshwar.bhadane@intel.com
References: <20261008194203.126177-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008194203.126177-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2026-10-09 at 03:42:02 +0800, Jonathan Cavitt wrote:
> The function test_set_property() creates both an exec queue and a VM
> every run, but fails to free either of them after completion.  This may
> result in memory leaks.  Attempt to free them.
> 
> Note that the exec queue only needs to be freed if it is expected to be
> created.  This is only the case when the expected error value is zero.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_queue_property.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 3504f19b71..31a2ec2a7d 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -61,11 +61,17 @@ static void test_set_property(int xe, int property_name,
>  		.property = property_name,
>  		.value = property_value,
>  	};
> +	uint32_t vm;
>  	uint32_t exec_queue_id;
>  
> -	igt_assert_eq(__xe_exec_queue_create(xe, xe_vm_create(xe, 0, 0), 1, 1,
> -					     &instance, to_user_pointer(&ext),
> +	vm = xe_vm_create(xe, 0, 0);
> +
> +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					     to_user_pointer(&ext),
>  					     &exec_queue_id), err_val);
> +	if (!err_val)
> +		xe_exec_queue_destroy(xe, exec_queue_id);
> +	xe_vm_destroy(xe, vm);
>  }
>  
>  static void test_property_min_max(int xe, int engine, const char **property,
> -- 
> 2.43.0
> 
