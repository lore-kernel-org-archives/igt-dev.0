Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45895C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 17:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039310E838;
	Wed, 23 Jul 2025 17:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEO57cde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BD410E838
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753290090; x=1784826090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cIe3bKz5Z+nzuHVYt5ClVHKVLMbXuavK4FnAlTdIM98=;
 b=eEO57cdeONfiig9LKJz4sNhXM2tlCJ6lnQESTR6eAON+90zmiisoRMAz
 WDe57QKF+ki5dpfzl+wV2cYjoOOii4ShKdPUm4K8rnACMcJ0yRaMKjfJd
 knGVszWizHaIQe7TztkRnmml3m/YdvpoheW6xXejxP3M9ICCQkWjn/iZz
 6VSdiVIYYWJNZH99gpNddW5ESR95kUhAvpQ2Z/UQYnSFt+JTWChdyVUhN
 lOMPSsHJr9L5GAVRpBV4WVQxkT8c2RS0m/St3KrmysJKiNn/iNzCYNZ6D
 NpMGF1uIVJLWhlTswrhCfrzrvXnThNgZqZCaa2N7Gg897YyfVAEQdTFAP g==;
X-CSE-ConnectionGUID: 04OHAoIpTtGoHTnqrn2O2Q==
X-CSE-MsgGUID: UXKrm5GiRyGHwBXD6eCvvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55524734"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55524734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:01:29 -0700
X-CSE-ConnectionGUID: 9kWy1/9vRK6ZjVGvMKVUtg==
X-CSE-MsgGUID: 1Emm2eKRRq6PDSUuk3OqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159383341"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:01:29 -0700
Date: Wed, 23 Jul 2025 19:01:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 i-g-t 2/3] lib/igt_kmod: Add IGT_HOOK_POST_KMOD_UNBIND
Message-ID: <20250723170126.zkogte47kntgwwae@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20250723104406.58784-1-peter.senna@linux.intel.com>
 <20250723104406.58784-3-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723104406.58784-3-peter.senna@linux.intel.com>
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
On 2025-07-23 at 12:44:05 +0200, Peter Senna Tschudin wrote:
> Adds an igt_hook after the unbind operation of the kmod intended as
> a strategice entry point for kmemleak scans.
> 
> Can be used with --hook  'post-kmod-unbind:...'
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> v4:
>  - unchanged from v3

You got r-b from Gustavo so imho you could add his r-b here.
Do I miss something? Or do you plan on merging this with last patch?

Regards,
Kamil

> 
> v3:
>   - Renamed the hook to IGT_HOOK_POST_KMOD_UNBIND as the unbind can also happen
>    for snd modules
>  - Changed the logic for the IGT_HOOK_KMOD_UNBIND_MODULE_NAME env var so that
>    it is only populated when the correct hook is used.
> 
> v2:
>  - Added code ducumentation for new hook
>  - Added env var IGT_HOOK_KMOD_UNBIND_MODULE_NAME and extended help text
> 
>  lib/igt_hook.c | 11 +++++++++++
>  lib/igt_hook.h |  3 +++
>  lib/igt_kmod.c |  8 ++++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> index 8932d118d..f86ed56f7 100644
> --- a/lib/igt_hook.c
> +++ b/lib/igt_hook.c
> @@ -74,6 +74,8 @@ static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
>  		return "post-subtest";
>  	case IGT_HOOK_POST_TEST:
>  		return "post-test";
> +	case IGT_HOOK_POST_KMOD_UNBIND:
> +		return "post-kmod-unbind";
>  	case IGT_HOOK_NUM_EVENTS:
>  		break;
>  	/* No "default:" case, to force a warning from -Wswitch in case we miss
> @@ -335,6 +337,8 @@ static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_
>  	setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>  	setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>  	setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
> +	setenv("IGT_HOOK_KMOD_UNBIND_MODULE_NAME",
> +	       evt->evt_type == IGT_HOOK_POST_KMOD_UNBIND ? evt->target_name : "", 1);
>  	setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>  }
>  
> @@ -470,6 +474,9 @@ below:\n\
>  		case IGT_HOOK_POST_TEST:
>  			desc = "Occurs after a test case has finished.";
>  			break;
> +		case IGT_HOOK_POST_KMOD_UNBIND:
> +			desc = "Occurs after the kernel module is unbound from the device.";
> +			break;
>  		default:
>  			desc = "MISSING DESCRIPTION";
>  		}
> @@ -504,6 +511,10 @@ available to the command:\n\
>    values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
>    events and will be the empty string for other types of events.\n\
>  \n\
> +  IGT_HOOK_KMOD_UNBIND_MODULE_NAME\n\
> +  Name of the kernel module that was unbound from the device. This is only\n\
> +  applicable on the `IGT_HOOK_POST_KMOD_UNBIND` event and will be the empty\n\
> +  string for other types of events.\n\
>  \n\
>  Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
>  when matching events and running hook commands.\n\
> diff --git a/lib/igt_hook.h b/lib/igt_hook.h
> index e9f97b79b..11d839dfd 100644
> --- a/lib/igt_hook.h
> +++ b/lib/igt_hook.h
> @@ -26,6 +26,8 @@ struct igt_hook;
>   * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
>   * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished with
>   * the test code.
> + * @IGT_HOOK_POST_KMOD_UNBIND: Occurs after the kernel module is unbound
> + * from the device.
>   * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the number
>   * of possible events tracked by igt_hook.
>   *
> @@ -39,6 +41,7 @@ enum igt_hook_evt_type {
>  	IGT_HOOK_POST_DYN_SUBTEST,
>  	IGT_HOOK_POST_SUBTEST,
>  	IGT_HOOK_POST_TEST,
> +	IGT_HOOK_POST_KMOD_UNBIND,
>  	IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
>  };
>  
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 6d7f5705c..a10626eed 100644
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
> @@ -634,6 +636,12 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  
>  	closedir(dir);
>  
> +	igt_hook = igt_core_get_igt_hook();
> +	igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
> +		.evt_type = IGT_HOOK_POST_KMOD_UNBIND,
> +		.target_name = mod_name,
> +	});
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
