Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E60CAC5B1
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 16:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D94A10E94E;
	Thu, 25 Sep 2025 16:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlUpil12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C7910E94E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758818532; x=1790354532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k+Yx9zzQM1ugR4KXeQ5fo2D0HBu2QszfN/k2LyWuJyA=;
 b=UlUpil12OJjiOF+qQqAyDDQKosRU0WoSUaYm6AdydDrgNP4iaBdWZsIv
 8T7BANjvSUsfh/OdGeMdVZ7LXi46OK8fkDZ/3F9Y0PqgURos5Y4Fh5Og6
 QCTTUoFH91vY37QONA1ckHqfyMBA2QseXnYpNNcya5kyA1MK2kYk1tW3z
 km/LXR3CPV8N6U2/5Ldy+47F5Meyxunq2OLbp6UU8ASyBQ+1GkrHKgvF2
 f8BzlCre95PgtM/c09xB0Gny9BCDK4M/IQw9QQ6icYJS/k2a8Ook2QFoe
 rvuciIHyRGNyM8oN33kKTHyYOyv0CLWXIqq6vs60MY3DNIYp1o8FdbULt g==;
X-CSE-ConnectionGUID: hA70G6i3Q0Wrl0PWfajBFA==
X-CSE-MsgGUID: 9i4tOY30RtmVGpf8ZisUeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61034828"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61034828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:42:11 -0700
X-CSE-ConnectionGUID: +0lg3X/hT/+dKmzTXfH7sw==
X-CSE-MsgGUID: 1DvJzg3ERIu5xoRufGDAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="208314335"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:42:09 -0700
Date: Thu, 25 Sep 2025 18:42:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v6 i-g-t 5/9] lib/xe_eudebug: Introduce variables for
 signal handling synchronization
Message-ID: <huu6poeyomd2bu4wfbnlvh7q4xmw635s73jyxytjmlzgbzzvop@jq3hkdcnluhp>
References: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
 <20250925123745.15721-6-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925123745.15721-6-dominik.karol.piatkowski@intel.com>
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

On Thu, Sep 25, 2025 at 02:37:41PM +0200, Dominik Karol Piątkowski wrote:
> Introduce received_signal, received_sigint and handled_sigint variables
> to help with coordination of handling SIGINT and other signals.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 3 +++
>  lib/xe/xe_eudebug.h | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 3495354e3..512c81bf5 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1170,6 +1170,9 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>  	d->fd = -1;
>  	d->master_fd = master_fd;
>  	d->ptr = data;
> +	d->received_signal = false;
> +	d->received_sigint = false;
> +	d->handled_sigint = false;
>  
>  	return d;
>  }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 389572ed0..4d658e11b 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -44,6 +44,10 @@ struct xe_eudebug_debugger {
>  	pthread_t worker_thread;
>  	enum xe_eudebug_debugger_worker_state worker_state;
>  
> +	bool received_signal;
> +	bool received_sigint;
> +	bool handled_sigint;

Above struct members should occur in patches they are used,
not only initialized.

--
Zbigniew

> +
>  	int p_client[2];
>  };
>  
> -- 
> 2.34.1
> 
