Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CC7CF884C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 12:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE46C10E294;
	Thu, 20 Nov 2025 12:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFd23edO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478FC10E294
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763641587; x=1795177587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V+LkqsQpQu5bKxIAjFHJ8cXN3pxgy3qQ6hyQyQJpau8=;
 b=fFd23edOnyqaZMow5BjtdLdNHEu9/Soou2PAm2PYrPE0Pmj3VcTyErmK
 mhNHDQ6DRu6COBPKkyTVARRQmqvjRcnmhE7tcYgMYYwrLwZGPzUPEEX9p
 vjcRSkg/kcTXDaHPx1p000C5SmU3Dl4Yhb6Cj9oC3AAIRVnfhMWteG2/A
 dp8Jav1OFx8vozYGn8HiM0npGYONP22Wf8D/0wC/o9VwGwIZeObkmA0k+
 msa0HWVL2qJJfC4Iw0HMo2eBzrvPMEzDlZhKKR3k886M8Q+NOxrThzI5u
 sHQH6yvGtFYPIi8F42x48hbI+gYAYoC85FfMd/85iu5vKn3F2RFUF4kHR A==;
X-CSE-ConnectionGUID: 2l375vI0S3qtpG0XBit6Yw==
X-CSE-MsgGUID: M/XMFTaLRwSn2B9o+tPnUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76318198"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76318198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:26:27 -0800
X-CSE-ConnectionGUID: mlwKnPwFTPCp7P82qhX0Pg==
X-CSE-MsgGUID: B2PRcGAqTFqL0fqnM/QLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195830146"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:26:25 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_scaling: Clarify skip on early -EINVAL
Date: Thu, 20 Nov 2025 18:03:27 +0530
Message-Id: <20251120123327.1056280-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Clarify the skip message for cases where scaler requirements
are not met and the test exits early with -EINVAL, avoiding
confusion with a driver failure.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..7de1b802d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1386,7 +1386,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
+							      "Unsupported scaling operation (ret = %s)\n",
 							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 					}
 				}
@@ -1416,7 +1416,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
+							      "Unsupported scaling operation (ret = %s)\n",
 							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 					}
 				}
@@ -1446,7 +1446,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
+							      "Unsupported scaling operation (ret = %s)\n",
 							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 					}
 				}
@@ -1473,7 +1473,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							 igt_output_name(output));
 					}
 					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-						      "Unsupported scaling operation in driver with return value %s\n",
+						      "Unsupported scaling operation (ret = %s)\n",
 						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 				}
 			}
@@ -1500,7 +1500,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							 igt_output_name(output));
 					}
 					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-						      "Unsupported scaling operation in driver with return value %s\n",
+						      "Unsupported scaling operation (ret = %s)\n",
 						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 				}
 			}
@@ -1526,7 +1526,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							 igt_output_name(output));
 					}
 					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-						      "Unsupported scaling operation in driver with return value %s\n",
+						      "Unsupported scaling operation (ret = %s)\n",
 						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 				}
 			}
@@ -1555,7 +1555,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
+							      "Unsupported scaling operation (ret = %s)\n",
 							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 					}
 				}
-- 
2.25.1

