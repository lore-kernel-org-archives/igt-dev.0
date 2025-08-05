Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52FFC87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 13:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C03E10E479;
	Tue,  5 Aug 2025 13:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FF2B29iJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039D010E479
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754399953; x=1785935953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aGQdAscpChwBmVlbCcK//rWHJumgrwlX5r5SlqboJAE=;
 b=FF2B29iJLv0t+8reUQqCArLaSfN8Pe7op17FGTMA2y92REi5YXaPOobW
 vsB8Rz0pMd2BvepSgG5vUYDtrhu6XBdSbmPcGeKRxeip1haaHaA4InXfu
 PaAlf+p736IOhC7zwEgE0pXQGHp+wMp6cTNjVbWMxrh9qnMVAZqkxe7zV
 Vt/n5VrCZR1+FIlC5yrYyMKyL6n0mxZQqsOQJFtRKi72bEAUwk0rIAAeB
 j/Ql2sqhyCrt/3grYr83VCPL+N+7UrqDAIWLpgc+lvtNNjNBQUJBKOOIC
 VQfhYmgBBElijuurvFC5lH+zD3ZuxkI20fbWmbBhIrO1nKUrccKRp/wvm w==;
X-CSE-ConnectionGUID: D5svOR66R7GZeAExEgMwqA==
X-CSE-MsgGUID: 01pJD1kRQNC5mM2LwRqIOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56770580"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56770580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:19:13 -0700
X-CSE-ConnectionGUID: J1CSwdoLTqaxuUeYK+2Pmw==
X-CSE-MsgGUID: VibhDli8QnuuvW5Ai6lIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195451883"
Received: from unknown (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 06:19:10 -0700
Date: Tue, 5 Aug 2025 15:18:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [PATCH i-g-t v1 2/4] gitlab-ci: Rename blocklist verify script
Message-ID: <20250805131854.kjy2o56q3xpewpdw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
 <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
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

Hi igt-dev,
On 2025-07-28 at 19:31:50 +0200, Kamil Konieczny wrote:
> Rename verify script and also pipeline which uses it.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Michal Czaplinski <michal.czaplinski@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Rob Clark <rob.clark@oss.qualcomm.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  .gitlab-ci.yml                                       | 4 ++--
>  scripts/{verify-blacklist.sh => verify-blocklist.sh} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename scripts/{verify-blacklist.sh => verify-blocklist.sh} (100%)

+cc few other devs from Igalia and Collabora as I plan to remove
symlink from patch 4 in a few weeks.

Regards,
Kamil

> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 8098f2b70..fb5713fba 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -227,11 +227,11 @@ test:list-undocumented-tests:
>      paths:
>        - undocumented_tests.txt
>  
> -test:verify-blacklists:
> +test:verify-blocklists:
>    dependencies:
>      - build:tests-fedora
>    stage: test
> -  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
> +  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blocklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
>  
>  ################### DEPLOY #########################
>  
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blocklist.sh
> similarity index 100%
> rename from scripts/verify-blacklist.sh
> rename to scripts/verify-blocklist.sh
> -- 
> 2.50.1
> 
