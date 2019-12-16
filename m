Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58BF6E528
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2019 13:27:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191216120923.2376-2-tvrtko.ursulin@linux.intel.com>
References: <20191216120923.2376-1-tvrtko.ursulin@linux.intel.com>
 <20191216120923.2376-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <157650281113.2428.13876026348312542903@skylake-alporthouse-com>
Date: Mon, 16 Dec 2019 13:26:51 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] intel-gpu-top: Support for client
 stats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Brian Welty <brian.welty@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2019-12-16 12:09:23)
> +static void __restore_stats(void)
> +{
> +       int ret;
> +
> +       if (__stats_enabled)
> +               return;
> +
> +       ret = __set_stats(false);

Therein lies the problem with a global toggle. :(

Hmm, if our stats toggling is always in process_csb() responding to
events, they shouldn't affect execution latency... I think you have made
them cheap enough to consider always enabling. Let's see.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
