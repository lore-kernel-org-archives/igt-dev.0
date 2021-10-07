Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE456F3B3
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 08:16:41 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:19:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YV6tpa2QnrTwbguX@platvala-desk.ger.corp.intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
 <20211006161444.904476-2-rodrigo.vivi@intel.com>
 <877deqvzre.wl-ashutosh.dixit@intel.com>
 <YV3cBQId0QvCLUs5@intel.com>
 <875yuavz3f.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yuavz3f.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] tests/i915/gem_pxp: Add LOCAL_ UAPI
 defines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org, Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 06, 2021 at 10:32:04AM -0700, Dixit, Ashutosh wrote:
> On Wed, 06 Oct 2021 10:25:25 -0700, Rodrigo Vivi wrote:
> >
> > On Wed, Oct 06, 2021 at 10:17:41AM -0700, Dixit, Ashutosh wrote:
> > > On Wed, 06 Oct 2021 09:14:37 -0700, Rodrigo Vivi wrote:
> > > >
> > > > While the UAPI changes don't propagate to drm-next we should
> > > > have that as LOCAL_ ones.
> > >
> > > Please add these in lib/i915/i915_drm_local.h as follows:
> >
> > Could we move this file to the include directory and document it
> > in the README.md along with the uapi sync mention?
> 
> I think that should be fine. Petri: what do you think, since the directory
> is supposed to contain "imported" kernel headers?

Yeah that is fine. The directory is already not a full copy of _all_
drm-uapi headers.

-- 
Petri Latvala


> 
> Anyway, let's add the LOCAL's to this file for now as it says below. Thanks.
> 
> >
> > >
> > > /*
> > >  * It is necessary on occasion to add uapi declarations to IGT before they
> > >  * appear in imported kernel uapi headers. This header is provided for this
> > >  * purpose.
> > >
> > >  * Early uapi declarations should be added here exactly as they are
> > >  * expected to appear in the kernel uapi headers, i.e. without the LOCAL_
> > >  * or local_ prefix and without any #ifndef's. Attempt should be made to
> > >  * clean these up when kernel uapi headers are sync'd.
> > >  */
> > >
> > > >
> > > > That was my mistake during review and merge since I had
> > > > ignored the rules documented at README.md and considered
> > > > drm-intel branches would be enough. I'm sorry.
> > > >
> > > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
