Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27204CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44ED10E33C;
	Mon, 15 Jun 2026 10:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6X5MXu5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147FA10E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519510; x=1813055510;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MG2cacNV5cj85rHgVqR6KNR7nCeU3or7/+DArR6vY9E=;
 b=j6X5MXu5bSyzY5Rl/t4x2cPFYkp412UYN6bcCvCUSd8RMAFCkbo/PWfW
 XHNm3KZ14tfo8DfS6CwuUJB7Wri1vWLjht2gMs2pRVaKR4DPC13LAUDQ/
 DVz3fyPkaFSouOjjgzpVEp74yOFxetQNlVuN15sX9A3efdoBrPr9DsmVc
 5OxlYCmuL6DpT8NHOOZirfcjOloeo5JytJ2DdZPslzXMfYpQvlrWJN96w
 ChFB7qDdMXSpLOgL7sLnxabaJQ3s2xsFwWHbvZlC0QQvuRpNtfil5zh/z
 GH4cxyiwJn/2Y0+0qxfqDQjmn6NVhAg6alVP6t4PsCvYpVvYRCN7AWmLC g==;
X-CSE-ConnectionGUID: MJkkWtpoS7WhIuBXGdwgZw==
X-CSE-MsgGUID: jONFVbIxSsqrsVV6qJGCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82267873"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82267873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:31:47 -0700
X-CSE-ConnectionGUID: yHWxHyIjRySTLTtVDeHiyQ==
X-CSE-MsgGUID: 5W2KFGTdRKKOSZK8TrnDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247522220"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:31:45 -0700
Date: Mon, 15 Jun 2026 12:31:43 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>, 
 =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 03/10] tools/intel_vbt_decode: store codename
 from VBT signature to context
In-Reply-To: <20260615093137.681050-4-michal.grzelak@intel.com>
Message-ID: <8d234d9f-6e96-929a-41f3-51ab8d643866@intel.com>
References: <20260615093137.681050-1-michal.grzelak@intel.com>
 <20260615093137.681050-4-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1735859033-1781519506=:605841"
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

--8323329-1735859033-1781519506=:605841
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Michał Grzelak wrote:
> From: Jani Nikula <jani.nikula@intel.com>
>
> From: Jani Nikula <jani.nikula@intel.com>

Captain Obvious: you don't need to type From: tag into commit message,
send-email does it for you.

>
> The VBT often contains something resembling a codename in the
> signature. Currently, we only use it for printing a description of sorts
> (the --describe option). Store the codename-ish to context for more use.
>
> Cc: Michał Grzelak <michal.grzelak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>

> ---
> tools/intel_vbt_decode.c | 29 ++++++++++++++++++++---------
> 1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 5b7a6a49e9..ab0ad5ada6 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -74,6 +74,8 @@ struct context {
> 	const struct bdb_header *bdb;
> 	int size;
>
> +	char codename[sizeof(((struct vbt_header *)0)->signature) + 1];
> +
> 	uint32_t devid;
> 	int panel_type, panel_type2;
> 	int sdvo_panel_type;
> @@ -4023,31 +4025,38 @@ static bool dump_section(struct context *context, int section_id)
> 	return true;
> }
>
> -/* print a description of the VBT of the form <bdb-version>-<vbt-signature> */
> -static void print_description(struct context *context)
> +/* initialize something resembling a codename based on the signature */
> +static void init_codename(struct context *context)
> {
> 	const struct vbt_header *vbt = context->vbt;
> -	const struct bdb_header *bdb = context->bdb;
> -	char *desc = strndup((char *)vbt->signature, sizeof(vbt->signature));
> +	char signature[sizeof(vbt->signature) + 1] = {};
> 	char *p;
>
> -	for (p = desc + strlen(desc) - 1; p >= desc && isspace(*p); p--)
> +	memcpy(signature, vbt->signature, sizeof(vbt->signature));
> +
> +	for (p = signature + strlen(signature) - 1; p >= signature && isspace(*p); p--)
> 		*p = '\0';
>
> -	for (p = desc; *p; p++) {
> +	for (p = signature; *p; p++) {
> 		if (!isalnum(*p))
> 			*p = '-';
> 		else
> 			*p = tolower(*p);
> 	}
>
> -	p = desc;
> +	p = signature;
> 	if (strncmp(p, "-vbt-", 5) == 0)
> 		p += 5;
>
> -	printf("%d-%s\n", bdb->version, p);
> +	strncpy(context->codename, p, sizeof(context->codename));
> +}
> +
> +/* print a description of the VBT of the form <bdb-version>-<vbt-signature> */
> +static void print_description(struct context *context)
> +{
> +	const struct bdb_header *bdb = context->bdb;
>
> -	free (desc);
> +	printf("%d-%s\n", bdb->version, context->codename);
> }
>
> static void dump_headers(struct context *context)
> @@ -4313,6 +4322,8 @@ int main(int argc, char **argv)
> 	context.bdb = (const struct bdb_header *)(VBIOS + bdb_off);
> 	context.size = size;
>
> +	init_codename(&context);
> +
> 	if (!context.devid) {
> 		const char *devid_string = getenv("DEVICE");
> 		if (devid_string)
> -- 
> 2.45.2
>
>
--8323329-1735859033-1781519506=:605841--
