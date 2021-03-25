Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3676EDF5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 19:11:19 +0000 (UTC)
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Thu, 25 Mar 2021 21:10:57 +0200
Message-Id: <20210325191057.55288-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] README: Spell "privileged" correctly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index f33e9455..6d9e40f3 100644
--- a/README.md
+++ b/README.md
@@ -110,7 +110,7 @@ podman/docker to to run it on your system.
 
 Oneliner to get you started with the latest master:
 
-    # podman run --rm --priviledged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
+    # podman run --rm --privileged registry.freedesktop.org/drm/igt-gpu-tools/igt:master
 
 
 Other Things
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
