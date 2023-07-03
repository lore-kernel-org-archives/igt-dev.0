Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF23B10E0E0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 11:15:51 +0000 (UTC)
From: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 3 Jul 2023 11:15:47 +0000
Message-ID: <PH7PR12MB642038A65F94D00495EF6CB78129A@PH7PR12MB6420.namprd12.prod.outlook.com>
References: <20230702012230.385407-1-vitaly.prosyak@amd.com>
 <20230703072534.62ixme6t7xmmzzhv@kamilkon-desk1>
In-Reply-To: <20230703072534.62ixme6t7xmmzzhv@kamilkon-desk1>
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_PH7PR12MB642038A65F94D00495EF6CB78129APH7PR12MB6420namp_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add sync object tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_000_PH7PR12MB642038A65F94D00495EF6CB78129APH7PR12MB6420namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Hi Kamil,
Yes, sure,
I will work on this using your suggestion in the previous email.
Thanks, Vitaly
________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Monday, July 3, 2023 3:39 AM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian <Christian.=
Koenig@amd.com>
Subject: Re: [PATCH] tests/amdgpu: add sync object tests

Hi Vitaly,

On 2023-07-01 at 21:22:30 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Using worker thread to wait on point and then signal point on other threa=
d.
> Another test uses a worker thread to signal point and wait on the main
> thread using amdgpu_cs_syncobj_timeline_wait.
>
> The command consists of two chunks :
> 1. AMDGPU_CHUNK_ID_IB uses GFX_COMPUTE_NOP  or SDMA_NOP.
> 2. The second chunk is AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT
>    or AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL which has the
>    point number .
>
> v1->v2. Fixed style issues - Christian.
>         Fixed formatting issues - Kamil.
>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Acked-by: Christian Koenig <christian.koenig@amd.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Please do not merge this until you address GitLab compilation
issue.

Regards,
Kamil

