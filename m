Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB9D6552E
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 17:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416D810E961;
	Tue, 26 Nov 2024 17:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYfZM9mx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BA010E961
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732640810; x=1764176810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FKlo99oX2idmKGPdN9Ijo47DLgooDWv62KjXMB46DeU=;
 b=AYfZM9mxU8qeTZLOjYjNepkma/sDfEXfk5Bv4ohoK2P4IfhbZ9I9v6pJ
 VgwWtP+AM6f4HKh0KO5jHooC7x6/d40pNyS/AHyL1vWHtVjBUTGkyCPhk
 fRH8XqKEbVLipKGM1wjpkf4SaHe83NOaKvL5j1soAVJxsBiizpdkFewep
 BsfnKRhXXf3kn3rf8s+iZDn77mVJYHz19s8Q9HB0CFeFEDT59H26ZCB+I
 aRKX5p+XqFyw8p223YUNbitPQEPnf9qKBTsgz4prGLOZB7wP1p2wR/Rij
 4FSEAPc09eOKo2zQ0OlmoMh1oqYAJbx/staIgImnR/BJOpXSNZ6dnJhZ9 g==;
X-CSE-ConnectionGUID: I0sVFl58SkiLi++DQqPgoA==
X-CSE-MsgGUID: V0vLCJeIT2SyQqyo6L+VYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36602703"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="36602703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:06:50 -0800
X-CSE-ConnectionGUID: E8IOxnpFS+KvFstdOej0wQ==
X-CSE-MsgGUID: wu62GkPbRuW2BR1TwEqtEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91496629"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:06:48 -0800
Date: Tue, 26 Nov 2024 18:06:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v7 1/4] lib/igt_sysfs: Add engine list helpers
Message-ID: <20241126170646.4qp4vw637k5f7vqu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
 <20241118180511.64212-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118180511.64212-2-jonathan.cavitt@intel.com>
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
On 2024-11-18 at 18:05:08 +0000, Jonathan Cavitt wrote:
> Create two new helper functions, igt_sysfs_get_engine_list and
> igt_sysfs_free_engine_list, that create and destroy lists of open
> engines, respectively.  The list created by igt_sysfs_get_engine_list
> can be used to iterate over the set of engines in sysfs/engines and must
> be freed by igt_sysfs_free_engine_list after use.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Please check all patches in series with checkpatch.pl and correct
findings.

> ---
>  lib/igt_sysfs.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  3 +++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 00d5822fd3..3d2dd364cf 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1307,6 +1307,60 @@ static uint16_t xe_get_engine_class(char *name)
>  	return class;
>  }
>  
> +/**
> + * igt_sysfs_get_engine_list:
> + * @engines: fd of the directory engine
> + * @size: pointer to store the size of the returned char pointer
> + *
> + * Iterates over sysfs/engines and returns an array of
> + * opened engines.  The user will be in charge of closing
> + * the opened engines.
> + *
> + * The number of opened engines will be saved to size.
> + */
> +int *igt_sysfs_get_engine_list(int engines, int *size)
> +{
> +	struct dirent *de;
> +	DIR *dir;
> +	int* ret = calloc(1, sizeof(int));

	int *ret = ...

Assert for NULL here: igt_assert(ret)

Why not 16? So you should avoid realloc?
This would require to keep its size but imho would be better.
Up to you.

> +
> +	lseek(engines, 0, SEEK_SET);
> +
> +	dir = fdopendir(engines);
> +	if (!dir)
> +		close(engines);

Should be:

	if (!dir)
		return NULL;

Btw why do you close engines here?

> +
> +	*size = 0;

Move this to begin of function. Btw do we need size? You could assume
a guard at end with -1 so one param less.


> +	while ((de = readdir(dir))) {
> +		if (*de->d_name == '.')
> +			continue;
> +		ret[*size] = openat(engines, de->d_name, O_RDONLY);
> +		if (ret[*size] < 0) {

Why ignore? imho this is something unexpected?

Overall looks good, thx for fixing this.

Regards,
Kamil

> +			ret[*size] = 0;
> +			continue;
> +		}
> +		*size += 1;
> +		reallocarray(ret, *size + 1, sizeof(int));
> +	}
> +	return ret;
> +}
> +
> +/**
> + * igt_sysfs_free_engine_list:
> + * @list: list of opened engines
> + * @size: number of engines in list
> + *
> + * Helper for cleaning up after igt_sysfs_get_engine_list.
> + * Closes all engines in list before freeing the list.
> + */
> +void igt_sysfs_free_engine_list(int *list, int size)
> +{
> +	int i;
> +	for (i = 0; i < size; i++)
> +		close(list[i]);
> +	free(list);
> +}
> +
>  /**
>   * igt_sysfs_engines:
>   * @xe: fd of the device
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 54a4087918..ba0a74755c 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -168,6 +168,9 @@ typedef struct igt_sysfs_rw_attr {
>  
>  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
>  
> +int *igt_sysfs_get_engine_list(int engines, int *size);
> +void igt_sysfs_free_engine_list(int *list, int size);
> +
>  void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
>  		       void (*test)(int, int, const char **, uint16_t, int));
>  
> -- 
> 2.43.0
> 
