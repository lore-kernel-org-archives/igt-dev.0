Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C550E10E8EB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 14:30:38 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id v192so6515478vkv.7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 07:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220918223955.3283220-1-jfree@freebsd.org>
 <YzRAoHGblx/JjInQ@kamilkon-desk1>
In-Reply-To: <YzRAoHGblx/JjInQ@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 28 Sep 2022 09:30:26 -0500
Message-ID: <CAOgZAGZAb5Ng7CfNr9Ty7-AugyKYA7NUOJVZR5iqRh-5WBmt+Q@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000be22a305e9bd9a39"
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced get_current_dir_name() with
 getcwd() for BSD compatibility
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

--000000000000be22a305e9bd9a39
Content-Type: text/plain; charset="UTF-8"

The get_current_dir_name() function is a GNU C extension that copies
the current directory's absolute path into a memory allocated buffer.
This patch replaces get_current_dir_name() with a POSIX compliant
getcwd() that performs the same action.

On Wed, Sep 28, 2022 at 7:40 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> please put here shot commit description, the patch itself
> looks good.
>
> Regrads,
> Kamil
>
> On 2022-09-18 at 17:39:55 -0500, Jake Freeland wrote:
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
> > ---
> >  tests/tools_test.c                  | 6 +++---
> >  tools/i915-perf/i915_perf_control.c | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/tools_test.c b/tests/tools_test.c
> > index 89a19d11..d0684d57 100644
> > --- a/tests/tools_test.c
> > +++ b/tests/tools_test.c
> > @@ -69,7 +69,7 @@ static bool chdir_to_tools_dir(void)
> >       char path[PATH_MAX];
> >       char *cwd;
> >
> > -     cwd = get_current_dir_name();
> > +     cwd = getcwd(NULL, 0);
> >       igt_info("Current working directory: %s\n", cwd);
> >       free(cwd);
> >
> > @@ -87,7 +87,7 @@ static bool chdir_to_tools_dir(void)
> >               chdir(dirname(path));
> >       }
> >
> > -     cwd = get_current_dir_name();
> > +     cwd = getcwd(NULL, 0);
> >       igt_info("Current working directory: %s\n", cwd);
> >       free(cwd);
> >
> > @@ -103,7 +103,7 @@ igt_main
> >
> >               igt_require_f(chdir_to_tools_dir(),
> >                             "Unable to determine the tools directory,
> expecting them in $cwd/" TOOLS " or $path/" TOOLS "\n");
> > -             path = get_current_dir_name();
> > +             path = getcwd(NULL, 0);
> >               igt_info("Using tools from %s\n", path);
> >               free(path);
> >       }
> > diff --git a/tools/i915-perf/i915_perf_control.c
> b/tools/i915-perf/i915_perf_control.c
> > index be5996c0..f7db2f5c 100644
> > --- a/tools/i915-perf/i915_perf_control.c
> > +++ b/tools/i915-perf/i915_perf_control.c
> > @@ -102,7 +102,7 @@ main(int argc, char *argv[])
> >
> >                       fwrite(data, total_len, 1, command_fifo_file);
> >               } else {
> > -                     char *cwd = get_current_dir_name();
> > +                     char *cwd = getcwd(NULL, 0);
> >                       uint32_t path_len = strlen(cwd) + 1 +
> strlen(dump_file) + 1;
> >                       uint32_t total_len = sizeof(struct
> recorder_command_base) + path_len;
> >                       struct {
> > --
> > 2.37.3
> >
>

--000000000000be22a305e9bd9a39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The=C2=A0get_current_dir_name() function is a GNU C extens=
ion that copies<div>the current directory&#39;s absolute path into a memory=
 allocated buffer.</div><div>This patch replaces get_current_dir_name() wit=
h a POSIX compliant</div><div>getcwd() that performs the same action.</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Sep 28, 2022 at 7:40 AM Kamil Konieczny &lt;<a href=3D"mailto:kamil=
.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jake,<br>
<br>
please put here shot commit description, the patch itself<br>
looks good.<br>
<br>
Regrads,<br>
Kamil<br>
<br>
On 2022-09-18 at 17:39:55 -0500, Jake Freeland wrote:<br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/tools_test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;=C2=A0 tools/i915-perf/i915_perf_control.c | 2 +-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/tools_test.c b/tests/tools_test.c<br>
&gt; index 89a19d11..d0684d57 100644<br>
&gt; --- a/tests/tools_test.c<br>
&gt; +++ b/tests/tools_test.c<br>
&gt; @@ -69,7 +69,7 @@ static bool chdir_to_tools_dir(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char path[PATH_MAX];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *cwd;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0cwd =3D get_current_dir_name();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cwd =3D getcwd(NULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Current working directory: %s=
\n&quot;, cwd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0free(cwd);<br>
&gt;=C2=A0 <br>
&gt; @@ -87,7 +87,7 @@ static bool chdir_to_tools_dir(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chdir(dirname(pa=
th));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0cwd =3D get_current_dir_name();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cwd =3D getcwd(NULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Current working directory: %s=
\n&quot;, cwd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0free(cwd);<br>
&gt;=C2=A0 <br>
&gt; @@ -103,7 +103,7 @@ igt_main<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require_f(ch=
dir_to_tools_dir(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unable to determine the tools direc=
tory, expecting them in $cwd/&quot; TOOLS &quot; or $path/&quot; TOOLS &quo=
t;\n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D get_current_=
dir_name();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D getcwd(NULL,=
 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;U=
sing tools from %s\n&quot;, path);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(path);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i91=
5_perf_control.c<br>
&gt; index be5996c0..f7db2f5c 100644<br>
&gt; --- a/tools/i915-perf/i915_perf_control.c<br>
&gt; +++ b/tools/i915-perf/i915_perf_control.c<br>
&gt; @@ -102,7 +102,7 @@ main(int argc, char *argv[])<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fwrite(data, total_len, 1, command_fifo_file);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0char *cwd =3D get_current_dir_name();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0char *cwd =3D getcwd(NULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint32_t path_len =3D strlen(cwd) + 1 + strlen(dump_file) + 1;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint32_t total_len =3D sizeof(struct recorder_command_base) + =
path_len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct {<br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
</blockquote></div>

--000000000000be22a305e9bd9a39--
