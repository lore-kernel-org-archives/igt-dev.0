Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Thu, 25 Mar 2021 20:59:13 +0200
Message-Id: <20210325185915.51590-3-arek@hiler.eu>
In-Reply-To: <20210325185915.51590-1-arek@hiler.eu>
References: <20210325185915.51590-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/5] tests: Remove ddx_intel_after_fbdev
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
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

It's not a even a proper test.

Suggested-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 tests/Makefile.sources      |  4 --
 tests/ddx_intel_after_fbdev | 73 -------------------------------------
 2 files changed, 77 deletions(-)
 delete mode 100755 tests/ddx_intel_after_fbdev

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index 4f24fb3a..ffc7878a 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -550,10 +550,6 @@ kernel_tests_full = \
 	$(extra_kernel_tests) \
 	$(NULL)
 
-scripts = \
-	ddx_intel_after_fbdev \
-	$(NULL)
-
 IMAGES = pass.png 1080p-left.png 1080p-right.png
 
 testdisplay_SOURCES = \
diff --git a/tests/ddx_intel_after_fbdev b/tests/ddx_intel_after_fbdev
deleted file mode 100755
index f068209d..00000000
--- a/tests/ddx_intel_after_fbdev
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/bash
-#
-# Testcase: Load Intel DDX after fbdev was loaded
-#
-
-whoami | grep -q root || {
-	echo "ERROR: not running as root"
-	exit 1
-}
-
-# no other X session should be running
-find /tmp/ -name .X*lock 2>/dev/null | grep -q X && {
-	echo "ERROR: X session already running"
-	exit 1
-}
-
-TMPDIR=$(mktemp -d /tmp/igt.XXXX) || {
-	echo "ERROR: Failed to create temp dir"
-	exit 1
-}
-
-cat > $TMPDIR/xorg.conf.fbdev << EOF
-Section "Device"
-	Driver		"fbdev"
-	Identifier 	"Device[fbdev]"
-EndSection
-EOF
-
-cat > $TMPDIR/xorg.conf.intel << EOF
-Section "Device"
-	Driver		"intel"
-	Identifier 	"Device[intel]"
-EndSection
-EOF
-
-# log before fbdev
-dmesg -c > $TMPDIR/dmesg.1.before.fbdev
-cp /var/log/Xorg.0.log $TMPDIR/Xorg.0.log.1.before.fbdev
-
-# run fbdev
-xinit -- /usr/bin/X -config $TMPDIR/xorg.conf.fbdev & 
-sleep 5
-if [ -f `which intel_reg` ]; then
-`which intel_reg` dump > $TMPDIR/intel_reg_dump.1.fbdev
-fi
-killall X
-
-# log after fbdev & before intel
-dmesg -c > $TMPDIR/dmesg.2.after.fbdev.before.intel
-cp /var/log/Xorg.0.log $TMPDIR/Xorg.0.log.2.after.fbdev.before.intel
-
-sleep 5
-
-# run intel
-xinit -- /usr/bin/X -config $TMPDIR/xorg.conf.intel & 
-sleep 5 
-if [ -f `which intel_reg` ]; then
-`which intel_reg` dump > $TMPDIR/intel_reg_dump.2.intel
-fi
-killall X
-
-# log after intel
-dmesg -c > $TMPDIR/dmesg.3.after.intel
-cp /var/log/Xorg.0.log $TMPDIR/Xorg.0.log.3.after.intel
-
-cp $0 $TMPDIR/
-
-tar czf $TMPDIR.tar.gz $TMPDIR/*
-if [ -f $TMPDIR.tar.gz ]; then
-	echo $TMPDIR.tar.gz contains this script, all configs and logs generated on this tests
-fi
-
-exit 0
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
