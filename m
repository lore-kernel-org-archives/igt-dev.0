Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A348C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC49C10E986;
	Thu, 25 Apr 2024 10:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcKWs/AP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D07610E986
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714039362; x=1745575362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pH/JOpRuLENxT4X48UKjDYwcYaeK8TdJ/HT1VJc1gYk=;
 b=hcKWs/APeoxzKJlQu9d8Yy2YWqS7uXFS6W/T9jmdwuF+5rgLoMeme6ZQ
 L/s85Zb8CURXMrGCljiNTEas6TJvY/g4P+1KT2X4bJVY/N9Pfx72/Nqx5
 WNZIXwcn96rsd0pQ8sIr0UbgOuNXOWZn7szG5J9v76Lrul9RoyxFgeaa/
 8T5zrltmsOsIcnHzJyrsWY7FpFcsISmB7d5yhYTxpyOSyC3GdXwdhE4gK
 7m7pC6HFzBtKuwjO5w6kresiKpJu+grE28oby/PFch6/vZSOzZisrI36X
 BLDtJcpfNlPk4i4T9qTvVOicc6/gOtT0YSX+v/9/KWZzExRipIHdFb1BZ w==;
X-CSE-ConnectionGUID: cb82chP8QVCYXaymmfnY+w==
X-CSE-MsgGUID: 7tNG8fPbQli2+qR1yJw1tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9563851"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9563851"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:02:41 -0700
X-CSE-ConnectionGUID: mp9uPY4kS9ebUxyzmfahew==
X-CSE-MsgGUID: 7I9kSTbERS2kSYAK2JaBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="48284493"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 03:02:40 -0700
Date: Thu, 25 Apr 2024 12:02:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/*.json: remove some uneeded
 whitespaces
Message-ID: <20240425100237.y44wffmrimri7t6n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
 <20240425085203.142195-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240425085203.142195-3-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-04-25 at 10:49:23 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> To make the file more uniform, remove some extra whitespaces
> after a couple of field names at those files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/i915_test_config.json | 4 ++--
>  tests/intel/kms_test_config.json  | 2 +-
>  tests/intel/xe_test_config.json   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index f51ae2a55bdd..26e47215248d 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -91,7 +91,7 @@
>                  "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
>              }
>          },
> -        "Depends on" : {
> +        "Depends on": {
>              "_properties_": {
>                  "description": "List other subtests that are required to not be skipped before calling this one."
>              }
> @@ -101,7 +101,7 @@
>                  "description": "Point to known missing features at the test or subtest."
>              }
>          },
> -        "Description" : {
> +        "Description": {
>              "_properties_": {
>                  "description": "Provides a description for the test/subtest."
>              }
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 5c8db82dfc73..bca3b250fffb 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -52,7 +52,7 @@
>                  "description": "Defines the test category. Usually used at subtest level."
>              }
>          },
> -        "Description" : {
> +        "Description": {
>              "_properties_": {
>                  "description": "Provides a description for the test/subtest."
>              }
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index f8888341475a..3775e63fc65e 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -79,7 +79,7 @@
>                  "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
>              }
>          },
> -        "Depends on" : {
> +        "Depends on": {
>              "_properties_": {
>                  "description": "List other subtests that are required to not be skipped before calling this one."
>              }
> @@ -89,7 +89,7 @@
>                  "description": "Point to known missing features at the test or subtest."
>              }
>          },
> -        "Description" : {
> +        "Description": {
>              "_properties_": {
>                  "mandatory": true,
>                  "description": "Provides a description for the test/subtest."
> -- 
> 2.44.0
> 
