Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF6C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4565E10E602;
	Wed, 21 Aug 2024 14:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fx/3xqpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85F910E602
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724249880; x=1755785880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ap57fwCYzTqDoH+AttYbbqKoeJkiXa2mFnSjqEpLjQY=;
 b=Fx/3xqpaThvuEu6A4y2AWT++uX/xgcekaxiiLlF1ueOZJceXUXZiK5L8
 Ils5/sdoQwNcHrnUlJijLJz0/GWqAyP2jB+xznG4127/EnG3zC5USsyxI
 zkhd7vJAwgdQKjzU4vEJgBs8ozl4T58KbRwsdOp7Ul7tph6JjuBtJzUw2
 a+LdiwWMgqaoVUrMAqiq+eXjgP/gaHFLGEkh1q/B7wMQ60+xBwX+hwk98
 JUaicRwgjQ9BKHJHaccGtgKUK8kFlu4bvXz6u6Y9qjDELVmeZj7RAIN6W
 xvp9k3Pc4E15VikIyREf7wVZhz+CK7iwSrIdhcTwUgFJbFyrZR3GpcveJ w==;
X-CSE-ConnectionGUID: rYuHH8vnSWSvQ5qVHnaRXA==
X-CSE-MsgGUID: k/gWT2bsTlaOmbrFF1SihA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22144060"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22144060"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:18:00 -0700
X-CSE-ConnectionGUID: Va2Eb6pJQ8yeOCg63Lx1Lg==
X-CSE-MsgGUID: ct0FxlwFQKGyi+ahtQ59YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61861675"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:17:57 -0700
Date: Wed, 21 Aug 2024 16:17:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH i-g-t v2 1/3] tests/intel/gem_mmap_offset: Partial mmap
 and munmap
Message-ID: <ZsX3EeRCsNScvlng@ashyti-mobl2.lan>
References: <20240821135943.31340-1-krzysztof.niemiec@intel.com>
 <20240821135943.31340-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821135943.31340-2-krzysztof.niemiec@intel.com>
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

Hi,

On Wed, Aug 21, 2024 at 03:59:41PM +0200, Krzysztof Niemiec wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> Based on a test case developed by Lionel Landwerlin, this exercises
> creation of partial mmaps using both direct methods of a partial mmap()
> (where the mmap() only covers a portion of the object) and
> munmap() to do the same.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
