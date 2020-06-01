Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DA36E20B
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 09:25:10 +0000 (UTC)
Date: Mon, 1 Jun 2020 12:25:06 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200601092506.ied4ujq2cuuvsukl@ahiler-desk1.fi.intel.com>
References: <20200529195850.8664-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529195850.8664-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kms_chamelium: Wait for the sink to
 reconnect after an FSM DPMS-off
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
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 29, 2020 at 10:58:50PM +0300, Imre Deak wrote:
> After Chamelium does an FSM signaling by deasserting its HPD, in
> response to which the test's FSM handler disables the output with a
> DPMS-off, we have to make sure that Chamelium has reasserted its HPD
> before we re-enable the output with DPMS-on (for instance to avoid link
> training errors, or enable the output in the wrong TypeC mode). To
> ensure this wait for the connector state to become asserted.
> 
> On TypeC connectors with an enabled mode the IOM firmware will signal a
> connected state (via a connect hotplug interrupt delivered to the
> driver) in a deferred way only after the mode is disabled. So wait for
> the connected state after DPMS-off.
> 
> Reported-and-tested-by: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

and merged, thanks!
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
