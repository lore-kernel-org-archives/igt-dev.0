Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22712F9D0EF
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 19:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2A110E11E;
	Tue, 14 Apr 2026 19:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cjjc5TaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F43010E11E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 19:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776194002; x=1807730002;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a7bO5gfMW8u+F1uZaBKOEiwkSR41li317z4U3dy+ZmM=;
 b=Cjjc5TaB+JUW0VWMWOvMrAmGO28Mm4dw939WYDlR7oo+9km68nZFa1Sb
 Uai2Z1LDmtmdpnaTQ+NsEQDcybUU94KP1FoukSwIoXAyitmAjn7Lz1ETU
 9WeLOaiLFohsVO0JJiSmbt/69u1dQOqkzm3CD16eRkK6CUru7XTz7fsm9
 Y7DMHgZIBJdP3BubC/EISaLKmcmDG5db0WA90tD9qcZ8UhnINPTUC1MGl
 TS21sc+KvbgZ9kmvwpOUaq4AggbYIESfwpKt12xqYFT2xn+klg26L6j4g
 Em/3Uqk7O6L7mmkHbJVk73xMFWOEe+15CaCjuwWSleKC2B2ZhnE/QTl1c g==;
X-CSE-ConnectionGUID: g21FlDR/T0eb/iIEHZkZlw==
X-CSE-MsgGUID: tcPsi460T3KaD8hqKaebMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81046443"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="81046443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:13:22 -0700
X-CSE-ConnectionGUID: ZmYNjSK0T6Ogloxfse5vuw==
X-CSE-MsgGUID: oRh5FF+3R++CgwA8nka94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253399805"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.163])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:13:20 -0700
Date: Tue, 14 Apr 2026 21:13:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] runner: Create attachments directory to use
 by hooks
Message-ID: <wygtuluuhgb4ekt5purkzknwybacsnudkdiwdqxnybzvsuftus@x4m25irfqwrj>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
 <4xait5mvo6ucmtro5awsypjyscqfipercq3royxobm5ujfwycn@7xmk75cvaate>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4xait5mvo6ucmtro5awsypjyscqfipercq3royxobm5ujfwycn@7xmk75cvaate>
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

On Tue, Apr 14, 2026 at 07:34:41AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> [...]
> 
> >  static bool clear_test_result_directory(int dirfd)
> >  {
> > -	int i;
> > +	int i, attdirfd;
> > +	int ret = true;
> >  
> >  	for (i = 0; i < _F_LAST; i++) {
> >  		if (remove_file(dirfd, filenames[i])) {
> > @@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dirfd)
> >  		}
> >  	}
> >  
> > -	return true;
> > +	if ((attdirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> > +		errf("Cannot open attachments directory\n");
> > +		return false;
> > +	}
> > +
> > +	ret = clear_attachments_dir_recursively(attdirfd);
> > +	if (!ret)
> > +		errf("Cannot clear attachments dir recursively\n");
> > +
> > +	return ret;
> >  }
> >  
> >  static bool clear_old_results(char *path)
> > @@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
> >  			close(dirfd);
> >  			return false;
> >  		}
> > +
> This is an unrelated newline, but I'd not block over it:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

You're right, this newline noise shouldn't be here. I'm going to
fix it in v4. Thanks for catching this.

--
Zbigniew

> 
> >  		close(resdirfd);
> >  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
> >  			errf("Warning: Result directory %s contains extra files\n",
> > diff --git a/runner/executor.h b/runner/executor.h
> > index 3b1cabcf55..bc6ac80dc4 100644
> > --- a/runner/executor.h
> > +++ b/runner/executor.h
> > @@ -25,6 +25,8 @@ enum {
> >  	_F_LAST,
> >  };
> >  
> > +#define DIR_ATTACHMENTS "attachments"
> > +
> >  bool open_output_files(int dirfd, int *fds, bool write);
> >  bool open_output_files_rdonly(int dirfd, int *fds);
> >  void close_outputs(int *fds);
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Best Regards,
> Krzysztof
