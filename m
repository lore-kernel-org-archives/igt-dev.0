Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Nov 2020 10:55:04 -0000
Message-ID: <160457370467.14958.15139289258084738148@emeril.freedesktop.org>
References: <20201105060820.11057-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201105060820.11057-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_subtests_for_accurate_reporting_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0992796409=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0992796409==
Content-Type: multipart/alternative;
 boundary="===============8216333093412830793=="

--===============8216333093412830793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added dynamic subtests for accurate reporting (rev3)
URL   : https://patchwork.freedesktop.org/series/82743/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5833_full -> IGTPW_5134_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5134_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5134_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5134_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_tiled_fence_blits@basic:
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb6/igt@gem_tiled_fence_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb5/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@gem_workarounds@suspend-resume.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk3/igt@gem_workarounds@suspend-resume.html
    - shard-hsw:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@gem_workarounds@suspend-resume.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw2/igt@gem_workarounds@suspend-resume.html

  
New tests
---------

  New tests have been introduced between IGT_5833_full and IGTPW_5134_full:

### New IGT tests (141) ###

  * igt@kms_atomic_interruptible@atomic-setmode@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.39, 6.40] s

  * igt@kms_atomic_interruptible@atomic-setmode@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.99, 7.03] s

  * igt@kms_atomic_interruptible@atomic-setmode@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.67] s

  * igt@kms_atomic_interruptible@atomic-setmode@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.23] s

  * igt@kms_atomic_interruptible@legacy-cursor@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.37, 6.55] s

  * igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.49, 7.53] s

  * igt@kms_atomic_interruptible@legacy-cursor@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.28] s

  * igt@kms_atomic_interruptible@legacy-dpms@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.25, 6.35] s

  * igt@kms_atomic_interruptible@legacy-dpms@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.50] s

  * igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.57] s

  * igt@kms_atomic_interruptible@legacy-dpms@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.17] s

  * igt@kms_atomic_interruptible@legacy-pageflip@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.25, 6.34] s

  * igt@kms_atomic_interruptible@legacy-pageflip@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.51, 7.54] s

  * igt@kms_atomic_interruptible@legacy-pageflip@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.65] s

  * igt@kms_atomic_interruptible@legacy-pageflip@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.16, 6.20] s

  * igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.26, 6.35] s

  * igt@kms_atomic_interruptible@legacy-setmode@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.86, 6.88] s

  * igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.59] s

  * igt@kms_atomic_interruptible@legacy-setmode@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.14, 6.17] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.25, 6.34] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.49, 7.53] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.60] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.23] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.26, 6.43] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.52, 7.54] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.60] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.18, 6.22] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.53] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.57] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.58] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.76] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.34] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.37] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.54] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.58] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.58] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.48] s

  * igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.51] s

  * igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.51] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.73] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.34] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.34] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.83] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.46] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.47] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.39] s

  * igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.31] s

  * igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.50] s

  * igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.61] s

  * igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.58] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.69] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.34] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.87] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.48] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.48] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.39] s

  * igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.33] s

  * igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.55] s

  * igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.59] s

  * igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.59] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.75] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.32] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.36] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [0.95] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.56] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.59] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.60] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.78] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.63] s

  * igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.52] s

  * igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.51] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.74] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.24, 1.38] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 1.00] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.49] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.47] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.46] s

  * igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.31] s

  * igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.62] s

  * igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.63] s

  * igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.66] s

  * igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.96] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  

