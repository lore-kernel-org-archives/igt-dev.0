Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDE9CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 10:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9910E1A7;
	Tue, 28 Oct 2025 10:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7bC8r89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F6310E1A7
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761646402; x=1793182402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FM9FBquNRfPk3V0NqHSLyCgcFjLZ39bXjwXzJ8iNNZM=;
 b=m7bC8r89RfAgF/hfuVkgj9fl1h3d4fE69jFGaiLcRr+zHitQCfr9Xnpk
 ugmaA4H3suwSuW6iQ5mniXu+nLm10gUJM9Fi4dXHzZmEvrYJqf3ZEaG0U
 p3/HxjZ1ZOP1yrbJ1TeUM0TyKPaYe+z71mwvSoQxQ5kkGZfXBqZyslSFB
 EE3kqZMDdyKhw2MIDjL78/E78GlSf5Vg38NgYS1OnQq6GNp/SELMNDmfZ
 eTfIRCBK4N/6Gcg8VcLecStIMbnqVTShpMKRtnQ+lLfDzIoi3hC880XSp
 4GG4NOCcBW7It/MvbKvhDqlVh8MI3J66GU5yz4NygdGnxeTyqeGjTD/fE w==;
X-CSE-ConnectionGUID: +kx4BVPaToSm6rx6z6XbTw==
X-CSE-MsgGUID: Gjf+WuHJSaqOUN4aRvZxKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74416895"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74416895"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:13:21 -0700
X-CSE-ConnectionGUID: vrwc6LJtQJCxHbY3MqU4Og==
X-CSE-MsgGUID: BhgrX0RdQr21AIpJOnwD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185635673"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:13:20 -0700
Date: Tue, 28 Oct 2025 11:13:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
Subject: Re: [PATCH i-g-t 3/3] intel_gpu_top: Add usage note about i915
 compatibility and Xe driver transition
Message-ID: <20251028101318.3lguuabx5nqtpgzr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
 <26d376252a4ebc1ca256e476bba0b42611769225.1761225010.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26d376252a4ebc1ca256e476bba0b42611769225.1761225010.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2025-10-23 at 13:21:41 +0000, Sebastian Brzezinka wrote:
> Updated the usage output to include a note clarifying that intel_gpu_top
> is intended for Intel GPUs supported by the i915 kernel driver (Gen2
> through Gen12/Xe-LP). For newer GPUs such as Xe-HPG and Xe2, users are
> advised to use gputop, which supports the newer Xe kernel driver.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

I merged your first two patches and dropped this one.

Regards,
Kamil

> ---
>  tools/intel_gpu_top.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 1bd88ba7c..0d0d03717 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1067,6 +1067,12 @@ usage(const char *appname)
>  		"\t[-m]            Default to showing all memory regions.\n"
>  		"\n",
>  		appname, DEFAULT_PERIOD_MS);
> +
> +	printf("Note:\n"
> +		"\tThis tool is designed for Intel GPUs supported by the i915 kernel driver,\n"
> +		"\tincluding Gen2 through Gen12 (Xe-LP). For newer GPUs such as Xe-HPG and\n"
> +		"\tXe2, users should consider using gputop, which supports the newer\n"
> +		"\tXe kernel driver.\n\n");
>  	printf("To access interactive help, press 'h' while the application is running.\n");
>  	show_help_screen();
>  	igt_device_print_filter_types();
> -- 
> 2.34.1
> 
