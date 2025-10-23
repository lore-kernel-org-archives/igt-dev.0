Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105F4CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 10:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48E710E3B6;
	Thu, 23 Oct 2025 10:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8cULllP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7AD10E3B6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761216307; x=1792752307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zyur8Ojlv/rbYDw+5nhsKYSj9nGmgG6o3lPECDZn4+I=;
 b=e8cULllPThR/xoRM5diWia/CzbKQmyPTbZ1f/XKUfuHm9u9pmvVGw4sk
 70dlGDeth83V31jubDcJ0orU/3Dcp8vav6/HbB02YLjH393g++RFr6FmS
 Yr8XpsvXDPwE3yeJGE72ZGCt6IJdSsqj7LLJhU5AHWIvwO3+eUo7no0kN
 Hyy1agGueEI+mqrPzk+DNou0KVMy5nDbA4i0yMZHb2ZXfAOQwC/0zGBa9
 APMXNK+ByHYZlxoHjdzRub4faI3JAtTgElnrdeNthXMkAI9HZgvULygCm
 ST9AuRtWVLwPmuhN4hD7G0TwEU/dVMXXlqQBqp8BmAa6NQMk5u1yW9CX7 A==;
X-CSE-ConnectionGUID: s5THsg8KRoOyNGqmm/fYSQ==
X-CSE-MsgGUID: t4wlWOniQzGF9o4y0boxtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63275507"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63275507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:45:07 -0700
X-CSE-ConnectionGUID: s/oc8jygR96uWSxm4YG75g==
X-CSE-MsgGUID: 4f0GVEmTTAa3mnJ5WoniqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="188180152"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:45:05 -0700
Date: Thu, 23 Oct 2025 12:45:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, stuart.summers@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH] tests/intel/xe_fault_injection: Force clear injection
 list on task end
Message-ID: <20251023104502.55n2wksij3tl4bof@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, stuart.summers@intel.com,
 daniele.ceraolospurio@intel.com
References: <20251022211147.27810-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251022211147.27810-2-jonathan.cavitt@intel.com>
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
On 2025-10-22 at 21:11:48 +0000, Jonathan Cavitt wrote:
> Add a call to injection_list_clear at the end of the test to erase any
> potential lingering fault injections before performing the kmod bind to
> rebind the Xe driver.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 621af27d4b..4b48816341 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -688,6 +688,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  	igt_fixture {
>  		close(sysfs);
>  		drm_close_driver(fd);
> +		injection_list_clear();

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		igt_kmod_bind("xe", pci_slot);
>  	}
>  }
> -- 
> 2.43.0
> 
