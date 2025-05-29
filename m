Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA8BC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 14:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3804510E73B;
	Thu, 29 May 2025 14:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvvYiWxU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600210E73B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528781; x=1780064781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M16q8X2ndN74zzSWxcXrbXplh154qQ6T20H/dIadU60=;
 b=BvvYiWxUtb4pAUGe+fWKUzu5aVQoGLEFv7zesPZUow59fxqRpy7h5WVY
 qKNAYxYbJZ5XXe8S4bphla9l9SNOS8Gbbxx/1yJphiBd8+136/42GD85z
 bsfFyHM1dxQmm5gcPQRHiEKxyXjfJ3NdccF/Wx6B1gf0WXo3Kh/sIhX/X
 m3+auVP/IgcgTzXS6XcKKd0bffd/njq3iq2dIHT048Blea3QUQuXCevX7
 +dQfVrVxbbQB1z8Uhn38f2yPI0/qa6KLXBar7/xZoDoTfQhxolpHya0KP
 q5/dBQzXGi6wRz/OIaRDF6YOvCIdTsuw5kC0TlW+PvwE4SXyew5vo7aMe A==;
X-CSE-ConnectionGUID: X7svCPwSSsuaSsr2/8IjXw==
X-CSE-MsgGUID: K7Fxr0RAQs2szFdZ0h2pqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50477336"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50477336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:26:20 -0700
X-CSE-ConnectionGUID: kKPEmx9sRb6jmjzTTv8uMQ==
X-CSE-MsgGUID: fWq8KxPiR72somfkw+avDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="166753104"
Received: from unknown (HELO adith-NUC7i7BNH.iind.intel.com) ([10.227.91.1])
 by fmviesa002.fm.intel.com with ESMTP; 29 May 2025 07:26:15 -0700
From: Adith Narein T <adith.narein.t@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, adithnarein1305@gmail.com,
 uma.shankar@intel.com, kamil.konieczny@intel.com, arun.r.murthy@intel.com,
 jani.saarinen@intel.com, ville.syrjala@intel.com, karthik.b.s@intel.com,
 pranay.samala@intel.com, suresh.kumar.kurmi@intel.com,
 Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t 3/4] tools/displaytop: Add DPCD register read support
Date: Thu, 29 May 2025 19:53:42 +0530
Message-ID: <20250529142401.2474-4-adith.narein.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529142401.2474-1-adith.narein.t@intel.com>
References: <20250529142401.2474-1-adith.narein.t@intel.com>
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

This patch introduces DPCD (DisplayPort Configuration Data) register
read support to the DisplayTop tool. It allows users to inspect the
state of connected DisplayPort sinks via a terminal-based UI.

The implementation uses the DRM subsystem’s drm_dp.h header to provide
official DPCD register addresses and bitfield definitions. This ensures
accurate decoding and interpretation of register contents.

Features included in this patch:

- DPCD register dump per connected DisplayPort output
- Bitfield parsing and labeling using drm_dp.h macros

Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
---
 tools/displaytop/README.md             |    1 +
 tools/displaytop/data/dpcd.json        | 4661 ++++++++++++++++++++++++
 tools/displaytop/include/data.h        |   13 +
 tools/displaytop/include/display.h     |    1 +
 tools/displaytop/include/populate.h    |    1 +
 tools/displaytop/include/utils.h       |    7 +-
 tools/displaytop/meson.build           |    9 +-
 tools/displaytop/src/data.c            |   15 +-
 tools/displaytop/src/display_DPCD.c    |  277 ++
 tools/displaytop/src/populate.c        |    1 +
 tools/displaytop/src/populate_DPCD.c   |  250 ++
 tools/displaytop/src/utils.c           |   66 +
 tools/displaytop/src/utils_registers.c |   97 +
 13 files changed, 5395 insertions(+), 4 deletions(-)
 create mode 100644 tools/displaytop/data/dpcd.json
 create mode 100644 tools/displaytop/src/display_DPCD.c
 create mode 100644 tools/displaytop/src/populate_DPCD.c
 create mode 100644 tools/displaytop/src/utils_registers.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
index 3e123ee04..70563ad63 100644
--- a/tools/displaytop/README.md
+++ b/tools/displaytop/README.md
@@ -8,6 +8,7 @@ A terminal-based tool for monitoring and debugging the display pipeline.
 - Dump feature for all the menus
 - Real-time display Configuration
 - view Live Display Debugfs in a terminal ui
+- Read & view DPCD register value & bitfield information
 
 ---
 
