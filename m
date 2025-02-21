Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C203C021AA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 11:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D477310E1DE;
	Fri, 21 Feb 2025 11:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQuJwIpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8ED10E1DE
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740137549; x=1771673549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OJxTU2MMzF1BOs185SQG4JbuWJ6F/P7X7KwiCs0rBqg=;
 b=kQuJwIpHMRETisywoE2rrz6DcVFx4YaYuSlFXxKFeCqU++COShGb5CuI
 Zje1iZ1HHDo/pIQDvx0Q05QM1W79rQ7g8R1YaG5iBjMISn3KgLi66gR/W
 xGUeMh1bTaZ2gX2N+Vt3HzICdlnsuLDdW96u+34Tba6toj7P6Cx12w3sR
 nestP1BWt8yMy3lLlQr97PmWCTuWvDcVNYPHniKi/Sf0OdGluqxxu65mM
 gPlfXeoTa5ObwIV6aVkxyeCEMn0XkPk0P1PA2YXRh662nbTx44fVzcGxG
 n8AN6dBTiUEZ+1wrJnrNl48WyPHw4lepVlNsxMyAXi7Bap5OIHO1USQ5e g==;
X-CSE-ConnectionGUID: +I0iLiBIS3iJbc2jpusXXQ==
X-CSE-MsgGUID: 2F9DtPInQBi33SnRb4Gmew==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40873292"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="40873292"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 03:32:28 -0800
X-CSE-ConnectionGUID: 1hs7xu+FT12eH468T6RImA==
X-CSE-MsgGUID: pmmQu4qYRJakJtwq9ZYgbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115882040"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:32:26 -0800
Date: Fri, 21 Feb 2025 12:32:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 lucas.demarchi@intel.com
Subject: Re: [PATCH i-g-t v3 1/3] lib/igt_perf: Use shift parameter for format
Message-ID: <20250221113211.vekz6z3nrwxcyenm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 vinay.belgaumkar@intel.com, lucas.demarchi@intel.com
References: <20250220112556.1585555-1-riana.tauro@intel.com>
 <20250220112556.1585555-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220112556.1585555-2-riana.tauro@intel.com>
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

Hi Riana,
On 2025-02-20 at 16:55:54 +0530, Riana Tauro wrote:
> Replace start with shift and remove end parameter.

Maybe s/Replace/Rename/ ? Up to you.

> No functional changes
> 
> v2: fix documentation (Kamil)
> 
> Fixes: 8baa7d34b876 ("lib/igt_perf: Add utils to extract PMU event info")

You added here Fixes tag so please also fix function perf_event_config
first return should be 'return -errno' (this is improvement)
while second is wrong and should be 'return -EINVAL' (real fix)

Also describe all changes
s/No functional changes/...your descriptiom here...

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

with above fixes this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_perf.c       | 13 +++++++------
>  lib/igt_perf.h       |  2 +-
>  tests/intel/xe_pmu.c |  6 +++---
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 2d0e699e3..d63371c92 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -93,18 +93,19 @@ const char *xe_perf_device(int xe, char *buf, int buflen)
>  }
>  
>  /**
> - * perf_event_format: Returns the start/end positions of an event format param
> + * perf_event_format: Returns the shift for format param
>   * @device: PMU device
> - * @param: Parameter for which you need the format start/end bits
> + * @param: Parameter for which you need the format
> + * @shift: bit shift
>   *
>   * Returns: 0 on success or negative error code
>   */
> -int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end)
> +int perf_event_format(const char *device, const char *param, uint32_t *shift)
>  {
>  	char buf[NAME_MAX];
>  	ssize_t bytes;
> -	int ret;
> -	int fd;
> +	uint32_t end;
> +	int ret, fd;
>  
>  	snprintf(buf, sizeof(buf),
>  		 "/sys/bus/event_source/devices/%s/format/%s",
> @@ -120,7 +121,7 @@ int perf_event_format(const char *device, const char *param, uint32_t *start, ui
>  		return -EINVAL;
>  
>  	buf[bytes] = '\0';
> -	ret = sscanf(buf, "config:%u-%u", start, end);
> +	ret = sscanf(buf, "config:%u-%u", shift, &end);
>  	if (ret != 2)
>  		return -EINVAL;
>  
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index 69f7a3d74..58d7d47aa 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -72,6 +72,6 @@ int perf_i915_open_group(int i915, uint64_t config, int group);
>  
>  int perf_xe_open(int xe, uint64_t config);
>  int perf_event_config(const char *device, const char *event, uint64_t *config);
> -int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end);
> +int perf_event_format(const char *device, const char *param, uint32_t *shift);
>  
>  #endif /* I915_PERF_H */
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 62ed3a977..d408d0f99 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -70,14 +70,14 @@ static uint64_t get_event_config(int xe, unsigned int gt, char *event)
>  	int ret;
>  	char xe_device[100];
>  	uint64_t pmu_config;
> -	u32 start, end;
> +	uint32_t shift;
>  
>  	xe_perf_device(xe, xe_device, sizeof(xe_device));
>  	ret = perf_event_config(xe_device, event, &pmu_config);
>  	igt_assert(ret >= 0);
> -	ret = perf_event_format(xe_device, "gt", &start, &end);
> +	ret = perf_event_format(xe_device, "gt", &shift);
>  	igt_assert(ret >= 0);
> -	pmu_config |= (uint64_t) gt << start;
> +	pmu_config |= (uint64_t)gt << shift;
>  
>  	return pmu_config;
>  }
> -- 
> 2.47.1
> 
