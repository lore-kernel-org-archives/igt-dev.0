Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7964EC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 13:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74210F751;
	Mon, 18 Mar 2024 13:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RT0dBlzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BB810F751
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710769154; x=1742305154;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mlNvf6A44Qdl2UC66EEUpDsdFdF088WjU0v+yw2DFAQ=;
 b=RT0dBlzjPBCW5u0d7xV5O8K//L219R7I9sWIAR1Y+NPfbCBcBf+9pA1j
 oHkve+ZRqRAiDwsroJcxYdtz1Cr3hEBZE42ADiAoMLOUYCLSP3gaTvrsw
 59zHgDoxIH7qGr66X40aPevbGufg3EtHly1Er9fcf3BrDNkkV10KFAIsX
 ujcJEHiQDCvz28vq1RyzzEDd1O7PJ6j5llV19SnKPfnA3qmbtHY1keKQ5
 iuj2YRDLrXb2swUF2MKP5mRo31/jLlysOtYJ6L/hlj9d9IXnBNjDsgvtX
 w0XekODpP9AQNrYBPMqMlFqablGDq0sFf7KS+ZRIXIbOhzLdOLYq0kxJE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5414164"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5414164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13457280"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:39:14 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.245.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 66CB4580E3B;
 Mon, 18 Mar 2024 06:39:12 -0700 (PDT)
Date: Mon, 18 Mar 2024 14:39:09 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/xe_debugfs: fix musl build
Message-ID: <20240318143909.446f5241@maurocar-mobl2>
In-Reply-To: <20240315131901.28144-4-kamil.konieczny@linux.intel.com>
References: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
 <20240315131901.28144-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 15 Mar 2024 14:19:01 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> On musl build the PATH_MAX define is missing, fixed this with
> including limits.h. Also while at this, move system includes
> before igt ones and sort them.
> 
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/intel/xe_debugfs.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 4fd5ebc28..c5a586e9b 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -12,17 +12,18 @@
>   * Description: Validate debugfs entries
>   */
>  
> +#include <fcntl.h>
> +#include <dirent.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <sys/types.h>
> +
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> -#include <fcntl.h>
> -#include <string.h>
> -#include <sys/types.h>
> -#include <dirent.h>
> -
>  struct {
>  	bool warn_on_not_hit;
>  } opt = { 0 };
