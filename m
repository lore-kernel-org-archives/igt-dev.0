Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBC76E581
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 08:52:28 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200502080902.1536701-1-chris@chris-wilson.co.uk>
References: <20200502080902.1536701-1-chris@chris-wilson.co.uk>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Tue, 05 May 2020 11:52:23 +0300
Message-ID: <158866874381.6429.5564141674654634518@jlahtine-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Only skip the hanging
 gem_exec_fence tests
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-05-02 11:09:02)
> gem_exec_fence includes a bunch of functional syncobj tests that are
> currently being skipped due to an eagerness to avoid the intentionally
> very slow hang tests.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas

> +++ b/tests/intel-ci/blacklist.txt
> @@ -26,7 +26,7 @@ igt@gem_evict_alignment(@.*)?
>  igt@gem_evict_everything(@.*)?
>  igt@gem_exec_big@(?!.*single).*
>  igt@gem_exec_capture@many-(?!4K-).*
> -igt@gem_exec_fence@(?!.*basic).*
> +igt@gem_exec_fence@.*hang.*
>  igt@gem_exec_flush@(?!.*basic).*
>  igt@gem_exec_latency(@.*)?
>  igt@gem_exec_lut_handle(@.*)?
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
