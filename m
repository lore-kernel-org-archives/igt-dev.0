Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2F89D66
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 09:16:43 +0000 (UTC)
Date: Mon, 23 Mar 2020 11:15:20 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200323091520.46mxvt6jva2rezuy@ahiler-desk1.fi.intel.com>
References: <20200323084828.20695-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323084828.20695-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Fix waiting for
 hotplug uevents
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

On Mon, Mar 23, 2020 at 10:48:28AM +0200, Imre Deak wrote:
> The driver can emit multiple hotplug events in response to a hotplug
> interrupt, which may cause tests fail receiving a spurious early hotplug
> event and concluding that an expected state didn't get set. Let's use
> Arek's idea and wait for multiple hotplug events - with the current 20s
> timeout - rechecking if the expected state got set after each hotplug.
> 
> The reasons for multiple hotplug events I noticed are:
> - Both a get connector IOCTL and an HPD interrupt can generate a hotplug
>   event.
> - Resetting chamelium results in an intermittent state where HPD gets
>   asserted, generating a hotplug connect uevent, then HPD gets
>   deasserted generating the expected hotplug disconnect uevent.
> 
> Suggested-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
