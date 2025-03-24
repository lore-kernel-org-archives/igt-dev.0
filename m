Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBD1C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 21:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7758410E419;
	Mon, 24 Mar 2025 21:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LtCQRTEB";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1411B10E419
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oqVpCihnE+C02MfsG6cFqkBfgofvQP5ZE+JT2rVFS88=; b=LtCQRTEBEW17XQv2/CTUkpW+U9
 h3ArX4pxHqJ5gKlerJFMPVa/GaHWc+esozuBJWcC7+7LiAdL6OaOTLy9XXX0E6z56HXxLmxfPJYBu
 N8wrdZwm+14sgetR8q6HmSTLeoRPl+6GOQ5p7uinETvsq6YlWAOwYiqyRgY3+gZHQjKXdw6dVW/tH
 q4zNDmTVNwDSCMVuWIn0bhS6JJ0dxdALucDlNUfDzhfQ7xugg5LmTAeOlSLdFiV4QyIS9Gvdoj2FG
 kiiM1kowhMX4gyuxq7DHz8wQTJCQbMCSbxOlUmHjQSFCfKcyLJl8uAIJMjtq6dzZ+pkxr5YYwvNdZ
 Nn637MTg==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1twpG9-005tHQ-G7; Mon, 24 Mar 2025 22:23:02 +0100
Date: Mon, 24 Mar 2025 18:22:48 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v3 1/2] kms_async_flips: Refactor data options
Message-ID: <5fylzvdwpqig36iuxov57zjvlvrklev56y3qklrezkg62lrp5a@mn2ydj6jdrx5>
References: <20250320140030.557446-1-andrealmeid@igalia.com>
 <20250320140030.557446-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320140030.557446-2-andrealmeid@igalia.com>
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

On 03/20, André Almeida wrote:
> Setting the test data options as true and false for every test is error
> prone. Instead, reset all the data to false at the end of a test and
> just set the needed options to true before running a test.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Hey, thanks for addressing this issue.

Besides that missing cleanup steps, I detected other issues on the atomic async flip subtests introduce by:
296891df ("tests/kms_async_flips: subtests to validate async flips on atomic path")
when running in a kernel without atomic async flip support.

1 - those subtests don't check the `DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP` cap
before perform atomic async flip tests and, therefore, they fail instead
of skips.

2 - the test sequence is not easy to follow and somewhat error prone
since it mixes legacy and atomic paths all the time. I think it should
be better if we keep atomic tests separated from the legacy path, i.e.
in a different igt_subtest_group.

As you are already fixing this mess, how about solve these other
problems too? :) It can also make the whole async flip test more
stable.

One more comment below

> ---
>  tests/kms_async_flips.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index da426f753..d4af9b383 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -708,6 +708,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  			test(data);
>  		}
>  	}
> +
> +	data->alternate_sync_async = false;
> +	data->atomic_path = false;
>  }
>  
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
> @@ -738,6 +741,9 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>  			}
>  		}
>  	}
> +
> +	data->alternate_sync_async = false;
> +	data->atomic_path = false;
>  }
>  
>  static data_t data;
> @@ -757,6 +763,9 @@ igt_main
>  
>  		if (is_intel_device(data.drm_fd))
>  			data.bops = buf_ops_create(data.drm_fd);
> +
> +		data.alternate_sync_async = false;
> +		data.atomic_path = false;

It would be easier to maintain if we modularize cleanup steps in a
single function, such as, `test_data_cleanup`. WDYT?

BR,

Melissa

>  	}
>  
>  	igt_describe("Verify the async flip functionality and the fps during async flips");
> @@ -766,8 +775,6 @@ igt_main
>  
>  		igt_describe("Wait for page flip events in between successive asynchronous flips");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> -			data.alternate_sync_async = false;
> -			data.atomic_path = false;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
>  			else
> @@ -777,7 +784,6 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive "
>  			     "asynchronous flips using atomic path");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> -			data.alternate_sync_async = false;
>  			data.atomic_path = true;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
> @@ -788,7 +794,6 @@ igt_main
>  		igt_describe("Alternate between sync and async flips");
>  		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>  			data.alternate_sync_async = true;
> -			data.atomic_path = false;
>  			run_test(&data, test_async_flip);
>  		}
>  
> @@ -802,7 +807,6 @@ igt_main
>  		igt_describe("Verify that the async flip timestamp does not "
>  			     "coincide with either previous or next vblank");
>  		igt_subtest_with_dynamic("test-time-stamp") {
> -			data.atomic_path = false;
>  			run_test(&data, test_timestamp);
>  		}
>  
> @@ -825,7 +829,6 @@ igt_main
>  			      "PSR2 sel fetch causes cursor to be added to primary plane "
>  			      "pages flips and async flip is not supported in cursor\n");
>  
> -		data.atomic_path = false;
>  		run_test(&data, test_cursor);
>  	}
>  
> @@ -853,7 +856,6 @@ igt_main
>  		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>  						       I915_FORMAT_MOD_Y_TILED));
>  
> -		data.atomic_path = false;
>  		run_test(&data, test_invalid);
>  	}
>  
> @@ -876,7 +878,6 @@ igt_main
>  		/* Devices without CRC can't run this test */
>  		igt_require_pipe_crc(data.drm_fd);
>  
> -		data.atomic_path = false;
>  		run_test(&data, test_crc);
>  	}
>  
> -- 
> 2.49.0
> 
