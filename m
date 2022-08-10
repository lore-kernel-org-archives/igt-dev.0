Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B14B0053
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 09:40:49 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 10 Aug 2022 15:10:27 +0530
Message-Id: <20220810094027.541357-2-riana.tauro@intel.com>
In-Reply-To: <20220810094027.541357-1-riana.tauro@intel.com>
References: <20220810094027.541357-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib/igt_aux : Skip SUSPEND_STATE_S3 if
 mem_sleep deep state is not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Forcing s3 by setting mem_sleep to deep fails if s3 is not
supported by platform

Skip the test by checking if s3 is not one of the supported mem_sleep
states

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6531
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_aux.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index d80a1935..edb53425 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -882,6 +882,23 @@ static void set_mem_sleep(int power_dir, enum igt_mem_sleep sleep)
 				 mem_sleep_name[sleep]));
 }
 
+static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state)
+{
+	const char *str;
+	char *mem_sleep_states;
+
+	igt_assert((mem_sleep_states = igt_sysfs_get(power_dir, "mem_sleep")));
+
+	str = strstr(mem_sleep_states, mem_sleep_name[state]);
+
+	if (!str)
+		igt_info("mem_sleep state %s not supported.\nSupported mem_sleep states: %s\n",
+			 mem_sleep_name[state], mem_sleep_states);
+
+	free(mem_sleep_states);
+	return str;
+}
+
 /**
  * igt_system_suspend_autoresume:
  * @state: an #igt_suspend_state, the target suspend state
@@ -923,6 +940,8 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 
 	if (state == SUSPEND_STATE_S3) {
 		orig_mem_sleep = get_mem_sleep();
+		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir, MEM_SLEEP_DEEP),
+			      "S3 not supported in this system.\n");
 		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
 		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
 			      "S3 not possible in this system.\n");
-- 
2.25.1
