Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6C8C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 10:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEA010E092;
	Thu, 20 Jun 2024 10:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LimAsCsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F4D10E060
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718881117; x=1750417117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kZoFU6ILY/QssfB2O/jHW6CK+a5ed1YYH2/+ru10aW0=;
 b=LimAsCsQvAjAeUDJZnv6pmXIi6Hh6xCLB5V8qEEc5YT8CEgcpqhycC+D
 vTIkgqmFOhmqaWv45J/tLgIdvia8Yz0MT1otpEE5lZuRTe60kmkC+bxgH
 Br8FhBKDlUTCSlt2IDtZwkZa+gzMmIEpjs0sXjx5HhXj855KOqy1x8P3o
 QZHH9uroVjIP9hVjRBguu1ha+oea6FErDDsTB9WU4s7qnZfl9z0YCIK5m
 cOJGbQCyyY00EDTOh0nZz5hNm1W20btdgK4Z+gBrItcENqprgOm0bzxdy
 z5IfewWuKpfDI0cMVO4Vr8Dd4Y98/AINMLtxa3VfsbzPaVhPdmWSb8ipY A==;
X-CSE-ConnectionGUID: KCoBenLzQfeVcl+rdNBq0Q==
X-CSE-MsgGUID: ISmPVWYSTeaHsNoqDbLXwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26481731"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="26481731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:58:36 -0700
X-CSE-ConnectionGUID: dqIY3h11QXiCnBJI5LXw+A==
X-CSE-MsgGUID: Ttx/NRLoRzeajUsECFJznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="73411821"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:58:36 -0700
Date: Thu, 20 Jun 2024 12:58:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [i-g-t] tests/intel-ci: Block unsupported KMS tests for i915
Message-ID: <20240620105833.vckn26uundr5drub@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
 <87frt9fdwh.fsf@intel.com>
 <515d6191-11cd-4b65-a142-ecfa7b5bb739@intel.com>
 <878qz1fc48.fsf@intel.com>
 <3b728aba-8fed-4adb-839f-906f825b2274@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b728aba-8fed-4adb-839f-906f825b2274@intel.com>
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

Hi Modem,,
On 2024-06-20 at 10:35:34 +0530, Modem, Bhanuprakash wrote:
> 
> On 19-06-2024 04:11 pm, Jani Nikula wrote:
> > On Wed, 19 Jun 2024, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
> > > On 19-06-2024 03:33 pm, Jani Nikula wrote:
> > > > On Wed, 19 Jun 2024, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> > > > > Block KMS tests those are specific to (display_ver > 14)
> > > > > are not applicable for i915.
> > > > 
> > > > Feels a bit wrong to list features like this in a block list. IMO the
> > > > tests themselves should be aware of what's supported and what's not. I
> > > > imagine the rationale is performance? What's the impact?
> > > 
> > > I believe there is no point in running this test for i915, as it will
> > > always be skipped. The test already knows which platforms it supports
> > > and which it doesn't.
> > 
> > The question is whether it's worth it to start maintaining the info in
> > two places, the individual tests based on dynamic info obtained from the
> > driver, and a manually updated static block list. >
> > Are you also filtering xe testing for tests applicable to old platforms
> > only? Is the manual work worth the effort?
> 
> The only advantage I see in maintaining an additional list is improved
> reporting.
> 

Also saving CI time, the quickest run is no run. It also saves DB space
and man-hour when someone will need to look into reports and scroll all
those skips.

> Yes, we maintain an XE specific blocklist[*]. This manual effort is worthy
> for someone looking different execution reports. In fact, some efforts are
> going on to develop a platform-specific blocklist.
> 
> @kamil, Can you please add some details about upstreaming platform-specific
> blocklist?
> 
> [*]: https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/intel-ci/xe.blocklist.txt#n65
> 
> - Bhanu
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > > - Bhanu
> > > 
> > > > 
> > > > BR,
> > > > Jani.
> > > > 
> > > > > 
> > > > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > > > ---
> > > > >    tests/intel-ci/blacklist.txt | 3 +++
> > > > >    1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> > > > > index f6e9bb474..d01ef5e16 100644
> > > > > --- a/tests/intel-ci/blacklist.txt
> > > > > +++ b/tests/intel-ci/blacklist.txt
> > > > > @@ -140,3 +140,6 @@ igt@device_reset@reset-bound
> > > > >    # not working for i915
> > > > >    igt@kms_bw@.*
> > > > > +
> > > > > +# Tests specific to (Display_ver > 14) are not applicable for i915
> > > > > +igt@kms_vrr@cmrr

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> > > > 
> > 
