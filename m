Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F8F327C9
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 09:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC8310E842;
	Tue, 21 Apr 2026 09:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgpXO96u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A3110EBEF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776762077; x=1808298077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GghTQTGgZT0ZZEpTMgJUbeZgP9EOWr9fIQK9aausXuM=;
 b=AgpXO96ub76MqcxSbMwG9v9oPz3eekELlFcFJWP13Sv/CHjcoWT0zov8
 dZ3WuTqfnurmOqSlQSMEqFMnxFAubDR0QPQCbor2G77vOkYd1sMIAqETS
 aznC5i4SbukAawGdHODte2/6ICAsbiTvrASI58anKYJJrblebs6aJx+0L
 Czi6/Xgu8ZVmYY5+OjeatEgApGUFjcEnM7NBUmLs28ni+56uC/cKvhv5t
 Xjd+2tmezVA4CJCXv72ag5f0Gk7ThNfIpQi4iuHCYQk6+gv+hT7ybLra4
 oCIIzMJLRl7uZoXWCdSuxaKnchi9pgaQytE+YRN45mzIQ5R1hzLAZBzen g==;
X-CSE-ConnectionGUID: JWlB6/gOQQ26sWxJDH6aAg==
X-CSE-MsgGUID: OOgyctPMT7SOCw0oyBg5gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100349912"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="100349912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:01:17 -0700
X-CSE-ConnectionGUID: kpAUTRQBQ1aPQVm9JXLWeg==
X-CSE-MsgGUID: RcB1GcRoTt+eAlwCGT8KBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="225484159"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:01:15 -0700
Date: Tue, 21 Apr 2026 11:01:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v4 3/4] intel-ci/hooks: Add hooks-wrapper and aux
 scripts/allowlists
Message-ID: <jeqdxc7u6v75g3ai2ky5s35qnahb2s3mavvxuf76tweyvud54b@5iidxgdq3ceb>
References: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
 <20260420085653.2587750-9-zbigniew.kempczynski@intel.com>
 <7o26hn2ovyoejk2gwrhow7mn7flk3d3kdyim235xjieajqfqtt@oxuy4mlrbpel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7o26hn2ovyoejk2gwrhow7mn7flk3d3kdyim235xjieajqfqtt@oxuy4mlrbpel>
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

On Tue, Apr 21, 2026 at 08:15:48AM +0000, Krzysztof Karas wrote:
> Hi Zbigniew,
>  
> [...]
> 
> > diff --git a/tests/intel-ci/hooks/common.helper b/tests/intel-ci/hooks/common.helper
> > new file mode 100755
> > index 0000000000..a3f913f8e8
> > --- /dev/null
> > +++ b/tests/intel-ci/hooks/common.helper
> > @@ -0,0 +1,47 @@
> > +# Common helper for hooks executed from igt_runner
> > +#
> > +# Provide ALLOWLIST="..." as a default, it might be overwritten by --allowlist
> Maybe instead of "Provide", which to me looks like you expect
> an argument, "Set" would be better suited here?
> It is just aesthetics, so I'd not block over this.

Ok, I'll rephrase a bit as I've just realized that if ALLOWLIST wasn't
provided and --allowlist wasn't set we won't have ALLOWLIST at all,
so helper should exit in this case.

> 
> > +
> > +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
> > +	attout=$(echo ${log:23} | sed -e 's/\//_/g')
> > +	mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
> > +	cp "$log" "${IGT_HOOK_TEST_FULLNAME}/${attout}"
> > +done
> > diff --git a/tests/intel-ci/hooks/hook-example.allowlist b/tests/intel-ci/hooks/hook-example.allowlist
> > new file mode 100644
> > index 0000000000..54cbc0a1d4
> > --- /dev/null
> > +++ b/tests/intel-ci/hooks/hook-example.allowlist
> > @@ -0,0 +1,2 @@
> > +igt@xe_exec_basic@once-basic@rcs0
> > +igt@xe_exec_basic@once-basic@ccs0
> > diff --git a/tests/intel-ci/hooks/hook-example.sh b/tests/intel-ci/hooks/hook-example.sh
> > new file mode 100755
> > index 0000000000..512e123567
> > --- /dev/null
> > +++ b/tests/intel-ci/hooks/hook-example.sh
> > @@ -0,0 +1,17 @@
> > +#!/bin/bash
> > +
> > +# Hook example, touch <testname>/current-date.txt in attachments dir
> > +#
> > +# Suggested usage with:
> > +# --hook 'post-subtest:tests/intel-ci/hooks/hook-example.sh' \
> > +# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hook-example.sh'
> > +# or within hooks-wrapper.sh
> > +
> > +ALLOWLIST="hook-example.allowlist"
> > +SCRIPTDIR=$(dirname "$(realpath "$0")")
> > +. "${SCRIPTDIR}/common.helper"
> > +
> > +cd "${IGT_RUNNER_ATTACHMENTS_DIR}"
> > +
> > +mkdir -p "${IGT_HOOK_TEST_FULLNAME}"
> > +date > "${IGT_HOOK_TEST_FULLNAME}/current-date.txt"
> > diff --git a/tests/intel-ci/hooks/hooks-wrapper.sh b/tests/intel-ci/hooks/hooks-wrapper.sh
> > new file mode 100755
> > index 0000000000..263b81a8b7
> > --- /dev/null
> > +++ b/tests/intel-ci/hooks/hooks-wrapper.sh
> > @@ -0,0 +1,12 @@
> > +#!/bin/bash
> > +
> > +# Hooks wrapper
> > +# Suggested usage with:
> > +# --hook 'post-subtest:tests/intel-ci/hooks/hooks-wrapper.sh' \
> > +# --hook 'post-dyn-subtest:tests/intel-ci/hooks/hooks-wrapper.sh'
> > +
> > +SCRIPTDIR=$(dirname "$(realpath "$0")")
> > +
> > +cd "${SCRIPTDIR}"
> > +./hook-example.sh
> Is hook-example.sh necessary here? If it is supposed to serve as
> an example, then there is no need to call it each time wrapper
> executes. If it is supposed to be a sanity check, then a more
> suited name would be in order (hook-sanity-check.sh or
> hook-date.sh).

If rename to hook-date.sh then commenting it out in hooks-wrapper.sh
would be ok? I would like to show an example how scripts can use
common.helper to process allowlists.

Thanks for the review.

--
Zbigniew

> 
> -- 
> Best Regards,
> Krzysztof
