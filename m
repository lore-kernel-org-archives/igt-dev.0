Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7132EE7716B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 07:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5210E09C;
	Wed,  4 Dec 2024 07:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJlBgHkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31110E09C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733297173; x=1764833173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8XAeJb4QEzcOgqU7vdGva8CO24TOYNhIgi4yhPTmD1E=;
 b=WJlBgHkZdDld6pHCys0yfMnB1WP72Fq7T7aMh4dEXggPMQziMBps9NpF
 66suCJKwtpBgVdydxqZHzMoPg/RrjHYnPuWNfWeFjaznQS0uAhy860qlA
 yRwofNJ0XB1qeNJSNG7RtwVDcdYw1I+lIsrYOckhh2+U/GDCa7bhAjtP3
 XwFB4DDFEMhOHErG1NBkKT7VgxekfQqR5VjYhkzZqdA4xTcTcc0CtLz3o
 aDRHeUJNDDkQgzUkJDpneI9BZGKq8C05UlPmChJEGpdqe1SetDBDRRLqk
 ZX2+CZHG60geJS6tXAIzgdhyKHNwp4qPTKKag1hwujJXik4BI/HLId6Gw A==;
X-CSE-ConnectionGUID: BWwBJKSnRHefL4mznhKuLQ==
X-CSE-MsgGUID: R456CBohRUeDX1d37ado4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44026392"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44026392"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 23:26:13 -0800
X-CSE-ConnectionGUID: 30Q5xNinQZeD4senr3VQIA==
X-CSE-MsgGUID: BzsYopkVSpCEqrxKA95c9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94109820"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:26:11 -0800
Date: Wed, 4 Dec 2024 08:25:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
Message-ID: <20241204072554.tzwfixdxgxnkwnby@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
References: <20241202180816.47538-1-jonathan.cavitt@intel.com>
 <20241202180816.47538-2-jonathan.cavitt@intel.com>
 <20241203183115.zrfg723eh2y7oteo@kamilkon-desk.igk.intel.com>
 <CH0PR11MB5444070CA9CB4B59F75DF9BCE5362@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444070CA9CB4B59F75DF9BCE5362@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Cavitt,,
