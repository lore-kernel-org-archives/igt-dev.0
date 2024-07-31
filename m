Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75607C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 06:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3C610E1AD;
	Wed, 31 Jul 2024 06:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLF74jGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E4B10E1AD
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722406192; x=1753942192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V6Qn56q4z3kNmv/HxsIKt0QO37XvpF5s48+NgpSwa+k=;
 b=GLF74jGNa1uPwNjYBgmzsPZLDpX23p7oqiblwdvSnACL8NWBO6Jsc0n/
 pgiZg3vjVItneGsdd9wm7TLI6zEaKS70UVTyXyVykEbey70aPBLF6OXy3
 3B3dH3EJx29bcyyJpnpmvdjaG6HVjqgJk0wgT1YHpAEuuHGQPN/eNqv3M
 TYWKRWBI2eG9MYuQtJzBu3wjFP1WK6CRaWzZX+bIPnNjurYUjGajehJmB
 9ng9v0XoAbTdYaFAXQmx9rkRuI125v6jrV1Rjkf8QdPIYga1LgnnlR+8Y
 StgMc++7gFPzFrSotD0HPeNFeW1kreKZSPKBqssUk+/f/FE2UqXVk8gmA Q==;
X-CSE-ConnectionGUID: 1s0X7wrHStqaio3hW8nfxw==
X-CSE-MsgGUID: /UBsLV9+RmKFQ60/syl3kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30926767"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="30926767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 23:09:50 -0700
X-CSE-ConnectionGUID: QSmrjSDxSViH6dsqDXjYzw==
X-CSE-MsgGUID: bSpDSnuCQWCDhA2ZiA8iWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; d="scan'208";a="59425447"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.111])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 23:09:48 -0700
Date: Wed, 31 Jul 2024 08:09:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 3/3] lib/xe_spin: Fix ending the loop
Message-ID: <20240731060946.zzusw6mcvvq22lcu@zkempczy-mobl2>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731033504.1426640-4-lucas.demarchi@intel.com>
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

On Tue, Jul 30, 2024 at 08:35:04PM -0700, Lucas De Marchi wrote:
> Less likely to be a problem with optimizations than the started
> condition, but let's stay on the safe side. Comparing to igt_spin_end(),
> that one uses a sync_write() to force a MI_BATCH_BUFFER_END in the
> beginning of the loop that has a even stronger guarantee.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/xe/xe_spin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 43a7a43c2..f8b225125 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -183,7 +183,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
>  
>  void xe_spin_end(struct xe_spin *spin)
>  {
> -	spin->end = 0;
> +	WRITE_ONCE(spin->end, 0);
>  }
>  
>  /**
> -- 
> 2.43.0
> 

Same as in 2/3. Checked in godbolt, -fpic/O3 always produces
memory access.

--
Zbigniew
