Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 27 Apr 2023 18:24:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230427162458.5bkxmdh2zb5zjykc@kamilkon-desk1>
References: <20230425162405.1730513-1-vinay.belgaumkar@intel.com>
 <20230425162405.1730513-4-vinay.belgaumkar@intel.com>
 <87a5yu9y2r.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5yu9y2r.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 3/4] i915_pm_freq_api: Add
 some basic SLPC igt tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

On 2023-04-26 at 13:40:28 -0700, Dixit, Ashutosh wrote:
> On Tue, 25 Apr 2023 09:24:04 -0700, Vinay Belgaumkar wrote:
> >
> > diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
> > new file mode 100644
> > index 00000000..17adacbc
> > --- /dev/null
> > +++ b/tests/i915/i915_pm_freq_api.c
> > @@ -0,0 +1,153 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include <dirent.h>
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <inttypes.h>
> > +#include <stdlib.h>
> > +#include <sys/stat.h>
> > +#include <sys/syscall.h>
> > +#include <sys/types.h>
> > +#include <unistd.h>
> > +
> > +#include "drmtest.h"
> 
> The series is merged but before merging I removed all the #include's above,
> they are not needed.

Please do not do this, at least send it to trybot and look at
GitLab.Pipeline status. There are platforms where compilation 
failed due to missing fcntl.h, see
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/137

It is fixed now with
https://patchwork.freedesktop.org/series/117047/

Regards,
Kamil

> 
> > +#include "i915/gem.h"
> > +#include "igt_sysfs.h"
> > +#include "igt.h"
> 
> Thanks.
> --
> Ashutosh
