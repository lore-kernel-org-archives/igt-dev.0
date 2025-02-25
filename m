Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F24C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 12:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2EA10E667;
	Tue, 25 Feb 2025 12:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TXotBNvW";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4B010E667
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZhzNyByixPuOGYNFUqGJJ7JZ0n0jYpThBK/XyEcsPg=; b=TXotBNvWr6+vzi8muYB6qvCfnO
 2sXoCN2OzTnt4wYozurEBtpVCU7aCCqNdd6stk2zBDsx6GMP/CPrpS4orm7Xcq7zv1Ei0HFpoxWcP
 Yu/7YfXWnlOulDMuAUQR5xBFD39szKKV2pet6hq+yK7wrzSnH/DlGYtm8dE41svhSA2jAeTXL95zf
 JhQEpdEUdhYl+fnmQFbjIUJhUh9OLP5O4sivwh09RVoSxajo9koVfquGrwzxuZPXhNWgR+ZNoTSlv
 +Ll2sNxPJsZB20DB6xGkV47cihJFjlzwRLHOjHZhMxdF7/uisJE7eWsX+Mjsh5aekeeIYM5KrWhse
 fff1g7dQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tmuIz-000O2j-13; Tue, 25 Feb 2025 13:45:02 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/syncobj: Make running under Valgrind quiet
Date: Tue, 25 Feb 2025 12:44:53 +0000
Message-ID: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

Explicitly initialise ioctl arguments so Valgrind can know we are not
passing in uninitialised memory to the kernel.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_syncobj.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
index a53393bd7245..5a1226b6e19d 100644
--- a/lib/igt_syncobj.c
+++ b/lib/igt_syncobj.c
@@ -197,14 +197,12 @@ int
 syncobj_wait_err(int fd, uint32_t *handles, uint32_t count,
 		 uint64_t abs_timeout_nsec, uint32_t flags)
 {
-	struct drm_syncobj_wait wait;
+	struct drm_syncobj_wait wait = { };
 
 	wait.handles = to_user_pointer(handles);
 	wait.timeout_nsec = abs_timeout_nsec;
 	wait.count_handles = count;
 	wait.flags = flags;
-	wait.first_signaled = 0;
-	wait.pad = 0;
 
 	return __syncobj_wait(fd, &wait);
 }
@@ -227,15 +225,13 @@ syncobj_wait(int fd, uint32_t *handles, uint32_t count,
 	     uint64_t abs_timeout_nsec, uint32_t flags,
 	     uint32_t *first_signaled)
 {
-	struct drm_syncobj_wait wait;
+	struct drm_syncobj_wait wait = { };
 	int ret;
 
 	wait.handles = to_user_pointer(handles);
 	wait.timeout_nsec = abs_timeout_nsec;
 	wait.count_handles = count;
 	wait.flags = flags;
-	wait.first_signaled = 0;
-	wait.pad = 0;
 
 	ret = __syncobj_wait(fd, &wait);
 	if (ret == -ETIME)
@@ -356,7 +352,7 @@ __syncobj_timeline_wait(int fd, uint32_t *handles, uint64_t *points,
 			int64_t timeout_nsec, unsigned flags,
 			uint32_t *first_signaled)
 {
-	struct drm_syncobj_timeline_wait args;
+	struct drm_syncobj_timeline_wait args = { };
 	int ret;
 
 	args.handles = to_user_pointer(handles);
@@ -364,8 +360,6 @@ __syncobj_timeline_wait(int fd, uint32_t *handles, uint64_t *points,
 	args.timeout_nsec = timeout_nsec;
 	args.count_handles = num_handles;
 	args.flags = flags;
-	args.first_signaled = 0;
-	args.pad = 0;
 
 	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, &args);
 	if (ret < 0) {
@@ -424,13 +418,12 @@ static int
 __syncobj_timeline_query(int fd, uint32_t *handles, uint64_t *points,
 			 uint32_t handle_count)
 {
-	struct drm_syncobj_timeline_array args;
+	struct drm_syncobj_timeline_array args = { };
 	int ret;
 
 	args.handles = to_user_pointer(handles);
 	args.points = to_user_pointer(points);
 	args.count_handles = handle_count;
-	args.flags = 0;
 
 	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_QUERY, &args);
 	if (ret) {
@@ -464,7 +457,7 @@ __syncobj_transfer(int fd,
 		   uint32_t handle_src, uint64_t point_src,
 		   uint32_t flags)
 {
-	struct drm_syncobj_transfer args;
+	struct drm_syncobj_transfer args = { };
 	int ret;
 
 	args.src_handle = handle_src;
@@ -472,7 +465,6 @@ __syncobj_transfer(int fd,
 	args.src_point = point_src;
 	args.dst_point = point_dst;
 	args.flags = flags;
-	args.pad = 0;
 	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_TRANSFER, &args);
 	if (ret) {
 		ret = -errno;
@@ -548,14 +540,13 @@ int
 __syncobj_eventfd(int fd, uint32_t handle, uint64_t point, uint32_t flags,
 		  int ev_fd)
 {
-	struct drm_syncobj_eventfd args;
+	struct drm_syncobj_eventfd args = { };
 	int ret;
 
 	args.handle = handle;
 	args.flags = flags;
 	args.point = point;
 	args.fd = ev_fd;
-	args.pad = 0;
 
 	ret = igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_EVENTFD, &args);
 	if (ret) {
-- 
2.48.0

