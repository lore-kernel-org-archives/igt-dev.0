Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0810FB5E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 14:57:55 +0000 (UTC)
Date: Wed, 4 May 2022 16:57:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20220504145751.3fkknklgzhb2ksx5@houat>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-7-maxime@cerno.tech>
 <20220429155515.3ea51998@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220429155515.3ea51998@eldfell>
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/8] tests/kms_writeback: Dump the
 frames if the don't match
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

On Fri, Apr 29, 2022 at 03:55:15PM +0300, Pekka Paalanen wrote:
> On Mon, 28 Mar 2022 16:55:07 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > The writeback tests will make sure the reference and captured frames
> > match. If they don't however, we don't get anything but their hash which
> > isn't really helpful.
> >=20
> > Add a function similar to chamelium_assert_crc_eq_or_dump() to dump the
> > PNG and raw buffers of those two frames if they don't match and frame
> > dumping has been enabled.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> FWIW, in Weston we write out also the error visualization image with the
> mismatching areas highlighted:
> https://gitlab.freedesktop.org/wayland/weston/-/blob/69a59359fa8590074717=
e211d332c1077d8f277f/tests/weston-test-client-helper.c#L1405-1433

That's cool, I wonder if we could leverage this for the chamelium as
well.

maxime
