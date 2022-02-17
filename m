Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F99610ED52
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 15:27:30 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Arkadiusz Hiler <arek@hiler.eu>, Petri Latvala <petri.latvala@intel.com>
Date: Thu, 17 Feb 2022 10:26:46 -0500
Message-ID: <20220217152646.425503-3-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220217152646.425503-1-Rodrigo.Siqueira@amd.com>
References: <20220217152646.425503-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] scripts: get_maintainer: Introduce
 get_maintainer wrapper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Solomon
 Chiu <solomon.chiu@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Linux kernel has a script that parses the MAINTAINERS files, and it is
well maintained in the upstream. Based on that, I want to avoid
reinventing the wheel and reduce our maintenance work by not duplicating
the kernel effort. This commit introduces a wrapper script to the
get_maintainers.pl file; in summary, it only provides these features:

* List of developers
* Mailing list
* List of developers and list together
* It accepts a file path
* It accepts a patch
(I tried to keep this wrapper as minimal as possible).
A simple usage example is:

  scripts/get_maintainer.sh devs tests/kms_plane.c

or

  scripts/get_maintainer.sh list tests/kms_plane.c

Notice that this script can be integrated to git-send-email (see updates
in the CONTRIBUTING file).

Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Nicholas Choi <nicholas.choi@amd.com>
Cc: Martin Peres <martin.peres@mupuf.org>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
Cc: Solomon Chiu <solomon.chiu@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Dingchen Zhang (David) <Dingchen.Zhang@amd.com>

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .gitignore                |   1 +
 CONTRIBUTING.md           |  17 ++++++-
 scripts/get_maintainer.sh | 104 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100755 scripts/get_maintainer.sh

diff --git a/.gitignore b/.gitignore
index f81085ae..30ac6613 100644
--- a/.gitignore
+++ b/.gitignore
@@ -50,5 +50,6 @@ results
 build
 patches
 Makefile
+get_maintainer.pl
 
 .vscode
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 6d1294ad..e51779b0 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -42,7 +42,7 @@ Sending Patches
 - Please submit patches formatted with git send-email/git format-patch or
   equivalent to:
 
-      Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
+      IGT GPU Tools <igt-dev@lists.freedesktop.org>
 
   For patches affecting the driver directly please "cc" the appropriate driver
   mailing list and make sure you are using:
@@ -57,6 +57,21 @@ Sending Patches
 
   on its first invocation.
 
+- IGT has a MAINTAINERS file which is helpful to find people to review your
+  change; use the below command to extract the developer's name for a specific
+  test:
+
+    scripts/get_maintainer.sh [all|list|devs] [file/path|patch]
+
+  If you have a series, the below command will automatically assign the right
+  people in the "TO" and "CC" field:
+
+    git send-email --annotate --cover-letter --thread --no-chain-reply-to --to-cmd="bash scripts/get_maintainer.sh devs" --cc-cmd="bash scripts/get_maintainer.sh list" <SHA>
+
+  In case you have a single patch, you can use:
+
+    git send-email --annotate --to-cmd="bash scripts/get_maintainer.sh devs" --cc-cmd="bash scripts/get_maintainer.sh list" -1
+
 - Patches need to be reviewed on the mailing list. Exceptions only apply for
   testcases and tooling for drivers with just a single contributor (e.g. vc4).
   In this case patches must still be submitted to the mailing list first.
diff --git a/scripts/get_maintainer.sh b/scripts/get_maintainer.sh
new file mode 100755
index 00000000..a2d4110c
--- /dev/null
+++ b/scripts/get_maintainer.sh
@@ -0,0 +1,104 @@
+#!/bin/bash
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2022 Advanced Micro Devices, Inc.
+
+# List of constants
+declare -r GET_MAINTAINER_PATH='get_maintainer.pl'
+declare -r MAINTAINER_CMD="perl $GET_MAINTAINER_PATH"
+declare -r DEFAULT_OPTIONS='--no-tree --separator , --nokeywords --nogit --nogit-fallback --norolestats --remove-duplicates'
+declare -r ONLY_MAILING_LIST='--no-m -no-r --no-n'
+declare -r ONLY_DEVELOPERS='--no-l'
+declare -a get_maintainer_url=(
+  'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/get_maintainer.pl'
+  'https://raw.githubusercontent.com/torvalds/linux/master/scripts/get_maintainer.pl'
+)
+
+declare -A options_values
+
+function print_help()
+{
+  printf "Usage: get_maintainer.sh [all|list|devs] [file/path|patch]\n"
+  printf "Available options:\n"
+  printf "  -h              display this help message\n"
+  printf ""
+}
+
+function download_get_maintainers()
+{
+  for url in ${get_maintainer_url[@]}; do
+    curl --silent "$url" --output "$GET_MAINTAINER_PATH"
+    # If we were able to download, there is no reason to try another link
+    [[ "$?" == 0 ]] && break
+  done
+}
+
+function parse_parameters()
+{
+  local parameters="$@"
+
+  options_values['PATH']=''
+
+  for parameter in ${parameters[@]}; do
+    case "${parameter}" in
+      --help | -h)
+        print_help
+        exit
+        ;;
+      list)
+        options_values['TARGET']='list'
+        ;;
+      all)
+        options_values['TARGET']='all'
+        ;;
+      devs)
+        options_values['TARGET']='devs'
+        ;;
+      *)
+        options_values['PATH']="${parameter}"
+        ;;
+    esac
+  done
+}
+
+function main()
+{
+  local raw_parameters="$@"
+  local cmd="$MAINTAINER_CMD $DEFAULT_OPTIONS"
+  local target
+
+  if [[ "$#" -lt 1 ]]; then
+    printf 'Invalid options\n'
+    print_help
+    exit 22
+  fi
+
+  parse_parameters "$@"
+  target="${options_values['TARGET']}"
+
+  # Download get_maintainers.pl if necessary
+  [[ ! -f "$GET_MAINTAINER_PATH" ]] && download_get_maintainers
+  if [[ ! -f "$GET_MAINTAINER_PATH" ]]; then
+    printf 'Unable to download get_maintainers file, please check your connection'
+    exit 22
+  fi
+
+  case "$target" in
+    list)
+      cmd+=" $ONLY_MAILING_LIST"
+      ;;
+    devs)
+      cmd+=" $ONLY_DEVELOPERS"
+      ;;
+  esac
+
+  # Do we have a file as a target?
+  if [[ -n ${options_values['PATH']} ]]; then
+    cmd+=" -f ${options_values['PATH']}"
+  fi
+
+  eval "$cmd"
+}
+
+main "$@"
-- 
2.25.1
