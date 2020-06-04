Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6E36E13A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2020 09:31:34 +0000 (UTC)
Date: Thu, 4 Jun 2020 12:31:30 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200604093130.76ijafuv3q7jgnxf@ahiler-desk1.fi.intel.com>
References: <20200603183417.14626-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603183417.14626-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Force reprobe
 after replugging the connector
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 09:34:17PM +0300, Imre Deak wrote:
> After replugging a connector and the kernel reports the connector as
> connected the cached modes returned by drmModeGetConnectorCurrent() (the
> kernel's cached list of modes) may be stale. The modes will be only
> updated by a full reprobe. Ensure this by setting output->force_reprobe
> which will result in calling drmModeGetConnector().
> 
> This fixes sporadic test failures due to seeing no modes unexpectedly.
> So far things happened to work, because some in-kernel user of the
> output - like fbdev - does a full reprobe sometime after the hotplug
> event.
> 
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
