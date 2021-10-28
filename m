Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6586262050312449922=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 Oct 2021 13:37:48 -0000
Message-ID: <163542826880.4342.14484929129662329254@emeril.freedesktop.org>
References: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2hhbmdl?=
 =?utf-8?q?_duplicate_names_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6586262050312449922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Change duplicate names (rev2)
URL   : https://patchwork.freedesktop.org/series/96381/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10807 -> IGTPW_6361
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html

Participating hosts (28 -> 32)
------------------------------

  Additional (4): fi-kbl-soraka fi-bsw-kefka fi-bsw-nick fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_6361 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][1] ([fdo#109271]) +32 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][2] ([fdo#109271]) +27 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#2291])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-kefka/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#533])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][12] ([fdo#109271]) +42 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-nick:        NOTRUN -> [SKIP][13] ([fdo#109271]) +63 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6262 -> IGTPW_6361

  CI-20190529: 20190529
  CI_DRM_10807: 0cd0ae01802327aedf3ab152e91376b59443a099 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html
  IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_exec_whisper@contexts-engine
+igt@gem_exec_whisper@contexts-forked-engine
+igt@gem_exec_whisper@contexts-interruptible-engine
+igt@gem_exec_whisper@contexts-priority-engine
+igt@gem_exec_whisper@contexts-sync-engine
+igt@gem_exec_whisper@fds-engine
+igt@gem_exec_whisper@fds-forked-engine
+igt@gem_exec_whisper@fds-interruptible-engine
+igt@gem_exec_whisper@fds-priority-engine
+igt@gem_exec_whisper@fds-sync-engine
+igt@gem_exec_whisper@forked-engine
+igt@gem_exec_whisper@interruptible-engine
+igt@gem_exec_whisper@normal-engine
+igt@gem_exec_whisper@queues-engine
+igt@gem_exec_whisper@queues-forked-engine
+igt@gem_exec_whisper@queues-interruptible-engine
+igt@gem_exec_whisper@queues-priority-engine
+igt@gem_exec_whisper@queues-sync-engine
+igt@gem_exec_whisper@sync-engine
+igt@gem_sync@legacy-active
+igt@gem_sync@legacy-active-wakeup
+igt@gem_sync@legacy-default
+igt@gem_sync@legacy-double-wakeup
+igt@gem_sync@legacy-forked
+igt@gem_sync@legacy-forked-store
+igt@gem_sync@legacy-forked-switch
+igt@gem_sync@legacy-idle
+igt@gem_sync@legacy-many
+igt@gem_sync@legacy-store
+igt@gem_sync@legacy-switch
+igt@gem_sync@legacy-wakeup
-igt@gem_exec_whisper@contexts
-igt@gem_exec_whisper@contexts-forked
-igt@gem_exec_whisper@contexts-interruptible
-igt@gem_exec_whisper@contexts-priority
-igt@gem_exec_whisper@contexts-sync
-igt@gem_exec_whisper@fds
-igt@gem_exec_whisper@fds-forked
-igt@gem_exec_whisper@fds-interruptible
-igt@gem_exec_whisper@fds-priority
-igt@gem_exec_whisper@fds-sync
-igt@gem_exec_whisper@forked
-igt@gem_exec_whisper@interruptible
-igt@gem_exec_whisper@normal
-igt@gem_exec_whisper@queues
-igt@gem_exec_whisper@queues-forked
-igt@gem_exec_whisper@queues-interruptible
-igt@gem_exec_whisper@queues-priority
-igt@gem_exec_whisper@queues-sync
-igt@gem_exec_whisper@sync
-igt@gem_sync@active
-igt@gem_sync@active-wakeup
-igt@gem_sync@default
-igt@gem_sync@double-wakeup
-igt@gem_sync@forked
-igt@gem_sync@forked-store
-igt@gem_sync@forked-switch
-igt@gem_sync@idle
-igt@gem_sync@many
-igt@gem_sync@store
-igt@gem_sync@switch
-igt@gem_sync@wakeup

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html

--===============6586262050312449922==
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
<tr><td><b>Series:</b></td><td>Change duplicate names (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96381/">https://patchwork.freedesktop.org/series/96381/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10807 -&gt; IGTPW_6361</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html</p>
<h2>Participating hosts (28 -&gt; 32)</h2>
<p>Additional (4): fi-kbl-soraka fi-bsw-kefka fi-bsw-nick fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6361 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-kefka/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +63 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6262 -&gt; IGTPW_6361</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10807: 0cd0ae01802327aedf3ab152e91376b59443a099 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6361/index.html<br />
  IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_whisper@contexts-engine<br />
+igt@gem_exec_whisper@contexts-forked-engine<br />
+igt@gem_exec_whisper@contexts-interruptible-engine<br />
+igt@gem_exec_whisper@contexts-priority-engine<br />
+igt@gem_exec_whisper@contexts-sync-engine<br />
+igt@gem_exec_whisper@fds-engine<br />
+igt@gem_exec_whisper@fds-forked-engine<br />
+igt@gem_exec_whisper@fds-interruptible-engine<br />
+igt@gem_exec_whisper@fds-priority-engine<br />
+igt@gem_exec_whisper@fds-sync-engine<br />
+igt@gem_exec_whisper@forked-engine<br />
+igt@gem_exec_whisper@interruptible-engine<br />
+igt@gem_exec_whisper@normal-engine<br />
+igt@gem_exec_whisper@queues-engine<br />
+igt@gem_exec_whisper@queues-forked-engine<br />
+igt@gem_exec_whisper@queues-interruptible-engine<br />
+igt@gem_exec_whisper@queues-priority-engine<br />
+igt@gem_exec_whisper@queues-sync-engine<br />
+igt@gem_exec_whisper@sync-engine<br />
+igt@gem_sync@legacy-active<br />
+igt@gem_sync@legacy-active-wakeup<br />
+igt@gem_sync@legacy-default<br />
+igt@gem_sync@legacy-double-wakeup<br />
+igt@gem_sync@legacy-forked<br />
+igt@gem_sync@legacy-forked-store<br />
+igt@gem_sync@legacy-forked-switch<br />
+igt@gem_sync@legacy-idle<br />
+igt@gem_sync@legacy-many<br />
+igt@gem_sync@legacy-store<br />
+igt@gem_sync@legacy-switch<br />
+igt@gem_sync@legacy-wakeup<br />
-igt@gem_exec_whisper@contexts<br />
-igt@gem_exec_whisper@contexts-forked<br />
-igt@gem_exec_whisper@contexts-interruptible<br />
-igt@gem_exec_whisper@contexts-priority<br />
-igt@gem_exec_whisper@contexts-sync<br />
-igt@gem_exec_whisper@fds<br />
-igt@gem_exec_whisper@fds-forked<br />
-igt@gem_exec_whisper@fds-interruptible<br />
-igt@gem_exec_whisper@fds-priority<br />
-igt@gem_exec_whisper@fds-sync<br />
-igt@gem_exec_whisper@forked<br />
-igt@gem_exec_whisper@interruptible<br />
-igt@gem_exec_whisper@normal<br />
-igt@gem_exec_whisper@queues<br />
-igt@gem_exec_whisper@queues-forked<br />
-igt@gem_exec_whisper@queues-interruptible<br />
-igt@gem_exec_whisper@queues-priority<br />
-igt@gem_exec_whisper@queues-sync<br />
-igt@gem_exec_whisper@sync<br />
-igt@gem_sync@active<br />
-igt@gem_sync@active-wakeup<br />
-igt@gem_sync@default<br />
-igt@gem_sync@double-wakeup<br />
-igt@gem_sync@forked<br />
-igt@gem_sync@forked-store<br />
-igt@gem_sync@forked-switch<br />
-igt@gem_sync@idle<br />
-igt@gem_sync@many<br />
-igt@gem_sync@store<br />
-igt@gem_sync@switch<br />
-igt@gem_sync@wakeup</p>

</body>
</html>

--===============6586262050312449922==--
