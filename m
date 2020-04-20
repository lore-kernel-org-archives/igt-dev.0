Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28E86E46C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 08:00:11 +0000 (UTC)
Date: Mon, 20 Apr 2020 06:32:27 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200420010227.GA12778@intel.com>
References: <20200419212613.11505-1-kunal1.joshi@intel.com>
 <20200420075512.ehv5w2yiikymql5h@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420075512.ehv5w2yiikymql5h@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_chamelium: Capture on
 type-c
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
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-04-20 at 10:55:12 +0300, Arkadiusz Hiler wrote:
> On Mon, Apr 20, 2020 at 02:56:13AM +0530, Kunal Joshi wrote:
> > Refreshing the connector everytime and also resetting the
> > state to get HPD reliably.
> 
> Code looks good, but please consider adding a bit more of explanation
> here, something like:
> 
> Chamelium uses HPD pulses to singal the need for a receiver reset using
> DPMS cycle. Some connectors (e.g. DP over TypeC) have limitations and
> will receive just a single such pulse and discard the rest. This lasts
> until we disable the mode completetly and only then reenable it.
> 
> Receiver reset is always required after we set a new mode, so let's
> disable the mode (reset_state() does that) before we switch to a new
> mode. With this we will get the HPD pulses reliably for each iteration
> over all the supoprted modes.
> 
> There are alse targeted test for HPD pulse handling - dp-hpd-*.
>
Yes arek will add this explanation in the commit keeping your rb
Thanks Kunal.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
