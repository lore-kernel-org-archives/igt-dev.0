Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ADACA100C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACB910E11A;
	Wed,  3 Sep 2025 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJCnMWjY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EA210E11A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885574; x=1788421574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gScHHzR+Nj/08oILrLrFubYcCUUTnKeiClqdWtSFdV0=;
 b=dJCnMWjY6iqUHC6eJ0gQ66A8sX5tEnxO5rn7FLMp745moUroU4uckG98
 Q+PNJTYYHaBPwW+3koXEQ0kB8dknv5XewXJjMULeFx1CzyJUlG3kZSgTG
 wrCy4dkeUY/cinkwRB6FXfzSHozpiKlWvhmCp8LFvfmpLGsxHwkHekoRG
 VnyYE88I23LnPt+oPpP5tKWIFd0awLr1XdZhRwot1PfJkzkxER6WGIMKI
 Z5ZUa4cx39Z7Kq3o+V2X2DNy12uGa0ngpp2mcDyS0yupYrbW9ernXmT8b
 eTvMiqtVxyJdMLMxILFohiM134RWSgfYPX0EJsvQV7FLGdS6A0YBX06Ma w==;
X-CSE-ConnectionGUID: CCphfIEmSZ6Nr+jyx0GrHg==
X-CSE-MsgGUID: OBFI2H3xQma4XOE3MD1vVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59303521"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59303521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:46:14 -0700
X-CSE-ConnectionGUID: uUjcQCK/SseLh0yF7QouuQ==
X-CSE-MsgGUID: Qp1bbSGlSuSJ/mu3f00WjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="175875975"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 00:46:13 -0700
Date: Wed, 3 Sep 2025 09:45:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci: Unblock the xe_evict multi-thread tests
Message-ID: <20250903074548.qwp77wjq6j5ujend@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250902130029.70621-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902130029.70621-1-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,
On 2025-09-02 at 15:00:29 +0200, Thomas Hellström wrote:
> With xe exhaustive eviction nearing merging, unblock the
> xe_evict tests that saw failures due to lack of exhaustive eviction.
> 
> Initially this patch will be used with Test-with: tags.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 14e0b9482..47cb7458a 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -110,10 +110,3 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
>  igt@sriov_basic@enable-vfs-bind-unbind-each$
>  igt@sriov_basic@bind-unbind-vf$
>  ##################################################################
> -# Exclude xe_evict tests that are not expected to succeed
> -# due to missing TTM exhaustive eviction
> -##################################################################
> -igt@xe_evict@.*-multi-vm-cm.*
> -igt@xe_evict@.*-threads-.*
> -# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
> -##################################################################
> -- 
> 2.50.1
> 
