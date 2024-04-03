Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40557CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA1110FD07;
	Wed,  3 Apr 2024 17:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAumCIJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B0F10FD07
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712163825; x=1743699825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cjLncqzD/izuLW9c5W3c6WojWREQ5czeW5EqoGejX5k=;
 b=RAumCIJMY3doJNgnvWoWwZ5wryPUomTkDC8bXdfPzmzNfaJR0owvpdGA
 4SNuhK728HiKnq/GfspD7T0tF/5PzZLBLP1UejRE+J3Nk8KKbS44iPZ3a
 bXgUUP1TPC4B3MEzUi9X1X8RmvWouxYyZBOuiDYPQc57XtE0P+WdsEKZk
 g9n1Y5RBSDPhHRAExP63eZChfS6JjPbz2V/u4whZmmVKbETk6ldHhioEe
 Q2DK+59CiIzUE6t/h1GuPnWKG9SuGVerQizFNwxfQQwgknrBaXFVo1FY2
 dEzYv+uh8ND7DG3zVgMXrt1tfhov26OJwhBYLnuy8CfkLa9QF03T6MY2m A==;
X-CSE-ConnectionGUID: aVpKjTBsRxqrbZGuaSgi+g==
X-CSE-MsgGUID: Wv1vW7FcQj+Qih+059cuYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18861577"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18861577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:03:44 -0700
X-CSE-ConnectionGUID: n+ZOwLc6SmqvR6FZ77xzlg==
X-CSE-MsgGUID: ikzE02r5QMK2uSR1jUdcgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49462298"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:03:43 -0700
Date: Wed, 3 Apr 2024 19:03:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nakshtra.goyal@intel.com, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, himal.prasad.ghimiray@intel.com,
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Message-ID: <20240403170339.mo7bk5hl24jhtzaa@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, nakshtra.goyal@intel.com,
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

Hi Nakshtra,

On 2024-04-03 at 09:54:45 +0530, nakshtra.goyal@intel.com wrote:

One more nit, see below.

> From: nakshtra goyal <nakshtra.goyal@intel.com>
--------^ ------ ^

> 
> Change in igt_assert_f function parameters so that it also validate for
> property value equals to 0.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: nakshtra goyal <nakshtra.goyal@intel.com>
---------------- ^ ------ ^

All this should start from capital letters:

Nakshtra Goyal <nakshtra.goyal@intel.com>

Regards,
Kamil

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
> +		igt_assert_f(property_value >= 0, "Default value %s is not present!\n", de->d_name);
>  
>  		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
>  
> -- 
> 2.34.1
> 
