Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7E10EAE3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 11:04:46 +0000 (UTC)
From: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 8 Jul 2022 11:04:40 +0000
Message-ID: <DM5PR12MB1897AFC10392B1F336CDAC9D81829@DM5PR12MB1897.namprd12.prod.outlook.com>
References: <20220707182811.3805-1-vitaly.prosyak@amd.com>
 <f1c609cc-4453-13e4-fa78-f1ca5cbd4354@amd.com>
In-Reply-To: <f1c609cc-4453-13e4-fa78-f1ca5cbd4354@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB1897AFC10392B1F336CDAC9D81829DM5PR12MB1897namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/7] lib/amdgpu: increase number of resources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM5PR12MB1897AFC10392B1F336CDAC9D81829DM5PR12MB1897namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks a lot Christian

Vitaly
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Friday, July 8, 2022 3:20 AM
To: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; igt-dev@lists.freedesktop.org=
 <igt-dev@lists.freedesktop.org>
Cc: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Olsak, Marek <Marek.Olsak=
@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources

Am 07.07.22 um 20:28 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add arrays of bo's for VRAM and GTT.
> Eviction test uses 4 bo resources.
>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Of hand that looks totally clean and well organized.

Feel free to add an Acked-by: Christian K=F6nig <christian.koenig@amd.com>
to the whole series.

Regards,
Christian.

> ---
>   lib/amdgpu/amd_ip_blocks.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index cb7d1474..c16ad179 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -58,11 +58,13 @@ struct amdgpu_ring_context {
>
>        amdgpu_bo_handle bo;
>        amdgpu_bo_handle bo2;
> +     amdgpu_bo_handle boa_vram[2];
> +     amdgpu_bo_handle boa_gtt[2];
>
>        amdgpu_context_handle context_handle;
>        struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of amdgpu_quer=
y_hw_ip_info */
>
> -     amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
> +     amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
>        amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
>        amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
>


--_000_DM5PR12MB1897AFC10392B1F336CDAC9D81829DM5PR12MB1897namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks a lot Christian</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Vitaly<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Friday, July 8, 2022 3:20 AM<br>
<b>To:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; igt-dev@lists.fr=
eedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Olsak, Marek=
 &lt;Marek.Olsak@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.=
com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/7] lib/amdgpu: increase number of resources</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 07.07.22 um 20:28 schrieb vitaly.prosyak@amd.co=
m:<br>
&gt; From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt;<br>
&gt; Add arrays of bo's for VRAM and GTT.<br>
&gt; Eviction test uses 4 bo resources.<br>
&gt;<br>
&gt; Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
<br>
Of hand that looks totally clean and well organized.<br>
<br>
Feel free to add an Acked-by: Christian K=F6nig &lt;christian.koenig@amd.co=
m&gt; <br>
to the whole series.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; lib/amdgpu/amd_ip_blocks.h | 4 +++-<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h<b=
r>
&gt; index cb7d1474..c16ad179 100644<br>
&gt; --- a/lib/amdgpu/amd_ip_blocks.h<br>
&gt; +++ b/lib/amdgpu/amd_ip_blocks.h<br>
&gt; @@ -58,11 +58,13 @@ struct amdgpu_ring_context {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle bo;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle bo2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle boa_vram[2];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle boa_gtt[2];<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_context_handle contex=
t_handle;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_hw_ip=
 hw_ip_info;&nbsp; /* result of amdgpu_query_hw_ip_info */<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle resources[2]; /* amdgpu_bo_=
alloc_and_map */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle resources[4]; /* amdgpu_bo_=
alloc_and_map */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_va_handle va_handle;&=
nbsp;&nbsp;&nbsp; /* amdgpu_bo_alloc_and_map */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_va_handle va_handle2;=
&nbsp;&nbsp; /* amdgpu_bo_alloc_and_map */<br>
&gt;&nbsp;&nbsp; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM5PR12MB1897AFC10392B1F336CDAC9D81829DM5PR12MB1897namp_--
