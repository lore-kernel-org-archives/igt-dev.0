Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C43C83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 11:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D57C10E042;
	Wed, 16 Jul 2025 11:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3RmMFq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1847510E042
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752666532; x=1784202532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5prjbknHLpkwHZmYYHSN11N5/62SZEppZINpIkrdyFc=;
 b=I3RmMFq9sIs9iZcf4RqF72di29tVyxDqjIcE2/9+dCHJnPs3MyH2+lKB
 EuL1S7/EpQMeJ4xG4tB09bZyORZvJoj/Zm4ThWNUPlKWGOOX6afSxT5Jk
 m9lB/oXVs0gvmlxRmqJXYWCs5KMhBkRbRZ556QY/seOnl9z+X/RmOMMy9
 P6Ir4eJhqrz2rOh0E7DYBwkQbtQxjemEv5IlL1tPScYVzPTgl6fVYNocc
 ou8X/jTtfF8PXv5j6JlHr72VwUjPzRGpw3HePoaYXX89NexwVS1v+5hRC
 VY/661h+rvFS7V3xwh2nJ5AYLz2Zqh7VlDmQzSaI0d0KEYGF3hW0+bH0n A==;
X-CSE-ConnectionGUID: EV8DzUT9SxSAqBsyjZmjDQ==
X-CSE-MsgGUID: uHVUxirrRoKlW7DAlpAUVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72480672"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="72480672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 04:48:51 -0700
X-CSE-ConnectionGUID: XnS0gt2qT3CCS/8kRB6bXw==
X-CSE-MsgGUID: p3c/PUfFTaK8s2t9PqoWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="158035280"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 04:48:50 -0700
Date: Wed, 16 Jul 2025 13:48:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH] scripts/igt_doc: fix a deprecation warning
Message-ID: <20250716114847.duqdf32rsxdepbea@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
References: <20250715162436.130710-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715162436.130710-1-michael.j.ruhl@intel.com>
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

Hi Michael,
On 2025-07-15 at 12:24:36 -0400, Michael J. Ruhl wrote:
> The regular expression usage has count as the third parameter,
> which results in this error message:
> 
> DeprecationWarning: 'count' is passed as positional argument
> 
> So the current usage incorrectly uses the flag value as a count.
> 
> Specify the parameter name to get the correct usage.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thank you, I already merged it but please see one nit below.

> ---
>  scripts/igt_doc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index fa2c2c7ca..3a37a9701 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -37,7 +37,7 @@ class IgtTestList(TestList):
>                  run_type = "other"
>              else:
>                  for driver in self.drivers:
> -                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, re.IGNORECASE)
> +                    result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, flags = re.IGNORECASE)

According to Python doc, there should be also count=0:

result = re.sub(r"^" + driver + r"[\W_]*", "", run_type, count = 0, flags = re.IGNORECASE)

Please see: https://docs.python.org/3/library/re.html#re.sub

Regards,
Kamil

>                      if result != run_type:
>                          driver_set = set([driver])
>                          run_type = result
> -- 
> 2.50.0
> 
