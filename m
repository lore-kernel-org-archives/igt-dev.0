Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 12 Dec 2020 02:48:34 -0000
Message-ID: <160774131490.10728.13857693288709748700@emeril.freedesktop.org>
References: <20201211222152.2952035-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201211222152.2952035-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Include_the_small_concurrent_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1997120830=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1997120830==
Content-Type: multipart/alternative;
 boundary="===============6189445872303039362=="

--===============6189445872303039362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Include the small concurrent tests
URL   : https://patchwork.freedesktop.org/series/84856/
State : success

== Summary ==

CI Bug Log - changes from IGT_5891_full -> IGTPW_5274_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5274_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5274_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5274_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-forked} (NEW):
    - shard-apl:          NOTRUN -> [WARN][1] +291 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-apl8/igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-forked.html

  * {igt@gem_concurrent_blit@16mib-tiny-gpu-render-write-read-bcs-bomb} (NEW):
    - shard-snb:          NOTRUN -> [TIMEOUT][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-snb5/igt@gem_concurrent_blit@16mib-tiny-gpu-render-write-read-bcs-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-gpux-blt-intermix-bcs-bomb} (NEW):
    - shard-hsw:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw2/igt@gem_concurrent_blit@16mib-tiny-gpux-blt-intermix-bcs-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-gpux-blt-read-read-bcs-bomb} (NEW):
    - shard-tglb:         NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-tglb5/igt@gem_concurrent_blit@16mib-tiny-gpux-blt-read-read-bcs-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-gtt-blt-sanitycheck1-bomb} (NEW):
    - shard-hsw:          NOTRUN -> [TIMEOUT][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@gem_concurrent_blit@16mib-tiny-gtt-blt-sanitycheck1-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-gtt-render-gpu-read-after-write-bomb} (NEW):
    - shard-snb:          NOTRUN -> [DMESG-WARN][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-snb6/igt@gem_concurrent_blit@16mib-tiny-gtt-render-gpu-read-after-write-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-gtt-render-intermix-bcs-bomb} (NEW):
    - shard-iclb:         NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-iclb4/igt@gem_concurrent_blit@16mib-tiny-gtt-render-intermix-bcs-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-gttx-render-overwrite-source-bomb} (NEW):
    - shard-hsw:          NOTRUN -> [DMESG-WARN][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw8/igt@gem_concurrent_blit@16mib-tiny-gttx-render-overwrite-source-bomb.html
    - shard-snb:          NOTRUN -> [CRASH][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-snb5/igt@gem_concurrent_blit@16mib-tiny-gttx-render-overwrite-source-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-prw-render-read-read-rcs-forked} (NEW):
    - shard-tglb:         NOTRUN -> [WARN][10] +256 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-tglb8/igt@gem_concurrent_blit@16mib-tiny-prw-render-read-read-rcs-forked.html

  * {igt@gem_concurrent_blit@16mib-tiny-userptr-blt-read-read-bcs-bomb} (NEW):
    - shard-snb:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-snb6/igt@gem_concurrent_blit@16mib-tiny-userptr-blt-read-read-bcs-bomb.html

  * {igt@gem_concurrent_blit@16mib-tiny-wc-blt-intermix-rcs-forked} (NEW):
    - shard-iclb:         NOTRUN -> [WARN][12] +238 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-iclb4/igt@gem_concurrent_blit@16mib-tiny-wc-blt-intermix-rcs-forked.html

  * {igt@gem_concurrent_blit@256kib-tiny-cpu-blt-gpu-read-after-write-child} (NEW):
    - shard-kbl:          NOTRUN -> [WARN][13] +868 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-kbl1/igt@gem_concurrent_blit@256kib-tiny-cpu-blt-gpu-read-after-write-child.html

  * {igt@gem_concurrent_blit@256kib-tiny-snoop-blt-intermix-both} (NEW):
    - shard-glk:          NOTRUN -> [WARN][14] +451 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-glk5/igt@gem_concurrent_blit@256kib-tiny-snoop-blt-intermix-both.html
    - shard-iclb:         NOTRUN -> [SKIP][15] +78 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-iclb1/igt@gem_concurrent_blit@256kib-tiny-snoop-blt-intermix-both.html

  * {igt@gem_concurrent_blit@256kib-tiny-userptr-render-gpu-read-after-write-bomb} (NEW):
    - shard-hsw:          NOTRUN -> [DMESG-FAIL][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@gem_concurrent_blit@256kib-tiny-userptr-render-gpu-read-after-write-bomb.html

  * {igt@gem_concurrent_blit@4kib-tiny-snoop-render-overwrite-source-read-bcs-bomb} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][17] +86 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-tglb6/igt@gem_concurrent_blit@4kib-tiny-snoop-render-overwrite-source-read-bcs-bomb.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][18] ([i915#2295]) -> ([FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26]) ([i915#2505])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5891/shard-hsw4/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw4/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw2/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw4/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw8/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw8/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw8/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between IGT_5891_full and IGTPW_5274_full:

### New IGT tests (8160) ###

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write:
    - Statuses : 2 pass(s) 4 warn(s)
    - Exec time: [0.12, 0.33] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-bomb:
    - Statuses : 3 warn(s)
    - Exec time: [7.75, 68.03] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs:
    - Statuses : 1 warn(s)
    - Exec time: [0.13] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-child:
    - Statuses : 2 warn(s)
    - Exec time: [0.15, 0.18] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both:
    - Statuses : 3 warn(s)
    - Exec time: [0.11, 0.13] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-bomb:
    - Statuses : 1 pass(s) 3 warn(s)
    - Exec time: [9.35, 46.07] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-forked:
    - Statuses : 1 pass(s) 3 warn(s)
    - Exec time: [0.49, 1.47] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-child:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.10, 0.27] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-forked:
    - Statuses : 3 warn(s)
    - Exec time: [0.29, 0.55] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-interruptible:
    - Statuses : 2 pass(s) 4 warn(s)
    - Exec time: [0.33, 0.62] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-child:
    - Statuses : 2 pass(s) 4 warn(s)
    - Exec time: [0.13, 0.34] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-forked:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.55, 1.43] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-forked:
    - Statuses : 1 pass(s) 4 warn(s)
    - Exec time: [0.61, 1.79] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.14] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-interruptible:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.37, 1.03] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-child:
    - Statuses : 3 warn(s)
    - Exec time: [0.13, 0.21] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-bomb:
    - Statuses : 3 warn(s)
    - Exec time: [3.36, 28.64] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-child:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.13, 0.43] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-forked:
    - Statuses : 1 warn(s)
    - Exec time: [0.51] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-child:
    - Statuses : 1 warn(s)
    - Exec time: [0.18] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-bomb:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [6.13, 44.93] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-forked:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.53, 1.52] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-bomb:
    - Statuses : 1 warn(s)
    - Exec time: [5.22] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-bomb:
    - Statuses : 2 warn(s)
    - Exec time: [6.00, 26.47] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-bomb:
    - Statuses : 1 warn(s)
    - Exec time: [8.00] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-bomb:
    - Statuses : 1 warn(s)
    - Exec time: [5.86] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-child:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.14] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-child:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.14, 0.52] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-forked:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.61, 2.77] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-interruptible:
    - Statuses : 1 warn(s)
    - Exec time: [0.58] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-forked:
    - Statuses : 2 pass(s) 4 warn(s)
    - Exec time: [0.34, 1.84] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-forked:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.50, 1.60] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-bomb:
    - Statuses : 1 pass(s) 3 warn(s)
    - Exec time: [17.36, 61.54] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read:
    - Statuses : 3 warn(s)
    - Exec time: [0.11, 0.16] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-forked:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.54, 1.12] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-bomb:
    - Statuses : 1 pass(s) 3 warn(s)
    - Exec time: [9.70, 68.69] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-interruptible:
    - Statuses : 2 pass(s) 4 warn(s)
    - Exec time: [0.14, 0.39] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-interruptible:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.30, 0.90] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs-bomb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs-child:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs-forked:
    - Statuses : 2 pass(s) 5 warn(s)
    - Exec time: [0.58, 1.28] s

  *

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/index.html

