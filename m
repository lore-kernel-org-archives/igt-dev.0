Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A706E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 13:01:11 +0000 (UTC)
Date: Mon, 11 Oct 2021 16:01:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YWQ1knVNUBfrumbu@intel.com>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
 <20210301203747.7177-14-manasi.d.navare@intel.com>
 <20210408180323.GB18296@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210408180323.GB18296@labuser-Z97X-UD5H>
Subject: Re: [igt-dev] [PATCH i-g-t 13/14] tools/intel_display_poller: Add
 vrr-wrap test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 11:03:29AM -0700, Navare, Manasi wrote:
> On Mon, Mar 01, 2021 at 12:37:46PM -0800, Manasi Navare wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > The VRR_STATUS2 registers contains yet anoher scanline counter.
> > Let's add a test to check when it wraps.
> >=20
> > Not sure this is actually useful. A better way might be to
> > allow wholesale replacement of the normal scanline counter
> > register with the VRR STATUS2? Not sure we care about this
> > register at all actually.
>=20
> Why do we need this test? This vertical scanline counter is just used
> to issue flip on a particular scanline mostly used for HW debug.
> How did you use the wrap test for testing VRR?

Hmm. Neglected to answer this one too. The only reason I added this
was to confirm how the VRR_STATUS2 scanline works. IIRC it worked
exactly like the normal DSL register, so we probably don't need this
test.

--=20
Ville Syrj=E4l=E4
Intel
