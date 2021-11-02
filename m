Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 2 Nov 2021 16:18:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211102231831.GA16278@jons-linux-dev-box>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-3-John.C.Harrison@Intel.com>
 <20211029173905.GA35332@jons-linux-dev-box>
 <98fe41ea-75fc-463c-23fd-25156a975b53@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <98fe41ea-75fc-463c-23fd-25156a975b53@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tests/i915/gem_exec_capture: Cope
 with larger page sizes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John Harrison <john.c.harrison@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 29, 2021 at 05:32:40PM -0700, John Harrison wrote:
> On 10/29/2021 10:39, Matthew Brost wrote:
> > On Thu, Oct 21, 2021 at 04:40:38PM -0700, John.C.Harrison@Intel.com wro=
te:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > >=20
> > > At some point, larger than 4KB page sizes were added to the i915
> > > driver. This included adding an informational line to the buffer
> > > entries in error capture logs. However, the error capture test was not
> > > updated to skip this string, thus it would silently abort processing.
> > >=20
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   tests/i915/gem_exec_capture.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capt=
ure.c
> > > index 53649cdb2..47ca64dd6 100644
> > > --- a/tests/i915/gem_exec_capture.c
> > > +++ b/tests/i915/gem_exec_capture.c
> > > @@ -484,6 +484,12 @@ static void many(int fd, int dir, uint64_t size,=
 unsigned int flags)
> > >   		addr |=3D strtoul(str + 1, &str, 16);
> > >   		igt_assert(*str++ =3D=3D '\n');
> > > +		/* gtt_page_sizes =3D 0x00010000 */
> > > +		if (strncmp(str, "gtt_page_sizes =3D 0x", 19) =3D=3D 0) {
> > > +			str +=3D 19 + 8;
> > > +			igt_assert(*str++ =3D=3D '\n');
> > > +		}
> > Can you explain this logic to me, for the life of me I can't figure out
> > what this doing. That probably warrent's a more detailed comment too.
> It's no different to the rest of the processing that this code was already
> doing.
>=20
> if( start_of_current_line =3D=3D "gtt_page_sizes =3D 0x") {
> =A0=A0=A0 current_line +=3D strlen(above_string) + strlen(8-digit hex str=
ing);
> =A0=A0=A0 assert( next_character_of_current_line =3D=3D end_of_line);
> }
>=20
> I.e. skip over any line that just contains the page size message.
>=20

Ok, got it. Not sure I missed that. The magic numbers 19 and 8 where
confusing me but I understand this now.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> John.
>=20
> >=20
> > Matt
> >=20
> > > +
> > >   		if (!(*str =3D=3D ':' || *str =3D=3D '~'))
> > >   			continue;
> > > --=20
> > > 2.25.1
> > >=20
>=20
