Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90CFCC6B38
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 10:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C96F112738;
	Fri, 16 Oct 2026 10:56:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79AE112738
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792148139; x=1823684139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MiFqVbHkHco8/Wnx++r7DwKcV7GOmlV5UbDEbF0QHC0=;
 b=HnMnJl8Bb5xD/6ZFL4wwKpIIB42I5bdNle28nLXLwvB2gmcRGES11LOm
 6xCG/8BjabRpZlyG8ewj80MD8mAbi3ClhmqmPmjm6CRBzCGPvOWiCjNJs
 s3Z+NZTO+zZBz6NYvEB7zX33XTqlKEgcZntSQAaPkLfx8rOmvgtUYlSQq
 HU3kbpwqLBU7fd2wD3H9ahPhDvXQRlJeLmTH8rUWCHP8GBGmjpS2lV1dk
 qSffoPfOsogKscW0MYdhW4NeUFE4kqM11EREEt7ndET2WZjIw5MYGUz7h
 hhtfyolwmz9ywi4HdEKv4vPoLO0h9UQIMyK2lKECkPbfhhTQdZoIpauJ7 Q==;
X-CSE-ConnectionGUID: xHM4DEldT8ObANJXKXY4UQ==
X-CSE-MsgGUID: 9NGL2YTPTbCT8fVg7nD/mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="943862"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="943862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:55:39 -0700
X-CSE-ConnectionGUID: d4ph81P9RAGtvTunllF9kQ==
X-CSE-MsgGUID: APvnDuRKQFqZJSmvktx7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2405475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 03:55:37 -0700
Date: Fri, 16 Oct 2026 12:55:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com,
 swati2.sharma@intel.com, santhoshguddati@gmail.com,
 ankit.k.nautiyal@intel.com, karthik.b.s@intel.com,
 John Harrison <John.Harrison@Igalia.com>
Subject: Re: [PATCH i-g-t v1 00/16] tools/intel_hdcp: HDCP tool updates
Message-ID: <20261016105534.lcep3dhd6i2hdob7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com,
 swati2.sharma@intel.com, santhoshguddati@gmail.com,
 ankit.k.nautiyal@intel.com, karthik.b.s@intel.com,
 John Harrison <John.Harrison@Igalia.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2026-09-16 at 16:36:53 +0530, Santhosh Reddy Guddati wrote:
> intel_hdcp is the manual bring-up tool for HDCP: it puts a picture on a
> protected output and lets an operator drive Content Protection from the
> keyboard.

Adding also to cc John Harrison <John.Harrison@Igalia.com>


Regards,
Kamil

> 
> This series handles below fixes.
> 
> Fixes first. The tool only touches HDCP Content Type on connectors that
> actually have it, and only reads Content Protection where it exists. The
> display no longer freezes while the tool waits for you to type, because
> it does not hold the display lock while reading stdin. Shutdown is now
> cooperative rather than killing the input thread mid-operation, which
> could leave a lock held and hang the exit. 'q', Ctrl-C and EOF all take
> the same path out and set Content Protection back to UNDESIRED, so the
> tool no longer exits leaving the link protected. If no connected output
> supports Content Protection, it says so and stops instead of crashing
> later, and it checks that HDCP is applied to the same connector that the
> picture is on.
> 
> Then reporting. A version line at startup and --version tell you which
> build a log or a photo of the screen came from. Every Content Protection
> change is logged with how long the previous state lasted and, when the
> link comes up, how long the kernel took to authenticate. On exit you get
> a summary: how many times it authenticated, how many times the link
> dropped, the min/avg/max authentication time and the total protected
> time, ready to paste into a bug report.
> 
> The rest is the on-screen overlay, which is what you watch during a demo.
> The state badge now shows what the kernel reports instead of what was
> asked for, so it no longer goes green on a link that never came up. The
> top bar names the output, connector id and sink capability; the bottom
> bar shows elapsed time and the key legend. A band sweeps across the
> picture so you can tell a live frame from a frozen one, and the last few
> transitions appear under the badge. Drawing alternates between two
> framebuffers so the tool is not painting into the one on screen. The
> overlay runs from startup rather than only after HDCP is requested.
> 
> Santhosh Reddy Guddati (16):
>   tools/intel_hdcp: Don't set HDCP Content Type unconditionally
>   tools/intel_hdcp: Read stdin outside the display lock
>   tools/intel_hdcp: Exit cleanly on quit and on Ctrl-C
>   tools/intel_hdcp: Keep the picture and the protected link together
>   tools/intel_hdcp: Report the tool and IGT version
>   tools/intel_hdcp: Don't read Content Protection from every connector
>   tools/intel_hdcp: Report content protection changes as they happen
>   tools/intel_hdcp: Print a session summary on exit
>   tools/intel_hdcp: Add Content Protection state helpers
>   tools/intel_hdcp: Rework the on-screen overlay
>   tools/intel_hdcp: Run the overlay for the full session
>   tools/intel_hdcp: Show the transition log on the display
>   tools/intel_hdcp: Report authentication time
>   tools/intel_hdcp: Actually select HDCP1.4 when it is asked for
>   tools/intel_hdcp: Colour the overlay by HDCP state
>   tools/intel_hdcp: Say what the numbers in a transition line mean
> 
>  tools/intel_hdcp.c | 1092 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 922 insertions(+), 170 deletions(-)
> 
> -- 
> 2.43.0
> 
