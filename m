Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BD5F8A157
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 11:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6B10E1B5;
	Thu, 16 Apr 2026 11:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVr6r3Gf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DCA10E1B5
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776337253; x=1807873253;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=+hZsBoBCGrqh2vio3q9qfuKgg8RUXlUW4O60n84YnqM=;
 b=aVr6r3GfPjce7V4gV3Ail4VJ8AXVUcKKo8pzp+Bdacy8JIzxErvPQEjv
 aTvPCmsPbQsPy6MME1Grhlc3YbWzdVPfysRCNlmYTxeGPdKdrMBUVuzbp
 Zn4bhNBuTc0FuvCYmQKsnwIYBVfwME7/gd4NypUv7kPDYwPbkAw4yOS/j
 SNEOdRtVdI9sruHpyyh1yz+vVDWZC2bsYCR09IDX36Sz8XOVaEOSKs7cr
 Ymu+ERYofV6NWNKjlYexiqc09yPBlCO9+tuEPyhpfanbbygScUljYyB/Y
 2vLd6hAUvy9QbADpekuwuDOZnQmxTQ0f427OQOls/a/mTMF9kqhmeRkcY A==;
X-CSE-ConnectionGUID: 7xU8+D/kQD2DD/iQdt2oJQ==
X-CSE-MsgGUID: qIJ/bv0tSamF3oX1+D99gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88714019"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88714019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:00:52 -0700
X-CSE-ConnectionGUID: 8Yn5XFeMT+OeXBdu6Gp1Ow==
X-CSE-MsgGUID: 9dv9iVg0QRaHUDPm9G4DSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="227553028"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.97])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:00:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel: Trigger configfs attr callbacks
In-Reply-To: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
Date: Thu, 16 Apr 2026 14:00:46 +0300
Message-ID: <a22ba6fc75fd133c9a6b24d728bb183c68dffa97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 16 Apr 2026, Smitha Balasubramanyam <smitha.balasubramanyam@intel.com> wrote:
> Coverage improvement achieved by adding new subtests
> for show and store functionality of enable_psmi and sriov_max_vfs
> Enhanced existing subtests like survivability_mode, gt_types_allowed,
> engines_allowed, to cover show and store functions.
>
> Add a test vector with a partially invalid second command in the
> ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
> BB is rejected and the stored BB remains empty (rollback).
>
> Replaced the hardcoded "ctx_restore_post_bb" write with the computed
> file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
> invalid-case tests work for both "post" and "mid" variants.

There's too many things going on at once. One thing per patch, please.

>
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_configfs.c | 102 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 99 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 755524e7c..bde52e6ef 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -85,6 +85,13 @@ static void test_survivability_mode(int configfs_device_fd)
>  	char path[PATH_MAX];
>  	int fd;
>  
> +	/* Buffer for reading attribute values */

I think that's a pretty useless comment.

> +	char buf[256];
> +
> +	/* survivability_mode_show */

Ditto. It's unclear what you're doing here.

> +	igt_assert(igt_sysfs_read(configfs_device_fd, "survivability_mode",
> +				buf, sizeof(buf) - 1));

So this checks that you can read from survivability_mode, but ignores
the value. The sizeof(buf) - 1 seems like cargo culted copy-paste. The
whole igt_sysfs_read() function looks difficult to use, maybe there
should be a function to read a string that's ensured to be NUL
terminated.

> +
>  	/* Enable survivability mode */
>  	set_survivability_mode(configfs_device_fd, true);
>  
> @@ -138,6 +145,13 @@ static void test_engines_allowed(int configfs_device_fd)
>  		"rcs000",
>  	};
>  
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* engines_allowed_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "engines_allowed",
> +				buf, sizeof(buf) - 1));

Same comments here.

