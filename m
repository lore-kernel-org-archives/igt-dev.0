Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2010E178
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 15:08:53 +0000 (UTC)
From: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 6 Apr 2022 15:08:49 +0000
Message-ID: <BN9PR12MB5145930A9D0DEAFB3458CECF8DE79@BN9PR12MB5145.namprd12.prod.outlook.com>
References: <20220406145213.418625-1-dingchen.zhang@amd.com>
 <Yk2qV0483e4wLzU1@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yk2qV0483e4wLzU1@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB5145930A9D0DEAFB3458CECF8DE79BN9PR12MB5145namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] lib/igt_amd: return negative if PSR state
 debugfs open fails
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

--_000_BN9PR12MB5145930A9D0DEAFB3458CECF8DE79BN9PR12MB5145namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Thanks Petri, updated.
________________________________
From: Petri Latvala <petri.latvala@intel.com>
Sent: Wednesday, April 6, 2022 10:57 AM
To: Zhang, Dingchen (David) <Dingchen.Zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Subject: Re: [igt-dev] [PATCH] lib/igt_amd: return negative if PSR state de=
bugfs open fails

On Wed, Apr 06, 2022 at 10:52:13AM -0400, David Zhang wrote:
> [why & how]
> The PSR state read helper should return an integer which is not
> the same as PSR state enumeration item for the case of debugfs
> interface opening fail. Currently it return false which is casted
> to 0 that is the same as PSR_STATE0, this is incorrect.
>
> Instead of returning 0, a negative (e.g. -1) value is returned
> when debugfs interface of PSR state opening fails. And adding the
> check of such negative value in amd_psr test case as well.
>
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
>
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> Rivewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
  ^^^
  typo


--
Petri Latvala



