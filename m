Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 14 Oct 2020 11:18:16 -0000
Message-ID: <160267429611.21206.6201604067924503569@emeril.freedesktop.org>
References: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201014104038.2554985-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/10=5D_i915/gem=5Fuserptr=5Fblits?=
 =?utf-8?q?=3A_Tighten_has=5Fuserptr=28=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1725818240=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1725818240==
Content-Type: multipart/alternative;
 boundary="===============3813250102116039793=="

--===============3813250102116039793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/10] i915/gem_userptr_blits: Tighten has_userptr()
URL   : https://patchwork.freedesktop.org/series/82670/
State : success

== Summary ==

CI Bug Log - changes from IGT_5815 -> IGTPW_5067
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html

Known issues
------------

  Here are the changes found in IGTPW_5067 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] ([i915#1250] / [i915#1436])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-bsw-nick/igt@debugfs_test@read_all_entries.html

  * igt@gem_flink_basic@double-flink:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-tgl-y/igt@gem_flink_basic@double-flink.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-tgl-y/igt@gem_flink_basic@double-flink.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@gem_flink_basic@bad-flink:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-tgl-y/igt@gem_flink_basic@bad-flink.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-tgl-y/igt@gem_flink_basic@bad-flink.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [DMESG-WARN][11] ([i915#165]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1250]: https://gitlab.freedesktop.org/drm/intel/issues/1250
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2417]: https://gitlab.freedesktop.org/drm/intel/issues/2417
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (46 -> 39)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bsw-kefka fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5815 -> IGTPW_5067

  CI-20190529: 20190529
  CI_DRM_9138: 5e4234f97efbaa30f0beb243dcf98fe0a0bb0945 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5067: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html
  IGT_5815: 0c3b29498a624ad42033a219d031cb9dd475405b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_balancer@u-bonded-cork
+igt@gem_exec_balancer@u-bonded-early
+igt@gem_exec_balancer@u-bonded-imm
+igt@gem_exec_balancer@u-bonded-semaphore
+igt@gem_exec_reloc@basic-spin-user
+igt@gem_exec_schedule@fairslice
+igt@gem_exec_schedule@fairslice-all
+igt@gem_exec_schedule@fair-flow
+igt@gem_exec_schedule@fair-flow-ping
+igt@gem_exec_schedule@fair-flow-share
+igt@gem_exec_schedule@fair-half
+igt@gem_exec_schedule@fair-next
+igt@gem_exec_schedule@fair-next-ping
+igt@gem_exec_schedule@fair-next-share
+igt@gem_exec_schedule@fair-none
+igt@gem_exec_schedule@fair-none-ping
+igt@gem_exec_schedule@fair-none-rrul
+igt@gem_exec_schedule@fair-none-share
+igt@gem_exec_schedule@fair-none-solo
+igt@gem_exec_schedule@fair-none-vip
+igt@gem_exec_schedule@fair-pace
+igt@gem_exec_schedule@fair-pace-ping
+igt@gem_exec_schedule@fair-pace-share
+igt@gem_exec_schedule@fair-pace-solo
+igt@gem_exec_schedule@fair-spare
+igt@gem_exec_schedule@fair-sync
+igt@gem_exec_schedule@fair-sync-solo
+igt@gem_exec_schedule@fair-sync-vip
+igt@gem_exec_schedule@fair-throttle
+igt@gem_exec_schedule@fair-throttle-rrul
+igt@gem_exec_schedule@fair-throttle-share
+igt@gem_exec_schedule@fair-throttle-solo
+igt@gem_exec_schedule@fair-throttle-vip
+igt@gem_exec_schedule@preempt-user
+igt@gem_exec_schedule@u-fairslice
+igt@gem_exec_schedule@u-fairslice-all
+igt@gem_exec_schedule@u-independent
+igt@gem_exec_schedule@u-lateslice
+igt@gem_exec_schedule@u-semaphore-codependency
+igt@gem_exec_schedule@u-semaphore-noskip
+igt@gem_exec_schedule@u-semaphore-resolve
+igt@gem_exec_schedule@u-semaphore-user
+igt@gem_exec_schedule@u-submit-early-slice
+igt@gem_exec_schedule@u-submit-golden-slice
+igt@gem_exec_schedule@u-submit-late-slice
+igt@gem_userptr_blits@exec-isolation
+igt@gem_userptr_blits@unmap-isolation

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html

--===============3813250102116039793==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/10] i915/gem_userptr_blits: Tighten has_userptr()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82670/">https://patchwork.freedesktop.org/series/82670/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5815 -&gt; IGTPW_5067</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5067 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-bsw-nick/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-bsw-nick/igt@debugfs_test@read_all_entries.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1250">i915#1250</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@double-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-tgl-y/igt@gem_flink_basic@double-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-tgl-y/igt@gem_flink_basic@double-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-tgl-y/igt@gem_flink_basic@bad-flink.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5815/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 39)</h2>
<p>Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bsw-kefka fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5815 -&gt; IGTPW_5067</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9138: 5e4234f97efbaa30f0beb243dcf98fe0a0bb0945 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5067: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5067/index.html<br />
  IGT_5815: 0c3b29498a624ad42033a219d031cb9dd475405b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_balancer@u-bonded-cork<br />
+igt@gem_exec_balancer@u-bonded-early<br />
+igt@gem_exec_balancer@u-bonded-imm<br />
+igt@gem_exec_balancer@u-bonded-semaphore<br />
+igt@gem_exec_reloc@basic-spin-user<br />
+igt@gem_exec_schedule@fairslice<br />
+igt@gem_exec_schedule@fairslice-all<br />
+igt@gem_exec_schedule@fair-flow<br />
+igt@gem_exec_schedule@fair-flow-ping<br />
+igt@gem_exec_schedule@fair-flow-share<br />
+igt@gem_exec_schedule@fair-half<br />
+igt@gem_exec_schedule@fair-next<br />
+igt@gem_exec_schedule@fair-next-ping<br />
+igt@gem_exec_schedule@fair-next-share<br />
+igt@gem_exec_schedule@fair-none<br />
+igt@gem_exec_schedule@fair-none-ping<br />
+igt@gem_exec_schedule@fair-none-rrul<br />
+igt@gem_exec_schedule@fair-none-share<br />
+igt@gem_exec_schedule@fair-none-solo<br />
+igt@gem_exec_schedule@fair-none-vip<br />
+igt@gem_exec_schedule@fair-pace<br />
+igt@gem_exec_schedule@fair-pace-ping<br />
+igt@gem_exec_schedule@fair-pace-share<br />
+igt@gem_exec_schedule@fair-pace-solo<br />
+igt@gem_exec_schedule@fair-spare<br />
+igt@gem_exec_schedule@fair-sync<br />
+igt@gem_exec_schedule@fair-sync-solo<br />
+igt@gem_exec_schedule@fair-sync-vip<br />
+igt@gem_exec_schedule@fair-throttle<br />
+igt@gem_exec_schedule@fair-throttle-rrul<br />
+igt@gem_exec_schedule@fair-throttle-share<br />
+igt@gem_exec_schedule@fair-throttle-solo<br />
+igt@gem_exec_schedule@fair-throttle-vip<br />
+igt@gem_exec_schedule@preempt-user<br />
+igt@gem_exec_schedule@u-fairslice<br />
+igt@gem_exec_schedule@u-fairslice-all<br />
+igt@gem_exec_schedule@u-independent<br />
+igt@gem_exec_schedule@u-lateslice<br />
+igt@gem_exec_schedule@u-semaphore-codependency<br />
+igt@gem_exec_schedule@u-semaphore-noskip<br />
+igt@gem_exec_schedule@u-semaphore-resolve<br />
+igt@gem_exec_schedule@u-semaphore-user<br />
+igt@gem_exec_schedule@u-submit-early-slice<br />
+igt@gem_exec_schedule@u-submit-golden-slice<br />
+igt@gem_exec_schedule@u-submit-late-slice<br />
+igt@gem_userptr_blits@exec-isolation<br />
+igt@gem_userptr_blits@unmap-isolation</p>

</body>
</html>

--===============3813250102116039793==--

--===============1725818240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1725818240==--
