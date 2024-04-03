Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E4FCD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F319B112DA7;
	Wed,  3 Apr 2024 17:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8QNrt+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6507112DA7
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712163672; x=1743699672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X7fDWuR0XNP43qpwDHz0jtlR8rew0Rc4L16hBSiKRxA=;
 b=c8QNrt+WVtGWxnUO1r/zYV9NdlIwg4+Y1HuABQNjQ0t2/jTlSn46lJcU
 yjahP/g7DZkAROOgLKLj4S+q+qFkvlX91oyX1ptJHjk9RpcynSheUnpv6
 tr6fvGNf7jIaMeTCVlBy5q3KTeq6lXiCyNrteAyEjeocvu1lhH1237/6X
 Wg6d06DI20BvmxhNB424fLP4wy6umYP24D3YPItLcGf8yxTSZJHqcSpsE
 EXVCXymrYHIwvTbz9dqKtdoZuGYg3EzWbWF1v6smhF6IeB7cKK0ou9L9q
 Oxx8tT/3hMPzQpJWr6xO/OjivHE1ZjN3jKXqko14tiWHlmn3EUQBqkOio Q==;
X-CSE-ConnectionGUID: oZcSnps3Tn+jz05VopLBWQ==
X-CSE-MsgGUID: mOlAyTYTT7i/faHOcfsJyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7527305"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7527305"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:01:12 -0700
X-CSE-ConnectionGUID: ChLgTrU3Q86Ip6Qxfrl/eQ==
X-CSE-MsgGUID: 63aFrN5BTFuuOxNgkF1nJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18545545"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:01:09 -0700
Date: Wed, 3 Apr 2024 19:00:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, himal.prasad.ghimiray@intel.com,
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Message-ID: <20240403170048.o5dq3ps2nekg6zmm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nakshtra.goyal@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, janga.rahul.kumar@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com
References: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403042445.3807946-1-nakshtra.goyal@intel.com>
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

Hi nakshtra.goyal,
On 2024-04-03 at 09:54:45 +0530, nakshtra.goyal@intel.com wrote:
> From: nakshtra goyal <nakshtra.goyal@intel.com>
> 
> Change in igt_assert_f function parameters so that it also validate for
> property value equals to 0.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: nakshtra goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_sysfs_defaults.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> index 4a6b3ba6d..a0014a832 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -42,8 +42,8 @@ static void test_defaults(int xe, int engine, const char **property)
>  
>  		igt_debug("Checking attr '%s'\n", de->d_name);
>  
> -		igt_assert_f(property_value = igt_sysfs_get_u64(defaults, de->d_name),
> -			     "Default value %s is not present!\n", de->d_name);
> +		property_value = igt_sysfs_get_u64(defaults, de->d_name);

This could assert at lib, why not using:

bool __igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value);

Also, type for 'int property_value;' should be uint64_t, not int.

Regards,
Kamil

> +		igt_assert_f(property_value >= 0, "Default value %s is not present!\n", de->d_name);
>  
>  		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
>  
> -- 
> 2.34.1
> 
