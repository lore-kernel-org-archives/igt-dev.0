Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0824C87FD1
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 16:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6DE10E6C6;
	Tue,  5 Aug 2025 16:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIn2tzra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DE110E6C6
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754411402; x=1785947402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bCEBDUR5ftWTYDJ+9oxM6fAkgRLN85p8tbSGZnFItjU=;
 b=cIn2tzragoJMn5/SZx4e2L6F118gTPLm81qCbHdepKW5+v/bDMCpVXOH
 x1up1tEiO5aiO73CCUywhWfmExxLvU0W4tsf9rgTS01iJutYbfn8X90HM
 xBidz+LdPl5t7oimjzBIIXtBOEn9hpEjRYtln0m/9pWWYlOaXhWE8/CVx
 rlDgSzx2tXdM70APG8tk5tm2kf7RDLONAInYgNZSCzcEDh6ojXcvi6qaj
 WTEAjem/u+pzi07KDwu4V5W0d4S/CHwSx62H8RRk1Ol3E4g9fghS4ZMev
 YA9hO3bt/LgittpDwZ61HAswXxfhwfS2T0Fk8Hc6ixPhlmt6gXSxsFAyG Q==;
X-CSE-ConnectionGUID: hEpDaLE2RHKIbgMIxcLuug==
X-CSE-MsgGUID: msPLZSsmSV2hL+/o8z4Wnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56626353"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56626353"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:30:02 -0700
X-CSE-ConnectionGUID: Ov5Tf1NIR6qmiLd744plMw==
X-CSE-MsgGUID: +otFS68sQbS3Z9evku8bpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="169914701"
Received: from unknown (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 09:30:00 -0700
Date: Tue, 5 Aug 2025 18:29:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
Message-ID: <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>, karthik.b.s@intel.com
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com>
 <aJHMyZwbV4bV7zma@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJHMyZwbV4bV7zma@fedora>
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
On 2025-08-05 at 11:20:09 +0200, José Expósito wrote:
> Hi Louis,
> 
> On Wed, Jul 16, 2025 at 11:22:38AM +0200, Louis Chauvet wrote:
> > 
> > 
> > Le 15/07/2025 à 12:24, José Expósito a écrit :
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
> > >   docs/testplan/meson.build        |   7 +-
> > >   lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
> > >   lib/igt_vkms.h                   |  27 ++++
> > >   lib/meson.build                  |   1 +
> > >   meson.build                      |   8 ++
> > >   tests/meson.build                |   2 +
> > >   tests/vkms/meson.build           |  13 ++
> > >   tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
> > >   tests/vkms/vkms_test_config.json |  72 +++++++++++
> > >   9 files changed, 467 insertions(+), 2 deletions(-)
> > >   create mode 100644 lib/igt_vkms.c
> > >   create mode 100644 lib/igt_vkms.h
> > >   create mode 100644 tests/vkms/meson.build
> > >   create mode 100644 tests/vkms/vkms_configfs.c
> > >   create mode 100644 tests/vkms/vkms_test_config.json
> > > 
> > > [...]
> > > diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
> > > new file mode 100644
> > > index 000000000..fa41f741e
> > > --- /dev/null
> > > +++ b/lib/igt_vkms.c
> > > [...]
> > > +static int detach_pipeline_items(const char *path, const struct stat *info,
> > > +				 const int typeflag, struct FTW *pathinfo)
> > 
> > As there will be a new "color pipeline" in DRM, can you rename this set of
> > functions to avoid confusion? I don't have preference for the name, what do
> > you think about "dc" for display controller?

Could you give a link to lore.kernel.org for this 'color pipeline'?

> > 
> > (ditto for the rest of the series)
> > 
> > With this modification:
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The "pipeline" here refers to the display pipeline as in the docs:
> https://docs.kernel.org/gpu/drm-kms.html#overview
> 
> Given that the VKMS driver is a display driver and that "enum vkms_pipeline_item"
> contains those entites, I find easy to understand what we are talking about.
> 
> What do you think about leaving the display pipeline as "pipeline" and, once we
> add the color pipeline, use "color_pipeline"?

These looks resonable. Karthik, could you comment on this?

> 
> I can rename all instances of "pipeline" to "display_pipeline" (with a lot of work,
> 100 occurences in igt_vkms.c in 41 patches), but I find it too verbose for little
> clarification.

Well, you can use sed script for this but I am afraid that there
are many other places in igt with 'pipeline' meaning
'display pipeline', so it would be a lot more work to do.

Regards,
Kamil

> 
> Jose
> 
> > > [...]
> > 
> > -- 
> > Louis Chauvet, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
