Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B0E1061B07
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD54110E1F0;
	Mon, 30 Mar 2026 15:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3f5lsa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7278B10E1F0
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774883094; x=1806419094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lfqhLey++m9CdcoY9YeKy4HWtnJslzoYLG5IL3YR0PI=;
 b=e3f5lsa5+CEfphNATxMeh/jsvQtYw9pRi55tXx6rVUHqYi9lH3VAAqZv
 sv5k0zr1P7Y44Qc8Pgvt7QqP1asjas7vsEmTppICsJQTVJlvt7E6z+3J+
 v9PGf95arJRDLlLrZk6RzHzedzbrLfdyeuLEA5uL/NuksoykaE86Vtrfw
 r4o4T0TLrDQ551eMVilwea63YHwOeHyfQc9pacuWi5GdR/71vqUYD4+7s
 RfLXDy62yLBQWh6fCLM8xrg231+t4cW8vWiLzW2ovqyoEmXa6dMMtwoQt
 WJB5W5dJT4n307Zifjtrzgblme2Fwg0dIlMWJJ8+41Wgob/+9o8NGgY4m A==;
X-CSE-ConnectionGUID: jNMtWqkbSuaKKCqPF/u16w==
X-CSE-MsgGUID: /EIyF2fPTkugWEtqUbXIBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79480373"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79480373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:04:53 -0700
X-CSE-ConnectionGUID: xt7uhdbLQuKhtRKDekg6qw==
X-CSE-MsgGUID: 2tEUbxNVQEukVKZrekuAFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="256585622"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.123])
 ([10.245.245.123])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:04:52 -0700
Message-ID: <264a31ab-ce70-4a95-b931-dfb57d20502e@intel.com>
Date: Mon, 30 Mar 2026 16:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] tests/xe_pat: Verify PAT registers are
 properly programmed
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
 <20260330144032.1954771-12-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260330144032.1954771-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 30/03/2026 15:40, Zbigniew Kempczyński wrote:
> Debugfs exposes file which reflects current PAT registers settings.
> Verify these registers matches predefined PAT config.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Is the suspend case not applicable for non-PTA?

> ---
>   tests/intel/xe_pat.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index a845541e6f..e2b6682449 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -238,6 +238,50 @@ static void pat_sanity(int fd)
>   	}
>   }
>   
> +#define GT_RESET 1
> +/**
> + * SUBTEST: pat-sw-hw-compare
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config'
> + *
> + * SUBTEST: pat-sw-hw-reset-compare
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after gt reset
> + */
> +static void pat_sw_hw_compare(int fd, uint32_t flags)
> +{
> +	bool matches = true;
> +	int gt;
> +
> +	xe_for_each_gt(fd, gt) {
> +		struct intel_pat_cache pat_hw_config = {};
> +		struct intel_pat_cache pat_sw_config = {};
> +		int hw_entries, sw_entries;
> +
> +		if (flags & GT_RESET)
> +			xe_force_gt_reset_sync(fd, gt);
> +
> +		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
> +		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
> +		igt_assert_eq(hw_entries, sw_entries);
> +
> +		igt_debug("[GT%d] hw_entries: %d, sw_entries: %d\n", gt, hw_entries, sw_entries);
> +
> +		for (int i = 0; i < hw_entries; i++) {
> +			uint32_t hw_pat, sw_pat;
> +
> +			hw_pat = pat_hw_config.entries[i].pat;
> +			sw_pat = pat_sw_config.entries[i].pat;
> +			if (hw_pat != sw_pat) {
> +				igt_debug("[GT%d] Mismatch of pat register vs sw config "
> +					  "- index: %i, entries: %08x <> %08x\n",
> +					  gt, i, hw_pat, sw_pat);
> +				matches = false;
> +			}
> +		}
> +	}
> +
> +	igt_assert_eq(matches, true);
> +}
> +
>   /**
>    * SUBTEST: pat-index-all
>    * Test category: functionality test
> @@ -2204,6 +2248,12 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("pat-sanity")
>   		pat_sanity(fd);
>   
> +	igt_subtest("pat-sw-hw-compare")
> +		pat_sw_hw_compare(fd, 0);
> +
> +	igt_subtest("pat-sw-hw-reset-compare")
> +		pat_sw_hw_compare(fd, GT_RESET);
> +
>   	igt_subtest("pat-index-all")
>   		pat_index_all(fd);
>   

