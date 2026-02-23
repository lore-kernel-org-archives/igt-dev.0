Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68648EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAEE10E34A;
	Mon, 23 Feb 2026 11:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIuNoVap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4542510E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771846495; x=1803382495;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=ZvL1VvttsZxnAD40WpydnK2R9hMlnxrjzH/I74dbOPU=;
 b=PIuNoVapAVnG9BYOwQR0YDNj8fy1bYQ8UdHNlF0mIZ/bJPqxAiHt9F7h
 o5uFcppNM7Uv5be4bflNEN1icuugw3XWT7TaMENGlUxL1IptRBaCWOYWV
 Y2A2WAn5BU1CDWIfXAA5Upo0mUOpl/1xGOJ10ap5hwf47vDaGdnYvcSCv
 nNDH9CH4L9RaL61dODWrswfaQuX3ZnR1jnHvubPI4W+/yoEg90pVx6pih
 Vsr763U/ZIh62LQrM6cj/65TowPo+NExvW7kAjDm7y2yHzVakRC1/By6U
 tp9mpdUXoA5Ce1GNfmMnrpdzEtlJyFSLgw34ac0sX2Rs5t2oOGIjaWe+3 Q==;
X-CSE-ConnectionGUID: HJnz8qn+QNSvP98Z1QAwcQ==
X-CSE-MsgGUID: Z+2BRzXURsms3Dj4danajQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72877732"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72877732"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:34:54 -0800
X-CSE-ConnectionGUID: 3jmDAeNKRU290RR7fC4biA==
X-CSE-MsgGUID: PIZwBrrzQGCOOg8QymJwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="253257283"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:34:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 03/23] tests/intel/kms_flip_scaled_crc: Remove
 unused 'enum pipe pipe'
In-Reply-To: <20260221032003.30936-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-4-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:34:49 +0200
Message-ID: <ae8488423263eb44187c7b0235f8d9e627ef337c@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> kms_flip_scaled_crc has a data.pipe member that it never uses
> for anythinh. Nuke it.

*anything

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>  #include "scripts/iterators.cocci"
>
> @find_pipe@
> typedef igt_crtc_t;
> typedef igt_display_t;
> identifier PIPE;
> type T;
> @@
> T {
>   ...
>   enum pipe PIPE;
>   ...
> };
>
> @use_pipe depends on find_pipe@
> identifier find_pipe.PIPE;
> find_pipe.T S;
> find_pipe.T *P;
> @@
> (
> S.PIPE
> |
> P->PIPE
> )
>
> @remove_pipe depends on find_pipe && !use_pipe@
> identifier find_pipe.PIPE;
> type find_pipe.T;
> @@
> T {
>   ...
> -  enum pipe PIPE;
>   ...
> };
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index 9a0b99e46ddd..83674d5c267f 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -143,7 +143,6 @@ typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
>  	igt_output_t *output;
> -	enum pipe pipe;
>  	uint32_t gen;
>  	struct igt_fb small_fb;
>  	struct igt_fb big_fb;

--=20
Jani Nikula, Intel
