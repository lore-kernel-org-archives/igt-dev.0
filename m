Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E718FD8748
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 12:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81C710E064;
	Tue, 17 Mar 2026 12:02:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD03910E064;
 Tue, 17 Mar 2026 12:02:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Unigraf_integration_=28re?=
 =?utf-8?q?v8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2026 12:02:06 -0000
Message-ID: <177374892675.365547.11989017570804858873@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
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

Series: Unigraf integration (rev8)
URL   : https://patchwork.freedesktop.org/series/151772/
State : failure

== Summary ==

Applying: lib/igt_kms: Add a detect timeout value
Applying: lib/igt_kms: Add helper to wait for a specific status on a connector
Applying: lib/igt_kms: Add function to list connected connectors
Applying: lib/igt_kms: Add helper to obtain a connector by its name or MST path
Applying: lib/igt_kms: Add helper to wait for new connectors
Applying: lib/tests: Add tests for array manipulations
Applying: lib/igt_kms: Add helper to get a pipe from a connector
Applying: lib/igt_kms: Expose dump_connector_attrs
Applying: lib/igt_kms: Expose reset_connectors_at_exit
Applying: lib/igt_kms: Expose connector_attr_set and igt_connector_attr_set
Applying: lib/igt_debugfs: Move debugfs helpers to the proper location
Applying: lib/igt_debugfs: Add const when make sense
Applying: lib/igt_amd: Add const when make sense
Applying: lib/igt_kms: Add const when make sense
Patch failed at 0014 lib/igt_kms: Add const when make sense
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


