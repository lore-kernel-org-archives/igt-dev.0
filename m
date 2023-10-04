Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1361097946484779528=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 04 Oct 2023 08:30:07 -0000
Message-ID: <169640820773.7834.15362554510448317782@emeril.freedesktop.org>
References: <20230911074026.1944119-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230911074026.1944119-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel/kms=5Ffbt=3A_Use_Linear_modifier_as_default_=28rev3=29?=
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

--===============1361097946484779528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_fbt: Use Linear modifier as default (rev3)
URL   : https://patchwork.freedesktop.org/series/123520/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7512_BAT -> XEIGTPW_9916_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_9916_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9916_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9916_BAT:

### IGT changes ###

#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [INCOMPLETE][1] ([Intel XE#764]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9916_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][5] ([Intel XE#400]) +25 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][6] ([Intel XE#753])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#608]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#524]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][11] ([Intel XE#632]) -> [FAIL][12] ([Intel XE#750])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764


Build changes
-------------

  * IGT: IGT_7512 -> IGTPW_9916

  IGTPW_9916: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9916/index.html
  IGT_7512: 2eb58faf82d3cd5e2e74154a7319cff56eb40762 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36: 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/index.html

--===============1361097946484779528==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_fbt: Use Linear modifier as default (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123520/">https://patchwork.freedesktop.org/series/123520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7512_BAT -&gt; XEIGTPW_9916_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_9916_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9916_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9916_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9916_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7512/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9916/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7512 -&gt; IGTPW_9916</li>
</ul>
<p>IGTPW_9916: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9916/index.html<br />
  IGT_7512: 2eb58faf82d3cd5e2e74154a7319cff56eb40762 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-411-090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36: 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36</p>

</body>
</html>

--===============1361097946484779528==--