--===============6189445872303039362==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>intel-ci: Include the small concurrent tests=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84856/">https://patchwork.freedesktop.org/series/84856/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5274/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5274/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5891_full -&gt; IGTPW_5274_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5274_full need to be verified<br=
 />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5274_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5274=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-forked} (NEW):=
</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-apl8/igt@gem_concurrent_blit@16mib-tiny-dmab=
uf-blt-early-read-forked.html">WARN</a> +291 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gpu-render-write-read-bcs-bomb} (NEW=
):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-snb5/igt@gem_concurrent_blit@16mib-tiny-gpu-=
render-write-read-bcs-bomb.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gpux-blt-intermix-bcs-bomb} (NEW):</=
p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-hsw2/igt@gem_concurrent_blit@16mib-tiny-gpux=
-blt-intermix-bcs-bomb.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gpux-blt-read-read-bcs-bomb} (NEW):<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-tglb5/igt@gem_concurrent_blit@16mib-tiny-gpu=
x-blt-read-read-bcs-bomb.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gtt-blt-sanitycheck1-bomb} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@gem_concurrent_blit@16mib-tiny-gtt-=
blt-sanitycheck1-bomb.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gtt-render-gpu-read-after-write-bomb=
} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-snb6/igt@gem_concurrent_blit@16mib-tiny-gtt-=
render-gpu-read-after-write-bomb.html">DMESG-WARN</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gtt-render-intermix-bcs-bomb} (NEW):=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-iclb4/igt@gem_concurrent_blit@16mib-tiny-gtt=
-render-intermix-bcs-bomb.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-gttx-render-overwrite-source-bomb} (=
NEW):</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5274/shard-hsw8/igt@gem_concurrent_blit@16mib-tiny-gttx-=
render-overwrite-source-bomb.html">DMESG-WARN</a> +3 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5274/shard-snb5/igt@gem_concurrent_blit@16mib-tiny-gttx-=
render-overwrite-source-bomb.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-prw-render-read-read-rcs-forked} (NE=
W):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-tglb8/igt@gem_concurrent_blit@16mib-tiny-prw=
-render-read-read-rcs-forked.html">WARN</a> +256 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-userptr-blt-read-read-bcs-bomb} (NEW=
):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-snb6/igt@gem_concurrent_blit@16mib-tiny-user=
ptr-blt-read-read-bcs-bomb.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@16mib-tiny-wc-blt-intermix-rcs-forked} (NEW):</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-iclb4/igt@gem_concurrent_blit@16mib-tiny-wc-=
blt-intermix-rcs-forked.html">WARN</a> +238 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@256kib-tiny-cpu-blt-gpu-read-after-write-child}=
 (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-kbl1/igt@gem_concurrent_blit@256kib-tiny-cpu=
-blt-gpu-read-after-write-child.html">WARN</a> +868 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@256kib-tiny-snoop-blt-intermix-both} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5274/shard-glk5/igt@gem_concurrent_blit@256kib-tiny-snoo=
p-blt-intermix-both.html">WARN</a> +451 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5274/shard-iclb1/igt@gem_concurrent_blit@256kib-tiny-sno=
op-blt-intermix-both.html">SKIP</a> +78 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@256kib-tiny-userptr-render-gpu-read-after-write=
-bomb} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@gem_concurrent_blit@256kib-tiny-use=
rptr-render-gpu-read-after-write-bomb.html">DMESG-FAIL</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>{igt@gem_concurrent_blit@4kib-tiny-snoop-render-overwrite-source-read-bc=
s-bomb} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5274/shard-tglb6/igt@gem_concurrent_blit@4kib-tiny-snoo=
p-render-overwrite-source-read-bcs-bomb.html">SKIP</a> +86 similar issues</=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5891/shard-hsw4/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5274/shard-hsw2/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw4/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5274/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5274/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5274/shard-hsw6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_527=
4/shard-hsw8/igt@runner@aborted.html">FAIL</a>) ([i915#2505])</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5891_full and IGTPW_5274_full=
:</p>
<h3>New IGT tests (8160)</h3>
<ul>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-early-read-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write:</p>
<ul>
<li>Statuses : 2 pass(s) 4 warn(s)</li>
<li>Exec time: [0.12, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-bomb:</p>
<ul>
<li>Statuses : 3 warn(s)</li>
<li>Exec time: [7.75, 68.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-child:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-forked:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-gpu-read-after-write-interrup=
tible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-child:</p>
<ul>
<li>Statuses : 2 warn(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-bcs-interruptible:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both:</p>
<ul>
<li>Statuses : 3 warn(s)</li>
<li>Exec time: [0.11, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-bomb:</p>
<ul>
<li>Statuses : 1 pass(s) 3 warn(s)</li>
<li>Exec time: [9.35, 46.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-forked:</p>
<ul>
<li>Statuses : 1 pass(s) 3 warn(s)</li>
<li>Exec time: [0.49, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-both-interruptible:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-intermix-rcs-interruptible:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-interruptibl=
e:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-child:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-forked:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-one-interrup=
tible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-bom=
b:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-chi=
ld:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-for=
ked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-bcs-int=
erruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-bom=
b:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-chi=
ld:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.10, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-for=
ked:</p>
<ul>
<li>Statuses : 3 warn(s)</li>
<li>Exec time: [0.29, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-read-rcs-int=
erruptible:</p>
<ul>
<li>Statuses : 2 pass(s) 4 warn(s)</li>
<li>Exec time: [0.33, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-child:</=
p>
<ul>
<li>Statuses : 2 pass(s) 4 warn(s)</li>
<li>Exec time: [0.13, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-forked:<=
/p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.55, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-overwrite-source-rev-interrup=
tible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-bcs-interruptible:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-forked:</p>
<ul>
<li>Statuses : 1 pass(s) 4 warn(s)</li>
<li>Exec time: [0.61, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-read-read-rcs-interruptible:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck0-interruptible:</=
p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.37, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-child:</p>
<ul>
<li>Statuses : 3 warn(s)</li>
<li>Exec time: [0.13, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheck1-interruptible:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-bomb:</p>
<ul>
<li>Statuses : 3 warn(s)</li>
<li>Exec time: [3.36, 28.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-child:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.13, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-forked:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-sanitycheckn-interruptible:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-child:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-bcs-interruptible:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-blt-write-read-rcs-interruptible:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-early-read-interruptible:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-bomb:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-child=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-forke=
d:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-gpu-read-after-write-inter=
ruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-bomb:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [6.13, 44.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-forked:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.53, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-bcs-interruptible=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-bomb:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [5.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-both-interruptibl=
e:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-bomb:</p>
<ul>
<li>Statuses : 2 warn(s)</li>
<li>Exec time: [6.00, 26.47] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-intermix-rcs-interruptible=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-bomb:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [8.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-forked:</=
p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-interrupt=
ible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-bomb:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-child=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-forke=
d:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-one-inter=
ruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-=
bomb:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [5.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-=
child:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-=
forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-bcs-=
interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-=
bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-=
child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-=
forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-read-rcs-=
interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-bomb:=
</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-child=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-forke=
d:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-overwrite-source-rev-inter=
ruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-bcs-interruptibl=
e:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-child:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.14, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-forked:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.61, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-read-read-rcs-interruptibl=
e:</p>
<ul>
<li>Statuses : 1 warn(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-forked:</p>
<ul>
<li>Statuses : 2 pass(s) 4 warn(s)</li>
<li>Exec time: [0.34, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck0-interruptible=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheck1-interruptible=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-forked:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.50, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-sanitycheckn-interruptible=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-bomb:</p>
<ul>
<li>Statuses : 1 pass(s) 3 warn(s)</li>
<li>Exec time: [17.36, 61.54] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-bcs-interruptib=
le:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-cpu-render-write-read-rcs-interruptib=
le:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read:</p>
<ul>
<li>Statuses : 3 warn(s)</li>
<li>Exec time: [0.11, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-forked:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.54, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-early-read-interruptible:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-bomb:=
</p>
<ul>
<li>Statuses : 1 pass(s) 3 warn(s)</li>
<li>Exec time: [9.70, 68.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-child=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-forke=
d:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-gpu-read-after-write-inter=
ruptible:</p>
<ul>
<li>Statuses : 2 pass(s) 4 warn(s)</li>
<li>Exec time: [0.14, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-bcs-interruptible=
:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.30, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-forked:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-both-interruptibl=
e:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs-bomb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs-child:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_concurrent_blit@16mib-tiny-dmabuf-blt-intermix-rcs-forked:</p>
<ul>
<li>Statuses : 2 pass(s) 5 warn(s)</li>
<li>Exec time: [0.58, 1.28] s</li>
</ul>
</li>
</ul>
<p>*</p>

</body>
</html>

--===============6189445872303039362==--

--===============1997120830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1997120830==--
