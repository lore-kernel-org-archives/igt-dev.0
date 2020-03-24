Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8866E10A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 09:34:04 +0000 (UTC)
Date: Tue, 24 Mar 2020 08:06:10 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200324023610.GA21130@intel.com>
References: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] chamelium: Retry XMLRPC call when
 chamelond fails talking with a receiver
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org, imre.deak@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-24 at 10:38:48 +0200, Arkadiusz Hiler wrote:
> All the I2C errors we get from chameleond happen when it is talking the
> receiver and seem to have nothing to do with the HDMI/DisplayPort
> upstream.
> 
> Let's try reaching the receiver 3 times before we give up and settle on
> an error.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/217
> Issue: https://bugs.chromium.org/p/chromium/issues/detail?id=993738
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
