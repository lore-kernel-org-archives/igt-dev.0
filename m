Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2919490614177072398=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 07 Apr 2022 18:00:01 -0000
Message-ID: <164935440184.14670.8152309858925232254@emeril.freedesktop.org>
References: <20220407090343.10067-1-swati2.sharma@intel.com>
In-Reply-To: <20220407090343.10067-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW1wcm92?=
 =?utf-8?q?ements_in_plane_scaling_=28rev2=29?=
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

--===============2919490614177072398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improvements in plane scaling (rev2)
URL   : https://patchwork.freedesktop.org/series/102280/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11471_full -> IGTPW_6890_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/index.html

Participating hosts (13 -> 9)
------------------------------

  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6890_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-dg1-15/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier.html

  * {igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html

  * {igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglu-1/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier.html

  * {igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb2/igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier.html

  * {igt@kms_plane_scaling@upscale-with-modifier-20x20} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-rkl-4/igt@kms_plane_scaling@upscale-with-modifier-20x20.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_workarounds@suspend-resume:
    - {shard-tglu}:       [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-tglu-5/igt@gem_workarounds@suspend-resume.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglu-8/igt@gem_workarounds@suspend-resume.html

  * igt@kms_color@pipe-a-ctm-red-to-blue:
    - {shard-dg1}:        NOTRUN -> [CRASH][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-dg1-15/igt@kms_color@pipe-a-ctm-red-to-blue.html

  * igt@kms_color@pipe-c-ctm-0-5:
    - {shard-dg1}:        [PASS][9] -> [CRASH][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-dg1-16/igt@kms_color@pipe-c-ctm-0-5.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-dg1-15/igt@kms_color@pipe-c-ctm-0-5.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {shard-rkl}:        NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-rkl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - {shard-rkl}:        [SKIP][12] ([i915#4070] / [i915#4098]) -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11471_full and IGTPW_6890_full:

### New IGT tests (78) ###

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-dp-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-edp-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-hdmi-a-1-downscale-with-modifier:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.08] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-vga-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-dp-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.07] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-edp-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-2-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-vga-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-dp-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.07] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-hdmi-a-1-downscale-with-modifier:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.14] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-dp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.96] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-edp-1-downscale-with-modifier:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.48] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-hdmi-a-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.98] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-vga-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-dp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 1.00] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-edp-1-downscale-with-modifier:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 1.58] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-hdmi-a-1-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-hdmi-a-2-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.0] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-vga-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-dp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.76] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.02, 1.47] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-hdmi-a-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 1.01] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-d-edp-1-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-d-hdmi-a-1-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-dp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.82] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-edp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.54] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-hdmi-a-1-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-vga-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-dp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 1.00] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-edp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [1.48, 1.70] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-hdmi-a-2-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-vga-1-downscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-c-dp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.75] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-c-edp-1-downscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [1.47, 1.68] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-c-hdmi-a-1-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-d-edp-1-downscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-dp-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-edp-1-scaler-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.56] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-hdmi-a-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-vga-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-dp-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.00] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-edp-1-scaler-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [1.59, 1.74] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-hdmi-a-2-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-vga-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-c-dp-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-c-edp-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-c-hdmi-a-1-scaler-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-a-edp-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.49] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-a-hdmi-a-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.43] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-a-vga-1-upscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-b-edp-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.67] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-b-hdmi-a-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.46] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-b-vga-1-upscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-c-edp-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.66] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-c-hdmi-a-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.44] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-edp-1-upscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.44] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-a-edp-1-upscale-with-modifier:
    - Statuses : 3 pass(s)
    - Exec time: [0.24, 0.55] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-a-hdmi-a-1-upscale-with-modifier:
    - Statuses : 3 pass(s)
    - Exec time: [0.19, 0.66] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-a-vga-1-upscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-edp-1-upscale-with-modifier:
    - Statuses : 3 pass(s)
    - Exec time: [1.37, 1.65] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.41] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-hdmi-a-2-upscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-vga-1-upscale-with-modifier:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-c-edp-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.66] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-c-hdmi-a-1-upscale-with-modifier:
    - Statuses : 3 pass(s)
    - Exec time: [0.21, 0.59] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-d-edp-1-upscale-with-modifier:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-upscale-with-modifier:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.40] s

  

