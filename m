Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D268E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 15:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA92710E0A7;
	Thu, 19 Dec 2024 15:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRZpyLM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A609510E0A7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734621468; x=1766157468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rUXMpLw/4Xrth8Mgf8enGtA3JDaJGuvx8Ui1aoccFM4=;
 b=hRZpyLM65rl/bcmiFrbb+81wsIvaXT580PWFYnIsPRfB5q18XOVxLfRe
 Ip9GSYwbcHvxuqc00Wh/hHLFpcEa3XYblUYeSwpSDS6e14S1ADTmJYwBt
 wk8R+OiEkjjTx9Z1Gv/tQdY18VrJlSLZGWFswybNlnd9N1H2PfXXqyQhy
 gaZ+HYkVqy5AAUYQhK6xgXWxXrcIY4IDE8DHyh7RxvhRRAj2NpX2hHzx7
 vheR4WsmisVbtv2+yQ9m8ZIEJjYqskBqpJ/0CLMCtq4B9p7fRXp1QRIt1
 kUz2UJnDAyq8cdUNcQdQiChxDu8lNRdr4Lau51syBwI3oIuRI6bKUpLxz A==;
X-CSE-ConnectionGUID: mswgHCAoQl6WLpzGFesFQA==
X-CSE-MsgGUID: Nin18ggnQnG5oSILDgll7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35349990"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35349990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 07:17:30 -0800
X-CSE-ConnectionGUID: b9yfuOeoS56Top60li8GUQ==
X-CSE-MsgGUID: pXz1IDltSIOo/yq2wa0QoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129033627"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 07:17:29 -0800
Date: Thu, 19 Dec 2024 09:17:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4 3/4] lib/drmtest: invalidate cached fds after
 unbind
Message-ID: <vzp6ujti66bclsrxqs272m6x77s2kjauxsoqrn3x3erc32mfjb@khckhse4niyl>
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
 <20241126181024.1398259-5-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241126181024.1398259-5-kamil.konieczny@linux.intel.com>
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

On Tue, Nov 26, 2024 at 07:10:22PM +0100, Kamil Konieczny wrote:
>After driver unbind or reload cached drm file descriptors could
>become stale, so there is no point in preventing calling
>drm_open_driver() again. This should prevent errors like:
>
>(xe_wedged:3680) drmtest-DEBUG: Condition stat(path, &new) != 0 occurred
>	in function _is_already_opened, file ../lib/drmtest.c:407
>(xe_wedged:3680) drmtest-WARNING: card maching filter 0 is already opened
>
>when test tries to open again driver and make checks if
>it is functional.
>
>Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> lib/drmtest.c          | 18 ++++++++++++++++++
> lib/drmtest.h          |  2 ++
> lib/igt_sysfs.c        |  1 +
> tests/core_hotunplug.c |  1 +
> 4 files changed, 22 insertions(+)
>
>diff --git a/lib/drmtest.c b/lib/drmtest.c
>index 2dd4540b8..2919a4891 100644
>--- a/lib/drmtest.c
>+++ b/lib/drmtest.c
>@@ -726,6 +726,24 @@ static void cancel_work_at_exit_render(int sig)
> 	at_exit_drm_render_fd = -1;
> }
>
>+/**
>+ * __drm_invalidate_opened_fds:
>+ *
>+ * Invalidate drmtest internal fd caches.
>+ */
>+void __drm_invalidate_opened_fds(void)
>+{
>+	_opened_fds_count = 0;
>+	if (at_exit_drm_fd >= 0)
>+		close(at_exit_drm_fd);
>+
>+	at_exit_drm_fd = -1;
>+	if (at_exit_drm_render_fd >= 0)
>+		close(at_exit_drm_render_fd);
>+
>+	at_exit_drm_render_fd = -1;

humn... this only cleans up the _at_exit fds, leaving the fd/stat intact
in the array. The next drm_open_driver() will still complain that the fd
is already opened.

>+}
>+
> static const char *chipset_to_vendor_str(int chipset)
> {
> 	return chipset == DRIVER_XE ? chipset_to_str(DRIVER_INTEL) : chipset_to_str(chipset);
>diff --git a/lib/drmtest.h b/lib/drmtest.h
>index 27e5a18e2..fb37a1070 100644
>--- a/lib/drmtest.h
>+++ b/lib/drmtest.h
>@@ -129,6 +129,8 @@ int drm_reopen_driver(int fd);
> int drm_prepare_filtered_multigpu(int chipset);
> int drm_open_filtered_card(int idx);
>
>+void __drm_invalidate_opened_fds(void);
>+
> void igt_require_amdgpu(int fd);
> void igt_require_intel(int fd);
> void igt_require_i915(int fd);
>diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>index 00d5822fd..e903a9857 100644
>--- a/lib/igt_sysfs.c
>+++ b/lib/igt_sysfs.c
>@@ -1448,6 +1448,7 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
>
> 	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> 	igt_assert(sysfs);
>+	__drm_invalidate_opened_fds();

this doesn't seem to be placed correctly. It shouldn't be done here for
all the operations below and doing so means the at_exit_ logic stops
working.

why don't we pair it with drm_close_driver() and change other places to
make sure they call drm_close_driver() rather than plain close(), like I
did in my patch series?

Also, another possible issue is that __drm_open_device() doesn't use
O_CLOEXEC, so if the test exec it will leak the fd and that will change
the logic of what will be the next card# on a rebind.

Lucas De Marchi
