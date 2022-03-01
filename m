Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1974547961066484017=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Tue, 01 Mar 2022 18:37:03 -0000
Message-ID: <164615982329.8601.12568031140369470588@emeril.freedesktop.org>
References: <20220301110359.663637-1-matthew.auld@intel.com>
In-Reply-To: <20220301110359.663637-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fparams=3A_check_available_memory_earlier?=
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

--===============1974547961066484017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_params: check available memory earlier
URL   : https://patchwork.freedesktop.org/series/100879/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11302_full -> IGTPW_6722_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6722_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6722_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6722_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@fences-dpms (NEW):
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb4/igt@i915_pm_rpm@fences-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb7/igt@i915_pm_rpm@fences-dpms.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * {igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-d-edp-1-downscale-with-pixel-format} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-d-edp-1-downscale-with-pixel-format.html

  * {igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglu-6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-edp-1-downscale-with-pixel-format}:
    - shard-tglb:         NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-edp-1-downscale-with-pixel-format.html

  * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale}:
    - shard-iclb:         [PASS][8] -> [SKIP][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html

  * {igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format}:
    - shard-iclb:         [PASS][10] -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb8/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb2/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html

  * {igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation}:
    - {shard-tglu}:       NOTRUN -> [SKIP][12] +9 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglu-3/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11302_full and IGTPW_6722_full:

### New IGT tests (203) ###

  * igt@gem_create@create-clear:
    - Statuses : 5 pass(s)
    - Exec time: [32.59, 36.75] s

  * igt@gem_ctx_engines@none:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@gem_ctx_exec@basic-norecovery:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_ctx_persistence@legacy-engines-queued@blt:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.14] s

  * igt@gem_ctx_persistence@legacy-engines-queued@bsd:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_ctx_persistence@legacy-engines-queued@bsd1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@gem_ctx_persistence@legacy-engines-queued@bsd2:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@gem_ctx_persistence@legacy-engines-queued@render:
    - Statuses : 3 pass(s)
    - Exec time: [0.03] s

  * igt@gem_ctx_persistence@legacy-engines-queued@vebox:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_ctx_sseu@mmap-args:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@gtt:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@gem_ctx_sseu@mmap-args@uc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@wb:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_sseu@mmap-args@wc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@gem_eio@context-create:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.12] s

  * igt@gem_exec_basic@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_create@forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@basic-await:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-await@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.11] s

  * igt@gem_exec_fence@basic-await@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@gem_exec_fence@basic-await@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@gem_exec_fence@basic-await@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@gem_exec_fence@basic-await@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@gem_exec_fence@basic-busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-busy@bcs0:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.00, 0.03] s

  * igt@gem_exec_fence@basic-busy@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@basic-busy@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@basic-busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_exec_fence@basic-busy@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@basic-wait:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-wait@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.00, 0.04] s

  * igt@gem_exec_fence@basic-wait@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@basic-wait@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@basic-wait@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_exec_fence@basic-wait@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_fence@nb-await:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@nb-await@bcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@gem_exec_fence@nb-await@rcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.07] s

  * igt@gem_exec_fence@nb-await@vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@gem_exec_fence@nb-await@vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.07] s

  * igt@gem_exec_reloc@basic-scanout:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-scanout@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@gem_exec_reloc@basic-scanout@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 0.46] s

  * igt@gem_exec_reloc@basic-scanout@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@gem_exec_reloc@basic-scanout@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.11, 0.17] s

  * igt@gem_exec_reloc@basic-scanout@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 0.20] s

  * igt@gem_exec_suspend@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_whisper@basic-contexts:
    - Statuses : 5 pass(s)
    - Exec time: [1.40, 9.14] s

  * igt@gem_exec_whisper@basic-contexts-all:
    - Statuses : 7 pass(s)
    - Exec time: [1.64, 16.89] s

  * igt@gem_exec_whisper@basic-contexts-forked:
    - Statuses : 2 pass(s)
    - Exec time: [10.04, 10.84] s

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - Statuses : 7 pass(s)
    - Exec time: [19.07, 25.18] s

  * igt@gem_exec_whisper@basic-contexts-priority:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 16.66] s

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 24.67] s

  * igt@gem_exec_whisper@basic-fds:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_whisper@basic-fds-all:
    - Statuses : 6 pass(s)
    - Exec time: [2.53, 22.18] s

  * igt@gem_exec_whisper@basic-fds-forked:
    - Statuses : 2 pass(s)
    - Exec time: [7.08, 11.16] s

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - Statuses : 6 pass(s)
    - Exec time: [21.49, 24.41] s

  * igt@gem_exec_whisper@basic-fds-priority:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.00, 19.24] s

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 24.18] s

  * igt@gem_exec_whisper@basic-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_whisper@basic-forked-all:
    - Statuses : 6 pass(s)
    - Exec time: [13.59, 22.10] s

  * igt@gem_exec_whisper@basic-normal:
    - Statuses : 3 pass(s)
    - Exec time: [1.16, 5.65] s

  * igt@gem_exec_whisper@basic-normal-all:
    - Statuses : 7 pass(s)
    - Exec time: [1.31, 11.06] s

  * igt@gem_exec_whisper@basic-queues:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 6.82] s

  * igt@gem_exec_whisper@basic-queues-all:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.00, 14.93] s

  * igt@gem_exec_whisper@basic-queues-forked:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.00, 11.17] s

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - Statuses : 1 dmesg-warn(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.00, 23.25] s

  * igt@gem_exec_whisper@basic-queues-priority:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.00, 9.30] s

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.00, 22.94] s

  * igt@gem_exec_whisper@basic-sync:
    - Statuses : 6 pass(s)
    - Exec time: [1.17, 8.73] s

  * igt@gem_exec_whisper@basic-sync-all:
    - Statuses : 5 pass(s)
    - Exec time: [1.38, 15.11] s

  * igt@gem_render_copy@linear:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_backlight@bad-brightness:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_pm_backlight@basic-brightness:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@i915_pm_backlight@fade:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.36] s

  * igt@i915_pm_backlight@fade_with_dpms:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_backlight@fade_with_suspend:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.47] s

  * igt@i915_pm_lpsp@screens-disabled:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.00] s

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.42] s

  * igt@i915_pm_rpm@basic-rte:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [1.41, 6.14] s

  * igt@i915_pm_rpm@cursor:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.16] s

  * igt@i915_pm_rpm@cursor-dpms:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 36.43] s

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.89] s

  * igt@i915_pm_rpm@debugfs-read:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@dpms-lpsp:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 9.18] s

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.63] s

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@i915_pm_rpm@drm-resources-equal:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.86] s

  * igt@i915_pm_rpm@fences:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 11.36] s

  * igt@i915_pm_rpm@fences-dpms:
    - Statuses : 1 incomplete(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.83] s

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.65] s

  * igt@i915_pm_rpm@gem-execbuf:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.74] s

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 42.10] s

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@i915_pm_rpm@gem-idle:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.68] s

  * igt@i915_pm_rpm@gem-mmap-type:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rpm@gem-mmap-type@gtt:
    - Statuses : 5 pass(s)
    - Exec time: [2.14, 15.07] s

  * igt@i915_pm_rpm@gem-mmap-type@uc:
    - Statuses : 5 pass(s)
    - Exec time: [1.05, 6.72] s

  * igt@i915_pm_rpm@gem-mmap-type@wb:
    - Statuses : 5 pass(s)
    - Exec time: [1.06, 6.39] s

  * igt@i915_pm_rpm@gem-mmap-type@wc:
    - Statuses : 5 pass(s)
    - Exec time: [1.08, 6.72] s

  * igt@i915_pm_rpm@gem-pread:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.55] s

  * igt@i915_pm_rpm@i2c:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.27] s

  * igt@i915_pm_rpm@legacy-planes:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@legacy-planes-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@modeset-lpsp:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 29.94] s

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 11.26] s

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.62] s

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 6.68] s

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.75] s

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@pc8-residency:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rpm@pm-caching:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 19.09] s

  * igt@i915_pm_rpm@pm-tiling:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.97] s

  * igt@i915_pm_rpm@reg-read-ioctl:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.46] s

  * igt@i915_pm_rpm@sysfs-read:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.62] s

  * igt@i915_pm_rpm@system-suspend:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 8.54] s

  * igt@i915_pm_rpm@system-suspend-devices:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.81] s

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 85.41] s

  * igt@i915_pm_rpm@system-suspend-modeset:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 13.61] s

  * igt@i915_pm_rpm@universal-planes:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@universal-planes-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@i915_pm_rps@min-max-config-idle:
    - Statuses : 6 pass(s)
    - Exec time: [0.15, 0.38] s

  * igt@i915_pm_rps@min-max-config-loaded:
    - Statuses : 3 pass(s)
    - Exec time: [0.32, 0.38] s

  * igt@i915_pm_rps@reset:
    - Statuses : 7 pass(s)
    - Exec time: [3.52, 3.63] s

  * igt@i915_pm_rps@waitboost:
    - Statuses : 7 pass(s)
    - Exec time: [2.52, 2.57] s

  * igt@i915_pm_sseu@full-enable:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@kms_atomic_interruptible@atomic-setmode:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_interruptible@legacy-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_interruptible@legacy-pageflip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic@flip:
    - Statuses : 5 pass(s)
    - Exec time: [0.30, 0.89] s

  * igt@kms_busy@basic@modeset:
    - Statuses : 5 pass(s)
    - Exec time: [0.47, 3.68] s

  * igt@kms_content_protection@atomic-dpms:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@bo-too-big:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip@nonexisting-fb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_hdr@bpc-switch:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.77] s

  * igt@kms_hdr@bpc-switch-dpms:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.88] s

  * igt@kms_hdr@bpc-switch-suspend:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.05] s

  * igt@kms_hdr@static-swap:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_hdr@static-toggle-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_hdr@static-toggle-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_lease@implicit-plane-lease:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@kms_lease@invalid-create-leases:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@lease-uevent:
    - Statuses : 6 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@kms_lease@lease_invalid_plane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_lease@master-vs-lease:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_lease@multimaster-lease:
    - Statuses : 4 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_lease@possible-crtcs-filtering:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.03] s

  * igt@kms_mmap_write_crc@main:
    - Statuses : 7 pass(s)
    - Exec time: [2.29, 14.13] s

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-d-edp-1-downscale-with-pixel-format:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-edp-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-hdmi-a-1-planes-unity-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-edp-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.22] s

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-hdmi-a-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.31] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.10] s

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d-edp-1-planes-upscale:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [23.04] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-hdmi-a-1-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@prime_mmap@test_correct:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_mmap@test_correct_cpu_write:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_mmap@test_forked_cpu_write:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_mmap@test_invalid_sync_flags:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_mmap@test_userptr:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@basic-blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@prime_vgem@basic-fence-blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@prime_vgem@coherency-blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 5.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_6722_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#1839])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#1839])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb4/igt@feature_discovery@display-2x.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@mmap-args (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [PASS][18] -> [TIMEOUT][19] ([i915#3063])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-tglb8/igt@gem_eio@in-flight-1us.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb5/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][20] -> [TIMEOUT][21] ([i915#3063] / [i915#3648])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][24] ([i915#5076]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-kbl3/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#2842]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#2842]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][28] ([i915#2842]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2842]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][31] ([i915#2849])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#112283])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb7/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_whisper@basic-queues-forked-all (NEW):
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#118]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html
   [34]: https://intel-gfx-c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html

