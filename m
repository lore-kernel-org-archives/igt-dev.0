Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461136E96D
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 11:52:51 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c5so4864971qtj.6
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 03:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20200210025233.222606-1-drinkcat@chromium.org>
 <20200210114343.GG25209@platvala-desk.ger.corp.intel.com>
 <20200210114628.GJ25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200210114628.GJ25209@platvala-desk.ger.corp.intel.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 10 Feb 2020 19:52:36 +0800
Message-ID: <CANMq1KBJncJA71WELw_=knGr9jdNhofHPzhaAU0ECVeGd_oLbw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Port cpuid.h test from
 configure.ac
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 7:46 PM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Mon, Feb 10, 2020 at 01:43:43PM +0200, Petri Latvala wrote:
> > On Mon, Feb 10, 2020 at 10:52:33AM +0800, Nicolas Boichat wrote:
> > > When cross-compiling for arm64, we noticed that the header file
> > > may be present, but it is not functional:
> > > /usr/lib64/clang/10.0.0/include/cpuid.h:11:2: error: this header is for x86 only
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>
> And merged, thanks!

Thanks!

>
> >
> > > ---
> > >  meson.build | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meson.build b/meson.build
> > > index 4d5003ba..bcb69e1c 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -207,8 +207,16 @@ endif
> > >  if cc.has_header('sys/io.h')
> > >     config.set('HAVE_SYS_IO_H', 1)
> > >  endif
> > > -if cc.has_header('cpuid.h')
> > > -   # FIXME: Do we need the example link test from configure.ac?
> > > +if cc.links('''
> > > +#include <cpuid.h>
> > > +#include <stddef.h>
> > > +
> > > +int main(void) {
> > > +  int eax, ebx, ecx, edx;
> > > +  if (__get_cpuid_max(0, NULL) < 4)
> > > +    return 0;
> > > +  __cpuid_count(4, 0, eax, ebx, ecx, edx);
> > > +}''', name : 'cpuid.h')
> > >     config.set('HAVE_CPUID_H', 1)
> > >  endif
> > >  if cc.has_header_symbol('unistd.h', 'gettid', args : '-D_GNU_SOURCE')
> > > --
> > > 2.25.0.341.g760bfbb309-goog
> > >
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
