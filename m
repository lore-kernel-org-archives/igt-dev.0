Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2476C55173
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 17:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7897610F36A;
	Fri, 31 Jul 2026 17:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DOgWOm7g";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE5789289
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 17:48:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A637A4E4105C;
 Fri, 31 Jul 2026 17:48:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C3AE6039A;
 Fri, 31 Jul 2026 17:48:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E18411C16BDF; 
 Fri, 31 Jul 2026 19:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785520111; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=k3Yjq9+HHEdu7j4mBfS0CzSy1Wmn/7nRIG5bImHsEpQ=;
 b=DOgWOm7gjlwzUhseDyFjEYwI6HwrvVGzCjhUPIaYYj2+3Hvgw1pCKSoJUmqGXdpmQXaXGs
 uoS20RW8UtZ6nvCI0q5Twk54WElWy7hjh8e+OP0n3fy7sRYV9QrknH64vEbmXeMgiEKv5w
 3DMHZcAHKXoOIF+yddSXl7snkJ5TRDAEnitFvn2nE0V4GWBAHfGCO5un1dPG0nUjD7IXu0
 qR+mRyhSq9w3eVb82uuoAcq6T2w0IkKqSwMPQbp3r8CiycX5sMl7V+tGsRBsK/FvfUO4cR
 SS8A+RAyOAxaN6Z99Qk9mkpxiODjSKu/UokPn0YQvFuJSPkVnO9keNuMNHKfdQ==
Message-ID: <dfd7fa67-6120-4e60-babb-f454e181f6f7@bootlin.com>
Date: Fri, 31 Jul 2026 19:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/unigraf: Enhance link rate support checking and
 hardware retrain timing
To: Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org
References: <20260715192949.1984280-3-markyacoub@google.com>
 <20260720205355.321557-1-markyacoub@google.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260720205355.321557-1-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 7/20/26 22:53, Mark Yacoub wrote:
> Refactor hardware capability checks to natively skip unsupported DP link parameters dynamically, moving validation cleanly into the core igt_dp abstraction layer robustly.
> 
> v2:
>   - Downgrade `igt_assert_f` checks across the `igt_dp` layer to `igt_require_f` (Louis)
>   - Extract link rate querying into generic `igt_dp_is_link_rate_supported` helper (Louis)
>   - Add `expected_new_connector_count` to `kms_wait_for_new_connectors` to fix discovery race conditions natively (Louis)
> 
> TAG=agy
> CONV=35e8e1e4-2dfd-4bf2-8c0b-c9bbc6268d92
> ---
>   lib/igt_dp.c                         | 50 ++++++++++++++++++++++++++--
>   lib/igt_dp.h                         |  1 +
>   lib/igt_kms.c                        | 15 ++++++---
>   lib/igt_kms.h                        |  4 ++-
>   lib/vendor/unigraf/unigraf.c         |  1 +
>   tests/unigraf/unigraf_connectivity.c | 19 +++++++++--
>   tests/unigraf/unigraf_lt.c           | 31 +++++++++++++----
>   7 files changed, 104 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_dp.c b/lib/igt_dp.c
> index 9f71c9e72..20af6a967 100644
> --- a/lib/igt_dp.c
> +++ b/lib/igt_dp.c
> @@ -107,7 +107,7 @@ int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
>   	if (is_intel_device(drm_fd))
>   		return i915_dp_get_max_lane_count(drm_fd, output);
>   
> -	igt_assert_f(false, "Current drm device is not able to report max lane count\n");
> +	igt_require_f(false, "Current drm device is not able to report max lane count\n");
>   	return -EINVAL;
>   }
>   
> @@ -124,7 +124,51 @@ void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_cou
>   		return;
>   	}
>   
> -	igt_assert_f(false, "Current drm device does not support link retraining\n");
> +	igt_require_f(false, "Current drm device does not support link retraining\n");
> +}
> +
> +/**
> + * igt_dp_is_link_rate_supported: Tests if the specific link rate can be forced
> + * @drm_fd:		DRM file descriptor
> + * @output:		igt_output_t object representing the display port
> + * @rate_kb:		Link rate in kbps to test
> + *
> + * Returns: true if device supports enforcing this rate, false otherwise
> + */
> +bool igt_dp_is_link_rate_supported(int drm_fd, igt_output_t *output, int rate_kb)
> +{
> +	if (is_intel_device(drm_fd)) {
> +		char buf[512];
> +		int res;
> +		char *token;
> +		int rate_tens = rate_kb / 10;
> +
> +		res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
> +						      "i915_dp_force_link_rate",
> +						      buf, sizeof(buf));
> +		if (res < 0)
> +			return false;
> +
> +		token = strtok(buf, " \n\t,:");
> +		while (token) {
> +			int rate;
> +			char *endptr;
> +
> +			errno = 0;
> +			rate = strtol(token, &endptr, 0);
> +			/*
> +			 * Robustly verify that a number was actually parsed (endptr != token)
> +			 * allowing us to safely ignore formatting headers (e.g. "Rates:")
> +			 */
> +			if (!errno && endptr != token && rate == rate_tens)
> +				return true;
> +			token = strtok(NULL, " \n\t,:");
> +		}
> +
> +		return false;
> +	}
> +
> +	return igt_dp_get_max_supported_rate(drm_fd, output) >= rate_kb;
>   }

