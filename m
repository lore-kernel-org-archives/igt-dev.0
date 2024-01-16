Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0803410E187
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 09:42:45 +0000 (UTC)
Date: Tue, 16 Jan 2024 09:42:18 +0000
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: anonymoustranquillity@proton.me
Subject: Fw: Re: [PATCH i-g-t] tools/intel_gpu_top: Fix misaligned rendering
Message-ID: <sDG41kRU_kjcZBjomgFKvKfqGmuzm1Y2OVrU_uNvhtrlrTPWH3OxbiO2xwZO82sfYX1BWFfXWwQmJQlLqKv0uKqVzD4ArE_MZ0p1EDB50Cc=@proton.me>
In-Reply-To: <EOyBwdNxkVNQWyfdtYOrT4lVOSHddYw7GcBAVb3X7zd7i4PXIZfA2qPVZmOW89smu3o4u4cXUs5I6ebB2SxI-cC9JuCwyrsEBLPv9tjRRLk=@proton.me>
References: <cPSpR9MXRhQ1yFaJm1l9QDoVT9SiH_resuKtBB52HnpHOiI5AO2BPTNYg3Srfj_vaU8_u-cSp5u7luqyAUta-9p8EjyIGKhizxL4hCwMNpY=@proton.me>
 <20240115152907.ilhrhy5zhegt4b7l@kamilkon-desk.igk.intel.com>
 <960382c0-a8ef-464b-ada5-c9d66a58561e@linux.intel.com>
 <EOyBwdNxkVNQWyfdtYOrT4lVOSHddYw7GcBAVb3X7zd7i4PXIZfA2qPVZmOW89smu3o4u4cXUs5I6ebB2SxI-cC9JuCwyrsEBLPv9tjRRLk=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I forgot to include the mailing list in the CC, I apologize. Forwarding it.




------- Forwarded Message -------
From: anonymoustranquillity@proton.me <anonymoustranquillity@proton.me>
Date: On Tuesday, January 16th, 2024 at 10:39 AM
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Fix misaligned rendering
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>


>=20
>=20
>=20
> Hello,
>=20
> I have not used send-email as my email provider (protonmail) does not see=
m to support SMTP (I have been meaning to switch to a self hosted provider =
for a while now, haven't been able to yet).
>=20
> This email is the one I use for FOSS contributions, it's the same one as =
the one I used to sign up to the freedesktop gitlab (https://gitlab.freedes=
ktop.org/tranquillity-codes). I am unable to include my real name due to pe=
rsonal reasons related to my safety (since it will be visible publicly).
>=20
> Running intel_gpu_top on some terminal sizes seems to overflow a characte=
r at end of line N to the first character of line N+1, misalign the column =
marker for PIDs, and sometimes hide the first few lines describing the engi=
nes. I used alacritty on X11 to test this.
>=20
> Thank you for your time,
> Ity
>=20
> On Tuesday, January 16th, 2024 at 9:49 AM, Tvrtko Ursulin tvrtko.ursulin@=
linux.intel.com wrote:
>=20
>=20
>=20
> > Hi,
> >=20
> > On 15/01/2024 15:29, Kamil Konieczny wrote:
> >=20
> > > Hi anonymoustranquillity,
> > > On 2024-01-14 at 21:26:36 +0000, anonymoustranquillity@proton.me wrot=
e:
> > >=20
> > > > Hello,
> > > >=20
> > > > there seems to be a problem with rendering in the interactive
> > > > mode in intel_gpu_top, seems to be a simple off-by-one. Below
> > > > is a patch. I am new to contributing via email, so I apologize
> > > > if I did something wrong - I tried to follow CONTRIBUTING.md
> > > > to the best of my ability.
> >=20
> > What renders incorrectly? Asking since locally things look fine for me.
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > > Have a nice day,
> > > > - Ity.
> > >=20
> > > Thank you for patch, if you would like to use git and re-send
> > > with the help of 'git format-patch -1' and then
> > > 'git send e-mail 0001-your-first.patch'
> > >=20
> > > Before that setup your real name and e-mail in git configuration,
> > > like "First Last your@email-address.me"
> > >=20
> > > If it is too much bother someone can take it from here
> > > but without your real name we cannot give you contribution
> > > (except for link into patchwork).
> > >=20
> > > +cc Tvrtko
> > >=20
> > > Regards,
> > > Kamil
> > >=20
> > > > ---
> > > > tools/intel_gpu_top.c | 2 +-
> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> > > > index 046ead15a..24363e72f 100644
> > > > --- a/tools/intel_gpu_top.c
> > > > +++ b/tools/intel_gpu_top.c
> > > > @@ -2178,7 +2178,7 @@ print_client(struct igt_drm_client *c, struct=
 engines *engines, double t, int li
> > > > len +=3D *class_w;
> > > > }
> > > >=20
> > > > - printf(" %-*s\n", con_w - len - 1, c->print_name);
> > > > + printf(" %-*s\n", con_w - len - 2, c->print_name);
> > > > } else if (output_mode =3D=3D JSON) {
> > > > char buf[64];
> > > >=20
> > > > --
> > > > 2.43.0
