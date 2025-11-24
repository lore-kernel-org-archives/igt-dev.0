Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CA3CFD348
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 19:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DC210E260;
	Mon, 24 Nov 2025 19:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n92Ao/Sc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1372910E260
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764011162; x=1795547162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DQya3ZWpXpvSiGYQMwnkjOHeyparTBFY3+aiAK5qUbk=;
 b=n92Ao/Sc6pPa5ggqtR65sdat9uEXpSuNTO96my04ha/TpbC9pn6mdePG
 YoQjYU1ChAqds8rROjzVEEdRVZehEE0nMmZg1ds88SC54sjnNXbb54yDo
 vTzb80Du5LEwF+yxLpR6qSl7Wu4dRglRoRZ4WigIwfYQBzE3mzCfYisjs
 3/ap/piFKiYZLN1g37Q7lQ5fWtcQ+aiUCcuMtjbs91C+H5WePKhNvbrY0
 e5GeIbqvEqgV6evlvOWiCSSfALM2jzaq/7tSFrVa/mLqkzI0bMnvjxP1M
 LfsqcppoJZRSkbc0yYoxJ23pGYFrbxxx29WcSyzDW7xrBlOQxSJGceykX w==;
X-CSE-ConnectionGUID: WKMveHVpRdWBZEJqLhj60w==
X-CSE-MsgGUID: kZ6Thya3RNSK3zdrVWPs7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66051763"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66051763"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 11:06:01 -0800
X-CSE-ConnectionGUID: 3njdCXINT2mOW9c+XtKm7g==
X-CSE-MsgGUID: DKvXlQXqR8uOZGkxlyl+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192068647"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:05:59 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/kms_plane_scaling: Clarify skip on early -EINVAL
Date: Tue, 25 Nov 2025 00:42:59 +0530
Message-Id: <20251124191259.1115713-1-swati2.sharma@intel.com>
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

v2: -add func() instead of copy-paste(Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..a9a44fbf2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -562,6 +562,13 @@ static void cleanup_crtc(data_t *data)
 	cleanup_fbs(data);
 }
 
+static void skip_if_erange_or_einval(int ret)
+{
+	igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+		      "Unsupported scaling operation (ret = %s)\n",
+		      ret == -EINVAL ? "-EINVAL" : "-ERANGE");
+}
+
 static uint32_t
 check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 			     uint32_t pixel_format,
@@ -1385,9 +1392,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
 								 igt_output_name(output));
 						}
-						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
-							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						skip_if_erange_or_einval(ret);
 					}
 				}
 			}
@@ -1415,9 +1420,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
 								 igt_output_name(output));
 						}
-						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
-							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						skip_if_erange_or_einval(ret);
 					}
 				}
 			}
@@ -1445,9 +1448,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
 								 igt_output_name(output));
 						}
-						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
-							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						skip_if_erange_or_einval(ret);
 					}
 				}
 			}
@@ -1472,9 +1473,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						igt_info("Required scaling operation not supported on %s trying on next output\n",
 							 igt_output_name(output));
 					}
-					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-						      "Unsupported scaling operation in driver with return value %s\n",
-						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+					skip_if_erange_or_einval(ret);
 				}
 			}
 		}
@@ -1499,9 +1498,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						igt_info("Required scaling operation not supported on %s trying on next output\n",
 							 igt_output_name(output));
 					}
-					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-						      "Unsupported scaling operation in driver with return value %s\n",
-						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+					skip_if_erange_or_einval(ret);
 				}
 			}
 		}
@@ -1525,9 +1522,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						igt_info("Required scaling operation not supported on %s trying on next output\n",
 							 igt_output_name(output));
 					}
-					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-						      "Unsupported scaling operation in driver with return value %s\n",
-						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+					skip_if_erange_or_einval(ret);
 				}
 			}
 		}
@@ -1554,9 +1549,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							igt_info("Required scaling operation not supported on %s trying on next output\n",
 								 igt_output_name(output));
 						}
-						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
-							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						skip_if_erange_or_einval(ret);
 					}
 				}
 			}
-- 
2.25.1

