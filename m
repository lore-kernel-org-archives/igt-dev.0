Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B52ECA0EFF
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 08:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B08210E757;
	Wed, 27 Aug 2025 08:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eClkorFX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2579110E757
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756281600; x=1787817600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UZ0tLzFpqJH2iXPRV8dLY22dMjnb3RHJZ5j4cWsfLjs=;
 b=eClkorFX4MLt1C4k1hdRS50ERlYA1fp5uP6eGYfc9rwz3NFB9BDwcnMD
 0fW1uzD1B5FI0f0Kw3VDp3CKLzKGEv4Y8pvJaQN2JJmqC7VoW0Pp6yWgE
 +imRKQLXyRN/b+WMR7ROgCs6cnvDemiFbK9QHtrOOpHsrachJGiCgdSlM
 MQBVteIZzzT4506aqWv69HG+l/PWbxtudUxXR7UiwrcMwlG5AIOgedNfr
 0tFMze3pAxI6vzTGkwt97W1VD3s/GnH39iIjfjXu8yQtNnmOlhf+crb7s
 TB3QMJFW8M1ltoJKY9wEv1TDRcRTEInrjhhEPMW+9nGyKROHJIwcClmPH g==;
X-CSE-ConnectionGUID: +vpyreb3Twm5EstCfNGqHw==
X-CSE-MsgGUID: pEE2NkorTvCR/MWHfxcTDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81122016"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81122016"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 00:59:59 -0700
X-CSE-ConnectionGUID: AWC9OinaQBenN0NOm46liA==
X-CSE-MsgGUID: VEL14CrpR5OjJwbUB90Etg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="193430302"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.112.87])
 ([10.245.112.87])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 00:59:56 -0700
Message-ID: <5c1b8e67-0522-4c41-816e-c43bcfbffe15@linux.intel.com>
Date: Wed, 27 Aug 2025 09:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Skip media GTs when
 reading LMEM provisioning
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250826192555.465679-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20250826192555.465679-1-marcin.bernatowicz@linux.intel.com>
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

On 8/26/2025 9:25 PM, Marcin Bernatowicz wrote:
> LMEM provisioning is exposed only on the primary GT.
> Media GTs do not provide LMEM provisioning data,
> so attempting to read it there caused the subtest to skip.
> Restrict iteration to non-media GTs before reading LMEM provisioning.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index fc08703c0..248dcf6fb 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -813,6 +813,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>   	igt_assert(ldata->vf_lmem_size);
>   
>   	xe_for_each_gt(data->pf_fd, gt) {
> +		if (xe_is_media_gt(data->pf_fd, gt))
> +			continue;
> +
>   		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>   								  XE_SRIOV_SHARED_RES_LMEM,
>   								  gt, &ranges, &nr_ranges);
LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
