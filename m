Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31D6E9B0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 15:27:45 +0000 (UTC)
Date: Mon, 10 Feb 2020 17:27:41 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200210152741.tehk67vx6abqa6b6@ahiler-desk1.fi.intel.com>
References: <20200210105653.20323-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210105653.20323-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Print an error message if
 resume fails to load data
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
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 12:56:53PM +0200, Petri Latvala wrote:
> If metadata.txt or other vital data files are missing from a
> results-directory, igt_resume silently exited. Print an error message
> to the user so it's somewhat clear why we didn't resume the
> execution.
> 
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/69
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
