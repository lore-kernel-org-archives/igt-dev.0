Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 02 Nov 2020 12:53:34 -0000
Message-ID: <160432161411.26393.6294845305008264294@emeril.freedesktop.org>
References: <20201102101349.25019-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201102101349.25019-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_subtests_for_accurate_reporting_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1389302790=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1389302790==
Content-Type: multipart/alternative;
 boundary="===============2861610733963471691=="

--===============2861610733963471691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added dynamic subtests for accurate reporting (rev2)
URL   : https://patchwork.freedesktop.org/series/82743/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9240_full -> IGTPW_5114_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5114_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5114_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5114_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@fds@vcs0:
    - shard-hsw:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw1/igt@gem_exec_parallel@fds@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw6/igt@gem_exec_parallel@fds@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9240_full and IGTPW_5114_full:

### New IGT tests (151) ###

  * igt@kms_atomic_interruptible@atomic-setmode@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.26, 6.35] s

  * igt@kms_atomic_interruptible@atomic-setmode@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.88] s

  * igt@kms_atomic_interruptible@atomic-setmode@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.63] s

  * igt@kms_atomic_interruptible@atomic-setmode@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.23] s

  * igt@kms_atomic_interruptible@legacy-cursor@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.27, 6.35] s

  * igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.51, 7.56] s

  * igt@kms_atomic_interruptible@legacy-cursor@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.60] s

  * igt@kms_atomic_interruptible@legacy-cursor@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.16, 6.20] s

  * igt@kms_atomic_interruptible@legacy-dpms@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.25, 6.33] s

  * igt@kms_atomic_interruptible@legacy-dpms@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.49] s

  * igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.61] s

  * igt@kms_atomic_interruptible@legacy-dpms@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.17] s

  * igt@kms_atomic_interruptible@legacy-pageflip@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.33, 6.38] s

  * igt@kms_atomic_interruptible@legacy-pageflip@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.54, 7.56] s

  * igt@kms_atomic_interruptible@legacy-pageflip@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.62] s

  * igt@kms_atomic_interruptible@legacy-pageflip@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.16, 6.20] s

  * igt@kms_atomic_interruptible@legacy-setmode@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.34, 6.51] s

  * igt@kms_atomic_interruptible@legacy-setmode@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.96] s

  * igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.61] s

  * igt@kms_atomic_interruptible@legacy-setmode@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.14, 6.18] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.23, 6.34] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.47, 7.51] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.61] s

  * igt@kms_atomic_interruptible@universal-setplane-cursor@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.15, 6.17] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.34, 6.41] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [7.50, 7.55] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.62] s

  * igt@kms_atomic_interruptible@universal-setplane-primary@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.18, 6.23] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.54] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.60] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.60] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.78] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.36] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.35] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.93] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.65] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.56] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.57] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.47] s

  * igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.52] s

  * igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.52] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 0.71] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.33] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.35] s

  * igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.89] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.46] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.49] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.38] s

  * igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.31] s

  * igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.47] s

  * igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.52] s

  * igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.51] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.74] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.35] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.40] s

  * igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.90] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.50] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.50] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.49] s

  * igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.31] s

  * igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.55] s

  * igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.59] s

  * igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.59] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.81] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.36] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 1.34] s

  * igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.56] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.60] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.58] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.75] s

  * igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.61] s

  * igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.60] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.71, 0.86] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.36] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.34] s

  * igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 1.02] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.48] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.50] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.44] s

  * igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.32] s

  * igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_flip_tiling@flip-y-tiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.61] s

  * igt@kms_flip_tiling@flip-y-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.66] s

  * igt@kms_flip_tiling@flip-y-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.65] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.77] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.34] s

  * igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_flip_tiling@flip-y-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_flip_tiling@flip-y-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_flip_tiling@flip-y-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip_tiling@flip-y-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_flip_tiling@flip-y-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_flip_tiling@flip-y-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-a:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.45, 0.63] s

  * igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.67] s

  * igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.66] s

  * igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [1.05] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  

