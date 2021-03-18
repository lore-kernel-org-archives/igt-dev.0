Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Mar 2021 14:39:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YFNJ96fvZpNKtRGv@intel.com>
References: <20210317224520.447939-1-lyude@redhat.com>
 <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4793631d-ee46-3d80-aa24-30d18d42e38b@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Test 32x32 cursors
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
To: Martin Peres <martin.peres@mupuf.org>
Cc: Petri Latvala <petri.latvala@intel.com>, nouveau@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 08:39:01AM +0200, Martin Peres wrote:
> On 18/03/2021 00:45, Lyude wrote:
> > From: Lyude Paul <lyude@redhat.com>
> > =

> > Since pre-nve4 only has two cursor sizes (32x32 and 64x64), we should at
> > least test both of them.
> =

> This adds 36 subtests, which take about 1s in average. So the runtime is =

> not significantly increased on the Intel side.
> =

> It also seems that Intel should add skips or fix the kernel to support =

> these 32xXX format.

Intel hw at least does not support 32x32 cursors. We should
probably just just probe the kernel to see if it accepts the
requested cursor size, and skip the subtest if not. That
would also let us remove the i915 platform specific information
from has_nonsquare_cursors().

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
