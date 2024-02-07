Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE9C4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 16:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89A10F083;
	Wed,  7 Feb 2024 16:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWHcCKIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E8910F092
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707322715; x=1738858715;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1BBLINqxVweUQReuClyJhALKgs96OkEOiGm+H/whts4=;
 b=FWHcCKIK78ewbn+c4wUSIeb6EW+DyBHRj2XyxvkO63eUuk/lAnTrwRax
 b2BXnFkvuj15c/cj7/Er8nsHm6/TnmP6osxPVINdX9j9rU/+5SkaqltCi
 R5XFxhCfCDfeVXj+AoniYy4R+R7TEkrQoaYO3WxEt1+r6jmF4yZ854xO4
 BuTvmgLGSwA0BkAYd9lgeANx2Y4X/bkmHaArfcw/XmrwHAWhx5AdYwKFg
 m6cHFnabdmw9+QSEOoOSHO8Fo9oPz0h4aVaYX/VnQGeLerh4gX+EPh2B/
 pD5i5Y8dfyx50g5VmOQy6y7SswFcWL180at7Ooneie1vWh4kIBaaxlnP9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4887373"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="4887373"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="38817187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:18:33 -0800
Date: Wed, 7 Feb 2024 17:18:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_sysfs: make sure to write empty strings
Message-ID: <20240207161830.rzmcaujo2rcjb5jz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240201005115.352192-3-lucas.demarchi@intel.com>
 <20240201031156.352973-1-lucas.demarchi@intel.com>
 <20240201131204.7dlfp2ny46stzc2y@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201131204.7dlfp2ny46stzc2y@kamilkon-desk.igk.intel.com>
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

Hi,

On 2024-02-01 at 14:12:08 +0100, Kamil Konieczny wrote:
> Hi Lucas,
> On 2024-01-31 at 19:11:56 -0800, Lucas De Marchi wrote:
> > 	echo -n "" > /sys/module/<modulename>/parameters/<param>
> > 
> > doesn't really work as it will just create a open() + close() expecting
> > the file to be truncated. The same issue happens with igt as it will
> > stop writing when there are 0 chars to write. Special case the empty
> > string so it always write a '\0' and make sure igt_sysfs_set() accounts
> > for the extra null char.
> > 
> > Shell example:
> > 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
> > 	# cat /sys/module/firmware_class/parameters/path
> > 	/foo
> > 	# echo -n "" > /sys/module/firmware_class/parameters/path
> > 	/foo
> > 	# # make sure to actually write a \0:
> > 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
> > 	# cat /sys/module/firmware_class/parameters/path
> > 	/foo
> > 
> > Same thing happens when testing igt_sysfs_set():
> >        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
> >        igt_sysfs_set(dirfd, "path", "");
> > 
> > Previously it was not really setting the param.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  lib/igt_sysfs.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index 567b4f6d5..64c2aaabb 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
> >   */
> >  bool igt_sysfs_set(int dir, const char *attr, const char *value)
> >  {
> > -	int len = strlen(value);
> > +	int len = strlen(value) + 1;
> >  	return igt_sysfs_write(dir, attr, value, len) == len;
> 
> Why not adding write "\n" at end?

So what about changing this only for zero?

if (!len)
        ++len;

+cc Janusz

Regards,
Kamil

> 
> >  }
> >  
> > @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
> >  		return -errno;
> >  
> >  	va_copy(tmp, ap);
> > -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
> > +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
> ------------------- ^^^^^
> Nice catch and looks like a separate bug fix, please send
> as separate patch.
> 
> Regards,
> Kamil
> 
> >  	va_end(tmp);
> > +
> > +	/*
> > +	 * make sure to always issue a write() syscall, even if writing an empty string,
> > +	 * otherwise values in sysfs like module parameters don't really get overwritten
> > +	 */
> > +	if (igt_debug_on(ret == 0))
> > +		return igt_writen(fd, "", 1);
> > +
> >  	if (igt_debug_on(ret < 0))
> >  		return -EINVAL;
> >  
> > -- 
> > 2.43.0
> > 
