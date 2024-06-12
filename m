Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0ABC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D43910E7A6;
	Wed, 12 Jun 2024 07:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TimXK6I0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7E810E7A6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718175743; x=1749711743;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+PjNsnQFXBPVrhXY+lPt9RegwV8EefLF4TYXPgy1JS8=;
 b=TimXK6I0VGty0hX39zkYZLOeeX4e85P2XsZUUq7wDX2vOAEVcfa/f6qM
 bOuOC8Jx+3gSZpqKUmPZokTPK7Eeu/WcvguKEuz0BCUnW2DuBj294pqLG
 D2Q3zaWumrGhK3YjubI/uPSwsDh0YWNbornqsr1hPQQcIPxgt8H7vv1LJ
 mj8BxI1ug9sT54F91xt34PRMyD5RDo+yRWwQIYMyRz6c2RL2KatwcSYzx
 kQbTt7cEtXszYqjPgmXKSg2hRk5A5n3uBX6DuZpSSFopXMvX5BuThaAYY
 dZH0l5FNjy5izkjtTlw0FXH627ae3m7bTQru++zcGwdhloifz9XkDrPWd A==;
X-CSE-ConnectionGUID: OnN+bC6uS3a1k5ND1fVMIw==
X-CSE-MsgGUID: JzY/BqpVSlmV7q1ckUovxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25550640"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="25550640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:02:22 -0700
X-CSE-ConnectionGUID: Woc6yhMwQWKigMII9r1nWw==
X-CSE-MsgGUID: xa6bhBfHTFKcJUDJc/qcgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39618899"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:02:22 -0700
Message-ID: <118550df-816d-497e-b657-cad70317bfed@intel.com>
Date: Wed, 12 Jun 2024 09:02:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/7] tests/core_hotplug: Add checks to subtests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 07.06.2024 17:36, Kamil Konieczny wrote:
> Currently health checks and recovery are performed in fixtures
> outside of subtest and even without any subtest running. Whats
> more, after one subtest fail, all other checks will fail and
> will print quite a few logs. Additionally they are also meant
> to check health of device after a test and make a subtest fail.
>
> Lets try to fail early inside subtest and lower number of checks
> to those really needed and do them only once per fixture, which
> should make reading logs easier.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/core_hotunplug.c | 118 +++++++++++++++++++++++++++--------------
>   1 file changed, 78 insertions(+), 40 deletions(-)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 3971b94ff..7ed9abd37 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -84,6 +84,9 @@
>   
>   IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
>   
> +#define ACTION_RECOVER		(1 << 0)
> +#define ACTION_POST_CHECK	(1 << 1)
> +
>   struct hotunplug {
>   	struct {
>   		int drm;
> @@ -98,6 +101,7 @@ struct hotunplug {
>   	bool has_intel_perf;
>    	char *snd_driver;
>   	int chipset;
> +	int checks;
>   };
>   
>   /* Helpers */
> @@ -509,8 +513,11 @@ static void pre_check(struct hotunplug *priv)
>   static void recover(struct hotunplug *priv)
>   {
>   	bool late_close = priv->fd.drm >= 0;
> +	int needs_recover = priv->checks & ACTION_RECOVER;
>   
>   	cleanup(priv);
> +	if (!needs_recover)
> +		return;
>   
>   	if (!priv->failure && late_close)
>   		igt_ignore_warn(healthcheck(priv, false));
> @@ -528,10 +535,18 @@ static void recover(struct hotunplug *priv)
>   
>   	if (priv->failure)
>   		igt_assert_f(healthcheck(priv, true), "%s\n", priv->failure);
> +
> +	priv->checks &= ~ACTION_RECOVER;
>   }

With this change recover becomes kind of recover_if_requested.

>   
>   static void post_healthcheck(struct hotunplug *priv)
>   {
> +	bool needs_post_check = priv->checks & ACTION_POST_CHECK;
> +
> +	priv->checks = 0;
> +	if (!needs_post_check)
> +		return;
> +

Wouldn't be safer to clean only appropriate flag:

+	if (!needs_post_check)
+		return;
+	priv->checks &= ~ACTION_POST_CHECK;

>   	igt_abort_on_f(priv->failure, "%s\n", priv->failure);
>   
>   	cleanup(priv);
> @@ -667,6 +682,19 @@ static void hotreplug_lateclose(struct hotunplug *priv)
>   }
>   
>   /* Main */
> +#define RECOVER	igt_fixture { \
> +		recover(&priv); \
> +	}
> +
> +#define POST_CHECK igt_fixture { \
> +		post_healthcheck(&priv); \
> +	}
> +
> +static void recover_and_post_healthcheck(struct hotunplug *priv)
> +{
> +	recover(priv);
> +	post_healthcheck(priv);
> +}

Since you are proposing flags to trigger recover and check with cleanup, 
why do not
do it in one function, for example post_healthcheck:

static void post_healthcheck(struct hotunplug *priv)

{
     if (priv->checks & ACTION_RECOVER)
         recover(priv);
     priv->checks &= ~ACTION_RECOVER;

     if (!(priv->checks & ACTION_POST_CHECK))
         return;
     ...
}

and use post_healthcheck everywhere, and drop:
- recover_and_post_healthcheck,
- RECOVER

Regards
Andrzej

>   
>   igt_main
>   {
> @@ -677,6 +705,7 @@ igt_main
>   		.has_intel_perf = false,
>   		.snd_driver	= NULL,
>   		.chipset	= DRIVER_ANY,
> +		.checks		= 0,
>   	};
>   
>   	igt_fixture {
> @@ -704,100 +733,109 @@ igt_main
>   
>   	igt_subtest_group {
>   		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
> -		igt_subtest("unbind-rebind")
> +		igt_subtest("unbind-rebind") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			unbind_rebind(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if a device believed to be closed can be cleanly unplugged, then restored");
> -		igt_subtest("unplug-rescan")
> +		igt_subtest("unplug-rescan") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			unplug_rescan(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if the driver can be cleanly unbound from an open device, then released and rebound");
> -		igt_subtest("hotunbind-rebind")
> +		igt_subtest("hotunbind-rebind") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			hotunbind_rebind(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if an open device can be cleanly unplugged, then released and restored");
> -		igt_subtest("hotunplug-rescan")
> +		igt_subtest("hotunplug-rescan") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			hotunplug_rescan(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance");
> -		igt_subtest("hotrebind")
> +		igt_subtest("hotrebind") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			hotrebind(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if a hot unplugged and still open device can be cleanly restored");
> -		igt_subtest("hotreplug")
> +		igt_subtest("hotreplug") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			hotreplug(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if a hot unbound driver instance still open after hot rebind can be cleanly released");
> -		igt_subtest("hotrebind-lateclose")
> +		igt_subtest("hotrebind-lateclose") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			hotrebind_lateclose(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
>   	igt_subtest_group {
>   		igt_describe("Check if an instance of a still open while hot replugged device can be cleanly released");
> -		igt_subtest("hotreplug-lateclose")
> +		igt_subtest("hotreplug-lateclose") {
> +			priv.checks = ACTION_RECOVER | ACTION_POST_CHECK;
>   			hotreplug_lateclose(&priv);
> +			recover_and_post_healthcheck(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER;
>   	}
>   
> -	igt_fixture {
> -		post_healthcheck(&priv);
> +	POST_CHECK;
>   
> +	igt_fixture {
>   		igt_ignore_warn(close(priv.fd.sysfs_bus));
>   		igt_ignore_warn(close(priv.fd.sysfs_drv));
>   	}

