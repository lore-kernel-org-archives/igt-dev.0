Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157890879235.16925.5995689755816146031@emeril.freedesktop.org>
References: <20200113091908.11983-1-zbigniew.kempczynski@intel.com>
 <157890879235.16925.5995689755816146031@emeril.freedesktop.org>
Message-ID: <157893177389.27314.17291034774081237531@skylake-alporthouse-com>
Date: Mon, 13 Jan 2020 16:09:33 +0000
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX_=28rev3=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2020-01-13 09:46:32)
>   * igt@gem_render_copy@linear-to-vebox-yf-tiled:
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][1] +37 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3917/fi-bsw-n3050/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

Clfush failures, need to go back and inspect gem_set_domain or manual
flushing / cache control.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
