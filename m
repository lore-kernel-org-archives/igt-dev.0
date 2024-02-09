Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E40C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 08:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C0910F261;
	Fri,  9 Feb 2024 08:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymc+JJKH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5551010F261
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707468905; x=1739004905;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cL4rVim/gZLhUn9zVsCK8BMcw7GT8or54gA+noVVPx8=;
 b=Ymc+JJKH9t6CDR1/j+jKErKJaBFArI2PGz6jFU3pQN4VZhC4ey/uW4tm
 rL6kMi6jF4N7nhSJVWO+V51oHwq+wPsQj+SRLvr5RrZWH06vcvSp5M7uB
 vJoXnNTQlRo7aa9ZnduPZavhZ1Mhji4R1d49cUE3oD5koR1ZRtAx0TuVg
 vbjg7LpYkSQI5I+vWStlQyhAeOElPurZfl+5k31+fnqtrAgbf6V8pBAYw
 4B6TjDSpZ9VgTikEvsChz3g+MXSD+uDi6I7faYklqPbHPlPPTjgcDTTW1
 oegEe2PQoPLA/gNJBHH6dCc7zZS2wz837Xnp8GoscIuRkPrPvmoOBKoN6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12473061"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12473061"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="825086858"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="825086858"
Received: from unknown (HELO localhost) ([10.245.101.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:55:02 -0800
Date: Fri, 9 Feb 2024 09:54:59 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v8 1/8] lib/igt_device_scan: Introduce filtering
 out non-PCI devices
Message-ID: <20240209085407.lb2pz3d377luvdpw@zkempczy-mobl2>
References: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
 <20240208135232.54382-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208135232.54382-2-kamil.konieczny@linux.intel.com>
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

On Thu, Feb 08, 2024 at 02:52:25PM +0100, Kamil Konieczny wrote:
> From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> 
> Introduced igt_device_filter_pci function that filters out non-PCI
> devices from IGT devices. This will help with checking multi-GPU
> tests after they skip due to detected only one GPU, in that case
> one can verify it after printing what GPUs are really on PCI bus.
> Such errors can happen when using wrong env IGT_DEVICE filter.
> 
> v6: extending description
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 21 +++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index fbf3fa482..37ebe1964 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1908,6 +1908,27 @@ const char *igt_device_filter_get(int num)
>  	return NULL;
>  }
>  
> +/**
> + * igt_device_filter_pci
> + *
> + * Filter devices to PCI only.
> + *
> + * Returns PCI devices count.
> + */
> +int igt_device_filter_pci(void)
> +{
> +	int count = 0;
> +	struct igt_device *dev, *tmp;
> +
> +	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link)
> +		if (strcmp(dev->subsystem, "pci") != 0)
> +			igt_list_del(&dev->link);

Device scan starts with lists 'all' and 'filtered' filled with
all cards. If you want to eliminate non-pci cards here you should
also free memory for dev. See igt_device_filter_apply() where
there's comment 'Clean the filtered list'.

> +		else
> +			count++;
> +
> +	return count;
> +}
> +

I also wondered to fix filter_pci() and fill filtered list
with all pci devices when filter 'pci:' (without vendor/device/card)
is passed. Currently filter picks single matching device instead
of filling filtered list with all matching devices.

Anyway, at the moment I see no blocker for your code. Just
fix this minor free() nit and:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  static bool igt_device_filter_apply(const char *fstr)
>  {
>  	struct igt_device *dev, *tmp;
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 48690e236..908733745 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -81,6 +81,8 @@ int igt_device_filter_add(const char *filter);
>  void igt_device_filter_free_all(void);
>  const char *igt_device_filter_get(int num);
>  
> +int igt_device_filter_pci(void);
> +
>  /* Use filter to match the device and fill card structure */
>  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>  bool igt_device_card_match_pci(const char *filter,
> -- 
> 2.42.0
> 
