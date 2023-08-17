Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F181B10E522
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 17:13:14 +0000 (UTC)
Date: Thu, 17 Aug 2023 19:12:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230817171259.wdb2iwec53vskpxz@kamilkon-desk1>
References: <20230815173659.1208384-1-alan.previn.teres.alexis@intel.com>
 <20230816142739.k2ycx6vn5rrx33rt@kamilkon-desk1>
 <87pm3lsszj.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pm3lsszj.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Add a helper lib to read mmio
 registers via ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Dixit,

On 2023-08-17 at 06:23:12 -0700, Dixit, Ashutosh wrote:
> On Wed, 16 Aug 2023 07:27:39 -0700, Kamil Konieczny wrote:
> >
> 
> Hi Alan/Kamil,
> 
> > Hi Alan,
> >
> > On 2023-08-15 at 10:36:59 -0700, Alan Previn wrote:
> > > Add a helper lib function to call DRM_IOCTL_I915_REG_READ to
> > > read whitelisted registers.
> > >
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >  lib/i915/i915_reg_read_ioctl.c | 34 ++++++++++++++++++++++++++++++++++
> > ---------------- ^^^^^^^^^^^^^^
> >
> > imho better name would be i915_mmio_reg
> >
> > >  lib/i915/i915_reg_read_ioctl.h |  9 +++++++++
> 
> Can't this just go in lib/ioctl_wrappers.*? Do we need a new file for this?
> 
> Thanks.
> --
> Ashutosh

I agree that if possible we should reuse other intel lib.

Regards,
Kamil
