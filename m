Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD87C52D6F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 12:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41EF89C49;
	Wed,  7 Aug 2024 12:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZllfbQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6192B89C49
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723035495; x=1754571495;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fcqBkdg6vC4ZzLKlCq7gJgDTIRbDZNLPFtX8fZDvUWg=;
 b=BZllfbQC8VnlYboeZnIHNIqzyobLKupVkOShqgxxWD15X6yW9y40MtkA
 Ckl+w6EyWIrzxuW0NTC2dM2UeCVi/53fp4gXxxMO43y8jB7Kw4YabtHpP
 DOdXfw7ozwl/YOYT2F+oiqwijW2NT6sIOkIDj9TD6uzikoPf4TTuwO37W
 Zp03t6Db+8nwIA59iHVd2bHk09vBWqnXz+psV4cdQmvwea038DjjtSHZ0
 hggvH8kTvQ0lGKmIuGTBPCkf1un/x0CO1cpSi1HhZepPrtTW9lqjFe7jS
 YrK/MutRYznJNRaSl6Ts9nsyP8w4nWqEQIhlI5gBepp7xbY0U8tNy8nqo g==;
X-CSE-ConnectionGUID: YuIeQBcSR8CqWpFutPgYcQ==
X-CSE-MsgGUID: gLzfgt0yQrmyakUhV6TuHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31674993"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="31674993"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 05:58:15 -0700
X-CSE-ConnectionGUID: hfb0k73mRW6YOCjaHS49RQ==
X-CSE-MsgGUID: eQargUS1QJasTInM2l6OvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="56535299"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 05:58:13 -0700
Message-ID: <f982c630-4a7b-48d3-b07d-b51ba3267f78@intel.com>
Date: Wed, 7 Aug 2024 14:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 8/8] tests/core_hotunplug: Print info between
 steps
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
 <20240805143713.76034-9-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240805143713.76034-9-kamil.konieczny@linux.intel.com>
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

On 05.08.2024 16:37, Kamil Konieczny wrote:
> There are some info printed directly into kernel dmesg before
> subtest steps. Turn comment before steps into direct prints
> to stdout to help differentiate which steps where a success
> and where it starts failing.
>
> Fixed also one misspelling s/realoading/reloading/
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

IGT is mostly very quiet, unless error occurs, then accumulated debug is 
printed.
This patch changes it, the output becomes chatty, could you explain more 
why such change,
why previous approach is not enough.

> ---
>   tests/core_hotunplug.c | 26 ++++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 51edee985..415c74381 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -184,12 +184,13 @@ static void prepare(struct hotunplug *priv)
>   	igt_assert_fd(priv->fd.sysfs_bus);
>   
>   	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
> +	igt_info("Preparations done\n");
>   }
>   
> -/* Unbind the driver from the device */
>   static void driver_unbind(struct hotunplug *priv, const char *prefix,
>   			  int timeout)
>   {
> +	igt_info("Unbind the driver from the device (bus: %s)\n", priv->dev_bus_addr);

I see inconsistent ways of printing priv->dev_bus_addr:
1. "...(bus: %s)\n"
2. "...(%s)\n"
3. "%s\n"

Another question: do we need to print it in multpile lines, maybe one 
line at the beginning would be enough.


>   	/*
>   	 * FIXME: on some devices, the audio driver (snd_hda_intel)
>   	 * binds into the i915 driver. On such hardware, kernel warnings
> @@ -216,11 +217,13 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
>   
>   	igt_assert_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0),
>   		     "Unbound device still present (%s)\n", priv->dev_bus_addr);
> +
> +	igt_info("Unbind done\n");
>   }
>   
> -/* Re-bind the driver to the device */
>   static void driver_bind(struct hotunplug *priv, int timeout)
>   {
> +	igt_info("Re-bind the driver to the device (bus: %s)\n", priv->dev_bus_addr);
>   	local_debug("%s\n", "rebinding the driver to the device");
with this we have after expansion:
igt_info
igt_debug
igt_kmsg

why do we need to print it twice on console, with different levels.

>   	priv->failure = "Driver re-bind failure!";
>   
> @@ -235,17 +238,19 @@ static void driver_bind(struct hotunplug *priv, int timeout)
>   		      "Rebound device not present (%s)!\n", priv->dev_bus_addr);
>   
>   	if (priv->snd_driver) {
> -		igt_info("Realoading %s\n", priv->snd_driver);
> +		igt_info("Reloading %s\n", priv->snd_driver);
>   		igt_kmod_load(priv->snd_driver, NULL);
>   		free(priv->snd_driver);
>   		priv->snd_driver = NULL;
>   	}
> +
> +	igt_info("Re-bind done\n");
>   }
>   
> -/* Remove (virtually unplug) the device from its bus */
>   static void device_unplug(struct hotunplug *priv, const char *prefix,
>   			  int timeout)
>   {
> +	igt_info("Remove (virtually unplug) the device from its bus (%s)\n", priv->dev_bus_addr);
>   	igt_require(priv->fd.sysfs_dev == -1);
>   
>   	/*
> @@ -267,7 +272,8 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>   				    O_DIRECTORY);
>   	igt_assert_fd(priv->fd.sysfs_dev);
>   
> -	local_debug("%sunplugging the device\n", prefix);
> +	igt_info("%sunplugging the device %s\n", prefix, priv->dev_bus_addr);
> +	local_debug("%sunplugging the device %s\n", prefix, priv->dev_bus_addr);
>   	priv->failure = "Device unplug failure!";
>   
>   	igt_set_timeout(timeout, "Device unplug timeout!");
> @@ -280,11 +286,13 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>   
>   	igt_assert_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0),
>   		     "Unplugged device still present (%s)\n", priv->dev_bus_addr);
> +
> +	igt_info("Unplug done\n");
>   }
>   
> -/* Re-discover the device by rescanning its bus */
>   static void bus_rescan(struct hotunplug *priv, int timeout)
>   {
> +	igt_info("Re-discover the device by rescanning its bus (%s)\n", priv->dev_bus_addr);
>   	local_debug("%s\n", "rediscovering the device");
>   	priv->failure = "Bus rescan failure!";
>   
> @@ -303,6 +311,8 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
>   		free(priv->snd_driver);
>   		priv->snd_driver = NULL;
>   	}
> +
> +	igt_info("Bus rescan done\n");
>   }
>   
>   static void cleanup(struct hotunplug *priv)
> @@ -317,6 +327,7 @@ static void cleanup(struct hotunplug *priv)
>   	}
>   
>   	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
> +	igt_info("Cleanup done\n");
>   }
>   
>   static bool local_i915_is_wedged(int i915)
> @@ -498,6 +509,8 @@ static bool healthcheck(struct hotunplug *priv, bool recover)
>   		node_healthcheck(priv,
>   				 FLAG_RENDER | (recover ? FLAG_RECOVER : 0));
>   
> +	igt_info("Healthcheck: %s\n", priv->failure ? "failed" : "ok");
> +

Before you use "done" here "ok", no big deal, just another ask for 
consistency :)

Regards
Andrzej


>   	return !priv->failure;
>   }
>   
> @@ -532,6 +545,7 @@ static void recover(struct hotunplug *priv)
>   	else if (faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0))
>   		driver_bind(priv, 60);
>   
> +	igt_info("Recovery: %s\n", priv->failure ? "failed" : "ok");
>   	if (priv->failure)
>   		igt_assert_f(healthcheck(priv, true), "%s\n", priv->failure);
>   }

