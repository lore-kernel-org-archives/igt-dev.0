Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Date: Fri, 27 Oct 2023 18:21:57 -0000
Message-ID: <169843091751.19712.10817515251266869556@emeril.freedesktop.org>
References: <20231027144022.2016354-1-vignesh.raman@collabora.com>
In-Reply-To: <20231027144022.2016354-1-vignesh.raman@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBsaWIv?=
 =?utf-8?q?igt=5Fkms=3A_Fix_memory_corruption_=28rev2=29?=
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

== Series Details ==

Series: lib/igt_kms: Fix memory corruption (rev2)
URL   : https://patchwork.freedesktop.org/series/125599/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5e82a8ee42d58c5e183c3d4208ae4ccd977a4830 intel-ci/xe-fast-feedback: Add two xe_evict_ccs subtests for Xe run

Tail of build.log:
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-y-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-y-tiled-gen12-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-y-tiled-gen12-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-y-tiled-gen12-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-yf-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-dg2-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-dg2-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-mtl-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-mtl-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-y-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-y-tiled-gen12-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-y-tiled-gen12-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-yf-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-dg2-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-mtl-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-y-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-y-tiled-gen12-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-yf-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-mtl-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-mtl-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-y-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-y-tiled-gen12-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-y-tiled-gen12-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-yf-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-dg2-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-mtl-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-mc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-y-tiled-gen12-rc-ccs-cc
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-yf-tiled-ccs
Please refer: docs/test_documentation.md for more details
[1648/1651] Generating xe_tests.html with a custom command.
[1649/1651] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

