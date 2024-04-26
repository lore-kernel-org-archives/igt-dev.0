Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0EC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 07:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DAC11223D;
	Fri, 26 Apr 2024 07:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iv0O9LKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43311223D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 07:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714116352; x=1745652352;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYGk30eKYXqwm+xBuVZLRjHlkd409dJ4Rk5v8AJ7KJE=;
 b=iv0O9LKrPaRO4MdFpvN75VISvTdUJF58BNZ3PH4Wg3+2TROv4qP9CGn0
 525fUkVWlXa60MT6xruVajufO4L16wMQK6dIXxe7od1dJ+ZKLi6EJ0gV4
 6CTomgokWkJa/L2WjBwi/wyz/OFU5THXFSosK0+ereVRMc0M9brC77PVa
 ZMlaWuH0VgSb2oGuHRnvi0irADex4/LFXE72SUWSih0SHKo90srFzP60f
 3Np+A7Gt5cXdG2Y0UDco2Hsx0o6EUMEiRe+WqPjbxZhbE4Ku+ubOzwE4T
 KGk2GavppWAL3J904xN2ddeh7imKyVDNuvMzSp14/psjaJaP2q+1JwtTM w==;
X-CSE-ConnectionGUID: PyHIJgdTSvS74kqiQlRMRg==
X-CSE-MsgGUID: kZtd7iiSSeC/aCa7gyTBeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9957052"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9957052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:25:51 -0700
X-CSE-ConnectionGUID: 0Ch+JWwCSZaTPlGs0chnJw==
X-CSE-MsgGUID: QbeACApdT2iEsCwUptighQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="30140981"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:25:51 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A1D3B20B5739;
 Fri, 26 Apr 2024 00:25:48 -0700 (PDT)
Date: Fri, 26 Apr 2024 09:25:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, Aditya Chauhan
 <aditya.chauhan@intel.com>, Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: Re: [PATCH i-g-t v2 00/16] Introduce Mega feature to Xe and i915 tests
Message-ID: <20240426092545.1b2e344c@maurocar-mobl2>
In-Reply-To: <20240425172913.vjbvnyfgtie4dueq@kamilkon-DESK.igk.intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
 <20240425173605.7a701d61@maurocar-mobl2>
 <20240425172913.vjbvnyfgtie4dueq@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 25 Apr 2024 19:29:13 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> > - for i915:
> > 
> > WARNING: feature CMD submission has multiple parents: None and Infrastructure
> > WARNING: feature CMD submission has multiple hierarchical levels: 1 and 2  
> 
> 'None' here and below looks a little strange.

Indeed. I'll take a better look on how such warning was generated.

Regards,
Mauro
