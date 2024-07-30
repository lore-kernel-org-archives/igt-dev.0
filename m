Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE98C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 04:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FE410E107;
	Tue, 30 Jul 2024 04:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2dyxVww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19E010E107
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722312661; x=1753848661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TYQ/pt2JyEhLY+VFY0HFqKoD0j8tt4puL1HKnH0RGfw=;
 b=g2dyxVwwKKRFFmzIXKDX2At5pLLE6Tt32QFnxq4hbZbtnok2YpMz5M8i
 kyExNh3WbJtbpXf/QzKYRC1IUInnRl4nj/tjJt11zOfpDDDvxGichjmwR
 gfjmVUuWiuRbn2YyAm7IhgQJUhlLYQJDBoYQdldaK1UCES0oHpX/WlPnZ
 /FtXyG9wVKtwi12xbMl6BbvsvVikpUDDJw0inozLPyGnieSbnda+CNVxf
 sRK/qjsn1QVVu0LqMTzSuneQE4JjFVU3WkRC9+XQ1S82hTUJv4T2UgQTT
 OVbRvnLcX5XRNbiPB44lt7a5vCsZQ63kVw77LpQFDxkt37lyo5GkpMz0b Q==;
X-CSE-ConnectionGUID: oN5XcKIBTU+gGTet5pAG+g==
X-CSE-MsgGUID: d0n4Om+YQ0iC79lJAXPnKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="45523027"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="45523027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 21:11:00 -0700
X-CSE-ConnectionGUID: c4uzfb7RT/Wx7U2xlu1QgQ==
X-CSE-MsgGUID: mCSZm+TYSOqUL0SBhAfTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="58336453"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 21:10:59 -0700
Date: Tue, 30 Jul 2024 06:10:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Message-ID: <20240730041057.wpwlgc443yqhirdk@zkempczy-mobl2>
References: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
 <20240725125006.30041-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725125006.30041-3-kamil.konieczny@linux.intel.com>
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

On Thu, Jul 25, 2024 at 02:50:04PM +0200, Kamil Konieczny wrote:
> Allow a test to emit regex into dmesg to be read by runner when
> it will be generating results based on kernel dmesg. When it
> will encouter such message, it will save it and then temporarily

s/encouter/encounter/

> ignore kernel warnings or errors which matches given regex.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c | 14 ++++++++++++++
>  lib/igt_core.h |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392..647486ba9 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3432,3 +3432,17 @@ int igt_pci_system_init(void)
>  
>  	return pthread_once(&once_control, __pci_system_init);
>  }
> +
> +/**
> + * igt_emit_ignore_dmesg_regex:
> + * @ignore_dmesg: string regex
> + *
> + * Emits a string for igt_runner to ignore next dmesg warns or errors which
> + * matches it.
> + */
> +void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
> +{
> +	static const char mark_ignore_dmesg[] = "add ignored dmesg regex: ";
> +
> +	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);

If developer will make a mistake and pass invalid regexp we will know
about it late, at runner time.

As this is hard contract between runner and the test which is feeding it
with regexp you should validate it here. It even should assert as
most tests are executed manually during development phase so you'll
ensure developer has provided valid regexp.

The biggest cons of this attitude is if you'll make a mistake you'll
have to alter regexp. Kernel changes in dmesg output also will require
test change what is a noise. But as I said in previous mail it is
conditionally acceptable for me atm. We have single exception now
(xe_wedged) so lets go this way.

--
Zbigniew


> +}
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 084d94da7..22bdc0b73 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1522,4 +1522,6 @@ static inline void igt_pci_system_cleanup(void)
>  {
>  }
>  
> +void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
> +
>  #endif /* IGT_CORE_H */
> -- 
> 2.43.0
> 
