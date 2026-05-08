Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E07BCD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 12:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227610E2FA;
	Fri,  8 May 2026 12:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JOoawdo3";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88C610E30B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WUUXpNcH4APKF3diopt2Q+QwKaA/6O0FmONIU/YB9bE=; b=JOoawdo3f8DfFDqgyF2ywxrAbC
 5+H6dNLXgeL1UaZfC0PH+Ys/p/wQx62q6jeTIyNenoUPq4mspbRrM41wgze3Gw+WLHbWrXqpzA3Zu
 ZcdXFo0lca+LJ2NSfd3hjGxRBl22bPjRYav4NmO6nnatD1pPzhTlNoy4IJ8hIu2Dm6+uc442k6f84
 ykxjT+bkcwiucbT1uTukm9fYITzntqVoyruBH6AqdHdFecya9SkP2D8tm8YpoqJaKtwitpaEhg4by
 TgrUSfCT3jfkSymHaEzO4uN7pE/TlBz9UfClPbVjzSXIIlgAtQHBVAMll5wEoS4gOVwc4cbDN0aD1
 BbOe/5LQ==;
Received: from [189.7.87.137] (helo=prince)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wLKae-007sqk-Dm; Fri, 08 May 2026 14:46:01 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t 3/5] lib/v3d: Allow callers to retrieve perfmon counter
 values
Date: Fri,  8 May 2026 09:42:52 -0300
Message-ID: <20260508124446.1260672-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508124446.1260672-2-mcanal@igalia.com>
References: <20260508124446.1260672-2-mcanal@igalia.com>
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

igt_v3d_perfmon_get_values() previously allocated an internal buffer,
issued the ioctl, and immediately freed the buffer, which made it only
useful for exercising the ioctl path, but not for inspecting the
results.

Add a `values` parameter so callers can supply their own allocated
buffer and read back the counter values. When NULL is passed, the
function allocates and frees a temporary buffer as before, preserving
the existing behavior.

Update all callers in v3d tests to pass NULL, keeping their behavior
unchanged.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c              | 10 ++++++----
 lib/igt_v3d.h              |  2 +-
 tests/v3d/v3d_perfmon.c    |  6 +++---
 tests/v3d/v3d_submit_cl.c  |  4 ++--
 tests/v3d/v3d_submit_csd.c |  4 ++--
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index 90274829b..eb1adaaa4 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -163,17 +163,19 @@ uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters)
 	return create.id;
 }
 
-void igt_v3d_perfmon_get_values(int fd, uint32_t id)
+void igt_v3d_perfmon_get_values(int fd, uint32_t id, uint64_t *values)
 {
-	uint64_t *values = calloc(DRM_V3D_MAX_PERF_COUNTERS, sizeof(*values));
+	uint64_t *allocated_values = values ?:
+				     calloc(DRM_V3D_MAX_PERF_COUNTERS, sizeof(*allocated_values));
 	struct drm_v3d_perfmon_get_values get = {
 		.id = id,
-		.values_ptr = to_user_pointer(values)
+		.values_ptr = to_user_pointer(allocated_values),
 	};
 
 	do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get);
 
-	free(values);
+	if (!values)
+		free(allocated_values);
 }
 
 void igt_v3d_perfmon_destroy(int fd, uint32_t id)
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 3e08b1aa3..70dd6f011 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -79,7 +79,7 @@ void igt_v3d_bo_mmap(int fd, struct v3d_bo *bo);
 void igt_v3d_wait_bo(int fd, struct v3d_bo *bo, uint64_t timeout_ns);
 
 uint32_t igt_v3d_perfmon_create(int fd, uint32_t ncounters, uint8_t *counters);
-void igt_v3d_perfmon_get_values(int fd, uint32_t id);
+void igt_v3d_perfmon_get_values(int fd, uint32_t id, uint64_t *values);
 void igt_v3d_perfmon_destroy(int fd, uint32_t id);
 
 void igt_v3d_set_multisync(struct drm_v3d_multi_sync *ms, enum v3d_queue wait_stage);
diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index 5045e8c81..f6f2a2774 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -75,7 +75,7 @@ int igt_main()
 		igt_v3d_perfmon_destroy(fd, id1);
 
 		/* Make sure that the second perfmon it is still acessible */
-		igt_v3d_perfmon_get_values(fd, id2);
+		igt_v3d_perfmon_get_values(fd, id2, NULL);
 
 		igt_v3d_perfmon_destroy(fd, id2);
 	}
@@ -120,7 +120,7 @@ int igt_main()
 				       V3D_PERFCNT_CLE_ACTIVE };
 		uint32_t id = igt_v3d_perfmon_create(fd, 3, counters);
 
-		igt_v3d_perfmon_get_values(fd, id);
+		igt_v3d_perfmon_get_values(fd, id, NULL);
 		igt_v3d_perfmon_destroy(fd, id);
 	}
 
@@ -143,7 +143,7 @@ int igt_main()
 			.id = id,
 		};
 
-		igt_v3d_perfmon_get_values(fd, id);
+		igt_v3d_perfmon_get_values(fd, id, NULL);
 
 		igt_v3d_perfmon_destroy(fd, id);
 
diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
index 570838e23..319fd7593 100644
--- a/tests/v3d/v3d_submit_cl.c
+++ b/tests/v3d/v3d_submit_cl.c
@@ -367,11 +367,11 @@ int igt_main()
 		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
 		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
 					INT64_MAX, 0, NULL));
-		igt_v3d_perfmon_get_values(fd, job->submit->perfmon_id);
+		igt_v3d_perfmon_get_values(fd, job->submit->perfmon_id, NULL);
 
 		igt_v3d_free_cl_job(fd, job);
 
-		igt_v3d_perfmon_get_values(fd, id);
+		igt_v3d_perfmon_get_values(fd, id, NULL);
 		igt_v3d_perfmon_destroy(fd, id);
 	}
 
diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
index e7841f7c8..35da19350 100644
--- a/tests/v3d/v3d_submit_csd.c
+++ b/tests/v3d/v3d_submit_csd.c
@@ -351,11 +351,11 @@ int igt_main()
 		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit);
 		igt_assert(syncobj_wait(fd, &job->submit->out_sync, 1,
 					INT64_MAX, 0, NULL));
-		igt_v3d_perfmon_get_values(fd, job->submit->perfmon_id);
+		igt_v3d_perfmon_get_values(fd, job->submit->perfmon_id, NULL);
 
 		igt_v3d_free_csd_job(fd, job);
 
-		igt_v3d_perfmon_get_values(fd, id);
+		igt_v3d_perfmon_get_values(fd, id, NULL);
 		igt_v3d_perfmon_destroy(fd, id);
 	}
 
-- 
2.54.0

