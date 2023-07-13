Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7B10E67A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 11:53:54 +0000 (UTC)
Date: Thu, 13 Jul 2023 13:53:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230713115338.alt3z6l36d3xhi2x@kamilkon-desk1>
References: <20230713071757.246298-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230713071757.246298-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/intel-ci/xe.blocklist: Add discarded
 tests in blocklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

small nit regarding subject:

[PATCH] tests/intel-ci/xe.blocklist: Add discarded tests in blocklist
------------------------- ^ ------------------------------- ^

You already have 'blocklist' there, no need for repeatition, also
below you wrote about "not present" ones, so maybe:

[PATCH] tests/intel-ci/xe.blocklist: Add not present tests

On 2023-07-13 at 12:47:57 +0530, Kunal Joshi wrote:
> Chamelium and PSR config is not present on XE bat as of now
> and hang tests are yet to be enabled hence added them in blocklist
--------------------------------------------------------------------^
Put dot "." at end of sentence.

> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 02edeb6b6..43bd360a8 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -82,3 +82,11 @@ igt@kms_plane_lowres@tiling-(4|x|y|yf)
>  ##################################################################
>  igt@xe_sysfs*
>  ##################################################################
> +# No chamelium/psr setup on XE bat
> +##################################################################
> +igt@.*chamelium.*
> +igt@.*psr.*
> +##################################################################
> +# Hang tests not yet enabled
> +##################################################################
> +igt@kms_pipe_crc_basic@hang-read-crc

Why only this one? Maybe it should be:
igt@kms_.*@.*hang.*

Regards,
Kamil

> -- 
> 2.25.1
> 
