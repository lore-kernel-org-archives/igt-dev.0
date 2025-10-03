Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6216BCAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 08:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1960C10E10F;
	Fri,  3 Oct 2025 08:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gX4tka2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA7A10E087
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759479341; x=1791015341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AeLeUNpakhR9HFkaNYoRQHW2UnzkBWwEBOOpJ92ZAIo=;
 b=gX4tka2HAWi8A5/i/pXzSqhSgfMS4yR0OCgsigWsMZ46oLEdi10Pi6y9
 dhnT3gfrtb4WohaloOCdJZySmrcXvTwHrTSorC4VXbCjRjv8HhYVTTXa7
 cPwpT8xea2Ii84zJYrs6HAdEy1if1bI0ZIKTp2FrqcnZjswAzmHZKFNkZ
 Rgpe7qdCO1NFciMLoVCQWTRsHH79ZWhYxvum516wQ+k+B2uzPXWiM5M34
 tjGe2XYNOf7DC8y1681TyE0LHftnQF+nkNcttp2N3nfFakWLxrG3Nhp6S
 R26+n8Qpz6mb418zLvHcA8tEUIQO1SuM2JnwK8l7OxTTCLi+a050z+zHH A==;
X-CSE-ConnectionGUID: /fR6FyyzSZSeJy2aRQEVeg==
X-CSE-MsgGUID: xtim66sNQ0SHNaBET40DuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61808304"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61808304"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 01:15:29 -0700
X-CSE-ConnectionGUID: byObOvWxSBeddvTaHGboPQ==
X-CSE-MsgGUID: IsxW0IZuShysyxTz6w7PWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178363484"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.92])
 ([10.245.246.92])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 01:15:27 -0700
Message-ID: <56dfe7d0-d46c-4a6e-9903-56422bddff20@intel.com>
Date: Fri, 3 Oct 2025 10:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
 <20251002104443.7021-2-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251002104443.7021-2-dominik.karol.piatkowski@intel.com>
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

On 2.10.2025 12:44, Dominik Karol Piątkowski wrote:
> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
> misleading, as the underlying error may be different. Do an early return
> with -errno if the poll fails, unless errno is set to EINTR - repeat the
> poll in this case.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   lib/xe/xe_eudebug.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..3587f4cbe 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -271,6 +271,12 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>   		if (!ret) {
>   			catch_child_failure();
>   			t += interval_ms;
> +		} else if (ret == -1) {
> +			if (errno == EINTR) {
> +				ret = 0;
> +				continue;
> +			}
> +			return -errno;
>   		}
>   	} while (!ret && t < timeout_ms);
>   

