Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396EA6E29A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 13:16:30 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <1582286887-23159-1-git-send-email-juhapekka.heikkila@gmail.com>
 <158228779749.30577.13907167889704375473@skylake-alporthouse-com>
 <8b77c078-a89f-2b90-37bc-b7b2ee689866@gmail.com>
In-Reply-To: <8b77c078-a89f-2b90-37bc-b7b2ee689866@gmail.com>
Message-ID: <158229098521.30577.509445839669102035@skylake-alporthouse-com>
Date: Fri, 21 Feb 2020 13:16:25 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: increase
 timeout for nonblocking flip wait
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
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Juha-Pekka Heikkila (2020-02-21 13:12:46)
> On 21.2.2020 14.23, Chris Wilson wrote:
> > Quoting Juha-Pekka Heikkila (2020-02-21 12:08:07)
> >> When run on more than one monitor there may be modeset in queue
> >> which will block flip. Kernel will timeout with modeset at
> >> ten seconds so lets wait in test also that same ten seconds at
> >> maximum.
> > 
> > 10s! You are joking, right? For a modeset that should not be there?
> 
> 10s sounded quite big number to me too but that is from Ville. This test 
> is now failing because modeset + flip take more than one second, on my 
> ICL box with eDP + HDMI connected it becomes 1.19s. Arek is talking 
> about test box where it is more than two seconds. Anyway if 10s is what 
> kernel is waiting in the worst case I don't think test should be more 
> strict.

I think the kernel is broken. From a UX perspective that needs fixing.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
