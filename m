Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7F289FF6
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2020 10:26:39 +0000 (UTC)
Date: Mon, 11 May 2020 13:26:35 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200511102533.pk5rrxp6b453u3zh@ahiler-desk1.fi.intel.com>
References: <20200510193551.9818-1-kunal1.joshi@intel.com>
 <20200510193551.9818-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200510193551.9818-2-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_chamelium Fix DP FSM in
 dp-mode-timings
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 11, 2020 at 01:05:50AM +0530, Kunal Joshi wrote:
> Receiver reset is always required after we set a new mode, so let's disable
> the mode (reset_state() does that) before we switch to a new mode.
> With this we will get the HPD pulses reliably for each iteration over
> all the supoprted modes.
> 
> For more details
> Refer commit: c8dc1fd926a550308b971ca7d83fe0a927a38152

Please refer to commits using this format:

c8dc1fd926a5 ("tests/kms_chamelium: Capture on type-c")

You can get that easily with:
   git log -1 --abbrev=12 --format='%h ("%s")' $SHA1


> Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/262
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Pretty much the same treatment you gave the other subtests in the
mentioned commit, looks straightforward

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
