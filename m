Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A812C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA73310E43D;
	Thu, 15 Feb 2024 10:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2u7TEbT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D93810E43D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707993028; x=1739529028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nvivbo9QUB4hGp9lonRYLR9dk76Tpk/JLho7iF+xBvI=;
 b=n2u7TEbTsS+MWPCqm3D/OlDncf+rvh4C2ADH20lnaxQDNPeT9hFN+0xK
 zA4yEw/k7T7yPD/tbXQbDidNotG4omuZPvsvNa+TbJ2nObNouvwY5e2CR
 dezy3Cvu5NAJaa4TbZZJx3I1t/thNe2JsCaeeebzAb065j8tBR6bC4EOv
 oCBV+q1Q7cyMM5+UTDV+3EaSWKAeMwpIQlcaXtPUi50liXJ1WFLxPdRJj
 uS+KjF0qXSiq5xe188Q9uhFDDrxWUPn8hqYDBQtTgq/4o/AopKvInJRXw
 +62HhXGyc8Xt0f6GvCueLMRYf9TjGFk6D955D6IjvAPlX54ik4swzvJbm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2217139"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2217139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3500601"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 02:30:12 -0800
Date: Thu, 15 Feb 2024 11:29:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH v3 1/7] build: check that outb is present in io.h
Message-ID: <20240215102952.mvedziq3nwisd3kl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>
References: <20231030195809.3527410-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231030195809.3527410-1-bernd@kuhls.net>
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

Hi Bernd,
On 2023-10-30 at 20:58:03 +0100, Bernd Kuhls wrote:
> With glibc if io.h exists, inb/outb are always defined.
> However on musl, io.h always exists but it may not define inb/outb.
> 
> Thus, igt-gpu-tools builds with musl on non-x86 platforms will fail to
> link. Fix this by checking for both io.h and that outb() is defined.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Your patchset was merged,

Regards,
Kamil

> ---
> v3: no changes
> 
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index b35a00faa..cee8a7446 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -220,7 +220,7 @@ endif
>  if cc.has_header('libgen.h')
>  	config.set('HAVE_LIBGEN_H', 1)
>  endif
> -if cc.has_header('sys/io.h')
> +if cc.has_header('sys/io.h') and cc.has_function('outb', prefix: '#include <sys/io.h>')
>  	config.set('HAVE_SYS_IO_H', 1)
>  endif
>  if cc.links('''
> -- 
> 2.39.2
> 
