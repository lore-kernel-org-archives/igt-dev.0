Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1483051158084408974=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Sat, 16 Sep 2023 00:14:04 -0000
Message-ID: <169482324479.10847.2744856578572800684@emeril.freedesktop.org>
References: <20230915173439.49405-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230915173439.49405-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/drmt?=
 =?utf-8?q?est=3A_allow_out_of_order_device_opening?=
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

--===============1483051158084408974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/drmtest: allow out of order device opening
URL   : https://patchwork.freedesktop.org/series/123785/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7490_BAT -> XEIGTPW_9806_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9806_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9806_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9806_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-modeset@b-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@b-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@b-dp3.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-FAIL][4] +2 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#608]) -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9806_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#554]) +6 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][11] -> [DMESG-WARN][12] ([Intel XE#547]) +21 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#547]) +4 other tests dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][15] ([Intel XE#480]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#400]) -> [DMESG-WARN][18] ([Intel XE#547]) +2 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/547
  [Intel XE#554]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/554
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608


Build changes
-------------

  * IGT: IGT_7490 -> IGTPW_9806
  * Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -> xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d

  IGTPW_9806: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html
  IGT_7490: 7490
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/index.html

--===============1483051158084408974==
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
<tr><td><b>Series:</b></td><td>lib/drmtest: allow out of order device opening</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123785/">https://patchwork.freedesktop.org/series/123785/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7490_BAT -&gt; XEIGTPW_9806_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9806_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9806_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9806_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@b-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@b-dp3.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-3.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9806_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/554">Intel XE#554</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7490/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9806/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/547">Intel XE#547</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7490 -&gt; IGTPW_9806</li>
<li>Linux: xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63 -&gt; xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d</li>
</ul>
<p>IGTPW_9806: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html<br />
  IGT_7490: 7490<br />
  xe-375-4a9681392cecd56a372d06b648f7b3a37fdd5c63: 4a9681392cecd56a372d06b648f7b3a37fdd5c63<br />
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d</p>

</body>
</html>

--===============1483051158084408974==--
