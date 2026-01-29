Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7FBD6100E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 12:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A456110E853;
	Thu, 29 Jan 2026 12:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYak+hwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA1B10E857
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769688913; x=1801224913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b8K8jo0oP0Pk+GVldzwyZvrWTTcAfuzmQ1a9ArjZd9o=;
 b=iYak+hwtKWKE6t51IGDLNhZ5AOzfVZ8WLz73HCDyMqd4+Yr/6scOlsQU
 tO9Fv7KmcttYnZXv3C9qp2DFS27WR/jw4NPWvDr8BjwT9vOHqgU+hUIDD
 RcgEno1JcgUDx3r03Dl8e3XQ/v2y28cCr08GP3/IVZKoX0Qhr900ikth4
 O5kIB7HghEaG9Osn2udYad2ORyZJu2OrY3neNqwhYpUTX6dNR6ksPIP1o
 3lawc1kn0TQ9pkKztiSGmrHEkOeQzX6IeGx/ximvgdYbvhQKkbhM5EuQ7
 1tLWKU3Duy/anN3e/pX7mI+DWKE5NDVmfE8d3G66zOS4pfcDRntT2IpIB g==;
X-CSE-ConnectionGUID: yjw/eFYmRn6RmAwDZfc7xQ==
X-CSE-MsgGUID: bEVTAI9eRISGOajcW+nXpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71013037"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="71013037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:15:13 -0800
X-CSE-ConnectionGUID: T2QE+nsoRXmmzPPaSnv0/A==
X-CSE-MsgGUID: YWb9InDKTaqBpr5rzimTWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208571578"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:15:11 -0800
Date: Thu, 29 Jan 2026 13:15:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 kamil.konieczny@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH 1/2] lib/igt_power: Ensure RAPL reads on correct CPU
Message-ID: <20260129121508.zbsm7u3c54xwes57@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 ville.syrjala@intel.com
References: <20260127095430.536088-4-sk.anirban@intel.com>
 <20260127095430.536088-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127095430.536088-5-sk.anirban@intel.com>
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

Hi Sk,
On 2026-01-27 at 15:24:32 +0530, Sk Anirban wrote:
> Adapt to kernel changes that require RAPL MSR reads to occur on the
> same CPU where the perf event was opened. Pin the thread to the target
> CPU before reading, then restore original affinity.
> 
> This fixes compatibility with kernel changes which enforces
> CPU matching for MSR-based RAPL operations.
> 
> KMD changes: https://gitlab.freedesktop.org/drm/tip/-/commit/1d6c915819f5b805c35487b6ce5923e31a28266b
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  lib/igt_perf.c  | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_perf.h  |  1 +
>  lib/igt_power.c | 17 ++++++++++++++++-
>  lib/igt_power.h |  1 +
>  4 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index fe60241a4..adf4f3844 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -12,6 +12,7 @@
>  #endif
>  #include <time.h>
>  #include <unistd.h>
> +#include <sched.h>

Please add new headers in alphabetical order, here before stdint.h

