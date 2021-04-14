Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAA86E7E6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 13:24:14 +0000 (UTC)
Date: Wed, 14 Apr 2021 16:25:07 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YHbtM8yNbrhRQ+Af@platvala-desk.ger.corp.intel.com>
References: <20210414090445.19552-1-zbigniew.kempczynski@intel.com>
 <161839964004.4305.10581634686554968837@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161839964004.4305.10581634686554968837@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4IGdl?=
 =?utf-8?q?m=5Ftiled=5Fblits_on_TGL_=28rev2=29?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 11:27:20AM +0000, Patchwork wrote:
>   * igt@gem_tiled_blits@normal:
>     - fi-tgl-y:           NOTRUN -> [TIMEOUT][50] ([i915#2502]) +1 similar issue
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5744/fi-tgl-y/igt@gem_tiled_blits@normal.html

Confirmed on IRC to be a kernel issue. With a fixed test we can work
on that, so

Acked-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
