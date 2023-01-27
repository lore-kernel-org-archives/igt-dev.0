Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E4710E99B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jan 2023 14:30:01 +0000 (UTC)
Date: Fri, 27 Jan 2023 15:29:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Message-ID: <20230127142959.4reppn45zao3e6wc@kamilkon-desk1>
References: <20221129172718.151773-1-zack@kde.org>
 <20221129172718.151773-4-zack@kde.org>
 <20230126181733.5lgq2rq43gqy5qd2@kamilkon-desk1>
 <3ea9b093fc7ff70788c035a74f065c1b6075c478.camel@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ea9b093fc7ff70788c035a74f065c1b6075c478.camel@vmware.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] igt: Switch warning to an info when
 not using i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zack,

On 2023-01-26 at 19:11:18 +0000, Zack Rusin wrote:
> On Thu, 2023-01-26 at 19:17 +0100, Kamil Konieczny wrote:
> > !! External Email
> > 
> > Hi Zack,
> > 
> > On 2022-11-29 at 12:27:18 -0500, Zack Rusin wrote:
> > > From: Zack Rusin <zackr@vmware.com>
> > > 
> > > Because igt always tries to load i915 driver first for DRIVER_ANY every
> > > test using DRIVER_ANY on anything but i915 starts by printing a warning
> > > that i915 couldn't be loaded.
> > > Lets switch it to a general info line because it makes it hard to spot
> > > actual warnings when every subtest starts by warning about not being
> > > able to load i915.
> > > 
> > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > ---
> > >  lib/igt_kmod.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > > index bcf7dfeb..74924b5f 100644
> > > --- a/lib/igt_kmod.c
> > > +++ b/lib/igt_kmod.c
> > > @@ -389,7 +389,7 @@ igt_i915_driver_load(const char *opts)
> > 
> > This is i915 driver load so maybe we should find a way to not
> > call this function ?
> 
> That'd be fine, how would you do that? IGT has a number of tests (the core ones)
> that use DRIVER_ANY for load the first available driver. Unless we explicitly
> exclude i915 from running those tests, or reorder the enum to try i915 after all the
> other options then it's not a trivial fix. We'd need to do add proper pci device id
> matching to always use the correct driver, which would be great, but is probably a
> little out of scope for this change.
> 
> z

You can use IGT_DEVICE= or --device to restrict tests to your HW.

Regards,
Kamil
 
