Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA270C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 13:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9DF10E405;
	Mon, 12 May 2025 13:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flZffmzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8710E405
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054873; x=1778590873;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C94Cph9C/bAUsH4KIzoXgiYZTdYG26ZC91w3DRfO1TI=;
 b=flZffmzyMY2OAfAeJg8AAiv3otHZ3TJZysGR45BQa7ELgTV/AoSFv2AJ
 PZ7QZgbZITgO4LFiHfmsZt81805s56qpGzk7B2XKI6p9PY+0yUvXu0fll
 w0OSUC+ebPQUJYI0scgyrdNLBjXS06cpVdB9Edf91tqMNeFoTOm4sHfh2
 ZbUa84RvplFGkmXb817P2d9HXJT1i87ChFbd1hJ3SRJ3UNc5BukXU0dZj
 ufx1MiPn+TA3o52ix41+1WNeDOYtTvwKT6u5zu6CZVQW5khuj9PGgF63N
 +QifpMkQTl45w5baT8+zuF+W4mau9yTX5TlqfLz/uVjIS3wEuZRENLWrq w==;
X-CSE-ConnectionGUID: s9W89SXCQX+mm3aZvdclhQ==
X-CSE-MsgGUID: Obpkrs5wTCyF3OGcqiqQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52662148"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="52662148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:59:05 -0700
X-CSE-ConnectionGUID: 6nM0MKpcQbO5YuTxxAu+jg==
X-CSE-MsgGUID: gUJsauXfQWuu0TrV0h0dkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="141416946"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:59:03 -0700
Message-ID: <a9098487-c20b-4ca1-9b1d-b5b7e930a968@linux.intel.com>
Date: Mon, 12 May 2025 14:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] intel/xe_test_config.json: add device_reset
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
 <20250512125355.99620-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250512125355.99620-3-kamil.konieczny@linux.intel.com>
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



On 5/12/2025 2:53 PM, Kamil Konieczny wrote:
> This test is driver agnostic and the subtest unbind-reset-rebind
> is already passing.
> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/xe_test_config.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index b3393a89e..edca243f1 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,7 @@
>       "description": "JSON file to be used to parse Xe documentation",
>       "name": "Tests for Xe Driver",
>       "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
> +    "files": [ "xe_*.c", "../core_*.c", "../device_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
>       "fields": {
>           "Run type": {
>               "_properties_": {
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
