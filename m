Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D71EED613
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 15:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5732310E22E;
	Thu, 12 Sep 2024 15:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuqFDgPg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE4810E22E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726154720; x=1757690720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q5I2SU8MT2INp2YEleA2/RNBMfjLQuTgsuwaFYfa7k8=;
 b=PuqFDgPgI4BHu9Js2Y4tFq5SZXM4znu+AjKqU4iJ9sgA5N6RMhNAfhPV
 zE2Yo5QsAOOaKoE3iyx0v7hFEPbpXGEtz4qMwHW4fv+zAclNxdo1m46fR
 eugm1gq2YkvrSyJJxzTmI47hiCyj5Z7fZNWxa5ryx6FxvunCgmSOjPlLN
 EffzbEnavVB1H5QDfNh2PtAVDVU38nZlHDB0th2r3YgCgM5ldI0TjIIqR
 sr88grwa3gXk/7NsNcZbByoVE7AGojwgYobXLUyfG9jg+9PzfZfRg5kc7
 9AQejr0opeQXJhIK7M7j4bdGxWP8++Dke4JKcuboCn7W9/lg+vda+bmAz A==;
X-CSE-ConnectionGUID: +r0TvveOSXKX+5eb/nm7Wg==
X-CSE-MsgGUID: eVoet+qxTTm90ZsfLSiNYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25146497"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25146497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 08:25:20 -0700
X-CSE-ConnectionGUID: B6QBKFw1QLqFKcv6cB2ciA==
X-CSE-MsgGUID: zN94LVcvRoqIqsnivvjDOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67835201"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 08:25:19 -0700
Date: Thu, 12 Sep 2024 17:24:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, vinay.belgaumkar@intel.com,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t] gputop: Print message without clients
Message-ID: <20240912152459.mobiy2gamphm2amt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org, vinay.belgaumkar@intel.com,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240912141426.4115404-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912141426.4115404-1-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-09-12 at 07:14:26 -0700, Lucas De Marchi wrote:
> Devs are often confused why gputop doesn't display anything and think it
> doesn't yet support the driver/platform. This is different from
> intel_gpu_top that can display a header with engines, because in that
> case there is a fixed set of engines and no variance according to the
> driver.
> 
> Print a message to give a hint that nothing is displayed because there's
> nothing running.

Could we diplay at least current power consumption and accumulated one?

It is only a suggestion, so
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/gputop.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 8842eebbd..43b01f566 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -39,6 +39,9 @@ enum utilization_type {
>  
>  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>  
> +#define ANSI_HEADER "\033[7m"
> +#define ANSI_RESET "\033[0m"
> +
>  static void n_spaces(const unsigned int n)
>  {
>  	unsigned int i;
> @@ -82,7 +85,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>  	if (lines++ >= con_h)
>  		return lines;
>  
> -	printf("\033[7m");
> +	printf(ANSI_HEADER);
>  	ret = printf("DRM minor %u", c->drm_minor);
>  	n_spaces(con_w - ret);
>  
> @@ -123,7 +126,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>  		}
>  	}
>  
> -	printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
> +	printf(" %-*s" ANSI_RESET "\n", con_w - len - 1, "NAME");
>  
>  	return lines;
>  }
> @@ -447,6 +450,13 @@ int main(int argc, char **argv)
>  		update_console_size(&con_w, &con_h);
>  		clrscr();
>  
> +		if (!clients->num_clients) {
> +			const char *msg = " (No GPU clients yet. Start workload to see stats)";
> +
> +			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
> +			       (int)(con_w - strlen(msg) - 1), msg);
> +		}
> +
>  		igt_for_each_drm_client(clients, c, i) {
>  			assert(c->status != IGT_DRM_CLIENT_PROBE);
>  			if (c->status != IGT_DRM_CLIENT_ALIVE)
> -- 
> 2.43.0
> 
