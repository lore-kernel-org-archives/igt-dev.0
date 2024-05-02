Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F38EC4345F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 06:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CC910E15F;
	Thu,  2 May 2024 06:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cL4mkgEi";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7C210E15F
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 06:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714632229;
 bh=Xpxzzym8DOiJEfOi1AXlfNsS60lbNHB5LL33t3+fhY8=;
 h=From:To:Subject:Date:From;
 b=cL4mkgEihPJEaGrB+BqGJhN0Ku82KZlX3hK7jFs2ttydovOkLB3Vq7nxcDiMYGW8f
 MsS2XWBf9YkCa908KdTHv8q2Uyj0h/3wC8skT31Bp49JLGIPNR3cZapj5Gz5GU0hkO
 gZOA+9VDuixS842BLOlmvXhZBwmQeflHI0DPjp9K2mjcX3ZgVTfYRCZhhe7GhkEckH
 O1NA1Vj4xZp/DZ+y+i3xL7zK14ooXoQMh8LVFq0bIqlMGEyUdWqIdjcZeJ1yKRudjh
 PfzGzMu7EaG8KFMApM/QMWh6fXQNtyrV9oBABeZsMBioAn1zq1Z+ynh2obYJ0Y0SUJ
 ovMrytUKp9ERQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97439378001E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 06:43:48 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1] tests/meson.build: Generate test-list for cross build
Date: Thu,  2 May 2024 12:13:09 +0530
Message-Id: <20240502064309.56280-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

test-list.txt and test-list-full.txt are not generated for
cross-builds, and they are required by drm-ci for testing.
Commit 485bcb98 disables generating .testlist files for
cross-builds since the binaries cannot be executed, but
test-list.txt and test-list-full.txt generation shouldn't
require that. So generate them for cross-builds.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 tests/meson.build | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 65b8bf23b..758ae090c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -468,15 +468,11 @@ subdir('vc4')
 subdir('vmwgfx')
 
 gen_testlist = find_program('generate_testlist.sh')
-if not meson.is_cross_build()
-	test_list_target = custom_target('testlist',
-		    output : 'test-list.txt',
-		    command : [ gen_testlist, '@OUTPUT@', test_list ],
-		    install : true,
-		    install_dir : libexecdir)
-else
-	test_list_target = []
-endif
+test_list_target = custom_target('testlist',
+	      output : 'test-list.txt',
+	      command : [ gen_testlist, '@OUTPUT@', test_list ],
+	      install : true,
+	      install_dir : libexecdir)
 
 test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c',
 	   dependencies : test_deps + [ libatomic ],
@@ -485,13 +481,11 @@ test_executables += executable('gem_concurrent_all', 'intel/gem_concurrent_all.c
 	   install : true)
 test_list += 'gem_concurrent_all'
 
-if not meson.is_cross_build()
-	test_list_full_target = custom_target('testlist-full',
-		    output : 'test-list-full.txt',
-		    command : [ gen_testlist, '@OUTPUT@', test_list ],
-		    install : true,
-		    install_dir : libexecdir)
-endif
+test_list_full_target = custom_target('testlist-full',
+	      output : 'test-list-full.txt',
+	      command : [ gen_testlist, '@OUTPUT@', test_list ],
+	      install : true,
+	      install_dir : libexecdir)
 
 test_script = find_program('igt_command_line.sh')
 foreach prog : test_list
-- 
2.40.1

