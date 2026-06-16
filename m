Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B59CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 15:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1A10E7C3;
	Tue, 16 Jun 2026 15:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NMkq4ZII";
	dkim-atps=neutral
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com
 [136.143.188.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342D110EC23
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 15:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1781624618; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y/vaXv3L/kUM6JLVjCwnC8dr3auTj0Gj694o6z6740l1IOE2RrKGD1OU8zxXnNh0qEgwOYjo7AN5ONlR8obtlbKenNInws/nqbo9CAN5XkUtr3W4URu7WOxt4PAvqlHVF8AaVWVfDk312wDBuYZVVf9WGuHBgXZuMcMEYbX0Fpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1781624618;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Cd4FJjwd0I9k88lj65YR+wgEfL15faKAg/uoF+bs+/0=; 
 b=MUFKnxBBsYodyZSyZzTy5ywNcWV8VsnmMAJwRqCFS7zdOWClFnZZuartfYhJGA5dXsnIWWyooEkoBE70QA6W6BrlH2H4EmYA5EtoT1v7gU1uAmBXo7wF9wSpj1pzETS73qVAAi2uUzZ7kHUJM2o9GuHF0RrT+ICXFy6/EMXArmo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781624618; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Cd4FJjwd0I9k88lj65YR+wgEfL15faKAg/uoF+bs+/0=;
 b=NMkq4ZIIOnMURwJcY1Qk+5m/vRMdVXqkUMPjzC7NDsSi21ryZhEu7ckNMXFFvOC7
 pmsDBax6WtFNOOjSqPD7dAYUS2BBpOiB+TaJSZ8lvf+bBMW1XWCfFOsY64UPllK077H
 jP94WenfM0xf42P8dxkgiX3DE2Qm2HoRULeGpLa0=
Received: by mx.zohomail.com with SMTPS id 1781624616544594.0131679849018;
 Tue, 16 Jun 2026 08:43:36 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 16 Jun 2026 16:43:23 +0100
Subject: [PATCH 2/2] tests/panthor/panthor_vm: Add vm_bind
 intersect-with-kbo-range test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=t5QX+M4qvTqfHMgEGE4RA0ZuuCY0O6qSBeB+isxfjx0=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqMW8fb3zcbWq/MJnOX5gps5MxrAmNVBpOW1vQp
 vwGsK5T5oKJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajFvHwAKCRAOJn5M7lND
 PU5dDACOjFm0+2Wn68tcZ2iKH71tnNCFuq5tNeHui7iAGIaRbcJSLhrRT9H4vJ3W4jH30PrrbCu
 VR50xkX03KE4cgMcdZwCWgzMszh0fmrToeKjtFyM/bJvGWOb543LdHRQjZGSsqbBA1A1ruTj0zB
 5272whafJHDWRW+ELix7N/uSHob+mlAN24cUKRcLwPf3xfgkUx7a+7P3917x44uq8p7WelZj9pk
 9uBEP8z3wRWnpkSxJPAoAq5ChYbejY0q3JAfEvjR3b+6+sWZR6CweAa12e3KhkWFRpBzq2gSH7i
 Xhyxc7ze6xGlIYlPejFVT4bRPsXO+BFPvOE7pRyaqY6A6Fk4/nWRwFK1kgZ5WbPhXohRyuoYULW
 zcSWf9ulJ4JZyI10+3i4rDZuTVc+6OG3LthvxvJg2IT1lmX9tQqDYeUjTatOqIvQBpvwITMUozO
 DUJACHCM14Thq6GME3jfFmXwd7QxijzQhKZ7fPOknhyGnbAKd9/boosUsHNpL5Rb8zs3o=
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

Users of vm_bind ioctl() should never specify a VA region that intersects
with that reserved for internal kernel BOs.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 tests/panthor/panthor_vm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
index 92b105b9e83a..9548dbcbaa45 100644
--- a/tests/panthor/panthor_vm.c
+++ b/tests/panthor/panthor_vm.c
@@ -270,6 +270,23 @@ int igt_main() {
 		igt_panthor_vm_destroy(fd, vm_id, 0);
 	}
 
+	igt_describe("Perform a vm_bind in the VM's kernel BOs reserved range");
+	igt_subtest("vm_bind_intersect_kbo_range") {
+		uint32_t vm_id;
+		struct panthor_bo bo;
+		uint64_t bo_size = SZ_2M;
+		uint64_t uva_range;
+
+		igt_panthor_vm_create_userva_range(fd, &vm_id, 0, &uva_range);
+		igt_assert(vm_id != 0);
+
+		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
+		igt_panthor_vm_bind(fd, vm_id, bo.handle, ALIGN(uva_range, bo_size),
+				    bo_size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
+
+		igt_panthor_vm_destroy(fd, vm_id, 0);
+	}
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}

-- 
2.54.0

