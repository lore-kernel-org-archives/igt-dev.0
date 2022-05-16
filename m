Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8066710EBD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 12:31:09 +0000 (UTC)
Date: Mon, 16 May 2022 14:30:58 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoJEAiNy8LwjpB6V@intel.intel>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/6] lib/igt_kmod: improve audio
 unbind logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

> +	/* Recursively remove all drivers that depend on drm_driver */
> +	for (j = 0; j < mod[i].num_required; j++) {
> +		pos = mod[i].required_by[j];
> +		if (who)
> +			*who = strdup(mod[pos].name);

how many who are we "strdupping"? Are they freed anywhere?

Andi

> +		/*
> +		 * If a sound driver depends on drm_driver, kill audio processes
> +		 * first, in order to make it possible to unload the driver
> +		 */
> +		if (strstr(mod[pos].name, "snd")) {
> +			if (igt_lsof_kill_audio_processes()) {
> +				ret = EACCES;
> +				goto ret;
> +			}
> +		}
> +		ret = igt_unload_driver(mod, num_mod, pos);
> +	}
> +
> +ret:
> +	free_module_ref(mod, num_mod);
> +
> +	return ret;
> +}
