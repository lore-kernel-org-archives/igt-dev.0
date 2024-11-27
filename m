Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A22DD609CE
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F028010EA7C;
	Wed, 27 Nov 2024 10:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WY/davuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B667D10EA7C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732702942; x=1764238942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9BEA1Hpmctxsw+78h2Y5ZKX/LxbdKdZpIiXgjrTxh6c=;
 b=WY/davuAItswovZA3p7bfasAUinUdUcgt9Un7sam9pveih2gLRN361aK
 nI9Q5bCNB0LVMvNK/aiGl9vIijDs4T6440EajmNs54RKjiS0cx1P4eSP1
 dtL6+Xje2+vy68JRSVoyURDaJvlpvOXGI+skVeV9HKx1/eFPfq4piHkoj
 QjwQNuxN5f8uGd5ypGC3l4+kUxqLL9w1nVLhUuVxRV136rUyIvsfuzYJi
 M9oqSwosAB+AANu3I82lsHgVNKVWJ15lx1erXQcNfF0RJQPga+k2hMALA
 HUDo64q1zG85EnKkHEF8TXf8phz5NmUKj4VcAlOr11YE0ODiYeB2GlXHe w==;
X-CSE-ConnectionGUID: 6O4GZzYkQeSPXVBFtNzgkA==
X-CSE-MsgGUID: onhuyoVzRb6+4KSn989T9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43391158"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="43391158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:22 -0800
X-CSE-ConnectionGUID: 9MJOyfwDRhq701uGz9Mo2Q==
X-CSE-MsgGUID: 14T9xFUUQam+PEwLSDQSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="96974294"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:22:21 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v3 3/4] tools/vmtb: Test resources - vGPU profiles
Date: Wed, 27 Nov 2024 11:22:01 +0100
Message-Id: <20241127102202.3903735-4-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
References: <20241127102202.3903735-1-adam.miszczak@linux.intel.com>
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

