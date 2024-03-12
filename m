Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447BAC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084310ED49;
	Tue, 12 Mar 2024 14:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LukvdRT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A6110ED49
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710254616; x=1741790616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pBX2O1vb3oi6p6H0G+F7iJH8dhtKicx7JVawsFV/wxw=;
 b=LukvdRT+3wxHAloiFdAJO9upOF7uJk1cq3b6q9d7UZBtqkGL7h2IRAOx
 63T4/fGqQdBiQR95n7iL87QIO4YnLtjRljkZBU0H4SW2ezB/xwHL+zdWY
 QoscjheRqSNT1/7j+hQ0/EhZ+CWcEf2oJmgw4JcpDQUjx4Q3Jgojqzf0j
 bRVxOkYBSI0ZSWKYqOJenQU1XgjBhp7Ijgm/8HP56aeXz3l/fUhhX3xLu
 7m/H2bkJ+ZrgunAnqeWin+/zgTBVgfTcTQzDHIU8/9eSBDz/NvI04dU/S
 aweSMaWr76iZBiSO7N9IbZbo5NmIrJfUhvo1lJIiJ9twcsoejJ94XVL/h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5572185"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5572185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16168097"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:43:34 -0700
Date: Tue, 12 Mar 2024 15:43:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 14/25] tests/intel: Introduce Obsolete subcategory
Message-ID: <20240312144331.2rmqoh4ernqie2hj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
 <20240312141419.1277931-15-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312141419.1277931-15-katarzyna.piecielska@intel.com>
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
On 2024-03-12 at 14:14:08 +0000, Katarzyna Piecielska wrote:
> gen3_* tests are obsolete, so let's put them into one subcategory.
> 
> v2: change functionality to 'obsolete_test' to not break automation
> tools
> v3: Category and Sub-category need to be unique as well, so change
> Sub-category s/Obsolete/Obsolete_gen3/.
> 

Looks good, see two nits below.

> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gen3_mixed_blits.c         | 3 +++
>  tests/intel/gen3_render_linear_blits.c | 3 +++
>  tests/intel/gen3_render_mixed_blits.c  | 3 +++
>  tests/intel/gen3_render_tiledx_blits.c | 5 ++++-
>  tests/intel/gen3_render_tiledy_blits.c | 5 ++++-
>  5 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
> index 3c6fb141a..2bb5517c8 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index 7dfb2709a..681d7b01b 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -50,6 +50,9 @@
>  /**
>   * TEST: gen3 render linear blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index f8e1bdfbd..ee42f068b 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index 1abe5adbc..ca49576a9 100644
> --- a/tests/intel/gen3_render_tiledx_blits.c
> +++ b/tests/intel/gen3_render_tiledx_blits.c
> @@ -25,7 +25,7 @@
>   *
>   */
>  
> -/** @file gen3_linear_render_blits.c
> +/** @file gen3_render_tiledx_blits.c

Please write about this correction in commit description.

>   *
>   * This is a test of doing many blits, with a working set
>   * larger than the aperture size.
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render tiledx blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Category: Obsolete
> + * Functionality: obsolete_test
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index b1f4b628a..dfd3ef947 100644
> --- a/tests/intel/gen3_render_tiledy_blits.c
> +++ b/tests/intel/gen3_render_tiledy_blits.c
> @@ -25,7 +25,7 @@
>   *
>   */
>  
> -/** @file gen3_linear_render_blits.c
> +/** @file gen3_render_tiledy_blits.c

This also needs to be mensioned in description.
With this:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>   *
>   * This is a test of doing many blits, with a working set
>   * larger than the aperture size.
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render tiledy blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Category: Obsolete
> + * Functionality: obsolete_test
>   * Run type: FULL
>   *
>   * SUBTEST:
> -- 
> 2.34.1
> 
