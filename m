Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730E9CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 09:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162EC10EAAD;
	Fri, 22 Aug 2025 09:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMv/kWGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273A10EAAD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755856771; x=1787392771;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FvokdDLI9Ki8SwLCl7KEaz9rpQczAnupk0VVQmZxLrw=;
 b=XMv/kWGGIvacXSlBU2id0b/tF/PU6hj2O5j3/vlOmJpmyjFOEThxlkPT
 tM4NxVsriL4ZgZ/QgTaSgfpNYWL88P8I0pXLSmCgNAOhq7l1OYZWLxSbN
 uQYTBY+Ti4lfY2sVmrQm1EzYuEkMRiUc0zTgRbVER/AQ/1ajFZvFbqGcp
 /741m6MTrCkCY/2tRlHp+51V1KVDJXJKI+NDKTFn5J7u7xS63ug5yv6Eq
 KnFaeT5evfIlNvvmy0ffc39VKaG29kv7ygQ/gS1lQj8oObr1Y/qMRAvYY
 geQgrnHMEjbabLhahEm3tCSVS0GrHZcW63LLItVx3k1Z1iINcogQd3kap g==;
X-CSE-ConnectionGUID: IHUxsamaTH69l9LDFZyyxw==
X-CSE-MsgGUID: TFUHZRIMT/eAsFNIpezPeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="45732909"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="45732909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:59:31 -0700
X-CSE-ConnectionGUID: OgKdz/GaTF6FPr767SlMBw==
X-CSE-MsgGUID: 88dQL39NR46En4jn/hXqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169494015"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:59:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v3 0/3] Establish MkDocs Documentation Framework
 for IGT GPU Tools
In-Reply-To: <20250820052934.121604-1-pawel.sikora@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250820052934.121604-1-pawel.sikora@intel.com>
Date: Fri, 22 Aug 2025 12:59:26 +0300
Message-ID: <4206527b03af5e923f42f6e1ec87e07c3935879c@intel.com>
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

On Wed, 20 Aug 2025, Pawel Sikora <pawel.sikora@intel.com> wrote:
> I am submitting a series of patches to introduce a comprehensive 
> documentation framework for the IGT GPU Tools project using MkDocs.

I'm extremely biased, but I think there'd be more synergy in using
Sphinx and reStructuredText, aligning with what the kernel, mesa, and
several fdo projects, including our maintainer-tools and intel-docs
projects, are doing.

We also have extensive experience with writing Sphinx extensions in the
graphics community.


BR,
Jani.

-- 
Jani Nikula, Intel
