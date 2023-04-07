Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801E510E0FE
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Apr 2023 21:56:30 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id bg9so163715plb.2
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Apr 2023 14:56:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Apr 2023 14:56:23 -0700
Message-Id: <20230407215625.1551410-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 0/2] gputop memory information
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This applies on top of Tvrtko's series to add a vendor agnostic
gputop[1].  And uses the utilizes the memory related fdinfo props
added by [2].

If anyone has a better idea how to display the memory usage, I'm
all ears.. but the current thing is a tight squeeze to keep the
text columns under half or 80 col.  (It ended up at 41 col.)

[1] https://patchwork.freedesktop.org/series/102175/
[2] https://patchwork.freedesktop.org/series/116217/

Rob Clark (2):
  lib/igt_drm_fdinfo: Parse memory usage
  gputop: Add memory information

 lib/igt_drm_clients.c |  1 +
 lib/igt_drm_clients.h |  3 +++
 lib/igt_drm_fdinfo.c  | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_fdinfo.h  |  9 +++++++++
 tools/gputop.c        | 24 ++++++++++++++++++++++--
 5 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.39.2
