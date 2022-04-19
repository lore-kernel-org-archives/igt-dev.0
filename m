Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E49910E034
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Apr 2022 19:55:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 11so17644535edw.0
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Apr 2022 12:55:43 -0700 (PDT)
Message-ID: <4938baba-01e3-fe29-ba42-8f253587e01f@gmail.com>
Date: Tue, 19 Apr 2022 22:55:34 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20220407090343.10067-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220407090343.10067-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] Improvements in plane scaling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Series look ok to me

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 7.4.2022 12.03, Swati Sharma wrote:
> Currently, plane scaling tests timesout in CI since they
> take large amount of time to loop through all pixel-formats per
> class for each modifier or rotation.
> So, to reduce execution time we are looping through either format
> or modifier or rotation keeping other two variants constant.
> 
> TODO: How to validate combination of format, modifier
> and rotation which executes in CI's time limits.
> 
> v2: Forgot to add changes in v1
> 
> Swati Sharma (3):
>    tests/kms_plane_scaling: Fix modifier
>    tests/kms_plane_scaling: Fix modifier and format
>    tests/kms_plane_scaling: Tests to validate modifiers
> 
>   tests/kms_plane_scaling.c | 217 ++++++++++++++++++++++++--------------
>   1 file changed, 138 insertions(+), 79 deletions(-)
> 
