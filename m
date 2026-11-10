Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2433F606A321
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 17:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C7210E235;
	Tue, 10 Nov 2026 17:31:55 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50610E1F7;
 Tue, 10 Nov 2026 17:30:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/intel/xe=5Fsriov=5F?=
 =?utf-8?q?mmio=5Fregs=3A_Add_tests_to_verify_registers_on_VFs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 17:30:58 -0000
Message-ID: <179433185890.4669.8274780500456091200@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261110082838.2034264-1-lukasz.laguna@intel.com>
In-Reply-To: <20261110082838.2034264-1-lukasz.laguna@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs (rev5)
URL   : https://patchwork.freedesktop.org/series/172772/
State : failure

== Summary ==

Applying: lib/igt_sriov_device: Add helpers to get SR-IOV function name
Using index info to reconstruct a base tree...
M	lib/igt_sriov_device.c
M	lib/igt_sriov_device.h
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs
Using index info to reconstruct a base tree...
M	tests/meson.build
Falling back to patching base and 3-way merge...
CONFLICT (add/add): Merge conflict in tests/intel/xe_sriov_mmio_regs.c
Auto-merging tests/intel/xe_sriov_mmio_regs.c
Patch failed at 0002 tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


