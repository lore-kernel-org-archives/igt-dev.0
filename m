Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63B8C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63547112285;
	Mon,  4 Mar 2024 15:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqRjrC6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4ED112285
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565662; x=1741101662;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jvgItbWJNnHx8Hor6BpnM9wTyCKOwMDKh9p06KJ8Y3o=;
 b=VqRjrC6PSYXN9kxJgifern/KM3XOB+k5fbaOlkTbrhs54PUWiCNk9B7g
 IZKIhjag8vlCLM9zr9BzWcCBKoEsLUjCHe1TWGrfmscXn853KXWIQlSaQ
 BucI8lb1XQD9V59oRfJ8RkEIQwLUShyZFUKwYa5PfjBBC1NyR1dPQqann
 Eg4k0RetxtKu2re4OPaTHAYW1sThXmbOtRoV7EfQB4lEOrmLrGaDbvKtH
 Z7G8yXUz9+DmhxabEFf6drmfNgtRtef26itm21ClNb06yEXSh/L4gcXuo
 Hv8NdiTxu4w3GLuPAbMZkSdtd74dtit/eLp3xcNUmr9iP9kbzcRYwpiRN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21522922"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="21522922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13609257"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:21:00 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4DA985807E7;
 Mon,  4 Mar 2024 07:20:58 -0800 (PST)
Date: Mon, 4 Mar 2024 16:20:55 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t 16/24] tests/intel: Introduce SysMan subcategory
Message-ID: <20240304162055.1bfb0b4d@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-17-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-17-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 11:16:09 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put e.g. sysfs heartbeat, sysfs preempt timeout, timeslise sysfs
> under SysMan subcategory.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/sysfs_heartbeat_interval.c | 3 +++
>  tests/intel/sysfs_preempt_timeout.c    | 3 +++
>  tests/intel/sysfs_timeslice_duration.c | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
> index 09dbc4129..8c6c448fa 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -45,6 +45,9 @@
>   * TEST: sysfs heartbeat interval
>   * Feature: SMI, cmd_submission
>   * Test category: SysMan
> + * Sub-category: SysMan
> + * Category: Desktop \ Server
> + * Functionality: sysfs heartbeat
>   * Run type: FULL
>   *
>   * SUBTEST: idempotent
> diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
> index 606491c34..0663c347a 100644
> --- a/tests/intel/sysfs_preempt_timeout.c
> +++ b/tests/intel/sysfs_preempt_timeout.c
> @@ -44,6 +44,9 @@
>   * TEST: sysfs preempt timeout
>   * Feature: SMI, context
>   * Test category: SysMan
> + * Sub-category: SysMan
> + * Category: Desktop \ Server
> + * Functionality: sysfs preempt timeout
>   * Run type: FULL
>   *
>   * SUBTEST: idempotent
> diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
> index cceac94f2..e8dd2677e 100644
> --- a/tests/intel/sysfs_timeslice_duration.c
> +++ b/tests/intel/sysfs_timeslice_duration.c
> @@ -47,6 +47,9 @@
>   * TEST: sysfs timeslice duration
>   * Feature: SMI, cmd_submission
>   * Test category: SysMan
> + * Functionality: timeslise sysfs
> + * Sub-category: SysMan
> + * Category: Desktop \ Server
>   * Run type: FULL
>   *
>   * SUBTEST: duration
