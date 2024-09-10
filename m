Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53318EB64DE
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 05:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47E910E6F2;
	Tue, 10 Sep 2024 05:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSp7cNsh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B3410E6F2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725946337; x=1757482337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EMwZg4rPsa7XGCCZA1Al1pgg+FteZ9ZZSViDeyxBWZM=;
 b=ZSp7cNshP4rdNw+lacb1dEw7fPCHWCfb2hUy1sGteN+wXGX2gn/qkE9V
 dyB4703BCQ1wseKlK+WbtL3bNMMUaC0z4SN2CNUzJXPfjepx5Tm5djBvV
 U+Y23C9ijPukGsLD8oIO9uxRJ67arGJ/e4OoaHLBTVNzm5zGuCUOAR7Hl
 RtNw16W+MXBXtWX+pjFXeyZagNOWBHAwtWu9i36GDtybf4mnMWfnXZgSV
 EmOFzXNNNTot4XoC9XG10ZYM1dMtHiYeV5uIjtxv61Q8mLiYyn3eFO4K7
 +tR+y2gonfxSmg11o6q/fj0BVp0kOnVTNyInEXxMG6ib8phlJfKp84s87 Q==;
X-CSE-ConnectionGUID: LzsuGiyhQbKUqnGwk3YXjA==
X-CSE-MsgGUID: 5XHG6gNMTl2Tm633HMFcdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27595132"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="27595132"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 22:32:17 -0700
X-CSE-ConnectionGUID: V6X3WkkBS36NmaV75q1Bwg==
X-CSE-MsgGUID: 6RU10G4PRIiT0+kKUCQxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71871056"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.13])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 22:32:16 -0700
Date: Tue, 10 Sep 2024 07:32:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v6 11/17] lib/xe_eudebug: Introduce eu debug
 testing framework
Message-ID: <20240910053211.3bwnkis45gjxs5dv@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-12-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905092812.94553-12-christoph.manszewski@intel.com>
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

On Thu, Sep 05, 2024 at 11:28:06AM +0200, Christoph Manszewski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

<cut>

> +static int enable_getset(int fd, bool *old, bool *new)
> +{
> +	static const char * const fname = "enable_eudebug";
> +	int ret = 0;
> +	int sysfs, device_fd;
> +	bool val_before;
> +	struct stat st;
> +
> +	igt_assert(new || old);
> +	igt_assert_eq(fstat(fd, &st), 0);
> +
> +	sysfs = igt_sysfs_open(fd);
> +	if (sysfs < 0)
> +		return -1;
> +
> +	device_fd = openat(sysfs, "device", O_DIRECTORY | O_RDONLY);
> +	close(sysfs);
> +	if (device_fd < 0)
> +		return -1;
> +
> +	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
> +		ret = -1;
> +		goto out;
> +	}
> +
> +	igt_debug("enable_eudebug before: %d\n", val_before);
> +
> +	if (old)
> +		*old = val_before;
> +
> +	ret = 0;

You may drop ret = 0 here, as it is already initialized to 0
and noone overwrites it.

--
Zbigniew

> +	if (new) {
> +		if (__igt_sysfs_set_boolean(device_fd, fname, *new))
> +			igt_assert_eq(igt_sysfs_get_boolean(device_fd, fname), *new);
> +		else
> +			ret = -1;
> +	}
> +
> +out:
> +	close(device_fd);
> +
> +	return ret;
> +}
> +
