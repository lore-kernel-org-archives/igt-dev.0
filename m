Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F062C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 15:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A79310EAB4;
	Thu, 11 Jul 2024 15:04:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F5610EA68;
 Thu, 11 Jul 2024 15:04:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Refactor_sriov=5Fbasic_te?=
 =?utf-8?q?st_and_blocklisting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jul 2024 15:04:27 -0000
Message-ID: <172071026782.126651.7418799861684284889@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
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

Series: Refactor sriov_basic test and blocklisting (rev2)
URL   : https://patchwork.freedesktop.org/series/135946/
State : failure

== Summary ==

Applying: tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
Using index info to reconstruct a base tree...
M	tests/intel-ci/xe.blocklist.txt
Falling back to patching base and 3-way merge...
Auto-merging tests/intel-ci/xe.blocklist.txt
CONFLICT (content): Merge conflict in tests/intel-ci/xe.blocklist.txt
Patch failed at 0001 tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


