Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F77ACCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 12:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0974F10E5CB;
	Tue,  4 Nov 2025 12:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu0Y/QFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFD410E5CB
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 12:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762258613; x=1793794613;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a8tKAq7JKJBtvr4jyowjCBao1vudu+25uHlHJl/T9Zc=;
 b=cu0Y/QFPfb1f1b91mg9SvJTZNsQ10A9ySPcPLhEFXJiy/mBosCOuQSl4
 Cz2QQV8pmGtBh/kAfuy3dSIkabi4QfDPEPl3Qv/EpoOMCu8hkVuep4NkT
 RHqi/ZqiefEXXvXlLnRfw9WriNJmM+t7JsG4xEwunZkTI6o13Evr19a4m
 pX34nyiEU0+LJxkutT+uNaI6u3W9tS/ZYQO04sc3d4Rh1bo4Y9cQbgwy3
 vL35TMciMIzp7mlsiGhL6varAcQA1Qismsjkd3h7faPO1dP/8UCFihyTF
 uah3YGfQwrojiSxKnmXftYeWwgzdmtErc2umuIrI51r6NhMT1WClUX0de Q==;
X-CSE-ConnectionGUID: c+tn5aabQwWw6YTbKOGrWw==
X-CSE-MsgGUID: m+a3iN0sQ22BVAXiKaNhFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68209780"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68209780"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:16:52 -0800
X-CSE-ConnectionGUID: BdWBjxCoSh2LTN7u9piMkA==
X-CSE-MsgGUID: mi+107RnTe+OoOIcEtXoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187093596"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.197])
 ([172.28.180.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:16:51 -0800
Message-ID: <a88d2d7f-3543-4090-a836-966f86443f7d@intel.com>
Date: Tue, 4 Nov 2025 13:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/7] lib/xe/xe_eudebug: Improve pipe error messages
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com, maciej.patelczyk@intel.com,
 jan.maslak@intel.com, zbigniew.kempczynski@intel.com
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
 <20251014093848.2394531-4-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251014093848.2394531-4-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On 14.10.2025 11:38, Mika Kuoppala wrote:
> Client, debugger and session pipe communication
> can be hard to debug. Make small improvement to debug output
> to print when the actual otherside hung up early
> to distinguish from just timeouts.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   lib/xe/xe_eudebug.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index f43903f5b0..0989330b39 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -261,7 +261,7 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>   {
>   	int ret;
>   	int t = 0;
> -	struct pollfd fd = {
> +	struct pollfd r = {
>   		.fd = pipe[0],
>   		.events = POLLIN,
>   		.revents = 0
> @@ -273,9 +273,9 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>   	do {
>   		const int interval_ms = 1000;
>   
> -		ret = poll(&fd, 1, interval_ms);
> -
> +		ret = poll(&r, 1, interval_ms);
>   		if (!ret) {
> +			igt_debug("poll: timeout\n");
>   			catch_child_failure();
>   			t += interval_ms;
>   		} else if (ret == -1) {
> @@ -285,10 +285,20 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>   			}
>   			return -errno;
>   		}
> -	} while (!ret && t < timeout_ms);
>   
> -	if (ret > 0)
> -		return read(pipe[0], buf, nbytes);
> +		if (ret == 1) {
> +			if (r.revents == POLLIN)
> +				return read(pipe[0], buf, nbytes);
> +
> +			if (r.revents & ~POLLIN) {
> +				igt_debug("pipe read failed: %s%s (0x%x)\n",
> +					  r.revents & POLLHUP ? "pipe closed" : "",
> +					  r.revents & POLLERR ? "poll error" : "",
> +					  r.revents);
> +				return -EIO;
> +			}
> +		}
> +	} while (!ret && t < timeout_ms);
>   
>   	return -ETIMEDOUT;
>   }

