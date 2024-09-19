Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D31CE8D4C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 05:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780C510E22B;
	Thu, 19 Sep 2024 05:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZO0Kmcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1425310E22B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 05:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726724877; x=1758260877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kcBPlGD8k0GcMnW8vAz2O1aO2+kig6h1qhkoqbJQyxk=;
 b=aZO0KmcuCoOeqGcjjmWwN5sG6pm4QTS+pK3p/nr+px7xJRtHE58ewTh3
 PKfvTzEbTfgNNrO8tJ7ttk3gCpmG1i6AMRedFuR+JVSckEFsXjlHnBG3U
 /YB1iWYejGUFcQlH7dNY4qO/NHdT82dIblFpYsbroMb6sHB74y23zYViR
 1R2zr7wbgqBHoXBMRY5aCQmj/A3txQ+0VJk3t9zBPuWh7LDtqts9C3EeW
 qh0QATuHjUCfDn+KPj8xfCRoN0Jh019gWC1zTFeK7VlPcnO6QcoVaf5J+
 gzxERiF8Wl5ZNN++Ks0brXq8yEcxvm2z+nHjPgwyH/vH65qPY1a9PNz3c A==;
X-CSE-ConnectionGUID: TFIXTdWhScG+z/YFRexlYA==
X-CSE-MsgGUID: 4do1c5vUQSuDtgfqcc8Evg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="28570635"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="28570635"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 22:47:57 -0700
X-CSE-ConnectionGUID: htFi7iYDQ2KakrWSIg9BlA==
X-CSE-MsgGUID: +oMpEyz3T3m72lNFCN2hrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="74350600"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 22:47:53 -0700
Date: Thu, 19 Sep 2024 07:47:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuaoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t v7 10/16] lib/xe_eudebug: Introduce eu debug
 testing framework
Message-ID: <20240919054750.pm46jed36y6a3xbs@zkempczy-mobl2>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
 <20240918113017.144687-11-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918113017.144687-11-christoph.manszewski@intel.com>
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

On Wed, Sep 18, 2024 at 01:30:11PM +0200, Christoph Manszewski wrote:

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

Shouldn't this be igt_assert(new && old)?

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

I've compared to previous series and IMO this acceptable, keep a-b.

--
Zbigniew
