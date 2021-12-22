Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3614E10E168
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Dec 2021 13:48:44 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id f5so8942797edq.6
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Dec 2021 05:48:44 -0800 (PST)
Message-ID: <59a2d155-454c-6613-3103-6fc962b1a696@gmail.com>
Date: Wed, 22 Dec 2021 15:48:36 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20211216112608.14535-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20211216112608.14535-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add upscaling tests
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
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Series is

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 16.12.2021 13.26, Swati Sharma wrote:
> In this series
>      * Renaming of downscaling tests
>      * Addition of upscaling tests
> 
> Rebased initial series sent at https://patchwork.freedesktop.org/series/93952/
> 
> Swati Sharma (2):
>    tests/i915/kms_flip_scaled_crc: Rename downscaling tests
>    tests/i915/kms_flip_scaled_crc: Add upscaling tests
> 
>   tests/i915/kms_flip_scaled_crc.c | 70 ++++++++++++++++++++++++++++----
>   1 file changed, 63 insertions(+), 7 deletions(-)
> 
