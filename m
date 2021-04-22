Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79306E147
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 10:01:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so3897578wmq.1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 03:01:45 -0700 (PDT)
Date: Thu, 22 Apr 2021 12:01:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YIFJhoTaYfbRVafu@phenom.ffwll.local>
References: <20210420221720.14656-1-ville.syrjala@linux.intel.com>
 <161897657623.19928.11652686076116912215@emeril.freedesktop.org>
 <YIBcroO7VtZB7rfL@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIBcroO7VtZB7rfL@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/3=5D_lib/kms=3A_Commit_primary?=
 =?utf-8?q?_plane_props_with_COMMIT=5FLEGACY?=
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
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 08:11:10PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Apr 21, 2021 at 03:42:56AM -0000, Patchwork wrote:
> > =3D=3D Series Details =3D=3D
> > =

> > Series: series starting with [i-g-t,v3,1/3] lib/kms: Commit primary pla=
ne props with COMMIT_LEGACY
> > URL   : https://patchwork.freedesktop.org/series/89278/
> > State : success
> =

> So apparently avoiding those two redundant color encoding/range
> setprop ioctls when chaging the fb does avoid the test failure
> on glk. How on earth two setprop ioctl can do this is a mystery
> The setprops should essentially be nops, and should just result
> in reprogramming the plane registers a few times using an
> identical state.

Might we need a full modeset for the hw to pick them up perhaps? Or at
least plane enable/disable cycle. Doesn't make sense, but hey hw, maybe it
only picks these up on initial enable.

Only other thing I can think of is to maybe double check the state
readout to make sure we really program this correctly in both cases.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
