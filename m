Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22239CAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 12:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FE710E375;
	Fri, 26 Sep 2025 12:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhqdgTdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D220A10E375
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758889778; x=1790425778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CMXC3n2xobZ7utpEm7FGBqHg8kIX/oR2aXfry+cPqPk=;
 b=MhqdgTdF1NllcHxrtOr/Ybt3IdBLQQhzfkGkyTYEzCAA9i0RU15znbIr
 gNmT6OCMM8w2HmL/UBBArwY2EM0I2dsROS0UN+seFq4iXpBNg/4cAHTEs
 jhzj0gqnt1MtvKefJdQfNQydH84f/Hjo3PS5UkH+qCE2+xljj+zn0o+DL
 rclnOc2p79Il7fBS84Jk1dLYy5t0N990r4AK5C5750DWTSmVUHof671y8
 l6r+6irXS7us/O2Y/QO8qd1ZuufqVf/OGMRx1TlWy+TifDcOCka0zIJ8y
 +kuaA940AWi2GyIzAMUKHwgIB/zDU9OwtPcIBTi2mcLFEbQL1b8y8Ibrz g==;
X-CSE-ConnectionGUID: e1KhkPsGQk+jfhLJHPvfNw==
X-CSE-MsgGUID: TsvuB/IuSVuBcffb6so9Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72583551"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72583551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 05:29:37 -0700
X-CSE-ConnectionGUID: lvQ+zkdYRMunwDKbEMrGFQ==
X-CSE-MsgGUID: NrI6UT4/T+CkUnkV9VUnCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177444460"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 05:29:34 -0700
Date: Fri, 26 Sep 2025 14:29:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com
Subject: Re: [PATCH i-g-t v3] lib/igt_psr: Use 10x timeouts in simulation
 environment
Message-ID: <20250926122915.cl22kxj3gyqssnyq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org, jeevan.b@intel.com
References: <20250926045950.3929343-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926045950.3929343-1-jouni.hogander@intel.com>
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
On 2025-09-26 at 07:59:50 +0300, Jouni Högander wrote:
> PSR tests are timeouting in simulation environment. Use 10 as a multiplier
> for timeouts in simulation environment.
> 
> v3: add missing change
> v2: fix operator precedence problem
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  lib/igt_psr.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index d5b4198c3..7e50c3dc6 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -136,12 +136,14 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>  	return active;
>  }
>  
> +#define PSR_TIMEOUT(timeout)	((igt_run_in_simulation() ? 10 : 1) * (timeout))

Now it is correct,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
