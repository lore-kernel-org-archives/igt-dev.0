Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F71C48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4685110E447;
	Mon, 19 Feb 2024 17:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rel/H1mM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E76C10E457
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 17:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708364557; x=1739900557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cjVRyWKaC7r9qgVqtmyzPbWWVTAMZDDW3QYVOuXDS5c=;
 b=Rel/H1mMGJLXBhRaH9/oD+xXMpu3VilEp14yGmiUzVF4PtRsA03czuGY
 MjdB2Gj/nDNoa5mdyFmS9jXmqxAO0NoQ7SXLIUVOv21rDCxc6B457HR6w
 aEto9njNdcdtJvgpQw74hlP5rmHi/zKuVn27wQ8Si4fNikWTDCFYx0X7y
 SwBqNN8MMuFjx+5tR/BRYyz4I/s8xfjDk1pHJNfDaqSMHa/k5cqCWJien
 LestNBNLBVAmAYbaBaZNQPNTrw8IenLlsgHCn2Y9I77qPVJ+oBBp2je0w
 mPQxuY0f5uU4gNrXYVGdA+EM9IljgWqFw40ciFVvTboSDS3e+nuLGlKQA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13001768"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="13001768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4938429"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 09:42:36 -0800
Date: Mon, 19 Feb 2024 18:42:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v9 2/7] lib/drmtest: Introduced
 drm_open_driver_another
Message-ID: <20240219174232.63q3nuu4mc5o566q@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <20240215161014.60304-3-kamil.konieczny@linux.intel.com>
 <2552026.vzjCzTo3RI@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2552026.vzjCzTo3RI@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,
On 2024-02-16 at 11:23:58 +0100, Janusz Krzysztofik wrote:
> Hi Kamil, Dominik,
> 
> On Thursday, 15 February 2024 17:10:09 CET Kamil Konieczny wrote:
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > For user convenience, introduce drm_open_driver_another as
> > a wrapper for __drm_open_driver_another with successful open
> > assert.
> 
> Out of several existing variants of *drm_open_driver* functions, those which 
> names start with "drm_", wrapped around their counterparts which names start 
> with double underscores, used to set up an exit handler that performs 
> necessary cleanups before exit, freeing users from taking care of that.  Don't 
> we want to keep that convention also for drm_open_driver_another() and set up 
> the exit handler from inside that wrapper on success?
> 
> Thanks,
> Janusz
> 

How and what should we unwind here? There is only fd, I do not see
any other var or state to unwind? Am I missing something?

Regards,
Kamil

> > 
> > v2: rebased (Kamil)
> > v6: reword description (Janusz)
> > 
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/drmtest.c | 19 +++++++++++++++++++
> >  lib/drmtest.h |  1 +
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 52b5a2020..73d9159af 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int chipset)
> >  	return fd;
> >  }
> >  
> > +/*
> > + * drm_open_driver_another
> > + * @idx: index of the device you are opening
> > + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> > + *
> > + * A wrapper for __drm_open_driver with successful open assert.
> > + *
> > + * Returns:
> > + * An open DRM fd
> > + */
> > +int drm_open_driver_another(int idx, int chipset)
> > +{
> > +	int fd = __drm_open_driver_another(idx, chipset);
> > +
> > +	igt_assert_fd(fd);
> > +
> > +	return fd;
> > +}
> > +
> >  /**
> >   * __drm_open_driver:
> >   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 6bc819734..856208c48 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
> >  
> >  int __drm_open_device(const char *name, unsigned int chipset);
> >  void drm_load_module(unsigned int chipset);
> > +int drm_open_driver_another(int idx, int chipset);
> >  int drm_open_driver(int chipset);
> >  int drm_open_driver_master(int chipset);
> >  int drm_open_driver_render(int chipset);
> > 
> 
> 
> 
> 
