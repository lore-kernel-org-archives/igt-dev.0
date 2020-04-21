Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBABD6E2DE
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 18:36:37 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <6df922c2-fead-47b2-a447-7d224803cff6@gmail.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-8-juhapekka.heikkila@gmail.com>
 <158749264502.11203.2272792297388581562@build.alporthouse.com>
 <6df922c2-fead-47b2-a447-7d224803cff6@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158749418519.11203.15109734100555990375@build.alporthouse.com>
Date: Tue, 21 Apr 2020 19:36:25 +0100
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

Quoting Juha-Pekka Heikkila (2020-04-21 19:30:00)
> On 21.4.2020 21.10, Chris Wilson wrote:
> > Quoting Juha-Pekka Heikkila (2020-04-21 17:17:24)
> >> From: Jani Nikula <jani.nikula@intel.com>
> >>
> >> Functional change switches from igt_require to igt_assert on errors.
> > 
> > Adding entirely unused functions for fun?
> 
> That probably is from legacy, Jani's igt branch that I took was not very 
> new.
> 
> Chris, you have opinion about patch 6/8 on what's going on there? 
> There's in __igt_params_open(..) those two blocks of file checking which 
> on first block is checking if wanted parameter file is in selected 
> device directory and second block is just about 'guessing' default 
> device name. I'm somehow thinking there would be easier way for those 
> but I didn't find other way so I ended up reading and parsing files. It 
> seems to work but not feeling comfortable with it.

Heh, not guilty of igt_set_module_param(). I would rip out any implicit
device lookup and make sure there's always a device fd to work with. If
that is not possible, then make the module name a parameter.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
