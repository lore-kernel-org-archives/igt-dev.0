Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE4DC54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 15:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4FB10E49E;
	Tue, 27 May 2025 15:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZTvVymJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FE110E4CD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748358995; x=1779894995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uaWfJ4lYr5YpVezHMnJFET4YE5YSbtqxjEg5sa093Ag=;
 b=gZTvVymJimTwo80zB8zZ0OgSTwdGds48mqvn+PsJRGaamrc/0rR8EF8t
 HtWX2TweeCzuOepcuYfsovTo9vm/pLU/WvNaZsLEd4edI5YGXpj0YARum
 QoiegTGPzSip5nBOiRy6+DejOiAoKzHU1167m45aB1kgj07wO8n7yiwKy
 FeiPr+1tjUcf4nQNLreRrU/TiO/1diP1VuICWe1d66/IPcbZx5188EZVY
 85l5WGBw9Kb0P0baO05KXnf4aHXjd75J+1++X2sU8k2yGojB4jGHbMFdu
 MIPGxwe2xsszu05N7xTFrWA15TpmzWZeB/WSFV0spns/WYcSa0tJIt/0Y w==;
X-CSE-ConnectionGUID: tsbHXOVZSrSKxIHSOjnaWQ==
X-CSE-MsgGUID: xG2A9bc5QtyXoTtrF1hkZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50353297"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50353297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 08:16:34 -0700
X-CSE-ConnectionGUID: ITd2xfXFRwyPzefecuAweg==
X-CSE-MsgGUID: dmnJhMhvT62gnk5GjiRW+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143826471"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 08:16:33 -0700
Date: Tue, 27 May 2025 17:16:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 marcin.bernatowicz@linux.intel.com, jakub1.kolakowski@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel: skip subtests using "mocs" debugfs
 if it's not present
Message-ID: <20250527151620.y7uf2lelasqwzpug@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 marcin.bernatowicz@linux.intel.com, jakub1.kolakowski@intel.com
References: <20250527075800.5507-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527075800.5507-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2025-05-27 at 09:58:00 +0200, Lukasz Laguna wrote:

one small nit about subject, imho it could have 'xe_*' prefix,
original is:

[PATCH i-g-t v2] tests/intel: skip subtests using "mocs" debugfs if it's not present

with prefix:
[PATCH i-g-t v2] tests/intel/xe_*: skip subtests using "mocs" debugfs if it's not present

This could be done at merge.

> The "mocs" debugfs entry is expected to be missing on VFs, so instead of
> asserting its presence, skip the subtests if it is not available.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v2:
> - use %s to print required debugfs entry (Kamil)
> ---
>  tests/intel/xe_exec_reset.c | 11 +++++++----
>  tests/intel/xe_pm.c         |  4 +++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 67b7bb826..7ae53c679 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -597,19 +597,22 @@ static void
>  gt_mocs_reset(int fd, int gt)
>  {
>  	char path[256];
> +	char *mocs_content_pre, *mocs_contents_post;
> +
> +	sprintf(path, "gt%d/mocs", gt);
> +	igt_require_f(igt_debugfs_exists(fd, path, O_RDONLY),
> +		      "Failed to open required debugfs entry: %s\n", path);
>  
>  	/* Mocs debugfs contents before and after GT reset.
>  	 * Allocate memory to store 10k characters sufficient enough
>  	 * to store global mocs and lncf mocs data.
>  	 */
> -	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
> -	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
> +	mocs_content_pre = (char *)malloc(10000 * sizeof(char));
> +	mocs_contents_post = (char *)malloc(10000 * sizeof(char));
>  
>  	igt_assert(mocs_content_pre);
>  	igt_assert(mocs_contents_post);
>  
> -	sprintf(path, "gt%d/mocs", gt);
> -	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
>  	igt_debugfs_dump(fd, path);
>  	igt_debugfs_read(fd, path, mocs_content_pre);
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 6eb21d5ec..7e9324eec 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -743,7 +743,9 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>  		igt_debug("Running on GT%d\n", gt);
>  
>  		sprintf(path, "gt%d/mocs", gt);
> -		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_require_f(igt_debugfs_exists(device.fd_xe, path, O_RDONLY),
> +			      "Failed to open required debugfs entry: %s\n", path);
> +
>  		igt_debugfs_dump(device.fd_xe, path);
>  		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>  
> -- 
> 2.40.0
> 
