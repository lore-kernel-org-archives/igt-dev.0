Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022176EB80
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 12:10:07 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Thu, 30 Sep 2021 12:10:00 +0000
Message-ID: <MWHPR11MB13128EB944916330DFA0CD1989AA9@MWHPR11MB1312.namprd11.prod.outlook.com>
References: <20210902151334.15818-1-vidya.srinivas@intel.com>
 <20210916135955.17270-1-vidya.srinivas@intel.com>
 <fa1e3d36b6a94da4bfaf33d77e6aa316@intel.com>
In-Reply-To: <fa1e3d36b6a94da4bfaf33d77e6aa316@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if
 selected fetch is not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Thursday, September 30, 2021 3:26 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop=
.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>;
> markyacoub@google.com; Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if sel=
ected
> fetch is not available
>=20
> Looks good to me.

Thank you very much Jeevan.

Regards
Vidya
>=20
> >-----Original Message-----
> >From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> >Vidya Srinivas
> >Sent: Thursday, September 16, 2021 7:30 PM
> >To: igt-dev@lists.freedesktop.org
> >Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>;
> >markyacoub@google.com; Srinivas, Vidya <vidya.srinivas@intel.com>
> >Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if
> >selected fetch is not available
> >
> >Currently the tests are failing on systems where selected fetch feature
> >is not availble. Kernel returns -EINVAL when the test executes
> >reporting "Invalid debug mask 4".
> >Patch skips if selected fetch feature is not available in the kernel.
> >
> >v2: Incorportated Mark Yacoub's comments.
> >Changed igt_skip to igt_require_f
> >
> >Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Reviewed-by: Jeevan B<jeevan.b@intel.com>
> >---
> > lib/igt_psr.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/lib/igt_psr.c b/lib/igt_psr.c index
> >68240f9a33b4..0af503fb796e 100644
> >--- a/lib/igt_psr.c
> >+++ b/lib/igt_psr.c
> >@@ -167,7 +167,7 @@ static bool psr_set(int device, int debugfs_fd, int
> >mode)  }
> >
> > ret =3D psr_write(debugfs_fd, debug_val); -igt_assert(ret > 0);
> >+igt_require_f(ret =3D=3D 0, "PSR2 SF feature not available\n");
> > }
> >
> > /* Restore original value on exit */
> >--
> >2.33.0
>=20
