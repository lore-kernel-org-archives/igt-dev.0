Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Apr 2020 15:05:13 -0000
Message-ID: <158687671376.30376.17732789322710105733@emeril.freedesktop.org>
References: <20200414102800.2867147-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200414102800.2867147-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Convert_to_dynamic_CRTC_test_groups_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: kms_flip: Convert to dynamic CRTC test groups (rev3)
URL   : https://patchwork.freedesktop.org/series/75827/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8295 -> IGTPW_4458
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8295 and IGTPW_4458:

### New IGT tests (108) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [2.35, 7.15] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 3.79] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [6.05, 7.41] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [5.53] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [3.75, 12.10] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [2.41, 10.50] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [2.33, 6.84] s

  * igt@kms_flip@basic-flip-vs-dpms@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [6.55] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [5.13, 10.36] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [2.31, 7.10] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [2.29, 3.81] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [5.99, 7.50] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [5.42] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [3.45, 12.93] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [2.34, 10.34] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [2.34, 6.74] s

  * igt@kms_flip@basic-flip-vs-dpms@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [6.32] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 8 pass(s)
    - Exec time: [5.14, 10.30] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [2.32, 7.11] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 3.78] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [5.65, 7.48] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 13 pass(s)
    - Exec time: [3.46, 8.44] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [2.34, 6.74] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 6 pass(s)
    - Exec time: [2.33, 20.54] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [6.76, 6.81] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [5.95] s

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.29, 6.91] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [2.33, 7.17] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [2.31, 3.77] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [5.99, 7.43] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [5.36] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [3.71, 11.46] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [2.37, 10.47] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [2.29, 6.80] s

  * igt@kms_flip@basic-flip-vs-modeset@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [6.54] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [5.13, 10.50] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 7.14] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 3.77] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [5.68, 7.50] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [3.46, 12.51] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [2.30, 10.22] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [2.29, 6.74] s

  * igt@kms_flip@basic-flip-vs-modeset@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [6.30] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 9 pass(s)
    - Exec time: [5.08, 10.23] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [2.31, 7.13] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 3.75] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [5.59, 7.50] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 13 pass(s)
    - Exec time: [3.47, 8.45] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [2.30, 6.72] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 20.38] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [6.81, 6.85] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [5.92] s

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [6.17, 6.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [1.82, 4.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 2.35] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [3.64, 4.18] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [2.62, 6.70] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [1.61, 5.78] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.54, 3.75] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [3.87] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [2.95, 5.62] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [1.54, 4.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 2.36] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [3.53, 4.13] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [2.62, 6.66] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [1.54, 5.70] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.54, 3.71] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [3.89] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 9 pass(s)
    - Exec time: [2.90, 5.54] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [1.55, 4.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 2.35] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [3.51, 4.13] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 13 pass(s)
    - Exec time: [2.62, 5.25] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [1.54, 3.71] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 6 pass(s)
    - Exec time: [1.54, 10.81] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [3.75, 3.93] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 4.64] s

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [1.49, 3.75] s

  * igt@kms_flip@basic-plain-flip@a-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [1.19, 2.10] s

  * igt@kms_flip@basic-plain-flip@a-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [3.40, 3.90] s

  * igt@kms_flip@basic-plain-flip@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [2.27, 6.42] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [1.26, 5.35] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.21, 3.47] s

  * igt@kms_flip@basic-plain-flip@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - Statuses : 10 pass(s)
    - Exec time: [2.66, 5.35] s

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [1.21, 3.74] s

  * igt@kms_flip@basic-plain-flip@b-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [1.20, 2.09] s

  * igt@kms_flip@basic-plain-flip@b-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [3.28, 3.85] s

  * igt@kms_flip@basic-plain-flip@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [2.88] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 14 pass(s)
    - Exec time: [2.24, 6.38] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 7 pass(s)
    - Exec time: [1.21, 5.28] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.21, 3.44] s

  * igt@kms_flip@basic-plain-flip@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - Statuses : 9 pass(s)
    - Exec time: [2.61, 5.26] s

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - Statuses : 6 pass(s)
    - Exec time: [1.21, 3.74] s

  * igt@kms_flip@basic-plain-flip@c-dp2:
    - Statuses : 6 pass(s)
    - Exec time: [1.20, 2.10] s

  * igt@kms_flip@basic-plain-flip@c-dsi1:
    - Statuses : 4 pass(s)
    - Exec time: [3.26, 3.84] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 13 pass(s)
    - Exec time: [2.24, 4.99] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 3 pass(s)
    - Exec time: [1.21, 3.42] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 6 pass(s)
    - Exec time: [1.21, 10.38] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [3.49] s

  * igt@kms_flip@basic-plain-flip@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - Statuses : 2 pass(s)
    - Exec time: [3.71, 4.36] s

  

Known issues
------------

  Here are the changes found in IGTPW_4458 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@active:
    - fi-bdw-5557u:       [PASS][1] -> [DMESG-FAIL][2] ([i915#765])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/fi-bdw-5557u/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/fi-bdw-5557u/igt@i915_selftest@live@active.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [INCOMPLETE][3] ([i915#69]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8295/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  
  [i915#69]: https://gitlab.freedesktop.org/drm/intel/issues/69
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765


Participating hosts (49 -> 43)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4458

  CI-20190529: 20190529
  CI_DRM_8295: 4cb6dbe0a641129fd07ad1fbfcd6e7b4f03ec5c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4458: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4458/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
