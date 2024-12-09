Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C18E77182
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A1110E75C;
	Mon,  9 Dec 2024 14:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPGR0dg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F4710E75C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733754279; x=1765290279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfuPTAR8SeVtNfRLYcqljQb5sT5rLQsYLPufHoFOIFs=;
 b=IPGR0dg3KeJnf8CKe4AabnAJ5D7P74fgif6DaqZC2+CLrhGohTu4NYZO
 Nvnoc47Q0yfy1dnV4kVbugCjiQHPFVZ7Se/JcwMV7GYRg/tsZGBAZoaJP
 btS36uhU6vGmTCca9CwpIj++o3qeNUtBOsz8S5bfM0NNKuAz93LSXgmXB
 U7b8NJG1x5Kd2rLoTrIyquVddk0aq9zpLc4TC+RPD84LARlypsJshFT0v
 IJSsVVWgJ/N0NZ81n3hR/Q3IkHrKaRVWHiS1lHjmeGTwOQDCjx7k+yX9T
 092XfV+F40w/f/2V2WXKtsBIRMRPtpJTStEzF5b4DDG9K8wNFg+M/gHWz g==;
X-CSE-ConnectionGUID: YQc10LYHRz2Z7FXyKZFhUA==
X-CSE-MsgGUID: 0Wl75opaTy+PIbV/i5adNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33968996"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33968996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:24:39 -0800
X-CSE-ConnectionGUID: e01dVIdmTJ2ZwHBQKMao0Q==
X-CSE-MsgGUID: /JEHGtFtRXWm/ksYvfqBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94776176"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:24:37 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v4 3/4] tools/vmtb: Test resources - vGPU profiles
Date: Mon,  9 Dec 2024 15:24:22 +0100
Message-Id: <20241209142423.2718734-4-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
References: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
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

Provide vGPU profiles definition for Flex 170 (ATS-M) platform.
Definitions are provided in a JSON format, parsed by the VMTB
and applied as a test setup (fixture).

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 .../resources/vgpu_profiles/Flex170.json      | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json

diff --git a/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
new file mode 100644
index 000000000..ff1fa7e20
--- /dev/null
+++ b/tools/vmtb/vmm_flows/resources/vgpu_profiles/Flex170.json
@@ -0,0 +1,113 @@
+{
+    "version": "1.1",
+    "PFResources": {
+        "Default": "MinimumPFResources",
+        "Profile": {
+            "MinimumPFResources": {
+                "LocalMemoryEccOn": 402653184,
+                "LocalMemoryEccOff": 402653184,
+                "Contexts": 1024,
+                "Doorbells": 16,
+                "GGTTSize": 268435456
+            }
+        }
+    },
+    "vGPUResources": {
+        "Default": null,
+        "Profile": {
+            "Flex170_16": {
+                "VFCount": 1,
+                "LocalMemoryEccOff": 16777216000,
+                "LocalMemoryEccOn": 2147483648,
+                "Contexts": 1024,
+                "Doorbells": 240,
+                "GGTTSize": 4026531840
+            },
+            "Flex170_8": {
+                "VFCount": 2,
+                "LocalMemoryEccOff": 8388608000,
+                "LocalMemoryEccOn": 2147483648,
+                "Contexts": 1024,
+                "Doorbells": 120,
+                "GGTTSize": 2013265920
+            },
+            "Flex170_4": {
+                "VFCount": 4,
+                "LocalMemoryEccOff": 4194304000,
+                "LocalMemoryEccOn": 2147483648,
+                "Contexts": 1024,
+                "Doorbells": 60,
+                "GGTTSize": 1006632960
+            },
+            "Flex170_2": {
+                "VFCount": 8,
+                "LocalMemoryEccOff": 2097152000,
+                "LocalMemoryEccOn": 1073741824,
+                "Contexts": 1024,
+                "Doorbells": 30,
+                "GGTTSize": 503316480
+            },
+            "Flex170_1": {
+                "VFCount": 16,
+                "LocalMemoryEccOff": 1048576000,
+                "LocalMemoryEccOn": 536870912,
+                "Contexts": 1024,
+                "Doorbells": 15,
+                "GGTTSize": 251658240
+            }
+        }
+    },
+    "vGPUScheduler": {
+        "Default": "Flexible_30fps_GPUTimeSlicing",
+        "Profile": {
+            "Flexible_30fps_GPUTimeSlicing": {
+                "GPUTimeSlicing": {
+                    "ScheduleIfIdle": false,
+                    "PFExecutionQuantum": 20,
+                    "PFPreemptionTimeout": 20000,
+                    "VFAttributes": {
+                        "VFExecutionQuantum": "lambda VFCount : max( 32 // VFCount, 1)",
+                        "VFPreemptionTimeout": "lambda VFCount : 128000 if (VFCount == 1) else max( 64000 // VFCount, 16000)"
+                    }
+                }
+            },
+            "Fixed_30fps_GPUTimeSlicing": {
+                "GPUTimeSlicing": {
+                    "ScheduleIfIdle": true,
+                    "PFExecutionQuantum": 20,
+                    "PFPreemptionTimeout": 20000,
+                    "VFAttributes": {
+                        "VFExecutionQuantum": "lambda VFCount : max( 32 // VFCount, 1)",
+                        "VFPreemptionTimeout": "lambda VFCount : 128000 if (VFCount == 1) else max( 64000 // VFCount, 16000)"
+                    }
+                }
+            },
+            "Flexible_BurstableQoS_GPUTimeSlicing": {
+                "GPUTimeSlicing": {
+                    "ScheduleIfIdle": false,
+                    "PFExecutionQuantum": 20,
+                    "PFPreemptionTimeout": 20000,
+                    "VFAttributes": {
+                        "VFExecutionQuantum": "lambda VFCount : min((2000 // max(VFCount-1,1)*0.5, 50))",
+                        "VFPreemptionTimeout": "lambda VFCount : (2000 // max(VFCount-1,1) - min((2000 // max(VFCount-1,1))*0.5, 50))*1000"
+                    }
+                }
+            }
+        }
+    },
+    "vGPUSecurity": {
+        "Default": "Disabled",
+        "Profile": {
+            "Disabled": {
+                "ResetAfterVfSwitch": false,
+                "GuCSamplingPeriod": 0,
+                "GuCThresholdCATError": 0,
+                "GuCThresholdPageFault": 0,
+                "GuCThresholdH2GStorm": 0,
+                "GuCThresholdDbStorm": 0,
+                "GuCThresholdGTIrqStorm": 0,
+                "GuCThresholdEngineReset": 0
+            }
+        }
+    }
+}
\ No newline at end of file
-- 
2.39.1

