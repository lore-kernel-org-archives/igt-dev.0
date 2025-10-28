Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930C3CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 14:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3710E0EE;
	Tue, 28 Oct 2025 14:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DG1+sIGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C22D10E0EE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761662200; x=1793198200;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dLudGLAnngsF/UJni8G9X1ZjB0W9HT4zH0I/U4To924=;
 b=DG1+sIGbiFlDDko2zCs1UjLK9Ri+aIdGLfJzmo2pNe3JD0boKqIgWuql
 +fEL0ZeXWAu+MWZllGmW7FyjUsjSW4HriCgKhEJFyweWObZbETqqxg3T3
 XTfVNi/yJWVz+rf79hl3V6gFwRFHQXKGQgVOG0EkGdk26tyVqfP4jI1WF
 caCT3GA+Nl3aOH15EjC/WZOmfsGAhLRPWTH8OqdLFDiiZSOTmMr3/HC3x
 QzKG1wtzmiIVCdqglcyFdl9Qse3ceLvN3VQg3RPVLSTVOXm/RA19aIPIt
 3+GrEF0JoA9V+cEUBbcz+/dqadM2TC1W+TQRWjRBZJsWnVvcVoxOQMJow Q==;
X-CSE-ConnectionGUID: PLR071j5SbuN3Ls8scMmfA==
X-CSE-MsgGUID: +wVAWM/2QnSVd8wSs7rvMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62792818"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62792818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:36:40 -0700
X-CSE-ConnectionGUID: BJep0qW1S8CWG38xmMW6sQ==
X-CSE-MsgGUID: DDLJU8eUSZmXl6ZPc/TDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216019956"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:36:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
In-Reply-To: <e50339ef85b308fb2b6fd8d88f3acf4fc5bd0057@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
 <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
 <e50339ef85b308fb2b6fd8d88f3acf4fc5bd0057@intel.com>
Date: Tue, 28 Oct 2025 16:36:34 +0200
Message-ID: <d43d1cadf1eb3b0a07a12da4c48a3cabc33f57eb@intel.com>
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

On Tue, 28 Oct 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> This is the script I've used, but never bothered to upstream to igt.

PS. I've got a similar script for intel_vbt_defs.h.

-- 
Jani Nikula, Intel
