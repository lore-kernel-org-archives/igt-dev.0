Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553E4D609A0
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 06:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD98010E214;
	Wed, 27 Nov 2024 06:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1ZWscSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E6910E214
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 06:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732687795; x=1764223795;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kPNtf6VdPDKCyt8pbZ99hFnQjquWew8Bp4695np/q8U=;
 b=K1ZWscSjfdLu2F41pa1QW34FkbQgH+K2/IItvEKM5/CRXTcLKk6S928d
 5QFK6NcFIEsuX47Y/kfpby2jHVDu8mU1dwk/N+x449h1Of8253Trwz9Oi
 Rak/i/gMxzpj7O8K8B4JjIxP7817z63TugcEX766VD6E4Jviu41frV0ql
 2DMRNszAKJfXveOENz9XF3fH6+gyEhr0+4jBzfk334ndhJwKTSoBlwdMk
 tDjK3+heWkCN0XDvECqjF5tD0pwlHuHvCclTKUd/AnDNpig1j40OrAzEX
 itolKXc7qgv0KJ4OL8MFrs4y3086erqtoxntGSTc+0ACK0Px19QI76R/x w==;
X-CSE-ConnectionGUID: /L9ZUGBLQkeLMBvmrcYEoQ==
X-CSE-MsgGUID: VuVBbJOxT8Gp1R+zdqBMUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43536548"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="43536548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 22:09:54 -0800
X-CSE-ConnectionGUID: VcYw9Y+4Qxq5B3HcTw8Fhg==
X-CSE-MsgGUID: CqqZfem1Q6G4pVgKo7HPJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="96911998"
Received: from askrebko-mobl1.ger.corp.intel.com (HELO [10.213.198.140])
 ([10.213.198.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 22:09:54 -0800
Message-ID: <18615b3c-b8a9-4ac2-8ecf-5b03a84b1ac5@linux.intel.com>
Date: Wed, 27 Nov 2024 07:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] runner/executor: Check for error at writing
 dmesg dump
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
References: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
 <20241120183208.146299-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241120183208.146299-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi,

I think that the handling of expected errors such as handling of
EINTR, and partial reads can be improved. I would argue to either
ignore the errors or handle them properly. Anything in between is
likely just creating problem for future selves. Here is my
proposal:

do
	w = write(outfd, buf, r);
while (w == -1 && errno == EINTR);
if (w < r) {
	if (w > 0) {
		ssize_t total_written = w;

		while (total_written < r) {
			ssize_t w_partial = write(outfd, buf + total_written, r - total_written);
			if (w_partial > 0)
				total_written += w_partial;
			else if (w_partial == -1 && errno == EINTR)
				continue; /* Retry */
			else {
				long err = (w_partial == -1) ? -errno : -1;
				errf("Write error while processing dmesg, errno=%d (%ld bytes written out of %ld)\n", errno, total_written, r);
				if (comparefd >= 0)
					close(comparefd);
				return err;
			}
		}
	} else {
		/* Write comnpletely failed */
		errf("Write error while processing dmesg, errno=%d\n", errno);
		if (comparefd >= 0)
			close(comparefd);
		return errno;
	}
}
written += r;

Notice that the expected errors are expected to fail more than
once, and that I tried to organize the code in way that feels
"to me" easier to follow by nesting if (w < r) and if (w > 0).
Also notice that it can block due to EINTR for ever.

While I compile tested this code, I wrote it to ask you what do
we really want to do?
 0 - Forget about write errors until we face issues in real world?
 1 - Get arbitrary about which write errors we want to deal with?
 2 - Make an effort to make a bullet proof error checking for write?

As I mentioned earlier, I am slightly more inclined to do nothing,
but if that is off limits, I see no other path than 2.

Thanks,

Peter

On 20.11.2024 19:32, Kamil Konieczny wrote:
> In processing kernel dmesg there are checks for error at reading
> so add also one for writing.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  runner/executor.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..e4d1fc323 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -600,7 +600,7 @@ static long dump_dmesg(int kmsgfd, int outfd)
>  	bool underflow_once = false;
>  	char cont;
>  	char buf[2048];
> -	ssize_t r;
> +	ssize_t r, w;
>  	long written = 0;
>  
>  	if (kmsgfd < 0)
> @@ -654,9 +654,32 @@ static long dump_dmesg(int kmsgfd, int outfd)
>  			return written;
>  		}
>  
> -		write(outfd, buf, r);
> -		written += r;
> +		w = write(outfd, buf, r);
> +		if (w < r) {
> +			if (w == -1 && errno == EINTR)
> +				w = write(outfd, buf, r);
> +
> +			if (w < r && w >= 0)
> +				w += write(outfd, buf + w, r - w);
> +
> +			if (w < r) {
> +				long err = -errno;
> +
> +				if (err) {
> +					errf("Write error while processing dmesg, errno=%d %ld < %ld\n", errno, w, r);
> +				} else {
> +					errf("Cannot write dmesg chunk: %ld < %ld\n", w, r);
> +					err = -1;
> +				}
>  
> +				if (comparefd >= 0)
> +					close(comparefd);
> +
> +				return err;
> +			}
> +		}
> +
> +		written += r;
>  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
>  					    &flags, &seq, &usec, &cont) == 4) {
>  			/*

