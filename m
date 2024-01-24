Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC6C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 13:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178E10EA18;
	Wed, 24 Jan 2024 13:32:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942210EA18
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706103170; x=1737639170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6JUI9GY4nQVVRhif5GFPJ4Bpv0QL9sfajKRirrLHCWE=;
 b=gdSneUbVDA43cpfcADK4l82xVUBnocykuNSDtYDeep/VTjTaYDfsUIpV
 R72PymfWoDPpH36JPXu8k8OvxTYWEERDl/T15XxkY1tqpMzO1gvte95jm
 bfsSq9rFY0hjQIPkQB0gdUKCVhErMEBAplNZZQ2VqObPjvP/NBu+SDN7k
 AydWYoQ4GCxPMMdfCnaDvHQfCFPpPvOo7DUuVOEj+PX0MpcqWQ244DaGx
 eMc2W5g77Vsu6UTsyTt/uKNHuSCxFM9xt+JHJ5nVFkrhwXyR6LtE0eeWj
 QTpj7vZi39vnk0ffeIXhgdj2uVD1c4QATsyMcjKRLFv6G5ePUehsKA5NO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405594488"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="405594488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 05:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20728332"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:32:47 -0800
Date: Wed, 24 Jan 2024 14:32:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v6 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Message-ID: <20240124133245.rbygia7xiv7wlz46@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240124115019.2067089-1-anshuman.gupta@intel.com>
 <20240124115019.2067089-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124115019.2067089-3-anshuman.gupta@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Anshuman,
On 2024-01-24 at 17:20:17 +0530, Anshuman Gupta wrote:
> Sometimes we want to test pm igt test with an explicit auto
> suspend delay, therefore adding helpers to get/set the pci_dev
> auto_suspenddelay_ms.

I have few more nits, see below.

> 
> v2:
> close delay_fd. [Kamil]
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_pm.c | 56 +++++++++++++++++++++++++++++++++++++++++-----------
>  lib/igt_pm.h |  2 ++
>  2 files changed, 46 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index c2d98fceb..bb8563214 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1068,18 +1068,6 @@ static void igt_pm_write_power_attr(int fd, const char *val, int len)
>  	igt_assert(strncmp(buf, val, len) == 0);
>  }
>  
> -static int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
> -{
> -	char delay_str[64];
> -	int delay, delay_fd;
> -
> -	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> -	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
> -		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
> -
> -	return delay;
> -}
> -
>  static void
>  igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev,
>  				 struct igt_pm_pci_dev_pwrattr *pwrattr, int delay_ms)
> @@ -1165,6 +1153,50 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
>  	pci_iterator_destroy(iter);
>  }
>  
> +/**
> + * igt_pm_get_autosuspend_delay:
> + * @pci_dev: pci_dev.

Add newline here with ' *' so next line will be separated.

> + * Get pci_dev autosuspend delay value from pci sysfs "autosuspend_delay_ms".
-------------------------------------------------------- ^^^^^^^^^^^^^^^^^^^^^
Drop "autosuspend_delay_ms" from description.

> + *
> + * Returns:
> + * autosuspend_delay_ms.
-----------------^-----^
autosuspend delay in miliseconds

> + */
> +int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
> +{
> +	char delay_str[64];
> +	int delay, delay_fd;
> +
> +	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> +	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
> +		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
> +
> +	close(delay_fd);
> +	return delay;
> +}
> +
> +/**
> + * igt_pm_set_autosuspend_delay:
> + * @pci_dev: pci_dev.
> + * @delay_ms: autosuspend delay in ms.

Add newline here with ' *' so next line will be separated.

> + * Set pci_dev autosuspend delay value through pci sysfs "autosuspend_delay_ms".
----------------------------------------------------------- ^^^^^^^^^^^^^^^^^^^^^
Same here, drop this from description.

With that:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> + */
> +void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
> +{
> +	char delay_str[64];
> +	int delay_fd;
> +
> +	delay_fd = igt_pm_get_power_attr_fd(pci_dev, "autosuspend_delay_ms");
> +
> +	if (delay_ms >= 0) {
> +		int wc;
> +
> +		wc = snprintf(delay_str, 64, "%d\n", delay_ms);
> +		igt_pm_write_power_attr(delay_fd, delay_str, wc);
> +	}
> +
> +	close(delay_fd);
> +}
> +
>  /**
>   * igt_pm_enable_pci_card_runtime_pm:
>   * @root: root port pci_dev.
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 538b6e39e..91ee05cd1 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -82,6 +82,8 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev);
>  bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev);
>  enum igt_acpi_d_state
>  igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);
> +int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev);
> +void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms);
>  void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
>  				       struct pci_device *i915);
>  void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value);
> -- 
> 2.25.1
> 
