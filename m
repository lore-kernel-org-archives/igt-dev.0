Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B4F895C3
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2020 10:37:36 +0000 (UTC)
Date: Tue, 21 Jul 2020 13:37:30 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200721103730.o5p5zy4sarjvkmns@ahiler-desk1.fi.intel.com>
References: <20200721091254.30072-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721091254.30072-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Use exitcode 127 when
 resume is impossible
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 12:12:53PM +0300, Petri Latvala wrote:
> igt_resume is typically used in a scripted loop, with automatic
> reboots and retries. It already uses separate exit codes for being
> done (0), requiring a reboot and a retry (1) and requiring a retry due
> to exceeding its overall time quota (2). Introduce another exit code,
> 127, for circumstances where execution in the given directory is
> impossible and retrying would never terminate. One example case is
> a kernel bug causing the filesystem to go enough bonkers to make the
> runner settings files disappear.
> 
> As a drive-by improvement, also print something when that happens.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

on both patches
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
