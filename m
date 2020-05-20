Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <158996750137.30692.8939581287361309704@emeril.freedesktop.org>
References: <20200520083153.10756-1-zbigniew.kempczynski@intel.com>
 <158996750137.30692.8939581287361309704@emeril.freedesktop.org>
Subject: Re: [igt-dev] =?unknown-8bit?b?4pyT?= Fi.CI.BAT: success for Make gpgpu fill tests libdrm independent (rev6)
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158996878134.8153.3565249958519353002@build.alporthouse.com>
Date: Wed, 20 May 2020 10:59:41 +0100
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
To: zbigniew.kempczynski@intel.com, Patchwork <patchwork@emeril.freedesktop.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Patchwork (2020-05-20 10:38:21)
> == Series Details ==
> 
> Series: Make gpgpu fill tests libdrm independent (rev6)
> URL   : https://patchwork.freedesktop.org/series/77175/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8509 -> IGTPW_4598
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4598/index.html

Hmm, gem_gpgpu_fill skipped on bsw (gen8) "no gpgpu-fill function".
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
