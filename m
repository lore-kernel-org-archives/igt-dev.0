Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7250C83F07
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 19:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5725710E8CA;
	Thu,  3 Jul 2025 19:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN/7xsS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4B810E8CA
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570813; x=1783106813;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3vNUSMU77m6fZTiJW02QNpEekqupGOer/wx0/C1TmSU=;
 b=eN/7xsS8Eur4P4litRdqRQwvWaWvBreQQkZQsZCL83QkwwlDW2hu5GuA
 GibMDXS/9rFS/5YTh7qWUtUsBdyTBK8nrPrONlM0xKNeiIumo5WZXQWqO
 EUMxNqNGUFqWZZyz9iH9FYNfKP6sK/l8L7SnzY8030tD6grwJyEXV3XOr
 CLM1zW1bvnfc1Bb2B6zJV0VgCNp6GBgoS4M+trF+MjrHwrZ4DjpWcG4el
 pgwFT+YB/jz/tTdEtXFVVzj+xBzK2M2ZhrXWkFARoQ0t8KD+SkkS/AAsw
 STeiq/8eHFpTd+wb5Hp7N1lvTjghqhhA7RiI8O29UUfyAOiabpsRV0Ry/ A==;
X-CSE-ConnectionGUID: aqPmgLzNQpSdTLNPaMFGqw==
X-CSE-MsgGUID: f9ZqlgPuS3uXp1C8r6LsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53779345"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53779345"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:26:53 -0700
X-CSE-ConnectionGUID: uv2CMHCRQPyyMFmk6LK7Ow==
X-CSE-MsgGUID: cdN0fw62T/Sl4QTsPVKQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="154093026"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:26:52 -0700
Message-ID: <ef8c0cb2-b298-479f-a2f1-750d270082ab@linux.intel.com>
Date: Thu, 3 Jul 2025 21:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Add IGT_HOOK_POST_GPUKMOD_UNBIND
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
 <20250703150304.101208-3-peter.senna@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250703150304.101208-3-peter.senna@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Sorry Lucas and Gustavo for the typo in your email address...

On 7/3/2025 5:03 PM, Peter Senna Tschudin wrote:
> Adds an igt_hook after the unbind operation of the GPU kmod intended as
> a strategice entry point for kmemleak scans.
> 
> Can be used with --hook  'post-gpukmod-unbind:...'
> 

Cc: Lucas de Marchi <lucas.demarchi@intel.com>> Cc: Gustavo Souza
<gustavo.souza@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_hook.c | 5 +++++
>  lib/igt_hook.h | 1 +
>  lib/igt_kmod.c | 7 +++++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> index 8932d118d..a3f92acd4 100644
> --- a/lib/igt_hook.c
> +++ b/lib/igt_hook.c
> @@ -74,6 +74,8 @@ static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
>  		return "post-subtest";
>  	case IGT_HOOK_POST_TEST:
>  		return "post-test";
> +	case IGT_HOOK_POST_GPUKMOD_UNBIND:
> +		return "post-gpukmod-unbind";
>  	case IGT_HOOK_NUM_EVENTS:
>  		break;
>  	/* No "default:" case, to force a warning from -Wswitch in case we miss
> @@ -470,6 +472,9 @@ below:\n\
>  		case IGT_HOOK_POST_TEST:
>  			desc = "Occurs after a test case has finished.";
>  			break;
> +		case IGT_HOOK_POST_GPUKMOD_UNBIND:
> +			desc = "Occurs after the GPU kernel module is unbound from the device.";
> +			break;
>  		default:
>  			desc = "MISSING DESCRIPTION";
>  		}
> diff --git a/lib/igt_hook.h b/lib/igt_hook.h
> index e9f97b79b..92d3986e8 100644
> --- a/lib/igt_hook.h
> +++ b/lib/igt_hook.h
> @@ -39,6 +39,7 @@ enum igt_hook_evt_type {
>  	IGT_HOOK_POST_DYN_SUBTEST,
>  	IGT_HOOK_POST_SUBTEST,
>  	IGT_HOOK_POST_TEST,
> +	IGT_HOOK_POST_GPUKMOD_UNBIND,
>  	IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
>  };
>  
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 6d7f5705c..e300b743a 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -41,6 +41,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_debugfs.h"
> +#include "igt_hook.h"
>  #include "igt_kmod.h"
>  #include "igt_ktap.h"
>  #include "igt_sysfs.h"
> @@ -604,6 +605,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>   */
>  int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  {
> +	struct igt_hook *igt_hook = NULL;
>  	char path[PATH_MAX];
>  	struct dirent *de;
>  	int dirlen;
> @@ -633,6 +635,11 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  	}
>  
>  	closedir(dir);
> +	igt_hook = igt_hook_get_pointer();
> +	igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
> +		.evt_type = IGT_HOOK_POST_GPUKMOD_UNBIND,
> +		.target_name = mod_name,
> +	});
>  
>  	return 0;
>  }

