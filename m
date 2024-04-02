Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34E4CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3510EB8D;
	Tue,  2 Apr 2024 22:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NXKkQhgo";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3260010F334
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712096919;
 bh=TNTml3ZXn8pXSY8VgOo8xHjh/3/01GOQvDdT9crvWTU=;
 h=From:To:Cc:Subject:Date:From;
 b=NXKkQhgobrJri+tt3JtNZI+pHaqY5Jo3pN7nSjIp/3QDZTlXjluprasM+f0lqbPQs
 zE/iof5wl84upXxP64gK0b8obwUP8Xokn3+SyrQWVb7xUh2I/Vt/oL4Lyabab02KUK
 Ye+tYS/FSGuGr/cj1b27+OFWN3lp684ESUNeha5mr14bFQZsZQ7yFmsFHjwWvJhkyx
 3L8oScUZ5KiwKscwNss7YJbtblHxQJhbOSrXaWz4yip+B9FmqKw9N0EPMiNOgr7gYL
 jybghSRKbFdwlHC2WanQh6atsv2ijPFMpXGWhanlkhBEYYmFzgAYrzvHJukvl5AMH2
 ijkmVtY/dxBKw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CED5D3780626;
 Tue,  2 Apr 2024 22:28:38 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tursulin@ursulin.net, daniel@ffwll.ch, boris.brezillon@collabora.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 0/2] Add gputop support for sysfs profiling knob
Date: Tue,  2 Apr 2024 23:27:43 +0100
Message-ID: <20240402222813.277470-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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

Some GPUs like Panfrost need a sysfs file to be toggled before the HW can
initiate the job accounting necessary to feed fdinfo with engine and
cycle data. This sysfs knob has to be disabled when the profiler is
done, to save power.

Changelog:

v2:
        - Added header file guards around igt_profiling.h
        - Modified licensing information to comply with SPDX format
        - Sorted included header files in alphabetic order
        - Added volatile qualifier to gputop stop variable

Adrián Larumbe (2):
  lib: Add DRM driver sysfs profiling knob toggling functions
  tools/gputop: toggle sysfs profiling knob if available for device

 lib/igt_device_scan.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  7 +++++++
 lib/igt_profiling.c   | 28 +++++++++++++++++++++++++++
 lib/igt_profiling.h   | 17 ++++++++++++++++
 lib/meson.build       |  1 +
 tools/gputop.c        | 30 ++++++++++++++++++++++++++++-
 tools/meson.build     |  2 +-
 7 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 lib/igt_profiling.c
 create mode 100644 lib/igt_profiling.h

-- 
2.44.0

