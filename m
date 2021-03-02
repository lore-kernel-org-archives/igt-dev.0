Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954DD89B22
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 07:59:41 +0000 (UTC)
Date: Tue, 2 Mar 2021 10:00:01 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YD3wgYOBlxcvQhrl@platvala-desk.ger.corp.intel.com>
References: <20210302000632.2208302-1-richard.purdie@linuxfoundation.org>
 <YD3wIpQgWmdNsE/2@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD3wIpQgWmdNsE/2@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v2 i-g-t] meson: Allow source location to be
 configurable
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
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 02, 2021 at 09:58:26AM +0200, Petri Latvala wrote:
> On Tue, Mar 02, 2021 at 12:06:32AM +0000, Richard Purdie wrote:
> > Hardcoding a build source path inside a binary when cross compiling isn't
> > appropriate and breaks build reproducibility. Allow the srcdir to be
> > specified by an optional configuration option to meson which can
> > be used to override with the correct path.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

And merged now.


-- 
Petri Latvala



> 
> 
> > ---
> >  lib/meson.build   | 6 +++++-
> >  meson_options.txt | 4 ++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 114eadde..672b4206 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -125,7 +125,11 @@ if chamelium.found()
> >  	lib_sources += 'igt_chamelium_stream.c'
> >  endif
> >  
> > -srcdir = join_paths(meson.source_root(), 'tests')
> > +if get_option('srcdir') != ''
> > +    srcdir = join_paths(get_option('srcdir'), 'tests')
> > +else
> > +    srcdir = join_paths(meson.source_root(), 'tests')
> > +endif
> >  
> >  lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
> >  		      fallback : 'NO-GIT',
> > diff --git a/meson_options.txt b/meson_options.txt
> > index ff3abf08..bed63efa 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -50,3 +50,7 @@ option('use_rpath',
> >         type : 'boolean',
> >         value : false,
> >         description : 'Set runpath on installed executables for libigt.so')
> > +
> > +option('srcdir',
> > +       type : 'string',
> > +       description : 'Override the source code path embedded inside target binaries (optional)')
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
