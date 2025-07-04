Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB31C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 10:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6564910E9E5;
	Fri,  4 Jul 2025 10:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBsbRfoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AF410E9E5
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751625719; x=1783161719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uq9sZPoyAjKctKqJ1YHj10ILyKdZMXCc6XwX4XtUH5k=;
 b=FBsbRfoyCfc1zDaysJbaoZByKIVr9A9ssj5uq5cjf12A5Ba4hJwHOfOg
 hx09lj0HbqBzuUQrmYyhnlHejz/ZUYCWaWY7wtKKNwaM0LNAW3f9fFiH3
 Ztn+sI11n6kIf2fovWCHDdV5we/Wy4nmiF3jclBHnudoEDeN6bpCFghUv
 1/3WjvsrjvZSZrVoYGapSTMlAvOhxQ2JOIVWxwTIRRKfCtaUB42KBykEH
 y9/6btoNXsHN/FWmYAPIFBRGmtC9QTQqB1SYXntvPr6HYqQso56PXout7
 nzs4RShL79xNyX4FJ44ldq89UeIDWp/Xddtv+Qq+VS1eZitF983EsnBmx w==;
X-CSE-ConnectionGUID: gJbqObZ6RLydgAYmc43SCQ==
X-CSE-MsgGUID: BAwAM5kATTKEC3dxOY+bhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53681208"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53681208"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:41:58 -0700
X-CSE-ConnectionGUID: WNWqJCcAQf+BzPYvirqUMg==
X-CSE-MsgGUID: cn5mFP0DTHu4S3YXBRoiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="185632443"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 03:41:56 -0700
Date: Fri, 4 Jul 2025 12:41:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 jari.tahvanainen@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/test_config: Add GPU excluded
 platform definition for i915
Message-ID: <20250704104140.wd2tl2n6vngtcu2x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, jari.tahvanainen@intel.com
References: <20250703094111.896703-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703094111.896703-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2025-07-03 at 15:11:11 +0530, Karthik B S wrote:
> With config definitions added, the blocklists for i915 can be used to
> generate platform testlists.
> 
> v2: Fix Typo.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/i915_test_config.json | 8 +++++++-
>  tests/intel/kms_test_config.json  | 3 ++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 04bf1fa68..e53f9400b 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -83,7 +83,13 @@
>          },
>          "GPU excluded platform": {
>              "_properties_": {
> -                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
> +                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole).",
> +                "update-from-file": {
> +                    "include-type": "regex-ignorecase",
> +                    "include": [
> +                        { "all": "../intel-ci/blacklist.txt" }
> +                    ]
> +                }
>              }
>          },
>          "GPU requirement": {
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 65d6eb07d..0b6fc36e8 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -60,7 +60,8 @@
>  		    "include": [
>  			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
>  			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
> -			{ "all": "../intel-ci/xe.blocklist.txt" }
> +			{ "LNL, BMG": "../intel-ci/xe.blocklist.txt" },
> +			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/blacklist.txt" }
>  		    ]
>  		}
>  	    }
> -- 
> 2.43.0
> 
