Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BA110E44B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 07:43:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y12so1671539edc.13
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Mar 2022 23:43:07 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed,  9 Mar 2022 08:42:41 +0100
Message-Id: <20220309074242.65066-11-tomeu.vizoso@collabora.com>
In-Reply-To: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
References: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 10/11] ci: Add files from Mesa required to submit
 jobs to LAVA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Mostly to submit jobs to LAVA and to setup the device after boot.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 ci/ci-common/capture-devcoredump.sh |  14 +
 ci/ci-common/generate-env.sh        | 112 ++++++++
 ci/ci-common/init-stage1.sh         |  22 ++
 ci/ci-common/init-stage2.sh         |  78 ++++++
 ci/lava/lava-submit.sh              |  38 +++
 ci/lava/lava_job_submitter.py       | 380 ++++++++++++++++++++++++++++
 6 files changed, 644 insertions(+)
 create mode 100755 ci/ci-common/capture-devcoredump.sh
 create mode 100755 ci/ci-common/generate-env.sh
 create mode 100755 ci/ci-common/init-stage1.sh
 create mode 100755 ci/ci-common/init-stage2.sh
 create mode 100755 ci/lava/lava-submit.sh
 create mode 100755 ci/lava/lava_job_submitter.py

diff --git a/ci/ci-common/capture-devcoredump.sh b/ci/ci-common/capture-devcoredump.sh
new file mode 100755
index 000000000000..ae370538eaeb
--- /dev/null
+++ b/ci/ci-common/capture-devcoredump.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+while true; do
+  devcds=`find /sys/devices/virtual/devcoredump/ -name data 2>/dev/null`
+  for i in $devcds; do
+    echo "Found a devcoredump at $i."
+    if cp $i /results/first.devcore; then
+      echo 1 > $i
+      echo "Saved to the job artifacts at /first.devcore"
+      exit 0
+    fi
+  done
+  sleep 10
+done
diff --git a/ci/ci-common/generate-env.sh b/ci/ci-common/generate-env.sh
new file mode 100755
index 000000000000..dc2b7febefb8
--- /dev/null
+++ b/ci/ci-common/generate-env.sh
@@ -0,0 +1,112 @@
+#!/bin/bash
+
+for var in \
+    ASAN_OPTIONS \
+    BASE_SYSTEM_FORK_HOST_PREFIX \
+    BASE_SYSTEM_MAINLINE_HOST_PREFIX \
+    CI_COMMIT_BRANCH \
+    CI_COMMIT_REF_NAME \
+    CI_COMMIT_TITLE \
+    CI_JOB_ID \
+    CI_JOB_JWT_FILE \
+    CI_JOB_NAME \
+    CI_JOB_URL \
+    CI_MERGE_REQUEST_SOURCE_BRANCH_NAME \
+    CI_MERGE_REQUEST_TITLE \
+    CI_NODE_INDEX \
+    CI_NODE_TOTAL \
+    CI_PAGES_DOMAIN \
+    CI_PIPELINE_ID \
+    CI_PIPELINE_URL \
+    CI_PROJECT_DIR \
+    CI_PROJECT_NAME \
+    CI_PROJECT_PATH \
+    CI_PROJECT_ROOT_NAMESPACE \
+    CI_RUNNER_DESCRIPTION \
+    CI_SERVER_URL \
+    CROSVM_GALLIUM_DRIVER \
+    CROSVM_GPU_ARGS \
+    CROSVM_TEST_SCRIPT \
+    DEQP_BIN_DIR \
+    DEQP_CASELIST_FILTER \
+    DEQP_CASELIST_INV_FILTER \
+    DEQP_CONFIG \
+    DEQP_EXPECTED_RENDERER \
+    DEQP_FRACTION \
+    DEQP_HEIGHT \
+    DEQP_RESULTS_DIR \
+    DEQP_RUNNER_OPTIONS \
+    DEQP_SUITE \
+    DEQP_TEMP_DIR \
+    DEQP_VARIANT \
+    DEQP_VER \
+    DEQP_WIDTH \
+    DEVICE_NAME \
+    DRIVER_NAME \
+    EGL_PLATFORM \
+    ETNA_MESA_DEBUG \
+    FDO_CI_CONCURRENT \
+    FDO_UPSTREAM_REPO \
+    FD_MESA_DEBUG \
+    FLAKES_CHANNEL \
+    GALLIUM_DRIVER \
+    GALLIVM_PERF \
+    GPU_VERSION \
+    GTEST \
+    GTEST_FAILS \
+    GTEST_FRACTION \
+    GTEST_RESULTS_DIR \
+    GTEST_RUNNER_OPTIONS \
+    GTEST_SKIPS \
+    HWCI_FREQ_MAX \
+    HWCI_KERNEL_MODULES \
+    HWCI_START_XORG \
+    HWCI_TEST_SCRIPT \
+    IGT_FORCE_DRIVER \
+    IR3_SHADER_DEBUG \
+    JOB_ARTIFACTS_BASE \
+    JOB_RESULTS_PATH \
+    JOB_ROOTFS_OVERLAY_PATH \
+    LD_LIBRARY_PATH \
+    LP_NUM_THREADS \
+    MESA_BASE_TAG \
+    MESA_BUILD_PATH \
+    MESA_DEBUG \
+    MESA_GLES_VERSION_OVERRIDE \
+    MESA_GLSL_VERSION_OVERRIDE \
+    MESA_GL_VERSION_OVERRIDE \
+    MESA_IMAGE \
+    MESA_IMAGE_PATH \
+    MESA_IMAGE_TAG \
+    MESA_TEMPLATES_COMMIT \
+    MESA_VK_IGNORE_CONFORMANCE_WARNING \
+    MINIO_HOST \
+    NIR_DEBUG \
+    PAN_I_WANT_A_BROKEN_VULKAN_DRIVER \
+    PAN_MESA_DEBUG \
+    PIGLIT_FRACTION \
+    PIGLIT_NO_WINDOW \
+    PIGLIT_OPTIONS \
+    PIGLIT_PLATFORM \
+    PIGLIT_PROFILES \
+    PIGLIT_REPLAY_ARTIFACTS_BASE_URL \
+    PIGLIT_REPLAY_DESCRIPTION_FILE \
+    PIGLIT_REPLAY_DEVICE_NAME \
+    PIGLIT_REPLAY_EXTRA_ARGS \
+    PIGLIT_REPLAY_REFERENCE_IMAGES_BASE \
+    PIGLIT_REPLAY_SUBCOMMAND \
+    PIGLIT_RESULTS \
+    PIGLIT_TESTS \
+    PIPELINE_ARTIFACTS_BASE \
+    SKQP_ASSETS_DIR \
+    SKQP_BACKENDS \
+    TU_DEBUG \
+    VIRGL_HOST_API \
+    VK_CPU \
+    VK_DRIVER \
+    VK_ICD_FILENAMES \
+    ; do
+  if [ -n "${!var+x}" ]; then
+    echo "export $var=${!var@Q}"
+  fi
+done
diff --git a/ci/ci-common/init-stage1.sh b/ci/ci-common/init-stage1.sh
new file mode 100755
index 000000000000..648c37a2f903
--- /dev/null
+++ b/ci/ci-common/init-stage1.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+# Very early init, used to make sure devices and network are set up and
+# reachable.
+
+set -ex
+
+cd /
+
+mount -t proc none /proc
+mount -t sysfs none /sys
+mount -t devtmpfs none /dev || echo possibly already mounted
+mkdir -p /dev/pts
+mount -t devpts devpts /dev/pts
+mount -t tmpfs tmpfs /tmp
+
+echo "nameserver 8.8.8.8" > /etc/resolv.conf
+[ -z "$NFS_SERVER_IP" ] || echo "$NFS_SERVER_IP caching-proxy" >> /etc/hosts
+
+# Set the time so we can validate certificates before we fetch anything;
+# however as not all DUTs have network, make this non-fatal.
+for i in 1 2 3; do sntp -sS pool.ntp.org && break || sleep 2; done || true
diff --git a/ci/ci-common/init-stage2.sh b/ci/ci-common/init-stage2.sh
new file mode 100755
index 000000000000..aff36635e59b
--- /dev/null
+++ b/ci/ci-common/init-stage2.sh
@@ -0,0 +1,78 @@
+#!/bin/sh
+
+# Second-stage init, used to set up devices and our job environment before
+# running tests.
+
+. /set-job-env-vars.sh
+
+set -ex
+
+# Set up any devices required by the jobs
+[ -z "$HWCI_KERNEL_MODULES" ] || (echo -n $HWCI_KERNEL_MODULES | xargs -d, -n1 /usr/sbin/modprobe)
+
+# Fix prefix confusion: the build installs to $CI_PROJECT_DIR, but we expect
+# it in /install
+ln -sf $CI_PROJECT_DIR/build /install
+export LD_LIBRARY_PATH=/install/lib
+export LIBGL_DRIVERS_PATH=/install/lib/dri
+
+# Store Mesa's disk cache under /tmp, rather than sending it out over NFS.
+export XDG_CACHE_HOME=/tmp
+
+# Make sure Python can find all our imports
+export PYTHONPATH=$(python3 -c "import sys;print(\":\".join(sys.path))")
+
+if [ "$HWCI_FREQ_MAX" = "true" ]; then
+  # Ensure initialization of the DRM device (needed by MSM)
+  head -0 /dev/dri/renderD128
+
+  # Disable GPU frequency scaling
+  DEVFREQ_GOVERNOR=`find /sys/devices -name governor | grep gpu || true`
+  test -z "$DEVFREQ_GOVERNOR" || echo performance > $DEVFREQ_GOVERNOR || true
+
+  # Disable CPU frequency scaling
+  echo performance | tee -a /sys/devices/system/cpu/cpufreq/policy*/scaling_governor || true
+
+  # Disable GPU runtime power management
+  GPU_AUTOSUSPEND=`find /sys/devices -name autosuspend_delay_ms | grep gpu | head -1`
+  test -z "$GPU_AUTOSUSPEND" || echo -1 > $GPU_AUTOSUSPEND || true
+fi
+
+# Start a little daemon to capture the first devcoredump we encounter.  (They
+# expire after 5 minutes, so we poll for them).
+./capture-devcoredump.sh &
+
+# If we want Xorg to be running for the test, then we start it up before the
+# HWCI_TEST_SCRIPT because we need to use xinit to start X (otherwise
+# without using -displayfd you can race with Xorg's startup), but xinit will eat
+# your client's return code
+if [ -n "$HWCI_START_XORG" ]; then
+  echo "touch /xorg-started; sleep 100000" > /xorg-script
+  env \
+    xinit /bin/sh /xorg-script -- /usr/bin/Xorg -noreset -s 0 -dpms -logfile /Xorg.0.log &
+
+  # Wait for xorg to be ready for connections.
+  for i in 1 2 3 4 5; do
+    if [ -e /xorg-started ]; then
+      break
+    fi
+    sleep 5
+  done
+  export DISPLAY=:0
+fi
+
+RESULT=fail
+if sh $HWCI_TEST_SCRIPT; then
+  RESULT=pass
+  rm -rf results/trace/$PIGLIT_REPLAY_DEVICE_NAME
+fi
+
+# upload artifacts
+MINIO=$(cat /proc/cmdline | tr ' ' '\n' | grep minio_results | cut -d '=' -f 2 || true)
+if [ -n "$MINIO" ]; then
+  tar -czf results.tar.gz results/;
+  ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}";
+  ci-fairy minio cp results.tar.gz minio://"$MINIO"/results.tar.gz;
+fi
+
+echo "hwci: test: $RESULT"
diff --git a/ci/lava/lava-submit.sh b/ci/lava/lava-submit.sh
new file mode 100755
index 000000000000..fac1c42bc296
--- /dev/null
+++ b/ci/lava/lava-submit.sh
@@ -0,0 +1,38 @@
+#!/bin/bash
+
+set -e
+set -x
+
+SCRIPTS_DIR=`dirname "$0"`/..
+
+rm -rf results
+mkdir -p results/job-rootfs-overlay/
+
+cp $SCRIPTS_DIR/ci-common/capture-devcoredump.sh results/job-rootfs-overlay/
+cp $SCRIPTS_DIR/ci-common/init-*.sh results/job-rootfs-overlay/
+$SCRIPTS_DIR/ci-common/generate-env.sh > results/job-rootfs-overlay/set-job-env-vars.sh
+
+tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .
+ci-fairy minio login --token-file "${CI_JOB_JWT_FILE}"
+ci-fairy minio cp job-rootfs-overlay.tar.gz "minio://${JOB_ROOTFS_OVERLAY_PATH}"
+
+touch results/lava.log
+tail -f results/lava.log &
+$SCRIPTS_DIR/lava/lava_job_submitter.py \
+	--dump-yaml \
+	--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \
+	--base-system-url-prefix "https://${BASE_SYSTEM_MAINLINE_HOST_PATH}" \
+	--build-url "${FDO_HTTP_CACHE_URI:-}https://${BUILD_PATH}" \
+	--job-rootfs-overlay-url "${FDO_HTTP_CACHE_URI:-}https://${JOB_ROOTFS_OVERLAY_PATH}" \
+	--job-artifacts-base ${JOB_ARTIFACTS_BASE} \
+	--job-timeout ${JOB_TIMEOUT:-30} \
+	--first-stage-init $SCRIPTS_DIR/ci-common/init-stage1.sh \
+	--ci-project-dir ${CI_PROJECT_DIR} \
+	--device-type ${DEVICE_TYPE} \
+	--dtb ${DTB} \
+	--jwt-file "${CI_JOB_JWT_FILE}" \
+	--kernel-image-name ${KERNEL_IMAGE_NAME} \
+	--kernel-image-type "${KERNEL_IMAGE_TYPE}" \
+	--boot-method ${BOOT_METHOD} \
+	--visibility-group ${VISIBILITY_GROUP} \
+	--lava-tags "${LAVA_TAGS}" >> results/lava.log
diff --git a/ci/lava/lava_job_submitter.py b/ci/lava/lava_job_submitter.py
new file mode 100755
index 000000000000..5ea8eddf088d
--- /dev/null
+++ b/ci/lava/lava_job_submitter.py
@@ -0,0 +1,380 @@
+#!/usr/bin/env python3
+#
+# Copyright (C) 2020, 2021 Collabora Limited
+# Author: Gustavo Padovan <gustavo.padovan@collabora.com>
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice (including the next
+# paragraph) shall be included in all copies or substantial portions of the
+# Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# SOFTWARE.
+
+"""Send a job to LAVA, track it and collect log back"""
+
+import argparse
+import pathlib
+import sys
+import time
+import traceback
+import urllib.parse
+import xmlrpc
+
+from datetime import datetime, timedelta
+from os import getenv
+
+import lavacli
+import yaml
+from lavacli.utils import loader
+
+# Timeout in seconds to decide if the device from the dispatched LAVA job has
+# hung or not due to the lack of new log output.
+DEVICE_HANGING_TIMEOUT_SEC = int(getenv("LAVA_DEVICE_HANGING_TIMEOUT_SEC",  5*60))
+
+# How many seconds the script should wait before try a new polling iteration to
+# check if the dispatched LAVA job is running or waiting in the job queue.
+WAIT_FOR_DEVICE_POLLING_TIME_SEC = int(getenv("LAVA_WAIT_FOR_DEVICE_POLLING_TIME_SEC", 10))
+
+# How many seconds to wait between log output LAVA RPC calls.
+LOG_POLLING_TIME_SEC = int(getenv("LAVA_LOG_POLLING_TIME_SEC", 5))
+
+# How many retries should be made when a timeout happen.
+NUMBER_OF_RETRIES_TIMEOUT_DETECTION = int(getenv("LAVA_NUMBER_OF_RETRIES_TIMEOUT_DETECTION", 2))
+
+
+def print_log(msg):
+    print("{}: {}".format(datetime.now(), msg))
+
+def fatal_err(msg):
+    print_log(msg)
+    sys.exit(1)
+
+
+def hide_sensitive_data(yaml_data, hide_tag="HIDEME"):
+    return "".join(line for line in yaml_data.splitlines(True) if hide_tag not in line)
+
+
+def generate_lava_yaml(args):
+    # General metadata and permissions, plus also inexplicably kernel arguments
+    values = {
+        'job_name': args.pipeline_info,
+        'device_type': args.device_type,
+        'visibility': { 'group': [ args.visibility_group ] },
+        'priority': 75,
+        'context': {
+            'extra_nfsroot_args': ' init=/init rootwait minio_results={}'.format(args.job_artifacts_base)
+        },
+        'timeouts': {
+            'job': {
+                'minutes': args.job_timeout
+            }
+        },
+    }
+
+    if args.lava_tags:
+        values['tags'] = args.lava_tags.split(',')
+
+    # URLs to our kernel rootfs to boot from, both generated by the base
+    # container build
+    deploy = {
+      'timeout': { 'minutes': 10 },
+      'to': 'tftp',
+      'os': 'oe',
+      'kernel': {
+        'url': '{}/{}'.format(args.base_system_url_prefix, args.kernel_image_name),
+      },
+      'nfsrootfs': {
+        'url': '{}/lava-rootfs.tgz'.format(args.base_system_url_prefix),
+        'compression': 'gz',
+      }
+    }
+    if args.kernel_image_type:
+        deploy['kernel']['type'] = args.kernel_image_type
+    if args.dtb:
+        deploy['dtb'] = {
+          'url': '{}/{}.dtb'.format(args.base_system_url_prefix, args.dtb)
+        }
+
+    # always boot over NFS
+    boot = {
+      'timeout': { 'minutes': 25 },
+      'method': args.boot_method,
+      'commands': 'nfs',
+      'prompts': ['lava-shell:'],
+    }
+
+    # skeleton test definition: only declaring each job as a single 'test'
+    # since LAVA's test parsing is not useful to us
+    test = {
+      'timeout': { 'minutes': args.job_timeout },
+      'failure_retry': 1,
+      'definitions': [ {
+        'name': 'test',
+        'from': 'inline',
+        'path': 'inline/test.yaml',
+        'repository': {
+          'metadata': {
+            'name': 'test',
+            'description': 'Test plan',
+            'os': [ 'oe' ],
+            'scope': [ 'functional' ],
+            'format': 'Lava-Test Test Definition 1.0',
+          },
+          'parse': {
+            'pattern': r'hwci: (?P<test_case_id>\S*):\s+(?P<result>(pass|fail))'
+          },
+          'run': {
+          },
+        },
+      } ],
+    }
+
+    # job execution script:
+    #   - inline .gitlab-ci/common/init-stage1.sh
+    #   - fetch and unpack per-pipeline build artifacts from build job
+    #   - fetch and unpack per-job environment from lava-submit.sh
+    #   - exec .gitlab-ci/common/init-stage2.sh 
+    init_lines = []
+
+    with open(args.first_stage_init, 'r') as init_sh:
+      init_lines += [ x.rstrip() for x in init_sh if not x.startswith('#') and x.rstrip() ]
+
+    with open(args.jwt_file) as jwt_file:
+        init_lines += [
+            "set +x",
+            f'echo -n "{jwt_file.read()}" > "{args.jwt_file}"  # HIDEME',
+            "set -x",
+        ]
+
+    init_lines += [
+      'mkdir -p {}'.format(args.ci_project_dir),
+      'wget -S --progress=dot:giga -O- {} | tar -xz -C {}'.format(args.build_url, args.ci_project_dir),
+      'wget -S --progress=dot:giga -O- {} | tar -xz -C /'.format(args.job_rootfs_overlay_url),
+      f'echo "export CI_JOB_JWT_FILE={args.jwt_file}" >> /set-job-env-vars.sh',
+      'exec /init-stage2.sh',
+    ]
+    test['definitions'][0]['repository']['run']['steps'] = init_lines
+
+    values['actions'] = [
+      { 'deploy': deploy },
+      { 'boot': boot },
+      { 'test': test },
+    ]
+
+    return yaml.dump(values, width=10000000)
+
+
+def setup_lava_proxy():
+    config = lavacli.load_config("default")
+    uri, usr, tok = (config.get(key) for key in ("uri", "username", "token"))
+    uri_obj = urllib.parse.urlparse(uri)
+    uri_str = "{}://{}:{}@{}{}".format(uri_obj.scheme, usr, tok, uri_obj.netloc, uri_obj.path)
+    transport = lavacli.RequestsTransport(
+        uri_obj.scheme,
+        config.get("proxy"),
+        config.get("timeout", 120.0),
+        config.get("verify_ssl_cert", True),
+    )
+    proxy = xmlrpc.client.ServerProxy(
+        uri_str, allow_none=True, transport=transport)
+
+    print_log("Proxy for {} created.".format(config['uri']))
+
+    return proxy
+
+
+def _call_proxy(fn, *args):
+    retries = 60
+    for n in range(1, retries + 1):
+        try:
+            return fn(*args)
+        except xmlrpc.client.ProtocolError as err:
+            if n == retries:
+                traceback.print_exc()
+                fatal_err("A protocol error occurred (Err {} {})".format(err.errcode, err.errmsg))
+            else:
+                time.sleep(15)
+        except xmlrpc.client.Fault as err:
+            traceback.print_exc()
+            fatal_err("FATAL: Fault: {} (code: {})".format(err.faultString, err.faultCode))
+
+
+def get_job_results(proxy, job_id, test_suite, test_case):
+    # Look for infrastructure errors and retry if we see them.
+    results_yaml = _call_proxy(proxy.results.get_testjob_results_yaml, job_id)
+    results = yaml.load(results_yaml, Loader=loader(False))
+    for res in results:
+        metadata = res["metadata"]
+        if "result" not in metadata or metadata["result"] != "fail":
+            continue
+        if 'error_type' in metadata and metadata['error_type'] == "Infrastructure":
+            print_log("LAVA job {} failed with Infrastructure Error. Retry.".format(job_id))
+            return False
+        if 'case' in metadata and metadata['case'] == "validate":
+            print_log("LAVA job {} failed validation (possible download error). Retry.".format(job_id))
+            return False
+
+    results_yaml = _call_proxy(proxy.results.get_testcase_results_yaml, job_id, test_suite, test_case)
+    results = yaml.load(results_yaml, Loader=loader(False))
+    if not results:
+        fatal_err("LAVA: no result for test_suite '{}', test_case '{}'".format(test_suite, test_case))
+
+    print_log("LAVA: result for test_suite '{}', test_case '{}': {}".format(test_suite, test_case, results[0]['result']))
+    if results[0]['result'] != 'pass':
+        fatal_err("FAIL")
+
+    return True
+
+def wait_until_job_is_started(proxy, job_id):
+    print_log(f"Waiting for job {job_id} to start.")
+    current_state = "Submitted"
+    waiting_states = ["Submitted", "Scheduling", "Scheduled"]
+    while current_state in waiting_states:
+        job_state = _call_proxy(proxy.scheduler.job_state, job_id)
+        current_state = job_state["job_state"]
+
+        time.sleep(WAIT_FOR_DEVICE_POLLING_TIME_SEC)
+    print_log(f"Job {job_id} started.")
+
+def follow_job_execution(proxy, job_id):
+    line_count = 0
+    finished = False
+    last_time_logs = datetime.now()
+    while not finished:
+        (finished, data) = _call_proxy(proxy.scheduler.jobs.logs, job_id, line_count)
+        if logs := yaml.load(str(data), Loader=loader(False)):
+            # Reset the timeout
+            last_time_logs = datetime.now()
+            for line in logs:
+                print("{} {}".format(line["dt"], line["msg"]))
+
+            line_count += len(logs)
+
+        else:
+            time_limit = timedelta(seconds=DEVICE_HANGING_TIMEOUT_SEC)
+            if datetime.now() - last_time_logs > time_limit:
+                print_log("LAVA job {} doesn't advance (machine got hung?). Retry.".format(job_id))
+                return False
+
+        # `proxy.scheduler.jobs.logs` does not block, even when there is no
+        # new log to be fetched. To avoid dosing the LAVA dispatcher
+        # machine, let's add a sleep to save them some stamina.
+        time.sleep(LOG_POLLING_TIME_SEC)
+
+    return True
+
+def show_job_data(proxy, job_id):
+    show = _call_proxy(proxy.scheduler.jobs.show, job_id)
+    for field, value in show.items():
+        print("{}\t: {}".format(field, value))
+
+
+def validate_job(proxy, job_file):
+    try:
+        return _call_proxy(proxy.scheduler.jobs.validate, job_file, True)
+    except:
+        return False
+
+def submit_job(proxy, job_file):
+    return _call_proxy(proxy.scheduler.jobs.submit, job_file)
+
+
+def retriable_follow_job(proxy, yaml_file):
+    retry_count = NUMBER_OF_RETRIES_TIMEOUT_DETECTION
+
+    while retry_count >= 0:
+        job_id = submit_job(proxy, yaml_file)
+
+        print_log("LAVA job id: {}".format(job_id))
+
+        wait_until_job_is_started(proxy, job_id)
+
+        if not follow_job_execution(proxy, job_id):
+            print_log(f"Job {job_id} has timed out. Cancelling it.")
+            # Cancel the job as it is considered unreachable by GitLab CI.
+            proxy.scheduler.jobs.cancel(job_id)
+
+            retry_count -= 1
+            continue
+
+        show_job_data(proxy, job_id)
+
+        if get_job_results(proxy, job_id, "0_test", "test") == True:
+            break
+    else:
+        # The script attempted all the retries. The job seemed to fail.
+        return False
+
+    return True
+
+
+def main(args):
+    proxy = setup_lava_proxy()
+
+    yaml_file = generate_lava_yaml(args)
+
+    if args.dump_yaml:
+        print(hide_sensitive_data(generate_lava_yaml(args)))
+
+    if args.validate_only:
+        ret = validate_job(proxy, yaml_file)
+        if not ret:
+            fatal_err("Error in LAVA job definition")
+        print("LAVA job definition validated successfully")
+        return
+
+    if not retriable_follow_job(proxy, yaml_file):
+        fatal_err(
+            "Job failed after it exceeded the number of"
+            f"{NUMBER_OF_RETRIES_TIMEOUT_DETECTION} retries."
+        )
+
+
+def create_parser():
+    parser = argparse.ArgumentParser("LAVA job submitter")
+
+    parser.add_argument("--pipeline-info")
+    parser.add_argument("--base-system-url-prefix")
+    parser.add_argument("--build-url")
+    parser.add_argument("--job-rootfs-overlay-url")
+    parser.add_argument("--job-artifacts-base")
+    parser.add_argument("--job-timeout", type=int)
+    parser.add_argument("--first-stage-init")
+    parser.add_argument("--ci-project-dir")
+    parser.add_argument("--device-type")
+    parser.add_argument("--dtb", nargs='?', default="")
+    parser.add_argument("--kernel-image-name")
+    parser.add_argument("--kernel-image-type", nargs='?', default="")
+    parser.add_argument("--boot-method")
+    parser.add_argument("--lava-tags", nargs='?', default="")
+    parser.add_argument("--jwt-file", type=pathlib.Path)
+    parser.add_argument("--validate-only", action='store_true')
+    parser.add_argument("--dump-yaml", action='store_true')
+    parser.add_argument("--visibility-group")
+
+    return parser
+
+if __name__ == "__main__":
+    # given that we proxy from DUT -> LAVA dispatcher -> LAVA primary -> us ->
+    # GitLab runner -> GitLab primary -> user, safe to say we don't need any
+    # more buffering
+    sys.stdout.reconfigure(line_buffering=True)
+    sys.stderr.reconfigure(line_buffering=True)
+
+    parser = create_parser()
+
+    parser.set_defaults(func=main)
+    args = parser.parse_args()
+    args.func(args)
-- 
2.31.1
