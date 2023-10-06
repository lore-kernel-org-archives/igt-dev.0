Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6550025473985955959=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 06 Oct 2023 21:14:50 -0000
Message-ID: <169662689054.6466.4082620854701420085@emeril.freedesktop.org>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgS01TOiBN?=
 =?utf-8?q?inor_cleanups?=
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

--===============6550025473985955959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: KMS: Minor cleanups
URL   : https://patchwork.freedesktop.org/series/124702/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13722_full -> IGTPW_9938_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9938_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][1] +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][3] +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs} (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][4] +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13722_full and IGTPW_9938_full:

### New IGT tests (656) ###

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-mc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-4-y-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-4-y-rc-ccs-cc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-aux-stride-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-pixel-format-yf-tiled-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-rc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-ccs:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-bad-rotation-90-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-basic-yf-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-yf-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-a-random-ccs-data-yf-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-pixel-format-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-bad-rotation-90-yf-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf-tiled-ccs:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-gen12-rc-ccs:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-b-random-ccs-data-yf-tiled-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-aux-stride-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-dg2-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-pixel-format-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-bad-rotation-90-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-c-random-ccs-data-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-aux-stride-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-pixel-format-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-mc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-gen12-mc-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-gen12-rc-ccs:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 2 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-d-random-ccs-data-yf-tiled-ccs:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-4-mc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-4-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-4-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-linear-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-linear-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-x-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-x-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-linear:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-x:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-y:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-to-y-rc-ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-to-y-rc-ccs-cc:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9938_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][5] ([i915#9408])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8414]) +22 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [PASS][7] -> [FAIL][8] ([i915#7742])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_basic@multigpu-create-close.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         NOTRUN -> [FAIL][13] ([i915#6268])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
    - shard-mtlp:         [PASS][14] -> [FAIL][15] ([i915#6268])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-8/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([fdo#109314])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1099])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-snb1/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][18] -> [FAIL][19] ([i915#7816]) +2 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [PASS][21] -> [ABORT][22] ([i915#7892] / [i915#9262])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#4771])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#4771])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#4525])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][26] -> [FAIL][27] ([i915#2846])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][28] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3539] / [i915#4852])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-19/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([fdo#112283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3281]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#3281]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-2/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3281]) +12 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4537] / [i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4860]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-1/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4860])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4613]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#4613]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-7/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#4613])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-apl4/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][45] -> [DMESG-WARN][46] ([i915#4936] / [i915#5493])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#8289])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-6/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic-read-write:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4077]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-14/igt@gem_mmap_gtt@basic-read-write.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4083]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4083]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-2/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3282]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3282]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4270]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-7/igt@gem_pxp@create-protected-buffer.html
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4270])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-14/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4270]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4270]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3282]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4079])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([fdo#109312])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-6/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4885])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-mtlp:         [PASS][61] -> [ABORT][62] ([i915#9262])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-8/igt@gem_spin_batch@spin-all-new.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_spin_batch@user-each:
    - shard-mtlp:         [PASS][63] -> [DMESG-FAIL][64] ([i915#8962]) +1 other test dmesg-fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-2/igt@gem_spin_batch@user-each.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@gem_spin_batch@user-each.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4079])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3297]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3297])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#3297]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4880])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3297] / [i915#4880])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([fdo#109289])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gen3_render_linear_blits.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([fdo#109289])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-15/igt@gen3_render_linear_blits.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([fdo#109289]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-3/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#2527]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#2527])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gen9_exec_parse@bb-start-cmd.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html

--===============6550025473985955959==
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
<tr><td><b>Series:</b></td><td>KMS: Minor cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124702/">https://patchwork.freedesktop.org/series/124702/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13722_full -&gt; IGTPW_9938_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9938_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13722_full and IGTPW_9938_full:</p>
<h3>New IGT tests (656)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-4-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-4-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 2 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-a-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-c-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-mc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-4-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-linear-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-4-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-4-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-d-x-to-4-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-a-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-b-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-c-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-1-pipe-d-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-a-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-2-pipe-b-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-a-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-b-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-c-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-linear-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-linear-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-x-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-x-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-cc-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-linear:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-x:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-y:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-rc-ccs-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-to-y-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@hdmi-a-4-pipe-d-y-to-y-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9938_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#9408])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@drm_fdinfo@busy@ccs0.html">SKIP</a> ([i915#8414]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-8/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-8/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-snb1/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html">ABORT</a> ([i915#7892] / [i915#9262])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-19/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-7/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-2/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-3/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4812])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-1/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-7/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-apl4/igt@gem_lmem_swapping@random.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-6/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-14/igt@gem_mmap_gtt@basic-read-write.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-2/igt@gem_mmap_wc@close.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +2 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-7/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +3 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-14/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#3282]) +3 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-6/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-8/igt@gem_spin_batch@spin-all-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@gem_spin_batch@spin-all-new.html">ABORT</a> ([i915#9262])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@user-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/shard-mtlp-2/igt@gem_spin_batch@user-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-mtlp-4/igt@gem_spin_batch@user-each.html">DMESG-FAIL</a> ([i915#8962]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-11/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-12/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-15/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-tglu-3/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/shard-dg1-16/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6550025473985955959==--
