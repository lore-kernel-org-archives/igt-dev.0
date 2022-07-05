Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E727D94592
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jul 2022 19:58:04 +0000 (UTC)
Date: Tue, 5 Jul 2022 21:58:00 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Message-ID: <20220705215800.2c9165a6@maurocar-mobl2>
In-Reply-To: <b1e8327b02fbbda0e180b217735b460c6f307f6b.camel@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-5-ryszard.knop@intel.com>
 <20220629181334.60fc4f83@maurocar-mobl2>
 <b1e8327b02fbbda0e180b217735b460c6f307f6b.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] runner: Add the --environment flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 30 Jun 2022 13:40:47 +0000
"Knop, Ryszard" <ryszard.knop@intel.com> wrote:

> On Wed, 2022-06-29 at 18:13 +0200, Mauro Carvalho Chehab wrote:
> > On Tue, 28 Jun 2022 11:44:32 +0200
> > Ryszard Knop <ryszard.knop@intel.com> wrote:
> >  =20
> > > Allows specifying additional environment variables to be set for
> > > the
> > > launched test processes. This commit introduces the argument
> > > parsing.
> > >=20
> > > Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> > > ---
> > > =C2=A0runner/settings.c | 116
> > > +++++++++++++++++++++++++++++++++++++++++++++-
> > > =C2=A0runner/settings.h |=C2=A0=C2=A0 9 ++++
> > > =C2=A02 files changed, 124 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/runner/settings.c b/runner/settings.c
> > > index d153954a..de339484 100644
> > > --- a/runner/settings.c
> > > +++ b/runner/settings.c
> > > @@ -35,6 +35,7 @@ enum {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_DRY_RUN =3D 'd',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_INCLUDE =3D 't',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_EXCLUDE =3D 'x',
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_ENVIRONMENT =3D 'e',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_SYNC =3D 's',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_LOG_LEVEL =3D 'l',
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0OPT_OVERWRITE =3D 'o',
> > > @@ -389,6 +390,113 @@ static void free_regexes(struct regex_list
> > > *regexes)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(regexes->regexes=
);
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * string_trim_and_duplicate() - returns a duplicated, trimmed
> > > string
> > > + * @string: string to trim and duplicate
> > > + *=20
> > > + * If the provided string is NULL, a NULL is returned. In any
> > > other case, a
> > > + * newly-allocated string of length up to strlen(string) is
> > > returned. The
> > > + * returned string has its whitespace removed (as detected by
> > > isspace), while
> > > + * the original string is left unmodified.
> > > + */
> > > +static char *string_trim_and_duplicate(const char *string) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size_t length;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (string =3D=3D NULL)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0length =3D strlen(string);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (length > 0 && isspa=
ce(string[0])) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0string++;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0length--;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (length > 0 && isspa=
ce(string[length - 1])) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0length--;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return strndup(string, len=
gth);
> > > +}
> > > +
> > > +/**
> > > + * add_env_var() - Adds a new environment variable to the runner
> > > settings.
> > > + * @env_vars: Pointer to the env var list head from the settings.
> > > + * @env_kv: Environment variable key-value pair string to add.
> > > + *
> > > + * env_kv must be a string like "KEY=3DVALUE" or just "KEY" if the
> > > value is to
> > > + * be loaded from the runner's environment variables. In the
> > > latter case, if
> > > + * the requested variable is not set, the operation will fail.
> > > + *=20
> > > + * An empty variable may be set by providing an env_kv of "KEY=3D"
> > > or setting
> > > + * an empty variable for the runner process, then providing just
> > > "KEY".
> > > + */
> > > +static bool add_env_var(struct igt_list_head *env_vars, char
> > > *env_kv) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *current_env_value, *=
kv_split;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct environment_variabl=
e *var =3D NULL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (env_vars =3D=3D NULL |=
| env_kv =3D=3D NULL || strlen(env_kv) =3D=3D
> > > 0)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto error; =20
> >=20
> > As you had already allocated env_vars at this point, as otherwise
> > env_vars
> > would be NULL, the best is to just call IGT_INIT_LIST_HEAD(env_vars)
> > when=20
> > it was allocated.
> >  =20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0env_kv =3D strdup(env_kv);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kv_split =3D strchr(env_kv=
, '=3D'); =20
> >=20
> > Better to use strtok().
> >  =20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (kv_split =3D=3D env_kv=
) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Missing key for --environment
> > > \"%s\"\n", env_kv);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto error;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var =3D malloc(sizeof(stru=
ct environment_variable));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (kv_split !=3D NULL) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* value provided - copy string contents after '=3D'
> > > */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0kv_split[0] =3D NULL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0var->key =3D string_trim_and_duplicate(env_kv);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0var->value =3D strdup(kv_split + 1); /* Can be empt=
y,
> > > that's okay */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* use the runner's environment, if set */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0current_env_value =3D getenv(env_kv);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (current_env_value =3D=3D NULL) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fpr=
intf(stderr, "No value provided for --
> > > environment \"%s\" and "
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "variable is not set for
> > > igt_runner\n", env_kv);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0got=
o error;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0var->key =3D string_trim_and_duplicate(env_kv);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0var->value =3D strdup(current_env_value);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} =20
> >=20
> >=20
> > It sounds weird to accept things like:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"ENV=3D=C2=A0=C2=A0=C2=
=A0=C2=A0 var"
> > or even:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"=C2=A0=C2=A0 ENV=3Dvar"
> >=20
> > So, I would code the above with something based on this:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0key =3D strtok(env_kv, =
", \n\t=3D");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!key || !*key)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D strtok(NULL, =
", \n\t");
> >=20
> > Simpler, easier to understand and will give errors if spaces are
> > found where they shouldn't be. It can even be used inside a loop,
> > if someone would want to use it as:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--environment "VAR1=3Df=
oo, VAR2=3Dbar" =20
>=20
> Using strtok on the value does not handle cases where, for example, you
> can have spaces or equals sign in the value itself:
>=20
>     -e "DATA_PATH=3D/mnt/Pendrive 2GB/build/..."
>     -e "SUBPROCESS_ARGS=3D--arg1=3D123 --another-arg=3D456"

You could then use strpbrk(), which should still simplify the parser.

	p =3D strpbrk(key, " \n\t=3D");
	if (*p =3D=3D '=3D')
		value =3D p++;
	else
		value =3D NULL;
	*p =3D '\0';

Although, in this case, one -e per parameter would be needed.

>=20
> An alternative solution would be to enable shell-like parsing with
> quotes, escape chars, etc, but that sounds like a lot more work.

Agreed.

> As for the key, I thought about a case where you might have a script
> that just applies env vars from a file or script which can be aligned:
>=20
>     BINARIES=3D/opt/igt/...
>         DATA=3D/mnt/stuff/...
>=20
> Most software would convert "    DATA" into "DATA" automatically.
> Whenever it's good practice or not is another discussion, but I'd like
> this arg to do the sane thing by default. But it looks like strtok will
> simplify key lookups, so I'll try to do that here.

Ok.

Regards,
Mauro