> ---
>  tests/amdgpu/amd_syncobj.c | 266 +++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build   |   1 +
>  2 files changed, 267 insertions(+)
>  create mode 100644 tests/amdgpu/amd_syncobj.c
>
> diff --git a/tests/amdgpu/amd_syncobj.c b/tests/amdgpu/amd_syncobj.c
> new file mode 100644
> index 000000000..7cab093c9
> --- /dev/null
> +++ b/tests/amdgpu/amd_syncobj.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +
> +#include <pthread.h>
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +
> +#include "igt.h"
> +#include "lib/amdgpu/amd_PM4.h"
> +#include "lib/amdgpu/amd_sdma.h"
> +#include "lib/amdgpu/amd_memory.h"
> +
> +struct syncobj_point {
> +     amdgpu_device_handle device;
> +     uint32_t syncobj_handle;
> +     uint64_t point;
> +};
> +
> +
> +static bool
> +syncobj_timeline_enable(int fd)
> +{
> +     int r;
> +     bool ret =3D false;
> +     uint64_t cap =3D 0;
> +
> +     r =3D drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE, &cap);
> +     if (r || cap =3D=3D 0)
> +             return ret;
> +     ret =3D true;
> +
> +     return ret;
> +}
> +
> +static void
> +syncobj_command_submission_helper(amdgpu_device_handle device_handle,
> +             uint32_t syncobj_handle, bool wait_or_signal, uint64_t poin=
t)
> +{
> +     amdgpu_context_handle context_handle;
> +     amdgpu_bo_handle ib_result_handle;
> +     void *ib_result_cpu;
> +     uint64_t ib_result_mc_address;
> +     struct drm_amdgpu_cs_chunk chunks[2];
> +     struct drm_amdgpu_cs_chunk_data chunk_data;
> +     struct drm_amdgpu_cs_chunk_syncobj syncobj_data;
> +     struct amdgpu_cs_fence fence_status;
> +     amdgpu_bo_list_handle bo_list;
> +     amdgpu_va_handle va_handle;
> +     uint32_t expired;
> +     int i, r;
> +     uint64_t seq_no;
> +     uint32_t *ptr;
> +
> +     r =3D amdgpu_cs_ctx_create(device_handle, &context_handle);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_bo_alloc_and_map(device_handle, 4096, 4096,
> +                                 AMDGPU_GEM_DOMAIN_GTT, 0,
> +                                 &ib_result_handle, &ib_result_cpu,
> +                                 &ib_result_mc_address, &va_handle);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo=
_list);
> +     igt_assert_eq(r, 0);
> +
> +     ptr =3D ib_result_cpu;
> +
> +     for (i =3D 0; i < 16; ++i)
> +             ptr[i] =3D wait_or_signal ? GFX_COMPUTE_NOP : SDMA_NOP;
> +
> +     chunks[0].chunk_id =3D AMDGPU_CHUNK_ID_IB;
> +     chunks[0].length_dw =3D sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
> +     chunks[0].chunk_data =3D (uint64_t)(uintptr_t)&chunk_data;
> +     chunk_data.ib_data._pad =3D 0;
> +     chunk_data.ib_data.va_start =3D ib_result_mc_address;
> +     chunk_data.ib_data.ib_bytes =3D 16 * 4;
> +     chunk_data.ib_data.ip_type =3D wait_or_signal ? AMDGPU_HW_IP_GFX : =
AMDGPU_HW_IP_DMA;
> +     chunk_data.ib_data.ip_instance =3D 0;
> +     chunk_data.ib_data.ring =3D 0;
> +     chunk_data.ib_data.flags =3D 0;
> +
> +     chunks[1].chunk_id =3D wait_or_signal ?
> +             AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT :
> +             AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL;
> +     chunks[1].length_dw =3D sizeof(struct drm_amdgpu_cs_chunk_syncobj) =
/ 4;
> +     chunks[1].chunk_data =3D (uint64_t)(uintptr_t)&syncobj_data;
> +     syncobj_data.handle =3D syncobj_handle;
> +     syncobj_data.point =3D point;
> +     syncobj_data.flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;
> +
> +     r =3D amdgpu_cs_submit_raw(device_handle,
> +                              context_handle,
> +                              bo_list,
> +                              2,
> +                              chunks,
> +                              &seq_no);
> +     igt_assert_eq(r, 0);
> +
> +     memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
> +     fence_status.context =3D context_handle;
> +     fence_status.ip_type =3D wait_or_signal ? AMDGPU_HW_IP_GFX : AMDGPU=
_HW_IP_DMA;
> +     fence_status.ip_instance =3D 0;
> +     fence_status.ring =3D 0;
> +     fence_status.fence =3D seq_no;
> +
> +     r =3D amdgpu_cs_query_fence_status(&fence_status,
> +                     AMDGPU_TIMEOUT_INFINITE, 0, &expired);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D amdgpu_bo_list_destroy(bo_list);
> +     igt_assert_eq(r, 0);
> +
> +     amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
> +                                  ib_result_mc_address, 4096);
> +
> +     r =3D amdgpu_cs_ctx_free(context_handle);
> +     igt_assert_eq(r, 0);
> +}
> +
> +static void *
> +syncobj_wait(void *data)
> +{
> +     struct syncobj_point *sp =3D (struct syncobj_point *)data;
> +
> +     syncobj_command_submission_helper(sp->device, sp->syncobj_handle, t=
rue,
> +                     sp->point);
> +
> +     return (void *)0;
> +}
> +
> +static void *
> +syncobj_signal(void *data)
> +{
> +     struct syncobj_point *sp =3D (struct syncobj_point *)data;
> +
> +     syncobj_command_submission_helper(sp->device, sp->syncobj_handle, f=
alse,
> +                     sp->point);
> +
> +     return (void *)0;
> +}
> +
> +static void
> +amdgpu_syncobj_timeline(amdgpu_device_handle device_handle)
> +{
> +     static pthread_t wait_thread;
> +     static pthread_t signal_thread;
> +     static pthread_t c_thread;
> +     struct syncobj_point sp1, sp2, sp3;
> +     uint32_t syncobj_handle;
> +     uint64_t payload;
> +     uint64_t wait_point, signal_point;
> +     uint64_t timeout;
> +     struct timespec tp;
> +     int r, sync_fd;
> +     void *tmp, *tmp2;
> +
> +     r =3D  amdgpu_cs_create_syncobj2(device_handle, 0, &syncobj_handle)=
;
> +     igt_assert_eq(r, 0);
> +
> +     // wait on point 5
> +     sp1.syncobj_handle =3D syncobj_handle;
> +     sp1.device =3D device_handle;
> +     sp1.point =3D 5;
> +     r =3D pthread_create(&wait_thread, NULL, syncobj_wait, &sp1);
> +     igt_assert_eq(r, 0);
> +
> +     // signal on point 10
> +     sp2.syncobj_handle =3D syncobj_handle;
> +     sp2.device =3D device_handle;
> +     sp2.point =3D 10;
> +     r =3D pthread_create(&signal_thread, NULL, syncobj_signal, &sp2);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D pthread_join(signal_thread, &tmp);
> +     igt_assert_eq(r, 0);
> +
> +     r =3D pthread_join(wait_thread, &tmp2);
> +     igt_assert_eq(r, 0);
> +
> +     //query timeline payload
> +     r =3D amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> +                                 &payload, 1);
> +     igt_assert_eq(r, 0);
> +     igt_assert_eq(payload, 10);
> +
> +     //signal on point 16
> +     sp3.syncobj_handle =3D syncobj_handle;
> +     sp3.device =3D device_handle;
> +     sp3.point =3D 16;
> +     r =3D pthread_create(&c_thread, NULL, syncobj_signal, &sp3);
> +     igt_assert_eq(r, 0);
> +
> +     //CPU wait on point 16
> +     wait_point =3D 16;
> +     timeout =3D 0;
> +     clock_gettime(CLOCK_MONOTONIC, &tp);
> +     timeout =3D tp.tv_sec * 1000000000ULL + tp.tv_nsec;
> +     timeout +=3D 10000000000; //10s
> +     r =3D amdgpu_cs_syncobj_timeline_wait(device_handle, &syncobj_handl=
e,
> +                                         &wait_point, 1, timeout,
> +                                         DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL=
 |
> +                                         DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR=
_SUBMIT,
> +                                         NULL);
> +
> +     igt_assert_eq(r, 0);
> +     r =3D pthread_join(c_thread, &tmp);
> +     igt_assert_eq(r, 0);
> +
> +     // export point 16 and import to point 18
> +     r =3D amdgpu_cs_syncobj_export_sync_file2(device_handle, syncobj_ha=
ndle,
> +                                             16,
> +                                             DRM_SYNCOBJ_WAIT_FLAGS_WAIT=
_FOR_SUBMIT,
> +                                             &sync_fd);
> +     igt_assert_eq(r, 0);
> +     r =3D amdgpu_cs_syncobj_import_sync_file2(device_handle, syncobj_ha=
ndle,
> +                                             18, sync_fd);
> +     igt_assert_eq(r, 0);
> +     r =3D amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> +                                 &payload, 1);
> +     igt_assert_eq(r, 0);
> +     igt_assert_eq(payload, 18);
> +
> +     // CPU signal on point 20
> +     signal_point =3D 20;
> +     r =3D amdgpu_cs_syncobj_timeline_signal(device_handle, &syncobj_han=
dle,
> +                                           &signal_point, 1);
> +     igt_assert_eq(r, 0);
> +     r =3D amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> +                                 &payload, 1);
> +     igt_assert_eq(r, 0);
> +     igt_assert_eq(payload, 20);
> +
> +     r =3D amdgpu_cs_destroy_syncobj(device_handle, syncobj_handle);
> +     igt_assert_eq(r, 0);
> +
> +}
> +
> +igt_main
> +{
> +     amdgpu_device_handle device;
> +     int fd =3D -1;
> +
> +     igt_fixture {
> +             uint32_t major, minor;
> +             int err;
> +
> +             fd =3D drm_open_driver(DRIVER_AMDGPU);
> +             err =3D amdgpu_device_initialize(fd, &major, &minor, &devic=
e);
> +             igt_require(err =3D=3D 0);
> +             igt_require(syncobj_timeline_enable(fd));
> +             igt_info("Initialized amdgpu, driver version %d.%d\n",
> +                      major, minor);
> +
> +     }
> +
> +     igt_subtest("amdgpu_syncobj_timeline")
> +     amdgpu_syncobj_timeline(device);
> +
> +     igt_fixture {
> +             amdgpu_device_deinitialize(device);
> +             close(fd);
> +     }
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 24843de73..02096934d 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -6,6 +6,7 @@ if libdrm_amdgpu.found()
>                          'amd_assr',
>                          'amd_basic',
>                          'amd_bo',
> +                       'amd_syncobj',
>                          'amd_bypass',
>                          'amd_color',
>                          'amd_cp_dma_misc',
> --
> 2.25.1
>

--_000_PH7PR12MB642038A65F94D00495EF6CB78129APH7PR12MB6420namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;font=
-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Hi Kamil,
<div class=3D"ContentPasted0">Yes, sure, </div>
<div class=3D"ContentPasted0">I will work on this using your suggestion in =
the previous email.</div>
Thanks, Vitaly<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kamil Konieczny &lt;k=
amil.konieczny@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, July 3, 2023 3:39 AM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Koenig, Christia=
n &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] tests/amdgpu: add sync object tests</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Vitaly,<br>
<br>
On 2023-07-01 at 21:22:30 -0400, vitaly.prosyak@amd.com wrote:<br>
&gt; From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt; <br>
&gt; Using worker thread to wait on point and then signal point on other th=
read.<br>
&gt; Another test uses a worker thread to signal point and wait on the main=
<br>
&gt; thread using amdgpu_cs_syncobj_timeline_wait.<br>
&gt; <br>
&gt; The command consists of two chunks :<br>
&gt; 1. AMDGPU_CHUNK_ID_IB uses GFX_COMPUTE_NOP&nbsp; or SDMA_NOP.<br>
&gt; 2. The second chunk is AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT<br>
&gt;&nbsp;&nbsp;&nbsp; or AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL which has=
 the<br>
