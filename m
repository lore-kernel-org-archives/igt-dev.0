Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF5D6E8D3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 14:40:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b12so6740562wmj.3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 07:40:12 -0700 (PDT)
References: <20200326135322.9958-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <ad47bcfa-4c1c-3439-3795-42a4439e9afe@gmail.com>
Date: Thu, 26 Mar 2020 16:40:01 +0200
MIME-Version: 1.0
In-Reply-To: <20200326135322.9958-1-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/2] tests/kms_concurrent: Test
 maximum number of planes supported by the platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Set is

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>



On 26.3.2020 15.53, Mika Kahola wrote:
> There was an error in
> 
> commit 0ab05a51a059 ("tests/kms_concurrent: Test for maximum number of planes")
> 
> supported planes. This patch proposes a fix to this commit by first computing
> the number of planes that are within platform's bandwidth requirements, resets
> the display and then executes the actual testing.
> 
> v2: Remove uninitialized variable (Stan)
> v3: Fix styling for commit reference (checkpatch)
>      Fix possible memory leak (Juha-Pekka)
> 
> Mika Kahola (2):
>    tests/kms_concurrent: Test maximum number of planes supported by the
>      platform
>    tests/kms_concurrent: Plug possible memory leaks
> 
>   tests/kms_concurrent.c | 110 ++++++++++++++++++++---------------------
>   1 file changed, 53 insertions(+), 57 deletions(-)
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
