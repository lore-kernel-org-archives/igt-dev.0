Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0292CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 14:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957B510E94A;
	Thu, 25 Sep 2025 14:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgyqRN4O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC3710E94A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758809035; x=1790345035;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V+P9P6Qh3PncrESDfp03tGjM/A6cC0KelWlG+jnK1Cg=;
 b=IgyqRN4OhiCIV3HlEOoT9wZJs7FgRkwI4Q7XCIjLdN+qkiy7v23dxUZ2
 3OeiOOZTHS4n/YygcMGZYrTADVf6SRl1tT1NsZjIDTF4bH5cqBf17eQHg
 Tkji0kTaqEFqumIMmuzPcRa1sLnZc69sPl1aE4G796W5851+4uEWt27g3
 400jubYESeTJjPjGkafZSAwkBqs3DmAY5ZhgiQnoxPWMuegS0xmg9+LTq
 gHepDmchvWYMZFQt+VJqi2w6kCHIm11JIVYBCc4jvYvA183N9zV+Ns1HV
 0UIoRIdha43fLw689tpvtQqLQzFmxw+yamfE8+VHbnfQfbOLPfctd6UH2 A==;
X-CSE-ConnectionGUID: 60vCTW2DT7WaH7tE8wHaRA==
X-CSE-MsgGUID: T/xXmpaKQzWDHY4HGuOhCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71374812"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="71374812"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:03:54 -0700
X-CSE-ConnectionGUID: c2la2X0xRBKgI2RK4dXtCg==
X-CSE-MsgGUID: Epp/ktmmQ7+raYPT1K8lgQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 07:03:53 -0700
Date: Thu, 25 Sep 2025 16:03:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com
Subject: Re: [PATCH i-g-t v2] lib/igt_psr: Use 10x timeouts in simulation
 environment
Message-ID: <20250925140350.k57eupsfh7wqevid@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org, jeevan.b@intel.com
References: <20250925095820.3769042-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925095820.3769042-1-jouni.hogander@intel.com>
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
On 2025-09-25 at 12:58:20 +0300, Jouni Högander wrote:
> PSR tests are timeouting in simulation environment. Use 10 as a multiplier
> for timeouts in simulation environment.
> 
> v2: fix operator precedence problem
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

This is the same, no fix here!?

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
