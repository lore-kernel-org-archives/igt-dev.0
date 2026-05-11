Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5DACD37B5
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 07:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBEF10E4D6;
	Mon, 11 May 2026 07:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrmcw4Qx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B1D10E4D6
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778485082; x=1810021082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KSENg8RDFS4kAHR17VO6igm9TI42E8iUwVN1w1E2iZk=;
 b=jrmcw4QxOwBLnJAVCA1bMf8kyxdJxhLpaW2mUkhbjNDOYPA2aGs2P0O1
 YYSMwufmOYVIjmNhAgWfQKkqDTxmAQo62Wnvdmkw5Me1NsbEUfqQVNMWT
 TAQOS66Vakr4CsuZ1+CXKP6kMXW61SscjFg2gdE/FgyqAH6t9Ynv4scQt
 zeDZUEf+/gb7YIopWFlFSDHQ9rbZi1fEKhLqOD7hKpJnWeS7eMjJ/AXZu
 x9wMRZdnZa0NJe66wE5p4AoX0vuZUrI4mCQwKw+cL+Ps+0eh7QOz/rQH/
 Te15CpdcVoLRGhvYG9hTBTZwoEnTOaflEbY4G8hVyc6VrcEgmV24qNZeN g==;
X-CSE-ConnectionGUID: qEKq1qGzSQKu67j82RjUNg==
X-CSE-MsgGUID: WfF4bz/mSPqGnmW59a7ebw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83237391"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83237391"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:38:01 -0700
X-CSE-ConnectionGUID: 26PX8xQIQD+RzwgN3Hs3hg==
X-CSE-MsgGUID: g9P5Dv3jRUO/XRN1NDY0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="234719027"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 00:37:59 -0700
Date: Mon, 11 May 2026 09:37:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 1/2] scripts/generate_iga64_codes: add env variable to
 force asm rebuild
Message-ID: <sc34wpzmiqknw5dwgfwowdfcovxexfqfhanc6vhwlzt2ylj7d3@h56mbojluuvj>
References: <20260507-switch_asms_to_raw_strings-v1-0-487fa0f9ea2f@intel.com>
 <20260507-switch_asms_to_raw_strings-v1-1-487fa0f9ea2f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507-switch_asms_to_raw_strings-v1-1-487fa0f9ea2f@intel.com>
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

On Thu, May 07, 2026 at 05:15:40PM +0200, Andrzej Hajda wrote:
> In some circumstances it is convenient to rebuild all iga64 asms.
> With introduced env variable it will be possible to do it with command:
> ninja -C build -t clean lib/libiga64_asms.a && FORCE_IGA64_REBUILD=1 ninja -C build

Ok, I wondered why second compilation with FORCE_IGA64_REBUILD=1
doesn't touch anything but according to above it applies on clean build.
That's fine for me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  scripts/generate_iga64_codes | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index 0a5fbef921e1..e3189d80041d 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -45,7 +45,7 @@ done < <(objcopy --dump-section .iga64_assembly=/dev/stdout $OBJ /dev/null)
>  MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
>  MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/null)"
>  
> -if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
> +if [ "$MD5_ASMS" = "$MD5_PRE" -a "${FORCE_IGA64_REBUILD:-0}" = "0" ]; then
>      echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
>      cp -p $INPUT $OUTPUT
>      exit 0
> 
> -- 
> 2.54.0
> 
