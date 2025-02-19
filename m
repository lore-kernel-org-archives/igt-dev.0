Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA5C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2A10E7B0;
	Wed, 19 Feb 2025 10:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwj+Xzbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C1910E7B0
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739960012; x=1771496012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yNuTXx9Wfqo5wPOWV7IMyO/5cIzcOmGmzLZKL+XTKzo=;
 b=kwj+XzbiY17CqfO1vL0oT+hCDSyQXxxqoFT6NpFXROtwpoMbwkG/5ogS
 EANWSZXHjkPAKLt4MAqNtjLrn9LfrMTAYsBILyx9I4EpjAD6K55HnRFKm
 wrRn7kCxvEsStOQcDLtMFCIiPz5AQJl5ui1tdcHwiulOp9vpa2wOyHQhR
 jcwOxoG2+tQrohsD2+gcKjlaY6mJqkd17Z5aG8nqdBrrTHtdIwLpBKweX
 xwTAlNI3fRO83zH5JSHXMOyLpSht7M64uYivOnjyk4qlL7k8BftKlxf0n
 4mll2K39/MnpCjqaGlnX+6D8BpeRX9Vcw5wGE7x2pVrGgysEJiQSx8EqH A==;
X-CSE-ConnectionGUID: Dr45FzGuRXeDttjCi6Dapw==
X-CSE-MsgGUID: 8H/bLsMoSHGMBFY2reO84A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40704677"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40704677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:13:32 -0800
X-CSE-ConnectionGUID: mqVkZo7nRe6D1k7cqfFOkw==
X-CSE-MsgGUID: 3GHTAVkeQZOmigDAXl1PRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="119653152"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 02:13:31 -0800
Date: Wed, 19 Feb 2025 11:13:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: Re: [PATCH i-g-t v2 1/3] lib/igt_perf: Add utils to extract PMU
 event info
Message-ID: <20250219101328.eitwx35p3otbhjyh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
References: <20250217142021.951467-1-riana.tauro@intel.com>
 <20250217142021.951467-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250217142021.951467-2-riana.tauro@intel.com>
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
On 2025-02-17 at 19:50:16 +0530, Riana Tauro wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Functions to parse event ID and GT bit shift for PMU events.
> 
> v2: Review comments (Riana)
> v3: Review comments (Lucas)
> v4: fix kernel-doc (Kamil)
>     remove parameter for end (Umesh)
> 
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  lib/igt_perf.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_perf.h |  2 ++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 3866c6d77..c1b8cc629 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -92,6 +92,78 @@ const char *xe_perf_device(int xe, char *buf, int buflen)
>  	return buf;
>  }
>  
> +/**
> + * perf_event_format: Returns the shift positions of an event format param
> + * @device: PMU device
> + * @param: parameter to obtain the shiift
> + * @shift: shift bits for the parameter
> + *
> + * Returns: 0 on success or negative error code
> + */
> +int perf_event_format(const char *device, const char *param, uint32_t *shift)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t bytes;
> +	int ret = 0, fd;
> +	uint32_t end;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/format/%s",
> +		 device, param);
> +
> +	fd = open(buf, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -EINVAL;
> +
> +	bytes = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (bytes < 1)
> +		return -EINVAL;
> +
> +	buf[bytes] = '\0';
> +	ret = sscanf(buf, "config:%u-%u", shift, &end);
> +	if (ret != 2)
> +		return -EINVAL;
> +
> +	return ret;

s/return ret/return 0/

with this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +}
> +
> +/**
> + * perf_event_config:
> + * @device: Device string in driver:pci format
> + * @event: The event name
> + * @config: Pointer to the config
> + *
> + * Returns: 0 for success, negative value on error
> + */
> +int perf_event_config(const char *device, const char *event, uint64_t *config)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t bytes;
> +	int ret = 0, fd;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 device,
> +		 event);
> +
> +	fd = open(buf, O_RDONLY);
> +	if (fd < 0)
> +		return -EINVAL;
> +
> +	bytes = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (bytes < 1)
> +		return ret;
> +
> +	buf[bytes] = '\0';
> +	ret = sscanf(buf, "event=0x%lx", config);
> +	if (ret != 1)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  uint64_t xe_perf_type_id(int xe)
>  {
>  	char buf[80];
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index 3d9ba2917..58d7d47aa 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -71,5 +71,7 @@ int perf_i915_open(int i915, uint64_t config);
>  int perf_i915_open_group(int i915, uint64_t config, int group);
>  
>  int perf_xe_open(int xe, uint64_t config);
> +int perf_event_config(const char *device, const char *event, uint64_t *config);
> +int perf_event_format(const char *device, const char *param, uint32_t *shift);
>  
>  #endif /* I915_PERF_H */
> -- 
> 2.47.1
> 
