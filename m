Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F357A10E685
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 21:13:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k8so6001034wrh.1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 13:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20221117084129.2534819-1-petri.latvala@intel.com>
 <Y3YYUtBv1gklPkLv@kamilkon-desk1>
In-Reply-To: <Y3YYUtBv1gklPkLv@kamilkon-desk1>
From: Craig Small <csmall@dropbear.xyz>
Date: Fri, 18 Nov 2022 08:13:21 +1100
Message-ID: <CALy8Cw7xqRk+zb2e68J-pY0Y51ZRh=oS5oecs1jYqTv_-R6OhQ@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <petri.latvala@intel.com>, Craig Small <csmall@dropbear.xyz>
Content-Type: multipart/alternative; boundary="000000000000c5096505edb10f7a"
Subject: Re: [igt-dev] [PATCH i-g-t] Use the new procps library libproc2
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

--000000000000c5096505edb10f7a
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Nov 2022 at 22:17, Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Craig,
>
> On 2022-11-17 at 10:41:29 +0200, Petri Latvala wrote:
> > +#ifdef HAVE_LIBPROCPS
> >  #include <proc/readproc.h>
> > +#endif
> > +#ifdef HAVE_LIBPROC2
> -- ^
> Maybe just #elif ?
>
That's probably better, you don't want both to happen.


> -- ^^^^^^^^^^^^^^^^^^
> > +#include <dirent.h>
> -- ^^^^^^^^^^^^^^^^^^
> What this has with libproc2 ?
> Note also that FreeBSD have its own limits.h
>
I'm not sure why that would be there, the library handles the directory
enumeration.


>
> > +         if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
>
> Processes AA and aa are different, why do you use strncasecmp ?
>
I agree, but the original uses strncasecmp. They both should use strncmp
but that's beyond "making it work with libproc2".
Otherwise linking with libprocps is case-insenstive and linking with
libproc2 is case sensitive.


