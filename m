Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC234C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 05:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13A10E04B;
	Tue, 23 Jan 2024 05:56:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2D10E04B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 05:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705989401; x=1737525401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=szMbOqsqqaAW6nrKA0eH9mZPEKo7gmoi3He0O3paUwE=;
 b=Q/zzTtet4KwAqvvw/o3NBAJEy0KXnRdTWwBQD5q6vHs9kLuuxyLnRJDY
 HuwpcIRyZUBpdMsAGmWgBJiuKo/IaPUWbB4n2tsryUiP5foibJFTJ8kVm
 Y8hp3A4r1ncn6AFp0Yoa/SUO0Tb9LffqkRhGMFJkNjRzYKOa4SgW1+oym
 +La4lYE8iZU/CIrg2xnV9LE4fPA6EaTNJsWK18BiYUby64Uuv74FSTVRY
 Gmzn2qCu0ZLDc/Q0emal/gv8CPRkdBSUUEgyG4cWwGMwkCkbZFsAuJ0Kf
 kp0BnOSEokax7azQIaWWNCZQO/H0Ss1A6Q8D7pAgEC/1tmJyh28Q4p+AK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14772809"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="14772809"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1476716"
Received: from unknown (HELO localhost) ([10.245.116.51])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 21:56:39 -0800
Date: Tue, 23 Jan 2024 06:56:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe: Boost prefetch size to 4KB
Message-ID: <20240123055636.l367u7xqd6jcqygn@zkempczy-mobl2>
References: <20240122154302.54660-1-matthew.auld@intel.com>
 <hz2mhm64qw3vusw4qgwvf5pvib3xskw6ldn7zjgjeqgfm7j5f2@swwcz2vw5s4l>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hz2mhm64qw3vusw4qgwvf5pvib3xskw6ldn7zjgjeqgfm7j5f2@swwcz2vw5s4l>
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
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 10:22:29AM -0600, Lucas De Marchi wrote:
> On Mon, Jan 22, 2024 at 03:43:02PM +0000, Matthew Auld wrote:
> > From: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > For Xe2, the prefetch for RCS is 4KB, so boost it.
> > 
> > BSpec: 60223
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> 
> humn... looks like I forgot to merge this?
> 
> pushed now. Thanks for the reminder.

Nice, but where's r-b?
--
Zbigniew

> 
> Lucas De Marchi
> 
> > ---
> > lib/xe/xe_ioctl.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index 39605a019..0979eec6d 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -48,7 +48,7 @@
> > 
> > uint32_t xe_cs_prefetch_size(int fd)
> > {
> > -	return 2048;
> > +	return 4096;
> > }
> > 
> > uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
> > -- 
> > 2.43.0
> > 
