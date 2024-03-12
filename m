Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8C7C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 11:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAFD10F3A9;
	Tue, 12 Mar 2024 11:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gy7qsfK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F2C10F3AD
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710242164; x=1741778164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9XjIdH5kMMW8TIdz8nKkKN+RgTn+Bdu8JExfR4f37oI=;
 b=Gy7qsfK9bKa2rV1796kRyer0zUnFLIEWQVMMxk/nOwjAk72nqySHZ/mq
 7z/j2ZV2jwvRV7Ppplv+mqLt/LkH27uRsMbhxlJ9ocBrbggkRlchK5YaO
 3CR4iF/1dRBWnAl9wKqGzd0zrRdtRr1l5JskQ4g0cL5D/IMf8aAMF5q6i
 DyGVMs+AJg0fMSwVxZW2sSPu8xQgoxeqBsOd9Lv6CdyQCrc/NDQaAiVPI
 ETCUCxVAXnvlm3WUj7J9dLRqNELxYmqG7C7EgD4I585FZz+AELMDfGNXX
 U8nuDCnSHsHystGiRIkDqhCoNCV4Jb3KvqrjiRM5vM3u2sQ3q4edIz1TM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4815969"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4815969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 04:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11420308"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.6.110])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 04:14:13 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Cc: kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are
 preset
Date: Tue, 12 Mar 2024 12:14:10 +0100
Message-ID: <1931795.gKo4GoxMFQ@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <87d94f4c-a484-422a-b443-ade32ca50e8d@intel.com>
References: <20240312100757.14685-1-nirmoy.das@intel.com>
 <85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com>
 <87d94f4c-a484-422a-b443-ade32ca50e8d@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Tuesday, 12 March 2024 11:54:32 CET Nirmoy Das wrote:
> 
> On 3/12/2024 11:43 AM, Janusz Krzysztofik wrote:
> > Hi Nirmoy,
> >
> > On Tuesday, 12 March 2024 11:07:57 CET Nirmoy Das wrote:
> >> Skip the test if no drm devices are preset.
> > Did you mean present? (also in the subject line)
> Right, another typo
> >
> >> v2: fix a typo.
> >>
> >> Closes:https://gitlab.freedesktop.org/drm/intel/-/issues/10087
> >> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> >> ---
> >>   tests/device_reset.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tests/device_reset.c b/tests/device_reset.c
> >> index 817cbc285..73531d696 100644
> >> --- a/tests/device_reset.c
> >> +++ b/tests/device_reset.c
> >> @@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
> >>   	 * a device file descriptor open for exit handler use.
> >>   	 */
> >>   	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
> >> -	igt_assert_fd(dev->fds.dev);
> >> +	igt_require(dev->fds.dev != -1);
> > What if __drm_open_driver() returns (unlikely) a negative value other than 
-1?
> 
> __drm_open_driverdoc says: "An open DRM fd or -1 on error" so that won't 
happen.

That won't happen as long as there are no bugs in __drm_open_driver().

If you don't want to skip on (fd < -1) then let's fail, but we should never 
succeed in that unlikely case, I believe.

Thanks,
Janusz

> 
> >   
> > In IGT we used to verify validity of a file descriptor by checking if its
> > value is not negative, i.e., >= 0 (see e.g. lib/igt_core:igt_assert_fd(),
> > lib/drmtest.c:drm_open_driver()).  Please follow the same convention.
> 
> I can do s/igt_assert_fd/igt_require_fd
> 
> Thanks,
> 
> Nirmoy
> 
> > Thanks,
> > Janusz
> >
> >>   	if (is_i915_device(dev->fds.dev))
> >>   		igt_require_gem(dev->fds.dev);
> >>   
> >>
> >
> >
> >




