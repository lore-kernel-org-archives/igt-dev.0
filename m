Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF68E7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 14:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3082910EE87;
	Thu,  5 Dec 2024 14:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3qBIGdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9D10EE87
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733409432; x=1764945432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GRx28ibIyc2Z5OkY9b5LbODUP9z8IvyRuyekZV8lA8g=;
 b=c3qBIGdSJe3G+pxkcg+1pjRqTq6KT4TS0HonU8ooURgB3TDWWNNuI3Wz
 Oz9652yeKeK2vDLPfTwaUoM1XmyeXymf4H/BmMRhMQbT3JMYflYAZtzqp
 9wgyMOc0hMfnTBVA4W0lvSY+ExVRzsIjsglPnWggX/TzFrY25nBBXaXfI
 T/4laQtjD4MWYf5ENzM7oLrRUSLHNmcWQMX0laJ6SYKpGvyF2icr/T3QE
 bKcf/oq8OIT3uCPqwNk6E6T5a8ar7Ih4CUsSPD2BTuCfWoKJSD5hSKNvM
 Hye7butxXfroSibC1yEtFPjwigqSXv7O9nGhLXK7ST8tblHA7jpSYxSWf Q==;
X-CSE-ConnectionGUID: aV8PJ2LNQISgNopyy3ziIQ==
X-CSE-MsgGUID: N4LykoZwSsWNKInRjc9ePQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33639942"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33639942"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:37:12 -0800
X-CSE-ConnectionGUID: 0gUzNOqxRm2TlA9cQ1K3cg==
X-CSE-MsgGUID: iUD4ajwyTt6pi1UCuyw2RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94587608"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:37:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again
Date: Thu,  5 Dec 2024 06:36:22 -0800
Message-ID: <173340930937.3402771.11812401822016192248.b4-ty@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030234908.858018-1-lucas.demarchi@intel.com>
References: <20241030234908.858018-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 30 Oct 2024 16:49:08 -0700, Lucas De Marchi wrote:
> Just like done in commit 93ad5b785ea0 ("lib/igt_kmod: stop using
> KMOD_REMOVE_FORCE"). From igt perspective, if a module can't be removed,
> forcing its removal is not the right thing to do: the test should just
> fail and be fixed.
> 
> If the kernel actually enforces KMOD_REMOVE_FORCE, then it would just
> taint and all tests get aborted. Lastly, our kernel config doesn't have
> CONFIG_MODULE_FORCE_UNLOAD set, so this is pointless for multiple times.
> 
> [...]

Applied, thanks for the review.

[1/1] lib/igt_kmod: stop using KMOD_REMOVE_FORCE, again
      commit: b0c59bb94e6c990589eb6825c1436ce412804dae

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
