Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0692108208546250780=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 13 Oct 2023 08:39:09 -0000
Message-ID: <169718634927.31156.7271096745648168353@emeril.freedesktop.org>
References: <20231011083557.65193-1-swati2.sharma@intel.com>
In-Reply-To: <20231011083557.65193-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Finterruptible=3A_use_pipe=5Fname_followed_by_out?=
 =?utf-8?q?put=5Fname?=
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

--===============0692108208546250780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_interruptible: use pipe_name followed by output_name
URL   : https://patchwork.freedesktop.org/series/124946/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13740_full -> IGTPW_9970_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9970_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9970_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9970_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][1] -> ([FAIL][2], [PASS][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13740_full and IGTPW_9970_full:

### New IGT tests (154) ###

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-1:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-dpms@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-4:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-1:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9970_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> ([SKIP][6], [SKIP][7]) ([i915#8411]) +1 other test ( 2 skip )
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> ([SKIP][9], [SKIP][10]) ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@api_intel_bb@crc32.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][11] ([i915#6122])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@api_intel_bb@render-ccs.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> ([SKIP][12], [SKIP][13]) ([i915#7701])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@device_reset@cold-reset-bound.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#7701])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> ([SKIP][15], [SKIP][16]) ([i915#8414]) +20 other tests ( 2 skip )
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@drm_fdinfo@busy-hang@bcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8414]) +10 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          NOTRUN -> [FAIL][18] ([i915#7742]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> ([SKIP][19], [SKIP][20]) ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_basic@multigpu-create-close.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_ccs@suspend-resume.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> ([SKIP][24], [SKIP][25]) ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_ccs@suspend-resume.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#7697]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> ([SKIP][27], [SKIP][28]) ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@gem_close_race@multigpu-basic-threads.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-reset@ccs0:
    - shard-mtlp:         [PASS][30] -> ([ABORT][31], [PASS][32]) ([i915#9414]) +1 other test ( 1 abort, 1 pass )
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-5/igt@gem_ctx_isolation@preservation-reset@ccs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_ctx_isolation@preservation-reset@ccs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_ctx_isolation@preservation-reset@ccs0.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [PASS][33] -> ([ABORT][34], [PASS][35]) ([i915#9262])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-mtlp:         NOTRUN -> ([SKIP][36], [SKIP][37]) ([fdo#109314])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_ctx_param@set-priority-not-supported.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         [PASS][38] -> ([FAIL][39], [FAIL][40]) ([i915#2410])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-7/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#8555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-dg1:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([i915#8555]) +1 other test ( 2 skip )
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hang.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#280]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][47] -> ([PASS][48], [ABORT][49]) ([i915#7975] / [i915#8213])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-17/igt@gem_eio@hibernate.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_eio@hibernate.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][50] -> ([FAIL][51], [FAIL][52]) ([i915#5784])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-17/igt@gem_eio@reset-stress.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_eio@reset-stress.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([i915#4771])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_balancer@bonded-dual.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4771]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4812]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([i915#8555]) +1 other test ( 2 skip )
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_balancer@noheartbeat.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([i915#4525]) +1 other test ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4525])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> ([SKIP][62], [SKIP][63]) ([i915#6334]) +1 other test ( 2 skip )
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([i915#6334])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_exec_capture@capture-invisible@smem0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#6344])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          NOTRUN -> [FAIL][67] ([i915#2846])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][68] ([i915#2842]) +4 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][69] -> ([FAIL][70], [FAIL][71]) ([i915#2842])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglu:         [PASS][72] -> ([PASS][73], [FAIL][74]) ([i915#2842])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [PASS][75] -> [FAIL][76] ([i915#2842])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-mtlp:         [PASS][77] -> ([PASS][78], [DMESG-FAIL][79]) ([i915#8962]) +3 other tests ( 1 dmesg-fail, 1 pass )
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_exec_fence@parallel@vcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_exec_fence@parallel@vcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_exec_fence@parallel@vecs0:
    - shard-mtlp:         [PASS][80] -> ([PASS][81], [FAIL][82]) ([i915#8957]) +2 other tests ( 1 fail, 1 pass )
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_exec_fence@parallel@vecs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_exec_fence@parallel@vecs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([i915#4812])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_exec_fence@submit3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([i915#4812]) +2 other tests ( 2 skip )
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_fence@submit67.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([fdo#109313])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-mtlp:         NOTRUN -> ([SKIP][88], [SKIP][89]) ([i915#3711])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([i915#3539])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3539] / [i915#4852]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html
    - shard-dg1:          NOTRUN -> ([SKIP][93], [SKIP][94]) ([i915#3539] / [i915#4852]) +1 other test ( 2 skip )
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_flush@basic-wb-prw-default.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([i915#3539] / [i915#4852])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_flush@basic-wb-rw-default.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([fdo#109283] / [i915#5107])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg1:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([fdo#109283])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_params@rsvd2-dirt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([fdo#112283])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_params@secure-non-root.html
    - shard-mtlp:         NOTRUN -> ([SKIP][102], [SKIP][103]) ([fdo#112283])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gem_exec_params@secure-non-root.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-mtlp:         NOTRUN -> ([SKIP][104], [SKIP][105]) ([i915#3281]) +2 other tests ( 2 skip )
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-wc.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg1:          NOTRUN -> ([SKIP][106], [SKIP][107]) ([i915#3281]) +4 other tests ( 2 skip )
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-dg2:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([i915#3281]) +5 other tests ( 2 skip )
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#3281]) +16 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3281]) +20 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-rkl:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([i915#3281]) +3 other tests ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-active.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@noreorder@ccs0:
    - shard-mtlp:         [PASS][114] -> ([DMESG-WARN][115], [PASS][116]) ([i915#8962])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_exec_schedule@noreorder@ccs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_exec_schedule@noreorder@ccs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_exec_schedule@noreorder@ccs0.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4537] / [i915#4812]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@wide@rcs0:
    - shard-glk:          [PASS][118] -> ([FAIL][119], [PASS][120]) ([i915#9521])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk4/igt@gem_exec_schedule@wide@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_exec_schedule@wide@rcs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@gem_exec_schedule@wide@rcs0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4860]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([i915#4860]) +2 other tests ( 2 skip )
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-dg1:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([i915#4860])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4860]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#2190])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-apl:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([fdo#109271] / [i915#4613])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl2/igt@gem_lmem_swapping@heavy-verify-random.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#4613]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][131], [SKIP][132]) ([i915#4613])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][133], [SKIP][134]) ([i915#4613])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-10/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#4613])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][136] ([i915#4936] / [i915#5493])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#8289])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#284])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#284])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4083]) +9 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([fdo#111656])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_mmap_gtt@coherency.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4077]) +25 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
    - shard-dg1:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([i915#4077]) +5 other tests ( 2 skip )
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([i915#4077]) +4 other tests ( 2 skip )
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-y.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_mmap_gtt@fault-concurrent-y.html
    - shard-snb:          [PASS][148] -> ([INCOMPLETE][149], [PASS][150]) ([i915#5161])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-snb7/igt@gem_mmap_gtt@fault-concurrent-y.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-snb1/igt@gem_mmap_gtt@fault-concurrent-y.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4077])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> ([SKIP][152], [SKIP][153]) ([i915#4083]) +3 other tests ( 2 skip )
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_mmap_wc@close.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> ([SKIP][154], [SKIP][155]) ([i915#4083])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#3282]) +10 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3282]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@bench:
    - shard-dg1:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([i915#3282]) +4 other tests ( 2 skip )
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@gem_pread@bench.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_pread@bench.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([i915#3282]) +1 other test ( 2 skip )
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_pread@snoop.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-mtlp:         NOTRUN -> ([SKIP][162], [SKIP][163]) ([i915#3282]) +1 other test ( 2 skip )
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_pwrite@basic-exhaustion.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-dg2:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([i915#4270])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_pxp@create-regular-buffer.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#4270]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#4270]) +8 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
    - shard-rkl:          NOTRUN -> ([SKIP][168], [SKIP][169]) ([i915#4270]) +2 other tests ( 2 skip )
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_pxp@display-protected-crc.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([i915#4270]) +1 other test ( 2 skip )
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> ([SKIP][172], [SKIP][173]) ([i915#8428])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4079]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([i915#4079])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_set_tiling_vs_gtt.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> ([SKIP][177], [SKIP][178]) ([i915#4079])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_set_tiling_vs_gtt.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> ([SKIP][179], [SKIP][180]) ([i915#3282]) +2 other tests ( 2 skip )
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([i915#4885])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_softpin@evict-snoop.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-dg2:          [PASS][183] -> [FAIL][184] ([fdo#103375])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg2-11/igt@gem_softpin@noreloc-s3.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@gem_softpin@noreloc-s3.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][185] ([i915#5889])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_spin_batch@user-each:
    - shard-mtlp:         [PASS][186] -> [DMESG-FAIL][187] ([i915#8962])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_spin_batch@user-each.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_spin_batch@user-each.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> ([SKIP][188], [SKIP][189]) ([i915#3297]) +1 other test ( 2 skip )
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@coherency-sync.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][190] ([fdo#110542])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3297]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-dg1:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([i915#3297]) +2 other tests ( 2 skip )
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_userptr_blits@create-destroy-unsync.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> ([SKIP][194], [SKIP][195]) ([i915#3323])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> ([SKIP][196], [SKIP][197]) ([fdo#109271] / [i915#3323])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([i915#3323])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3297]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3297] / [i915#4880])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([i915#3297] / [i915#4880])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [PASS][204] -> ([FAIL][205], [FAIL][206]) ([i915#9353])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-7/igt@gem_userptr_blits@nohangcheck.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@gem_userptr_blits@nohangcheck.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@gem_userptr_blits@nohangcheck.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> ([SKIP][207], [SKIP][208]) ([i915#3297])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@gem_userptr_blits@readonly-unsync.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> ([FAIL][209], [FAIL][210]) ([i915#3318])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@vma-merge.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglu:         NOTRUN -> ([SKIP][211], [SKIP][212]) ([fdo#109289])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@gen7_exec_parse@basic-allocation.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-mtlp:         NOTRUN -> ([SKIP][213], [SKIP][214]) ([fdo#109289])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gen7_exec_parse@basic-allowed.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-2/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-rkl:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([fdo#109289])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gen7_exec_parse@basic-offset.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([fdo#109289]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([fdo#109289]) +5 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu:         NOTRUN -> ([SKIP][219], [SKIP][220]) ([i915#2527] / [i915#2856])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@gen9_exec_parse@bb-chained.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2527]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> ([SKIP][222], [SKIP][223]) ([i915#2527])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-dg2:          NOTRUN -> ([SKIP][224], [SKIP][225]) ([i915#2856]) +2 other tests ( 2 skip )
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gen9_exec_parse@unaligned-jump.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#2856]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gen9_exec_parse@valid-registers.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#2527]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#4881])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@i915_fb_tiling.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [PASS][229] -> ([FAIL][230], [FAIL][231]) ([i915#7069]) +1 other test ( 2 fail )
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@i915_hangman@engine-engine-error@vcs0.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#6227])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][233] -> ([DMESG-WARN][234], [DMESG-WARN][235]) ([i915#8617])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#6412])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#7091])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-apl:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([fdo#109271]) +32 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl1/igt@i915_pm_freq_api@freq-reset.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl2/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][240] ([i915#9407])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([i915#6590])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> ([SKIP][243], [SKIP][244]) ([i915#6590])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [PASS][245] -> ([PASS][246], [FAIL][247]) ([i915#3591])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> ([SKIP][248], [SKIP][249]) ([i915#1397])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@i915_pm_rpm@dpms-lpsp.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#1397])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> ([PASS][251], [SKIP][252]) ([i915#1397])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-rkl:          [PASS][253] -> ([PASS][254], [SKIP][255]) ([i915#1397]) +1 other test ( 1 pass, 1 skip )
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([fdo#109506])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][257] -> [SKIP][258] ([i915#1397])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][259] -> ([SKIP][260], [PASS][261]) ([i915#1397])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][262] -> [SKIP][263] ([i915#1397])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([fdo#109506])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([i915#8925])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@i915_pm_rps@thresholds-idle@gt0.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#8925])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg2:          NOTRUN -> [FAIL][268] ([i915#8229])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@i915_pm_rps@waitboost.html
    - shard-dg1:          [PASS][269] -> ([FAIL][270], [FAIL][271]) ([i915#8229])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-16/igt@i915_pm_rps@waitboost.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@i915_pm_rps@waitboost.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@i915_pm_rps@waitboost.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#4387])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#6245])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#5723])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][275], [DMESG-WARN][276]) ([i915#9311])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@i915_selftest@mock@memory_region.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([i915#4212]) +2 other tests ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#4212])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> ([SKIP][280], [SKIP][281]) ([i915#3826])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-tglu:         NOTRUN -> ([SKIP][282], [SKIP][283]) ([i915#3826])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@crc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][284] ([i915#8247]) +3 other tests fail
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#404])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][286] ([fdo#109271] / [i915#1769])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> ([SKIP][287], [SKIP][288]) ([i915#1769] / [i915#3555])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#1769] / [i915#3555]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> ([SKIP][290], [SKIP][291]) ([i915#1769] / [i915#3555])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#5286]) +11 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> ([SKIP][293], [SKIP][294]) ([fdo#111614]) +1 other test ( 2 skip )
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> ([SKIP][295], [SKIP][296]) ([i915#5286]) +2 other tests ( 2 skip )
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][297] -> ([FAIL][298], [FAIL][299]) ([i915#5138]) +1 other test ( 2 fail )
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> ([SKIP][300], [SKIP][301]) ([i915#4538] / [i915#5286]) +5 other tests ( 2 skip )
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> ([SKIP][302], [SKIP][303]) ([i915#3638]) +1 other test ( 2 skip )
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([fdo#111614]) +10 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][305] -> ([PASS][306], [FAIL][307]) ([i915#3743]) +2 other tests ( 1 fail, 1 pass )
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([fdo#111614] / [i915#3638]) +6 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([i915#5190]) +11 other tests ( 2 skip )
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> ([SKIP][311], [SKIP][312]) ([fdo#111615]) +2 other tests ( 2 skip )
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([fdo#110723]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> ([SKIP][314], [SKIP][315]) ([i915#4538]) +4 other tests ( 2 skip )
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#4538] / [i915#5190]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> ([SKIP][317], [SKIP][318]) ([fdo#110723])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> ([SKIP][319], [SKIP][320]) ([fdo#111615])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#5190]) +20 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-rkl:          NOTRUN -> [SKIP][322] ([fdo#111615])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([i915#4538] / [i915#5190]) +2 other tests ( 2 skip )
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglu:         NOTRUN -> ([SKIP][325], [SKIP][326]) ([i915#2705])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_big_joiner@2x-modeset.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_big_joiner@basic:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#2705])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#2705]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@kms_big_joiner@invalid-modeset.html
    - shard-mtlp:         NOTRUN -> ([SKIP][329], [SKIP][330]) ([i915#2705])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@kms_big_joiner@invalid-modeset.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#3742])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#4087]) +3 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-mtlp:         NOTRUN -> ([SKIP][333], [SKIP][334]) ([i915#7828]) +2 other tests ( 2 skip )
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@kms_chamelium_audio@dp-audio.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-glk:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([fdo#109271]) +40 other tests ( 2 skip )
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@kms_chamelium_color@ctm-max.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@kms_chamelium_color@ctm-max.html
    - shard-rkl:          NOTRUN -> [SKIP][337] ([fdo#111827])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([fdo#111827]) +4 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2:          NOTRUN -> ([SKIP][339], [SKIP][340]) ([fdo#111827]) +1 other test ( 2 skip )
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_chamelium_color@gamma.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#7828])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg1:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([i915#7828]) +3 other tests ( 2 skip )
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> ([SKIP][344], [SKIP][345]) ([i915#7828]) +3 other tests ( 2 skip )
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_chamelium_edid@dp-mode-timings.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-rkl:          NOTRUN -> ([SKIP][346], [SKIP][347]) ([i915#7828]) +6 other tests ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_chamelium_edid@dp-mode-timings.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#7828]) +16 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-tglu:         NOTRUN -> ([SKIP][349], [SKIP][350]) ([i915#7828]) +1 other test ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#7828]) +9 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#7118])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> ([SKIP][353], [SKIP][354]) ([i915#6944])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@kms_content_protection@atomic-dpms.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> ([TIMEOUT][355], [TIMEOUT][356]) ([i915#7173])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl3/igt@kms_content_protection@atomic@pipe-a-dp-1.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl2/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#3116])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#3299])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> ([SKIP][359], [SKIP][360]) ([i915#3116])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> ([SKIP][361], [SKIP][362]) ([i915#3116] / [i915#3299])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> ([SKIP][363], [SKIP][364]) ([i915#3299])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> ([SKIP][365], [SKIP][366]) ([i915#7118]) +1 other test ( 2 skip )
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_content_protection@srm.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> ([SKIP][367], [SKIP][368]) ([i915#7116])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@kms_content_protection@srm.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-mtlp:         NOTRUN -> ([SKIP][369], [SKIP][370]) ([i915#3555] / [i915#6944])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_content_protection@type1.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#7118])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> ([SKIP][372], [SKIP][373]) ([i915#3359])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> ([SKIP][374], [SKIP][375]) ([fdo#109279] / [i915#3359])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#3359]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-tglu:         NOTRUN -> ([SKIP][377], [SKIP][378]) ([i915#3359]) +1 other test ( 2 skip )
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([fdo#109279] / [i915#3359])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#3359]) +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#3555])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#3555]) +8 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-mtlp:         NOTRUN -> ([SKIP][383], [SKIP][384]) ([i915#3546])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> ([SKIP][385], [SKIP][386]) ([fdo#109274] / [i915#5354]) +2 other tests ( 2 skip )
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> ([SKIP][387], [SKIP][388]) ([i915#4103])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#4103] / [i915#4213] / [i915#5608])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([fdo#111825]) +11 other tests ( 2 skip )
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-tglu:         NOTRUN -> ([SKIP][392], [SKIP][393]) ([fdo#109274]) +1 other test ( 2 skip )
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][394] ([fdo#111767] / [fdo#111825]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
    - shard-tglu:         NOTRUN -> ([SKIP][395], [SKIP][396]) ([fdo#109274] / [fdo#111767])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][397] ([fdo#109274] / [i915#5354]) +6 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][398] -> [FAIL][399] ([i915#2346])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][400] -> ([PASS][401], [FAIL][402]) ([i915#2346])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#4103] / [i915#4213]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg1:          NOTRUN -> ([SKIP][404], [SKIP][405]) ([i915#4103] / [i915#4213])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@single-bo@all-pipes:
    - shard-mtlp:         [PASS][406] -> ([PASS][407], [DMESG-WARN][408]) ([i915#2017])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-1/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@kms_cursor_legacy@single-bo@all-pipes.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#9227]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][410] ([i915#9227])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#9226] / [i915#9261]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][412] ([i915#9226] / [i915#9261]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#3804])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#8812])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#3555] / [i915#3840]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> ([SKIP][416], [SKIP][417]) ([i915#3555] / [i915#3840])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@kms_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/index.html

--===============0692108208546250780==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_interruptible: use pipe_name followed by output_name</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124946/">https://patchwork.freedesktop.org/series/124946/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13740_full -&gt; IGTPW_9970_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9970_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9970_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/index.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9970_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_ppgtt@flink-and-close-vma-leak:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13740_full and IGTPW_9970_full:</p>
<h3>New IGT tests (154)</h3>
<ul>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-a-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-b-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-c-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-3-pipe-d-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9970_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a>) ([i915#8411]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@api_intel_bb@crc32.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@api_intel_bb@crc32.html">SKIP</a>) ([i915#6230])</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@device_reset@cold-reset-bound.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@device_reset@cold-reset-bound.html">SKIP</a>) ([i915#7701])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a>) ([i915#8414]) +20 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@drm_fdinfo@busy-idle@bcs0.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_basic@multigpu-create-close.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_basic@multigpu-create-close.html">SKIP</a>) ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_ccs@suspend-resume.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_ccs@suspend-resume.html">SKIP</a>) ([i915#9323])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_ccs@suspend-resume.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gem_ccs@suspend-resume.html">SKIP</a>) ([i915#9323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a>) ([i915#7697])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-reset@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-5/igt@gem_ctx_isolation@preservation-reset@ccs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_ctx_isolation@preservation-reset@ccs0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_ctx_isolation@preservation-reset@ccs0.html">PASS</a>) ([i915#9414]) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@vcs1.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a>) ([i915#9262])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a>) ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-7/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a>) ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a>) ([i915#8555]) +1 other test ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>) ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-17/igt@gem_eio@hibernate.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_eio@hibernate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a>) ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-17/igt@gem_eio@reset-stress.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_eio@reset-stress.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a>) ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_balancer@bonded-dual.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_exec_balancer@bonded-dual.html">SKIP</a>) ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_balancer@noheartbeat.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html">SKIP</a>) ([i915#8555]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a>) ([i915#4525]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a>) ([i915#6334]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a>) ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-10/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_exec_fence@parallel@vcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_exec_fence@parallel@vcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html">DMESG-FAIL</a>) ([i915#8962]) +3 other tests ( 1 dmesg-fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_exec_fence@parallel@vecs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_exec_fence@parallel@vecs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html">FAIL</a>) ([i915#8957]) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_exec_fence@submit3.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_exec_fence@submit3.html">SKIP</a>) ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_fence@submit67.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_fence@submit67.html">SKIP</a>) ([i915#4812]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a>) ([i915#3711])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a>) ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a>) ([i915#3539] / [i915#4852]) +1 other test ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a>) ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a>) ([fdo#109283] / [i915#5107])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a>) ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gem_exec_params@secure-non-root.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-2/igt@gem_exec_params@secure-non-root.html">SKIP</a>) ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a>) ([i915#3281]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a>) ([i915#3281]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a>) ([i915#3281]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a>) ([i915#3281]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_exec_schedule@noreorder@ccs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_exec_schedule@noreorder@ccs0.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_exec_schedule@noreorder@ccs0.html">PASS</a>) ([i915#8962])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@wide@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk4/igt@gem_exec_schedule@wide@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_exec_schedule@wide@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@gem_exec_schedule@wide@rcs0.html">PASS</a>) ([i915#9521])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a>) ([i915#4860]) +2 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a>) ([i915#4860])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl2/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl1/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a>) ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a>) ([i915#4613])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-10/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a>) ([i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_media_vme.html">SKIP</a> ([i915#284])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> ([i915#284])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@gem_mmap@basic-small-bo.html">SKIP</a> ([i915#4083]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_mmap_gtt@coherency.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_mmap_gtt@coherency.html">SKIP</a>) ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +25 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a>) ([i915#4077]) +5 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a>) ([i915#4077]) +4 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-snb7/igt@gem_mmap_gtt@fault-concurrent-y.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-snb1/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-snb4/igt@gem_mmap_gtt@fault-concurrent-y.html">PASS</a>) ([i915#5161])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_mmap_wc@close.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_mmap_wc@close.html">SKIP</a>) ([i915#4083]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a>) ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@gem_pread@bench.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_pread@bench.html">SKIP</a>) ([i915#3282]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_pread@snoop.html">SKIP</a>) ([i915#3282]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@gem_pwrite@basic-exhaustion.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a>) ([i915#3282]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@gem_pxp@create-regular-buffer.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@gem_pxp@create-regular-buffer.html">SKIP</a>) ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +8 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_pxp@display-protected-crc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_pxp@display-protected-crc.html">SKIP</a>) ([i915#4270]) +2 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a>) ([i915#4270]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a>) ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@gem_set_tiling_vs_gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html">SKIP</a>) ([i915#4079])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_set_tiling_vs_gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html">SKIP</a>) ([i915#4079])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a>) ([i915#3282]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_softpin@evict-snoop.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_softpin@evict-snoop.html">SKIP</a>) ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg2-11/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@gem_softpin@noreloc-s3.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@user-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-6/igt@gem_spin_batch@user-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@gem_spin_batch@user-each.html">DMESG-FAIL</a> ([i915#8962])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a>) ([i915#3297]) +1 other test ( 2 skip )</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a>) ([i915#3297]) +2 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>) ([i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>) ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>) ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a>) ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-7/igt@gem_userptr_blits@nohangcheck.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@gem_userptr_blits@nohangcheck.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@gem_userptr_blits@nohangcheck.html">FAIL</a>) ([i915#9353])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a>) ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gem_userptr_blits@vma-merge.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@gem_userptr_blits@vma-merge.html">FAIL</a>) ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@gen7_exec_parse@basic-allocation.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@gen7_exec_parse@basic-allocation.html">SKIP</a>) ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-2/igt@gen7_exec_parse@basic-allowed.html">SKIP</a>) ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gen7_exec_parse@basic-offset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@gen7_exec_parse@basic-offset.html">SKIP</a>) ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@gen9_exec_parse@bb-chained.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-3/igt@gen9_exec_parse@bb-chained.html">SKIP</a>) ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a>) ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>) ([i915#2856]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +4 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a>) ([i915#7069]) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a>) ([i915#8617])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl1/igt@i915_pm_freq_api@freq-reset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a>) ([fdo#109271]) +32 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> ([i915#9407])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a>) ([i915#6590])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a>) ([i915#6590])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a>) ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a>) ([i915#1397])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>) ([i915#1397])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a>) ([i915#1397]) +1 other test ( 1 pass, 1 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a>) ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-12/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a>) ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@i915_pm_rps@waitboost.html">FAIL</a> ([i915#8229])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-dg1-16/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@i915_pm_rps@waitboost.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@i915_pm_rps@waitboost.html">FAIL</a>) ([i915#8229])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a>) ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a>) ([i915#4212]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) ([i915#3826])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([fdo#109271] / [i915#1769])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>) ([i915#1769] / [i915#3555])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a>) ([i915#1769] / [i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5286]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>) ([fdo#111614]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>) ([i915#5286]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a>) ([i915#5138]) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a>) ([i915#4538] / [i915#5286]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a>) ([i915#3638]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a>) ([i915#3743]) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>) ([i915#5190]) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>) ([fdo#111615]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +8 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a>) ([i915#4538]) +4 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>) ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a>) ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190]) +20 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a>) ([i915#4538] / [i915#5190]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_big_joiner@2x-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@kms_big_joiner@2x-modeset.html">SKIP</a>) ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a>) ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@kms_chamelium_audio@dp-audio.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@kms_chamelium_audio@dp-audio.html">SKIP</a>) ([i915#7828]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@kms_chamelium_color@ctm-max.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk2/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) ([fdo#109271]) +40 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_chamelium_color@gamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_chamelium_color@gamma.html">SKIP</a>) ([fdo#111827]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a>) ([i915#7828]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>) ([i915#7828]) +3 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>) ([i915#7828]) +6 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-3/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a>) ([i915#7828]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) ([i915#6944])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl3/igt@kms_content_protection@atomic@pipe-a-dp-1.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-apl2/igt@kms_content_protection@atomic@pipe-a-dp-1.html">TIMEOUT</a>) ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>) ([i915#3116])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>) ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a>) ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_content_protection@srm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_content_protection@srm.html">SKIP</a>) ([i915#7118]) +1 other test ( 2 skip )</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-14/igt@kms_content_protection@srm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_content_protection@srm.html">SKIP</a>) ([i915#7116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-8/igt@kms_content_protection@type1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-3/igt@kms_content_protection@type1.html">SKIP</a>) ([i915#3555] / [i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a>) ([i915#3359])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a>) ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>) ([i915#3359]) +1 other test ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a>) ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a>) ([fdo#109274] / [i915#5354]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>) ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a>) ([fdo#111825]) +11 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>) ([fdo#109274]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#111767] / [fdo#111825]) +2 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a>) ([fdo#109274] / [fdo#111767])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([fdo#109274] / [i915#5354]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a>) ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a>) ([i915#4103] / [i915#4213])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13740/shard-mtlp-1/igt@kms_cursor_legacy@single-bo@all-pipes.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-1/igt@kms_cursor_legacy@single-bo@all-pipes.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-mtlp-4/igt@kms_cursor_legacy@single-bo@all-pipes.html">DMESG-WARN</a>) ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-6/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html">SKIP</a> ([i915#9227]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> ([i915#9226] / [i915#9261]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-rkl-4/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9970/shard-dg1-19/igt@kms_">SKIP</a>, [SKIP][417]) ([i915#3555] / [i915#3840])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0692108208546250780==--
