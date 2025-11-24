Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57629CFD355
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 21:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9AA897F6;
	Mon, 24 Nov 2025 21:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViOJ30ZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7F5897F6
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 21:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764020984; x=1795556984;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=4u4c0zZFt6mV4L/6dgwzmMhvPFnUttE3nyjH6VZkyE4=;
 b=ViOJ30ZBdSZpfY+grrw+4w2ocobT1h3sjuvYYl4FiPEXQRlQOgP7jr+S
 9aVKkYh9/ziWRTZCpIr9g3AsKHZ9OfJahFJuQooq8iI3MFNQFmd5sj+5e
 uLHUDBfX4w9MYBPZpNAGw20Xfhk9nYWIpr3dfLUzIsgn+nCQMfrtzOjBZ
 0QUgChsWAnYZoPThCIB+4IHiYBW9rkazROzrUl3qBVahTR4KlWUu9Pmaf
 6buu8xSs8V92HQyukArTkUZC0yuUyODZgmG0ZAfem25efUh4msRr6AwNV
 kGJGf2BRimSxuwuK1JeDmJLlC/qmH3V8d5qoUNx/gwxS5MrkylMKJJiFm Q==;
X-CSE-ConnectionGUID: EM0H7vEmRLuIo76XLtxQzA==
X-CSE-MsgGUID: tjkyXjdqSbOVdcjZ6H6prg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76718297"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="76718297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:49:44 -0800
X-CSE-ConnectionGUID: OazKcBQlR6emKl2IbgQbzg==
X-CSE-MsgGUID: Q7U4eDocRJ+Uh8H93OrzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="223428408"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.124.222.176])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:49:43 -0800
Date: Mon, 24 Nov 2025 23:49:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 7/7] scripts/cocci: Add iterators.cocci
Message-ID: <aSTS9ENX7KARW9lb@intel.com>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <20251120191415.4236-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120191415.4236-8-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Nov 20, 2025 at 09:14:15PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Coccinelle often chokes on magic iterator macros. We
> can lend it a hand by explicitly declaring those macros
> as iterators. Start collecting them in
> scripts/iterators.cocci which people can easily include
> in their cocci scripts.
> 
> The "struct dummy" is there because coccinelle doesn't
> like an empty script. Dunno if there's a cleaner way
> around that?
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  scripts/iterators.cocci | 53 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 scripts/iterators.cocci
> 
> diff --git a/scripts/iterators.cocci b/scripts/iterators.cocci
> new file mode 100644
> index 000000000000..90d3ae437a15
> --- /dev/null
> +++ b/scripts/iterators.cocci
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: MIT
> +//
> +// Use with
> +// #include "scripts/iterators.cocci"
> +// at the start of your cocci script
> +
> +@@
> +iterator name for_each_collection_data;
> +iterator name for_each_combination;
> +iterator name for_each_connected_output;
> +iterator name for_each_connector_mode;
> +iterator name for_each_ctx_engine;
> +iterator name for_each_disconnected_output;
> +iterator name for_each_format;
> +iterator name for_each_if;
> +iterator name for_each_output;
> +iterator name for_each_pipe;
> +iterator name for_each_pipe_static;
> +iterator name for_each_pipe_with_single_output;
> +iterator name for_each_pipe_with_valid_output;
> +iterator name for_each_plane_on_pipe;
> +iterator name for_each_prime_number;
> +iterator name for_each_sriov_enabled_vf;
> +iterator name for_each_sriov_num_vfsfor_each_sriov_vf;
> +iterator name for_each_sriov_num_vfs_in_rangefor_each_sriov_vf_in_range;
> +iterator name for_each_sriov_vf;
> +iterator name for_each_sriov_vf_in_range;
> +iterator name for_each_subset;
> +iterator name for_each_subset;
> +iterator name for_each_sysfs_gt_dirfd;
> +iterator name for_each_sysfs_gt_path;
> +iterator name for_each_sysfs_tile_dirfd;
> +iterator name for_each_tiling;
> +iterator name for_each_valid_output_on_pipe;
> +iterator name for_each_variation_nr;
> +iterator name for_each_variation_r;
> +iterator name igt_for_each_drm_client;
> +iterator name igt_list_for_each_entry;
> +iterator name igt_list_for_each_entry_reverse;
> +iterator name igt_list_for_each_entry_safe;
> +iterator name igt_list_for_each_entry_safe_reverse;
> +iterator name igt_dynamic;
> +iterator name igt_dynamic_f;
> +iterator name igt_fixture;
> +iterator name igt_fork;
> +iterator name igt_require;
> +iterator name igt_subtest;
> +iterator name igt_subtest_f;
> +iterator name igt_subtest_group;
> +iterator name igt_subtest_with_dynamic;
> +iterator name igt_subtest_with_dynamic_f;

Couple of other needed iterators I apparently forgot to include here:

+iterator name igt_until_timeout;
+iterator name igt_while_interruptible;

I should also check if cocci supports regexp with iterator names since
that could reduce this list quite a bit...

> +@@
> +struct dummy
> -- 
> 2.49.1

-- 
Ville Syrjälä
Intel
