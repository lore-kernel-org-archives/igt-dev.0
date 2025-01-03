Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD8E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 06:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE9F10E288;
	Fri,  3 Jan 2025 06:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkkyBWfo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C9E10E288
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735884712; x=1767420712;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=bUdrSHIN+86H0YC0lyDc4ce6FTffISHHUNkqfd5K95E=;
 b=HkkyBWfoECbCmM/EXPwm6xmurQatC2IqcRgUpiOw76DRrBHIzGi7dM3s
 urOB8YLSPT8Lmghs9SMnhCR+l9lsaU9x1J3YjpcdtPdhNUrRyGvtLEZw/
 KkROe/DCLMuae3k6yhttOKcjVjwCxSUK1ntD/ROSsPjW0MLIr4+HwNv+O
 YrPDYeAC2iqGGuZB+xCbCnCPhghCq8QaHMGypO/7rb7ORCp7EPk68yK8S
 O7t9bRd+NKT+kyUBbFXtMDAlXmyucKA8zfjcasmC88EQqBm+Ls3eyZ/fm
 D8u4/ikWAccWgmZBZB8YIJnF9mQDmyYPsjShn9GP3HYY5nt8V3ex1d2TH w==;
X-CSE-ConnectionGUID: tBBhiaaKRaCNMXeJ5VdoHw==
X-CSE-MsgGUID: bESR1XG5QzSEUSrwhSBKmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36294184"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36294184"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 22:11:51 -0800
X-CSE-ConnectionGUID: iQyEUXjJT5OzzEDSjh0mng==
X-CSE-MsgGUID: UxLFy/15SimlFsExUmKx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101567089"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.124.220.75])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 22:11:51 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240910011238.254204-1-julia.filipchuk@intel.com>
References: <20240910011238.254204-1-julia.filipchuk@intel.com>
Subject: Re: [PATCH] tests/intel/*_query: Add new hwconfig table entry
From: Jordan Justen <jordan.l.justen@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>, igt-dev@lists.freedesktop.org
To: Julia Filipchuk <julia.filipchuk@intel.com>
Date: Thu, 02 Jan 2025 22:11:49 -0800
Message-ID: <173588470995.6880.3615586741322727599@jljusten-skl>
User-Agent: alot/0.11
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

Where can I find the documentation for this?

-Jordan

On 2024-09-09 18:12:38, Julia Filipchuk wrote:
> Two new entries added to the hardware config table. Updated enum and
> tests accordingly.
>=20
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  lib/intel_hwconfig_types.h | 2 ++
>  tests/intel/i915_query.c   | 2 ++
>  tests/intel/xe_query.c     | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/intel_hwconfig_types.h b/lib/intel_hwconfig_types.h
> index 0e6ce5b17..b5d9f1c9e 100644
> --- a/lib/intel_hwconfig_types.h
> +++ b/lib/intel_hwconfig_types.h
> @@ -97,6 +97,8 @@ enum intel_hwconfig {
>         INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES,                    /* 79 */
>         INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES,                    /* 80 */
>         INTEL_HWCONFIG_MAX_GSC,                                 /* 81 */
> +       INTEL_HWCONFIG_SYNC_NUM_RT_STACKS_PER_DSS,              /* 82 */
> +       INTEL_HWCONFIG_NUM_XECU,                                /* 83 */
>         __INTEL_HWCONFIG_KEY_LIMIT
>  };
> =20
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index 54dbb193a..df7e46a63 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -1340,6 +1340,8 @@ static const char * const hwconfig_keys[] =3D {
>         [INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES] =3D "Min Mesh URB Entries",
>         [INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES] =3D "Max Mesh URB Entries",
>         [INTEL_HWCONFIG_MAX_GSC] =3D "MaxGSC",
> +       [INTEL_HWCONFIG_SYNC_NUM_RT_STACKS_PER_DSS] =3D "Sync Num RT Stac=
ks Per DSS",
> +       [INTEL_HWCONFIG_NUM_XECU] =3D "Num of XeCU",
>  };
> =20
>  static const char * const hwconfig_memtypes[] =3D {
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index ddb2e76e5..3a0a83135 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -50,7 +50,7 @@ void dump_hex_debug(void *buffer, int len)
>  /* Please reflect intel_hwconfig_types.h changes below
>   * static_asserti_value + get_hwconfig_name
>   *   Thanks :-) */
> -static_assert(INTEL_HWCONFIG_MAX_GSC + 1 =3D=3D __INTEL_HWCONFIG_KEY_LIM=
IT, "");
> +static_assert(INTEL_HWCONFIG_NUM_XECU + 1 =3D=3D __INTEL_HWCONFIG_KEY_LI=
MIT, "");
> =20
>  #define CASE_STRINGIFY(A) case INTEL_HWCONFIG_##A: return #A;
>  const char* get_hwconfig_name(int param)
> @@ -137,6 +137,8 @@ const char* get_hwconfig_name(int param)
>         CASE_STRINGIFY(MIN_MESH_URB_ENTRIES);
>         CASE_STRINGIFY(MAX_MESH_URB_ENTRIES);
>         CASE_STRINGIFY(MAX_GSC);
> +       CASE_STRINGIFY(SYNC_NUM_RT_STACKS_PER_DSS);
> +       CASE_STRINGIFY(NUM_XECU);
>         }
>         igt_assert_lt(param, __INTEL_HWCONFIG_KEY_LIMIT);
>         igt_assert(!"Missing config table enum");
> --=20
> 2.45.2
>
