Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAEDCD342F
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 17:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C574D10F57A;
	Fri,  8 May 2026 17:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kwQHqM7d";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D250810F569
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 17:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1778261154; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jn2/tRA5IQW7JC4gyB/Wi52fw5lGLHBc4G4AMrSCDgN2+RaqJduaZvHERikHfAIUCsR7iRO7mGNne+m9AHLqGatKSp8sfhfArAxcmX0IfjkJBPfwdvCqmVgCfRnlnY2wtL1GJ4UTEspIvQUqPPkhOd5XWcPnW+oX+LR6nGPkoNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1778261154;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PtRpYpb6Kf6qMgkv8FQxZC8rtuCtsdBvx9ItuKgaRLc=; 
 b=agrX9HDroDdBJASCnfY/bDOo1GEejtgpiNEGTMt4++ShfAq2MrlhsDn3M3MzXkkKHpux29bxUCfwzC3SoXAqXDENXIP61oZBAQ5MC6wePpU7T9xUSIIknXk+V8eXmA5gQt3cLdQOC7DAbv2HYT/LajQNPGTDk3QYqOez/KgUKKE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778261154; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PtRpYpb6Kf6qMgkv8FQxZC8rtuCtsdBvx9ItuKgaRLc=;
 b=kwQHqM7dmJAuT95/s8G5CGjZZhdZwCacblQuD3aaB/ks8/bwtEQgi5/qP5DTWZdA
 cnL/Xc/MU4VHUDOxUfdDhrVBbUXjF5dh0LUPfopbm6IfKs7E+qssRclVY5ZpmL9UuvS
 GUlJLvbWMP2Ws0AJpiD3v2PQo59wBjhRh6VuUhhs=
Received: by mx.zohomail.com with SMTPS id 1778261151878899.8295335630456;
 Fri, 8 May 2026 10:25:51 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 2/3] panthor: Add IGT library helper for Panthor sparse
 mappings
Date: Fri,  8 May 2026 18:25:34 +0100
Message-ID: <20260508172537.3456595-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
References: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Because Panthor sparse VM_BIND's require a specific set of flags, and also
no BO handle shall be specified for them, this helper will help to reduce
some noise in future sparse binding tests.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_panthor.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index be8490840f3a..b9edbd320329 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -44,6 +44,15 @@ static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handl
 	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
 }
 
+static inline void igt_panthor_vm_bind_sparse(int fd, uint32_t vm_id,
+					      uint64_t va, uint64_t size, int err)
+{
+	uint32_t flags = DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
+		DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE | DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
+
+	igt_panthor_vm_bind_offset(fd, vm_id, 0, va, size, 0, flags, err);
+}
+
 enum cs_opcode {
 	CS_OPCODE_NOP = 0,
 	CS_OPCODE_MOVE48 = 1,
-- 
2.53.0

