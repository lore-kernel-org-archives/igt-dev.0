Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A007C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 10:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24FC10E138;
	Wed, 23 Jul 2025 10:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAz47djD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63D10E138
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753266278; x=1784802278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7KMa/NSRXNT4G7IEoT+9tPHs968K5YzRhYIMcgZrhJ0=;
 b=fAz47djDhaltQBcjBxSuZO5JqCo1U5vyzzfu07xrxQVeriVFNKwgK2Ls
 L35r9DkTr8KHKaoJ9FtJnEO/INCD02nHDvdhEu8WS4E/SbhFDz5dilLrF
 LeT64V6C8w0by5D9rAA4QZRhrkuLyGHVZr/mJhjggUliiVlQqfqQi4ZIc
 OonjgrCPe8JvzO+DrovwA3PojTmdZCPB8AvGJgXgwhhd0zvmyfA6zaJUs
 7jhvkkKzltJhmC4ahUAfqdly8F+kD1Xb/zFNxz9ldfR0i7J/C+tPh+fEJ
 jgv9MJnGowzZSKOTdH004xyQSe4NbdjddN3jUqCsK/xCwKx0wq58QymU8 A==;
X-CSE-ConnectionGUID: n3Q8+cJlSCW+AfZvN5i+cA==
X-CSE-MsgGUID: kXgFJMNFQ1K6mtrntT/CEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="43162948"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="43162948"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:24:37 -0700
X-CSE-ConnectionGUID: sbc3eLVNTqKB0/ecu8CvAA==
X-CSE-MsgGUID: ZxNkyI9RTQ+QsF9/zcyoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163944817"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:24:36 -0700
Message-ID: <e865cf60-a919-4331-b088-1249768c50e5@linux.intel.com>
Date: Wed, 23 Jul 2025 12:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/i915_test_config: Add all core tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
References: <20250723083150.29838-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250723083150.29838-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 7/23/2025 10:31 AM, Kamil Konieczny wrote:
> Instead of listing tests one by one add all core tests. This
> will add two new tests core_debugfs and core_sysfs.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  tests/intel/i915_test_config.json | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index a31e00893..1394d0920 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -2,10 +2,7 @@
>      "description": "JSON file to be used to parse i915 documentation",
>      "name": "Tests for i915 Driver",
>      "drivers": [ "i915" ],
> -    "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
> -               "../core_getstats.c", "../core_getversion.c",
> -               "../core_hotunplug.c", "../core_setmaster.c",
> -               "../core_setmaster_vs_auth.c",
> +    "files": [ "*.c", "../core_*.c",
>                 "../device_reset.c", "../dmabuf.c",
>                 "../drm_import_export.c", "../drm_mm.c",
>                 "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",

