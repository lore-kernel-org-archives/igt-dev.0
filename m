Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1499960252961152509=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Thu, 21 Sep 2023 09:02:42 -0000
Message-ID: <169528696244.7235.5044212375770879571@emeril.freedesktop.org>
References: <20230921070254.30384-1-lukasz.laguna@intel.com>
In-Reply-To: <20230921070254.30384-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciBsaWIveGVf?=
 =?utf-8?q?query=3A_add_media_GT_presence_checker?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1499960252961152509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_query: add media GT presence checker
URL   : https://patchwork.freedesktop.org/series/124031/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7495_BAT -> XEIGTPW_9835_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_9835_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9835_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9835_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#423]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][3] ([Intel XE#423]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9835_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_live_ktest@dmabuf:
    - bat-atsm-2:         [FAIL][9] ([Intel XE#722]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-atsm-2/igt@xe_live_ktest@dmabuf.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-atsm-2/igt@xe_live_ktest@dmabuf.html

  * {igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:
    - bat-dg2-oem2:       [FAIL][11] ([Intel XE#722]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#722]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/722


Build changes
-------------

  * IGT: IGT_7495 -> IGTPW_9835
  * Linux: xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c -> xe-388-57039c55bac31a639ce66355c26fe345f338c075

  IGTPW_9835: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9835/index.html
  IGT_7495: 7ed6190bc4f8a3ebc3f0b8b334e8ae6abae03031 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c: 6e4a4aa0279d8de30726606ccf74de109af20e6c
  xe-388-57039c55bac31a639ce66355c26fe345f338c075: 57039c55bac31a639ce66355c26fe345f338c075

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/index.html

--===============1499960252961152509==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>lib/xe_query: add media GT presence checker</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124031/">https://patchwork.freedesktop.org/series/124031/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7495_BAT -&gt; XEIGTPW_9835_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_9835_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9835_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9835_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9835_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/722">Intel XE#722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-atsm-2/igt@xe_live_ktest@dmabuf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7495/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/722">Intel XE#722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9835/bat-dg2-oem2/igt@xe_live_ktest@dmabuf@xe_dma_buf-xe_dma_buf_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7495 -&gt; IGTPW_9835</li>
<li>Linux: xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c -&gt; xe-388-57039c55bac31a639ce66355c26fe345f338c075</li>
</ul>
<p>IGTPW_9835: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9835/index.html<br />
  IGT_7495: 7ed6190bc4f8a3ebc3f0b8b334e8ae6abae03031 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-387-6e4a4aa0279d8de30726606ccf74de109af20e6c: 6e4a4aa0279d8de30726606ccf74de109af20e6c<br />
  xe-388-57039c55bac31a639ce66355c26fe345f338c075: 57039c55bac31a639ce66355c26fe345f338c075</p>

</body>
</html>

--===============1499960252961152509==--
