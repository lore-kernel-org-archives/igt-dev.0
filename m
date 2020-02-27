Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EC66E8C2
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 12:55:52 +0000 (UTC)
Date: Thu, 27 Feb 2020 14:55:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200227125548.GN13686@intel.com>
References: <20200227084149.588-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227084149.588-1-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t] LPSP igt test on TGL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 02:11:49PM +0530, Anshuman Gupta wrote:
> +------------------------------------------------------------------------=
-------+
> |                                                                        =
       |
> |                                                                        =
       |
> |                                                                        =
       |
> |   +--------------------+        +-------------+         +------------+ =
       |
> |   |                    |        |             |         |            | =
       |
> |   |    PIPE A          |        | DP/HDMI     |         |   PORT_A   | =
       |
> |   |                    +--------+ TRANSCODER  +---------+            | =
       |
> |   |                    |        |             |         |            | =
       |
> |   +--------------------+        +------------->         +------------> =
       |
> |                                 |             |         |            | =
       |
> |                                 |             |         |   PORT_B   | =
       |
> |                                 |             |         |            | =
       |
> |                                 |             |         |            | =
       |
> |                                 +------------->         +------------> =
       |
> |                                 |             |         |            | =
       |
> |                                 | DSI         |         |   PORT_C   | =
       |
> |                                 | TRANSCODER  |         |            | =
       |
> |                                 +------------->         +------------+ =
       |
> |                                 |             |                        =
       |
> |                                 |             |                        =
       |
> |                                 |             |                        =
       |
> |                                 |             |                        =
       |
> |                                 |             |                        =
       |
> |                                 |             |                        =
       |
> |                                 |             |                        =
       |
> |                                 +-------------+                        =
       |
> |                                                                        =
       |
> |                   LPSP on Tigerlake                                    =
       |
> |                                                                        =
       |
> +------------------------------------------------------------------------=
-------+
> =

> Above block diagram depicts lpsp on TGL, while earlier development of lps=
p igt test
> it has been assumed that every non-edp panel is not a lpsp panel but it i=
s not true
> on TGL,

It wasn't necessarily true on earlier platforms either. I don't know if
this makes any sense whatsoever. Probably a better way to validate would
be to check that the resulting power domains make sense for various
single pipe configurations.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