--===============1974547961066484017==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_params: check available memory earlier</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100879/">https://patchwork.freedesktop.org/series/100879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11302_full -&gt; IGTPW_6722_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6722_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6722_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6722_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@fences-dpms (NEW):</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb4/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb7/igt@i915_pm_rpm@fences-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-d-edp-1-downscale-with-pixel-format} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-d-edp-1-downscale-with-pixel-format.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglu-6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-edp-1-downscale-with-pixel-format}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-b-edp-1-downscale-with-pixel-format.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb8/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb2/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglu-3/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-c-hdmi-a-1-upscale-with-rotation.html">SKIP</a> +9 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11302_full and IGTPW_6722_full:</p>
<h3>New IGT tests (203)</h3>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [32.59, 36.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@none:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-norecovery:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued@blt:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued@bsd:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued@bsd1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued@bsd2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued@render:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued@vebox:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args@gtt:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args@uc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args@wb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args@wc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_eio@context-create:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.00, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.10, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.11, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.40, 9.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.64, 16.89] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.04, 10.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [19.07, 25.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 16.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 24.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.53, 22.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.08, 11.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [21.49, 24.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 19.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 24.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [13.59, 22.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.16, 5.65] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.31, 11.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 6.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 14.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 11.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 23.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 9.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.00, 22.94] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-sync:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.17, 8.73] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-sync-all:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.38, 15.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.36] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 4.47] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [1.41, 6.14] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 36.43] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.89] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-read:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 9.18] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.86] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 11.36] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>Statuses : 1 incomplete(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 10.83] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.74] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 42.10] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.68] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.14, 15.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.05, 6.72] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@wb:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.06, 6.39] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.08, 6.72] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.55] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.27] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@legacy-planes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 29.94] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 11.26] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 6.68] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.75] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 19.09] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.97] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.46] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.81] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 85.41] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 13.61] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@universal-planes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.15, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.32, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.52, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.52, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.30, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.47, 3.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@implicit-plane-lease:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.01, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_plane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@master-vs-lease:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@multimaster-lease:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.29, 14.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-25@pipe-d-edp-1-downscale-with-pixel-format:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-d-hdmi-a-1-downscale-with-rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-edp-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-1-planes-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-b-hdmi-a-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-edp-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaling-unity-scaling@pipe-d-hdmi-a-1-planes-unity-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-d-hdmi-a-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b-vga-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-hdmi-a-1-planes-upscale-downscale:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d-edp-1-planes-upscale:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [23.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-hdmi-a-1-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_correct:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_correct_cpu_write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_forked_cpu_write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_invalid_sync_flags:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_userptr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-blt:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.55, 5.07] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6722_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb4/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args (NEW):</p>
<ul>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-tglb8/igt@gem_eio@in-flight-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb5/igt@gem_eio@in-flight-1us.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-kbl3/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WARN</a> ([i915#5076]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6722/shard-tglb7/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all (NEW):</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11302/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-c">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1974547961066484017==--
