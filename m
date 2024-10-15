Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180AFCFC27E
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 09:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BAD10E092;
	Tue, 15 Oct 2024 09:44:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969E010E092;
 Tue, 15 Oct 2024 09:44:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/kms=5Fplane=5Fscali?=
 =?utf-8?q?ng=3A_Cdclk_exceeds_max_Cdclk_issue_fix_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 15 Oct 2024 09:44:20 -0000
Message-ID: <172898546061.1268557.7896436852526366894@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
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

Series: tests/kms_plane_scaling: Cdclk exceeds max Cdclk issue fix (rev5)
URL   : https://patchwork.freedesktop.org/series/139049/
State : failure

== Summary ==

Applying: tests/kms_plane_scaling: Add mode override in scaling test
Applying: tests/kms_plane_scaling: Improve error handling in kms_plane_scaling tests
Applying: HAX patch do not merge
Using index info to reconstruct a base tree...
M	tests/intel-ci/xe-fast-feedback.testlist
Falling back to patching base and 3-way merge...
Auto-merging tests/intel-ci/xe-fast-feedback.testlist
CONFLICT (content): Merge conflict in tests/intel-ci/xe-fast-feedback.testlist
Patch failed at 0003 HAX patch do not merge
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


