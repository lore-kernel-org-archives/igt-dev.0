Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25099C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 21:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB54F10E7C0;
	Wed, 12 Mar 2025 21:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+7g8dZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC210E7C0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 21:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741815066; x=1773351066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rQOvm1+7HbYsys1nTvrWSHFa0OZfq/kKa4ScQKB95/Y=;
 b=X+7g8dZH72Z274MhhcvDeDwqoiMUkv/Pit8r1EvzGJ284Jna0z9fezbW
 iAi8yoWMNPoetsh98seAWWg4Z7N4tUue118OKhNmdlFLUqKZlWmhPi9MY
 nVrYMIUjF4PDiVE14wpNNxKzpm8wEs5wlEgjEC0lPdKBSeLlGu4TlgN4n
 BteDCoNe0CLJz1WMzIoxEJvgIZshlX+7DKe5CsdSSZ9Bv9jCCPXe83tng
 5FQs53cyrly25hR5Ccx0KAKykzMrzx3YX3dM3ZIwoQHIjfGlqgoHoSOP7
 mLEYdlE5qa+Mup5OHkOm0x8GiVH8Z9zu+BUtyuhTbM1tlpVQ7aR0S/BXS A==;
X-CSE-ConnectionGUID: J7INYUuvSMaqzWR/JVkjMg==
X-CSE-MsgGUID: AyCIVhT0Tga3DIRZ4lwH1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46564614"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46564614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:31:05 -0700
X-CSE-ConnectionGUID: gHdCyMzpSBuIKLrA07CQzQ==
X-CSE-MsgGUID: uhpbIQoXTGWe9KZ/LAAYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125639117"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 12 Mar 2025 14:31:05 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v1] tools/xe_guc_logger: Add guc logger for Xe
Date: Wed, 12 Mar 2025 14:30:57 -0700
Message-Id: <20250312213057.1374314-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add guc logger for Xe, support save guc log in LFD format.

Reference:
https://coredocs.intel.com/InterfaceDocs/sphinx/core/kmd_log_file_format.html?highlight=lfd

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

 tools/lfd.h           | 590 ++++++++++++++++++++++++++++++++++++++++
 tools/lfd_default.h   |  39 +++
 tools/meson.build     |   1 +
 tools/xe_guc_logger.c | 615 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1245 insertions(+)
 create mode 100644 tools/lfd.h
 create mode 100644 tools/lfd_default.h
 create mode 100644 tools/xe_guc_logger.c

