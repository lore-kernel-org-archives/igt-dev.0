Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85972CCD193
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 06:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3359B10E263;
	Mon, 20 Oct 2025 06:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuO273C9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF3A10E263
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 06:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760942682; x=1792478682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GaPUZgWoiooJMMIg8ogTzNQ8qbemrVLKN+H8qoRl8Pg=;
 b=NuO273C9KE/QXUeKuqo5oAkWq7i13J3m/xmti85GjvecyAy6zlkfdJGG
 I3efqhv0h9xDWdaRa93d2o178xIoJM7ZUKzDOUZnfq2PZ66/lLCgN7bek
 EEm6IFHLjORHg18XYsU4yLgtR9fkPyvxRtB9e+kPOclUVoKlTmlFHQEaY
 bOsNlHiCp6MH0T8Ldw7NEVdVK+jUUwgFCbaOWEAw1mi7VKC1dRSgFj32m
 /C9bqkmJo8de3HWD6PcS0Er+fCFG5Y86HzefwIOAWWXYKzwvb0Ih+tdTR
 fOYPw+u0rZcxlO3UKNQNVMWNM4lpZiFphkRqY3Xb0izexBc4flRbcrZvV A==;
X-CSE-ConnectionGUID: sHzeTMIJTCaz+6Ubral7JQ==
X-CSE-MsgGUID: uWwBsee2TRi4TSWOOGbTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63097961"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="63097961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:42 -0700
X-CSE-ConnectionGUID: HeYsziVVQvSC/jtKXva4uA==
X-CSE-MsgGUID: JCVbbgxsRbSUZnlcLg66PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="187275066"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:40 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Mark Yakoub <mark.yakoub@google.com>
Subject: [PATCH i-g-t v11 5/6] docs: Add platform-specific documentation
Date: Mon, 20 Oct 2025 08:40:49 +0200
Message-ID: <20251020064053.1050025-6-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020064053.1050025-1-pawel.sikora@intel.com>
References: <20251020064053.1050025-1-pawel.sikora@intel.com>
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

Add platforms.md with information about HW/SW to
be used when running IGT tests/tools.

Add Intel-specific details with a placeholder
for other vendors.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Mark Yakoub <mark.yakoub@google.com>

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/platforms.md | 80 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 docs/platforms.md

diff --git a/docs/platforms.md b/docs/platforms.md
new file mode 100644
index 000000000..e6882feec
--- /dev/null
+++ b/docs/platforms.md
@@ -0,0 +1,80 @@
+# :material-check-circle: Platforms
+
+## :material-chip: Hardware
+
+**IGT GPU Tools** is designed to validate few DRM drivers across a variety of Intel
+and non-Intel platforms. While virtual environments help with development, real hardware
+is recommended for full test coverage, performance metrics, and regression tracking.
+
+### :material-lightbulb-outline: General Guidelines
+
+- **Use modern GPUs** for maximum test compatibility.
+- Prefer **dedicated test systems** for kernel and firmware flexibility.
+- Ensure **reliable cooling** to avoid throttling during performance tests.
+
+### Intel
+
+| GPU Generation | Example Platform / CPU      | Notes                                        |
+|-||-|
+| Gen9           | Skylake (e.g., i5-6200U)    | Stable, well-supported baseline              |
+| Gen11          | Ice Lake (e.g., i7-1065G7)  | Better display/media support                 |
+| Gen12          | Tiger Lake / Alder Lake     | Used for both `i915` and early `Xe` testing  |
+| DG2            | Intel Arc A-Series GPUs     | Required for `Xe` HPG-specific validation    |
+| XeHP/XeHPC     | (If available)              | Specialized use by hardware teams/devs       |
+
+:material-information-outline: *Older GPUs (Gen7/Gen8) are still useful for regression
+testing but may not support new test features.*
+
+### Non-Intel GPU Support
+
+Although IGT is Intel-focused, basic support exists for other platforms:
+
+- **AMD (AMDGPU):** Some display and KMS tests run; feature support may vary.
+- **NVIDIA (nouveau):** Partial functionality; manual testing encouraged.
+- **VirtIO-GPU / QEMU / GVT-g:** Useful for automation and limited pipeline testing.
+- **ARM SoCs (e.g., Mali, Vivante):** Experimental – not all tests apply.
+
+:material-account-group-outline: Community contributions are welcome to expand non-Intel
+support!
+
+## :material-script: Software
+
+### Intel
+
+#### :material-shield-account-outline: i915 vs Xe Drivers
+
+IGT supports two major Intel GPU drivers in the kernel:
+
+Here are some basic information, for more please visit an official
+[Intel Graphics for Linux - Documentation](https://drm.pages.freedesktop.org/intel-docs/)
+
+#### :material-chip: `i915` Driver
+
+- Supports older Intel platforms (Gen9–Gen12).
+- Mature, well-tested, and fully integrated into kernel and userspace stacks.
+- Tests targeting `i915` must include proper documentation (using `igt_describe`) and
+  follow test plan validation rules.
+
+#### :material-flash: `Xe` Driver
+
+- Next-generation Intel GPU driver for **DG2 (Arc)** and newer architectures.
+- Designed to replace `i915` for future platforms.
+- Modular, uses a new codebase and device model.
+- Tests targeting `Xe` must follow the same documentation and validation practices but may
+  focus on newer UAPI/ABI interactions.
+
+#### :material-alert-outline: Key Differences
+
+| Aspect           | i915                         | Xe                                    |
+|||-|
+| Target Platforms | Gen9–Gen12, some DG1         | DG2 (Arc), XeHP/HPG/HPC               |
+| Kernel Interface | Legacy DRM, widely used      | New driver stack with modernized UAPI |
+| Development      | Stable, long-maintained      | In active development                 |
+| Test Requirements| Strict documentation rules   | Same, with new feature emphasis       |
+
+If you're unsure which driver your hardware uses, check:
+
+```bash
+lspci -nn | grep VGA
+dmesg | grep drm
+```
-- 
2.51.0

