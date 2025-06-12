Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45F3C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 18:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3928E10E0B1;
	Thu, 12 Jun 2025 18:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGhNk8Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899EA10E0B1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749751244; x=1781287244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FKvRVB32oM9JVnEbOuqS0Ru4uQ4OAZVCpCqAPSYmvho=;
 b=jGhNk8GpHViZVjUIZeMAmRthqV+3yPcRlhP+wlFfVGw8jnQywLLtw9/b
 D8ltNar4NnIn+FDBgfX+eQTYCQpvfbepRyk0cn07YGrPxreRg+23dIoNg
 Yi0RtvKBXRxMNAiHFZDQi5KdfKyIPwk1EJ2N1u3n7BWUdAkLe7tmv6DoC
 fKpkyJ8/HjZPdlosQX7Frb+dTuyafAyGX2vuQXV2JHbYv7R96NU834+Tp
 XqkHrKDIr0PIuB7TRRoedxqbLwEPhDCV/fM2T+iHbEPO8pYyyx7ietn1R
 Q33wA2xt39k1XGey2VFcfPG+nBxenG9ZkXw1qdgIUvgjoW0/ic/o5krTW Q==;
X-CSE-ConnectionGUID: gqXos0mfSeqfpbO0gxuC6Q==
X-CSE-MsgGUID: gkV3bnWvTcqWuHlLpVJNlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69514704"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69514704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:00:44 -0700
X-CSE-ConnectionGUID: BffVfAd4T5Gxl6eyRp1Spw==
X-CSE-MsgGUID: N6vWyIr0RBmBQsBsg6K2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178493891"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:00:42 -0700
Date: Thu, 12 Jun 2025 20:00:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t] include/android: Define gboolean as bool to
 resolve Android build error
Message-ID: <20250612180040.4cjxyeaoeue6xunn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com
References: <20250612143819.8547-1-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612143819.8547-1-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-06-12 at 14:38:19 +0000, Jeevaka Prabu Badrappan wrote:
> The function g_regex_match returns a gboolean, which is not defined in
> the Android environment, leading to build failure. This commit

imho first sentence is enough. You do not need to translate
C code into english.

> addresses the issue by typedef-ing gboolean to bool in the
> Android-specific GLib header file.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  include/android/glib.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> index 8540d3514..e12aaeebb 100644
> --- a/include/android/glib.h
> +++ b/include/android/glib.h
> @@ -29,6 +29,7 @@ typedef char gchar;
>  typedef unsigned char guchar;
>  typedef void GRegex;
>  typedef int GRegexMatchFlags;
> +typedef bool gboolean;

How did you missed it? Was it lost with too many errors/warnings?
Thats why I asked for container or container recipe for
independent building. The best way would be to add it to our
GitLab pipeline.

Mark, could you help us with this? Or redirect to someone from
your team?

Change LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  static inline void g_clear_error(GError **error) { }
>  static inline void g_error_free(GError *error) { }
> -- 
> 2.49.0
> 
