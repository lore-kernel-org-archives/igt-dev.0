Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CBDC83F0A
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 20:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7194010E102;
	Sun,  6 Jul 2025 20:02:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36C610E102;
 Sun,  6 Jul 2025 20:02:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_plane_color_pipeline_?=
 =?utf-8?q?tests_for_Intel_hardware_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Jul 2025 20:02:39 -0000
Message-ID: <175183215984.138266.15684778972069309480@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250706200125.35741-1-swati2.sharma@intel.com>
In-Reply-To: <20250706200125.35741-1-swati2.sharma@intel.com>
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

Series: Add plane color pipeline tests for Intel hardware (rev2)
URL   : https://patchwork.freedesktop.org/series/150455/
State : failure

== Summary ==

Applying: tests/kms_colorop: Color pipeline igt base work
Using index info to reconstruct a base tree...
M	lib/igt_kms.c
M	lib/igt_kms.h
M	lib/meson.build
M	tests/kms_writeback.c
M	tests/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tests/meson.build
Auto-merging tests/kms_writeback.c
Auto-merging lib/meson.build
Auto-merging lib/igt_kms.h
CONFLICT (content): Merge conflict in lib/igt_kms.h
Auto-merging lib/igt_kms.c
CONFLICT (content): Merge conflict in lib/igt_kms.c
Patch failed at 0001 tests/kms_colorop: Color pipeline igt base work
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


