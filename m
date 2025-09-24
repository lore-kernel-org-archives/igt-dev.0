Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA33ACAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 15:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E7610E765;
	Wed, 24 Sep 2025 15:35:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00CA10E765;
 Wed, 24 Sep 2025 15:35:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_extend_link_training_test?=
 =?utf-8?q?_cases_for_eDP_connector_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Sep 2025 15:35:47 -0000
Message-ID: <175872814791.362993.1140298037077321206@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

Series: extend link training test cases for eDP connector (rev2)
URL   : https://patchwork.freedesktop.org/series/150748/
State : failure

== Summary ==

Applying: tests/intel/kms_dp_link_training: rename to tests/intel/kms_link_training
Applying: tests/intel/kms_dp_linktrain_fallback: rename to tests/intel/kms_linktrain_fallback
Applying: tests/intel/kms_link_training: extend test for eDP connector
Applying: tests/intel/kms_linktrain_fallback: extend test for eDP connector
Applying: HAX: Do not merge
Using index info to reconstruct a base tree...
M	tests/intel-ci/xe-fast-feedback.testlist
Falling back to patching base and 3-way merge...
Auto-merging tests/intel-ci/xe-fast-feedback.testlist
CONFLICT (content): Merge conflict in tests/intel-ci/fast-feedback.testlist
Patch failed at 0005 HAX: Do not merge
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


