Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 Jan 2021 18:18:16 -0000
Message-ID: <161168509605.9813.18071509152118045789@emeril.freedesktop.org>
References: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/sysfs=5Fclient=3A_Ignore_?=
 =?utf-8?q?clients_being_closed_as_we_read_their_sysfs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1666294933=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1666294933==
Content-Type: multipart/alternative;
 boundary="===============2911719029535813992=="

--===============2911719029535813992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/sysfs_client: Ignore clients being closed as we read their sysfs
URL   : https://patchwork.freedesktop.org/series/86298/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9684 -> IGTPW_5432
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5432:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - {fi-rkl-11500t}:    [SKIP][1] ([i915#533]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-rkl-11500t/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-rkl-11500t/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
Known issues
------------

  Here are the changes found in IGTPW_5432 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#402]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@i915_module_load@reload:
    - fi-kbl-7500u:       [DMESG-WARN][7] ([i915#2605]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-kbl-7500u/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-kbl-7500u/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (44 -> 38)
------------------------------

  Missing    (6): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5972 -> IGTPW_5432

  CI-20190529: 20190529
  CI_DRM_9684: 53a183b40b798192f7211b05d550c8145d1397b5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5432: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html
  IGT_5972: 82fa6021821edb5d9609f4cce213920e0936d6f3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@sysfs_clients@recycle

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html

--===============2911719029535813992==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] i915/sysfs_client: Ignore clients being closed as we read their sysfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86298/">https://patchwork.freedesktop.org/series/86298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9684 -&gt; IGTPW_5432</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5432:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-rkl-11500t/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-rkl-11500t/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5432 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@prime_self_import@basic-with_one_bo_two_files:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-tgl-y/igt@debugfs_test@read_all_entries.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/fi-kbl-7500u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/fi-kbl-7500u/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Missing    (6): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5972 -&gt; IGTPW_5432</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9684: 53a183b40b798192f7211b05d550c8145d1397b5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5432: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html<br />
  IGT_5972: 82fa6021821edb5d9609f4cce213920e0936d6f3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@sysfs_clients@recycle</p>

</body>
</html>

--===============2911719029535813992==--

--===============1666294933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1666294933==--
