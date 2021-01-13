Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32C89994
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jan 2021 06:58:28 +0000 (UTC)
Date: Wed, 13 Jan 2021 12:30:10 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20210113070010.GA397542@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [i-g-t] tests/kms_plane_cursor:added subtest description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: 20210102221236.3391596-1-arundhati.hagaragi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: 20210102221236.3391596-1-arundhati.hagaragi@intel.com, patchwork@emeril.freedesktop.org, arundhati.hagaragi@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

>diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
>index f6766d36..bc9d4294 100644
>--- a/tests/kms_plane_cursor.c
>+++ b/tests/kms_plane_cursor.c
>@@ -320,14 +320,18 @@  igt_main
> 		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
> 			int size = cursor_sizes[i];
> 
>+			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane");
> 			igt_subtest_f("pipe-%s-overlay-size-%d",
> 				      kmstest_pipe_name(pipe), size)
> 				test_cursor_overlay(&data, size, pipe);
> 
>+			igt_describe("Tests atomic cursor positioning on primary plane");
> 			igt_subtest_f("pipe-%s-primary-size-%d",
> 				      kmstest_pipe_name(pipe), size)
> 				test_cursor_primary(&data, size, pipe);
> 
>+			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane"
>+				"with buffer larger than viewport used for display");
> 			igt_subtest_f("pipe-%s-viewport-size-%d",
> 				      kmstest_pipe_name(pipe), size)
> 				test_cursor_viewport(&data, size, pipe);

LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
