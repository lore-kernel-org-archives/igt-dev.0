Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62448C54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 11:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035E310F080;
	Mon, 26 Feb 2024 11:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dM2BEXfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914B110F080
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945616; x=1740481616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gVcqtcljzLe4iJUsg8PYKByxksGCwwmVAmMRpGR5RjY=;
 b=dM2BEXfaMS7EsjxQGFLspO4XuLsFQU3pfZHoI4Ci2XZgmkSb20gwGgOy
 mJjxGHDhccaHNh9ZIrVDEpu+KEOKA6n4PO8m3oWzS8687sJB0Bf/0i060
 mp1P4Fdj9mQa6grmh494FhIa3khs8x43rh/weqGdWc0Zhz43jKca1Kqin
 g5kUGZnKda7HXTY85oaC5PDDz9X3aUsF8mDOWnYGoCLfMZSzLnPtlxi3o
 3UEX+NO0A+lRYA1LSb8fxeRUbPDqpML0+MaymD1PY365g1WQEGUP+8FNg
 LpZdDvEJRQ3d7jkTRpD9V6J/WAa80SMEjOqdEJhk3M9YJ0gbHPW8Dsw5Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14657227"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14657227"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="29813006"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 03:06:54 -0800
Date: Mon, 26 Feb 2024 12:06:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v2 4/4] scripts/igt_doc.py: fix intelci testlist
 join logic
Message-ID: <20240226110651.cf2kxrzaz2pv2vqo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
 <20240222114741.196042-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240222114741.196042-5-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-02-22 at 12:45:28 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Joining testlists shall take into account default values for GPUs
> that are defined only on some JSON config files.
> 
> Add a logic to propagate such values.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 2417081b80be..295589c002c6 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -190,10 +190,10 @@ class IntelciTestlist:
>      def __init__(self):
>          self.testlists = {}
>          self.gpu_set = set()
> +        self.default_gpu = "default"
>  
>      def add(self, testlist, gpu_set):
> -        self.gpu_set.update(gpu_set)
> -
> +        # Handle GPUs found at the set to be added
>          for driver, gpus in testlist.items():
>              if driver not in self.testlists:
>                  self.testlists[driver] = {}
> @@ -208,6 +208,26 @@ class IntelciTestlist:
>  
>                      self.testlists[driver][gpu][run_type].update(testlist[driver][gpu][run_type])
>  
> +        # Apply default values to gpus that aren't in common
> +        if self.gpu_set:
> +            not_intersecting_gpus = self.gpu_set.symmetric_difference(gpu_set)
> +
> +            for driver in self.testlists.keys():
> +                for gpu in not_intersecting_gpus:
> +                    if gpu not in self.testlists[driver]:
> +                        self.testlists[driver][gpu] = {}
> +
> +                    for run_type in self.testlists[driver][gpu].keys():
> +                        if run_type not in self.testlists[driver][self.default_gpu]:
> +                            continue
> +
> +                        default_list = self.testlists[driver][self.default_gpu][run_type]
> +
> +                        self.testlists[driver][gpu][run_type].update(default_list)
> +
> +        self.gpu_set.update(gpu_set)
> +
> +
>      def write(self, directory):
>          '''Create testlist directory (if needed) and files'''
>  
> -- 
> 2.43.2
> 
