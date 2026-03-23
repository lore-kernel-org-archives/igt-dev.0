Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94531EC01AC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D6010E350;
	Mon, 23 Mar 2026 09:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhedOZol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0274910E350
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258084; x=1805794084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2TuHP/Tup73S+r9v636wgCQt+37Xyu2U2RCGdc/0jMU=;
 b=jhedOZolCE5/Hb8Mw2cvAZcB4a9OMCQ2xTkr7JwlRqLi3KZ9BViI8Y5Y
 OZkRck/QC3iEbT9QAQEkomuTJTkhKJRkMlv7kcyCoeV8Vk7aPVKrerndf
 d5jfjgjKYrbNxKjIooeZk6amYAyC3QknKDcGjqoOunva90kjzcvTzEcEs
 YJA+UV5ASxJxaCq4ZP4CJ/rn5PP6/2bX/ZD4r+upeOfIUQEKtRf9Y1zKT
 onukau8gnwJTVorn2CNcc8WGTqWoiSWDTmtf+JaJDkyQKYozJkCuWx78B
 tVyaGfd4h9mwDmOVJfHubPo7fpw+hyEBQGxaOZjYpe/5Ee1AP5tjbgEYr A==;
X-CSE-ConnectionGUID: NH/hBcbxSt+wj5jwlXDAaA==
X-CSE-MsgGUID: iqg9ggFrQz+BRQLcRMqvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75276566"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75276566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:28:03 -0700
X-CSE-ConnectionGUID: KqISdHncQs6TyUPpAELc1g==
X-CSE-MsgGUID: hqkXi/wSQ5aMVDnRDbnWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254447341"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.11])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:28:01 -0700
Date: Mon, 23 Mar 2026 10:27:58 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 3/4] runner: Add attachments directory content in
 subtests results
Message-ID: <perzuz4jmyqbnmcstfgz6ify3p2sv7puqlaku2gicvas5r4uk6@zx64udhcqq4y>
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
 <20260319215124.2066611-9-zbigniew.kempczynski@intel.com>
 <2s6eo65qwzowdek3jy4d5ejjejncdhcmnpyzcydxk66xty5tz4@62256siptdtd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2s6eo65qwzowdek3jy4d5ejjejncdhcmnpyzcydxk66xty5tz4@62256siptdtd>
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

On Mon, Mar 23, 2026 at 07:28:25AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
> 
> > Files produced by hooks which lands in attachments directory should
> > be called in piglit style, what means they should be in form:
> > 
> > igt@test@subtest@@unique-filename-from-hook
> > igt@test@subtest@dynsubtest@@unique-filename-from-hook
> > 
> > depending is it normal subtest or dynamic subtest.
> > 
> > Hooks introduced IGT_HOOK_TEST_FULLNAME env variable, which contains
> > 
> > igt@test@subtest
> > igt@test@subtest@dynsubtest
> > 
> > and it should be used as prefix part (before '@@') of attachment
> > filename when hook script writes some content to it.
> > 
> > Such defined contract between hook script and resultgen allows to
> > distinguish subtest/dynsubtest attachments structure in results.json.
> > So string before '@@' is a subtest/dynsubtest name in results file,
> > and string after it is a unique key of a base64 file content added
> > to results.
> Is the base64 key in here to provide uniqueness to the
> particular test run results? As in, since the output file
> content will usually be different for different tests, the
> base64 would also differ, thus being sort of an ID.
> Why not a timestamp or something more readable to the human eye?

No, base64 is only used to keep content. When runner executes the test
it stores dmesg, err, etc... to '%d' directory what is a number where
I want to collect attachments as well. If we execute for example
testlist with two tests, like:

igt@test_a@t-x
igt@test_b@t-y

runner will create results directory which will contain:

0/
  comms
  dmesg.txt
  err.txt
  journal.txt
  out.txt
  attachments/ (with this series)
1/
  comms
  dmesg.txt
  err.txt
  journal.txt
  out.txt
  attachments/

If you'll take a look there's no direct relationship between number
and test name (which is used later as a key). This is stored in "comms"
file so you need to parse it to find out test name used as a key in
results.json. In case of dynamic subtests single '%d' directory
corresponds subtests, so parsing content and splitting results to
different dynsubtest names (key in results.json) is necessary.

For make everything simple I decided hook script should write to
IGT_RUNNER_ATTACHMENTS_DIR (set by runner because it knows current '%d'
directory). IGT_HOOK_TEST_FULLNAME contains unique subtestname (+dyn)
and using it as a key allows to include all attachments directly to
valid result branch in results.json. For example hook script may write to

0/attachments/igt@test_a@t-x@@guc-log

If it would be dynamic:

0/attachments/igt@test_a@t-x@rcs0@@guc-log
0/attachments/igt@test_a@t-x@bcs0@@guc-log
0/attachments/igt@test_a@t-x@ccs0@@guc-log

taking igt@test_a@t-x@rcs (before @@) gives us exact key of object
in json result structure. So even if guc-log is same name above
three guc-logs will occur in different attachment branches.
So 'guc-log' will be key in this result branch, whereas value
will be base64 encoded guc-log. That's why I would keep this
naming intact, especially timestamp imo is not good idea.

--
Zbigniew

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > ---
> 
> [...]
> 
> > +
> > +static bool fill_from_attachments(int dirfd, struct json_t *tests)
> > +{
> This could return an int with last error/errno (EEXISTS,
> EFAULT, EINVAL, ...).
> 
> > +	struct json_t *obj = NULL, *attobj = NULL;
> > +	char attname[32];
> > +	int atdir;
> > +	struct dirent *entry;
> > +	DIR *dir;
> 
> [...]
> 
> -- 
> Best Regards,
> Krzysztof
