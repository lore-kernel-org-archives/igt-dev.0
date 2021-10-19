Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4556EB54
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 08:39:11 +0000 (UTC)
Date: Tue, 19 Oct 2021 11:37:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YW6D08huq17dzR2S@platvala-desk.ger.corp.intel.com>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
 <20211015203238.133163-2-casey.g.bowman@intel.com>
 <YW1Yvg8GsFcHzwfu@platvala-desk.ger.corp.intel.com>
 <20211018165537.2visea3swpthj6gi@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018165537.2visea3swpthj6gi@ldmartin-desk2>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] Alter arm64 cross compile
 pkg-config library selections
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Casey Bowman <casey.g.bowman@intel.com>, igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com, wayne.boyer@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 09:55:37AM -0700, Lucas De Marchi wrote:
> On Mon, Oct 18, 2021 at 02:21:34PM +0300, Petri Latvala wrote:
> > On Fri, Oct 15, 2021 at 01:32:37PM -0700, Casey Bowman wrote:
> > > Specifies to use 'aarch64-linux-gnu-pkg-config' as the
> > > pkg-config binary to use, as the normal /usr/bin/pkg-config
> > > binary will be used on a host system. If we use this binary
> > > we will observe that the shared object libraries will be
> > > pulled from the x86_64 libraries instead of the aarch64 ones.
> > 
> > PKG_CONFIG_PATH can also be set accordingly, as is done in
> > .gitlab-ci.yml
> 
> is this something generally not setup in all distros?  using
> arch + -pkg-config matches the documentation at
> https://mesonbuild.com/Machine-files.html

Indeed, I stand corrected and setting the pkg-config binary is the
correct way to use it for cross-compiling! I was taken astray by the
gitlab-CI "just working", and the Debian packaging where a cross
wrapper does a good deal of the correct setup.

> 
> Indeed, checking my archlinux installation it seems I don't have a
> aarch64-linux-gnu-pkg-config and nothing provides it (even though there
> is a aarch64 crosscompiler). It looks like I even mentioned this issue
> in the past for another project at https://politreco.com/2019/09/side-load-on-embedded-linux-with-buildroot/
> 
> I wonder if we could rather set pkg_config_libdir like mentioned in
> https://mesonbuild.com/Cross-compilation.html and be compatible out of
> the box with more distros.

I don't understand the implications of this sentence:

  Since 0.54.0 The pkg_config_libdir property may point to a list of
  path used internally by Meson to set the PKG_CONFIG_LIBDIR
  environment variable for pkg-config.

We currently require meson >= 0.47.2. Does that sentence mean the
property isn't used at all, or is it a warning for meson versions >=
0.54?

Is arch an outlier with the lack of aarch64-linux-gnu-pkg-config btw?
I only know what's done with Debian based distros.


-- 
Petri Latvala
