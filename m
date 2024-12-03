Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A912E74AC8
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 18:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0550F10EB08;
	Tue,  3 Dec 2024 18:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egUy0cMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A31510EB05
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733250695; x=1764786695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lUt3AqVnmIKo8SVp02JqFkfio1r70ANbhr3tOSbRj/E=;
 b=egUy0cMxIIFszhBaVEa/s8MpfXZCxQWCD2rNw3ikAtSABoncrCQAqqgZ
 aj1KxKXrnT9QGnfG6OA/lfiirN4XZGwr7+kDpeNFELezZzdbBWONi25ac
 Amh/O+Gnfwc0nBEcG0MlqRGVWPQOrlDoLhhFVBy7J8x9sE2tWVdZVbHQB
 aOF8D3PQd+1BQ2PbP6WqmSe04EgIdiVaBMS511B5zK2AiWXnZgHFlQ457
 3IzvvqbhHiVgxfZcvVKckaPwYNgDHaXZrQ2cEyIXJKNtjmfHRx4YBuh4f
 aklfWyXCV3cuZ86lJLN8kQzo9ClZdBPOPY3ofy/qJuNfyWTiqARF7+D93 w==;
X-CSE-ConnectionGUID: 0/EsXGsgQ4yCwqd25clgkg==
X-CSE-MsgGUID: OiZdQwZkTc6/Bbb3exgYjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37420853"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37420853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 10:31:34 -0800
X-CSE-ConnectionGUID: PaOAmEnsQdm203wRbYCBfA==
X-CSE-MsgGUID: gFxZcY+1Te26P2RLJjzU3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98534761"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 10:31:33 -0800
Date: Tue, 3 Dec 2024 19:31:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
Message-ID: <20241203183115.zrfg723eh2y7oteo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
 <20241202180816.47538-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202180816.47538-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-12-02 at 18:08:13 +0000, Jonathan Cavitt wrote:
> Create two new helper functions, igt_sysfs_get_engine_list and
> igt_sysfs_free_engine_list, that create and destroy lists of open
> engines, respectively.  The list created by igt_sysfs_get_engine_list
> can be used to iterate over the set of engines in sysfs/engines and must
> be freed by igt_sysfs_free_engine_list after use.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/igt_sysfs.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  3 +++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 00d5822fd3..efb071bfe9 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1307,6 +1307,66 @@ static uint16_t xe_get_engine_class(char *name)
>  	return class;
>  }
>  
> +/**
> + * igt_sysfs_get_engine_list:
> + * @engines: fd of the directory engine
> + *
> + * Iterates over sysfs/engines and returns an array of
> + * opened engines.  The user will be in charge of closing
> + * the opened engines.
> + *
> + * The returned array will always be terminated by a -1.
> + */
> +int *igt_sysfs_get_engine_list(int engines)
> +{
> +	struct dirent *de;
> +	DIR *dir;
> +#define ARRAY_MAX	16

Use cont int here, like:
	cont int max_engines = 16;

> +	int *ret = calloc(ARRAY_MAX, sizeof(int));
> +	int size = 0;
> +
> +	igt_assert(ret);
> +
> +	lseek(engines, 0, SEEK_SET);
> +
> +	dir = fdopendir(engines);
> +	if (!dir)
> +		close(engines);

Add 'else' here.

> +
> +	while ((de = readdir(dir))) {
> +		if (*de->d_name == '.')
> +			continue;
> +		ret[size] = openat(engines, de->d_name, O_RDONLY);
> +		if (ret[size] < 0) {
> +			ret[size] = 0;
> +			continue;
> +		}
> +		size += 1;
> +		igt_assert_lt(size, ARRAY_MAX);

Move this assert before assignment 'ret[size] = ...'

> +	}
> +
> +	ret[size] = -1;

Add newline here.


> +	return ret;
> +}
> +#undef ARRAY_MAX

Remove this.

Rest looks good.

Regards,
Kamil


> +
> +/**
> + * igt_sysfs_free_engine_list:
> + * @list: list of opened engines
> + * @size: number of engines in list
> + *
> + * Helper for cleaning up after igt_sysfs_get_engine_list.
> + * Closes all engines in list before freeing the list.
> + */
> +void igt_sysfs_free_engine_list(int *list)
> +{
> +	int i = 0;
> +
> +	while (list[i] != -1)
> +		close(list[i++]);
> +	free(list);
> +}
> +
>  /**
>   * igt_sysfs_engines:
>   * @xe: fd of the device
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 54a4087918..86345f3d1b 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -168,6 +168,9 @@ typedef struct igt_sysfs_rw_attr {
>  
>  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
>  
> +int *igt_sysfs_get_engine_list(int engines);
> +void igt_sysfs_free_engine_list(int *list);
> +
>  void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
>  		       void (*test)(int, int, const char **, uint16_t, int));
>  
> -- 
> 2.43.0
> 
