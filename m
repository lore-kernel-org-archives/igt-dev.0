Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C25495B4C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 14:30:54 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id h4so10463088qtj.11
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 07:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220816154750.1366623-1-jfree@freebsd.org>
 <20220817142129.1639394-1-jfree@freebsd.org>
In-Reply-To: <20220817142129.1639394-1-jfree@freebsd.org>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 17 Aug 2022 09:30:22 -0500
Message-ID: <CAOgZAGYZ29qV7URegwm_AtQ5nCk3uAY7xwu0uf+0NH559o7qvw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Content-Type: multipart/alternative; boundary="0000000000004f209d05e670b65a"
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] added newline to 'END TESTLIST' to
 comply with runner string comparison
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

--0000000000004f209d05e670b65a
Content-Type: text/plain; charset="UTF-8"

It appears that Patchwork is not picking up the second patch in revision 2:
https://patchwork.freedesktop.org/series/107314/#rev2

Is there a way I can manually add the second patch?

Thank you,
Jake Freeland

On Wed, Aug 17, 2022 at 9:23 AM Jake Freeland <jake@technologyfriends.net>
wrote:

> ---
>  scripts/code_cov_gen_report | 9 +++------
>  tests/generate_testlist.sh  | 2 +-
>  2 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
> index ffc8142e..b0696c51 100755
> --- a/scripts/code_cov_gen_report
> +++ b/scripts/code_cov_gen_report
> @@ -138,8 +138,7 @@ if [ "$MODE" != "info" ]; then
>                 echo "Creating per-file info files..."
>                 echo -n "" >${MERGED_INFO}.info
>                 for i in $RESULTS/*.tar.gz; do
> -                       TITLE=$(basename $i)
> -                       TITLE=$(basename $TITLE .tar.gz)
> +                       TITLE=$(basename "$i" .tar.gz)
>
>                         echo "Adding results from $i..."
>                         tar xf $i
> @@ -155,8 +154,7 @@ if [ "$MODE" != "info" ]; then
>
>                 TITLE=${MERGED_INFO}
>         else
> -               TITLE=$(basename $RESULTS)
> -               TITLE=$(basename $TITLE .tar.gz)
> +               TITLE=$(basename "$RESULTS" .tar.gz)
>
>                 echo "Adding results from $RESULTS..."
>                 tar xf $RESULTS
> @@ -177,8 +175,7 @@ else
>                 echo "Copying $RESULTS to $DEST_DIR..."
>                 cp $RESULTS .
>
> -               TITLE=$(basename $RESULTS)
> -               TITLE=$(basename $TITLE .info)
> +               TITLE=$(basename "$RESULTS" .info)
>         fi
>  fi
>
> diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
> index 240a7eb5..ea999a45 100755
> --- a/tests/generate_testlist.sh
> +++ b/tests/generate_testlist.sh
> @@ -15,4 +15,4 @@ while [ $# -gt 0 ] ; do
>         shift
>  done
>
> -printf "\nEND TESTLIST" >> $OUTPUT
> +printf "\nEND TESTLIST\n" >> $OUTPUT
> --
> 2.37.2
>
>

--0000000000004f209d05e670b65a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It appears that Patchwork is not picking up the second pat=
ch in revision 2:<div><a href=3D"https://patchwork.freedesktop.org/series/1=
07314/#rev2">https://patchwork.freedesktop.org/series/107314/#rev2</a><br><=
/div><div><br></div><div>Is there a way I can manually add the second patch=
?</div><div><br></div><div>Thank you,</div><div>Jake Freeland</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Aug 17, 2022 at 9:23 AM Jake Freeland &lt;<a href=3D"mailto:jake@technology=
friends.net">jake@technologyfriends.net</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0scripts/code_cov_gen_report | 9 +++------<br>
=C2=A0tests/generate_testlist.sh=C2=A0 | 2 +-<br>
=C2=A02 files changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report<br>
index ffc8142e..b0696c51 100755<br>
--- a/scripts/code_cov_gen_report<br>
+++ b/scripts/code_cov_gen_report<br>
@@ -138,8 +138,7 @@ if [ &quot;$MODE&quot; !=3D &quot;info&quot; ]; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Creating=
 per-file info files...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -n &quot;&quot=
; &gt;${MERGED_INFO}.info<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in $RESULTS/*=
.tar.gz; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TITLE=3D$(basename $i)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TITLE=3D$(basename $TITLE .tar.gz)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TITLE=3D$(basename &quot;$i&quot; .tar.gz)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;Adding results from $i...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tar xf $i<br>
@@ -155,8 +154,7 @@ if [ &quot;$MODE&quot; !=3D &quot;info&quot; ]; then<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TITLE=3D${MERGED_IN=
FO}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename =
$RESULTS)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename =
$TITLE .tar.gz)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename =
&quot;$RESULTS&quot; .tar.gz)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Adding r=
esults from $RESULTS...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar xf $RESULTS<br>
@@ -177,8 +175,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Copying =
$RESULTS to $DEST_DIR...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $RESULTS .<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename =
$RESULTS)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename =
$TITLE .info)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TITLE=3D$(basename =
&quot;$RESULTS&quot; .info)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0fi<br>
<br>
diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh<br>
index 240a7eb5..ea999a45 100755<br>
--- a/tests/generate_testlist.sh<br>
+++ b/tests/generate_testlist.sh<br>
@@ -15,4 +15,4 @@ while [ $# -gt 0 ] ; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
=C2=A0done<br>
<br>
-printf &quot;\nEND TESTLIST&quot; &gt;&gt; $OUTPUT<br>
+printf &quot;\nEND TESTLIST\n&quot; &gt;&gt; $OUTPUT<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div>

--0000000000004f209d05e670b65a--
