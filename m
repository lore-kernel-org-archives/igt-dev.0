Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8578BC36008
	for <igt-dev@archiver.kernel.org>; Sat, 29 Mar 2025 18:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E13610E2D6;
	Sat, 29 Mar 2025 18:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K0XAwRbU";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790CF10E2D6
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Mar 2025 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a4wlbrcQqLDvqoMNaDicbgTjx2wZsPTpDEwztHsXWC8=; b=K0XAwRbUavt96YHyw+k5PI50lv
 vmBkDFf11X9ndEcQpTy8GPx9PStBmEEbZSrnfQ27+whDd29ZYhHcFk5VHOetWF9mjaj590kdY0kqW
 yFNpGuUI0wXyb5BOe3xoqMpw2wChgC/BdlYXaTKAfg/o34Sp87Guw3wDlUUUuqPrMqbxymF6UWCn8
 4u3zwHBe2zz037ADb+NW1ED8Oe/gHq5ldDrSg19vvNWdggiD0VcTw+T6prlWriLkqZ9FIC4DDgjE4
 a39QBZDTwsgKc3hyf9zmH6NhEsJ56I3gY98iSPUW2AEwao4gQOokURFPFUYElOCV3R0hHoKZBgbGB
 SrSj57Hw==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tybJl-008Sv1-13; Sat, 29 Mar 2025 19:54:05 +0100
Date: Sat, 29 Mar 2025 15:53:51 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v4 2/3] kms_async_flips: Refactor data options
Message-ID: <uhzgtmlfgixhac2h3shv2bpuhyt5pispjdrikfzofdnprqqpnw@5jv7qzwe6oyd>
References: <20250327221601.19086-1-andrealmeid@igalia.com>
 <20250327221601.19086-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327221601.19086-3-andrealmeid@igalia.com>
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
> Setting the test data options as true and false for every test is error
> prone. Instead, reset all the data to false at the end of a test and
> just set the needed options to true before running a test.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 2975925c2..5c7e1ae13 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -230,6 +230,12 @@ static void test_init(data_t *data)
>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>  }
>  
> +static void test_finish(data_t *data)
> +{
> +	data->alternate_sync_async = false;
> +	data->atomic_path = false;
> +}
> +
>  static void test_init_fbs(data_t *data)
>  {
>  	int i;
> @@ -717,6 +723,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  			test(data);
>  		}
>  	}
> +
> +	test_finish(data);

In case of subtest failure, this `test_finish(data)` here never runs. I
think the more straighforward solution is just calling
`test_finish(data)` as the first step of any igt_subtest_with_dynamic(),
changing the name as it will be in the beginning of the test execution.

Another alternative would be use igt_fixture, but I think it might need
a huge refactor to rearrange the test subgroups.

Also here, you can check this issue by running it in a kernel without
atomic async flip support.

Melissa

>  }
>  
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
> @@ -750,6 +758,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>  			}
>  		}
>  	}
> +
> +	test_finish(data);
>  }
>  
>  static data_t data;
> @@ -778,8 +788,6 @@ igt_main
>  
>  		igt_describe("Wait for page flip events in between successive asynchronous flips");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> -			data.alternate_sync_async = false;
> -			data.atomic_path = false;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
>  			else
> @@ -789,7 +797,6 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive "
>  			     "asynchronous flips using atomic path");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> -			data.alternate_sync_async = false;
>  			data.atomic_path = true;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
> @@ -800,7 +807,6 @@ igt_main
>  		igt_describe("Alternate between sync and async flips");
>  		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>  			data.alternate_sync_async = true;
> -			data.atomic_path = false;
>  			run_test(&data, test_async_flip);
>  		}
>  
> @@ -814,7 +820,6 @@ igt_main
>  		igt_describe("Verify that the async flip timestamp does not "
>  			     "coincide with either previous or next vblank");
>  		igt_subtest_with_dynamic("test-time-stamp") {
> -			data.atomic_path = false;
>  			run_test(&data, test_timestamp);
>  		}
>  
> @@ -837,7 +842,6 @@ igt_main
>  			      "PSR2 sel fetch causes cursor to be added to primary plane "
>  			      "pages flips and async flip is not supported in cursor\n");
>  
> -		data.atomic_path = false;
>  		run_test(&data, test_cursor);
>  	}
>  
> @@ -865,7 +869,6 @@ igt_main
>  		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>  						       I915_FORMAT_MOD_Y_TILED));
>  
> -		data.atomic_path = false;
>  		run_test(&data, test_invalid);
>  	}
>  
> @@ -888,7 +891,6 @@ igt_main
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
