Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08720C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 14:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BDB10EA25;
	Thu, 20 Jun 2024 14:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8aCIe9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089C410EA25
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718892342; x=1750428342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uIy8Qixn4GdQA1gQT6EJTJA9T769IVvJ9Lr3xvuaoEw=;
 b=S8aCIe9TJi3ansqWg6h6Poy/fAhBfBOCvc0KVz3HeLzzb3Y3SXyG0k6E
 9/Ft6aK5CBZ1a/W783L72NrOIdFH6iOJqONhR1g8Au3vBQMtH+OCFKDC0
 WY+37KepZNIq4v8QJTFrZF2toSIVuRdwN9279STeidxH5YCkaZ/1visG8
 hH+XDuHA5vJzcx1U4/fT3izI7wrlNH2Z3pNMQt2nUx2x0Y0U0AeSgG7/4
 o17kFRXjGNLW4KV9R0yqkQaF5+PmDo8dzlx4cHi+6KA+iZG2PdILYqSdR
 LZdY0JwiBUH5Rzpfio8ds0Z8lrBgA8w7yTmQlhC4EGiKGX6h9MfuHB+qs g==;
X-CSE-ConnectionGUID: yBKikYtwQOepJOCoQjixIw==
X-CSE-MsgGUID: F1bhbidURnm2XrwP6HRr2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15699890"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15699890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:05:42 -0700
X-CSE-ConnectionGUID: Jqa9bA4fQUSbgOREwOtktw==
X-CSE-MsgGUID: eYrvKzojSZiqYG7gvnWF+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42194760"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 07:05:40 -0700
Date: Thu, 20 Jun 2024 16:05:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>, jouni.hogander@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Message-ID: <20240620140537.p6e6mijhcgxp4v4t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 jouni.hogander@intel.com
References: <20240620043341.1438736-1-jeevan.b@intel.com>
 <20240620043341.1438736-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240620043341.1438736-2-jeevan.b@intel.com>
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

Hi Jeevan,
On 2024-06-20 at 10:03:40 +0530, Jeevan B wrote:
> Added helper functions to check sink support for early transport and
> check early transport active check.
> 
> v2: Add early trasport for PR and PSR2.
> v3: Fix check strings.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_psr.c | 14 ++++++++++++++
>  lib/igt_psr.h |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 6008b73a6..c170d8ca8 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -53,6 +53,16 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>  	return strstr(buf, "PSR2 selective fetch: enabled");
>  }
> 

Add description to each public library function.

Regards,
Kamil

> +bool early_transport_check(int debugfs_fd)
> +{
> +	char buf[PSR_STATUS_MAX_LEN];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> +				sizeof(buf));
> +
> +	return strstr(buf, "enabled (Early Transport)");
> +}
> +
>  static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
>  {
>  	char debugfs_file[128] = {0};
> @@ -247,10 +257,14 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>  		       strstr(buf, "Sink support: yes [0x04]") ||
>  		       (strstr(line, "PSR = yes") &&
>  		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
> +	case PSR_MODE_2_ET:
> +		return strstr(buf, "Sink support: yes [0x04]");
>  	case PR_MODE:
>  		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
>  	case PR_MODE_SEL_FETCH:
>  		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
> +	case PR_MODE_SEL_FETCH_ET:
> +		return strstr(line, "Panel Replay Selective Update = yes (Early Transport)");
>  	default:
>  		igt_assert_f(false, "Invalid psr mode\n");
>  		return false;
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index e8595fd8c..a7ebd0739 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -35,8 +35,10 @@ enum psr_mode {
>  	PSR_MODE_1,
>  	PSR_MODE_2,
>  	PSR_MODE_2_SEL_FETCH,
> +	PSR_MODE_2_ET,
>  	PR_MODE,
>  	PR_MODE_SEL_FETCH,
> +	PR_MODE_SEL_FETCH_ET,
>  	PSR_DISABLED,
>  };
>  
> @@ -47,6 +49,7 @@ enum fbc_mode {
>  
>  bool psr_disabled_check(int debugfs_fd);
>  bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
> +bool early_transport_check(int debugfs_fd);
>  bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
>  bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
>  bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
> -- 
> 2.25.1
> 
