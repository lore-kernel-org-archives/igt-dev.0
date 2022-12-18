Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3277692812405527686=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 18 Dec 2022 21:39:24 -0000
Message-ID: <167139956409.28977.5585690835957231116@emeril.freedesktop.org>
References: <20221216162854.294042-1-mcanal@igalia.com>
In-Reply-To: <20221216162854.294042-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVkM0IElH?=
 =?utf-8?q?T_Tests_Updates_=28rev3=29?=
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

--===============3277692812405527686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VC4 IGT Tests Updates (rev3)
URL   : https://patchwork.freedesktop.org/series/110948/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12512 -> IGTPW_8242
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-rkl-11600 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8242 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-guc:         NOTRUN -> [SKIP][3] ([fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][4] ([i915#4983]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/bat-rpls-2/igt@i915_selftest@live@reset.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][6] ([i915#6367]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - fi-rkl-guc:         [INCOMPLETE][8] ([i915#4983]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/fi-rkl-guc/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7096 -> IGTPW_8242

  CI-20190529: 20190529
  CI_DRM_12512: 32c0d1e3ac9cf7e7b64a53dcafeeb7173a2f511b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8242: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html
  IGT_7096: f2f515390fb11554d22c7b78b94e288026545326 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@vc4/vc4_create_bo@create-bo-0
+igt@vc4/vc4_create_bo@create-bo-4096
+igt@vc4/vc4_create_bo@create-bo-zeroed
+igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done
+igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done
+igt@vc4/vc4_label_bo@set-bad-handle
+igt@vc4/vc4_label_bo@set-bad-name
+igt@vc4/vc4_label_bo@set-kernel-name
+igt@vc4/vc4_label_bo@set-label
+igt@vc4/vc4_lookup_fail@bad-color-write
+igt@vc4/vc4_perfmon@create-perfmon-0
+igt@vc4/vc4_perfmon@create-perfmon-exceed
+igt@vc4/vc4_perfmon@create-perfmon-invalid-events
+igt@vc4/vc4_perfmon@create-single-perfmon
+igt@vc4/vc4_perfmon@create-two-perfmon
+igt@vc4/vc4_perfmon@destroy-invalid-perfmon
+igt@vc4/vc4_perfmon@destroy-valid-perfmon
+igt@vc4/vc4_perfmon@get-values-invalid-perfmon
+igt@vc4/vc4_perfmon@get-values-invalid-pointer
+igt@vc4/vc4_perfmon@get-values-valid-perfmon
+igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem
+igt@vc4/vc4_purgeable_bo@access-purged-bo-mem
+igt@vc4/vc4_purgeable_bo@free-purged-bo
+igt@vc4/vc4_purgeable_bo@mark-purgeable
+igt@vc4/vc4_purgeable_bo@mark-purgeable-twice
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice
+igt@vc4/vc4_purgeable_bo@mark-willneed
+igt@vc4/vc4_tiling@get-after-free
+igt@vc4/vc4_tiling@get-bad-flags
+igt@vc4/vc4_tiling@get-bad-handle
+igt@vc4/vc4_tiling@get-bad-modifier
+igt@vc4/vc4_tiling@set-bad-flags
+igt@vc4/vc4_tiling@set-bad-handle
+igt@vc4/vc4_tiling@set-bad-modifier
+igt@vc4/vc4_tiling@set-get
+igt@vc4/vc4_wait_bo@bad-bo
+igt@vc4/vc4_wait_bo@bad-pad
+igt@vc4/vc4_wait_bo@unused-bo-0ns
+igt@vc4/vc4_wait_bo@unused-bo-1ns
+igt@vc4/vc4_wait_bo@used-bo
+igt@vc4/vc4_wait_bo@used-bo-0ns
+igt@vc4/vc4_wait_bo@used-bo-1ns
+igt@vc4/vc4_wait_seqno@bad-seqno-0ns
+igt@vc4/vc4_wait_seqno@bad-seqno-1ns
-igt@vc4_create_bo@create-bo-0
-igt@vc4_create_bo@create-bo-4096
-igt@vc4_create_bo@create-bo-zeroed
-igt@vc4_dmabuf_poll@poll-read-waits-until-write-done
-igt@vc4_dmabuf_poll@poll-write-waits-until-write-done
-igt@vc4_label_bo@set-bad-handle
-igt@vc4_label_bo@set-bad-name
-igt@vc4_label_bo@set-kernel-name
-igt@vc4_label_bo@set-label
-igt@vc4_lookup_fail@bad-color-write
-igt@vc4_purgeable_bo@access-purgeable-bo-mem
-igt@vc4_purgeable_bo@access-purged-bo-mem
-igt@vc4_purgeable_bo@free-purged-bo
-igt@vc4_purgeable_bo@mark-purgeable
-igt@vc4_purgeable_bo@mark-purgeable-twice
-igt@vc4_purgeable_bo@mark-unpurgeable-check-retained
-igt@vc4_purgeable_bo@mark-unpurgeable-purged
-igt@vc4_purgeable_bo@mark-unpurgeable-twice
-igt@vc4_purgeable_bo@mark-willneed
-igt@vc4_tiling@get-after-free
-igt@vc4_tiling@get-bad-flags
-igt@vc4_tiling@get-bad-handle
-igt@vc4_tiling@get-bad-modifier
-igt@vc4_tiling@set-bad-flags
-igt@vc4_tiling@set-bad-handle
-igt@vc4_tiling@set-bad-modifier
-igt@vc4_tiling@set-get
-igt@vc4_wait_bo@bad-bo
-igt@vc4_wait_bo@bad-pad
-igt@vc4_wait_bo@unused-bo-0ns
-igt@vc4_wait_bo@unused-bo-1ns
-igt@vc4_wait_bo@used-bo
-igt@vc4_wait_bo@used-bo-0ns
-igt@vc4_wait_bo@used-bo-1ns
-igt@vc4_wait_seqno@bad-seqno-0ns
-igt@vc4_wait_seqno@bad-seqno-1ns

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html

--===============3277692812405527686==
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
<tr><td><b>Series:</b></td><td>VC4 IGT Tests Updates (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110948/">https://patchwork.freedesktop.org/series/110948/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12512 -&gt; IGTPW_8242</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-rkl-11600 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8242 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12512/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/fi-rkl-guc/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7096 -&gt; IGTPW_8242</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12512: 32c0d1e3ac9cf7e7b64a53dcafeeb7173a2f511b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8242: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8242/index.html<br />
  IGT_7096: f2f515390fb11554d22c7b78b94e288026545326 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@vc4/vc4_create_bo@create-bo-0<br />
+igt@vc4/vc4_create_bo@create-bo-4096<br />
+igt@vc4/vc4_create_bo@create-bo-zeroed<br />
+igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done<br />
+igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done<br />
+igt@vc4/vc4_label_bo@set-bad-handle<br />
+igt@vc4/vc4_label_bo@set-bad-name<br />
+igt@vc4/vc4_label_bo@set-kernel-name<br />
+igt@vc4/vc4_label_bo@set-label<br />
+igt@vc4/vc4_lookup_fail@bad-color-write<br />
+igt@vc4/vc4_perfmon@create-perfmon-0<br />
+igt@vc4/vc4_perfmon@create-perfmon-exceed<br />
+igt@vc4/vc4_perfmon@create-perfmon-invalid-events<br />
+igt@vc4/vc4_perfmon@create-single-perfmon<br />
+igt@vc4/vc4_perfmon@create-two-perfmon<br />
+igt@vc4/vc4_perfmon@destroy-invalid-perfmon<br />
+igt@vc4/vc4_perfmon@destroy-valid-perfmon<br />
+igt@vc4/vc4_perfmon@get-values-invalid-perfmon<br />
+igt@vc4/vc4_perfmon@get-values-invalid-pointer<br />
+igt@vc4/vc4_perfmon@get-values-valid-perfmon<br />
+igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem<br />
+igt@vc4/vc4_purgeable_bo@access-purged-bo-mem<br />
+igt@vc4/vc4_purgeable_bo@free-purged-bo<br />
+igt@vc4/vc4_purgeable_bo@mark-purgeable<br />
+igt@vc4/vc4_purgeable_bo@mark-purgeable-twice<br />
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained<br />
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged<br />
+igt@vc4/vc4_purgeable_bo@mark-unpurgeable-twice<br />
+igt@vc4/vc4_purgeable_bo@mark-willneed<br />
+igt@vc4/vc4_tiling@get-after-free<br />
+igt@vc4/vc4_tiling@get-bad-flags<br />
+igt@vc4/vc4_tiling@get-bad-handle<br />
+igt@vc4/vc4_tiling@get-bad-modifier<br />
+igt@vc4/vc4_tiling@set-bad-flags<br />
+igt@vc4/vc4_tiling@set-bad-handle<br />
+igt@vc4/vc4_tiling@set-bad-modifier<br />
+igt@vc4/vc4_tiling@set-get<br />
+igt@vc4/vc4_wait_bo@bad-bo<br />
+igt@vc4/vc4_wait_bo@bad-pad<br />
+igt@vc4/vc4_wait_bo@unused-bo-0ns<br />
+igt@vc4/vc4_wait_bo@unused-bo-1ns<br />
+igt@vc4/vc4_wait_bo@used-bo<br />
+igt@vc4/vc4_wait_bo@used-bo-0ns<br />
+igt@vc4/vc4_wait_bo@used-bo-1ns<br />
+igt@vc4/vc4_wait_seqno@bad-seqno-0ns<br />
+igt@vc4/vc4_wait_seqno@bad-seqno-1ns<br />
-igt@vc4_create_bo@create-bo-0<br />
-igt@vc4_create_bo@create-bo-4096<br />
-igt@vc4_create_bo@create-bo-zeroed<br />
-igt@vc4_dmabuf_poll@poll-read-waits-until-write-done<br />
-igt@vc4_dmabuf_poll@poll-write-waits-until-write-done<br />
-igt@vc4_label_bo@set-bad-handle<br />
-igt@vc4_label_bo@set-bad-name<br />
-igt@vc4_label_bo@set-kernel-name<br />
-igt@vc4_label_bo@set-label<br />
-igt@vc4_lookup_fail@bad-color-write<br />
-igt@vc4_purgeable_bo@access-purgeable-bo-mem<br />
-igt@vc4_purgeable_bo@access-purged-bo-mem<br />
-igt@vc4_purgeable_bo@free-purged-bo<br />
-igt@vc4_purgeable_bo@mark-purgeable<br />
-igt@vc4_purgeable_bo@mark-purgeable-twice<br />
-igt@vc4_purgeable_bo@mark-unpurgeable-check-retained<br />
-igt@vc4_purgeable_bo@mark-unpurgeable-purged<br />
-igt@vc4_purgeable_bo@mark-unpurgeable-twice<br />
-igt@vc4_purgeable_bo@mark-willneed<br />
-igt@vc4_tiling@get-after-free<br />
-igt@vc4_tiling@get-bad-flags<br />
-igt@vc4_tiling@get-bad-handle<br />
-igt@vc4_tiling@get-bad-modifier<br />
-igt@vc4_tiling@set-bad-flags<br />
-igt@vc4_tiling@set-bad-handle<br />
-igt@vc4_tiling@set-bad-modifier<br />
-igt@vc4_tiling@set-get<br />
-igt@vc4_wait_bo@bad-bo<br />
-igt@vc4_wait_bo@bad-pad<br />
-igt@vc4_wait_bo@unused-bo-0ns<br />
-igt@vc4_wait_bo@unused-bo-1ns<br />
-igt@vc4_wait_bo@used-bo<br />
-igt@vc4_wait_bo@used-bo-0ns<br />
-igt@vc4_wait_bo@used-bo-1ns<br />
-igt@vc4_wait_seqno@bad-seqno-0ns<br />
-igt@vc4_wait_seqno@bad-seqno-1ns</p>

</body>
</html>

--===============3277692812405527686==--
