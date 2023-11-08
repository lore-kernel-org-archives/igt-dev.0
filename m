Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Date: Wed, 08 Nov 2023 06:42:21 -0000
Message-ID: <169942574127.24275.1296233604783650075@emeril.freedesktop.org>
References: <20231108062902.390248-1-vignesh.raman@collabora.com>
In-Reply-To: <20231108062902.390248-1-vignesh.raman@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBsaWIv?=
 =?utf-8?q?igt=5Fkms=3A_Fix_memory_corruption_=28rev3=29?=
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

Series: lib/igt_kms: Fix memory corruption (rev3)
URL   : https://patchwork.freedesktop.org/series/125599/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
6edf8b6808de2bde968415926d2b55817f7ea1de tests/amd_security: add secure write test for gfx

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
[1651/1654] Generating xe_tests.html with a custom command.
[1652/1654] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.

