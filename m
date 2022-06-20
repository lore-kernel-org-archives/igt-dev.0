Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2967890253299554231=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Mon, 20 Jun 2022 22:24:32 -0000
Message-ID: <165576387290.12734.2618539504225139024@emeril.freedesktop.org>
References: <20220620195841.18245-1-jeevan.b@intel.com>
In-Reply-To: <20220620195841.18245-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Skip_test_only_for_invalid_combination?=
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

--===============2967890253299554231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: Skip test only for invalid combination
URL   : https://patchwork.freedesktop.org/series/105386/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11785 -> IGTPW_7348
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7348 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7348, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html

Participating hosts (43 -> 41)
------------------------------

  Additional (1): bat-dg2-9 
  Missing    (3): fi-icl-u2 fi-bsw-nick fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7348:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@a-dsi1:
    - fi-glk-dsi:         [PASS][1] -> [CRASH][2] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-glk-dsi/igt@kms_flip@basic-flip-vs-dpms@a-dsi1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-glk-dsi/igt@kms_flip@basic-flip-vs-dpms@a-dsi1.html

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - fi-cfl-guc:         [PASS][3] -> [CRASH][4] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - fi-pnv-d510:        [PASS][5] -> [CRASH][6] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms@a-vga1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms@a-vga1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - fi-bdw-5557u:       [PASS][7] -> [CRASH][8] +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2.html

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - fi-ilk-650:         [PASS][9] -> [CRASH][10] +15 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms@b-vga1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms@b-vga1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-4:         [PASS][11] -> [CRASH][12] +13 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp2:
    - fi-cfl-8109u:       [PASS][13] -> [CRASH][14] +23 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - fi-snb-2600:        [PASS][15] -> [CRASH][16] +15 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-snb-2600/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2600/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp2:
    - fi-skl-guc:         [PASS][17] -> [CRASH][18] +23 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@c-dp2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@c-dp2.html

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2:
    - fi-adl-ddr5:        [PASS][19] -> [CRASH][20] +15 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-adl-ddr5/igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-adl-ddr5/igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - fi-bsw-kefka:       [PASS][21] -> [CRASH][22] +7 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - fi-snb-2520m:       [PASS][23] -> [CRASH][24] +15 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
    - fi-hsw-4770:        [PASS][25] -> [CRASH][26] +11 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-hsw-4770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-4770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
    - fi-ivb-3770:        [PASS][27] -> [CRASH][28] +11 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ivb-3770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ivb-3770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
    - fi-elk-e7500:       [PASS][29] -> [CRASH][30] +15 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:
    - fi-bxt-dsi:         [PASS][31] -> [CRASH][32] +11 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-kbl-soraka:      [PASS][33] -> [CRASH][34] +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - fi-rkl-guc:         [PASS][35] -> [CRASH][36] +11 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-rkl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-rkl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html
    - fi-cfl-8700k:       [PASS][37] -> [CRASH][38] +11 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - fi-hsw-g3258:       [PASS][39] -> [CRASH][40] +23 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-hsw-g3258/igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-g3258/igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - fi-tgl-u2:          [PASS][41] -> [CRASH][42] +15 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - fi-skl-6700k2:      [PASS][43] -> [CRASH][44] +23 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-skl-6700k2/igt@kms_flip@basic-plain-flip@a-hdmi-a1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-skl-6700k2/igt@kms_flip@basic-plain-flip@a-hdmi-a1.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - fi-glk-j4005:       [PASS][45] -> [CRASH][46] +11 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-glk-j4005/igt@kms_flip@basic-plain-flip@b-hdmi-a2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-glk-j4005/igt@kms_flip@basic-plain-flip@b-hdmi-a2.html

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - fi-blb-e6850:       [PASS][47] -> [CRASH][48] +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-blb-e6850/igt@kms_flip@basic-plain-flip@b-vga1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-blb-e6850/igt@kms_flip@basic-plain-flip@b-vga1.html

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - fi-skl-6600u:       [PASS][49] -> [CRASH][50] +11 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-skl-6600u/igt@kms_flip@basic-plain-flip@c-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-skl-6600u/igt@kms_flip@basic-plain-flip@c-edp1.html

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - fi-rkl-11600:       [PASS][51] -> [CRASH][52] +11 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-rkl-11600/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-rkl-11600/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - bat-dg1-6:          [PASS][53] -> [CRASH][54] +15 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-dg1-6/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html
    - fi-bsw-n3050:       [PASS][55] -> [CRASH][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - bat-adlp-4:         [DMESG-WARN][57] ([i915#3576]) -> [CRASH][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-dpms@a-dp3:
    - {bat-dg2-9}:        NOTRUN -> [CRASH][59] +15 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms@a-dp3.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-jsl-1}:        [PASS][60] -> [CRASH][61] +11 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
    - {fi-jsl-1}:         [PASS][62] -> [CRASH][63] +11 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][64] ([i915#3576]) -> [CRASH][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - {bat-adlp-6}:       [PASS][66] -> [CRASH][67] +13 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:
    - {fi-tgl-dsi}:       [PASS][68] -> [CRASH][69] +15 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1.html

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - {fi-ehl-2}:         [PASS][70] -> [CRASH][71] +11 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ehl-2/igt@kms_flip@basic-plain-flip@c-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ehl-2/igt@kms_flip@basic-plain-flip@c-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_7348 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [PASS][72] -> [DMESG-WARN][73] ([i915#3576]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8109u:       [PASS][74] -> [FAIL][75] ([i915#4054])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][76] ([i915#4528])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-blb-e6850/igt@i915_selftest@live@gem.html
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][77] ([i915#4528])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-pnv-d510/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          NOTRUN -> [DMESG-FAIL][78] ([i915#4494] / [i915#4957])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [PASS][79] -> [DMESG-WARN][80] ([i915#5904]) +11 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [PASS][81] -> [DMESG-WARN][82] ([i915#5904] / [i915#62])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-dg1-6:          NOTRUN -> [INCOMPLETE][83] ([i915#6011])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][86] ([fdo#109271] / [fdo#111827])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][87] ([fdo#109271])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][88] ([i915#5122]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][90] ([i915#5847]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [INCOMPLETE][92] ([i915#4418]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       [DMESG-FAIL][94] ([i915#3674]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bdw-5557u/igt@i915_selftest@live@gtt.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][96] ([i915#4785]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-5:          [DMESG-FAIL][98] ([i915#4494] / [i915#4957]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [INCOMPLETE][100] ([i915#3921]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [DMESG-FAIL][102] ([i915#4528]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-pnv-d510/igt@i915_selftest@live@requests.html
    - fi-blb-e6850:       [DMESG-FAIL][104] ([i915#4528]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [DMESG-WARN][106] ([i915#3576]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4054]: https://gitlab.freedesktop.org/drm/intel/issues/4054
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5847]: https://gitlab.freedesktop.org/drm/intel/issues/5847
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6537 -> IGTPW_7348

  CI-20190529: 20190529
  CI_DRM_11785: ff3eb8ce69522748dfd57c345d499752b1e8147f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7348: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html
  IGT_6537: 331658a8475c8b0c0f7ffe5268a7318ef83da34e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html

--===============2967890253299554231==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: Skip test only for invalid combination</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105386/">https://patchwork.freedesktop.org/series/105386/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11785 -&gt; IGTPW_7348</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7348 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7348, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Additional (1): bat-dg2-9 <br />
  Missing    (3): fi-icl-u2 fi-bsw-nick fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7348:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dsi1:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-glk-dsi/igt@kms_flip@basic-flip-vs-dpms@a-dsi1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-glk-dsi/igt@kms_flip@basic-flip-vs-dpms@a-dsi1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-vga1:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms@a-vga1.html">CRASH</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-vga1:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms@b-vga1.html">CRASH</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">CRASH</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp2:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-modeset@a-dp2.html">CRASH</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-snb-2600/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2600/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1.html">CRASH</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-skl-guc/igt@kms_flip@basic-flip-vs-modeset@c-dp2.html">CRASH</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2:</p>
<ul>
<li>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-adl-ddr5/igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-adl-ddr5/igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a2.html">CRASH</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">CRASH</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">CRASH</a> +15 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-hsw-4770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-4770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">CRASH</a> +11 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ivb-3770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ivb-3770/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">CRASH</a> +11 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-elk-e7500/igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1.html">CRASH</a> +15 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-rkl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-rkl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html">CRASH</a> +11 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html">CRASH</a> +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:</p>
<ul>
<li>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-hsw-g3258/igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-g3258/igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1.html">CRASH</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-tgl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">CRASH</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a1:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-skl-6700k2/igt@kms_flip@basic-plain-flip@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-skl-6700k2/igt@kms_flip@basic-plain-flip@a-hdmi-a1.html">CRASH</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a2:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-glk-j4005/igt@kms_flip@basic-plain-flip@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-glk-j4005/igt@kms_flip@basic-plain-flip@b-hdmi-a2.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-vga1:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-blb-e6850/igt@kms_flip@basic-plain-flip@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-blb-e6850/igt@kms_flip@basic-plain-flip@b-vga1.html">CRASH</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-skl-6600u/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-skl-6600u/igt@kms_flip@basic-plain-flip@c-edp1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-rkl-11600/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-rkl-11600/igt@kms_flip@basic-plain-flip@c-hdmi-a1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a2:</p>
<ul>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-dg1-6/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html">CRASH</a> +15 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@kms_flip@basic-plain-flip@c-hdmi-a2.html">CRASH</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@b-edp1:<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp3:</p>
<ul>
<li>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms@a-dp3.html">CRASH</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">CRASH</a> +11 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-jsl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">CRASH</a> +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">CRASH</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1.html">CRASH</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ehl-2/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ehl-2/igt@kms_flip@basic-plain-flip@c-edp1.html">CRASH</a> +11 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7348 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4054">i915#4054</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-blb-e6850/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-pnv-d510/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5847">i915#5847</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11785/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6537 -&gt; IGTPW_7348</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11785: ff3eb8ce69522748dfd57c345d499752b1e8147f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7348: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7348/index.html<br />
  IGT_6537: 331658a8475c8b0c0f7ffe5268a7318ef83da34e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2967890253299554231==--
