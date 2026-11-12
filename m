Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815B606A321
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 03:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E470410E2C8;
	Thu, 12 Nov 2026 03:49:45 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.217.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D385910E2C8
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 03:45:54 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (localhost [127.0.0.1])
 by amd-X570-AORUS-ELITE.amd.com (8.18.1/8.18.1/Debian-2) with ESMTP id
 6AC3a1Y8701742; Thu, 12 Nov 2026 09:06:01 +0530
Received: (from amd@localhost)
 by amd-X570-AORUS-ELITE.amd.com (8.18.1/8.18.1/Submit) id 6AC3a13x701741;
 Thu, 12 Nov 2026 09:06:01 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 5/5] lib/amdgpu: add support of sdmav8 new pkt requirement
Date: Thu, 12 Nov 2026 09:06:00 +0530
Message-ID: <20261112033600.701688-5-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112033600.701688-1-sunil.khatri@amd.com>
References: <20261112033600.701688-1-sunil.khatri@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add SDMAv8 support for the function sdma_ring_copy_linear.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index cf9657d60..9bed04f12 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -329,6 +329,10 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		} else {
 			context->pm4[i++] = context->write_length;
 		}
+
+		if (context->hw_ip_info.hw_ip_version_major >= 8)
+			context->pm4[i++] = 0;
+
 		context->pm4[i++] = 0;
 		context->pm4[i++] = lower_32_bits(context->bo_mc);
 		context->pm4[i++] = upper_32_bits(context->bo_mc);
-- 
2.43.0

