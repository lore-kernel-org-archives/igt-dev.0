Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC43C43602
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 21:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BC010EF00;
	Tue,  7 Jul 2026 21:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="bPyWXE1o";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D7E10E30F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 21:38:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783460281; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R9HG4lPlnCW25qubSsuHQBpFytCCWlwwRvpRUMlRVtXrcejOQP1PRERWeC/8vTgw7iTlW9D25XfReXGuar/t/tvvExEcJHmIgPOwCaEat0X2AfCOAYLO5siOkqglRmeGUe28bBElNyCNWQmjt3v6dEJG39Eyyg9Vr4j2XKSrEWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783460281;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ErpOk+J7tXCGcEe0bs9PSSgEoYa3/QR8at8cVK5kBP8=; 
 b=lWLLmgcPPhBN6bKV2aBVIY7bOrt/94nG3dbRku9ptdk5BxIaUlbqEe4h/xgr6ZrG7jRhTHQ37mSfnHJjvk1J8iJKr+GuNQ9VC51h+pSmWi8/dMyjOyS0IfqWhfpxXt1SltA/0vyzaJE0/OEgig0p0fuJnYB4GPbqsQ0/clRQnKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783460281; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ErpOk+J7tXCGcEe0bs9PSSgEoYa3/QR8at8cVK5kBP8=;
 b=bPyWXE1oDLJs1a7lAKdjbzqnwU2/SHkKZSeOghi2NaVzNqgCW6nkuvwJDr9mOrAn
 w3CRs9b1OBPLMvVIes43ndnB44LRKp4KkjsdcgC9nW9T1OdhYAkjchXDXANkmIvPfZJ
 S7t64evJZeg1wUuCeBKgrMgNMsqJIUWl1sRbScSg=
Received: by mx.zohomail.com with SMTPS id 1783460279799355.0593721980098;
 Tue, 7 Jul 2026 14:37:59 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 07 Jul 2026 22:36:27 +0100
Subject: [PATCH v4 2/3] panthor: Add IGT library helper for Panthor sparse
 mappings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-panthor-sparse-mappings-v4-2-fac6061f5adf@collabora.com>
References: <20260707-panthor-sparse-mappings-v4-0-fac6061f5adf@collabora.com>
In-Reply-To: <20260707-panthor-sparse-mappings-v4-0-fac6061f5adf@collabora.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Steven Price <steven.price@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=lJSEAN//2CTo9mKETELMtyAfxEyx5+UNXgT/qn8fTWo=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqTXGvk0noDZCj955f79lmNWbdULR+0VMNB1nMB
 +sqeDTmoIiJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCak1xrwAKCRAOJn5M7lND
 PV9GDACbWiBdvGyoiWfIKW/nHElDURQGGrz+R1L6Zax9wjQ95m0UuFo/NAP8p9uUkU7gPm6fzhz
 0XBwWrFEUs0kuxL8JWfUldA7khpZR5UDy4iToOd75/x7+2TJ6EQKqLWel9TWSlv1eYj5VyhYung
 zzguU8Vdm7y3vMtkr/l1qh0CNk8G3AphSi8sXfQXmvV24Y4vEW1swRDAU8cTTrbZ9eg2x9RCqGn
 rRT1OpNHzp6cbGzg2VdxbAKRG8fQudaHf9eR5o+z+oSeot1VTh28ESbd1ATn+AXvwl5/yBbYYz9
 dAjoDsr9Ahi32xEe/Esy4C3UnUfZxS+yLLagQOeLS1H6Yg9pLsFS2LR3eJrfFanFNI86l6PCf10
 MDIvuUVQLZsjS0UkpJsPkkdgYEEFlCvXmN5jIj7evoH7F31E8lhjzBAFqBnuG+1AbRwQkbgNeB+
 oPqkbhZo9DVFTAXpCNw4sZNeAfWl+zAnBPcpAmZNprkXkqH7tQviQWfS68/bIK6vNVzdo=
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
index 64b0e687eef1..ba4a9bf1e2b8 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -49,6 +49,16 @@ static inline void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
 	igt_panthor_vm_create_userva_range(fd, vm_id, err, 0);
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
2.55.0

