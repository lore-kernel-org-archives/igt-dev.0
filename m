Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4566910258730152012=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Mon, 23 May 2022 18:57:57 -0000
Message-ID: <165333227748.9281.7125147308622253685@emeril.freedesktop.org>
References: <20220523180954.1717810-1-ananya.sharma@intel.com>
In-Reply-To: <20220523180954.1717810-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Convert_subtest_to_dynamic?=
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

--===============4566910258730152012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Convert subtest to dynamic
URL   : https://patchwork.freedesktop.org/series/104287/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11691 -> IGTPW_7159
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html

Participating hosts (45 -> 44)
------------------------------

  Additional (2): bat-dg2-8 fi-tgl-u2 
  Missing    (3): fi-icl-u2 fi-bdw-5557u bat-dg1-5 

New tests
---------

  New tests have been introduced between CI_DRM_11691 and IGTPW_7159:

### New IGT tests (112) ###

  * igt@dmabuf@all@dma_fence_chain:
    - Statuses : 37 pass(s)
    - Exec time: [5.23, 7.74] s

  * igt@gem_busy@busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_busy@busy@all:
    - Statuses : 42 pass(s)
    - Exec time: [0.01, 0.30] s

  * igt@gem_exec_parallel@engines:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_parallel@engines@basic:
    - Statuses : 41 pass(s) 1 skip(s)
    - Exec time: [0.00, 10.58] s

  * igt@gem_exec_parallel@engines@contexts:
    - Statuses : 39 pass(s) 3 skip(s)
    - Exec time: [0.00, 18.32] s

  * igt@gem_exec_parallel@engines@fds:
    - Statuses : 37 pass(s) 5 skip(s)
    - Exec time: [0.0, 15.24] s

  * igt@gem_exec_store@basic:
    - Statuses : 41 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@gem_wait@busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_wait@busy@all:
    - Statuses : 42 pass(s)
    - Exec time: [0.51, 0.61] s

  * igt@gem_wait@wait:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_wait@wait@all:
    - Statuses : 42 pass(s)
    - Exec time: [1.01, 1.11] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.70, 0.87] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 0.74] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.56, 2.00] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 10 pass(s)
    - Exec time: [2.68, 3.63] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.68, 0.88] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.29] s

  * igt@kms_flip@basic-flip-vs-dpms@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.69, 1.62] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.71, 0.80] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 0.73] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 1.71] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 10 pass(s)
    - Exec time: [2.29, 3.33] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.64, 0.85] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.63, 1.09] s

  * igt@kms_flip@basic-flip-vs-dpms@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.65, 1.35] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 0.81] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.60, 0.74] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 1.61] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 9 pass(s)
    - Exec time: [2.28, 2.51] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.65, 0.85] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 2.54] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.71, 0.86] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [2.30, 2.37] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.71, 0.90] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 0.74] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.57, 1.98] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 1 dmesg-warn(s) 9 pass(s)
    - Exec time: [2.66, 3.93] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.66, 0.91] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.21] s

  * igt@kms_flip@basic-flip-vs-modeset@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.69, 1.74] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.71, 0.81] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 0.73] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 1.59] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 10 pass(s)
    - Exec time: [2.28, 3.45] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.64, 0.80] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 0.89] s

  * igt@kms_flip@basic-flip-vs-modeset@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.66, 1.44] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [0.73, 0.81] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.61, 0.73] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.35, 1.52] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 9 pass(s)
    - Exec time: [2.30, 3.47] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.59, 0.81] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.59, 2.68] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.74, 0.88] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [2.37, 3.45] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [1.07, 1.16] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.90, 1.07] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.84, 1.97] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 10 pass(s)
    - Exec time: [1.98, 2.99] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.94, 1.24] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.95, 1.41] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [1.02, 1.88] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [1.00, 1.16] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.90, 1.07] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.71, 1.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 10 pass(s)
    - Exec time: [1.97, 2.74] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.90, 1.21] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.90, 1.30] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.89] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.96, 1.64] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [1.00, 1.01] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.91, 1.07] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.68, 1.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 9 pass(s)
    - Exec time: [1.99, 2.50] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.90, 1.19] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.98] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [1.12, 1.15] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.69] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [1.98, 2.24] s

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.73, 0.79] s

  * igt@kms_flip@basic-plain-flip@a-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.62, 0.68] s

  * igt@kms_flip@basic-plain-flip@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.52, 1.64] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 1 dmesg-warn(s) 9 pass(s)
    - Exec time: [1.75, 2.58] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.67, 0.88] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.14] s

  * igt@kms_flip@basic-plain-flip@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.53] s

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.73, 1.60] s

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - Statuses : 3 pass(s)
    - Exec time: [0.72, 0.77] s

  * igt@kms_flip@basic-plain-flip@b-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.62, 0.68] s

  * igt@kms_flip@basic-plain-flip@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.43, 1.47] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 10 pass(s)
    - Exec time: [1.71, 2.45] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 9 pass(s)
    - Exec time: [0.61, 0.83] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 4 pass(s)
    - Exec time: [0.61, 1.04] s

  * igt@kms_flip@basic-plain-flip@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [0.67, 1.36] s

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - Statuses : 2 pass(s)
    - Exec time: [0.73, 0.75] s

  * igt@kms_flip@basic-plain-flip@c-dp2:
    - Statuses : 3 pass(s)
    - Exec time: [0.62, 0.70] s

  * igt@kms_flip@basic-plain-flip@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.41, 1.47] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 9 pass(s)
    - Exec time: [1.73, 2.24] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 0.83] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.62, 2.53] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 3 pass(s)
    - Exec time: [0.70, 0.83] s

  * igt@kms_flip@basic-plain-flip@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - Statuses : 3 pass(s)
    - Exec time: [1.73, 1.79] s

  

