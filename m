Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87286E9C7
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Dec 2020 09:30:05 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201202091747.409-1-nidhi1.gupta@intel.com>
References: <20201202091747.409-1-nidhi1.gupta@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 02 Dec 2020 09:29:56 +0000
Message-ID: <160690139620.2037.12501279123485164291@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Check for available outputs
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
To: igt-dev@lists.freedesktop.org, nidhi1.gupta@intel.com
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting nidhi1.gupta@intel.com (2020-12-02 09:17:47)
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
> 
> In kms_cursor_legacy will test all the
> pipes defined in IGT which is 6 weather the output
> is available or not.Later it has to be analysed and
> discard it as valid skip.To save this time updated
> in test to first check the available outputs and
> then execute the test.

There needs to be much strongly guidelines on when to use dynamic.
Subtests by another name is not ideal.

These are definitely not all the same test, labelling them as minor
variations of the same theme is ridiculous.

You are trying to work around a "problem" caused by another tool.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