&gt;&nbsp;&nbsp;&nbsp; point number .<br>
&gt; <br>
&gt; v1-&gt;v2. Fixed style issues - Christian.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fixed formatting issue=
s - Kamil.<br>
&gt; <br>
&gt; Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
&gt; Acked-by: Christian Koenig &lt;christian.koenig@amd.com&gt;<br>
&gt; Acked-by: Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<br>
<br>
Please do not merge this until you address GitLab compilation<br>
issue.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; ---<br>
&gt;&nbsp; tests/amdgpu/amd_syncobj.c | 266 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; tests/amdgpu/meson.build&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 267 insertions(+)<br>
&gt;&nbsp; create mode 100644 tests/amdgpu/amd_syncobj.c<br>
&gt; <br>
&gt; diff --git a/tests/amdgpu/amd_syncobj.c b/tests/amdgpu/amd_syncobj.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..7cab093c9<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/amdgpu/amd_syncobj.c<br>
&gt; @@ -0,0 +1,266 @@<br>
&gt; +// SPDX-License-Identifier: MIT<br>
&gt; +/*<br>
&gt; + * Copyright 2023 Advanced Micro Devices, Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;pthread.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;amdgpu.h&gt;<br>
&gt; +#include &lt;amdgpu_drm.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;lib/amdgpu/amd_PM4.h&quot;<br>
&gt; +#include &quot;lib/amdgpu/amd_sdma.h&quot;<br>
&gt; +#include &quot;lib/amdgpu/amd_memory.h&quot;<br>
&gt; +<br>
&gt; +struct syncobj_point {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_handle device;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t syncobj_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t point;<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +static bool<br>
&gt; +syncobj_timeline_enable(int fd)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool ret =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t cap =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE=
, &amp;cap);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (r || cap =3D=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +syncobj_command_submission_helper(amdgpu_device_handle device_handle,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t syncobj_handle, bool wait_or_signal, uint64_t point)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_context_handle context_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_handle ib_result_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; void *ib_result_cpu;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t ib_result_mc_address;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_cs_chunk chunks[2];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_cs_chunk_data chunk_data;<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_cs_chunk_syncobj syncobj_d=
ata;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_cs_fence fence_status;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_list_handle bo_list;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_va_handle va_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t expired;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int i, r;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t seq_no;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *ptr;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_ctx_create(device_handle, &a=
mp;context_handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_alloc_and_map(device_handle,=
 4096, 4096,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM_DOMAIN_GTT, 0,<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ib_result_handle, &am=
p;ib_result_cpu,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;ib_result_mc_address,=
 &amp;va_handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_get_bo_list(device_handle, ib_r=
esult_handle, NULL, &amp;bo_list);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ptr =3D ib_result_cpu;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; 16; ++i)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ptr[i] =3D wait_or_signal ? GFX_COMPUTE_NOP : SDMA_NOP;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunks[0].chunk_id =3D AMDGPU_CHUNK_ID_IB;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunks[0].length_dw =3D sizeof(struct drm_am=
dgpu_cs_chunk_ib) / 4;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunks[0].chunk_data =3D (uint64_t)(uintptr_=
t)&amp;chunk_data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data._pad =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data.va_start =3D ib_result_mc=
_address;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data.ib_bytes =3D 16 * 4;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data.ip_type =3D wait_or_signa=
l ? AMDGPU_HW_IP_GFX : AMDGPU_HW_IP_DMA;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data.ip_instance =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data.ring =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunk_data.ib_data.flags =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunks[1].chunk_id =3D wait_or_signal ?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT :<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunks[1].length_dw =3D sizeof(struct drm_am=
dgpu_cs_chunk_syncobj) / 4;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; chunks[1].chunk_data =3D (uint64_t)(uintptr_=
t)&amp;syncobj_data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; syncobj_data.handle =3D syncobj_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; syncobj_data.point =3D point;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; syncobj_data.flags =3D DRM_SYNCOBJ_WAIT_FLAG=
S_WAIT_FOR_SUBMIT;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_submit_raw(device_handle,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; context_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_list,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chunks,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;seq_no);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;fence_status, 0, sizeof(struct a=
mdgpu_cs_fence));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fence_status.context =3D context_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fence_status.ip_type =3D wait_or_signal ? AM=
DGPU_HW_IP_GFX : AMDGPU_HW_IP_DMA;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fence_status.ip_instance =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fence_status.ring =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fence_status.fence =3D seq_no;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_query_fence_status(&amp;fenc=
e_status,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_TIMEOUT_INFINITE=
, 0, &amp;expired);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_list_destroy(bo_list);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unmap_and_free(ib_result_handle, v=
a_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ib_result_mc_address=
, 4096);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_ctx_free(context_handle);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void *<br>
&gt; +syncobj_wait(void *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct syncobj_point *sp =3D (struct syncobj=
_point *)data;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; syncobj_command_submission_helper(sp-&gt;dev=
ice, sp-&gt;syncobj_handle, true,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sp-&gt;point);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (void *)0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void *<br>
&gt; +syncobj_signal(void *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct syncobj_point *sp =3D (struct syncobj=
_point *)data;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; syncobj_command_submission_helper(sp-&gt;dev=
ice, sp-&gt;syncobj_handle, false,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sp-&gt;point);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (void *)0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +amdgpu_syncobj_timeline(amdgpu_device_handle device_handle)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static pthread_t wait_thread;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static pthread_t signal_thread;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static pthread_t c_thread;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct syncobj_point sp1, sp2, sp3;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t syncobj_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t payload;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t wait_point, signal_point;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint64_t timeout;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct timespec tp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int r, sync_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; void *tmp, *tmp2;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D&nbsp; amdgpu_cs_create_syncobj2(device=
_handle, 0, &amp;syncobj_handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // wait on point 5<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp1.syncobj_handle =3D syncobj_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp1.device =3D device_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp1.point =3D 5;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D pthread_create(&amp;wait_thread, NULL,=
 syncobj_wait, &amp;sp1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // signal on point 10<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp2.syncobj_handle =3D syncobj_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp2.device =3D device_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp2.point =3D 10;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D pthread_create(&amp;signal_thread, NUL=
L, syncobj_signal, &amp;sp2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D pthread_join(signal_thread, &amp;tmp);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D pthread_join(wait_thread, &amp;tmp2);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //query timeline payload<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_query(device_handle,=
 &amp;syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;payload, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(payload, 10);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //signal on point 16<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp3.syncobj_handle =3D syncobj_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp3.device =3D device_handle;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sp3.point =3D 16;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D pthread_create(&amp;c_thread, NULL, sy=
ncobj_signal, &amp;sp3);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //CPU wait on point 16<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; wait_point =3D 16;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clock_gettime(CLOCK_MONOTONIC, &amp;tp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D tp.tv_sec * 1000000000ULL + tp.t=
v_nsec;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; timeout +=3D 10000000000; //10s<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_timeline_wait(device=
_handle, &amp;syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &amp;wait_point, 1, timeout,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D pthread_join(c_thread, &amp;tmp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // export point 16 and import to point 18<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_export_sync_file2(de=
vice_handle, syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_SYNCOBJ_WAIT_FLAGS_WAIT_F=
OR_SUBMIT,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;sync_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_import_sync_file2(de=
vice_handle, syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18, sync_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_query(device_handle,=
 &amp;syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;payload, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(payload, 18);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // CPU signal on point 20<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; signal_point =3D 20;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_timeline_signal(devi=
ce_handle, &amp;syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;signal_point, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_syncobj_query(device_handle,=
 &amp;syncobj_handle,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;payload, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(payload, 20);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_destroy_syncobj(device_handl=
e, syncobj_handle);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(r, 0);<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +igt_main<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_handle device;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fd =3D -1;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t major, minor;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int err;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fd =3D drm_open_driver(DRIVER_AMDGPU);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; err =3D amdgpu_device_initialize(fd, &amp;major, &amp;minor, &amp;devic=
e);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(err =3D=3D 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(syncobj_timeline_enable(fd));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_info(&quot;Initialized amdgpu, driver version %d.%d\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; major, minor);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;amdgpu_syncobj_timeline&qu=
ot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_syncobj_timeline(device);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; amdgpu_device_deinitialize(device);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build<br>
&gt; index 24843de73..02096934d 100644<br>
&gt; --- a/tests/amdgpu/meson.build<br>
&gt; +++ b/tests/amdgpu/meson.build<br>
&gt; @@ -6,6 +6,7 @@ if libdrm_amdgpu.found()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 'amd_assr',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 'amd_basic',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 'amd_bo',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'amd_syncob=
j',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 'amd_bypass',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 'amd_color',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 'amd_cp_dma_misc',<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH7PR12MB642038A65F94D00495EF6CB78129APH7PR12MB6420namp_--
