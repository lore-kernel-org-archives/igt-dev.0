Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 24 Mar 2021 18:12:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YFtlAL+YxOc/dN4H@intel.com>
References: <20210318222124.970997-2-lyude@redhat.com>
 <20210323172513.1519481-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323172513.1519481-1-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_cursor_crc: Probe kernel
 for cursor size support
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 01:25:13PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> =

> Currently we just assume that every cursor size up to data->cursor_max_w/=
h will
> be supported by the driver, and check for support of nonsquare cursors by
> checking if we're running on u815 and if so, which variant of intel hardw=
are
> we're running on. This isn't really ideal as we're about to enable 32x32 =
cursor
> size tests for nouveau, and Intel hardware doesn't support cursor sizes t=
hat
> small.
> =

> So, fix this by removing has_nonsquare_cursors() and replacing it with a =
more
> generic require_cursor_size() function which checks whether or not the dr=
iver
> we're using supports a given cursor size by attempting a test-only atomic
> commit.
> =

> v3:
> * Also probe for cursor support on systems without atomic support

Gave this a go on my i865, and after removing a bogus max_w=3D=3Dmax_h
assert it all passed, and your non-square probing worked fine.
I'll need to send a patch to nuke that bogus assert, and I also had
an idea to test the max sized cursor as well (in case it's not square
and thus not being tested already)...

with the s/u815/i915/ Petri pointed out
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
