Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B85CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 13:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D40E10E0BD;
	Fri, 19 Jun 2026 13:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="R+LNAEHQ";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE36D10E084
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 13:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781877282; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DJbR82DmZGVm6mzF+WmT2ob81lgFo4grYj8BM0itCpFItldeb7NH2SMZngDnHFd/AMN58v0lzYqNdKhISJQ69Ixn8UBHBwEpJ/9KTFDWHpPkL9lbBRQUJC+MUIGOsbV2IG4jP83ZLTRfwCl+T+rOnUFB9zwHYk4YVetAKNwDofg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781877282;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KaQwa6mZE3mx2bt3kAO49DSNJl1f2U/AIBX7+XfDZzc=; 
 b=DPNzMmQXoauVJ2UCeliayLuWdTR/XR/5WP2pEeCdMbFBDCYJ/vkagDIbGNTFDuPEEO0sJRXL1QVz03ffTQcQtTsyLSisgwJ3lkmLFQsNiVRulK0h66RJKpE7Dwz8E/HkaAccG4usLYP1CNxVTt5PiET5GLF3j4nYaljqcUzWUis=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781877282; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=KaQwa6mZE3mx2bt3kAO49DSNJl1f2U/AIBX7+XfDZzc=;
 b=R+LNAEHQlzdMiH1py45lDrCawfhfkCD+58+/uTcAHlzzltjwkevZCjv+VJ1aTxzh
 2Az4pOF6asw+u+x1MQhXIKA8Rg7TrZcjj1EgpnxZ4vbB8Gs920SwA56n+0srZNg/2D5
 LLM8tdTRZoDAr94arRoAEypwtF883EtmedoXbAto=
Received: by mx.zohomail.com with SMTPS id 1781877281836103.52297521285834;
 Fri, 19 Jun 2026 06:54:41 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 19 Jun 2026 14:54:29 +0100
Subject: [PATCH v3 2/3] panthor: Add IGT library helper for Panthor sparse
 mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260619-panthor-sparse-mappings-v3-2-cb6c230b6bc0@collabora.com>
References: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
In-Reply-To: <20260619-panthor-sparse-mappings-v3-0-cb6c230b6bc0@collabora.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=nobHNxpnmv50W7bmmTGCpPS/T2/A/YnVxwZhrZiQj3s=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqNUoaUfTrrvnKnAZF1x1ZpUweSh9b24HQO1sbG
 asYX7yntiyJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajVKGgAKCRAOJn5M7lND
 PQVfC/0ZlxNPQ8CCYUiTEpg9y/5U+LJByNnLpQFHIi8dh0jMD/stoVf1G+lmcFDXOZ3twWF2EVz
 t1sxVgX6Jpy+GHlMmD/wKX04uPROVm+8H3xmG2QBWZtae4aZ15c8Jwm/AaRZEtNbjg9b6pk2nsW
 cvTXZNfzAblEroY002gAMPlkUWhSLLJKhsdgcCscuEQhNRb0lo/9kTgTT9aBkXnVOQlbPWL8ywK
 Q+qziSgcUr8bGEwFKlsT5Js1BAg8UCUm/q+5NE2OAJz5Stgr5B0lHV/61Yf8440iJ0wGKqF2EqB
 2qmV/LRWYFqipCnwvMQrkS1jcQW0Y29qdeDVV+ySSXIGuEq/DdxsNDbzZGahdEwbc9p9QEWN8OX
 i62uF0sdXfor47cRsMdkrACvmjh2a/iA0kQigJGdv86fza0QDIFFV+r+Uv7sn2XIRuQgTqDjR5g
 UFPrF/eLIR90Odx2QWxYYFqWkBRraLVMyXLsPt16rHHMLzSR9mJ3Ntp4k1BdbSQXZ9XQg=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D
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

Because Panthor sparse VM_BIND's require a specific set of flags, and also
no BO handle shall be specified for them, this helper will help to reduce
some noise in future sparse binding tests.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_panthor.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index be8490840f3a..04f6ff5005e9 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -44,6 +44,16 @@ static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handl
 	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
 }
 
+static inline void igt_panthor_vm_bind_sparse(int fd, uint32_t vm_id,
+					      uint64_t va, uint64_t size, int err)
+{
+	uint32_t flags = DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+			 DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE |
+			 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
+
+	igt_panthor_vm_bind_offset(fd, vm_id, 0, va, size, 0, flags, err);
+}
+
 enum cs_opcode {
 	CS_OPCODE_NOP = 0,
 	CS_OPCODE_MOVE48 = 1,

-- 
2.54.0