Known issues
------------

  Here are the changes found in IGTPW_6890_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#1839])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@feature_discovery@display-2x.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][15] ([i915#4991])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl7/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][16] ([i915#4991])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk3/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][17] ([i915#4991])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@gem_create@create-massive.html

  * igt@gem_eio@kms:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#232])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4525])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271]) +96 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk4/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][21] ([i915#5076])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          NOTRUN -> [FAIL][25] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#2842]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][28] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-snb:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#118])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-glk2/igt@gem_exec_whisper@basic-normal.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk5/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#2190])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl6/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk1/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb4/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb2/igt@gem_lmem_swapping@random-engines.html
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#4613]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pxp@display-protected-crc:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#4270]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb3/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#4270]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#768]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109312])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-apl2/igt@gem_workarounds@suspend-resume.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#2856]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#2527] / [i915#2856]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#1902])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#1902])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][53] ([i915#2681] / [i915#2684])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [WARN][54] ([i915#1804] / [i915#2684])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111644] / [i915#1397] / [i915#2411])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109293] / [fdo#109506])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109506] / [i915#2411])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][58] ([i915#180])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#5286]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#5286]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111614]) +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3777])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777]) +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110723]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#3777]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +9 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [i915#3886]) +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3689] / [i915#3886]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb7/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +11 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689]) +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111615] / [i915#3689]) +8 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271]) +265 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-snb6/igt@kms_chamelium@dp-hpd-fas

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/index.html

--===============2919490614177072398==
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
<tr><td><b>Series:</b></td><td>Improvements in plane scaling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102280/">https://patchwork.freedesktop.org/series/102280/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11471_full -&gt; IGTPW_6890_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/index.html</p>
<h2>Participating hosts (13 -&gt; 9)</h2>
<p>Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6890_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-dg1-15/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglu-1/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb2/igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-modifier-20x20} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-rkl-4/igt@kms_plane_scaling@upscale-with-modifier-20x20.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-tglu-5/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglu-8/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-dg1-15/igt@kms_color@pipe-a-ctm-red-to-blue.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-5:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-dg1-16/igt@kms_color@pipe-c-ctm-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-dg1-15/igt@kms_color@pipe-c-ctm-0-5.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-rkl-3/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">SKIP</a> ([i915#4070] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11471_full and IGTPW_6890_full:</p>
<h3>New IGT tests (78)</h3>
<ul>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-a-vga-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-2-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-vga-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-a-vga-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-hdmi-a-2-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-b-vga-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-c-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-d-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-5@pipe-d-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-a-vga-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.48, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-hdmi-a-2-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-b-vga-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-c-dp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-c-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.47, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-c-hdmi-a-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-75@pipe-d-edp-1-downscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-dp-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-edp-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-hdmi-a-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-a-vga-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-dp-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-edp-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.59, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-hdmi-a-2-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-b-vga-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-c-dp-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-c-edp-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-modifier-unity-scaling@pipe-c-hdmi-a-1-scaler-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-a-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-a-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-a-vga-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-b-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-b-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-b-vga-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-c-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-c-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-a-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.24, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-a-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.19, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-a-vga-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.37, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-hdmi-a-2-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-b-vga-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-c-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-c-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.21, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-d-edp-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-upscale-with-modifier:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6890_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk4/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([fdo#109271]) +96 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl1/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> ([fdo#109271]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-glk2/igt@gem_exec_whisper@basic-normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk5/igt@gem_exec_whisper@basic-normal.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb3/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/shard-apl2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl3/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-iclb4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb7/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-glk2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-kbl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb3/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-tglb1/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-apl1/igt@kms_cdclk@mode-transition.html">SKIP</a> ([fdo#109271]) +265 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6890/shard-snb6/igt@kms_chamelium@dp-hpd-fas">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2919490614177072398==--