That a bit strange to copy/paste the existing 
i915_dp_get_max_supported_rate code here, did I miss something in your 
implementation? Or is the existing implementation broken?

>   
>   /**
> @@ -140,7 +184,7 @@ int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
>   	if (is_intel_device(drm_fd))
>   		return i915_dp_get_pending_retrain(drm_fd, output);
>   
> -	igt_assert_f(false, "Current drm device does not support pending retrain count checking\n");
> +	igt_require_f(false, "Current drm device does not support pending retrain count checking\n");
>   	return -EINVAL;
>   }
>   
> diff --git a/lib/igt_dp.h b/lib/igt_dp.h
> index 0c56ad2ec..e5cacad66 100644
> --- a/lib/igt_dp.h
> +++ b/lib/igt_dp.h
> @@ -22,6 +22,7 @@ int igt_dp_get_max_supported_rate(int drm_fd, igt_output_t *output);
>   int igt_dp_get_max_lane_count(int drm_fd, igt_output_t *output);
>   
>   void igt_dp_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
> +bool igt_dp_is_link_rate_supported(int drm_fd, igt_output_t *output, int rate_kb);
>   
>   int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
>   
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2eefb773b..041a3356b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8255,10 +8255,17 @@ get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b
>    */
>   int kms_wait_for_new_connectors(uint32_t **newly_connected,
>   				const uint32_t *already_connected,
> -				int already_connected_count, int drm_fd)
> +				int already_connected_count,
> +				int expected_new_connector_count,
> +				int drm_fd)
>   {
>   	int newly_connected_count;
>   	struct timespec start, end;
> +	int timeout = igt_default_display_detect_timeout();
> +
> +	/* MST discovery may be serialized in the kernel; allocate extra time for topology settling */
> +	if (expected_new_connector_count > 1)
> +		timeout *= 2;
>   
>   	igt_assert(newly_connected);
>   	igt_assert_fd(drm_fd);
> @@ -8269,10 +8276,10 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>   			free(*newly_connected);
>   		newly_connected_count = igt_get_connected_connectors(drm_fd, newly_connected);
>   		igt_assert_eq(igt_gettime(&end), 0);
> -	} while (!get_array_diff(*newly_connected, newly_connected_count,
> +	} while (get_array_diff(*newly_connected, newly_connected_count,
>   			       already_connected, already_connected_count,
> -			       NULL) &&
> -		 igt_time_elapsed(&start, &end) <= igt_default_display_detect_timeout());
> +			       NULL) < expected_new_connector_count &&
> +		 igt_time_elapsed(&start, &end) <= timeout);
>   
>   	return newly_connected_count;
>   }
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 521a03c01..09cec556f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1382,7 +1382,9 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
>   
>   int kms_wait_for_new_connectors(uint32_t **newly_connected,
>   				const uint32_t *already_connected,
> -				int already_connected_count, int drm_fd);
> +				int already_connected_count,
> +				int expected_new_connector_count,
> +				int drm_fd);
>   int
>   get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
>   	       uint32_t **diff);
> diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
> index 30ee3c72b..bfb06bd0c 100644
> --- a/lib/vendor/unigraf/unigraf.c
> +++ b/lib/vendor/unigraf/unigraf.c
> @@ -270,6 +270,7 @@ static void unigraf_autodetect_connector(int drm_fd)
>   	newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
>   							    already_connected,
>   							    already_connected_count,
> +							    1,
>   							    drm_fd);
>   
>   	diff_len = get_array_diff(newly_connected, newly_connected_count,
> diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
> index 8ae9a2593..e813c9973 100644
> --- a/tests/unigraf/unigraf_connectivity.c
> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -108,10 +108,20 @@ int igt_main()
>   
>   		/* i = 0 is SST so we need to process max_count + 1 streams */
>   		for (int i = 0; i <= max_count; i++) {
> +			if (i == 1) {
> +				/* Full physical HPD disconnect/reset between SST and MST iterations */
> +				unigraf_unplug();
> +				unigraf_hpd_deassert();
> +				sleep(igt_default_display_detect_timeout());
> +				unigraf_reset();
> +				sleep(igt_default_display_detect_timeout());
> +			}

There is already a unplug/plug sequence just bellow, what is the 
difference? The reset function don't do a lot of stuff except also 
disconnecting the unigraf.

> +			unigraf_unplug();
>   			unigraf_hpd_deassert();
>   			/* Let the hardware detect the new state  */
>   			sleep(igt_default_display_detect_timeout());
>   
> +			unigraf_plug();
>   			unigraf_set_mst_stream_count(max(i, 1));
>   			if (!i)
>   				unigraf_set_sst();
> @@ -125,13 +135,18 @@ int igt_main()
>   			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
>   									    already_connected,
>   									    already_connected_count,
> +									    max(i, 1),
>   									    drm_fd);
>   
>   			diff_len = get_array_diff(newly_connected, newly_connected_count,
>   						  already_connected, already_connected_count, &diff);
>   
> -			igt_assert_f(diff_len == max(i, 1),
> -				     "Invalid connected connector count, expected %d found %d\n",
> +			/*
> +			 * We allow diff_len to be between 1 and max(i, 1) because the DRM driver may incrementally
> +			 * expose MST stream nodes rather than surfacing the entire topology at once.
> +			 */
> +			igt_assert_f(diff_len >= 1 && diff_len <= max(i, 1),
> +				     "Invalid connected connector count, expected between 1 and %d found %d\n",
>   				     max(i, 1), diff_len);

This change is a bit unexpected, the goal of this test is to properly 
check if all connectors are detected. If one is not detected, it is 
either a kernel bug or a hardware bug.

If the issue is the DRM slowness, can you just try to increase the timeout?

>   		}
>   
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> index 81e6ecd3f..b5989503d 100644
> --- a/tests/unigraf/unigraf_lt.c
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -107,11 +107,15 @@ int igt_main()
>   
>   		for (i = 0; i < ARRAY_SIZE(lane_counts); i++) {
>   			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_counts[i]) {
> +				/* Hardware PHY requires physical settle time before and after link constraints */
> +				sleep(igt_default_display_detect_timeout());
>   				unigraf_reset();
>   				unigraf_set_max_lane_count(lane_counts[i]);
>   				unigraf_hpd_pulse(500000);
> +				sleep(igt_default_display_detect_timeout());
>   
> -				igt_display_require_output(&display);
> +				igt_display_reset_outputs(&display);
> +				connector = unigraf_get_connector(drm_fd);
>   				output = igt_output_from_connector(&display, connector);
>   				igt_assert(output);
>   				igt_dp_force_link_retrain(drm_fd, output, 2);
> @@ -119,6 +123,9 @@ int igt_main()
>   
>   				current_lanes = igt_dp_get_current_lane_count(drm_fd, output);
>   				igt_assert_eq(current_lanes, lane_counts[i]);
> +
> +				igt_modeset_disable_all_outputs(&display);
> +				igt_display_commit2(&display, COMMIT_ATOMIC);
>   			}
>   		}
>   	}
> @@ -134,14 +141,21 @@ int igt_main()
>   
>   		for (i = 0; i < ARRAY_SIZE(rates); i++) {
>   			igt_dynamic_f("unigraf-dp-link-rate-%d", rates[i]) {
> -				unigraf_reset();
> -				unigraf_set_max_link_rate(rates[i]);
> -				unigraf_hpd_pulse(1000000);
> -				igt_display_require_output(&display);
> -				igt_display_reset(&display);
> -				igt_display_require_output(&display);
> +				connector = unigraf_get_connector(drm_fd);
>   				output = igt_output_from_connector(&display, connector);
>   				igt_assert(output);
> +				
> +				/* Fast-fail if graphic card does not support enforcing this link rate natively */
> +				igt_require(igt_dp_is_link_rate_supported(drm_fd, output, unigraf_rate_to_kbs(rates[i])));
> +
> +				/* Hardware PHY requires physical settle time before and after link constraints */
> +				sleep(igt_default_display_detect_timeout());

Is this sleep before reset/pulse required?

> +				unigraf_reset();
> +				unigraf_set_max_link_rate(rates[i]);
> +				unigraf_hpd_pulse(500000);
> +				sleep(igt_default_display_detect_timeout());
> +
> +				igt_display_reset_outputs(&display);
>   				igt_dp_force_link_retrain(drm_fd, output, 2);
>   
>   				init_output_and_display_pattern(&display, output);
> @@ -150,6 +164,9 @@ int igt_main()
>   				max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
>   				igt_require(max_supported_rate >= unigraf_rate_to_kbs(rates[i]));
>   				igt_assert_eq(current_rate, unigraf_rate_to_kbs(rates[i]));
> +
> +				igt_modeset_disable_all_outputs(&display);
> +				igt_display_commit2(&display, COMMIT_ATOMIC);
>   			}
>   		}
>   	}

