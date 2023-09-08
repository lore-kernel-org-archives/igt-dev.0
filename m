Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2848725501987334190=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Fri, 08 Sep 2023 17:29:18 -0000
Message-ID: <169419415889.14896.10217555470732878660@emeril.freedesktop.org>
References: <20230907055203.1274040-1-swati2.sharma@intel.com>
In-Reply-To: <20230907055203.1274040-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/in?=
 =?utf-8?q?tel-ci=3A_add_4-tile_test_=28rev2=29?=
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

--===============2848725501987334190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: add 4-tile test (rev2)
URL   : https://patchwork.freedesktop.org/series/123375/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7476_BAT -> XEIGTPW_9757_BAT
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

  Here are the changes found in XEIGTPW_9757_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-atsm-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][2] -> [FAIL][3] ([Intel XE#480]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][4] ([Intel XE#524]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [INCOMPLETE][6] ([Intel XE#526]) -> [INCOMPLETE][7] ([Intel XE#631])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#526]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/526
  [Intel XE#631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/631
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7476 -> IGTPW_9757

  IGTPW_9757: 9757
  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/index.html

--===============2848725501987334190==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: add 4-tile test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123375/">https://patchwork.freedesktop.org/series/123375/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7476_BAT -&gt; XEIGTPW_9757_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9757_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-atsm-2/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_reset@virtual-close-fd-no-exec:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7476/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/526">Intel XE#526</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9757/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/631">Intel XE#631</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7476 -&gt; IGTPW_9757</li>
</ul>
<p>IGTPW_9757: 9757<br />
  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68020896bdbe0cab459</p>

</body>
</html>

--===============2848725501987334190==--
