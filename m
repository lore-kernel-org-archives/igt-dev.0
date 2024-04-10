Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B714CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 17:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C609610ED70;
	Wed, 10 Apr 2024 17:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OX+f5f5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB2C11278D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 17:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712771226; x=1744307226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Ts4d5KKeyJD3HaxE8oJ8POc9s/uIkKx/mOYp6kBmgM=;
 b=OX+f5f5yEQ6IhoNtjG+ItTEieK93PoRPqWfWU569+D/rHxNTlCA7aAO+
 FPkoTiQS2aAOErFYFVqFCDLkNPQVWyZpm4BmU6Eu9leZvWyW2zuCkdTLP
 eiZbRr0o2K09RNFgpgDAyjY0KUml25cdxnZADR4ZzaMT90UVMaPbJOLsf
 PnQyfGofrd99KZklK3fcczJSDUeHcKt9fI055sP1vjcIicTAkP1kEBZYg
 V487Glcr1H8emFBDfPptSI/rCRaKN8WbkGtUALIXkP4jgyrIBT9thb+Ot
 bikXz5+yOxm+H4LPqDp4g9bZmKmov2tVc0xRUY6aWU8glvwjOuV/QEtyH w==;
X-CSE-ConnectionGUID: Jlh2bOXJTqaz7eBI23L0fg==
X-CSE-MsgGUID: c5FT+IjJSimmlVBJnxlnXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8014011"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8014011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:47:05 -0700
X-CSE-ConnectionGUID: BnR5j6MWSRSwXMOshAW8vg==
X-CSE-MsgGUID: sNnCSNxIQtW7Rne6FiHvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20724495"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:47:04 -0700
Date: Wed, 10 Apr 2024 19:47:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_queue_property: move skip into
 subtest
Message-ID: <20240410174701.emdjwevsqz3lio5o@zkempczy-mobl2>
References: <20240404155320.98116-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404155320.98116-1-kamil.konieczny@linux.intel.com>
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

On Thu, Apr 04, 2024 at 05:53:20PM +0200, Kamil Konieczny wrote:
> Skips in fixture are safe to use just after begin of igt_main()
> when they be working for all subtests. Later on, when used in
> fixture they can mislead developers reading logs, so move one
> into respective subtest.
> 
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 57baae305..21c51bae5 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -234,13 +234,14 @@ igt_main
>  	igt_subtest_group {
>  		igt_fixture {
>  			sys_fd = igt_sysfs_open(xe);
> -			igt_require(sys_fd != -1);
> -			close(sys_fd);
> +			if (sys_fd != -1)
> +				close(sys_fd);

After this you have stale sys_fd. Might be error prone when next
open will return same fd as sys_fd has in this moment.

>  		}
>  
>  		for (int i = 0; i < count; i++) {
>  			for (typeof(*tests) *t = tests; t->name; t++) {
>  				igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
> +					igt_require(sys_fd != -1);

If you really need to check sysfs is available, maybe add new helper
like:

	void igt_require_sysfs(int fd);

?

Anyway above construct is imo error prone and I vote to not to
merge it.

--
Zbigniew

>  					xe_for_each_gt(xe, gt) {
>  						int engines_fd = -1;
>  						int gt_fd = -1;
> -- 
> 2.42.0
> 
