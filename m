Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0780241669386470615=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 24 May 2023 10:07:15 -0000
Message-ID: <168492283512.11321.3837803333039227674@emeril.freedesktop.org>
References: <20230524090954.289229-1-swati2.sharma@intel.com>
In-Reply-To: <20230524090954.289229-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdsc=3A_add_extended_flag?=
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

--===============0780241669386470615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_dsc: add extended flag
URL   : https://patchwork.freedesktop.org/series/118278/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13180 -> IGTPW_9027
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

New tests
---------

  New tests have been introduced between CI_DRM_13180 and IGTPW_9027:

### New IGT tests (84) ###

  * igt@gem_exec_parallel@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_parallel@engines@basic:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_exec_parallel@engines@contexts:
    - Statuses : 36 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_parallel@engines@fds:
    - Statuses : 35 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_store@basic:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@allocator-basic:
    - Statuses : 34 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses : 34 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@a-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@b-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@c-dp2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9027 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#4613]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [PASS][2] -> [DMESG-WARN][3] ([i915#6367])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-rpls-2/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][4] ([fdo#109271]) +16 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][5] ([i915#1845] / [i915#5354]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][6] -> [FAIL][7] ([i915#7932])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#4579])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [DMESG-WARN][9] ([i915#8073]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [DMESG-FAIL][11] ([i915#8497]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@flip:
    - fi-cfl-8109u:       [INCOMPLETE][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/fi-cfl-8109u/igt@kms_busy@basic@flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8073]: https://gitlab.freedesktop.org/drm/intel/issues/8073
  [i915#8189]: https://gitlab.freedesktop.org/drm/intel/issues/8189
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7301 -> IGTPW_9027

  CI-20190529: 20190529
  CI_DRM_13180: e48bc7435824325de6a73fae68dc521e2be13960 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9027: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html
  IGT_7301: 4b388fa87e1281587e723ef864e466fe396c3381 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html

--===============0780241669386470615==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_dsc: add extended flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/118278/">https://patchwork.freedesktop.org/series/118278/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13180 -&gt; IGTPW_9027</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13180 and IGTPW_9027:</p>
<h3>New IGT tests (84)</h3>
<ul>
<li>
<p>igt@gem_exec_parallel@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 36 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 35 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 34 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 34 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9027 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/bat-rpls-2/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8073">i915#8073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13180/fi-cfl-8109u/igt@kms_busy@basic@flip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/fi-cfl-8109u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7301 -&gt; IGTPW_9027</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13180: e48bc7435824325de6a73fae68dc521e2be13960 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9027: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9027/index.html<br />
  IGT_7301: 4b388fa87e1281587e723ef864e466fe396c3381 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0780241669386470615==--
