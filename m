Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5EB6EB2A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 09:05:19 +0000 (UTC)
Date: Thu, 16 Apr 2020 12:05:14 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200416090514.krjmkowlyu3yv6vl@ahiler-desk1.fi.intel.com>
References: <20200415084955.29370-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415084955.29370-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] runner: Add --version to igt_runner
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

On Wed, Apr 15, 2020 at 11:49:55AM +0300, Petri Latvala wrote:
> To help verify correct deployment, add a --version flag to igt_runner
> that just prints the IGT-version text, the same tests would print.
> 
> Note that only igt_runner gained the --version flag. igt_resume and
> igt_results don't do fancy flag handling, they only accept the
> directory to operate as their single arg.
> 
> v2: Depend on version.h (CI)
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
