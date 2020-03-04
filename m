Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <158331665415.426.8490559854402248554@emeril.freedesktop.org>
References: <20200304092901.2347-1-tvrtko.ursulin@linux.intel.com>
 <158331665415.426.8490559854402248554@emeril.freedesktop.org>
Message-ID: <158331690823.11744.4175864291424750819@skylake-alporthouse-com>
Date: Wed, 04 Mar 2020 10:15:08 +0000
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/query=3A_Do_not_assert_engine_info_rsvd_being_zero?=
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
To: Patchwork <patchwork@emeril.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2020-03-04 10:10:54)
> == Series Details ==
> 
> Series: tests/i915/query: Do not assert engine info rsvd being zero
> URL   : https://patchwork.freedesktop.org/series/74250/
> State : success

Did we do a check to make sure the fields were written? Write a few
rounds of poison into the struct and make sure the poison isn't returned
on success. (A few rounds just in case few strike it lucky with the
poison.) And a pair of redzones to check we don't overwrite the ends (I
think we did that at least, by placing the pointer next to unmapped
pages.)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
