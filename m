Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7EDD5D674
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 17:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7480C10E1A1;
	Thu,  7 Nov 2024 17:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LICYkSKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4E210E1A1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731001173; x=1762537173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CwiNe5VJv09RCwYO1LF1YLiZ7I57OpJ9FSpxEvaA4v8=;
 b=LICYkSKvs2yLPZj3OKR7KHe6WnD/MmKWnjCmx8S3mrErVSrDd8jUSqYk
 32t/vKpV64Dwm156/0ZiLUzG26gH/Cq2vDLxxjTDnYaB1/S4F6nP12Mli
 w8JCM4ruY7Iw0fifbHOtAutbEALUEtrCU8IQyGubZLhIRHYmwdqe60Z1Y
 TKmHtDq7qHshnd5QQKrj99rs4ZyqL46PsSZPecbrXEJc+VjF7oYokitBv
 qVtKog7jjNmXtqiIa3gPqSmrqdqJZ1Ci00Zq85LZnwmtmqI8WiL/yS9RI
 bCE3psj+fH9viQdMCW/CGzlkVJwDkPJXorgjTDwRb2kVVB0s6tQ/YhvY5 w==;
X-CSE-ConnectionGUID: WHv4jE7GRyu/ENhFOLArsQ==
X-CSE-MsgGUID: gxWwA/OCQ7OXp7BmgXUieQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30282161"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="30282161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:39:20 -0800
X-CSE-ConnectionGUID: ov5pfSz8SqO7Itr/zDYZnA==
X-CSE-MsgGUID: VY0PE6SNTYWJ6m21SuUttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85499057"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:39:19 -0800
Date: Thu, 7 Nov 2024 18:39:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t v3] igt-runner fact checking
Message-ID: <20241107173917.bbtmmw2xnwtf2ixe@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
References: <0ef870a2-13ff-4984-bd2b-99be32626043@linux.intel.com>
 <086fcdbf-88c9-4f59-b861-ebe134652d2e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <086fcdbf-88c9-4f59-b861-ebe134652d2e@linux.intel.com>
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

Hi Peter,
On 2024-11-07 at 08:30:55 +0100, Peter Senna Tschudin wrote:
> I made changes to the code that broke my own unit testing. The test code is broken, and there is no side effect in the actual code. Happy to learn how unit testing is used by our CI. I will wait for comments and will fix the test for V4.
> 

Could you keep lines up to 80 columns? This is too long for even my
wide monitor...

> The magic command takes about 20 seconds to run locally:
>  $ meson test -C build

In current desktop Ubuntu 24.10 one needs to:

sudo systemctl stop apport.service

then it will run quick.

Regards,
Kamil
> 
> From GitLab.Pipeline:
> 10/441 lib igt_facts                           FAIL     0.43 s (exit status 98)
> 
> 
> 
> [...]
