Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057FFD39406
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 09:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB6110E409;
	Thu,  2 Apr 2026 09:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxoI+2q+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC83A10F1BC
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 09:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775123959; x=1806659959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PPQJ89mQHQxMCBdO+wYMvbF01wEFwhfrCSZsKv1SbTI=;
 b=DxoI+2q+lhAyXIJ/1IcXoI/g1qJ0+wngAuK+jaenhHME4HLyCTJU3a+0
 bpDsBIo8aV6gewvNhrxFXo6OeRwkG+GzTA6HUnFXbl68lp6L+NUXCPDBB
 L19F9AEulcVY5pJWX5tUls4wZXozova4saIwG8FxmhZSm8EdV6qXb8bfX
 LilCskvESUwU2672qQgjbQU7/GTKURO2PApZnOBRKHlMfiO8dAPQY7P/9
 psc+tRpRi1Ot2sPS8j4OK0gDp56Oww8D3l8bcBCuxkkXB2UzbWbBc02Hd
 q6AQm9FVmI9b9ODoqVW4Of2UxBBrjAObCu6H9ooiiSxYptzsLUbKInDDP Q==;
X-CSE-ConnectionGUID: rTwq9/QbTWyjmv72ZY50ew==
X-CSE-MsgGUID: 0xWETZAJRdKzf8lR5PI3lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76298275"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76298275"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:59:19 -0700
X-CSE-ConnectionGUID: USUyqei3SEmemHidtqgcIg==
X-CSE-MsgGUID: wLcOC4v5SFaLvCZoOm9QWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="257415546"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 02:59:16 -0700
Date: Thu, 2 Apr 2026 11:59:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sowmiya S <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v1] README: Document skip message format
Message-ID: <20260402095913.4kwtzd2bowukjvev@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org,
 karthik.b.s@intel.com, swati2.sharma@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20260401043317.890733-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401043317.890733-1-sowmiya.s@intel.com>
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

Hi Sowmiya,
On 2026-04-01 at 10:03:01 +0530, Sowmiya S wrote:
> Add a concise guide for writing consistent, machine-friendly skip
> messages in IGT tests. Defines the format:
> 
>   SKIP: <reason> [(<context_type>: <value>)]

Should this also include subsystem like display? For example:

  SKIP: <subsystem> <reason> [(<context_type>: <value>)]

Example:

  SKIP: display: no suitable connector available`

  SKIP: core: unsupported on DG2`

+cc Ashutosh, J-P, Jani and Ville

> 
> along with common context types, example messages and a code snippet.
> 

Please give a link here to GitLab issue it is related, btw GitLab
changed recently 'issues' into 'work items':
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/24

Regards,
Kamil 

> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  README.md | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/README.md b/README.md
> index b4b9a37ea..a652cc0d1 100644
> --- a/README.md
> +++ b/README.md
> @@ -188,3 +188,40 @@ Imported non-DRM uapi headers from airlied's drm-next branch.
>  
>  Then, commit with a note of which exact commit from airlied's branch
>  was used to generate them.
> +
> +Skip Message Format
> +-------------------
> +
> +Keep skip messages consistent and machine-friendly. Use this concise
> +format and include a single, most-relevant context when available:
> +
> +- Format: `SKIP: <reason> [(<context_type>: <value>)]` (always end with `\n`)
> +- Rules: start with `SKIP:`, use a short lowercase `reason`, include at
> +    most one `context` in parentheses, use `0x%llx` for modifiers, and
> +    do not add a trailing period.
> +
> +### `Common context types and examples:`
> +
> +- `connector`: display connector name — `(connector: HDMI-A-1)`
> +- `plane`: plane type — `(plane: primary)`
> +- `format`: fourcc format — `(format: NV12)`
> +- `modifier`: buffer modifier (hex) — `(modifier: 0x%llx)`
> +- `pipe`: pipe id/name — `(pipe: A)`
> +- `platform`: GPU/platform name — `(platform: i915)`
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
> +                            "SKIP: format not supported (plane: %s, format: %s)\n",
> +                            igt_plane_name(plane), igt_format_str(fmt));
> +```
> -- 
> 2.43.0
> 
