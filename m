Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1265F6E332
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2020 16:15:51 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200427155138.853-1-ashutosh.dixit@intel.com>
References: <20200427155138.853-1-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158800414763.17035.6211739336197233181@build.alporthouse.com>
Date: Mon, 27 Apr 2020 17:15:47 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Delete
 gem_total_mappable_size()
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-04-27 16:51:38)
> gem_total_mappable_size() has no callers and calls the
> DRM_I915_GEM_GET_APERTURE ioctl using 'struct
> local_i915_gem_get_aperture' which has fields which are unsupported in
> the kernel. Delete the function.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

True. Still hardcoded where it matters most, for shame.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
