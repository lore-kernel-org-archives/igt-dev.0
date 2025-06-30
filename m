Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C3DC8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 10:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A4A10E3F6;
	Mon, 30 Jun 2025 10:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tf1RWxwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D9810E3F6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751278377; x=1782814377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hv737CQLSwkBaKPoUMYRrTxjdloLzgNYMUzAXimkC/s=;
 b=Tf1RWxwT3/Ip9mzSQnFqkiouQ+eyEsyeKdVRL7fXS0MTPr553aKl+A1J
 ev5kXNlZjxFB7IUVj4TUjmYGQb7sLdSLdmjQQYx6kjxdeYyDbUFD/OYU0
 vAVSe9K6/fKytf4D3mN3ZOQCCWzvDrFNGtPnXWJSYdwrEz6aXuOT76HyJ
 /uh4YHcF82X9zyoDjgHQZERZ1yPXIgDN3XuWCx5a1nZPI8VbZea4f8raZ
 HgCeRabmni1flQ8CUj6NqFBQ09W3UYs4Bm/TljyvIlQCDsG/ir9uoxqCe
 BRUuUFQha/F6MBd2ZcCM9s3GQLBA1lwD61Rd7ybzvec2Y4cbya2y9/IUh A==;
X-CSE-ConnectionGUID: 3Qbgp/J3Sa2Je4CXfh1kaA==
X-CSE-MsgGUID: nKfAcpKHQL+KDUw+3/wLZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53360860"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53360860"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 03:12:57 -0700
X-CSE-ConnectionGUID: Ir5ZnLUvSpqbEV+KaooHug==
X-CSE-MsgGUID: XsMoZSIdQ6WkK/WIbwEqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159147953"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:12:55 -0700
Date: Mon, 30 Jun 2025 12:12:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, david.e.box@linux.intel.com
Subject: Re: [PATCH] test/intel/xe_pmt: Add testing for BMG crashlog
Message-ID: <20250630101234.uysofyqjy2mjecmm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, david.e.box@linux.intel.com
References: <20250627204846.521691-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627204846.521691-1-michael.j.ruhl@intel.com>
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

Hi Michael,
On 2025-06-27 at 16:48:42 -0400, Michael J. Ruhl wrote:
> The BMG devices has the PMT crashlog feature. If the devices present
> is a BMG, test PMT api.
> 
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 561 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 562 insertions(+)
>  create mode 100644 tests/intel/xe_pmt.c
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..21a2e74e7
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify BMG PMT files operations

Please remove 'BMG' from test description here, as this could be
used for future GPUs. Also write full name for 'PMT', my guess
it is "Power Menagement Telemetry" but I could be wrong here.

Second note - this is for crash logs, what about PM telemetry
for GPU? Could it also be tested?

> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Description: Verify BMG PMT files are created and are accessable

Same here, remove 'BMG'

> + */
> +
> +#include <dirent.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <fcntl.h>

Move 'fcntl.h' to proper place.

> +#include <unistd.h>

You could place it as first one (this is an exception), up to
you.

> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "linux_scaffold.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/* base directory names */
> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> +#define CRASHLOG_DIR "crashlog"
> +#define TELEMETRY_DIR "telem"
> +#define BMG_CRASHLOG_CNT 2
> +#define BMG_TELEMETRY_CNT 2

Why 'BMG_' prefix here?

> +
> +enum bmg_crashlog_instances {
> +	bmg_crashlog_punit = 0,
> +	bmg_crashlog_oobmsm,
> +	bmg_crashlog_max
> +};

What is "oobmsm" shortcut?

