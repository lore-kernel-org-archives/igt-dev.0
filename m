Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECCF89AAE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 17:02:52 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200504073707.268608-1-arkadiusz.hiler@intel.com>
References: <20200504073707.268608-1-arkadiusz.hiler@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 09 Nov 2020 17:02:48 +0000
Message-ID: <160494136881.21258.1784453412780097986@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib: Support multiple filters
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arkadiusz Hiler (2020-05-04 08:37:05)
> This patch brings back support for multiple filters that was in the
> original series by Zbyszek.

How is this filtering meant to work for tests that try to open two
different devices? Shouldn't the igt_device_filter_count() take into
account whether the filter even matches the desired device?
Should all of the filters include all possible devices?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
