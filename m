Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3079193658343237388=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Fri, 13 Oct 2023 14:12:34 -0000
Message-ID: <169720635495.31159.18096386898860556416@emeril.freedesktop.org>
References: <20231013102346.95872-1-swati2.sharma@intel.com>
In-Reply-To: <20231013102346.95872-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/km?=
 =?utf-8?b?c19wbGFuZV9zY2FsaW5nOiBhZGQgZ2V0X251bV9zY2FsZXJzKCkgKHJldjMp?=
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

--===============3079193658343237388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: add get_num_scalers() (rev3)
URL   : https://patchwork.freedesktop.org/series/117935/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7536_BAT -> XEIGTPW_9997_BAT
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

  Here are the changes found in XEIGTPW_9997_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7536/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7536/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [DMESG-WARN][5] ([Intel XE#696]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7536/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696


Build changes
-------------

  * IGT: IGT_7536 -> IGTPW_9997

  IGTPW_9997: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9997/index.html
  IGT_7536: fdd51d526a9a7cb875cfad2641e90a72af392d98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338: 037b6c8b23818fa71223e996c68a4f55f2d91338

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/index.html

--===============3079193658343237388==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: add get_num_scalers() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117935/">https://patchwork.freedesktop.org/series/117935/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7536_BAT -&gt; XEIGTPW_9997_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9997_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7536/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7536/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7536/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9997/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7536 -&gt; IGTPW_9997</li>
</ul>
<p>IGTPW_9997: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9997/index.html<br />
  IGT_7536: fdd51d526a9a7cb875cfad2641e90a72af392d98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338: 037b6c8b23818fa71223e996c68a4f55f2d91338</p>

</body>
</html>

--===============3079193658343237388==--
