Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175D2EDB7C2
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 07:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAD010E35E;
	Tue,  7 Apr 2026 07:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LU77K8/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E44210E35B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775547947; x=1807083947;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uWOO1m/6Kg/oXdx8SDumI7vXKxaysbHc6QXH4+N8B/s=;
 b=LU77K8/oPveBB1Bfrblmm65qB3lFVcelj0uy6DTilQDHMua1NV1buoC/
 sYKjvezkb9T93hsApOTzfK0ShAhRXl/xH79VUq+rhlN3fwQyZ4Hb1vTIu
 Q794pC2EqHLIY93YUGXCjqANr1Fa52SO7n5qgeF3zmB32ojhsWtmc9aqw
 ajSCRWZ0j3BFQ6pfzWoGhNrE9SRDQYBkwl9G06OlEg9QvW0Tpmg9hMP+P
 Rg2K6PR33AXz4+KL6HZxMlxBvKawcaSFfAD7DUIyJNxlcayNjtDeEJOGG
 FXWqYkBHszGg2XqsWaAeU17CyJeEmgfSbzzho7kfB96tpJtTD6kH1BVF4 Q==;
X-CSE-ConnectionGUID: +jJ6IPH+QomAO/rxfJzAMQ==
X-CSE-MsgGUID: g5lM/7+dSEGP3LbOJFqZ0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76219275"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76219275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:45:46 -0700
X-CSE-ConnectionGUID: e2o50yvnQImPl0mnpbd4lw==
X-CSE-MsgGUID: 6SoMtorcSdq9T3yWRnArHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228037111"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:45:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Soham Purkait <soham.purkait@intel.com>, igt-dev@lists.freedesktop.org,
 riana.tauro@intel.com, badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: Re: [PATCH i-g-t v10 1/5] tools: Rename tools/gputop to
 tools/gputop.src
In-Reply-To: <20260406060428.2734117-2-soham.purkait@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260406060428.2734117-1-soham.purkait@intel.com>
 <20260406060428.2734117-2-soham.purkait@intel.com>
Date: Tue, 07 Apr 2026 10:45:38 +0300
Message-ID: <1c5675497486819dfd4190c421ae424a9af99df6@intel.com>
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

On Mon, 06 Apr 2026, Soham Purkait <soham.purkait@intel.com> wrote:
> The GPUTOP source directory is renamed to gputop.src
> under tools/ path.

Why? The #1 question the commit message should answer.


-- 
Jani Nikula, Intel
