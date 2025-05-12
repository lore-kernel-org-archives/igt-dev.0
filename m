Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B63C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 14:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5910E19E;
	Mon, 12 May 2025 14:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kb/snUYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A5F10E19E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747058868; x=1778594868;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tNcX8sPPX3ekDq/J5WtSYYEJzsjdVqziedTmoZYfbqQ=;
 b=kb/snUYJL/sVbl44dO9y5dXucvmTkLos0sWO8KraWS4bi2Ui/7R7AFN3
 BT6luKCbydW7mckX8RFUnrLvTSEb6CNwgh8o+H89/qTTg1Btwu7uXYd2v
 X7qU47SQqE0ncCfXE2dIIqj0sTxM8WQD1f4xt//OshdRIbLzrE7I2FmFK
 isxcZe0OTvkHEbnJXqAO8A6u7311X4MvIe8BfyWso1DDDVyTVEX0Wb94R
 +7pY6EyYbNQY8Kux8B3nEZVtBaDACm3RU2T13xXylwb6rzIzxNugtE5bF
 2sct7zK6yIRAsBs9PE70HCW13yDgESOJWz6ElXKOqSUDRW3iZxgfFCVUY A==;
X-CSE-ConnectionGUID: t0lda5SpS6GGxWQxalHZqg==
X-CSE-MsgGUID: yq032M9eQwui1d5CE07V4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48724674"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48724674"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:07:48 -0700
X-CSE-ConnectionGUID: vgdwdhipTS60nJW0cRVWdQ==
X-CSE-MsgGUID: p1d501aySTuyo/gbIX/Waw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137887240"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:07:47 -0700
Message-ID: <f85d872e-5e93-4284-b096-03b489fc6885@linux.intel.com>
Date: Mon, 12 May 2025 16:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add explanation how to run CI
 locally
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
References: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
 <20250430163354.178254-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250430163354.178254-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 4/30/2025 6:33 PM, Kamil Konieczny wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Currently, the CI runs only after a merge happens. To avoid reverts
> because of error in some configurations, add an explanation how to
> run it locally with a new file .gitlab-ci-local.yml
> 
> This is basing on a project available here:
> https://github.com/firecow/gitlab-ci-local
> 
> v2: fixed description, dropped .gitlab-ci-local (Kamil)
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  CONTRIBUTING.md | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 05bb64bf4..6b305aef6 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -135,6 +135,23 @@ Sending Patches
>    can help our bug-filing team. When replying, you can cut a message after
>    'Known bugs' to keep it in reasonable size.
>  
> +- When pushing a new series, your series will be build-tested by the CI. It is
> +  useful to avoid merging broken stuff. You can run this CI locally by using the
> +  project https://github.com/firecow/gitlab-ci-local
> +  To install it, please refer to its README (on debian, the package
> +  gitlab-ci-local can be used).
> +
> +  To run it locally, you need to build docker images:
> +
> +    docker build . -f Dockerfile.build-fedora -t igt-build-fedora:latest
> +
> +  Now you should be able to run it:
> +
> +    gitlab-ci-local --file .gitlab-ci-local.yml
> +
> +  If you want to run a specific stage, you can add it to the command line:
> +
> +    gitlab-ci-local --file .gitlab-ci-local.yml <stage>


Unfortunately, installing gitlab-ci-local requires adding an untrusted Debian
repository, which is not an option for me. I make it a point not to add
arbitrary Debian repositories solely to install a tool. My expectation is that
the tool should meet the necessary quality and licensing standards to be
included as part of the official Debian or Ubuntu repositories.

That said, there is an alternative approach that works well for me:
running the tool inside a container. Using containerized tools with the
local filesystem is straightforward and avoids the need for untrusted
repositories on my Linux desktop.

With this in mind, I’d like to kindly request the following changes:
1. Include gitlab-ci-local in the containers we use for building.
2. Add a simple script to the igt repository to facilitate using gitlab-ci-local
directly from the container. I’m happy to assist with this if needed, just let
me know!

Thank you for your understanding and consideration of this request.

Best regards,

Peter