diff --git a/tools/displaytop/data/dpcd.json b/tools/displaytop/data/dpcd.json
new file mode 100644
index 000000000..c5d23023a
--- /dev/null
+++ b/tools/displaytop/data/dpcd.json
@@ -0,0 +1,4661 @@
+{
+    "DP_DPCD": {
+        "DP_DPCD_REV": {
+            "address": "0x000",
+            "bitfields": [
+                {
+                    "name": "DP_DPCD_REV_10",
+                    "value": "0x10"
+                },
+                {
+                    "name": "DP_DPCD_REV_11",
+                    "value": "0x11"
+                },
+                {
+                    "name": "DP_DPCD_REV_12",
+                    "value": "0x12"
+                },
+                {
+                    "name": "DP_DPCD_REV_13",
+                    "value": "0x13"
+                },
+                {
+                    "name": "DP_DPCD_REV_14",
+                    "value": "0x14"
+                }
+            ]
+        },
+        "DP_DPCD_MAX_ADD": {
+            "address": "0xfffff"
+        }
+    },
+    "DP_MAX": {
+        "DP_MAX_LINK_RATE": {
+            "address": "0x001"
+        },
+        "DP_MAX_LANE_COUNT": {
+            "address": "0x002",
+            "bitfields": [
+                {
+                    "name": "DP_MAX_LANE_COUNT_MASK",
+                    "value": "0x1f"
+                },
+                {
+                    "name": "DP_TPS3_SUPPORTED",
+                    "value": "(1 << 6) /* 1.2 */"
+                },
+                {
+                    "name": "DP_ENHANCED_FRAME_CAP",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_MAX_DOWNSPREAD": {
+            "address": "0x003",
+            "bitfields": [
+                {
+                    "name": "DP_MAX_DOWNSPREAD_0_5",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_STREAM_REGENERATION_STATUS_CAP",
+                    "value": "(1 << 1) /* 2.0 */"
+                },
+                {
+                    "name": "DP_NO_AUX_HANDSHAKE_LINK_TRAINING",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_TPS4_SUPPORTED",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_MAX_DOWNSTREAM_PORTS": {
+            "address": "0x10"
+        },
+        "DP_MAX_LINK_RATE_PHY_REPEATER": {
+            "address": "0xf0001"
+        },
+        "DP_MAX_LANE_COUNT_PHY_REPEATER": {
+            "address": "0xf0004"
+        }
+    },
+    "DP_NORP": {
+        "address": "0x004"
+    },
+    "DP_DOWNSTREAMPORT_PRESENT": {
+        "address": "0x005",
+        "bitfields": [
+            {
+                "name": "DP_DWN_STRM_PORT_PRESENT",
+                "value": "(1 << 0)"
+            },
+            {
+                "name": "DP_DWN_STRM_PORT_TYPE_MASK",
+                "value": "0x06"
+            },
+            {
+                "name": "DP_DWN_STRM_PORT_TYPE_DP",
+                "value": "(0 << 1)"
+            },
+            {
+                "name": "DP_DWN_STRM_PORT_TYPE_ANALOG",
+                "value": "(1 << 1)"
+            },
+            {
+                "name": "DP_DWN_STRM_PORT_TYPE_TMDS",
+                "value": "(2 << 1)"
+            },
+            {
+                "name": "DP_DWN_STRM_PORT_TYPE_OTHER",
+                "value": "(3 << 1)"
+            },
+            {
+                "name": "DP_FORMAT_CONVERSION",
+                "value": "(1 << 3)"
+            },
+            {
+                "name": "DP_DETAILED_CAP_INFO_AVAILABLE",
+                "value": "(1 << 4) /* DPI */"
+            }
+        ]
+    },
+    "DP_MAIN": {
+        "DP_MAIN_LINK_CHANNEL_CODING": {
+            "address": "0x006",
+            "bitfields": [
+                {
+                    "name": "DP_CAP_ANSI_8B10B",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_CAP_ANSI_128B132B",
+                    "value": "(1 << 1) /* 2.0 */"
+                }
+            ]
+        },
+        "DP_MAIN_LINK_CHANNEL_CODING_SET": {
+            "address": "0x108",
+            "bitfields": [
+                {
+                    "name": "DP_SET_ANSI_8B10B",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_SET_ANSI_128B132B",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER": {
+            "address": "0xf0006",
+            "bitfields": [
+                {
+                    "name": "DP_PHY_REPEATER_128B132B_SUPPORTED",
+                    "value": "(1 << 0)"
+                }
+            ]
+        }
+    },
+    "DP_DOWN_STREAM_PORT_COUNT": {
+        "address": "0x007",
+        "bitfields": [
+            {
+                "name": "DP_PORT_COUNT_MASK",
+                "value": "0x0f"
+            },
+            {
+                "name": "DP_MSA_TIMING_PAR_IGNORED",
+                "value": "(1 << 6) /* eDP */"
+            },
+            {
+                "name": "DP_OUI_SUPPORT",
+                "value": "(1 << 7)"
+            }
+        ]
+    },
+    "DP_RECEIVE": {
+        "DP_RECEIVE_PORT_0_CAP_0": {
+            "address": "0x008",
+            "bitfields": [
+                {
+                    "name": "DP_LOCAL_EDID_PRESENT",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_ASSOCIATED_TO_PRECEDING_PORT",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_HBLANK_EXPANSION_CAPABLE",
+                    "value": "(1 << 3)"
+                }
+            ]
+        },
+        "DP_RECEIVE_PORT_0_BUFFER_SIZE": {
+            "address": "0x009"
+        },
+        "DP_RECEIVE_PORT_1_CAP_0": {
+            "address": "0x00a"
+        },
+        "DP_RECEIVE_PORT_1_BUFFER_SIZE": {
+            "address": "0x00b"
+        }
+    },
+    "DP_I2C": {
+        "DP_I2C_SPEED_CAP": {
+            "address": "0x00c",
+            "bitfields": [
+                {
+                    "name": "DP_I2C_SPEED_1K",
+                    "value": "0x01"
+                },
+                {
+                    "name": "DP_I2C_SPEED_5K",
+                    "value": "0x02"
+                },
+                {
+                    "name": "DP_I2C_SPEED_10K",
+                    "value": "0x04"
+                },
+                {
+                    "name": "DP_I2C_SPEED_100K",
+                    "value": "0x08"
+                },
+                {
+                    "name": "DP_I2C_SPEED_400K",
+                    "value": "0x10"
+                },
+                {
+                    "name": "DP_I2C_SPEED_1M",
+                    "value": "0x20"
+                }
+            ]
+        },
+        "DP_I2C_SPEED_CONTROL_STATUS": {
+            "address": "0x109"
+        }
+    },
+    "DP_EDP": {
+        "DP_EDP_CONFIGURATION_CAP": {
+            "address": "0x00d",
+            "bitfields": [
+                {
+                    "name": "DP_ALTERNATE_SCRAMBLER_RESET_CAP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_FRAMING_CHANGE_CAP",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_DPCD_DISPLAY_CONTROL_CAPABLE",
+                    "value": "(1 << 3) /* edp v1.2 or higher */"
+                }
+            ]
+        },
+        "DP_EDP_CONFIGURATION_SET": {
+            "address": "0x10a",
+            "bitfields": [
+                {
+                    "name": "DP_ALTERNATE_SCRAMBLER_RESET_ENABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_FRAMING_CHANGE_ENABLE",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PANEL_SELF_TEST_ENABLE",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_EDP_DPCD_REV": {
+            "address": "0x700",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_11",
+                    "value": "0x00"
+                },
+                {
+                    "name": "DP_EDP_12",
+                    "value": "0x01"
+                },
+                {
+                    "name": "DP_EDP_13",
+                    "value": "0x02"
+                },
+                {
+                    "name": "DP_EDP_14",
+                    "value": "0x03"
+                },
+                {
+                    "name": "DP_EDP_14a",
+                    "value": "0x04    /* eDP 1.4a */"
+                },
+                {
+                    "name": "DP_EDP_14b",
+                    "value": "0x05    /* eDP 1.4b */"
+                },
+                {
+                    "name": "DP_EDP_15",
+                    "value": "0x06    /* eDP 1.5 */"
+                }
+            ]
+        },
+        "DP_EDP_GENERAL_CAP_1": {
+            "address": "0x701",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_PIN_ENABLE_CAP",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_AUX_ENABLE_CAP",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_EDP_PANEL_SELF_TEST_PIN_ENABLE_CAP",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_EDP_PANEL_SELF_TEST_AUX_ENABLE_CAP",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_EDP_FRC_ENABLE_CAP",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_EDP_COLOR_ENGINE_CAP",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_EDP_SET_POWER_CAP",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_EDP_BACKLIGHT_ADJUSTMENT_CAP": {
+            "address": "0x702",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_AUX_PWM_PRODUCT_CAP",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_FREQ_PWM_PIN_PASSTHRU_CAP",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_EDP_DYNAMIC_BACKLIGHT_CAP",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_EDP_VBLANK_BACKLIGHT_UPDATE_CAP",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_EDP_GENERAL_CAP_2": {
+            "address": "0x703",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_OVERDRIVE_ENGINE_ENABLED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE",
+                    "value": "(1 << 4)"
+                }
+            ]
+        },
+        "DP_EDP_GENERAL_CAP_3": {
+            "address": "0x704",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_X_REGION_CAP_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_EDP_X_REGION_CAP_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_EDP_Y_REGION_CAP_MASK",
+                    "value": "(0xf << 4)"
+                },
+                {
+                    "name": "DP_EDP_Y_REGION_CAP_SHIFT",
+                    "value": "4"
+                }
+            ]
+        },
+        "DP_EDP_DISPLAY_CONTROL_REGISTER": {
+            "address": "0x720",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_BACKLIGHT_ENABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BLACK_VIDEO_ENABLE",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_EDP_FRC_ENABLE",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_EDP_COLOR_ENGINE_ENABLE",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_EDP_VBLANK_BACKLIGHT_UPDATE_ENABLE",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_EDP_BACKLIGHT_MODE_SET_REGISTER": {
+            "address": "0x721",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_BACKLIGHT_CONTROL_MODE_MASK",
+                    "value": "(3 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_CONTROL_MODE_PWM",
+                    "value": "(0 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_CONTROL_MODE_PRESET",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD",
+                    "value": "(2 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT",
+                    "value": "(3 << 0)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_FREQ_PWM_PIN_PASSTHRU_ENABLE",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_EDP_DYNAMIC_BACKLIGHT_ENABLE",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_EDP_REGIONAL_BACKLIGHT_ENABLE",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_EDP_UPDATE_REGION_BRIGHTNESS",
+                    "value": "(1 << 6) /* eDP 1.4 */"
+                },
+                {
+                    "name": "DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_EDP_BACKLIGHT_BRIGHTNESS_MSB": {
+            "address": "0x722"
+        },
+        "DP_EDP_BACKLIGHT_BRIGHTNESS_LSB": {
+            "address": "0x723"
+        },
+        "DP_EDP_PWMGEN_BIT_COUNT": {
+            "address": "0x724"
+        },
+        "DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN": {
+            "address": "0x725"
+        },
+        "DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX": {
+            "address": "0x726",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_PWMGEN_BIT_COUNT_MASK",
+                    "value": "(0x1f << 0)"
+                }
+            ]
+        },
+        "DP_EDP_BACKLIGHT_CONTROL_STATUS": {
+            "address": "0x727"
+        },
+        "DP_EDP_BACKLIGHT_FREQ_SET": {
+            "address": "0x728",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_BACKLIGHT_FREQ_BASE_KHZ",
+                    "value": "27000"
+                }
+            ]
+        },
+        "DP_EDP_BACKLIGHT_FREQ_CAP_MIN_MSB": {
+            "address": "0x72a"
+        },
+        "DP_EDP_BACKLIGHT_FREQ_CAP_MIN_MID": {
+            "address": "0x72b"
+        },
+        "DP_EDP_BACKLIGHT_FREQ_CAP_MIN_LSB": {
+            "address": "0x72c"
+        },
+        "DP_EDP_BACKLIGHT_FREQ_CAP_MAX_MSB": {
+            "address": "0x72d"
+        },
+        "DP_EDP_BACKLIGHT_FREQ_CAP_MAX_MID": {
+            "address": "0x72e"
+        },
+        "DP_EDP_BACKLIGHT_FREQ_CAP_MAX_LSB": {
+            "address": "0x72f"
+        },
+        "DP_EDP_DBC_MINIMUM_BRIGHTNESS_SET": {
+            "address": "0x732"
+        },
+        "DP_EDP_DBC_MAXIMUM_BRIGHTNESS_SET": {
+            "address": "0x733"
+        },
+        "DP_EDP_PANEL_TARGET_LUMINANCE_VALUE": {
+            "address": "0x734"
+        },
+        "DP_EDP_REGIONAL_BACKLIGHT_BASE": {
+            "address": "0x740"
+        },
+        "DP_EDP_REGIONAL_BACKLIGHT_0": {
+            "address": "0x741"
+        },
+        "DP_EDP_MSO_LINK_CAPABILITIES": {
+            "address": "0x7a4",
+            "bitfields": [
+                {
+                    "name": "DP_EDP_MSO_NUMBER_OF_LINKS_MASK",
+                    "value": "(7 << 0)"
+                },
+                {
+                    "name": "DP_EDP_MSO_NUMBER_OF_LINKS_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_EDP_MSO_INDEPENDENT_LINK_BIT",
+                    "value": "(1 << 3)"
+                }
+            ]
+        }
+    },
+    "DP_TRAINING": {
+        "DP_TRAINING_AUX_RD_INTERVAL": {
+            "address": "0x00e",
+            "bitfields": [
+                {
+                    "name": "DP_TRAINING_AUX_RD_MASK",
+                    "value": "0x7F    /* DP 1.3 */"
+                },
+                {
+                    "name": "DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT",
+                    "value": "(1 << 7) /* DP 1.3 */"
+                }
+            ]
+        },
+        "DP_TRAINING_PATTERN_SET": {
+            "address": "0x102",
+            "bitfields": [
+                {
+                    "name": "DP_TRAINING_PATTERN_DISABLE",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_1",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_2",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_2_CDS",
+                    "value": "3\t    /* 2.0 E11 */"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_3",
+                    "value": "3\t    /* 1.2 */"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_4",
+                    "value": "7       /* 1.4 */"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_MASK",
+                    "value": "0x3"
+                },
+                {
+                    "name": "DP_TRAINING_PATTERN_MASK_1_4",
+                    "value": "0xf"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_11_DISABLE",
+                    "value": "(0 << 2)"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_11_D10_2",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_11_ERROR_RATE",
+                    "value": "(2 << 2)"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_11_PRBS7",
+                    "value": "(3 << 2)"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_11_MASK",
+                    "value": "(3 << 2)"
+                },
+                {
+                    "name": "DP_RECOVERED_CLOCK_OUT_EN",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_LINK_SCRAMBLING_DISABLE",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_SYMBOL_ERROR_COUNT_BOTH",
+                    "value": "(0 << 6)"
+                },
+                {
+                    "name": "DP_SYMBOL_ERROR_COUNT_DISPARITY",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_SYMBOL_ERROR_COUNT_SYMBOL",
+                    "value": "(2 << 6)"
+                },
+                {
+                    "name": "DP_SYMBOL_ERROR_COUNT_MASK",
+                    "value": "(3 << 6)"
+                }
+            ]
+        },
+        "DP_TRAINING_LANE0_SET": {
+            "address": "0x103"
+        },
+        "DP_TRAINING_LANE1_SET": {
+            "address": "0x104"
+        },
+        "DP_TRAINING_LANE2_SET": {
+            "address": "0x105"
+        },
+        "DP_TRAINING_LANE3_SET": {
+            "address": "0x106",
+            "bitfields": [
+                {
+                    "name": "DP_TRAIN_VOLTAGE_SWING_MASK",
+                    "value": "0x3"
+                },
+                {
+                    "name": "DP_TRAIN_VOLTAGE_SWING_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_TRAIN_MAX_SWING_REACHED",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_TRAIN_VOLTAGE_SWING_LEVEL_0",
+                    "value": "(0 << 0)"
+                },
+                {
+                    "name": "DP_TRAIN_VOLTAGE_SWING_LEVEL_1",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_TRAIN_VOLTAGE_SWING_LEVEL_2",
+                    "value": "(2 << 0)"
+                },
+                {
+                    "name": "DP_TRAIN_VOLTAGE_SWING_LEVEL_3",
+                    "value": "(3 << 0)"
+                },
+                {
+                    "name": "DP_TRAIN_PRE_EMPHASIS_MASK",
+                    "value": "(3 << 3)"
+                },
+                {
+                    "name": "DP_TRAIN_PRE_EMPH_LEVEL_0",
+                    "value": "(0 << 3)"
+                },
+                {
+                    "name": "DP_TRAIN_PRE_EMPH_LEVEL_1",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_TRAIN_PRE_EMPH_LEVEL_2",
+                    "value": "(2 << 3)"
+                },
+                {
+                    "name": "DP_TRAIN_PRE_EMPH_LEVEL_3",
+                    "value": "(3 << 3)"
+                },
+                {
+                    "name": "DP_TRAIN_PRE_EMPHASIS_SHIFT",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_TRAIN_MAX_PRE_EMPHASIS_REACHED",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_TX_FFE_PRESET_VALUE_MASK",
+                    "value": "(0xf << 0) /* 2.0 128b/132b Link Layer */"
+                }
+            ]
+        },
+        "DP_TRAINING_LANE0_1_SET2": {
+            "address": "0x10f"
+        },
+        "DP_TRAINING_LANE2_3_SET2": {
+            "address": "0x110",
+            "bitfields": [
+                {
+                    "name": "DP_LANE02_POST_CURSOR2_SET_MASK",
+                    "value": "(3 << 0)"
+                },
+                {
+                    "name": "DP_LANE02_MAX_POST_CURSOR2_REACHED",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_LANE13_POST_CURSOR2_SET_MASK",
+                    "value": "(3 << 4)"
+                },
+                {
+                    "name": "DP_LANE13_MAX_POST_CURSOR2_REACHED",
+                    "value": "(1 << 6)"
+                }
+            ]
+        },
+        "DP_TRAINING_PATTERN_SET_PHY_REPEATER1": {
+            "address": "0xf0010"
+        },
+        "DP_TRAINING_LANE0_SET_PHY_REPEATER1": {
+            "address": "0xf0011"
+        },
+        "DP_TRAINING_LANE1_SET_PHY_REPEATER1": {
+            "address": "0xf0012"
+        },
+        "DP_TRAINING_LANE2_SET_PHY_REPEATER1": {
+            "address": "0xf0013"
+        },
+        "DP_TRAINING_LANE3_SET_PHY_REPEATER1": {
+            "address": "0xf0014"
+        },
+        "DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1": {
+            "address": "0xf0020"
+        }
+    },
+    "DP_ADAPTER": {
+        "DP_ADAPTER_CAP": {
+            "address": "0x00f",
+            "bitfields": [
+                {
+                    "name": "DP_FORCE_LOAD_SENSE_CAP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_ALTERNATE_I2C_PATTERN_CAP",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_ADAPTER_CTRL": {
+            "address": "0x1a0",
+            "bitfields": [
+                {
+                    "name": "DP_ADAPTER_CTRL_FORCE_LOAD_SENSE",
+                    "value": "(1 << 0)"
+                }
+            ]
+        }
+    },
+    "DP_SUPPORTED_LINK_RATES": {
+        "address": "0x010",
+        "bitfields": [
+            {
+                "name": "DP_MAX_SUPPORTED_RATES",
+                "value": "8\t    /* 16-bit little-endian */"
+            }
+        ]
+    },
+    "DP_FAUX_CAP": {
+        "address": "0x020",
+        "bitfields": [
+            {
+                "name": "DP_FAUX_CAP_1",
+                "value": "(1 << 0)"
+            }
+        ]
+    },
+    "DP_SINK": {
+        "DP_SINK_VIDEO_FALLBACK_FORMATS": {
+            "address": "0x020",
+            "bitfields": [
+                {
+                    "name": "DP_FALLBACK_1024x768_60HZ_24BPP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_FALLBACK_1280x720_60HZ_24BPP",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_FALLBACK_1920x1080_60HZ_24BPP",
+                    "value": "(1 << 2)"
+                }
+            ]
+        },
+        "DP_SINK_DEVICE_AUX_FRAME_SYNC_CAP": {
+            "address": "0x02f",
+            "bitfields": [
+                {
+                    "name": "DP_AUX_FRAME_SYNC_CAP",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_SINK_DEVICE_AUX_FRAME_SYNC_CONF": {
+            "address": "0x117",
+            "bitfields": [
+                {
+                    "name": "DP_AUX_FRAME_SYNC_ENABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_IRQ_HPD_ENABLE",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_SINK_COUNT": {
+            "address": "0x200",
+            "bitfields": [
+                {
+                    "name": "DP_SINK_CP_READY",
+                    "value": "(1 << 6)"
+                }
+            ]
+        },
+        "DP_SINK_STATUS": {
+            "address": "0x205",
+            "bitfields": [
+                {
+                    "name": "DP_RECEIVE_PORT_0_STATUS",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_RECEIVE_PORT_1_STATUS",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_STREAM_REGENERATION_STATUS",
+                    "value": "(1 << 2) /* 2.0 */"
+                },
+                {
+                    "name": "DP_INTRA_HOP_AUX_REPLY_INDICATION",
+                    "value": "(1 << 3) /* 2.0 */"
+                }
+            ]
+        },
+        "DP_SINK_OUI": {
+            "address": "0x400"
+        },
+        "DP_SINK_COUNT_ESI": {
+            "address": "0x2002"
+        },
+        "DP_SINK_STATUS_ESI": {
+            "address": "0x200f"
+        },
+        "DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS": {
+            "address": "0x2022",
+            "bitfields": [
+                {
+                    "name": "DP_SINK_DEVICE_PANEL_REPLAY_STATUS_MASK",
+                    "value": "(7 << 0)"
+                },
+                {
+                    "name": "DP_SINK_FRAME_LOCKED_SHIFT",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_SINK_FRAME_LOCKED_MASK",
+                    "value": "(3 << 3)"
+                },
+                {
+                    "name": "DP_SINK_FRAME_LOCKED_STATUS_VALID_SHIFT",
+                    "value": "5"
+                },
+                {
+                    "name": "DP_SINK_FRAME_LOCKED_STATUS_VALID_MASK",
+                    "value": "(1 << 5)"
+                }
+            ]
+        },
+        "DP_SINK_EVENT_NOTIFY": {
+            "address": "0x30"
+        }
+    },
+    "DP_MSTM": {
+        "DP_MSTM_CAP": {
+            "address": "0x021",
+            "bitfields": [
+                {
+                    "name": "DP_MST_CAP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_SINGLE_STREAM_SIDEBAND_MSG",
+                    "value": "(1 << 1) /* 2.0 */"
+                }
+            ]
+        },
+        "DP_MSTM_CTRL": {
+            "address": "0x111",
+            "bitfields": [
+                {
+                    "name": "DP_MST_EN",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_UP_REQ_EN",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_UPSTREAM_IS_SRC",
+                    "value": "(1 << 2)"
+                }
+            ]
+        }
+    },
+    "DP_NUMBER_OF_AUDIO_ENDPOINTS": {
+        "address": "0x022"
+    },
+    "DP_AV_GRANULARITY": {
+        "address": "0x023",
+        "bitfields": [
+            {
+                "name": "DP_AG_FACTOR_MASK",
+                "value": "(0xf << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_3MS",
+                "value": "(0 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_2MS",
+                "value": "(1 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_1MS",
+                "value": "(2 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_500US",
+                "value": "(3 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_200US",
+                "value": "(4 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_100US",
+                "value": "(5 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_10US",
+                "value": "(6 << 0)"
+            },
+            {
+                "name": "DP_AG_FACTOR_1US",
+                "value": "(7 << 0)"
+            },
+            {
+                "name": "DP_VG_FACTOR_MASK",
+                "value": "(0xf << 4)"
+            },
+            {
+                "name": "DP_VG_FACTOR_3MS",
+                "value": "(0 << 4)"
+            },
+            {
+                "name": "DP_VG_FACTOR_2MS",
+                "value": "(1 << 4)"
+            },
+            {
+                "name": "DP_VG_FACTOR_1MS",
+                "value": "(2 << 4)"
+            },
+            {
+                "name": "DP_VG_FACTOR_500US",
+                "value": "(3 << 4)"
+            },
+            {
+                "name": "DP_VG_FACTOR_200US",
+                "value": "(4 << 4)"
+            },
+            {
+                "name": "DP_VG_FACTOR_100US",
+                "value": "(5 << 4)"
+            }
+        ]
+    },
+    "DP_AUD": {
+        "DP_AUD_DEC_LAT0": {
+            "address": "0x024"
+        },
+        "DP_AUD_DEC_LAT1": {
+            "address": "0x025"
+        },
+        "DP_AUD_PP_LAT0": {
+            "address": "0x026"
+        },
+        "DP_AUD_PP_LAT1": {
+            "address": "0x027"
+        },
+        "DP_AUD_DEL_INS0": {
+            "address": "0x02b"
+        },
+        "DP_AUD_DEL_INS1": {
+            "address": "0x02c"
+        },
+        "DP_AUD_DEL_INS2": {
+            "address": "0x02d"
+        }
+    },
+    "DP_VID": {
+        "DP_VID_INTER_LAT": {
+            "address": "0x028"
+        },
+        "DP_VID_PROG_LAT": {
+            "address": "0x029"
+        }
+    },
+    "DP_REP_LAT": {
+        "address": "0x02a"
+    },
+    "DP_RECEIVER": {
+        "DP_RECEIVER_ALPM_CAP": {
+            "address": "0x02e",
+            "bitfields": [
+                {
+                    "name": "DP_ALPM_CAP",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_ALPM_PM_STATE_2A_SUPPORT",
+                    "value": "(1 << 1) /* eDP 1.5 */"
+                },
+                {
+                    "name": "DP_ALPM_AUX_LESS_CAP",
+                    "value": "(1 << 2) /* eDP 1.5 */"
+                }
+            ]
+        },
+        "DP_RECEIVER_ALPM_CONFIG": {
+            "address": "0x116",
+            "bitfields": [
+                {
+                    "name": "DP_ALPM_ENABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE",
+                    "value": "(1 << 1) /* eDP 1.5 */"
+                },
+                {
+                    "name": "DP_ALPM_MODE_AUX_LESS",
+                    "value": "(1 << 2) /* eDP 1.5 */"
+                }
+            ]
+        },
+        "DP_RECEIVER_ALPM_STATUS": {
+            "address": "0x200b",
+            "bitfields": [
+                {
+                    "name": "DP_ALPM_LOCK_TIMEOUT_ERROR",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_RECEIVER_CAP_SIZE": {
+            "address": "0xf"
+        }
+    },
+    "DP_GUID": {
+        "address": "0x030"
+    },
+    "DP_DSC": {
+        "DP_DSC_SUPPORT": {
+            "address": "0x060",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_DECOMPRESSION_IS_SUPPORTED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_PASSTHROUGH_IS_SUPPORTED",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_COMP_TO_COMP",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_DSC_DYNAMIC_PPS_UPDATE_SUPPORT_UNCOMP_TO_COMP",
+                    "value": "(1 << 3)"
+                }
+            ]
+        },
+        "DP_DSC_REV": {
+            "address": "0x061",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_MAJOR_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_DSC_MINOR_MASK",
+                    "value": "(0xf << 4)"
+                },
+                {
+                    "name": "DP_DSC_MAJOR_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_DSC_MINOR_SHIFT",
+                    "value": "4"
+                }
+            ]
+        },
+        "DP_DSC_RC_BUF_BLK_SIZE": {
+            "address": "0x062",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_RC_BUF_BLK_SIZE_1",
+                    "value": "0x0"
+                },
+                {
+                    "name": "DP_DSC_RC_BUF_BLK_SIZE_4",
+                    "value": "0x1"
+                },
+                {
+                    "name": "DP_DSC_RC_BUF_BLK_SIZE_16",
+                    "value": "0x2"
+                },
+                {
+                    "name": "DP_DSC_RC_BUF_BLK_SIZE_64",
+                    "value": "0x3"
+                }
+            ]
+        },
+        "DP_DSC_RC_BUF_SIZE": {
+            "address": "0x063"
+        },
+        "DP_DSC_SLICE_CAP_1": {
+            "address": "0x064",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_1_PER_DP_DSC_SINK",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_2_PER_DP_DSC_SINK",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_DSC_4_PER_DP_DSC_SINK",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_DSC_6_PER_DP_DSC_SINK",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_DSC_8_PER_DP_DSC_SINK",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_DSC_10_PER_DP_DSC_SINK",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_DSC_12_PER_DP_DSC_SINK",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_DSC_LINE_BUF_BIT_DEPTH": {
+            "address": "0x065",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_9",
+                    "value": "0x0"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_10",
+                    "value": "0x1"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_11",
+                    "value": "0x2"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_12",
+                    "value": "0x3"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_13",
+                    "value": "0x4"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_14",
+                    "value": "0x5"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_15",
+                    "value": "0x6"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_16",
+                    "value": "0x7"
+                },
+                {
+                    "name": "DP_DSC_LINE_BUF_BIT_DEPTH_8",
+                    "value": "0x8"
+                }
+            ]
+        },
+        "DP_DSC_BLK_PREDICTION_SUPPORT": {
+            "address": "0x066",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_BLK_PREDICTION_IS_SUPPORTED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_RGB_COLOR_CONV_BYPASS_SUPPORT",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_DSC_MAX_BITS_PER_PIXEL_LOW": {
+            "address": "0x067"
+        },
+        "DP_DSC_MAX_BITS_PER_PIXEL_HI": {
+            "address": "0x068",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_MAX_BITS_PER_PIXEL_HI_MASK",
+                    "value": "(0x3 << 0)"
+                },
+                {
+                    "name": "DP_DSC_MAX_BPP_DELTA_VERSION_MASK",
+                    "value": "(0x3 << 5)\t/* eDP 1.5 & DP 2.0 */"
+                },
+                {
+                    "name": "DP_DSC_MAX_BPP_DELTA_AVAILABILITY",
+                    "value": "(1 << 7)\t/* eDP 1.5 & DP 2.0 */"
+                }
+            ]
+        },
+        "DP_DSC_DEC_COLOR_FORMAT_CAP": {
+            "address": "0x069",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_RGB",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_YCbCr444",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_DSC_YCbCr422_Simple",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_DSC_YCbCr422_Native",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_DSC_YCbCr420_Native",
+                    "value": "(1 << 4)"
+                }
+            ]
+        },
+        "DP_DSC_DEC_COLOR_DEPTH_CAP": {
+            "address": "0x06A",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_8_BPC",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_DSC_10_BPC",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_DSC_12_BPC",
+                    "value": "(1 << 3)"
+                }
+            ]
+        },
+        "DP_DSC_PEAK_THROUGHPUT": {
+            "address": "0x06B",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_UNSUPPORTED",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_340",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_400",
+                    "value": "(2 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_450",
+                    "value": "(3 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_500",
+                    "value": "(4 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_550",
+                    "value": "(5 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_600",
+                    "value": "(6 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_650",
+                    "value": "(7 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_700",
+                    "value": "(8 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_750",
+                    "value": "(9 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_800",
+                    "value": "(10 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_850",
+                    "value": "(11 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_900",
+                    "value": "(12 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_950",
+                    "value": "(13 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_1000",
+                    "value": "(14 << 0)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_0_170",
+                    "value": "(15 << 0) /* 1.4a */"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_MASK",
+                    "value": "(0xf << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_SHIFT",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_UNSUPPORTED",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_340",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_400",
+                    "value": "(2 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_450",
+                    "value": "(3 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_500",
+                    "value": "(4 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_550",
+                    "value": "(5 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_600",
+                    "value": "(6 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_650",
+                    "value": "(7 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_700",
+                    "value": "(8 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_750",
+                    "value": "(9 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_800",
+                    "value": "(10 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_850",
+                    "value": "(11 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_900",
+                    "value": "(12 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_950",
+                    "value": "(13 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_1000",
+                    "value": "(14 << 4)"
+                },
+                {
+                    "name": "DP_DSC_THROUGHPUT_MODE_1_170",
+                    "value": "(15 << 4)"
+                }
+            ]
+        },
+        "DP_DSC_MAX_SLICE_WIDTH": {
+            "address": "0x06C",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_MIN_SLICE_WIDTH_VALUE",
+                    "value": "2560"
+                },
+                {
+                    "name": "DP_DSC_SLICE_WIDTH_MULTIPLIER",
+                    "value": "320"
+                }
+            ]
+        },
+        "DP_DSC_SLICE_CAP_2": {
+            "address": "0x06D",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_16_PER_DP_DSC_SINK",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_20_PER_DP_DSC_SINK",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_DSC_24_PER_DP_DSC_SINK",
+                    "value": "(1 << 2)"
+                }
+            ]
+        },
+        "DP_DSC_BITS_PER_PIXEL_INC": {
+            "address": "0x06F",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK",
+                    "value": "0x1f"
+                },
+                {
+                    "name": "DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK",
+                    "value": "0xe0"
+                },
+                {
+                    "name": "DP_DSC_BITS_PER_PIXEL_1_16",
+                    "value": "0x0"
+                },
+                {
+                    "name": "DP_DSC_BITS_PER_PIXEL_1_8",
+                    "value": "0x1"
+                },
+                {
+                    "name": "DP_DSC_BITS_PER_PIXEL_1_4",
+                    "value": "0x2"
+                },
+                {
+                    "name": "DP_DSC_BITS_PER_PIXEL_1_2",
+                    "value": "0x3"
+                },
+                {
+                    "name": "DP_DSC_BITS_PER_PIXEL_1_1",
+                    "value": "0x4"
+                }
+            ]
+        },
+        "DP_DSC_BRANCH_OVERALL_THROUGHPUT_0": {
+            "address": "0x0a0"
+        },
+        "DP_DSC_BRANCH_OVERALL_THROUGHPUT_1": {
+            "address": "0x0a1"
+        },
+        "DP_DSC_BRANCH_MAX_LINE_WIDTH": {
+            "address": "0x0a2"
+        },
+        "DP_DSC_ENABLE": {
+            "address": "0x160",
+            "bitfields": [
+                {
+                    "name": "DP_DECOMPRESSION_EN",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_PASSTHROUGH_EN",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_DSC_CONFIGURATION": {
+            "address": "0x161"
+        },
+        "DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT": {
+            "address": "0x2260",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_DECODER_COUNT_MASK",
+                    "value": "(0b111 << 5)"
+                },
+                {
+                    "name": "DP_DSC_DECODER_COUNT_SHIFT",
+                    "value": "5"
+                }
+            ]
+        },
+        "DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0": {
+            "address": "0x2270",
+            "bitfields": [
+                {
+                    "name": "DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK",
+                    "value": "(0b111 << 1)"
+                },
+                {
+                    "name": "DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT",
+                    "value": "1"
+                }
+            ]
+        },
+        "DP_DSC_RECEIVER_CAP_SIZE": {
+            "address": "0x10",
+            "bitfields": [
+                {
+                    "name": "EDP_PSR_RECEIVER_CAP_SIZE",
+                    "value": "2"
+                },
+                {
+                    "name": "EDP_DISPLAY_CTL_CAP_SIZE",
+                    "value": "5"
+                },
+                {
+                    "name": "DP_LTTPR_COMMON_CAP_SIZE",
+                    "value": "8"
+                },
+                {
+                    "name": "DP_LTTPR_PHY_CAP_SIZE",
+                    "value": "3"
+                }
+            ]
+        }
+    },
+    "DP_PSR": {
+        "DP_PSR_SUPPORT": {
+            "address": "0x070",
+            "bitfields": [
+                {
+                    "name": "DP_PSR_IS_SUPPORTED",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PSR2_IS_SUPPORTED",
+                    "value": "2\t    /* eDP 1.4 */"
+                },
+                {
+                    "name": "DP_PSR2_WITH_Y_COORD_IS_SUPPORTED",
+                    "value": "3\t    /* eDP 1.4a */"
+                },
+                {
+                    "name": "DP_PSR2_WITH_Y_COORD_ET_SUPPORTED",
+                    "value": "4\t    /* eDP 1.5, adopted eDP 1.4b SCR */"
+                }
+            ]
+        },
+        "DP_PSR_CAPS": {
+            "address": "0x071",
+            "bitfields": [
+                {
+                    "name": "DP_PSR_NO_TRAIN_ON_EXIT",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_330",
+                    "value": "(0 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_275",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_220",
+                    "value": "(2 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_165",
+                    "value": "(3 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_110",
+                    "value": "(4 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_55",
+                    "value": "(5 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_0",
+                    "value": "(6 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_MASK",
+                    "value": "(7 << 1)"
+                },
+                {
+                    "name": "DP_PSR_SETUP_TIME_SHIFT",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PSR2_SU_Y_COORDINATE_REQUIRED",
+                    "value": "(1 << 4)  /* eDP 1.4a */"
+                },
+                {
+                    "name": "DP_PSR2_SU_GRANULARITY_REQUIRED",
+                    "value": "(1 << 5)  /* eDP 1.4b */"
+                },
+                {
+                    "name": "DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED",
+                    "value": "(1 << 6)/* eDP 1.5, adopted eDP 1.4b SCR */"
+                }
+            ]
+        },
+        "DP_PSR_EN_CFG": {
+            "address": "0x170",
+            "bitfields": [
+                {
+                    "name": "DP_PSR_ENABLE",
+                    "value": "BIT(0)"
+                },
+                {
+                    "name": "DP_PSR_MAIN_LINK_ACTIVE",
+                    "value": "BIT(1)"
+                },
+                {
+                    "name": "DP_PSR_CRC_VERIFICATION",
+                    "value": "BIT(2)"
+                },
+                {
+                    "name": "DP_PSR_FRAME_CAPTURE",
+                    "value": "BIT(3)"
+                },
+                {
+                    "name": "DP_PSR_SU_REGION_SCANLINE_CAPTURE",
+                    "value": "BIT(4) /* eDP 1.4a */"
+                },
+                {
+                    "name": "DP_PSR_IRQ_HPD_WITH_CRC_ERRORS",
+                    "value": "BIT(5) /* eDP 1.4a */"
+                },
+                {
+                    "name": "DP_PSR_ENABLE_PSR2",
+                    "value": "BIT(6) /* eDP 1.4a */"
+                },
+                {
+                    "name": "DP_PSR_ENABLE_SU_REGION_ET",
+                    "value": "BIT(7) /* eDP 1.5 */"
+                }
+            ]
+        },
+        "DP_PSR_ERROR_STATUS": {
+            "address": "0x2006",
+            "bitfields": [
+                {
+                    "name": "DP_PSR_LINK_CRC_ERROR",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PSR_RFB_STORAGE_ERROR",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR",
+                    "value": "(1 << 2) /* eDP 1.4 */"
+                }
+            ]
+        },
+        "DP_PSR_ESI": {
+            "address": "0x2007",
+            "bitfields": [
+                {
+                    "name": "DP_PSR_CAPS_CHANGE",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_PSR_STATUS": {
+            "address": "0x2008",
+            "bitfields": [
+                {
+                    "name": "DP_PSR_SINK_INACTIVE",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PSR_SINK_ACTIVE_SRC_SYNCED",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PSR_SINK_ACTIVE_RFB",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_PSR_SINK_ACTIVE_SINK_SYNCED",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_PSR_SINK_ACTIVE_RESYNC",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_PSR_SINK_INTERNAL_ERROR",
+                    "value": "7"
+                },
+                {
+                    "name": "DP_PSR_SINK_STATE_MASK",
+                    "value": "0x07"
+                }
+            ]
+        }
+    },
+    "DP_PSR2": {
+        "DP_PSR2_SU_X_GRANULARITY": {
+            "address": "0x072"
+        },
+        "DP_PSR2_SU_Y_GRANULARITY": {
+            "address": "0x074"
+        }
+    },
+    "DP_DOWNSTREAM_PORT_0": {
+        "address": "0x80",
+        "bitfields": [
+            {
+                "name": "DP_DS_PORT_TYPE_MASK",
+                "value": "(7 << 0)"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_DP",
+                "value": "0"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_VGA",
+                "value": "1"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_DVI",
+                "value": "2"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_HDMI",
+                "value": "3"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_NON_EDID",
+                "value": "4"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_DP_DUALMODE",
+                "value": "5"
+            },
+            {
+                "name": "DP_DS_PORT_TYPE_WIRELESS",
+                "value": "6"
+            },
+            {
+                "name": "DP_DS_PORT_HPD",
+                "value": "(1 << 3)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_MASK",
+                "value": "(0xf << 4)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_720x480i_60",
+                "value": "(1 << 4)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_720x480i_50",
+                "value": "(2 << 4)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_1920x1080i_60",
+                "value": "(3 << 4)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_1920x1080i_50",
+                "value": "(4 << 4)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_1280x720_60",
+                "value": "(5 << 4)"
+            },
+            {
+                "name": "DP_DS_NON_EDID_1280x720_50",
+                "value": "(7 << 4)"
+            },
+            {
+                "name": "DP_DS_MAX_BPC_MASK",
+                "value": "(3 << 0)"
+            },
+            {
+                "name": "DP_DS_8BPC",
+                "value": "0"
+            },
+            {
+                "name": "DP_DS_10BPC",
+                "value": "1"
+            },
+            {
+                "name": "DP_DS_12BPC",
+                "value": "2"
+            },
+            {
+                "name": "DP_DS_16BPC",
+                "value": "3"
+            },
+            {
+                "name": "DP_PCON_MAX_FRL_BW",
+                "value": "(7 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_0GBPS",
+                "value": "(0 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_9GBPS",
+                "value": "(1 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_18GBPS",
+                "value": "(2 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_24GBPS",
+                "value": "(3 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_32GBPS",
+                "value": "(4 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_40GBPS",
+                "value": "(5 << 2)"
+            },
+            {
+                "name": "DP_PCON_MAX_48GBPS",
+                "value": "(6 << 2)"
+            },
+            {
+                "name": "DP_PCON_SOURCE_CTL_MODE",
+                "value": "(1 << 5)"
+            },
+            {
+                "name": "DP_DS_DVI_DUAL_LINK",
+                "value": "(1 << 1)"
+            },
+            {
+                "name": "DP_DS_DVI_HIGH_COLOR_DEPTH",
+                "value": "(1 << 2)"
+            },
+            {
+                "name": "DP_DS_HDMI_FRAME_SEQ_TO_FRAME_PACK",
+                "value": "(1 << 0)"
+            },
+            {
+                "name": "DP_DS_HDMI_YCBCR422_PASS_THROUGH",
+                "value": "(1 << 1)"
+            },
+            {
+                "name": "DP_DS_HDMI_YCBCR420_PASS_THROUGH",
+                "value": "(1 << 2)"
+            },
+            {
+                "name": "DP_DS_HDMI_YCBCR444_TO_422_CONV",
+                "value": "(1 << 3)"
+            },
+            {
+                "name": "DP_DS_HDMI_YCBCR444_TO_420_CONV",
+                "value": "(1 << 4)"
+            },
+            {
+                "name": "DP_DS_HDMI_BT601_RGB_YCBCR_CONV",
+                "value": "(1 << 5)"
+            },
+            {
+                "name": "DP_DS_HDMI_BT709_RGB_YCBCR_CONV",
+                "value": "(1 << 6)"
+            },
+            {
+                "name": "DP_DS_HDMI_BT2020_RGB_YCBCR_CONV",
+                "value": "(1 << 7)"
+            }
+        ]
+    },
+    "DP_FEC": {
+        "DP_FEC_CAPABILITY": {
+            "address": "0x090",
+            "bitfields": [
+                {
+                    "name": "DP_FEC_CAPABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_FEC_UNCORR_BLK_ERROR_COUNT_CAP",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_FEC_CORR_BLK_ERROR_COUNT_CAP",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_FEC_BIT_ERROR_COUNT_CAP",
+                    "value": "(1 << 3)"
+                }
+            ]
+        },
+        "DP_FEC_CAPABILITY_1": {
+            "address": "0x091"
+        },
+        "DP_FEC_CONFIGURATION": {
+            "address": "0x120",
+            "bitfields": [
+                {
+                    "name": "DP_FEC_READY",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_FEC_ERR_COUNT_SEL_MASK",
+                    "value": "(7 << 1)"
+                },
+                {
+                    "name": "DP_FEC_ERR_COUNT_DIS",
+                    "value": "(0 << 1)"
+                },
+                {
+                    "name": "DP_FEC_UNCORR_BLK_ERROR_COUNT",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_FEC_CORR_BLK_ERROR_COUNT",
+                    "value": "(2 << 1)"
+                },
+                {
+                    "name": "DP_FEC_BIT_ERROR_COUNT",
+                    "value": "(3 << 1)"
+                },
+                {
+                    "name": "DP_FEC_LANE_SELECT_MASK",
+                    "value": "(3 << 4)"
+                },
+                {
+                    "name": "DP_FEC_LANE_0_SELECT",
+                    "value": "(0 << 4)"
+                },
+                {
+                    "name": "DP_FEC_LANE_1_SELECT",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_FEC_LANE_2_SELECT",
+                    "value": "(2 << 4)"
+                },
+                {
+                    "name": "DP_FEC_LANE_3_SELECT",
+                    "value": "(3 << 4)"
+                }
+            ]
+        },
+        "DP_FEC_STATUS": {
+            "address": "0x280",
+            "bitfields": [
+                {
+                    "name": "DP_FEC_DECODE_EN_DETECTED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_FEC_DECODE_DIS_DETECTED",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_FEC_ERROR_COUNT_LSB": {
+            "address": "0x0281"
+        },
+        "DP_FEC_ERROR_COUNT_MSB": {
+            "address": "0x0282",
+            "bitfields": [
+                {
+                    "name": "DP_FEC_ERROR_COUNT_MASK",
+                    "value": "0x7F"
+                },
+                {
+                    "name": "DP_FEC_ERR_COUNT_VALID",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_FEC_STATUS_PHY_REPEATER1": {
+            "address": "0xf0290"
+        },
+        "DP_FEC_ERROR_COUNT_PHY_REPEATER1": {
+            "address": "0xf0291"
+        },
+        "DP_FEC_CAPABILITY_PHY_REPEATER1": {
+            "address": "0xf0294"
+        }
+    },
+    "DP_PCON": {
+        "DP_PCON_DSC_ENCODER_CAP_SIZE": {
+            "address": "0xD"
+        },
+        "DP_PCON_DSC_ENCODER": {
+            "address": "0x092",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_ENCODER_SUPPORTED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_PPS_ENC_OVERRIDE",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_PCON_DSC_VERSION": {
+            "address": "0x093",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_MAJOR_MASK",
+                    "value": "(0xF << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_MINOR_MASK",
+                    "value": "(0xF << 4)"
+                },
+                {
+                    "name": "DP_PCON_DSC_MAJOR_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_DSC_MINOR_SHIFT",
+                    "value": "4"
+                }
+            ]
+        },
+        "DP_PCON_DSC_RC_BUF_BLK_INFO": {
+            "address": "0x094",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_RC_BUF_BLK_SIZE",
+                    "value": "(0x3 << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_RC_BUF_BLK_1KB",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_DSC_RC_BUF_BLK_4KB",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PCON_DSC_RC_BUF_BLK_16KB",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_PCON_DSC_RC_BUF_BLK_64KB",
+                    "value": "3"
+                }
+            ]
+        },
+        "DP_PCON_DSC_RC_BUF_SIZE": {
+            "address": "0x095"
+        },
+        "DP_PCON_DSC_SLICE_CAP_1": {
+            "address": "0x096",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_1_PER_DSC_ENC",
+                    "value": "(0x1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_2_PER_DSC_ENC",
+                    "value": "(0x1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_DSC_4_PER_DSC_ENC",
+                    "value": "(0x1 << 3)"
+                },
+                {
+                    "name": "DP_PCON_DSC_6_PER_DSC_ENC",
+                    "value": "(0x1 << 4)"
+                },
+                {
+                    "name": "DP_PCON_DSC_8_PER_DSC_ENC",
+                    "value": "(0x1 << 5)"
+                },
+                {
+                    "name": "DP_PCON_DSC_10_PER_DSC_ENC",
+                    "value": "(0x1 << 6)"
+                },
+                {
+                    "name": "DP_PCON_DSC_12_PER_DSC_ENC",
+                    "value": "(0x1 << 7)"
+                }
+            ]
+        },
+        "DP_PCON_DSC_BUF_BIT_DEPTH": {
+            "address": "0x097",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_BIT_DEPTH_MASK",
+                    "value": "(0xF << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_9_BITS",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_10_BITS",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_11_BITS",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_12_BITS",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_13_BITS",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_14_BITS",
+                    "value": "5"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_15_BITS",
+                    "value": "6"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_16_BITS",
+                    "value": "7"
+                },
+                {
+                    "name": "DP_PCON_DSC_DEPTH_8_BITS",
+                    "value": "8"
+                }
+            ]
+        },
+        "DP_PCON_DSC_BLOCK_PREDICTION": {
+            "address": "0x098",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_BLOCK_PRED_SUPPORT",
+                    "value": "(0x1 << 0)"
+                }
+            ]
+        },
+        "DP_PCON_DSC_ENC_COLOR_FMT_CAP": {
+            "address": "0x099",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_ENC_RGB",
+                    "value": "(0x1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ENC_YUV444",
+                    "value": "(0x1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ENC_YUV422_S",
+                    "value": "(0x1 << 2)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ENC_YUV422_N",
+                    "value": "(0x1 << 3)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ENC_YUV420_N",
+                    "value": "(0x1 << 4)"
+                }
+            ]
+        },
+        "DP_PCON_DSC_ENC_COLOR_DEPTH_CAP": {
+            "address": "0x09A",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_ENC_8BPC",
+                    "value": "(0x1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ENC_10BPC",
+                    "value": "(0x1 << 2)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ENC_12BPC",
+                    "value": "(0x1 << 3)"
+                }
+            ]
+        },
+        "DP_PCON_DSC_MAX_SLICE_WIDTH": {
+            "address": "0x09B"
+        },
+        "DP_PCON_DSC_SLICE_CAP_2": {
+            "address": "0x09C",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_16_PER_DSC_ENC",
+                    "value": "(0x1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_20_PER_DSC_ENC",
+                    "value": "(0x1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_DSC_24_PER_DSC_ENC",
+                    "value": "(0x1 << 2)"
+                }
+            ]
+        },
+        "DP_PCON_DSC_BPP_INCR": {
+            "address": "0x09E",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_DSC_BPP_INCR_MASK",
+                    "value": "(0x7 << 0)"
+                },
+                {
+                    "name": "DP_PCON_DSC_ONE_16TH_BPP",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_DSC_ONE_8TH_BPP",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PCON_DSC_ONE_4TH_BPP",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_PCON_DSC_ONE_HALF_BPP",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_PCON_DSC_ONE_BPP",
+                    "value": "4"
+                }
+            ]
+        },
+        "DP_PCON_HDMI_LINK_CONFIG_1": {
+            "address": "0x305A",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_ENABLE_MAX_FRL_BW",
+                    "value": "(7 << 0)"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_0GBPS",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_9GBPS",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_18GBPS",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_24GBPS",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_32GBPS",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_40GBPS",
+                    "value": "5"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_MAX_BW_48GBPS",
+                    "value": "6"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_SOURCE_CTL_MODE",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_CONCURRENT_LINK",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_SEQUENTIAL_LINK",
+                    "value": "(0 << 4)"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_LINK_FRL_MODE",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_HPD_READY",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_HDMI_LINK",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_PCON_HDMI_LINK_CONFIG_2": {
+            "address": "0x305B",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_MAX_LINK_BW_MASK",
+                    "value": "(0x3F << 0)"
+                },
+                {
+                    "name": "DP_PCON_FRL_BW_MASK_9GBPS",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_FRL_BW_MASK_18GBPS",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_FRL_BW_MASK_24GBPS",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_PCON_FRL_BW_MASK_32GBPS",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_PCON_FRL_BW_MASK_40GBPS",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_PCON_FRL_BW_MASK_48GBPS",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_PCON_FRL_LINK_TRAIN_EXTENDED",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_PCON_FRL_LINK_TRAIN_NORMAL",
+                    "value": "(0 << 6)"
+                }
+            ]
+        },
+        "DP_PCON_HDMI_TX_LINK_STATUS": {
+            "address": "0x303B",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_HDMI_TX_LINK_ACTIVE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_FRL_READY",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_PCON_HDMI_POST_FRL_STATUS": {
+            "address": "0x3036",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_HDMI_LINK_MODE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_HDMI_MODE_TMDS",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_HDMI_MODE_FRL",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PCON_HDMI_FRL_TRAINED_BW",
+                    "value": "(0x3F << 1)"
+                },
+                {
+                    "name": "DP_PCON_FRL_TRAINED_BW_9GBPS",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_FRL_TRAINED_BW_18GBPS",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_PCON_FRL_TRAINED_BW_24GBPS",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_PCON_FRL_TRAINED_BW_32GBPS",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_PCON_FRL_TRAINED_BW_40GBPS",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_PCON_FRL_TRAINED_BW_48GBPS",
+                    "value": "(1 << 6)"
+                }
+            ]
+        },
+        "DP_PCON_HDMI_ERROR_STATUS_LN0": {
+            "address": "0x3037"
+        },
+        "DP_PCON_HDMI_ERROR_STATUS_LN1": {
+            "address": "0x3038"
+        },
+        "DP_PCON_HDMI_ERROR_STATUS_LN2": {
+            "address": "0x3039"
+        },
+        "DP_PCON_HDMI_ERROR_STATUS_LN3": {
+            "address": "0x303A",
+            "bitfields": [
+                {
+                    "name": "DP_PCON_HDMI_ERROR_COUNT_MASK",
+                    "value": "(0x7 << 0)"
+                },
+                {
+                    "name": "DP_PCON_HDMI_ERROR_COUNT_THREE_PLUS",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PCON_HDMI_ERROR_COUNT_TEN_PLUS",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_HDMI_ERROR_COUNT_HUNDRED_PLUS",
+                    "value": "(1 << 2)"
+                }
+            ]
+        },
+        "DP_PCON_HDMI_PPS_OVERRIDE_BASE": {
+            "address": "0x3100"
+        },
+        "DP_PCON_HDMI_PPS_OVRD_SLICE_HEIGHT": {
+            "address": "0x3180"
+        },
+        "DP_PCON_HDMI_PPS_OVRD_SLICE_WIDTH": {
+            "address": "0x3182"
+        },
+        "DP_PCON_HDMI_PPS_OVRD_BPP": {
+            "address": "0x3184"
+        }
+    },
+    "DP_DFP_CAPABILITY_EXTENSION_SUPPORT": {
+        "address": "0x0a3"
+    },
+    "DP_PANEL": {
+        "DP_PANEL_REPLAY_CAP": {
+            "address": "0x0b0",
+            "bitfields": [
+                {
+                    "name": "DP_PANEL_REPLAY_SUPPORT",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_SU_SUPPORT",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT",
+                    "value": "(1 << 2) /* eDP 1.5 */"
+                }
+            ]
+        },
+        "DP_PANEL_PANEL_REPLAY_CAPABILITY": {
+            "address": "0xb1",
+            "bitfields": [
+                {
+                    "name": "DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED",
+                    "value": "(1 << 5)"
+                }
+            ]
+        },
+        "DP_PANEL_PANEL_REPLAY_X_GRANULARITY": {
+            "address": "0xb2"
+        },
+        "DP_PANEL_PANEL_REPLAY_Y_GRANULARITY": {
+            "address": "0xb4"
+        },
+        "DP_PANEL_REPLAY_ERROR_STATUS": {
+            "address": "0x2020",
+            "bitfields": [
+                {
+                    "name": "DP_PANEL_REPLAY_LINK_CRC_ERROR",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_RFB_STORAGE_ERROR",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_VSC_SDP_UNCORRECTABLE_ERROR",
+                    "value": "(1 << 2)"
+                }
+            ]
+        }
+    },
+    "DP_LINK": {
+        "DP_LINK_BW_SET": {
+            "address": "0x100",
+            "bitfields": [
+                {
+                    "name": "DP_LINK_RATE_TABLE",
+                    "value": "0x00    /* eDP 1.4 */"
+                },
+                {
+                    "name": "DP_LINK_BW_1_62",
+                    "value": "0x06"
+                },
+                {
+                    "name": "DP_LINK_BW_2_7",
+                    "value": "0x0a"
+                },
+                {
+                    "name": "DP_LINK_BW_5_4",
+                    "value": "0x14    /* 1.2 */"
+                },
+                {
+                    "name": "DP_LINK_BW_8_1",
+                    "value": "0x1e    /* 1.4 */"
+                },
+                {
+                    "name": "DP_LINK_BW_10",
+                    "value": "0x01    /* 2.0 128b/132b Link Layer */"
+                },
+                {
+                    "name": "DP_LINK_BW_13_5",
+                    "value": "0x04    /* 2.0 128b/132b Link Layer */"
+                },
+                {
+                    "name": "DP_LINK_BW_20",
+                    "value": "0x02    /* 2.0 128b/132b Link Layer */"
+                }
+            ]
+        },
+        "DP_LINK_QUAL_LANE0_SET": {
+            "address": "0x10b"
+        },
+        "DP_LINK_QUAL_LANE1_SET": {
+            "address": "0x10c"
+        },
+        "DP_LINK_QUAL_LANE2_SET": {
+            "address": "0x10d"
+        },
+        "DP_LINK_QUAL_LANE3_SET": {
+            "address": "0x10e",
+            "bitfields": [
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_DISABLE",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_D10_2",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_ERROR_RATE",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_PRBS7",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_80BIT_CUSTOM",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_CP2520_PAT_1",
+                    "value": "5"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_CP2520_PAT_2",
+                    "value": "6"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_CP2520_PAT_3",
+                    "value": "7"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_128B132B_TPS1",
+                    "value": "0x08"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_128B132B_TPS2",
+                    "value": "0x10"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_PRSBS9",
+                    "value": "0x18"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_PRSBS11",
+                    "value": "0x20"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_PRSBS15",
+                    "value": "0x28"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_PRSBS23",
+                    "value": "0x30"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_PRSBS31",
+                    "value": "0x38"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_CUSTOM",
+                    "value": "0x40"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_SQUARE",
+                    "value": "0x48"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_SQUARE_PRESHOOT_DISABLED",
+                    "value": "0x49"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_SQUARE_DEEMPHASIS_DISABLED",
+                    "value": "0x4a"
+                },
+                {
+                    "name": "DP_LINK_QUAL_PATTERN_SQUARE_PRESHOOT_DEEMPHASIS_DISABLED",
+                    "value": "0x4b"
+                }
+            ]
+        },
+        "DP_LINK_RATE_SET": {
+            "address": "0x115",
+            "bitfields": [
+                {
+                    "name": "DP_LINK_RATE_SET_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_LINK_RATE_SET_MASK",
+                    "value": "(7 << 0)"
+                }
+            ]
+        },
+        "DP_LINK_SERVICE_IRQ_VECTOR_ESI0": {
+            "address": "0x2005",
+            "bitfields": [
+                {
+                    "name": "RX_CAP_CHANGED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "LINK_STATUS_CHANGED",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "STREAM_STATUS_CHANGED",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "HDMI_LINK_STATUS_CHANGED",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "CONNECTED_OFF_ENTRY_REQUESTED",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_TUNNELING_IRQ",
+                    "value": "(1 << 5)"
+                }
+            ]
+        },
+        "DP_LINK_ADDRESS": {
+            "address": "0x01"
+        },
+        "DP_LINK_CONSTANT_N_VALUE": {
+            "address": "0x8000",
+            "bitfields": [
+                {
+                    "name": "DP_LINK_STATUS_SIZE",
+                    "value": "6"
+                }
+            ]
+        }
+    },
+    "DP_LANE": {
+        "DP_LANE_COUNT_SET": {
+            "address": "0x101",
+            "bitfields": [
+                {
+                    "name": "DP_LANE_COUNT_MASK",
+                    "value": "0x0f"
+                },
+                {
+                    "name": "DP_LANE_COUNT_ENHANCED_FRAME_EN",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_LANE_ALIGN_STATUS_UPDATED": {
+            "address": "0x204",
+            "bitfields": [
+                {
+                    "name": "DP_INTERLANE_ALIGN_DONE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_128B132B_DPRX_EQ_INTERLANE_ALIGN_DONE",
+                    "value": "(1 << 2) /* 2.0 E11 */"
+                },
+                {
+                    "name": "DP_128B132B_DPRX_CDS_INTERLANE_ALIGN_DONE",
+                    "value": "(1 << 3) /* 2.0 E11 */"
+                },
+                {
+                    "name": "DP_128B132B_LT_FAILED",
+                    "value": "(1 << 4) /* 2.0 E11 */"
+                },
+                {
+                    "name": "DP_DOWNSTREAM_PORT_STATUS_CHANGED",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_LINK_STATUS_UPDATED",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_LANE_ALIGN_STATUS_UPDATED_ESI": {
+            "address": "0x200e"
+        },
+        "DP_LANE_ALIGN_STATUS_UPDATED_PHY_REPEATER1": {
+            "address": "0xf0032"
+        }
+    },
+    "DP_DOWNSPREAD_CTRL": {
+        "address": "0x107",
+        "bitfields": [
+            {
+                "name": "DP_SPREAD_AMP_0_5",
+                "value": "(1 << 4)"
+            },
+            {
+                "name": "DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE",
+                "value": "(1 << 6)"
+            },
+            {
+                "name": "DP_MSA_TIMING_PAR_IGNORE_EN",
+                "value": "(1 << 7) /* eDP */"
+            }
+        ]
+    },
+    "DP_AUDIO": {
+        "DP_AUDIO_DELAY0": {
+            "address": "0x112"
+        },
+        "DP_AUDIO_DELAY1": {
+            "address": "0x113"
+        },
+        "DP_AUDIO_DELAY2": {
+            "address": "0x114"
+        }
+    },
+    "DP_UPSTREAM_DEVICE_DP_PWR_NEED": {
+        "address": "0x118",
+        "bitfields": [
+            {
+                "name": "DP_PWR_NOT_NEEDED",
+                "value": "(1 << 0)"
+            }
+        ]
+    },
+    "DP_EXTENDED": {
+        "DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT": {
+            "address": "0x119",
+            "bitfields": [
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST": {
+            "address": "0x2211",
+            "bitfields": [
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_MASK",
+                    "value": "0xff"
+                },
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS",
+                    "value": "0x00"
+                },
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS",
+                    "value": "0x01"
+                },
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS",
+                    "value": "0x02"
+                },
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_60_MS",
+                    "value": "0x03"
+                },
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS",
+                    "value": "0x04"
+                },
+                {
+                    "name": "DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS",
+                    "value": "0x05"
+                }
+            ]
+        }
+    },
+    "DP_SDP": {
+        "DP_SDP_ERROR_DETECTION_CONFIGURATION": {
+            "address": "0x121",
+            "bitfields": [
+                {
+                    "name": "DP_SDP_CRC16_128B132B_EN",
+                    "value": "BIT(0)"
+                }
+            ]
+        },
+        "DP_SDP_AUDIO_TIMESTAMP": {
+            "address": "0x01"
+        },
+        "DP_SDP_AUDIO_STREAM": {
+            "address": "0x02"
+        },
+        "DP_SDP_EXTENSION": {
+            "address": "0x04"
+        },
+        "DP_SDP_AUDIO_COPYMANAGEMENT": {
+            "address": "0x05"
+        },
+        "DP_SDP_ISRC": {
+            "address": "0x06"
+        },
+        "DP_SDP_VSC": {
+            "address": "0x07"
+        },
+        "DP_SDP_ADAPTIVE_SYNC": {
+            "address": "0x22"
+        },
+        "DP_SDP_PPS": {
+            "address": "0x10"
+        },
+        "DP_SDP_VSC_EXT_VESA": {
+            "address": "0x20"
+        },
+        "DP_SDP_VSC_EXT_CEA": {
+            "address": "0x21"
+        },
+        "DP_SDP_AUDIO_INFOFRAME_HB2": {
+            "address": "0x1b"
+        },
+        "DP_SDP_PPS_HEADER_PAYLOAD_BYTES_MINUS_1": {
+            "address": "0x7F",
+            "bitfields": [
+                {
+                    "name": "EDP_VSC_PSR_STATE_ACTIVE",
+                    "value": "(1<<0)"
+                },
+                {
+                    "name": "EDP_VSC_PSR_UPDATE_RFB",
+                    "value": "(1<<1)"
+                },
+                {
+                    "name": "EDP_VSC_PSR_CRC_VALUES_VALID",
+                    "value": "(1<<2)"
+                }
+            ]
+        }
+    },
+    "DP_BRANCH": {
+        "DP_BRANCH_DEVICE_CTRL": {
+            "address": "0x1a1",
+            "bitfields": [
+                {
+                    "name": "DP_BRANCH_DEVICE_IRQ_HPD",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_BRANCH_OUI": {
+            "address": "0x500"
+        },
+        "DP_BRANCH_ID": {
+            "address": "0x503"
+        },
+        "DP_BRANCH_REVISION_START": {
+            "address": "0x509"
+        },
+        "DP_BRANCH_HW_REV": {
+            "address": "0x509"
+        },
+        "DP_BRANCH_SW_REV": {
+            "address": "0x50A"
+        },
+        "DP_BRANCH_OUI_HEADER_SIZE": {
+            "address": "0xc"
+        }
+    },
+    "PANEL_REPLAY": {
+        "PANEL_REPLAY_CONFIG": {
+            "address": "0x1b0",
+            "bitfields": [
+                {
+                    "name": "DP_PANEL_REPLAY_ENABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_VSC_SDP_CRC_EN",
+                    "value": "(1 << 1) /* eDP 1.5 */"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_UNRECOVERABLE_ERROR_EN",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_SU_ENABLE",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_ENABLE_SU_REGION_ET",
+                    "value": "(1 << 7) /* DP 2.1 */"
+                }
+            ]
+        },
+        "PANEL_REPLAY_CONFIG2": {
+            "address": "0x1b1",
+            "bitfields": [
+                {
+                    "name": "DP_PANEL_REPLAY_SINK_REFRESH_RATE_UNLOCK_GRANTED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_CRC_VERIFICATION",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_EN",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_SHIFT",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_MASK",
+                    "value": "(0xf << 3)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE",
+                    "value": "(1 << 7)"
+                }
+            ]
+        }
+    },
+    "DP_PAYLOAD": {
+        "DP_PAYLOAD_ALLOCATE_SET": {
+            "address": "0x1c0"
+        },
+        "DP_PAYLOAD_ALLOCATE_START_TIME_SLOT": {
+            "address": "0x1c1"
+        },
+        "DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT": {
+            "address": "0x1c2"
+        },
+        "DP_PAYLOAD_TABLE_UPDATE_STATUS": {
+            "address": "0x2c0",
+            "bitfields": [
+                {
+                    "name": "DP_PAYLOAD_TABLE_UPDATED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_PAYLOAD_ACT_HANDLED",
+                    "value": "(1 << 1)"
+                }
+            ]
+        }
+    },
+    "DP_DEVICE": {
+        "DP_DEVICE_SERVICE_IRQ_VECTOR": {
+            "address": "0x201",
+            "bitfields": [
+                {
+                    "name": "DP_REMOTE_CONTROL_COMMAND_PENDING",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_AUTOMATED_TEST_REQUEST",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_CP_IRQ",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_MCCS_IRQ",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_DOWN_REP_MSG_RDY",
+                    "value": "(1 << 4) /* 1.2 MST */"
+                },
+                {
+                    "name": "DP_UP_REQ_MSG_RDY",
+                    "value": "(1 << 5) /* 1.2 MST */"
+                },
+                {
+                    "name": "DP_SINK_SPECIFIC_IRQ",
+                    "value": "(1 << 6)"
+                }
+            ]
+        },
+        "DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0": {
+            "address": "0x2003"
+        },
+        "DP_DEVICE_SERVICE_IRQ_VECTOR_ESI1": {
+            "address": "0x2004",
+            "bitfields": [
+                {
+                    "name": "DP_RX_GTC_MSTR_REQ_STATUS_CHANGE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_LOCK_ACQUISITION_REQUEST",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_CEC_IRQ",
+                    "value": "(1 << 2)"
+                }
+            ]
+        }
+    },
+    "DP_LANE0": {
+        "DP_LANE0_1_STATUS": {
+            "address": "0x202"
+        },
+        "DP_LANE0_1_STATUS_ESI": {
+            "address": "0x200c"
+        },
+        "DP_LANE0_1_STATUS_PHY_REPEATER1": {
+            "address": "0xf0030"
+        }
+    },
+    "DP_LANE2": {
+        "DP_LANE2_3_STATUS": {
+            "address": "0x203",
+            "bitfields": [
+                {
+                    "name": "DP_LANE_CR_DONE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_LANE_CHANNEL_EQ_DONE",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_LANE_SYMBOL_LOCKED",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_CHANNEL_EQ_BITS",
+                    "value": "(DP_LANE_CR_DONE |\t\t\\"
+                }
+            ]
+        },
+        "DP_LANE2_3_STATUS_ESI": {
+            "address": "0x200d"
+        },
+        "DP_LANE2_3_STATUS_PHY_REPEATER1": {
+            "address": "0xf0031"
+        }
+    },
+    "DP_ADJUST": {
+        "DP_ADJUST_REQUEST_LANE0_1": {
+            "address": "0x206"
+        },
+        "DP_ADJUST_REQUEST_LANE2_3": {
+            "address": "0x207",
+            "bitfields": [
+                {
+                    "name": "DP_ADJUST_VOLTAGE_SWING_LANE0_MASK",
+                    "value": "0x03"
+                },
+                {
+                    "name": "DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_ADJUST_PRE_EMPHASIS_LANE0_MASK",
+                    "value": "0x0c"
+                },
+                {
+                    "name": "DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_ADJUST_VOLTAGE_SWING_LANE1_MASK",
+                    "value": "0x30"
+                },
+                {
+                    "name": "DP_ADJUST_VOLTAGE_SWING_LANE1_SHIFT",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_ADJUST_PRE_EMPHASIS_LANE1_MASK",
+                    "value": "0xc0"
+                },
+                {
+                    "name": "DP_ADJUST_PRE_EMPHASIS_LANE1_SHIFT",
+                    "value": "6"
+                },
+                {
+                    "name": "DP_ADJUST_TX_FFE_PRESET_LANE0_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_ADJUST_TX_FFE_PRESET_LANE0_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_ADJUST_TX_FFE_PRESET_LANE1_MASK",
+                    "value": "(0xf << 4)"
+                },
+                {
+                    "name": "DP_ADJUST_TX_FFE_PRESET_LANE1_SHIFT",
+                    "value": "4"
+                }
+            ]
+        },
+        "DP_ADJUST_REQUEST_POST_CURSOR2": {
+            "address": "0x20c",
+            "bitfields": [
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE0_MASK",
+                    "value": "0x03"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE0_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE1_MASK",
+                    "value": "0x0c"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE1_SHIFT",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE2_MASK",
+                    "value": "0x30"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE2_SHIFT",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE3_MASK",
+                    "value": "0xc0"
+                },
+                {
+                    "name": "DP_ADJUST_POST_CURSOR2_LANE3_SHIFT",
+                    "value": "6"
+                }
+            ]
+        },
+        "DP_ADJUST_REQUEST_LANE0_1_PHY_REPEATER1": {
+            "address": "0xf0033"
+        },
+        "DP_ADJUST_REQUEST_LANE2_3_PHY_REPEATER1": {
+            "address": "0xf0034"
+        }
+    },
+    "DP_TEST": {
+        "DP_TEST_REQUEST": {
+            "address": "0x218",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_LINK_TRAINING",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_TEST_LINK_VIDEO_PATTERN",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_TEST_LINK_EDID_READ",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_TEST_LINK_PHY_TEST_PATTERN",
+                    "value": "(1 << 3) /* DPCD >= 1.1 */"
+                },
+                {
+                    "name": "DP_TEST_LINK_FAUX_PATTERN",
+                    "value": "(1 << 4) /* DPCD >= 1.2 */"
+                },
+                {
+                    "name": "DP_TEST_LINK_AUDIO_PATTERN",
+                    "value": "(1 << 5) /* DPCD >= 1.2 */"
+                },
+                {
+                    "name": "DP_TEST_LINK_AUDIO_DISABLED_VIDEO",
+                    "value": "(1 << 6) /* DPCD >= 1.2 */"
+                }
+            ]
+        },
+        "DP_TEST_LINK_RATE": {
+            "address": "0x219",
+            "bitfields": [
+                {
+                    "name": "DP_LINK_RATE_162",
+                    "value": "(0x6)"
+                },
+                {
+                    "name": "DP_LINK_RATE_27",
+                    "value": "(0xa)"
+                }
+            ]
+        },
+        "DP_TEST_LANE_COUNT": {
+            "address": "0x220"
+        },
+        "DP_TEST_PATTERN": {
+            "address": "0x221",
+            "bitfields": [
+                {
+                    "name": "DP_NO_TEST_PATTERN",
+                    "value": "0x0"
+                },
+                {
+                    "name": "DP_COLOR_RAMP",
+                    "value": "0x1"
+                },
+                {
+                    "name": "DP_BLACK_AND_WHITE_VERTICAL_LINES",
+                    "value": "0x2"
+                },
+                {
+                    "name": "DP_COLOR_SQUARE",
+                    "value": "0x3"
+                }
+            ]
+        },
+        "DP_TEST_H_TOTAL_HI": {
+            "address": "0x222"
+        },
+        "DP_TEST_H_TOTAL_LO": {
+            "address": "0x223"
+        },
+        "DP_TEST_V_TOTAL_HI": {
+            "address": "0x224"
+        },
+        "DP_TEST_V_TOTAL_LO": {
+            "address": "0x225"
+        },
+        "DP_TEST_H_START_HI": {
+            "address": "0x226"
+        },
+        "DP_TEST_H_START_LO": {
+            "address": "0x227"
+        },
+        "DP_TEST_V_START_HI": {
+            "address": "0x228"
+        },
+        "DP_TEST_V_START_LO": {
+            "address": "0x229"
+        },
+        "DP_TEST_HSYNC_HI": {
+            "address": "0x22A",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_HSYNC_POLARITY",
+                    "value": "(1 << 7)"
+                },
+                {
+                    "name": "DP_TEST_HSYNC_WIDTH_HI_MASK",
+                    "value": "(127 << 0)"
+                }
+            ]
+        },
+        "DP_TEST_HSYNC_WIDTH_LO": {
+            "address": "0x22B"
+        },
+        "DP_TEST_VSYNC_HI": {
+            "address": "0x22C",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_VSYNC_POLARITY",
+                    "value": "(1 << 7)"
+                },
+                {
+                    "name": "DP_TEST_VSYNC_WIDTH_HI_MASK",
+                    "value": "(127 << 0)"
+                }
+            ]
+        },
+        "DP_TEST_VSYNC_WIDTH_LO": {
+            "address": "0x22D"
+        },
+        "DP_TEST_H_WIDTH_HI": {
+            "address": "0x22E"
+        },
+        "DP_TEST_H_WIDTH_LO": {
+            "address": "0x22F"
+        },
+        "DP_TEST_V_HEIGHT_HI": {
+            "address": "0x230"
+        },
+        "DP_TEST_V_HEIGHT_LO": {
+            "address": "0x231"
+        },
+        "DP_TEST_MISC0": {
+            "address": "0x232"
+        },
+        "DP_TEST_MISC1": {
+            "address": "0x233",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_REFRESH_DENOMINATOR",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_TEST_INTERLACED",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_TEST_REFRESH_RATE_NUMERATOR": {
+            "address": "0x234"
+        },
+        "DP_TEST_CRC_R_CR": {
+            "address": "0x240"
+        },
+        "DP_TEST_CRC_G_Y": {
+            "address": "0x242"
+        },
+        "DP_TEST_CRC_B_CB": {
+            "address": "0x244"
+        },
+        "DP_TEST_SINK_MISC": {
+            "address": "0x246",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_CRC_SUPPORTED",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_TEST_COUNT_MASK",
+                    "value": "0xf"
+                }
+            ]
+        },
+        "DP_TEST_HBR2_SCRAMBLER_RESET": {
+            "address": "0x24A"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_7_0": {
+            "address": "0x250"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_15_8": {
+            "address": "0x251"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_23_16": {
+            "address": "0x252"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_31_24": {
+            "address": "0x253"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_39_32": {
+            "address": "0x254"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_47_40": {
+            "address": "0x255"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_55_48": {
+            "address": "0x256"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_63_56": {
+            "address": "0x257"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_71_64": {
+            "address": "0x258"
+        },
+        "DP_TEST_80BIT_CUSTOM_PATTERN_79_72": {
+            "address": "0x259"
+        },
+        "DP_TEST_RESPONSE": {
+            "address": "0x260",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_ACK",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_TEST_NAK",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_TEST_EDID_CHECKSUM_WRITE",
+                    "value": "(1 << 2)"
+                }
+            ]
+        },
+        "DP_TEST_EDID_CHECKSUM": {
+            "address": "0x261"
+        },
+        "DP_TEST_SINK": {
+            "address": "0x270",
+            "bitfields": [
+                {
+                    "name": "DP_TEST_SINK_START",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_TEST_AUDIO_MODE": {
+            "address": "0x271"
+        },
+        "DP_TEST_AUDIO_PATTERN_TYPE": {
+            "address": "0x272"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH1": {
+            "address": "0x273"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH2": {
+            "address": "0x274"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH3": {
+            "address": "0x275"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH4": {
+            "address": "0x276"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH5": {
+            "address": "0x277"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH6": {
+            "address": "0x278"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH7": {
+            "address": "0x279"
+        },
+        "DP_TEST_AUDIO_PERIOD_CH8": {
+            "address": "0x27A"
+        },
+        "DP_TEST_264BIT_CUSTOM_PATTERN_7_0": {
+            "address": "0x2230"
+        },
+        "DP_TEST_264BIT_CUSTOM_PATTERN_263_256": {
+            "address": "0x2250"
+        }
+    },
+    "DP_PHY": {
+        "DP_PHY_TEST_PATTERN": {
+            "address": "0x248",
+            "bitfields": [
+                {
+                    "name": "DP_PHY_TEST_PATTERN_SEL_MASK",
+                    "value": "0x7"
+                },
+                {
+                    "name": "DP_PHY_TEST_PATTERN_NONE",
+                    "value": "0x0"
+                },
+                {
+                    "name": "DP_PHY_TEST_PATTERN_D10_2",
+                    "value": "0x1"
+                },
+                {
+                    "name": "DP_PHY_TEST_PATTERN_ERROR_COUNT",
+                    "value": "0x2"
+                },
+                {
+                    "name": "DP_PHY_TEST_PATTERN_PRBS7",
+                    "value": "0x3"
+                },
+                {
+                    "name": "DP_PHY_TEST_PATTERN_80BIT_CUSTOM",
+                    "value": "0x4"
+                },
+                {
+                    "name": "DP_PHY_TEST_PATTERN_CP2520",
+                    "value": "0x5"
+                }
+            ]
+        },
+        "DP_PHY_SQUARE_PATTERN": {
+            "address": "0x249"
+        },
+        "DP_PHY_REPEATER_CNT": {
+            "address": "0xf0002"
+        },
+        "DP_PHY_REPEATER_MODE": {
+            "address": "0xf0003"
+        },
+        "DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT": {
+            "address": "0xf0005",
+            "bitfields": [
+                {
+                    "name": "DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK",
+                    "value": "0x7f"
+                },
+                {
+                    "name": "DP_EXTENDED_WAKE_TIMEOUT_GRANT",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_PHY_REPEATER_128B132B_RATES": {
+            "address": "0xf0007"
+        },
+        "DP_PHY_REPEATER_EQ_DONE": {
+            "address": "0xf0008"
+        },
+        "DP_PHY_REPEATER_MODE_TRANSPARENT": {
+            "address": "0x55"
+        },
+        "DP_PHY_REPEATER_MODE_NON_TRANSPARENT": {
+            "address": "0xaa",
+            "bitfields": [
+                {
+                    "name": "DP_HDCP_2_2_AKE_INIT_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_RTX_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_AKE_SEND_CERT_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_CERT_RX_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_AKE_NO_STORED_KM_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_EKPUB_KM_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_AKE_STORED_KM_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_EKH_KM_WR_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_AKE_SEND_HPRIME_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_HPRIME_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_AKE_SEND_PAIRING_INFO_OFFSET",
+                    "value": "\\"
+                },
+                {
+                    "name": "DP_HDCP_2_2_LC_INIT_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_RN_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_LPRIME_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_SKE_SEND_EKS_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_EDKEY_KS_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_RXINFO_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_REP_SEND_ACK_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_V_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_SEQ_NUM_M_OFFSET"
+                },
+                {
+                    "name": "DP_HDCP_2_2_REP_STREAM_READY_OFFSET",
+                    "value": "DP_HDCP_2_2_REG_MPRIME_OFFSET"
+                },
+                {
+                    "name": "HDCP_2_2_DP_RXSTATUS_LEN",
+                    "value": "1"
+                }
+            ]
+        }
+    },
+    "DP_VC_PAYLOAD_ID_SLOT_1": {
+        "address": "0x2c1"
+    },
+    "DP_SOURCE_OUI": {
+        "address": "0x300"
+    },
+    "DP_SET_POWER": {
+        "address": "0x600",
+        "bitfields": [
+            {
+                "name": "DP_SET_POWER_D0",
+                "value": "0x1"
+            },
+            {
+                "name": "DP_SET_POWER_D3",
+                "value": "0x2"
+            },
+            {
+                "name": "DP_SET_POWER_MASK",
+                "value": "0x3"
+            },
+            {
+                "name": "DP_SET_POWER_D3_AUX_ON",
+                "value": "0x5"
+            }
+        ]
+    },
+    "DP_SIDEBAND": {
+        "DP_SIDEBAND_MSG_DOWN_REQ_BASE": {
+            "address": "0x1000"
+        },
+        "DP_SIDEBAND_MSG_UP_REP_BASE": {
+            "address": "0x1200"
+        },
+        "DP_SIDEBAND_MSG_DOWN_REP_BASE": {
+            "address": "0x1400"
+        },
+        "DP_SIDEBAND_MSG_UP_REQ_BASE": {
+            "address": "0x1600"
+        },
+        "DP_SIDEBAND_REPLY_ACK": {
+            "address": "0x00"
+        },
+        "DP_SIDEBAND_REPLY_NAK": {
+            "address": "0x01"
+        }
+    },
+    "DP_SYNCHRONIZATION_LATENCY_IN_SINK": {
+        "address": "0x2009",
+        "bitfields": [
+            {
+                "name": "DP_MAX_RESYNC_FRAME_COUNT_MASK",
+                "value": "(0xf << 0)"
+            },
+            {
+                "name": "DP_MAX_RESYNC_FRAME_COUNT_SHIFT",
+                "value": "0"
+            },
+            {
+                "name": "DP_LAST_ACTUAL_SYNCHRONIZATION_LATENCY_MASK",
+                "value": "(0xf << 4)"
+            },
+            {
+                "name": "DP_LAST_ACTUAL_SYNCHRONIZATION_LATENCY_SHIFT",
+                "value": "4"
+            }
+        ]
+    },
+    "DP_LAST_RECEIVED_PSR_SDP": {
+        "address": "0x200a",
+        "bitfields": [
+            {
+                "name": "DP_PSR_STATE_BIT",
+                "value": "(1 << 0) /* eDP 1.2 */"
+            },
+            {
+                "name": "DP_UPDATE_RFB_BIT",
+                "value": "(1 << 1) /* eDP 1.2 */"
+            },
+            {
+                "name": "DP_CRC_VALID_BIT",
+                "value": "(1 << 2) /* eDP 1.2 */"
+            },
+            {
+                "name": "DP_SU_VALID",
+                "value": "(1 << 3) /* eDP 1.4 */"
+            },
+            {
+                "name": "DP_FIRST_SCAN_LINE_SU_REGION",
+                "value": "(1 << 4) /* eDP 1.4 */"
+            },
+            {
+                "name": "DP_LAST_SCAN_LINE_SU_REGION",
+                "value": "(1 << 5) /* eDP 1.4 */"
+            },
+            {
+                "name": "DP_Y_COORDINATE_VALID",
+                "value": "(1 << 6) /* eDP 1.4a */"
+            }
+        ]
+    },
+    "DP_DP13_DPCD_REV": {
+        "address": "0x2200"
+    },
+    "DP_DPRX": {
+        "DP_DPRX_FEATURE_ENUMERATION_LIST": {
+            "address": "0x2210",
+            "bitfields": [
+                {
+                    "name": "DP_GTC_CAP",
+                    "value": "(1 << 0)  /* DP 1.3 */"
+                },
+                {
+                    "name": "DP_SST_SPLIT_SDP_CAP",
+                    "value": "(1 << 1)  /* DP 1.4 */"
+                },
+                {
+                    "name": "DP_AV_SYNC_CAP",
+                    "value": "(1 << 2)  /* DP 1.3 */"
+                },
+                {
+                    "name": "DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED",
+                    "value": "(1 << 3)  /* DP 1.3 */"
+                },
+                {
+                    "name": "DP_VSC_EXT_VESA_SDP_SUPPORTED",
+                    "value": "(1 << 4)  /* DP 1.4 */"
+                },
+                {
+                    "name": "DP_VSC_EXT_VESA_SDP_CHAINING_SUPPORTED",
+                    "value": "(1 << 5)  /* DP 1.4 */"
+                },
+                {
+                    "name": "DP_VSC_EXT_CEA_SDP_SUPPORTED",
+                    "value": "(1 << 6)  /* DP 1.4 */"
+                },
+                {
+                    "name": "DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED",
+                    "value": "(1 << 7)  /* DP 1.4 */"
+                }
+            ]
+        },
+        "DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1": {
+            "address": "0x2214",
+            "bitfields": [
+                {
+                    "name": "DP_ADAPTIVE_SYNC_SDP_SUPPORTED",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE",
+                    "value": "GENMASK(1, 0)"
+                },
+                {
+                    "name": "DP_ADAPTIVE_SYNC_SDP_LENGTH",
+                    "value": "GENMASK(5, 0)"
+                },
+                {
+                    "name": "DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED",
+                    "value": "(1 << 4)"
+                }
+            ]
+        }
+    },
+    "DP_128B132B": {
+        "DP_128B132B_SUPPORTED_LINK_RATES": {
+            "address": "0x2215",
+            "bitfields": [
+                {
+                    "name": "DP_UHBR10",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_UHBR20",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_UHBR13_5",
+                    "value": "(1 << 2)"
+                }
+            ]
+        },
+        "DP_128B132B_TRAINING_AUX_RD_INTERVAL": {
+            "address": "0x2216",
+            "bitfields": [
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_1MS_UNIT",
+                    "value": "(1 << 7)"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK",
+                    "value": "0x7f"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US",
+                    "value": "0x00"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS",
+                    "value": "0x01"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS",
+                    "value": "0x02"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS",
+                    "value": "0x03"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS",
+                    "value": "0x04"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS",
+                    "value": "0x05"
+                },
+                {
+                    "name": "DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS",
+                    "value": "0x06"
+                }
+            ]
+        },
+        "DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1": {
+            "address": "0xf0022"
+        }
+    },
+    "DP_CEC": {
+        "DP_CEC_TUNNELING_CAPABILITY": {
+            "address": "0x3000",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_TUNNELING_CAPABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_CEC_SNOOPING_CAPABLE",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_CEC_MULTIPLE_LA_CAPABLE",
+                    "value": "(1 << 2)"
+                }
+            ]
+        },
+        "DP_CEC_TUNNELING_CONTROL": {
+            "address": "0x3001",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_TUNNELING_ENABLE",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_CEC_SNOOPING_ENABLE",
+                    "value": "(1 << 1)"
+                }
+            ]
+        },
+        "DP_CEC_RX_MESSAGE_INFO": {
+            "address": "0x3002",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_RX_MESSAGE_LEN_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_CEC_RX_MESSAGE_LEN_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_CEC_RX_MESSAGE_HPD_STATE",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_CEC_RX_MESSAGE_HPD_LOST",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_CEC_RX_MESSAGE_ACKED",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_CEC_RX_MESSAGE_ENDED",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_CEC_TX_MESSAGE_INFO": {
+            "address": "0x3003",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_TX_MESSAGE_LEN_MASK",
+                    "value": "(0xf << 0)"
+                },
+                {
+                    "name": "DP_CEC_TX_MESSAGE_LEN_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_CEC_TX_RETRY_COUNT_MASK",
+                    "value": "(0x7 << 4)"
+                },
+                {
+                    "name": "DP_CEC_TX_RETRY_COUNT_SHIFT",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_CEC_TX_MESSAGE_SEND",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_CEC_TUNNELING_IRQ_FLAGS": {
+            "address": "0x3004",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_RX_MESSAGE_INFO_VALID",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_CEC_RX_MESSAGE_OVERFLOW",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_CEC_TX_MESSAGE_SENT",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_CEC_TX_LINE_ERROR",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_CEC_TX_ADDRESS_NACK_ERROR",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_CEC_TX_DATA_NACK_ERROR",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_CEC_LOGICAL_ADDRESS_MASK": {
+            "address": "0x300E",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_0",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_1",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_2",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_3",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_4",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_5",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_6",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_7",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_CEC_LOGICAL_ADDRESS_MASK_2": {
+            "address": "0x300F",
+            "bitfields": [
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_8",
+                    "value": "(1 << 0)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_9",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_10",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_11",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_12",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_13",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_14",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_CEC_LOGICAL_ADDRESS_15",
+                    "value": "(1 << 7)"
+                }
+            ]
+        },
+        "DP_CEC_RX_MESSAGE_BUFFER": {
+            "address": "0x3010"
+        },
+        "DP_CEC_TX_MESSAGE_BUFFER": {
+            "address": "0x3020"
+        },
+        "DP_CEC_MESSAGE_BUFFER_LENGTH": {
+            "address": "0x10"
+        }
+    },
+    "DP_PROTOCOL": {
+        "DP_PROTOCOL_CONVERTER_CONTROL_0": {
+            "address": "0x3050",
+            "bitfields": [
+                {
+                    "name": "DP_HDMI_DVI_OUTPUT_CONFIG",
+                    "value": "(1 << 0) /* DP 1.3 */"
+                }
+            ]
+        },
+        "DP_PROTOCOL_CONVERTER_CONTROL_1": {
+            "address": "0x3051",
+            "bitfields": [
+                {
+                    "name": "DP_CONVERSION_TO_YCBCR420_ENABLE",
+                    "value": "(1 << 0) /* DP 1.3 */"
+                },
+                {
+                    "name": "DP_HDMI_EDID_PROCESSING_DISABLE",
+                    "value": "(1 << 1) /* DP 1.4 */"
+                },
+                {
+                    "name": "DP_HDMI_AUTONOMOUS_SCRAMBLING_DISABLE",
+                    "value": "(1 << 2) /* DP 1.4 */"
+                },
+                {
+                    "name": "DP_HDMI_FORCE_SCRAMBLING",
+                    "value": "(1 << 3) /* DP 1.4 */"
+                }
+            ]
+        },
+        "DP_PROTOCOL_CONVERTER_CONTROL_2": {
+            "address": "0x3052",
+            "bitfields": [
+                {
+                    "name": "DP_CONVERSION_TO_YCBCR422_ENABLE",
+                    "value": "(1 << 0) /* DP 1.3 */"
+                },
+                {
+                    "name": "DP_PCON_ENABLE_DSC_ENCODER",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_PCON_ENCODER_PPS_OVERRIDE_MASK",
+                    "value": "(0x3 << 2)"
+                },
+                {
+                    "name": "DP_PCON_ENC_PPS_OVERRIDE_DISABLED",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_PCON_ENC_PPS_OVERRIDE_EN_PARAMS",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_PCON_ENC_PPS_OVERRIDE_EN_BUFFER",
+                    "value": "2"
+                },
+                {
+                    "name": "DP_CONVERSION_RGB_YCBCR_MASK",
+                    "value": "(7 << 4)"
+                },
+                {
+                    "name": "DP_CONVERSION_BT601_RGB_YCBCR_ENABLE",
+                    "value": "(1 << 4)"
+                },
+                {
+                    "name": "DP_CONVERSION_BT709_RGB_YCBCR_ENABLE",
+                    "value": "(1 << 5)"
+                },
+                {
+                    "name": "DP_CONVERSION_BT2020_RGB_YCBCR_ENABLE",
+                    "value": "(1 << 6)"
+                }
+            ]
+        }
+    },
+    "DP_HDCP": {
+        "DP_HDCP_2_2_REG_RTX_OFFSET": {
+            "address": "0x69000"
+        },
+        "DP_HDCP_2_2_REG_TXCAPS_OFFSET": {
+            "address": "0x69008"
+        },
+        "DP_HDCP_2_2_REG_CERT_RX_OFFSET": {
+            "address": "0x6900B"
+        },
+        "DP_HDCP_2_2_REG_RRX_OFFSET": {
+            "address": "0x69215"
+        },
+        "DP_HDCP_2_2_REG_RX_CAPS_OFFSET": {
+            "address": "0x6921D"
+        },
+        "DP_HDCP_2_2_REG_EKPUB_KM_OFFSET": {
+            "address": "0x69220"
+        },
+        "DP_HDCP_2_2_REG_EKH_KM_WR_OFFSET": {
+            "address": "0x692A0"
+        },
+        "DP_HDCP_2_2_REG_M_OFFSET": {
+            "address": "0x692B0"
+        },
+        "DP_HDCP_2_2_REG_HPRIME_OFFSET": {
+            "address": "0x692C0"
+        },
+        "DP_HDCP_2_2_REG_EKH_KM_RD_OFFSET": {
+            "address": "0x692E0"
+        },
+        "DP_HDCP_2_2_REG_RN_OFFSET": {
+            "address": "0x692F0"
+        },
+        "DP_HDCP_2_2_REG_LPRIME_OFFSET": {
+            "address": "0x692F8"
+        },
+        "DP_HDCP_2_2_REG_EDKEY_KS_OFFSET": {
+            "address": "0x69318"
+        },
+        "DP_HDCP_2_2_REG_RIV_OFFSET": {
+            "address": "0x69328"
+        },
+        "DP_HDCP_2_2_REG_RXINFO_OFFSET": {
+            "address": "0x69330"
+        },
+        "DP_HDCP_2_2_REG_SEQ_NUM_V_OFFSET": {
+            "address": "0x69332"
+        },
+        "DP_HDCP_2_2_REG_VPRIME_OFFSET": {
+            "address": "0x69335"
+        },
+        "DP_HDCP_2_2_REG_RECV_ID_LIST_OFFSET": {
+            "address": "0x69345"
+        },
+        "DP_HDCP_2_2_REG_V_OFFSET": {
+            "address": "0x693E0"
+        },
+        "DP_HDCP_2_2_REG_SEQ_NUM_M_OFFSET": {
+            "address": "0x693F0"
+        },
+        "DP_HDCP_2_2_REG_K_OFFSET": {
+            "address": "0x693F3"
+        },
+        "DP_HDCP_2_2_REG_STREAM_ID_TYPE_OFFSET": {
+            "address": "0x693F5"
+        },
+        "DP_HDCP_2_2_REG_MPRIME_OFFSET": {
+            "address": "0x69473"
+        },
+        "DP_HDCP_2_2_REG_RXSTATUS_OFFSET": {
+            "address": "0x69493"
+        },
+        "DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET": {
+            "address": "0x69494"
+        },
+        "DP_HDCP_2_2_REG_DBG_OFFSET": {
+            "address": "0x69518"
+        }
+    },
+    "DP_TUNNELING": {
+        "DP_TUNNELING_OUI": {
+            "address": "0xe0000",
+            "bitfields": [
+                {
+                    "name": "DP_TUNNELING_OUI_BYTES",
+                    "value": "3"
+                }
+            ]
+        },
+        "DP_TUNNELING_DEV_ID": {
+            "address": "0xe0003",
+            "bitfields": [
+                {
+                    "name": "DP_TUNNELING_DEV_ID_BYTES",
+                    "value": "6"
+                }
+            ]
+        },
+        "DP_TUNNELING_HW_REV": {
+            "address": "0xe0009",
+            "bitfields": [
+                {
+                    "name": "DP_TUNNELING_HW_REV_MAJOR_SHIFT",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_TUNNELING_HW_REV_MAJOR_MASK",
+                    "value": "(0xf << DP_TUNNELING_HW_REV_MAJOR_SHIFT)"
+                },
+                {
+                    "name": "DP_TUNNELING_HW_REV_MINOR_SHIFT",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_TUNNELING_HW_REV_MINOR_MASK",
+                    "value": "(0xf << DP_TUNNELING_HW_REV_MINOR_SHIFT)"
+                }
+            ]
+        },
+        "DP_TUNNELING_SW_REV_MAJOR": {
+            "address": "0xe000a"
+        },
+        "DP_TUNNELING_SW_REV_MINOR": {
+            "address": "0xe000b"
+        },
+        "DP_TUNNELING_CAPABILITIES": {
+            "address": "0xe000d",
+            "bitfields": [
+                {
+                    "name": "DP_IN_BW_ALLOCATION_MODE_SUPPORT",
+                    "value": "(1 << 7)"
+                },
+                {
+                    "name": "DP_PANEL_REPLAY_OPTIMIZATION_SUPPORT",
+                    "value": "(1 << 6)"
+                },
+                {
+                    "name": "DP_TUNNELING_SUPPORT",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_TUNNELING_STATUS": {
+            "address": "0xe0025",
+            "bitfields": [
+                {
+                    "name": "DP_BW_ALLOCATION_CAPABILITY_CHANGED",
+                    "value": "(1 << 3)"
+                },
+                {
+                    "name": "DP_ESTIMATED_BW_CHANGED",
+                    "value": "(1 << 2)"
+                },
+                {
+                    "name": "DP_BW_REQUEST_SUCCEEDED",
+                    "value": "(1 << 1)"
+                },
+                {
+                    "name": "DP_BW_REQUEST_FAILED",
+                    "value": "(1 << 0)"
+                }
+            ]
+        },
+        "DP_TUNNELING_MAX_LINK_RATE": {
+            "address": "0xe0028"
+        },
+        "DP_TUNNELING_MAX_LANE_COUNT": {
+            "address": "0xe0029"
+        },
+        "DP_TUNNELING_MAX_LANE_COUNT_MASK": {
+            "address": "0x1f"
+        }
+    },
+    "DP_IN": {
+        "DP_IN_ADAPTER_INFO": {
+            "address": "0xe000e",
+            "bitfields": [
+                {
+                    "name": "DP_IN_ADAPTER_NUMBER_BITS",
+                    "value": "7"
+                },
+                {
+                    "name": "DP_IN_ADAPTER_NUMBER_MASK",
+                    "value": "((1 << DP_IN_ADAPTER_NUMBER_BITS) - 1)"
+                }
+            ]
+        },
+        "DP_IN_ADAPTER_TUNNEL_INFORMATION": {
+            "address": "0xe0021",
+            "bitfields": [
+                {
+                    "name": "DP_GROUP_ID_BITS",
+                    "value": "3"
+                },
+                {
+                    "name": "DP_GROUP_ID_MASK",
+                    "value": "((1 << DP_GROUP_ID_BITS) - 1)"
+                }
+            ]
+        }
+    },
+    "DP_USB4": {
+        "DP_USB4_DRIVER_ID": {
+            "address": "0xe000f",
+            "bitfields": [
+                {
+                    "name": "DP_USB4_DRIVER_ID_BITS",
+                    "value": "4"
+                },
+                {
+                    "name": "DP_USB4_DRIVER_ID_MASK",
+                    "value": "((1 << DP_USB4_DRIVER_ID_BITS) - 1)"
+                }
+            ]
+        },
+        "DP_USB4_DRIVER_BW_CAPABILITY": {
+            "address": "0xe0020",
+            "bitfields": [
+                {
+                    "name": "DP_USB4_DRIVER_BW_ALLOCATION_MODE_SUPPORT",
+                    "value": "(1 << 7)"
+                }
+            ]
+        }
+    },
+    "DP_BW": {
+        "DP_BW_GRANULARITY": {
+            "address": "0xe0022"
+        },
+        "DP_BW_GRANULARITY_MASK": {
+            "address": "0x3"
+        }
+    },
+    "DP_ESTIMATED_BW": {
+        "address": "0xe0023"
+    },
+    "DP_ALLOCATED_BW": {
+        "address": "0xe0024"
+    },
+    "DP_DPTX_BW_ALLOCATION_MODE_CONTROL": {
+        "address": "0xe0030",
+        "bitfields": [
+            {
+                "name": "DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE",
+                "value": "(1 << 7)"
+            },
+            {
+                "name": "DP_UNMASK_BW_ALLOCATION_IRQ",
+                "value": "(1 << 6)"
+            }
+        ]
+    },
+    "DP_REQUEST_BW": {
+        "address": "0xe0031",
+        "bitfields": [
+            {
+                "name": "MAX_DP_REQUEST_BW",
+                "value": "255"
+            }
+        ]
+    },
+    "DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV": {
+        "address": "0xf0000"
+    },
+    "DP_Repeater_FEC_CAPABILITY": {
+        "address": "0xf0004"
+    },
+    "_": {
+        "__DP_LTTPR1_BASE": {
+            "address": "0xf0010"
+        },
+        "__DP_LTTPR2_BASE": {
+            "address": "0xf0060"
+        },
+        "__DP_FEC1_BASE": {
+            "address": "0xf0290"
+        },
+        "__DP_FEC2_BASE": {
+            "address": "0xf0298"
+        }
+    },
+    "DP_TRANSMITTER_CAPABILITY_PHY_REPEATER1": {
+        "address": "0xf0021",
+        "bitfields": [
+            {
+                "name": "DP_VOLTAGE_SWING_LEVEL_3_SUPPORTED",
+                "value": "BIT(0)"
+            },
+            {
+                "name": "DP_PRE_EMPHASIS_LEVEL_3_SUPPORTED",
+                "value": "BIT(1)"
+            }
+        ]
+    },
+    "DP_SYMBOL": {
+        "DP_SYMBOL_ERROR_COUNT_LANE0_PHY_REPEATER1": {
+            "address": "0xf0035"
+        },
+        "DP_SYMBOL_ERROR_COUNT_LANE1_PHY_REPEATER1": {
+            "address": "0xf0037"
+        },
+        "DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1": {
+            "address": "0xf0039"
+        },
+        "DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1": {
+            "address": "0xf003b"
+        }
+    },
+    "DP_OUI_PHY_REPEATER1": {
+        "address": "0xf003d"
+    },
+    "DP_LTTPR_MAX_ADD": {
+        "address": "0xf02ff"
+    },
+    "DP_PEER": {
+        "DP_PEER_DEVICE_NONE": {
+            "address": "0x0"
+        },
+        "DP_PEER_DEVICE_SOURCE_OR_SST": {
+            "address": "0x1"
+        },
+        "DP_PEER_DEVICE_MST_BRANCHING": {
+            "address": "0x2"
+        },
+        "DP_PEER_DEVICE_SST_SINK": {
+            "address": "0x3"
+        },
+        "DP_PEER_DEVICE_DP_LEGACY_CONV": {
+            "address": "0x4"
+        }
+    },
+    "DP_GET_MSG_TRANSACTION_VERSION": {
+        "address": "0x00"
+    },
+    "DP_CONNECTION_STATUS_NOTIFY": {
+        "address": "0x02"
+    },
+    "DP_ENUM_PATH_RESOURCES": {
+        "address": "0x10"
+    },
+    "DP_ALLOCATE_PAYLOAD": {
+        "address": "0x11"
+    },
+    "DP_QUERY": {
+        "DP_QUERY_PAYLOAD": {
+            "address": "0x12"
+        },
+        "DP_QUERY_STREAM_ENC_STATUS": {
+            "address": "0x38",
+            "bitfields": [
+                {
+                    "name": "DP_QUERY_STREAM_ENC_STATUS_STATE_NO_EXIST",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_QUERY_STREAM_ENC_STATUS_STATE_INACTIVE",
+                    "value": "1"
+                },
+                {
+                    "name": "DP_QUERY_STREAM_ENC_STATUS_STATE_ACTIVE",
+                    "value": "2"
+                }
+            ]
+        }
+    },
+    "DP_RESOURCE_STATUS_NOTIFY": {
+        "address": "0x13"
+    },
+    "DP_CLEAR_PAYLOAD_ID_TABLE": {
+        "address": "0x14"
+    },
+    "DP_REMOTE": {
+        "DP_REMOTE_DPCD_READ": {
+            "address": "0x20"
+        },
+        "DP_REMOTE_DPCD_WRITE": {
+            "address": "0x21"
+        },
+        "DP_REMOTE_I2C_READ": {
+            "address": "0x22"
+        },
+        "DP_REMOTE_I2C_WRITE": {
+            "address": "0x23"
+        }
+    },
+    "DP_POWER": {
+        "DP_POWER_UP_PHY": {
+            "address": "0x24"
+        },
+        "DP_POWER_DOWN_PHY": {
+            "address": "0x25"
+        }
+    },
+    "DP_NAK": {
+        "DP_NAK_WRITE_FAILURE": {
+            "address": "0x01"
+        },
+        "DP_NAK_INVALID_READ": {
+            "address": "0x02"
+        },
+        "DP_NAK_CRC_FAILURE": {
+            "address": "0x03"
+        },
+        "DP_NAK_BAD_PARAM": {
+            "address": "0x04"
+        },
+        "DP_NAK_DEFER": {
+            "address": "0x05"
+        },
+        "DP_NAK_LINK_FAILURE": {
+            "address": "0x06"
+        },
+        "DP_NAK_NO_RESOURCES": {
+            "address": "0x07"
+        },
+        "DP_NAK_DPCD_FAIL": {
+            "address": "0x08"
+        },
+        "DP_NAK_I2C_NAK": {
+            "address": "0x09"
+        },
+        "DP_NAK_ALLOCATE_FAIL": {
+            "address": "0x0a",
+            "bitfields": [
+                {
+                    "name": "MODE_I2C_START",
+                    "value": "1"
+                },
+                {
+                    "name": "MODE_I2C_WRITE",
+                    "value": "2"
+                },
+                {
+                    "name": "MODE_I2C_READ",
+                    "value": "4"
+                },
+                {
+                    "name": "MODE_I2C_STOP",
+                    "value": "8"
+                },
+                {
+                    "name": "DP_MST_PHYSICAL_PORT_0",
+                    "value": "0"
+                },
+                {
+                    "name": "DP_MST_LOGICAL_PORT_0",
+                    "value": "8"
+                }
+            ]
+        }
+    },
+    "EDP_SDP": {
+        "EDP_SDP_HEADER_REVISION_MASK": {
+            "address": "0x1F"
+        },
+        "EDP_SDP_HEADER_VALID_PAYLOAD_BYTES": {
+            "address": "0x1F"
+        }
+    }
+}
\ No newline at end of file
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
index a6a6275f7..f179fa374 100644
--- a/tools/displaytop/include/data.h
+++ b/tools/displaytop/include/data.h
@@ -35,5 +35,18 @@ extern Node *root; /* shared throughout the program */
 #define DRM_RENDER_PREFIX "renderD"
 
 #define DEBUGFS_DRI_PATH "/sys/kernel/debug/dri"
+#define DPCD_SIZE 1
+#define DPCD_PATH "/dev"
+#define DPCD_JSON_FILE "dpcd.json"
+#define DATA_SUBDIR "/tools/displaytop/data/"
+
+typedef struct
+{
+    char *card_name;
+    char *dp_name;
+} DP_mapping;
+
+DP_mapping **get_dp_mapping_storage(void);
+int *get_dp_mapping_count_ptr(void);
 
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
index dc9e9b4d2..b8f997c69 100644
--- a/tools/displaytop/include/display.h
+++ b/tools/displaytop/include/display.h
@@ -44,5 +44,6 @@ void display_framebuffer(WINDOW *pad, Node *node, int *content_line);
 void display_summary(WINDOW *pad, Node *node, int *content_line);
 
 void display_debugfs_file(WINDOW *pad, Node *node, int *content_line);
+void display_dpcd(WINDOW *pad, Node *node, int *content_line);
 
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
index fee62bbb1..b164f2f78 100644
--- a/tools/displaytop/include/populate.h
+++ b/tools/displaytop/include/populate.h
@@ -34,5 +34,6 @@ void populate_data(void);
 
 void initialize_display_config(void);
 void initialize_display_debugfs(void);
+void initialize_DPCD(void);
 
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
index 17af75b8c..1e06100c5 100644
--- a/tools/displaytop/include/utils.h
+++ b/tools/displaytop/include/utils.h
@@ -57,6 +57,8 @@
 #include <drm/i915_drm.h>
 #include <drm/drm_fourcc.h>
 
+#include <cjson/cJSON.h>
+
 #include "log.h"
 #include "node.h"
 #include "data.h"
@@ -99,7 +101,7 @@ void ensure_dump_directory(void);
 void strip_whitespace(char *str);
 char *read_file(const char *filename);
 
-char *get_file_path(const char *filename);
+char *get_data_file_path(const char *filename);
 
 /* utils_drm.c */
 char *find_drm_device(bool primary);
@@ -113,5 +115,8 @@ const char *get_connector_type_name(uint32_t connector_type);
 const char *get_encoder_type_name(uint32_t encoder_type);
 
 char *find_debugfs_dir(void);
+int read_dpcd_registers(const char *aux_path, unsigned char *buffer, size_t size, uint64_t offset);
+
+uint64_t parse_hex_address(const char *hex_str);
 
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
index 1f51a3cf2..ecf661a85 100644
--- a/tools/displaytop/meson.build
+++ b/tools/displaytop/meson.build
@@ -26,8 +26,9 @@ ncurses_dep = dependency('ncurses', required: false)
 menu_dep    = dependency('menu', required: false)
 form_dep    = dependency('form', required: false)
 panel_dep   = dependency('panel', required: false)
+cjson_dep   = cc.find_library('cjson', required: false)
 
-have_displaytop = ncurses_dep.found() and menu_dep.found() and form_dep.found() and panel_dep.found()
+have_displaytop = ncurses_dep.found() and menu_dep.found() and form_dep.found() and panel_dep.found() and cjson_dep.found()
 
 if have_displaytop
   message('All dependencies found. Building displaytop.')
@@ -38,6 +39,7 @@ if have_displaytop
     menu_dep,
     form_dep,
     panel_dep,
+    cjson_dep,
   ]
   # Source files
   source = files(
@@ -60,6 +62,9 @@ if have_displaytop
     'src/utils_search.c',
     'src/populate_display_debugfs.c',
     'src/display_debugfs.c',
+    'src/display_DPCD.c',
+    'src/populate_DPCD.c',
+    'src/utils_registers.c',
   )
 
   if meson.is_subproject()
