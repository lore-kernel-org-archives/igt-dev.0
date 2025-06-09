Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92361C61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 07:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D70410E247;
	Mon,  9 Jun 2025 07:33:16 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C209710E247
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 07:33:14 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id 77EDF36A0041; Mon,  9 Jun 2025 13:03:12 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] lib/meson: Enable userqueues based on libdrm version
Date: Mon,  9 Jun 2025 13:03:11 +0530
Message-ID: <20250609073311.715013-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
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

Enable amdgpu userqueues support and test support if
libdrm version is >= 2.4.125.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 04a568cf1..dda30e4bd 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -179,10 +179,12 @@ if libdrm_amdgpu.found()
 		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
 	endif
 
-	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
-		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
-		#conf.set('AMDGPU_USERQ_ENABLED', 1)
-	endif	
+	if libdrm_amdgpu.version().version_compare('>= 2.4.125')
+		add_project_arguments('-DAMDGPU_USERQ_ENABLED', language: 'c')
+	else
+		warning('libdrm < 2.4.125 found, amdgpu user queue support is not enabled')
+	endif
+
 endif
 
 if libunwind.found()
-- 
2.43.0

