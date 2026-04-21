Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC57F8FA62
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 12:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B4E10E88E;
	Tue, 21 Apr 2026 12:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rcrlr515";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0410E88E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776773165; x=1808309165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5XpAIejXIPhz6WnU3YzBjinogJTIqJgz4KCBtybVGKs=;
 b=Rcrlr515Quz5kOJHHvtJaixTSCo8JohJBH0r7eRdvA/+cRnKN4LFYeHe
 nt/ChdG1PzYHb7oDVTAZyvV98C3Dc7NAsGAMK6D4Hz2jg6ogCc2vPde4Z
 MPq1O5hskFxhOPZ/Ig3q5/Dk+yyOgIlGuI42lGhIGZ9upwiLbcEpsDa02
 3nmMWwrsieIWwiq4qQEXoNTx7Pa9ZhozXpVVeSz5AjzdbhUUYJFWDusnv
 nce2/6hJwQ8DAxpUmn/oykMHEAOPzcVDpRpNj+UN54VRLP181zTmd6igK
 IkTPp2Y+aigAUeG7HjloIIBgfuCez6Im2aq9PGmLJDRGapFK1mGag3Bb7 w==;
X-CSE-ConnectionGUID: 2aW9C0pmSsKrqsbgwid08w==
X-CSE-MsgGUID: JWQF/6aUTluMr8YvIj4GVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80290988"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="80290988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:06:04 -0700
X-CSE-ConnectionGUID: 55yx/LepS8aWtblkyI9rAg==
X-CSE-MsgGUID: imM0AXJmTTOfFKZoz5bqew==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:06:03 -0700
Date: Tue, 21 Apr 2026 14:05:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_pwrite_crc: Create basic subtest
Message-ID: <20260421120547.byr52mremrkisbkn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20260420150753.96250-1-kamil.konieczny@linux.intel.com>
 <409b4955-27be-4be4-9740-2f5f3f0582a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <409b4955-27be-4be4-9740-2f5f3f0582a1@intel.com>
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

Hi Karthik,
On 2026-04-21 at 08:58:02 +0530, Karthik B S wrote:
> Hi Kamil,
> 
> On 4/20/2026 8:37 PM, Kamil Konieczny wrote:
> > Create a basic subtests which allows to properly cleanup after
> > any failure or a skip. Also while at this, move an igt header
> > to proper place.
> > 
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   tests/intel/kms_pwrite_crc.c | 39 +++++++++++++++++++++++-------------
> >   1 file changed, 25 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> > index bd536007c..92f5292dd 100644
> > --- a/tests/intel/kms_pwrite_crc.c
> > +++ b/tests/intel/kms_pwrite_crc.c
> > @@ -30,15 +30,16 @@
> >    * Mega feature: General Display Features
> >    */
> > -#include "igt.h"
> >   #include <errno.h>
> >   #include <limits.h>
> >   #include <stdbool.h>
> >   #include <stdio.h>
> >   #include <string.h>
> > +#include "igt.h"
> > +
> >   /**
> > - * SUBTEST:
> > + * SUBTEST: basic
> >    * Description: Use the display CRC support to validate pwrite to an already
> >    *              uncached future scanout buffer.
> >    */
> > @@ -192,22 +193,32 @@ static void run_test(data_t *data)
> >   	igt_skip("no valid crtc/connector combinations found\n");
> >   }
> > -static data_t data;
> > +static data_t data = { };
> > -int igt_simple_main()
> > +int igt_main()
> >   {
> > -	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> > -	kmstest_set_vt_graphics_mode();
> > +	igt_fixture() {
> > +		data.drm_fd = -1;
> 
> This is redundant with the next line?
> 
> > +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> > +		kmstest_set_vt_graphics_mode();
> > -	igt_display_require(&data.display, data.drm_fd);
> > -	igt_display_require_output(&data.display);
> > -	igt_require_pipe_crc(data.drm_fd);
> > +		igt_display_require(&data.display, data.drm_fd);
> > +		igt_display_require_output(&data.display);
> > +		igt_require_pipe_crc(data.drm_fd);
> > -	data.devid = intel_get_drm_devid(data.drm_fd);
> > -	data.pipe_crc = NULL;
> > +		data.devid = intel_get_drm_devid(data.drm_fd);
> > +		data.pipe_crc = NULL;
> > +	}
> > -	run_test(&data);
> > +	igt_describe("Use the display CRC support to validate pwrite "
> > +		     "to an already uncached future scanout buffer.");
> > +	igt_subtest("basic")
> > +		run_test(&data);
> > -	igt_display_fini(&data.display);
> > -	drm_close_driver(data.drm_fd);
> > +	igt_fixture() {
> > +		if (data.drm_fd != -1) {
> 
> Similar redundancy here? If drm_fd = -1, the test will be skipped in the
> first fixture itself and this check is not needed?

You are right, I will remove this and one at first fixture above.

> 
> With these removed the patch LGTM,
> 
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> 

Thank you, I will send v2 soon.

Regards,
Kamil

> > +			igt_display_fini(&data.display);
> > +			drm_close_driver(data.drm_fd);
> > +		}
> > +	}
> >   }