Known issues
------------

  Here are the changes found in IGTPW_7159 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][2] -> [INCOMPLETE][3] ([i915#4418])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-bsw-n3050:       [PASS][4] -> [DMESG-FAIL][5] ([i915#2373])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][6] -> [INCOMPLETE][7] ([i915#3921])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][8] -> [DMESG-FAIL][9] ([i915#4528])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          NOTRUN -> [DMESG-WARN][10] ([i915#402]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [PASS][11] -> [DMESG-WARN][12] ([i915#3576]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-4/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-tgl-u2:          NOTRUN -> [SKIP][15] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-u2:          NOTRUN -> [SKIP][16] ([i915#4103]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][17] ([fdo#109285])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-u2:          NOTRUN -> [SKIP][19] ([i915#3555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][20] ([i915#3301])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-g3258:       [INCOMPLETE][21] ([i915#3303] / [i915#4785]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-bsw-n3050:       [DMESG-FAIL][23] ([i915#3428]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - {bat-adlp-6}:       [DMESG-FAIL][25] -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-6/igt@i915_selftest@live@workarounds.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-6/igt@i915_selftest@live@workarounds.html
    - bat-adlp-4:         [DMESG-WARN][27] -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-4/igt@i915_selftest@live@workarounds.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-4/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1 (NEW):
    - bat-adlp-4:         [DMESG-WARN][29] ([i915#3576]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-adlp-6}:       [DMESG-WARN][31] ([i915#3576]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5879]: https://gitlab.freedesktop.org/drm/intel/issues/5879
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6485 -> IGTPW_7159

  CI-20190529: 20190529
  CI_DRM_11691: 20762208303d98e86cd19306752ee2c830fe4f2b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7159: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html
  IGT_6485: 51663917b40d36086cc1c555ce4f67b22937694d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html

--===============4566910258730152012==
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
<tr><td><b>Series:</b></td><td>tests/kms: Convert subtest to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104287/">https://patchwork.freedesktop.org/series/104287/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11691 -&gt; IGTPW_7159</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Additional (2): bat-dg2-8 fi-tgl-u2 <br />
  Missing    (3): fi-icl-u2 fi-bdw-5557u bat-dg1-5 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11691 and IGTPW_7159:</p>
<h3>New IGT tests (112)</h3>
<ul>
<li>
<p>igt@dmabuf@all@dma_fence_chain:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [5.23, 7.74] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_busy@busy@all:</p>
<ul>
<li>Statuses : 42 pass(s)</li>
<li>Exec time: [0.01, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>Statuses : 41 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 10.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>Statuses : 39 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 18.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>Statuses : 37 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 15.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>Statuses : 41 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>Statuses : 42 pass(s)</li>
<li>Exec time: [0.51, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>Statuses : 42 pass(s)</li>
<li>Exec time: [1.01, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.70, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.56, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [2.68, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.68, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.69, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.71, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [2.29, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.64, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.63, 1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.65, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.60, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [2.28, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.65, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.60, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.71, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.30, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.71, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.57, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 9 pass(s)</li>
<li>Exec time: [2.66, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.66, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.69, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.71, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [2.28, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.64, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.66, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.73, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.61, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.35, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [2.30, 3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.59, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.59, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.74, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.37, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.07, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.90, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.84, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [1.98, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.94, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.95, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [1.02, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.00, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.90, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.71, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [1.97, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.90, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.90, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.96, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.00, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.91, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.68, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.99, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.90, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.12, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.98, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.73, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.62, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.52, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 9 pass(s)</li>
<li>Exec time: [1.75, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.67, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.73, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.72, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.62, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.43, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [1.71, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.61, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.61, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-vga1:</p>
<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.67, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.73, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.62, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.41, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [1.73, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.61, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.62, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-vga1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.70, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-edp1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.73, 1.79] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7159 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-tgl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/fi-bsw-n3050/igt@i915_selftest@live@late_gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-6/igt@i915_selftest@live@workarounds.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-4/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-4/igt@i915_selftest@live@workarounds.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1 (NEW):</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11691/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/bat-adlp-6/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6485 -&gt; IGTPW_7159</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11691: 20762208303d98e86cd19306752ee2c830fe4f2b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7159: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7159/index.html<br />
  IGT_6485: 51663917b40d36086cc1c555ce4f67b22937694d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4566910258730152012==--
