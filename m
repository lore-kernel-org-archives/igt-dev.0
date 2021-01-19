Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4636E42D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jan 2021 16:39:11 +0000 (UTC)
Message-ID: <aa3cf15cd8d03e0635ee74eab6bd8ef5d4ab0bbc.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 19 Jan 2021 17:39:07 +0100
In-Reply-To: <161105758059.4865.3590348265190078131@emeril.freedesktop.org>
References: <20210119084257.25552-1-janusz.krzysztofik@linux.intel.com>
 <161105758059.4865.3590348265190078131@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Reduce_debug_noise_on_stdout?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0518796124=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0518796124==
Content-Type: multipart/alternative; boundary="=-RZ2uFTq2bDA6x1b2axzR"


--=-RZ2uFTq2bDA6x1b2axzR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-01-19 at 11:59 +0000, Patchwork wrote:
> 
> Patch Details
> 
> Series:tests/core_hotunplug: Reduce debug noise on stdout
> URL:https://patchwork.freedesktop.org/series/86032/
> State:failure
> 
>     Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html
> 
> 
> 
> 
>     CI Bug Log - changes from CI_DRM_9640 -> IGTPW_5402
> Summary
> FAILURE
> 
> Serious unknown changes coming with IGTPW_5402 absolutely need to be
> 
>   verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> 
>   introduced in IGTPW_5402, please notify your bug team to allow them
> 
>   to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html
> 
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_5402:
> 
> IGT changes
> Possible regressions
> 
> igt@i915_selftest@live@gem_contexts:
> fi-byt-j1900:       NOTRUN -> DMESG-FAIL

The change didn't touch i915_selftest, many  tests executed in that run after core_hotunplug, including i915_module_load, succeeded, then the change couldn't be responsible for this failure.
Thanks,Janusz
> 
> 
> Known issues
> Here are the changes found in IGTPW_5402 that come from known issues:
> IGT changes
> Issues hit
> 
> 
> igt@amdgpu/amd_basic@query-info:
> 
> fi-tgl-y:           NOTRUN -> SKIP (fdo#109315 / i915#2575)
> 
> 
> 
> igt@amdgpu/amd_basic@semaphore:
> 
> fi-bdw-5557u:       NOTRUN -> SKIP (fdo#109271) +22 similar issues
> 
> 
> 
> igt@core_hotunplug@unbind-rebind:
> 
> fi-bdw-5557u:       NOTRUN -> WARN (i915#2283)
> 
> 
> 
> igt@debugfs_test@read_all_entries:
> 
> fi-tgl-y:           PASS -> DMESG-WARN (i915#402) +2 similar issues
> 
> 
> 
> igt@gem_huc_copy@huc-copy:
> 
> fi-byt-j1900:       NOTRUN -> SKIP (fdo#109271) +27 similar issues
> 
> 
> 
> igt@kms_chamelium@hdmi-crc-fast:
> 
> fi-byt-j1900:       NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar issues
> 
> 
> 
> igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
> 
> fi-bsw-kefka:       PASS -> FAIL (i915#2122)
> 
> 
> 
> igt@kms_frontbuffer_tracking@basic:
> 
> fi-byt-j1900:       NOTRUN -> FAIL (i915#49)
> 
> 
> 
> Possible fixes
> 
> igt@prime_vgem@basic-fence-flip:
> fi-tgl-y:           DMESG-WARN (i915#402) -> PASS +1 similar issue
> 
> 
> 
> Participating hosts (42 -> 37)
> Additional (1): fi-byt-j1900 
> 
>   Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 
> Build changes
> 
> CI: CI-20190529 -> None
> IGT: IGT_5960 -> IGTPW_5402
> 
> CI-20190529: 20190529
> 
>   CI_DRM_9640: e4a7b069614eee3e01353d8529d5cf8b924feeec @ git://anongit.freedesktop.org/gfx-ci/linux
> 
>   IGTPW_5402: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html
> 
>   IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> 
> 

--=-RZ2uFTq2bDA6x1b2axzR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" dir=3D"ltr"><head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8">
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body style=3D"text-align:left; direction:ltr;"><div>On Tue, 2021-01-19 at =
11:59 +0000, Patchwork wrote:</div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/core_hotunplug: Reduce debug no=
ise on stdout</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/86032/">https://patchwork.freedesktop.org/series/86032/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5402/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_9640 -&gt; IGTPW_5402</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5402 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5402, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5402=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li><a href=3D"mailto:igt@i915">igt@i915</a>_selftest@live@gem_contexts:<ul=
>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-byt-j1900/igt@i915_selftest@live@gem_contexts.h=
tml">DMESG-FAIL</a></li></ul></li></ul></blockquote><div><br></div><div>The=
 change didn't touch i915_selftest, many  tests executed in that run after =
core_hotunplug,&nbsp;including i915_module_load, succeeded, then the change=
 couldn't be responsible for this failure.</div><div><br></div><div>Thanks,=
</div><div>Janusz</div><div><br></div><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><ul><li><u=
l>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5402 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-tgl-y/igt@amdgpu/amd_basic@query-info.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109315">fd=
o#109315</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283=
">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/fi-tgl-y/i=
gt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-byt-j1900/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-byt-j1900/igt@kms_chamelium@hdmi-crc-fast.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-bsw-kefka:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
402/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#212=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/fi-byt-j1900/igt@kms_frontbuffer_tracking@basic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/49=
">i915#49</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@prime_vgem@basic-fence-flip:<ul>
<li>fi-tgl-y:           <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/fi-tgl-y/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/fi=
-tgl-y/igt@prime_vgem@basic-fence-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Additional (1): fi-byt-j1900 <br>
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-=
1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5960 -&gt; IGTPW_5402</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_9640: e4a7b069614eee3e01353d8529d5cf8b924feeec @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br>
  IGTPW_5402: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.htm=
l<br>
  IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>



</blockquote></body></html>

--=-RZ2uFTq2bDA6x1b2axzR--


--===============0518796124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0518796124==--
