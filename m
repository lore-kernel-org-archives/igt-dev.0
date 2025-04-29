Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB7C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 11:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3A010E41B;
	Tue, 29 Apr 2025 11:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cglDR9rY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAD810E41B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745924600; x=1777460600;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EZuBSl7VtGoV9ebYMk2dWXDyIGu7P5lLnDy3dYgkdKw=;
 b=cglDR9rYOcp24hBFVbPyUD2lCk01ilYOMDQKW8t0HIdHZJjQF/9qTQgx
 LmQe2+zneGykHkBJuCNfXDGmPr7MGwgeT6qe9WdFWbd99p4LR+JZS8xfC
 APzyZ5q6RpjiBR4AbnYTur5ddNCKZElQ+pVFp/zYNQF8a4JJoLDIE8TRB
 /h9QHnVLfW6kd29I647wiN+EQk2mKUSY9YpgzmxW2FWFPfkp0euiBeTaE
 h/8Lbq9OX+wbJv6djXnyH3qUvZueHS03kXbAoohtRtE+CwvcqqGYeC0ux
 VAqv7KjGqSBjtlrDklqTfb4gtECent5bpt8xGJbbCtXenWWROqeGNp28X g==;
X-CSE-ConnectionGUID: p+7sDsO2QoaJZj/8BWlLvg==
X-CSE-MsgGUID: N3+65wWFRRSS6oI1IAEh3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58902088"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58902088"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 04:03:16 -0700
X-CSE-ConnectionGUID: AXMXjAecQzmoobwE8m+V4Q==
X-CSE-MsgGUID: O2Sl7BM2TU+Q84FYoayi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="137832470"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.4])
 ([10.245.246.4])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 04:03:14 -0700
Message-ID: <ec84a0b7-bdd3-4c5e-a51b-ca11c23a5452@intel.com>
Date: Tue, 29 Apr 2025 13:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] /tests/intel/xe_eudebug_online: Remove
 create_metadata_trigger on debugger reattachment.
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
References: <20250423113138.88260-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250423113138.88260-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Jan,

On 23.04.2025 13:31, Jan Sokolowski wrote:
> On debugger detach-and-reattach, discovery worker will replay events
> that have occurred, which leads to a metadata event being sent and
> create_metadata_trigger being rerun, which would then lead us
> to try to open a removed metadata.

 From what I see, the client deletes metadata only after the debugger 
reattaches and performs discovery (there is an assumption that the 
discovery will take 2 seconds, maybe that is too short?). In other 
words, the metadata access should succeed after the metadata resource 
got rediscovered.

It may well be that I am overlooking something, in that case don't 
hesitate to prove me wrong.

Regards,
Christoph

> 
> On debugger reattach trigger, remove create metadata trigger
> from list of triggers.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 1f72e3e44..03b85e1ac 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -2079,10 +2079,13 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
>   	d->target_pid = c_pid;
>   
>   	/* Discovery worker will replay events that have occurred, which leads to
> -	 * a vm event being sent and vm_open_trigger being re-run, which would lead
> -	 * to us trying to open a removed vm. Thus, remove this trigger from list.
> +	 * some events being sent and vm_open_trigger being re-run, which would lead
> +	 * to us trying to open a removed vm. Similarly with metadata creation.
> +	 * Thus, remove these triggers from list.
>   	 */
>   	xe_eudebug_debugger_remove_trigger(d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
> +	xe_eudebug_debugger_remove_trigger(d, DRM_XE_EUDEBUG_EVENT_METADATA,
> +					   create_metadata_trigger);
>   
>   	/* Let the discovery worker discover resources */
>   	sleep(2);

