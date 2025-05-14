Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59D7C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6BD10E26F;
	Wed, 14 May 2025 14:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4tuF5m8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE5510E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747232731; x=1778768731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tyHJ+5bQ0BIKY15GXxJhNeRXTL6mKIUoMEvHoByAXUo=;
 b=b4tuF5m8mlf565F1ZIOBQhmhfTOVCkGcgoXmSiGQsxwk9jmipGNAZFFo
 gUtJspFuFTV6dvTG54YsqAjvDZL1DiWS8p6254uHpk4fDGGD0Tgd2wZEr
 tfBQyHShjTJioTWXYhRJB+Xt84Z3c1NIF8oJRWs/GmJog4RxWm6OWHkK2
 sufR+GQG445PZ4rHnULh5yFNEB/WOoQ0UkR0xDQSne5Qdka0iVS4lTBTP
 xoAp97QiYtXLCNF7S2pamqM065d+oUjU/6ngWQwg373O6To4PPtHlipO/
 UTacNJaEt8CneRc22AALZcfylluwUScpPR1srIfrxPm7pNfrOykssVroE g==;
X-CSE-ConnectionGUID: 1YGC7PcxR9WADqeTeRS9FA==
X-CSE-MsgGUID: mn8hvrm1SeOsn4VP5j835g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59764924"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="59764924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:25:30 -0700
X-CSE-ConnectionGUID: Bk03ioR/QKq0Kdn/fsB8PQ==
X-CSE-MsgGUID: Fag7eLBwTTa0a7V5vCeVyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138582995"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:25:28 -0700
Date: Wed, 14 May 2025 16:25:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 13/15] lib/igt_device_scan: Replace return value of
 devs_compate to int
Message-ID: <20250514142526.dyvydrqi66y4la5v@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-14-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507160148.53857-14-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-07 at 16:01:46 +0000, Jeevaka Prabu Badrappan wrote:
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3f26a1737..7e9614429 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -949,7 +949,7 @@ static struct igt_device *duplicate_device(struct igt_device *dev) {
>  	return dup;
>  }
>  
> -static gint devs_compare(const void *a, const void *b)
> +static int devs_compare(const void *a, const void *b)

Could you squash this into patch 15/15? This way it will not be
needed as in there you remove glib in favour of igt_map.

Regards,
Kamil

>  {
>  	struct igt_device *dev1, *dev2;
>  	int ret;
> -- 
> 2.34.1
> 
