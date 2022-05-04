Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDF210FB3D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 14:56:35 +0000 (UTC)
Date: Wed, 4 May 2022 16:56:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20220504145631.jau23ekng6zdzhv4@houat>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-5-maxime@cerno.tech>
 <20220429154645.1680bad2@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220429154645.1680bad2@eldfell>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/8] lib/igt_frame: Add function to
 dump frames in RGB and raw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Pekka,

Thanks for reviewing those patches

On Fri, Apr 29, 2022 at 03:46:45PM +0300, Pekka Paalanen wrote:
> On Mon, 28 Mar 2022 16:55:05 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > The igt_write_frame_to_png() already allows to dump the content of a
> > cairo surface into a PNG image. However, it can be useful to have the
> > raw content of the buffer as well, so let's create a function that will
> > dump both a PNG image and its raw buffer.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Hi,
>=20
> when exactly is the raw dump useful? Do you need it for checking alpha?
> Or for YUV formats? Or for multi-planar formats? Or for greater than 8
> bpc or floating point formats?

Anything, really :)

When I started debugging this, the only feedback I got from IGT was the
hash it computed from the image, which isn't particularly useful for
debugging.

> How do you make use of the raw dump?

I'm using http://rawpixels.net/

> PNG can store alpha channel as well, and if that's not convenient
> alongsize RGB, you could save another image where alpha has been
> converted to gray scale.
>=20
> PNG can also go up to 16 bpc I think?
>=20
> PAM file format (netpbm type P7) might also be an option, looks like it
> can do up to RGBA 16 bpc, and is trivial to generate.
> http://netpbm.sourceforge.net/doc/pam.html
>=20
> It's not much different from a raw dump, but contains enough metadata
> for tools to understand the image.

TIL :)

But I'd assume all those formats are still RGB, right? So if we ever go
to check other formats, we'll get back into the same situation.

That being said, I don't have a strong opinion for that patch (and the
next one). I've found it to be useful when debugging, but I'd definitely
understand if that's not something we want in IGT.

Maxime