@@ -99,4 +104,4 @@ if have_displaytop
 
 else
   message('Skipping displaytop: missing required optional dependencies.')
-endif
\ No newline at end of file
+endif
diff --git a/tools/displaytop/src/data.c b/tools/displaytop/src/data.c
index 3aed6292b..62e9994fc 100644
--- a/tools/displaytop/src/data.c
+++ b/tools/displaytop/src/data.c
@@ -26,4 +26,17 @@
 
 /* This file holds all the global variables that are being used in the tool */
 
-Node *root;
\ No newline at end of file
+Node *root;
+
+static DP_mapping *dp_mappings = NULL;
+static int dp_mapping_count = 0;
+
+DP_mapping **get_dp_mapping_storage(void)
+{
+    return &dp_mappings;
+}
+
+int *get_dp_mapping_count_ptr(void)
+{
+    return &dp_mapping_count;
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/display_DPCD.c b/tools/displaytop/src/display_DPCD.c
new file mode 100644
index 000000000..39d6a8c8d
--- /dev/null
+++ b/tools/displaytop/src/display_DPCD.c
@@ -0,0 +1,277 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "display.h"
+#include "utils.h"
+#include "data.h"
+
+/**
+ * @brief Reads DPCD (DisplayPort Configuration Data) registers.
+ *
+ * This function reads a specified number of bytes from the DPCD registers
+ * starting at a given offset and stores the data in the provided buffer.
+ *
+ * @param aux_path The path to the AUX device file.
+ * @param buffer A pointer to the buffer where the read data will be stored.
+ * @param size The number of bytes to read from the DPCD registers.
+ * @param offset The starting offset in the DPCD registers from which to begin reading.
+ * @return An integer indicating the success or failure of the read operation.
+ *         Typically, 0 indicates success, while a negative value indicates an error.
+ */
+int read_dpcd_registers(const char *aux_path, unsigned char *buffer, size_t size, uint64_t offset)
+{
+    FILE *fp = NULL;
+    size_t bytes_read = 0;
+
+    fp = fopen(aux_path, "rb");
+    if (!fp)
+    {
+        log_message(LOG_ERROR, "Failed to open DPCD AUX path: %s", aux_path);
+        return -1;
+    }
+
+    if (fseek(fp, offset, SEEK_SET) != 0)
+    {
+        log_message(LOG_ERROR, "Failed to seek to offset %ld in %s", offset, aux_path);
+        fclose(fp);
+        return -1;
+    }
+
+    bytes_read = fread(buffer, 1, size, fp);
+    fclose(fp);
+
+    if (bytes_read != size)
+    {
+        log_message(LOG_WARNING, "Expected %zu bytes but read %zu bytes", size, bytes_read);
+    }
+
+    return (int)bytes_read;
+}
+
+/**
+ * @brief Displays DPCD (DisplayPort Configuration Data) information on a given pad window.
+ *
+ * This function takes a pad window, a JSON object representing the DPCD register data,
+ * and a pointer to an integer representing the current line number. It displays the
+ * DPCD data on the pad window, starting from the specified line.
+ *
+ * @param pad A pointer to the pad window where the DPCD data will be displayed.
+ * @param reg A cJSON object containing the DPCD register data.
+ * @param line A pointer to an integer representing the current line number. This will be
+ *             updated as the function writes data to the pad window.
+ */
+static void display_dpcd_data(WINDOW *pad, cJSON *reg, int *line)
+{
+    int width, col_widths[2], bitFieldCount = 0;
+    cJSON *bitField, *bitFieldItem, *name, *value;
+    char *name_buffer, *value_buffer;
+
+    if (!cJSON_IsObject(reg))
+    {
+        print_red_text(pad, (*line)++, 1, "Invalid JSON object");
+        return;
+    }
+
+    bitField = cJSON_GetObjectItem(reg, "bitfields");
+    if (!bitField)
+    {
+        print_red_text(pad, (*line)++, 1, "Bitfields not found in Register");
+        return;
+    }
+
+    print_bold_text(pad, (*line)++, 1, "Bitfield Information: ");
+    (*line)++;
+
+    width = getmaxx(pad);
+    width -= 2;
+    width -= 3;
+
+    col_widths[0] = (int)(width * 0.30f) - 2;
+    col_widths[1] = (int)(width * 0.70f) - 2;
+
+    if (cJSON_IsArray(bitField))
+        bitFieldCount = cJSON_GetArraySize(bitField);
+    else
+        bitFieldCount = 1;
+
+    wattron(pad, A_BOLD);
+    mvwprintw(pad, (*line)++, 1, "| %-*s | %-*s |", col_widths[0], "BitField", col_widths[1], "Value & Description");
+    wattroff(pad, A_BOLD);
+
+    for (int i = 0; i < bitFieldCount; i++)
+    {
+        if (cJSON_IsArray(bitField))
+            bitFieldItem = cJSON_GetArrayItem(bitField, i);
+        else
+            bitFieldItem = bitField;
+
+        name = cJSON_GetObjectItem(bitFieldItem, "name");
+        value = cJSON_GetObjectItem(bitFieldItem, "value");
+
+        name_buffer = name && cJSON_IsString(name) ? strdup(name->valuestring) : strdup("NA");
+        value_buffer = value && cJSON_IsString(value) ? strdup(value->valuestring) : strdup("NA");
+
+        mvwprintw(pad, (*line)++, 1, "| %-*s | %-*s |", col_widths[0], name_buffer, col_widths[1], value_buffer);
+
+        free(value_buffer);
+        free(name_buffer);
+    }
+}
+
+/**
+ * @brief Displays the DPCD (DisplayPort Configuration Data) information for a given node.
+ *
+ * This function finds the parent node with "DP" in its name, retrieves the corresponding
+ * DPCD AUX path, reads the DPCD JSON file to get the register offset, and then reads
+ * and displays the DPCD register data.
+ *
+ * @param pad The window pad where the information will be displayed.
+ * @param node The node for which the DPCD information is to be displayed.
+ * @param content_line Pointer to an integer that will be updated with the current line number.
+ *
+ * The function performs the following steps:
+ * 1. Finds the parent node with "DP" in its name.
+ * 2. Retrieves the corresponding DPCD AUX path from the DP mappings.
+ * 3. Reads the DPCD JSON file to get the register offset for the node.
+ * 4. Reads the DPCD register data from the DPCD AUX path.
+ * 5. Displays the DPCD register data and additional information on the pad.
+ *
+ * If any step fails, an appropriate error message is displayed on the pad.
+ */
+void display_dpcd(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    Node *parent = node;
+    DP_mapping *mappings = *get_dp_mapping_storage();
+    int count = *get_dp_mapping_count_ptr();
+    char dpcd_aux_path[256] = "";
+    char *json_data = NULL;
+    cJSON *json = NULL, *node_item = NULL, *Address = NULL;
+    uint64_t offset = 0;
+    unsigned char dpcd_buffer[DPCD_SIZE] = {0};
+
+    while (parent != NULL && strstr(parent->name, "DP ") == NULL)
+    {
+        parent = parent->parent;
+    }
+
+    if (parent == NULL)
+    {
+        print_red_text(pad, line++, 1, "No parent with 'DP' found");
+        *content_line = line;
+        return;
+    }
+
+    for (int i = 0; i < count; i++)
+    {
+        if (strcmp(mappings[i].card_name, parent->name) == 0)
+        {
+            snprintf(dpcd_aux_path, sizeof(dpcd_aux_path), "/dev/%s", mappings[i].dp_name);
+            break;
+        }
+    }
+
+    print_bold_text(pad, line++, 1, "DPCD AUX Path: %s\n", dpcd_aux_path);
+
+    json_data = read_file(get_data_file_path(DPCD_JSON_FILE));
+    if (!json_data)
+    {
+        print_red_text(pad, line++, 1, "Failed to read DPCD JSON file");
+        *content_line = line;
+        return;
+    }
+
+    json = cJSON_Parse(json_data);
+    if (!json)
+    {
+        print_red_text(pad, line++, 1, "Failed to parse DPCD JSON content");
+        free(json_data);
+        *content_line = line;
+        return;
+    }
+
+    node_item = cJSON_GetObjectItemCaseSensitive(json, node->name);
+    if (!node_item)
+    {
+        cJSON *child = NULL;
+        cJSON_ArrayForEach(child, json)
+        {
+            node_item = cJSON_GetObjectItemCaseSensitive(child, node->name);
+            if (node_item)
+            {
+                break;
+            }
+        }
+    }
+
+    if (!node_item)
+    {
+        print_red_text(pad, line++, 1, "Node item '%s' not found in JSON", node->name);
+        cJSON_Delete(json);
+        free(json_data);
+        *content_line = line;
+        return;
+    }
+
+    Address = cJSON_GetObjectItem(node_item, "address");
+    if (Address)
+    {
+        offset = parse_hex_address(Address->valuestring);
+    }
+    else
+    {
+        print_red_text(pad, line++, 1, "Address not found in Register");
+        return;
+    }
+
+    line++;
+    print_bold_text(pad, line++, 1, "DPCD Register: %s", node->name);
+    print_green_text(pad, line++, 1, "DPCD Register Offset: 0x%lx", offset);
+    line++;
+
+    if (read_dpcd_registers(dpcd_aux_path, dpcd_buffer, DPCD_SIZE, offset) > 0)
+    {
+        print_bold_text(pad, line++, 1, "DPCD Data:");
+        print_bold_text(pad, line++, 1, "-------------------------------------------------");
+        for (int i = 0; i < DPCD_SIZE; i++)
+        {
+            mvwprintw(pad, line++, 1, "0x%02x (", dpcd_buffer[i]);
+            for (int bit = 7; bit >= 0; bit--)
+            {
+                wprintw(pad, "%d", (dpcd_buffer[i] >> bit) & 1);
+            }
+            wprintw(pad, ")");
+        }
+        print_bold_text(pad, line++, 1, "-------------------------------------------------");
+    }
+    else
+    {
+        print_red_text(pad, line++, 1, "Failed to read DPCD registers");
+    }
+
+    line++;
+    display_dpcd_data(pad, node_item, &line);
+
+    *content_line = line;
+    return;
+}
diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
index fe8cd215c..312ac0fd9 100644
--- a/tools/displaytop/src/populate.c
+++ b/tools/displaytop/src/populate.c
@@ -30,4 +30,5 @@ void populate_data(void)
 
     initialize_display_config();
     initialize_display_debugfs();
+    initialize_DPCD();
 }
