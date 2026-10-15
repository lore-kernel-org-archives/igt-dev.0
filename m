Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E99BCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 10:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C62810EBB9;
	Thu, 15 Oct 2026 10:07:47 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8092010EBB9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=x7REM0soZS+0WLTIqTxDfaYlR5tf+E+09yYmJ8kOtpA=; b=mcghU6eD5+I534CsqYkbhBndPh
 hK1UxCDPG/mBGGQDmQ9GuFjwdeV+6LN8HSAtic9Yom1JakeVd/ra7zppR6h0MMRmvYR4KF2IeTT6F
 NTDJiMbmVt2N+M7EXxx3MylIR1GP/wV1dPG1AroBUne5rMwD+1N34cLye3RIUgNLmt9Q0AjPERfTr
 oQXZguC0eqUjaU4Y+ihdw3DFxMI5D/3jhGPbl1LAVEIB+p5KvAhXndavghj1rBxsgmMaMk4l6E15z
 B1BypGdSLeu8PyBItHYDskohT+aNXbwmvfuCLFbOVM19e8IZODm9n1MDTsrcU8M4bQL6tshSr6q3x
 NnVFpVDw==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1xHIMJ-000UA8-UG; Thu, 15 Oct 2026 12:06:47 +0200
Message-ID: <35594202-7315-4c82-9e52-337ee12361aa@igalia.com>
Date: Thu, 15 Oct 2026 11:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_sync_file: Fix driver_name expectation in
 sync_file_race
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, igt-dev@lists.freedesktop.org
References: <20261014061138.1748313-2-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20261014061138.1748313-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 14/10/2026 07:11, Tejas Upadhyay wrote:
> sync_file_get_status() is checked right after confirming the exported
> sync file's status is already signaled (status == 1). At that point,
> dma_fence_driver_name() has already taken its signaled-fence path and
> will unconditionally return "detached-driver" - it never calls back
> into the driver's own get_driver_name() once a fence is observed
> signaled.

I don't quite understand how this slipped through because I am pretty 
sure I tested it locally both without and with the kernel fix
3ed11c671ff7 ("dma-buf/dma-fence: fix checking signaling bit for 
timeline and driver name v3").

For what CI results are concerned I *think* I misattributed the fail to 
the above fix not having landed yet (at the time). But again for local 
testing I don't know how I got the pass.

Anyway, the fix is good, thanks for making it!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko


> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   tests/intel/xe_sync_file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_sync_file.c b/tests/intel/xe_sync_file.c
> index 842c3856a..578b2b1ea 100644
> --- a/tests/intel/xe_sync_file.c
> +++ b/tests/intel/xe_sync_file.c
> @@ -100,7 +100,7 @@ static void test_race(int xe, struct drm_xe_engine_class_instance *eci)
>   	driver_name = NULL;
>   	igt_assert_eq(sync_file_get_status(sync_fence, &driver_name), 1);
>   	igt_assert(driver_name);
> -	igt_assert(!strcmp(driver_name, "drm_sched"));
> +	igt_assert(!strcmp(driver_name, "detached-driver"));
>   	free(driver_name);
>   
>   	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;

