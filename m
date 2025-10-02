Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDFDCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E436A10E38D;
	Thu,  2 Oct 2025 19:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGHd+nlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E564810E38D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434851; x=1790970851;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=6HRsWpHL+/u6SSHrp/TlMqCNeI8+YMXIzHcZ6TQytLs=;
 b=KGHd+nlAiAdFwrl/4vyDZms5ZdPqwqRz3mvf5u9Hgu8eERkKXia+98lW
 eCKYncmnRks/QDFxE71jl6KSZnfrfMf8eAOXlTpG8J7aLKlM2s2T9mziD
 irkxc8ZbvM9R5daaIhM7ftlI0xarLyQmukhPomjs1Bp2zRfCKF6MKpPGo
 Ej1hA6A96tUsmFGddJpCeufESomFw7AmkYRX4chy6Fh8RsiyLLIiaarCa
 20F5CsXvBCPJL/v/4J8Q81Ny7SwfEJ2xWZ+fkKJlILHXmpf65VjETLC+k
 MiahcuJ6Uwrok/WQ5LAih0aPOyg6kSUaSs4Q1bfDp5R0XRGqUhspOvW9m A==;
X-CSE-ConnectionGUID: FRDL5q9vTFe3cfRd2GKI4w==
X-CSE-MsgGUID: ydp6ZouKROW4or+t/JJeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61437317"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61437317"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:10 -0700
X-CSE-ConnectionGUID: xJGdieUxSI+lHAZxxCEtZw==
X-CSE-MsgGUID: 3tjVAxEGRKSihvRARYiRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="184413033"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:09 -0700
Date: Thu, 2 Oct 2025 21:54:07 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/7] tools/intel_display_poller: Fix long opts
In-Reply-To: <20250922160950.27250-3-ville.syrjala@linux.intel.com>
Message-ID: <254536f4-6be1-80ff-d87d-b8671f2d7bd1@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-764336283-1759404678=:1357965"
Content-ID: <cd832867-94b1-6e3c-02c5-575f74bbedc0@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-764336283-1759404678=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <9da114e0-fa70-5c77-8b77-3793ae0be47b@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Fix the long option handling by providing a .val for each that
> matches the short option.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
> tools/intel_display_poller.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 6089be3f1ffa..69906d557a37 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -1352,14 +1352,14 @@ int main(int argc, char *argv[])
>
> 	for (;;) {
> 		static const struct option long_options[] = {
> -			{ .name = "test", .has_arg = required_argument, },
> -			{ .name = "pipe", .has_arg = required_argument, },
> -			{ .name = "bit", .has_arg = required_argument, },
> -			{ .name = "line", .has_arg = required_argument, },
> -			{ .name = "fuzz", .has_arg = required_argument, },
> -			{ .name = "pixel", .has_arg = no_argument, },
> -			{ .name = "async", .has_arg = no_argument, },
> -			{ .name = "vrr-push", .has_arg = required_argument, },
> +			{ .name = "test", .has_arg = required_argument, .val = 't', },
> +			{ .name = "pipe", .has_arg = required_argument, .val = 'b', },

I'm unsure about this since I can't find the definition for struct
option, but shouldn't be here a .val = 'p'? Seems like it will clash
with --bit option. Otherwise,

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

> +			{ .name = "bit", .has_arg = required_argument, .val = 'b', },
> +			{ .name = "line", .has_arg = required_argument, .val = 'l', },
> +			{ .name = "fuzz", .has_arg = required_argument, .val = 'f', },
> +			{ .name = "pixel", .has_arg = no_argument, .val = 'x', },
> +			{ .name = "async", .has_arg = no_argument, .val = 'a', },
> +			{ .name = "vrr-push", .has_arg = required_argument, .val = 'v', },
> 			{ },
> 		};
>
> -- 
> 2.49.1
>
>

BR,
Micha³
--8323329-764336283-1759404678=:1357965--
