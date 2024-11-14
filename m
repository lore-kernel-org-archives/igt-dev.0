Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CEED65C67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 09:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5410E0D1;
	Thu, 14 Nov 2024 09:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGUR5Wnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21AF10E0D1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731577531; x=1763113531;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xonz76Ut2Jo19dD5W4pgpixAPMjCdjQmSk7ETt5BeNs=;
 b=GGUR5WnuvfcPFnNHg6Q25Ao73f5JH2dxphba2zHVxOUt6/IKrtQ1oCIl
 +D1m+eaBPLuuzjC66325MRunmKHhcuZbAc6mz+asvmpzR8PR7iR+Csa+F
 Q/wcJP1fXSzyRUm7XMcgpCGR5sncJ/qDof5+Jn15rELvMF2kOx9aosJdN
 qgng5A6rZzsr4eExjjeqNuEmmEqdw8esdleyc6OqlxSyAdE+sSSls1QOI
 f56bo9N/REWYrDf5fQ4ZcESs+wBnpP1qrDeznRnnylF6F5cNcph5AVP80
 VBI1OWOBfm5u1dD/UxIkwITBc9XGhUnYhCUcvieKUGk6JOu1SgprhBpqm A==;
X-CSE-ConnectionGUID: E0PRz+APR/OeM/PrWSmn9g==
X-CSE-MsgGUID: V4Y0UyeIRyyjmH5hZmFZAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="54045401"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="54045401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 01:45:31 -0800
X-CSE-ConnectionGUID: hQzl3edVREiu6uFyJvq+ug==
X-CSE-MsgGUID: 2gHFQaCWQl+mCMO0fGDlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="93203009"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.240])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 01:45:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 igt-dev@lists.freedesktop.org, clinton.a.taylor@intel.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
In-Reply-To: <d3sktr4lrwy6cvec4h276dz2fi5slvlex5dklzgafqwl57vqbr@aeugx5broaje>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <874j4if2mb.fsf@intel.com>
 <lkiuylps7ka6qbno3gjtpkjbvu6dxpbkjw6725cri35coysxcz@yfcafnu4oguh>
 <87wmhacf50.fsf@intel.com>
 <d3sktr4lrwy6cvec4h276dz2fi5slvlex5dklzgafqwl57vqbr@aeugx5broaje>
Date: Thu, 14 Nov 2024 11:45:25 +0200
Message-ID: <878qtmb13e.fsf@intel.com>
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

On Wed, 13 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> ugh... I rather think we need to have a query or some identifier to
> allow userspace to have these decisions rather than splitting the PCI
> IDs.

Yes, i.e. proper UAPI.

BR,
Jani.

-- 
Jani Nikula, Intel