Known issues
------------

  Here are the changes found in IGTPW_5134_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2389])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12] ([i915#2502] / [i915#82])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@gem_exec_whisper@basic-contexts-forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb5/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_workarounds@suspend-resume:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1185]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@gem_workarounds@suspend-resume.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb5/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][15] -> [INCOMPLETE][16] ([i915#1635] / [i915#2635]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-apl3/igt@i915_suspend@sysfs-reader.html
    - shard-glk:          [PASS][17] -> [INCOMPLETE][18] ([i915#2635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@i915_suspend@sysfs-reader.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk3/igt@i915_suspend@sysfs-reader.html
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#2055] / [i915#2637])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@i915_suspend@sysfs-reader.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw7/igt@i915_suspend@sysfs-reader.html
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#155]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#96])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#2370]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw8/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1635] / [i915#1982]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@create-destroy-userspace-config:
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk9/igt@perf@create-destroy-userspace-config.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk8/igt@perf@create-destroy-userspace-config.html
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354] / [i915#1635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl8/igt@perf@create-destroy-userspace-config.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-apl6/igt@perf@create-destroy-userspace-config.html
    - shard-kbl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1354])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@perf@create-destroy-userspace-config.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl6/igt@perf@create-destroy-userspace-config.html
    - shard-hsw:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@perf@create-destroy-userspace-config.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw8/igt@perf@create-destroy-userspace-config.html
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([i915#1354])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb5/igt@perf@create-destroy-userspace-config.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb3/igt@perf@create-destroy-userspace-config.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][53] -> [SKIP][54] ([i915#1354]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb1/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-wakeup:
    - shard-kbl:          [INCOMPLETE][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@drm_read@short-buffer-wakeup.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl7/igt@drm_read@short-buffer-wakeup.html

  * igt@gem_caching@writes:
    - shard-snb:          [INCOMPLETE][57] ([i915#82]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@gem_caching@writes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb6/igt@gem_caching@writes.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][59] ([i915#454]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][61] ([i915#2521]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-hsw:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-vga1:
    - shard-snb:          [DMESG-WARN][67] ([i915#42]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb2/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb7/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [FAIL][71] ([i915#2546]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][73] ([i915#433]) -> [PASS][74]
   [73]: https://i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html

--===============8216333093412830793==
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
<tr><td><b>Series:</b></td><td>Added dynamic subtests for accurate reporting (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82743/">https://patchwork.freedesktop.org/series/82743/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5833_full -&gt; IGTPW_5134_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5134_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5134_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5134_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb3/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority-all.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb6/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb5/igt@gem_tiled_fence_blits@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk3/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw2/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5833_full and IGTPW_5134_full:</p>
<h3>New IGT tests (141)</h3>
<ul>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.39, 6.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.99, 7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.15, 6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.37, 6.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.49, 7.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.15, 6.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.25, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.15, 6.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.25, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.51, 7.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.16, 6.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.26, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.86, 6.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.14, 6.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.25, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.49, 7.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.15, 6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.26, 6.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.52, 7.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.18, 6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.38, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5134_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb5/igt@gem_exec_whisper@basic-contexts-forked.html">INCOMPLETE</a> ([i915#2502] / [i915#82])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb5/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#1185]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-apl3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#1635] / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#2635])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#2055] / [i915#2637])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#155]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">FAIL</a> ([i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw8/igt@kms_flip@2x-wf_vblank-ts-check@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">DMESG-WARN</a> ([i915#1982]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> ([i915#1982]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> ([i915#1982])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb4/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> ([i915#1982]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk9/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-glk8/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl8/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-apl6/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl6/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw8/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb5/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb3/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([i915#1354])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb3/igt@perf@gen12-mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb1/igt@perf@gen12-mi-rpc.html">SKIP</a> ([i915#1354]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@drm_read@short-buffer-wakeup.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl7/igt@drm_read@short-buffer-wakeup.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@gem_caching@writes.html">INCOMPLETE</a> ([i915#82]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb6/igt@gem_caching@writes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-hsw1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb2/igt@kms_flip@flip-vs-suspend@b-vga1.html">DMESG-WARN</a> ([i915#42]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb7/igt@kms_flip@flip-vs-suspend@b-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5134/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://i">SKIP</a> ([i915#433]) -&gt; [PASS][74]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8216333093412830793==--

--===============0992796409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0992796409==--
