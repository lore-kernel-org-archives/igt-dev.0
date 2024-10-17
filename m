Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAAAD2127C
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47110E145;
	Thu, 17 Oct 2024 11:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwjZg37P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBD410E145
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729165478; x=1760701478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tbYmLKjk8/0vxyrddXm8YyWGEi7E48Sg5lxGrddO9dY=;
 b=kwjZg37PCGI+Nj3Gpcd4J/SMpnDLNLZz296OX3ZAkwVw7tZhL+G4hKBw
 5eRV67YG5a0BgU4CO+OxsxQKp0C1Z1LkBIpysl5SzHG7JJXpdMWEJC8Xo
 F4hS7iGYZCfTt3KTUaR8QN4IlYQUwYTF4dy/kF2f8nG/8Qjeep8Ll42ST
 6Ro6xCDeM/xM+wwtU4ZjfzWEPbgG5YXLJMfjk2Vgcx02PjglbZU4T+VxK
 PLpLvd1Qm1cWUyCaRxp50C2mjVueemrRU77pDvVOV3neaRY8MUYf6qkZB
 pl7T1xMUJXzoJQXpYF13DGyEocNnVPmvG3KJh2HB7W7Z2S6nF9UQZqxA4 w==;
X-CSE-ConnectionGUID: imz0OLWKSumLF1TJk/93KA==
X-CSE-MsgGUID: oc9F7NDBQeGZ/eMmCTE3Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28116702"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28116702"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 04:44:38 -0700
X-CSE-ConnectionGUID: W3WavZl/QyW6WeaWcLAD/w==
X-CSE-MsgGUID: Olr5YFg4Q0qkX+r74txPxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83599916"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.141])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 04:44:36 -0700
Date: Thu, 17 Oct 2024 13:44:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_balancer: Disable parallel
 tests on execlists
Message-ID: <ZxD4oFUc941DoqIw@ashyti-mobl2.lan>
References: <20241016132718.36457-4-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016132718.36457-4-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,

On Wed, Oct 16, 2024 at 03:27:21PM +0200, Krzysztof Niemiec wrote:
> The functionality of parallel execbuf tests is not supported in
> execlists mode. Fix the check in has_parallel_execbuf() to take that
> into account.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