> ---
>  lib/igt_amd.c          | 2 +-
>  tests/amdgpu/amd_psr.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 888da44a..664602da 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1064,7 +1064,7 @@ int igt_amd_read_psr_state(int drm_fd, char *connec=
tor_name)
>        fd =3D igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY)=
;
>        if (fd < 0) {
>                igt_info("Couldn't open connector %s debugfs directory\n",=
 connector_name);
> -             return false;
> +             return -1;
>        }
>
>        ret =3D igt_debugfs_simple_read(fd, DEBUGFS_EDP_PSR_STATE, buf, si=
zeof(buf));
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index b9d8a53b..d21d41e3 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -179,6 +179,7 @@ static void run_check_psr(data_t *data, bool test_nul=
l_crtc) {
>                        continue;
>
>                psr_state =3D  igt_amd_read_psr_state(data->fd, output->na=
me);
> +             igt_fail_on_f(psr_state < 0, "Open PSR state debugfs failed=
\n");
>                igt_fail_on_f(psr_state < 1, "PSR was not enabled for conn=
ector %s\n", output->name);
>                igt_fail_on_f(psr_state =3D=3D 0xff, "PSR is invalid for c=
onnector %s\n", output->name);
>                igt_fail_on_f(psr_state !=3D 5, "PSR state is expected to =
be at 5 on a "
> @@ -295,6 +296,7 @@ static void run_check_psr_su_mpo(data_t *data)
>                /* check PSR state */
>                if (i > PSR_SETTLE_DELAY * frame_rate) {
>                        psr_state =3D igt_amd_read_psr_state(data->fd, dat=
a->output->name);
> +                     igt_fail_on_f(psr_state < 0, "Open PSR state debugf=
s failed\n");
>                        igt_fail_on_f(psr_state =3D=3D PSR_STATE0,
>                                "PSR was not enabled for connector %s\n", =
data->output->name);
>                        igt_fail_on_f(psr_state =3D=3D PSR_STATE_INVALID,
> --
> 2.25.1
>

--_000_BN9PR12MB5145930A9D0DEAFB3458CECF8DE79BN9PR12MB5145namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks Petri, updated.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Petri Latvala &lt;pet=
ri.latvala@intel.com&gt;<br>
<b>Sent:</b> Wednesday, April 6, 2022 10:57 AM<br>
<b>To:</b> Zhang, Dingchen (David) &lt;Dingchen.Zhang@amd.com&gt;<br>
<b>Cc:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> Re: [igt-dev] [PATCH] lib/igt_amd: return negative if PSR s=
tate debugfs open fails</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Apr 06, 2022 at 10:52:13AM -0400, David Zh=
ang wrote:<br>
&gt; [why &amp; how]<br>
&gt; The PSR state read helper should return an integer which is not<br>
&gt; the same as PSR state enumeration item for the case of debugfs<br>
&gt; interface opening fail. Currently it return false which is casted<br>
&gt; to 0 that is the same as PSR_STATE0, this is incorrect.<br>
&gt; <br>
&gt; Instead of returning 0, a negative (e.g. -1) value is returned<br>
&gt; when debugfs interface of PSR state opening fails. And adding the<br>
&gt; check of such negative value in amd_psr test case as well.<br>
&gt; <br>
&gt; Cc: Rodrigo Siqueira &lt;rodrigo.siqueira@amd.com&gt;<br>
&gt; Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
&gt; Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
&gt; Cc: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
&gt; Cc: Wayne Lin &lt;wayne.lin@amd.com&gt;<br>
&gt; <br>
&gt; Signed-off-by: David Zhang &lt;dingchen.zhang@amd.com&gt;<br>
&gt; Rivewed-by: Rodrigo Siqueira &lt;rodrigo.siqueira@amd.com&gt;<br>
&nbsp; ^^^<br>
&nbsp; typo<br>
<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp; lib/igt_amd.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | 2 +-<br>
&gt;&nbsp; tests/amdgpu/amd_psr.c | 2 ++<br>
&gt;&nbsp; 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/lib/igt_amd.c b/lib/igt_amd.c<br>
&gt; index 888da44a..664602da 100644<br>
&gt; --- a/lib/igt_amd.c<br>
&gt; +++ b/lib/igt_amd.c<br>
&gt; @@ -1064,7 +1064,7 @@ int igt_amd_read_psr_state(int drm_fd, char *con=
nector_name)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D igt_debugfs_connector=
_dir(drm_fd, connector_name, O_RDONLY);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &lt; 0) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_info(&quot;Couldn't open connector %s debugfs direc=
tory\n&quot;, connector_name);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return -1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_debugfs_simple_r=
ead(fd, DEBUGFS_EDP_PSR_STATE, buf, sizeof(buf));<br>
&gt; diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c<br>
&gt; index b9d8a53b..d21d41e3 100644<br>
&gt; --- a/tests/amdgpu/amd_psr.c<br>
&gt; +++ b/tests/amdgpu/amd_psr.c<br>
&gt; @@ -179,6 +179,7 @@ static void run_check_psr(data_t *data, bool test_=
null_crtc) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; psr_state =3D&nbsp; igt_amd_read_psr_state(data-&gt;fd,=
 output-&gt;name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_fail_on_f(psr_state &lt; 0, &quot;Open PSR state debugfs failed\n&q=
uot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_fail_on_f(psr_state &lt; 1, &quot;PSR was not enabl=
ed for connector %s\n&quot;, output-&gt;name);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_fail_on_f(psr_state =3D=3D 0xff, &quot;PSR is inval=
id for connector %s\n&quot;, output-&gt;name);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_fail_on_f(psr_state !=3D 5, &quot;PSR state is expe=
cted to be at 5 on a &quot;<br>
&gt; @@ -295,6 +296,7 @@ static void run_check_psr_su_mpo(data_t *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* check PSR state */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (i &gt; PSR_SETTLE_DELAY * frame_rate) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psr_sta=
te =3D igt_amd_read_psr_state(data-&gt;fd, data-&gt;output-&gt;name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fail_on_f(psr_state=
 &lt; 0, &quot;Open PSR state debugfs failed\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fai=
l_on_f(psr_state =3D=3D PSR_STATE0,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PSR was not enabled for conn=
ector %s\n&quot;, data-&gt;output-&gt;name);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fai=
l_on_f(psr_state =3D=3D PSR_STATE_INVALID,<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN9PR12MB5145930A9D0DEAFB3458CECF8DE79BN9PR12MB5145namp_--
