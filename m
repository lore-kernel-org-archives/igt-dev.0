Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D39DD7309F
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 05:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B653310F209;
	Fri,  3 Apr 2026 05:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7g2tqCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294E10F209
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775193498; x=1806729498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ll8qMXrRmXR7xGrKpY6LANz9wIw0vFFrknwx5W/lPYg=;
 b=L7g2tqCpeevLtsFHuUH15pIETk04CTzTGLwxYFPHBazUx8YoRNroMXQb
 rVRPIJYggHJQnNQTWPv56o8bvNbqoSX9HKG92njsPI6+wQwbfKbfIah34
 q7diWsUtihB1DW1/NGkEB9UQ2SmKZi/HQILVbpVw2fJnt8B+AZ1Cv3Oyq
 z49ERQh8TvDL9DQSrl0qKfuTqZv1FGu0ey/omgJeP9ESNcbZxAoIA8/6W
 QqnGQCVlEPbO++wEe6H+qpr6Ft+Hy3q/u8LtQ9ygO/+9JIOIteCMUEQ8X
 B/pLKTtMWsdbkTqqbkaCXxTNqrX7jwQ6YnIreye52fr9jylMCFGcZT0MB g==;
X-CSE-ConnectionGUID: kSgvtXqfS2GiieVmrYkpgw==
X-CSE-MsgGUID: ItaLk4qDQs62tdCQd6eopQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76144655"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76144655"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 22:18:17 -0700
X-CSE-ConnectionGUID: 5ShwOm+vT3C12PUT+12Stw==
X-CSE-MsgGUID: TFhf0mGOSwSS0abrKS5dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="231976372"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 22:18:15 -0700
Date: Fri, 3 Apr 2026 07:18:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] runner: Create attachments directory to use
 by hooks
Message-ID: <fnlsteuz76ppwcydsfi5ahsbwkhdp7gacl27viwmfgntmadjjj@ngtgboznojld>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
 <zhs7x2ujbcjdgiyrqqd3eyfpmykrr27mnl7ccmgtyrhdmcfj5e@6lovhtvp7gna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zhs7x2ujbcjdgiyrqqd3eyfpmykrr27mnl7ccmgtyrhdmcfj5e@6lovhtvp7gna>
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

On Mon, Mar 30, 2026 at 06:48:51AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> On 2026-03-24 at 14:12:38 +0100, Zbigniew Kempczyński wrote:
> > Results parsing is currently limited to few predefined files.
> > 
> > Create "attachments" directory and export full path of created directory
> > to be used within hooks. From now on environment variable
> > IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> > to execute tests. This env contains directory where subtests/dynsubtests
> > may write auxiliary files which finally be included in results.json.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> > v2: simplify attachment dirname concatenation (Kamil)
> >     remove files in attachments dir when overwrite is set (Kamil)
> > ---
> 
> [...]
> 
> > @@ -1779,17 +1779,22 @@ static int execute_next_entry(struct execute_state *state,
> >  	int errpipe[2] = { -1, -1 };
> >  	int socket[2] = { -1, -1 };
> >  	int outfd, errfd, socketfd;
> > -	char name[32];
> > +	char name[32], attname[32];
> > +	char attdirname[PATH_MAX];
> >  	pid_t child;
> >  	int result;
> >  	size_t idx = state->next;
> >  
> >  	snprintf(name, sizeof(name), "%zd", idx);
> > +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
> >  	mkdirat(resdirfd, name, 0777);
> > +	mkdirat(resdirfd, attname, 0777);
> >  	if ((idirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> >  		errf("Error accessing individual test result directory\n");
> >  		return -1;
> >  	}
> > +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
> > +		 settings->results_path, attname);
> >  
> >  	if (!open_output_files(idirfd, outputs, true)) {
> >  		errf("Error opening output files\n");
> > @@ -1870,6 +1875,7 @@ static int execute_next_entry(struct execute_state *state,
> >  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
> >  		}
> >  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> > +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
> >  
> >  		execute_test_process(outfd, errfd, socketfd, settings, entry);
> >  		/* unreachable */
> > @@ -1950,7 +1956,10 @@ static int remove_file(int dirfd, const char *name)
> >  
> >  static bool clear_test_result_directory(int dirfd)
> >  {
> > -	int i;
> > +	DIR *dir;
> > +	struct dirent *entry;
> > +	int i, adirfd;
> Since you use "att" in the function above, you could use
> attdirfd name here as well. It will be easier to identify what
> this variable represents when reading the code.

Makes sense with 'att' prefix. At the moment I won't attach your
r-b to patch, as I need to dosome rework in it according to Gustavo
comments.

--
Zbigniew

> 
> Rest of the code looks good to me:
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 
> -- 
> Best Regards,
> Krzysztof
