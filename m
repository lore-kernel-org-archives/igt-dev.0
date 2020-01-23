Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6763C6FBEC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 11:23:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200123111536.28216-1-petri.latvala@intel.com>
References: <20200123111536.28216-1-petri.latvala@intel.com>
Message-ID: <157977861527.19995.15199188989543137023@skylake-alporthouse-com>
Date: Thu, 23 Jan 2020 11:23:35 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Don't check for taints when not
 configured for it
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-01-23 11:15:36)
> If someone wants to execute tests without aborting when tainted, they
> get all their tests just straight up killed on the first taint without
> actually aborting execution. Obey their wishes and keep running.

They shouldn't, but whatever. (Why you wouldn't just fix the problem and
move on to the next? You have to fix it before you can trust any
results, so.... Just feels lazy, one should not tolerate any broken
window.)

> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
