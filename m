Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16B6C369C2
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 12:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6331710E8ED;
	Wed, 16 Apr 2025 12:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuACcNU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F510E8EE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744807412; x=1776343412;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+rnQmXX/5yisbdLKfaA5SA24M690JgFasWAFHBrsLbs=;
 b=SuACcNU+qhlRK5hwXAgKjOwQYTbaCWJhBaZOFpQnRotI/HnxOax7gIOj
 xJm9Ec8HC1xRi9eaY7yHaBh5MoGkd8lTXOjAVjwbqxNrpsu/2MzPGSW1R
 jj8ZVKjJls8JngOJCY0yW5cv2EhhjcBqRvNAXeI1HrGt4wXwu0JEnHJDw
 OCBU7PxTDC2VkFx+2hI32KQLKiaexE1ZynDEbLfegxpSZHFVOv1ATN9o8
 4Z0Dja46SQ2z8M82/NhseEJB1RC3JJdbIFqQ89snMWFlUulZfC6AYsSxl
 hGF5oThF4beJYllxqTNFORQ45qieSSNBM4oHgUxZngchYZiIng1H834v6 A==;
X-CSE-ConnectionGUID: M/PZZbjBTKKoZqzdwVQeSg==
X-CSE-MsgGUID: h3IzaLrMSN6BEotoNF8w8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50173366"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="50173366"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 05:43:32 -0700
X-CSE-ConnectionGUID: 49rjPM4gTAuR55sv0Tnq/A==
X-CSE-MsgGUID: V+TH4BztRRqkgZuE2I0UhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="134569395"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 05:43:30 -0700
Date: Wed, 16 Apr 2025 14:43:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 jari.tahvanainen@intel.com, aditya.chauhan@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/test_config: Add GPU excluded
 platform definition for LNL/BMG
Message-ID: <20250416124328.w7rbaxpxxrhlubgh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com
References: <20250416102806.1362020-1-karthik.b.s@intel.com>
 <20250416102806.1362020-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416102806.1362020-3-karthik.b.s@intel.com>
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
On 2025-04-16 at 15:58:06 +0530, Karthik B S wrote:
> With config definitions added, the blocklists for LNL and BMG platform on xe
> can be used used to generate platform testlists.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel/kms_test_config.json | 10 +++++++++-
>  tests/intel/xe_test_config.json  | 12 ++++++++++--
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index e11c7f4fe..65d6eb07d 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -54,7 +54,15 @@
>          },
>  	"GPU excluded platform": {
>  	    "_properties_": {
> -		"description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
> +		"description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole).",
> +		"update-from-file": {
> +		    "include-type": "regex-ignorecase",
> +		    "include": [
> +			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
> +			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
> +			{ "all": "../intel-ci/xe.blocklist.txt" }
> +		    ]
> +		}
>  	    }
>  	},
>          "Description": {
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 4556025f7..446d59a95 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -71,8 +71,16 @@
>          },
>          "GPU excluded platform": {
>              "_properties_": {
> -                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole)."
> -            }
> +                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole).",

s/hole/whole/

with this fixed
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		"update-from-file": {
> +		    "include-type": "regex-ignorecase",
> +		    "include": [
> +			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
> +			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
> +			{ "all": "../intel-ci/xe.blocklist.txt" }
> +		    ]
> +		}
> +	    }
>          },
>          "GPU requirement": {
>              "_properties_": {
> -- 
> 2.43.0
> 