On 2024-12-03 at 22:24:46 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Tuesday, December 3, 2024 10:31 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: Re: [PATCH v8 1/4] lib/igt_sysfs: Add engine list helpers
> > 
> > Hi Jonathan,
> > On 2024-12-02 at 18:08:13 +0000, Jonathan Cavitt wrote:
> > > Create two new helper functions, igt_sysfs_get_engine_list and
> > > igt_sysfs_free_engine_list, that create and destroy lists of open
> > > engines, respectively.  The list created by igt_sysfs_get_engine_list
> > > can be used to iterate over the set of engines in sysfs/engines and must
> > > be freed by igt_sysfs_free_engine_list after use.
> > > 
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >  lib/igt_sysfs.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/igt_sysfs.h |  3 +++
> > >  2 files changed, 63 insertions(+)
> > > 
> > > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > > index 00d5822fd3..efb071bfe9 100644
> > > --- a/lib/igt_sysfs.c
> > > +++ b/lib/igt_sysfs.c
> > > @@ -1307,6 +1307,66 @@ static uint16_t xe_get_engine_class(char *name)
> > >  	return class;
> > >  }
> > >  
> > > +/**
> > > + * igt_sysfs_get_engine_list:
> > > + * @engines: fd of the directory engine
> > > + *
> > > + * Iterates over sysfs/engines and returns an array of
> > > + * opened engines.  The user will be in charge of closing
> > > + * the opened engines.
> > > + *
> > > + * The returned array will always be terminated by a -1.
> > > + */
> > > +int *igt_sysfs_get_engine_list(int engines)
> > > +{
> > > +	struct dirent *de;
> > > +	DIR *dir;
> > > +#define ARRAY_MAX	16
> > 
> > Use cont int here, like:
> > 	cont int max_engines = 16;
> 
> I'll do it, but this seems very much like we're intentionally pushing the
> definition of what a "magic value" is.
> 

Right, if you want in future use realloc it should be just 'int',
not 'const int'.

> > 
> > > +	int *ret = calloc(ARRAY_MAX, sizeof(int));
> > > +	int size = 0;
> > > +
> > > +	igt_assert(ret);
> > > +
> > > +	lseek(engines, 0, SEEK_SET);
> > > +
> > > +	dir = fdopendir(engines);
> > > +	if (!dir)
> > > +		close(engines);
> > 
> > Add 'else' here.
> 
> The manual page for readdir states that if the function fails, NULL is returned and
> errno is set.  Passing readdir a NULL pointer is one such failure case, returning
> NULL and causing the while loop to exit immediately before it starts.  In this case,
> the returned array will only contain the terminator value -1.  This will essentially
> report a size of 0 and cause the test case this is used in to result in failure.
> 
> In short, we don't need a contingency plan for if the directory failed to open
> because readdir already handles the "failed to open" case in a way that can
> benefit from.
> 

You are right.

> > 
> > > +
> > > +	while ((de = readdir(dir))) {
> > > +		if (*de->d_name == '.')
> > > +			continue;
> > > +		ret[size] = openat(engines, de->d_name, O_RDONLY);
> > > +		if (ret[size] < 0) {
> > > +			ret[size] = 0;
> > > +			continue;
> > > +		}
> > > +		size += 1;
> > > +		igt_assert_lt(size, ARRAY_MAX);
> > 
> > Move this assert before assignment 'ret[size] = ...'
> 
> If size == ARRAY_MAX after incrementing size, then assigning the terminator
> value -1 to position "size" in the array (see below) will overrun the array.
> I can move the assert to before the assignment, but because we need the
> position size+1 to be available for the terminator value after the while loop,
> we'd need to assert that size < ARRAY_MAX - 1 at that position to account
> for the later incrementation.
> 
> I think that implementation of the assert would make the purpose of the
> assert less clear, though.  Also, we might hit some false positives doing it
> that way; For example, if the engines directory has 20 elements, and only
> the first 15 are valid, then we'd technically have enough room to store the
> engines and the terminator since we'd not have to store the last 5 invalid
> elements.  However, we'd hit the assert anyways because we wouldn't
> check those elements beforehand.
> 
> The alternative would be to move the assert back to before the assignment
> without updating the check value, but then we'd need to check the size
> again outside of the loop before we add the terminator value.  Not that
> there's anything inherently wrong with that approach, it just seems a bit
> inefficient compared to the current implementation.
> 
> I'll take the second approach.
> -Jonathan Cavitt
> 

And here you are also right, I forgot about that last
guard added after 'while.

Regards,
Kamil

> > 
> > > +	}
> > > +
> > > +	ret[size] = -1;
> > 
> > Add newline here.
> > 
> > 
> > > +	return ret;
> > > +}
> > > +#undef ARRAY_MAX
> > 
> > Remove this.
> > 
> > Rest looks good.
> > 
> > Regards,
> > Kamil
> > 
> > 
> > > +
> > > +/**
> > > + * igt_sysfs_free_engine_list:
> > > + * @list: list of opened engines
> > > + * @size: number of engines in list
> > > + *
> > > + * Helper for cleaning up after igt_sysfs_get_engine_list.
> > > + * Closes all engines in list before freeing the list.
> > > + */
> > > +void igt_sysfs_free_engine_list(int *list)
> > > +{
> > > +	int i = 0;
> > > +
> > > +	while (list[i] != -1)
> > > +		close(list[i++]);
> > > +	free(list);
> > > +}
> > > +
> > >  /**
> > >   * igt_sysfs_engines:
> > >   * @xe: fd of the device
> > > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> > > index 54a4087918..86345f3d1b 100644
> > > --- a/lib/igt_sysfs.h
> > > +++ b/lib/igt_sysfs.h
> > > @@ -168,6 +168,9 @@ typedef struct igt_sysfs_rw_attr {
> > >  
> > >  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
> > >  
> > > +int *igt_sysfs_get_engine_list(int engines);
> > > +void igt_sysfs_free_engine_list(int *list);
> > > +
> > >  void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
> > >  		       void (*test)(int, int, const char **, uint16_t, int));
> > >  
> > > -- 
> > > 2.43.0
> > > 
> > 
