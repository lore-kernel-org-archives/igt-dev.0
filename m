Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC7DA98B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 21:20:30 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id h22so11372044qtu.2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 14:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220816154750.1366623-1-jfree@freebsd.org>
 <20220817142129.1639394-1-jfree@freebsd.org>
 <CAOgZAGYZ29qV7URegwm_AtQ5nCk3uAY7xwu0uf+0NH559o7qvw@mail.gmail.com>
 <Yv0GP5W+KdcM8dji@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yv0GP5W+KdcM8dji@platvala-desk.ger.corp.intel.com>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 17 Aug 2022 16:19:57 -0500
Message-ID: <CAOgZAGbXB-DJfzMQUBrh=vKHWed2GH8d_W-5_tdvkt4sBuVEaQ@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="0000000000002c9b4b05e6766f83"
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] added newline to 'END TESTLIST' to
 comply with runner string comparison
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000002c9b4b05e6766f83
Content-Type: text/plain; charset="UTF-8"

Hi there Petri,

I apologize for my ignorance. This is my first time contributing over
mailing list. Thank you for being understanding. :)

I squashed all three patches into one and sent it under a new thread.
Hopefully that should make things easier for Patchwork.

Jake Freeland

On Wed, Aug 17, 2022 at 10:17 AM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Wed, Aug 17, 2022 at 09:30:22AM -0500, Jake Freeland wrote:
> > It appears that Patchwork is not picking up the second patch in revision
> 2:
> > https://patchwork.freedesktop.org/series/107314/#rev2
> >
> > Is there a way I can manually add the second patch?
>
> You replied to patch 2, making patchwork think it's another version of
> it. To add new patches they should be replies to patch 1. But then
> there's the magic involved where patchwork tries to figure out whether
> it's an additional patch or a new version of patch 1...
>
> It's much simpler to just send the whole series as a whole. And please
> squash patches 2+3 together, from a quick read 3 seems to be just
> fixing patch 2.
>
>
> --
> Petri Latvala
>
>
> >
> > Thank you,
> > Jake Freeland
> >
> > On Wed, Aug 17, 2022 at 9:23 AM Jake Freeland <
> jake@technologyfriends.net>
> > wrote:
> >
> > > ---
> > >  scripts/code_cov_gen_report | 9 +++------
> > >  tests/generate_testlist.sh  | 2 +-
> > >  2 files changed, 4 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
> > > index ffc8142e..b0696c51 100755
> > > --- a/scripts/code_cov_gen_report
> > > +++ b/scripts/code_cov_gen_report
> > > @@ -138,8 +138,7 @@ if [ "$MODE" != "info" ]; then
> > >                 echo "Creating per-file info files..."
> > >                 echo -n "" >${MERGED_INFO}.info
> > >                 for i in $RESULTS/*.tar.gz; do
> > > -                       TITLE=$(basename $i)
> > > -                       TITLE=$(basename $TITLE .tar.gz)
> > > +                       TITLE=$(basename "$i" .tar.gz)
> > >
> > >                         echo "Adding results from $i..."
> > >                         tar xf $i
> > > @@ -155,8 +154,7 @@ if [ "$MODE" != "info" ]; then
> > >
> > >                 TITLE=${MERGED_INFO}
> > >         else
> > > -               TITLE=$(basename $RESULTS)
> > > -               TITLE=$(basename $TITLE .tar.gz)
> > > +               TITLE=$(basename "$RESULTS" .tar.gz)
> > >
> > >                 echo "Adding results from $RESULTS..."
> > >                 tar xf $RESULTS
> > > @@ -177,8 +175,7 @@ else
> > >                 echo "Copying $RESULTS to $DEST_DIR..."
> > >                 cp $RESULTS .
> > >
> > > -               TITLE=$(basename $RESULTS)
> > > -               TITLE=$(basename $TITLE .info)
> > > +               TITLE=$(basename "$RESULTS" .info)
> > >         fi
> > >  fi
> > >
> > > diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
> > > index 240a7eb5..ea999a45 100755
> > > --- a/tests/generate_testlist.sh
> > > +++ b/tests/generate_testlist.sh
> > > @@ -15,4 +15,4 @@ while [ $# -gt 0 ] ; do
> > >         shift
> > >  done
> > >
> > > -printf "\nEND TESTLIST" >> $OUTPUT
> > > +printf "\nEND TESTLIST\n" >> $OUTPUT
> > > --
> > > 2.37.2
> > >
> > >
>

--0000000000002c9b4b05e6766f83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there Petri,<div><br></div><div>I apologize for my igno=
rance. This is my first time contributing over</div><div>mailing list. Than=
k you for being understanding. :)</div><div><br></div><div>I squashed all t=
hree patches into one and sent it under a new thread.</div><div>Hopefully t=
hat should make things easier for Patchwork.</div><div><br></div><div>Jake =
Freeland</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 17, 2022 at 10:17 AM Petri Latvala &lt;<a href=
=3D"mailto:petri.latvala@intel.com">petri.latvala@intel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Aug 17, =
2022 at 09:30:22AM -0500, Jake Freeland wrote:<br>
&gt; It appears that Patchwork is not picking up the second patch in revisi=
on 2:<br>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/107314/#rev2" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.freedesktop.org/series/=
107314/#rev2</a><br>
&gt; <br>
&gt; Is there a way I can manually add the second patch?<br>
<br>
You replied to patch 2, making patchwork think it&#39;s another version of<=
br>
it. To add new patches they should be replies to patch 1. But then<br>
there&#39;s the magic involved where patchwork tries to figure out whether<=
br>
it&#39;s an additional patch or a new version of patch 1...<br>
<br>
It&#39;s much simpler to just send the whole series as a whole. And please<=
br>
squash patches 2+3 together, from a quick read 3 seems to be just<br>
fixing patch 2.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
&gt; <br>
&gt; Thank you,<br>
&gt; Jake Freeland<br>
&gt; <br>
&gt; On Wed, Aug 17, 2022 at 9:23 AM Jake Freeland &lt;<a href=3D"mailto:ja=
ke@technologyfriends.net" target=3D"_blank">jake@technologyfriends.net</a>&=
gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 scripts/code_cov_gen_report | 9 +++------<br>
&gt; &gt;=C2=A0 tests/generate_testlist.sh=C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 2 files changed, 4 insertions(+), 7 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_r=
eport<br>
&gt; &gt; index ffc8142e..b0696c51 100755<br>
&gt; &gt; --- a/scripts/code_cov_gen_report<br>
&gt; &gt; +++ b/scripts/code_cov_gen_report<br>
&gt; &gt; @@ -138,8 +138,7 @@ if [ &quot;$MODE&quot; !=3D &quot;info&quot; =
]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo=
 &quot;Creating per-file info files...&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo=
 -n &quot;&quot; &gt;${MERGED_INFO}.info<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for =
i in $RESULTS/*.tar.gz; do<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename $i)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename $TITLE .tar.gz)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename &quot;$i&quot; .tar.gz)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Adding results from $i...&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tar xf $i<br>
&gt; &gt; @@ -155,8 +154,7 @@ if [ &quot;$MODE&quot; !=3D &quot;info&quot; =
]; then<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITL=
E=3D${MERGED_INFO}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$=
(basename $RESULTS)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$=
(basename $TITLE .tar.gz)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$=
(basename &quot;$RESULTS&quot; .tar.gz)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo=
 &quot;Adding results from $RESULTS...&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar =
xf $RESULTS<br>
&gt; &gt; @@ -177,8 +175,7 @@ else<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo=
 &quot;Copying $RESULTS to $DEST_DIR...&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp $=
RESULTS .<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$=
(basename $RESULTS)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$=
(basename $TITLE .info)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$=
(basename &quot;$RESULTS&quot; .info)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;=C2=A0 fi<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/tests/generate_testlist.sh b/tests/generate_testlist=
.sh<br>
&gt; &gt; index 240a7eb5..ea999a45 100755<br>
&gt; &gt; --- a/tests/generate_testlist.sh<br>
&gt; &gt; +++ b/tests/generate_testlist.sh<br>
&gt; &gt; @@ -15,4 +15,4 @@ while [ $# -gt 0 ] ; do<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
&gt; &gt;=C2=A0 done<br>
&gt; &gt;<br>
&gt; &gt; -printf &quot;\nEND TESTLIST&quot; &gt;&gt; $OUTPUT<br>
&gt; &gt; +printf &quot;\nEND TESTLIST\n&quot; &gt;&gt; $OUTPUT<br>
&gt; &gt; --<br>
&gt; &gt; 2.37.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000002c9b4b05e6766f83--
