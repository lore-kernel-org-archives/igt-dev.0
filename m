Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664CD6E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 09:34:51 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:34:47 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200415093447.GR9497@platvala-desk.ger.corp.intel.com>
References: <20200415083008.24869-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415083008.24869-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Blacklist
 igt@perf_pmu@cpu-hotplug until it no longer spams logs
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 11:30:08AM +0300, Petri Latvala wrote:
> This test has been spamming logs like crazy since 5.7-rc1, filling
> every disk in sight and causing CI processing to grind to a halt.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> Cc: Martin Peres <martin.peres@linux.intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  tests/intel-ci/blacklist.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 264f7648..8165145c 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -108,3 +108,12 @@ igt@i915_suspend@shrink
>  ###############################################
>  igt@.*@.*pipe-e($|-.*)
>  igt@.*@.*pipe-f($|-.*)
> +
> +###############################################
> +# Temporary workarounds for CI-impacting bugs
> +###############################################
> +
> +# FIXME: Insert gitlab issue url before merging

https://gitlab.freedesktop.org/drm/intel/issues/1714  btw


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
