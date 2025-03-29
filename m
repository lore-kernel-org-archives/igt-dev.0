Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1113C36008
	for <igt-dev@archiver.kernel.org>; Sat, 29 Mar 2025 18:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EDA10E0FA;
	Sat, 29 Mar 2025 18:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EbrpVFj/";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA24210E0FA
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Mar 2025 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OmPH8j6LDEOacrTxfDmtD6i4zlPYwFv5Sq+ihOf0cL8=; b=EbrpVFj/ZPxuhJc8rnIOPAh4lE
 wWy0CDgjmOyyNfzRQb6qchqViJmU9e+y1Hq8RgejleA/KDmVEozJQXo4Qo932iY7tdJh6qKlQs0rx
 XSqUmEUjRSJw26CgY2RIKL5xO9cQNYS91OvUJA7CTrRpWuDSVlm2FjP64fEpS22fXv2AfUQ+Pqinm
 jb0f5GLJI4v8Y7b2Cr70NQAUNR7zpfmamdnF3XFImXgosVlOWxr/TMMQoTOMApHxpA8hD199PXSxM
 IKp6wv4tGop4dekarWTPkpXc27kGGXhoLWGEb+qDYBj6XUNLJxPQUiB2PEDNjvIYRtj+mv7wP3/as
 mGjUwZYw==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyawQ-008Sb2-6I; Sat, 29 Mar 2025 19:29:58 +0100
Date: Sat, 29 Mar 2025 15:29:48 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v4 1/3] tests/kms_async_flips: Check for atomic async
 flip cap
Message-ID: <eiljqxjx3kkzbwxo47g53byd2wk3gkfh6rpgbtmtyyz3ficu6u@j77cc4h5di64>
References: <20250327221601.19086-1-andrealmeid@igalia.com>
 <20250327221601.19086-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327221601.19086-2-andrealmeid@igalia.com>
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

On 03/27, André Almeida wrote:
> If a driver doesn't support doing an async flip through the atomic uAPI,
> the atomic tests fails. Instead of failing, create a function that
> checks for this capability and skip the test if is unsupported.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index da426f753..2975925c2 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -207,6 +207,12 @@ static void require_monotonic_timestamp(int fd)
>  		      "Monotonic timestamps not supported\n");
>  }
>  
> +static void require_atomic_async_cap(data_t *data)
> +{
> +	igt_require_f(igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
> +		      "Skipping, atomic flip async flip not supported");
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -687,6 +693,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  {
>  	igt_display_t *display = &data->display;
>  
> +	if (data->atomic_path)
> +		require_atomic_async_cap(data);
> +

Hey,

This doesn't work as expected because igt_has_drm_cap() has an
igt_assert() and this assert inside a igt_subtest_with_dynamics() aborts
the execution in case of failure. You can see this issue when running a
kernel without atomic async flip support.

Considering the way the atomic async tests is organized, I think a good
approach is removing the assert from igt_has_drm_cap() as below - but
feel free to suggest a different fix:

-- >8 --

From 601b5cc7c4bb5d9d617f940c95e76455bf783a39 Mon Sep 17 00:00:00 2001
From: Melissa Wen <mwen@igalia.com>
Date: Fri, 28 Mar 2025 21:00:54 -0100
Subject: [PATCH i-g-t] lib/ioctl_wrappers: let the caller handle capability
 check result

Rework igt_has_drm_cap to just check if a DRM capability is supported
and let the called decide what to do from this check. It prevents the
test fails because of an assert done when it's called in
igt_subtest_with_dynamics.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 lib/ioctl_wrappers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 146973f0d..15eeb9aa4 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1292,10 +1292,10 @@ int __kms_addfb(int fd, uint32_t handle,
  */
 bool igt_has_drm_cap(int fd, uint64_t capability)
 {
-	struct drm_get_cap cap = { .capability = capability };
-
-	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
-	return cap.value;
+	uint64_t value;
+	if (drmGetCap(fd, capability, &value))
+		return false;
+	return value ? true : false;
 }
 
 /**
-- 
2.47.2

