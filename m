Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5257663455099729130=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Date: Wed, 08 Nov 2023 18:40:35 -0000
Message-ID: <169946883528.24273.11606388515515074371@emeril.freedesktop.org>
References: <20231108164006.106967-1-harry.wentland@amd.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_IGT_test?=
 =?utf-8?q?s_for_the_KMS_Color_Pipeline_API_=28rev3=29?=
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

--===============5257663455099729130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT tests for the KMS Color Pipeline API (rev3)
URL   : https://patchwork.freedesktop.org/series/123448/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7577_BAT -> XEIGTPW_10138_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10138_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7577/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][4] ([Intel XE#282] / [i915#2017])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7577/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7577 -> IGTPW_10138
  * Linux: xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2 -> xe-480-f873cbf891845f0506be50fed7845cf818496604

  IGTPW_10138: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10138/index.html
  IGT_7577: 303daa66145647680d8e817ff305f7f5d83843ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2: 2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2
  xe-480-f873cbf891845f0506be50fed7845cf818496604: f873cbf891845f0506be50fed7845cf818496604

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/index.html

--===============5257663455099729130==
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
<tr><td><b>Series:</b></td><td>IGT tests for the KMS Color Pipeline API (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123448/">https://patchwork.freedesktop.org/series/123448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7577_BAT -&gt; XEIGTPW_10138_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10138_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7577/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7577/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10138/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7577 -&gt; IGTPW_10138</li>
<li>Linux: xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2 -&gt; xe-480-f873cbf891845f0506be50fed7845cf818496604</li>
</ul>
<p>IGTPW_10138: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10138/index.html<br />
  IGT_7577: 303daa66145647680d8e817ff305f7f5d83843ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-478-2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2: 2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2<br />
  xe-480-f873cbf891845f0506be50fed7845cf818496604: f873cbf891845f0506be50fed7845cf818496604</p>

</body>
</html>

--===============5257663455099729130==--
