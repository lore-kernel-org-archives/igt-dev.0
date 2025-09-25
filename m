Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979AACAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 09:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CD410E2A0;
	Thu, 25 Sep 2025 09:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fECICwj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1E510E2A0
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 09:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758793608; x=1790329608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=teocTrygjoUgcYBPZd8o0XSyj/h1CUl2bcGUNqv4DAk=;
 b=fECICwj0sAdhq+qwY2lOF43jSFVcHvPA0reo3M6fy0fU7+u6knHLZlST
 jdh7Q2lYyIYvvM0bHro5tDhrDBOdZSPRODtBmSj7mAD6V29EQGy2inC/B
 Jh+lMNMr50S7ggkLfdGm0PmiWqwCFBBkXkqUwbkBD/9Z5Q6CylhFqo38J
 r0jug6pBBanu/0/M8yuhigXrae+K+U3+KHKaiOPESJd15Z0WxX2x+hfxU
 eeTHhYSXBp1wpZU28IVdLh1b3uMEzKJVmD7LvvPCyBu/rWaMs661nHCbK
 jXK/JV8IVRRir58NjpSW4A34/h5ZCStBV4UxkRjdVGSU5i34/CaUWRW+W g==;
X-CSE-ConnectionGUID: iSrzkv7/RVe2sSeaNVXK0g==
X-CSE-MsgGUID: RJSr+nIgQaikwU9EVaJtOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78541870"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="78541870"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:46:47 -0700
X-CSE-ConnectionGUID: yLDsJQ9xTaiTk7dNylAh4g==
X-CSE-MsgGUID: H+5T/khCSCWWZN/NXUryQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177347396"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 02:46:46 -0700
Date: Thu, 25 Sep 2025 11:46:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_psr: Use 10x timeouts in simulation
 environment
Message-ID: <20250925094628.s6bv5ld6bculj3ju@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org, jeevan.b@intel.com
References: <20250925044136.3654614-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925044136.3654614-1-jouni.hogander@intel.com>
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

Hi Jouni,
On 2025-09-25 at 07:41:36 +0300, Jouni Högander wrote:
> PSR tests are timeouting in simulation environment. Use 10 as a multiplier
> for timeouts in simulation environment.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  lib/igt_psr.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index d5b4198c3..c03042899 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -136,12 +136,14 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>  	return active;
>  }
>  
> +#define PSR_TIMEOUT(timeout)	(igt_run_in_simulation() ? 10 : 1 * (timeout))

You need more braces here:

#define PSR_TIMEOUT(timeout)	((igt_run_in_simulation() ? 10 : 1) * (timeout))

Regards,
Kamil

> +
>  /*
>   * For PSR1, we wait until PSR is active. We wait until DEEP_SLEEP for PSR2.
>   */
>  bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
>  {
> -	return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 20);
> +	return igt_wait(psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(500), 20);
>  }
>  
>  bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
> @@ -153,9 +155,9 @@ bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
>  	 */
>  	if (output != NULL &&
>  	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> -		return igt_wait(psr_active_check(debugfs_fd, mode, output), 40, 1);
> +		return igt_wait(psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(40), 1);
>  	else
> -		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
> +		return igt_wait(!psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(40), 1);
>  }
>  
>  bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
> @@ -167,9 +169,9 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
>  	 */
>  	if (output != NULL &&
>  	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> -		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
> +		return igt_wait(psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(500), 1);
>  	else
> -		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
> +		return igt_wait(!psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(500), 1);
>  }
>  
>  static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
> -- 
> 2.43.0
> 
