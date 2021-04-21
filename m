Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06546E9CD
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Apr 2021 17:11:13 +0000 (UTC)
Date: Wed, 21 Apr 2021 20:11:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YIBcroO7VtZB7rfL@intel.com>
References: <20210420221720.14656-1-ville.syrjala@linux.intel.com>
 <161897657623.19928.11652686076116912215@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161897657623.19928.11652686076116912215@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/3=5D__lib/kms=3A_Commit_primar?=
 =?utf-8?q?y_plane_props_with_COMMIT=5FLEGACY?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 03:42:56AM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
> =

> Series: series starting with [i-g-t,v3,1/3] lib/kms: Commit primary plane=
 props with COMMIT_LEGACY
> URL   : https://patchwork.freedesktop.org/series/89278/
> State : success

So apparently avoiding those two redundant color encoding/range
setprop ioctls when chaging the fb does avoid the test failure
on glk. How on earth two setprop ioctl can do this is a mystery
The setprops should essentially be nops, and should just result
in reprogramming the plane registers a few times using an
identical state.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
