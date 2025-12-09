Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BC5D3B98A
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 18:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1687886A4;
	Tue,  9 Dec 2025 18:04:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B356886A4;
 Tue,  9 Dec 2025 18:04:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fgt=5Ffre?=
 =?utf-8?q?q=3A_Modify_test_to_support_new_throttle_reasons_sysfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Dec 2025 18:04:35 -0000
Message-ID: <176530347503.70977.14012838377875691578@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209111126.1155774-4-sk.anirban@intel.com>
In-Reply-To: <20251209111126.1155774-4-sk.anirban@intel.com>
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

Series: tests/intel/xe_gt_freq: Modify test to support new throttle reasons sysfs (rev3)
URL   : https://patchwork.freedesktop.org/series/157903/
State : failure

== Summary ==

Applying: tests/intel/xe_gt_freq: Modify test to support new throttle reasons sysfs
Applying: HAX: Add throttle_basic_api test to fast feedback list
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
CONFLICT (content): Merge conflict in tests/intel-ci/xe-fast-feedback.testlist
Patch failed at 0002 HAX: Add throttle_basic_api test to fast feedback list
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


