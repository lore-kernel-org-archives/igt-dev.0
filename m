Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB20B6F3AE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 08:19:34 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:23:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YV6uZ7+pqI0E4Uwh@platvala-desk.ger.corp.intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
 <20211006161444.904476-8-rodrigo.vivi@intel.com>
 <874k9uvyr9.wl-ashutosh.dixit@intel.com>
 <37d29dab1b58656ff12795423d123d40d7f90d93.camel@intel.com>
 <871r4yvwlp.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871r4yvwlp.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] include: Introduce linux-uapi for
 non-drm-uapi files.
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 06, 2021 at 11:25:54AM -0700, Dixit, Ashutosh wrote:
> On Wed, 06 Oct 2021 10:56:24 -0700, Vivi, Rodrigo wrote:
> >
> > On Wed, 2021-10-06 at 10:39 -0700, Dixit, Ashutosh wrote:
> > > On Wed, 06 Oct 2021 09:14:43 -0700, Rodrigo Vivi wrote:
> > > >
> > > > sync_file.h is needed for dma-buf, but it is part of the
> > > > linux-uapi include dir.
> > > >
> > > > The patch aims to have a drm-uapi directory that is a pure
> > > > copy of the generated drm-uapi include dir.
> > >
> > > But then we cannot add i915_drm_local.h here?
> >
> > I was thinking about another directory like
> > include/local-uapi/i915_drm_local.h
> 
> OK, I will post a patch for this and then see what Petri says. Thanks.

Ah, I already replied to that earlier email. This looks even cleaner.


-- 
Petri Latvala
