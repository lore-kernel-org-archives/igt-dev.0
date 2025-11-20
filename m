Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC15CF8575
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 09:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A8C10E71C;
	Thu, 20 Nov 2025 09:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bD+Lz6ds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4010E71C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763630517; x=1795166517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5fJGWPUG0E8+/58f87aBdkMobrzE6ReVk8Eo1EO948Q=;
 b=bD+Lz6dsemo5sQT1p1LJSTcvuld6yctixdX207UyzJbf7zCID9kA+dPS
 gopUD6GBWcRi+/wz05p3OLfP3s0Y6t3fVwpuPorJWJPG5n4vsypghbHhO
 Nab0JG4ejrnl66NT/QbrPvBpVZpmnQ6u7gYu0844OfZnLLOlIO9fd/Zmf
 8+/9/VsTt6/zBJR47eLA5dxf/pNPR2dWP4mAW+x1iCug19m+/9jfJAiHb
 IDw7p3lp7urSS94syubTwfDqtORCQ6zx84Q4BAKE68Fg7Hom/uQz3PEOu
 Vds2e/5NfdbPswE1qQxVkLdiLeoZNwzwb5YMAPZ3KJrmXWmLJoXbT0elv g==;
X-CSE-ConnectionGUID: +91tL1oHQZm89+FxXnXSvg==
X-CSE-MsgGUID: xaBIQGe1Tfybmb/M5GIXaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76372837"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76372837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:21:56 -0800
X-CSE-ConnectionGUID: dlhIM8KZRe2/j86OoMJaIw==
X-CSE-MsgGUID: 9oSq+804T1ithrJ4npKP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="190987937"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:21:55 -0800
Message-ID: <54fcf581-0235-4663-bd45-007891fd6b5d@linux.intel.com>
Date: Thu, 20 Nov 2025 10:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] tests/intel/debugfs: Add tile-dir subtest for
 per-tile debugfs validation
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
 <20251113114615.3736269-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251113114615.3736269-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 11/13/2025 12:46 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Let's add a dedicated subtest for tile-level debugfs validation.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_debugfs.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 2600880a7e..2824a48fa2 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -266,6 +266,35 @@ skip:
>   	igt_skip("Failed to open debugfs directory\n");
>   }
>   
> +/**
> + * SUBTEST: tile-dir
> + * Description: Check required debugfs devnodes exist in the tile debugfs directory
> + */
> +static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
> +{
> +	const struct check_entry expected_files[] = {
> +		{ "ggtt", O_RDONLY },
> +		{ "sa_info", O_RDONLY },
> +	};
> +	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
> +	int missing_count;
> +
> +	if (debugfs_fd < 0)
> +		goto skip;

NIT: why not

igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");

> +
> +	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
> +						 ARRAY_SIZE(expected_files));
> +
> +	close(debugfs_fd);
> +
> +	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
> +		      missing_count);
> +
> +	return;
> +skip:
> +	igt_skip("Failed to open debugfs directory\n");
> +}
> +
>   /**
>    * SUBTEST: info-read
>    * Description: Check info debugfs devnode contents
> @@ -365,6 +394,7 @@ static int opt_handler(int option, int option_index, void *input)
>   igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	struct xe_device *xe_dev;
> +	unsigned int t;
>   	int fd = -1;
>   
>   	igt_fixture {
> @@ -378,6 +408,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	igt_subtest("root-dir")
>   		test_root_dir(xe_dev);
>   
> +	igt_describe("Check required debugfs devnodes exist in the tile debugfs directory.");
> +	igt_subtest_with_dynamic("tile-dir")
> +			xe_for_each_tile(fd, t)
> +				igt_dynamic_f("tile-%d", t)
NIT: s/tile-%d/tile-%u/
> +					test_tile_dir(xe_dev, t);
> +
>   	igt_describe("Check info debugfs devnode contents.");
>   	igt_subtest("info-read")
>   		test_info_read(xe_dev);

With small nits, LGTM

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

