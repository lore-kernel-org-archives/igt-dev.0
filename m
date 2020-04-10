Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Apr 2020 07:55:26 -0000
Message-ID: <158650532615.10043.2466748045142178091@emeril.freedesktop.org>
References: <20200409161344.31934-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200409161344.31934-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUkZDIFVz?=
 =?utf-8?q?e_device_dependant_module_parameters?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: RFC Use device dependant module parameters
URL   : https://patchwork.freedesktop.org/series/75760/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8285_full -> IGTPW_4443_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4443_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4443_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4443_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@clone:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl3/igt@gem_ctx_persistence@clone.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl7/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-kbl:          NOTRUN -> [FAIL][3] +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl3/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-iclb:         NOTRUN -> [FAIL][4] +18 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb2/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][5] -> [FAIL][6] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-tglb3/igt@gem_ctx_persistence@file.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-tglb7/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@hostile:
    - shard-apl:          [PASS][7] -> [FAIL][8] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl4/igt@gem_ctx_persistence@hostile.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-glk:          NOTRUN -> [FAIL][9] +18 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk8/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-tglb:         NOTRUN -> [FAIL][10] +16 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [PASS][11] -> [FAIL][12] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb2/igt@gem_ctx_persistence@process.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb8/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_persistence@processes:
    - shard-glk:          [PASS][13] -> [FAIL][14] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk7/igt@gem_ctx_persistence@processes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk6/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@replace:
    - shard-apl:          NOTRUN -> [FAIL][15] +17 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl7/igt@gem_ctx_persistence@replace.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@hang:
    - shard-apl:          [SKIP][16] ([fdo#109271]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl3/igt@gem_ctx_persistence@hang.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl7/igt@gem_ctx_persistence@hang.html
    - shard-glk:          [SKIP][18] ([fdo#109271]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk8/igt@gem_ctx_persistence@hang.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk4/igt@gem_ctx_persistence@hang.html
    - shard-kbl:          [SKIP][20] ([fdo#109271]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl7/igt@gem_ctx_persistence@hang.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          [SKIP][22] ([fdo#109271] / [i915#1099]) -> [FAIL][23] +23 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-hsw:          [SKIP][24] ([fdo#109271] / [i915#1099]) -> [FAIL][25] +22 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@replace-hostile:
    - shard-hsw:          [SKIP][26] ([fdo#109271]) -> [FAIL][27] +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-hsw4/igt@gem_ctx_persistence@replace-hostile.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-hsw2/igt@gem_ctx_persistence@replace-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile:
    - shard-snb:          [SKIP][28] ([fdo#109271]) -> [FAIL][29] +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-snb2/igt@gem_ctx_persistence@saturated-hostile.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-snb2/igt@gem_ctx_persistence@saturated-hostile.html

  
Known issues
------------

  Here are the changes found in IGTPW_4443_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#454])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#1531] / [i915#1658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-tglb1/igt@i915_selftest@live@requests.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-tglb3/igt@i915_selftest@live@requests.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#71])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#71])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl7/igt@kms_color@pipe-c-legacy-gamma.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl2/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][38] -> [INCOMPLETE][39] ([i915#155])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#54])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#52] / [i915#54]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][48] -> [FAIL][49] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-hsw:          [PASS][52] -> [INCOMPLETE][53] ([i915#61])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#899])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][56] -> [FAIL][57] ([i915#173])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb8/igt@kms_psr@no_drrs.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#109441]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb7/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vecs0}:
    - shard-kbl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][64] ([i915#1316] / [i915#579]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-tglb7/igt@i915_pm_rpm@cursor.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-tglb5/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][66] ([fdo#109271]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-hsw7/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][68] ([i915#1316] / [i915#579]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb5/igt@i915_pm_rpm@cursor.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb2/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl6/igt@i915_suspend@forcewake.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl4/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][72] ([CI#80] / [i915#155]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][74] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][76] ([i915#1119] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][78] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][80] ([i915#72]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][82] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][84] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][86] ([i915#52] / [i915#54]) -> [PASS][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][88] ([i915#53] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [FAIL][90] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][92] ([i915#1559] / [i915#95]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][94] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb5/igt@kms_psr@psr2_primary_blt.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@perf@oa-formats:
    - shard-iclb:         [SKIP][98] ([i915#405]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-iclb4/igt@perf@oa-formats.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-iclb2/igt@perf@oa-formats.html
    - shard-glk:          [SKIP][100] ([fdo#109271]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-glk8/igt@perf@oa-formats.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-glk9/igt@perf@oa-formats.html
    - shard-apl:          [SKIP][102] ([fdo#109271]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl1/igt@perf@oa-formats.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl6/igt@perf@oa-formats.html
    - shard-kbl:          [SKIP][104] ([fdo#109271]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl3/igt@perf@oa-formats.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl1/igt@perf@oa-formats.html
    - shard-tglb:         [SKIP][106] ([i915#405]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-tglb6/igt@perf@oa-formats.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-tglb5/igt@perf@oa-formats.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][108] ([i915#357]) -> [FAIL][109] ([i915#357] / [i915#93] / [i915#95])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl1/igt@kms_content_protection@uevent.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][110] ([i915#357]) -> [FAIL][111] ([i915#357] / [i915#95])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl1/igt@kms_content_protection@uevent.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][112] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][113] ([i915#180]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][114] ([i915#53] / [i915#93] / [i915#95]) -> [DMESG-WARN][115] ([i915#180])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][116] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][117] ([fdo#108145] / [i915#265])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8285/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5586 -> IGTPW_4443
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8285: 12fc367c2557ea74051378b2baadc6116add10ba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4443: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/index.html
  IGT_5586: 29fad328e6a1b105c8d688cafe19b1b5c19ad0c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4443/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
