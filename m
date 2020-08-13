Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56676E5A4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2020 08:39:30 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200806110803.19062-1-swati2.sharma@intel.com>
References: <20200806110803.19062-1-swati2.sharma@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 13 Aug 2020 09:39:27 +0100
Message-ID: <159730796702.14054.3936393887648687575@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Add testdisplay test to BAT
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
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Swati Sharma (2020-08-06 12:08:03)
> testdisplay should be added to BAT. testdisplay is considered
> to be the most basic test to test display functionality.
> With this test we will be able to test modesetting.

Some might say that kms_setmode@basic provides the same coverage of
basic modesetting. So what can be replaced? Does testdisplay have a good
history of detecting bugs that others cannot? Does testdisplay have a
good history of providing easy-to-debug results? [The latter is asking
if it is a good primary test.] As I remember, testdisplay was relegated
because it wasn't particularly helpful as anything other than an
exhaustive sweep through all the modes.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
