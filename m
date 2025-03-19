Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1782C35FFC
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 14:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B65910E50B;
	Wed, 19 Mar 2025 14:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUg6GvPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496D10E50B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742393122; x=1773929122;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uaJUK564NcKWdxqakoQQUrG+FN+doK1OOG2WnacJQXk=;
 b=DUg6GvPuyFMYvRMWBOpIU9w8WFsF5BKpTNTNKIzTmTVOpfzK3NOzPduJ
 SYQRqr0aau70PQQcxAfD95uqYz4rkA+gW4QLshJ62S7ziA99Ajyzk+pk/
 hP8ze6RKijBJ1xCQwpEnxRhS8l7htf205eCqeUEhPzmRg90RRSMu7Ua0+
 kKc+LqqEz4ry/LF2aWT2WOaeKxO5iFifjNH69zKOBHlmglPEUeZB/b9Bl
 JZYQGcnkJyT+7Amjh0TsCYnt9PSM9mrRjxSC5iepqTjMuTq2c6udofGnb
 SMuDL8we0aEs5PB/UaN3tyZBaaAActcOQcMy4h+qtMN9VPEOF2L0gbCI7 A==;
X-CSE-ConnectionGUID: toltwGfqTfm6sK8VXEIv2A==
X-CSE-MsgGUID: aJl2a2GfRxGUh7Nj7olnWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54575758"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="54575758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 07:05:22 -0700
X-CSE-ConnectionGUID: 8c0508BSRBuzeKLFK5gcIw==
X-CSE-MsgGUID: OrUViyJNTgeOmTceFdnHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122565150"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.167])
 ([10.246.0.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 07:05:20 -0700
Message-ID: <37aedec2-eee0-4bd1-ae13-2dc99899252f@linux.intel.com>
Date: Wed, 19 Mar 2025 15:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/18/2025 4:01 PM, Jakub Kolakowski wrote:
> Add a check for power management capability of device tested in tests
> related to D3 states. Currently if test is started on configuration
> that does not support the PM capability it doesn't skip, instead
> depending on test it may fail, abort or timeout.
> With this change test will skip with a clear message why it did.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_pm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..70f0613fb 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
>   
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
> +	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> +		      "PCI power management capability not found\n");
> +

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   	dpms_on_off(device, DRM_MODE_DPMS_OFF);
>   
>   	/*

