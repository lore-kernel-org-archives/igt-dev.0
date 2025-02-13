Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F83C0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 14:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5991510E0EA;
	Thu, 13 Feb 2025 14:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMBXScNz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F411E10E0EA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739457030; x=1770993030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=moX6p/lpmLB6HS5LqHnqcdYaIomR3Yo+9S2ObagGNTk=;
 b=OMBXScNzF/bcae482BPyFuzVxnIYSk873nzF0bKEF3WZhwgWJF4PW/MR
 rv5mSijvngK0OqA1ano/ZhXKkS/5oCeMtVW7fmjZ+pOQcXbUOnzACxPsq
 DbXemt5LYxH3wgOSJ3+kCfGU7U7CXJ3xgj6l18yU+R+6T1mRZGHxxsvJV
 xmzUpfPd/MZoBXgO0Xs+tfZqIZbzLuwpQnZM/ues6QA1C4DGl1DVXwgjD
 blQ8zsprzXtKKbkL3KWnw0LcOafRo/IOWARCqQe3QorGR8bZBN7Q/7WWN
 sxNR8evT6eGGNjjgUcUBre7J9tBTlgRer+hDY/w7uaV5FxdrWKvbESoLG A==;
X-CSE-ConnectionGUID: NCj7/54aTl+0cziguA2l4A==
X-CSE-MsgGUID: ZT0qCH9HQ5CYI2QU4HJ62Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39389834"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="39389834"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 06:30:30 -0800
X-CSE-ConnectionGUID: OiUi40o6S5Gk/PrgP9vHzg==
X-CSE-MsgGUID: q867oap1Q/CCSgwtXvMJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117780752"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:30:27 -0800
Date: Thu, 13 Feb 2025 15:30:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/igt_perf: Add utils to extract PMU event
 info
Message-ID: <20250213143025.v72uky5bzddywe5t@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
References: <20250212095834.384508-1-riana.tauro@intel.com>
 <20250212095834.384508-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212095834.384508-2-riana.tauro@intel.com>
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
On 2025-02-12 at 15:28:27 +0530, Riana Tauro wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Functions to parse event ID and GT bit shift for PMU events.
> 
> v2: Review comments (Riana)
> v3: Review comments (Lucas)
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  lib/igt_perf.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_perf.h |  2 ++
>  2 files changed, 72 insertions(+)
> 
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 3866c6d77..f021fc3ec 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -92,6 +92,76 @@ const char *xe_perf_device(int xe, char *buf, int buflen)
>  	return buf;
>  }
>  
> +/**
> + * perf_event_format: Returns the start/end positions of an event format param
> + * @device: PMU device
> + * @param: Parameter for which you need the format start/end bits

You should describe here all params. Add also one empty line before ' * Returns'
like:

 * @end: last bit position
 *
 * Returns: 0 on success or negative error code

> + * Returns: 0 on success or negative error code
> + */
> +int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t bytes;
> +	int ret;
> +	int fd;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/format/%s",
> +		 device, param);
> +
> +	fd = open(buf, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -EINVAL;

imho here you could return -errno

> +
> +	bytes = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (bytes < 1)
> +		return -EINVAL;
> +
> +	buf[bytes] = '\0';
> +	ret = sscanf(buf, "config:%u-%u", start, end);
> +	if (ret != 2)
> +		return -EINVAL;
> +
> +	return ret;

From function description this should be zero?
s/ret/0/

Regards,
Kamil

> +}
> +
> +/**
> + * perf_event_config:
> + * @device: Device string in driver:pci format
> + * @event: The event name
> + * @config: Pointer to the config
> + * Returns: 0 for success, negative value on error
> + */
> +int perf_event_config(const char *device, const char *event, uint64_t *config)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t bytes;
> +	int ret;
> +	int fd;
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
> index 3d9ba2917..69f7a3d74 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -71,5 +71,7 @@ int perf_i915_open(int i915, uint64_t config);
>  int perf_i915_open_group(int i915, uint64_t config, int group);
>  
>  int perf_xe_open(int xe, uint64_t config);
> +int perf_event_config(const char *device, const char *event, uint64_t *config);
> +int perf_event_format(const char *device, const char *param, uint32_t *start, uint32_t *end);
>  
>  #endif /* I915_PERF_H */
> -- 
> 2.47.1
> 
