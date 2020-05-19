Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CEF6E550
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 13:52:03 +0000 (UTC)
Date: Tue, 19 May 2020 16:52:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200519135201.GD9497@platvala-desk.ger.corp.intel.com>
References: <20200519134405.1876899-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519134405.1876899-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Remove early
 has_known_intel_chipset() check
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 19, 2020 at 02:44:05PM +0100, Chris Wilson wrote:
> When opening a specific driver, open that driver. Once we have the
> device fd, we can then do feature checks that the tests *actually*
> require.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Yeah I've never seen this do anything other than "oh we forgot to
update intel_chipset.h"


Acked-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
