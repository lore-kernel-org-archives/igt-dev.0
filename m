Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A0F10E280
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 08:24:12 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r18so18330893eja.11
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 01:24:12 -0700 (PDT)
Message-ID: <f8cb517b-955e-a392-cffd-b04d17b6b441@gmail.com>
Date: Mon, 12 Sep 2022 11:24:04 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20220909122413.25271-1-karthik.b.s@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220909122413.25271-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: Skip
 y-tile-legacy subtest on platforms w/o fences
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Look ok to me, that one new incomplete in ci results I can't see how it 
would relate to this change.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 9.9.2022 15.24, Karthik B S wrote:
> As set/get_tiling ioctls are not supported on platforms without fences,
> this test will fail. Add check to skip the subtest on these platforms.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_addfb_basic.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 6b2323a9..afb4bdf6 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -387,6 +387,7 @@ static void tiling_tests(int fd)
>   		f.pitches[0] = 1024*4;
>   		igt_subtest("basic-y-tiled-legacy") {
>   			igt_require(!gem_has_lmem(fd));
> +			igt_require(gem_available_fences(fd) > 0);
>   			f.handles[0] = tiled_y_bo;
>   
>   			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
