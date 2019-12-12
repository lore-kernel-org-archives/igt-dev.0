Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04E76E1F2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 21:13:29 +0000 (UTC)
Date: Thu, 12 Dec 2019 23:13:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191212211326.GU1208@intel.com>
References: <20191211204636.16222-1-sunpeng.li@amd.com>
 <20191212150319.GP1208@intel.com>
 <cd5191d3-a041-5d7e-ba3a-69fb11aafa30@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd5191d3-a041-5d7e-ba3a-69fb11aafa30@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: Add 10bpc frame buffer
 parameterization to subtests
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
To: Leo <sunpeng.li@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 03:53:34PM -0500, Leo wrote:
> =

> =

> On 2019-12-12 10:03 a.m., Ville Syrj=E4l=E4 wrote:
> > On Wed, Dec 11, 2019 at 03:46:36PM -0500, sunpeng.li@amd.com wrote:
> >> From: Leo Li <sunpeng.li@amd.com>
> >>
> >> We'd like to test the hardware pipe's color management with 10bit
> >> surfaces.
> > =

> > Why exactly? The pipe color management stuff doesn't care what
> > pixel format the plane used.
> > =

> =

> We expose 10bpc support to usermode with color management, so it'd be
> good to cover it with a test.
> =

> With amdpgu, color management indeed doesn't care about surface format,
> since it's all converted to fixed point in hardware beforehand.

Totally missed this came from AMD folks. Good thing I was still
correct with my statement then :)

> But I
> think it's best to not assume hardware behavior, and test the actual
> use case instead.

I think what we would really want is a test that makes sure we can
achieve the desired precision in the output for some fb depth and
gamma configuration (sadly the gamma uapi doesn't let us do that
ATM in a hardware agnostic way). I don't think this test currently
checks anything like that. But maybe I'm misremebering what it
actually does.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
