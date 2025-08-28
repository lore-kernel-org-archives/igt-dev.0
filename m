Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B3ACA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE6F10E322;
	Thu, 28 Aug 2025 10:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h34cJzjf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5810E1D1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756378195; x=1787914195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UGMuK+yVJayqhQRUr4sqAcJ7PzEhWqCPakIJVBfosn4=;
 b=h34cJzjfzexa2uVT18tqYw4+zeBCcoQrVknO660sAfKG+TH4Feai4x3X
 kPDQqixM6k3OrV7stF0cJ1TLd9uw5bfIUCOS+2dTNEePwQF+I0zxcS8GQ
 E2gVMYuWiaQwxMdOmO3bh9WEVcqvb1l1/t8BZJTfl/+DIY+/KtF5q7O+o
 f7Ebgv6eUcgYAUu35ddcW5AccC74fTdu2Ytlf7Ebzo0KJC/1vmohFyKst
 XJSBzsdrvAawF4365J2dyQ6cYc+d31rCZQPDcNDHEjFzwWVsB8a/TUJay
 nf6ia17fO6LNsVWGS5GkqMgHd3NxMF4dnOXlUQQKaSi3EFG66W23DlnFV g==;
X-CSE-ConnectionGUID: nXxk54bUTW+m1Sx90zgNsQ==
X-CSE-MsgGUID: JrGe7bZSR5iqJi5XnRB3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69236573"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69236573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:49:55 -0700
X-CSE-ConnectionGUID: VW+obaEoQWuB3JBOImvRhw==
X-CSE-MsgGUID: 2MTceRmqQgSVnQ27hIuzNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174418667"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:49:53 -0700
Date: Thu, 28 Aug 2025 12:49:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t v4 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <20250828104950.cy33isjurqcavq34@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-3-jose.exposito89@gmail.com>
 <20250813132826.oogpkwws3524ddx5@kamilkon-DESK.igk.intel.com>
 <aJ2_5pdRf2Ag_Iiw@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ2_5pdRf2Ag_Iiw@fedora>
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

Hi José,
On 2025-08-14 at 12:52:22 +0200, José Expósito wrote:
> Hi Kamil,
> 
> On Wed, Aug 13, 2025 at 03:28:26PM +0200, Kamil Konieczny wrote:
> > Hi José,
> > On 2025-08-07 at 09:45:11 +0200, José Expósito wrote:
> > > Create a library containing helpers for creating VKMS devices and
> > > configuring them dynamically using configfs.
> > > For the moment, add the minimal number of helpers to be able to start
> > > testing VKMS's configfs support: Create device, destroy device and
> > > destroy all devices.
> > > 
> > > Also, include the simplest possible test using those helpers (checking
> > > the device's default files) and the scaffolding required to generate
> > > the documentation.
> > > 
> > > Co-developed-by: Jim Shargo <jshargo@chromium.org>
> > > Signed-off-by: Jim Shargo <jshargo@chromium.org>
> > > Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > ---
> > >  lib/igt_vkms.c             | 206 +++++++++++++++++++++++++++++++++++++
> > >  lib/igt_vkms.h             |  27 +++++
> > >  lib/meson.build            |   1 +
> > >  meson.build                |   8 ++
> > >  tests/meson.build          |   2 +
> > >  tests/vkms/meson.build     |  13 +++
> > >  tests/vkms/vkms_configfs.c | 131 +++++++++++++++++++++++
> > 
> > I checked changes as they are only minimal, imho you could keep
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > Also, you removed changes from testplan and docs building so
> > for build/meson changes
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Btw checkpatch suggests even one more const 
> > static const char * array should probably be static const char * const
> > but you could fix that later.
> 
> Thanks a lot for your reviews. Almost all patches are reviewed now.
> Let's see if the DRM series get merged soon and we can merge this
> one as well :)
> 
> About the additional const, I noticed it, but then ARRAY_SIZE() would
> trigger a warning about that extra const, so I decided to ignore
> checkpatch and avoid unnecessary refactors.

Makes sense, thx for explanation.

Regards,
Kamil

> 
> Thanks,
> Jose
> 
> > Regards,
> > Kamil
> > 
> > >  7 files changed, 388 insertions(+)
> > >  create mode 100644 lib/igt_vkms.c
> > >  create mode 100644 lib/igt_vkms.h
> > >  create mode 100644 tests/vkms/meson.build
> > >  create mode 100644 tests/vkms/vkms_configfs.c
> > > 
> > > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > > new file mode 100644
> > > index 000000000..03931d2e4
> > > --- /dev/null
> > > +++ b/lib/igt_vkms.c
> > > @@ -0,0 +1,206 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Google LLC.
> > > + * Copyright © 2023 Collabora, Ltd.
> > > + * Copyright © 2024-2025 Red Hat, Inc.
> > > + */
> > > +

[cut]

