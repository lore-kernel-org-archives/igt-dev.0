Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01E2CA600B
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 14:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5366010E12B;
	Thu,  8 Oct 2026 14:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQUwZw0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBBB10E12B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791470173; x=1823006173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LzLF0jKBOBlYIOxDOfNGHDpZxML5glMHN1NnkJOASSw=;
 b=PQUwZw0d13zDXClOjgiv2kub/IK66W2PWssNZb0rLRBWeSfvVpkBdAjT
 XzPkjCRTsKR+zoOjKlS7IFieD8bCVJrPFEjXaGJg8rmHWWWCvglc9P2mf
 m9HvvsjGnL7MQI52opGUW+hPgv7LXuhZxwdqAv0z2IP8rcW/CqjK8m6u7
 FGGViNiIjD6ojp8G33ouMiQ5YioqZlZELqWjfYUiNFwEBlb1EYCcCiIsR
 ISLj4BDl9GlSZOKNeYllcGoXkvwatMsJdCpqPMdigStF1nVi7h/gFFRUp
 dWx6oKEjaS8qJ7gXmHvlYMlFzSqzefFCDnYtG/2SqjeWMacoQNykop3Gv A==;
X-CSE-ConnectionGUID: 2aoavcvtRvuaskNONvXnYg==
X-CSE-MsgGUID: pFfilu5UR5aQfjcn4Pgrbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="157499"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="157499"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:36:13 -0700
X-CSE-ConnectionGUID: UNQBmOYqRLWlmBz7zIOuIg==
X-CSE-MsgGUID: gPwhYHbOR+qKBne1nWqnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="384506"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:36:12 -0700
Date: Thu, 8 Oct 2026 16:36:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH 3/4] tests/intel/xe_fault_injection: Avoid backslash
 escapes in dmesg ignore regex
Message-ID: <20261008143609.yl5gfxmudvzwlqw5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-4-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007210603.1350158-4-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-10-07 at 21:06:02 +0000, Shuicheng Lin wrote:
> igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
> /dev/kmsg, which escapes '\' as "\x5c". "\*ERROR\*" therefore turns into
> "\x5c*ERROR\x5c*", i.e. "ERROR" surrounded by optional backslashes,
> which only works by accident and also matches any line containing
> "ERROR". Use "[*]ERROR[*]" so the regex matches what it says.
> 
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 4f4a7922c..772cf29df 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -72,7 +72,7 @@ static void ignore_dmesg_errors_from_dut(const char pci_slot[])
>  	 * Additionally, error-level reports are expected,
>  	 * so ignore these in igt_runner.
>  	 */
> -	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
> +	static const char *store = "probe with driver xe failed with error|[*]ERROR[*]";

Maybe we should add some example dmesg lines in a comment above.
With or without this comment extention,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	char regex[1024];
>  
>  	/* Only block dmesg reports that target the pci slot of the given fd */
> -- 
> 2.43.0
> 
