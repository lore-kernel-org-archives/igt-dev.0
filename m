Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8046EC51
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2020 11:45:53 +0000 (UTC)
Date: Fri, 18 Sep 2020 14:45:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200918114549.GH6112@intel.com>
References: <20200918064318.2143-1-karthik.b.s@intel.com>
 <20200918113248.GG6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918113248.GG6112@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8] tests/kms_async_flips: Add test to
 validate asynchronous flips
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, michel@daenzer.net, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 02:32:48PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, Sep 18, 2020 at 12:13:18PM +0530, Karthik B S wrote:
> > +static bool has_async(int fd)
> =

> has_async_flip() or has_async_page_flip() would be more descriptive.
> =

> > +{
> > +	struct drm_get_cap cap =3D { .capability =3D DRM_CAP_ASYNC_PAGE_FLIP =
};
> > +
> > +	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) =3D=3D 0);
> > +	return cap.value;
> > +}

I guess having a generic has_drm_cap() helper might be
nice throughout igt. Not sure if we have one already.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
