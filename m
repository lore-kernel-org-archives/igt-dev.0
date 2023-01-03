Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1B010E038
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 06:44:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Jan 2023 12:16:58 +0530
Message-Id: <20230103064658.27655-5-swati2.sharma@intel.com>
In-Reply-To: <20230103064658.27655-1-swati2.sharma@intel.com>
References: <20230103064658.27655-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_atomic: Add flexibility to
 run tests on all pipes
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

Extra flag in command line is passed to run subtests on all pipe/output combinations.
However, by default execution is restricted to 1pipe/1output
combination.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 56 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 716045315..6272e2aa6 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -52,6 +52,8 @@
 
 IGT_TEST_DESCRIPTION("Test atomic modesetting API");
 
+static bool all_pipes = false;
+
 /* Common test data. */
 typedef struct {
 	igt_display_t display;
@@ -1295,7 +1297,23 @@ static bool has_zpos(igt_plane_t *plane)
 	return igt_plane_has_prop(plane, IGT_PLANE_ZPOS);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+		case 'e':
+			all_pipes = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char *help_str =
+	"  -e \tRun on all pipes. (By default subtests will run only on one pipe)\n";
+
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	enum pipe pipe = PIPE_NONE;
 	igt_output_t *output = NULL;
@@ -1324,7 +1342,8 @@ igt_main
 				plane_overlay(&data, output, overlay, format);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1337,7 +1356,8 @@ igt_main
 				plane_primary(&data);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1362,7 +1382,8 @@ igt_main
 								   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1379,7 +1400,8 @@ igt_main
 				plane_immutable_zpos(&data, output, pipe, n_planes);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1398,7 +1420,8 @@ igt_main
 				atomic_clear(&data, pipe, output);
 				test_only(&data, output, pipe, format);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1416,7 +1439,8 @@ igt_main
 				plane_cursor(&data, output, cursor);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1428,7 +1452,8 @@ igt_main
 				plane_invalid_params(&data, output);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1440,7 +1465,8 @@ igt_main
 				plane_invalid_params_fence(&data, output);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1452,7 +1478,8 @@ igt_main
 				crtc_invalid_params(&data, output);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1464,7 +1491,8 @@ igt_main
 				crtc_invalid_params_fence(&data, output);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1478,7 +1506,8 @@ igt_main
 				atomic_invalid_params(&data, output);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
@@ -1493,7 +1522,8 @@ igt_main
 				atomic_plane_damage(&data);
 				atomic_clear(&data, pipe, output);
 			}
-			break;
+			if (!all_pipes)
+				break;
 		}
 	}
 
-- 
2.25.1
