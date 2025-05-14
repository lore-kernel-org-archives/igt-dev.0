Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D20EC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 12:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5010E62D;
	Wed, 14 May 2025 12:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZezRUaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D7310E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747227302; x=1778763302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HyotiH//81tpgsy6NzbSdVTqlHGAwL9B4lQJcaz27kw=;
 b=YZezRUaTrUAhWCI151/QzJTiUGfsA7SJFdL/JGWu/A70k8GQPBED/MQK
 uyfKHeooKyVOkciuFn/EZztWpcm1KGXUcJ5+mR7ZzCMqjBSidYc9LmCuL
 1ZVGl6bX4GD48HECq9OX1tEU2Ole4SSVErOjK58k5NDyvgYD43BV7P1Q6
 cnarlqdzGo3qMNIhv4lYQJruMZl4y0jNUuSjuIKhLi4zjCe4xYr4DANYu
 f5c1SXEiN7qBfJeSn8VDqQLAyRQmDXB3PbhaxGCj5sL20m+94nSvvcFC6
 aybeqgYf2F0yCWN3gxnIWUDHlIfP2uAA1Id+lSPeEtJgEkW3mJaAJm9hG A==;
X-CSE-ConnectionGUID: o+1eWdWkT52AyOL0xJKACg==
X-CSE-MsgGUID: TKvFpoOqTyqEVCPKMdAJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49237127"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="49237127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:54:51 -0700
X-CSE-ConnectionGUID: LZduTmToTxiRUkg6fufulQ==
X-CSE-MsgGUID: 6R3KXcfHRt+hpzMYn3FJew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137908495"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:54:50 -0700
Date: Wed, 14 May 2025 14:54:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 11/15] tools/intel_gpu_top: Replace index with strchr
Message-ID: <qh4gatccu4ayuejiqpq5nogqeaziqmrverqoaz2d5fuhqammv6@zeymtba7s4y4>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-12-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-12-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:44PM +0000, Jeevaka Prabu Badrappan wrote:
> As index is deprecated, replace index with strchr.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tools/intel_gpu_top.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 68d27089b..54e71e559 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -290,7 +290,7 @@ get_pmu_config(int dirfd, const char *name, const char *counter)
>  	if (ret <= 0)
>  		return -1;
>  
> -	p = index(buf, '0');
> +	p = strchr(buf, '0');

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	if (!p)
>  		return -1;
>  
> -- 
> 2.34.1
> 
