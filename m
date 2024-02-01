Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7CC47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9DB10ED90;
	Thu,  1 Feb 2024 13:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsaRGpm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7D10ED90
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706792763; x=1738328763;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7R920xLOL85VcndSzVTIOBoe1xIpc3VK7Ph5qnCsk3s=;
 b=QsaRGpm9gxJiYc2QA+4+3Gb+Of8y+n1+smm/W7jq1tCRllZJdmHqugpc
 HHOuTAOBaloMloP7hNYnzfqg38p0EZQjxzh8rC0ZNhulx9CMkv+nqBQ2c
 miWawT7PoEH+wIxdZnklvPtfBoKiiDeB3PogAPtYshyslm5YcU6RdbcDf
 mNrzpR324gD8T5wYMG59RQf2tHFYd0g3d8ohzIyw1WLPnAqX3joGqme4C
 nt/QVZagy1FZkt8oXcZa93YyiZ+uwP+ZF+e99uiR8O9qj/B+sFZKGr5QU
 SqLwIUf0ftJ0GeU7s7kn5CYmE6+8nCZncduxA+tqwA7tJJ8MZHfqyFj8M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25351296"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="25351296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="70169"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:06:02 -0800
Date: Thu, 1 Feb 2024 14:05:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 3/3] lib/igt_sysfs: Fix dir fd documentation
Message-ID: <20240201130559.zkmpaujqji52d6td@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <20240201005115.352192-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201005115.352192-4-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-01-31 at 16:50:30 -0800, Lucas De Marchi wrote:
> These functions can be used for any path in sysfs, not exclusively to
> attributes under igt_sysfs_open(). In fact, they are already used to
> access other files like module parameters.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_sysfs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 814220ddb..bbcb16c81 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -343,7 +343,7 @@ int igt_sysfs_get_num_gt(int device)
>  
>  /**
>   * igt_sysfs_write:
> - * @dir: directory for the device from igt_sysfs_open()
> + * @dir: sysfs directory
>   * @attr: name of the sysfs node to open
>   * @data: the block to write from
>   * @len: the length to write
> @@ -369,7 +369,7 @@ int igt_sysfs_write(int dir, const char *attr, const void *data, int len)
>  
>  /**
>   * igt_sysfs_read:
> - * @dir: directory for the device from igt_sysfs_open()
> + * @dir: sysfs directory
>   * @attr: name of the sysfs node to open
>   * @data: the block to read into
>   * @len: the maximum length to read
> @@ -395,7 +395,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>  
>  /**
>   * igt_sysfs_set:
> - * @dir: directory for the device from igt_sysfs_open()
> + * @dir: sysfs directory
>   * @attr: name of the sysfs node to open
>   * @value: the string to write
>   *
> @@ -412,7 +412,7 @@ bool igt_sysfs_set(int dir, const char *attr, const char *value)
>  
>  /**
>   * igt_sysfs_get:
> - * @dir: directory for the device from igt_sysfs_open()
> + * @dir: sysfs directory
>   * @attr: name of the sysfs node to open
>   *
>   * This reads the value from the sysfs file.
> -- 
> 2.43.0
> 
