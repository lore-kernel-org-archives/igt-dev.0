Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345C66E5CF
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 12:40:13 +0000 (UTC)
Date: Wed, 19 Feb 2020 14:40:09 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200219124009.ltfbshsnfjdp6dwg@ahiler-desk1.fi.intel.com>
References: <20200219121940.18247-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219121940.18247-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner/resultgen: Provide output when
 test output is completely empty
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

On Wed, Feb 19, 2020 at 02:19:40PM +0200, Petri Latvala wrote:
> If a machine is hard-hanging or otherwise rebooted at the correct
> time, intermediary output files get created but nothing ever gets
> written to them. That yields results that are completely empty and
> hard to categorize or even sometimes detect automatically. Handle this
> corner case explicitly with a custom text explaining what might have
> happened to prod result analysis towards fixing the real issue instead
> of wondering if test result processing is faulty.
> 
> The race for getting empty files is easier to hit than it seems. The
> files get created by the runner before calling exec(), and there's
> plenty of time to hit a really hard crash.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
