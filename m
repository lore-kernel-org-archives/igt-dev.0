Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2291489E86
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 13:47:27 +0000 (UTC)
Received: by mail-yw1-xc2b.google.com with SMTP id v127so1971527ywe.13
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 06:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <16366e407a6f744610a14d208b7ba26c64f7411c.camel@intel.com>
In-Reply-To: <16366e407a6f744610a14d208b7ba26c64f7411c.camel@intel.com>
From: Rhys Kidd <rhyskidd@gmail.com>
Date: Thu, 21 Mar 2019 00:47:15 +1100
Message-ID: <CA+iOQUHhEJuvZxcu1NXQ1bNqCrdsiPOaLz82LBDxUa0KESKNqw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner/executor: refactor error handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0901965725=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Ser, Simon" <simon.ser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0901965725==
Content-Type: multipart/alternative; boundary="000000000000ac12cc058486dcbf"

--000000000000ac12cc058486dcbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2019 at 8:34 PM Ser, Simon <simon.ser@intel.com> wrote:

> * Refactor to use goto error handling
> * Make execute_test_process noreturn to remove uninitialized variable
>   warning
> * Check fork() return value
>
> Signed-off-by: Simon Ser <simon.ser@intel.com>
> ---
>  runner/executor.c | 63 ++++++++++++++++++++++++-----------------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index d535c276..6bf7ce1c 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -753,9 +753,10 @@ static int monitor_output(pid_t child,
>         return killed;
>  }
>
> -static void execute_test_process(int outfd, int errfd,
> -                                struct settings *settings,
> -                                struct job_list_entry *entry)
> +static void __attribute__((noreturn))
> +execute_test_process(int outfd, int errfd,
> +                    struct settings *settings,
> +                    struct job_list_entry *entry)
>  {
>         char *argv[4] =3D {};
>         size_t rootlen;
> @@ -884,9 +885,9 @@ static int execute_next_entry(struct execute_state
> *state,
>         }
>
>         if (!open_output_files(dirfd, outputs, true)) {
> -               close(dirfd);
>                 fprintf(stderr, "Error opening output files\n");
> -               return -1;
> +               result =3D -1;
> +               goto out_dirfd;
>         }
>
>         if (settings->sync) {
> @@ -895,14 +896,9 @@ static int execute_next_entry(struct execute_state
> *state,
>         }
>
>         if (pipe(outpipe) || pipe(errpipe)) {
> -               close_outputs(outputs);
> -               close(dirfd);
> -               close(outpipe[0]);
> -               close(outpipe[1]);
> -               close(errpipe[0]);
> -               close(errpipe[1]);
>                 fprintf(stderr, "Error creating pipes: %s\n",
> strerror(errno));
> -               return -1;
> +               result =3D -1;
> +               goto out_pipe;
>         }
>
>         if ((kmsgfd =3D open("/dev/kmsg", O_RDONLY | O_CLOEXEC)) < 0) {
> @@ -923,14 +919,8 @@ static int execute_next_entry(struct execute_state
> *state,
>         if (sigfd < 0) {
>                 /* TODO: Handle better */
>                 fprintf(stderr, "Cannot monitor child process with
> signalfd\n");
> -               close(outpipe[0]);
> -               close(errpipe[0]);
> -               close(outpipe[1]);
> -               close(errpipe[1]);
> -               close(kmsgfd);
> -               close_outputs(outputs);
> -               close(dirfd);
> -               return -1;
> +               result =3D -1;
> +               goto out_kmsgfd;
>         }
>
>         if (settings->log_level >=3D LOG_LEVEL_NORMAL) {
> @@ -951,19 +941,15 @@ static int execute_next_entry(struct
> execute_state *state,
>          * Flush outputs before forking so our (buffered) output won't
>          * end up in the test outputs.
>          */
> -
>         fflush(stdout);
>         fflush(stderr);
>
> -       if ((child =3D fork())) {
> -               int outfd =3D outpipe[0];
> -               int errfd =3D errpipe[0];
> -               close(outpipe[1]);
> -               close(errpipe[1]);
> -
> -               result =3D monitor_output(child, outfd, errfd, kmsgfd,
> sigfd,
> -                                       outputs, time_spent, settings);
> -       } else {
> +       child =3D fork();
> +       if (child < 0) {
> +               fprintf(stderr, "Failed to fork()");
> +               result =3D -1;
> +               goto out_kmsgfd;
> +       } else if (child =3D=3D 0) {
>                 int outfd =3D outpipe[1];
>                 int errfd =3D errpipe[1];
>                 close(outpipe[0]);
> @@ -974,13 +960,28 @@ static int execute_next_entry(struct
> execute_state *state,
>                 setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
>
>                 execute_test_process(outfd, errfd, settings, entry);
> +               /* unreachable */
>         }
>
> -       /* TODO: Refactor this whole function to use onion teardown */
> +       int outfd =3D outpipe[0];
> +       int errfd =3D errpipe[0];
>         close(outpipe[1]);
>         close(errpipe[1]);
> +       outpipe[1] =3D errpipe[1] =3D -1;
> +
> +       result =3D monitor_output(child, outfd, errfd, kmsgfd, sigfd,
> +                               outputs, time_spent, settings);
> +
> +out_kmsgfd:
>         close(kmsgfd);
> +out_pipe:
> +       close_outputs(outputs);
> +       close(outpipe[0]);
> +       close(outpipe[1]);
> +       close(errpipe[0]);
> +       close(errpipe[1]);
>         close_outputs(outputs);
> +out_dirfd:
>         close(dirfd);
>
>         return result;
> --
> 2.21.0
>
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.


Hello Simon,

Welcome to igt.

The above corporate boilerplate text should be removed from emails to
public mailing lists, and definitely from emails with code that you are
distributing under the MIT License.

I expect that you didn=E2=80=99t really intend for that paragraph to apply =
to your
patch - but in particular the restrictions on distribution by others is
problematic.

https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.m=
d

You can read further there on the Developer=E2=80=99s Certificate of Origin=
 that
igt adopts and what it entails, which I understand is what you intended to
use instead of this boilerplate.

Other Intel contributors might be able to assist you with whatever internal
corporate proxy changes you need to make.


> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--000000000000ac12cc058486dcbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Mar 20, 2019 at 8:34 PM Ser, Simon &lt;<a href=3D"mailto:simon=
.ser@intel.com">simon.ser@intel.com</a>&gt; wrote:<br></div><div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">* Refactor to use goto erro=
r handling<br>
* Make execute_test_process noreturn to remove uninitialized variable<br>
=C2=A0 warning<br>
* Check fork() return value<br>
<br>
Signed-off-by: Simon Ser &lt;<a href=3D"mailto:simon.ser@intel.com" target=
=3D"_blank">simon.ser@intel.com</a>&gt;<br>
---<br>
=C2=A0runner/executor.c | 63 ++++++++++++++++++++++++----------------------=
-<br>
=C2=A01 file changed, 32 insertions(+), 31 deletions(-)<br>
<br>
diff --git a/runner/executor.c b/runner/executor.c<br>
index d535c276..6bf7ce1c 100644<br>
--- a/runner/executor.c<br>
+++ b/runner/executor.c<br>
@@ -753,9 +753,10 @@ static int monitor_output(pid_t child,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return killed;<br>
=C2=A0}<br>
<br>
-static void execute_test_process(int outfd, int errfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct settings *settings,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct job_list_entry *entry)<br>
+static void __attribute__((noreturn))<br>
+execute_test_process(int outfd, int errfd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct settings *settings,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct job_list_entry *entry)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *argv[4] =3D {};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t rootlen;<br>
@@ -884,9 +885,9 @@ static int execute_next_entry(struct execute_state<br>
*state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!open_output_files(dirfd, outputs, true)) {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(dirfd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Error opening output files\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_dirfd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (settings-&gt;sync) {<br>
@@ -895,14 +896,9 @@ static int execute_next_entry(struct execute_state<br>
*state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pipe(outpipe) || pipe(errpipe)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_outputs(outpu=
ts);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(dirfd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[0]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[1]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[0]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[1]);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Error creating pipes: %s\n&quot;,<br>
strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_pipe;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((kmsgfd =3D open(&quot;/dev/kmsg&quot;, O_R=
DONLY | O_CLOEXEC)) &lt; 0) {<br>
@@ -923,14 +919,8 @@ static int execute_next_entry(struct execute_state<br>
*state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sigfd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO: Handle bet=
ter */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Cannot monitor child process with<br>
signalfd\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[0]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[0]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[1]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[1]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(kmsgfd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_outputs(outpu=
ts);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(dirfd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_kmsgfd;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (settings-&gt;log_level &gt;=3D LOG_LEVEL_NO=
RMAL) {<br>
@@ -951,19 +941,15 @@ static int execute_next_entry(struct<br>
execute_state *state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Flush outputs before forking so our (bu=
ffered) output won&#39;t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* end up in the test outputs.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fflush(stdout);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fflush(stderr);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((child =3D fork())) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int outfd =3D outpi=
pe[0];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int errfd =3D errpi=
pe[0];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[1]);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[1]);<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D monitor_=
output(child, outfd, errfd, kmsgfd,<br>
sigfd,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outputs, =
time_spent, settings);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0child =3D fork();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (child &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &qu=
ot;Failed to fork()&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_kmsgfd;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (child =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int outfd =3D outpi=
pe[1];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int errfd =3D errpi=
pe[1];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(outpipe[0]);<=
br>
@@ -974,13 +960,28 @@ static int execute_next_entry(struct<br>
execute_state *state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setenv(&quot;IGT_SE=
NTINEL_ON_STDERR&quot;, &quot;1&quot;, 1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execute_test_proces=
s(outfd, errfd, settings, entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* unreachable */<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: Refactor this whole function to use on=
ion teardown */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int outfd =3D outpipe[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int errfd =3D errpipe[0];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(outpipe[1]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(errpipe[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0outpipe[1] =3D errpipe[1] =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D monitor_output(child, outfd, errfd, =
kmsgfd, sigfd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outputs, time_spent, settings);<br>
+<br>
+out_kmsgfd:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(kmsgfd);<br>
+out_pipe:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close_outputs(outputs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close(outpipe[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close(errpipe[1]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close_outputs(outputs);<br>
+out_dirfd:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(dirfd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return result;<br>
-- <br>
2.21.0<br>
<br>
---------------------------------------------------------------------<br>
Intel Finland Oy<br>
Registered Address: PL 281, 00181 Helsinki <br>
Business Identity Code: 0357606 - 4 <br>
Domiciled in Helsinki <br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Hello Simon,</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Welcome to igt.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">The above corporate boilerplate text should be remo=
ved from emails to public mailing lists, and definitely from emails with co=
de that you are distributing under the MIT License.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I expect that you didn=E2=80=99t really intend =
for that paragraph to apply to your patch - but in particular the restricti=
ons on distribution by others is problematic.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div><a href=3D"https://gitlab.freedesktop.org/drm/ig=
t-gpu-tools/blob/master/CONTRIBUTING.md">https://gitlab.freedesktop.org/drm=
/igt-gpu-tools/blob/master/CONTRIBUTING.md</a></div><br></div><div dir=3D"a=
uto">You can read further there on the Developer=E2=80=99s Certificate of O=
rigin that igt adopts and what it entails, which I understand is what you i=
ntended to use instead of this boilerplate.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Other Intel contributors might be able to assist you wi=
th whatever internal corporate proxy changes you need to make.</div><div di=
r=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
_______________________________________________<br>
igt-dev mailing list<br>
<a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blank">igt-dev@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/igt-dev" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/igt-dev</a></blockquote></div></div>

--000000000000ac12cc058486dcbf--

--===============0901965725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0901965725==--
