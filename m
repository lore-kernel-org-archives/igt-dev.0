Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657B910E1BA
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 09:52:55 +0000 (UTC)
Date: Thu, 20 Oct 2022 12:52:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Message-ID: <Y1EacxG3rZ7kx7Zr@intel.com>
References: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
 <20221019163029.19301-3-ville.syrjala@linux.intel.com>
 <Y1EYt9whKh4zZSzQ@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1EYt9whKh4zZSzQ@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] lib/crc: Move pipe CRC stuff out
 from igt_debugfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 11:45:27AM +0200, Kamil Konieczny wrote:
> Hi Ville,
> 
> On 2022-10-19 at 19:30:29 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> You are author and sender, no need for this "From:" line.

It's an old trick to work around email servers that rewrite the From
header. I suppose I could get rid of it now that I no longer send
via such servers, but meh.

<snip>
> > diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
> > new file mode 100644
> > index 000000000000..14fe7331f0b0
> > --- /dev/null
> > +++ b/lib/igt_pipe_crc.c
> > @@ -0,0 +1,610 @@
> > +/*
> > + * Copyright © 2013 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the next
> > + * paragraph) shall be included in all copies or substantial portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + *
> > + */
> 
> Please use SPDX licence here.

Didn't realize we started to use those in igt. I'll respin.

-- 
Ville Syrjälä
Intel
