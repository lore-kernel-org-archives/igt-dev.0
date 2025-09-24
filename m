Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54009CAC5B3
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 11:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0004110E70C;
	Wed, 24 Sep 2025 11:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaZFlIPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFCE10E70E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758714164; x=1790250164;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a09GNMeZBuNFrZAgTPmbNymmmMFCAcEt+buBHpPLkIQ=;
 b=DaZFlIPDg6/6ciVfHkSGGx1MWkpC88y21tsh0lILWh71YxhlM0t+pVjn
 pDRCAwffYXKfh41OaCBkYIb+q7XMX5D5erXIyjvgTIH7q21saT9yLOCXh
 SZBuS6kK0S6V49bz/bExFnu3NFL3Gc1ouF2vtA9EXJCuS9wAA3dWq7Vlm
 ASDOhDTK3M7h071sV4SGQE4J6dFmP9HMyeflOwC8V1GkfIKVAeF1QSk9+
 vG2aMz4cQ5SoUt//SLbLPeqya6dqMvOUtlfS4NskSv+wFGrOzpds4A333
 Yd0nXZBkIoEHxVJf/ulCZONcJRtWqaS8pzAnTtdYm+sWVwZgGB1dmnR8O A==;
X-CSE-ConnectionGUID: JE7k35xSQnqF3YU7N2X3Sw==
X-CSE-MsgGUID: e6XNM7fBRfem50ZyIpRcjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63635193"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="63635193"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:42:44 -0700
X-CSE-ConnectionGUID: +emO98K3SqibpSAOsQNlHg==
X-CSE-MsgGUID: LdKuXug6Rzux3Am8ZMhlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181025637"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:42:41 -0700
Message-ID: <411a13c9-cb01-4d30-aad7-970497b3e571@intel.com>
Date: Wed, 24 Sep 2025 13:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Dominik,

On 23.09.2025 15:10, Dominik Karol Piątkowski wrote:
> Rewrite SIGINT signal handler to toggle a variable instead of calling
> pthread_exit instantly, as the thread could be in critical section,
> causing a deadlock on the attempt of next entry into that critical
> section.
> 
> Introduce received_signal, received_sigint and handled_sigint variables
> to help with coordination of handling SIGINT and other signals.
> 
> Use the received_sigint variable in debugger_worker_loop to safely kill
> the thread, set handled_sigint to help with coordination outside the
> debugger loop.
> 
> Rename terminate_debugger to debugger_signal_handler to describe its
> new function better. Add SIGTERM to signals that are handled by
> debugger_signal_handler.
> 
> Don't kill debugger thread on non-SIGINT signals. Don't break on poll
> failure if signal was received.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>   lib/xe/xe_eudebug.c | 26 ++++++++++++++++++++++----
>   lib/xe/xe_eudebug.h |  4 ++++
>   2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index deaea25cd..647da7b32 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1072,9 +1072,14 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
>   	return ret;
>   }
>   
> -static void terminate_debugger(int sig)
> +static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
>   {
> -	pthread_exit(NULL);
> +	struct xe_eudebug_debugger *d = info->si_ptr;
> +
> +	d->received_signal = true;

If I understand correctly, without the two commits that follow, this is 
a NULL pointer dereference. But even after combining those commits, 
won't this cause a NULL pointer dereference if a IGT user presses 'CTRL-C'?
> +
> +	if (sig == SIGINT)
> +		d->received_sigint = true;
>   }
>   
>   static void *debugger_worker_loop(void *data)
> @@ -1092,14 +1097,24 @@ static void *debugger_worker_loop(void *data)
>   	igt_assert(d->master_fd >= 0);
>   
>   	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
> -	sa.sa_handler = terminate_debugger;
> +	sa.sa_sigaction = debugger_signal_handler;
> +	sa.sa_flags |= SA_SIGINFO;
>   	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
>   
> +	igt_assert_eq(sigaction(SIGTERM, NULL, &sa), 0);
> +	sa.sa_sigaction = debugger_signal_handler;
> +	sa.sa_flags |= SA_SIGINFO;
> +	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
> +
>   	do {
>   		p.fd = d->fd;
>   		ret = poll(&p, 1, timeout_ms);
> +		if (d->received_sigint) {
> +			d->handled_sigint = true;
> +			pthread_exit(NULL);
> +		}
>   
> -		if (ret == -1) {
> +		if (!d->received_signal && ret == -1) {

I am not sure I understand what the SIGTERM handling is supposed to 
influence here? From patch 6/6 I gather that it is supposed to maximize 
the chance of hitting the read IOCTL but I don't see how.

Regards,
Christoph


>   			igt_info("poll failed with errno %d\n", errno);
>   			break;
>   		}
> @@ -1168,6 +1183,9 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
>   	d->fd = -1;
>   	d->master_fd = master_fd;
>   	d->ptr = data;
> +	d->received_signal = false;
> +	d->received_sigint = false;
> +	d->handled_sigint = false;
>   
>   	return d;
>   }
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 8f7f66220..46cd3463e 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -44,6 +44,10 @@ struct xe_eudebug_debugger {
>   	pthread_t worker_thread;
>   	enum xe_eudebug_debugger_worker_state worker_state;
>   
> +	bool received_signal;
> +	bool received_sigint;
> +	bool handled_sigint;
> +
>   	int p_client[2];
>   };
>   

