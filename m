Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C68DC28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 06:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9961C10E129;
	Tue, 11 Mar 2025 06:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lD63XR2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A03010E129
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741676183; x=1773212183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nR8LW8BR8eCv9Ot7oxHgpgKUUzFpDKSLmPscNOXQcH8=;
 b=lD63XR2WVHzFRMD0YIjjmcClDUdhiU1yQQbkVFWLSWvsbrjziws8L7G2
 sB6TAIGB/Y6yu5IPt/7MQeI1nCKr5tpvOkTuDYlJjaTHT0vxHE6HZ8K21
 NglNIl8FswNQf8zZIwcAN7qswx07WV49ka1ihpXCTC4IAFlp2LikaU+l9
 H3hsO1c3cX3KJgvAhHFkofdk+XTPJ1GP3t6kCkm5jBsa/SSEccLNhKFa5
 oh5VZdbjUqXtOwz6sd87EWtm6M8ErBXW/gjPAyYlBe2QxD+8QBRFpP6+q
 jWHIS+23kT9AnGmn+zH4z77V+hHm1ReI2VLb7IDoPSH7/1EY9ACX2QEvZ g==;
X-CSE-ConnectionGUID: /10tu0VDTZOGIJ4RdGmNpg==
X-CSE-MsgGUID: FzgvOo3lQEmuE6en3Uh/tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53688889"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="53688889"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:21 -0700
X-CSE-ConnectionGUID: reHo4rB2SZG/e5620e8HGw==
X-CSE-MsgGUID: jIHv6sfqS0uCM2cihqYEVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="124830335"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.156])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:56:19 -0700
Date: Tue, 11 Mar 2025 07:56:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org, Thomas.Hellstrom@linux.intel.com,
 matthew.brost@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [i-g-t v6 1/4] lib/xe: Fix a comment error
Message-ID: <20250311065614.ffbowmjxc6e7kxqv@zkempczy-mobl2>
References: <20250224174010.594192-1-oak.zeng@intel.com>
 <20250224174010.594192-2-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224174010.594192-2-oak.zeng@intel.com>
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

On Mon, Feb 24, 2025 at 12:40:07PM -0500, Oak Zeng wrote:
> The timeout value of __xe_wait_ufence returns the
> remaining time, not elapsed time. Fix it.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 6d8388918..028102aa2 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -496,7 +496,7 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
>   *
>   * Function compares @value with memory pointed by @addr until they are equal.
>   *
> - * Returns (in @timeout), the elapsed time in nanoseconds if user fence was
> + * Returns (in @timeout), the remaining time in nanoseconds if user fence was
>   * signalled. Returns 0 on success, -errno of ioctl on error.
>   */
>  int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> -- 
> 2.26.3
> 
