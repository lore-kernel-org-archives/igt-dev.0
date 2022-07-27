Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D053711BF95
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 16:27:20 +0000 (UTC)
From: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Vudum, Lakshminarayana"
 <lakshminarayana.vudum@intel.com>
Date: Wed, 27 Jul 2022 16:27:17 +0000
Message-ID: <DM5PR12MB1897C8BB3ECA1590DED5608381979@DM5PR12MB1897.namprd12.prod.outlook.com>
References: <20220721003922.3679-1-vitaly.prosyak@amd.com>
 <c74dde7f-c50b-06a1-ac4e-8615d3ae428f@amd.com>
 <DM4PR11MB62138CF424E5F9EF4B03F51CEC959@DM4PR11MB6213.namprd11.prod.outlook.com>
 <DM5PR12MB1897E27D428388B696C4407D81979@DM5PR12MB1897.namprd12.prod.outlook.com>
 <aaceb82a-1465-d1c0-b8bd-73a5d1d99a84@amd.com>
In-Reply-To: <aaceb82a-1465-d1c0-b8bd-73a5d1d99a84@amd.com>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB1897C8BB3ECA1590DED5608381979DM5PR12MB1897namp_"
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

--_000_DM5PR12MB1897C8BB3ECA1590DED5608381979DM5PR12MB1897namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks a lot, Rodrigo!

I am preparing more and more patches.

Vitaly
________________________________
From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
Sent: Wednesday, July 27, 2022 12:47 PM
To: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Vudum, Lakshminarayana <laksh=
minarayana.vudum@intel.com>
Cc: Olsak, Marek <Marek.Olsak@amd.com>; Koenig, Christian <Christian.Koenig=
@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; igt-dev@lists.fr=
eedesktop.org <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources

Thanks Lakshmi for re-report.

Vitaly,
I merged your changes in the upstream, see:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commits/master

Thanks
Siqueira

