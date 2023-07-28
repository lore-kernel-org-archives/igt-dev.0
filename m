Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC1F10E69C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 08:31:37 +0000 (UTC)
Date: Fri, 28 Jul 2023 10:31:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Albert Esteve <aesteve@redhat.com>
Message-ID: <20230728083111.6an7mpzsafrjpcpr@zkempczy-mobl2>
References: <20230721130458.64856-1-aesteve@redhat.com>
 <20230721130458.64856-2-aesteve@redhat.com>
 <20230728074134.lwfhcg3diwpmsump@zkempczy-mobl2>
 <CADSE00+au-DrzV6VyUWwfjmjpfF9Oj+5U01907n3chPBhD_ZRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADSE00+au-DrzV6VyUWwfjmjpfF9Oj+5U01907n3chPBhD_ZRw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH 1/3] drm header update: temp commit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:57:02AM +0200, Albert Esteve wrote:
>    On Fri, Jul 28, 2023 at 9:42 AM Zbigniew Kempczyński
>    <zbigniew.kempczynski@intel.com> wrote:
> 
>      On Fri, Jul 21, 2023 at 03:04:56PM +0200, Albert Esteve wrote:
>      > Update the drm included header to obtain
>      > VIRTUAL_CURSOR_PLANE capability and be
>      > able to test cursor hotspot setting.
>      >
>      > This commit should be removed once the kernel
>      > patch is applied and update the headers
>      > as appropiate.
>      >
>      > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>      > ---
>      >  include/drm-uapi/drm.h | 54
>      +++++++++++++++++++++++++++++++++++++++++-
>      >  1 file changed, 53 insertions(+), 1 deletion(-)
>      >
> 
>      I'm sorry Albert but we don't allow to add not accepted changes
>      upstream regarding uapi headers. Only verbatim copy of uapi
>      headers may land in igt.
> 
>      In patch [PATCH 2/3] igt_kms: add hotspot plane property you're
>      unconditionally using definition which doesn't exists upstream
>      yet. Likely it will just return from ioctl but I got doubts it
>      should be written this way.
> 
>      I would suggest to introduce:
> 
>      #define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT▸ 6
> 
>      in igt_kms.h instead drm.h. And when drm.h will land in igt
>      remove this localized definition replacing with official one.
> 
>    Hi Zbigniew,
>    Sure, that is why I mention in the commit that it should be removed
>    once the kernel patch lands.
>    There is a dependency, and I was not expecting this patch to be
>    upstreamed before the kernel patch lands.
>    But I'm ok with your suggestion. It will result in a cleaner patch to
>    review :)
>    Thanks!

In the meantime I've just verified I'm not talking nonsense and it
seems I'm talking. At the moment doing verbatim copy of kernel
uapi headers conflicts due to missing __user definition and
unresolved __packed in single place in i915_drm.h. I'm thinking how
to solve this with minimal effort as I would like to avoid
changes in uapi headers or have as minimum changes as possible.

--
Zbigniew
