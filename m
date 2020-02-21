Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2241B6E296
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 12:23:21 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <1582286887-23159-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1582286887-23159-1-git-send-email-juhapekka.heikkila@gmail.com>
Message-ID: <158228779749.30577.13907167889704375473@skylake-alporthouse-com>
Date: Fri, 21 Feb 2020 12:23:17 +0000
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

Quoting Juha-Pekka Heikkila (2020-02-21 12:08:07)
> When run on more than one monitor there may be modeset in queue
> which will block flip. Kernel will timeout with modeset at
> ten seconds so lets wait in test also that same ten seconds at
> maximum.

10s! You are joking, right? For a modeset that should not be there?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
