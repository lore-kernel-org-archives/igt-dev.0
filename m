Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DFBC3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 17:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F1710E129;
	Thu, 18 Jul 2024 17:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CZSqdgyw";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB7D10E129
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721324859;
 bh=df2hZ/osQWMq3ecKPxqK3MZqvF4d12V3OeiiPT2Ud8c=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=CZSqdgyw+/VHcccr0sYkfTkQgWzZbgewY5pCiQXnpeoEXLEtIaiYYABbxkO0i3EAJ
 +bJuXHZzN6RrACjShaTHcusNOJMuVdsgfARjs3pkCdjVzBoIbota4tjF0xPhQElmQi
 CbgB9AGRllg/Mo0qWHUg4BZCrMuOwQF6B8qIz5FOEbOGEMyTnYDfoAlja5+zbEo5mt
 I1siSvEAYMGZaUs2DlST2WqxPz3CrXQnVTUeQ4R+ONMsAawueZwY5Z4fwW2u8R4x2p
 m0cxi7HKEXU7AKgof2TURpwIViOVe3h2Kgt0uJ2WzkvM3HJQM2FlGSYkzUYiiWlzsP
 IfeEW0kZjlrBw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 107E1378020A;
 Thu, 18 Jul 2024 17:47:39 +0000 (UTC)
Date: Thu, 18 Jul 2024 18:47:38 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 tursulin@ursulin.net, robdclark@chromium.org, lucas.demarchi@intel.com, 
 igt-dev@lists.freedesktop.org, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v6 0/2] Add gputop support for sysfs profiling knob
Message-ID: <magepbxk7q6nji347xl6eblfgjfjrpmktvdx7hgzazkuscrflq@zbj3fhjdguot>
References: <20240718135811.3619050-1-adrian.larumbe@collabora.com>
 <20240718172920.hijunl6lf4qex2lu@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240718172920.hijunl6lf4qex2lu@kamilkon-DESK.igk.intel.com>
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

On 18.07.2024 19:29, Kamil Konieczny wrote:
> Hi Adrián,
> On 2024-07-18 at 14:58:08 +0100, Adrián Larumbe wrote:
> > Some GPUs like Panfrost need a sysfs file to be toggled before the HW can
> > initiate the job accounting necessary to feed fdinfo with engine and cycle
> > data. This sysfs knob has to be disabled when the profiler is done, to save
> > power.
> > 
> > Changelog:
> > v6:
> >  - Deleted spurious line
> >  - Changed license identifier comment style in header file
> >  - Added some ack tags to th commits
> 
> I already merged your patches with fixes and acks,
> sorry for not letting you know.

No worries, many thanks for the reviews !

> Regards,
> Kamil
> 
> > v5:
> >  - Deleted unnecesary blank line and added Ack tags
> > v4:
> >  - Improve error handling *igt_devices_profiled
> >  - Changed name of some symbols to better reflect their semantics
> >  - Changed header with copyright notice
> >  - Added documentation for public functions in igt_profiling.c
> > v3:
> >  - Created separate lib_igt_profiling to avoid dynamic linking
> >  of gputop with igt_lib, which also meant isolating the functions
> >  therein from the rest of igt_lib.
> >  - Make gputop check the sysfs knob state at the end of every period
> >  in case other instances of itself or other profilers might have
> >  changed it, so that the knob can be returned to its original state.
> > v2:
> >  - Added header file guards around igt_profiling.h
> >  - Modified licensing information to comply with SPDX format
> >  - Sorted included header files in alphabetic order
> >  - Added volatile qualifier to gputop stop variable
> > 
> > Adrián Larumbe (2):
> >   lib: Add DRM driver sysfs profiling knob toggling functions
> >   tools/gputop: toggle sysfs profiling knob if available for device
> > 
> >  lib/igt_profiling.c | 189 ++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_profiling.h |  22 ++++++
> >  lib/meson.build     |   8 ++
> >  tools/gputop.c      |  32 +++++++-
> >  tools/meson.build   |   2 +-
> >  5 files changed, 251 insertions(+), 2 deletions(-)
> >  create mode 100644 lib/igt_profiling.c
> >  create mode 100644 lib/igt_profiling.h
> > 
> > 
> > base-commit: a2ab0ec12ef447c96c67dc539813462b6b39f857
> > -- 
> > 2.45.1
> > 

