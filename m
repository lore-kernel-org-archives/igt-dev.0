Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6631B6E326
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 18:11:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200421161725.12249-8-juhapekka.heikkila@gmail.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-8-juhapekka.heikkila@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158749264502.11203.2272792297388581562@build.alporthouse.com>
Date: Tue, 21 Apr 2020 19:10:45 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] lib/debugfs: use regular module
 param functions for prefault_disable
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Juha-Pekka Heikkila (2020-04-21 17:17:24)
> From: Jani Nikula <jani.nikula@intel.com>
> 
> Functional change switches from igt_require to igt_assert on errors.

Adding entirely unused functions for fun?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
