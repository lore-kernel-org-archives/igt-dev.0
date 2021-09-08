Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221FF6E323
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Sep 2021 22:41:32 +0000 (UTC)
Received: by mail-lf1-f69.google.com with SMTP id
 d2-20020ac25442000000b003e52a038afaso1328847lfn.10
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Sep 2021 15:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <4ba5bb1e9fe08cbd9a6c43fc0e6e7eabc3d6520e.camel@redhat.com>
 <CAKMK7uH0_62jhrLkiz0ZynM1iwcdZ2nM2qWdDtu=mJB80nFjFw@mail.gmail.com>
In-Reply-To: <CAKMK7uH0_62jhrLkiz0ZynM1iwcdZ2nM2qWdDtu=mJB80nFjFw@mail.gmail.com>
From: Porygon <jsolomon@redhat.com>
Date: Wed, 8 Sep 2021 18:40:12 -0400
Message-ID: <CAMBYGp5y=sk_F9uygz44kjNkvFjXex90tGgv24VedLXBL6PRmA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000606b1f05cb83917a"
Subject: Re: [igt-dev] Testing s2idle/S0?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: porygon@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lyude Paul <lyude@redhat.com>, IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000606b1f05cb83917a
Content-Type: text/plain; charset="UTF-8"

Hey Daniel,

Sorry for the long wait for a response, QE has been rather busy :)

This will be my first time contributing directly to an upstream project, so
I may need some assistance with the whole process. I do think it would be
good to write some tests explicitly for s2idle testing since some machines
are shipped with both "deep" (this is S3, I believe) and "s2idle" supported
as suspend states. s2idle is becoming more common on laptops being shipped
so we do want to make sure this is covered. Some machines seem to support
only s2idle and are dropping support for deep; I think that the regular
suspend cases may still cover s2idle in this case specifically, so perhaps
it makes sense to have some explicit cases for the alternate state on
machines that support both, just some simple sanity checks to catch
possible regressions and ensure suspend works in general.

I know we can blacklist tests when running IGT but I'm guessing under a
typical use case, we don't want to blacklist anything by default in a
regular test run, hence the worry about extra overhead. If this is
incorrect & having some side set then we could blacklist the extra tests by
default and only have them run as a set if the user chooses to specifically.

If you have any further advice or thoughts on this, please let me know!
Just hoping to get working on this ASAP so I've got a solution in mind
within the next few weeks.


Best regards,
-- Porygon


On Thu, Jul 29, 2021 at 3:43 AM Daniel Vetter <daniel.vetter@ffwll.ch>
wrote:

> On Wed, Jul 28, 2021 at 10:06 PM Lyude Paul <lyude@redhat.com> wrote:
> > Hi! Recently one of my coworkers from QA (cc'd here) asked me about
> whether we
> > had any tests for s2idle in igt - to which I looked, didn't see anything
> that
> > looked like a match, and suggested that they consider contributing some
> tests
> > for it. Note that when I mention s2idle here, I'm thinking about systems
> which
> > support both s2idle and S3 - as I know that s2idle is already being used
> by
> > default for suspend/resume by igt on s2idle only systems.
> >
> > This made me realize that we don't actually have any explicit
> suspend/resume
> > tests - we only have tests which handle testing other functionality
> across
> > suspend/resume. This seems like it makes sense for the most part, which
> brings
> > me to my real question here - would it be worth it to try adding s2idle
> > support for most igt tests, so that on s2idle/S3 hybrid systems both
> suspend
> > modes are tested individually for each suspend/resume test?
>
> If you really add it to all of them the runtime explosion is likely
> prohibitive. But a handful of explicit ones should be fine I guess.
> -Daniel
>
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
>

--000000000000606b1f05cb83917a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Daniel,</div><div><br></div><div>Sorry for the lo=
ng wait for a response, QE has been rather busy :)</div><div><br></div><div=
>This will be my first time contributing directly to an upstream project, s=
o I may need some assistance with the whole process. I do think it would be=
 good to write some tests explicitly for s2idle testing since some machines=
 are shipped with both &quot;deep&quot; (this is S3, I believe) and &quot;s=
2idle&quot; supported as suspend states. s2idle is becoming more common on =
laptops being shipped so we do want to make sure this is covered. Some mach=
ines seem to support only s2idle and are dropping support for deep; I think=
 that the regular suspend cases may still cover s2idle in this case specifi=
cally, so perhaps it makes sense to have some explicit cases for the altern=
ate state on machines that support both, just some simple sanity checks to =
catch possible regressions and ensure suspend works in general.</div><div><=
br></div><div>I know we can blacklist tests when running IGT but I&#39;m gu=
essing under a typical use case, we don&#39;t want to blacklist anything by=
 default in a regular test run, hence the worry about extra overhead. If th=
is is incorrect &amp; having some side set then we could blacklist the extr=
a tests by default and only have them run as a set if the user chooses to s=
pecifically.</div><div><br></div><div>If you have any further advice or tho=
ughts on this, please let me know! Just hoping to get working on this ASAP =
so I&#39;ve got a solution in mind within the next few weeks.</div><div><br=
></div><div><br></div><div>Best regards,</div><div>-- Porygon<br></div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jul 29, 2021 at 3:43 AM Daniel Vetter &lt;<a href=3D"mai=
lto:daniel.vetter@ffwll.ch">daniel.vetter@ffwll.ch</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jul 28, 2021 at 1=
0:06 PM Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.com" target=3D"_blank=
">lyude@redhat.com</a>&gt; wrote:<br>
&gt; Hi! Recently one of my coworkers from QA (cc&#39;d here) asked me abou=
t whether we<br>
&gt; had any tests for s2idle in igt - to which I looked, didn&#39;t see an=
ything that<br>
&gt; looked like a match, and suggested that they consider contributing som=
e tests<br>
&gt; for it. Note that when I mention s2idle here, I&#39;m thinking about s=
ystems which<br>
&gt; support both s2idle and S3 - as I know that s2idle is already being us=
ed by<br>
&gt; default for suspend/resume by igt on s2idle only systems.<br>
&gt;<br>
&gt; This made me realize that we don&#39;t actually have any explicit susp=
end/resume<br>
&gt; tests - we only have tests which handle testing other functionality ac=
ross<br>
&gt; suspend/resume. This seems like it makes sense for the most part, whic=
h brings<br>
&gt; me to my real question here - would it be worth it to try adding s2idl=
e<br>
&gt; support for most igt tests, so that on s2idle/S3 hybrid systems both s=
uspend<br>
&gt; modes are tested individually for each suspend/resume test?<br>
<br>
If you really add it to all of them the runtime explosion is likely<br>
prohibitive. But a handful of explicit ones should be fine I guess.<br>
-Daniel<br>
<br>
&gt; --<br>
&gt; Cheers,<br>
&gt;=C2=A0 Lyude Paul (she/her)<br>
&gt;=C2=A0 Software Engineer at Red Hat<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; igt-dev mailing list<br>
&gt; <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blank">igt=
-dev@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/igt-dev" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/lis=
tinfo/igt-dev</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
<br>
</blockquote></div>

--000000000000606b1f05cb83917a--
