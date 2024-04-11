Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BEDCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E71110E0A5;
	Thu, 11 Apr 2024 13:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVFokNIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519010E6BB
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712840894; x=1744376894;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=RSMT6rn2ZVSmBERnpByepDltXcdUelm+3y47nfmH9Po=;
 b=MVFokNIZeWWzuvhDT73FTldAK7ClaKkjJhXiJLJpy7gslro7SSOQ4je3
 +8b8uPrHq6wbryD2jv9hbrI7u/yKQCivwtM6fxbI3PdER2xkpjYfast7K
 sLqXE4CPg0WEQrJ7iuSj1M+lrkXEzd5usUeweRBKWT/RyFbPxCfP0yi1y
 S84AYZpEygE9YpvZTWKFrcVH5KQMKw/FxolTFJ8NC0C7J75XytzXP/jyH
 kPme3YDHrzkNn9DqkwPy20MAF3jdWRLc8rESaMVDQMtInLx1l4X8exj17
 JGphda0Bpj+pclBmVMp/kLOOvexLrRSXUE01UHPJL8Rtwnue9nT2bMT5O g==;
X-CSE-ConnectionGUID: sT9/Qw9gRrePVvDgd746dg==
X-CSE-MsgGUID: ffGTq1ZyQBCuPJs22TALIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8410134"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8410134"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:08:13 -0700
X-CSE-ConnectionGUID: 8rD2F3XyTROvLqHdhx910A==
X-CSE-MsgGUID: 1LlFOM1rS/yVQP1A3iGQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25545435"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:08:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 11/13] tools/intel_vbt_decode: Dump MIPI sequences
 in the order they appear in VBT
In-Reply-To: <20240322204125.17212-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-12-ville.syrjala@linux.intel.com>
Date: Thu, 11 Apr 2024 16:08:09 +0300
Message-ID: <87o7ag59om.fsf@intel.com>
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
> Dump the MIPI sequence blocks in the order they appear
> in the VBT (as opposed to being ordered by the sequence type).
>
> This makes it easier to compare the hexdump vs. the decoded
> output, which is what I tend to do occasionally when trying to
> check whether we are decoding things correctly or not.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  tools/intel_vbt_decode.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index b57d1e9602ae..aa15dbb5e3fd 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2446,12 +2446,9 @@ static void dump_mipi_sequence(struct context *con=
text,
>  				fprintf(stderr, "Invalid sequence %u\n", seq_id);
>  				return;
>  			}
> -		}
>=20=20
> -		/* Dump the sequences. Corresponds to sequence execution in kernel. */
> -		for (int j =3D 0; j < ARRAY_SIZE(sequence_ptrs); j++)
> -			if (sequence_ptrs[j])
> -				dump_sequence(sequence_ptrs[j], sequence->version);
> +			dump_sequence(sequence_ptrs[seq_id], sequence->version);
> +		}
>  	}
>  }

--=20
Jani Nikula, Intel
