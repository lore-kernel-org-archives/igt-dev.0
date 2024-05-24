Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D5CC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC56D10E101;
	Fri, 24 May 2024 08:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nn6qsGzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF6F10E101
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540583; x=1748076583;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M8mL0jmu9X/EMoJokr2goo5K6U3/ppKpefzn5QZZvno=;
 b=nn6qsGzLxaqkXNSBjAaJLqM9qWCsEhmgVSyNY6i0K7dtGl7jwOw9j0Ab
 zq4f7g8bcFzyp49ZSojqv6Vy/akOBBIdUIW6//T/L/jbvCcsLKXKIkhvk
 ayJC0Xifnem9KmsY3m9CTV+WEjk4TR6ZLUELiQuPmN9Z1+DbZZkaLsmU1
 ewaBGMWyqV1RBbElUuIiYXUSmYASTn0tWQvqaZdNss2zMBGA4tgeR9VRl
 wCpmPfIaT/eRogzceW67ZiKzqHTRixXJhAFdng/zdQQNS8Ci+lXWgTRrD
 mLOOdPxCyaRQmR9Af62MckXSBunKEa0PsjW+oE2pReN0egY9gU07UP1Mn w==;
X-CSE-ConnectionGUID: BIYEVaR6TdWx6ZQat0E+iQ==
X-CSE-MsgGUID: ugYctTerTg2vw1tAYvnjhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12738589"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12738589"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:42 -0700
X-CSE-ConnectionGUID: dozbxTa0T5mVkLpLk0qXyA==
X-CSE-MsgGUID: pdiipiFjTt6MprDX6oWKiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="38805878"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <20240523173123.tu6rghsgsqkptrmm@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com> <20240523103558.42876c98@maurocar-mobl2>
 <87le40q4gi.fsf@intel.com>
 <20240523173123.tu6rghsgsqkptrmm@kamilkon-DESK.igk.intel.com>
Date: Fri, 24 May 2024 11:49:36 +0300
Message-ID: <87o78voaqn.fsf@intel.com>
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

On Thu, 23 May 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Maybe this should/may be added to scripts?
> I do find it usefull to have a little script checks,
> without much dependancy on other libs/tools. I would
> also want to have a way to semi-automatically update
> it later on, where new devices will be added.

I never questioned the usefulness of such a tool. Only the
implementation, and how perl/make are not aligned with the IGT project,
and the constant maintenance burden all of this brings.

Besides that, I think I've pretty much said everything I want to say on
the matter.

Thanks,
Jani.

-- 
Jani Nikula, Intel
