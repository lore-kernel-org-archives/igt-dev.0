Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1FC6E2CD
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 09:39:52 +0000 (UTC)
Date: Mon, 20 Jul 2020 12:39:48 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200720093948.mewdgf2eryvude4h@ahiler-desk1.fi.intel.com>
References: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 00/11] lib/igt_kms: Add support for
 display with
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com, kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 03:40:50PM +0000, Mohammed Khajapasha wrote:
> With non-contiguous pipes display, pipe mapping is always not same as
> crtc mapping, For i915 pipe is enum id of i915's crtc object and
> it is not equal to crtc offset of a pipe in mode config list.
> Hence allocating upper bound array for igt_pipe and reading
> pipe id using GET_PIPE_FROM_CRTC_ID ioctl.
> Using crtc offset for a pipe to do ordering pipe with crtc list.
> 
> Example:
> 	With a non-contiguous pipe display, with PIPE_A & PIPE_D
> 	are enabled, PIPE_C & PIPE_B disabled configuration,
> 	the pipe for PIPE_A & D will be '0' and '3' and crtc offsets
> 	are '0' & '1' in mode config list using crtc offset to ordering
> 	enabled pipes with crtc list in mode config.
> 
> v8:
> 	Modified documentation as per review comments by <Hiler, Arkadiusz>

I have posted a few comments on claryifing the documentation a bit further.

There are parts that would be hard to understand by someone not familiar
with the area - making it more friendly will help our fellow
contibutors down the line :-)

with the above fixed:

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