On 2022-07-26 23:14, Prosyak, Vitaly wrote:
> [AMD Official Use Only - General]
>
>
> Hi guys
>
> What is wrong with the following patches:
> https://patchwork.freedesktop.org/series/106558/
> <https://patchwork.freedesktop.org/series/106558/>
>
> Thanks in advance
>
> Vitaly
> ------------------------------------------------------------------------
> *From:* Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> *Sent:* Monday, July 25, 2022 12:26 AM
> *To:* Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> *Cc:* Olsak, Marek <Marek.Olsak@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; igt-dev@lists.freedesktop.org
> <igt-dev@lists.freedesktop.org>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> *Subject:* RE: [PATCH 1/7] lib/amdgpu: increase number of resources
> Re-reported.
>
> -----Original Message-----
> From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
> Sent: Friday, July 22, 2022 1:26 PM
> To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Cc: marek.olsak@amd.com; christian.koenig@amd.com;
> alexander.deucher@amd.com; igt-dev@lists.freedesktop.org;
> vitaly.prosyak@amd.com
> Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources
>
> Hi Lakshmi,
>
> I think we have a false positive result for this patchset. Could you
> trigger the CI again?
>
> Btw, this is the patchwork link:
>
> https://patchwork.freedesktop.org/series/106558/
> <https://patchwork.freedesktop.org/series/106558/>>
> Thanks
> Siqueira
>
> On 2022-07-20 20:39, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Add arrays of bo's for VRAM and GTT.
>> Eviction test uses 4 bo resources.
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>   lib/amdgpu/amd_ip_blocks.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>> index cb7d14747..c16ad1794 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -58,11 +58,13 @@ struct amdgpu_ring_context {
>>
>>        amdgpu_bo_handle bo;
>>        amdgpu_bo_handle bo2;
>> +     amdgpu_bo_handle boa_vram[2];
>> +     amdgpu_bo_handle boa_gtt[2];
>>
>>        amdgpu_context_handle context_handle;
>>        struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of
>> amdgpu_query_hw_ip_info */
>>
>> -     amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
>> +     amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
>>        amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
>>        amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
>>
>


--_000_DM5PR12MB1897C8BB3ECA1590DED5608381979DM5PR12MB1897namp_
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
Thanks a lot, Rodrigo!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am preparing more and more patches.<br>
</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Siqueira, Rodrigo &lt=
;Rodrigo.Siqueira@amd.com&gt;<br>
<b>Sent:</b> Wednesday, July 27, 2022 12:47 PM<br>
<b>To:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Vudum, Lakshmina=
rayana &lt;lakshminarayana.vudum@intel.com&gt;<br>
<b>Cc:</b> Olsak, Marek &lt;Marek.Olsak@amd.com&gt;; Koenig, Christian &lt;=
Christian.Koenig@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.=
com&gt;; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt=
;<br>
<b>Subject:</b> Re: [PATCH 1/7] lib/amdgpu: increase number of resources</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Thanks Lakshmi for re-report.<br>
<br>
Vitaly,<br>
I merged your changes in the upstream, see:<br>
<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commits/maste=
r">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commits/master</a><br=
>
<br>
Thanks<br>
Siqueira<br>
<br>
On 2022-07-26 23:14, Prosyak, Vitaly wrote:<br>
&gt; [AMD Official Use Only - General]<br>
&gt; <br>
&gt; <br>
&gt; Hi guys<br>
&gt; <br>
&gt; What is wrong with the following patches:<br>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/106558/">https://p=
atchwork.freedesktop.org/series/106558/</a>
<br>
&gt; &lt;<a href=3D"https://patchwork.freedesktop.org/series/106558/">https=
://patchwork.freedesktop.org/series/106558/</a>&gt;<br>
&gt; <br>
&gt; Thanks in advance<br>
&gt; <br>
&gt; Vitaly<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Vudum, Lakshminarayana &lt;lakshminarayana.vudum@intel.com&gt;=
<br>
&gt; *Sent:* Monday, July 25, 2022 12:26 AM<br>
&gt; *To:* Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;<br>
&gt; *Cc:* Olsak, Marek &lt;Marek.Olsak@amd.com&gt;; Koenig, Christian <br>
&gt; &lt;Christian.Koenig@amd.com&gt;; Deucher, Alexander <br>
&gt; &lt;Alexander.Deucher@amd.com&gt;; igt-dev@lists.freedesktop.org <br>
&gt; &lt;igt-dev@lists.freedesktop.org&gt;; Prosyak, Vitaly &lt;Vitaly.Pros=
yak@amd.com&gt;<br>
&gt; *Subject:* RE: [PATCH 1/7] lib/amdgpu: increase number of resources<br=
>
&gt; Re-reported.<br>
&gt; <br>
&gt; -----Original Message-----<br>
&gt; From: Rodrigo Siqueira Jordao &lt;Rodrigo.Siqueira@amd.com&gt;<br>
&gt; Sent: Friday, July 22, 2022 1:26 PM<br>
&gt; To: Vudum, Lakshminarayana &lt;lakshminarayana.vudum@intel.com&gt;<br>
&gt; Cc: marek.olsak@amd.com; christian.koenig@amd.com; <br>
&gt; alexander.deucher@amd.com; igt-dev@lists.freedesktop.org; <br>
&gt; vitaly.prosyak@amd.com<br>
&gt; Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources<br>
&gt; <br>
&gt; Hi Lakshmi,<br>
&gt; <br>
&gt; I think we have a false positive result for this patchset. Could you <=
br>
&gt; trigger the CI again?<br>
&gt; <br>
&gt; Btw, this is the patchwork link:<br>
&gt; <br>
&gt; <a href=3D"https://patchwork.freedesktop.org/series/106558/">https://p=
atchwork.freedesktop.org/series/106558/</a>
<br>
&gt; &lt;<a href=3D"https://patchwork.freedesktop.org/series/106558/">https=
://patchwork.freedesktop.org/series/106558/</a>&gt;&gt;
<br>
&gt; Thanks<br>
&gt; Siqueira<br>
&gt; <br>
&gt; On 2022-07-20 20:39, vitaly.prosyak@amd.com wrote:<br>
&gt;&gt; From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt;&gt; <br>
&gt;&gt; Add arrays of bo's for VRAM and GTT.<br>
&gt;&gt; Eviction test uses 4 bo resources.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; lib/amdgpu/amd_ip_blocks.h | 4 +++-<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks=
.h <br>
&gt;&gt; index cb7d14747..c16ad1794 100644<br>
&gt;&gt; --- a/lib/amdgpu/amd_ip_blocks.h<br>
&gt;&gt; +++ b/lib/amdgpu/amd_ip_blocks.h<br>
&gt;&gt; @@ -58,11 +58,13 @@ struct amdgpu_ring_context {<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle bo;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle bo2;<br=
>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle boa_vram[2];<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle boa_gtt[2];<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_context_handle co=
ntext_handle;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_info_h=
w_ip hw_ip_info;&nbsp; /* result of <br>
&gt;&gt; amdgpu_query_hw_ip_info */<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle resources[2]; /* amdgpu=
_bo_alloc_and_map */<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle resources[4]; /* amdgpu=
_bo_alloc_and_map */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_va_handle va_hand=
le;&nbsp;&nbsp;&nbsp; /* amdgpu_bo_alloc_and_map */<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_va_handle va_hand=
le2;&nbsp;&nbsp; /* amdgpu_bo_alloc_and_map */<br>
&gt;&gt;&nbsp;&nbsp; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM5PR12MB1897C8BB3ECA1590DED5608381979DM5PR12MB1897namp_--
