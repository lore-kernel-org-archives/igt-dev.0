Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B367BCD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5316610E3F7;
	Thu, 11 Apr 2024 12:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkRDBBi2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220F10E3F7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838263; x=1744374263;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=W7oRF5WNJe85bSs7AFW4eEyudLd5j58lT5zFqaCasN4=;
 b=HkRDBBi20uBMfBXTfBXdJoNQfbqpjv5SZI78haYXVULg9IlOpMK7lG/Z
 VZeCwICnmNorFWKSh8s6vyVSHEEdhsSEADBYTGIBn43j71bBjquNlMcug
 M43SNOfTY/e73TRZ8jEh5duR9C9cjzfWjhLmlAMvkBPs14Wp6iA5B5waL
 Qo00CltybtZABRRiHw97xs1ylZAr9Ys4asJVXKGYW2mBrpdhQ7sVCJX1o
 JdhwRmqEFY1xm3EEsrVxJKWlLdzCgENXkxk1X5UF7JkbmcmVX64QRSR9Z
 os8vYTfCx2a4Pcge4iOt6/uO+gzsScLFkJlAJLhqWKsukjFa8K/c5J8bd Q==;
X-CSE-ConnectionGUID: DC4ot/sISeS58X4Upnp04A==
X-CSE-MsgGUID: ihT1lzweSjub9OBo6iZiEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8101019"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8101019"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:24:22 -0700
X-CSE-ConnectionGUID: Qt6W8ZZ6RX+4wzBIMQle9g==
X-CSE-MsgGUID: 2RUVShzVTkW7VA7hAUOHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25395743"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:24:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/13] tools/intel_vbt_decode: Print the block min
 size
In-Reply-To: <20240322204125.17212-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-5-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:24:18 +0300
Message-ID: <878r1k6qa5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Print out our idea of the minimum size for each block. Can be
> helpful in determining if we're potentially decoding stuff
> that's not really present.

Feels like min size is slightly misleading, but that's how it's referred
to in code, so *shrug*

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 1d1ba46db6e7..ead3dd6450e9 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2672,8 +2672,8 @@ static bool dump_section(struct context *context, i=
nt section_id)
>  		}
>  	}
>=20=20
> -	printf("BDB block %d (%d bytes) - %s%s:\n",
> -	       block->id, block->size,
> +	printf("BDB block %d (%d bytes, min %zu bytes) - %s%s:\n",
> +	       block->id, block->size, block_min_size(context, block->id),
>  	       dumper ? dumper->name : "Unknown",
>  	       dumper && !dumper->dump ? ", no decoding available" : "");

--=20
Jani Nikula, Intel
