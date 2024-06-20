Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51781C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 04:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF3E10E1CB;
	Thu, 20 Jun 2024 04:01:34 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C713010E155;
 Thu, 20 Jun 2024 04:01:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_tests/xe=3A_Add_system=5Fallocator_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 04:01:33 -0000
Message-ID: <171885609381.127199.11471201760794227729@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620035057.3609916-1-matthew.brost@intel.com>
In-Reply-To: <20240620035057.3609916-1-matthew.brost@intel.com>
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

Series: series starting with [1/2] tests/xe: Add system_allocator test
URL   : https://patchwork.freedesktop.org/series/135084/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
a1840ca4270b765883d3b71a710b6af85ded8235 tools/intel_tiling_detect: Introduce tiling detection tool

Tail of build.log:
Warning: igt@xe_exec_system_allocator@twice-malloc-bo-unmap Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-bo-unmap-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-busy Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-busy-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-mlock Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-mlock-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-race Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-malloc-race-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-file Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-file-mlock Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-file-mlock-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-file-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-free Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-free-huge Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-free-huge-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-free-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-free-race Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-free-race-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-huge Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-huge-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-mlock Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-mlock-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-new Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-new-huge Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-new-huge-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-new-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-new-race Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-new-race-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-race Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-race-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-shared Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-mmap-shared-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-bo-map Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-bo-map-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-busy Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-busy-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-race Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@twice-new-race-nomemset Mega feature documentation is missing
Warning: igt@xe_exec_system_allocator@unaligned-alloc Mega feature documentation is missing
Warning: Missing documentation for igt@xe_exec_system_allocator@fault-benchmark
Please refer: docs/test_documentation.md for more details
[1678/1684] Generating i915_tests.rst with a custom command.
[1679/1684] Generating kms_tests.rst with a custom command.
[1680/1684] Generating intel-ci-tests with a custom command.
ninja: build stopped: subcommand failed.


