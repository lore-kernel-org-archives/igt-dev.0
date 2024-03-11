Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7192BC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0868B112A9A;
	Mon, 11 Mar 2024 13:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+urC0Z2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C96E10E479
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165517; x=1741701517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zF7oVZtYeWBAhy5kt4xhl9pEUU+TwGglSmxcPdY+4yw=;
 b=K+urC0Z2xUXz8OgsRPQhldCPsQh0bQ/If93VLOqx5xLzzNpRYLqwINrm
 vNqEjKOb3Vwty2cViz9tYfr8t1FnnthzGtOxQ//2sE8C4JL+s73hMjSKN
 6l/Dfw5Gl4e6TTb2VsHQGNj/XWvDw4rp9b0PIX9i9XfBS6U1vk7QmzqVB
 L3vRvzU0JQAbSu3hiLs/8E71u1I6j3+uyC1ceKMKlslX9Kj9Mh4qt02hh
 5T+cvNAmqNk4/xZsk1uuRnD3hKeCi7W3scPFOfB/cYE8cinbhL+mDPDo9
 /mYZ1VYUw9duTDqbdicFSFVWBzaI1CwzMmbTceiK7rKIm9iQdHWORU7D9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15558263"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15558263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15880917"
Received: from unknown (HELO localhost) ([10.245.244.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:58:35 -0700
Date: Mon, 11 Mar 2024 14:58:32 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 13/25] tests/intel: Introduce Render copy
 subcategory
Message-ID: <20240311135832.u3fyrnkvusbpbxpq@zkempczy-mobl2>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-14-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308083657.1092049-14-katarzyna.piecielska@intel.com>
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

On Fri, Mar 08, 2024 at 08:36:45AM +0000, Katarzyna Piecielska wrote:
> Let's put render tests under Render copy subcategory.
> 
> v2: Change functionality to render_copy to not break automation tools
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/gem_render_copy.c       | 3 +++
>  tests/intel/gem_render_copy_redux.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
> index 57ca2c9ec..91979ba07 100644
> --- a/tests/intel/gem_render_copy.c
> +++ b/tests/intel/gem_render_copy.c
> @@ -52,6 +52,9 @@
>   * TEST: gem render copy
>   * Description: Basic test for the render_copy() function.
>   * Feature: mapping
> + * Sub-category: Render copy
> + * Category: Desktop client
> + * Functionality: render_copy
>   * Run type: FULL
>   *
>   * SUBTEST: linear
> diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
> index 06777dd7f..681cb5cca 100644
> --- a/tests/intel/gem_render_copy_redux.c
> +++ b/tests/intel/gem_render_copy_redux.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gem render copy redux
>   * Description: Advanced test for the render_copy() function.
> + * Sub-category: Render copy
> + * Category: Desktop client
> + * Functionality: render_copy
>   * Run type: FULL
>   *
>   * SUBTEST: flink
> -- 
> 2.34.1
>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
