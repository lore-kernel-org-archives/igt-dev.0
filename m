Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023D010E5E3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 12:07:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso20675945e9.2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:07:02 -0700 (PDT)
Message-ID: <435c0796-b138-08b3-89db-4ec960dfda06@gmail.com>
Date: Fri, 13 Oct 2023 15:06:55 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20231013102346.95872-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231013102346.95872-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] tests/kms_plane_scaling: add
 get_num_scalers()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

There's minor nag on patch 2. With that fixed these 3 patches are

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 13.10.2023 13.23, Swati Sharma wrote:
> Add get_num_scalers() to lib and use same in kms_plane_scaling.
> 
> Swati Sharma (3):
>    lib/igt_kms: cosmetic changes
>    lib/igt_kms: add get_num_scalers()
>    tests/kms_plane_scaling: use get_num_scalers()
> 
>   lib/igt_kms.c             | 82 +++++++++++++++++++++++++++------------
>   lib/igt_kms.h             |  1 +
>   tests/kms_plane_scaling.c | 24 ++++++++++++
>   3 files changed, 83 insertions(+), 24 deletions(-)
> 
