Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8841040420492838630=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Wed, 11 Oct 2023 17:48:49 -0000
Message-ID: <169704652907.26513.4101163559233369527@emeril.freedesktop.org>
References: <20231011090231.65619-1-swati2.sharma@intel.com>
In-Reply-To: <20231011090231.65619-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/in?=
 =?utf-8?q?tel/kms=5Fflip=5Ftiling=3A_pipe=5Fname_followed_by_output=5Fnam?=
 =?utf-8?q?e?=
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

--===============8841040420492838630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_flip_tiling: pipe_name followed by output_name
URL   : https://patchwork.freedesktop.org/series/124949/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7531_BAT -> XEIGTPW_9973_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9973_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9973_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9973_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7531/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9973_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([i915#2346])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7531/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7531/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7531 -> IGTPW_9973
  * Linux: xe-428-078b11107f15035f5d72d0ce49b656b5dbdb3213 -> xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297

  IGTPW_9973: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9973/index.html
  IGT_7531: 0068652a10bd99c315f777ac61c88382980489e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-428-078b11107f15035f5d72d0ce49b656b5dbdb3213: 078b11107f15035f5d72d0ce49b656b5dbdb3213
  xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297: 81cbfcc83d65c3c69866f356cb83497a47f9d297

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/index.html

--===============8841040420492838630==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_flip_tiling: pipe_name followed by output_name</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124949/">https://patchwork.freedesktop.org/series/124949/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7531_BAT -&gt; XEIGTPW_9973_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9973_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9973_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9973_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7531/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9973_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7531/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7531/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9973/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7531 -&gt; IGTPW_9973</li>
<li>Linux: xe-428-078b11107f15035f5d72d0ce49b656b5dbdb3213 -&gt; xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297</li>
</ul>
<p>IGTPW_9973: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9973/index.html<br />
  IGT_7531: 0068652a10bd99c315f777ac61c88382980489e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-428-078b11107f15035f5d72d0ce49b656b5dbdb3213: 078b11107f15035f5d72d0ce49b656b5dbdb3213<br />
  xe-429-81cbfcc83d65c3c69866f356cb83497a47f9d297: 81cbfcc83d65c3c69866f356cb83497a47f9d297</p>

</body>
</html>

--===============8841040420492838630==--