> +
>  	/*
>  	 * These only test if engine parsing is correct, so just make sure
>  	 * there's no device bound
> @@ -166,8 +180,25 @@ static void test_gt_types_allowed(int configfs_device_fd)
>  	};
>  
>  	static const char *invalid_values[] = {
> -                "check",
> -        };
> +		"check",
> +	};
> +
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* gt_types_allowed_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "gt_types_allowed",
> +				buf, sizeof(buf) - 1));

And here.

> +
> +	/* gt_types_allowed_store
> +	 * Store may succeed or fail depending on platform/device state.
> +	 * Accept success (errno == 0) or expected policy failures.
> +	 */
> +	errno = 0;
> +	igt_sysfs_set(configfs_device_fd, "gt_types_allowed", "0");
> +	igt_assert_f(errno == 0 || errno == EBUSY || errno == EINVAL,
> +			"Unexpected errno from gt_types_allowed store: %d\n", errno);

igt_sysfs_write() will return -errno on failure, number of bytes
otherwise. Maybe you should use that instead of relying on errno being
still set. There's the close() function being called which I presume
will trash errno.

> +
>  
>  	/*
>  	 * These only test if gt type parsing is correct, so just make sure
> @@ -225,12 +256,16 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>  		{ .test = "invalid-engine-instance",
>  		  .in = "rcs0 reg 4F100 DEADBEEF",
>  		},
> +		{ .test = "invalid-second-command",
> +			.in = "rcs cmd 11000001 4F100 DEADBEEF\n"
> +				"rcs cmd 11000001 4F10G DEADBEEF",
> +		},
>  	};
>  	char buf[4096] = { };
>  	char file[64] = { };
>  
>  	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
> -	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
> +	igt_sysfs_set(configfs_device_fd, file, "");
>  
>  	/*
>  	 * These only test if command parsing is correct,
> @@ -335,6 +370,53 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
>  	}
>  }
>  
> +/**
> + * SUBTEST: psmi_store_show
> + * Description: Validate PSMI Store and Show functionality
> + */
> +static void test_psmi_store_show(int configfs_device_fd)
> +{
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* enable_psmi_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "enable_psmi",
> +				buf, sizeof(buf) - 1));

Again this just checks the file exists. But if you're writing to it
later, you could just check for that error there.

And the comments are also useless.

> +
> +	/* enable_psmi_store
> +	 * Enabling PSMI on an active device is expected to fail with EBUSY.
> +	 */
> +	errno = 0;
> +	igt_sysfs_set(configfs_device_fd, "enable_psmi", "1");
> +	igt_assert_f(errno == EBUSY,
> +			"Expected EBUSY from enable_psmi_store, got %d\n", errno);

errno is likely trashed.

> +
> +}
> +
> +/**
> + * SUBTEST: sriov_max_vfs_store_show
> + * Description: Validate SRIOV Max VFs store and show functionality
> + */
> +static void test_sriov_max_vfs_store_show(int configfs_device_fd)
> +{
> +	/* Buffer for reading attribute values */
> +	char buf[256];
> +
> +	/* sriov_max_vfs_show */
> +	igt_assert(igt_sysfs_read(configfs_device_fd, "sriov/max_vfs",
> +				buf, sizeof(buf) - 1));
> +
> +	/* sriov_max_vfs_store
> +	 * Changing max_vfs usually fails once device is active.
> +	 * Accept expected policy failures while exercising store path.
> +	 */
> +	errno = 0;
> +	igt_sysfs_set(configfs_device_fd, "sriov/max_vfs", "1");
> +	igt_assert_f(errno == EBUSY,
> +			"Expected EBUSY from sriov_max_vfs_store, got %d\n", errno);

Ditto about errno and everything.

> +
> +}
> +
>  static void set_bus_addr(int fd)
>  {
>  	pci_dev = igt_device_get_pci_device(fd);
> @@ -439,6 +521,20 @@ int igt_main()
>  		close_configfs_group(configfs_fd, configfs_device_fd);
>  	}
>  
> +	igt_describe("Validate PSMI Store and Show functionality");
> +	igt_subtest("psmi_store_show") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		test_psmi_store_show(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
> +
> +	igt_describe("Validate SRIOV Max Vfs Store and Show functionality");
> +	igt_subtest("sriov_max_vfs_store_show") {
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		test_sriov_max_vfs_store_show(configfs_device_fd);
> +		close_configfs_group(configfs_fd, configfs_device_fd);
> +	}
> +
>  	igt_fixture() {
>  		close(configfs_fd);
>  	}

-- 
Jani Nikula, Intel
