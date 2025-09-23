Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80ECCAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 14:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AD310E63D;
	Tue, 23 Sep 2025 14:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmIr6R8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8C210E63D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758638639; x=1790174639;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/ZeXLtTtx7Z5+XYv6Z/I+YCnvL+F6wZLEmb3emCUL4Y=;
 b=BmIr6R8gxqAMESfq/uZdojVMKF7yBzT7Q1iC0FJByT53VelMEJnQto20
 HhG80vSWVYKHTZBH7yse/9iqrZ7wPgHy4aXP8Av7nQxuP8VINWCUVKNkI
 3lZOAbGuLVxylpDYeK3cH3vCQ+Fn2hlNPMRn0k/OW/9EcJ6cutVpSFE0/
 hAbaiu+LZZH42l0voaxxZ99jKgDXOg4ZA4BRl2i/xE1yX0X+CTPFCMjzh
 Ge2XCZu4zqxNZZPxBPXk+kC64HC9ks2Jnwi5BC1IWI5ihj1xOPjxLEpLX
 y7lqegFxE/nrBxno6IrZbnhNa1gXt1lplfIppyI9GTIFEwviX/0lQym5e A==;
X-CSE-ConnectionGUID: /yXULL+nTQazZEFFF930Gw==
X-CSE-MsgGUID: nvSIPsObQnuIlX48mQa9bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64746501"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="64746501"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 07:43:59 -0700
X-CSE-ConnectionGUID: 4GqzZ/yeQJmahG3GTlOcKg==
X-CSE-MsgGUID: 8wyJjaWQQvS7DEgP1APxBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="176723211"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 07:43:58 -0700
Message-ID: <4ce63ec3-1cb9-4b62-b039-4449ec664528@intel.com>
Date: Tue, 23 Sep 2025 16:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 1/6] lib/xe_eudebug: Fix safe_pipe_read
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-2-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250923131002.24708-2-dominik.karol.piatkowski@intel.com>
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

On 23.09.2025 15:09, Dominik Karol Piątkowski wrote:
> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
> misleading, as the pipe could be already broken. Do an early return with
> -EPIPE if the poll fails.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   lib/xe/xe_eudebug.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..8e5664496 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>   		if (!ret) {
>   			catch_child_failure();
>   			t += interval_ms;
> +		} else if (ret == -1) {
> +			return -EPIPE;

The problem here is that according to poll(2) if poll fails it is not a 
problem with the fd/pipe being closed/no longer valid. Also when poll 
fails, errno will be set so we may as well return -errno.

For checking what actually happened when poll returns 1, we should check 
the fd.revents field. F.e.:

```
if (ret == 1) {
	if (r.revents == POLLIN)
		return read(pipe[0], buf, nbytes);

	if (r.revents & POLLERR) {
		igt_debug("pipe poll failed: poll error\n");
		return -EIO;
	}
	
	if (r.revents & POLLHUP) {
		igt_debug("pipe poll failed: pipe closed\n");
		return -EPIPE;
	}
}
```

Regards,
Christoph

>   		}
>   	} while (!ret && t < timeout_ms);
>   

