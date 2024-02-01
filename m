Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6814C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 15:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7F10F20E;
	Thu,  1 Feb 2024 15:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gt82Ho4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F6610F1E6
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706801147; x=1738337147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mt+0Y2gcKzcSRCLIKHodlnqer3/wAyY1VxT6Ye3dEhQ=;
 b=gt82Ho4V+ty+qogXIxtMv5ThRdqT54Ak4bpUFbPbjY9zSDS7Y3FELnRw
 HwBgD4vERpjHrMuVB8nrlcyRdUuL5z6a9ebDcX9dRAAnMjYPwN18Gu10W
 DR33tt3Yb+jRKgc7JIskK5t5HFUol5BiiXlK8PJuzHvrA1Yu03RTBrXH4
 gYe9CytPB8JISXZL5mY7XLtE1uj1K6753LulNFfenLh/M7uaqaNLNocHI
 Y9izpzMkDYMB2nQUYlhaCsO1nZO5QpmeD9scxZxDWe2RcD0ZkpH5G19mc
 9W1cZ+LAJ4f7pMuzhbsbXLvakD3Xe2jWdfgL0MKsZcvT/fnYipmdqS5Rn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10573018"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10573018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119973318"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="1119973318"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 07:25:44 -0800
Date: Thu, 1 Feb 2024 16:25:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 1/8] lib/igt_device_scan: Introduce filtering
 out non-PCI devices
Message-ID: <20240201152541.4qtuxch22kuhc7hy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
 <20240130170722.44828-2-kamil.konieczny@linux.intel.com>
 <3890547.fW5hKsROvD@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3890547.fW5hKsROvD@jkrzyszt-mobl2.ger.corp.intel.com>
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
On 2024-02-01 at 12:11:56 +0100, Janusz Krzysztofik wrote:
> Hi Kamil, Dominik,
> 
> On Tuesday, 30 January 2024 18:07:15 CET Kamil Konieczny wrote:
> > From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > 
> > Introduced igt_device_filter_pci function that filters out non-PCI
> > devices from IGT devices.
> 
> For me, an important "why" part of commit description is missing.
> 
> Thanks,
> Janusz
> 

Thank you for pointing this, I will write "why" part.
I will send new version with your comments for 1..3/8 addressed.

Regards,
Kamil

> > 
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt_device_scan.c | 21 +++++++++++++++++++++
> >  lib/igt_device_scan.h |  2 ++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index fbf3fa482..37ebe1964 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -1908,6 +1908,27 @@ const char *igt_device_filter_get(int num)
> >  	return NULL;
> >  }
> >  
> > +/**
> > + * igt_device_filter_pci
> > + *
> > + * Filter devices to PCI only.
> > + *
> > + * Returns PCI devices count.
> > + */
> > +int igt_device_filter_pci(void)
> > +{
> > +	int count = 0;
> > +	struct igt_device *dev, *tmp;
> > +
> > +	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link)
> > +		if (strcmp(dev->subsystem, "pci") != 0)
> > +			igt_list_del(&dev->link);
> > +		else
> > +			count++;
> > +
> > +	return count;
> > +}
> > +
> >  static bool igt_device_filter_apply(const char *fstr)
> >  {
> >  	struct igt_device *dev, *tmp;
> > diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> > index 48690e236..908733745 100644
> > --- a/lib/igt_device_scan.h
> > +++ b/lib/igt_device_scan.h
> > @@ -81,6 +81,8 @@ int igt_device_filter_add(const char *filter);
> >  void igt_device_filter_free_all(void);
> >  const char *igt_device_filter_get(int num);
> >  
> > +int igt_device_filter_pci(void);
> > +
> >  /* Use filter to match the device and fill card structure */
> >  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
> >  bool igt_device_card_match_pci(const char *filter,
> > 
> 
> 
> 
> 
