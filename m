Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A2B6E0D5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 19:42:31 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200519191346.17210-2-ashutosh.dixit@intel.com>
References: <20200519191346.17210-1-ashutosh.dixit@intel.com>
 <20200519191346.17210-2-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158991734713.8153.16473862601026167527@build.alporthouse.com>
Date: Tue, 19 May 2020 20:42:27 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_addfb_basic: Skip tiling
 subtests on device without fences
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-05-19 20:13:46)
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> 
> Skip subtests that are testing interoperability of FB modifiers and
> hardware tiling if the device does not support HW tiling.

The display engine still supports HW tiling. Here you are just checking
the interactions with set-tiling, which is still in doubt.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
