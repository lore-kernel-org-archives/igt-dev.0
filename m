Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF31C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 15:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6410E4AF;
	Tue, 18 Mar 2025 15:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYRvimnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50E010E4B0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742313384; x=1773849384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h+XqZwuAptqlnK1FH0QKuJMWVay0S6RCSCHJdHt7dVo=;
 b=SYRvimnJv0RgwaRawKobBDNNHhOlFoWSwBI7M7oygvUfYFuDh/dl3qpB
 /2eirzuLDaiqDN1RzlJ6OfcMSejN8xxkkQdeRjdfEFHiF7RPTAB8YYhuy
 Fl1b3nJNGy6mmkHHTXyxCwMiiwZ6L/KOL6gcRjy1Dk20xuxkAz8irYV9Y
 /r5F8qtPtiUMxbhD9qFmpJc6YRncw2ILfKhvFwUYkFvrSLD8sv7OTAqxJ
 Qh3JDCv3miNdGQF7q3Ob3s2N4QmWURqB5J4BwZRFPCQ3KgJPSJ7v5tvw8
 ghrV8RcGoCNDQ7XrPpm5XDXX0L7/Za911B2UezUBdcxNneH6i17hW7d+A g==;
X-CSE-ConnectionGUID: ObCQe7C+QmCVQp/5kIivzA==
X-CSE-MsgGUID: lXo02iNeRP6IDDD6MaFT/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54848340"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="54848340"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:56:23 -0700
X-CSE-ConnectionGUID: mI/S8T20TPawpYPrH5qceQ==
X-CSE-MsgGUID: /SwFDgZJR6OVuIPDdMPKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122129175"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 08:56:21 -0700
Date: Tue, 18 Mar 2025 16:56:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_debugfs: Add tests to read all
 debugfs and sysfs files
Message-ID: <20250318155618.aca5jdkn62qzp3hg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250318095350.57133-1-peter.senna@linux.intel.com>
 <20250318095350.57133-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318095350.57133-2-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-03-18 at 10:53:50 +0100, Peter Senna Tschudin wrote:
> The existing tests/intel/debugfs_test.c scans and reads all relevant
> files from sysfs and debugfs, but it is specific to i915, leaving a gap
> for Xe.
> 
> A similar test exists for Xe in tests/intel/xe_debugfs.c, but it has two

Please do not write out full path nor test name, it is in
subject, no need for repeating.

> gaps compared to the i915 counterpart:
>  - It lacks sysfs file testing.
>  - It does not attempt to read all debugfs files.
> 
> This commit addresses these gaps by adding two new tests to
> tests/intel/xe_debugfs.c:
>  - sysfs_read_all_entries
>  - debugfs_read_all_entries

Both test names should have minus as separator, so s/_/-/g

- sysfs-read-all-entries
- debugfs-read-all-entries

> 
> Both tests use the function read_and_discard_sysfs_entries(), which was
> copied from tests/intel/debugfs_test.c.

You also do not need to translate code from C into words,
all this is in patch itself so imho drop this paragraph.

Btw this looks pretty generic, maybe move all this into
core_sysfs test?

Regards,
Kamil

> 
> Cc: rodrigo.vivi@intel.com
> Cc: katarzyna.piecielska@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/xe_debugfs.c | 88 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index ec8b0d0b5..0b468c4d4 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -235,15 +235,90 @@ static int opt_handler(int option, int option_index, void *input)
>  	return IGT_OPT_HANDLER_SUCCESS;
>  }
>  
> +/**
> + * SUBTEST: sysfs_read_all_entries
> + * Description: Read all entries from sysfs path.
> + *
> + * SUBTEST: debugfs_read_all_entries
> + * Description: Read all entries from debugfs path.
> + */
> +static void read_and_discard_sysfs_entries(int path_fd, int indent)
> +{
> +	struct dirent *dirent;
> +	DIR *dir;
> +	char tabs[8];
> +	int i;
> +
> +	igt_assert(indent < sizeof(tabs) - 1);
> +
> +	for (i = 0; i < indent; i++)
> +		tabs[i] = '\t';
> +	tabs[i] = '\0';
> +
> +	dir = fdopendir(path_fd);
> +	if (!dir)
> +		return;
> +
> +	while ((dirent = readdir(dir))) {
> +		if (!strcmp(dirent->d_name, ".") ||
> +		    !strcmp(dirent->d_name, ".."))
> +			continue;
> +
> +		if (dirent->d_type == DT_DIR) {
> +			int sub_fd;
> +
> +			sub_fd = openat(path_fd, dirent->d_name,
> +					O_RDONLY | O_DIRECTORY);
> +			if (sub_fd < 0)
> +				continue;
> +
> +			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
> +			read_and_discard_sysfs_entries(sub_fd, indent + 1);
> +			close(sub_fd);
> +		} else if (dirent->d_type == DT_REG) {
> +			char buf[512];
> +			int sub_fd;
> +			ssize_t ret;
> +
> +			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
> +			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
> +			igt_set_timeout(5, "reading sysfs entry");
> +
> +			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
> +			if (sub_fd == -1) {
> +				igt_debug("%sCould not open file \"%s\" with error: %m\n",
> +					  tabs, dirent->d_name);
> +				continue;
> +			}
> +
> +			do {
> +				ret = read(sub_fd, buf, sizeof(buf));
> +			} while (ret == sizeof(buf));
> +
> +			if (ret == -1)
> +				igt_debug("%sCould not read file \"%s\" with error: %m\n",
> +					  tabs, dirent->d_name);
> +
> +			igt_reset_timeout();
> +			close(sub_fd);
> +		}
> +	}
> +	closedir(dir);
> +}
> +
>  igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
>  	char devnode[PATH_MAX];
>  	int fd;
>  	int gt;
> +	int debugfs;
> +	int sysfs;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> +		debugfs = igt_debugfs_dir(fd);
> +		sysfs = igt_sysfs_open(fd);
>  	}
>  
>  	igt_subtest("base") {
> @@ -263,6 +338,17 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		test_forcewake(fd);
>  	}
>  
> -	igt_fixture
> +	igt_describe("Read all entries from sysfs path.");
> +	igt_subtest("sysfs_read_all_entries")
> +		read_and_discard_sysfs_entries(sysfs, 0);
> +
> +	igt_describe("Read all entries from debugfs path.");
> +	igt_subtest("debugfs_read_all_entries")
> +		read_and_discard_sysfs_entries(debugfs, 0);
> +
> +	igt_fixture {
> +		close(sysfs);
> +		close(debugfs);
>  		drm_close_driver(fd);
> +	}
>  }
> -- 
> 2.34.1
> 
