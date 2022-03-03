Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2037D10EB67
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 09:40:41 +0000 (UTC)
Date: Thu, 3 Mar 2022 10:40:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiCNFUCFm8qWn4W0@kamilkon-DESK1>
References: <YiBboHmOS4cuU1iH@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YiBboHmOS4cuU1iH@zkempczy-mobl2>
Subject: Re: [igt-dev] [RFC] Use HAX for series which add igt_describe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-03-03 at 07:09:36 +0100, Zbigniew Kempczyński napisał(a):
> Hi all.
> 
> Last time we got number of patches which don't change test logic so
> they trigger BAT + IGT runs.
> 
> This is imo a waste of time for CI as it doesn't improve anything apart
> of better in-test documentation.
> 
> As such patches needs to be reviewed I think we could use HAX patch in
> which we remove all subtests in tests/intel-ci/fast-feedback.testlist
> adding line with:
> 
> igt@meta_test@fail-result
> 
> Any comments are welcome.
> --
> Zbigniew

imho good idea, but I assume that this should be done by the person
sending. I wonder (and I suppose it is question to CI team) if it
can be automated based on content of patch ? So no need for additional
HAX and cover-letter ?
One more idea - check tag in subject ? like [... NO-TESTS 1/1] ...

We can start with HAX though.

--
Kamil
