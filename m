Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3250EC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 10:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559C10F508;
	Thu,  3 Sep 2026 10:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/yb8u9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB88510F508
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788432409; x=1819968409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jK8OrlKEiqw+VHHaG05TtBCXILXhbrx1iG7ynEWPhgY=;
 b=l/yb8u9pnjSeXu61/oz/nKnrkeIXRWL3CCDxzyidXH7tb/BjmD06uYUr
 vccbJmYye9obsXopw/yNYHs1O3GpajPRLnNk7tZf3irEoF904Yh6YWpJ+
 PXsYrAsnr6PTtrSY9BZbcNAEH3Xxdk8oCSRbV/x6lmPvc8FZtXNYUGDl4
 gy0sRg0HlRjBomOCYKGgvjz+gpgntUPW2I/kLjHya5zZrRc6Yu4Wm52hS
 9s2C25PMtBCwArZHon15lAKaRwV/JTAJ8jTqVNyOSShdEWfxDttoXQZRO
 G0vkGZLG6QxEGGem5RUFMXKdNniKmmPP/ZOwZRSb1ZERIbvOG8dR6RL9B A==;
X-CSE-ConnectionGUID: YF0a5hl7S9Gh9K5e8LusEA==
X-CSE-MsgGUID: 1SHO1kBKQPu9tP4HfEa5xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99510672"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="99510672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 03:46:48 -0700
X-CSE-ConnectionGUID: OeinL4AdQueJxeugFarH+Q==
X-CSE-MsgGUID: 1Xp1RhnVQt+MKf9+8tkYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="273838322"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.122])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 03:46:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon
 Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t v4 8/8] lib/igt_kms: add macros to iterate color
 pipelines and colorops
In-Reply-To: <e5b8ae16-8e8c-4c78-a92b-96223a386e6e@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260817150749.66509-1-mwen@igalia.com>
 <20260817150749.66509-9-mwen@igalia.com>
 <ac3bce062c3fc16a78aa561c300b5c3af6496b11@intel.com>
 <e5b8ae16-8e8c-4c78-a92b-96223a386e6e@igalia.com>
Date: Thu, 03 Sep 2026 13:46:40 +0300
Message-ID: <735141716afc883efc30e245414243905aa768cc@intel.com>
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

On Wed, 02 Sep 2026, Melissa Wen <mwen@igalia.com> wrote:
> I just sent a v5 with different changes :)
> https://lore.kernel.org/igt-dev/20260902180016.303482-1-mwen@igalia.com/
>
> I tried to avoid the loop variable, but the issue is color_pipelines[] is an
> array of pointers, not an array of structs as the other cases you mentioned.
> So &(plane)->color_pipelines[0] is an igt_colorop_t** and the pointer walk
> means a double pointer iterator, and even if I do it, the two macros become
> inconsistent so I couldn't combine them anymore.
>
> What I did was using igt_unique() to guard the macro iterator in any 
> expansion
> context, as in for_each_format_and_modifier and related macros.
>
> Regarding the igt_colorop_next() comments, I started to store the next
> pointer in the igt colorop struct as this is immutable, and it makes
> most of problems disappear.
>
> Does it sound sensible?

Yes, thanks for doing this. I had one nitpick, but the overall approach
seems fine.

BR,
Jani.


-- 
Jani Nikula, Intel
