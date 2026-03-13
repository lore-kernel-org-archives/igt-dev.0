Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327FE106FD8E
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 06:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D608C10E0B4;
	Fri, 13 Mar 2026 06:55:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAFE10E0B4;
 Fri, 13 Mar 2026 06:55:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fccs=3A_a?=
 =?utf-8?q?dd_VM=5FBIND_DECOMPRESS_flag_and_basic_decompression_tests_=28rev?=
 =?utf-8?q?5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Mar 2026 06:55:25 -0000
Message-ID: <177338492503.353915.12083923610013973873@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219122623.1090551-2-nitin.r.gote@intel.com>
In-Reply-To: <20251219122623.1090551-2-nitin.r.gote@intel.com>
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

Series: tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic decompression tests (rev5)
URL   : https://patchwork.freedesktop.org/series/157553/
State : failure

== Summary ==

Applying: tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic decompression tests
Using index info to reconstruct a base tree...
M	include/drm-uapi-experimental/intel_drm_local.h
Falling back to patching base and 3-way merge...
Auto-merging include/drm-uapi-experimental/intel_drm_local.h
CONFLICT (content): Merge conflict in include/drm-uapi-experimental/intel_drm_local.h
Patch failed at 0001 tests/intel/xe_ccs: add VM_BIND DECOMPRESS flag and basic decompression tests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


