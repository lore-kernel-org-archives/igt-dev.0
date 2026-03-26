Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CB106F311
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 09:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDBE10EA78;
	Thu, 26 Mar 2026 09:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxXng3yW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B8310EA77
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774517334; x=1806053334;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=hRLK+BZuruwnHRf9DKpWrbG2PlZTYZ/nMUxTw66IFTw=;
 b=DxXng3yWgsmhjnRdQpsHOvFVeb6PaztiNGe+21EKP4NZcKKG8se1/mrV
 5NZEoDWPRs5Xvd/VuhK9vthaOJ4jvQ4ikx4EPQ+MwMNoELRYYVF3sG+uV
 ht1I65w+eFJdQJyrTyOO0ae/yqT3UL3eOvpXnsSodjRlge9NtElOl1Rha
 zvhOpk/jgs8po62IPDs0DxPttH1GaA7hQlbdAAMjqKk+VLyqV0eJk/qzn
 DAfR9MSxmIZzURVrJ9FaWrHn7BenXx+M7TEK8FuGANQx3/24M05lxxYtD
 mglsjjf1Ss4HAX5p0AfLujnwD2e4C4IX+rW6asKU59DVP5grTK5z/fjb8 w==;
X-CSE-ConnectionGUID: 3WPAcrW5TGWg2cwnUnkIyg==
X-CSE-MsgGUID: OegU0oWdTYyfgKjc5jotlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86261192"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="86261192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:28:54 -0700
X-CSE-ConnectionGUID: k/OF+9C6RZu5NmHYPC7rlQ==
X-CSE-MsgGUID: krDFeQ61TYuEe3aemrylNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="229887861"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:28:52 -0700
Date: Thu, 26 Mar 2026 10:28:50 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v8 6/6] tests/kms_flip: test suspend at most twice
 on SNB && BMG
In-Reply-To: <a9ecfa3b-5ae3-40c1-9a5f-04c598386fdc@intel.com>
Message-ID: <17afd2fc-7994-2e40-02da-f7725c58ccc5@intel.com>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-7-michal.grzelak@intel.com>
 <a9ecfa3b-5ae3-40c1-9a5f-04c598386fdc@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-6274226-1774481949=:320572"
Content-ID: <ff7562e9-2e0d-addf-2bce-e715b4e9b34c@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-6274226-1774481949=:320572
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <65437ef2-131f-cebe-8052-ba2495b6dc94@intel.com>

On Wed, 25 Mar 2026, Thasleem, Mohammed wrote:
> On 09-03-2026 02:55 pm, Micha³ Grzelak wrote:
> 
> gettime_us() on SNB and BMG does not return proper time after starting
> suspend tests. This results in too many suspends issued before we hit
> the duration_ms. Break the loop on second execution.
> 
> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
> ---
>  tests/kms_flip.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index f17d027cc..3c5428ff0 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1322,6 +1322,12 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
>  {
>  	unsigned long start, end;
>  	int count = 0;
> +	int devid;
> +	bool wa;
> +
> +	devid = intel_get_drm_devid(drm_fd);
> +
> +	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
> 
> Why only two specific platforms?

That I would also like to know. :)
As it is described in the first sentence of the commit message, these
two platforms have been reported by CI to encounter such issue. If it is
not clear, I can update the commit message.

> I think, platform specific wa not needed here, instead we can have generic execution for all,
> which can work on all platforms. plz check.

Since we are observing the issue only on those two platforms, I don't
see how to work around it without specifying those two platforms,
without changing the already present functionality.

>
>
>  	start = gettime_us();
> 
> @@ -1342,6 +1348,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
>  		if (count && (gettime_us() - start) / 1000 >= duration_ms)
>  			break;
> 
> +		if (count && wa && o->flags & TEST_SUSPEND)
> 
> if (count && wa && o->flags & TEST_SUSPEND) --> if (count && o->flags & TEST_SUSPEND)
> 
> +			break;
> +

I am unsure of this approach. This will break the loop on second run on
every suspend test, on every platform. While commit c75dcbdac51d
("tests/kms_flip: various improvements") says explicitly to do at least
two rounds of tests, so it would change functionality on every platform.
I can refactor the patch, but I would retain the WA. Can you provide
some rationale for changing the functionality on non-affected platforms?

BR,
Micha³

>  		count++;
>  	}
> 
> 
> 
>
--8323329-6274226-1774481949=:320572--
