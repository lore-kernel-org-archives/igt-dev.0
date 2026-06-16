Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65840CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 15:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1726110E7C3;
	Tue, 16 Jun 2026 15:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="CCWtHLTO";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9139410EC23
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 15:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781624614; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=P3f1dyHuhxtXIghp7g0dUs5+yBYEBhIDVS/uYziDlesJ0GTvigDD7WcxNLtXG9b5VR8yTRb62XJ4Vfvbrqza1Y+k7kX4KZNvOfsCzI4P2gCDXnoX1ObHo2inD9gTbtOq+Pyw3O+WlmAyKPzY7hgSen3WBWw1wka4ByM02xm/e+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781624614;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hXwtkbm8RIG7CRnhStkZ8NjGVrMfrWjSDLp0tu5TEK0=; 
 b=byskb6HsV8XK9Lueobh05u6Dm+jkpuyRUmOkVlX9bgqv5Zc4DcbcdMxF1Hr6JvXxWu14rNKusQ2JxF4a4wDgCg77AmoLn5RGwvIuXKSxjjUJ09KBojUx6In1VZ0FDyL4u8niFfUb55HzgqKGf1LDz+eY0527jlrikuWDIEkDrcw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781624614; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=hXwtkbm8RIG7CRnhStkZ8NjGVrMfrWjSDLp0tu5TEK0=;
 b=CCWtHLTOzqr1lLYZLW1mc5Kfvy0xhPokLChftKLfQGcljoLqMWqQb/jpCbTX4IaC
 wcmI2Fo5O6sttiE/avFc+IGPWJFM5bDbWnVknPT4DS9Q7/MkZ/Vdpwf5uyY8w1bvMq9
 8zcxgWfrlwes5pSIdzUUQMXP7P384kVRkvadzafw=
Received: by mx.zohomail.com with SMTPS id 1781624613485474.98531880301516;
 Tue, 16 Jun 2026 08:43:33 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 16 Jun 2026 16:43:22 +0100
Subject: [PATCH 1/2] panthor: Provide a way to access user VA range when
 creating a VM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-panthor-vmbind-checkaddr-v1-1-f35b1b067f7c@collabora.com>
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
In-Reply-To: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: igt-dev@lists.freedesktop.org, kernel@collabora.com, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=8UWK16ZLupt1eGznrpY7zGH4Z0UT/H2cfuPkTiTwa1I=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqMW8eNv3E6zSA0A/+uZ4BXoWVjqpcIta1raP8Z
 PLFxyYU8oiJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajFvHgAKCRAOJn5M7lND
 PVqmDACvNH+SaamGKCkWuP/yh5IKR3npEjMXso4nxzf83YUunTJCzJzxEtH9XLUvsmuiU7WWFnK
 rhmIlb8u6403gfYThcoXBh22vxe0gzqyJOAWcOgUFL0I+tmz5fCr+FKpjGsCNiAVeorMuBLqmly
 SXAudopY1yI3A2AXfRpjNEawyMCq5ozpxMKpRYVQzd3aP0BCJkLAiwvm2QPw6iWczwD1+z64s++
 +7eL9nISPkZYmSbYfOFD9EjE93EI5GTQ7DMGPtwtsmNux5eG1H17l54d0BGpb4gDH+KoLloGMji
 8kE4EyVESTlImWsHDkQfR7NGrcsunvd5tvLTinF8kfAGNENP0Lhb7Qn4tz1E6/60YIPp2brVzc5
 0CfMDGFW247Ow4n4rWl4XW7lehYb3M6D/Eg9LPgRiDzuXrTnuaKR4yzpoEcVuYgctGp2qUWNXfM
 rHRpk9xVf6nOg1+qIGk0rcrc/O1HsXKbaQ+hg0YykKLRJOu8DxbFXLIlZHR2HL4LHudoc=
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

This will be used in a future test that will check VM_BIND map range
does not intersect with the range reserved for internal BO's.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_panthor.c | 5 ++++-
 lib/igt_panthor.h | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
index 7ffb61eb38e9..11d8ec342f0b 100644
--- a/lib/igt_panthor.c
+++ b/lib/igt_panthor.c
@@ -201,7 +201,7 @@ void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
  *
  * Creates a VM.
  */
-void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
+void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err, uint64_t *uva_range)
 {
 	struct drm_panthor_vm_create vm_create = {};
 
@@ -210,6 +210,9 @@ void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
 	} else {
 		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
 		*vm_id = vm_create.id;
+
+		if (uva_range)
+			*uva_range = vm_create.user_va_range;
 	}
 }
 
diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
index be8490840f3a..64b0e687eef1 100644
--- a/lib/igt_panthor.h
+++ b/lib/igt_panthor.h
@@ -17,7 +17,7 @@ struct panthor_bo {
 };
 
 void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
-void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
+void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err, uint64_t *uva_range);
 void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
 void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
 				uint64_t size, uint64_t ofsfet, uint32_t flags, int err);
@@ -44,6 +44,11 @@ static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handl
 	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
 }
 
+static inline void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
+{
+	igt_panthor_vm_create_userva_range(fd, vm_id, err, 0);
+}
+
 enum cs_opcode {
 	CS_OPCODE_NOP = 0,
 	CS_OPCODE_MOVE48 = 1,

-- 
2.54.0

