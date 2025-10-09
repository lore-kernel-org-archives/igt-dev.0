Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D14CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 16:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3EF10E159;
	Thu,  9 Oct 2025 16:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ao1KTFqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A3710E159
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760028365; x=1791564365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4HmbPGcckaX//AcXuByBIEwVgifkv5tHwLVFr6ekZyg=;
 b=ao1KTFqa4YkiPrxGWAsGHzlZdsceoMSsmWBSfmDgR/Di4TSS44VGmuHD
 3QFc1jdJ8fCL4wuomykboFICZ58c4ZOhLKrQO/+la8eybU0gN7FYYHuee
 ohze1aafKEe41oK+WuBJbRhi2X+zNE0kAWZE5ou0tmVISC1JXzA2XlUJg
 coUzPvmyp3vACO1jAqNY3G+uJOH7F2QECZ75HtyLwvSf94aoLnTeJTJIH
 dn6wcIU9sluudE6fBYXQlmmpGtPFrQGqqkE/bmOSfDwVrmyfHgrBshWey
 Ja6NuKbzl3DrbxcJ3NvSDLsdyajtba+9IrxDbNCP/Isrp4Bq0DhxT3d/u g==;
X-CSE-ConnectionGUID: hyZcIpxVRQy4qwWjJ+wX3g==
X-CSE-MsgGUID: 3MTE4No7SNaH8HUZlvoaVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="49807523"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="49807523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:46:05 -0700
X-CSE-ConnectionGUID: zMZ1dWR6Rfu6+b2MR/2NrQ==
X-CSE-MsgGUID: IUjjdAwrS2yQagvFh32beg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185877174"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:46:03 -0700
Date: Thu, 9 Oct 2025 18:46:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 juhapekka.heikkila@gmail.com
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
Message-ID: <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, juhapekka.heikkila@gmail.com
References: <20251008160209.463702-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251008160209.463702-1-markyacoub@google.com>
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

Hi Mark,
On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
> [Why]
> VKMS (Virtual VKMS) is typically running on a virtual machine where it's
> expected to be without a contention with a hardware driver.
> When it's there, we would like to run IGT on it.
> 
> [How]
> Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
> up.
> 
> Tested: Ran kms_bw on Android's VM with VKMS enabled.
> 
> Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  lib/drmtest.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 8416aa491..ab991da57 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>   * on a system with them as well as a supported driver, you can end up
>   * with a near-100% skip rate if you don't explicitly specify the device,
>   * depending on device-load ordering.
> - *
> - * Exclude VKMS to prefer hardware drivers.
>   */
> -#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> +#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VIRTIO)

Nak, this is bad as there could be vkms module also on host.

Let me work on improving IGT_FORCE_DRIVER.

Regards,
Kamil

>  
>  /*
>   * Compile friendly enum for i915/xe.
> -- 
> 2.51.0.740.g6adb054d12-goog
> 
