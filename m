Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F0CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 17:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4F510E09F;
	Thu, 16 Oct 2025 17:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J2Bf/T3t";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C934910E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 17:48:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so9813535e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760636913; x=1761241713; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NrSsl36wUTzlkOk0a1G7KtOR9apLjCKM2Jjq3aifqbk=;
 b=J2Bf/T3tK3vY421RQrKfn72UDFsno/r+zTrUAFb/r35f/k69I1xEhjKgSPkln73xkY
 0xdE1O5OI58i6cCApZ2WHu/dZ7HR9zvIRCPAOln2DmQdrWYdag0/k7iPuCEuYeRZJprE
 ux0AtGnZm4QDP/x4KGbDgZxR54HLtEu8FHQVOtN3K71v2+lpKYyyw8uCrosw+/vHvcd/
 DeRQfcXnEQ4KAZEQQ7HHtV3V41CiEtm5C+Vyu9kFe1/7soActySCGMCKRy6eqg4JWGRu
 AgVvZheL54ZhrvQeA3lqWa+RAPEcES06N+pcHz1p4U+dkny/0X38VUl8j5WBukdezIfc
 xyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760636913; x=1761241713;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrSsl36wUTzlkOk0a1G7KtOR9apLjCKM2Jjq3aifqbk=;
 b=jcGqer9wQmRZhcbuyXvv+xyjlgVByMVeUzAPmLDU1xgclCzmCzaoW1aKgqyl/qrBqa
 qblVV6GmrFUPVzqkXNs2VDINEtz0oXamM38wPXBNbNZQ7SzMbep+DjQrNafV/2h5f++K
 HlZliDuYHRAZnV/tbE68aiFFpszmCFZ6ZFZFofjJok9K6OMD71xVRrC6BeR4BxFd0Kf9
 GqhlrNVMiXGIpcYqJ3DkoUs52hSFzT6iuyj7k+nxW/fLAfNzQFmzfE83iJpvJRCWoFG2
 BC/ZJJfH2NtAFokrwL2QLojVj3XNv+En6kOi3Qmh5r1sTiHq1VWXU2b9VBg3wJ2v77jc
 b4wg==
X-Gm-Message-State: AOJu0YzxRm0CUs828PaSm/BGfBrX9HyTDMmO+BegLjP89zR3MBcbLgQ9
 8K1ULq56mR8srRfSMQ7TJLXX7nNc5uc8J7UHlN+OFGPdZVYt6mhio0ci
X-Gm-Gg: ASbGncvvlJcM73jxR4BE39snfe7Rj2XoILNCKoqGLyT0I64tlyRvIY+0sfr2HPepaWE
 oQWEB2FxKAILQj2q8mqeEDSPZp695mhOfD8YG2iepWiN3IHNi1EqUoCk4QbuLut+bWw7yDerTKY
 BU4x05sESls3SAt1Hx0L6HunfT4rjFr+akBQOWGUKxgSw+5tM9RJ1fQ43e5QZvnHY083TrlCP6Y
 Aa6lsYEl14/EfvKV7V6W77ze+28GbFzNkgMoTdfVxsLCRdwiuIQOzEhyrbOIaZ8Cv1wFA6zHShf
 e3W2xWn9OvV7UuKZ3FSKZerluTQ19BVX9jX3n8uWuTZ8MoeBqGD1Ctl2SMDu2RA3arjBAKVvWju
 uCGbtI5YZE5IcBxvlnOsm1tgAMdK+CqeFdQc55JXOO4miDNKGYNmoQThm4VLhhMfWd8HLMlG1qd
 zeC+EkVflzug==
X-Google-Smtp-Source: AGHT+IFYQfh0CUmku5sauqbeUHdv8Ikrb7bat5oaMdPiMUbOeoj/0jXtJ/36OWWit+7yFBvVy16cjg==
X-Received: by 2002:a05:600c:1d9b:b0:46e:652e:16a1 with SMTP id
 5b1f17b1804b1-47117878458mr7014715e9.7.1760636912900; 
 Thu, 16 Oct 2025 10:48:32 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ff84cbb7sm4597003f8f.23.2025.10.16.10.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:48:32 -0700 (PDT)
Date: Thu, 16 Oct 2025 19:48:30 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 0/1] Fix drm_open_driver() with IGT_FORCE_DRIVER
 and DRIVER_ANY
Message-ID: <aPEv7ppyJ9Mocr_6@fedora>
References: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
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

Hey Kamil,

On Thu, Oct 16, 2025 at 06:05:42PM +0200, Kamil Konieczny wrote:
> With recent addition of VKMS it was discovered that
> IGT_FORCE_DRIVER didn't help with testing on Virtual Machines.
> Imho when user sets forced driver than DRIVER_ANY should allow
> testing this driver even if it will cause skips or fails.
> 
> I tested this with the help of vgem driver, normal run without
> any env vars:
> 
> $ sudo build/tests/core_getversion --r basic
> IGT-Version: 2.2-NO-GIT (x86_64) (Linux: 6.14.0-33-generic x86_64)
> Using IGT_SRANDOM=1760622038 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic
> 0: i915 v1.6 0 Intel Graphics
> Subtest basic: SUCCESS (0.000s)
> 
> Now run with forced driver fails due to no fd opened:
> 
> $ sudo IGT_FORCE_DRIVER=vgem build/tests/core_getversion --r basic
> ...
> (core_getversion:28545) CRITICAL: Test assertion failure function __igt_unique____real_main84, file ../tests/core_getversion.c:91:
> (core_getversion:28545) CRITICAL: Failed assertion: fd >= 0
> (core_getversion:28545) CRITICAL: Last errno: 2, No such file or directory
> (core_getversion:28545) CRITICAL: file descriptor fd failed
> (core_getversion:28545) igt_core-INFO: Stack trace:
> (core_getversion:28545) igt_core-INFO:   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
> (core_getversion:28545) igt_core-INFO:   #1 ../tests/core_getversion.c:106 __igt_unique____real_main84()
> (core_getversion:28545) igt_core-INFO:   #2 ../tests/core_getversion.c:84 main()
> (core_getversion:28545) igt_core-INFO:   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
> (core_getversion:28545) igt_core-INFO:   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> (core_getversion:28545) igt_core-INFO:   #5 [_start+0x25]
> ****  END  ****
> Subtest basic: FAIL (0.000s)
> 
> After a proposed fix:
> 
> $ sudo IGT_FORCE_DRIVER=vgem build/tests/core_getversion --r basic
> IGT-Version: 2.2-NO-GIT (x86_64) (Linux: 6.14.0-33-generic x86_64)
> Using IGT_SRANDOM=1760622054 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: basic
> 0: vgem v1.0 0 Virtual GEM provider
> Subtest basic: SUCCESS (0.000s)

I tested this with VKMS both for a test that is selecting DRIVER_ANY (kms_plane.c)
and for a test that uses "drm_load_module(DRIVER_VKMS)" (vkms_configfs.c) and in
both cases I was able to force VKMS using IGT_FORCE_DRIVER="vkms".

I also tried to set IGT_FORCE_DRIVER to a valid driver in my system (i915) and to
a random value ("foo") and both cases are correctly handled.

Tested-by: José Expósito <jose.exposito89@gmail.com>

Thanks!
 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: José Expósito <jose.exposito89@gmail.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> 
> Kamil Konieczny (1):
>   lib/drmtest: Fix device opening with DRIVER_ANY
> 
>  lib/drmtest.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> -- 
> 2.51.0
> 