>  
>  #include "igt_perf.h"
>  
> @@ -238,6 +239,35 @@ _perf_open(uint64_t type, uint64_t config, int group, uint64_t format)
>  	return ret;
>  }
>  
> +static int
> +_perf_open_for_cpu(uint64_t type, uint64_t config, int group, uint64_t format, int *cpu_out)
> +{
> +	struct perf_event_attr attr = { };
> +	int nr_cpus = get_nprocs_conf();
> +	int cpu = 0, ret;
> +
> +	attr.type = type;
> +	if (attr.type == 0)
> +		return -ENOENT;
> +
> +	if (group >= 0)
> +		format &= ~PERF_FORMAT_GROUP;
> +
> +	attr.read_format = format;
> +	attr.config = config;
> +	attr.use_clockid = 1;
> +	attr.clockid = CLOCK_MONOTONIC;
> +
> +	do {
> +		ret = perf_event_open(&attr, -1, cpu++, group, 0);
> +	} while ((ret < 0 && errno == EINVAL) && (cpu < nr_cpus));
> +
> +	if (ret >= 0 && cpu_out)
> +		*cpu_out = cpu - 1;
> +
> +	return ret;
> +}
> +
>  int perf_igfx_open(uint64_t config)
>  {
>  	return _perf_open(igt_perf_type_id("i915"), config, -1,
> @@ -279,3 +309,9 @@ int igt_perf_open_group(uint64_t type, uint64_t config, int group)
>  	return _perf_open(type, config, group,
>  			  PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_GROUP);
>  }
> +

Add description here.

> +int igt_perf_open_for_cpu(uint64_t type, uint64_t config, int *cpu)
> +{
> +	return _perf_open_for_cpu(type, config, -1,
> +				  PERF_FORMAT_TOTAL_TIME_ENABLED, cpu);
> +}
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index 58d7d47aa..6dd9170ab 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -57,6 +57,7 @@ uint64_t igt_perf_type_id(const char *device);
>  int igt_perf_events_dir(int i915);
>  int igt_perf_open(uint64_t type, uint64_t config);
>  int igt_perf_open_group(uint64_t type, uint64_t config, int group);
> +int igt_perf_open_for_cpu(uint64_t type, uint64_t config, int *cpu);
>  
>  const char *i915_perf_device(int i915, char *buf, int buflen);
>  uint64_t i915_perf_type_id(int i915);
> diff --git a/lib/igt_power.c b/lib/igt_power.c
> index d3052f3cf..c705e3393 100644
> --- a/lib/igt_power.c
> +++ b/lib/igt_power.c
> @@ -5,6 +5,7 @@
>  #include <math.h>
>  #include <unistd.h>
>  #include <inttypes.h>
> +#include <sched.h>

Same here, try to keep it sorted, so add it in proper place
and also move inttypes.h

>  
>  #include "igt.h"
>  #include "igt_hwmon.h"
> @@ -61,7 +62,7 @@ static int rapl_open(struct rapl *r, const char *domain)
>  	if (r->fd < 0)
>  		goto err;
>  
> -	r->fd = igt_perf_open(r->type, r->power);
> +	r->fd = igt_perf_open_for_cpu(r->type, r->power, &r->cpu);
>  	if (r->fd < 0) {
>  		r->fd = -errno;
>  		goto err;
> @@ -76,6 +77,20 @@ err:
>  
>  static inline bool rapl_read(struct rapl *r, struct power_sample *s)
>  {
> +	cpu_set_t cpuset, old_cpuset;
> +	bool ret;
> +
> +	CPU_ZERO(&cpuset);
> +	CPU_SET(r->cpu, &cpuset);
> +
> +	if (!sched_getaffinity(0, sizeof(old_cpuset), &old_cpuset)) {
> +		if (!sched_setaffinity(0, sizeof(cpuset), &cpuset)) {
> +			ret = read(r->fd, s, sizeof(*s)) == sizeof(*s);
> +			sched_setaffinity(0, sizeof(old_cpuset), &old_cpuset);
> +			return ret;
> +		}
> +	}

Add debug info if get/set affinity fails

Regards,
Kamil 
> +
>  	return read(r->fd, s, sizeof(*s)) == sizeof(*s);
> +			ret = read(r->fd, s, sizeof(*s)) == sizeof(*s);
> +			sched_setaffinity(0, sizeof(old_cpuset), &old_cpuset);
>  }
>  
> diff --git a/lib/igt_power.h b/lib/igt_power.h
> index 853b0fae8..0430b91ae 100644
> --- a/lib/igt_power.h
> +++ b/lib/igt_power.h
> @@ -32,6 +32,7 @@ struct rapl {
>  	uint64_t power, type;
>  	double scale;
>  	int fd;
> +	int cpu;
>  };
>  
>  struct power_sample {
> -- 
> 2.43.0
> 
