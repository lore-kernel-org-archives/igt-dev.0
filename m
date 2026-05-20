Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FED9CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C2710E0E1;
	Wed, 20 May 2026 09:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUso4aHH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCB510EFAF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779270875; x=1810806875;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BOJLCaSSTmvX4pYHv8eK2VZR4v0mYVQCGphqE7UFgOs=;
 b=BUso4aHHTIIq3zGq6J0DOcNoIaX9MAoa86dgDJE7zgIWUdovxwCXlffY
 6bb+5G7umY1R7foTOZCoQiW52g90MTcVAbomFJp11hnHzTxpyCi1/06Ss
 OnepNJa/BLyotjmyPOiZ6RYZGeOTPjIiwuCcfUGZuvcYJilDjRFns/3Nr
 4VrgSTMDQQprXeql8eli2wsHqdG4PFcd23XwRBpskbgDozF6o5UrWhLrc
 qOR9zr/SF96QPIWfFvY9WBMAM4pObscUlBZ2ENpt79GtmAh90jLdKmtGM
 N5kW9582Dw/2zNkPb9C+eC8LDYWDG9CFyriK3gyYIwEWf1oWhsQffTo7P A==;
X-CSE-ConnectionGUID: bAVnfbiERBmEtUhJlxCLrw==
X-CSE-MsgGUID: i5824AtOStGHadj9wGlwAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80015902"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80015902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:54:34 -0700
X-CSE-ConnectionGUID: j8u3lWJxQNa8hMRL8ulXlw==
X-CSE-MsgGUID: aTYOUxMWQZWzszI1iPoO6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245097116"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:54:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v1 5/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for LT
In-Reply-To: <20260507012821.527453-6-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260507012821.527453-1-michal.grzelak@intel.com>
 <20260507012821.527453-6-michal.grzelak@intel.com>
Date: Wed, 20 May 2026 12:54:29 +0300
Message-ID: <3beb3bc84b4a3aa7cd7903906900ec093e3f44ab@intel.com>
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

On Thu, 07 May 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Dump VBT #57 tables for LT. Add a table of strings to store each table
> purpose. Show the affected modes on dumping.
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tools/intel_vbt_decode.c | 44 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index f7ba4bc3d5..6e5fd73473 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -3469,27 +3469,55 @@ static const char * const vspeo_levels[16] =3D {
>  	"N/A  ",
>  };
>=20=20
> -static void dump_vswing_preemphasis(struct context *context,
> -				    const struct bdb_block *block)
> +static const char * const vspeo_lt_tables[6] =3D {
> +	"UNUSED",
> +	"UNUSED",
> +	"UNUSED",
> +	"UNUSED",
> +	"DP 1.4",
> +	"DP 2.1",
> +};
> +
> +static void dump_vspeo_lt(const struct bdb_vswing_preemph *vspeo)
>  {
> -	const struct bdb_vswing_preemph *vspeo =3D block_data(block);
> +	const unsigned int *tables =3D vspeo->tables;
> +	const unsigned int *vals;
> +	int num_rows =3D 16;
> +	size_t offset =3D 0;
>=20=20
>  	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
>  	printf("\tNumber of columns: %d\n", vspeo->num_columns);
> +	printf("\tNumber of rows: %d\n", num-rows);
> +	printf("\tPhy type: LT\n");
>=20=20
>  	for (int idx =3D 0; idx < vspeo->num_tables; idx++) {
> -		printf("\tVswing Table #%d:\n", idx+1);
> +		printf("\tVswing Table #%d (%s):\n", idx+1, vspeo_lt_tables[idx]);
> +		for (int row =3D 0; row < num_rows; row++) {
> +			vals =3D &tables[offset];
>=20=20
> -		for (int row =3D 0; row < 10; row++) {
>  			printf("\t\t%s: ", vspeo_levels[row]);
> +			printf("main-cursor: 0x%08x, ", vals[0]);
> +			printf("pre-cursor: 0x%08x, ", vals[1]);
> +			printf("post-cursor: 0x%08x\n", vals[2]);
>=20=20
> -			for (int col =3D 0; col < vspeo->num_columns; col++)
> -				printf(" 0x%08x", vspeo->tables[idx * 10 * vspeo->num_columns + row =
* col]);
> -			printf("\n");
> +			offset +=3D vspeo->num_columns;
>  		}
>  	}
>  }
>=20=20
> +static void dump_vswing_preemphasis(struct context *context,
> +				    const struct bdb_block *block)
> +{
> +	const struct bdb_vswing_preemph *vspeo =3D block_data(block);
> +	const char *sgt =3D (char *) context->vbt->signature;
> +
> +	if (strstr(sgt, "NOVALAKE")) {

This is a no go.

I think all the parsing needs to be based on the device id. I don't
think this signature information is reliable. I also think we must
respect the --devid command-line option throughout the decoding, and not
make ad hoc decisions like this.

However, I think we could add a new command-line parameter to guess a
suitable device id from the VBT signature. Again, I don't think it's
reliable, but you could specify it on the command-line to do it anyway,
and it could be generally helpful, and completely independent of the
vswing preemph stuff.

Something like --devid-from-signature or --vbt-devid or
--signature-devid.

Then you could do:

 	context.bdb =3D (const struct bdb_header *)(VBIOS + bdb_off);
 	context.size =3D size;
=20
+	if (!context.devid && context.devid_from_signature)
+		context.devid =3D devid_from_signature(vbt->signature, sizeof(vbt->signa=
ture)):
 	if (!context.devid) {
 		const char *devid_string =3D getenv("DEVICE");
 		if (devid_string)

And the devid_from_signature() doesn't have to handle all possible
signatures in one go. Just add the infrastructure, preferrably with an
array and not a sequence of if ladders, add a few signatures and map
them to PCI IDs. If found, yay, but if not, print a warning and return
0.


BR,
Jani.


> +		dump_vspeo_lt(vspeo);
> +	} else {
> +		printf("platform not supported\n");
> +	}
> +}
> +
>  static void dump_generic_dtd_entry(const struct generic_dtd_entry *dtd,
>  				   const char *prefix)
>  {

--=20
Jani Nikula, Intel
