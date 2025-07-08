Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C20C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 17:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99F310E6B5;
	Tue,  8 Jul 2025 17:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2QVqWzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686F910E6B5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751994176; x=1783530176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hacUiAg0kTalVyp8QHETNR7QkLoQoTRoGt/EockiWDk=;
 b=e2QVqWzDlmKfpEL7+Fl7xiMrLwYn3N3krT/yUqrieqvhkGPDzlPfDrAs
 mbO4A/DElDr084bhoSLr9g8nALh9eFDc6VytMhpJ1Zx9PIAXCudrbSDK1
 9rmhMyyLvGlMLbOYkEs+4WUfq/Bf0EKih2SSJGTnwC6no6n8SgktDhmFL
 jrNk8ZTTGxKTkogHq0fsXp11WzsKT4TNFW+UadTTSL5jnyS4f5lhznqBQ
 KId03pXsXZFJI3ub7zwMI6cKniqfuS01lSnyEzcYMkncyb4H8FUm5Cl/b
 cqopzEREUvYI6F4HBepdh+n12Zi6gipOw7D+TjOqwmNszJ9MeU7NGWhOy A==;
X-CSE-ConnectionGUID: lvQPw7FnQU619c6WEwfkYQ==
X-CSE-MsgGUID: V2HYX4nZQN2nujSaFqTIKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53956267"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53956267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 10:02:56 -0700
X-CSE-ConnectionGUID: H+PK5J83T6SIey9WSc44zA==
X-CSE-MsgGUID: PdHauDF2Tc2/MCjtDyNzZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="155879799"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 10:02:55 -0700
Date: Tue, 8 Jul 2025 19:02:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH] script/test_list: fix a document generator bug
Message-ID: <20250708170252.lbn4olkm7madzcgj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
References: <20250708150207.247795-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708150207.247795-1-michael.j.ruhl@intel.com>
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
On 2025-07-08 at 11:02:07 -0400, Michael J. Ruhl wrote:
> Remove an extra 'f' from the print() function.
> 
> Fixes: b9c6750f935f ("scripts/test_list: Do not stop the build if documentation fails")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Nice catch, thanks!
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 5f1b4218b..cb2fb054c 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1427,7 +1427,7 @@ class TestList:
>                      continue
>  
>                  file_line.rstrip(r"\n")
> -                printf(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
> +                print(f"{fname}:{file_ln + 1}: Warning: unrecognized line. Need to add field at %s?\n\t==> %s" %
>                           (config_origin, file_line))
>  
>      def show_subtests(self, sort_field):
> -- 
> 2.50.0
> 
