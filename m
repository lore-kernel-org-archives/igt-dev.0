Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046C10E475
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 12:58:01 +0000 (UTC)
Date: Mon, 3 Apr 2023 14:57:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230403125756.hljjevaud5lpwfqr@kamilkon-desk1>
References: <20230316022659.73202-1-zack@kde.org>
 <20230316022659.73202-2-zack@kde.org>
 <20230317165252.vytfbcuecswykd6p@kamilkon-desk1>
 <6432b28a2b0e0548eebb25fb909b451d881fdbc9.camel@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6432b28a2b0e0548eebb25fb909b451d881fdbc9.camel@vmware.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/8] igt/vmwgfx: Add generated
 headers for svga device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zack,

On 2023-03-17 at 19:34:04 +0000, Zack Rusin wrote:
> On Fri, 2023-03-17 at 17:52 +0100, Kamil Konieczny wrote:
> > !! External Email
> > 
> > Hi Zack,
> > 
> > On 2023-03-15 at 22:26:52 -0400, Zack Rusin wrote:
> > > From: Maaz Mombasawala <mombasawalam@vmware.com>
> > > 
> > > Add generated headers for svga device which will be used
> > > to interface with the vmwgfx driver.
> > > 
> > > Signed-off-by: Roye Eshed <reshed@vmware.com>
> > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> > > ---
> > >  lib/svga/svga3d_cmd.h         | 1511 +++++++++++++++++++++++++++++
> > >  lib/svga/svga3d_devcaps.h     |  369 +++++++
> > >  lib/svga/svga3d_dx.h          | 1722 +++++++++++++++++++++++++++++++++
> > >  lib/svga/svga3d_limits.h      |   83 ++
> > >  lib/svga/svga3d_reg.h         |   44 +
> > >  lib/svga/svga3d_surfacedefs.h | 1559 +++++++++++++++++++++++++++++
> > >  lib/svga/svga3d_types.h       | 1554 +++++++++++++++++++++++++++++
> > >  lib/svga/svga_escape.h        |   54 ++
> > >  lib/svga/svga_overlay.h       |  115 +++
> > >  lib/svga/svga_reg.h           |  897 +++++++++++++++++
> > >  lib/svga/vm_basic_types.h     |  161 +++
> > >  11 files changed, 8069 insertions(+)
> > >  create mode 100644 lib/svga/svga3d_cmd.h
> > >  create mode 100644 lib/svga/svga3d_devcaps.h
> > >  create mode 100644 lib/svga/svga3d_dx.h
> > >  create mode 100644 lib/svga/svga3d_limits.h
> > >  create mode 100644 lib/svga/svga3d_reg.h
> > >  create mode 100644 lib/svga/svga3d_surfacedefs.h
> > >  create mode 100644 lib/svga/svga3d_types.h
> > >  create mode 100644 lib/svga/svga_escape.h
> > >  create mode 100644 lib/svga/svga_overlay.h
> > >  create mode 100644 lib/svga/svga_reg.h
> > >  create mode 100644 lib/svga/vm_basic_types.h
> > > 
> > > diff --git a/lib/svga/svga3d_cmd.h b/lib/svga/svga3d_cmd.h
> > > new file mode 100644
> > > index 00000000..5a64d40b
> > > --- /dev/null
> > > +++ b/lib/svga/svga3d_cmd.h
> > > @@ -0,0 +1,1511 @@
> > > +/**********************************************************
> > > + * Copyright 2012-2021 VMware, Inc.
> > > + * SPDX-License-Identifier: GPL-2.0 OR MIT
> > 
> > imho SPDX should be first, (c) in line below. Did you check it
> > with checkpatch.pl from Linux kernel ?
> 
> Those headers are from the kernel. They're auto-generated so I'd prefer to keep them
> matching the kernel otherwise it's impossible to keep them up to date and the next
> time someone updates them they revert back. Having said that the spdx line being
> first is something that we did change in the script autogenerating them, it's just
> that we haven't updated those headers in IGT for a while. I was planning to update
> the kernel and igt next month, but I can do that sooner.
> 
> As to the deleting the license text after the spdx header, VMware has standard open
> source contributing header template that we need to use, while we can ask for an
> exception to change it for IGT, it might be a lot more effective is someone other
> than us does it after contribution lands in particular because it seems a few other
> files in IGT do the same thing (e.g. amd_basic.c, amd_pci_unplug.c,
> amd_deadlock.c...) so it might be a worthy project wide cleanup.
> 
> z
> 
> 
No problem if that is from kernel it can go that way. I checked
drm-tip file

./drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h

and there is SPDX at first line, then copyright and licence text
so it can be copied into igt libs. I have one more ask, please
change subject lines in pacthes to begin with relevant information.

For example in first patch use lib/sgva: , so instead of:

Subject: [PATCH i-g-t v2 1/8] igt/vmwgfx: Add generated headers for svga device
----------------------------- ^^^^^^^^^^
this should be:

Subject: [PATCH i-g-t v2 1/8] lib/svga: Add generated headers for svga device

It will help if you write in commit from where those files was copied.

Similary, when you add tests in patches 3..7, instead of:
igt/vmwgfx: Add triangle test
^^^

write:
tests/vmwgfx: Add triangle test

Finally, in 2nd patch,

igt/vmwgfx: Add vmwgfx support
^^^^^^^^^^

write

lib: Add vmwgfx support

Regards,
Kamil