diff --git a/tools/lfd.h b/tools/lfd.h
new file mode 100644
index 000000000..b29627f50
--- /dev/null
+++ b/tools/lfd.h
@@ -0,0 +1,590 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2016-2019 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_LFD_H_
+#define _INTEL_GUC_LFD_H_
+
+#include <stdint.h>
+
+/* The current major version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
+
+/* The current minor version of GuC-Log-File format. */
+#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
+
+/* Magic keys define */
+#define GUC_LOGFILE_LFD_MAGIC			0x8086
+#define LFD_DRIVER_KEY_1			0X808655CC
+#define LFD_DRIVER_KEY_1			0X808655CC
+#define LFD_DRIVER_KEY_1V2			0X808655DD
+#define LFD_DRIVER_KEY_2			0X8086EEAA
+#define LFD_DRIVER_KEY_2V2			0X8086EEBB
+#define LFD_DRIVER_KEY_STREAMING1		0X474C5346
+#define LFD_DRIVER_KEY_STREAMING2		0X8086AAAA
+#define LFD_DRIVER_KEY_STREAMING		0X8086AAAA474C5346
+#define LFD_LOG_BUFFER_MARKER_1			0XCABBA9E5
+#define LFD_LOG_BUFFER_MARKER_2			0XDEADFEED
+#define LFD_CRASH_DUMP_BUFFER_MARKER_1		0XCABBA9E5
+#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0X8086DEAD
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_1	0XCABBA9F6
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0XBEEFFEED
+#define LFD_LOG_BUFFER_MARKER_1V2		0XCABBA9E6
+#define LFD_CRASH_DUMP_BUFFER_MARKER_1V2	0XCABBA9E6
+#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0XCABBA9F7
+
+#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
+
+#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
+
+#define GUC_LOG_EVENT_ENTRY_FORMAT_VERSION		2
+
+#define LFD_MAGIC_SIM_KEY				0X900DFEED
+
+/* Log format descriptor type. */
+enum  guc_lfd_type_t {
+	/* Start of range for required LFDs from GuC. */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
+
+	/*
+	 * GuC Firmware Version structure. LFDs payload is
+	 * guc_lfd_data_fw_version_t
+	 */
+	GUC_LFD_TYPE_FW_VERSION = 0x1,
+
+	/*
+	 * GuC microcontroller device ID. LFDs payload is
+	 * guc_lfd_data_guc_devid_t
+	 */
+	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
+
+	/*
+	 * Frequency of GuC timestamps. LFDs payload is
+	 * guc_lfd_data_tsc_freq_t.
+	 */
+	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
+
+	/* Start of range for required LFDs from GuC. */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
+
+	/*
+	 * Log-event-entries buffer. LFDs payload is
+	 * guc_lfd_data_log_events_buf_t
+	 */
+	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
+
+	/*
+	 * GuC generated crash-dump blob. LFDs payload is
+	 * guc_lfd_data_fw_crashdump_t
+	 */
+	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
+
+	/* Start of range for required KMD LFDs. */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
+
+	/* An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t. */
+	GUC_LFD_TYPE_OS_ID = 0x4000,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
+
+	/* Start of range for optional KMD LFDs. */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
+
+	/*
+	 * Binary representation of GuC log-events schema.
+	 * LFDs TLV payload is guc_lfd_data_binary_schema_t
+	 */
+	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
+
+	/*
+	 * ASCII string containing comments from the host/KMD.
+	 * LFDs TLV payload is guc_lfd_data_host_comment_t
+	 */
+	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
+
+	/* Start of reserved range. */
+	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
+
+	/* End of this range. */
+	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
+};
+
+/* OS Type LFD-ID. */
+enum  guc_lfd_os_type_t {
+	/* Windows OS. */
+	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
+
+	/* Linux OS. */
+	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
+
+	/* VMWare OS. */
+	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
+
+	/* Other. */
+	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
+};
+
+/*
+ * Log format descriptor (LFD). A type of KLV with custom
+ * field-sizes + magic numbers.
+ */
+struct guc_logfile_lfd_t {
+	/* BR[15:0] Expected value: 0x8086. Helpful in detecting file errors. */
+	uint32_t magic : 16;
+
+	/*
+	 * BR[31:16] File descriptor type (the ‘T’ in TLV) is used to identify
+	 * how to interpret data below. For the range of types,
+	 * see guc_lfd_type_t
+	 */
+	uint32_t desc_type : 16;
+
+	/* Number of dwords the data field contains. */
+	uint32_t desc_dw_size;
+
+	/* Data defined by File descriptor type. */
+	uint32_t data[];
+};
+
+/*
+ * GuC Log File Format Version. Major-Minor is not a fractional number
+ * (i.e. Ver 1.3 would be older than 1.12)
+ */
+struct guc_logfile_fmt_ver_t {
+	/*
+	 * BR[15: 0] Guc-Log-File Format minor version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+	uint32_t minor_version : 16;
+
+	/*
+	 * BR[31:16] Guc-Log-File Format major version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+	uint32_t major_version : 16;
+};
+
+/*
+ * GuC Log Streaming-LFD-File Format. This structure encapsulates the layout of
+ * the guc-log-file format.
+ */
+struct guc_logfile_t {
+	/*
+	 * A magic number set by producer of a GuC log file to identify that
+	 * file is a valid guc-log-file containing a stream of LFDs:
+	 * Expected value: 0x8086AAAA474C5346.
+	 */
+	uint64_t magic;
+
+	/* Version of this file format layout as per guc_logfile_fmt_ver_t. */
+	struct guc_logfile_fmt_ver_t version;
+
+	/* A stream of one or more guc_logfile_lfd_t LFD data. */
+	struct guc_logfile_lfd_t lfd_stream[];
+};
+
+/* This structure describes the full version of a software component. */
+struct guc_sw_version_t {
+	/* BR[ 7: 0] Patch version. */
+	uint32_t patch_version : 8;
+
+	/* BR[15: 8] Minor version. */
+	uint32_t minor_version : 8;
+
+	/* BR[23:16] Major version. */
+	uint32_t major_version : 8;
+
+	/* BR[31:24] Branch ID. */
+	uint32_t branch_id : 8;
+};
+
+/* GuC FW Version. This is mandatory fw LFD data. */
+struct guc_lfd_data_fw_version_t {
+	/* The full version of the GuC microkernel that generated the logs. */
+	struct guc_sw_version_t guc_sw_version;
+};
+
+/*
+ * Log Init Config Types.
+ * The first word of the each TLV payload of guc_log_init_config_t contains one
+ * of the following enum values. This value determines how subsequent bytes are
+ * parsed to obtain the TLV information.
+ */
+enum guc_log_lic_type_t {
+	/*
+	 * GuC firmware version.
+	 * Subsequent bytes of current log-init-config are parsed as per
+	 * guc_lic_guc_sw_version_t structure layout.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
+
+	/*
+	 * TSC Frequency.
+	 * Subsequent bytes of current log-init-config are parsed as per
+	 * guc_lic_tsc_freq_t structure layout.
+	 */
+	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x2,
+
+	/*
+	 * GuC device id.
+	 * Subsequent bytes of current log-init-config are parsed as per
+	 * guc_lic_guc_devid_t structure layout.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x3
+};
+
+/* Log Init Config: GUC software version. */
+struct guc_lic_guc_sw_version_t {
+	/* BR[31:16] Number of dwords in proceeding payload = 1. */
+	uint32_t size : 16;
+
+	/*
+	 * BR[15: 0] Log-init-config
+	 * TLV type enum = GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
+	 */
+	uint32_t type : 16;
+
+	/* 32 bit number representing the Guc’s software version. */
+	struct guc_sw_version_t guc_sw_version;
+};
+
+/*
+ * Log Init Config Structure Version.
+ * Major-Minor is not a fractional number
+ * (i.e. Ver 1.3 would be older than 1.12)
+ */
+struct guc_lic_format_version_t {
+	/*
+	 * BR[15: 0] Log-Init-Config structure minor  version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
+	 */
+	uint32_t minor_version : 16;
+
+	/*
+	 * BR[31:16] Log-Init-Config structure major version.
+	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	 */
+	uint32_t major_version : 16;
+};
+
+/* Log Init Config: GUC Device ID. */
+struct guc_lic_guc_devid_t {
+	/* BR[31:16] Number of dwords in proceeding payload = 1. */
+	uint32_t size : 16;
+
+	/*
+	 * BR[15: 0] Log-init-config TLV type enum =
+	 * GUC_LOG_LIC_TYPE_GUC_DEVICE_ID.
+	 */
+	uint32_t type : 16;
+
+	/*
+	 * BR[31: 0] Guc device ID. Refer bspec symbol GUC_DEVICEID
+	 * https://gfxspecs.intel.com/Predator/Home/Index/50668.
+	 */
+	uint32_t guc_devid : 32;
+};
+
+/* GuC Device ID. This is mandatory fw LFD data. */
+struct guc_lfd_data_guc_devid_t {
+	/* GuC microcontroller device ID defined as per guc_lic_guc_devid_t. */
+	struct guc_lic_guc_devid_t guc_devid;
+};
+
+/* Log Init Config: TSC Fequency. */
+struct guc_lic_tsc_freq_t {
+	/* BR[31:16] Number of dwords in proceeding payload = 1. */
+	uint32_t size : 16;
+
+	/*
+	 * BR[15: 0] Log-init-config TLV type enum =
+	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY.
+	 */
+	 uint32_t type : 16;
+
+	/*
+	 * 32 bit number representing frequency in kilohertz for all the
+	 * timestamps being used in the log-entry.
+	 */
+	uint32_t tsc_freq;
+};
+
+/* GuC TSC Fequency. This is mandatory fw LFD data. */
+struct guc_lfd_data_tsc_freq_t {
+	/*
+	 * The frequency of timestamps used in guc logs as described in
+	 * guc_lic_tsc_freq_t
+	 */
+	struct guc_lic_tsc_freq_t tsc_freq;
+};
+
+/*
+ * GuC Log-Init-Config structure.
+ * This is populated by the GUC at log init time and is located in the log
+ * buffer as per the Log Buffer Layout (In Memory). The array of guc log
+ * buffer states plus this structure must not exceed 4KB.
+ */
+struct guc_log_init_config_t {
+	/*
+	 * A magic number set by GuC to identify that this structure
+	 * contains valid information: lic_magic = 0x8086900D.
+	 * Used to verify the information in this structure is valid.
+	 */
+	uint32_t lic_magic;
+
+	/*
+	 * The version of the this structure.
+	 * Detail description is guc_lic_format_version_t
+	 */
+	struct guc_lic_format_version_t lic_ver;
+
+	/* Number of Dws the lic_data array contains. */
+	uint32_t lic_dw_size;
+
+	/*
+	 * Array of dwords representing a sequence of LIC TLVs types.
+	 * See guc_log_lic_type_t enums
+	 */
+	uint32_t lic_data[];
+};
+
+/* GuC Log entry format Version 2. */
+struct guc_log_format_version_2_t {
+	/* BR[31: 0] The GuC timestamp of the log event. */
+	uint32_t timestamp : 32;
+
+	/* BR[19: 0] The Vf ID the log entry has been generated for. */
+	uint32_t vf_id : 20;
+
+	/* BR[31:20] Reserved. */
+	uint32_t reserved_1 : 12;
+
+	/* BR[14: 0] The GuC Event ID value for the log event. */
+	uint32_t event_id : 15;
+
+	/* BR[15:15] Indicates if Event should be visible to Vf Host driver. */
+	uint32_t vf_visible : 1;
+
+	/*
+	 * BR[17:16] This field contains the verbosity level of the log entry,
+	 * see the Log Verbosity section. This can then be used by the PF driver
+	 * to filter the logs copied to a VF based on the verbosity requested by
+	 * a VF.
+	 */
+	uint32_t verbosity : 2;
+
+	/* BR[31:18] Reserved. */
+	uint32_t reserved_2 : 14;
+
+	/* BR[31: 0] The value of Parameter 1 of the log event. */
+	uint32_t parameter_1 : 32;
+
+	/* BR[31: 0] The value of Parameter 2 of the log event. */
+	uint32_t parameter_2 : 32;
+};
+
+/* GuC Log Buffer State. */
+struct guc_log_buffer_state_t {
+	/*
+	 * A marker set by the ukernel to identify the buffer state start
+	 * location in a binary file containing the GuC log. This is used
+	 * by log parsing tools. The Current values are:
+	 *
+	 * Log buffer
+	 * Marker[0] 0XCABBA9E6,
+	 * Marker[1] 0XDEADFEED
+	 * Crashdump
+	 * Marker[0] 0XCABBA9E6,
+	 * Marker[1] 0x8086DEAD
+	 * Error State Capture
+	 * Marker[0] 0XCABBA9F7,
+	 * Marker[1] 0XBEEFFEED
+	 * Schema
+	 * Marker[0] 0x808655DD,
+	 * Marker[1] 0x8086EEBB.
+	 * Note: The schema is never written to the memory by ukernel.
+	 * Its an optional feature for KMD to embed schema in guclog file.
+	 */
+	uint32_t Marker[2];
+
+	/*
+	 * BR[31: 0] This is the Last Byte Offset Location that was read by
+	 * KMD. KMD will write to this and uKernel will read this.
+	 */
+	uint32_t log_buf_rd_ptr : 32;
+
+	/*
+	 * BR[31: 0] This is the Byte Offset Location that will be written
+	 * by uKernel.
+	 */
+	uint32_t log_guc_wr_ptr : 32;
+
+	/*
+	 * BR[31: 0] Log buffer size.
+	 * This is written by the KMD and specifies the size of the buffer
+	 * in bytes
+	 */
+	uint32_t log_buf_size : 32;
+
+	/*
+	 * BR[31: 0] This is written by ukernel to the byte offset of the
+	 * next free entry in the buffer on log buffer half full or state
+	 * capture notification.
+	 */
+	uint32_t sampled_log_buf_wr_ptr : 32;
+
+	/*
+	 * BR[31: 0] This is the byte offset of location 1 byte after last
+	 * valid guc log event entry written by Guc firmware before there
+	 * was a wraparound.
+	 * This field is updated by guc firmware and should be used by Host
+	 * when copying buffer contents to file.
+	 */
+	uint32_t log_guc_buff_wrap_offset : 32;
+
+	/*
+	 * BR[ 0: 0] uKernel sets this when log buffer is half full or when
+	 * a flush has been requested by KMD through host2guc.
+	 * uKernel will send GUC2HOST only if this bit is cleared. This is
+	 * to avoid unnecessary interrupts from GuC.
+	 */
+	uint32_t log_buf_flush_to_file : 1;
+
+	/*
+	 * BR[ 4: 1] uKernel increments this when log buffer overflows.
+	 * This is initialized to 0 by KMD.
+	 */
+	uint32_t buffer_full_cnt : 4;
+
+	/* BR[31: 5] Reserved. */
+	uint32_t reserved : 27;
+
+	/*
+	 * BR[31: 0] The Guc-Log-Entry format version, a single integer.
+	 * Current version is GUC_LOG_EVENT_ENTRY_FORMAT_VERSION
+	 */
+	uint32_t version : 32;
+};
+
+/* GuC Log Events Buffer. This is optional fw LFD data. */
+struct guc_lfd_data_log_events_buf_t {
+	/* version of GuC log format of buffer */
+	uint32_t log_events_format_version;
+
+	/*
+	 * If log_format_version == 1, array of guc_log_format_version_1_t.
+	 * If log_format_version == 2, array of guc_log_format_version_2_t.
+	 * Dword size determined by guc_logfile_lfd_t.desc_dw_size - 1
+	 */
+	uint32_t log_format_buf[];
+};
+
+/* OS Version Information. This is mandatory host LFD data. */
+struct guc_lfd_data_os_id_t {
+	/*
+	 * enum values to identify the OS brand (1=Windows, 2=Linux, etc..).
+	 * See guc_lfd_os_type_t for the range of types
+	 */
+	uint32_t os_id;
+
+	/*
+	 * ASCII string containing OS build version information based on os_id.
+	 * String is padded with null characters to ensure its DWORD aligned.
+	 * Dword size determined by guc_logfile_lfd_t.desc_dw_size - 1
+	 */
+	char build_version[];
+};
+
+/* The type id for a Binary-Schema-Encoding record. */
+enum guc_bse_record_types_t {
+	/*
+	 * Event descriptor record.
+	 * Subsequent bytes of the binary schema encoding are parsed as per
+	 * guc_bse_event_t structure layout
+	 */
+	GUC_BSE_RECORD_TYPES_EVENT_DESC = 0x41,
+
+	/*
+	 * Parameter descriptor record.
+	 * Subsequent bytes of the binary schema encoding are parsed as per
+	 * guc_bse_param_t structure layout
+	 */
+	GUC_BSE_RECORD_TYPES_PARAM_DESC = 0x42,
+
+	/*
+	 * Time stamp record.
+	 * Subsequent bytes of the binary schema encoding are parsed as per
+	 * guc_bse_timestamp_t structure layout
+	 */
+	GUC_BSE_RECORD_TYPES_TIMESTAMP = 0x43,
+
+	/*
+	 * Schema version record.
+	 * Subsequent bytes of current binary schema descriptor are parsed as
+	 * per guc_bse_schema_ver_t structure layout.
+	 * This shall be the first record descriptor to appear in the
+	 * binary-schema stream.
+	 */
+	GUC_BSE_RECORD_TYPES_SCHEMA_VERSION_RECORD = 0x44,
+
+	/*
+	 * GuC Firmware version record.
+	 * Subsequent bytes of the binary schema encoding are parsed as per
+	 * guc_bse_fw_ver_t structure layout
+	 */
+	GUC_BSE_RECORD_TYPES_FW_VERSION_RECORD = 0x45
+};
+
+/* Binary Schema Encoding for the general log record. */
+struct guc_bse_record_t {
+	/*
+	 * 8 bit identifier for the type of binary schema record descriptor
+	 * record being. This value must be one of guc_bse_record_types_t
+	 */
+	uint8_t type;
+
+	/*
+	 * Stream of bytes that contain the encoded payload for the
+	 * corresponding record type. Bytes are parsed based on ‘type’
+	 * structure
+	 */
+	uint8_t enc_payload[];
+};
+
+/*
+ * Binary Schema Encoding Stream. This structure encapsulates a stream of
+ * guc-log-translation-schema for all log record types.
+ */
+struct guc_bse_stream_t {
+	/* A stream of one or more guc_bse_record_t encodings. */
+	struct guc_bse_record_t bse_records;
+};
+
+/* GuC Schema Binary. This is optional host LFD data. */
+struct guc_lfd_data_binary_schema_t {
+	/*
+	 * Binary schema encoding followed by any byte padding to align to
+	 * dword size. Dword size determined by guc_logfile_lfd_t.desc_dw_size
+	 */
+	struct guc_bse_stream_t binary_schema;
+};
+
+#endif
diff --git a/tools/lfd_default.h b/tools/lfd_default.h
new file mode 100644
index 000000000..aa0d3a834
--- /dev/null
+++ b/tools/lfd_default.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2016-2019 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_LFD_DEFAULT_H_
+#define _INTEL_GUC_LFD_DEFAULT_H_
+
+#include "lfd.h"
+
+const struct guc_logfile_lfd_t default_guc_logfile_lfd = {
+	.magic = GUC_LOGFILE_LFD_MAGIC,
+};
+
+const struct guc_logfile_t default_guc_logfile = {
+	.magic = LFD_DRIVER_KEY_STREAMING,
+	.version = {
+		.minor_version = GUC_LOG_FILE_FORMAT_VERSION_MINOR,
+		.major_version = GUC_LOG_FILE_FORMAT_VERSION_MAJOR
+	}
+};
+
+const struct guc_lic_guc_devid_t default_guc_lic_guc_devid = {
+	.type = GUC_LOG_LIC_TYPE_GUC_DEVICE_ID,
+	.size = 1,
+	.guc_devid = 0
+};
+
+const struct guc_lic_tsc_freq_t default_guc_lic_tsc_freq = {
+	.type = GUC_LOG_LIC_TYPE_TSC_FREQUENCY,
+	.size = 1,
+	.tsc_freq = 0
+};
+
+const struct guc_lfd_data_log_events_buf_t default_lfd_data_log_events_buf = {
+	.log_events_format_version = GUC_LOG_EVENT_ENTRY_FORMAT_VERSION,
+};
+
+#endif
diff --git a/tools/meson.build b/tools/meson.build
index de866c392..6fadc40fa 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -46,6 +46,7 @@ tools_progs = [
 	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
+	'xe_guc_logger',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
diff --git a/tools/xe_guc_logger.c b/tools/xe_guc_logger.c
new file mode 100644
index 000000000..a8b5551dd
--- /dev/null
+++ b/tools/xe_guc_logger.c
@@ -0,0 +1,615 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2016-2019 Intel Corporation
+ */
+
+#include <assert.h>
+#include <fcntl.h>
+#include <regex.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <zlib.h>
+#include <arpa/inet.h>
+
+#include "igt.h"
+#include "lfd.h"
+#include "lfd_default.h"
+
+#define PR	printf("@ %s:%d\n", __func__, __LINE__)
+
+#define DEFAULT_FILE_LEN		(256 * 1024 * 1024)
+#define LINE_BUF_SIZE			(16 * 1024 * 1024)
+
+/* Optional Space */
+#define SPC_O				"[ \t]*"
+/* Required Space */
+#define SPC				": "
+/* Optional Non-Space */
+#define NSPC_O				"([^:]*)"
+/* Required Non-Space */
+#define NSPC				"([^:]+)"
+#define BEG				"^" SPC_O
+#define REQ_FIELD			NSPC SPC
+#define OPT_FIELD			NSPC_O SPC_O
+#define END				SPC_O "$"
+
+#define REGEX_NON_SPACE_GROUPS	BEG REQ_FIELD OPT_FIELD OPT_FIELD OPT_FIELD END
+#define REGEX_NON_SPACE_GROUPS_COUNT	4
+
+#define INDEX_KEY			1
+#define INDEX_VALUE			2
+
+#define OS_VERSION_FILENAME		"/proc/version"
+#define DEFAULT_GUC_LOG_FILENAME	"guc_log"
+#define DEFAULT_OUTPUT_FILE_NAME	"guc_log_dump.dat"
+
+static struct guc_log_buffer_entry_list {
+	uint32_t key[2];
+	uint32_t offset;
+	uint32_t rd_ptr;
+	uint32_t wr_ptr;
+	uint32_t buf_size;
+} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT] = {
+	{
+		{
+			LFD_LOG_BUFFER_MARKER_1V2,
+			LFD_LOG_BUFFER_MARKER_2
+		}
+	},
+	{
+		{
+			LFD_LOG_BUFFER_MARKER_1V2,
+			LFD_CRASH_DUMP_BUFFER_MARKER_2
+		}
+	},
+	{
+		{
+			LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
+			LFD_STATE_CAPTURE_BUFFER_MARKER_2
+		}
+	},
+	{
+		{
+			GUC_LOG_INIT_CONFIG_LIC_MAGIC,
+			((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
+			 | GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
+		}
+	},
+};
+
+regex_t regex;
+int verbose = 0;
+struct guc_sw_version_t fw_ver;
+struct guc_lic_tsc_freq_t fw_tsc_freq;
+struct guc_lic_guc_devid_t fw_dev_id;
+struct guc_log_buffer_state_t log_buf_state;
+char *out_filename = NULL;
+char *guc_log_filename = NULL;
+
+/*
+ * Header example:
+ * **** GuC Log ****
+ * CS reference clock: 19200000
+ * GuC firmware: i915/mtl_guc_70.bin
+ * GuC version: 70.36.0 (wanted 70.29.2)
+ * Kernel timestamp: 0x1DE9CFB690A4 [32890049433764]
+ * GuC timestamp: 0x325FF4AA2 [13522389666]
+ * Log level: 3
+ * [LOG].length: 0x113000
+ * [LOG].data: <ASCII85 DATA>
+ */
+#define TAG_GUC_LOG_START	"**** GuC Log ****"
+
+enum TAG_TYPE {
+	TAG_GUC_FIRMWARE = 0,
+	TAG_GUC_VERSION,
+	TAG_CS_REFERENCE_CLOCK,
+	TAG_KERNEL_TIMESTAMP,
+	TAG_GUC_TIMESTAMP,
+	TAG_LOG_LEVEL,
+	TAG_LOG_LENGTH,
+	TAG_LOG_DATA,
+	TAG_MAX
+};
+
+static const char *tags[TAG_MAX] = {
+	"GuC firmware",
+	"GuC version",
+	"CS reference clock",
+	"Kernel timestamp",
+	"GuC timestamp",
+	"Log level",
+	"[LOG].length",
+	"[LOG].data: " /* This tag only being matched by strcmp, so add ": " */
+};
+
+static char tag_values[TAG_MAX - 1][80];
+
+static int zlib_inflate(uint32_t **ptr, int len)
+{
+	struct z_stream_s zstream;
+	void *out;
+
+	memset(&zstream, 0, sizeof(zstream));
+
+	zstream.next_in = (unsigned char *)*ptr;
+	zstream.avail_in = 4 * len;
+
+	if (inflateInit(&zstream) != Z_OK)
+		return 0;
+
+	out = malloc(128 * 4096); /* approximate obj size */
+	zstream.next_out = out;
+	zstream.avail_out = 128 * 4096;
+
+	do {
+		switch (inflate(&zstream, Z_SYNC_FLUSH)) {
+		case Z_STREAM_END:
+			goto end;
+		case Z_OK:
+			break;
+		default:
+			inflateEnd(&zstream);
+			return 0;
+		}
+
+		if (zstream.avail_out)
+			break;
+
+		out = realloc(out, 2 * zstream.total_out);
+		if (out == NULL) {
+			inflateEnd(&zstream);
+			return 0;
+		}
+
+		zstream.next_out = (unsigned char *)out + zstream.total_out;
+		zstream.avail_out = zstream.total_out;
+	} while (1);
+end:
+	inflateEnd(&zstream);
+	free(*ptr);
+	*ptr = out;
+	return zstream.total_out / 4;
+}
+
+static unsigned long
+ascii85_decode(char *in, uint32_t **out)
+{
+	unsigned long len = 0, size = 1024;
+	bool inflated;
+
+	*out = realloc(*out, sizeof(uint32_t) * size);
+	if (*out == NULL)
+		return 0;
+
+	inflated = (in[0] == ':');
+
+	while (*in >= '!' && *in <= 'z') {
+		uint32_t v = 0;
+
+		if (len == size) {
+			size *= 2;
+			*out = realloc(*out, sizeof(uint32_t) * size);
+			if (*out == NULL)
+				return 0;
+		}
+
+		if (*in == 'z') {
+			in++;
+		} else {
+			v += in[0] - 33; v *= 85;
+			v += in[1] - 33; v *= 85;
+			v += in[2] - 33; v *= 85;
+			v += in[3] - 33; v *= 85;
+			v += in[4] - 33;
+			in += 5;
+		}
+		(*out)[len++] = v;
+	}
+
+	if (!inflated)
+		return len;
+
+	return zlib_inflate(out, len);
+}
+
+static enum TAG_TYPE get_tag_entry(char *line)
+{
+	int i;
+	regmatch_t match[REGEX_NON_SPACE_GROUPS_COUNT];
+
+	if (strncmp(tags[TAG_LOG_DATA], line, strlen(tags[TAG_LOG_DATA])) == 0)
+		return TAG_LOG_DATA;
+
+	if ((regexec(&regex, line, REGEX_NON_SPACE_GROUPS_COUNT, match, 0)) == 0) {
+		char *key = NULL, *value = NULL;
+
+		if (match[INDEX_KEY].rm_so >= 0) {
+			key = &line[match[INDEX_KEY].rm_so];
+			line[match[INDEX_KEY].rm_eo] = '\0';
+		}
+		if (match[INDEX_VALUE].rm_so >= 0) {
+			value = &line[match[INDEX_VALUE].rm_so];
+			line[match[INDEX_VALUE].rm_eo] = '\0';
+		}
+
+		for (i = 0; i < TAG_LOG_DATA; i++) {
+			if (key && value && strcmp(tags[i], key) == 0) {
+				strcpy(tag_values[i], value);
+				return i;
+			}
+		}
+	}
+	return TAG_MAX;
+}
+
+static int load_guc_log(uint32_t **bin_buf)
+{
+	FILE *fd;
+	int log_len = 0;
+	enum TAG_TYPE type;
+	char *fname;
+	char *line =  (char *)malloc(LINE_BUF_SIZE);
+	int i = 0;
+
+	igt_assert_f(line, "Out of memory\n");
+
+	fname = guc_log_filename ? : (char *)DEFAULT_GUC_LOG_FILENAME;
+	if (verbose)
+		igt_info("Loading %s\n", fname);
+
+	fd = fopen(fname, "r");
+	igt_assert_f(fd, "couldn't open the file: %s\n", fname);
+
+	while (fgets(line, LINE_BUF_SIZE, fd)) {
+		if (i == 0) {
+			/* Require line 0 is start tag  */
+			igt_assert_f(!strncmp(line, TAG_GUC_LOG_START,
+					      sizeof(TAG_GUC_LOG_START) - 1),
+				     "Invalid guc log\n");
+		}
+		type = get_tag_entry(line);
+		if (type == TAG_LOG_DATA) {
+			char *encoded = &line[strlen(tags[TAG_LOG_DATA])];
+
+			log_len = ascii85_decode(encoded, bin_buf);
+			if (verbose)
+				igt_info("Ascii85 decoded length: 0x%x\n", log_len);
+		}
+		i++;
+	}
+
+	if (ferror(fd) != 0)
+		printf("Failed to read file, error: %d\n", ferror(fd));
+
+	fclose(fd);
+	free(line);
+	if (guc_log_filename)
+		free(guc_log_filename);
+
+	return log_len;
+}
+
+static int add_lfd_headr(char *buf)
+{
+	int len;
+
+	igt_assert(buf);
+
+	len = sizeof(default_guc_logfile_lfd);
+	memcpy(buf, &default_guc_logfile_lfd, len);
+
+	return len;
+}
+
+static int add_payload(char *buf, uint32_t data_len, void *data)
+{
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	igt_assert(buf);
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = data_len / 4;
+	if (data_len % 4)
+		lfd->desc_dw_size++;
+
+	if (lfd->data != data)
+		memcpy(lfd->data, data, data_len);
+
+	return lfd->desc_dw_size * 4;
+}
+
+static int add_typed_payload(char *buf, uint32_t type, uint32_t data_len, void *data)
+{
+	int len;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+
+	igt_assert(buf);
+
+	len = add_lfd_headr(buf);
+	lfd->desc_type = type;
+	len += add_payload(buf, data_len, data);
+
+	return len;
+}
+
+static int add_sw_ver(char *buf)
+{
+	return add_typed_payload(buf, GUC_LFD_TYPE_FW_VERSION,
+				sizeof(fw_ver), &fw_ver);
+}
+
+static int add_guc_device_id(char *buf)
+{
+	return add_typed_payload(buf, GUC_LFD_TYPE_GUC_DEVICE_ID,
+				sizeof(fw_dev_id),
+				(void *)&fw_dev_id);
+}
+
+static int add_os_id(char *buf, uint32_t os_id)
+{
+	int len;
+	FILE *f;
+	char *temp;
+
+	temp = malloc(BUFSIZ);
+	assert(buf);
+
+	/* Get host build version */
+	f = fopen(OS_VERSION_FILENAME, "r");
+	fgets(temp, BUFSIZ, f);
+	fclose(f);
+
+	/* Remove trailing newline */
+	temp[strcspn(temp, "\n\r")] = 0;
+	len = add_typed_payload(buf, GUC_LFD_TYPE_OS_ID, strlen(temp), temp);
+	free(temp);
+
+	return len;
+}
+
+static int add_log_event(char *buf, char *log_bin)
+{
+	int len;
+	char *data;
+	uint32_t data_len;
+	struct guc_lfd_data_log_events_buf_t *events_buf;
+	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
+	struct guc_log_buffer_entry_list *entry;
+
+	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
+
+	/* Skip empty log */
+	if (entry->rd_ptr == entry->wr_ptr)
+		return 0;
+
+	len = add_lfd_headr(buf);
+	lfd = (struct guc_logfile_lfd_t *)buf;
+
+	lfd->desc_type = GUC_LFD_TYPE_LOG_EVENTS_BUFFER;
+	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
+	events_buf->log_events_format_version = log_buf_state.version;
+
+	data = log_bin + entry->offset + entry->rd_ptr;
+	if (entry->rd_ptr < entry->wr_ptr) {
+		data_len = entry->wr_ptr - entry->rd_ptr;
+		memcpy(events_buf->log_format_buf, data, data_len);
+	} else {
+		/* Copy rd to buf end 1st */
+		data_len = entry->buf_size - entry->rd_ptr;
+		memcpy(events_buf->log_format_buf, data, data_len);
+
+		/* Copy buf start to wr */
+		data = &log_bin[entry->offset];
+		memcpy(&events_buf->log_format_buf[data_len / 4], data, entry->wr_ptr);
+		data_len += entry->wr_ptr;
+	}
+
+	if (verbose)
+		igt_info("log event data length: 0x%x\n", data_len);
+
+	/* make length DW aligned */
+	lfd->desc_dw_size = data_len / 4;
+	if (data_len % 4)
+		lfd->desc_dw_size++;
+
+	/* Addup log_events_format_version size */
+	lfd->desc_dw_size++;
+
+	return len + lfd->desc_dw_size * 4;
+}
+
+static void loop_log_init(struct guc_log_init_config_t *init)
+{
+	int i;
+	struct guc_lic_tsc_freq_t *p;
+
+	assert(init);
+	p = (struct guc_lic_tsc_freq_t *)init->lic_data;
+
+	for (i = 0; i < init->lic_dw_size; i += 2) {
+		switch (p->type) {
+		case GUC_LOG_LIC_TYPE_GUC_SW_VERSION:
+			fw_ver = ((struct guc_lic_guc_sw_version_t *)p)->guc_sw_version;
+			break;
+		case GUC_LOG_LIC_TYPE_TSC_FREQUENCY:
+			fw_dev_id = *(struct guc_lic_guc_devid_t *)p;
+			break;
+		case GUC_LOG_LIC_TYPE_GUC_DEVICE_ID:
+			fw_tsc_freq = *(struct guc_lic_tsc_freq_t *)p;
+			fw_tsc_freq.type = GUC_LOG_LIC_TYPE_TSC_FREQUENCY;
+			break;
+		default:
+			break;
+		}
+		p++;
+	}
+}
+
+static void load_log_buffer(uint32_t *guc_log, int len)
+{
+	int i = 0;
+	uint32_t offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
+	struct guc_log_buffer_state_t *p = (struct guc_log_buffer_state_t *)guc_log;
+	struct guc_log_init_config_t *init;
+
+	assert(guc_log);
+
+	while (p) {
+		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
+			if (p->Marker[0] == entry_list[i].key[0] &&
+			    p->Marker[1] == entry_list[i].key[1]) {
+				entry_list[i].offset = offset;
+				entry_list[i].rd_ptr = p->log_buf_rd_ptr;
+				entry_list[i].wr_ptr = p->log_guc_wr_ptr;
+				entry_list[i].buf_size = p->log_buf_size;
+
+				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
+					log_buf_state = *p;
+
+				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
+					offset += p->log_buf_size;
+					p++;
+				} else {
+					int init_size_with_data;
+
+					init = (struct guc_log_init_config_t *)p;
+					/* Load log init config */
+					loop_log_init(init);
+					init_size_with_data = init->lic_dw_size * 4 +
+						sizeof(struct guc_log_init_config_t);
+					offset += init_size_with_data;
+					p = (struct guc_log_buffer_state_t *)
+					     ((char *)p + init_size_with_data);
+				}
+			}
+		}
+		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
+			break;
+	}
+}
+
+static void save_output_file(char *buf, uint32_t *guc_log_bin)
+{
+	int ret, index = 0;
+	char *bin = (char *)guc_log_bin;
+	struct guc_logfile_t *guc_logfile;
+	struct guc_log_buffer_entry_list *entry;
+
+	char *fname = out_filename ? : (char *)DEFAULT_OUTPUT_FILE_NAME;
+	int fd = open(fname, O_CREAT | O_WRONLY | O_TRUNC, 0600);
+
+	igt_assert_f(fd >= 0, "couldn't open the output file\n");
+
+	if (verbose)
+		igt_info("Creating binary file: %s\n", fname);
+
+	guc_logfile = (struct guc_logfile_t *)buf;
+	*guc_logfile = default_guc_logfile;
+
+	index = offsetof(struct guc_logfile_t, lfd_stream);
+	index += add_sw_ver(&buf[index]);
+	index += add_guc_device_id(&buf[index]);
+	index += add_typed_payload(&buf[index], GUC_LFD_TYPE_TSC_FREQUENCY,
+				   sizeof(fw_tsc_freq), (void *)&fw_tsc_freq);
+	index += add_os_id(&buf[index], GUC_LFD_OS_TYPE_OSID_LIN);
+	index += add_log_event(&buf[index], bin);
+
+	/* For Crash dump, rd/wr ptr has no effect, do simple payload add */
+	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
+	if (entry->buf_size) {
+		index += add_typed_payload(&buf[index], GUC_LFD_TYPE_FW_CRASH_DUMP,
+					entry->buf_size, &bin[entry->offset]);
+	}
+
+	ret = write(fd, buf, index);
+	if (ret != index)
+		igt_info("Couldn't save output file. errno: %d\n", errno);
+
+	close(fd);
+
+	if (verbose)
+		igt_info("Binary file saved.\n");
+
+	if (out_filename)
+		free(out_filename);
+}
+
+static int parse_options(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'i':
+		guc_log_filename = strdup(optarg);
+		igt_assert_f(guc_log_filename, "Couldn't allocate the input filename\n");
+		igt_debug("logs to be read %s\n", guc_log_filename);
+		break;
+	case 'o':
+		out_filename = strdup(optarg);
+		igt_assert_f(out_filename, "Couldn't allocate the output filename\n");
+		igt_debug("logs to be stored in file %s\n", out_filename);
+		break;
+	case 'v':
+		verbose = 1;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static void process_command_line(int argc, char **argv)
+{
+	static struct option long_options[] = {
+		{"outputfile", required_argument, 0, 'o'},
+		{"inputfile", required_argument, 0, 'i'},
+		{"verbosity", optional_argument, 0, 'v'},
+		{ 0, 0, 0, 0 }
+	};
+
+	const char *help =
+		"  -i --inputfile=name\tname of the guc log file, including the path\n"
+		"  -o --outputfile=name\tname of the output file, including the location, where logs will be stored\n"
+		"  -v --verbosity=level   verbosity level of output\n";
+
+		igt_simple_init_parse_opts(&argc, argv, "o:i:v", long_options,
+					   help, parse_options, NULL);
+}
+
+int main(int argc, char **argv)
+{
+	int decode_len;
+	char *buf;
+	uint32_t *guc_log_bin = NULL;
+
+	buf = malloc(DEFAULT_FILE_LEN);
+	assert(buf);
+	memset(buf, 0, DEFAULT_FILE_LEN);
+	guc_log_bin = NULL;
+
+	regcomp(&regex, REGEX_NON_SPACE_GROUPS, REG_EXTENDED | REG_NEWLINE);
+
+	process_command_line(argc, argv);
+
+	/* guc_log_bin will be alloc by load_guc_log/ascii85_decode */
+	decode_len = load_guc_log(&guc_log_bin);
+
+	/* Only keep hex value part for timestamp string */
+	tag_values[TAG_KERNEL_TIMESTAMP][strcspn(tag_values[TAG_KERNEL_TIMESTAMP], " ")] = 0;
+	tag_values[TAG_GUC_TIMESTAMP][strcspn(tag_values[TAG_GUC_TIMESTAMP], " ")] = 0;
+
+	load_log_buffer(guc_log_bin, decode_len);
+
+	save_output_file(buf, guc_log_bin);
+
+	free(buf);
+	free(guc_log_bin);
+	regfree(&regex);
+	igt_exit();
+
+	return 0;
+}
+
-- 
2.34.1

