Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65F76E85B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Feb 2021 10:28:42 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210208102439.29463-1-petri.latvala@intel.com>
References: <20210208102439.29463-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 08 Feb 2021 10:28:38 +0000
Message-ID: <161278011876.11090.11393620057650544506@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Handle graceful exit regardless
 of log level
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

Quoting Petri Latvala (2021-02-08 10:24:39)
> The SIGHUP handling was incorrectly done only when log level was at
> least 'normal'.

Ah _log_ level. Now only the outf() is under the verbosity flag.

> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
but I may have said the same before without spotting it last time.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
