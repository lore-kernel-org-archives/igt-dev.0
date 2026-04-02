Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A8D3943C
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 15:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BAE10E122;
	Thu,  2 Apr 2026 15:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lhde1K20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944B110E122
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775144198; x=1806680198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pF23LfwsVBn8sjiPFe9K8Eq7PCd1VTVIE9gVPGLadC8=;
 b=Lhde1K205o2EGdWpr9nc+ZC1U3StgOyFuc0vp2Sq1q5hbwhvZ7Ozn93d
 3AmnIrpWlCJgtR0gUnEMkpSccmAV1cnOFuxGPGbuMACUmHEVZfGep9JdJ
 HZJG9UCSsbVJ6edNGzGL6rQtIZgZ4eoQsmLoLzZQ27QtTq+mDs5xL3CJA
 VanjDEqFMNE4exkamfW7XkEshswyTAVgxolwydLXg1x+k0gwf04CXomt0
 LEYyDD4isCtMpGTmQS/Qdv7yi2gcCufd00q65eWJyrSH/An96byZWzNdw
 kHw41iLLCLXUwxZr9xqo1g5fgNaSCtskVJ7BpK/ZiD3Wcp+Yf6OHUMjKN w==;
X-CSE-ConnectionGUID: qtuu4mbTSUGW8Y4vsNL04g==
X-CSE-MsgGUID: fsjr2/crRq2mtRSre1yhAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76395484"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76395484"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:36:38 -0700
X-CSE-ConnectionGUID: /Op3y+jdR6WwomvYwaOa5g==
X-CSE-MsgGUID: Egx+EpjrTD6ulaee3ruLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="227270349"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 08:36:37 -0700
Date: Thu, 2 Apr 2026 17:36:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amd/amd_fuzzing: Fix compilation error on
 fedora
Message-ID: <20260402153634.2wzz6pdw4fmr66yk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260402152439.1691178-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402152439.1691178-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2026-04-02 at 20:54:39 +0530, Karthik B S wrote:
> Fix compilation error:
> 
> ../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
> ../tests/amdgpu/amd_fuzzing.c:1103:13: error: ‘have_amdgpu_dev’ undeclared (first use in this function); did you mean ‘amdgpu_dev’?
>  1103 |         if (have_amdgpu_dev) {
>       |             ^~~~~~~~~~~~~~~
>       |             amdgpu_dev
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Fixes: d512e54bbace ("tests/amdgpu/amd_fuzzing: Remove unused variable")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

btw using
	bool b = (ptr != NULL);
is strange and should be catched by checkpatch.pl. In this case just
use 'ptr', no point in using helper var.

This also shows that code inside ifdef/endif should be very minimal
and all code should compile.

Vitalyi, what about only placing one var per one ifdef? For example:

#ifdef AMDGPU_USERQ_ENABLED
	bool amdgpu_userq_enabled = true;
#else
	bool amdgpu_userq_enabled = false;
#endif

and have you code always compile?

Regards,
Kamil 

> ---
>  tests/amdgpu/amd_fuzzing.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> index 00717e593..9d7468ea4 100644
> --- a/tests/amdgpu/amd_fuzzing.c
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -1100,7 +1100,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  	 * Note: USERQ_WAIT has no timeout field; it is not a blocking wait.
>  	 * It only registers the dependency.  We therefore only test ret==0.
>  	 */
> -	if (have_amdgpu_dev) {
> +	if (amdgpu_dev) {
>  		uint32_t timeline_handle = 0;
>  		uint32_t timeline_handles[1];
>  		uint64_t timeline_points[1];
> @@ -1142,7 +1142,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  	 * Note: USERQ_WAIT has no timeout field and is not a blocking call; it
>  	 * only registers a dependency.  We therefore only verify ret==0 here.
>  	 */
> -	if (have_amdgpu_dev) {
> +	if (amdgpu_dev) {
>  		uint32_t timeline_handles[2] = { 0, 0 };
>  		uint64_t signal_points[2] = { 8, 8 };
>  		uint64_t wait_points[2]   = { 8, 8 }; /* both already signaled */
> -- 
> 2.43.0
> 
