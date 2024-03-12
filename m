Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8471FC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 16:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201E1112EFC;
	Tue, 12 Mar 2024 16:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeNSXoBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDC9112F13
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710259246; x=1741795246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YXRoAE2TfPDa4NHZhqEuyLA6lEQP8LQYXT9zZZTIV1k=;
 b=eeNSXoBQJIfIPcEKYN0p+CSYgVzqWuaJPTKAtKDtcqIUlnQHmzUOuMs8
 wgzORGkPBK0ZqfhtRMpvWyKON8ffY7aV7zHhlOT2G4hFBQQifMGCmR7cC
 ZpdQrv8LXXvMvrsLUIbK0Wfk436QMz6b0HoyMQuO26RmXWijPOZ9Ubw8c
 T58FfRlWH9aqXXfr1X0+E/kXL16Weiemr/SWjfE5uPU22TsQUkhUmzuic
 Obgs9a7hKvZU+AVB38TET7QRbjL9pdJxnZYX0emKcLZVp5nAp3TzGuRET
 zJixJDLL5RqiZUEc9vGtR5JFd9VZbnKMHkJp7C/dEZXc8i5iw8Akdzk2T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27451219"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27451219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12010243"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:00:42 -0700
Date: Tue, 12 Mar 2024 17:00:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t v3 04/25] tests/intel: Introduce Caching subcategory
Message-ID: <20240312160040.4qxoyi4zwytld2nl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
 <20240312141419.1277931-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312141419.1277931-5-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-12 at 14:13:58 +0000, Katarzyna Piecielska wrote:
> Let's have 'Caching' subcategory to show where we are testing cashing.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_caching.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
> index 4a8f69e97..4a95cf528 100644
> --- a/tests/intel/gem_caching.c
> +++ b/tests/intel/gem_caching.c
> @@ -45,9 +45,9 @@
>   * Category: Desktop client
>   * Description: Test snoop consistency when touching partial cachelines.
>   * Feature: caching
> - * Functionality: data coherency
> + * Functionality: coherency
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Caching

Isn't this conflicting with Feature?

Regards,
Kamil

>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: read-writes
> -- 
> 2.34.1
> 
