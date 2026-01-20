Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54906D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 11:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A6910E5C8;
	Tue, 20 Jan 2026 11:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGuFBNSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA3A10E5B9
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768906846; x=1800442846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WxWD4Nbk9iexRyWzodyZjlljN4N3ugwlrpN0DnyBeQA=;
 b=aGuFBNSXRY4beVtTL69SZuppsqrxDMrsUwoN5/2TCIBsdQt5WcbAe6vJ
 Vs93sKdo3/dTOSNAWsB4XygB+vCaVA5dm8/kuLcCWNCEoZt0v1l9LygU5
 9s3SZIiNCFriZnNXT6REWxHs2/+zBXhz9KZGTc8TOMqqx6qkzJkJzt6F9
 Np+sJNpqZZRxaN4nFP5nk9wdPQz+DtBXpPVgkvKy7O97Po1OAXkzQDpzP
 f6b6q81B1IXU4VHKm1IYBCeoTtWBzAwTHZ+MqPTE5eohHKfG+Kwzyv9kg
 rd1550j84uHIb/TQeg66REGjvfmi8UJcfANzQjxrxZUC42dbSAiDj0Q4w A==;
X-CSE-ConnectionGUID: +ZF7Hj+ATLaCFjPuiFrNMA==
X-CSE-MsgGUID: K3B7aSTWQLalsAKWSOCqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87693072"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="87693072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:00:46 -0800
X-CSE-ConnectionGUID: 8WQTrS2gS0SfM8VZFVIe+A==
X-CSE-MsgGUID: EZI4wlh/THW7k3oOecikLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210583337"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 03:00:44 -0800
Date: Tue, 20 Jan 2026 12:00:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v4 1/6] tools: Rename tools/gputop to
 tools/gputop.src
Message-ID: <20260120110041.tpwooiljcrgmyay5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20260107183739.84597-1-soham.purkait@intel.com>
 <20260107183739.84597-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107183739.84597-2-soham.purkait@intel.com>
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

Hi Soham,
On 2026-01-08 at 00:07:34 +0530, Soham Purkait wrote:
> The GPUTOP source directory is renamed to gputop.src
> under tools/ path and gputop.c under tools/ is also moved
> under tools/gputop.src, to implement engine busyness in
> gputop.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/{ => gputop.src}/gputop.c          | 0
>  tools/{gputop => gputop.src}/utils.c     | 0
>  tools/{gputop => gputop.src}/utils.h     | 0
>  tools/{gputop => gputop.src}/xe_gputop.c | 0
>  tools/{gputop => gputop.src}/xe_gputop.h | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename tools/{ => gputop.src}/gputop.c (100%)
>  rename tools/{gputop => gputop.src}/utils.c (100%)
>  rename tools/{gputop => gputop.src}/utils.h (100%)
>  rename tools/{gputop => gputop.src}/xe_gputop.c (100%)
>  rename tools/{gputop => gputop.src}/xe_gputop.h (100%)
> 

This is good but should be done together with meson.build
change, so after appling only this first patch it should compile.

Please fix compilation.

Regards,
Kamil

> diff --git a/tools/gputop.c b/tools/gputop.src/gputop.c
> similarity index 100%
> rename from tools/gputop.c
> rename to tools/gputop.src/gputop.c
> diff --git a/tools/gputop/utils.c b/tools/gputop.src/utils.c
> similarity index 100%
> rename from tools/gputop/utils.c
> rename to tools/gputop.src/utils.c
> diff --git a/tools/gputop/utils.h b/tools/gputop.src/utils.h
> similarity index 100%
> rename from tools/gputop/utils.h
> rename to tools/gputop.src/utils.h
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop.src/xe_gputop.c
> similarity index 100%
> rename from tools/gputop/xe_gputop.c
> rename to tools/gputop.src/xe_gputop.c
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop.src/xe_gputop.h
> similarity index 100%
> rename from tools/gputop/xe_gputop.h
> rename to tools/gputop.src/xe_gputop.h
> -- 
> 2.34.1
> 
