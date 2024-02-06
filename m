Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F65C4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 19:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C680610F30E;
	Tue,  6 Feb 2024 19:25:00 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF22810F30E;
 Tue,  6 Feb 2024 19:24:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/kms=5Fccs=3A_?=
 =?utf-8?q?Add_Xe2_ccs_crc_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Feb 2024 19:24:58 -0000
Message-ID: <170724749898.1056684.10408502691887564309@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206190502.487549-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240206190502.487549-1-juhapekka.heikkila@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: tests/intel/kms_ccs: Add Xe2 ccs crc tests
URL   : https://patchwork.freedesktop.org/series/129593/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
8f5873486d002437d55a3890c990b80d28bb5c7b tests/amdgpu: add gang cs test

Tail of build.log:
Warning: Missing documentation for igt@kms_ccs@pipe-L-bad-aux-stride-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-bad-pixel-format-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-bad-rotation-90-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-ccs-on-another-bo-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-crc-primary-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-crc-primary-rotation-180-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-crc-sprite-planes-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-missing-ccs-buffer-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-L-random-ccs-data-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-bad-aux-stride-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-bad-pixel-format-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-bad-rotation-90-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-ccs-on-another-bo-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-crc-primary-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-crc-primary-rotation-180-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-crc-sprite-planes-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-missing-ccs-buffer-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-M-random-ccs-data-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-bad-aux-stride-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-bad-pixel-format-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-bad-rotation-90-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-ccs-on-another-bo-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-crc-primary-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-crc-primary-rotation-180-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-crc-sprite-planes-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-missing-ccs-buffer-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-N-random-ccs-data-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-bad-aux-stride-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-bad-pixel-format-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-bad-rotation-90-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-ccs-on-another-bo-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-primary-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-primary-rotation-180-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-crc-sprite-planes-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-missing-ccs-buffer-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-O-random-ccs-data-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-aux-stride-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-pixel-format-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-bad-rotation-90-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-ccs-on-another-bo-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-primary-rotation-180-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-crc-sprite-planes-basic-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-missing-ccs-buffer-4-tiled-xe2-ccs
Warning: Missing documentation for igt@kms_ccs@pipe-P-random-ccs-data-4-tiled-xe2-ccs
Please refer: docs/test_documentation.md for more details
[1664/1668] Generating intel-ci-tests with a custom command.
[1665/1668] Generating xe_tests.html with a custom command.
[1666/1668] Generating i915_tests.html with a custom command.
ninja: build stopped: subcommand failed.


