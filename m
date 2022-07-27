Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC54C063A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 03:14:47 +0000 (UTC)
From: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>
Date: Wed, 27 Jul 2022 03:14:44 +0000
Message-ID: <DM5PR12MB1897E27D428388B696C4407D81979@DM5PR12MB1897.namprd12.prod.outlook.com>
References: <20220721003922.3679-1-vitaly.prosyak@amd.com>
 <c74dde7f-c50b-06a1-ac4e-8615d3ae428f@amd.com>
 <DM4PR11MB62138CF424E5F9EF4B03F51CEC959@DM4PR11MB6213.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB62138CF424E5F9EF4B03F51CEC959@DM4PR11MB6213.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB1897E27D428388B696C4407D81979DM5PR12MB1897namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/7] lib/amdgpu: increase number of resources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_DM5PR12MB1897E27D428388B696C4407D81979DM5PR12MB1897namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi guys

What is wrong with the following patches:
https://patchwork.freedesktop.org/series/106558/

Thanks in advance

Vitaly
________________________________
From: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
Sent: Monday, July 25, 2022 12:26 AM
To: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Cc: Olsak, Marek <Marek.Olsak@amd.com>; Koenig, Christian <Christian.Koenig=
@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; igt-dev@lists.fr=
eedesktop.org <igt-dev@lists.freedesktop.org>; Prosyak, Vitaly <Vitaly.Pros=
yak@amd.com>
Subject: RE: [PATCH 1/7] lib/amdgpu: increase number of resources

Re-reported.

-----Original Message-----
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Sent: Friday, July 22, 2022 1:26 PM
To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
Cc: marek.olsak@amd.com; christian.koenig@amd.com; alexander.deucher@amd.co=
m; igt-dev@lists.freedesktop.org; vitaly.prosyak@amd.com
Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources

Hi Lakshmi,

I think we have a false positive result for this patchset. Could you trigge=
r the CI again?

Btw, this is the patchwork link:

    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.freedesktop.org%2Fseries%2F106558%2F&amp;data=3D05%7C01%7Cvitaly.pro=
syak%40amd.com%7C2013b17759ff4fe2b35208da6ded79ab%7C3dd8961fe4884e608e11a82=
d994e183d%7C0%7C0%7C637943163979585011%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3D5DFbASm5WK4emhitwIOMxg%2F1yCPpG6yF6WMoY%2BqqIDg%3D&amp;reserved=3D0

Thanks
Siqueira

On 2022-07-20 20:39, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add arrays of bo's for VRAM and GTT.
> Eviction test uses 4 bo resources.
>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   lib/amdgpu/amd_ip_blocks.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index cb7d14747..c16ad1794 100644
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
>        struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of
> amdgpu_query_hw_ip_info */
>
> -     amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
> +     amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
>        amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
>        amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
>


--_000_DM5PR12MB1897E27D428388B696C4407D81979DM5PR12MB1897namp_
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
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi guys</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
What is wrong with the following patches:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<a href=3D"https://patchwork.freedesktop.org/series/106558/" id=3D"LPlnk811=
281">https://patchwork.freedesktop.org/series/106558/</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks in advance</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vudum, Lakshminarayan=
a &lt;lakshminarayana.vudum@intel.com&gt;<br>
<b>Sent:</b> Monday, July 25, 2022 12:26 AM<br>
<b>To:</b> Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Cc:</b> Olsak, Marek &lt;Marek.Olsak@amd.com&gt;; Koenig, Christian &lt;=
Christian.Koenig@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.=
com&gt;; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt=
;; Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 1/7] lib/amdgpu: increase number of resources</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Re-reported.<br>
<br>
-----Original Message-----<br>
From: Rodrigo Siqueira Jordao &lt;Rodrigo.Siqueira@amd.com&gt; <br>
Sent: Friday, July 22, 2022 1:26 PM<br>
To: Vudum, Lakshminarayana &lt;lakshminarayana.vudum@intel.com&gt;<br>
Cc: marek.olsak@amd.com; christian.koenig@amd.com; alexander.deucher@amd.co=
m; igt-dev@lists.freedesktop.org; vitaly.prosyak@amd.com<br>
Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources<br>
<br>
Hi Lakshmi,<br>
<br>
I think we have a false positive result for this patchset. Could you trigge=
r the CI again?<br>
<br>
Btw, this is the patchwork link:<br>
<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F106558%2F&amp;a=
mp;data=3D05%7C01%7Cvitaly.prosyak%40amd.com%7C2013b17759ff4fe2b35208da6ded=
79ab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943163979585011%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D5DFbASm5WK4emhitwIOMxg%2F1yCPpG6y=
F6WMoY%2BqqIDg%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatchwo=
rk.freedesktop.org%2Fseries%2F106558%2F&amp;amp;data=3D05%7C01%7Cvitaly.pro=
syak%40amd.com%7C2013b17759ff4fe2b35208da6ded79ab%7C3dd8961fe4884e608e11a82=
d994e183d%7C0%7C0%7C637943163979585011%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
amp;sdata=3D5DFbASm5WK4emhitwIOMxg%2F1yCPpG6yF6WMoY%2BqqIDg%3D&amp;amp;rese=
rved=3D0</a><br>
<br>
Thanks<br>
Siqueira<br>
<br>
On 2022-07-20 20:39, vitaly.prosyak@amd.com wrote:<br>
&gt; From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt; <br>
&gt; Add arrays of bo's for VRAM and GTT.<br>
&gt; Eviction test uses 4 bo resources.<br>
&gt; <br>
&gt; Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; lib/amdgpu/amd_ip_blocks.h | 4 +++-<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h <=
br>
&gt; index cb7d14747..c16ad1794 100644<br>
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
 hw_ip_info;&nbsp; /* result of <br>
&gt; amdgpu_query_hw_ip_info */<br>
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

--_000_DM5PR12MB1897E27D428388B696C4407D81979DM5PR12MB1897namp_--
