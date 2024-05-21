Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAC4C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 08:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8416210E322;
	Tue, 21 May 2024 08:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfN5M/Ck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750A110E372
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716280953; x=1747816953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XFoaE5c+vRHqJa+i0YxZNMRIf/NlC8x5iQLRvPUsS9A=;
 b=MfN5M/Ck04JNu11cX44OFEgaoAr6/iv+zRSNtZKQyHp+CE7cIYi6v48r
 mUSXy8MMtOHJwgLiec9zBIScnuHdpIbxF7rqIIrBhjiUBXvnsEO8P72WG
 dHUMQlQrfwuUcMRBiJC+lhIyKGjhj8aAeaVOZnpuXnGxjnFuIes67OB2v
 1OV3rZ9R64N2FEvmLGVrmzQbOeRVcfZzj/5NSoyS+nU4Srcq3781ENulR
 5BLmXsY4IZXRIrzVgAFVPtji6Rdl0xxKHdqPRhMQI0qIxvSi97sZdWX5r
 Td6UW4j902sMwFrr6/xzRuyNru80NovUbBt9K7HRZYyb0xUQ+3jNa0YLC A==;
X-CSE-ConnectionGUID: c87cFkubTH2R/831Hqek5w==
X-CSE-MsgGUID: LCFWxZImTnGqYaOOQ8hLcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12304307"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12304307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 01:42:33 -0700
X-CSE-ConnectionGUID: WEeSGQSpQXyxqhelhBmvqg==
X-CSE-MsgGUID: ldZuj8hVSI2kjm0NlmtAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="63678638"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 01:42:32 -0700
Date: Tue, 21 May 2024 10:42:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 6/6] lib/igt_pm: Convert suspended_time from int to
 uint64_t
Message-ID: <20240521084217.zy57dn3rgi4uqnnm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
 <20240520190347.242249-6-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240520190347.242249-6-rodrigo.vivi@intel.com>
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

Hi Rodrigo,
On 2024-05-20 at 15:03:47 -0400, Rodrigo Vivi wrote:
> Suspended time is in miliseconds printed from u64 variable in kernel.
> Convert to a more appropriate variable type.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_pm.c            | 9 +++++----
>  lib/igt_pm.h            | 2 +-
>  tests/intel/kms_pm_dc.c | 9 +++++----
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index d54549d11..057634203 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1392,16 +1392,17 @@ bool i915_is_slpc_enabled(int drm_fd)
>   *
>   * Return: The total time that the device has been suspended.
----------------------------^
Add in description what units are used, for example:

 * Return: The total time in miliseconds that the device has been
 * suspended.

With that,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>   */
> -int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
> +uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>  {
>  	char time_str[64];
> -	int time, time_fd;
> +	int time_fd;
> +	uint64_t time;
>  
>  	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
>  	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> -		igt_assert(sscanf(time_str, "%d", &time) > 0);
> +		igt_assert(sscanf(time_str, "%ld", &time) > 0);
>  
> -		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %d\n",
> +		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %ld\n",
>  			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
>  
>  		return time;
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 15e301533..6b428f53e 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -93,7 +93,7 @@ void igt_pm_restore_pci_card_runtime_pm(void);
>  void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
>  bool i915_is_slpc_enabled(int drm_fd);
> -int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
>  uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 176f7a04b..7766d34d7 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -488,10 +488,10 @@ static bool support_dc6(int debugfs_fd)
>  	return strstr(buf, "DC5 -> DC6 count");
>  }
>  
> -static int read_runtime_suspended_time(int drm_fd)
> +static uint64_t read_runtime_suspended_time(int drm_fd)
>  {
>  	struct pci_device *i915;
> -	int ret;
> +	uint64_t ret;
>  
>  	i915 = igt_device_get_pci_device(drm_fd);
>  	ret = igt_pm_get_runtime_suspended_time(i915);
> @@ -500,7 +500,7 @@ static int read_runtime_suspended_time(int drm_fd)
>  	return ret;
>  }
>  
> -static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rpm, int msecs)
> +static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, uint64_t prev_rpm, int msecs)
>  {
>  	/*
>  	 * Runtime suspended residency should increment once DC9 is achieved;
> @@ -522,7 +522,8 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
>  
>  static void setup_dc9_dpms(data_t *data, int dc_target)
>  {
> -	int prev_dc = 0, prev_rpm, sysfs_fd;
> +	uint64_t prev_rpm;
> +	int prev_dc = 0, sysfs_fd;
>  
>  	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
>  	__igt_sysfs_get_boolean(sysfs_fd, "poll", &kms_poll_saved_state);
> -- 
> 2.44.0
> 
