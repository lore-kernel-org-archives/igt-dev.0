Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C05D39417
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 11:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2B810F0CE;
	Thu,  2 Apr 2026 11:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2lpHlf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38E410F0CE
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775129563; x=1806665563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/QXI77Jr0cNJdWnAxW/AAZv+a4EKmn+HuSXdGlAz/vM=;
 b=n2lpHlf7DuDOU/lFUceO01bwZj4uwhrXBQ6DBQcxffHnkQVQYZtb64EH
 nMaJzEBfpCKoQMm3Op4Rln0FbmzQb36zD3NO3j3egihvbmYDdPcmORRIC
 OcIIy4lJQvXMmuHM4j7HWco8tMm1r8e+9+qoSmMNxvyMutk9ubK/1dxYI
 l7WTx7KDeirpj4m/2iQi3WjK14rPX0kMvKSHeaXtyxtJ9200xP3ce9UU7
 u/b/riVfK6n0wINilb4s4gMK/1r140w9Fcr83hnGHcxESssiHXc2l36wn
 nCcih4nLaGRQPbip+dVelpJVYYXfKeqKHneYtE8OO8iB1n0wJpaNFFJIR A==;
X-CSE-ConnectionGUID: obgotXMwSYaUZpjiPQKWGQ==
X-CSE-MsgGUID: xrUrZjL0REuswAbXO3KziQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87644354"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="87644354"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:32:43 -0700
X-CSE-ConnectionGUID: mh6by4tkRseAH17FLBTC2w==
X-CSE-MsgGUID: pHSVsbSaRzSRluDtrAbYpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="227220605"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.1])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:32:41 -0700
Date: Thu, 2 Apr 2026 13:32:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Piotr Rudnicki <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/xe/eudebug: pass debugger log into client
 wait-done path
Message-ID: <ellhqczfe6dz4vesmrxmzvxjbujmk4z6npoa3per2q5skzxefk@v22uydfjnrjh>
References: <20260327121042.1133617-1-piotr.rudnicki@intel.com>
 <20260327121042.1133617-3-piotr.rudnicki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327121042.1133617-3-piotr.rudnicki@intel.com>
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

On Fri, Mar 27, 2026 at 01:10:42PM +0100, Piotr Rudnicki wrote:
> Refactor xe_eudebug_client_wait_done() to allow passing the debugger
> event log, enabling dead-peer context logging (added in previous commit)
> to report debugger state when client termination fails. Use the internal
> variant in xe_eudebug_session_run() where debugger context is available.
> 
> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index b80d9bebd..bbd1c99bf 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1764,6 +1764,16 @@ void xe_eudebug_client_start(struct xe_eudebug_client *c)
>  	token_signal(c->p_in, CLIENT_RUN, c->pid);
>  }
>  
> +static void __xe_eudebug_client_wait_done(struct xe_eudebug_client *c,
> +					  struct xe_eudebug_event_log *debugger_log)
> +{
> +	if (!c->done) {
> +		c->seqno = wait_from_client(c, debugger_log, CLIENT_FINI);
> +		event_log_read_from_fd(c->log, c->p_out[0]);
> +		c->done = 1;
> +	}
> +}
> +
>  /**
>   * xe_eudebug_client_wait_done:
>   * @c: pointer to xe_eudebug_client structure
> @@ -1773,11 +1783,7 @@ void xe_eudebug_client_start(struct xe_eudebug_client *c)
>   */
>  void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
>  {
> -	if (!c->done) {
> -		c->seqno = wait_from_client(c, NULL, CLIENT_FINI);
> -		event_log_read_from_fd(c->log, c->p_out[0]);
> -		c->done = 1;
> -	}
> +	__xe_eudebug_client_wait_done(c, NULL);
>  }
>  
>  /**
> @@ -1867,7 +1873,7 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
>  	xe_eudebug_debugger_start_worker(debugger);
>  
>  	xe_eudebug_client_start(client);
> -	xe_eudebug_client_wait_done(client);
> +	__xe_eudebug_client_wait_done(client, debugger->log);
>  
>  	xe_eudebug_debugger_stop_worker(debugger);

Shouldn't this happen after stopping worker and sorting the log?

--
Zbigniew


>  
> -- 
> 2.43.0
> 
