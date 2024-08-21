Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEC8C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55E510E628;
	Wed, 21 Aug 2024 14:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kN4ZFeyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0161910E628
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724250564; x=1755786564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nKGuly9IMNUafSf73jFSpy4fUg2kwgQ+PQV7Z26P8Bc=;
 b=kN4ZFeyU1ihOYNwgFRnoKPa9E+olaKV0x/FAY0ktcSZojhYrKLTj78e4
 fkOVMGYPhUQ2xtTp8nZ5TCMAoIZ21Hc93JQSHtKdWIf5gTwTn8g7i5ZPL
 XAMyEgTnIRy3MGQVm2lD0VHhdxFSBq155lScjAh2cV2BX+rkwuS1JcMwF
 8ldi5O/EeSbDGj1/8S4Rew2cOIDSaDVZGGkX6PPxUY/GwY6HSQYztYK05
 J44JwjBKHx2zpcSHvhLBtuIDIwad51BaZnU5IdAK557S70Jui/UtB/xM6
 b22XwWxnT1CublzkwgGyaSX2OQ+msTqaCnIgVQDMWf6BnDBJLAGKJYbO+ w==;
X-CSE-ConnectionGUID: kZYAQj3vReqflWgyy+464Q==
X-CSE-MsgGUID: HfmbsaU8Sca8W73XAdWXNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225961"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22225961"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:29:23 -0700
X-CSE-ConnectionGUID: pNAXbRyZRSenYnXbC07MsQ==
X-CSE-MsgGUID: J5bxjuHXTSmtCulRimjogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65997451"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:29:20 -0700
Date: Wed, 21 Aug 2024 16:29:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/gem_mmap_offset: Introduce
 mmap-unmap test
Message-ID: <ZsX5vGguP77Gy18A@ashyti-mobl2.lan>
References: <20240821135943.31340-1-krzysztof.niemiec@intel.com>
 <20240821135943.31340-4-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821135943.31340-4-krzysztof.niemiec@intel.com>
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

> +	__test_mmap_unmap(args->i915,
> +			  args->r,
> +			  args->limit,
> +			  args->map_size, /* obj_size == map_size in flipper */
> +			  args->map_addr,
> +			  args->map_size,
> +			  args->map_addr,  /* we ignore the poke in flipper thread */
> +			  args->flags,
> +			  false
> +			  );

one nitpick here, the parenthesis should go after false.

Otherwise,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
