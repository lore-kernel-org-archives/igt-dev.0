Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07956C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 16:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9318979D;
	Wed, 23 Jul 2025 16:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8beFBVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F57510E82F
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753289920; x=1784825920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dUOhQQuqJtM93Mvbi/FAfnZqHLHFjm9Y17OqrtxabZE=;
 b=C8beFBVJzrp2rE/PQlNRlQfP60FbnbLMeNBcFuYoTNjFBQ0MsW3b2r2o
 t5KjIS5Xbn3I+gZvSNE0Zw8CfNjhrpZJ9X2k6zm3c6YywEAydVUO248Th
 esZlAN8ksu3iDloXvICVljo/dlCIhI9MsczVkdBRpm0PwtWfD7j48Ebpa
 IaCtfSy8QoJtblOP6iM0pRz/5TTN3PDPr7JrEDjcZCqF3ALZWkRdd+hB2
 pKfuZiBOodgyeGnMPHLbTTrNz5b9R0pKFeHBmucJj5aSpdDl7V3k2Z8iN
 MFQ194SrdbHTWwCddyohCvgEZAktIhcfZl6i4lKnZFLUKxxvtOej3l6K6 g==;
X-CSE-ConnectionGUID: 14KVHfFaSHCjky/EEiogMg==
X-CSE-MsgGUID: 6GtDZiT7QdWa32hD3P/2YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66279212"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66279212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:58:40 -0700
X-CSE-ConnectionGUID: 6aZxDex1TSa7y6In81XQPA==
X-CSE-MsgGUID: nN2IWsp0RSmYcmFC/y8Sfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159910615"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 09:58:39 -0700
Date: Wed, 23 Jul 2025 18:58:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 i-g-t 3/3] lib/tests: Update hook unit testing
Message-ID: <20250723165823.ia4m5v56uipe4ytc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20250723104406.58784-1-peter.senna@linux.intel.com>
 <20250723104406.58784-4-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723104406.58784-4-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-07-23 at 12:44:06 +0200, Peter Senna Tschudin wrote:
> The unit testing for hooks checks env vars created by the hooks
> infrastructure.  Update unit testing to account for the new
> IGT_HOOK_KMOD_UNBIND_MODULE_NAME env var.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Thank you for fixint it, now it works.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v4:
>  - Introduced in v4
> 
>  lib/tests/igt_hook.c             | 1 +
>  lib/tests/igt_hook_integration.c | 9 +++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
> index 676c6eb7a..420a19c72 100644
> --- a/lib/tests/igt_hook.c
> +++ b/lib/tests/igt_hook.c
> @@ -16,6 +16,7 @@ static const char *env_var_names[] = {
>  	"IGT_HOOK_TEST",
>  	"IGT_HOOK_SUBTEST",
>  	"IGT_HOOK_DYN_SUBTEST",
> +	"IGT_HOOK_KMOD_UNBIND_MODULE_NAME",
>  	"IGT_HOOK_RESULT",
>  };
>  
> diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
> index 8525c6a3f..3b35065ab 100644
> --- a/lib/tests/igt_hook_integration.c
> +++ b/lib/tests/igt_hook_integration.c
> @@ -16,24 +16,25 @@ char fake_argv_buffer[1024];
>  char *fake_argv[64];
>  int fake_argc;
>  
> -#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
> +#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, unbind_module_name, result) \
>  { \
>  	"IGT_HOOK_EVENT=" evt_name, \
>  	"IGT_HOOK_TEST_FULLNAME=igt@igt_hook_integration" fullname_suffix, \
>  	"IGT_HOOK_TEST=igt_hook_integration", \
>  	"IGT_HOOK_SUBTEST=" subtest, \
>  	"IGT_HOOK_DYN_SUBTEST=" dyn_subtest, \
> +	"IGT_HOOK_KMOD_UNBIND_MODULE_NAME=" unbind_module_name, \
>  	"IGT_HOOK_RESULT=" result, \
>  }
>  
>  #define TEST_ENV(evt_name, result) \
> -	ENV_ARRAY(evt_name, "", "", "", result)
> +	ENV_ARRAY(evt_name, "", "", "", "", result)
>  
>  #define SUBTEST_ENV(evt_name, subtest, result) \
> -	ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
> +	ENV_ARRAY(evt_name, "@" subtest, subtest, "", "", result)
>  
>  #define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
> -	ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, result)
> +	ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, "", result)
>  
>  const char *pre_test_env[] = TEST_ENV("pre-test", "");
>  const char *pre_subtest_a_env[] = SUBTEST_ENV("pre-subtest", "a", "");
> -- 
> 2.43.0
> 
