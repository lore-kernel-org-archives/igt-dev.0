Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F057489CDF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 10:06:32 +0000 (UTC)
Date: Mon, 16 Mar 2020 12:06:28 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200316100628.zddvidu42oaz5q5q@ahiler-desk1.fi.intel.com>
References: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
 <20200313152911.580802-2-arkadiusz.hiler@intel.com>
 <20200316090714.GD9497@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316090714.GD9497@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_chamelium: Get rid of
 dp-link-status subtest
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
Cc: igt-dev@lists.freedesktop.org, Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 11:07:14AM +0200, Petri Latvala wrote:
> On Fri, Mar 13, 2020 at 05:29:11PM +0200, Arkadiusz Hiler wrote:
> > The test is making Chamelium's receiver signal a need for retraining to
> > the upstream, which i915 handles correctly. Then it asserts a number of
> > conditions that are neither a part of the DisplayPort spec, conformance
> > test suite or the current driver's behavior.
> > 
> > The test needs a complete rethinking. Let's remove it instead of letting
> > it bitrot further.
> > 
> > Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1059
> > Cc: Martin Peres <martin.peres@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> Do we have a gitlab issue for rethinking the test?

Now we do: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/80
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
