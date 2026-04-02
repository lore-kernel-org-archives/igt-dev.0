Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AFBD3941A
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 12:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EA410F27B;
	Thu,  2 Apr 2026 12:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSKDyjpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7355110F27B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775134325; x=1806670325;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tUH1qdxemWSvKuI5Tk5AReFHPp3ab07Z2MMDfqcWYM8=;
 b=lSKDyjpnlGLS1e8NSfaPO5IbkOWROvza14Q0a4U9PX8fEPD+zMAwtzNS
 zSEUuLIKeS/zeycJQzt7GN8kLsSy/61D6kG0NviOfjM/Vwr1Zes/dZYc4
 fEGJS3Ij+MWlfF1IwR4xda44YY4euxj66yDxizSa9klxKc3FK8zLUnLDd
 FBxV0SKQBEYQl/11Ez8UfGC98MVWsvV8FaA+2lnMWQYU+LWupOSCvkyCB
 NyYs0y9eZBA5tLZcF/bCTmubDqcwAOM5VasYwvgdx7+fY+NtAZHEwl7Aw
 wEXcopT87JnbeyZrJaNDISBtY6SncbdX+mNqaSZPznCo959bKMBqYwmM3 w==;
X-CSE-ConnectionGUID: aUcr2zJ0T4qu+7F8bPOLww==
X-CSE-MsgGUID: DwbWqJ5+TJWcdI/VfUMupQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87585931"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="87585931"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 05:52:05 -0700
X-CSE-ConnectionGUID: 8aMLjO2ORW2m9meTaXohww==
X-CSE-MsgGUID: X+amIxuISviLPuYxU6doFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="227234001"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.183])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 05:52:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, Sowmiya S
 <sowmiya.s@intel.com>
Subject: Re: [PATCH i-g-t v1] README: Document skip message format
In-Reply-To: <20260401043317.890733-1-sowmiya.s@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260401043317.890733-1-sowmiya.s@intel.com>
Date: Thu, 02 Apr 2026 15:51:59 +0300
Message-ID: <27e9a4b4a37b220b0cf36901987ae7787d938922@intel.com>
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

On Wed, 01 Apr 2026, Sowmiya S <sowmiya.s@intel.com> wrote:
> Add a concise guide for writing consistent, machine-friendly skip
> messages in IGT tests. Defines the format:
>
>   SKIP: <reason> [(<context_type>: <value>)]
>
> along with common context types, example messages and a code snippet.
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  README.md | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/README.md b/README.md
> index b4b9a37ea..a652cc0d1 100644
> --- a/README.md
> +++ b/README.md
> @@ -188,3 +188,40 @@ Imported non-DRM uapi headers from airlied's drm-nex=
t branch.
>=20=20
>  Then, commit with a note of which exact commit from airlied's branch
>  was used to generate them.
> +
> +Skip Message Format
> +-------------------
> +
> +Keep skip messages consistent and machine-friendly. Use this concise
> +format and include a single, most-relevant context when available:
> +
> +- Format: `SKIP: <reason> [(<context_type>: <value>)]` (always end with =
`\n`)
> +- Rules: start with `SKIP:`, use a short lowercase `reason`, include at
> +    most one `context` in parentheses, use `0x%llx` for modifiers, and
> +    do not add a trailing period.
> +
> +### `Common context types and examples:`
> +
> +- `connector`: display connector name =E2=80=94 `(connector: HDMI-A-1)`
> +- `plane`: plane type =E2=80=94 `(plane: primary)`
> +- `format`: fourcc format =E2=80=94 `(format: NV12)`
> +- `modifier`: buffer modifier (hex) =E2=80=94 `(modifier: 0x%llx)`
> +- `pipe`: pipe id/name =E2=80=94 `(pipe: A)`
> +- `platform`: GPU/platform name =E2=80=94 `(platform: i915)`
> +
> +### `Common concise messages:`
> +
> +- `SKIP: no suitable connector available`
> +- `SKIP: connector is disconnected (connector: %s)`
> +- `SKIP: no suitable display mode available (connector: %s)`
> +- `SKIP: format not supported (plane: %s, format: %s)`
> +- `SKIP: modifier not supported (modifier: 0x%llx)`
> +- `SKIP: plane not available (plane: %s)`
> +
> +### `Example usage:`
> +
> +```c
> +        igt_skip_on_f(!fmt_supported(plane, fmt),
> +                            "SKIP: format not supported (plane: %s, form=
at: %s)\n",
> +                            igt_plane_name(plane), igt_format_str(fmt));
> +```

"SKIP:" comes from the plumbing already, doesn't it? There's no point in
having every igt_skip* call in the codebase add that.

In general, you'd do well to document current usage first, and then
suggest changes. Writing a wishlist documenting what you'd like to see
is not going to make it magically happen.

BR,
Jani.

--=20
Jani Nikula, Intel
