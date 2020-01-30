Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29EE6E90E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 21:30:45 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200130211748.629-1-antonio.argenziano@intel.com>
 <158041953199.2430.10960787414167851154@skylake-alporthouse-com>
 <09f8cca0-d245-02d4-bc70-d514beee251f@intel.com>
In-Reply-To: <09f8cca0-d245-02d4-bc70-d514beee251f@intel.com>
Message-ID: <158041984110.2430.6312998202239922200@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 21:30:41 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_concurrent_all: Skip GTT
 mapping when aperture not available
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-01-30 21:29:23)
> 
> 
> On 30/01/20 13:25, Chris Wilson wrote:
> > Quoting Antonio Argenziano (2020-01-30 21:17:48)
> >> The test iterates over several mappings and BOs creation options, when
> >> GTT mapping is not available skip those options.
> > 
> > The million-dollar question is "did I already add wc paths?"
> 
> I saw at least one wc mode and one wc pipeline so assumed it was ok :).

Wow, such foresight.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
