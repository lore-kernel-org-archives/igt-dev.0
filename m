Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84549D111A8
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 16:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373CF10E729;
	Thu, 27 Nov 2025 16:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUqdt5eU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF46F10E729
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764261422; x=1795797422;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W5HSX08AG8MWydYnzMsF06sj8iB24onQkqTLXrbbPl4=;
 b=KUqdt5eUYU/u+E3L4VfZHdIHQRthLjvja+xSWYTQ0lmXc5I9xh3Nrr4s
 9gox+HftUD6ON1ZMDpjCu+8WhUVqVxdv06bCHHbj0LbDvFuQHA6K5Hs4l
 +ocaPeuLIjNYXTB/RwdWIyVwX7E+Cits9sa+yxM2EYiQEPok6q4e7Q4eQ
 LQI+3eqk6ceoOT/zwnkuWNgx9CpWgKBLdtsf8SLs6hpZX2jVHpX72waWF
 C1j2kAI5yD7zIAILL8CnflgdFgUu7WnnBhg6lzj4pw4w3wWqu6Ioe6u2m
 t4lHW98YbjlBI6dYVfu7ujjpLQLLCyVYmSxvhNTOAWjwrszZ4ipjjo3JJ g==;
X-CSE-ConnectionGUID: 8RJjaMMxRJCAJPzldTtxfQ==
X-CSE-MsgGUID: tHb7xXPBR6S7z1uqVhsIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77415293"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77415293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:37:02 -0800
X-CSE-ConnectionGUID: 6mwWgT+KSSiBXVJ6Z1R7tA==
X-CSE-MsgGUID: fcO8JldcQTulcNwrzIT5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193711343"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 08:37:00 -0800
Date: Thu, 27 Nov 2025 17:36:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, S Sebinraj <s.sebinraj@intel.com>,
 Xin Wang <x.wang@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Change Intel
 card detection
Message-ID: <20251127163643.qvrhiqolcxjfpnjm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, S Sebinraj <s.sebinraj@intel.com>,
 Xin Wang <x.wang@intel.com>
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
 <20251121193539.195005-3-kamil.konieczny@linux.intel.com>
 <2xtnunbtp25sipffh5whv42wlxitkd2zlikug7lu7hdyzpnqss@emrt27rimshn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2xtnunbtp25sipffh5whv42wlxitkd2zlikug7lu7hdyzpnqss@emrt27rimshn>
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

Hi Krzysztof,
On 2025-11-24 at 08:11:48 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> [...]
> 
> > +/* Returns:
> > + * 1 if Intel card with i915 driver binded
> binded -> bound
> 

Right, something like:

 * 1 if Intel card was bound by i915 driver


> > + * 0 otherwise
> > + * -errno on error
> > + */
> > +static int
> > +is_intel_card(int card)
> 
> [...]
> 
> > +static int
> > +get_intel_card(void)
> > +{
> > +	struct dirent *entry;
> > +	int intel_card = -1;
> > +	int dirfd, err;
> > +	DIR *dirp;
> > +
> > +	dirfd = open("/dev/dri/", O_RDONLY | O_DIRECTORY);
> > +	if (dirfd < 0)
> > +		exit_error("Cannot open /dev/dri/", errno);
> > +
> > +	dirp = fdopendir(dirfd);
> > +	if (!dirp) {
> > +		err = errno;
> > +		close(dirfd);
> > +		exit_error("Cannot open dir /dev/dri/", err);
> "Cannot open /dev/dri/" and "Cannot open dir /dev/dri/" look
> very similar at first glance and may be misread as the other,
> especially when parsing logs. Maybe you could use the full word
> "directory", so the messages differ even more?
> 

Ok, I will add more verbose print here.

> > +	}
> > +
> > +	while ((entry = readdir(dirp))) {
> > +		int num;
> > +
> > +		if (strcmp(entry->d_name, ".") == 0 ||
> > +		    strcmp(entry->d_name, "..") == 0)
> > +			continue;
> > +
> > +		if (entry->d_type == DT_DIR)
> > +			continue;
> > +
> > +		if (strncmp(entry->d_name, "card", 4))
> > +			continue;
> > +
> > +		if (sscanf(entry->d_name, "card%d", &num) != 1)
> > +			exit_error("cannot parse integer", 0);
> "cannot parse integer" requires the user to know that we use
> integers as card IDs, not floats, not doubles, etc. You could
> change that to something a bit more generic, like:
> "cannot parse card ID"
> or if you want to include the information about this field being
> an integer:
> "cannot parse card ID as integer".

Ok, looks simpler, thx for comments, I will send v3 soon.

Regards,
Kamil

> 
> [...]
> 
> -- 
> Best Regards,
> Krzysztof
