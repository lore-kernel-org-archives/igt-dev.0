Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C866D3F09A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF4E10E73C;
	Wed, 28 Jan 2026 17:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPOsKl/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4555210E73C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769620586; x=1801156586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bi5ohV90g6jEa7xabuH+YKBhgvrOOBX4DriiL6RwRkM=;
 b=gPOsKl/fWdyo3aJRF1uFG4+qJRl+9KHYpnp4LL/l+mBwmE2Wz0qQVQJk
 KeB/luQnaWg+UfURPBi9qRhtDH4rlxbFiTkbsVk7t9QsjexQg+S7sOsBA
 iuhqCc3B0XU1PiDEkzX3EEmwI+9qAtqe8o92t6TO/ReI+UPxu5PfhPOXo
 kB2mG+uJOtvdQhppm232AaqRxIIDmUpHDz3gbMHNveBuwPcezf67byklZ
 kMM9pF9dW8geL9gtgsCgnfzDVD6jsBbmpF4AJ1ktwDoRiB8V7wyi7Nq7N
 fPBynUWA4Tht+iK7bSTPW0ZKy6RP/jFWDda/L4BKKDJ61YOp+Tf+AP9Bl w==;
X-CSE-ConnectionGUID: GNWC8xjVTpWZoNLRjGuCgA==
X-CSE-MsgGUID: hqUkHY+lRD6sZTPvgoamAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="58421234"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="58421234"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:16:26 -0800
X-CSE-ConnectionGUID: cAOch/5VQq2fLde1l350gg==
X-CSE-MsgGUID: vXH8QgXKQjqLlblyDmGEfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="239056435"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:16:24 -0800
Date: Wed, 28 Jan 2026 19:16:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] lib/igt_kms: pipe vs CRTC index cleanups
Message-ID: <aXpEYzgf6MKLKJKW@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
 <aXon4Dk6azuIFd4w@intel.com>
 <d6530c2859f5e77f84be1e69aa48625a036a0c76@intel.com>
 <aXo-3HMDhUlUoCcR@intel.com>
 <5939a9a4a24dd14e875951e0d8687c1ec86ca5fe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5939a9a4a24dd14e875951e0d8687c1ec86ca5fe@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jan 28, 2026 at 06:59:35PM +0200, Jani Nikula wrote:
> On Wed, 28 Jan 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > Yeah, The next set tries to convert the for_each_pipe*()
> > stuff to crtcs. Just doing some (hopefully) final tweaks
> > to catch a few more stragglers...
> 
> I forget, are you aiming for making it iterate igt_crtc_t instead of
> crtc index? If feasible, I think it would make a ton of sense all over
> the place.

Yeah, igt_crtc_t.

-- 
Ville Syrjälä
Intel
