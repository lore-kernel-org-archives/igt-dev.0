Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06836EAC9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 16:17:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210203100310.19441-4-anshuman.gupta@intel.com>
References: <20210203100310.19441-1-anshuman.gupta@intel.com>
 <20210203100310.19441-4-anshuman.gupta@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Feb 2021 16:17:35 +0000
Message-ID: <161236905581.21832.9494400750427364629@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] i915/i915_pm_rpm: Add PC10
 display off test
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
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anshuman Gupta (2021-02-03 10:03:09)
> Add a test to validate PC10 residencies while all output's
> display is off.

The pc10 tests look nice and straightforward. Just a general question on
whether 30s timeout is too lax or just right?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
