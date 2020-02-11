Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F426EA36
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 11:35:36 +0000 (UTC)
Date: Tue, 11 Feb 2020 13:35:32 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200211113532.t5vpad6vgqsovaub@ahiler-desk1.fi.intel.com>
References: <20200129131753.12460-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129131753.12460-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Support dynamic subtests in
 testlists
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

On Wed, Jan 29, 2020 at 03:17:52PM +0200, Petri Latvala wrote:
> In a very rudimentary and undocumented manner, testlist files can now
> have dynamic subtests specified. This feature is intended for very
> special cases, and the main supported mode of operation with testlist
> files is still the CI-style "run it all no matter what".
> 
> The syntax for testlist files is:
> 
> igt@binary@subtestname@dynamicsubtestname
> 
> As dynamic subtests are not easily listable, any helpers for
> generating such testlists are not implemented.
> 
> If running in multiple-mode, subtests with dynamic subtests specified
> will run in single-mode instead.
> 
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/45
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

both patches:

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
