Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF2589B95
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 10:49:58 +0000 (UTC)
Date: Mon, 14 Jun 2021 13:51:51 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMc0x4cwQRlsb+a3@platvala-desk.ger.corp.intel.com>
References: <20210406220030.81121-1-arek@hiler.eu>
 <YHQHqgQaU8pUXBjH@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHQHqgQaU8pUXBjH@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] .gitlab-ci: Verify undocumented tests
 in pipeline
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
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 11:41:14AM +0300, Petri Latvala wrote:
> On Wed, Apr 07, 2021 at 01:00:30AM +0300, Arkadiusz Hiler wrote:
> > The previous approach involves Intel's CI system to compare testlists
> > created as an artifacts from a post-merge pipeline and a pre-merge
> > pipeline which proved to be prone to breaking (e.g. when post-merge
> > pipeline randomly fails not generating the necessary artifacts).
> > 
> > This change introduces a list of "already undocumented" tests and checks
> > if all the "currently undocumented" ones are present on it.
> > 
> > The list doesn't need to be updated in most cases as we care only for
> > new additions. Renaming/moving test will require a manual edit though.
> > 
> > Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/99
> > Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
> 
> Much more neat than the finicky script that needs postmerge pipelines
> to always succeed, in the CI tags repository.
> 
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> I've prepared the necessary changes in intel CI pipeline relay. I
> think we need to get that deployed first and having it reliably
> running so we don't rely entirely on postmerge results for this.

Sorry, this patch completely dropped from my memory. Intel CI side is
ready for this now.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
