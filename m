Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A18CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7114A10F07C;
	Thu, 11 Apr 2024 12:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RP4U5mTq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8410F082
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838146; x=1744374146;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=4YZ1fgQSSiEQofO6AXXWRhtInBFWsAB3cyvXfN2NOJ4=;
 b=RP4U5mTq8+WjROwP3pvDttozMZ6t/XH02MFKuF88ouDKD85mZiyH+R/4
 /nZWT0INrCzxnxKptir/r+aMHhekSCRBLBbbznqvgC4TLmqEfTyCg6uuP
 jyOZ1R7TpFIXfe3D1z++1Rffa6dwMf011gnfY2cGvxddJKK/0qWJBWUa/
 3hMk4zI9urQ5ugwkqRRiIm1YRxeiroO3MsVtq1+LEEIg8cKJhuAIELoZJ
 nP3BzsPg2FGsE0HCZS7exUNmPurj8pBcdwzeLYawmQO/aVLWkfeizY/yM
 QeigB2ebN19SmU4YL1ZfwSf/4ADObQt3dUt/kl3O4Q9cNPPc+FBakEPi7 w==;
X-CSE-ConnectionGUID: vbgWqPjfT3yJUoOCDefI7Q==
X-CSE-MsgGUID: zwdx/Nx6Q6+ewUe/AvHV0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8100795"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8100795"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:22:25 -0700
X-CSE-ConnectionGUID: PQewsSx6SNud+KFTXdRE8A==
X-CSE-MsgGUID: tD4MVnMhRlSJmDe/w/TWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20787347"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:22:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/13] tools/intel_vbt_decode: Allow blocks to be
 named without full decoding
In-Reply-To: <20240322204125.17212-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-4-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 15:22:21 +0300
Message-ID: <87bk6g6qde.fsf@intel.com>
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
> Make it possible to give blocks a name without having to
> implement full decoding.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Good idea!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index b7cd2b3bfa69..1d1ba46db6e7 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2672,11 +2672,10 @@ static bool dump_section(struct context *context,=
 int section_id)
>  		}
>  	}
>=20=20
> -	if (dumper && dumper->name)
> -		printf("BDB block %d (%d bytes) - %s:\n", block->id, block->size, dump=
er->name);
> -	else
> -		printf("BDB block %d (%d bytes) - Unknown, no decoding available:\n",
> -		       block->id, block->size);
> +	printf("BDB block %d (%d bytes) - %s%s:\n",
> +	       block->id, block->size,
> +	       dumper ? dumper->name : "Unknown",
> +	       dumper && !dumper->dump ? ", no decoding available" : "");
>=20=20
>  	if (context->hexdump)
>  		hex_dump_block(block);

--=20
Jani Nikula, Intel
