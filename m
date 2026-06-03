Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C65CCD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 09:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59A310FB02;
	Wed,  3 Jun 2026 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fx51vH+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D3910FB02
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780480305; x=1812016305;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3fL4bgmQQNkWFNSTs04aHC5Dl2XKJo7juiCerQ+Quco=;
 b=fx51vH+ift/0iG76Bp7FRcUF6yLXwhByRdlwNtzhFBAiCIdaQyHCN3Pa
 mQKix4IA+i9Yn3jmqR+vqtVSbFsNaB3k2eU/Mjq5wC2sMRCmH1pfZxByW
 ufn7+bCmoLZdSWsX2OBp3mp5zr1kWcfR1QReWqgAxNlbIsea76ps3qhXx
 EUPWnUKATlBd/Qj/Z1x70c9fC6yW6VBcJKebv057DCRqjO7yVLoPDXcJv
 Yt7cBSfWr+479Tij5gZOHVSXCW6sIlYQvfOVBEf3WN5L0kJON4dEEdynr
 fy7YZxS3CBisa6fn5LB9wyu+CP8pFWz14J49Erp4nWEXqTdqpczaRx08J w==;
X-CSE-ConnectionGUID: YnHJ1nCBRXKKRD4DcbD4vA==
X-CSE-MsgGUID: 7oUcTLx/TeqyOnzRJbqLVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81277799"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81277799"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:51:44 -0700
X-CSE-ConnectionGUID: 4eaD3SL5SIeH7x0enfkKyA==
X-CSE-MsgGUID: OOBwBoOGQva5jxVeUX4kuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="267820746"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 02:51:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Cc: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
In-Reply-To: <DM4PR11MB631277E7C22661CF39FF173890132@DM4PR11MB6312.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260603073606.2168574-1-jeevan.b@intel.com>
 <1c24b284f0559a5ae985ddedc833c0db086f59b4@intel.com>
 <DM4PR11MB631277E7C22661CF39FF173890132@DM4PR11MB6312.namprd11.prod.outlook.com>
Date: Wed, 03 Jun 2026 12:51:40 +0300
Message-ID: <145752419eed3d785042b44e844193f621c152ac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 03 Jun 2026, "B, Jeevan" <jeevan.b@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Wednesday, June 3, 2026 2:44 PM
>> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
>> Subject: Re: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
>> 
>> On Wed, 03 Jun 2026, Jeevan B <jeevan.b@intel.com> wrote:
>> > Use '>=' instead of '>' so modes equal to max hdisplay or dotclock are
>> > considered for bigjoiner.
>> 
>> I can see that from the code changes.
>> 
>> Why?
> Boundary modes like 6144 and 5140 are skipped with >, even though they require a joiner. Switching to >= ensures they are correctly handled and fixes the test failures.

The point is, all of that should be in the commit message.

And then we'd immediately see the discrepancy in that
get_max_pipe_hdisplay() is supposed to return "The maximum hdisplay
supported per pipe" i.e. joiner shouldn't be required.

I think ditto for max dotclock.

Whatever the problem is, all of these need to be consistent.

Side note, igt_bigjoiner_possible() documentation comment mentions 5K,
which is also outdated.


BR,
Jani.

>
> Thanks 
> Jeevan B 
>> 
>> >
>> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> > ---
>> >  lib/igt_kms.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 0f1ce03a9..e5ffaeac1
>> > 100644
>> > --- a/lib/igt_kms.c
>> > +++ b/lib/igt_kms.c
>> > @@ -6946,8 +6946,8 @@ static int get_max_pipe_hdisplay(int drm_fd)
>> >   */
>> >  bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int
>> > max_dotclock)  {
>> > -	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
>> > -		mode->clock > max_dotclock);
>> > +	return (mode->hdisplay >= get_max_pipe_hdisplay(drm_fd) ||
>> > +		mode->clock >= max_dotclock);
>> >  }
>> >
>> >  /**
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
