Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E911FCD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E03112DE2;
	Wed,  3 Apr 2024 17:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lj5nHO2g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B463112DE2
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712165312; x=1743701312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nmSokGkZKaqzXHR3npAuybxLvVsfW1TOOUszJIXKP9M=;
 b=lj5nHO2gy6onsk6I85W1gYTNYSEaUjBiwXUq43K3WtPExW33KsWB+Oie
 HKu6JnnCriKnYO0xBjxDO1iJobbGXDoJ4M7AMqGE5RLZSf77FmUBZGSeQ
 7hW/tJVSZj3hdNenRqrmSGVUYbV/tsVw/mKqQdztpGWsX9eteqS4sVE4J
 wSC3/sftAaBvqrFHt4woVPSBGDMoCja7RKBKhAV9Quwfjs4vdeI1c+4EB
 QsmmrNwcrhVVPq5LyriQmeGZ4bmG5i6+hR3cxJfYeNVJvGQtX17U1ndGt
 +xxeVBUAnpdutCwveA0VtbiapIJhmzpDFApdQGaF83efa8de1DpxffhgK Q==;
X-CSE-ConnectionGUID: ptVjDshHSbmaIoEzv/jPcQ==
X-CSE-MsgGUID: 6xx80L6PTYGwUmlHQrIgkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7317409"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7317409"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:28:32 -0700
X-CSE-ConnectionGUID: yoMR0E9vQ4aG8Hav4oNK1Q==
X-CSE-MsgGUID: 0naJFVF0QbmROalPQp3KhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18595872"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:28:30 -0700
Date: Wed, 3 Apr 2024 19:28:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 4/8] gputop: Free clients on exit
Message-ID: <20240403172827.x22cqy5mfrkknj4p@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-5-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-04-02 at 15:17:12 -0700, Lucas De Marchi wrote:
> So it's easily checked with valgrind if we there's something leaking.

s/we there's something/memory is/

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/gputop.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 71e28f43e..b13044b50 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -293,5 +293,7 @@ int main(int argc, char **argv)
>  		usleep(period_us);
>  	}
>  
> +	igt_drm_clients_free(clients);
> +
>  	return 0;
>  }
> -- 
> 2.43.0
> 
