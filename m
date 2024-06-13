Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381C8C27C75
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D13610E04C;
	Thu, 13 Jun 2024 09:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2vlHCjb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B684F10E04C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270091; x=1749806091;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=I3CjXjPEnFMXsRfUzZD6jdBRCOhPU8zs8+L+fRQ7tsQ=;
 b=V2vlHCjb1DeElR0KyDGCNvAF+GYtqo0HQqqk8GErGYu9cuIKLGNiFBLu
 UuWBoSOlfcfcG+6dqrgNjtWYLp1MeV9KqP2jcfH1wwxXFt8IGCyIltEEh
 eWH2UQLjiPzfYd6xBAdPi/qrFi9ZnT9UAUZk/NGnpVnaaxNh9pRWXTA+r
 HRAhphy2YGPMiNtxqda6W7OM1+8YQtX7PVrhQE5OkGGhyMCrbQWAOpqfu
 PqFZwdegebA+4qjcJ7W3Ze4c8ZiULjONpbcx3s5DVadIJQbK9Ap1OcYcD
 wedXmOMQhRv+tWRIIW1+VkChR8i8y29Svn+rO45Ze5CMAxa+HcdUocPgR g==;
X-CSE-ConnectionGUID: K34AXCdXTnGEmXd0oRRZyg==
X-CSE-MsgGUID: 9TqXAykrTCWRVOpqT80NBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15231309"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15231309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:14:51 -0700
X-CSE-ConnectionGUID: FXqkezcPRKKNnmvfbwzTYA==
X-CSE-MsgGUID: UflnVM8XT8WnXjajflyPdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40781045"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:14:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/27] tools/intel_vbt_decode: Decode block 3
 (Display Toggle Option)
In-Reply-To: <20240607135758.31421-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
 <20240607135758.31421-5-ville.syrjala@linux.intel.com>
Date: Thu, 13 Jun 2024 12:14:45 +0300
Message-ID: <87o785i4qi.fsf@intel.com>
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

On Fri, 07 Jun 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Decode VBT block 3 (Display Toggle Option).
>
> On ALM the block appears to contain some kind of actual toggle
> list of child devices, on all more modern machines it just has
> the feature bits.
>
> Example output from ALM:
> BDB block 3 (27 bytes, min 3 bytes) - Display toggle option block:
>         0000: 03 1b 00 00 0c 00 08 00  01 00 09 00 02 00 00 00
>         0010: 00 00 00 00 00 00 00 00  00 00 00 00 00 00
>
>         Feature bits: 0x00
>         Num entries: 12
>         Toggle list #1: LFP1 (0x0008)
>         Toggle list #2: CRT (0x0001)
>         Toggle list #3: CRT,LFP1 (0x0009)
>         Toggle list #4: TV (0x0002)
>         Toggle list #5: none (0x0000)
>         Toggle list #6: none (0x0000)
>         Toggle list #7: none (0x0000)
>         Toggle list #8: none (0x0000)
>         Toggle list #9: none (0x0000)
>         Toggle list #10: none (0x0000)
>         Toggle list #11: none (0x0000)
>         Toggle list #12: none (0x0000)
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_vbt_decode.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index cee1d5196a9a..4281bd7e520e 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -316,6 +316,8 @@ static size_t block_min_size(const struct context *co=
ntext, int section_id)
>  		return sizeof(struct bdb_general_features);
>  	case BDB_GENERAL_DEFINITIONS:
>  		return sizeof(struct bdb_general_definitions);
> +	case BDB_DISPLAY_TOGGLE:
> +		return sizeof(struct bdb_display_toggle);
>  	case BDB_PSR:
>  		return sizeof(struct bdb_psr);
>  	case BDB_CHILD_DEVICE_TABLE:
> @@ -1249,6 +1251,20 @@ static void dump_general_definitions(struct contex=
t *context,
>  			   child_dev_num, defs->child_dev_size);
>  }
>=20=20
> +static void dump_display_toggle(struct context *context,
> +				const struct bdb_block *block)
> +{
> +	const struct bdb_display_toggle *t =3D block_data(block);
> +
> +	printf("\tFeature bits: 0x%02x\n", t->feature_bits);
> +	printf("\tNum entries: %d\n", t->num_entries);
> +
> +	for (int i =3D 0 ; i < t->num_entries; i++)

Superfluous space before ; there. Seems to have been copy-pasted to a
few patches in the series.

> +		printf("\tToggle list #%d: %s (0x%04x)\n",
> +		       i+1, child_device_handle(context, t->list[i]),
> +		       t->list[i]);
> +}
> +
>  static void dump_legacy_child_devices(struct context *context,
>  				      const struct bdb_block *block)
>  {
> @@ -2727,6 +2743,11 @@ struct dumper dumpers[] =3D {
>  		.name =3D "General definitions block",
>  		.dump =3D dump_general_definitions,
>  	},
> +	{
> +		.id =3D BDB_DISPLAY_TOGGLE,
> +		.name =3D "Display toggle option block",
> +		.dump =3D dump_display_toggle,
> +	},
>  	{
>  		.id =3D BDB_PSR,
>  		.min_bdb_version =3D 165,

--=20
Jani Nikula, Intel