Known issues
------------

  Here are the changes found in IGTPW_5114_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1982]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_exec_parallel@fds@bcs0:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] ([i915#82])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-snb4/igt@gem_exec_parallel@fds@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-snb7/igt@gem_exec_parallel@fds@bcs0.html

  * igt@gem_exec_parallel@fds@vecs0:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#1888])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw1/igt@gem_exec_parallel@fds@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw6/igt@gem_exec_parallel@fds@vecs0.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#1982]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#2370])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw6/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw8/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2598])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271] / [i915#1635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#1836])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#1836])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb1/igt@kms_prime@basic-crc@second-to-first.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk4/igt@kms_prime@basic-crc@second-to-first.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk5/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_vblank@pipe-a-query-idle:
    - shard-glk:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk3/igt@kms_vblank@pipe-a-query-idle.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk4/igt@kms_vblank@pipe-a-query-idle.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [PASS][37] -> [SKIP][38] ([fdo#109271] / [i915#1354]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk9/igt@perf@disabled-read-error.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk1/igt@perf@disabled-read-error.html
    - shard-kbl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1354]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl6/igt@perf@disabled-read-error.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl6/igt@perf@disabled-read-error.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#1354]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb1/igt@perf@non-sampling-read-error.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb3/igt@perf@non-sampling-read-error.html
    - shard-apl:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl8/igt@perf@non-sampling-read-error.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl7/igt@perf@non-sampling-read-error.html
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([i915#1354]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@perf@non-sampling-read-error.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb1/igt@perf@non-sampling-read-error.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@hotrebind}:
    - shard-tglb:         [DMESG-WARN][47] ([i915#1982]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb2/igt@core_hotunplug@hotrebind.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb1/igt@core_hotunplug@hotrebind.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [SKIP][49] ([fdo#109271]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw8/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [SKIP][51] ([fdo#109271]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl3/igt@i915_pm_rpm@pm-tiling.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl4/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [SKIP][53] ([fdo#109271] / [i915#1635]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl7/igt@i915_pm_rpm@pm-tiling.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl2/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk2/igt@i915_pm_rpm@pm-tiling.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk1/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [SKIP][57] ([i915#579]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][59] ([i915#2521]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb8/igt@kms_async_flips@alternate-sync-async-flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][63] ([i915#2346]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@2x-modeset-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw6/igt@kms_flip@2x-modeset-vs-vblank-race@ab

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/index.html

--===============2861610733963471691==
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
<tr><td><b>Series:</b></td><td>Added dynamic subtests for accurate reporting (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82743/">https://patchwork.freedesktop.org/series/82743/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9240_full -&gt; IGTPW_5114_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5114_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5114_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5114_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_parallel@fds@vcs0:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw1/igt@gem_exec_parallel@fds@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw6/igt@gem_exec_parallel@fds@vcs0.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9240_full and IGTPW_5114_full:</p>
<h3>New IGT tests (151)</h3>
<ul>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.26, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.63] s</li>
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
<li>Exec time: [6.27, 6.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.51, 7.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.16, 6.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.25, 6.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-dpms@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.61] s</li>
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
<li>Exec time: [6.33, 6.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.54, 7.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-pageflip@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.62] s</li>
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
<li>Exec time: [6.34, 6.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.14, 6.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.23, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.47, 7.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.15, 6.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.34, 6.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.50, 7.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.18, 6.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
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
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.89] s</li>
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
<li>Exec time: [0.24, 0.49] s</li>
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
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.38] s</li>
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
<li>Exec time: [0.38, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
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
<li>Exec time: [0.30, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-x-tiled@vga-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.55] s</li>
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
<li>Exec time: [0.45, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 1.34] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
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
<li>Exec time: [0.47, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.71, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled@vga-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.34] s</li>
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
<p>igt@kms_flip_tiling@flip-y-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s)</li>
<li>Exec time: [0.45, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.67] s</li>
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
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5114_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb1/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@fds@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-snb4/igt@gem_exec_parallel@fds@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-snb7/igt@gem_exec_parallel@fds@bcs0.html">INCOMPLETE</a> ([i915#82])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@fds@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw1/igt@gem_exec_parallel@fds@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw6/igt@gem_exec_parallel@fds@vecs0.html">FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> ([i915#2370])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw6/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw8/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html">DMESG-WARN</a> ([i915#1982]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271] / [i915#1635])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb3/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb8/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk4/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk5/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk3/igt@kms_vblank@pipe-a-query-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk4/igt@kms_vblank@pipe-a-query-idle.html">DMESG-WARN</a> ([i915#1982]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk9/igt@perf@disabled-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk1/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl6/igt@perf@disabled-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl6/igt@perf@disabled-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@non-sampling-read-error:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb1/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb3/igt@perf@non-sampling-read-error.html">SKIP</a> ([i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl8/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl7/igt@perf@non-sampling-read-error.html">SKIP</a> ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb2/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb1/igt@perf@non-sampling-read-error.html">SKIP</a> ([i915#1354]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb2/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb1/igt@core_hotunplug@hotrebind.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-hsw8/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-kbl3/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-kbl4/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl7/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-iclb6/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5114/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9240/shard-hsw6/igt@kms_flip@2x-modeset-vs-vblank-race@ab">DMESG-WARN</a> ([i915#1982]) -&gt; [PASS][68] +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2861610733963471691==--

--===============1389302790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1389302790==--
