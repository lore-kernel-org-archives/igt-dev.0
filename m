Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Apr 2020 12:53:58 -0000
Message-ID: <158660963847.322.585097138468742929@emeril.freedesktop.org>
References: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=5D_igt=3A_Allow_=27=3A=27_in_subtest_na?=
 =?utf-8?q?mes_=28rev2=29?=
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

Series: series starting with [i-g-t] igt: Allow ':' in subtest names (rev2)
URL   : https://patchwork.freedesktop.org/series/75832/
State : success

== Summary ==

CI Bug Log - changes from IGT_5588 -> IGTPW_4449
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/index.html

New tests
---------

  New tests have been introduced between IGT_5588 and IGTPW_4449:

### New IGT tests (108) ###

  * igt@kms_flip@basic-flip-vs-dpms@a::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [2.37, 7.15] s

  * igt@kms_flip@basic-flip-vs-dpms@a::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 3.81] s

  * igt@kms_flip@basic-flip-vs-dpms@a::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [6.01, 7.42] s

  * igt@kms_flip@basic-flip-vs-dpms@a::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.35] s

  * igt@kms_flip@basic-flip-vs-dpms@a::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [3.76, 12.92] s

  * igt@kms_flip@basic-flip-vs-dpms@a::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.42, 10.52] s

  * igt@kms_flip@basic-flip-vs-dpms@a::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.29, 6.83] s

  * igt@kms_flip@basic-flip-vs-dpms@a::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.60] s

  * igt@kms_flip@basic-flip-vs-dpms@a::vga-1:
    - Statuses : 11 pass(s)
    - Exec time: [5.11, 10.37] s

  * igt@kms_flip@basic-flip-vs-dpms@b::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 7.12] s

  * igt@kms_flip@basic-flip-vs-dpms@b::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.29, 3.84] s

  * igt@kms_flip@basic-flip-vs-dpms@b::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.60, 7.46] s

  * igt@kms_flip@basic-flip-vs-dpms@b::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.47] s

  * igt@kms_flip@basic-flip-vs-dpms@b::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [3.45, 12.35] s

  * igt@kms_flip@basic-flip-vs-dpms@b::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.33, 10.37] s

  * igt@kms_flip@basic-flip-vs-dpms@b::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.33, 6.74] s

  * igt@kms_flip@basic-flip-vs-dpms@b::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.28] s

  * igt@kms_flip@basic-flip-vs-dpms@b::vga-1:
    - Statuses : 10 pass(s)
    - Exec time: [5.08, 10.26] s

  * igt@kms_flip@basic-flip-vs-dpms@c::dp-1:
    - Statuses : 6 pass(s)
    - Exec time: [2.31, 7.11] s

  * igt@kms_flip@basic-flip-vs-dpms@c::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.30, 3.81] s

  * igt@kms_flip@basic-flip-vs-dpms@c::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.80, 7.48] s

  * igt@kms_flip@basic-flip-vs-dpms@c::edp-1:
    - Statuses : 13 pass(s)
    - Exec time: [3.45, 8.45] s

  * igt@kms_flip@basic-flip-vs-dpms@c::hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.33, 6.75] s

  * igt@kms_flip@basic-flip-vs-dpms@c::hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.31, 20.48] s

  * igt@kms_flip@basic-flip-vs-dpms@c::vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.78, 6.83] s

  * igt@kms_flip@basic-flip-vs-dpms@d::dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.95] s

  * igt@kms_flip@basic-flip-vs-dpms@d::edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.38, 6.90] s

  * igt@kms_flip@basic-flip-vs-modeset@a::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [2.36, 7.18] s

  * igt@kms_flip@basic-flip-vs-modeset@a::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.32, 3.85] s

  * igt@kms_flip@basic-flip-vs-modeset@a::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.93, 7.45] s

  * igt@kms_flip@basic-flip-vs-modeset@a::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.46] s

  * igt@kms_flip@basic-flip-vs-modeset@a::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [3.72, 12.90] s

  * igt@kms_flip@basic-flip-vs-modeset@a::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.40, 10.29] s

  * igt@kms_flip@basic-flip-vs-modeset@a::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.30, 6.83] s

  * igt@kms_flip@basic-flip-vs-modeset@a::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.58] s

  * igt@kms_flip@basic-flip-vs-modeset@a::vga-1:
    - Statuses : 11 pass(s)
    - Exec time: [5.17, 10.31] s

  * igt@kms_flip@basic-flip-vs-modeset@b::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 7.16] s

  * igt@kms_flip@basic-flip-vs-modeset@b::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.32, 3.88] s

  * igt@kms_flip@basic-flip-vs-modeset@b::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.86, 7.05] s

  * igt@kms_flip@basic-flip-vs-modeset@b::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  * igt@kms_flip@basic-flip-vs-modeset@b::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [3.46, 12.48] s

  * igt@kms_flip@basic-flip-vs-modeset@b::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [2.29, 10.26] s

  * igt@kms_flip@basic-flip-vs-modeset@b::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [2.29, 6.78] s

  * igt@kms_flip@basic-flip-vs-modeset@b::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.30] s

  * igt@kms_flip@basic-flip-vs-modeset@b::vga-1:
    - Statuses : 10 pass(s)
    - Exec time: [5.07, 10.31] s

  * igt@kms_flip@basic-flip-vs-modeset@c::dp-1:
    - Statuses : 6 pass(s)
    - Exec time: [2.32, 7.17] s

  * igt@kms_flip@basic-flip-vs-modeset@c::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.31, 3.82] s

  * igt@kms_flip@basic-flip-vs-modeset@c::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [5.88, 7.50] s

  * igt@kms_flip@basic-flip-vs-modeset@c::edp-1:
    - Statuses : 13 pass(s)
    - Exec time: [3.47, 8.51] s

  * igt@kms_flip@basic-flip-vs-modeset@c::hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [2.30, 6.78] s

  * igt@kms_flip@basic-flip-vs-modeset@c::hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [2.29, 20.40] s

  * igt@kms_flip@basic-flip-vs-modeset@c::vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.76, 6.81] s

  * igt@kms_flip@basic-flip-vs-modeset@d::dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.84] s

  * igt@kms_flip@basic-flip-vs-modeset@d::edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [6.21, 6.91] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.83, 4.03] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 2.37] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.58, 4.19] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [2.61, 6.70] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.61, 5.64] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [1.54, 3.77] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.88] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a::vga-1:
    - Statuses : 10 pass(s)
    - Exec time: [2.94, 5.62] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.54, 4.02] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 2.37] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.50, 4.14] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [2.62, 6.67] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.54, 5.57] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [1.54, 3.71] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.89] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b::vga-1:
    - Statuses : 9 pass(s)
    - Exec time: [2.90, 5.55] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::dp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.54, 4.00] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 2.36] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.48, 4.13] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::edp-1:
    - Statuses : 13 pass(s)
    - Exec time: [2.62, 5.35] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.54, 3.71] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.54, 10.58] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c::vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.77, 3.92] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d::dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.51] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d::edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 4.61] s

  * igt@kms_flip@basic-plain-flip@a::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.50, 3.75] s

  * igt@kms_flip@basic-plain-flip@a::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.20, 2.08] s

  * igt@kms_flip@basic-plain-flip@a::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.37, 3.88] s

  * igt@kms_flip@basic-plain-flip@a::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.86] s

  * igt@kms_flip@basic-plain-flip@a::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [2.26, 6.42] s

  * igt@kms_flip@basic-plain-flip@a::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.27, 5.32] s

  * igt@kms_flip@basic-plain-flip@a::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [1.21, 3.48] s

  * igt@kms_flip@basic-plain-flip@a::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_flip@basic-plain-flip@a::vga-1:
    - Statuses : 11 pass(s)
    - Exec time: [2.66, 5.34] s

  * igt@kms_flip@basic-plain-flip@b::dp-1:
    - Statuses : 7 pass(s)
    - Exec time: [1.21, 3.74] s

  * igt@kms_flip@basic-plain-flip@b::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.20, 2.09] s

  * igt@kms_flip@basic-plain-flip@b::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.24, 3.85] s

  * igt@kms_flip@basic-plain-flip@b::dvi-d-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.88] s

  * igt@kms_flip@basic-plain-flip@b::edp-1:
    - Statuses : 14 pass(s)
    - Exec time: [2.24, 6.41] s

  * igt@kms_flip@basic-plain-flip@b::hdmi-a-1:
    - Statuses : 8 pass(s)
    - Exec time: [1.21, 5.26] s

  * igt@kms_flip@basic-plain-flip@b::hdmi-a-2:
    - Statuses : 5 pass(s)
    - Exec time: [1.21, 3.44] s

  * igt@kms_flip@basic-plain-flip@b::lvds-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_flip@basic-plain-flip@b::vga-1:
    - Statuses : 10 pass(s)
    - Exec time: [2.61, 5.27] s

  * igt@kms_flip@basic-plain-flip@c::dp-1:
    - Statuses : 6 pass(s)
    - Exec time: [1.21, 3.72] s

  * igt@kms_flip@basic-plain-flip@c::dp-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.20, 2.08] s

  * igt@kms_flip@basic-plain-flip@c::dsi-1:
    - Statuses : 4 pass(s)
    - Exec time: [3.25, 3.85] s

  * igt@kms_flip@basic-plain-flip@c::edp-1:
    - Statuses : 13 pass(s)
    - Exec time: [2.24, 4.98] s

  * igt@kms_flip@basic-plain-flip@c::hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.21, 3.42] s

  * igt@kms_flip@basic-plain-flip@c::hdmi-a-2:
    - Statuses : 6 pass(s)
    - Exec time: [1.21, 10.28] s

  * igt@kms_flip@basic-plain-flip@c::vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.49] s

  * igt@kms_flip@basic-plain-flip@d::dsi-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.24] s

  * igt@kms_flip@basic-plain-flip@d::edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.71, 4.37] s

  

Known issues
------------

  Here are the changes found in IGTPW_4449 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][1] -> [FAIL][2] ([i915#976])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][3] ([IGT#4]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (51 -> 45)
------------------------------

  Additional (1): fi-skl-lmem 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5588 -> IGTPW_4449

  CI-20190529: 20190529
  CI_DRM_8291: ef6b9e8bc3134d7261f080ceb5158b16447a4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4449: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/index.html
  IGT_5588: 83182c9b2dee30f9e49b980606802de2bbf8d218 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4449/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
