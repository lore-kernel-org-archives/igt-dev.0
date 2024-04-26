Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE279C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 03:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE2C10ED64;
	Fri, 26 Apr 2024 03:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlwZCwQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6376C10ED64
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714103688; x=1745639688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ghZd6rzI6p8EkfUyzrpA4DbHmKQQtUYQeTEr88GFHPM=;
 b=VlwZCwQWlZ773N4sHtP8QclFKPWSGxtPw0/CBSgaHWjOXViDpBNBArai
 AF7dfuKDqjs8MQaEf84bKnv2oLC9SiiSEWNEH0Y2NpQVAW1xGVW+HaAFt
 OuC870qbCI6uzNCSjSBWC7ZfJeR7Jcn8m+qpXK7LkDuWMF4PmCDb056Qq
 ozZS7mRG8de1oP3DOREfmFYn5B8lIze181YcbomjF++Qdc3Ll88NLdCOX
 fESf/UffkojIyrEbb71PN18eXgNiGshvbMp0Rq9qyF40FLgH6R88N+EKv
 GjuBEcYrImsB7ZNuHN/25oh0kK3JZD4v/cbW/fSrqf8WrxHrpoqM9+Qsa Q==;
X-CSE-ConnectionGUID: 7i8vq2kCTMyI3fV0l8Fmkw==
X-CSE-MsgGUID: etp77DfdRS2vY9g3/oYA6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20381935"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="20381935"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 20:54:48 -0700
X-CSE-ConnectionGUID: 4HKz48ytSwCn/iCfLHYhTA==
X-CSE-MsgGUID: vC1jTMIUS/aGPTqXGqmWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="29740027"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 20:54:46 -0700
Date: Fri, 26 Apr 2024 05:54:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: peter.senna@gmail.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: tests/intel/gem_exec_capture: changing the test size breaks the
 run
Message-ID: <20240426035444.abkx3xo2mghlkurj@zkempczy-mobl2>
References: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+MoWDqANoCnEUbZ1s+rbH=KMttjX+xobRze3EM-PLZMfSFHfg@mail.gmail.com>
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

On Thu, Apr 11, 2024 at 09:41:11PM +0200, Peter Senna Tschudin wrote:
> Dear list,
> 
> After my change*, most of the subtests from gem_exec_capture work, but
> only if called one by one using --run-subtest. Here is an example:

<cut>

Unfortunately this is related to IGTs construction. I mean if one
subtest will allocate the memory and due some reason it won't free it
then next subtest doesn't start from scratch, but from some changed
state. Subtests which fail mostly left drm fd in some state which
might affect next subtests. We're using igt_runner to separate subtests
execution and make sure each runs in own process. I'm not saying subtests
shouldn't run fluently one by one, but in CI we won't rely on that.

--
Zbigniew