> +
> +enum bmg_telemety_instances {
> +	bmg_telemetry_punit = 0,
> +	bmg_telemetry_oobmsm,
> +	bmg_telemetry_max
> +};
> +
> +static char dev_path[PATH_MAX];
> +static char work_path[PATH_MAX * 2];
> +
> +/*
> + * In most case there should be a single instance of crashlog an telemetry directories.

'an'? Did you mean 'in'?

> + * If DVSEC entries are separate the structure will be different.
> + */
> +static char crashlog_vsec_dir[32];
> +static char telemetry_vsec_dir[32];
> +
> +/* This needs to be specific for each supported device */
> +static char crashlog_dir[bmg_crashlog_max][32];
> +static char telemetry_dir[bmg_telemetry_max][32];
> +
> +/* telemetry file names */
> +static const char *telem = "telem";
> +
> +/* crashlog filenames and descriptors */
> +static const char *clear = "clear";
> +static const char *consumed = "consumed";
> +static const char *crashlog = "crashlog";
> +static const char *enable = "enable";
> +static const char *error = "error";
> +static const char *dev_guid = "guid";
> +static const char *rearm = "rearm";
> +static const char *trigger = "trigger";
> +
> +struct crashlog_v2_info {
> +	int clear_fd;
> +	int consumed_fd;
> +	int crashlog_fd;
> +	int enable_fd;
> +	int error_fd;
> +	int guid_fd;
> +	int rearm_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +} bmg_info[bmg_crashlog_max];
> +
> +#define DEV_PATH_LEN 80
> +
> +/**
> + * device_sysfs_path:
> + * @fd: opened device file descriptor
> + * @path: buffer to store sysfs path to device directory
> + *
> + * Returns:
> + * On successfull path resolution sysfs path to device directory,
> + * NULL otherwise
> + */
> +static char *device_sysfs_path(int fd, char *path)
> +{
> +        char sysfs[DEV_PATH_LEN];
> +
> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> +                return NULL;
> +
> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> +                return NULL;
> +
> +        strcat(sysfs, "/device");
> +
> +        return realpath(sysfs, path);
> +}
> +
> +/**
> + * SUBTEST: test_pmt_directories
> + * BMG PMT directory structure:
> + * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> + * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> + *
> + * If this is done for a different platform, this could be
> + * different.
> + *
> + */
> +static void test_pmt_directories(int dev_fd)
> +{
> +	struct dirent *ent;
> +	int index;
> +	DIR *dir;
> +
> +        igt_assert(device_sysfs_path(dev_fd, dev_path));
> +
> +	/* verify top level PMT directories */
> +	dir = opendir(dev_path);
> +	igt_assert_f(dir, "no directories found\n");

Why not igt_require_f()?

> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
> +			strcpy(crashlog_vsec_dir, ent->d_name);
> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
> +			strcpy(telemetry_vsec_dir, ent->d_name);
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
> +
> +	/* verify crashlog directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	index = 0;
> +	/* find the crashlog<x> directory instances */
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> +			if (index < bmg_crashlog_max)
> +				strcpy(crashlog_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
> +
> +	/* verify telemetry directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
> +
> +	index = 0;
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> +			if (index < BMG_TELEMETRY_CNT)
> +				strcpy(telemetry_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
> +
> +}
> +
> +static void find_pmt_file(const char *path, const char *file)
> +{
> +	struct dirent *ent;
> +	bool found;
> +	DIR *dir;
> +
> +	dir = opendir(path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	found = false;
> +	while ((ent = readdir(dir)) != NULL)
> +		if (strcmp(file, ent->d_name) == 0)
> +			found = true;
> +	closedir(dir);
> +
> +	igt_assert_f(found, "missing %s from %s\n", file, path);
> +}
> +
> +static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
> +{
> +	char file_path[PATH_MAX];
> +
> +	sprintf(file_path, "%s/%s", path, file);
> +
> +	*fd = open(file_path, flags);
> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
> +
> +	/* TODO: match flags to file attributes */
> +}
> +
> +/**
> + * SUBTEST: test_pmt_telemetry_files
> + * Description: validate the expected telemetry file(s)
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_telemetry_files(int dev_fd)
> +{
> +	int i;
> +
> +	for (i = 0; i < BMG_TELEMETRY_CNT; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		find_pmt_file(work_path, telem);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_files
> + * Description: validate the expected crashlog files
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_files(int dev_fd)
> +{
> +	char buf[64] = {};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
> +			crashlog_dir[i]);
> +
> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +
> +		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		bmg_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +	}
> +}
> +
> +#define ENABLE_MSG "1\n"
> +#define DISABLE_MSG "0\n"
> +
> +static bool send_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	int ret;
> +
> +	errno = 0;
> +	ret = pwrite(fd, msg, len, 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
> +			 errno);
> +
> +	return ret == len;
> +}
> +
> +static bool verify_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	char buf[32] = {};
> +	int ret;
> +
> +	errno = 0;
> +	ret = pread(fd, buf, sizeof(buf), 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
> +
> +	return ret == len && strcmp(buf, msg) == 0;
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_enable
> + * Description: Set enable enable/disable bit and verify usage
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_enable(int dev_fd)
> +{
> +	u_int32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].enable_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* force enable so we are in a known state */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
> +
> +		/* disable */
> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
> +
> +		/* re-enable so we can do more testing */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
> +	}
> +
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_clear
> + * Description:
> + *   Test the clear crashlog bit. After setting the crashlog data buffer should be
> + *   set to 0xdeadbeef.
> + *   "0" (DISABLE_MSG) is written to the trigger file to set the clear bit.  BMG does
> + *   writing to the clear file, but once the bit is set it cannot be cleared with a
> + *   reboot.  "0" to trigger is the "standard" usage, so test it.
> + *
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_clear(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		clear_fd = bmg_info[i].clear_fd;
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> +
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		/* wa punit issue for first crashlog (NOTE: this is fixed)*/
> +		if (i == 0)
> +			val = (int *) &buf[32];
> +		else
> +			val = (int *)buf;
> +
> +		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +	}
> +
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_consumed
> + * Description:
> + *   After a crashlog has been "consumed" (read), setting this bit can be done.
> + *   Verify that it is set correctly.
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_consumed(int dev_fd)
> +{
> +	uint32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].consumed_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_error
> + * Description:
> + *    The error bit is set when a crashlog fails in HW.  It is read only so only
> + *    need to verify that it is "0".
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_error(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_rearm
> + * Description:
> + *    The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + *    occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_rearm(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_rearm_after_disable
> + * Description:
> + *    After a disable/enable sequence REARM will be set for PUNINT instaces and
> + *    clear for OOBMSM instances.
> + *    Verify that the bits are set as expected
> + *
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_rearm_after_disable(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	i = bmg_crashlog_punit;
> +	guid = bmg_info[i].guid;
> +	igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +
> +	i = bmg_crashlog_oobmsm;
> +	guid = bmg_info[i].guid;
> +	igt_assert_f(verify_msg(bmg_info[i].rearm_fd, DISABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +}
> +
> +/**
> + * SUBTEST: test_pmt_crashlog_trigger
> + * Description:
> + *    Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + * Test category: functionality test
> + *
> + */
> +static void test_pmt_crashlog_trigger(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
> +		sleep(1);
> +
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +igt_main
> +{
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] = {
> +		/*
> +		 * NOTE:
> +		 *  o These tests are ordered.  Do not use them individualy unless you understand
> +		 *    the underlying HW behavior
> +		 *  o Testing MUST be done after a cold reset
> +		 *  o Once crashlog is triggered the device needs a cold reset, and some of the
> +		 *    tests cannot be done.
> +		 *  Only change this order if you understand this feature.
> +		 */
> +		{ "pmt-directories", test_pmt_directories },
> +		{ "pmt-telemetry-files", test_pmt_telemetry_files },
> +		{ "pmt-crashlog-files", test_pmt_crashlog_files },
> +		{ "pmt-crashlog-error", test_pmt_crashlog_error },
> +		{ "pmt-crashlog-rearm", test_pmt_crashlog_rearm },
> +		{ "pmt-crashlog-enable", test_pmt_crashlog_enable },
> +		{ "pmt-crashlog-rearm_after_disable", test_pmt_crashlog_rearm_after_disable },
> +		{ "pmt-crashlog-trigger", test_pmt_crashlog_trigger },
> +		{ "pmt-crashlog-consumed", test_pmt_crashlog_consumed },
> +		{ "pmt-crashlog-clear", test_pmt_crashlog_clear },
> +		{ }

Will it work out of order? For example:
sudo ./xe_pmt --run pmt-crashlog-enable

Will it leave an enviroment clean for next non-pmt tests after
such call?

> +	}, *f;
> +	uint16_t dev_id;
> +	int dev_fd;
> +
> +	igt_fixture
> +		dev_fd = drm_open_driver(DRIVER_XE);
> +
> +	dev_id = intel_get_drm_devid(dev_fd);

This should be in fixture.

> +
> +	if (IS_BATTLEMAGE(dev_id)) {

This also should be in fixture, like:
	igt_require_f(IS_BATTLEMAGE(dev_id), "PMT currenty supported only for BMG GPU\n");

Regards,
Kamil

> +		for (f = funcs; f->name; f++) {
> +			igt_subtest_f("%s", f->name)
> +				f->func(dev_fd);
> +		}
> +	}
> +
> +	igt_fixture
> +		drm_close_driver(dev_fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 9b87a0d24..4276e6967 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -315,6 +315,7 @@ intel_xe_progs = [
>  	'xe_peer2peer',
>  	'xe_pm',
>  	'xe_pm_residency',
> +	'xe_pmt',
>  	'xe_pmu',
>  	'xe_prime_self_import',
>  	'xe_pxp',
> -- 
> 2.49.0
> 