>
> > @@ -1524,10 +1616,13 @@ static void pipewire_reserve_wait(void)
> >       char xdg_dir[PATH_MAX];
> >       const char *homedir;
> >       struct passwd *pw;
> > -     proc_t *proc_info;
> > -     PROCTAB *proc;
> > +     int tid=0, euid, egid;
> >
> > +#ifdef HAVE_LIBPROCPS
> >       igt_fork_helper(&pw_reserve_proc) {
> > +             proc_t *proc_info;
> > +             PROCTAB *proc;
> > +
> >               igt_info("Preventing pipewire-pulse to use the audio
> drivers\n");
> >
> >               proc = openproc(PROC_FILLCOM | PROC_FILLSTAT |
> PROC_FILLARG);
> > @@ -1540,19 +1635,44 @@ static void pipewire_reserve_wait(void)
> >               }
> >               closeproc(proc);
> >
> > +             tid = proc_info->tid;
> > +             euid = proc_info->euid;
> > +             egid = proc_info->egid;
> > +             freeproc(proc_info);
> > +#endif
> > +#ifdef HAVE_LIBPROC2
> > +     igt_fork(child, 1) {
>
> This should be fork_helper like above.
>
Did something change here recently? My version of pipewire_reserve_wait()
has igt_fork()
However, whatever the current version is doing they should be the same.


>
> > +             enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID,
> PIDS_ID_EGID };
> > +             enum rel_items { EU_PID, EU_EUID, EU_EGID };
> > +             struct pids_info *info = NULL;
> > +             struct pids_stack *stack;
> > +
> > +             igt_info("Preventing pipewire-pulse to use the audio
> drivers\n");
> > +
> > +             if (procps_pids_new(&info, Items, 3) < 0)
> > +                 return;
> ------------------- ^
> Use exit(0) here plus maybe some ing_info why it failed ?
>
Ah yes, because at this point you're running as a child process.
The error message we (procps) use for this is:
"Unable to create pid info structure"
So this would be
{
  igt_info("Unable to create pid info structure");
  exit(0);
}

> @@ -1584,6 +1702,10 @@ int pipewire_pulse_start_reserve(void)
> >        * pipewire version 0.3.50 or upper.
> >        */
> >       for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME;
> attempts++) {
> > +#ifdef HAVE_LIBPROCPS
> > +             PROCTAB *proc;
> > +             proc_t *proc_info;
> > +
> >               usleep(1000);
> >               proc = openproc(PROC_FILLCOM | PROC_FILLSTAT |
> PROC_FILLARG);
> >               igt_assert(proc != NULL);
> > @@ -1598,6 +1720,25 @@ int pipewire_pulse_start_reserve(void)
> >                       freeproc(proc_info);
> >               }
> >               closeproc(proc);
> > +#endif
> > +#ifdef HAVE_LIBPROC2
> > +             enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
> > +             struct pids_info *info = NULL;
> > +             struct pids_stack *stack;
> > +
> > +             usleep(1000);
> > +
> > +             if (procps_pids_new(&info, Items, 2) < 0)
> > +                     return 1;
> ----------------------- ^
> break or igt_assert_f(errno == 0, "Getting procps failed\n"); here.
>
If procps_pids_new() returns a negative number then getting the info
structure has failed.
This is very similar to igt_assert(proc != NULL) above in the same function.
I'm not sure of your coding style, should you assert that procps_pids_new
returns >= 0? or use the branch?

Thankyou for your review on this patch. The sole goal of this patch is so
igt does the same thing with libprocps and libproc2 so I've tried to keep
the same behavior.

  - Craig

--000000000000c5096505edb10f7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 17 Nov 2022 at 22:17, Kamil K=
onieczny &lt;<a href=3D"mailto:kamil.konieczny@linux.intel.com">kamil.konie=
czny@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Craig,<br>
<br>
On 2022-11-17 at 10:41:29 +0200, Petri Latvala wrote:<br>&gt; +#ifdef HAVE_=
LIBPROCPS<br>
&gt;=C2=A0 #include &lt;proc/readproc.h&gt;<br>
&gt; +#endif<br>
&gt; +#ifdef HAVE_LIBPROC2<br>
-- ^<br>
Maybe just #elif ?<br></blockquote><div>That&#39;s probably better, you don=
&#39;t want both to happen.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">-- ^^^^^^^^^^^^^^^^^^<br>
&gt; +#include &lt;dirent.h&gt;<br>
-- ^^^^^^^^^^^^^^^^^^<br>
What this has with libproc2 ?<br>
Note also that FreeBSD have its own limits.h<br></blockquote><div>I&#39;m n=
ot sure why that would be there, the library handles the directory enumerat=
ion.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strncasecmp(pid_comm, comm=
, strlen(pid_comm))) {<br>
<br>
Processes AA and aa are different, why do you use strncasecmp ?<br></blockq=
uote><div>I agree, but the original uses strncasecmp. They both should use =
strncmp but that&#39;s beyond &quot;making it work with libproc2&quot;.</di=
v><div>Otherwise linking with libprocps is case-insenstive=C2=A0and linking=
=C2=A0with libproc2 is case sensitive.=C2=A0</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
&gt; @@ -1524,10 +1616,13 @@ static void pipewire_reserve_wait(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char xdg_dir[PATH_MAX];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *homedir;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct passwd *pw;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0proc_t *proc_info;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0PROCTAB *proc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int tid=3D0, euid, egid;<br>
&gt;=C2=A0 <br>
&gt; +#ifdef HAVE_LIBPROCPS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork_helper(&amp;pw_reserve_proc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc_t *proc_info;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROCTAB *proc;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;P=
reventing pipewire-pulse to use the audio drivers\n&quot;);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc =3D openpro=
c(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);<br>
&gt; @@ -1540,19 +1635,44 @@ static void pipewire_reserve_wait(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0closeproc(proc);=
<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tid =3D proc_info-&gt=
;tid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0euid =3D proc_info-&g=
t;euid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0egid =3D proc_info-&g=
t;egid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freeproc(proc_info);<=
br>
&gt; +#endif<br>
&gt; +#ifdef HAVE_LIBPROC2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_fork(child, 1) {<br>
<br>
This should be fork_helper like above.<br></blockquote><div>Did something c=
hange here recently? My version of pipewire_reserve_wait() has igt_fork()</=
div><div>However, whatever the current version is doing they should be the =
same.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum pids_item Items[=
] =3D { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum rel_items { EU_P=
ID, EU_EUID, EU_EGID };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pids_info *inf=
o =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pids_stack *st=
ack;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_info(&quot;Preven=
ting pipewire-pulse to use the audio drivers\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (procps_pids_new(&=
amp;info, Items, 3) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;=
<br>
------------------- ^<br>
Use exit(0) here plus maybe some ing_info why it failed ?<br></blockquote><=
div>Ah yes, because at this point=C2=A0you&#39;re running as a child proces=
s.=C2=A0</div><div>The error message we (procps) use for this is:</div><div=
>&quot;Unable to create pid info structure&quot;<br></div><div>So this woul=
d be</div><div>{</div><div>=C2=A0 igt_info(&quot;Unable to create pid info =
structure&quot;);</div><div>=C2=A0 exit(0);</div><div>}</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; @@ -1584,6 +1702,10=
 @@ int pipewire_pulse_start_reserve(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * pipewire version 0.3.50 or upper.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (attempts =3D 0; attempts &lt; PIPEWIRE_=
RESERVE_MAX_TIME; attempts++) {<br>
&gt; +#ifdef HAVE_LIBPROCPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROCTAB *proc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc_t *proc_info;<br=
>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(1000);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc =3D openpro=
c(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(proc =
!=3D NULL);<br>
&gt; @@ -1598,6 +1720,25 @@ int pipewire_pulse_start_reserve(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0freeproc(proc_info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0closeproc(proc);=
<br>
&gt; +#endif<br>
&gt; +#ifdef HAVE_LIBPROC2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum pids_item Items[=
] =3D { PIDS_ID_PID, PIDS_CMD };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pids_info *inf=
o =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pids_stack *st=
ack;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(1000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (procps_pids_new(&=
amp;info, Items, 2) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 1;<br>
----------------------- ^<br>
break or igt_assert_f(errno =3D=3D 0, &quot;Getting procps failed\n&quot;);=
 here.<br></blockquote><div>If procps_pids_new() returns a negative number =
then getting the info structure has failed.</div><div>This is very similar =
to igt_assert(proc !=3D NULL) above in the same function.</div><div>I&#39;m=
 not sure of your coding style, should you assert that procps_pids_new retu=
rns &gt;=3D 0? or use the branch?</div><div><br></div><div>Thankyou for you=
r review on this patch. The sole goal of this patch is so igt does the same=
 thing with libprocps and libproc2 so I&#39;ve tried to keep the same behav=
ior.</div><div><br></div><div>=C2=A0 - Craig</div><div><br></div></div></di=
v>

--000000000000c5096505edb10f7a--
