Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3DE10E6AF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 09:09:43 +0000 (UTC)
Date: Fri, 28 Jul 2023 11:09:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Simon Ser <contact@emersion.fr>
Message-ID: <20230728090939.anuxjefizpbx2q2x@zkempczy-mobl2>
References: <20230727174311.327796-1-contact@emersion.fr>
 <20230728082150.pz267tg26xgltqow@zkempczy-mobl2>
 <K4cmpjO20z_cvNP63T2Ihn2eLPSopWBkrxkLC2hMJH1vcpwSajGBR3qtIYXaoRpa6dfNE3zOekFpEusdkFGrRNC72CjqUU6wjPoDTDSRfkI=@emersion.fr>
 <20230728084926.y4bqdwxhlnzj74sc@zkempczy-mobl2>
 <3KpLowHjLEfx8C2CRCgiOAnPE8datEXVEm_sVUzxfB2eown1XJe0l9kaQ68Hr8B2wLh-X54Y8Z40xrMvd_2sNe05PZH0-KkNvET0vfPu1wU=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3KpLowHjLEfx8C2CRCgiOAnPE8datEXVEm_sVUzxfB2eown1XJe0l9kaQ68Hr8B2wLh-X54Y8Z40xrMvd_2sNe05PZH0-KkNvET0vfPu1wU=@emersion.fr>
Subject: Re: [igt-dev] [PATCH v2] drm-uapi: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Fei Yang <fei.yang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 08:57:22AM +0000, Simon Ser wrote:
> On Friday, July 28th, 2023 at 10:49, Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> wrote:
> 
> > On Fri, Jul 28, 2023 at 08:31:18AM +0000, Simon Ser wrote:
> > 
> > > On Friday, July 28th, 2023 at 10:21, Zbigniew Kempczyński zbigniew.kempczynski@intel.com wrote:
> > > 
> > > > On Thu, Jul 27, 2023 at 05:43:17PM +0000, Simon Ser wrote:
> > > > 
> > > > > Sync with drm-next commit 52920704df878050123dfeb469aa6ab8022547c1.
> > > > > 
> > > > > This is required for:
> > > > > https://patchwork.freedesktop.org/patch/547602/?series=120551&rev=4
> > > > > 
> > > > > v2: drop redefinitions from lib/i915/i915_drm_local.h
> > > > 
> > > > I was pretty sure we're doing verbatim copy of kernel drm uapi
> > > > files but it looks due to two issues there's not possible at the
> > > > moment.
> > > > 
> > > > I've copied all drm files to igt directories and two definitions
> > > > needs to be added locally to work:
> > > > 
> > > > 1. in drm.h
> > > > +#define __user
> > > > 
> > > > 2. in i915_drm:
> > > > #define __packed attribute((packed))
> > > > 
> > > > (change 2 requires removing this definition from tools/intel_vbt_decode.c)
> > > > 
> > > > I think the best would be to replace in kernel uapi i915_drm.h file
> > > > __packed to attribute((packed)) (this is used in single place).
> > > > 
> > > > Simon - what do you think? I think to avoid manually comparison of
> > > > drm uapi header files between kernel and igt would be better to
> > > > introduce #define __user in drm.h each time we sync but rest of
> > > > the files would be intact (but this requires merging 2.).
> > > 
> > > This is not what the README says, and I don't think it's a great
> > > solution, because it requires more manual steps and is difficult to
> > > review.
> > > 
> > > I don't see __user anywhere, neither in the old nor in the new headers.
> > 
> > Maybe we're not on the same page. I've copied all headers from kernel
> > include/uapi/drm/ directory. And I would like to do this in the future.
> > But those files contains __user definition which is not defined in the
> > userspace. Adding empty definition solves this.
> 
> You need to "make headers_install" as described in the README.
> 

Eh, I spend a lot of time in igt but I didn't know this procedure.
You're absolutely right, this solves this issue.

> > I'm not sure how you've did the copy from the kernel uapi headers to
> > igt but as there're differences (__user) you had to do this manually
> > removing it. This is what I would like to avoid in the future. One
> > big pain now, then verbatim copy + adding __user in drm.h. I tried
> > to do this in meson.build adding -Duser='' but without success.
> 
> This would set a Meson option, not a C define. It should be possible to
> 
>     add_project_arguments('-D__user', language: 'c')
> 
> But as mentioned above, should not be necessary.

This doesn't work same as -D__user=''. And imo this is C define, not meson
option as cpp should get it during gcc'ing.

Anyway - make headers_install is fine. Thanks.

--
Zbigniew
