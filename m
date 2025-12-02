Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAAFCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 13:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E3110E63D;
	Tue,  2 Dec 2025 13:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlnxBqYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080010E63D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764682725; x=1796218725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oYKkTBcPSVdYs+tE0r4cNd4iXWuRo+gr26JWRn6YOIU=;
 b=WlnxBqYgfcvnVVzn21CAAaRuFeXQNrAf2HkGSJV1banY2pptMOH2/4cs
 mmo5VeuyGypTBTEAstrXZOy80FZ22C7qK9rB5vtwPIHtQREe5Z1iCRpNv
 waQf9Irk9qoztdxTys+QL8P3m9akfC04kbrii+1dhexsQvY+kdCK0FM9i
 S9uENOMyfQjGPxREDe81RGgRKODn/moXG9yt5ojIZATSYFyykKl3pzUt7
 VuerffKLzyQ4uiBdkkXzErA4v7udeVMS9ky37g28sH9rvLd/QfxU2TXTW
 DLIA+DIa34booniIOqhNgR+5b3l5/TFM83H7DglStmAS5fHG2nCiBirNu Q==;
X-CSE-ConnectionGUID: RlifeuffQei4/aG43NjFEw==
X-CSE-MsgGUID: aJ2R2hbqSce/HJwcIFwI6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66592723"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66592723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:38:45 -0800
X-CSE-ConnectionGUID: ESwqhJT7R/2Wfoh09JvikQ==
X-CSE-MsgGUID: VfSs3GMvSpONjP3Z7WyMGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="193482073"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 05:38:43 -0800
Date: Tue, 2 Dec 2025 14:38:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] tests/intel/xe_exec_queue_property: Use single
 invalidate property
Message-ID: <20251202133840.cqzrzychu3vtjtuj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251201223126.863042-1-matthew.brost@intel.com>
 <20251201223126.863042-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201223126.863042-2-matthew.brost@intel.com>
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

Hi Matthew,
On 2025-12-01 at 14:31:26 -0800, Matthew Brost wrote:
> Rather than using a loop hardcoded with an invalid property range, use a
> single high value invalidate property. This will avoid this test
> continually breaking as we add more properties in the KMD.
> 
> v2:
>  - Use single invalidate property (Matt Roper)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

This seems to be independent from patch 1/2 so it could be merged
without the first one.

Regards,
Kamil

> ---
>  tests/intel/xe_exec_queue_property.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 4dfcf09e26..1b7ed5abb2 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -172,6 +172,7 @@ static void basic_get_property(int xe)
>  static void invalid_property(int xe)
>  {
>  	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
> +	uint32_t invalid_property = 32;	/* Picking some high value */
>  	struct drm_xe_engine_class_instance instance = {
>  			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
>  	};
> @@ -187,13 +188,10 @@ static void invalid_property(int xe)
>  	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
>  					     to_user_pointer(&ext), &exec_queue_id), 0);
>  
> -	/* This will fail as soon as a new property is introduced. It is
> -	 * expected and the test will have to be updated. */
> -	for (int i = 3; i < 16; i++ ) {
> -		ext.property = i;
> -		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> -						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
> -	}
> +	/* Invalid property should fail */
> +	ext.property = invalid_property;
> +	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
>  
>  	/* Correct value should still pass */
>  	ext.property = valid_property;
> -- 
> 2.34.1
> 