diff --git a/tools/displaytop/src/populate_DPCD.c b/tools/displaytop/src/populate_DPCD.c
new file mode 100644
index 000000000..25c3faedb
--- /dev/null
+++ b/tools/displaytop/src/populate_DPCD.c
@@ -0,0 +1,250 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "data.h"
+#include "populate.h"
+
+#define DRM_PATH "/sys/class/drm"
+
+static char *find_dp_card(const char *dp_aux)
+{
+    struct dirent *entry;
+    DIR *dp;
+    DP_mapping **dp_mappings;
+    int *dp_mapping_count;
+    char *result;
+    char aux_path[512];
+    char *dp_name;
+    char *formatted_name;
+    char *p;
+
+    dp = opendir(DRM_PATH);
+    if (!dp)
+    {
+        log_message(LOG_ERROR, "Failed to open DRM path");
+        return NULL;
+    }
+
+    dp_mappings = get_dp_mapping_storage();
+    dp_mapping_count = get_dp_mapping_count_ptr();
+    result = NULL;
+
+    while ((entry = readdir(dp)) != NULL)
+    {
+        if (strstr(entry->d_name, "card") && strstr(entry->d_name, "-DP"))
+        {
+            snprintf(aux_path, sizeof(aux_path), "%s/%s/%s", DRM_PATH, entry->d_name, dp_aux);
+
+            if (access(aux_path, F_OK) == 0)
+            {
+                *dp_mappings = realloc(*dp_mappings, (*dp_mapping_count + 1) * sizeof(DP_mapping));
+                if (!*dp_mappings)
+                {
+                    log_message(LOG_ERROR, "Failed to allocate memory for DP mappings");
+                    closedir(dp);
+                    return NULL;
+                }
+
+                dp_name = strstr(entry->d_name, "-DP") + 1;
+                formatted_name = strdup(dp_name);
+                if (!formatted_name)
+                {
+                    log_message(LOG_ERROR, "Failed to allocate memory for formatted name");
+                    closedir(dp);
+                    return NULL;
+                }
+
+                for (p = formatted_name; *p; p++)
+                {
+                    if (*p == '-')
+                    {
+                        *p = ' ';
+                    }
+                }
+
+                (*dp_mappings)[*dp_mapping_count].card_name = strdup(formatted_name);
+                (*dp_mappings)[*dp_mapping_count].dp_name = strdup(dp_aux);
+                if (!(*dp_mappings)[*dp_mapping_count].card_name || !(*dp_mappings)[*dp_mapping_count].dp_name)
+                {
+                    log_message(LOG_ERROR, "Failed to allocate memory for DP mapping names");
+                    free(formatted_name);
+                    closedir(dp);
+                    return NULL;
+                }
+                (*dp_mapping_count)++;
+
+                result = strdup(formatted_name);
+                free(formatted_name);
+                break;
+            }
+        }
+    }
+    closedir(dp);
+    return result;
+}
+
+static void process_DPCD_json_Helper(cJSON *json, Node *parentNode)
+{
+    cJSON *reg = NULL;
+    const char *name;
+    Node *currentNode;
+    cJSON *address;
+
+    cJSON_ArrayForEach(reg, json)
+    {
+        name = reg->string;
+        if (name)
+        {
+            currentNode = create_node(name, display_dpcd, parentNode);
+
+            address = cJSON_GetObjectItem(reg, "address");
+            if (!address)
+            {
+                currentNode->display_function = NULL;
+            }
+
+            if (cJSON_IsObject(reg) && !address)
+            {
+                process_DPCD_json_Helper(reg, currentNode);
+            }
+            add_child(parentNode, currentNode);
+        }
+    }
+}
+
+static void process_DPCD_json(Node *parentNode)
+{
+    FILE *file;
+    long fileSize;
+    char *jsonContent;
+    cJSON *json;
+
+    log_message(LOG_INFO, "Opening DPCD json file");
+    file = fopen(get_data_file_path(DPCD_JSON_FILE), "r");
+    if (!file)
+    {
+        log_message(LOG_ERROR, "Failed to open DPCD json file");
+        return;
+    }
+
+    log_message(LOG_INFO, "Reading DPCD json file");
+    fseek(file, 0, SEEK_END);
+    fileSize = ftell(file);
+    fseek(file, 0, SEEK_SET);
+
+    jsonContent = malloc(fileSize + 1);
+    if (!jsonContent)
+    {
+        log_message(LOG_ERROR, "Failed to allocate memory for json content");
+        fclose(file);
+        return;
+    }
+
+    fread(jsonContent, 1, fileSize, file);
+    jsonContent[fileSize] = '\0';
+    fclose(file);
+
+    log_message(LOG_INFO, "Parsing DPCD json content");
+    json = cJSON_Parse(jsonContent);
+    if (!json)
+    {
+        log_message(LOG_ERROR, "Failed to parse DPCD json");
+        free(jsonContent);
+        return;
+    }
+
+    process_DPCD_json_Helper(json, parentNode);
+
+    log_message(LOG_INFO, "Cleaning up");
+    cJSON_Delete(json);
+    free(jsonContent);
+}
+
+void initialize_DPCD(void)
+{
+    DIR *dir;
+    struct dirent *entry;
+    static char dpcd_path[256];
+    Node *DPCD;
+    char *dp_aux;
+
+    if (access(get_data_file_path(DPCD_JSON_FILE), F_OK) != 0)
+    {
+        log_message(LOG_ERROR, "DPCD json file does not exist");
+        return;
+    }
+
+    DPCD = create_node("DPCD Registers", NULL, root);
+    if (!DPCD)
+    {
+        log_message(LOG_ERROR, "Failed to create DPCD node");
+        log_message(LOG_ERROR, "malloc");
+        return;
+    }
+
+    dir = opendir(DPCD_PATH);
+    if (!dir)
+    {
+        log_message(LOG_ERROR, "Failed to open debugfs dri directory (Run as root?)");
+        return;
+    }
+
+    while ((entry = readdir(dir)) != NULL)
+    {
+        if (strstr(entry->d_name, "drm_dp") != NULL)
+        {
+            Node *dpcdNode;
+
+            if (snprintf(dpcd_path, sizeof(dpcd_path), "%s/%s", DPCD_PATH, entry->d_name) >= (int)sizeof(dpcd_path))
+            {
+                log_message(LOG_ERROR, "DPCD AUX path truncated: %s/%s", DPCD_PATH, entry->d_name);
+                continue;
+            }
+
+            log_message(LOG_INFO, "Found DPCD AUX path: %s", dpcd_path);
+
+            dp_aux = find_dp_card(entry->d_name);
+            if (!dp_aux)
+            {
+                log_message(LOG_ERROR, "Failed to find DP card for %s", entry->d_name);
+                continue;
+            }
+
+            dpcdNode = create_node(dp_aux, NULL, DPCD);
+            if (!dpcdNode)
+            {
+                log_message(LOG_ERROR, "Failed to create node for %s", dp_aux);
+                free(dp_aux);
+                closedir(dir);
+                return;
+            }
+
+            process_DPCD_json(dpcdNode);
+            add_child(DPCD, dpcdNode);
+            free(dp_aux);
+        }
+    }
+
+    closedir(dir);
+    add_child(root, DPCD);
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/utils.c b/tools/displaytop/src/utils.c
index ec8c8a649..6d1b305b4 100644
--- a/tools/displaytop/src/utils.c
+++ b/tools/displaytop/src/utils.c
@@ -23,6 +23,72 @@
 
 #include "utils.h"
 
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <limits.h>
+
+char *get_data_file_path(const char *filename) {
+    static char final_path[PATH_MAX];
+    char exe_path[PATH_MAX];
+    char base_path[PATH_MAX];
+    int written =0;
+    ssize_t len;
+    char *match;
+    char *cursor;
+    char *after;
+    size_t base_len;
+    size_t required_len;
+
+    len = readlink("/proc/self/exe", exe_path, sizeof(exe_path) - 1);
+    if (len == -1) {
+        log_message(LOG_ERROR, "readlink failed: %s\n", strerror(errno));
+        return NULL;
+    }
+    exe_path[len] = '\0';
+
+    match = NULL;
+    cursor = exe_path;
+    while ((cursor = strstr(cursor, "igt-gpu-tools"))) {
+        char next_char = cursor[strlen("igt-gpu-tools")];
+        if (next_char == '/' || next_char == '-' || next_char == '\0') {
+            match = cursor;
+        }
+        cursor += strlen("igt-gpu-tools");
+    }
+
+    if (!match) {
+        log_message(LOG_ERROR, "Could not find igt-gpu-tools directory in path: %s\n", exe_path);
+        return NULL;
+    }
+
+    after = strchr(match, '/');
+    base_len = after ? (size_t)(after - exe_path) : strlen(exe_path);
+
+    if (base_len >= sizeof(base_path)) {
+        log_message(LOG_ERROR, "Base path too long.\n");
+        return NULL;
+    }
+
+    memcpy(base_path, exe_path, base_len);
+    base_path[base_len] = '\0';
+
+    required_len = base_len + strlen(DATA_SUBDIR) + strlen(filename) + 1;
+    if (required_len >= sizeof(final_path)) {
+        log_message(LOG_ERROR, "Data file path too long. Buffer would overflow.\n");
+        return NULL;
+    }
+
+    written = snprintf(final_path, sizeof(final_path), "%s%s%s", base_path, DATA_SUBDIR, filename);
+    if (written < 0 || (size_t)written >= sizeof(final_path)) {
+        log_message(LOG_ERROR, "snprintf failed or truncated.\n");
+        return NULL;
+    }
+
+    return final_path;
+}
+
 char *read_file(const char *filename)
 {
     FILE *file;
diff --git a/tools/displaytop/src/utils_registers.c b/tools/displaytop/src/utils_registers.c
new file mode 100644
index 000000000..75b3d31e4
--- /dev/null
+++ b/tools/displaytop/src/utils_registers.c
@@ -0,0 +1,97 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
+
+/**
+ * @brief Parses a hexadecimal address string and converts it to a 64-bit unsigned integer.
+ *
+ * This function takes a hexadecimal string representation of an address, optionally
+ * cleans it by removing a trailing 'h' or 'H', and converts it to a uint64_t value.
+ * It also handles strings prefixed with "0x" or "0X".
+ *
+ * @param hex_str A pointer to the hexadecimal string to be parsed. The string can
+ *                optionally end with 'h' or 'H' and may start with "0x" or "0X".
+ *                Passing NULL or an empty string will result in an error.
+ *
+ * @return The parsed 64-bit unsigned integer address. If the input string is invalid
+ *         or the conversion fails, the function logs an error and returns 0.
+ *
+ * @note The function logs errors using the `log_message` function with the `LOG_ERROR` level
+ *       in the following cases:
+ *       - The input string is NULL or empty.
+ *       - Memory allocation fails while cleaning the input string.
+ *       - The input string cannot be converted to a valid hexadecimal number.
+ *
+ * @note The caller is responsible for ensuring that the input string is properly null-terminated.
+ */
+uint64_t parse_hex_address(const char *hex_str)
+{
+    size_t len;
+    char *cleaned = NULL;
+    char *start = NULL;
+    char *endptr;
+    uint64_t address = 0;
+
+    if (!hex_str || *hex_str == '\0')
+    {
+        log_message(LOG_ERROR, "Invalid hex string: NULL or empty");
+        return 0;
+    }
+
+    len = strlen(hex_str);
+
+    if (hex_str[len - 1] == 'h' || hex_str[len - 1] == 'H')
+    {
+        cleaned = strndup(hex_str, len - 1);
+    }
+    else
+    {
+        cleaned = strdup(hex_str);
+    }
+
+    if (!cleaned)
+    {
+        log_message(LOG_ERROR, "Memory allocation failed while cleaning hex string");
+        return 0;
+    }
+
+    start = cleaned;
+    if (cleaned[0] == '0' && (cleaned[1] == 'x' || cleaned[1] == 'X'))
+    {
+        start += 2;
+    }
+
+    errno = 0;
+    address = strtoull(start, &endptr, 16);
+
+    if (errno != 0 || *endptr != '\0')
+    {
+        log_message(LOG_ERROR, "Invalid hex string: conversion failed");
+        free(cleaned);
+        return 0;
+    }
+
+    free(cleaned);
+    return address;
+}
-- 
2.43.0

