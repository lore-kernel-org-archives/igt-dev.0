Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EE7CCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4165B10E240;
	Fri, 24 Oct 2025 08:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2XZULlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A080C10E1B6
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761294422; x=1792830422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZznD634cvxNQVzgnuNz82Ci3KEwmfXWexXjG9mC8wRE=;
 b=I2XZULlCfrdWqBb2UtAYxVcDcIUydlfEmbvLvKcXABy6nQYATPoQFCz/
 3DqMYYJmOdmjmNWKbMftvVaErzUlELn///Ms2FKlFIcRJy02xpwvZnVFX
 md1+YP5k458IC1UzSmR/lLQw/ZwP+s37/1nfUn+hgxnMPKR2dOGMtwkve
 2mpo8R2fbbOQ+x1xxefktqEsw0T90QW08MKVB8ctvrGRsLP1KXxsQpOYD
 8ySrqCVVVjzXg1hPS8KLXT8JC0iTmafpRKvvls5yBjWoZXfaawT/yyRHC
 H4cJCUVVNVhh1dDqkX1RjymN902jGYa7gMqFizqW3dzmNLegCTtjrkdzS A==;
X-CSE-ConnectionGUID: cOo/KgIWRBqNZqKrxb5mNA==
X-CSE-MsgGUID: BnjkMThMSIC/IhjIzK7crA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67309379"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67309379"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:27:02 -0700
X-CSE-ConnectionGUID: KqqQCf1+SEe/X+hTtcVWIA==
X-CSE-MsgGUID: Nccr2X6DRh2Ent64yTtTkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="221576292"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.85])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:27:01 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Mark Yakoub <mark.yakoub@google.com>
Subject: [PATCH i-g-t v12 5/6] docs: Add platform-specific documentation
Date: Fri, 24 Oct 2025 10:26:24 +0200
Message-ID: <20251024082628.1118783-6-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024082628.1118783-1-pawel.sikora@intel.com>
References: <20251024082628.1118783-1-pawel.sikora@intel.com>
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
 docs/platforms.md | 81 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 docs/platforms.md

diff --git a/docs/platforms.md b/docs/platforms.md
new file mode 100644
index 000000000..27f3ea681
--- /dev/null
+++ b/docs/platforms.md
@@ -0,0 +1,81 @@
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
+| Gen12(DG1)     | Tiger Lake / Alder Lake     | Used for both `i915` and early `Xe` testing  |
+| DG2            | Intel Arc A-Series GPUs     | Required for `Xe` HPG-specific validation    |
+| XeHP           | ATS-M                       | Specialized use by hardware teams/devs       |
+| XeHPC          | PVC                         | Specialized use by hardware teams/devs       |
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
+- Supports older Intel platforms up to MTL(Arc Series-A).
+- Mature, well-tested, and fully integrated into kernel and userspace stacks.
+- Tests targeting `i915` must include proper documentation (using `igt_describe`) and
+  follow test plan validation rules.
+
+#### :material-flash: `Xe` Driver
+
+- Next-generation Intel GPU driver for newer architectures from TGL/DG1.
+- Designed to replace `i915` for future platforms.
+- Modular, uses a new codebase and device model.
+- Tests targeting `Xe` must follow the same documentation and validation practices but may
+  focus on newer UAPI/ABI interactions.
+
+#### :material-alert-outline: Key Differences
+
+| Aspect           | i915                         | Xe                                    |
+|||-|
+| Target Platforms | Gen9–Gen12/DG2/MTL           | DG1/TGL/DG2/XeHP/HPG/HPC              |
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

