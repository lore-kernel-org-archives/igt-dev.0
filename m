Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E956EAB8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 14:08:33 +0000 (UTC)
Date: Fri, 7 Feb 2020 16:08:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200207140829.GZ13686@intel.com>
References: <7278cd464aa928fdefb9b4b89df73d3c52fefc42.1581053156.git.ashutosh.dixit@intel.com>
 <20200207135605.GC11460@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207135605.GC11460@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] kms_fence_pin_leak: check for
 availabile fences
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 07:26:06PM +0530, Ramalingam C wrote:
> On 2020-02-06 at 21:26:52 -0800, Ashutosh Dixit wrote:
> > Need fences to leak fences.
> > =

> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/kms_fence_pin_leak.c | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> > diff --git a/tests/kms_fence_pin_leak.c b/tests/kms_fence_pin_leak.c
> > index 8c9e10a56..1ac65e8a1 100644
> > --- a/tests/kms_fence_pin_leak.c
> > +++ b/tests/kms_fence_pin_leak.c
> > @@ -200,6 +200,7 @@ igt_simple_main
> >  =

> >  	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> >  	igt_require_gem(data.drm_fd);
> > +	igt_require(gem_available_fences(data.drm_fd) > 0);
> >From documentation, seams this gem_available_fences is Only relevant for=
 pre-gen4.
> after the gen4 we dont use the fences or we can't use this method to get =
the fence
> count?

These days it just returns the total number of fences, so should work
on everything. There used to be a way userspace could reserve some
fences for itself (I think for UMS). I believe that's what the
documentation  is referring to. That stuff got removed years ago.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
