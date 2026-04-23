Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECECF9936B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923B10F093;
	Thu, 23 Apr 2026 10:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wu4trnGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404B510F093
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776941868; x=1808477868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D972V2FDTYQViByXthToh3NUXpaBcRQ1Cv9wbLp3RFs=;
 b=Wu4trnGbHMTpg7aupVOfr3zBVc2FvWzH2yHEhRopdwxCtH0+azQxcca5
 NI4U5SRYdFi5joSJiLmbXWof9pw4eXmvgUN4UX/3ioR2uynUupGGUXDy4
 Aa/KNTBHH4V5D4xemjbgUbaavH2ivZCCaGhe6hFDMFvTXmcG5b3KJ+kb4
 TmVdUrARM73zcvMZk1CH1WmFAIsgrCMacBLAkmcuajhKvcN4sZZ6cMu5X
 g1rCepUjwSgmqg5Mmpdf6TvHm9AbC6/a4JkVlrq+cR5GkY9LJgD+dHysu
 YdIl2bnSSeilj3Q1BbLNYt+ov2y1BT6k8VmPbZ9PPwWgITiEvCv0pO78t g==;
X-CSE-ConnectionGUID: 31tE2MYVSc2xL+PHHVgpkQ==
X-CSE-MsgGUID: VXhxoHE9SrSyblqhZlAL4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81770677"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="81770677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:57:47 -0700
X-CSE-ConnectionGUID: /iRdPpbdRd+kyGVNe1r7xQ==
X-CSE-MsgGUID: yp2FSCuwQC2p/z30B0avhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="231596798"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:57:46 -0700
Date: Thu, 23 Apr 2026 12:57:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 4/4] runner/resultgen: Insert attachments list into
 results.json
Message-ID: <yenbryah3plshxfvj6uoj4tfodpqarlohzvdcvn66b6ndl7zyv@agjlxmissibg>
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
 <20260421111709.3163253-10-zbigniew.kempczynski@intel.com>
 <mt2txez6ja3mpu2ysrgvhexwyv74hkuatbuvkoqiy6tbfex3hi@nhthcszzvfwx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mt2txez6ja3mpu2ysrgvhexwyv74hkuatbuvkoqiy6tbfex3hi@nhthcszzvfwx>
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

On Thu, Apr 23, 2026 at 09:11:26AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> I just noticed that you forgot versioning in this batch ;)
> 
> On 2026-04-21 at 13:17:14 +0200, Zbigniew Kempczyński wrote:
> > ontent-Length: 4165
> > 
> > Add list of filenames which were created by hooks in attachments directory
> > (like GuC log copy) to results.json for allow presenting it in CI.
> > Absolute path to attachment directory was added to results.json
> > as this is necessary to build full path to attachment file related to
> > test/subtest name.
> > 
> > Due to lack of userdata pointer in nftw() implementation main json
> > object is passed via temporary static variable. It shouldn't be the
> > problem because results.json is created in single thread. This change
> > is not too elegant but allows to minimize the code change and is
> > much easier to read comparing to recursive readdir().
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> >  
> 
> [...]
> 
> > +static struct json_t *tmp_tests;
> > +static int ftw_attachments_list(const char *fpath, const struct stat *sb,
> > +				int typeflag, struct FTW *ftwbuf)
> > +{
> > +	struct json_t *obj = NULL, *attobj = NULL;
> > +
> > +	(void)sb;
> > +	(void)ftwbuf;
> > +
> > +	switch (typeflag) {
> > +	case FTW_F:
> > +		const char *attdirkey = "attachments-dir";
> > +		char *p, *currpath = (char *) fpath + 2;
> > +		char currdir[PATH_MAX];
> > +
> > +		p = strstr(currpath, "/");
> > +		if (!p)
> > +			return -1;
> > +		*p = '\0'; /* temporary for acquiring the piglit name */
> > +		obj = get_or_create_json_object(tmp_tests, currpath);
> > +		attobj = get_or_create_json_array(obj, "attachments");
> > +		*p = '/'; /* bring '/' back */
> > +		json_array_append_new(attobj, escaped_json_stringn(currpath, strlen(currpath)));
> > +		getcwd(currdir, PATH_MAX);
> getcwd() may technically fail, should we be worried about
> possible errors? You'd be trying to run strlen on currdir, whose
> contents may be undefined in that case.

Right, for safety it is better to check if there was no error before
doing memory walk in strlen(). V2 was sent, thanks for the review.

--
Zbigniew

> 
> > +		if (!json_object_get(obj, attdirkey))
> > +			json_object_set_new(obj, attdirkey,
> > +					    escaped_json_stringn(currdir, strlen(currdir)));
> 
> [...]
> 
> -- 
> Best Regards,
> Krzysztof
