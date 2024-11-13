Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5CFD637B1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 20:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3AC10E1E0;
	Wed, 13 Nov 2024 20:25:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5C510E1E0;
 Wed, 13 Nov 2024 20:25:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fhistogram=3A_?=
 =?utf-8?q?Add_vblank_wait_to_get_histogram_interrupts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 20:25:52 -0000
Message-ID: <173152955266.3666420.1112854356626094036@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113175400.163568-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113175400.163568-1-mohammed.thasleem@intel.com>
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

Series: tests/kms_histogram: Add vblank wait to get histogram interrupts
URL   : https://patchwork.freedesktop.org/series/141316/
State : failure

== Summary ==

Applying: tests/kms_histogram: Add vblank wait to get histogram interrupts
Using index info to reconstruct a base tree...
A	tests/kms_histogram.c
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/kms_histogram.c deleted in HEAD and modified in tests/kms_histogram: Add vblank wait to get histogram interrupts. Version tests/kms_histogram: Add vblank wait to get histogram interrupts of tests/kms_histogram.c left in tree.
Patch failed at 0001 tests/kms_histogram: Add vblank wait to get histogram interrupts
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


