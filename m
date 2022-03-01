Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62210E85D
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:40 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nOxQ0-000Wk7-MS
 for igt-dev@lists.freedesktop.org; Tue, 01 Mar 2022 08:59:36 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Mar 2022 08:59:24 +0100
Message-Id: <20220301075929.125733-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
References: <20220301075929.125733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 4/9] scripts/code_cov_gather_on_build.sh:
 Improve the script
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

- speedup the script by allowing Sparse file detection instead
  of libz compression;

- use realpath for the paths to allow running them from everywhere;

- Speedup tarball generation by limiting the source file scope to
  the DRM subsystem;

- Indent with tabs instead of spaces.

Reviewed-by: Tomi Sarvela <tomi.p.sarvela@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_gather_on_build.sh | 34 +++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/scripts/code_cov_gather_on_build.sh b/scripts/code_cov_gather_on_build.sh
index 99c436f76fb8..eebee89f9f1c 100755
--- a/scripts/code_cov_gather_on_build.sh
+++ b/scripts/code_cov_gather_on_build.sh
@@ -4,20 +4,36 @@ KSRC=$1
 KOBJ=$2
 DEST=$3
 
+# Limit scope in order to speedup tarball creation
+GCOV_SCOPE=drivers/gpu/drm/
+
 if [ -z "$KSRC" ] || [ -z "$KOBJ" ] || [ -z "$DEST" ]; then
-  echo "Usage: $0 <ksrc directory> <kobj directory> <output.tar.gz>" >&2
-  exit 1
+	echo "Usage: $0 <ksrc directory> <kobj directory> <output.tar[.gz]>" >&2
+	exit 1
+fi
+
+if [ "x$(echo $DEST|grep '\.gz')" != "x" ]; then
+	TAR_COMPRESS="z"
+else
+	# gcno files are sparsed. So, if no compression is used, store the
+	# results as a sparse file, in order to save disk space
+	TAR_COMPRESS="S"
 fi
 
-KSRC=$(cd $KSRC; printf "all:\n\t@echo \${CURDIR}\n" | make -f -)
-KOBJ=$(cd $KOBJ; printf "all:\n\t@echo \${CURDIR}\n" | make -f -)
+KSRC=$(realpath $KSRC)
+KOBJ=$(realpath $KOBJ)
+
+# Source files
+SRCS="${KSRC}/include ${KSRC}/arch/x86/include $(find ${KSRC}/${GCOV_SCOPE} -name '*.[ch]')"
+
+# Generated gcno files and links
+OBJS="$(find $KOBJ/${GCOV_SCOPE} \( -name '*.gcno' -o -name '*.[ch]' -o -type l \) -a -perm /u+r,g+r)"
 
-find $KSRC $KOBJ \( -name '*.gcno' -o -name '*.[ch]' -o -type l \) -a \
-                 -perm /u+r,g+r | tar cfz $DEST -P -T -
+tar cf${TAR_COMPRESS} $DEST $SRCS $OBJS
 
 if [ $? -eq 0 ] ; then
-  echo "$DEST successfully created, copy to test system and unpack with:"
-  echo "  tar xfz $DEST -P"
+	echo "$DEST successfully created, copy to test system and unpack with:"
+	echo "  tar xf${TAR_COMPRESS} $DEST"
 else
-  echo "Could not create file $DEST"
+	echo "Could not create file $DEST"
 fi
-- 
2.35.1
