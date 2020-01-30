Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C3B6E5AB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 10:22:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200129181601.15918-1-imre.deak@intel.com>
 <20200129181601.15918-6-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-6-imre.deak@intel.com>
Message-ID: <158037974995.16598.9824585981329699370@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 10:22:29 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 6/9] lib/igt_fb: Fall back from gtt map
 to coherent map on platforms w/o aperture
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Imre Deak (2020-01-29 18:15:58)
> Use a device coherent map instead of GGTT map on platforms w/o an
> aperture.

The decision tree here leads much to be desired. The usual practice is
to use sw detiling since that has been faster than HW since byt.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
