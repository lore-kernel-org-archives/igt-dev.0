Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AC6CCFA18
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF210E510;
	Thu, 13 Nov 2025 08:02:30 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098CB10E510;
 Thu, 13 Nov 2025 08:02:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_writeback_changes_for?=
 =?utf-8?q?_intel-supported_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Nov 2025 08:02:29 -0000
Message-ID: <176302094903.48377.12037848861951538987@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
In-Reply-To: <20251103103842.3025204-1-sowmiya.s@intel.com>
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

Series: Add writeback changes for intel-supported formats
URL   : https://patchwork.freedesktop.org/series/156913/
State : failure

== Summary ==

Applying: tests/kms_writeback: Add support for intel-specific formats
Applying: tests/kms_writeback: Validate supported formats lib/igt_fb: Validate supported formats for crc calculation
Applying: tests/kms_writeback: Add intel specific check
Applying: tests/kms_writeback: Refactor format handling in commit_and_dump_fb
Applying: tests/kms_writeback: Add utility function for shared logic
Applying: tests/kms_writeback: FB creation within subtest
Applying: tests/kms_writeback: Refactor writeback-fb-id subtest
Applying: tests/kms_writeback: Refactor writeback-check-output subtest
Applying: tests/kms_writeback: Refactor writeback-check-output subtest
Patch failed at 0009 tests/kms_writeback: Refactor writeback-check-output subtest
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


