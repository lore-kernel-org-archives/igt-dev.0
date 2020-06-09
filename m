Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 09 Jun 2020 17:00:55 -0000
Message-ID: <159172205510.17063.9454908737927966949@emeril.freedesktop.org>
References: <20200609134033.29883-1-petri.latvala@intel.com>
In-Reply-To: <20200609134033.29883-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2F0?=
 =?utf-8?q?omic=5Ftransition=3A_Avoid_duplicate_dynamic_subtest_names?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: kms_atomic_transition: Avoid duplicate dynamic subtest names
URL   : https://patchwork.freedesktop.org/series/78166/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8603_full -> IGTPW_4658_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4658_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4658_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4658_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8603_full and IGTPW_4658_full:

### New IGT tests (128) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.02, 30.59] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [6.04, 30.44] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [6.07, 6.46] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.69, 34.51] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.68, 32.05] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.69, 32.51] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [34.98] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [33.30] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [33.34] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.93, 4.67] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.88, 4.63] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.87] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 1.86] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.53] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.53] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [6.05, 29.50] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [6.09, 29.75] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [6.02, 6.09] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.71, 34.64] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.70, 33.57] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.69, 33.42] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [34.87] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [33.45] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [33.39] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.95, 4.64] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 4.61] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.90] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.91, 3.88] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.0, 3.99] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.07] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.49] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.67] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.65, 3.69] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 5.11] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.03] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.02] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 1.33] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.38] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 3.88] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 4.00] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.07] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.47, 5.08] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.63, 4.96] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.65, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 5.11] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.04] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.05] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [4.00] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.91, 1.34] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.38] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 3.88] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 4.01] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.06] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.50, 5.06] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.69, 4.96] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.69, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 5.09] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.03] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.02] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [5.00] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.91, 1.33] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.38] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_atomic_transition@plane-all-transition@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.90, 3.87] s

  * igt@kms_atomic_transition@plane-all-transition@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 4.01] s

  * igt@kms_atomic_transition@plane-all-transition@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.08] s

  * igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.48, 5.07] s

  * igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.68, 4.92] s

  * igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.65, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 5.10] s

  * igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.00] s

  * igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 4.01] s

  * igt@kms_atomic_transition@plane-all-transition@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [4.99] s

  * igt@kms_atomic_transition@plane-all-transition@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_atomic_transition@plane-all-transition@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_atomic_transition@plane-all-transition@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.92, 1.33] s

  * igt@kms_atomic_transition@plane-all-transition@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.94, 1.38] s

  * igt@kms_atomic_transition@plane-all-transition@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.13] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.24] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.25] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.37] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.21] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.17, 1.22] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.41] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.24] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.25] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.14] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.26] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.38] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.14, 1.17] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.18, 1.22] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.39] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.27] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.28] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.14] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_4658_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#1930])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +50 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl1/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb3/igt@gem_pipe_control_store_loop@reused-buffer.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-tglb7/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][9] -> [DMESG-FAIL][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-apl3/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#95]) +41 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl7/igt@kms_color@pipe-b-ctm-max.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-apl6/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb5/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-snb2/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#72])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-snb:          [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb1/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-snb1/igt@kms_cursor_legacy@all-pipes-torture-bo.html
    - shard-hsw:          [PASS][23] -> [TIMEOUT][24] ([i915#1958]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw7/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-hsw6/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1982] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk9/igt@gem_exec_whisper@basic-queues-priority-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_sync@basic-store-each:
    - shard-apl:          [DMESG-WARN][45] ([i915#95]) -> [PASS][46] +35 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl7/igt@gem_sync@basic-store-each.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-apl8/igt@gem_sync@basic-store-each.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - shard-kbl:          [DMESG-WARN][47] ([i915#93] / [i915#95]) -> [PASS][48] +38 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl7/igt@i915_getparams_basic@basic-subslice-total.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl4/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][49] ([i915#402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb5/igt@i915_module_load@reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-tglb6/igt@i915_module_load@reload.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][51] ([i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [DMESG-FAIL][53] ([i915#54] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [DMESG-FAIL][59] ([fdo#108145] / [i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [DMESG-FAIL][61] ([fdo#108145] / [i915#54] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [62]: https://intel-gfx-ci.01

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4658/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
