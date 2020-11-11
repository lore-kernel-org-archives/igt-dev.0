Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A4689E2A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:35 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:36:26 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111103626.GL7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-3-tzimmermann@suse.de>
 <20201111094930.GB7444@platvala-desk.ger.corp.intel.com>
 <3c3ea376-2575-80c2-e822-256362a9c057@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c3ea376-2575-80c2-e822-256362a9c057@suse.de>
Subject: Re: [igt-dev] [PATCH v3 2/8] tests/fbdev: Map framebuffer in
 igt_fixture
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
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 11:21:47AM +0100, Thomas Zimmermann wrote:
> Hi,
> =

> thanks for looking at the patches.
> =

> Am 11.11.20 um 10:49 schrieb Petri Latvala:
> > On Tue, Nov 10, 2020 at 08:50:56AM +0100, Thomas Zimmermann wrote:
> >> The mapping of the framebuffer memory will be useful for read/write
> >> tests. Move it into an igt_fixture block.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  tests/fbdev.c | 10 ++++------
> >>  1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/tests/fbdev.c b/tests/fbdev.c
> >> index 46641fea..fc66210a 100644
> >> --- a/tests/fbdev.c
> >> +++ b/tests/fbdev.c
> >> @@ -63,15 +63,10 @@ static void mode_tests(int fd)
> >>  static void framebuffer_tests(int fd)
> >>  {
> >>  	struct fb_fix_screeninfo fix_info;
> >> +	void *map;
> > =

> > After this patch, map is assigned to in an igt_fixture and read in a
> > subtest. As igt_fixture uses longjmp(), the value of map when read
> > depends on whether this is compiled with or without optimizations.
> =

> One thing I wondered about is that the tests are build with
> -Wno-clobbered. What's the reason? I'd expect that the compiler would
> have warned about this problem.

Too many warnings already accumulated mostly, some of them false
positives.


> =

> > =

> > The options for such variables are:
> > =

> > 1) move it to global scope
> > 2) make it volatile
> > 3) make a struct data_d with the map (and in a later patch, buf as
> >    well) variable and assign its members instead.
> > =

> > I think we prefer 3 generally.
> > =

> =

> I would have used 2. What's the benefit of of using 3?

Actually I take that back, it's an established convention when you
pass data to functions, not so much in code like in your series where
the stuff is entirely contained within the function.

That leaves no benefits so option 2 looks real juicy here indeed.


-- =

Petri Latvala


> =

> Best regards
> Thomas
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
